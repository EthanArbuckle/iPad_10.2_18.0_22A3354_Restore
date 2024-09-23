@implementation VSAMSIdentityProviderResponseDictionaryValueTransformer

+ (Class)transformedValueClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)allowsReverseTransformation
{
  return 0;
}

- (id)createProviderAppArtworkFromAttributes:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a3, "vs_dictionaryForKey:", *MEMORY[0x24BDF8D70]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF8BD8], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringForAMSPlatformAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "vs_dictionaryForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(v4, "bincompatOS");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v3, "vs_dictionaryForKey:", v7);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }

  }
  return v6;
}

- (id)transformedValue:(id)a3
{
  NSObject *v3;
  NSObject *v4;
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  objc_class *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  id v24;
  void *v25;
  id v26;
  NSObject *v27;
  int v28;
  int v29;
  NSObject *v30;
  _BOOL4 v31;
  void *v32;
  void *v33;
  BOOL v34;
  NSObject *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
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
  id v59;
  id v60;
  void *v61;
  id v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t i;
  NSObject *v67;
  void *v68;
  NSObject *v69;
  NSObject *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  void *v77;
  uint64_t v78;
  NSObject *v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  NSObject *v84;
  NSObject *v85;
  void *v86;
  NSObject *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  void *v96;
  NSObject *v98;
  void *v99;
  void *v100;
  void *v101;
  NSObject *v102;
  uint64_t v103;
  unsigned int v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  NSObject *obj;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  id v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  NSObject *v133;
  void *v134;
  void *v135;
  void *v136;
  NSObject *v137;
  void *v138;
  uint64_t v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  uint8_t v144;
  char v145[15];
  uint8_t v146;
  char v147[7];
  _QWORD v148[4];
  id v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  uint8_t v154[128];
  uint8_t buf[4];
  NSObject *v156;
  __int16 v157;
  NSObject *v158;
  __int16 v159;
  NSObject *v160;
  _BYTE v161[128];
  uint64_t v162;

  v162 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  VSDefaultLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v156 = v3;
    _os_log_impl(&dword_2303C5000, v4, OS_LOG_TYPE_DEFAULT, "Handling response %@", buf, 0xCu);
  }

  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v98 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
    v87 = *MEMORY[0x24BDF8D98];
    -[NSObject vs_arrayForKey:](v3, "vs_arrayForKey:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v86 = v6;
    if (v6)
    {
      v7 = v6;
      if (-[NSObject count](v7, "count"))
      {
        v152 = 0u;
        v153 = 0u;
        v150 = 0u;
        v151 = 0u;
        obj = v7;
        v8 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v150, v161, 16);
        if (!v8)
          goto LABEL_95;
        v9 = v8;
        v85 = v3;
        v10 = *(_QWORD *)v151;
        v103 = *MEMORY[0x24BDBCAB8];
        v119 = *MEMORY[0x24BDF8D68];
        v118 = *MEMORY[0x24BDF8D38];
        v113 = *MEMORY[0x24BDF8D50];
        v112 = *MEMORY[0x24BDF8D30];
        v111 = *MEMORY[0x24BDF8D90];
        v110 = *MEMORY[0x24BDF8DD0];
        v109 = *MEMORY[0x24BDF8D58];
        v108 = *MEMORY[0x24BDF8D60];
        v107 = *MEMORY[0x24BDF8D48];
        v106 = *MEMORY[0x24BDF8D40];
        v95 = *MEMORY[0x24BDF8D80];
        v93 = *MEMORY[0x24BDF8D78];
        v94 = *MEMORY[0x24BDF8D88];
        v91 = *MEMORY[0x24BDF8DB0];
        v92 = *MEMORY[0x24BDF8DA8];
        v90 = *MEMORY[0x24BDF8DB8];
        v89 = *MEMORY[0x24BDF8DA0];
        v88 = *MEMORY[0x24BDF8D28];
        v117 = *MEMORY[0x24BDF8D00];
        v115 = *MEMORY[0x24BDF8CF0];
        v116 = *MEMORY[0x24BDF8CF8];
        v96 = v5;
        v84 = v7;
        v105 = *(_QWORD *)v151;
        while (1)
        {
          v11 = 0;
          v114 = v9;
          do
          {
            if (*(_QWORD *)v151 != v10)
              objc_enumerationMutation(obj);
            v12 = *(NSObject **)(*((_QWORD *)&v150 + 1) + 8 * v11);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                v13 = (void *)MEMORY[0x24BDBCE88];
                v14 = (objc_class *)objc_opt_class();
                NSStringFromClass(v14);
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v13, "raise:format:", v103, CFSTR("Unexpectedly, providerObject was %@, instead of NSDictionary."), v15);

              }
              v139 = v11;
              v16 = v12;
              -[NSObject vs_stringForKey:](v16, "vs_stringForKey:", v119);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject vs_dictionaryForKey:](v16, "vs_dictionaryForKey:", v118);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v138 = v18;
              if (v18)
              {
                v19 = v18;
                -[NSObject vs_stringForKey:](v19, "vs_stringForKey:", v113);
                v20 = objc_claimAutoreleasedReturnValue();
                v123 = (void *)v20;
                if (v20)
                {
                  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v20);
                  v21 = objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  v21 = 0;
                }
                -[NSObject vs_stringForKey:](v19, "vs_stringForKey:", v112);
                v23 = objc_claimAutoreleasedReturnValue();
                v122 = (void *)v23;
                if (v23)
                {
                  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v23);
                  v130 = (void *)objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  v130 = 0;
                }
                -[NSObject vs_stringForKey:](v19, "vs_stringForKey:", v111);
                v24 = (id)objc_claimAutoreleasedReturnValue();
                if (!v24)
                  v24 = v17;
                v128 = v24;
                -[NSObject vs_dictionaryForKey:](v19, "vs_dictionaryForKey:", v110);
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                v26 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
                v148[0] = MEMORY[0x24BDAC760];
                v148[1] = 3221225472;
                v148[2] = __76__VSAMSIdentityProviderResponseDictionaryValueTransformer_transformedValue___block_invoke;
                v148[3] = &unk_24FE1A660;
                v124 = v25;
                v125 = v26;
                v149 = v125;
                objc_msgSend(v25, "enumerateKeysAndObjectsUsingBlock:", v148);
                -[NSObject vs_stringForKey:](v19, "vs_stringForKey:", v109);
                v27 = objc_claimAutoreleasedReturnValue();
                -[NSObject vs_numberForKey:](v19, "vs_numberForKey:", v108);
                v121 = (void *)objc_claimAutoreleasedReturnValue();
                v28 = objc_msgSend(v121, "BOOLValue") ^ 1;
                v132 = (void *)v21;
                if (v21)
                  v29 = v28;
                else
                  v29 = 1;
                -[NSObject vs_arrayOfStringsForKey:](v19, "vs_arrayOfStringsForKey:", v107);
                v127 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSObject vs_arrayOfStringsForKey:](v19, "vs_arrayOfStringsForKey:", v106);
                v126 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSObject vs_stringForKey:](v19, "vs_stringForKey:", CFSTR("minimumOSVersion"));
                v136 = (void *)objc_claimAutoreleasedReturnValue();
                if (v17)
                {
                  v104 = v29;
                  v30 = v17;
                  v31 = -[NSObject length](v30, "length")
                     && -[NSObject length](v27, "length")
                     && (-[NSObject containsObject:](v98, "containsObject:", v30) & 1) == 0
                     && objc_msgSend(v124, "count") != 0;
                  v134 = v17;
                  if (!objc_msgSend(v136, "length"))
                  {
                    if (v31)
                      goto LABEL_42;
                    goto LABEL_57;
                  }
                  objc_msgSend(MEMORY[0x24BDF8BD8], "currentDevice");
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v32, "productVersion");
                  v33 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v33)
                  {
                    v34 = objc_msgSend(v136, "compare:options:", v33, 64) != 1 && v31;

                    if (v34)
                      goto LABEL_42;
LABEL_57:
                    VSDefaultLogObject();
                    v35 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138412802;
                      v156 = v27;
                      v157 = 2112;
                      v158 = v30;
                      v159 = 2112;
                      v160 = v16;
                      _os_log_impl(&dword_2303C5000, v35, OS_LOG_TYPE_DEFAULT, "Excluding provider %@ (%@): %@", buf, 0x20u);
                    }
                    v22 = 0;
                    v9 = v114;
                    v17 = v134;
                  }
                  else
                  {
                    VSErrorLogObject();
                    v70 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v70, OS_LOG_TYPE_FAULT))
                      -[VSAMSIdentityProviderResponseDictionaryValueTransformer transformedValue:].cold.5(&v146, v147, v70);

                    if (!v31)
                      goto LABEL_57;
LABEL_42:
                    -[NSObject addObject:](v98, "addObject:", v30);
                    v35 = objc_alloc_init(MEMORY[0x24BDF8C00]);
                    v36 = (void *)MEMORY[0x24BDF8C38];
                    v37 = -[NSObject copy](v30, "copy");
                    objc_msgSend(v36, "optionalWithObject:", v37);
                    v38 = (void *)objc_claimAutoreleasedReturnValue();
                    -[NSObject setUniqueID:](v35, "setUniqueID:", v38);

                    v39 = (void *)MEMORY[0x24BDF8C38];
                    v40 = (void *)objc_msgSend(v128, "copy");
                    objc_msgSend(v39, "optionalWithObject:", v40);
                    v41 = (void *)objc_claimAutoreleasedReturnValue();
                    -[NSObject setProviderID:](v35, "setProviderID:", v41);

                    v42 = (void *)MEMORY[0x24BDF8C38];
                    v43 = -[NSObject copy](v16, "copy");
                    objc_msgSend(v42, "optionalWithObject:", v43);
                    v44 = (void *)objc_claimAutoreleasedReturnValue();
                    -[NSObject setProviderInfo:](v35, "setProviderInfo:", v44);

                    v102 = v27;
                    -[NSObject setNameForSorting:](v35, "setNameForSorting:", v27);
                    -[NSObject setAuthenticationURL:](v35, "setAuthenticationURL:", v132);
                    -[NSObject setRequireAuthenticationURLSystemTrust:](v35, "setRequireAuthenticationURLSystemTrust:", 1);
                    -[NSObject setRequireXHRRequestSystemTrust:](v35, "setRequireXHRRequestSystemTrust:", 1);
                    -[NSObject vs_dictionaryForKey:](v19, "vs_dictionaryForKey:", v95);
                    v45 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v45, "vs_stringForKey:", v94);
                    v101 = (void *)objc_claimAutoreleasedReturnValue();
                    -[NSObject setProviderArtworkTemplateURL:](v35, "setProviderArtworkTemplateURL:");
                    -[VSAMSIdentityProviderResponseDictionaryValueTransformer createProviderAppArtworkFromAttributes:](self, "createProviderAppArtworkFromAttributes:", v19);
                    v100 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v100, "vs_stringForKey:", v93);
                    v99 = (void *)objc_claimAutoreleasedReturnValue();
                    -[NSObject setProviderAppArtworkTemplateURL:](v35, "setProviderAppArtworkTemplateURL:");
                    -[NSObject vs_numberForKey:](v19, "vs_numberForKey:", v92);
                    v46 = (void *)objc_claimAutoreleasedReturnValue();
                    v47 = v46;
                    if (v46)
                      -[NSObject setIsSetTopBoxSupported:](v35, "setIsSetTopBoxSupported:", objc_msgSend(v46, "BOOLValue"));
                    -[NSObject vs_numberForKey:](v19, "vs_numberForKey:", v91);
                    v48 = (void *)objc_claimAutoreleasedReturnValue();
                    v49 = v48;
                    if (v48)
                      -[NSObject setShouldShowChannelApps:](v35, "setShouldShowChannelApps:", objc_msgSend(v48, "BOOLValue"));
                    -[NSObject vs_numberForKey:](v19, "vs_numberForKey:", v90);
                    v50 = (void *)objc_claimAutoreleasedReturnValue();
                    v51 = v50;
                    if (v50)
                      -[NSObject setShouldShowSubscriptionApps:](v35, "setShouldShowSubscriptionApps:", objc_msgSend(v50, "BOOLValue"));
                    -[NSObject vs_numberForKey:](v19, "vs_numberForKey:", v89);
                    v52 = (void *)objc_claimAutoreleasedReturnValue();
                    v53 = v52;
                    if (v52)
                      -[NSObject setIsSTBOptOutAllowed:](v35, "setIsSTBOptOutAllowed:", objc_msgSend(v52, "BOOLValue"));
                    -[NSObject vs_numberForKey:](v19, "vs_numberForKey:", v88);
                    v54 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v54)
                      -[NSObject setAppPlacementPosition:](v35, "setAppPlacementPosition:", v54);
                    -[NSObject setStorefronts:](v35, "setStorefronts:", v125);
                    -[NSObject setAppStoreRoomURL:](v35, "setAppStoreRoomURL:", v130);
                    -[NSObject setSupportedTemplates:](v35, "setSupportedTemplates:", v127);
                    -[NSObject setSupportedAuthenticationSchemes:](v35, "setSupportedAuthenticationSchemes:", v126);
                    -[NSObject setProhibitedByStore:](v35, "setProhibitedByStore:", v104);
                    objc_msgSend(v96, "addObject:", v35);

                    v22 = v35;
                    v10 = v105;
                    v9 = v114;
                    v17 = v134;
                    v27 = v102;
                  }

                }
                else
                {
                  VSDefaultLogObject();
                  v30 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    v156 = v16;
                    _os_log_impl(&dword_2303C5000, v30, OS_LOG_TYPE_DEFAULT, "No unique ID for provider: %@", buf, 0xCu);
                  }
                  v22 = 0;
                }

              }
              else
              {
                VSErrorLogObject();
                v19 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
                  -[VSAMSIdentityProviderResponseDictionaryValueTransformer transformedValue:].cold.4(&v144, v145, v19);
                v22 = 0;
              }

              -[NSObject vs_dictionaryForKey:](v16, "vs_dictionaryForKey:", v117);
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v55, "vs_dictionaryForKey:", v116);
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v56, "vs_arrayOfDictionariesForKey:", v115);
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              v58 = v57;
              if (v57 && objc_msgSend(v57, "count"))
              {
                v129 = v56;
                v131 = v55;
                v133 = v22;
                v135 = v17;
                v137 = v16;
                v59 = v58;
                v60 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
                objc_msgSend(MEMORY[0x24BDD1970], "valueTransformerForName:", CFSTR("VSAMSAppsValueTransformer"));
                v61 = (void *)objc_claimAutoreleasedReturnValue();
                v140 = 0u;
                v141 = 0u;
                v142 = 0u;
                v143 = 0u;
                v62 = v59;
                v63 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v140, v154, 16);
                if (v63)
                {
                  v64 = v63;
                  v65 = *(_QWORD *)v141;
                  do
                  {
                    for (i = 0; i != v64; ++i)
                    {
                      if (*(_QWORD *)v141 != v65)
                        objc_enumerationMutation(v62);
                      v67 = *(NSObject **)(*((_QWORD *)&v140 + 1) + 8 * i);
                      objc_msgSend(v61, "transformedValue:", v67);
                      v68 = (void *)objc_claimAutoreleasedReturnValue();
                      if (v68)
                      {
                        objc_msgSend(v60, "addObject:", v68);
                      }
                      else
                      {
                        VSErrorLogObject();
                        v69 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
                        {
                          *(_DWORD *)buf = 138412290;
                          v156 = v67;
                          _os_log_error_impl(&dword_2303C5000, v69, OS_LOG_TYPE_ERROR, "App dictionary contained data but no attributes: %@", buf, 0xCu);
                        }

                      }
                    }
                    v64 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v140, v154, 16);
                  }
                  while (v64);
                }

                v22 = v133;
                if (v133)
                  -[NSObject setNonChannelAppDescriptions:](v133, "setNonChannelAppDescriptions:", v60);

                v10 = v105;
                v9 = v114;
                v17 = v135;
                v16 = v137;
                v56 = v129;
                v55 = v131;
              }

              v11 = v139;
              goto LABEL_80;
            }
            VSErrorLogObject();
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v156 = v87;
              v157 = 2112;
              v158 = v12;
              _os_log_error_impl(&dword_2303C5000, v16, OS_LOG_TYPE_ERROR, "Unexpected value as item in %@ array: %@", buf, 0x16u);
            }
LABEL_80:

            ++v11;
          }
          while (v11 != v9);
          v71 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v150, v161, 16);
          v9 = v71;
          if (!v71)
          {
            v7 = v84;
            v3 = v85;
            v5 = v96;
            goto LABEL_95;
          }
        }
      }
      VSErrorLogObject();
      obj = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR))
        -[VSAMSIdentityProviderResponseDictionaryValueTransformer transformedValue:].cold.3(obj, v74, v75);
LABEL_95:

    }
    else
    {
      VSErrorLogObject();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[VSAMSIdentityProviderResponseDictionaryValueTransformer transformedValue:].cold.2(v7, v72, v73);
    }

  }
  else
  {
    VSErrorLogObject();
    v98 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v98, OS_LOG_TYPE_ERROR))
      -[VSAMSIdentityProviderResponseDictionaryValueTransformer transformedValue:].cold.6((uint64_t)v3, v98);
  }

  if (objc_msgSend(v5, "count"))
  {
    v76 = (void *)MEMORY[0x24BDF8BF0];
    v77 = (void *)objc_msgSend(v5, "copy");
    objc_msgSend(v76, "failableWithObject:", v77);
    v78 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    VSErrorLogObject();
    v79 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
      -[VSAMSIdentityProviderResponseDictionaryValueTransformer transformedValue:].cold.1(v79, v80, v81);

    VSPublicError();
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF8BF0], "failableWithError:", v77);
    v78 = objc_claimAutoreleasedReturnValue();
  }
  v82 = (void *)v78;

  return v82;
}

void __76__VSAMSIdentityProviderResponseDictionaryValueTransformer_transformedValue___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  objc_class *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;

  v16 = a3;
  objc_msgSend(a2, "lowercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v6 = (void *)MEMORY[0x24BDBCE88];
      v7 = *MEMORY[0x24BDBCAB8];
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "raise:format:", v7, CFSTR("Unexpectedly, value was %@, instead of NSDictionary."), v9);

    }
    v10 = *MEMORY[0x24BDF8DC0];
    v11 = v16;
    objc_msgSend(v11, "vs_numberForKey:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "BOOLValue");

    objc_msgSend(v11, "vs_numberForKey:", *MEMORY[0x24BDF8DC8]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = objc_alloc_init(MEMORY[0x24BDF8C10]);
    objc_msgSend(v15, "setStorefrontTwoCharCode:", v5);
    objc_msgSend(v15, "setIsFeatured:", v13);
    objc_msgSend(v15, "setSortOrdinal:", v14);
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v15);

  }
}

- (void)transformedValue:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_0_0(&dword_2303C5000, a1, a3, "No identity providers.  Will fail as temporarily unavailable.", v3);
  OUTLINED_FUNCTION_4();
}

- (void)transformedValue:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_0_0(&dword_2303C5000, a1, a3, "No value for root key.", v3);
  OUTLINED_FUNCTION_4();
}

- (void)transformedValue:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_0_0(&dword_2303C5000, a1, a3, "No providers in response.", v3);
  OUTLINED_FUNCTION_4();
}

- (void)transformedValue:(NSObject *)a3 .cold.4(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_0_0(&dword_2303C5000, a3, (uint64_t)a3, "No attributes dictionary for provider", a1);
}

- (void)transformedValue:(os_log_t)log .cold.5(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_fault_impl(&dword_2303C5000, log, OS_LOG_TYPE_FAULT, "Failed to get current version. Skipping TV Provider minimumOSVersion check.", buf, 2u);
}

- (void)transformedValue:(uint64_t)a1 .cold.6(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_2303C5000, a2, OS_LOG_TYPE_ERROR, "Response was not a dictionary: %@", (uint8_t *)&v2, 0xCu);
}

@end
