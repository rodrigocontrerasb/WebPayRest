
<%@page import="java.io.IOException"%>
<%@page import="cl.transbank.webpay.exception.TransactionCommitException"%>
<%@page import="cl.transbank.webpay.webpayplus.model.WebpayPlusTransactionCommitResponse"%>
<%@page import="cl.transbank.webpay.webpayplus.WebpayPlus"%>
<%

    // Retorno de Token
    String tokenWs = request.getParameter("token_ws");

    String redir = "";
    String msg = "";
    
    //final WebpayPlusTransactionCommitResponse respuesta = WebpayPlus.Transaction.commit(tokenWs);

    try {
        final WebpayPlusTransactionCommitResponse respuesta = WebpayPlus.Transaction.commit(tokenWs);
        //log.debug(String.format("response : %s", response));
        //details.put("response", response);
        //details.put("refund-endpoint", request.getRequestURL().toString().replace("-end", "-refund"));

        msg = msg + WebpayPlus.Transaction.commit(tokenWs).getVci() + "<br />";
        msg = msg + WebpayPlus.Transaction.commit(tokenWs).getAmount() + "<br />";
        msg = msg + WebpayPlus.Transaction.commit(tokenWs).getStatus() + "<br />";
        msg = msg + WebpayPlus.Transaction.commit(tokenWs).getBuyOrder() + "<br />";
        msg = msg + WebpayPlus.Transaction.commit(tokenWs).getSessionId() + "<br />";
        msg = msg + WebpayPlus.Transaction.commit(tokenWs).getCardDetail() + "<br />";
        msg = msg + WebpayPlus.Transaction.commit(tokenWs).getAccountingDate() + "<br />";
        msg = msg + WebpayPlus.Transaction.commit(tokenWs).getTransactionDate() + "<br />";
        msg = msg + WebpayPlus.Transaction.commit(tokenWs).getAuthorizationCode() + "<br />";
        msg = msg + WebpayPlus.Transaction.commit(tokenWs).getPaymentTypeCode() + "<br />";
        msg = msg + WebpayPlus.Transaction.commit(tokenWs).getResponseCode() + "<br />";
        msg = msg + WebpayPlus.Transaction.commit(tokenWs).getInstallmentsAmount() + "<br />";
        msg = msg + WebpayPlus.Transaction.commit(tokenWs).getInstallmentsNumber() + "<br />";
        msg = msg + WebpayPlus.Transaction.commit(tokenWs).getBalance() + "<br />";

    } catch (TransactionCommitException | IOException e) {
        //log.error(e.getLocalizedMessage(), e);
        //return new ErrorController().error();
    }

    //String fecha = WebpayPlus.Transaction.commit(tokenWs).getTransactionDate();
    //final WebpayPlusTransactionCommitResponse respuesta = WebpayPlus.Transaction.commit(tokenWs);
    //final CreateWebpayPlusTransactionResponse respuesta = WebpayPlus.Transaction.commit(tokenWs);
    //final StatusWebpayPlusTransactionResponse respuesta = WebpayPlus.Transaction.status(token);
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
        <form class="form-signin" method="post" action="<%=redir%>">

            <input type="hidden" name="token_ws" value="<%=tokenWs%>">

            <img class="mb-4" src="https://www.transbankdevelopers.cl/public/library/img/img_webpay.png" alt="Webpay" width="300px">
            <h4 class="h5 mb-3 font-weight-normal"><%=msg%></h4>
            <button class="btn btn-lg btn-primary btn-block" type="submit">Ver Comprobante</button>
            <p class="mt-5 mb-3 text-muted">https://www.transbankdevelopers.cl</p>
        </form>


    </body>
</html>