@implementation TSUtilities

+ (id)getByteRepresentationOf:(id)a3
{
  id v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;
  unint64_t i;
  unint64_t v9;
  char __str[2];
  char v11;

  v3 = objc_retainAutorelease(a3);
  v4 = objc_msgSend(v3, "UTF8String");
  v5 = objc_msgSend(v3, "length");
  objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithCapacity:", v5 >> 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v9 = 0;
  if (v5 >= 0x64)
    v5 = 100;
  if (v5)
  {
    for (i = 0; i < v5; i += 2)
    {
      *(_WORD *)__str = *(_WORD *)(v4 + i);
      v9 = strtoul(__str, 0, 16);
      objc_msgSend(v6, "appendBytes:length:", &v9, 1);
    }
  }

  return v6;
}

+ (id)formattedPhoneNumber:(id)a3 withCountryCode:(id)a4
{
  id v4;
  uint64_t v5;
  const void *v6;
  id String;

  v4 = a3;
  v5 = CFPhoneNumberCreate();
  if (!v5 || (v6 = (const void *)v5, String = (id)CFPhoneNumberCreateString(), CFRelease(v6), !String))
    String = v4;

  return String;
}

+ (id)getErrorTitleDetail:(id)a3 forCarrier:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  void *v27;
  _BOOL4 v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  const __CFString *v43;
  void *v44;
  void *v45;
  _BOOL4 v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  _BOOL4 v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  _BOOL4 v85;
  void *v87;
  uint64_t v88;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "domain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BE158B0]);

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9)
  {
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("CONTINUE"), &stru_24DEF4290, CFSTR("Localizable"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v12, CFSTR("ErrorButton"));

    v13 = objc_msgSend(v5, "code");
    switch(v13)
    {
      case 2:
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "localizedStringForKey:value:table:", CFSTR("CTCELLULARPLANERROR_PARSE_TITLE"), &stru_24DEF4290, CFSTR("Localizable"));
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v48, CFSTR("ErrorHeader"));

        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v42;
        v43 = CFSTR("CTCELLULARPLANERROR_PARSE_MESSAGE");
        goto LABEL_75;
      case 3:
      case 4:
      case 5:
      case 7:
      case 8:
      case 9:
      case 10:
      case 11:
      case 12:
      case 14:
      case 15:
      case 16:
      case 17:
      case 18:
      case 19:
      case 20:
      case 21:
      case 23:
      case 24:
      case 27:
      case 28:
      case 29:
      case 30:
      case 31:
      case 32:
      case 33:
      case 38:
      case 39:
      case 41:
      case 42:
      case 43:
      case 45:
      case 47:
      case 48:
      case 49:
      case 50:
      case 51:
      case 61:
      case 64:
        goto LABEL_20;
      case 6:
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("CTCELLULARPLANERROR_INVALID_ARGUMENT_TITLE"), &stru_24DEF4290, CFSTR("Localizable"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = CFSTR("ErrorHeader");
        break;
      case 13:
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "localizedStringForKey:value:table:", CFSTR("CTCELLULARPLANERROR_BUSY_TITLE"), &stru_24DEF4290, CFSTR("Localizable"));
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v50, CFSTR("ErrorHeader"));

        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v42;
        v43 = CFSTR("CTCELLULARPLANERROR_BUSY_MESSAGE");
        goto LABEL_75;
      case 22:
      case 54:
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "localizedStringForKey:value:table:", CFSTR("CTCELLULARPLANERROR_CARRIER_ERROR_TITLE"), &stru_24DEF4290, CFSTR("Localizable"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v32, CFSTR("ErrorHeader"));

        if (v6 && objc_msgSend(v6, "length"))
        {
          v29 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = v33;
          v30 = CFSTR("CARRIER_TRANSFER_ERROR_CODE_PERMANENT_FAILURE_%@");
          goto LABEL_80;
        }
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v42;
        v43 = CFSTR("CARRIER_TRANSFER_ERROR_CODE_PERMANENT_FAILURE_NO_NAME");
        goto LABEL_75;
      case 25:
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "localizedStringForKey:value:table:", CFSTR("CTCELLULARPLANERROR_INVALID_PPR_TITLE"), &stru_24DEF4290, CFSTR("Localizable"));
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v52, CFSTR("ErrorHeader"));

        if (objc_msgSend(v6, "length"))
        {
          v53 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("CTCELLULARPLANERROR_INVALID_PPR_MESSAGE_%@_%@"), &stru_24DEF4290, CFSTR("Localizable"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "stringWithFormat:", v24, v6, v6);
          goto LABEL_81;
        }
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v42;
        v43 = CFSTR("CTCELLULARPLANERROR_INVALID_PPR_MESSAGE_NO_NAME");
        goto LABEL_75;
      case 26:
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "localizedStringForKey:value:table:", CFSTR("CTCELLULARPLANERROR_INVALID_FAUX_CARD_TITLE"), &stru_24DEF4290, CFSTR("Localizable"));
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v55, CFSTR("ErrorHeader"));

        if (objc_msgSend(v6, "length"))
        {
          v29 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = v33;
          v30 = CFSTR("CTCELLULARPLANERROR_INVALID_FAUX_CARD_MESSAGE_CARRIER_LOCK_%@");
          goto LABEL_80;
        }
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v42;
        v43 = CFSTR("CTCELLULARPLANERROR_INVALID_FAUX_CARD_MESSAGE_CARRIER_LOCK_NO_CARRIER");
        goto LABEL_75;
      case 34:
      case 46:
        if (v6 && objc_msgSend(v6, "length"))
        {
          v14 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("ESIM_NOT_SUPPORT_TITLE_ADD_PLAN_%@"), &stru_24DEF4290, CFSTR("Localizable"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "stringWithFormat:", v16, v6);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setObject:forKeyedSubscript:", v17, CFSTR("ErrorDetail"));

        }
        else
        {
          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("ESIM_NOT_SUPPORT_TITLE_ADD_PLAN"), &stru_24DEF4290, CFSTR("Localizable"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setObject:forKeyedSubscript:", v16, CFSTR("ErrorHeader"));
        }

        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v42;
        v43 = CFSTR("ESIM_NOT_SUPPORT_DETAIL_ADD_PLAN_CARRIER_UNLOCK");
        goto LABEL_75;
      case 35:
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "localizedStringForKey:value:table:", CFSTR("CTCELLULARPLANERROR_NO_ELIGIBLE_PROFILES_TITLE"), &stru_24DEF4290, CFSTR("Localizable"));
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v57, CFSTR("ErrorHeader"));

        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v42;
        v43 = CFSTR("CTCELLULARPLANERROR_NO_ELIGIBLE_PROFILES_MESSAGE");
        goto LABEL_75;
      case 36:
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "localizedStringForKey:value:table:", CFSTR("CTCELLULARPLANERROR_INVALID_SMDP_TITLE"), &stru_24DEF4290, CFSTR("Localizable"));
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v59, CFSTR("ErrorHeader"));

        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v42;
        v43 = CFSTR("CTCELLULARPLANERROR_INVALID_SMDP_MESSAGE");
        goto LABEL_75;
      case 37:
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "localizedStringForKey:value:table:", CFSTR("CTCELLULARPLANERROR_CARRIER_ERROR_TITLE"), &stru_24DEF4290, CFSTR("Localizable"));
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v61, CFSTR("ErrorHeader"));

        if (v6 && objc_msgSend(v6, "length"))
        {
          v29 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = v33;
          v30 = CFSTR("TRANSFER_ERROR_INELIGIBLE_ACCOUNT_%@");
          goto LABEL_80;
        }
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v42;
        v43 = CFSTR("TRANSFER_ERROR_INELIGIBLE_ACCOUNT_NO_NAME");
        goto LABEL_75;
      case 40:
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "localizedStringForKey:value:table:", CFSTR("ERROR_TRANSFER_ITEM_WEBSHEET_IN_BUDDY_TITLE"), &stru_24DEF4290, CFSTR("Localizable"));
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v63, CFSTR("ErrorHeader"));

        if (v6 && objc_msgSend(v6, "length"))
        {
          v29 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = v33;
          v30 = CFSTR("ERROR_TRANSFER_ITEM_WEBSHEET_IN_BUDDY_%@");
          goto LABEL_80;
        }
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v42;
        v43 = CFSTR("ERROR_TRANSFER_ITEM_WEBSHEET_IN_BUDDY_NO_NAME");
        goto LABEL_75;
      case 44:
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "localizedStringForKey:value:table:", CFSTR("CTCELLULARPLANERROR_NO_DATA_PATH_TITLE"), &stru_24DEF4290, CFSTR("Localizable"));
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v65, CFSTR("ErrorHeader"));

        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v42;
        v43 = CFSTR("CTCELLULARPLANERROR_NO_DATA_PATH_MESSAGE");
        goto LABEL_75;
      case 52:
      case 53:
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("CTCELLULARPLANERROR_CARRIER_ERROR_TITLE"), &stru_24DEF4290, CFSTR("Localizable"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v27, CFSTR("ErrorHeader"));

        if (v6 && objc_msgSend(v6, "length"))
        {
          v28 = +[TSUtilities inBuddy](TSUtilities, "inBuddy");
          v29 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (v28)
            v30 = CFSTR("CARRIER_TRANSFER_ERROR_CODE_TEMPORARY_FAILURE_BUDDY_%@");
          else
            v30 = CFSTR("CARRIER_TRANSFER_ERROR_CODE_TEMPORARY_FAILURE_%@");
          goto LABEL_79;
        }
        v46 = +[TSUtilities inBuddy](TSUtilities, "inBuddy");
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (v46)
          v43 = CFSTR("CARRIER_TRANSFER_ERROR_CODE_TEMPORARY_FAILURE_BUDDY_NO_NAME");
        else
          v43 = CFSTR("CARRIER_TRANSFER_ERROR_CODE_TEMPORARY_FAILURE_NO_NAME");
        goto LABEL_74;
      case 55:
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "localizedStringForKey:value:table:", CFSTR("CTCELLULARPLANERROR_CARRIER_ERROR_TITLE"), &stru_24DEF4290, CFSTR("Localizable"));
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v67, CFSTR("ErrorHeader"));

        if (v6 && objc_msgSend(v6, "length"))
        {
          v29 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = v33;
          v30 = CFSTR("TRANSFER_ERROR_BLOCKED_ACCOUNT_%@");
          goto LABEL_80;
        }
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v42;
        v43 = CFSTR("TRANSFER_ERROR_BLOCKED_ACCOUNT_NO_NAME");
        goto LABEL_75;
      case 56:
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "localizedStringForKey:value:table:", CFSTR("CTCELLULARPLANERROR_FAILED_TRANSFER_TITLE"), &stru_24DEF4290, CFSTR("Localizable"));
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v69, CFSTR("ErrorHeader"));

        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v42;
        v43 = CFSTR("CTCELLULARPLANERROR_FAILED_TRANSFER_MESSAGE");
        goto LABEL_75;
      case 57:
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v70, "localizedStringForKey:value:table:", CFSTR("CTCELLULARPLANERROR_DELAYED_ACTIVATION_TITLE"), &stru_24DEF4290, CFSTR("Localizable"));
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v71, CFSTR("ErrorHeader"));

        if (!v6 || !objc_msgSend(v6, "length"))
        {
          v85 = +[TSUtilities inBuddy](TSUtilities, "inBuddy");
          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (v85)
            v43 = CFSTR("CARRIER_TRANSFER_ERROR_CODE_DELAYED_ACTIVATION_BUDDY_NO_NAME");
          else
            v43 = CFSTR("CARRIER_TRANSFER_ERROR_CODE_DELAYED_ACTIVATION_NO_NAME");
          goto LABEL_74;
        }
        v72 = +[TSUtilities inBuddy](TSUtilities, "inBuddy");
        v29 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (v72)
          v30 = CFSTR("CARRIER_TRANSFER_ERROR_CODE_DELAYED_ACTIVATION_BUDDY_%@");
        else
          v30 = CFSTR("CARRIER_TRANSFER_ERROR_CODE_DELAYED_ACTIVATION_%@");
LABEL_79:
        v33 = v22;
        goto LABEL_80;
      case 58:
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "localizedStringForKey:value:table:", CFSTR("CTCELLULARPLANERROR_REGULATORY_RESTRICTION_ACTIVE_LOC_ON_TITLE"), &stru_24DEF4290, CFSTR("Localizable"));
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v74, CFSTR("ErrorHeader"));

        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v75, "localizedStringForKey:value:table:", CFSTR("CTCELLULARPLANERROR_REGULATORY_RESTRICTION_ACTIVE_LOC_ON_MESSAGE"), &stru_24DEF4290, CFSTR("Localizable"));
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v76, CFSTR("ErrorDetail"));

        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v21;
        v23 = CFSTR("OK");
        goto LABEL_7;
      case 59:
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v77, "localizedStringForKey:value:table:", CFSTR("TRANSFER_UPDATE_REQUIRED_TITLE"), &stru_24DEF4290, CFSTR("Localizable"));
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v78, CFSTR("ErrorHeader"));

        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v42;
        v43 = CFSTR("TRANSFER_TARGET_UPDATE_REQUIRED_DETAIL");
        goto LABEL_75;
      case 60:
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v79, "localizedStringForKey:value:table:", CFSTR("TRANSFER_UPDATE_REQUIRED_TITLE"), &stru_24DEF4290, CFSTR("Localizable"));
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v80, CFSTR("ErrorHeader"));

        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v42;
        v43 = CFSTR("TRANSFER_SOURCE_UPDATE_REQUIRED_DETAIL");
        goto LABEL_75;
      case 62:
      case 63:
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "localizedStringForKey:value:table:", CFSTR("CTCELLULARPLANERROR_REGULATORY_RESTRICTION_ACTIVE_LOC_OFF_TITLE"), &stru_24DEF4290, CFSTR("Localizable"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v35, CFSTR("ErrorHeader"));

        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "localizedStringForKey:value:table:", CFSTR("CTCELLULARPLANERROR_REGULATORY_RESTRICTION_ACTIVE_LOC_OFF_MESSAGE"), &stru_24DEF4290, CFSTR("Localizable"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v37, CFSTR("ErrorDetail"));

        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v21;
        v23 = CFSTR("TURN_ON_LOCATION_SERVICE");
        goto LABEL_7;
      case 65:
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v81, "localizedStringForKey:value:table:", CFSTR("CTCELLULARPLANERROR_CARRIER_ERROR_TITLE"), &stru_24DEF4290, CFSTR("Localizable"));
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v82, CFSTR("ErrorHeader"));

        if (v6 && objc_msgSend(v6, "length"))
        {
          v29 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = v33;
          v30 = CFSTR("TRANSFER_ERROR_MAX_OTP_ATTEMPTS_EXHAUSTED_DETAIL_%@");
          goto LABEL_80;
        }
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v42;
        v43 = CFSTR("TRANSFER_ERROR_MAX_OTP_ATTEMPTS_EXHAUSTED_DETAIL_NO_CARRIER");
        goto LABEL_75;
      case 66:
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v83, "localizedStringForKey:value:table:", CFSTR("CTCELLULARPLANERROR_CARRIER_ERROR_TITLE"), &stru_24DEF4290, CFSTR("Localizable"));
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v84, CFSTR("ErrorHeader"));

        if (v6 && objc_msgSend(v6, "length"))
        {
          v29 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = v33;
          v30 = CFSTR("TRANSFER_ERROR_MAX_PIN_ATTEMPTS_EXHAUSTED_DETAIL_%@");
LABEL_80:
          objc_msgSend(v33, "localizedStringForKey:value:table:", v30, &stru_24DEF4290, CFSTR("Localizable"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "stringWithFormat:", v24, v6, v88);
LABEL_81:
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setObject:forKeyedSubscript:", v87, CFSTR("ErrorDetail"));

          goto LABEL_77;
        }
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v42;
        v43 = CFSTR("TRANSFER_ERROR_MAX_PIN_ATTEMPTS_EXHAUSTED_DETAIL_NO_CARRIER");
LABEL_75:
        objc_msgSend(v42, "localizedStringForKey:value:table:", v43, &stru_24DEF4290, CFSTR("Localizable"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = CFSTR("ErrorDetail");
        break;
      default:
        if (v13 == 4097)
        {
          if (!+[TSUtilities inBuddy](TSUtilities, "inBuddy"))
          {
            objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "localizedStringForKey:value:table:", CFSTR("DONE"), &stru_24DEF4290, CFSTR("Localizable"));
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "setObject:forKeyedSubscript:", v39, CFSTR("ErrorButton"));

          }
          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "localizedStringForKey:value:table:", CFSTR("ERROR_TRANSFER_ITEM_ACTIVATION_TIMEOUT_TITLE"), &stru_24DEF4290, CFSTR("Localizable"));
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setObject:forKeyedSubscript:", v41, CFSTR("ErrorHeader"));

          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = v42;
          v43 = CFSTR("ERROR_TRANSFER_ITEM_XPC_CONNECTION_BROKEN_MESSAGE");
        }
        else
        {
LABEL_20:
          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "localizedStringForKey:value:table:", CFSTR("CTCELLULARPLANERROR_FAILED_ACTION_TITLE"), &stru_24DEF4290, CFSTR("Localizable"));
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setObject:forKeyedSubscript:", v45, CFSTR("ErrorHeader"));

          LODWORD(v44) = +[TSUtilities inBuddy](TSUtilities, "inBuddy");
          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if ((_DWORD)v44)
            v43 = CFSTR("CTCELLULARPLANERROR_FAILED_ACTION_MESSAGE_BUDDY");
          else
            v43 = CFSTR("CTCELLULARPLANERROR_FAILED_ACTION_MESSAGE");
LABEL_74:
          v42 = v22;
        }
        goto LABEL_75;
    }
  }
  else
  {
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("CTCELLULARPLANERROR_FAILED_ACTION_TITLE"), &stru_24DEF4290, CFSTR("Localizable"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v18, CFSTR("ErrorHeader"));

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("CTCELLULARPLANERROR_FAILED_ACTION_MESSAGE"), &stru_24DEF4290, CFSTR("Localizable"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v20, CFSTR("ErrorDetail"));

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    v23 = CFSTR("CONTINUE");
LABEL_7:
    objc_msgSend(v21, "localizedStringForKey:value:table:", v23, &stru_24DEF4290, CFSTR("Localizable"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = CFSTR("ErrorButton");
  }
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v24, v25);
LABEL_77:

  return v7;
}

+ (id)preinstallPPRAlertControllerWithItems:(id)a3 completion:(id)a4
{
  id v5;
  void (**v6)(id, _QWORD);
  void *v7;
  void *v8;
  unint64_t v9;
  NSObject *v10;
  const char *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void (**v30)(id, _QWORD);
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id *v35;
  void *v36;
  _QWORD *v37;
  void *v38;
  void (**v39)(id, _QWORD);
  void *v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t i;
  uint64_t v47;
  id *v48;
  void *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _QWORD v54[4];
  void (**v55)(id, _QWORD);
  _QWORD v56[4];
  id v57;
  _QWORD v58[4];
  void (**v59)(id, _QWORD);
  _QWORD v60[4];
  id v61;
  _BYTE v62[128];
  _QWORD v63[2];
  _QWORD v64[2];
  uint8_t buf[4];
  const char *v66;
  uint64_t v67;

  v67 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (void (**)(id, _QWORD))a4;
  +[TSUtilities _findPPRItem:](TSUtilities, "_findPPRItem:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    _TSLogDomain();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v66 = "+[TSUtilities preinstallPPRAlertControllerWithItems:completion:]";
      v11 = "No plans with PPR @%s";
      goto LABEL_8;
    }
LABEL_9:

    v6[2](v6, 0);
    v12 = 0;
    goto LABEL_29;
  }
  +[TSCellularPlanManagerCache sharedInstance](TSCellularPlanManagerCache, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "calculateInstallConsentTextTypeFor:", v5);

  if (v9 > 7)
  {
    v20 = 0;
    v21 = 0;
  }
  else
  {
    if (((1 << v9) & 0xCF) != 0)
    {
      _TSLogDomain();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v66 = "+[TSUtilities preinstallPPRAlertControllerWithItems:completion:]";
        v11 = "Invalid consent @%s";
LABEL_8:
        _os_log_impl(&dword_21B647000, v10, OS_LOG_TYPE_DEFAULT, v11, buf, 0xCu);
        goto LABEL_9;
      }
      goto LABEL_9;
    }
    if (v9 == 4)
    {
      objc_msgSend(v7, "carrierName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "length");

      if (v14)
      {
        v15 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("CONSENT_CURRENT_PLAN_CANNOT_BE_DISABLED_IPHONE_%@_%@"), &stru_24DEF4290, CFSTR("Localizable"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "carrierName");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "carrierName");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "stringWithFormat:", v17, v18, v19);
        v47 = objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("CONSENT_CURRENT_PLAN_CANNOT_BE_DISABLED_NO_NAME_IPHONE"), &stru_24DEF4290, CFSTR("Localizable"));
        v47 = objc_claimAutoreleasedReturnValue();
      }

      v28 = (void *)MEMORY[0x24BEBD3A8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "localizedStringForKey:value:table:", CFSTR("CONSENT_CANCEL"), &stru_24DEF4290, CFSTR("Localizable"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v56[0] = MEMORY[0x24BDAC760];
      v56[1] = 3221225472;
      v56[2] = __64__TSUtilities_preinstallPPRAlertControllerWithItems_completion___block_invoke_3;
      v56[3] = &unk_24DEF2C08;
      v48 = &v57;
      v30 = v6;
      v57 = v30;
      objc_msgSend(v28, "actionWithTitle:style:handler:", v29, 1, v56);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v63[0] = v31;
      v32 = (void *)MEMORY[0x24BEBD3A8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "localizedStringForKey:value:table:", CFSTR("CONSENT_DELETE_ACTION"), &stru_24DEF4290, CFSTR("Localizable"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v54[0] = MEMORY[0x24BDAC760];
      v54[1] = 3221225472;
      v54[2] = __64__TSUtilities_preinstallPPRAlertControllerWithItems_completion___block_invoke_4;
      v54[3] = &unk_24DEF2C08;
      v35 = (id *)&v55;
      v55 = v30;
      objc_msgSend(v32, "actionWithTitle:style:handler:", v34, 2, v54);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v63[1] = v36;
      v37 = v63;
    }
    else
    {
      objc_msgSend(v7, "carrierName");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "length");

      if (v23)
      {
        v24 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("CONSENT_CURRENT_PLAN_CANNOT_BE_DELETED_IPHONE_PLAN_LOCK%@"), &stru_24DEF4290, CFSTR("Localizable"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "carrierName");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "stringWithFormat:", v26, v27);
        v47 = objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("CONSENT_CURRENT_PLAN_CANNOT_BE_DELETED_NO_NAME_IPHONE_PLAN_LOCK"), &stru_24DEF4290, CFSTR("Localizable"));
        v47 = objc_claimAutoreleasedReturnValue();
      }

      v38 = (void *)MEMORY[0x24BEBD3A8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "localizedStringForKey:value:table:", CFSTR("CONSENT_DELETE_ACTION"), &stru_24DEF4290, CFSTR("Localizable"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v60[0] = MEMORY[0x24BDAC760];
      v60[1] = 3221225472;
      v60[2] = __64__TSUtilities_preinstallPPRAlertControllerWithItems_completion___block_invoke;
      v60[3] = &unk_24DEF2C08;
      v48 = &v61;
      v39 = v6;
      v61 = v39;
      objc_msgSend(v38, "actionWithTitle:style:handler:", v29, 2, v60);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v64[0] = v31;
      v40 = (void *)MEMORY[0x24BEBD3A8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "localizedStringForKey:value:table:", CFSTR("CONSENT_KEEP_ACTION"), &stru_24DEF4290, CFSTR("Localizable"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v58[0] = MEMORY[0x24BDAC760];
      v58[1] = 3221225472;
      v58[2] = __64__TSUtilities_preinstallPPRAlertControllerWithItems_completion___block_invoke_2;
      v58[3] = &unk_24DEF2C08;
      v35 = (id *)&v59;
      v59 = v39;
      objc_msgSend(v40, "actionWithTitle:style:handler:", v34, 0, v58);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v64[1] = v36;
      v37 = v64;
    }
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v37, 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = (void *)v47;
  }
  objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerWithTitle:message:preferredStyle:", 0, v20, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v41 = v21;
  v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v50, v62, 16);
  if (v42)
  {
    v43 = v42;
    v44 = *(_QWORD *)v51;
    do
    {
      for (i = 0; i != v43; ++i)
      {
        if (*(_QWORD *)v51 != v44)
          objc_enumerationMutation(v41);
        objc_msgSend(v12, "addAction:", *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * i));
      }
      v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v50, v62, 16);
    }
    while (v43);
  }

LABEL_29:
  return v12;
}

uint64_t __64__TSUtilities_preinstallPPRAlertControllerWithItems_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __64__TSUtilities_preinstallPPRAlertControllerWithItems_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __64__TSUtilities_preinstallPPRAlertControllerWithItems_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __64__TSUtilities_preinstallPPRAlertControllerWithItems_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (id)_findPPRItem:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v9, "type", (_QWORD)v15) == 2)
        {
          objc_msgSend(v9, "plan");
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          if (v10)
          {
            if (v6)
            {

              goto LABEL_17;
            }
            v6 = v9;
          }
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v5)
        continue;
      break;
    }

    if (v6)
    {
      objc_msgSend(v6, "plan");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v11, "isDeleteNotAllowed") & 1) != 0)
        goto LABEL_18;
      objc_msgSend(v6, "plan");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isDisableNotAllowed");

      if ((v13 & 1) == 0)
      {
        v11 = v6;
        v6 = 0;
        goto LABEL_18;
      }
    }
  }
  else
  {
LABEL_17:
    v6 = 0;
    v11 = v3;
LABEL_18:

  }
  return v6;
}

+ (id)backgroundColorForRemotePlan:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x24BEBD4B8], "secondarySystemBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a3)
  {
    objc_msgSend(MEMORY[0x24BEBDAB0], "traitCollectionWithUserInterfaceStyle:", 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "resolvedColorWithTraitCollection:", v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = v4;
  }

  return v7;
}

+ (id)textColorForRemotePlan:(BOOL)a3
{
  if (a3)
    BPSTextColor();
  else
    objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (unint64_t)transferablePlans:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  unsigned int v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "objectForKeyedSubscript:", CFSTR("planItem"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "isTransferablePlan");

        v6 += v10;
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (unint64_t)odaPlans:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  unsigned int v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "objectForKeyedSubscript:", CFSTR("planItem"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "isOnDeviceTransferredPlan");

        v6 += v10;
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (BOOL)hasCellularBaseband
{
  if (hasCellularBaseband___hasBasebandToken != -1)
    dispatch_once(&hasCellularBaseband___hasBasebandToken, &__block_literal_global_285);
  return hasCellularBaseband___hasBaseband;
}

uint64_t __34__TSUtilities_hasCellularBaseband__block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  hasCellularBaseband___hasBaseband = result;
  return result;
}

+ (BOOL)isPad
{
  void *v2;
  BOOL v3;

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom") == 1;

  return v3;
}

+ (id)productClass
{
  if (+[TSUtilities isPad](TSUtilities, "isPad"))
    return CFSTR("Pad");
  else
    return CFSTR("Phone");
}

+ (BOOL)isOnBootstrap
{
  void *v2;
  uint64_t v3;
  char v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDE07E8], "sharedDefaultEvaluator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "path");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend((id)v3, "usesInterfaceType:", 1);

  +[TSCoreTelephonyClientCache sharedInstance](TSCoreTelephonyClientCache, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v5, "usingBootstrapDataService");

  return v3 & ~v4;
}

+ (BOOL)isDeviceLocked
{
  int v2;
  NSObject *v3;
  uint8_t buf[4];
  int v6;
  __int16 v7;
  int v8;
  __int16 v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v2 = SBSGetScreenLockStatus();
  _TSLogDomain();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109634;
    v6 = v2;
    v7 = 1024;
    v8 = 0;
    v9 = 2080;
    v10 = "+[TSUtilities isDeviceLocked]";
    _os_log_impl(&dword_21B647000, v3, OS_LOG_TYPE_DEFAULT, "screen locked : %d, passcode : %d @%s", buf, 0x18u);
  }

  return 0;
}

+ (BOOL)isWifiAvailable
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(MEMORY[0x24BDE07E8], "sharedDefaultEvaluator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "status") == 1)
    v4 = objc_msgSend(v3, "usesInterfaceType:", 1);
  else
    v4 = 0;

  return v4;
}

+ (id)secureIntentAccessControlItem
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const __CFDictionary *v6;
  OSStatus v7;
  NSObject *v8;
  void *v9;
  SecKeyRef key;
  _QWORD v12[6];
  _QWORD v13[7];

  v13[6] = *MEMORY[0x24BDAC8D0];
  key = 0;
  v2 = *MEMORY[0x24BDE9220];
  v12[0] = *MEMORY[0x24BDE90A0];
  v12[1] = v2;
  v3 = *MEMORY[0x24BDE9248];
  v13[0] = CFSTR("euicc-rk-ucrt");
  v13[1] = v3;
  v4 = *MEMORY[0x24BDE9528];
  v12[2] = *MEMORY[0x24BDE94D8];
  v12[3] = v4;
  v13[2] = MEMORY[0x24BDBD1C8];
  v13[3] = MEMORY[0x24BDBD1C8];
  v5 = *MEMORY[0x24BDE8F50];
  v12[4] = *MEMORY[0x24BDE9538];
  v12[5] = v5;
  v13[4] = MEMORY[0x24BDBD1C8];
  v13[5] = CFSTR("com.apple.coretelephony");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 6);
  v6 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  v7 = SecItemCopyMatching(v6, (CFTypeRef *)&key);
  if (key)
  {
    v8 = SecKeyCopyAttributes(key);
    -[NSObject objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", *MEMORY[0x24BDE8F48]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    CFRelease(key);
  }
  else
  {
    _TSLogDomain();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      +[TSUtilities secureIntentAccessControlItem].cold.1(v7, v8);
    v9 = 0;
  }

  return v9;
}

+ (BOOL)isSecureIntentUIRequired:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  char v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  _BYTE buf[24];
  const char *v31;
  uint64_t *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  +[TSUtilities secureIntentAccessControlItem](TSUtilities, "secureIntentAccessControlItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v24 = 0;
    v25 = &v24;
    v26 = 0x2050000000;
    v5 = (void *)getLAContextClass_softClass_0;
    v27 = getLAContextClass_softClass_0;
    if (!getLAContextClass_softClass_0)
    {
      *(_QWORD *)buf = MEMORY[0x24BDAC760];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __getLAContextClass_block_invoke_0;
      v31 = (const char *)&unk_24DEF2BA0;
      v32 = &v24;
      __getLAContextClass_block_invoke_0((uint64_t)buf);
      v5 = (void *)v25[3];
    }
    v6 = objc_retainAutorelease(v5);
    _Block_object_dispose(&v24, 8);
    v7 = (void *)objc_msgSend([v6 alloc], "initWithExternalizedContext:", v3);
    v28 = &unk_24DF23848;
    v29 = MEMORY[0x24BDBD1C8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0;
    objc_msgSend(v7, "evaluateAccessControl:operation:options:error:", v4, 3, v8, &v23);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v23;

    _TSLogDomain();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v9;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v10;
      *(_WORD *)&buf[22] = 2080;
      v31 = "+[TSUtilities isSecureIntentUIRequired:]";
      _os_log_impl(&dword_21B647000, v11, OS_LOG_TYPE_DEFAULT, "result:%@, error:%@ @%s", buf, 0x20u);
    }

    v14 = 1;
    if (v9)
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", &unk_24DF23860);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "BOOLValue");

      if ((v13 & 1) != 0)
        v14 = 0;
    }

  }
  else
  {
    _TSLogDomain();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      +[TSUtilities isSecureIntentUIRequired:].cold.1(v10, v15, v16, v17, v18, v19, v20, v21);
    v14 = 0;
  }

  return v14;
}

+ (void)launchURL:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = (void *)MEMORY[0x24BEBD3C8];
  v4 = a3;
  objc_msgSend(v3, "sharedApplication");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "openURL:options:completionHandler:", v5, MEMORY[0x24BDBD1B8], &__block_literal_global_305);
}

void __25__TSUtilities_launchURL___block_invoke(uint64_t a1, char a2)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if ((a2 & 1) == 0)
  {
    _TSLogDomain();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __25__TSUtilities_launchURL___block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);

  }
}

+ (BOOL)isBackAllowed:(id)a3
{
  char *v3;
  void *v4;
  void *v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  char v11;

  objc_msgSend(a3, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewControllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v5, "count") >= 2)
  {
    v7 = objc_msgSend(v5, "count");
    if (v7 - 2 < 0)
    {
LABEL_10:
      v11 = 0;
    }
    else
    {
      v3 = sel_backOption;
      v8 = v7 - 1;
      while (1)
      {
        objc_msgSend(v5, "objectAtIndex:", --v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v9, "conformsToProtocol:", &unk_2551938A0)
          || (objc_opt_respondsToSelector() & 1) == 0
          || (v10 = objc_msgSend(v9, "backOption")) == 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_13;
        }
        if (v10 == 2)
          break;

        if (v8 <= 0)
          goto LABEL_10;
      }
      LOBYTE(v3) = 0;
LABEL_13:

      v11 = 1;
    }
    v6 = v11 & v3;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (BOOL)isGreenTeaCapable
{
  if (isGreenTeaCapable___greenTeaCapabilityToken != -1)
    dispatch_once(&isGreenTeaCapable___greenTeaCapabilityToken, &__block_literal_global_357);
  return isGreenTeaCapable___greenTea;
}

uint64_t __32__TSUtilities_isGreenTeaCapable__block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  isGreenTeaCapable___greenTea = result;
  return result;
}

+ (BOOL)isRegulatoryRestrictionActive:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "domain");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BE158B0])
      && (objc_msgSend(v5, "code") == 58 || objc_msgSend(v5, "code") == 62 || objc_msgSend(v5, "code") == 63)
      && objc_msgSend(a1, "isGreenTeaCapable"))
    {
      v7 = objc_msgSend(a1, "isPad");
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (BOOL)isRegRestActiveLocationServiceOff:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "domain");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BE158B0])
      && objc_msgSend(v5, "code") == 62
      && objc_msgSend(a1, "isGreenTeaCapable"))
    {
      v7 = objc_msgSend(a1, "isPad");
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (BOOL)isRegRestActiveLocationAuthorizedOff:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "domain");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BE158B0])
      && objc_msgSend(v5, "code") == 63
      && objc_msgSend(a1, "isGreenTeaCapable"))
    {
      v7 = objc_msgSend(a1, "isPad");
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (BOOL)transferOptions
{
  char v3;
  void *v4;
  uint64_t v5;

  if (!_os_feature_enabled_impl())
    return 0;
  if (!+[TSUtilities isPad](TSUtilities, "isPad"))
    return 1;
  v3 = _os_feature_enabled_impl();
  if (objc_msgSend(a1, "isGreenTeaCapable"))
  {
    objc_msgSend(MEMORY[0x24BE15900], "sharedManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "getSupportedFlowTypes");

    if (v5 == 2)
      return 0;
  }
  return v3;
}

+ (BOOL)openPrefsURL:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  id v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  int v18;
  __int16 v19;
  const char *v20;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x24BDAC8D0];
  v3 = (objc_class *)MEMORY[0x24BDC1548];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = *MEMORY[0x24BE38310];
  v22[0] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v8 = objc_msgSend(v5, "openSensitiveURL:withOptions:error:", v6, v7, &v14);
  v9 = v14;
  if (v9)
  {
    _TSLogDomain();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v9, "localizedDescription");
      v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v12 = objc_msgSend(v11, "UTF8String");
      *(_DWORD *)buf = 136315650;
      v16 = v12;
      v17 = 1024;
      v18 = v8;
      v19 = 2080;
      v20 = "+[TSUtilities openPrefsURL:]";
      _os_log_impl(&dword_21B647000, v10, OS_LOG_TYPE_DEFAULT, "openURL failed with error: %s, isOpened:%d\n @%s", buf, 0x1Cu);

    }
  }

  return v8;
}

+ (BOOL)isCaseInsensitiveEqual:(id)a3 withString:(id)a4
{
  id v5;
  id v6;
  void *v7;
  BOOL v8;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5 == v6)
  {
    v8 = 1;
  }
  else
  {
    v8 = 0;
    if (v5 && v6)
      v8 = objc_msgSend(v5, "caseInsensitiveCompare:", v6) == 0;
  }

  return v8;
}

+ (id)findSubscriptionContextForCellularPlanItem:(id)a3 fromSubscriptionContexts:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5 && objc_msgSend(v6, "count"))
  {
    +[TSCellularPlanManagerCache sharedInstance](TSCellularPlanManagerCache, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "getSubscriptionContextUUIDforPlan:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v10 = v7;
    v11 = (id)objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v11)
    {
      v19 = v7;
      v12 = *(_QWORD *)v21;
      while (2)
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v21 != v12)
            objc_enumerationMutation(v10);
          v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v14, "uuid");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "UUIDString");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "isEqualToString:", v9);

          if ((v17 & 1) != 0)
          {
            v11 = v14;
            goto LABEL_14;
          }
        }
        v11 = (id)objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        if (v11)
          continue;
        break;
      }
LABEL_14:
      v7 = v19;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (void)secureIntentAccessControlItem
{
  _DWORD v2[2];
  __int16 v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109378;
  v2[1] = a1;
  v3 = 2080;
  v4 = "+[TSUtilities secureIntentAccessControlItem]";
  _os_log_error_impl(&dword_21B647000, a2, OS_LOG_TYPE_ERROR, "[E]No euicc key!!, status code : %d @%s", (uint8_t *)v2, 0x12u);
  OUTLINED_FUNCTION_1_0();
}

+ (void)isSecureIntentUIRequired:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21B647000, a1, a3, "[E]No euicc acl!! @%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __25__TSUtilities_launchURL___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21B647000, a1, a3, "[E]Fail to launch the learn more page @%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

@end
