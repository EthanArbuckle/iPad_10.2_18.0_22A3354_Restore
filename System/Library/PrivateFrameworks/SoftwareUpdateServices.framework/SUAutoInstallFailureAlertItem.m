@implementation SUAutoInstallFailureAlertItem

- (SUAutoInstallFailureAlertItem)initWithError:(id)a3 buildNumber:(id)a4
{
  id v7;
  id v8;
  SUAutoInstallFailureAlertItem *v9;
  SUAutoInstallFailureAlertItem *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  id v32;
  int v33;
  int v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  const __CFString *v39;
  void *v40;
  const __CFString *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  NSString *v48;
  NSString *v49;
  NSString *title;
  NSString *v51;
  NSString *message;
  void *v54;
  const __CFString *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  int v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  id v65;
  void *v66;
  objc_super v67;

  v7 = a3;
  v8 = a4;
  v67.receiver = self;
  v67.super_class = (Class)SUAutoInstallFailureAlertItem;
  v9 = -[SUBaseAlertItem init](&v67, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_error, a3);
    objc_storeStrong((id *)&v10->_buildNumber, a4);
    v65 = v7;
    v11 = v7;
    v64 = v8;
    v12 = v8;
    v60 = MGGetBoolAnswer();
    v13 = MGCopyAnswer();
    if (!v13)
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", CFSTR("/System/Library/PrivateFrameworks/SoftwareUpdateServices.framework"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("DEVICE"), &stru_24CE3EA48, CFSTR("SoftwareUpdateServices"));
      v13 = objc_claimAutoreleasedReturnValue();

    }
    v63 = (void *)v13;
    v15 = v11;
    v66 = v12;
    if (v12)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@"), v12);
      v16 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", CFSTR("/System/Library/PrivateFrameworks/SoftwareUpdateServices.framework"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("SOFTWARE_UPDATE"), &stru_24CE3EA48, CFSTR("SoftwareUpdateServices"));
      v16 = objc_claimAutoreleasedReturnValue();

    }
    v18 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", CFSTR("/System/Library/PrivateFrameworks/SoftwareUpdateServices.framework"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("AUTO_SU_FAILED_HEADER"), &stru_24CE3EA48, CFSTR("SoftwareUpdateServices"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = (void *)v16;
    objc_msgSend(v18, "stringWithFormat:", v20, v16);
    v21 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", CFSTR("/System/Library/PrivateFrameworks/SoftwareUpdateServices.framework"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("AUTO_SU_FAILED_BODY_DEFAULT"), &stru_24CE3EA48, CFSTR("SoftwareUpdateServices"));
    v23 = (id)objc_claimAutoreleasedReturnValue();

    v24 = v15;
    if (!v15)
      goto LABEL_22;
    v25 = objc_msgSend(v15, "code");
    switch(v25)
    {
      case 47:
        v40 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", CFSTR("/System/Library/PrivateFrameworks/SoftwareUpdateServices.framework"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        if (v60)
        {
          v41 = CFSTR("AUTO_SU_FAILED_BODY_KEYBAG_COMMIT");
LABEL_29:
          objc_msgSend(v28, "localizedStringForKey:value:table:", v41, &stru_24CE3EA48, CFSTR("SoftwareUpdateServices"));
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "stringWithFormat:", v47);
          v23 = (id)objc_claimAutoreleasedReturnValue();

          goto LABEL_30;
        }
        break;
      case 24:
        v42 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", CFSTR("/System/Library/PrivateFrameworks/SoftwareUpdateServices.framework"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("AUTO_SU_FAILED_BODY_UNPLUGGED"), &stru_24CE3EA48, CFSTR("SoftwareUpdateServices"));
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "stringWithFormat:", v43, v63);
        v23 = (id)objc_claimAutoreleasedReturnValue();

        v24 = v15;
        v29 = v63;
        goto LABEL_31;
      case 20:
        objc_msgSend(v15, "userInfo");
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        if (v26)
        {
          objc_msgSend(v15, "userInfo");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "objectForKey:", CFSTR("SUInstallationConstraintsUnmet"));
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          v29 = v63;
          if (v28)
          {
            v30 = v21;
            v31 = objc_msgSend(v28, "longValue");
            v32 = v63;
            v33 = MGGetBoolAnswer();
            if (v31)
            {
              if ((v31 & 2) != 0)
              {
                v56 = (void *)MEMORY[0x24BDD17C8];
                objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", CFSTR("/System/Library/PrivateFrameworks/SoftwareUpdateServices.framework"));
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v37, "localizedStringForKey:value:table:", CFSTR("UNMET_CONSTRAINT_NO_NETWORK"), &stru_24CE3EA48, CFSTR("SoftwareUpdateServices"));
                v57 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v56, "stringWithFormat:", v57, v32);
LABEL_47:
                v58 = (void *)objc_claimAutoreleasedReturnValue();
                v38 = v62;
LABEL_48:

                v23 = v58;
                v21 = v30;
                goto LABEL_32;
              }
              if ((v31 & 4) == 0)
              {
                v34 = v33;
                if ((v31 & 1) != 0)
                {
                  v35 = (void *)MEMORY[0x24BDD17C8];
                  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", CFSTR("/System/Library/PrivateFrameworks/SoftwareUpdateServices.framework"));
                  v37 = (void *)objc_claimAutoreleasedReturnValue();
                  if (!v34)
                    goto LABEL_44;
                  v55 = CFSTR("UNMET_CONSTRAINT_LOW_BATTERY");
                }
                else
                {
                  if ((v31 & 8) == 0)
                  {
                    if ((v31 & 0x10) == 0)
                    {
                      v35 = (void *)MEMORY[0x24BDD17C8];
                      objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", CFSTR("/System/Library/PrivateFrameworks/SoftwareUpdateServices.framework"));
                      v36 = (void *)objc_claimAutoreleasedReturnValue();
                      v37 = v36;
                      if ((v31 & 0x20) != 0)
                      {
                        v61 = v35;
                        v38 = v62;
                        if (v34)
                          v39 = CFSTR("UNMET_CONSTRAINT_DEVICE_LOCKED");
                        else
                          v39 = CFSTR("AUTO_SU_FAILED_BODY_DEFAULT");
                        objc_msgSend(v36, "localizedStringForKey:value:table:", v39, &stru_24CE3EA48, CFSTR("SoftwareUpdateServices"));
                        v57 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v61, "stringWithFormat:", v57);
                        v58 = (void *)objc_claimAutoreleasedReturnValue();
                        goto LABEL_48;
                      }
                      goto LABEL_44;
                    }
                    v35 = (void *)MEMORY[0x24BDD17C8];
                    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", CFSTR("/System/Library/PrivateFrameworks/SoftwareUpdateServices.framework"));
                    v37 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v34)
                    {
                      v55 = CFSTR("UNMET_CONSTRAINT_KEYBAG_MISSING");
                      goto LABEL_45;
                    }
LABEL_44:
                    v55 = CFSTR("AUTO_SU_FAILED_BODY_DEFAULT");
                    goto LABEL_45;
                  }
                  v35 = (void *)MEMORY[0x24BDD17C8];
                  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", CFSTR("/System/Library/PrivateFrameworks/SoftwareUpdateServices.framework"));
                  v37 = (void *)objc_claimAutoreleasedReturnValue();
                  if (!v34)
                    goto LABEL_44;
                  v55 = CFSTR("UNMET_CONSTRAINT_ICLOUD_RESTORE");
                }
LABEL_45:
                v54 = v37;
                goto LABEL_46;
              }
              v35 = (void *)MEMORY[0x24BDD17C8];
              objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", CFSTR("/System/Library/PrivateFrameworks/SoftwareUpdateServices.framework"));
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              v37 = v54;
              v55 = CFSTR("UNMET_CONSTRAINT_INSUFFICIENT_SPACE");
            }
            else
            {
              v35 = (void *)MEMORY[0x24BDD17C8];
              objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", CFSTR("/System/Library/PrivateFrameworks/SoftwareUpdateServices.framework"));
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              v37 = v54;
              v55 = CFSTR("AUTO_SU_FAILED_BODY_DEFAULT");
            }
LABEL_46:
            objc_msgSend(v54, "localizedStringForKey:value:table:", v55, &stru_24CE3EA48, CFSTR("SoftwareUpdateServices"));
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "stringWithFormat:", v57, v59);
            goto LABEL_47;
          }
LABEL_31:
          v38 = v62;
LABEL_32:

          v8 = v64;
          v7 = v65;
          goto LABEL_33;
        }
LABEL_22:
        v8 = v64;
        v38 = v62;
        v29 = v63;
LABEL_33:

        v48 = (NSString *)v21;
        v49 = (NSString *)v23;
        title = v10->_title;
        v10->_title = v48;
        v51 = v48;

        message = v10->_message;
        v10->_message = v49;

        goto LABEL_34;
      default:
        v40 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", CFSTR("/System/Library/PrivateFrameworks/SoftwareUpdateServices.framework"));
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v44;
        if (v60)
        {
          objc_msgSend(v44, "localizedStringForKey:value:table:", CFSTR("AUTO_SU_FAILED_BODY_ERROR_CODE_AND_STRING"), &stru_24CE3EA48, CFSTR("SoftwareUpdateServices"));
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "stringWithFormat:", v45, objc_msgSend(v15, "code"), v15);
          v46 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[Internal Only]\n%@"), v46);
          v23 = (id)objc_claimAutoreleasedReturnValue();
          v28 = (void *)v46;
          v24 = v15;
LABEL_30:
          v29 = v63;
          goto LABEL_31;
        }
        break;
    }
    v41 = CFSTR("AUTO_SU_FAILED_BODY_DEFAULT");
    goto LABEL_29;
  }
LABEL_34:

  return v10;
}

- (id)title
{
  return self->_title;
}

- (id)message
{
  return self->_message;
}

- (id)buttons
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUAutoInstallFailureAlertItem _okButton](self, "_okButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  MGGetBoolAnswer();
  v5 = (void *)objc_msgSend(v3, "copy");

  return v5;
}

- (id)_okButton
{
  SUAlertButtonDefinition *v2;
  void *v3;
  void *v4;
  SUAlertButtonDefinition *v5;

  v2 = [SUAlertButtonDefinition alloc];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", CFSTR("/System/Library/PrivateFrameworks/SoftwareUpdateServices.framework"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("OK_BUTTON"), &stru_24CE3EA48, CFSTR("SoftwareUpdateServices"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SUAlertButtonDefinition initWithLabel:presentationStyle:isPreferredButton:handler:](v2, "initWithLabel:presentationStyle:isPreferredButton:handler:", v4, 0, 0, &__block_literal_global_12);

  return v5;
}

- (id)_radarButton
{
  NSString *v3;
  NSError *v4;
  SUAlertButtonDefinition *v5;
  void *v6;
  void *v7;
  NSString *v8;
  NSError *v9;
  SUAlertButtonDefinition *v10;
  _QWORD v12[4];
  NSError *v13;
  NSString *v14;

  v3 = self->_buildNumber;
  v4 = self->_error;
  v5 = [SUAlertButtonDefinition alloc];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", CFSTR("/System/Library/PrivateFrameworks/SoftwareUpdateServices.framework"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("FILE_A_RADAR"), &stru_24CE3EA48, CFSTR("SoftwareUpdateServices"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __45__SUAutoInstallFailureAlertItem__radarButton__block_invoke;
  v12[3] = &unk_24CE3B610;
  v13 = v4;
  v14 = v3;
  v8 = v3;
  v9 = v4;
  v10 = -[SUAlertButtonDefinition initWithLabel:presentationStyle:isPreferredButton:handler:](v5, "initWithLabel:presentationStyle:isPreferredButton:handler:", v7, 2, 0, v12);

  return v10;
}

void __45__SUAutoInstallFailureAlertItem__radarButton__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  SUTapToRadar *v15;

  SULogInfo(CFSTR("About to file a radar about this install failure!"), a2, a3, a4, a5, a6, a7, a8, v14);
  v15 = objc_alloc_init(SUTapToRadar);
  v9 = (void *)MEMORY[0x24BDD17C8];
  +[SUUtility currentHWModelStr](SUUtility, "currentHWModelStr");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUUtility currentProductBuild](SUUtility, "currentProductBuild");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("%@/%@: Auto Installation Failed"), v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUTapToRadar setTitle:](v15, "setTitle:", v12);

  v13 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  objc_msgSend(v13, "appendFormat:", CFSTR("\nAuto installation failed with error:\n\n%@"), *(_QWORD *)(a1 + 32));
  if (*(_QWORD *)(a1 + 40))
    objc_msgSend(v13, "appendFormat:", CFSTR("\n\nTarget update: %@"), *(_QWORD *)(a1 + 40));
  -[SUTapToRadar setMessage:](v15, "setMessage:", v13);
  -[SUTapToRadar setClassification:](v15, "setClassification:", 7);
  -[SUTapToRadar setReproducibility:](v15, "setReproducibility:", 6);
  -[SUTapToRadar file](v15, "file");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_buildNumber, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end
