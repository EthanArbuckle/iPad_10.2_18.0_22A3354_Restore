@implementation ISBiometricSignatureOperation

- (ISBiometricSignatureOperation)initWithBiometricAuthenticationContext:(id)a3 touchIDDialog:(id)a4 fallbackDialog:(id)a5
{
  id v9;
  id v10;
  id v11;
  ISBiometricSignatureOperation *v12;
  uint64_t v13;
  ISBiometricStore *biometricStore;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)ISBiometricSignatureOperation;
  v12 = -[ISOperation init](&v16, sel_init);
  if (v12)
  {
    v13 = objc_opt_new();
    biometricStore = v12->_biometricStore;
    v12->_biometricStore = (ISBiometricStore *)v13;

    objc_storeStrong((id *)&v12->_context, a3);
    objc_storeStrong((id *)&v12->_fallbackDialog, a5);
    objc_storeStrong((id *)&v12->_touchIDDialog, a4);
  }

  return v12;
}

- (void)run
{
  ISBiometricSignatureOperation *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  int v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  int v15;
  int v16;
  NSObject *v17;
  id v18;
  void *v19;
  void *v20;
  int v21;
  int v22;
  NSObject *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  int v32;
  NSObject *v33;
  int v34;
  int v35;
  int v36;
  int v37;
  int v38;
  int v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  int v44;
  int v45;
  NSObject *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  int v55;
  int v56;
  NSObject *v57;
  void *v58;
  void *v59;
  id v60;
  __CFString *v61;
  void *v62;
  id v63;
  void *v64;
  void *v65;
  void *v66;
  char v67;
  NSObject *v68;
  NSObject *v69;
  const __CFString *v70;
  int v71;
  int v72;
  void *v73;
  id v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  __CFString *v79;
  uint64_t v80;
  void *v81;
  void *v82;
  unsigned int v83;
  char v84;
  uint64_t v85;
  void *v86;
  uint64_t v87;
  void *v88;
  int v89;
  int v90;
  NSObject *v91;
  void *v92;
  void *v93;
  id v94;
  __CFString *v95;
  void *v96;
  void *v97;
  BOOL v98;
  void *v99;
  uint64_t v100;
  void *v101;
  int v102;
  int v103;
  NSObject *v104;
  void *v105;
  void *v106;
  id v107;
  __CFString *v108;
  void *v109;
  unint64_t v110;
  void *v111;
  int v112;
  int v113;
  NSObject *v114;
  void *v115;
  id v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  ISBiometricSignatureOperation *v121;
  void *v122;
  void *v123;
  void *v124;
  uint64_t v125;
  void *v126;
  void *v127;
  uint64_t v128;
  void *v129;
  void *v130;
  int v131;
  int v132;
  NSObject *v133;
  void *v134;
  id v135;
  void *v136;
  void *v137;
  int v138;
  int v139;
  NSObject *v140;
  void *v141;
  id v142;
  void *v143;
  int v144;
  void *v145;
  id v146;
  id v147;
  void *v148;
  void *v149;
  void *v150;
  id v151;
  void *v152;
  int v153;
  int v154;
  NSObject *v155;
  void *v156;
  id v157;
  void *v158;
  int v159;
  int v160;
  void *v161;
  id v162;
  void *v163;
  void *v164;
  int *v165;
  int *v166;
  int *v167;
  int *v168;
  int *v169;
  int *v170;
  uint64_t v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  ISBiometricSignatureOperation *v181;
  __CFString *v182;
  id v183;
  uint64_t v184;
  id v185;
  int v186;
  id v187;
  __int16 v188;
  const __CFString *v189;
  uint64_t v190;

  v2 = self;
  v190 = *MEMORY[0x24BDAC8D0];
  -[ISBiometricSignatureOperation context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accountIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[ISBiometricSignatureOperation context](v2, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "challenge");
  v179 = (void *)objc_claimAutoreleasedReturnValue();

  -[ISBiometricSignatureOperation biometricStore](v2, "biometricStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "biometricAvailabilityForAccountIdentifier:", v4);
  v180 = v6;
  v181 = v2;
  switch(v7)
  {
    case 0:
      objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v8)
      {
        objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v9 = objc_msgSend(v8, "shouldLog");
      if (objc_msgSend(v8, "shouldLogToDisk"))
        v10 = v9 | 2;
      else
        v10 = v9;
      objc_msgSend(v8, "OSLogObject");
      v11 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        v10 &= 2u;
      if (!v10)
        goto LABEL_12;
      v186 = 138543362;
      v187 = (id)objc_opt_class();
      v12 = v187;
      LODWORD(v171) = 12;
      v165 = &v186;
      v13 = (void *)_os_log_send_and_compose_impl();

      if (v13)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v13, 4, &v186, v171);
        v11 = objc_claimAutoreleasedReturnValue();
        free(v13);
        v165 = (int *)v11;
        SSFileLog();
LABEL_12:

      }
      goto LABEL_122;
    case 2:
      objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v14)
      {
        objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v15 = objc_msgSend(v14, "shouldLog");
      if (objc_msgSend(v14, "shouldLogToDisk"))
        v16 = v15 | 2;
      else
        v16 = v15;
      objc_msgSend(v14, "OSLogObject");
      v17 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        v16 &= 2u;
      if (!v16)
        goto LABEL_24;
      v186 = 138543362;
      v187 = (id)objc_opt_class();
      v18 = v187;
      LODWORD(v171) = 12;
      v165 = &v186;
      v19 = (void *)_os_log_send_and_compose_impl();

      if (v19)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v19, 4, &v186, v171);
        v17 = objc_claimAutoreleasedReturnValue();
        free(v19);
        v165 = (int *)v17;
        SSFileLog();
LABEL_24:

      }
      objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v20)
      {
        objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v21 = objc_msgSend(v20, "shouldLog", v165);
      if (objc_msgSend(v20, "shouldLogToDisk"))
        v22 = v21 | 2;
      else
        v22 = v21;
      objc_msgSend(v20, "OSLogObject");
      v23 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        v22 &= 2u;
      if (!v22)
        goto LABEL_35;
      v24 = (void *)objc_opt_class();
      v186 = 138543362;
      v187 = v24;
      v25 = v24;
      LODWORD(v171) = 12;
      v165 = &v186;
      v26 = (void *)_os_log_send_and_compose_impl();

      if (v26)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v26, 4, &v186, v171);
        v23 = objc_claimAutoreleasedReturnValue();
        free(v26);
        v165 = (int *)v23;
        SSFileLog();
LABEL_35:

      }
      -[ISBiometricSignatureOperation context](v2, "context");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "accountName");
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if (-[ISBiometricSignatureOperation _promptUserToAuthenticateForIdentityMapChangeWithAccountIdentifier:accountName:](v2, "_promptUserToAuthenticateForIdentityMapChangeWithAccountIdentifier:accountName:", v4, v28))
      {
        +[ISBiometricStore sharedInstance](ISBiometricStore, "sharedInstance");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "saveIdentityMapForAccountIdentifier:", v4);

        v7 = objc_msgSend(v6, "biometricAvailabilityForAccountIdentifier:", v4);
        goto LABEL_89;
      }
      -[ISBiometricSignatureOperation context](v2, "context");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "setIsIdentityMapInvalid:", 1);

      objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v43)
      {
        objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v44 = objc_msgSend(v43, "shouldLog", v165);
      if (objc_msgSend(v43, "shouldLogToDisk"))
        v45 = v44 | 2;
      else
        v45 = v44;
      objc_msgSend(v43, "OSLogObject");
      v46 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
        v45 &= 2u;
      if (!v45)
        goto LABEL_87;
      v47 = (void *)objc_opt_class();
      v186 = 138543362;
      v187 = v47;
      v48 = v47;
      LODWORD(v171) = 12;
      v165 = &v186;
      v49 = (void *)_os_log_send_and_compose_impl();

      if (v49)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v49, 4, &v186, v171);
        v46 = objc_claimAutoreleasedReturnValue();
        free(v49);
        v165 = (int *)v46;
        SSFileLog();
LABEL_87:

      }
      -[ISBiometricSignatureOperation touchIDDialog](v2, "touchIDDialog");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "paymentSheet");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "setMerchantSession:", 0);

      -[ISBiometricSignatureOperation touchIDDialog](v2, "touchIDDialog");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "paymentSheet");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "setApplePayClassic:", 0);

      v7 = 2;
LABEL_89:

LABEL_90:
      if (v7)
      {
LABEL_91:
        objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig", v165);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v54)
        {
          objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v55 = objc_msgSend(v54, "shouldLog");
        if (objc_msgSend(v54, "shouldLogToDisk"))
          v56 = v55 | 2;
        else
          v56 = v55;
        objc_msgSend(v54, "OSLogObject");
        v57 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
          v56 &= 2u;
        if (v56)
        {
          v58 = (void *)objc_opt_class();
          v59 = (void *)MEMORY[0x24BDD16E0];
          v60 = v58;
          objc_msgSend(v59, "numberWithInteger:", v7);
          v61 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v186 = 138543618;
          v187 = v58;
          v188 = 2114;
          v189 = v61;
          LODWORD(v171) = 22;
          v166 = &v186;
          v62 = (void *)_os_log_send_and_compose_impl();

          v2 = v181;
          if (!v62)
          {
LABEL_102:

            -[ISBiometricSignatureOperation touchIDDialog](v2, "touchIDDialog");
            v63 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v63, "paymentSheet");
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            if (v64)
            {
              -[ISBiometricSignatureOperation context](v2, "context");
              v65 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v65, "setPaymentSheet:", v64);

            }
            -[ISBiometricSignatureOperation context](v2, "context", v166);
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            v67 = objc_msgSend(v66, "isExtendedAction");

            if ((v67 & 1) != 0)
            {
              SSError();
              v68 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v7);
              v69 = objc_claimAutoreleasedReturnValue();
              SSErrorBySettingUserInfoValue();
              v70 = (const __CFString *)objc_claimAutoreleasedReturnValue();
LABEL_117:

              v76 = 0;
              v77 = 0;
              v78 = 0;
LABEL_118:

              v79 = (__CFString *)v70;
              v2 = v181;
              goto LABEL_119;
            }
            objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
            v69 = objc_claimAutoreleasedReturnValue();
            if (!v69)
            {
              objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
              v69 = objc_claimAutoreleasedReturnValue();
            }
            v71 = -[NSObject shouldLog](v69, "shouldLog");
            if (-[NSObject shouldLogToDisk](v69, "shouldLogToDisk"))
              v72 = v71 | 2;
            else
              v72 = v71;
            -[NSObject OSLogObject](v69, "OSLogObject");
            v68 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
              v72 &= 2u;
            if (!v72)
            {
LABEL_116:
              v70 = 0;
              goto LABEL_117;
            }
            v73 = (void *)objc_opt_class();
            v186 = 138543362;
            v187 = v73;
            v74 = v73;
            LODWORD(v171) = 12;
            v167 = &v186;
            v75 = (void *)_os_log_send_and_compose_impl();

            if (v75)
            {
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v75, 4, &v186, v171);
              v68 = objc_claimAutoreleasedReturnValue();
              free(v75);
              v167 = (int *)v68;
              SSFileLog();
              goto LABEL_116;
            }
LABEL_193:
            v76 = 0;
            v77 = 0;
            v78 = 0;
            v70 = 0;
            goto LABEL_118;
          }
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v62, 4, &v186, v171);
          v57 = objc_claimAutoreleasedReturnValue();
          free(v62);
          v166 = (int *)v57;
          SSFileLog();
        }

        goto LABEL_102;
      }
LABEL_122:
      -[ISBiometricSignatureOperation context](v2, "context", v165);
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      v83 = objc_msgSend(v82, "isExtendedAction");
      v84 = v83;
      v85 = v83;

      if ((v84 & 1) != 0)
        goto LABEL_140;
      -[ISBiometricSignatureOperation touchIDDialog](v2, "touchIDDialog");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      v87 = objc_msgSend(v86, "isDualAction");

      objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v88)
      {
        objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
        v88 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v89 = objc_msgSend(v88, "shouldLog");
      if (objc_msgSend(v88, "shouldLogToDisk"))
        v90 = v89 | 2;
      else
        v90 = v89;
      objc_msgSend(v88, "OSLogObject");
      v91 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v91, OS_LOG_TYPE_DEFAULT))
        v90 &= 2u;
      if (!v90)
        goto LABEL_133;
      v92 = (void *)objc_opt_class();
      v93 = (void *)MEMORY[0x24BDD16E0];
      v94 = v92;
      objc_msgSend(v93, "numberWithBool:", v87);
      v95 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v186 = 138543618;
      v187 = v92;
      v188 = 2114;
      v189 = v95;
      LODWORD(v171) = 22;
      v168 = &v186;
      v96 = (void *)_os_log_send_and_compose_impl();

      v2 = v181;
      if (v96)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v96, 4, &v186, v171);
        v91 = objc_claimAutoreleasedReturnValue();
        free(v96);
        v168 = (int *)v91;
        SSFileLog();
LABEL_133:

      }
      if (!(_DWORD)v87)
        goto LABEL_140;
      if (+[ISBiometricStore shouldUseApplePayClassic](ISBiometricStore, "shouldUseApplePayClassic"))
      {
        -[ISBiometricSignatureOperation context](v2, "context");
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        v98 = +[ISBiometricStore isActionSupported:withBiometricAuthenticationContext:](ISBiometricStore, "isActionSupported:withBiometricAuthenticationContext:", 3, v97);

        if (!+[ISBiometricStore shouldUseAutoEnrollment](ISBiometricStore, "shouldUseAutoEnrollment"))
          goto LABEL_154;
        goto LABEL_139;
      }
      if (+[ISBiometricStore shouldUseAutoEnrollment](ISBiometricStore, "shouldUseAutoEnrollment"))
      {
LABEL_139:
        -[ISBiometricSignatureOperation context](v2, "context", v168);
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        v100 = 4;
        goto LABEL_153;
      }
LABEL_140:
      objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig", v168);
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v101)
      {
        objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
        v101 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v102 = objc_msgSend(v101, "shouldLog");
      if (objc_msgSend(v101, "shouldLogToDisk"))
        v103 = v102 | 2;
      else
        v103 = v102;
      objc_msgSend(v101, "OSLogObject");
      v104 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
        v103 &= 2u;
      if (!v103)
        goto LABEL_150;
      v105 = (void *)objc_opt_class();
      v106 = (void *)MEMORY[0x24BDD16E0];
      v107 = v105;
      objc_msgSend(v106, "numberWithInteger:", v85);
      v108 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v186 = 138543618;
      v187 = v105;
      v188 = 2114;
      v189 = v108;
      LODWORD(v171) = 22;
      v168 = &v186;
      v109 = (void *)_os_log_send_and_compose_impl();

      v2 = v181;
      if (v109)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v109, 4, &v186, v171);
        v104 = objc_claimAutoreleasedReturnValue();
        free(v109);
        v168 = (int *)v104;
        SSFileLog();
LABEL_150:

      }
      if ((v85 & 1) != 0)
        goto LABEL_155;
      -[ISBiometricSignatureOperation context](v2, "context");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      v100 = 1;
LABEL_153:
      v98 = +[ISBiometricStore isActionSupported:withBiometricAuthenticationContext:](ISBiometricStore, "isActionSupported:withBiometricAuthenticationContext:", v100, v99, v168);

LABEL_154:
      if (!v98)
      {
        objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
        v130 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v130)
        {
          objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
          v130 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v131 = objc_msgSend(v130, "shouldLog", v168);
        if (objc_msgSend(v130, "shouldLogToDisk"))
          v132 = v131 | 2;
        else
          v132 = v131;
        objc_msgSend(v130, "OSLogObject");
        v133 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v133, OS_LOG_TYPE_DEFAULT))
          v132 &= 2u;
        if (v132)
        {
          v134 = (void *)objc_opt_class();
          v186 = 138543362;
          v187 = v134;
          v135 = v134;
          LODWORD(v171) = 12;
          v170 = &v186;
          v136 = (void *)_os_log_send_and_compose_impl();

          if (!v136)
            goto LABEL_181;
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v136, 4, &v186, v171);
          v133 = objc_claimAutoreleasedReturnValue();
          free(v136);
          v170 = (int *)v133;
          SSFileLog();
        }

LABEL_181:
        objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
        v137 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v137)
        {
          objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
          v137 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v138 = objc_msgSend(v137, "shouldLog", v170);
        if (objc_msgSend(v137, "shouldLogToDisk"))
          v139 = v138 | 2;
        else
          v139 = v138;
        objc_msgSend(v137, "OSLogObject");
        v140 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v140, OS_LOG_TYPE_ERROR))
          v139 &= 2u;
        if (v139)
        {
          v141 = (void *)objc_opt_class();
          v186 = 138543618;
          v187 = v141;
          v188 = 2114;
          v189 = CFSTR("Incorrect ACL version");
          v142 = v141;
          LODWORD(v171) = 22;
          v143 = (void *)_os_log_send_and_compose_impl();

          if (!v143)
          {
LABEL_192:

            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("mt-tid-%@"), v4);
            v63 = (id)objc_claimAutoreleasedReturnValue();
            v184 = *MEMORY[0x24BDD0D98];
            v185 = v63;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v185, &v184, 1);
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BEB2020], "sharedStorage");
            v69 = objc_claimAutoreleasedReturnValue();
            -[NSObject removeCookiesWithProperties:](v69, "removeCookiesWithProperties:", v64);
            goto LABEL_193;
          }
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v143, 4, &v186, v171);
          v140 = objc_claimAutoreleasedReturnValue();
          free(v143);
          SSFileLog();
        }

        goto LABEL_192;
      }
LABEL_155:
      v110 = 0x24BEB1000uLL;
      objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig", v168);
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v111)
      {
        objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
        v111 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v112 = objc_msgSend(v111, "shouldLog");
      if (objc_msgSend(v111, "shouldLogToDisk"))
        v113 = v112 | 2;
      else
        v113 = v112;
      objc_msgSend(v111, "OSLogObject");
      v114 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v114, OS_LOG_TYPE_DEFAULT))
        v113 &= 2u;
      if (v113)
      {
        v115 = (void *)objc_opt_class();
        v186 = 138543362;
        v187 = v115;
        v116 = v115;
        LODWORD(v171) = 12;
        v169 = &v186;
        v117 = (void *)_os_log_send_and_compose_impl();

        if (!v117)
          goto LABEL_166;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v117, 4, &v186, v171);
        v114 = objc_claimAutoreleasedReturnValue();
        free(v117);
        v169 = (int *)v114;
        SSFileLog();
      }

LABEL_166:
      v183 = 0;
      objc_msgSend(v6, "publicKeyDataForAccountIdentifier:purpose:error:", v4, v85, &v183);
      v63 = (id)objc_claimAutoreleasedReturnValue();
      v79 = (__CFString *)v183;
      if (v63)
      {
        v63 = objc_retainAutorelease(v63);
        v64 = (void *)ISCopyEncodedBase64((unsigned __int8 *)objc_msgSend(v63, "bytes"), objc_msgSend(v63, "length"));
        objc_msgSend(v179, "stringByAppendingString:", v64);
        v69 = objc_claimAutoreleasedReturnValue();
        -[NSObject dataUsingEncoding:](v69, "dataUsingEncoding:", 4);
        v178 = (void *)objc_claimAutoreleasedReturnValue();
        -[ISBiometricSignatureOperation touchIDDialog](v2, "touchIDDialog");
        v118 = (void *)objc_claimAutoreleasedReturnValue();
        v174 = v4;
        v175 = v118;
        if (v118)
        {
          v119 = (void *)MEMORY[0x24BEB1F48];
          objc_msgSend(v118, "body");
          v120 = (void *)objc_claimAutoreleasedReturnValue();
          -[ISBiometricSignatureOperation context](v2, "context");
          v121 = v2;
          v122 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v122, "accountName");
          v123 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v119, "stringWithFormattedUsernameForString:username:", v120, v123);
          v177 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v175, "buttonForButtonType:", 0);
          v124 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v124, "title");
          v125 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(v175, "title");
          v176 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v175, "paymentSheet");
          v126 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v126)
          {
            v2 = v121;
            v6 = v180;
            v110 = 0x24BEB1000uLL;
            goto LABEL_207;
          }
          -[ISBiometricSignatureOperation context](v121, "context");
          v127 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v175, "paymentSheet");
          v128 = v125;
          v129 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v127, "setPaymentSheet:", v129);

          v125 = v128;
          v2 = v121;
          v6 = v180;
          v110 = 0x24BEB1000;
        }
        else
        {
          -[ISBiometricSignatureOperation context](v2, "context");
          v127 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v127, "accountName");
          v176 = 0;
          v177 = (void *)objc_claimAutoreleasedReturnValue();
          v125 = 0;
        }

LABEL_207:
        v147 = objc_alloc_init(MEMORY[0x24BEB1DE0]);
        objc_msgSend(v147, "setCancelLabel:", v125);
        objc_msgSend(v147, "setReason:", v177);
        objc_msgSend(v147, "setTitle:", v176);
        -[ISBiometricSignatureOperation context](v2, "context");
        v148 = (void *)objc_claimAutoreleasedReturnValue();
        v172 = v147;
        objc_msgSend(v148, "setConsolidatedDialog:", v147);

        -[ISBiometricSignatureOperation context](v2, "context");
        v149 = (void *)objc_claimAutoreleasedReturnValue();
        v182 = v79;
        objc_msgSend(v6, "signData:context:error:", v178, v149, &v182);
        v150 = (void *)objc_claimAutoreleasedReturnValue();
        v70 = v182;

        v173 = (void *)v125;
        if (v150 && !v70)
        {
          v151 = objc_retainAutorelease(v150);
          v78 = (void *)ISCopyEncodedBase64((unsigned __int8 *)objc_msgSend(v151, "bytes"), objc_msgSend(v151, "length"));
          objc_msgSend(v6, "saveIdentityMapForAccountIdentifier:", v174);
          objc_msgSend(*(id *)(v110 + 3736), "sharediTunesStoreConfig");
          v152 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v152)
          {
            objc_msgSend(*(id *)(v110 + 3736), "sharedConfig");
            v152 = (void *)objc_claimAutoreleasedReturnValue();
          }
          v153 = objc_msgSend(v152, "shouldLog", v169);
          if (objc_msgSend(v152, "shouldLogToDisk"))
            v154 = v153 | 2;
          else
            v154 = v153;
          objc_msgSend(v152, "OSLogObject");
          v155 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v155, OS_LOG_TYPE_DEBUG))
            v154 &= 2u;
          if (!v154)
            goto LABEL_230;
          v156 = (void *)objc_opt_class();
          v186 = 138543362;
          v187 = v156;
          v157 = v156;
          LODWORD(v171) = 12;
          v167 = &v186;
          v158 = (void *)_os_log_send_and_compose_impl();

          if (v158)
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v158, 4, &v186, v171);
            v155 = objc_claimAutoreleasedReturnValue();
            free(v158);
            v167 = (int *)v155;
            SSFileLog();
LABEL_230:

          }
LABEL_231:

          -[ISBiometricSignatureOperation context](v181, "context");
          v163 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v163, "paymentTokenData");
          v77 = (void *)objc_claimAutoreleasedReturnValue();

          -[ISBiometricSignatureOperation context](v181, "context");
          v164 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v164, "fpanID");
          v76 = (void *)objc_claimAutoreleasedReturnValue();

          v4 = v174;
          goto LABEL_118;
        }
        objc_msgSend(*(id *)(v110 + 3736), "sharediTunesStoreConfig", v169);
        v152 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v152)
        {
          objc_msgSend(*(id *)(v110 + 3736), "sharedConfig");
          v152 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v159 = objc_msgSend(v152, "shouldLog");
        if (objc_msgSend(v152, "shouldLogToDisk"))
          v160 = v159 | 2;
        else
          v160 = v159;
        objc_msgSend(v152, "OSLogObject");
        v155 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v155, OS_LOG_TYPE_ERROR))
          v160 &= 2u;
        if (v160)
        {
          v161 = (void *)objc_opt_class();
          v186 = 138543618;
          v187 = v161;
          v188 = 2114;
          v189 = v70;
          v162 = v161;
          LODWORD(v171) = 22;
          v167 = &v186;
          v78 = (void *)_os_log_send_and_compose_impl();

          if (!v78)
            goto LABEL_231;
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v78, 4, &v186, v171);
          v155 = objc_claimAutoreleasedReturnValue();
          free(v78);
          v167 = (int *)v155;
          SSFileLog();
        }
        v78 = 0;
        goto LABEL_230;
      }
      objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v64)
      {
        objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v144 = objc_msgSend(v64, "shouldLog", v169);
      if (objc_msgSend(v64, "shouldLogToDisk"))
        v144 |= 2u;
      objc_msgSend(v64, "OSLogObject");
      v69 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
        v144 &= 2u;
      if (!v144)
      {
LABEL_203:
        v76 = 0;
        v77 = 0;
        v78 = 0;
        v70 = v79;
        goto LABEL_118;
      }
      v145 = (void *)objc_opt_class();
      v186 = 138543618;
      v187 = v145;
      v188 = 2114;
      v189 = v79;
      v146 = v145;
      LODWORD(v171) = 22;
      v167 = &v186;
      v77 = (void *)_os_log_send_and_compose_impl();

      if (v77)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v77, 4, &v186, v171);
        v69 = objc_claimAutoreleasedReturnValue();
        free(v77);
        v167 = (int *)v69;
        SSFileLog();
        goto LABEL_203;
      }
      v76 = 0;
      v78 = 0;
LABEL_119:

      -[ISOperation setError:](v2, "setError:", v79);
      -[ISOperation setSuccess:](v2, "setSuccess:", v78 != 0, v167);
      -[ISBiometricSignatureOperation outputBlock](v2, "outputBlock");
      v80 = objc_claimAutoreleasedReturnValue();
      v81 = (void *)v80;
      if (v80)
        (*(void (**)(uint64_t, void *, void *, void *, __CFString *))(v80 + 16))(v80, v78, v77, v76, v79);

      return;
    case 3:
      objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v30)
      {
        objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v31 = objc_msgSend(v30, "shouldLog");
      if (objc_msgSend(v30, "shouldLogToDisk"))
        v32 = v31 | 2;
      else
        v32 = v31;
      objc_msgSend(v30, "OSLogObject");
      v33 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        v32 &= 2u;
      if (v32)
        goto LABEL_73;
      goto LABEL_75;
    case 4:
      objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v30)
      {
        objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v34 = objc_msgSend(v30, "shouldLog");
      if (objc_msgSend(v30, "shouldLogToDisk"))
        v35 = v34 | 2;
      else
        v35 = v34;
      objc_msgSend(v30, "OSLogObject");
      v33 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        v35 &= 2u;
      if (v35)
        goto LABEL_73;
      goto LABEL_75;
    case 5:
      objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v30)
      {
        objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v36 = objc_msgSend(v30, "shouldLog");
      if (objc_msgSend(v30, "shouldLogToDisk"))
        v37 = v36 | 2;
      else
        v37 = v36;
      objc_msgSend(v30, "OSLogObject");
      v33 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        v37 &= 2u;
      if (v37)
        goto LABEL_73;
      goto LABEL_75;
    case 6:
      objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v30)
      {
        objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v38 = objc_msgSend(v30, "shouldLog");
      if (objc_msgSend(v30, "shouldLogToDisk"))
        v39 = v38 | 2;
      else
        v39 = v38;
      objc_msgSend(v30, "OSLogObject");
      v33 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        v39 &= 2u;
      if (!v39)
        goto LABEL_75;
LABEL_73:
      v186 = 138543362;
      v187 = (id)objc_opt_class();
      v40 = v187;
      LODWORD(v171) = 12;
      v165 = &v186;
      v41 = (void *)_os_log_send_and_compose_impl();

      if (v41)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v41, 4, &v186, v171);
        v33 = objc_claimAutoreleasedReturnValue();
        free(v41);
        v165 = (int *)v33;
        SSFileLog();
LABEL_75:

      }
      goto LABEL_91;
    default:
      goto LABEL_90;
  }
}

- (BOOL)_promptUserToAuthenticateForIdentityMapChangeWithAccountIdentifier:(id)a3 accountName:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  int v21;
  NSObject *v22;
  int v23;
  int v24;
  int v25;
  int v26;
  id v27;
  void *v28;
  dispatch_semaphore_t v29;
  ISServerAuthenticationOperation *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  dispatch_time_t v34;
  void *v35;
  int v36;
  int v37;
  NSObject *v38;
  int v39;
  void *v40;
  id v41;
  void *v42;
  BOOL v43;
  void *v44;
  void *v45;
  int v46;
  int v47;
  NSObject *v48;
  int v49;
  void *v50;
  NSObject *v51;
  BOOL v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  int *v58;
  int *v59;
  uint64_t v60;
  id v61;
  void *v62;
  _QWORD v63[5];
  NSObject *v64;
  int v65;
  id v66;
  __int16 v67;
  void *v68;
  uint64_t v69;

  v69 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  +[ISDevice sharedInstance](ISDevice, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "deviceBiometricStyle");

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB1F28]), "initWithAccountIdentifier:", v7);
  objc_msgSend(v10, "setCanCreateNewAccount:", 0);
  objc_msgSend(v10, "setCanSetActiveAccount:", 0);
  objc_msgSend(v10, "setPromptStyle:", 1);
  objc_msgSend(v10, "setShouldCreateNewSession:", 1);
  v62 = v6;
  if (objc_msgSend(v6, "length"))
  {
    if (v9 == 3)
    {
      v11 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      v14 = CFSTR("PROMPT_REASON_NEW_FACE_FORMAT_%@");
      goto LABEL_9;
    }
    if (v9 == 2)
    {
      v11 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      v14 = CFSTR("PROMPT_REASON_NEW_FINGERS_FORMAT_%@");
LABEL_9:
      objc_msgSend(v12, "localizedStringForKey:value:table:", v14, &stru_24C441158, CFSTR("Mesa"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", v17, v6);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_22:
      goto LABEL_36;
    }
    objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v19)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v20 = objc_msgSend(v19, "shouldLog");
    if (objc_msgSend(v19, "shouldLogToDisk"))
      v21 = v20 | 2;
    else
      v21 = v20;
    objc_msgSend(v19, "OSLogObject");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      v23 = v21;
    else
      v23 = v21 & 2;
    if (!v23)
      goto LABEL_34;
    goto LABEL_32;
  }
  if (v9 == 3)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v15;
    v16 = CFSTR("PROMPT_REASON_NEW_FACE_ANONYMOUS");
    goto LABEL_21;
  }
  if (v9 == 2)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v15;
    v16 = CFSTR("PROMPT_REASON_NEW_FINGERS_ANONYMOUS");
LABEL_21:
    objc_msgSend(v15, "localizedStringForKey:value:table:", v16, &stru_24C441158, CFSTR("Mesa"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_22;
  }
  objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v19)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v24 = objc_msgSend(v19, "shouldLog");
  if (objc_msgSend(v19, "shouldLogToDisk"))
    v25 = v24 | 2;
  else
    v25 = v24;
  objc_msgSend(v19, "OSLogObject");
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    v26 = v25;
  else
    v26 = v25 & 2;
  if (!v26)
    goto LABEL_34;
LABEL_32:
  v65 = 138543362;
  v66 = (id)objc_opt_class();
  v27 = v66;
  LODWORD(v60) = 12;
  v58 = &v65;
  v28 = (void *)_os_log_send_and_compose_impl();

  if (v28)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v28, 4, &v65, v60);
    v22 = objc_claimAutoreleasedReturnValue();
    free(v28);
    v58 = (int *)v22;
    SSFileLog();
LABEL_34:

  }
  v18 = 0;
LABEL_36:
  objc_msgSend(v10, "setReasonDescription:", v18, v58);
  v29 = dispatch_semaphore_create(0);
  v30 = objc_alloc_init(ISServerAuthenticationOperation);
  -[ISServerAuthenticationOperation setAuthenticationContext:](v30, "setAuthenticationContext:", v10);
  -[ISBiometricSignatureOperation fallbackDialog](self, "fallbackDialog");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[ISServerAuthenticationOperation setDialog:](v30, "setDialog:", v31);

  -[ISServerAuthenticationOperation setPerformsButtonAction:](v30, "setPerformsButtonAction:", 0);
  v63[0] = MEMORY[0x24BDAC760];
  v63[1] = 3221225472;
  v63[2] = __112__ISBiometricSignatureOperation__promptUserToAuthenticateForIdentityMapChangeWithAccountIdentifier_accountName___block_invoke;
  v63[3] = &unk_24C43C178;
  v63[4] = self;
  v32 = v29;
  v64 = v32;
  -[ISServerAuthenticationOperation setCompletionBlock:](v30, "setCompletionBlock:", v63);
  +[ISOperationQueue mainQueue](ISOperationQueue, "mainQueue");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "addOperation:", v30);

  v34 = dispatch_time(0, 30000000000);
  if (!dispatch_semaphore_wait(v32, v34))
    goto LABEL_50;
  objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v35)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v36 = objc_msgSend(v35, "shouldLog");
  if (objc_msgSend(v35, "shouldLogToDisk"))
    v37 = v36 | 2;
  else
    v37 = v36;
  objc_msgSend(v35, "OSLogObject");
  v38 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    v39 = v37;
  else
    v39 = v37 & 2;
  if (!v39)
    goto LABEL_48;
  v40 = (void *)objc_opt_class();
  v65 = 138543362;
  v66 = v40;
  v41 = v40;
  LODWORD(v60) = 12;
  v59 = &v65;
  v42 = (void *)_os_log_send_and_compose_impl();

  if (v42)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v42, 4, &v65, v60);
    v38 = objc_claimAutoreleasedReturnValue();
    free(v42);
    v59 = (int *)v38;
    SSFileLog();
LABEL_48:

  }
LABEL_50:
  v43 = -[ISOperation success](v30, "success", v59);
  -[ISOperation error](v30, "error");
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  if (v44)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v45)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v46 = objc_msgSend(v45, "shouldLog");
    if (objc_msgSend(v45, "shouldLogToDisk"))
      v47 = v46 | 2;
    else
      v47 = v46;
    objc_msgSend(v45, "OSLogObject");
    v48 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      v49 = v47;
    else
      v49 = v47 & 2;
    if (v49)
    {
      v50 = (void *)objc_opt_class();
      v61 = v50;
      -[ISOperation error](v30, "error");
      v51 = v32;
      v52 = v43;
      v53 = v10;
      v54 = v18;
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = 138543618;
      v66 = v50;
      v67 = 2114;
      v68 = v55;
      LODWORD(v60) = 22;
      v56 = (void *)_os_log_send_and_compose_impl();

      v18 = v54;
      v10 = v53;
      v43 = v52;
      v32 = v51;

      if (!v56)
      {
LABEL_63:

        goto LABEL_64;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v56, 4, &v65, v60);
      v48 = objc_claimAutoreleasedReturnValue();
      free(v56);
      SSFileLog();
    }

    goto LABEL_63;
  }
LABEL_64:

  return v43;
}

intptr_t __112__ISBiometricSignatureOperation__promptUserToAuthenticateForIdentityMapChangeWithAccountIdentifier_accountName___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  int v4;
  NSObject *v5;
  id v6;
  void *v7;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v3 = objc_msgSend(v2, "shouldLog");
  if (objc_msgSend(v2, "shouldLogToDisk"))
    v4 = v3 | 2;
  else
    v4 = v3;
  objc_msgSend(v2, "OSLogObject");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    v4 &= 2u;
  if (!v4)
    goto LABEL_11;
  LODWORD(v10) = 138543362;
  *(_QWORD *)((char *)&v10 + 4) = objc_opt_class();
  v6 = *(id *)((char *)&v10 + 4);
  LODWORD(v9) = 12;
  v7 = (void *)_os_log_send_and_compose_impl();

  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v7, 4, &v10, v9, v10);
    v5 = objc_claimAutoreleasedReturnValue();
    free(v7);
    SSFileLog();
LABEL_11:

  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (id)outputBlock
{
  return objc_getProperty(self, a2, 336, 1);
}

- (void)setOutputBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 336);
}

- (ISBiometricStore)biometricStore
{
  return self->_biometricStore;
}

- (void)setBiometricStore:(id)a3
{
  objc_storeStrong((id *)&self->_biometricStore, a3);
}

- (SSBiometricAuthenticationContext)context
{
  return (SSBiometricAuthenticationContext *)objc_getProperty(self, a2, 352, 1);
}

- (void)setContext:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 352);
}

- (ISDialog)fallbackDialog
{
  return self->_fallbackDialog;
}

- (void)setFallbackDialog:(id)a3
{
  objc_storeStrong((id *)&self->_fallbackDialog, a3);
}

- (ISTouchIDDialog)touchIDDialog
{
  return self->_touchIDDialog;
}

- (void)setTouchIDDialog:(id)a3
{
  objc_storeStrong((id *)&self->_touchIDDialog, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_touchIDDialog, 0);
  objc_storeStrong((id *)&self->_fallbackDialog, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_biometricStore, 0);
  objc_storeStrong(&self->_outputBlock, 0);
}

@end
