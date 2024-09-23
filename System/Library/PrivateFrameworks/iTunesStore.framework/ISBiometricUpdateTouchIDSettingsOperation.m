@implementation ISBiometricUpdateTouchIDSettingsOperation

- (ISBiometricUpdateTouchIDSettingsOperation)initWithAccountIdentifier:(id)a3
{
  id v4;
  ISBiometricUpdateTouchIDSettingsOperation *v5;
  uint64_t v6;
  void *status;
  uint64_t v8;
  NSString *attestationStringExtendedActions;
  AMSBiometricsTokenUpdateTaskShim *v10;
  NSArray *certChainExtended;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ISBiometricUpdateTouchIDSettingsOperation;
  v5 = -[ISOperation init](&v13, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    status = (void *)v5->_status;
    v5->_status = v6;

    v8 = objc_opt_new();
    attestationStringExtendedActions = v5->_attestationStringExtendedActions;
    v5->_attestationStringExtendedActions = (NSString *)v8;

    *(&v5->super._success + 1) = 1;
    *(&v5->super._success + 2) = 0;
    v5->_resultBlock = (id)-1;
    if (_os_feature_enabled_impl())
    {
      v10 = -[AMSBiometricsTokenUpdateTaskShim initWithAccountIdentifier:]([AMSBiometricsTokenUpdateTaskShim alloc], "initWithAccountIdentifier:", v5->_status);
      certChainExtended = v5->_certChainExtended;
      v5->_certChainExtended = (NSArray *)v10;

    }
  }

  return v5;
}

- (void)run
{
  NSArray *certChainExtended;
  void *v4;
  int v5;
  NSObject *v6;
  void *v7;
  int64_t status;
  id v9;
  void *v10;
  int *v11;
  NSObject *v12;
  void *v13;
  int v14;
  NSObject *v15;
  id v16;
  void *v17;
  int *v18;
  void *v19;
  int v20;
  NSObject *v21;
  void *v22;
  id v23;
  void *v24;
  NSString *attestationStringExtendedActions;
  int64_t v26;
  char v27;
  id v28;
  void *v29;
  int v30;
  NSObject *v31;
  void *v32;
  int64_t v33;
  id v34;
  void *v35;
  NSObject *v36;
  NSObject *v37;
  uint64_t v38;
  dispatch_time_t v39;
  void *v40;
  int v41;
  int v42;
  NSObject *v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  id v48;
  void *v49;
  id v50;
  id v51;
  void *v52;
  id v53;
  ISBiometricStore *v54;
  ISBiometricStore *biometricStore;
  NSArray *v56;
  NSArray *certChainPrimary;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  int v64;
  int v65;
  NSObject *v66;
  void *v67;
  id v68;
  uint64_t v69;
  void *v70;
  void *v71;
  void *v72;
  NSString *v73;
  int64_t v74;
  NSObject *v75;
  NSString *v76;
  int64_t v77;
  id v78;
  void *v79;
  NSObject *v80;
  void *v81;
  int v82;
  NSObject *v83;
  void *v84;
  int64_t v85;
  id v86;
  void *v87;
  int v88;
  int v89;
  NSObject *v90;
  int v91;
  id v92;
  void *v93;
  void *v94;
  void *v95;
  int v96;
  void *v97;
  int64_t v98;
  id v99;
  int v100;
  int v101;
  NSObject *v102;
  id v103;
  void *v104;
  void *v105;
  int v106;
  void *v107;
  int64_t v108;
  id v109;
  NSString *v110;
  int64_t v111;
  void *v112;
  NSString *v113;
  int64_t v114;
  void *v115;
  NSObject *v116;
  void *v117;
  int v118;
  NSObject *v119;
  void *v120;
  int64_t v121;
  id v122;
  void *v123;
  int v124;
  void *v125;
  int64_t v126;
  id v127;
  int v128;
  int v129;
  NSObject *v130;
  void *v131;
  id v132;
  void *v133;
  int v134;
  void *v135;
  int64_t v136;
  id v137;
  id v138;
  NSNumber *v139;
  NSNumber *accountIdentifier;
  id v141;
  NSString *v142;
  NSString *attestationStringPurchase;
  void *v144;
  void *v145;
  void *v146;
  NSObject *v147;
  NSObject *v148;
  NSObject *v149;
  int v150;
  NSObject *v151;
  void *v152;
  void *v153;
  id resultBlock;
  void *v155;
  void *v156;
  int v157;
  void *v158;
  id v159;
  void *v160;
  void *v161;
  uint64_t v162;
  int v163;
  void *v164;
  id v165;
  void *v166;
  void (**v167)(_QWORD, _QWORD, _QWORD);
  int *v168;
  uint64_t v169;
  id v170;
  id v171;
  void *v172;
  void *v173;
  void *v174;
  id v175;
  void *v176;
  uint64_t v177;
  void *v178;
  dispatch_group_t group;
  void *v180;
  NSObject *v181;
  id v182;
  NSObject *v183;
  id v184;
  id v185;
  id v186;
  _QWORD v187[4];
  id v188;
  _QWORD v189[4];
  id v190;
  _QWORD v191[6];
  uint64_t v192;
  uint64_t *v193;
  uint64_t v194;
  uint64_t (*v195)(uint64_t, uint64_t);
  void (*v196)(uint64_t);
  id v197;
  _QWORD block[6];
  id v199;
  _QWORD v200[5];
  int v201;
  id v202;
  __int16 v203;
  uint64_t v204;
  __int16 v205;
  void *v206;
  _BYTE v207[24];
  uint64_t (*v208)(uint64_t, uint64_t);
  void (*v209)(uint64_t);
  id v210;
  uint64_t v211;

  v211 = *MEMORY[0x24BDAC8D0];
  certChainExtended = self->_certChainExtended;
  if (certChainExtended)
  {
    v200[0] = MEMORY[0x24BDAC760];
    v200[1] = 3221225472;
    v200[2] = __48__ISBiometricUpdateTouchIDSettingsOperation_run__block_invoke;
    v200[3] = &unk_24C43CD60;
    v200[4] = self;
    -[NSArray runUpdateWithCompletionBlock:](certChainExtended, "runUpdateWithCompletionBlock:", v200);
    return;
  }
  SSGenerateLogCorrelationString();
  v180 = (void *)objc_claimAutoreleasedReturnValue();
  if (!+[ISBiometricStore tokenUpdateShouldStartWithLogKey:](ISBiometricStore, "tokenUpdateShouldStartWithLogKey:", v180))
  {
    SSError();
    v12 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v14 = objc_msgSend(v13, "shouldLog");
    if (objc_msgSend(v13, "shouldLogToDisk"))
      v14 |= 2u;
    objc_msgSend(v13, "OSLogObject");
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      v14 &= 2u;
    if (v14)
    {
      *(_DWORD *)v207 = 138543362;
      *(_QWORD *)&v207[4] = objc_opt_class();
      v16 = *(id *)&v207[4];
      LODWORD(v169) = 12;
      v168 = (int *)v207;
      v17 = (void *)_os_log_send_and_compose_impl();

      if (v17)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v17, 4, v207, v169);
        v18 = (int *)objc_claimAutoreleasedReturnValue();
        free(v17);
        v168 = v18;
        SSFileLog();

      }
    }
    else
    {

    }
    goto LABEL_227;
  }
  objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v5 = objc_msgSend(v4, "shouldLog");
  if (objc_msgSend(v4, "shouldLogToDisk"))
    v5 |= 2u;
  objc_msgSend(v4, "OSLogObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    v5 &= 2u;
  if (v5)
  {
    v7 = (void *)objc_opt_class();
    status = self->_status;
    *(_DWORD *)v207 = 138543618;
    *(_QWORD *)&v207[4] = v7;
    *(_WORD *)&v207[12] = 2112;
    *(_QWORD *)&v207[14] = status;
    v9 = v7;
    LODWORD(v169) = 22;
    v168 = (int *)v207;
    v10 = (void *)_os_log_send_and_compose_impl();

    if (v10)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v10, 4, v207, v169);
      v11 = (int *)objc_claimAutoreleasedReturnValue();
      free(v10);
      v168 = v11;
      SSFileLog();

    }
  }
  else
  {

  }
  if (-[ISBiometricUpdateTouchIDSettingsOperation regeneratePublicKey](self, "regeneratePublicKey"))
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v19)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v20 = objc_msgSend(v19, "shouldLog", v168);
    if (objc_msgSend(v19, "shouldLogToDisk"))
      v20 |= 2u;
    objc_msgSend(v19, "OSLogObject");
    v21 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      v20 &= 2u;
    if (v20)
    {
      v22 = (void *)objc_opt_class();
      *(_DWORD *)v207 = 138543362;
      *(_QWORD *)&v207[4] = v22;
      v23 = v22;
      LODWORD(v169) = 12;
      v168 = (int *)v207;
      v24 = (void *)_os_log_send_and_compose_impl();

      if (!v24)
        goto LABEL_34;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v24, 4, v207, v169);
      v21 = objc_claimAutoreleasedReturnValue();
      free(v24);
      v168 = (int *)v21;
      SSFileLog();
    }

LABEL_34:
    attestationStringExtendedActions = self->_attestationStringExtendedActions;
    v26 = self->_status;
    v199 = 0;
    v27 = -[NSString deleteKeychainTokensForAccountIdentifier:error:](attestationStringExtendedActions, "deleteKeychainTokensForAccountIdentifier:error:", v26, &v199);
    v28 = v199;
    if ((v27 & 1) != 0)
    {
LABEL_46:

      goto LABEL_47;
    }
    objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v29)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v30 = objc_msgSend(v29, "shouldLog", v168);
    if (objc_msgSend(v29, "shouldLogToDisk"))
      v30 |= 2u;
    objc_msgSend(v29, "OSLogObject");
    v31 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      v30 &= 2u;
    if (v30)
    {
      v32 = (void *)objc_opt_class();
      v33 = self->_status;
      *(_DWORD *)v207 = 138543874;
      *(_QWORD *)&v207[4] = v32;
      *(_WORD *)&v207[12] = 2112;
      *(_QWORD *)&v207[14] = v33;
      *(_WORD *)&v207[22] = 2114;
      v208 = (uint64_t (*)(uint64_t, uint64_t))v28;
      v34 = v32;
      LODWORD(v169) = 32;
      v168 = (int *)v207;
      v35 = (void *)_os_log_send_and_compose_impl();

      if (!v35)
      {
LABEL_45:

        goto LABEL_46;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v35, 4, v207, v169);
      v31 = objc_claimAutoreleasedReturnValue();
      free(v35);
      v168 = (int *)v31;
      SSFileLog();
    }

    goto LABEL_45;
  }
LABEL_47:
  if (!+[ISBiometricStore shouldUseX509](ISBiometricStore, "shouldUseX509", v168))
  {
    v73 = self->_attestationStringExtendedActions;
    v74 = self->_status;
    v185 = 0;
    -[NSString publicKeyDataForAccountIdentifier:purpose:error:](v73, "publicKeyDataForAccountIdentifier:purpose:error:", v74, 0, &v185);
    v178 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = v185;
    v76 = self->_attestationStringExtendedActions;
    v77 = self->_status;
    v184 = 0;
    -[NSString publicKeyDataForAccountIdentifier:purpose:error:](v76, "publicKeyDataForAccountIdentifier:purpose:error:", v77, 1, &v184);
    v173 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = v184;
    v79 = v78;
    if (v75 && v78)
    {
      SSError();
      v80 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v81)
      {
        objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v82 = objc_msgSend(v81, "shouldLog");
      if (objc_msgSend(v81, "shouldLogToDisk"))
        v82 |= 2u;
      objc_msgSend(v81, "OSLogObject");
      v83 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
        v82 &= 2u;
      if (!v82)
        goto LABEL_130;
      v84 = (void *)objc_opt_class();
      v85 = self->_status;
      *(_DWORD *)v207 = 138543618;
      *(_QWORD *)&v207[4] = v84;
      *(_WORD *)&v207[12] = 2112;
      *(_QWORD *)&v207[14] = v85;
      v86 = v84;
      LODWORD(v169) = 22;
      v168 = (int *)v207;
      v87 = (void *)_os_log_send_and_compose_impl();

      if (v87)
      {
LABEL_129:
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v87, 4, v207, v169);
        v83 = objc_claimAutoreleasedReturnValue();
        free(v87);
        v168 = (int *)v83;
        SSFileLog();
LABEL_130:

      }
    }
    else if (v75)
    {
      v80 = v75;
      objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v81)
      {
        objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v96 = objc_msgSend(v81, "shouldLog");
      if (objc_msgSend(v81, "shouldLogToDisk"))
        v96 |= 2u;
      objc_msgSend(v81, "OSLogObject");
      v83 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
        v96 &= 2u;
      if (!v96)
        goto LABEL_130;
      v97 = (void *)objc_opt_class();
      v98 = self->_status;
      *(_DWORD *)v207 = 138543618;
      *(_QWORD *)&v207[4] = v97;
      *(_WORD *)&v207[12] = 2112;
      *(_QWORD *)&v207[14] = v98;
      v99 = v97;
      LODWORD(v169) = 22;
      v168 = (int *)v207;
      v87 = (void *)_os_log_send_and_compose_impl();

      if (v87)
        goto LABEL_129;
    }
    else
    {
      if (!v78)
      {
        v80 = 0;
        goto LABEL_132;
      }
      v80 = v78;
      objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v81)
      {
        objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v106 = objc_msgSend(v81, "shouldLog");
      if (objc_msgSend(v81, "shouldLogToDisk"))
        v106 |= 2u;
      objc_msgSend(v81, "OSLogObject");
      v83 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
        v106 &= 2u;
      if (!v106)
        goto LABEL_130;
      v107 = (void *)objc_opt_class();
      v108 = self->_status;
      *(_DWORD *)v207 = 138543618;
      *(_QWORD *)&v207[4] = v107;
      *(_WORD *)&v207[12] = 2112;
      *(_QWORD *)&v207[14] = v108;
      v109 = v107;
      LODWORD(v169) = 22;
      v168 = (int *)v207;
      v87 = (void *)_os_log_send_and_compose_impl();

      if (v87)
        goto LABEL_129;
    }

LABEL_132:
    if (!v178 || !v173)
    {
      v171 = v79;
      group = v75;
      v116 = v80;
      goto LABEL_187;
    }
    v110 = self->_attestationStringExtendedActions;
    v111 = self->_status;
    v183 = v75;
    -[NSString createAttestationDataForAccountIdentifier:purpose:error:](v110, "createAttestationDataForAccountIdentifier:purpose:error:", v111, 0, &v183);
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    group = v183;

    v113 = self->_attestationStringExtendedActions;
    v114 = self->_status;
    v182 = v79;
    -[NSString createAttestationDataForAccountIdentifier:purpose:error:](v113, "createAttestationDataForAccountIdentifier:purpose:error:", v114, 1, &v182);
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    v171 = v182;

    if (group && v171)
    {
      SSError();
      v116 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v117)
      {
        objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
        v117 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v118 = objc_msgSend(v117, "shouldLog", v168);
      if (objc_msgSend(v117, "shouldLogToDisk"))
        v118 |= 2u;
      objc_msgSend(v117, "OSLogObject");
      v119 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v119, OS_LOG_TYPE_ERROR))
        v118 &= 2u;
      if (!v118)
        goto LABEL_181;
      v120 = (void *)objc_opt_class();
      v121 = self->_status;
      *(_DWORD *)v207 = 138543618;
      *(_QWORD *)&v207[4] = v120;
      *(_WORD *)&v207[12] = 2112;
      *(_QWORD *)&v207[14] = v121;
      v122 = v120;
      LODWORD(v169) = 22;
      v168 = (int *)v207;
      v123 = (void *)_os_log_send_and_compose_impl();

      if (!v123)
        goto LABEL_182;
    }
    else if (group)
    {
      v116 = group;

      objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v117)
      {
        objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
        v117 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v124 = objc_msgSend(v117, "shouldLog", v168);
      if (objc_msgSend(v117, "shouldLogToDisk"))
        v124 |= 2u;
      objc_msgSend(v117, "OSLogObject");
      v119 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v119, OS_LOG_TYPE_ERROR))
        v124 &= 2u;
      if (!v124)
        goto LABEL_181;
      v125 = (void *)objc_opt_class();
      v126 = self->_status;
      *(_DWORD *)v207 = 138543618;
      *(_QWORD *)&v207[4] = v125;
      *(_WORD *)&v207[12] = 2112;
      *(_QWORD *)&v207[14] = v126;
      v127 = v125;
      LODWORD(v169) = 22;
      v168 = (int *)v207;
      v123 = (void *)_os_log_send_and_compose_impl();

      if (!v123)
        goto LABEL_182;
    }
    else
    {
      if (!v171)
      {
        v116 = v80;
        if (!v112)
          goto LABEL_184;
        goto LABEL_183;
      }
      v116 = v171;

      objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v117)
      {
        objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
        v117 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v134 = objc_msgSend(v117, "shouldLog", v168);
      if (objc_msgSend(v117, "shouldLogToDisk"))
        v134 |= 2u;
      objc_msgSend(v117, "OSLogObject");
      v119 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v119, OS_LOG_TYPE_ERROR))
        v134 &= 2u;
      if (!v134)
        goto LABEL_181;
      v135 = (void *)objc_opt_class();
      v136 = self->_status;
      *(_DWORD *)v207 = 138543618;
      *(_QWORD *)&v207[4] = v135;
      *(_WORD *)&v207[12] = 2112;
      *(_QWORD *)&v207[14] = v136;
      v137 = v135;
      LODWORD(v169) = 22;
      v168 = (int *)v207;
      v123 = (void *)_os_log_send_and_compose_impl();

      if (!v123)
        goto LABEL_182;
    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v123, 4, v207, v169);
    v119 = objc_claimAutoreleasedReturnValue();
    free(v123);
    v168 = (int *)v119;
    SSFileLog();
LABEL_181:

LABEL_182:
    if (!v112)
    {
LABEL_184:
      if (v115)
      {
        v141 = objc_retainAutorelease(v115);
        v142 = (NSString *)ISCopyEncodedBase64((unsigned __int8 *)objc_msgSend(v141, "bytes"), objc_msgSend(v141, "length"));
        attestationStringPurchase = self->_attestationStringPurchase;
        self->_attestationStringPurchase = v142;

      }
LABEL_187:
      if (!self->_accountIdentifier)
      {
        v12 = v116;
LABEL_225:

        goto LABEL_226;
      }
      v175 = -[ISBiometricUpdateTouchIDSettingsOperation _newUpdateTouchIDSettingsOperation](self, "_newUpdateTouchIDSettingsOperation");
      +[ISDataProvider provider](ISProtocolDataProvider, "provider");
      v144 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v175, "setDataProvider:", v144);

      v181 = v116;
      LODWORD(v144) = -[ISOperation runSubOperation:returningError:](self, "runSubOperation:returningError:", v175, &v181);
      v12 = v181;

      if (!(_DWORD)v144)
      {
        objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
        v146 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v146)
        {
          objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
          v146 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v157 = objc_msgSend(v146, "shouldLog", v168);
        if (objc_msgSend(v146, "shouldLogToDisk"))
          v157 |= 2u;
        objc_msgSend(v146, "OSLogObject");
        v148 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v148, OS_LOG_TYPE_ERROR))
          v157 &= 2u;
        if (v157)
        {
          v158 = (void *)objc_opt_class();
          v159 = v158;
          -[NSObject localizedDescription](v12, "localizedDescription");
          v160 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v207 = 138543618;
          *(_QWORD *)&v207[4] = v158;
          *(_WORD *)&v207[12] = 2114;
          *(_QWORD *)&v207[14] = v160;
          LODWORD(v169) = 22;
          v168 = (int *)v207;
          v161 = (void *)_os_log_send_and_compose_impl();

          if (!v161)
          {
LABEL_224:

            goto LABEL_225;
          }
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v161, 4, v207, v169);
          v148 = objc_claimAutoreleasedReturnValue();
          free(v161);
          v168 = (int *)v148;
          SSFileLog();
        }
LABEL_223:

        goto LABEL_224;
      }
      objc_msgSend(v175, "dataProvider");
      v145 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v145, "output");
      v146 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        SSError();
        v162 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
        v148 = objc_claimAutoreleasedReturnValue();
        if (!v148)
        {
          objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
          v148 = objc_claimAutoreleasedReturnValue();
        }
        v163 = -[NSObject shouldLog](v148, "shouldLog", v168);
        if (-[NSObject shouldLogToDisk](v148, "shouldLogToDisk"))
          v163 |= 2u;
        -[NSObject OSLogObject](v148, "OSLogObject");
        v149 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v149, OS_LOG_TYPE_ERROR))
          v163 &= 2u;
        if (v163)
        {
          v164 = (void *)objc_opt_class();
          *(_DWORD *)v207 = 138543362;
          *(_QWORD *)&v207[4] = v164;
          v165 = v164;
          LODWORD(v169) = 12;
          v168 = (int *)v207;
          v166 = (void *)_os_log_send_and_compose_impl();

          if (!v166)
          {
            v12 = v162;
            goto LABEL_223;
          }
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v166, 4, v207, v169);
          v149 = objc_claimAutoreleasedReturnValue();
          free(v166);
          v168 = (int *)v149;
          SSFileLog();
        }
        v12 = v162;
        goto LABEL_222;
      }
      objc_msgSend(v146, "objectForKey:", CFSTR("status"));
      v147 = objc_claimAutoreleasedReturnValue();
      v148 = v147;
      if (v147)
        self->_resultBlock = (id)-[NSObject integerValue](v147, "integerValue");
      objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig", v168);
      v149 = objc_claimAutoreleasedReturnValue();
      if (!v149)
      {
        objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
        v149 = objc_claimAutoreleasedReturnValue();
      }
      v150 = -[NSObject shouldLog](v149, "shouldLog");
      if (-[NSObject shouldLogToDisk](v149, "shouldLogToDisk"))
        v150 |= 2u;
      -[NSObject OSLogObject](v149, "OSLogObject");
      v151 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v151, OS_LOG_TYPE_DEFAULT))
        v150 &= 2u;
      if (v150)
      {
        v152 = (void *)objc_opt_class();
        v153 = (void *)MEMORY[0x24BDD16E0];
        resultBlock = self->_resultBlock;
        v170 = v152;
        objc_msgSend(v153, "numberWithInteger:", resultBlock);
        v155 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v207 = 138543618;
        *(_QWORD *)&v207[4] = v152;
        *(_WORD *)&v207[12] = 2114;
        *(_QWORD *)&v207[14] = v155;
        LODWORD(v169) = 22;
        v168 = (int *)v207;
        v156 = (void *)_os_log_send_and_compose_impl();

        if (!v156)
        {
LABEL_222:

          goto LABEL_223;
        }
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v156, 4, v207, v169);
        v151 = objc_claimAutoreleasedReturnValue();
        free(v156);
        v168 = (int *)v151;
        SSFileLog();
      }

      goto LABEL_222;
    }
LABEL_183:
    v138 = objc_retainAutorelease(v112);
    v139 = (NSNumber *)ISCopyEncodedBase64((unsigned __int8 *)objc_msgSend(v138, "bytes"), objc_msgSend(v138, "length"));
    accountIdentifier = self->_accountIdentifier;
    self->_accountIdentifier = v139;

    goto LABEL_184;
  }
  v36 = dispatch_group_create();
  *(_QWORD *)v207 = 0;
  *(_QWORD *)&v207[8] = v207;
  *(_QWORD *)&v207[16] = 0x3032000000;
  v208 = __Block_byref_object_copy__12;
  v209 = __Block_byref_object_dispose__12;
  v210 = 0;
  dispatch_get_global_queue(25, 0);
  v37 = objc_claimAutoreleasedReturnValue();
  v38 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__ISBiometricUpdateTouchIDSettingsOperation_run__block_invoke_17;
  block[3] = &unk_24C43C310;
  block[4] = self;
  block[5] = v207;
  group = v36;
  dispatch_group_async(v36, v37, block);

  v192 = 0;
  v193 = &v192;
  v194 = 0x3032000000;
  v195 = __Block_byref_object_copy__12;
  v196 = __Block_byref_object_dispose__12;
  v197 = 0;
  v191[0] = v38;
  v191[1] = 3221225472;
  v191[2] = __48__ISBiometricUpdateTouchIDSettingsOperation_run__block_invoke_20;
  v191[3] = &unk_24C43C310;
  v191[4] = self;
  v191[5] = &v192;
  dispatch_group_async(v36, v37, v191);

  v39 = dispatch_time(0, 60000000000);
  if (dispatch_group_wait(v36, v39))
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v40)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v41 = objc_msgSend(v40, "shouldLog");
    v42 = objc_msgSend(v40, "shouldLogToDisk");
    objc_msgSend(v40, "OSLogObject");
    v43 = objc_claimAutoreleasedReturnValue();
    v44 = v43;
    if (v42)
      v41 |= 2u;
    if (!os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      v41 &= 2u;
    if (v41)
    {
      v45 = (void *)objc_opt_class();
      v201 = 138543362;
      v202 = v45;
      v46 = v45;
      LODWORD(v169) = 12;
      v168 = &v201;
      v47 = (void *)_os_log_send_and_compose_impl();

      if (!v47)
      {
LABEL_59:

        goto LABEL_60;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v47, 4, &v201, v169);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      free(v47);
      v168 = (int *)v44;
      SSFileLog();
    }

    goto LABEL_59;
  }
LABEL_60:
  v48 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v49 = *(void **)(*(_QWORD *)&v207[8] + 40);
  v189[0] = v38;
  v189[1] = 3221225472;
  v189[2] = __48__ISBiometricUpdateTouchIDSettingsOperation_run__block_invoke_22;
  v189[3] = &unk_24C43CD88;
  v50 = v48;
  v190 = v50;
  objc_msgSend(v49, "enumerateObjectsUsingBlock:", v189);
  v51 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v52 = (void *)v193[5];
  v187[0] = v38;
  v187[1] = 3221225472;
  v187[2] = __48__ISBiometricUpdateTouchIDSettingsOperation_run__block_invoke_2;
  v187[3] = &unk_24C43CD88;
  v53 = v51;
  v188 = v53;
  objc_msgSend(v52, "enumerateObjectsUsingBlock:", v187);
  v54 = (ISBiometricStore *)objc_msgSend(v50, "copy");
  biometricStore = self->_biometricStore;
  self->_biometricStore = v54;

  v56 = (NSArray *)objc_msgSend(v53, "copy");
  certChainPrimary = self->_certChainPrimary;
  self->_certChainPrimary = v56;

  if (objc_msgSend(*(id *)(*(_QWORD *)&v207[8] + 40), "count") && objc_msgSend((id)v193[5], "count"))
  {
    v58 = -[ISBiometricUpdateTouchIDSettingsOperation _newUpdateTouchIDSettingsOperation](self, "_newUpdateTouchIDSettingsOperation");
    +[ISDataProvider provider](ISProtocolDataProvider, "provider");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "setDataProvider:", v59);

    v186 = 0;
    LODWORD(v59) = -[ISOperation runSubOperation:returningError:](self, "runSubOperation:returningError:", v58, &v186);
    v12 = v186;
    if ((_DWORD)v59)
    {
      objc_msgSend(v58, "dataProvider");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "output");
      v61 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        SSError();
        v177 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
        v62 = (id)objc_claimAutoreleasedReturnValue();
        if (!v62)
        {
          objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
          v62 = (id)objc_claimAutoreleasedReturnValue();
        }
        v128 = objc_msgSend(v62, "shouldLog", v168);
        v129 = objc_msgSend(v62, "shouldLogToDisk");
        objc_msgSend(v62, "OSLogObject");
        v130 = objc_claimAutoreleasedReturnValue();
        v72 = v130;
        if (v129)
          v128 |= 2u;
        if (!os_log_type_enabled(v130, OS_LOG_TYPE_ERROR))
          v128 &= 2u;
        if (v128)
        {
          v131 = (void *)objc_opt_class();
          v201 = 138543362;
          v202 = v131;
          v132 = v131;
          LODWORD(v169) = 12;
          v168 = &v201;
          v133 = (void *)_os_log_send_and_compose_impl();

          if (!v133)
          {
LABEL_167:
            v12 = v177;
            goto LABEL_168;
          }
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v133, 4, &v201, v169);
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          free(v133);
          v168 = (int *)v72;
          SSFileLog();
        }
LABEL_166:

        goto LABEL_167;
      }
      v62 = v61;
      objc_msgSend(v62, "objectForKey:", CFSTR("status"));
      v174 = (void *)objc_claimAutoreleasedReturnValue();
      if (v174)
        self->_resultBlock = (id)objc_msgSend(v174, "integerValue");
      objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig", v168);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v63)
      {
        objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v64 = objc_msgSend(v63, "shouldLog");
      v65 = objc_msgSend(v63, "shouldLogToDisk");
      v176 = v63;
      objc_msgSend(v63, "OSLogObject");
      v66 = objc_claimAutoreleasedReturnValue();
      v67 = v66;
      if (v65)
        v64 |= 2u;
      if (!os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
        v64 &= 2u;
      if (v64)
      {
        v68 = (id)objc_opt_class();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_resultBlock);
        v69 = objc_claimAutoreleasedReturnValue();
        v201 = 138543618;
        v172 = v68;
        v202 = v68;
        v203 = 2114;
        v204 = v69;
        LODWORD(v169) = 22;
        v168 = &v201;
        v70 = (void *)v69;
        v71 = (void *)_os_log_send_and_compose_impl();

        if (!v71)
        {
LABEL_76:

          v177 = (uint64_t)v12;
          v72 = v174;
          goto LABEL_166;
        }
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v71, 4, &v201, v169);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        free(v71);
        v168 = (int *)v67;
        SSFileLog();
      }

      goto LABEL_76;
    }
    objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v61)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v100 = objc_msgSend(v61, "shouldLog", v168);
    v101 = objc_msgSend(v61, "shouldLogToDisk");
    objc_msgSend(v61, "OSLogObject");
    v102 = objc_claimAutoreleasedReturnValue();
    v62 = v102;
    if (v101)
      v100 |= 2u;
    if (!os_log_type_enabled(v102, OS_LOG_TYPE_ERROR))
      v100 &= 2u;
    if (!v100)
      goto LABEL_168;
    v103 = (id)objc_opt_class();
    -[NSObject localizedDescription](v12, "localizedDescription");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    v201 = 138543618;
    v202 = v103;
    v203 = 2114;
    v204 = (uint64_t)v104;
    LODWORD(v169) = 22;
    v168 = &v201;
    v105 = (void *)_os_log_send_and_compose_impl();

    if (v105)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v105, 4, &v201, v169);
      v62 = (id)objc_claimAutoreleasedReturnValue();
      free(v105);
      v168 = (int *)v62;
      SSFileLog();
LABEL_168:

    }
LABEL_169:

    goto LABEL_170;
  }
  objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig", v168);
  v58 = (id)objc_claimAutoreleasedReturnValue();
  if (!v58)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v58 = (id)objc_claimAutoreleasedReturnValue();
  }
  v88 = objc_msgSend(v58, "shouldLog");
  v89 = objc_msgSend(v58, "shouldLogToDisk");
  objc_msgSend(v58, "OSLogObject");
  v90 = objc_claimAutoreleasedReturnValue();
  v61 = v90;
  if (v89)
    v88 |= 2u;
  if (os_log_type_enabled(v90, OS_LOG_TYPE_ERROR))
    v91 = v88;
  else
    v91 = v88 & 2;
  if (!v91)
  {
LABEL_100:
    v12 = 0;
    goto LABEL_169;
  }
  v92 = (id)objc_opt_class();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(*(_QWORD *)&v207[8] + 40), "count"));
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend((id)v193[5], "count"));
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v201 = 138543874;
  v202 = v92;
  v203 = 2114;
  v204 = (uint64_t)v93;
  v205 = 2114;
  v206 = v94;
  LODWORD(v169) = 32;
  v168 = &v201;
  v95 = (void *)_os_log_send_and_compose_impl();

  if (v95)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v95, 4, &v201, v169);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    free(v95);
    v168 = (int *)v61;
    SSFileLog();
    goto LABEL_100;
  }
  v12 = 0;
LABEL_170:

  _Block_object_dispose(&v192, 8);
  _Block_object_dispose(v207, 8);

LABEL_226:
  +[ISBiometricStore tokenUpdateDidFinishWithLogKey:](ISBiometricStore, "tokenUpdateDidFinishWithLogKey:", v180);
LABEL_227:
  -[ISOperation setError:](self, "setError:", v12, v168);
  -[ISOperation setSuccess:](self, "setSuccess:", v12 == 0);
  -[ISBiometricUpdateTouchIDSettingsOperation resultBlock](self, "resultBlock");
  v167 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v167)
    ((void (**)(_QWORD, int64_t, NSObject *))v167)[2](v167, -[ISBiometricUpdateTouchIDSettingsOperation status](self, "status"), v12);

}

void __48__ISBiometricUpdateTouchIDSettingsOperation_run__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(*(id *)(a1 + 32), "setError:");
  objc_msgSend(*(id *)(a1 + 32), "setSuccess:", a2);
  objc_msgSend(*(id *)(a1 + 32), "resultBlock");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, a2, v7);

}

void __48__ISBiometricUpdateTouchIDSettingsOperation_run__block_invoke_17(uint64_t a1)
{
  void *v2;
  int v3;
  int v4;
  NSObject *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  int v17;
  NSObject *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  int v23;
  int v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  int *v32;
  uint64_t v33;
  id v34;
  int v35;
  id v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
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
  if (v4)
  {
    v35 = 138543362;
    v36 = (id)objc_opt_class();
    v6 = v36;
    LODWORD(v33) = 12;
    v32 = &v35;
    v7 = (void *)_os_log_send_and_compose_impl();

    if (!v7)
      goto LABEL_12;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v7, 4, &v35, v33);
    v5 = objc_claimAutoreleasedReturnValue();
    free(v7);
    v32 = (int *)v5;
    SSFileLog();
  }

LABEL_12:
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 376);
  v10 = *(_QWORD *)(v8 + 352);
  v34 = 0;
  objc_msgSend(v9, "x509CertChainDataForAccountIdentifier:purpose:regenerateCerts:error:", v10, 0, 1, &v34);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v34;
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v11;

  if (!v12)
    goto LABEL_25;
  objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v16 = objc_msgSend(v15, "shouldLog", v32);
  if (objc_msgSend(v15, "shouldLogToDisk"))
    v17 = v16 | 2;
  else
    v17 = v16;
  objc_msgSend(v15, "OSLogObject");
  v18 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    v17 &= 2u;
  if (!v17)
    goto LABEL_23;
  v19 = (void *)objc_opt_class();
  v35 = 138543618;
  v36 = v19;
  v37 = 2114;
  v38 = v12;
  v20 = v19;
  LODWORD(v33) = 22;
  v32 = &v35;
  v21 = (void *)_os_log_send_and_compose_impl();

  if (v21)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v21, 4, &v35, v33);
    v18 = objc_claimAutoreleasedReturnValue();
    free(v21);
    v32 = (int *)v18;
    SSFileLog();
LABEL_23:

  }
LABEL_25:
  objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig", v32);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v22)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v23 = objc_msgSend(v22, "shouldLog");
  if (objc_msgSend(v22, "shouldLogToDisk"))
    v24 = v23 | 2;
  else
    v24 = v23;
  objc_msgSend(v22, "OSLogObject");
  v25 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    v24 &= 2u;
  if (!v24)
    goto LABEL_35;
  v26 = (void *)objc_opt_class();
  v27 = (void *)MEMORY[0x24BDD16E0];
  v28 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v29 = v26;
  objc_msgSend(v27, "numberWithUnsignedInteger:", objc_msgSend(v28, "count"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 138543618;
  v36 = v26;
  v37 = 2114;
  v38 = v30;
  LODWORD(v33) = 22;
  v31 = (void *)_os_log_send_and_compose_impl();

  if (v31)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v31, 4, &v35, v33);
    v25 = objc_claimAutoreleasedReturnValue();
    free(v31);
    SSFileLog();
LABEL_35:

  }
}

void __48__ISBiometricUpdateTouchIDSettingsOperation_run__block_invoke_20(uint64_t a1)
{
  void *v2;
  int v3;
  int v4;
  NSObject *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  int v17;
  NSObject *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  int v23;
  int v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  int *v32;
  uint64_t v33;
  id v34;
  int v35;
  id v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
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
  if (v4)
  {
    v35 = 138543362;
    v36 = (id)objc_opt_class();
    v6 = v36;
    LODWORD(v33) = 12;
    v32 = &v35;
    v7 = (void *)_os_log_send_and_compose_impl();

    if (!v7)
      goto LABEL_12;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v7, 4, &v35, v33);
    v5 = objc_claimAutoreleasedReturnValue();
    free(v7);
    v32 = (int *)v5;
    SSFileLog();
  }

LABEL_12:
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 376);
  v10 = *(_QWORD *)(v8 + 352);
  v34 = 0;
  objc_msgSend(v9, "x509CertChainDataForAccountIdentifier:purpose:regenerateCerts:error:", v10, 1, 1, &v34);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v34;
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v11;

  if (!v12)
    goto LABEL_25;
  objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v16 = objc_msgSend(v15, "shouldLog", v32);
  if (objc_msgSend(v15, "shouldLogToDisk"))
    v17 = v16 | 2;
  else
    v17 = v16;
  objc_msgSend(v15, "OSLogObject");
  v18 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    v17 &= 2u;
  if (!v17)
    goto LABEL_23;
  v19 = (void *)objc_opt_class();
  v35 = 138543618;
  v36 = v19;
  v37 = 2114;
  v38 = v12;
  v20 = v19;
  LODWORD(v33) = 22;
  v32 = &v35;
  v21 = (void *)_os_log_send_and_compose_impl();

  if (v21)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v21, 4, &v35, v33);
    v18 = objc_claimAutoreleasedReturnValue();
    free(v21);
    v32 = (int *)v18;
    SSFileLog();
LABEL_23:

  }
LABEL_25:
  objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig", v32);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v22)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v23 = objc_msgSend(v22, "shouldLog");
  if (objc_msgSend(v22, "shouldLogToDisk"))
    v24 = v23 | 2;
  else
    v24 = v23;
  objc_msgSend(v22, "OSLogObject");
  v25 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    v24 &= 2u;
  if (!v24)
    goto LABEL_35;
  v26 = (void *)objc_opt_class();
  v27 = (void *)MEMORY[0x24BDD16E0];
  v28 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v29 = v26;
  objc_msgSend(v27, "numberWithUnsignedInteger:", objc_msgSend(v28, "count"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 138543618;
  v36 = v26;
  v37 = 2114;
  v38 = v30;
  LODWORD(v33) = 22;
  v31 = (void *)_os_log_send_and_compose_impl();

  if (v31)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v31, 4, &v35, v33);
    v25 = objc_claimAutoreleasedReturnValue();
    free(v31);
    SSFileLog();
LABEL_35:

  }
}

void __48__ISBiometricUpdateTouchIDSettingsOperation_run__block_invoke_22(uint64_t a1, id a2)
{
  id v3;
  unsigned __int8 *v4;
  unint64_t v5;
  id v6;

  v3 = objc_retainAutorelease(a2);
  v4 = (unsigned __int8 *)objc_msgSend(v3, "bytes");
  v5 = objc_msgSend(v3, "length");

  v6 = (id)ISCopyEncodedBase64(v4, v5);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);

}

void __48__ISBiometricUpdateTouchIDSettingsOperation_run__block_invoke_2(uint64_t a1, id a2)
{
  id v3;
  unsigned __int8 *v4;
  unint64_t v5;
  id v6;

  v3 = objc_retainAutorelease(a2);
  v4 = (unsigned __int8 *)objc_msgSend(v3, "bytes");
  v5 = objc_msgSend(v3, "length");

  v6 = (id)ISCopyEncodedBase64(v4, v5);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);

}

- (id)_newUpdateTouchIDSettingsOperation
{
  ISStoreURLOperation *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  int v9;
  NSObject *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  int v20;
  NSObject *v21;
  int v22;
  ISStoreURLOperation *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  int v31;
  int v32;
  NSObject *v33;
  int v34;
  id v35;
  id v36;
  ISBiometricUpdateTouchIDSettingsOperation *v37;
  ISStoreURLOperation *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  int *v45;
  uint64_t v46;
  id v47;
  id v48;
  id v49;
  ISStoreURLOperation *v50;
  void *v51;
  void *v52;
  int v53;
  void *v54;
  __int16 v55;
  void *v56;
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(ISStoreURLOperation);
  v4 = objc_alloc_init(MEMORY[0x24BEB1F30]);
  objc_msgSend(v4, "setITunesStoreRequest:", 1);
  objc_msgSend(v4, "setURLBagKey:", CFSTR("update-touch-id-settings"));
  objc_msgSend(v4, "setHTTPMethod:", CFSTR("POST"));
  v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  if (!+[ISBiometricStore shouldUseX509](ISBiometricStore, "shouldUseX509"))
  {
    objc_msgSend(v5, "setObject:forKey:", self->_accountIdentifier, CFSTR("touchIdAttestation"));
    objc_msgSend(v5, "setObject:forKey:", self->_attestationStringPurchase, CFSTR("extendedAttestation"));
    goto LABEL_34;
  }
  -[ISBiometricUpdateTouchIDSettingsOperation certChainPrimary](self, "certChainPrimary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v5, "setObject:forKey:", v6, CFSTR("primaryX509Chain"));
    goto LABEL_18;
  }
  objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v8 = objc_msgSend(v7, "shouldLog");
  if (objc_msgSend(v7, "shouldLogToDisk"))
    v9 = v8 | 2;
  else
    v9 = v8;
  objc_msgSend(v7, "OSLogObject");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    v11 = v9;
  else
    v11 = v9 & 2;
  if (!v11)
    goto LABEL_16;
  v12 = v6;
  v13 = (void *)objc_opt_class();
  v50 = v3;
  v14 = (void *)MEMORY[0x24BDD16E0];
  v47 = v13;
  objc_msgSend(v14, "numberWithUnsignedInteger:", objc_msgSend(v12, "count"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = 138543618;
  v54 = v13;
  v6 = v12;
  v55 = 2112;
  v56 = v15;
  LODWORD(v46) = 22;
  v45 = &v53;
  v16 = (void *)_os_log_send_and_compose_impl();

  v3 = v50;
  if (v16)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v16, 4, &v53, v46);
    v10 = objc_claimAutoreleasedReturnValue();
    free(v16);
    v45 = (int *)v10;
    SSFileLog();
LABEL_16:

  }
LABEL_18:
  -[ISBiometricUpdateTouchIDSettingsOperation certChainExtended](self, "certChainExtended", v45);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v17, "count"))
  {
    v51 = v6;
    objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v18)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v19 = objc_msgSend(v18, "shouldLog");
    if (objc_msgSend(v18, "shouldLogToDisk"))
      v20 = v19 | 2;
    else
      v20 = v19;
    objc_msgSend(v18, "OSLogObject");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      v22 = v20;
    else
      v22 = v20 & 2;
    if (v22)
    {
      v23 = v3;
      v24 = (void *)objc_opt_class();
      v25 = v5;
      v26 = (void *)MEMORY[0x24BDD16E0];
      v48 = v24;
      objc_msgSend(v26, "numberWithUnsignedInteger:", objc_msgSend(v17, "count"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = 138543618;
      v54 = v24;
      v3 = v23;
      v55 = 2112;
      v56 = v27;
      LODWORD(v46) = 22;
      v45 = &v53;
      v28 = (void *)_os_log_send_and_compose_impl();

      v5 = v25;
      if (!v28)
      {
LABEL_32:

        v6 = v51;
        goto LABEL_33;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v28, 4, &v53, v46);
      v21 = objc_claimAutoreleasedReturnValue();
      free(v28);
      v45 = (int *)v21;
      SSFileLog();
    }

    goto LABEL_32;
  }
  objc_msgSend(v5, "setObject:forKey:", v17, CFSTR("extendedX509Chain"));
LABEL_33:

LABEL_34:
  objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", v5, 100, 0, 0, v45);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHTTPBody:");
  -[ISURLOperation setRequestProperties:](v3, "setRequestProperties:", v4);
  if (-[ISBiometricUpdateTouchIDSettingsOperation shouldSuppressAuthPrompts](self, "shouldSuppressAuthPrompts"))
    v29 = 1000;
  else
    v29 = 0;
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
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    v34 = v32;
  else
    v34 = v32 & 2;
  if (!v34)
    goto LABEL_48;
  v35 = v5;
  v36 = v4;
  v37 = self;
  v38 = v3;
  v39 = (void *)objc_opt_class();
  v40 = (void *)MEMORY[0x24BDD16E0];
  v49 = v39;
  objc_msgSend(v40, "numberWithInteger:", v29);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = 138543618;
  v54 = v39;
  v3 = v38;
  self = v37;
  v4 = v36;
  v5 = v35;
  v55 = 2114;
  v56 = v41;
  LODWORD(v46) = 22;
  v42 = (void *)_os_log_send_and_compose_impl();

  if (v42)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v42, 4, &v53, v46);
    v33 = objc_claimAutoreleasedReturnValue();
    free(v42);
    SSFileLog();
LABEL_48:

  }
  v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB1F28]), "initWithAccountIdentifier:", self->_status);
  objc_msgSend(v43, "setCanCreateNewAccount:", 0);
  objc_msgSend(v43, "setCanSetActiveAccount:", 0);
  objc_msgSend(v43, "setPromptStyle:", v29);
  -[ISURLOperation setAuthenticationContext:](v3, "setAuthenticationContext:", v43);

  return v3;
}

- (BOOL)regeneratePublicKey
{
  return *(&self->super._success + 1);
}

- (void)setRegeneratePublicKey:(BOOL)a3
{
  *(&self->super._success + 1) = a3;
}

- (id)resultBlock
{
  return objc_getProperty(self, a2, 336, 1);
}

- (void)setResultBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 336);
}

- (BOOL)shouldSuppressAuthPrompts
{
  return *(&self->super._success + 2);
}

- (void)setShouldSuppressAuthPrompts:(BOOL)a3
{
  *(&self->super._success + 2) = a3;
}

- (int64_t)status
{
  return (int64_t)self->_resultBlock;
}

- (NSNumber)accountIdentifier
{
  return (NSNumber *)self->_status;
}

- (void)setAccountIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 352);
}

- (NSString)attestationStringPurchase
{
  return (NSString *)&self->_accountIdentifier->super.super.isa;
}

- (void)setAttestationStringPurchase:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 360);
}

- (NSString)attestationStringExtendedActions
{
  return self->_attestationStringPurchase;
}

- (void)setAttestationStringExtendedActions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 368);
}

- (ISBiometricStore)biometricStore
{
  return (ISBiometricStore *)self->_attestationStringExtendedActions;
}

- (void)setBiometricStore:(id)a3
{
  objc_storeStrong((id *)&self->_attestationStringExtendedActions, a3);
}

- (NSArray)certChainPrimary
{
  return (NSArray *)self->_biometricStore;
}

- (void)setCertChainPrimary:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 384);
}

- (NSArray)certChainExtended
{
  return self->_certChainPrimary;
}

- (void)setCertChainExtended:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 392);
}

- (AMSBiometricsTokenUpdateTaskShim)shim
{
  return (AMSBiometricsTokenUpdateTaskShim *)objc_getProperty(self, a2, 400, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_certChainExtended, 0);
  objc_storeStrong((id *)&self->_certChainPrimary, 0);
  objc_storeStrong((id *)&self->_biometricStore, 0);
  objc_storeStrong((id *)&self->_attestationStringExtendedActions, 0);
  objc_storeStrong((id *)&self->_attestationStringPurchase, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_regeneratePublicKey, 0);
}

@end
