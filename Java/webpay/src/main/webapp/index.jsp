
<%@page import="cl.transbank.common.IntegrationType"%>
<%@page import="java.util.Random"%>
<%@page import="cl.transbank.webpay.webpayplus.model.WebpayPlusTransactionCreateResponse"%>
<%@page import="cl.transbank.webpay.webpayplus.WebpayPlus"%>

<%
  
    String buyOrder = String.valueOf(Math.abs(new Random().nextLong()));
    String sessionId = "1234567890";
    double amount = 2000;
    String site = "http://localhost:8080/webpay/";
    String returnUrl = site + "resultado.jsp";
    String finalUrl = site + "comprobante.jsp";
    
    // El SDK apunta por defecto al ambiente de pruebas, no es necesario configurar lo siguiente
    //WebpayPlus.Transaction.setCommerceCode("597055555");
    //WebpayPlus.Transaction.setApiKey("579B532A7440BB0C9079DED94D31EA1615BACEB56610332264630D42D0A36B1C");
    //WebpayPlus.Transaction.setIntegrationType(IntegrationType.TEST);
    

    final WebpayPlusTransactionCreateResponse respuesta = WebpayPlus.Transaction.create(buyOrder, sessionId, amount, returnUrl);
    
    // Seteo de parametros para formulario
    String formAction = respuesta.getUrl();
    String tokenWs = respuesta.getToken();

    
%>    
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="es">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
        <meta name="generator" content="Jekyll v3.8.5">
        <title>Test Webpay Java</title>
        <link href="bootstrap/bootstrap.min.css" rel="stylesheet">
        <link href="bootstrap/app.css" rel="stylesheet">
    </head>

    <body class="text-center">
        <form class="form-signin" action="<%=formAction%>" method="post">

            <input type="hidden" name="token_ws" value="<%=tokenWs%>">

            <img class="mb-4" src="https://www.transbankdevelopers.cl/public/library/img/img_webpay.png" alt="Webpay" width="300px">
            <h1 class="h5 mb-3 font-weight-normal">Testing Webpay [SDK Java] REST</h1>
            <p>https://www.transbankdevelopers.cl/referencia/webpay?l=java#webpay-plus</p>
            <p>https://github.com/rodrigocontrerasb/WebpayPlus_TestWeb/tree/master/java/src/main/webapp</p>
            <p>https://github.com/TransbankDevelopers/transbank-sdk-java-webpay-rest-example/blob/master/src/main/java/cl/transbank/webpay/example/controller/webpay/WebpayPlusController.java</p>
            <button class="btn btn-lg btn-primary btn-block" type="submit">Pagar $<%=amount%></button>
            <p class="mt-5 mb-3 text-muted">https://www.transbankdevelopers.cl</p>
        </form>

    </body>
</html>
