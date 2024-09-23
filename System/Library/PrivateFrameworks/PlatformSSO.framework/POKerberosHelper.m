@implementation POKerberosHelper

- (id)importKerberosEntry:(id)a3 error:(id *)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  krb5_error_code inited;
  id v16;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  krb5_error_code v22;
  id v23;
  krb5_error_code v24;
  id v25;
  int v26;
  id v27;
  id v28;
  void *v29;
  int v30;
  id v31;
  krb5_error_code init_creds_opt_alloc;
  id v33;
  int v34;
  id v35;
  int v36;
  id v37;
  int v38;
  id v39;
  int v40;
  id v41;
  krb5_error_code v42;
  id v43;
  int v44;
  id v45;
  int v46;
  id v47;
  int uuid;
  id v49;
  void *v50;
  void *v51;
  int creds;
  id v53;
  int v54;
  id v55;
  int v56;
  krb5_error_code principal;
  id v58;
  id v59;
  void *v60;
  NSObject *v61;
  void *v62;
  char *v63[5];
  krb5_error_code v64;
  uint64_t v65;
  uint64_t v66;
  id (*v67)();
  void *v68;
  int v69;
  uint64_t v70;
  uint64_t v71;
  id (*v72)();
  void *v73;
  int v74;
  uint64_t v75;
  uint64_t v76;
  id (*v77)();
  void *v78;
  int v79;
  uint64_t v80;
  uint64_t v81;
  id (*v82)();
  void *v83;
  int v84;
  uint64_t v85;
  uint64_t v86;
  id (*v87)();
  void *v88;
  int v89;
  uint64_t v90;
  uint64_t v91;
  id (*v92)();
  void *v93;
  krb5_error_code v94;
  uint64_t v95;
  uint64_t v96;
  id (*v97)();
  void *v98;
  int v99;
  uint64_t v100;
  uint64_t v101;
  id (*v102)();
  void *v103;
  int v104;
  uint64_t v105;
  uint64_t v106;
  id (*v107)();
  void *v108;
  int v109;
  uint64_t v110;
  uint64_t v111;
  id (*v112)();
  void *v113;
  int v114;
  uint64_t v115;
  uint64_t v116;
  id (*v117)();
  void *v118;
  krb5_error_code v119;
  uint64_t v120;
  uint64_t v121;
  id (*v122)();
  void *v123;
  int v124;
  uint64_t v125;
  uint64_t v126;
  id (*v127)();
  void *v128;
  int v129;
  uint64_t v130;
  uint64_t v131;
  id (*v132)();
  void *v133;
  krb5_error_code v134;
  uint64_t v135;
  uint64_t v136;
  id (*v137)();
  void *v138;
  krb5_error_code v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  id (*v144)();
  void *v145;
  krb5_error_code v146;
  uint64_t v147;
  uint64_t v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  uint64_t v153;
  krb5_keyblock v154;
  uint64_t v155;
  int v156;
  krb5_ccache cache[2];
  krb5_principal client;
  krb5_get_init_creds_opt *opt;
  krb5_context context;
  uint8_t v161[4];
  const char *v162;
  __int16 v163;
  void *v164;
  __int16 v165;
  POKerberosHelper *v166;
  uint64_t v167;
  uint64_t v168;
  uint8_t buf[32];
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  uint64_t v177;

  v177 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  PO_LOG_POKerberosHelper();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "realm");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "-[POKerberosHelper importKerberosEntry:error:]";
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v7;
    *(_WORD *)&buf[22] = 2112;
    *(_QWORD *)&buf[24] = self;
    _os_log_impl(&dword_22307D000, v6, OS_LOG_TYPE_DEFAULT, "%s realm = %{public}@ on %@", buf, 0x20u);

  }
  v8 = objc_alloc_init(MEMORY[0x24BE72EC0]);
  objc_msgSend(v5, "ticketKeyPath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTicketKeyPath:", v9);

  objc_msgSend(v5, "realm");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setRealm:", v10);

  context = 0;
  opt = 0;
  client = 0;
  cache[1] = 0;
  cache[0] = 0;
  v156 = 0;
  v155 = 0;
  v175 = 0u;
  v176 = 0u;
  v173 = 0u;
  v174 = 0u;
  v171 = 0u;
  v172 = 0u;
  v170 = 0u;
  memset(buf, 0, sizeof(buf));
  memset(&v154, 0, sizeof(v154));
  krb5_keyblock_zero();
  v153 = 0;
  v151 = 0u;
  v152 = 0u;
  v149 = 0u;
  v150 = 0u;
  v148 = 0;
  v147 = 0;
  krb5_data_zero();
  v11 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v5, "clientName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "realm");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("%@@%@"), v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  inited = krb5_init_context(&context);
  if (inited)
  {
    v142 = MEMORY[0x24BDAC760];
    v143 = 3221225472;
    v144 = __46__POKerberosHelper_importKerberosEntry_error___block_invoke;
    v145 = &__block_descriptor_36_e14___NSError_8__0l;
    v146 = inited;
    v16 = __46__POKerberosHelper_importKerberosEntry_error___block_invoke();
    goto LABEL_5;
  }
  v141 = 0;
  v140 = 0;
  krb5_data_zero();
  objc_msgSend(v5, "messageBuffer");
  v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v18, "bytes");
  objc_msgSend(v5, "messageBuffer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "length");
  krb5_data_copy();

  objc_msgSend(v14, "componentsSeparatedByString:", CFSTR("@"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "count") - 1;

  if (v21 < 2)
  {
    v24 = krb5_parse_name(context, (const char *)objc_msgSend(objc_retainAutorelease(v14), "UTF8String"), &client);
    if (v24)
    {
      v130 = MEMORY[0x24BDAC760];
      v131 = 3221225472;
      v132 = __46__POKerberosHelper_importKerberosEntry_error___block_invoke_79;
      v133 = &__block_descriptor_36_e14___NSError_8__0l;
      v134 = v24;
      v25 = __46__POKerberosHelper_importKerberosEntry_error___block_invoke_79();
      goto LABEL_5;
    }
  }
  else
  {
    v22 = krb5_parse_name_flags(0, (const char *)objc_msgSend(objc_retainAutorelease(v14), "UTF8String"), 4, &client);
    if (v22)
    {
      v135 = MEMORY[0x24BDAC760];
      v136 = 3221225472;
      v137 = __46__POKerberosHelper_importKerberosEntry_error___block_invoke_76;
      v138 = &__block_descriptor_36_e14___NSError_8__0l;
      v139 = v22;
      v23 = __46__POKerberosHelper_importKerberosEntry_error___block_invoke_76();
      goto LABEL_5;
    }
  }
  objc_msgSend(v5, "encryptionKeyType");
  v26 = krb5_enctype_valid();
  if (v26)
  {
    v125 = MEMORY[0x24BDAC760];
    v126 = 3221225472;
    v127 = __46__POKerberosHelper_importKerberosEntry_error___block_invoke_82;
    v128 = &__block_descriptor_36_e14___NSError_8__0l;
    v129 = v26;
    v27 = __46__POKerberosHelper_importKerberosEntry_error___block_invoke_82();
  }
  else
  {
    objc_msgSend(v5, "encryptionKeyType");
    objc_msgSend(v5, "sessionKey");
    v28 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v28, "bytes");
    objc_msgSend(v5, "sessionKey");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "length");
    v30 = krb5_keyblock_init();

    if (v30)
    {
      v120 = MEMORY[0x24BDAC760];
      v121 = 3221225472;
      v122 = __46__POKerberosHelper_importKerberosEntry_error___block_invoke_85;
      v123 = &__block_descriptor_36_e14___NSError_8__0l;
      v124 = v30;
      v31 = __46__POKerberosHelper_importKerberosEntry_error___block_invoke_85();
    }
    else
    {
      init_creds_opt_alloc = krb5_get_init_creds_opt_alloc(context, &opt);
      if (init_creds_opt_alloc)
      {
        v115 = MEMORY[0x24BDAC760];
        v116 = 3221225472;
        v117 = __46__POKerberosHelper_importKerberosEntry_error___block_invoke_88;
        v118 = &__block_descriptor_36_e14___NSError_8__0l;
        v119 = init_creds_opt_alloc;
        v33 = __46__POKerberosHelper_importKerberosEntry_error___block_invoke_88();
      }
      else
      {
        krb5_get_init_creds_opt_set_forwardable(opt, 1);
        krb5_get_init_creds_opt_set_proxiable(opt, 1);
        krb5_get_init_creds_opt_set_renew_life(opt, 2592000);
        krb5_get_init_creds_opt_set_canonicalize((krb5_get_init_creds_opt *)context, (int)opt);
        krb5_get_init_creds_opt_set_win2k();
        v34 = krb5_init_creds_init();
        if (v34)
        {
          v110 = MEMORY[0x24BDAC760];
          v111 = 3221225472;
          v112 = __46__POKerberosHelper_importKerberosEntry_error___block_invoke_91;
          v113 = &__block_descriptor_36_e14___NSError_8__0l;
          v114 = v34;
          v35 = __46__POKerberosHelper_importKerberosEntry_error___block_invoke_91();
        }
        else
        {
          v36 = krb5_init_creds_set_nonce();
          if (v36)
          {
            v105 = MEMORY[0x24BDAC760];
            v106 = 3221225472;
            v107 = __46__POKerberosHelper_importKerberosEntry_error___block_invoke_94;
            v108 = &__block_descriptor_36_e14___NSError_8__0l;
            v109 = v36;
            v37 = __46__POKerberosHelper_importKerberosEntry_error___block_invoke_94();
          }
          else
          {
            v38 = krb5_init_creds_set_keyblock();
            if (v38)
            {
              v100 = MEMORY[0x24BDAC760];
              v101 = 3221225472;
              v102 = __46__POKerberosHelper_importKerberosEntry_error___block_invoke_97;
              v103 = &__block_descriptor_36_e14___NSError_8__0l;
              v104 = v38;
              v39 = __46__POKerberosHelper_importKerberosEntry_error___block_invoke_97();
            }
            else
            {
              v40 = krb5_init_creds_step();
              if (v40)
              {
                v95 = MEMORY[0x24BDAC760];
                v96 = 3221225472;
                v97 = __46__POKerberosHelper_importKerberosEntry_error___block_invoke_100;
                v98 = &__block_descriptor_36_e14___NSError_8__0l;
                v99 = v40;
                v41 = __46__POKerberosHelper_importKerberosEntry_error___block_invoke_100();
              }
              else
              {
                krb5_data_free();
                krb5_data_free();
                if (krb5_cc_cache_match(context, client, cache)
                  && (v42 = krb5_cc_new_unique(context, "API", 0, cache)) != 0)
                {
                  v90 = MEMORY[0x24BDAC760];
                  v91 = 3221225472;
                  v92 = __46__POKerberosHelper_importKerberosEntry_error___block_invoke_104;
                  v93 = &__block_descriptor_36_e14___NSError_8__0l;
                  v94 = v42;
                  v43 = __46__POKerberosHelper_importKerberosEntry_error___block_invoke_104();
                }
                else
                {
                  v44 = krb5_init_creds_store();
                  if (v44)
                  {
                    v85 = MEMORY[0x24BDAC760];
                    v86 = 3221225472;
                    v87 = __46__POKerberosHelper_importKerberosEntry_error___block_invoke_107;
                    v88 = &__block_descriptor_36_e14___NSError_8__0l;
                    v89 = v44;
                    v45 = __46__POKerberosHelper_importKerberosEntry_error___block_invoke_107();
                  }
                  else
                  {
                    v46 = krb5_init_creds_store_config();
                    if (v46)
                    {
                      v80 = MEMORY[0x24BDAC760];
                      v81 = 3221225472;
                      v82 = __46__POKerberosHelper_importKerberosEntry_error___block_invoke_110;
                      v83 = &__block_descriptor_36_e14___NSError_8__0l;
                      v84 = v46;
                      v47 = __46__POKerberosHelper_importKerberosEntry_error___block_invoke_110();
                    }
                    else
                    {
                      v168 = 0;
                      v167 = 0;
                      uuid = krb5_cc_get_uuid();
                      if (uuid)
                      {
                        v75 = MEMORY[0x24BDAC760];
                        v76 = 3221225472;
                        v77 = __46__POKerberosHelper_importKerberosEntry_error___block_invoke_113;
                        v78 = &__block_descriptor_36_e14___NSError_8__0l;
                        v79 = uuid;
                        v49 = __46__POKerberosHelper_importKerberosEntry_error___block_invoke_113();
                      }
                      else
                      {
                        v50 = (void *)krb5_uuid_to_string();
                        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v50, 4);
                        v51 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v8, "setCacheName:", v51);

                        free(v50);
                        creds = krb5_init_creds_get_creds();
                        if (creds)
                        {
                          v70 = MEMORY[0x24BDAC760];
                          v71 = 3221225472;
                          v72 = __46__POKerberosHelper_importKerberosEntry_error___block_invoke_116;
                          v73 = &__block_descriptor_36_e14___NSError_8__0l;
                          v74 = creds;
                          v53 = __46__POKerberosHelper_importKerberosEntry_error___block_invoke_116();
                        }
                        else
                        {
                          v54 = decode_Ticket();
                          if (v54)
                          {
                            v65 = MEMORY[0x24BDAC760];
                            v66 = 3221225472;
                            v67 = __46__POKerberosHelper_importKerberosEntry_error___block_invoke_119;
                            v68 = &__block_descriptor_36_e14___NSError_8__0l;
                            v69 = v54;
                            v55 = __46__POKerberosHelper_importKerberosEntry_error___block_invoke_119();
                          }
                          else
                          {
                            krb5_free_cred_contents(context, (krb5_creds *)buf);
                            if ((_QWORD)v152)
                              v56 = *(__int16 *)(v152 + 2);
                            else
                              v56 = 0;
                            free_Ticket();
                            krb5_free_principal(context, client);
                            principal = krb5_cc_get_principal(context, cache[0], &client);
                            if (principal)
                            {
                              v63[1] = (char *)MEMORY[0x24BDAC760];
                              v63[2] = (char *)3221225472;
                              v63[3] = (char *)__46__POKerberosHelper_importKerberosEntry_error___block_invoke_122;
                              v63[4] = (char *)&__block_descriptor_36_e14___NSError_8__0l;
                              v64 = principal;
                              v58 = __46__POKerberosHelper_importKerberosEntry_error___block_invoke_122();
                            }
                            else
                            {
                              v63[0] = 0;
                              if (krb5_unparse_name(context, client, v63))
                              {
                                v59 = __46__POKerberosHelper_importKerberosEntry_error___block_invoke_125();
                              }
                              else
                              {
                                objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v63[0], 4);
                                v60 = (void *)objc_claimAutoreleasedReturnValue();
                                objc_msgSend(v8, "setUpn:", v60);

                                free(v63[0]);
                                v63[0] = 0;
                                PO_LOG_POKerberosHelper();
                                v61 = objc_claimAutoreleasedReturnValue();
                                if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
                                {
                                  objc_msgSend(v5, "realm");
                                  v62 = (void *)objc_claimAutoreleasedReturnValue();
                                  *(_DWORD *)v161 = 136315650;
                                  v162 = "-[POKerberosHelper importKerberosEntry:error:]";
                                  v163 = 2114;
                                  v164 = v62;
                                  v165 = 2112;
                                  v166 = self;
                                  _os_log_impl(&dword_22307D000, v61, OS_LOG_TYPE_DEFAULT, "%s Successful for realm = %{public}@ on %@", v161, 0x20u);

                                }
                                if (v56 > 0
                                  || objc_msgSend(MEMORY[0x24BE72EE8], "forceKerberosTGTExchange"))
                                {
                                  objc_msgSend(v8, "setExchangeRequired:", 1);
                                }
                                objc_msgSend(v8, "setImportSuccessful:", 1);
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
LABEL_5:
  if (opt)
    krb5_get_init_creds_opt_free(context, opt);
  if (cache[0])
    krb5_cc_close(context, cache[0]);
  krb5_free_keyblock_contents(context, &v154);
  krb5_free_cred_contents(context, (krb5_creds *)buf);
  MEMORY[0x227682A24](context);
  krb5_data_free();
  krb5_free_principal(context, client);

  return v8;
}

id __46__POKerberosHelper_importKerberosEntry_error___block_invoke()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1001, CFSTR("krb5_init_context failed when importing kerberos entry."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POKerberosHelper();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __46__POKerberosHelper_importKerberosEntry_error___block_invoke_cold_1();

  return v0;
}

id __46__POKerberosHelper_importKerberosEntry_error___block_invoke_76()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1001, CFSTR("krb5_parse_name failed when importing enterprise kerberos entry."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POKerberosHelper();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __46__POKerberosHelper_importKerberosEntry_error___block_invoke_cold_1();

  return v0;
}

id __46__POKerberosHelper_importKerberosEntry_error___block_invoke_79()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1001, CFSTR("krb5_parse_name failed when importing kerberos entry."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POKerberosHelper();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __46__POKerberosHelper_importKerberosEntry_error___block_invoke_cold_1();

  return v0;
}

id __46__POKerberosHelper_importKerberosEntry_error___block_invoke_82()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1001, CFSTR("krb5_enctype_valid failed when importing kerberos entry."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POKerberosHelper();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __46__POKerberosHelper_importKerberosEntry_error___block_invoke_cold_1();

  return v0;
}

id __46__POKerberosHelper_importKerberosEntry_error___block_invoke_85()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1001, CFSTR("krb5_keyblock_init failed when importing kerberos entry."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POKerberosHelper();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __46__POKerberosHelper_importKerberosEntry_error___block_invoke_cold_1();

  return v0;
}

id __46__POKerberosHelper_importKerberosEntry_error___block_invoke_88()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1001, CFSTR("krb5_get_init_creds_opt_alloc failed when importing kerberos entry."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POKerberosHelper();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __46__POKerberosHelper_importKerberosEntry_error___block_invoke_cold_1();

  return v0;
}

id __46__POKerberosHelper_importKerberosEntry_error___block_invoke_91()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1001, CFSTR("krb5_init_creds_init failed when importing kerberos entry."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POKerberosHelper();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __46__POKerberosHelper_importKerberosEntry_error___block_invoke_cold_1();

  return v0;
}

id __46__POKerberosHelper_importKerberosEntry_error___block_invoke_94()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1001, CFSTR("krb5_init_creds_set_nonce failed when importing kerberos entry."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POKerberosHelper();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __46__POKerberosHelper_importKerberosEntry_error___block_invoke_cold_1();

  return v0;
}

id __46__POKerberosHelper_importKerberosEntry_error___block_invoke_97()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1001, CFSTR("krb5_init_creds_set_keyblock failed when importing kerberos entry."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POKerberosHelper();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __46__POKerberosHelper_importKerberosEntry_error___block_invoke_cold_1();

  return v0;
}

id __46__POKerberosHelper_importKerberosEntry_error___block_invoke_100()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1001, CFSTR("krb5_init_creds_step failed when importing kerberos entry."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POKerberosHelper();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __46__POKerberosHelper_importKerberosEntry_error___block_invoke_cold_1();

  return v0;
}

id __46__POKerberosHelper_importKerberosEntry_error___block_invoke_104()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1001, CFSTR("krb5_cc_new_unique failed when importing kerberos entry."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POKerberosHelper();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __46__POKerberosHelper_importKerberosEntry_error___block_invoke_cold_1();

  return v0;
}

id __46__POKerberosHelper_importKerberosEntry_error___block_invoke_107()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1001, CFSTR("krb5_init_creds_store failed when importing kerberos entry."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POKerberosHelper();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __46__POKerberosHelper_importKerberosEntry_error___block_invoke_cold_1();

  return v0;
}

id __46__POKerberosHelper_importKerberosEntry_error___block_invoke_110()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1001, CFSTR("krb5_init_creds_store_config failed when importing kerberos entry."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POKerberosHelper();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __46__POKerberosHelper_importKerberosEntry_error___block_invoke_cold_1();

  return v0;
}

id __46__POKerberosHelper_importKerberosEntry_error___block_invoke_113()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1001, CFSTR("krb5_cc_get_uuid failed when importing kerberos entry."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POKerberosHelper();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __46__POKerberosHelper_importKerberosEntry_error___block_invoke_cold_1();

  return v0;
}

id __46__POKerberosHelper_importKerberosEntry_error___block_invoke_116()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1001, CFSTR("krb5_init_creds_get_creds failed when importing kerberos entry."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POKerberosHelper();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __46__POKerberosHelper_importKerberosEntry_error___block_invoke_cold_1();

  return v0;
}

id __46__POKerberosHelper_importKerberosEntry_error___block_invoke_119()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1001, CFSTR("decode_Ticket failed when importing kerberos entry."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POKerberosHelper();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __46__POKerberosHelper_importKerberosEntry_error___block_invoke_cold_1();

  return v0;
}

id __46__POKerberosHelper_importKerberosEntry_error___block_invoke_122()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1001, CFSTR("krb5_cc_get_principal failed when importing kerberos entry."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POKerberosHelper();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __46__POKerberosHelper_importKerberosEntry_error___block_invoke_cold_1();

  return v0;
}

id __46__POKerberosHelper_importKerberosEntry_error___block_invoke_125()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1001, CFSTR("krb5_unparse_name failed when importing kerberos entry."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POKerberosHelper();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __46__POKerberosHelper_importKerberosEntry_error___block_invoke_cold_1();

  return v0;
}

- (void)exchangeKerberosTGTForEntry:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  krb5_error_code inited;
  int v8;
  id v9;
  id v10;
  id v11;
  int v12;
  id v13;
  krb5_error_code principal;
  id v15;
  NSObject *v16;
  uint64_t realm;
  int v18;
  id v19;
  krb5_error_code credentials;
  id v21;
  krb5_error_code v22;
  id v23;
  krb5_error_code v24;
  id v25;
  int kdc_cred;
  id v27;
  krb5_error_code v28;
  id v29;
  krb5_error_code v30;
  id v31;
  void *v32;
  uint64_t v33;
  _BYTE v34[128];
  __int128 v35;
  krb5_creds *creds;
  krb5_creds *v37;
  krb5_context context;
  krb5_ccache cache;
  uint8_t v40[4];
  const char *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  POKerberosHelper *v45;
  uint8_t buf[32];
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  PO_LOG_POKerberosHelper();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "realm");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "-[POKerberosHelper exchangeKerberosTGTForEntry:]";
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v6;
    *(_WORD *)&buf[22] = 2112;
    *(_QWORD *)&buf[24] = self;
    _os_log_impl(&dword_22307D000, v5, OS_LOG_TYPE_DEFAULT, "%s realm = %{public}@ on %@", buf, 0x20u);

  }
  cache = 0;
  context = 0;
  v54 = 0;
  v55 = 0;
  v37 = 0;
  creds = 0;
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v47 = 0u;
  memset(buf, 0, sizeof(buf));
  v35 = 0u;
  memset(v34, 0, sizeof(v34));
  inited = krb5_init_context(&context);
  if (inited)
  {
    v8 = inited;
    v9 = __48__POKerberosHelper_exchangeKerberosTGTForEntry___block_invoke();
    goto LABEL_11;
  }
  objc_msgSend(v4, "cacheName");
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v10, "UTF8String");
  v8 = krb5_string_to_uuid();

  if (v8)
  {
    v11 = __48__POKerberosHelper_exchangeKerberosTGTForEntry___block_invoke_129();
    goto LABEL_11;
  }
  v12 = krb5_cc_resolve_by_uuid();
  if (v12)
  {
    v8 = v12;
    v13 = __48__POKerberosHelper_exchangeKerberosTGTForEntry___block_invoke_132();
    goto LABEL_11;
  }
  principal = krb5_cc_get_principal(context, cache, (krb5_principal *)buf);
  if (principal)
  {
    v8 = principal;
    v15 = __48__POKerberosHelper_exchangeKerberosTGTForEntry___block_invoke_135();
    goto LABEL_11;
  }
  realm = krb5_principal_get_realm();
  if (realm)
  {
    v33 = realm;
    v18 = krb5_make_principal();
    if (v18)
    {
      v8 = v18;
      v19 = __48__POKerberosHelper_exchangeKerberosTGTForEntry___block_invoke_137();
    }
    else
    {
      credentials = krb5_get_credentials(context, 1, cache, (krb5_creds *)buf, &v37);
      if (credentials)
      {
        v8 = credentials;
        v21 = __48__POKerberosHelper_exchangeKerberosTGTForEntry___block_invoke_140();
      }
      else
      {
        *(_QWORD *)&v34[64] = time(0) + 604800;
        v22 = krb5_copy_principal(context, *(krb5_const_principal *)&v37->magic, (krb5_principal *)v34);
        if (v22)
        {
          v8 = v22;
          v23 = __48__POKerberosHelper_exchangeKerberosTGTForEntry___block_invoke_143();
        }
        else
        {
          v24 = krb5_copy_principal(context, v37->client, (krb5_principal *)&v34[8]);
          if (v24)
          {
            v8 = v24;
            v25 = __48__POKerberosHelper_exchangeKerberosTGTForEntry___block_invoke_146();
          }
          else
          {
            kdc_cred = krb5_get_kdc_cred();
            if (kdc_cred)
            {
              v8 = kdc_cred;
              v27 = __48__POKerberosHelper_exchangeKerberosTGTForEntry___block_invoke_147();
            }
            else
            {
              v28 = krb5_cc_initialize(context, cache, *(krb5_principal *)&creds->magic);
              if (v28)
              {
                v8 = v28;
                v29 = __48__POKerberosHelper_exchangeKerberosTGTForEntry___block_invoke_150();
              }
              else
              {
                v30 = krb5_cc_store_cred(context, cache, creds);
                if (!v30)
                {
                  objc_msgSend(v4, "setExchangeRequired:", 0, "krbtgt", v33, 0);
                  objc_msgSend(v4, "setFailedToConnect:", 0);
                  PO_LOG_POKerberosHelper();
                  v16 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
                  {
                    objc_msgSend(v4, "realm");
                    v32 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)v40 = 136315650;
                    v41 = "-[POKerberosHelper exchangeKerberosTGTForEntry:]";
                    v42 = 2114;
                    v43 = v32;
                    v44 = 2112;
                    v45 = self;
                    _os_log_impl(&dword_22307D000, v16, OS_LOG_TYPE_DEFAULT, "%s Success for realm = %{public}@ on %@", v40, 0x20u);

                  }
LABEL_17:

                  goto LABEL_18;
                }
                v8 = v30;
                v31 = __48__POKerberosHelper_exchangeKerberosTGTForEntry___block_invoke_153();
              }
            }
          }
        }
      }
    }
LABEL_11:
    if (v8 == -1765328347)
    {
      objc_msgSend(v4, "setExchangeRequired:", 0);
      PO_LOG_POKerberosHelper();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[POKerberosHelper exchangeKerberosTGTForEntry:].cold.2(v4);
    }
    else
    {
      if (v8 != -1765328228)
        goto LABEL_18;
      objc_msgSend(v4, "setFailedToConnect:", 1);
      PO_LOG_POKerberosHelper();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[POKerberosHelper exchangeKerberosTGTForEntry:].cold.1(v4);
    }
    goto LABEL_17;
  }
LABEL_18:
  if (cache)
    krb5_cc_close(context, cache);
  if (creds)
    krb5_free_creds(context, creds);
  if (v37)
    krb5_free_creds(context, v37);
  krb5_free_cred_contents(context, (krb5_creds *)buf);
  krb5_free_cred_contents(context, (krb5_creds *)v34);
  MEMORY[0x227682A24](context);

}

id __48__POKerberosHelper_exchangeKerberosTGTForEntry___block_invoke()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1001, CFSTR("krb5_init_context failed when importing kerberos entry."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POKerberosHelper();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __46__POKerberosHelper_importKerberosEntry_error___block_invoke_cold_1();

  return v0;
}

id __48__POKerberosHelper_exchangeKerberosTGTForEntry___block_invoke_129()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1001, CFSTR("krb5_string_to_uuid failed when importing kerberos entry."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POKerberosHelper();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __46__POKerberosHelper_importKerberosEntry_error___block_invoke_cold_1();

  return v0;
}

id __48__POKerberosHelper_exchangeKerberosTGTForEntry___block_invoke_132()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1001, CFSTR("krb5_cc_resolve_by_uuid failed when importing kerberos entry."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POKerberosHelper();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __46__POKerberosHelper_importKerberosEntry_error___block_invoke_cold_1();

  return v0;
}

id __48__POKerberosHelper_exchangeKerberosTGTForEntry___block_invoke_135()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1001, CFSTR("krb5_cc_get_principal failed when importing kerberos entry."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POKerberosHelper();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __46__POKerberosHelper_importKerberosEntry_error___block_invoke_cold_1();

  return v0;
}

id __48__POKerberosHelper_exchangeKerberosTGTForEntry___block_invoke_137()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1001, CFSTR("krb5_make_principal failed when importing kerberos entry."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POKerberosHelper();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __46__POKerberosHelper_importKerberosEntry_error___block_invoke_cold_1();

  return v0;
}

id __48__POKerberosHelper_exchangeKerberosTGTForEntry___block_invoke_140()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1001, CFSTR("krb5_get_credentials failed when importing kerberos entry."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POKerberosHelper();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __46__POKerberosHelper_importKerberosEntry_error___block_invoke_cold_1();

  return v0;
}

id __48__POKerberosHelper_exchangeKerberosTGTForEntry___block_invoke_143()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1001, CFSTR("krb5_copy_principal failed when importing kerberos entry."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POKerberosHelper();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __46__POKerberosHelper_importKerberosEntry_error___block_invoke_cold_1();

  return v0;
}

id __48__POKerberosHelper_exchangeKerberosTGTForEntry___block_invoke_146()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1001, CFSTR("krb5_copy_principal failed when importing kerberos entry."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POKerberosHelper();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __46__POKerberosHelper_importKerberosEntry_error___block_invoke_cold_1();

  return v0;
}

id __48__POKerberosHelper_exchangeKerberosTGTForEntry___block_invoke_147()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1001, CFSTR("krb5_get_kdc_cred failed when importing kerberos entry."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POKerberosHelper();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __46__POKerberosHelper_importKerberosEntry_error___block_invoke_cold_1();

  return v0;
}

id __48__POKerberosHelper_exchangeKerberosTGTForEntry___block_invoke_150()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1001, CFSTR("krb5_cc_initialize failed when importing kerberos entry."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POKerberosHelper();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __46__POKerberosHelper_importKerberosEntry_error___block_invoke_cold_1();

  return v0;
}

id __48__POKerberosHelper_exchangeKerberosTGTForEntry___block_invoke_153()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1001, CFSTR("krb5_cc_store_cred failed when importing kerberos entry."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POKerberosHelper();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __46__POKerberosHelper_importKerberosEntry_error___block_invoke_cold_1();

  return v0;
}

- (BOOL)checkForValidKerberosTGT:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  BOOL v7;
  OM_uint32 minor_status;
  gss_cred_id_t cred_handle;

  v4 = a3;
  PO_LOG_POKerberosHelper();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[POKerberosHelper checkForValidKerberosTGT:].cold.1();

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v4);
  if (v6)
  {
    cred_handle = -[POKerberosHelper acquireCredentialForUUID:](self, "acquireCredentialForUUID:", v6);
    v7 = cred_handle != 0;
    if (cred_handle)
    {
      minor_status = 0;
      gss_release_cred(&minor_status, &cred_handle);
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (gss_cred_id_t_desc_struct)acquireCredentialForUUID:(id)a3
{
  id v3;
  NSObject *v4;
  __CFString *v5;
  const __CFUUID *v6;
  const __CFUUID *v7;
  gss_cred_id_t_desc_struct *v8;
  OM_uint32 v9;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  OM_uint32 lifetime[2];

  v3 = a3;
  PO_LOG_POKerberosHelper();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[POKerberosHelper acquireCredentialForUUID:].cold.2();

  if (!v3)
  {
    v8 = 0;
    goto LABEL_19;
  }
  objc_msgSend(v3, "UUIDString");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if ((-[__CFString isEqualToString:](v5, "isEqualToString:", &stru_24EC04270) & 1) != 0
    || (v6 = CFUUIDCreateFromString(0, v5)) == 0)
  {
    *(_QWORD *)lifetime = 0;
    goto LABEL_14;
  }
  v7 = v6;
  v8 = GSSCreateCredentialFromUUID(v6);
  CFRelease(v7);
  *(_QWORD *)lifetime = 0;
  if (!v8)
  {
LABEL_14:
    v11 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v3, "UUIDString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("failed to find credential: %@"), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    PO_LOG_POKerberosHelper();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[POKerberosHelper acquireCredentialForUUID:].cold.1((uint64_t)v13, v14, v15, v16, v17, v18, v19, v20);

    v8 = 0;
    goto LABEL_17;
  }
  v9 = gss_inquire_cred(&lifetime[1], v8, 0, lifetime, 0, 0);
  if (lifetime[0])
    v10 = v9 == 0;
  else
    v10 = 0;
  if (!v10)
    v8 = 0;
LABEL_17:

LABEL_19:
  return v8;
}

- (BOOL)destroyCredentialForUUID:(id)a3
{
  __CFString *v3;
  NSObject *v4;
  const __CFUUID *v5;
  const __CFUUID *v6;
  BOOL v7;
  OM_uint32 min_stat;
  gss_cred_id_t cred_handle;

  v3 = (__CFString *)a3;
  PO_LOG_POKerberosHelper();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[POKerberosHelper destroyCredentialForUUID:].cold.1();

  if (v3)
  {
    if ((-[__CFString isEqualToString:](v3, "isEqualToString:", &stru_24EC04270) & 1) == 0
      && (v5 = CFUUIDCreateFromString(0, v3)) != 0
      && (v6 = v5, cred_handle = GSSCreateCredentialFromUUID(v5), CFRelease(v6), cred_handle))
    {
      min_stat = 0;
      v7 = gss_destroy_cred(&min_stat, &cred_handle) == 0;
    }
    else
    {
      v7 = 1;
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __46__POKerberosHelper_importKerberosEntry_error___block_invoke_cold_1()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_3_1();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned int *)(v0 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_0(&dword_22307D000, v2, v3, "%{public}@, %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_1();
}

- (void)exchangeKerberosTGTForEntry:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "realm");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_8(&dword_22307D000, v2, v3, "TGT exchange connection failure for realm = %{public}@, %d", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_9();
}

- (void)exchangeKerberosTGTForEntry:(void *)a1 .cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "realm");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_8(&dword_22307D000, v2, v3, "Not retrying TGT exchange for realm = %{public}@, %d", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_9();
}

- (void)checkForValidKerberosTGT:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_22307D000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)acquireCredentialForUUID:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_22307D000, a2, a3, "Error using cached credential: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)acquireCredentialForUUID:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_22307D000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)destroyCredentialForUUID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_22307D000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

@end
