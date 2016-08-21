<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:ns1="http://www.oracle.com/soasample"
                xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue"
                xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc"
                xmlns:ns0="http://xmlns.oracle.com/pcbpel/adapter/db/top/getPaymentInformation"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction"
                xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator"
                xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions"
                xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas"
                exclude-result-prefixes="xsi xsd xsl oracle-xsl-mapper ns1 ns0 dvm oraext mhdr socket xp20 xref"
                xmlns:tns="http://xmlns.oracle.com/pcbpel/adapter/db/e2e-1201-composites/ValidatePayment/getPaymentInformation"
                xmlns:ns2="http://www.oracle.com/ValidatePayment" xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/"
                xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/"
                xmlns:plt="http://schemas.xmlsoap.org/ws/2003/05/partner-link/"
                xmlns:jca="http://xmlns.oracle.com/pcbpel/wsdl/jca/">
  <oracle-xsl-mapper:schema>
    <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
    <oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:source type="WSDL">
        <oracle-xsl-mapper:schema location="../WSDLs/getPaymentInformation.wsdl"/>
        <oracle-xsl-mapper:rootElement name="E2E1201_PaymentinfoCollection"
                                       namespace="http://xmlns.oracle.com/pcbpel/adapter/db/top/getPaymentInformation"/>
      </oracle-xsl-mapper:source>
      <oracle-xsl-mapper:source type="WSDL">
        <oracle-xsl-mapper:schema location="../WSDLs/ValidatePayment.wsdl"/>
        <oracle-xsl-mapper:rootElement name="PaymentInfo" namespace="http://www.oracle.com/soasample"/>
        <oracle-xsl-mapper:param name="inputVariable.paymentInfo"/>
      </oracle-xsl-mapper:source>
    </oracle-xsl-mapper:mapSources>
    <oracle-xsl-mapper:mapTargets>
      <oracle-xsl-mapper:target type="WSDL">
        <oracle-xsl-mapper:schema location="../WSDLs/ValidatePayment.wsdl"/>
        <oracle-xsl-mapper:rootElement name="PaymentStatus" namespace="http://www.oracle.com/soasample"/>
      </oracle-xsl-mapper:target>
    </oracle-xsl-mapper:mapTargets>
    <!--GENERATED BY ORACLE XSL MAPPER 12.1.2.0.0(XSLT Build 130301.1000.4176) AT [THU MAR 21 18:18:18 PDT 2013].-->
  </oracle-xsl-mapper:schema>
  <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
  <xsl:param name="inputVariable.paymentInfo"/>
  <xsl:template match="/">
    <ns1:PaymentStatus>
      <xsl:choose>
        <xsl:when test="$inputVariable.paymentInfo/ns1:PaymentInfo/ns1:AuthorizationAmount &lt; /ns0:E2E1201_PaymentinfoCollection/ns0:E2E1201_Paymentinfo/ns0:dailyLimit and /ns0:E2E1201_PaymentinfoCollection/ns0:E2E1201_Paymentinfo/ns0:expireDate = $inputVariable.paymentInfo/ns1:PaymentInfo/ns1:ExpireDate">
          <ns1:Status>Authorized</ns1:Status>
        </xsl:when>
        <xsl:otherwise>
          <ns1:Status>Denied</ns1:Status>
        </xsl:otherwise>
      </xsl:choose>
    </ns1:PaymentStatus>
  </xsl:template>
</xsl:stylesheet>