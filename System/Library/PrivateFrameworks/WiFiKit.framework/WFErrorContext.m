@implementation WFErrorContext

- (WFErrorContext)initWithAssociationError:(id)a3 network:(id)a4 diagnosticsResult:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSError *v14;
  NSError *error;
  NSObject *v17;
  os_log_type_t v18;
  int v19;
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v9)
  {
    objc_storeStrong((id *)&self->_network, a4);
    objc_storeStrong((id *)&self->_result, a5);
    v11 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(v9, "ssid");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFErrorContext _userInfoForAssociationError:networkName:](self, "_userInfoForAssociationError:networkName:", v8, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifikit.error"), -1, v13);
    v14 = (NSError *)objc_claimAutoreleasedReturnValue();
    error = self->_error;
    self->_error = v14;

    self->_needsDismissal = 1;
  }
  else
  {
    WFLogForCategory(0);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v17 && os_log_type_enabled(v17, v18))
    {
      v19 = 136315138;
      v20 = "-[WFErrorContext initWithAssociationError:network:diagnosticsResult:]";
      _os_log_impl(&dword_219FC8000, v17, v18, "%s: nil network", (uint8_t *)&v19, 0xCu);
    }

    self = 0;
  }

  return self;
}

- (id)_userInfoForAssociationError:(id)a3 networkName:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id *v25;
  _QWORD *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  _QWORD *v55;
  _QWORD *v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  int v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  uint64_t v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  uint64_t v83;
  void *v84;
  void *v85;
  uint64_t v86;
  void *v87;
  void *v88;
  void *v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  void *v102;
  uint64_t v104;
  void *v105;
  void *v106;
  id v107;
  uint64_t v108;
  void *v109;
  id v110;
  id v111;
  _QWORD v112[3];
  _QWORD v113[3];
  _QWORD v114[4];
  _QWORD v115[4];
  _QWORD v116[4];
  _QWORD v117[4];
  _QWORD v118[4];
  _QWORD v119[4];
  _QWORD v120[4];
  _QWORD v121[4];
  _QWORD v122[4];
  _QWORD v123[4];
  _QWORD v124[4];
  _QWORD v125[4];
  _QWORD v126[4];
  _QWORD v127[4];
  _QWORD v128[4];
  _QWORD v129[4];
  _QWORD v130[3];
  id v131;
  uint64_t v132;
  void *v133;
  uint64_t v134;

  v134 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "code");
  if (v8 <= 15)
  {
    switch(v8)
    {
      case 1:
        v61 = *MEMORY[0x24BDD1398];
        v131 = v6;
        v62 = *MEMORY[0x24BDD0FC8];
        v130[0] = v61;
        v130[1] = v62;
        v63 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("kWFLocAssociationPasswordFailureAlertTitle"), &stru_24DC36C30, CFSTR("WiFiKitLocalizableStrings"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "stringWithFormat:", v13, v7);
        v132 = objc_claimAutoreleasedReturnValue();
        v130[2] = *MEMORY[0x24BDD0FE8];
        v64 = (void *)MEMORY[0x24BDBCE30];
        v21 = (void *)v132;
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("kWFLocGenericFailureAlertButton"), &stru_24DC36C30, CFSTR("WiFiKitLocalizableStrings"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "arrayWithObjects:", v19, 0);
        v22 = v7;
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v133 = v23;
        v24 = (void *)MEMORY[0x24BDBCE70];
        v25 = &v131;
        v26 = v130;
        v46 = 3;
        break;
      case 4:
LABEL_10:
        v30 = *MEMORY[0x24BDD1398];
        v123[0] = v6;
        v31 = *MEMORY[0x24BDD0FC8];
        v122[0] = v30;
        v122[1] = v31;
        v32 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("kWFLocOtherNetworkFailedFindAlertFormat"), &stru_24DC36C30, CFSTR("WiFiKitLocalizableStrings"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "stringWithFormat:", v13, v7);
        v22 = v7;
        v33 = objc_claimAutoreleasedReturnValue();
        v34 = *MEMORY[0x24BDD0FF0];
        v123[1] = v33;
        v123[2] = &stru_24DC36C30;
        v35 = *MEMORY[0x24BDD0FE8];
        v122[2] = v34;
        v122[3] = v35;
        v36 = (void *)MEMORY[0x24BDBCE30];
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("kWFLocGenericFailureAlertButton"), &stru_24DC36C30, CFSTR("WiFiKitLocalizableStrings"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = v36;
        v21 = (void *)v33;
        objc_msgSend(v37, "arrayWithObjects:", v19, 0);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v123[3] = v23;
        v24 = (void *)MEMORY[0x24BDBCE70];
        v25 = (id *)v123;
        v26 = v122;
LABEL_12:
        v46 = 4;
        break;
      case 5:
        objc_msgSend(v6, "userInfo");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = *MEMORY[0x24BDD1398];
        objc_msgSend(v27, "objectForKeyedSubscript:", *MEMORY[0x24BDD1398]);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        v106 = v29;
        v107 = v7;
        if (MGGetBoolAnswer() && v29)
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ \n [error: %ld]"), v7, objc_msgSend(v29, "code"));
        else
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@"), v7, v104);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v129[0] = v6;
        v75 = *MEMORY[0x24BDD0FC8];
        v128[0] = v28;
        v128[1] = v75;
        v111 = v6;
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v76, "localizedStringForKey:value:table:", CFSTR("kWFLocHotspotFailureAlertTitle"), &stru_24DC36C30, CFSTR("WiFiKitLocalizableStrings"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v129[1] = v18;
        v128[2] = *MEMORY[0x24BDD0FF0];
        v77 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("kWFLocHotspotFailureAlertMessage"), &stru_24DC36C30, CFSTR("WiFiKitLocalizableStrings"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v77, "stringWithFormat:", v23, v13);
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        v129[2] = v78;
        v128[3] = *MEMORY[0x24BDD0FE8];
        v79 = (void *)MEMORY[0x24BDBCE30];
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v80, "localizedStringForKey:value:table:", CFSTR("kWFLocGenericFailureAlertButton"), &stru_24DC36C30, CFSTR("WiFiKitLocalizableStrings"));
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v79, "arrayWithObjects:", v81, 0);
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        v129[3] = v82;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v129, v128, 4);
        v47 = (void *)objc_claimAutoreleasedReturnValue();

        v21 = v76;
        v6 = v111;

        goto LABEL_29;
      default:
LABEL_18:
        objc_msgSend(v6, "userInfo");
        v106 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v106, "objectForKey:", CFSTR("kWFAssociationPrivateMacFailureThresholdMetKey"));
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        v66 = objc_msgSend(v65, "BOOLValue");

        v110 = v6;
        v107 = v7;
        if (v66)
        {
          objc_msgSend(MEMORY[0x24BEC2958], "issueWithType:", 0x8000);
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          v68 = *MEMORY[0x24BDD1398];
          v117[0] = v6;
          v69 = *MEMORY[0x24BDD0FC8];
          v116[0] = v68;
          v116[1] = v69;
          v70 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v109 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v109, "localizedStringForKey:value:table:", CFSTR("kWFLocAssociationFailureAlertTitle"), &stru_24DC36C30, CFSTR("WiFiKitLocalizableStrings"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v70, "stringWithFormat:", v18, v7);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v117[1] = v19;
          v116[2] = *MEMORY[0x24BDD0FF0];
          v13 = v67;
          objc_msgSend(v67, "issueRecommendation");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v117[2] = v23;
          v116[3] = *MEMORY[0x24BDD0FE8];
          v71 = (void *)MEMORY[0x24BDBCE30];
          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v72, "localizedStringForKey:value:table:", CFSTR("kWFLocGenericFailureAlertButton"), &stru_24DC36C30, CFSTR("WiFiKitLocalizableStrings"));
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v71, "arrayWithObjects:", v73, 0);
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          v117[3] = v74;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v117, v116, 4);
          v47 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_28:
          v21 = v109;
          v6 = v110;
LABEL_29:
          v12 = v106;
          v22 = v107;
          goto LABEL_30;
        }
        -[WFErrorContext result](self, "result");
        v83 = objc_claimAutoreleasedReturnValue();
        if (v83)
        {
          v84 = (void *)v83;
          -[WFErrorContext result](self, "result");
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v85, "title");
          v86 = objc_claimAutoreleasedReturnValue();
          if (v86)
          {
            v87 = (void *)v86;
            -[WFErrorContext result](self, "result");
            v88 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v88, "suggestion");
            v89 = (void *)objc_claimAutoreleasedReturnValue();

            if (v89)
            {
              v90 = *MEMORY[0x24BDD1398];
              v115[0] = v6;
              v91 = *MEMORY[0x24BDD0FC8];
              v114[0] = v90;
              v114[1] = v91;
              v92 = (void *)MEMORY[0x24BDD17C8];
              objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("kWFLocAssociationFailureAlertTitle"), &stru_24DC36C30, CFSTR("WiFiKitLocalizableStrings"));
              v109 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v92, "stringWithFormat:", v7);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v115[1] = v18;
              v114[2] = *MEMORY[0x24BDD0FF0];
              v93 = (void *)MEMORY[0x24BDD17C8];
              -[WFErrorContext result](self, "result");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "title");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              -[WFErrorContext result](self, "result");
              v72 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v72, "suggestion");
              v94 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v93, "stringWithFormat:", CFSTR("%@\n%@"), v23, v94);
              v105 = (void *)objc_claimAutoreleasedReturnValue();
              v115[2] = v105;
              v114[3] = *MEMORY[0x24BDD0FE8];
              v95 = (void *)MEMORY[0x24BDBCE30];
              objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
              v96 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v96, "localizedStringForKey:value:table:", CFSTR("kWFLocGenericFailureAlertButton"), &stru_24DC36C30, CFSTR("WiFiKitLocalizableStrings"));
              v97 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v95, "arrayWithObjects:", v97, 0);
              v98 = (void *)objc_claimAutoreleasedReturnValue();
              v115[3] = v98;
              objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v115, v114, 4);
              v47 = (void *)objc_claimAutoreleasedReturnValue();

              goto LABEL_28;
            }
          }
          else
          {

          }
        }
        v99 = *MEMORY[0x24BDD1398];
        v113[0] = v6;
        v100 = *MEMORY[0x24BDD0FC8];
        v112[0] = v99;
        v112[1] = v100;
        v101 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("kWFLocAssociationFailureAlertTitle"), &stru_24DC36C30, CFSTR("WiFiKitLocalizableStrings"));
        v109 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v101, "stringWithFormat:", v7);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v113[1] = v18;
        v112[2] = *MEMORY[0x24BDD0FE8];
        v102 = (void *)MEMORY[0x24BDBCE30];
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("kWFLocGenericFailureAlertButton"), &stru_24DC36C30, CFSTR("WiFiKitLocalizableStrings"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v102, "arrayWithObjects:", v23, 0);
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        v113[2] = v72;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v113, v112, 3);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_28;
    }
    objc_msgSend(v24, "dictionaryWithObjects:forKeys:count:", v25, v26, v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_30;
  }
  switch(v8)
  {
    case 16:
      goto LABEL_10;
    case 17:
      v9 = *MEMORY[0x24BDD1398];
      v125[0] = v6;
      v10 = *MEMORY[0x24BDD0FC8];
      v124[0] = v9;
      v124[1] = v10;
      v11 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("kWFLocOtherNetworkFailedSecurityAlertFormat"), &stru_24DC36C30, CFSTR("WiFiKitLocalizableStrings"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", v13, v7);
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = *MEMORY[0x24BDD0FF0];
      v125[1] = v14;
      v125[2] = &stru_24DC36C30;
      v16 = *MEMORY[0x24BDD0FE8];
      v124[2] = v15;
      v124[3] = v16;
      v17 = (void *)MEMORY[0x24BDBCE30];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("kWFLocGenericFailureAlertButton"), &stru_24DC36C30, CFSTR("WiFiKitLocalizableStrings"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v17;
      v21 = (void *)v14;
      objc_msgSend(v20, "arrayWithObjects:", v19, 0);
      v22 = v7;
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v125[3] = v23;
      v24 = (void *)MEMORY[0x24BDBCE70];
      v25 = (id *)v125;
      v26 = v124;
      goto LABEL_12;
    case 19:
      v38 = *MEMORY[0x24BDD1398];
      v127[0] = v6;
      v39 = *MEMORY[0x24BDD0FC8];
      v126[0] = v38;
      v126[1] = v39;
      v40 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("kWFLocHotspotPeerRejectedAlertMessage"), &stru_24DC36C30, CFSTR("WiFiKitLocalizableStrings"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "stringWithFormat:", v13, v7);
      v41 = objc_claimAutoreleasedReturnValue();
      v42 = *MEMORY[0x24BDD0FF0];
      v127[1] = v41;
      v127[2] = &stru_24DC36C30;
      v43 = *MEMORY[0x24BDD0FE8];
      v126[2] = v42;
      v126[3] = v43;
      v44 = (void *)MEMORY[0x24BDBCE30];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("kWFLocGenericFailureAlertButton"), &stru_24DC36C30, CFSTR("WiFiKitLocalizableStrings"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = v44;
      v21 = (void *)v41;
      objc_msgSend(v45, "arrayWithObjects:", v19, 0);
      v22 = v7;
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v127[3] = v23;
      v24 = (void *)MEMORY[0x24BDBCE70];
      v25 = (id *)v127;
      v26 = v126;
      goto LABEL_12;
    case 20:
      v48 = *MEMORY[0x24BDD1398];
      v121[0] = v6;
      v49 = *MEMORY[0x24BDD0FC8];
      v120[0] = v48;
      v120[1] = v49;
      v50 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("kWFLocAccessPointFullAlertTitle"), &stru_24DC36C30, CFSTR("WiFiKitLocalizableStrings"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "stringWithFormat:", v13, v7);
      v108 = objc_claimAutoreleasedReturnValue();
      v121[1] = v108;
      v120[2] = *MEMORY[0x24BDD0FF0];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("kWFLocAccessPointFullAlertBody"), &stru_24DC36C30, CFSTR("WiFiKitLocalizableStrings"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v121[2] = v19;
      v120[3] = *MEMORY[0x24BDD0FE8];
      v51 = (void *)MEMORY[0x24BDBCE30];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v22 = v7;
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("kWFLocGenericFailureAlertButton"), &stru_24DC36C30, CFSTR("WiFiKitLocalizableStrings"));
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "arrayWithObjects:", v52, 0);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v121[3] = v53;
      v54 = (void *)MEMORY[0x24BDBCE70];
      v55 = v121;
      v56 = v120;
      break;
    case 21:
      v57 = *MEMORY[0x24BDD1398];
      v119[0] = v6;
      v58 = *MEMORY[0x24BDD0FC8];
      v118[0] = v57;
      v118[1] = v58;
      v59 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("kWFLocAssociationFailureAlertTitle"), &stru_24DC36C30, CFSTR("WiFiKitLocalizableStrings"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "stringWithFormat:", v13, v7);
      v108 = objc_claimAutoreleasedReturnValue();
      v119[1] = v108;
      v118[2] = *MEMORY[0x24BDD0FF0];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("kWFLocAccessPointWeakAlertBody"), &stru_24DC36C30, CFSTR("WiFiKitLocalizableStrings"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v119[2] = v19;
      v118[3] = *MEMORY[0x24BDD0FE8];
      v60 = (void *)MEMORY[0x24BDBCE30];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v22 = v7;
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("kWFLocGenericFailureAlertButton"), &stru_24DC36C30, CFSTR("WiFiKitLocalizableStrings"));
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "arrayWithObjects:", v52, 0);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v119[3] = v53;
      v54 = (void *)MEMORY[0x24BDBCE70];
      v55 = v119;
      v56 = v118;
      break;
    default:
      goto LABEL_18;
  }
  objc_msgSend(v54, "dictionaryWithObjects:forKeys:count:", v55, v56, 4);
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = (void *)v108;
LABEL_30:

  return v47;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFErrorContext network](self, "network");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ssid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFErrorContext error](self, "error");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p network: %@ error %@>"), v5, self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (int64_t)requestedFields
{
  return 0;
}

- (void)cancel
{
  void (**v2)(void);

  self->_needsDismissal = 0;
  -[WFErrorContext completionHandler](self, "completionHandler");
  v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v2[2]();

}

- (WFNetworkView)provider
{
  return (WFNetworkView *)objc_loadWeakRetained((id *)&self->_provider);
}

- (void)setProvider:(id)a3
{
  objc_storeWeak((id *)&self->_provider, a3);
}

- (BOOL)needsDismissal
{
  return self->_needsDismissal;
}

- (WFDiagnosticsResultItem)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
  objc_storeStrong((id *)&self->_result, a3);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (WFNetworkListRecord)network
{
  return self->_network;
}

- (void)setNetwork:(id)a3
{
  objc_storeStrong((id *)&self->_network, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_network, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_result, 0);
  objc_destroyWeak((id *)&self->_provider);
}

@end
