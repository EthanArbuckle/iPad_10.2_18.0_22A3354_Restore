@implementation PKSettingsDeepLinkController

- (PKSettingsDeepLinkController)init
{

  return 0;
}

- (PKSettingsDeepLinkController)initWithDataSource:(id)a3 delegate:(id)a4
{
  id v6;
  id v7;
  PKSettingsDeepLinkController *v8;
  PKSettingsDeepLinkController *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PKSettingsDeepLinkController;
  v8 = -[PKSettingsDeepLinkController init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_dataSource, v6);
    objc_storeWeak((id *)&v9->_delegate, v7);
  }

  return v9;
}

- (void)handleDeepLinkResourceDictionary:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  unint64_t v10;
  __CFString *v11;
  __CFString *v12;
  __CFString *v13;
  int v14;
  void *v15;
  __CFString *v16;
  __CFString *v17;
  __CFString *v18;
  __CFString *v19;
  int v20;
  void *v21;
  void *v22;
  __CFString *v23;
  __CFString *v24;
  int v25;
  _BOOL4 v26;
  __CFString *v27;
  __CFString *v28;
  __CFString *v29;
  int v30;
  __CFString *v31;
  __CFString *v32;
  __CFString *v33;
  int v34;
  void *v35;
  void *v36;
  void *v37;
  __CFString *v38;
  __CFString *v39;
  __CFString *v40;
  int v41;
  void *v42;
  __CFString *v43;
  __CFString *v44;
  __CFString *v45;
  int v46;
  __CFString *v47;
  __CFString *v48;
  int v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  __CFString *v58;
  __CFString *v59;
  __CFString *v60;
  int v61;
  __CFString *v62;
  __CFString *v63;
  __CFString *v64;
  int v65;
  __CFString *v66;
  __CFString *v67;
  __CFString *v68;
  int v69;
  __CFString *v70;
  __CFString *v71;
  __CFString *v72;
  int v73;
  void *v74;
  void *v75;
  uint64_t v76;
  __CFString *v77;
  __CFString *v78;
  __CFString *v79;
  int v80;
  void *v81;
  __CFString *v82;
  __CFString *v83;
  __CFString *v84;
  int v85;
  uint64_t v86;
  NSString *v87;
  void *v88;
  uint64_t v89;
  void *v90;
  NSDecimalNumber *v91;
  NSDecimalNumber *v92;
  void *v93;
  __CFString *v94;
  __CFString *v95;
  __CFString *v96;
  int v97;
  void *v98;
  void *v99;
  __CFString *v100;
  id v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  unint64_t v107;
  BOOL v108;
  void *v109;
  __CFString *v110;
  __CFString *v111;
  __CFString *v112;
  int v113;
  void *v114;
  __CFString *v115;
  __CFString *v116;
  __CFString *v117;
  int v118;
  void *v119;
  void *v120;
  __CFString *v121;
  __CFString *v122;
  int v123;
  __CFString *v124;
  __CFString *v125;
  int v126;
  __CFString *v127;
  __CFString *v128;
  __CFString *v129;
  char v130;
  void *v131;
  __CFString *v132;
  __CFString *v133;
  int v134;
  __CFString *v135;
  __CFString *v136;
  __CFString *v137;
  char v138;
  __CFString *v139;
  __CFString *v140;
  __CFString *v141;
  int v142;
  void *v143;
  void *v144;
  __CFString *v145;
  __CFString *v146;
  __CFString *v147;
  int v148;
  __CFString *v149;
  __CFString *v150;
  __CFString *v151;
  int v152;
  uint64_t v153;
  uint64_t v154;
  __CFString *v155;
  __CFString *v156;
  __CFString *v157;
  char v158;
  void *v159;
  NSObject *v160;
  PKPaymentService *v161;
  __CFString *v162;
  __CFString *v163;
  __CFString *v164;
  int v165;
  __CFString *v166;
  __CFString *v167;
  __CFString *v168;
  char v169;
  __CFString *v170;
  __CFString *v171;
  __CFString *v172;
  char v173;
  void *v174;
  void *v175;
  int v176;
  void *v177;
  __CFString *v178;
  __CFString *v179;
  __CFString *v180;
  int v181;
  __CFString *v182;
  __CFString *v183;
  __CFString *v184;
  char v185;
  __CFString *v186;
  __CFString *v187;
  __CFString *v188;
  char v189;
  __CFString *v190;
  __CFString *v191;
  __CFString *v192;
  int v193;
  __CFString *v194;
  __CFString *v195;
  __CFString *v196;
  char v197;
  __CFString *v198;
  __CFString *v199;
  __CFString *v200;
  char v201;
  __CFString *v202;
  __CFString *v203;
  int v204;
  __CFString *v205;
  __CFString *v206;
  __CFString *v207;
  char v208;
  uint64_t v209;
  uint64_t v210;
  PKSettingsDeepLinkController *v211;
  __CFString *v212;
  __CFString *v213;
  __CFString *v214;
  int v215;
  __CFString *v216;
  __CFString *v217;
  __CFString *v218;
  int v219;
  void *v220;
  void *v221;
  void *v222;
  void *v223;
  _BOOL4 v224;
  _BOOL4 v225;
  void *v226;
  id v227;
  void *v228;
  id WeakRetained;
  id v230;
  _QWORD v231[4];
  id v232;
  id v233;
  id v234;
  NSObject *v235;
  uint64_t v236;
  _QWORD v237[4];
  NSObject *v238;
  id v239;
  _QWORD v240[4];
  id v241;
  id v242;
  id v243;
  id v244;
  unint64_t v245;
  uint8_t buf[4];
  id v247;
  uint64_t v248;

  v248 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v230 = objc_loadWeakRetained((id *)&self->_dataSource);
  PKLogFacilityTypeGetObject(0);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v247 = v6;
    _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "Processing resourceDictionary %{public}@", buf, 0xCu);
  }

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("path"));
  v228 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v228, "componentsSeparatedByString:", CFSTR("/"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");
  objc_msgSend(v9, "firstObject");
  v11 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
  v12 = CFSTR("payment_setup_IDMS_card_on_file");
  if (v11 == v12)
  {

    goto LABEL_9;
  }
  v13 = v12;
  if (!v11 || !v12)
  {

    goto LABEL_12;
  }
  v14 = -[__CFString isEqualToString:](v11, "isEqualToString:", v12);

  if (v14)
  {
LABEL_9:
    v15 = v230;
    if (v10 < 2)
    {
      v16 = 0;
    }
    else
    {
      objc_msgSend(v9, "objectAtIndex:", 1);
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    v21 = WeakRetained;
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "openPaymentSetupWithMode:referrerIdentifier:allowedFeatureIdentifiers:", 2, v16, v22);
    goto LABEL_19;
  }
LABEL_12:
  v227 = v7;
  v17 = v11;
  v18 = CFSTR("payment_setup");
  if (v17 == v18)
  {

    goto LABEL_22;
  }
  v19 = v18;
  if (!v11 || !v18)
  {

    goto LABEL_26;
  }
  v20 = -[__CFString isEqualToString:](v17, "isEqualToString:", v18);

  if (v20)
  {
LABEL_22:
    v21 = WeakRetained;
    objc_msgSend(WeakRetained, "openPaymentSetupWithMode:referrerIdentifier:allowedFeatureIdentifiers:", 0, 0, 0);
LABEL_23:
    v7 = v227;
LABEL_24:
    v15 = v230;
    goto LABEL_127;
  }
LABEL_26:
  v23 = v17;
  v24 = v23;
  if (v23 == CFSTR("card"))
  {
    v25 = 1;
  }
  else
  {
    if (!v11 || !CFSTR("card"))
    {

      v26 = v10 > 1;
      goto LABEL_40;
    }
    v25 = -[__CFString isEqualToString:](v23, "isEqualToString:", CFSTR("card"));
  }

  v26 = v10 > 1;
  if (v25)
  {
    v7 = v227;
    if (v10 >= 2)
    {
      v15 = v230;
      if (v10 == 3)
      {
        objc_msgSend(v9, "objectAtIndex:", 2);
        v27 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
        v28 = CFSTR("cardInformation");
        if (v27 == v28)
        {

          goto LABEL_72;
        }
        v29 = v28;
        if (v27 && v28)
        {
          v30 = -[__CFString isEqualToString:](v27, "isEqualToString:", v28);

          if (!v30)
            goto LABEL_78;
LABEL_72:
          objc_msgSend(v9, "objectAtIndex:", 1);
          v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v230, "paymentPassWithUniqueIdentifier:", v16);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = WeakRetained;
          v50 = WeakRetained;
          v51 = v22;
          v52 = 1;
LABEL_79:
          objc_msgSend(v50, "presentPassDetailsViewControllerForPass:presentationStyle:presentingView:animated:", v51, 2, v52, 0);
LABEL_19:

LABEL_20:
          goto LABEL_127;
        }

      }
LABEL_78:
      objc_msgSend(v9, "objectAtIndex:", 1);
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v230, "paymentPassWithUniqueIdentifier:", v16);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = WeakRetained;
      v50 = WeakRetained;
      v51 = v22;
      v52 = 0;
      goto LABEL_79;
    }
  }
LABEL_40:
  v225 = v26;
  v31 = v24;
  v32 = CFSTR("transaction");
  if (v31 == v32)
  {

  }
  else
  {
    v33 = v32;
    if (!v11 || !v32)
    {

      goto LABEL_49;
    }
    v34 = -[__CFString isEqualToString:](v31, "isEqualToString:", v32);

    if (!v34)
    {
LABEL_49:
      v38 = v31;
      v39 = CFSTR("apple-cash");
      if (v38 == v39)
      {

      }
      else
      {
        v40 = v39;
        if (!v11 || !v39)
        {

          goto LABEL_60;
        }
        v41 = -[__CFString isEqualToString:](v38, "isEqualToString:", v39);

        if (!v41)
        {
LABEL_60:
          v43 = v38;
          v44 = CFSTR("peerPaymentTopUp");
          if (v43 == v44)
          {

          }
          else
          {
            v45 = v44;
            if (!v11 || !v44)
            {

              goto LABEL_92;
            }
            v46 = -[__CFString isEqualToString:](v43, "isEqualToString:", v44);

            if (!v46)
            {
LABEL_92:
              v62 = v43;
              v63 = CFSTR("peerPaymentVerifyIdentity");
              if (v62 == v63)
              {

              }
              else
              {
                v64 = v63;
                if (!v11 || !v63)
                {

LABEL_100:
                  v66 = v62;
                  v67 = CFSTR("peerPaymentTermsAcceptance");
                  if (v66 == v67)
                  {

                  }
                  else
                  {
                    v68 = v67;
                    if (!v11 || !v67)
                    {

                      goto LABEL_131;
                    }
                    v69 = -[__CFString isEqualToString:](v66, "isEqualToString:", v67);

                    if (!v69)
                    {
LABEL_131:
                      v82 = v66;
                      v83 = CFSTR("peerPaymentSetup");
                      if (v82 == v83)
                      {

                      }
                      else
                      {
                        v84 = v83;
                        if (!v11 || !v83)
                        {

                          goto LABEL_148;
                        }
                        v85 = -[__CFString isEqualToString:](v82, "isEqualToString:", v83);

                        if (!v85)
                        {
LABEL_148:
                          v94 = v82;
                          v95 = CFSTR("dailyCash");
                          if (v94 == v95)
                          {

                          }
                          else
                          {
                            v96 = v95;
                            if (!v11 || !v95)
                            {

                              goto LABEL_162;
                            }
                            v97 = -[__CFString isEqualToString:](v94, "isEqualToString:", v95);

                            if (!v97)
                            {
LABEL_162:
                              v110 = v94;
                              v111 = CFSTR("credit");
                              if (v110 == v111)
                              {

                              }
                              else
                              {
                                v112 = v111;
                                if (!v11 || !v111)
                                {

                                  goto LABEL_175;
                                }
                                v113 = -[__CFString isEqualToString:](v110, "isEqualToString:", v111);

                                if (!v113)
                                {
LABEL_175:
                                  v115 = v110;
                                  v116 = CFSTR("savings");
                                  if (v115 == v116)
                                  {

                                  }
                                  else
                                  {
                                    v117 = v116;
                                    if (!v11 || !v116)
                                    {

                                      goto LABEL_189;
                                    }
                                    v118 = -[__CFString isEqualToString:](v115, "isEqualToString:", v116);

                                    if (!v118)
                                    {
LABEL_189:
                                      v121 = v115;
                                      v122 = v121;
                                      if (v121 == CFSTR("virtualCard"))
                                      {
                                        v123 = 1;
                                      }
                                      else
                                      {
                                        if (!v11 || !CFSTR("virtualCard"))
                                        {

                                          v224 = v10 == 3;
                                          goto LABEL_221;
                                        }
                                        v123 = -[__CFString isEqualToString:](v121, "isEqualToString:", CFSTR("virtualCard"));
                                      }

                                      v224 = v10 == 3;
                                      if (v123 && v10 == 3)
                                      {
                                        objc_msgSend(v9, "objectAtIndex:", 1);
                                        v131 = (void *)objc_claimAutoreleasedReturnValue();
                                        objc_msgSend(v9, "objectAtIndex:", 2);
                                        v8 = (id)objc_claimAutoreleasedReturnValue();
                                        v132 = CFSTR("details");
                                        if (v8 == v132)
                                        {

                                        }
                                        else
                                        {
                                          v133 = v132;
                                          if (!v8 || !v132)
                                          {

                                            v160 = v8;
                                            goto LABEL_255;
                                          }
                                          v134 = -[NSObject isEqualToString:](v8, "isEqualToString:", v132);

                                          if (!v134)
                                            goto LABEL_256;
                                        }
                                        +[PKAccountService sharedInstance](PKAccountService, "sharedInstance");
                                        v159 = (void *)objc_claimAutoreleasedReturnValue();
                                        v237[0] = MEMORY[0x1E0C809B0];
                                        v237[1] = 3221225472;
                                        v237[2] = __80__PKSettingsDeepLinkController_handleDeepLinkResourceDictionary_withCompletion___block_invoke_19;
                                        v237[3] = &unk_1E2AC7D60;
                                        v238 = v230;
                                        v239 = WeakRetained;
                                        objc_msgSend(v159, "accountWithVirtualCardIdentifier:completion:", v131, v237);

                                        v160 = v238;
LABEL_255:

LABEL_256:
LABEL_257:

LABEL_292:
                                        v7 = v227;
                                        goto LABEL_293;
                                      }
LABEL_221:
                                      v139 = v122;
                                      v140 = CFSTR("setup");
                                      if (v139 == v140)
                                      {

                                      }
                                      else
                                      {
                                        v141 = v140;
                                        if (!v11 || !v140)
                                        {

                                          goto LABEL_234;
                                        }
                                        v142 = -[__CFString isEqualToString:](v139, "isEqualToString:", v140);

                                        if (!v142)
                                        {
LABEL_234:
                                          v149 = v139;
                                          v150 = CFSTR("express_transit_settings");
                                          if (v149 == v150)
                                          {

                                          }
                                          else
                                          {
                                            v151 = v150;
                                            if (!v11 || !v150)
                                            {

LABEL_259:
                                              v162 = v149;
                                              v163 = CFSTR("importSafariCardConsent");
                                              if (v162 == v163)
                                              {

                                              }
                                              else
                                              {
                                                v164 = v163;
                                                if (!v11 || !v163)
                                                {

LABEL_297:
                                                  v178 = v162;
                                                  v179 = CFSTR("addPaymentCard");
                                                  if (v178 == v179)
                                                  {

                                                  }
                                                  else
                                                  {
                                                    v180 = v179;
                                                    if (!v11 || !v179)
                                                    {

LABEL_321:
                                                      if (-[__CFString isEqual:](v178, "isEqual:", CFSTR("payLaterFinancingPlan")))
                                                      {
                                                        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("transactionIdentifier"));
                                                        v54 = (void *)objc_claimAutoreleasedReturnValue();
                                                        if (!v54)
                                                        {
                                                          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
                                                          {
                                                            *(_DWORD *)buf = 138412290;
                                                            v247 = v6;
                                                            _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "PKPassbookDeepLinkController: Unhandled evaluation of Settings url from resource dictionary: %@\nPay Later financing plan was not defined on the URL", buf, 0xCu);
                                                          }

                                                        }
                                                        goto LABEL_372;
                                                      }
                                                      v198 = v178;
                                                      v199 = CFSTR("payLater");
                                                      if (v198 == v199)
                                                        goto LABEL_367;
                                                      v200 = v199;
                                                      if (v11 && v199)
                                                      {
                                                        v201 = -[__CFString isEqualToString:](v198, "isEqualToString:", v199);

                                                        if ((v201 & 1) != 0)
                                                          goto LABEL_368;
                                                      }
                                                      else
                                                      {

                                                      }
                                                      v205 = v198;
                                                      v206 = CFSTR("fps");
                                                      if (v205 == v206)
                                                      {
LABEL_367:

                                                      }
                                                      else
                                                      {
                                                        v207 = v206;
                                                        if (!v11 || !v206)
                                                        {

                                                          goto LABEL_376;
                                                        }
                                                        v208 = -[__CFString isEqualToString:](v205, "isEqualToString:", v206);

                                                        if ((v208 & 1) == 0)
                                                        {
LABEL_376:
                                                          v212 = v205;
                                                          v213 = CFSTR("hide_my_email_settings");
                                                          if (v212 == v213)
                                                          {

                                                          }
                                                          else
                                                          {
                                                            v214 = v213;
                                                            if (!v11 || !v213)
                                                            {

                                                              goto LABEL_384;
                                                            }
                                                            v215 = -[__CFString isEqualToString:](v212, "isEqualToString:", v213);

                                                            if (!v215)
                                                            {
LABEL_384:
                                                              v216 = v212;
                                                              v217 = CFSTR("bankConnect");
                                                              if (v216 == v217)
                                                              {

                                                              }
                                                              else
                                                              {
                                                                v218 = v217;
                                                                if (!v11 || !v217)
                                                                {

                                                                  goto LABEL_394;
                                                                }
                                                                v219 = -[__CFString isEqualToString:](v216, "isEqualToString:", v217);

                                                                if (!v219)
                                                                {
LABEL_394:
                                                                  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
                                                                  {
                                                                    *(_DWORD *)buf = 138412290;
                                                                    v247 = v6;
                                                                    _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "PKPassbookDeepLinkController: Unhandled evaluation of unexpected Settings URL in resource dictionary: %@", buf, 0xCu);
                                                                  }
                                                                  goto LABEL_291;
                                                                }
                                                              }
                                                              if (!objc_msgSend(v228, "hasSuffix:", CFSTR("/issuer/authorization")))
                                                              {
                                                                v7 = v227;
                                                                v21 = WeakRetained;
                                                                v15 = v230;
                                                                if (!v225)
                                                                  goto LABEL_127;
                                                                objc_msgSend(v9, "objectAtIndex:", 1);
                                                                v222 = (void *)objc_claimAutoreleasedReturnValue();
                                                                if (v224)
                                                                {
                                                                  objc_msgSend(v9, "objectAtIndex:", 2);
                                                                  v223 = (void *)objc_claimAutoreleasedReturnValue();
                                                                }
                                                                else
                                                                {
                                                                  v223 = 0;
                                                                }
                                                                v21 = WeakRetained;
                                                                v7 = v227;
                                                                objc_msgSend(WeakRetained, "presentBankConnectManagementForInstitution:accountIdentifier:completion:", v222, v223, v227);

                                                                goto LABEL_24;
                                                              }
                                                              v220 = (void *)MEMORY[0x1E0C99E98];
                                                              objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("redirectURL"));
                                                              v221 = (void *)objc_claimAutoreleasedReturnValue();
                                                              objc_msgSend(v220, "URLWithString:", v221);
                                                              v131 = (void *)objc_claimAutoreleasedReturnValue();

                                                              if (v131)
                                                              {
                                                                objc_msgSend(WeakRetained, "presentAuthorizationFlowWithRedirectURL:completion:animated:", v131, v227, 0);
                                                                goto LABEL_257;
                                                              }
                                                              if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
                                                              {
                                                                *(_WORD *)buf = 0;
                                                                _os_log_error_impl(&dword_18FC92000, v8, OS_LOG_TYPE_ERROR, "Failed to handle BankConnect auth redirect. The redirectURL is nil.", buf, 2u);
                                                              }
                                                              goto LABEL_256;
                                                            }
                                                          }
                                                          v131 = objc_loadWeakRetained((id *)&self->_delegate);
                                                          objc_msgSend(v131, "openTransactionDefaultsEmailSettings");
                                                          goto LABEL_257;
                                                        }
                                                      }
LABEL_368:
                                                      v209 = objc_msgSend(v9, "indexOfObject:", CFSTR("loan"));
                                                      if (v209 == 0x7FFFFFFFFFFFFFFFLL
                                                        || (v210 = v209 + 1,
                                                            v209 + 1 >= (unint64_t)objc_msgSend(v9, "count")))
                                                      {
                                                        v54 = 0;
                                                      }
                                                      else
                                                      {
                                                        objc_msgSend(v9, "objectAtIndexedSubscript:", v210);
                                                        v54 = (void *)objc_claimAutoreleasedReturnValue();
                                                      }
LABEL_372:
                                                      v211 = self;
                                                      v21 = WeakRetained;
                                                      v15 = v230;
                                                      -[PKSettingsDeepLinkController _presentPayLaterPassOrFinancingPlanWithIdenifier:dataSource:delegate:](v211, "_presentPayLaterPassOrFinancingPlanWithIdenifier:dataSource:delegate:", v54, v230, WeakRetained);
                                                      goto LABEL_125;
                                                    }
                                                    v181 = -[__CFString isEqualToString:](v178, "isEqualToString:", v179);

                                                    if (!v181)
                                                      goto LABEL_321;
                                                  }
                                                  v161 = objc_alloc_init(PKPaymentService);
                                                  -[PKPaymentService clearSafariCardImportNotificationsWithCompletion:](v161, "clearSafariCardImportNotificationsWithCompletion:", 0);
                                                  v21 = WeakRetained;
                                                  objc_msgSend(WeakRetained, "openPaymentSetupWithMode:referrerIdentifier:allowedFeatureIdentifiers:", 0, 0, 0);
                                                  goto LABEL_319;
                                                }
                                                v165 = -[__CFString isEqualToString:](v162, "isEqualToString:", v163);

                                                if (!v165)
                                                  goto LABEL_297;
                                              }
                                              v161 = objc_alloc_init(PKPaymentService);
                                              -[PKPaymentService clearSafariCardImportNotificationsWithCompletion:](v161, "clearSafariCardImportNotificationsWithCompletion:", 0);
                                              v21 = WeakRetained;
                                              objc_msgSend(WeakRetained, "presentImportSafariCardConsentAnimated:completion:", 1, 0);
LABEL_319:

                                              goto LABEL_23;
                                            }
                                            v152 = -[__CFString isEqualToString:](v149, "isEqualToString:", v150);

                                            if (!v152)
                                              goto LABEL_259;
                                          }
                                          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("passUniqueID"));
                                          v161 = (PKPaymentService *)objc_claimAutoreleasedReturnValue();
                                          v21 = WeakRetained;
                                          objc_msgSend(WeakRetained, "openExpressTransitSettingsForPassUniqueIdentifier:", v161);
                                          goto LABEL_319;
                                        }
                                      }
                                      objc_msgSend(v6, "objectForKey:", CFSTR("referrer"));
                                      v143 = (void *)objc_claimAutoreleasedReturnValue();
                                      -[PKSettingsDeepLinkController _percentEncodeReferrerIdentifier:](self, "_percentEncodeReferrerIdentifier:", v143);
                                      v144 = (void *)objc_claimAutoreleasedReturnValue();

                                      if (v10 < 3)
                                      {
                                        v154 = 0;
                                        v8 = 0;
LABEL_287:
                                        PKFeatureIdentifierToString(2);
                                        v175 = (void *)objc_claimAutoreleasedReturnValue();
                                        v176 = -[NSObject containsObject:](v8, "containsObject:", v175);

                                        if (v176)
                                        {
                                          +[PKAccountService sharedInstance](PKAccountService, "sharedInstance");
                                          v177 = (void *)objc_claimAutoreleasedReturnValue();
                                          v231[0] = MEMORY[0x1E0C809B0];
                                          v231[1] = 3221225472;
                                          v231[2] = __80__PKSettingsDeepLinkController_handleDeepLinkResourceDictionary_withCompletion___block_invoke_3;
                                          v231[3] = &unk_1E2AD5410;
                                          v232 = v230;
                                          v233 = WeakRetained;
                                          v234 = v144;
                                          v235 = v8;
                                          v236 = v154;
                                          objc_msgSend(v177, "defaultAccountForFeature:completion:", 2, v231);

                                        }
                                        else
                                        {
                                          objc_msgSend(WeakRetained, "openPaymentSetupWithMode:referrerIdentifier:allowedFeatureIdentifiers:", v154, v144, v8);
                                        }

LABEL_291:
                                        goto LABEL_292;
                                      }
                                      objc_msgSend(v9, "objectAtIndex:", 1);
                                      v145 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
                                      v146 = CFSTR("feature");
                                      if (v145 == v146)
                                      {

                                      }
                                      else
                                      {
                                        v147 = v146;
                                        if (!v145 || !v146)
                                        {

LABEL_282:
                                          v154 = 0;
                                          goto LABEL_283;
                                        }
                                        v148 = -[__CFString isEqualToString:](v145, "isEqualToString:", v146);

                                        if (!v148)
                                          goto LABEL_282;
                                      }
                                      v154 = 4;
LABEL_283:
                                      objc_msgSend(v9, "objectAtIndex:", 2);
                                      v174 = (void *)objc_claimAutoreleasedReturnValue();
                                      if (PKFeatureIdentifierFromString(v174))
                                        v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", v174, 0);
                                      else
                                        v8 = 0;

                                      goto LABEL_287;
                                    }
                                  }
                                  if (v225)
                                  {
                                    objc_msgSend(v9, "objectAtIndex:", 1);
                                    v120 = (void *)objc_claimAutoreleasedReturnValue();
                                    if (v10 != 2)
                                    {
                                      objc_msgSend(v9, "objectAtIndex:", 2);
                                      v99 = (void *)objc_claimAutoreleasedReturnValue();
                                      goto LABEL_195;
                                    }
                                  }
                                  else
                                  {
                                    v120 = 0;
                                  }
                                  v99 = 0;
LABEL_195:
                                  v100 = v120;
                                  v124 = CFSTR("details");
                                  if (v100 == v124)
                                  {

                                  }
                                  else
                                  {
                                    v125 = v124;
                                    if (!v100 || !v124)
                                    {

                                      goto LABEL_215;
                                    }
                                    v126 = -[__CFString isEqualToString:](v100, "isEqualToString:", v124);

                                    if (!v126)
                                    {
LABEL_215:
                                      v135 = v100;
                                      v136 = CFSTR("documents");
                                      if (v135 == v136)
                                      {

                                      }
                                      else
                                      {
                                        v137 = v136;
                                        if (!v100 || !v136)
                                        {

                                          goto LABEL_243;
                                        }
                                        v138 = -[__CFString isEqualToString:](v135, "isEqualToString:", v136);

                                        if ((v138 & 1) == 0)
                                        {
LABEL_243:
                                          v155 = v135;
                                          v156 = CFSTR("addMoney");
                                          if (v155 == v156)
                                          {

                                          }
                                          else
                                          {
                                            v157 = v156;
                                            if (!v100 || !v156)
                                            {

                                              goto LABEL_272;
                                            }
                                            v158 = -[__CFString isEqualToString:](v155, "isEqualToString:", v156);

                                            if ((v158 & 1) == 0)
                                            {
LABEL_272:
                                              v170 = v155;
                                              v171 = CFSTR("withdrawMoney");
                                              if (v170 == v171)
                                              {

                                              }
                                              else
                                              {
                                                v172 = v171;
                                                if (!v100 || !v171)
                                                {

LABEL_310:
                                                  v186 = v170;
                                                  v187 = CFSTR("fccStepUp");
                                                  if (v186 == v187)
                                                  {

                                                  }
                                                  else
                                                  {
                                                    v188 = v187;
                                                    if (!v100 || !v187)
                                                    {

LABEL_329:
                                                      v190 = v186;
                                                      v191 = CFSTR("bankVerification");
                                                      if (v190 == v191)
                                                      {

                                                        goto LABEL_347;
                                                      }
                                                      v192 = v191;
                                                      if (v100 && v191)
                                                      {
                                                        v193 = -[__CFString isEqualToString:](v190, "isEqualToString:", v191);

                                                        if (!v193)
                                                          goto LABEL_356;
LABEL_347:
                                                        if (v10 < 3)
                                                        {
                                                          v105 = 0;
                                                        }
                                                        else
                                                        {
                                                          objc_msgSend(v9, "objectAtIndex:", 2);
                                                          v105 = (void *)objc_claimAutoreleasedReturnValue();
                                                        }
                                                        v153 = 12;
                                                        goto LABEL_357;
                                                      }

                                                      goto LABEL_355;
                                                    }
                                                    v189 = -[__CFString isEqualToString:](v186, "isEqualToString:", v187);

                                                    if ((v189 & 1) == 0)
                                                      goto LABEL_329;
                                                  }
                                                  v105 = 0;
                                                  v153 = 11;
LABEL_357:
                                                  v7 = v227;
                                                  v21 = WeakRetained;
                                                  v15 = v230;
                                                  objc_msgSend(WeakRetained, "presentAccountForFeature:destination:fundingSourceIdentifier:animated:", 5, v153, v105, 1);
                                                  goto LABEL_358;
                                                }
                                                v173 = -[__CFString isEqualToString:](v170, "isEqualToString:", v171);

                                                if ((v173 & 1) == 0)
                                                  goto LABEL_310;
                                              }
                                              v105 = 0;
                                              v153 = 3;
                                              goto LABEL_357;
                                            }
                                          }
                                          v105 = 0;
                                          v153 = 2;
                                          goto LABEL_357;
                                        }
                                      }
                                      v105 = 0;
                                      v153 = 6;
                                      goto LABEL_357;
                                    }
                                  }
                                  if (!v99)
                                    goto LABEL_356;
                                  v127 = v99;
                                  v128 = CFSTR("addBankAccount");
                                  if (v127 == v128)
                                  {

                                  }
                                  else
                                  {
                                    v129 = v128;
                                    if (!v128)
                                    {

                                      goto LABEL_267;
                                    }
                                    v130 = -[__CFString isEqualToString:](v127, "isEqualToString:", v128);

                                    if ((v130 & 1) == 0)
                                    {
LABEL_267:
                                      v166 = v127;
                                      v167 = CFSTR("accountInfo");
                                      if (v166 == v167)
                                      {

                                      }
                                      else
                                      {
                                        v168 = v167;
                                        if (!v167)
                                        {

                                          goto LABEL_305;
                                        }
                                        v169 = -[__CFString isEqualToString:](v166, "isEqualToString:", v167);

                                        if ((v169 & 1) == 0)
                                        {
LABEL_305:
                                          v182 = v166;
                                          v183 = CFSTR("businessChat");
                                          if (v182 == v183)
                                          {

                                          }
                                          else
                                          {
                                            v184 = v183;
                                            if (!v183)
                                            {

                                              goto LABEL_335;
                                            }
                                            v185 = -[__CFString isEqualToString:](v182, "isEqualToString:", v183);

                                            if ((v185 & 1) == 0)
                                            {
LABEL_335:
                                              v194 = v182;
                                              v195 = CFSTR("accountNumbers");
                                              if (v194 == v195)
                                              {

                                              }
                                              else
                                              {
                                                v196 = v195;
                                                if (!v195)
                                                {

LABEL_351:
                                                  v190 = v194;
                                                  v202 = CFSTR("addBeneficiary");
                                                  if (v190 == v202)
                                                  {

                                                    goto LABEL_374;
                                                  }
                                                  v203 = v202;
                                                  if (!v202)
                                                  {
LABEL_355:

                                                    goto LABEL_356;
                                                  }
                                                  v204 = -[__CFString isEqualToString:](v190, "isEqualToString:", v202);

                                                  if (v204)
                                                  {
LABEL_374:
                                                    v105 = 0;
                                                    v153 = 13;
                                                    goto LABEL_357;
                                                  }
LABEL_356:
                                                  v105 = 0;
                                                  v153 = 1;
                                                  goto LABEL_357;
                                                }
                                                v197 = -[__CFString isEqualToString:](v194, "isEqualToString:", v195);

                                                if ((v197 & 1) == 0)
                                                  goto LABEL_351;
                                              }
                                              v105 = 0;
                                              v153 = 10;
                                              goto LABEL_357;
                                            }
                                          }
                                          v105 = 0;
                                          v153 = 7;
                                          goto LABEL_357;
                                        }
                                      }
                                      v105 = 0;
                                      v153 = 5;
                                      goto LABEL_357;
                                    }
                                  }
                                  v105 = 0;
                                  v153 = 4;
                                  goto LABEL_357;
                                }
                              }
                              +[PKAccountService sharedInstance](PKAccountService, "sharedInstance");
                              v114 = (void *)objc_claimAutoreleasedReturnValue();
                              v240[0] = MEMORY[0x1E0C809B0];
                              v240[1] = 3221225472;
                              v240[2] = __80__PKSettingsDeepLinkController_handleDeepLinkResourceDictionary_withCompletion___block_invoke;
                              v240[3] = &unk_1E2AD5410;
                              v241 = v6;
                              v15 = v230;
                              v242 = v230;
                              v245 = v10;
                              v243 = v9;
                              v21 = WeakRetained;
                              v244 = WeakRetained;
                              objc_msgSend(v114, "defaultAccountForFeature:completion:", 2, v240);

                              goto LABEL_126;
                            }
                          }
                          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("date"));
                          v98 = (void *)objc_claimAutoreleasedReturnValue();
                          v99 = v98;
                          if (!v98)
                            goto LABEL_157;
                          _PKParseW3CDTSCompleteDatePlusHoursMinutesAndOptionalSeconds(v98, 0, 0);
                          v100 = (__CFString *)objc_claimAutoreleasedReturnValue();
                          if (!v100)
                          {
                            v101 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
                            objc_msgSend(v101, "setFormatOptions:", 275);
                            objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
                            v102 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v102, "timeZone");
                            v103 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v101, "setTimeZone:", v103);

                            objc_msgSend(v101, "dateFromString:", v99);
                            v100 = (__CFString *)objc_claimAutoreleasedReturnValue();

                            if (!v100)
                            {
LABEL_157:
                              objc_msgSend(MEMORY[0x1E0C99D68], "date");
                              v100 = (__CFString *)objc_claimAutoreleasedReturnValue();
                            }
                          }
                          objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
                          v104 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v104, "components:fromDate:", 30, v100);
                          v105 = (void *)objc_claimAutoreleasedReturnValue();

                          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("redemptionType"));
                          v106 = (void *)objc_claimAutoreleasedReturnValue();
                          v107 = objc_msgSend(v106, "integerValue");

                          v108 = v107 == 3;
                          v15 = v230;
                          if (v107 >= 3)
                          {
                            v7 = v227;
                            v21 = WeakRetained;
                            if (v108)
                              objc_msgSend(WeakRetained, "openDailyCashForDateComponents:feature:", v105, 5);
                          }
                          else
                          {
                            objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("passUniqueID"));
                            v109 = (void *)objc_claimAutoreleasedReturnValue();
                            v7 = v227;
                            if (v109)
                              objc_msgSend(v230, "paymentPassWithUniqueIdentifier:", v109);
                            else
                              objc_msgSend(v230, "peerPaymentPass");
                            v119 = (void *)objc_claimAutoreleasedReturnValue();
                            if (!v119)
                            {

LABEL_293:
                              v21 = WeakRetained;
                              goto LABEL_24;
                            }
                            objc_msgSend(WeakRetained, "openDailyCashForDateComponents:onPass:", v105, v119);

                            v21 = WeakRetained;
                            v15 = v230;
                          }
LABEL_358:

                          goto LABEL_127;
                        }
                      }
                      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("setupAmount"));
                      v86 = objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("setupCurreny"));
                      v87 = (NSString *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("setupFlowState"));
                      v88 = (void *)objc_claimAutoreleasedReturnValue();
                      v89 = PKPeerPaymentRegistrationFlowStateFromString(v88);

                      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("setupSenderAddress"));
                      v90 = (void *)objc_claimAutoreleasedReturnValue();
                      v226 = (void *)v86;
                      objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithString:", v86);
                      v91 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
                      v92 = v91;
                      v93 = 0;
                      if (v91)
                      {
                        v7 = v227;
                        if (v87)
                        {
                          PKCurrencyAmountCreate(v91, v87, 0);
                          v93 = (void *)objc_claimAutoreleasedReturnValue();
                        }
                      }
                      else
                      {
                        v7 = v227;
                      }
                      v21 = WeakRetained;
                      objc_msgSend(WeakRetained, "openPeerPaymentSetupWithCurrencyAmount:state:senderAddress:", v93, v89, v90);

                      goto LABEL_24;
                    }
                  }
                  v15 = v230;
                  objc_msgSend(v230, "peerPaymentPass");
                  v54 = (void *)objc_claimAutoreleasedReturnValue();
                  v21 = WeakRetained;
                  v55 = WeakRetained;
                  v56 = v54;
                  v57 = 3;
LABEL_124:
                  objc_msgSend(v55, "presentPassDetailsViewControllerForPass:presentationStyle:presentingView:animated:", v56, 2, v57, 0);
LABEL_125:

LABEL_126:
                  v7 = v227;
                  goto LABEL_127;
                }
                v65 = -[__CFString isEqualToString:](v62, "isEqualToString:", v63);

                if (!v65)
                  goto LABEL_100;
              }
              v15 = v230;
              objc_msgSend(v230, "peerPaymentPass");
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              v21 = WeakRetained;
              v55 = WeakRetained;
              v56 = v54;
              v57 = 5;
              goto LABEL_124;
            }
          }
          v15 = v230;
          objc_msgSend(v230, "peerPaymentPass");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = WeakRetained;
          v55 = WeakRetained;
          v56 = v54;
          v57 = 4;
          goto LABEL_124;
        }
      }
      if ((unint64_t)objc_msgSend(v9, "count") < 2)
      {
        v42 = 0;
      }
      else
      {
        objc_msgSend(v9, "objectAtIndex:", 1);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v7 = v227;
      v15 = v230;
      v16 = v42;
      v47 = CFSTR("autoReload");
      if (v16 == v47)
      {

      }
      else
      {
        v48 = v47;
        if (!v16 || !v47)
        {

          goto LABEL_81;
        }
        v49 = -[__CFString isEqualToString:](v16, "isEqualToString:", v47);

        if (!v49)
        {
LABEL_81:
          if (!v225)
            goto LABEL_109;
          objc_msgSend(v9, "objectAtIndex:", 1);
          v58 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
          v59 = CFSTR("recurringPayment");
          if (v58 == v59)
          {

          }
          else
          {
            v60 = v59;
            if (!v58 || !v59)
            {

              goto LABEL_109;
            }
            v61 = -[__CFString isEqualToString:](v58, "isEqualToString:", v59);

            if (!v61)
            {
LABEL_109:
              v70 = v16;
              v71 = CFSTR("cardInformation");
              if (v70 == v71)
              {

              }
              else
              {
                v72 = v71;
                if (!v16 || !v71)
                {

                  goto LABEL_117;
                }
                v73 = -[__CFString isEqualToString:](v70, "isEqualToString:", v71);

                if (!v73)
                {
LABEL_117:
                  v77 = v70;
                  v78 = CFSTR("transferToBank");
                  if (v77 == v78)
                  {

                  }
                  else
                  {
                    v79 = v78;
                    if (!v16 || !v78)
                    {

LABEL_139:
                      objc_msgSend(v230, "peerPaymentPass");
                      v53 = (void *)objc_claimAutoreleasedReturnValue();
                      v21 = WeakRetained;
                      v74 = WeakRetained;
                      v75 = v53;
                      v76 = 0;
                      goto LABEL_140;
                    }
                    v80 = -[__CFString isEqualToString:](v77, "isEqualToString:", v78);

                    if (!v80)
                      goto LABEL_139;
                  }
                  objc_msgSend(v230, "peerPaymentPass");
                  v53 = (void *)objc_claimAutoreleasedReturnValue();
                  v21 = WeakRetained;
                  objc_msgSend(WeakRetained, "presentPeerPaymentTransferToBankWithPass:", v53);
LABEL_141:
                  v7 = v227;
                  goto LABEL_142;
                }
              }
              objc_msgSend(v230, "peerPaymentPass");
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              v21 = WeakRetained;
              v74 = WeakRetained;
              v75 = v53;
              v76 = 1;
LABEL_140:
              objc_msgSend(v74, "presentPassDetailsViewControllerForPass:presentationStyle:presentingView:animated:", v75, 2, v76, 1);
              goto LABEL_141;
            }
          }
          if (v10 < 3)
          {
            v53 = 0;
          }
          else
          {
            objc_msgSend(v9, "objectAtIndex:", 2);
            v53 = (void *)objc_claimAutoreleasedReturnValue();
          }
          v7 = v227;
          v21 = WeakRetained;
          objc_msgSend(v230, "peerPaymentPass");
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(WeakRetained, "presentPeerPaymentRecurringPaymentWithPass:presentationStyle:recurringPaymentIdentifier:animated:", v81, 2, v53, 1);

          goto LABEL_142;
        }
      }
      objc_msgSend(v230, "peerPaymentPass");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = WeakRetained;
      objc_msgSend(WeakRetained, "presentPassDetailsViewControllerForPass:presentationStyle:presentingView:animated:", v53, 2, 16, 1);
LABEL_142:

      goto LABEL_20;
    }
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("transactionIdentifier"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("serviceIdentifier"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("transactionSourceIdentifier"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v35, "length"))
  {
    -[PKSettingsDeepLinkController _presentTransactionDetailsForTransactionWithIdentifier:](self, "_presentTransactionDetailsForTransactionWithIdentifier:", v35);
    v7 = v227;
  }
  else
  {
    v7 = v227;
    if (objc_msgSend(v36, "length"))
    {
      -[PKSettingsDeepLinkController _presentTransactionDetailsForTransactionWithServiceIdentifier:transactionSourceIdentifier:](self, "_presentTransactionDetailsForTransactionWithServiceIdentifier:transactionSourceIdentifier:", v36, v37);
    }
    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v247 = v6;
        _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "PKPassbookDeepLinkController: Unhandled evaluation of Settings transaction url. Couldn't find transactionID or serviceID. Resource dictionary: %@", buf, 0xCu);
      }

    }
  }
  v15 = v230;

  v21 = WeakRetained;
LABEL_127:

}

void __80__PKSettingsDeepLinkController_handleDeepLinkResourceDictionary_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  _QWORD v11[4];
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __80__PKSettingsDeepLinkController_handleDeepLinkResourceDictionary_withCompletion___block_invoke_16;
    v11[3] = &unk_1E2AD50A8;
    v12 = v5;
    v13 = *(id *)(a1 + 40);
    v7 = *(id *)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 64);
    v14 = v7;
    v17 = v8;
    v15 = *(id *)(a1 + 48);
    v16 = *(id *)(a1 + 56);
    dispatch_async(MEMORY[0x1E0C80D38], v11);

    v9 = v12;
  }
  else
  {
    PKLogFacilityTypeGetObject(0);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v19 = v10;
      v20 = 2112;
      v21 = v6;
      _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "PKPassbookDeepLinkController: Unhandled evaluation of Settings url from resource dictionary: %@\nApple Card account returned nil with error: %@", buf, 0x16u);
    }
  }

}

void __80__PKSettingsDeepLinkController_handleDeepLinkResourceDictionary_withCompletion___block_invoke_16(uint64_t a1)
{
  void *v2;
  void *v3;
  __CFString *v4;
  __CFString *v5;
  __CFString *v6;
  int v7;
  NSObject *v8;
  uint64_t v9;
  __CFString *v10;
  __CFString *v11;
  __CFString *v12;
  char v13;
  uint64_t v14;
  __CFString *v15;
  __CFString *v16;
  int v17;
  __CFString *v18;
  __CFString *v19;
  __CFString *v20;
  char v21;
  void *v22;
  void *v23;
  uint64_t v24;
  __CFString *v25;
  __CFString *v26;
  int v27;
  __CFString *v28;
  __CFString *v29;
  __CFString *v30;
  char v31;
  uint64_t v32;
  __CFString *v33;
  __CFString *v34;
  int v35;
  __CFString *v36;
  __CFString *v37;
  __CFString *v38;
  char v39;
  NSObject *v40;
  __CFString *v41;
  __CFString *v42;
  int v43;
  __CFString *v44;
  __CFString *v45;
  __CFString *v46;
  char v47;
  __CFString *v48;
  __CFString *v49;
  int v50;
  __CFString *v51;
  __CFString *v52;
  __CFString *v53;
  int v54;
  uint64_t v55;
  int v56;
  uint64_t v57;
  __int16 v58;
  NSObject *v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "associatedPassUniqueID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "paymentPassWithUniqueIdentifier:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    PKLogFacilityTypeGetObject(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 48);
      v56 = 138412290;
      v57 = v9;
      _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "PKPassbookDeepLinkController: Unhandled evaluation of Settings url from resource dictionary: %@\nApple Card account pass was nil", (uint8_t *)&v56, 0xCu);
    }
    goto LABEL_112;
  }
  PKSetPassDetailsLastSelectedSegment(CFSTR("info"));
  if (*(_QWORD *)(a1 + 72) <= 1uLL)
  {
    v4 = CFSTR("details");
    goto LABEL_11;
  }
  objc_msgSend(*(id *)(a1 + 56), "objectAtIndex:", 1);
  v4 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
  v5 = CFSTR("details");
  if (v4 == v5)
  {
LABEL_11:

    goto LABEL_12;
  }
  v6 = v5;
  if (!v4 || !v5)
  {

    goto LABEL_20;
  }
  v7 = -[__CFString isEqualToString:](v4, "isEqualToString:", v5);

  if (v7)
  {
LABEL_12:
    v8 = v4;
    if (*(_QWORD *)(a1 + 72) < 3uLL)
    {
      v14 = 0;
LABEL_110:
      v22 = *(void **)(a1 + 64);
      v23 = v3;
      v24 = v14;
      v32 = 1;
      goto LABEL_111;
    }
    objc_msgSend(*(id *)(a1 + 56), "objectAtIndex:", 2);
    v10 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
    v11 = CFSTR("makeDefaultAtApple");
    if (v10 == v11)
    {

    }
    else
    {
      v12 = v11;
      if (!v10 || !v11)
      {

        goto LABEL_28;
      }
      v13 = -[__CFString isEqualToString:](v10, "isEqualToString:", v11);

      if ((v13 & 1) == 0)
      {
LABEL_28:
        v18 = v10;
        v19 = CFSTR("scheduledPayments");
        if (v18 == v19)
        {

        }
        else
        {
          v20 = v19;
          if (!v10 || !v19)
          {

            goto LABEL_44;
          }
          v21 = -[__CFString isEqualToString:](v18, "isEqualToString:", v19);

          if ((v21 & 1) == 0)
          {
LABEL_44:
            v28 = v18;
            v29 = CFSTR("order");
            if (v28 == v29)
            {

            }
            else
            {
              v30 = v29;
              if (!v10 || !v29)
              {

                goto LABEL_61;
              }
              v31 = -[__CFString isEqualToString:](v28, "isEqualToString:", v29);

              if ((v31 & 1) == 0)
              {
LABEL_61:
                v36 = v28;
                v37 = CFSTR("replace");
                if (v36 == v37)
                {

                }
                else
                {
                  v38 = v37;
                  if (!v10 || !v37)
                  {

                    goto LABEL_80;
                  }
                  v39 = -[__CFString isEqualToString:](v36, "isEqualToString:", v37);

                  if ((v39 & 1) == 0)
                  {
LABEL_80:
                    v44 = v36;
                    v45 = CFSTR("track");
                    if (v44 == v45)
                    {

                    }
                    else
                    {
                      v46 = v45;
                      if (!v10 || !v45)
                      {

LABEL_96:
                        v51 = v44;
                        v52 = CFSTR("activate");
                        if (v51 == v52)
                        {

                        }
                        else
                        {
                          v53 = v52;
                          if (!v10 || !v52)
                          {

LABEL_108:
                            v14 = 0;
                            goto LABEL_109;
                          }
                          v54 = -[__CFString isEqualToString:](v51, "isEqualToString:", v52);

                          if (!v54)
                            goto LABEL_108;
                        }
                        v14 = 13;
LABEL_109:

                        goto LABEL_110;
                      }
                      v47 = -[__CFString isEqualToString:](v44, "isEqualToString:", v45);

                      if ((v47 & 1) == 0)
                        goto LABEL_96;
                    }
                    v14 = 14;
                    goto LABEL_109;
                  }
                }
                v14 = 17;
                goto LABEL_109;
              }
            }
            v14 = 12;
            goto LABEL_109;
          }
        }
        v14 = 6;
        goto LABEL_109;
      }
    }
    v14 = 11;
    goto LABEL_109;
  }
LABEL_20:
  v8 = v4;
  v15 = CFSTR("balance");
  if (v8 == v15)
  {

    goto LABEL_34;
  }
  v16 = v15;
  if (!v4 || !v15)
  {

    goto LABEL_36;
  }
  v17 = -[NSObject isEqualToString:](v8, "isEqualToString:", v15);

  if (v17)
  {
LABEL_34:
    v22 = *(void **)(a1 + 64);
    v23 = v3;
    v24 = 7;
LABEL_51:
    v32 = 0;
LABEL_111:
    objc_msgSend(v22, "presentPassDetailsViewControllerForPass:presentationStyle:presentingView:animated:", v23, 2, v24, v32);
    goto LABEL_112;
  }
LABEL_36:
  v8 = v8;
  v25 = CFSTR("billPayment");
  if (v8 == v25)
  {

LABEL_50:
    v22 = *(void **)(a1 + 64);
    v23 = v3;
    v24 = 9;
    goto LABEL_51;
  }
  v26 = v25;
  if (!v4 || !v25)
  {

    goto LABEL_53;
  }
  v27 = -[NSObject isEqualToString:](v8, "isEqualToString:", v25);

  if (v27)
    goto LABEL_50;
LABEL_53:
  v8 = v8;
  v33 = CFSTR("statement");
  if (v8 == v33)
  {

LABEL_67:
    if (*(_QWORD *)(a1 + 72) >= 3uLL)
    {
      objc_msgSend(*(id *)(a1 + 56), "objectAtIndex:", 2);
      v40 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 64), "presentStatementDetailsViewControllerForPass:presentationStyle:withIdentifier:animated:", v3, 2, v40, 0);
LABEL_104:

      goto LABEL_112;
    }
    goto LABEL_70;
  }
  v34 = v33;
  if (!v4 || !v33)
  {

    goto LABEL_70;
  }
  v35 = -[NSObject isEqualToString:](v8, "isEqualToString:", v33);

  if (v35)
    goto LABEL_67;
LABEL_70:
  v8 = v8;
  v41 = CFSTR("installment");
  if (v8 == v41)
  {

    goto LABEL_78;
  }
  v42 = v41;
  if (v4 && v41)
  {
    v43 = -[NSObject isEqualToString:](v8, "isEqualToString:", v41);

    if (!v43)
      goto LABEL_86;
LABEL_78:
    objc_msgSend(*(id *)(a1 + 64), "presentInstallmentPlansDetailsViewControllerForPass:presentationStyle:forFeature:animated:", v3, 2, 2, 0);
    goto LABEL_112;
  }

LABEL_86:
  v8 = v8;
  v48 = CFSTR("numbers");
  if (v8 == v48)
  {

  }
  else
  {
    v49 = v48;
    if (!v4 || !v48)
    {

      goto LABEL_102;
    }
    v50 = -[NSObject isEqualToString:](v8, "isEqualToString:", v48);

    if (!v50)
    {
LABEL_102:
      PKLogFacilityTypeGetObject(0);
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        v55 = *(_QWORD *)(a1 + 48);
        v56 = 138412546;
        v57 = v55;
        v58 = 2112;
        v59 = v8;
        _os_log_impl(&dword_18FC92000, v40, OS_LOG_TYPE_DEFAULT, "PKPassbookDeepLinkController: Failed to handle url from resource dictionary: %@\nApple Card destination (%@) is not supported.", (uint8_t *)&v56, 0x16u);
      }
      goto LABEL_104;
    }
  }
  objc_msgSend(*(id *)(a1 + 64), "presentCreditPaymentPassNumbersViewControllerForPass:presentationStyle:animated:", v3, 2, 0);
LABEL_112:

}

void __80__PKSettingsDeepLinkController_handleDeepLinkResourceDictionary_withCompletion___block_invoke_19(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;
  id v7;
  id v8;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__PKSettingsDeepLinkController_handleDeepLinkResourceDictionary_withCompletion___block_invoke_2;
  block[3] = &unk_1E2ABE0F8;
  v6 = v3;
  v7 = *(id *)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __80__PKSettingsDeepLinkController_handleDeepLinkResourceDictionary_withCompletion___block_invoke_2(id *a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1[4], "associatedPassUniqueID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "length");
  v3 = v5;
  if (v2)
  {
    objc_msgSend(a1[5], "paymentPassWithUniqueIdentifier:", v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend(a1[6], "presentPassDetailsViewControllerForPass:presentationStyle:presentingView:animated:", v4, 1, 0, 0);
    }
    else if (PKSecureElementIsAvailable())
    {
      objc_msgSend(a1[6], "presentAppleCardUpsellAlertForAccount:", a1[4]);
    }

    v3 = v5;
  }

}

void __80__PKSettingsDeepLinkController_handleDeepLinkResourceDictionary_withCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __80__PKSettingsDeepLinkController_handleDeepLinkResourceDictionary_withCompletion___block_invoke_4;
  v7[3] = &unk_1E2AD50A8;
  v8 = v3;
  v9 = *(id *)(a1 + 32);
  v10 = *(id *)(a1 + 40);
  v11 = *(id *)(a1 + 48);
  v4 = *(id *)(a1 + 56);
  v5 = *(_QWORD *)(a1 + 64);
  v12 = v4;
  v13 = v5;
  v6 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

void __80__PKSettingsDeepLinkController_handleDeepLinkResourceDictionary_withCompletion___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    v3 = *(void **)(a1 + 40);
    objc_msgSend(v2, "associatedPassUniqueID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "paymentPassWithUniqueIdentifier:", v4);
    v6 = (id)objc_claimAutoreleasedReturnValue();

    v5 = *(void **)(a1 + 48);
    if (v6)
      objc_msgSend(v5, "presentPassDetailsViewControllerForPass:presentationStyle:presentingView:animated:", v6, 1, 0, 1);
    else
      objc_msgSend(v5, "openPaymentSetupWithMode:referrerIdentifier:allowedFeatureIdentifiers:", 0, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "openPaymentSetupWithMode:referrerIdentifier:allowedFeatureIdentifiers:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
  }
}

- (void)_presentTransactionDetailsForTransactionWithIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  PKPaymentService *v6;
  id WeakRetained;
  PKPaymentService *v8;
  id v9;
  _QWORD v10[4];
  PKPaymentService *v11;
  id v12;
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    PKLogFacilityTypeGetObject(6uLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v4;
      _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "PKPassbookDeepLinkController: Preparing for presentation of transaction details for transactionID %@", buf, 0xCu);
    }

    v6 = objc_alloc_init(PKPaymentService);
    objc_initWeak((id *)buf, self);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __87__PKSettingsDeepLinkController__presentTransactionDetailsForTransactionWithIdentifier___block_invoke;
    v10[3] = &unk_1E2AD5460;
    objc_copyWeak(&v13, (id *)buf);
    v8 = v6;
    v11 = v8;
    v9 = WeakRetained;
    v12 = v9;
    -[PKPaymentService transactionWithTransactionIdentifier:completion:](v8, "transactionWithTransactionIdentifier:completion:", v4, v10);

    objc_destroyWeak(&v13);
    objc_destroyWeak((id *)buf);

  }
}

void __87__PKSettingsDeepLinkController__presentTransactionDetailsForTransactionWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v3, "transactionSourceIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __87__PKSettingsDeepLinkController__presentTransactionDetailsForTransactionWithIdentifier___block_invoke_2;
    v7[3] = &unk_1E2AD5438;
    v8 = *(id *)(a1 + 40);
    v9 = v3;
    objc_msgSend(v5, "transactionSourceTypeForTransactionSourceIdentifier:completion:", v6, v7);

  }
}

void __87__PKSettingsDeepLinkController__presentTransactionDetailsForTransactionWithIdentifier___block_invoke_2(uint64_t a1, uint64_t a2)
{
  _QWORD block[4];
  id v5;
  id v6;
  uint64_t v7;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __87__PKSettingsDeepLinkController__presentTransactionDetailsForTransactionWithIdentifier___block_invoke_3;
  block[3] = &unk_1E2AC5810;
  v5 = *(id *)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  v7 = a2;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __87__PKSettingsDeepLinkController__presentTransactionDetailsForTransactionWithIdentifier___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "presentTransactionDetailsForTransaction:transactionSourceType:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_presentTransactionDetailsForTransactionWithServiceIdentifier:(id)a3 transactionSourceIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id WeakRetained;
  PKPaymentService *v10;
  NSObject *v11;
  uint64_t v12;
  id *v13;
  NSObject *v14;
  id *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  _BYTE *v19;
  _QWORD *v20;
  _QWORD v21[4];
  PKPaymentService *v22;
  id v23;
  NSObject *v24;
  _BYTE *v25;
  _QWORD *v26;
  id v27;
  _QWORD v28[4];
  NSObject *v29;
  _BYTE *v30;
  id v31;
  _QWORD v32[4];
  _QWORD v33[2];
  id v34;
  _QWORD v35[4];
  id location;
  _BYTE buf[24];
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    PKLogFacilityTypeGetObject(6uLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v6;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v7;
      _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "PKPassbookDeepLinkController: Preparing for presentation of transaction details for serviceIdentifier %@, transactionSourceIdentifier %@", buf, 0x16u);
    }

    objc_initWeak(&location, self);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v35[0] = 0;
    v35[1] = v35;
    v35[2] = 0x2020000000;
    v35[3] = 0;
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v38 = __Block_byref_object_copy__55;
    v39 = __Block_byref_object_dispose__55;
    v40 = 0;
    v10 = objc_alloc_init(PKPaymentService);
    v11 = dispatch_group_create();
    dispatch_group_enter(v11);
    dispatch_group_enter(v11);
    v12 = MEMORY[0x1E0C809B0];
    if (v7)
    {
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __122__PKSettingsDeepLinkController__presentTransactionDetailsForTransactionWithServiceIdentifier_transactionSourceIdentifier___block_invoke;
      v32[3] = &unk_1E2AD5488;
      v13 = &v34;
      objc_copyWeak(&v34, &location);
      v33[1] = v35;
      v14 = v11;
      v33[0] = v14;
      -[PKPaymentService transactionSourceTypeForTransactionSourceIdentifier:completion:](v10, "transactionSourceTypeForTransactionSourceIdentifier:completion:", v7, v32);
      dispatch_group_enter(v14);
      v28[0] = v12;
      v28[1] = 3221225472;
      v28[2] = __122__PKSettingsDeepLinkController__presentTransactionDetailsForTransactionWithServiceIdentifier_transactionSourceIdentifier___block_invoke_2;
      v28[3] = &unk_1E2AD54B0;
      objc_copyWeak(&v31, &location);
      v30 = buf;
      v29 = v14;
      -[PKPaymentService transactionWithServiceIdentifier:transactionSourceIdentifier:completion:](v10, "transactionWithServiceIdentifier:transactionSourceIdentifier:completion:", v6, v7, v28);

      objc_destroyWeak(&v31);
      v15 = (id *)v33;
    }
    else
    {
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __122__PKSettingsDeepLinkController__presentTransactionDetailsForTransactionWithServiceIdentifier_transactionSourceIdentifier___block_invoke_3;
      v21[3] = &unk_1E2AD54D8;
      v13 = &v27;
      objc_copyWeak(&v27, &location);
      v25 = buf;
      v22 = v10;
      v23 = 0;
      v26 = v35;
      v24 = v11;
      -[PKPaymentService ambiguousTransactionWithServiceIdentifier:completion:](v22, "ambiguousTransactionWithServiceIdentifier:completion:", v6, v21);

      v15 = (id *)&v22;
    }

    objc_destroyWeak(v13);
    v17[0] = v12;
    v17[1] = 3221225472;
    v17[2] = __122__PKSettingsDeepLinkController__presentTransactionDetailsForTransactionWithServiceIdentifier_transactionSourceIdentifier___block_invoke_5;
    v17[3] = &unk_1E2AD5500;
    v18 = WeakRetained;
    v19 = buf;
    v20 = v35;
    v16 = WeakRetained;
    dispatch_group_notify(v11, MEMORY[0x1E0C80D38], v17);

    _Block_object_dispose(buf, 8);
    _Block_object_dispose(v35, 8);
    objc_destroyWeak(&location);
  }

}

void __122__PKSettingsDeepLinkController__presentTransactionDetailsForTransactionWithServiceIdentifier_transactionSourceIdentifier___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __122__PKSettingsDeepLinkController__presentTransactionDetailsForTransactionWithServiceIdentifier_transactionSourceIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id WeakRetained;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __122__PKSettingsDeepLinkController__presentTransactionDetailsForTransactionWithServiceIdentifier_transactionSourceIdentifier___block_invoke_3(uint64_t a1, void *a2)
{
  id v4;
  id WeakRetained;
  void *v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  id v11;

  v4 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (WeakRetained)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a2);
  v6 = *(void **)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __122__PKSettingsDeepLinkController__presentTransactionDetailsForTransactionWithServiceIdentifier_transactionSourceIdentifier___block_invoke_4;
  v8[3] = &unk_1E2AD5488;
  objc_copyWeak(&v11, (id *)(a1 + 72));
  v10 = *(_QWORD *)(a1 + 64);
  v9 = *(id *)(a1 + 48);
  objc_msgSend(v6, "transactionSourceTypeForTransactionSourceIdentifier:completion:", v7, v8);

  objc_destroyWeak(&v11);
}

void __122__PKSettingsDeepLinkController__presentTransactionDetailsForTransactionWithServiceIdentifier_transactionSourceIdentifier___block_invoke_4(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

uint64_t __122__PKSettingsDeepLinkController__presentTransactionDetailsForTransactionWithServiceIdentifier_transactionSourceIdentifier___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "presentTransactionDetailsForTransaction:transactionSourceType:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
}

- (id)_percentEncodeReferrerIdentifier:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3500];
  v4 = a3;
  objc_msgSend(v3, "URLQueryAllowedCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v6, "removeCharactersInString:", CFSTR("=&"));
  objc_msgSend(v4, "stringByAddingPercentEncodingWithAllowedCharacters:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_presentPayLaterPassOrFinancingPlanWithIdenifier:(id)a3 dataSource:(id)a4 delegate:(id)a5
{
  id v7;
  id v8;
  id v9;
  PKAsyncUnaryOperationComposer *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  _QWORD *v22;
  _QWORD *v23;
  _QWORD *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  _QWORD *v28;
  _QWORD v29[4];
  id v30;
  id v31;
  _QWORD *v32;
  _QWORD *v33;
  _QWORD v34[5];
  id v35;
  _QWORD v36[5];
  id v37;
  _QWORD v38[5];
  id v39;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_alloc_init(PKAsyncUnaryOperationComposer);
  +[PKAccountService sharedInstance](PKAccountService, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x3032000000;
  v38[3] = __Block_byref_object_copy__55;
  v38[4] = __Block_byref_object_dispose__55;
  v39 = 0;
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x3032000000;
  v36[3] = __Block_byref_object_copy__55;
  v36[4] = __Block_byref_object_dispose__55;
  v37 = 0;
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x3032000000;
  v34[3] = __Block_byref_object_copy__55;
  v34[4] = __Block_byref_object_dispose__55;
  v35 = 0;
  v12 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __101__PKSettingsDeepLinkController__presentPayLaterPassOrFinancingPlanWithIdenifier_dataSource_delegate___block_invoke;
  v29[3] = &unk_1E2AC7408;
  v13 = v11;
  v30 = v13;
  v32 = v34;
  v33 = v38;
  v14 = v8;
  v31 = v14;
  -[PKAsyncUnaryOperationComposer addOperation:](v10, "addOperation:", v29);
  if (v7)
  {
    v25[0] = v12;
    v25[1] = 3221225472;
    v25[2] = __101__PKSettingsDeepLinkController__presentPayLaterPassOrFinancingPlanWithIdenifier_dataSource_delegate___block_invoke_29;
    v25[3] = &unk_1E2AC71C0;
    v26 = v13;
    v27 = v7;
    v28 = v36;
    -[PKAsyncUnaryOperationComposer addOperation:](v10, "addOperation:", v25);

  }
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v12;
  v19[1] = 3221225472;
  v19[2] = __101__PKSettingsDeepLinkController__presentPayLaterPassOrFinancingPlanWithIdenifier_dataSource_delegate___block_invoke_34;
  v19[3] = &unk_1E2AD55C8;
  v22 = v34;
  v16 = v7;
  v20 = v16;
  v23 = v38;
  v24 = v36;
  v17 = v9;
  v21 = v17;
  v18 = -[PKAsyncUnaryOperationComposer evaluateWithInput:completion:](v10, "evaluateWithInput:completion:", v15, v19);

  _Block_object_dispose(v34, 8);
  _Block_object_dispose(v36, 8);

  _Block_object_dispose(v38, 8);
}

void __101__PKSettingsDeepLinkController__presentPayLaterPassOrFinancingPlanWithIdenifier_dataSource_delegate___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  __int128 v15;

  v6 = a3;
  v7 = a4;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __101__PKSettingsDeepLinkController__presentPayLaterPassOrFinancingPlanWithIdenifier_dataSource_delegate___block_invoke_2;
  v11[3] = &unk_1E2AD5550;
  v14 = v7;
  v12 = v6;
  v15 = *(_OWORD *)(a1 + 48);
  v8 = *(void **)(a1 + 32);
  v13 = *(id *)(a1 + 40);
  v9 = v6;
  v10 = v7;
  objc_msgSend(v8, "defaultAccountForFeature:completion:", 3, v11);

}

void __101__PKSettingsDeepLinkController__presentPayLaterPassOrFinancingPlanWithIdenifier_dataSource_delegate___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  id v9;
  __int128 v10;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __101__PKSettingsDeepLinkController__presentPayLaterPassOrFinancingPlanWithIdenifier_dataSource_delegate___block_invoke_3;
  v5[3] = &unk_1E2AD5528;
  v6 = v3;
  v9 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 32);
  v10 = *(_OWORD *)(a1 + 56);
  v8 = *(id *)(a1 + 40);
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

uint64_t __101__PKSettingsDeepLinkController__presentPayLaterPassOrFinancingPlanWithIdenifier_dataSource_delegate___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v9;
  const char *v10;
  uint8_t *v11;
  __int16 v12;
  __int16 v13;

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), v2);
    v3 = *(void **)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "associatedPassUniqueID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "paymentPassWithUniqueIdentifier:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40))
      return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    PKLogFacilityTypeGetObject(0);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 0;
      v10 = "PKPassbookDeepLinkController: Pay Later pass was nil";
      v11 = (uint8_t *)&v12;
      goto LABEL_8;
    }
  }
  else
  {
    PKLogFacilityTypeGetObject(0);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 0;
      v10 = "PKPassbookDeepLinkController: Pay later account is nil";
      v11 = (uint8_t *)&v13;
LABEL_8:
      _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, v10, v11, 2u);
    }
  }

  return (*(uint64_t (**)(_QWORD))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56));
}

void __101__PKSettingsDeepLinkController__presentPayLaterPassOrFinancingPlanWithIdenifier_dataSource_delegate___block_invoke_29(_QWORD *a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  uint64_t v17;

  v6 = a3;
  v7 = a4;
  v9 = (void *)a1[4];
  v8 = (void *)a1[5];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __101__PKSettingsDeepLinkController__presentPayLaterPassOrFinancingPlanWithIdenifier_dataSource_delegate___block_invoke_2_30;
  v13[3] = &unk_1E2AD55A0;
  v14 = v8;
  v15 = v6;
  v10 = a1[6];
  v16 = v7;
  v17 = v10;
  v11 = v6;
  v12 = v7;
  objc_msgSend(v9, "financingPlanForPlanIdentifier:completion:", v14, v13);

}

void __101__PKSettingsDeepLinkController__presentPayLaterPassOrFinancingPlanWithIdenifier_dataSource_delegate___block_invoke_2_30(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __101__PKSettingsDeepLinkController__presentPayLaterPassOrFinancingPlanWithIdenifier_dataSource_delegate___block_invoke_3_31;
  block[3] = &unk_1E2AD5578;
  v8 = v3;
  v9 = *(id *)(a1 + 32);
  v11 = *(id *)(a1 + 48);
  v4 = *(id *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 56);
  v10 = v4;
  v12 = v5;
  v6 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __101__PKSettingsDeepLinkController__presentPayLaterPassOrFinancingPlanWithIdenifier_dataSource_delegate___block_invoke_3_31(_QWORD *a1)
{
  void *v2;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = (void *)a1[4];
  if (v2)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[8] + 8) + 40), v2);
    return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[7] + 16))(a1[7], a1[6], 0);
  }
  else
  {
    PKLogFacilityTypeGetObject(0);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = a1[5];
      v6 = 138412290;
      v7 = v5;
      _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "PKPassbookDeepLinkController: There is no pay later financing plan with identifier: %@", (uint8_t *)&v6, 0xCu);
    }

    return (*(uint64_t (**)(void))(a1[7] + 16))();
  }
}

void __101__PKSettingsDeepLinkController__presentPayLaterPassOrFinancingPlanWithIdenifier_dataSource_delegate___block_invoke_34(_QWORD *a1)
{
  BOOL v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = PKCanShowPayLaterPassItemsForAccount(*(void **)(*(_QWORD *)(a1[6] + 8) + 40));
  if (!v2)
  {
    PKLogFacilityTypeGetObject(0);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = a1[4];
      v8 = 138412290;
      v9 = v4;
      _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "PKPassbookDeepLinkController: Cannot present loan details for %@ because of the account state.", (uint8_t *)&v8, 0xCu);
    }

  }
  v5 = *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40);
  if (v5)
  {
    v6 = !v2;
    v7 = (void *)a1[5];
    if (!*(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 40))
      v6 = 1;
    if ((v6 & 1) != 0)
      objc_msgSend(v7, "presentPassDetailsViewControllerForPass:presentationStyle:presentingView:animated:", v5, 2, 0, 1);
    else
      objc_msgSend(v7, "presentPayLaterFinancingPlan:payLaterPass:");
  }
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
}

@end
