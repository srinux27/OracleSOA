<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:tns="http://xmlns.oracle.com/OracleRules1/OracleRules1_DecisionService_1" xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions" xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator" xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas" xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:ns0="http://concatenate/" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" exclude-result-prefixes=" xsd oracle-xsl-mapper xsi xsl ns0 tns mhdr oraext xp20 xref socket dvm oraxsl"
                xmlns:plnk="http://docs.oasis-open.org/wsbpel/2.0/plnktype"
                xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/"
                xmlns:client="http://xmlns.oracle.com/SOAApplicationSpace/NewBussRulesProject/BPELProcess1"
                xmlns:ns1="http://xmlns.oracle.com/bpel/rules" xmlns:soap12="http://schemas.xmlsoap.org/wsdl/soap12/"
                xmlns:format="http://schemas.xmlsoap.org/wsdl/formatbinding/"
                xmlns:plt="http://schemas.xmlsoap.org/ws/2003/05/partner-link/" xmlns:ns2="http://xmlns.oracle.com/bpel"
                xmlns:java="http://schemas.xmlsoap.org/wsdl/java/" xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/">
   <oracle-xsl-mapper:schema>
      <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
      <oracle-xsl-mapper:mapSources>
         <oracle-xsl-mapper:source type="WSDL">
            <oracle-xsl-mapper:schema location="../WSDLs/BPELProcess1.wsdl"/>
            <oracle-xsl-mapper:rootElement name="combineName" namespace="http://concatenate/"/>
         </oracle-xsl-mapper:source>
      </oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:mapTargets>
         <oracle-xsl-mapper:target type="WSDL">
            <oracle-xsl-mapper:schema location="../WSDLs/OracleRules1_DecisionService_1.wsdl"/>
            <oracle-xsl-mapper:rootElement name="callFunctionStateless" namespace="http://xmlns.oracle.com/OracleRules1/OracleRules1_DecisionService_1"/>
         </oracle-xsl-mapper:target>
      </oracle-xsl-mapper:mapTargets>
      <!--GENERATED BY ORACLE XSL MAPPER 12.2.1.1.0(XSLT Build 160608.1900.0023) AT [FRI SEP 16 12:14:37 IST 2016].-->
   </oracle-xsl-mapper:schema>
   <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
   <xsl:template match="/">
      <tns:callFunctionStateless>
         <tns:parameterList>
            <ns0:combineName>
               <arg0>
                  <xsl:value-of select="/ns0:combineName/arg0"/>
               </arg0>
               <arg1>
                  <xsl:value-of select="/ns0:combineName/arg1"/>
               </arg1>
            </ns0:combineName>
         </tns:parameterList>
      </tns:callFunctionStateless>
   </xsl:template>
</xsl:stylesheet>
