@implementation PPMeCardCache

- (id)loadMeCardCache
{
  void *v3;
  void *v4;
  char v5;
  NSObject *v6;
  _BOOL4 v7;
  NSString *path;
  id v9;
  NSString *v10;
  void *v11;
  PPPBContact *v12;
  NSObject *p_super;
  void *v14;
  double v15;
  double v16;
  NSObject *v17;
  uint64_t v18;
  NSString *v19;
  void *v20;
  NSString *v21;
  NSObject *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t j;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t k;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  id v61;
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
  void *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t m;
  void *v77;
  void *v78;
  void *v79;
  uint64_t v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  PPMeCardCache *v92;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  PPMeCardCache *v102;
  void *v103;
  NSObject *v104;
  void *v105;
  NSObject *v106;
  NSObject *v107;
  void *v108;
  id obj;
  id obja;
  void *v111;
  uint64_t v112;
  void *v113;
  uint64_t v114;
  int v115;
  void *context;
  id contexta;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  id v138;
  _BYTE v139[128];
  _BYTE v140[128];
  _BYTE v141[128];
  uint8_t v142[128];
  uint8_t buf[4];
  uint64_t v144;
  __int16 v145;
  NSObject *v146;
  uint64_t v147;

  v147 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1C3BD6630](self, a2);
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "fileExistsAtPath:", self->_path);

  pp_contacts_log_handle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if ((v5 & 1) != 0)
  {
    if (v7)
    {
      path = self->_path;
      *(_DWORD *)buf = 138412290;
      v144 = (uint64_t)path;
      _os_log_impl(&dword_1C392E000, v6, OS_LOG_TYPE_INFO, "PPPB: loading Me card cache from: %@", buf, 0xCu);
    }

    v9 = objc_alloc(MEMORY[0x1E0C99D50]);
    v10 = self->_path;
    v138 = 0;
    v11 = (void *)objc_msgSend(v9, "initWithContentsOfFile:options:error:", v10, 1, &v138);
    v6 = v138;
    if (!v11)
    {
      pp_contacts_log_handle();
      p_super = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
      {
        v21 = self->_path;
        *(_DWORD *)buf = 138412546;
        v144 = (uint64_t)v21;
        v145 = 2112;
        v146 = v6;
        _os_log_impl(&dword_1C392E000, p_super, OS_LOG_TYPE_DEFAULT, "PPPB: failed to read %@: error: %@", buf, 0x16u);
      }
      v20 = 0;
      goto LABEL_82;
    }
    v12 = -[PPPBContact initWithData:]([PPPBContact alloc], "initWithData:", v11);
    p_super = &v12->super.super;
    if (v12)
    {
      if (-[PPPBContact hasCreatedAt](v12, "hasCreatedAt"))
      {
        v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceNow:", -1209600.0);
        v15 = (double)-[NSObject createdAt](p_super, "createdAt");
        objc_msgSend(v14, "timeIntervalSinceReferenceDate");
        if (v16 > v15)
        {
          pp_contacts_log_handle();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            v18 = -[NSObject createdAt](p_super, "createdAt");
            *(_DWORD *)buf = 134217984;
            v144 = v18;
            _os_log_impl(&dword_1C392E000, v17, OS_LOG_TYPE_INFO, "PPPB: aging out me card cache due to age: %lld", buf, 0xCu);
          }

          -[PPMeCardCache deleteMeCardCache](self, "deleteMeCardCache");
        }

      }
      else
      {
        -[PPMeCardCache deleteMeCardCache](self, "deleteMeCardCache");
      }
      if (-[NSObject hasIdentifier](p_super, "hasIdentifier"))
      {
        -[NSObject identifier](p_super, "identifier");
        v24 = objc_claimAutoreleasedReturnValue();
        if (v24)
        {
          v25 = (void *)v24;
          -[NSObject identifier](p_super, "identifier");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v26, "length");

          if (v27)
          {
            v102 = self;
            v103 = v11;
            v104 = v6;
            v105 = v3;
            v106 = p_super;
            v107 = objc_opt_new();
            v134 = 0u;
            v135 = 0u;
            v136 = 0u;
            v137 = 0u;
            -[NSObject phoneNumbers](p_super, "phoneNumbers");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v134, v142, 16);
            if (v29)
            {
              v30 = v29;
              v31 = *(_QWORD *)v135;
              do
              {
                for (i = 0; i != v30; ++i)
                {
                  if (*(_QWORD *)v135 != v31)
                    objc_enumerationMutation(v28);
                  v33 = *(void **)(*((_QWORD *)&v134 + 1) + 8 * i);
                  v34 = (void *)MEMORY[0x1C3BD6630]();
                  objc_msgSend(v33, "value");
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  v36 = objc_msgSend(v35, "length");

                  if (v36)
                  {
                    v37 = (void *)MEMORY[0x1E0D70B70];
                    objc_msgSend(v33, "label");
                    v38 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v33, "value");
                    v39 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v37, "labeledValueWithLabel:value:", v38, v39);
                    v40 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v40)
                      -[NSObject addObject:](v107, "addObject:", v40);

                  }
                  objc_autoreleasePoolPop(v34);
                }
                v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v134, v142, 16);
              }
              while (v30);
            }

            v108 = (void *)objc_opt_new();
            v130 = 0u;
            v131 = 0u;
            v132 = 0u;
            v133 = 0u;
            -[NSObject emailAddresses](v106, "emailAddresses");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v130, v141, 16);
            if (v42)
            {
              v43 = v42;
              v44 = *(_QWORD *)v131;
              do
              {
                for (j = 0; j != v43; ++j)
                {
                  if (*(_QWORD *)v131 != v44)
                    objc_enumerationMutation(v41);
                  v46 = *(void **)(*((_QWORD *)&v130 + 1) + 8 * j);
                  v47 = (void *)MEMORY[0x1C3BD6630]();
                  objc_msgSend(v46, "value");
                  v48 = (void *)objc_claimAutoreleasedReturnValue();
                  v49 = objc_msgSend(v48, "length");

                  if (v49)
                  {
                    v50 = (void *)MEMORY[0x1E0D70B70];
                    objc_msgSend(v46, "label");
                    v51 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v46, "value");
                    v52 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v50, "labeledValueWithLabel:value:", v51, v52);
                    v53 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v53)
                      objc_msgSend(v108, "addObject:", v53);

                  }
                  objc_autoreleasePoolPop(v47);
                }
                v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v130, v141, 16);
              }
              while (v43);
            }

            v111 = (void *)objc_opt_new();
            v126 = 0u;
            v127 = 0u;
            v128 = 0u;
            v129 = 0u;
            -[NSObject postalAddresses](v106, "postalAddresses");
            obj = (id)objc_claimAutoreleasedReturnValue();
            v114 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v126, v140, 16);
            if (v114)
            {
              v112 = *(_QWORD *)v127;
              do
              {
                for (k = 0; k != v114; ++k)
                {
                  if (*(_QWORD *)v127 != v112)
                    objc_enumerationMutation(obj);
                  v55 = *(void **)(*((_QWORD *)&v126 + 1) + 8 * k);
                  v56 = MEMORY[0x1C3BD6630]();
                  objc_msgSend(v55, "street");
                  v57 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v57, "componentsSeparatedByString:", CFSTR("\n"));
                  v58 = (void *)objc_claimAutoreleasedReturnValue();

                  if (objc_msgSend(v58, "count") == 2)
                  {
                    objc_msgSend(v58, "objectAtIndexedSubscript:", 0);
                    v120 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v58, "objectAtIndexedSubscript:", 1);
                    v118 = (void *)objc_claimAutoreleasedReturnValue();
                  }
                  else
                  {
                    objc_msgSend(v55, "street");
                    v118 = 0;
                    v120 = (void *)objc_claimAutoreleasedReturnValue();
                  }
                  context = (void *)v56;
                  if (objc_msgSend(v55, "hasCountry"))
                  {
                    objc_msgSend(v55, "country");
                    v59 = objc_claimAutoreleasedReturnValue();
LABEL_58:
                    v60 = (void *)v59;
                    goto LABEL_60;
                  }
                  if (objc_msgSend(v55, "hasIsoCountryCode"))
                  {
                    objc_msgSend(v55, "isoCountryCode");
                    v59 = objc_claimAutoreleasedReturnValue();
                    goto LABEL_58;
                  }
                  v60 = 0;
LABEL_60:
                  v61 = objc_alloc(MEMORY[0x1E0D70BF8]);
                  objc_msgSend(v55, "city");
                  v62 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v55, "subLocality");
                  v63 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v55, "state");
                  v64 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v55, "subAdministrativeArea");
                  v65 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v55, "postalCode");
                  v66 = (void *)objc_claimAutoreleasedReturnValue();
                  v67 = (void *)objc_msgSend(v61, "initWithThoroughfare:subThoroughfare:locality:subLocality:administrativeArea:subAdministrativeArea:postalCode:country:", v120, v118, v62, v63, v64, v65, v66, v60);

                  v68 = (void *)MEMORY[0x1E0D70B70];
                  objc_msgSend(v55, "label");
                  v69 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v68, "labeledValueWithLabel:value:", v69, v67);
                  v70 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v70)
                    objc_msgSend(v111, "addObject:", v70);

                  objc_autoreleasePoolPop(context);
                }
                v114 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v126, v140, 16);
              }
              while (v114);
            }

            v71 = (void *)objc_opt_new();
            v122 = 0u;
            v123 = 0u;
            v124 = 0u;
            v125 = 0u;
            -[NSObject socialProfiles](v106, "socialProfiles");
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            v73 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v122, v139, 16);
            if (v73)
            {
              v74 = v73;
              v75 = *(_QWORD *)v123;
              do
              {
                for (m = 0; m != v74; ++m)
                {
                  if (*(_QWORD *)v123 != v75)
                    objc_enumerationMutation(v72);
                  v77 = *(void **)(*((_QWORD *)&v122 + 1) + 8 * m);
                  v78 = (void *)MEMORY[0x1C3BD6630]();
                  objc_msgSend(v77, "username");
                  v79 = (void *)objc_claimAutoreleasedReturnValue();
                  v80 = objc_msgSend(v79, "length");

                  if (v80)
                  {
                    v81 = (void *)MEMORY[0x1E0D70B70];
                    objc_msgSend(v77, "label");
                    v82 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v77, "username");
                    v83 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v81, "labeledValueWithLabel:value:", v82, v83);
                    v84 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v84)
                      objc_msgSend(v71, "addObject:", v84);

                  }
                  objc_autoreleasePoolPop(v78);
                }
                v74 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v122, v139, 16);
              }
              while (v74);
            }

            contexta = objc_alloc(MEMORY[0x1E0D70B00]);
            -[NSObject identifier](v106, "identifier");
            v85 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject namePrefix](v106, "namePrefix");
            v86 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject givenName](v106, "givenName");
            v87 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject middleName](v106, "middleName");
            v88 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject familyName](v106, "familyName");
            v89 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject nameSuffix](v106, "nameSuffix");
            v90 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject nickname](v106, "nickname");
            v91 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject organizationName](v106, "organizationName");
            v121 = (void *)objc_claimAutoreleasedReturnValue();
            v115 = -[NSObject hasBirthday](v106, "hasBirthday");
            if (v115)
            {
              -[NSObject birthday](v106, "birthday");
              v92 = v102;
              v101 = (void *)objc_claimAutoreleasedReturnValue();
              -[PPMeCardCache _dateComponentsFromCachedDateComponents:](v102, v101);
              v119 = (void *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v119 = 0;
              v92 = v102;
            }
            if ((-[NSObject hasNonGregorianBirthday](v106, "hasNonGregorianBirthday") & 1) != 0)
            {
              -[NSObject nonGregorianBirthday](v106, "nonGregorianBirthday");
              v113 = v90;
              obja = v89;
              v94 = (void *)objc_claimAutoreleasedReturnValue();
              -[PPMeCardCache _dateComponentsFromCachedDateComponents:](v92, v94);
              v95 = v91;
              v96 = v88;
              v97 = v87;
              v98 = v86;
              v99 = v85;
              v100 = (void *)objc_claimAutoreleasedReturnValue();
              v22 = v107;
              v20 = (void *)objc_msgSend(contexta, "initWithIdentifier:source:namePrefix:givenName:middleName:familyName:nameSuffix:nickname:localizedFullName:organizationName:jobTitle:birthday:nonGregorianBirthday:phoneNumbers:emailAddresses:socialProfiles:postalAddresses:", v99, 1, v98, v97, v96, obja, v113, v95, 0, v121, 0, v119, v100, v107, v108,
                              v71,
                              v111);

              v85 = v99;
              v86 = v98;
              v87 = v97;
              v88 = v96;
              v91 = v95;

              v89 = obja;
              v90 = v113;
            }
            else
            {
              v22 = v107;
              v20 = (void *)objc_msgSend(contexta, "initWithIdentifier:source:namePrefix:givenName:middleName:familyName:nameSuffix:nickname:localizedFullName:organizationName:jobTitle:birthday:nonGregorianBirthday:phoneNumbers:emailAddresses:socialProfiles:postalAddresses:", v85, 1, v86, v87, v88, v89, v90, v91, 0, v121, 0, v119, 0, v107, v108,
                              v71,
                              v111);
            }
            if (v115)
            {

            }
            v6 = v104;
            v3 = v105;
            v11 = v103;
            p_super = v106;
            goto LABEL_81;
          }
        }
      }
      -[PPMeCardCache deleteMeCardCache](self, "deleteMeCardCache");
      pp_contacts_log_handle();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v23 = "PPPB: malformed me card cache (missing identifier)";
        goto LABEL_79;
      }
    }
    else
    {
      -[PPMeCardCache deleteMeCardCache](self, "deleteMeCardCache");
      pp_contacts_log_handle();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v23 = "PPPB: malformed me card cache (PPPBContact initialization failed)";
LABEL_79:
        _os_log_impl(&dword_1C392E000, v22, OS_LOG_TYPE_DEFAULT, v23, buf, 2u);
      }
    }
    v20 = 0;
LABEL_81:

LABEL_82:
    goto LABEL_83;
  }
  if (v7)
  {
    v19 = self->_path;
    *(_DWORD *)buf = 138412290;
    v144 = (uint64_t)v19;
    _os_log_impl(&dword_1C392E000, v6, OS_LOG_TYPE_INFO, "PPPB: No Me card cache at: %@", buf, 0xCu);
  }
  v20 = 0;
LABEL_83:

  objc_autoreleasePoolPop(v3);
  return v20;
}

- (BOOL)writeMeCardCache:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t k;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  id v51;
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
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t m;
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
  void *v85;
  void *v86;
  void *v87;
  NSString *path;
  char v89;
  id v90;
  NSObject *v91;
  NSString *v93;
  void *v94;
  void *context;
  PPMeCardCache *v96;
  void *v97;
  void *v98;
  id obj;
  uint64_t v100;
  void *v101;
  id v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  uint8_t buf[4];
  NSString *v120;
  __int16 v121;
  id v122;
  _BYTE v123[128];
  _BYTE v124[128];
  _BYTE v125[128];
  _BYTE v126[128];
  uint64_t v127;

  v127 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPMeCardCache.m"), 225, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("meCardCache"));

  }
  v96 = self;
  context = (void *)MEMORY[0x1C3BD6630]();
  v6 = (void *)objc_opt_new();
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "timeIntervalSinceReferenceDate");
  objc_msgSend(v6, "setCreatedAt:", (uint64_t)v8);

  objc_msgSend(v5, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setIdentifier:", v9);

  objc_msgSend(v5, "givenName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setGivenName:", v10);

  objc_msgSend(v5, "middleName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMiddleName:", v11);

  objc_msgSend(v5, "familyName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFamilyName:", v12);

  objc_msgSend(v5, "nickname");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setNickname:", v13);

  objc_msgSend(v5, "organizationName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setOrganizationName:", v14);

  objc_msgSend(v5, "namePrefix");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setNamePrefix:", v15);

  objc_msgSend(v5, "nameSuffix");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v97 = v6;
  objc_msgSend(v6, "setNameSuffix:", v16);

  v17 = (void *)objc_opt_new();
  v115 = 0u;
  v116 = 0u;
  v117 = 0u;
  v118 = 0u;
  v98 = v5;
  objc_msgSend(v5, "phoneNumbers");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v115, v126, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v116;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v116 != v21)
          objc_enumerationMutation(v18);
        v23 = *(void **)(*((_QWORD *)&v115 + 1) + 8 * i);
        v24 = (void *)MEMORY[0x1C3BD6630]();
        v25 = (void *)objc_opt_new();
        objc_msgSend(v23, "label");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setLabel:", v26);

        objc_msgSend(v23, "value");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setValue:", v27);

        objc_msgSend(v17, "addObject:", v25);
        objc_autoreleasePoolPop(v24);
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v115, v126, 16);
    }
    while (v20);
  }

  objc_msgSend(v97, "setPhoneNumbers:", v17);
  v28 = (void *)objc_opt_new();
  v111 = 0u;
  v112 = 0u;
  v113 = 0u;
  v114 = 0u;
  objc_msgSend(v5, "emailAddresses");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v111, v125, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v112;
    do
    {
      for (j = 0; j != v31; ++j)
      {
        if (*(_QWORD *)v112 != v32)
          objc_enumerationMutation(v29);
        v34 = *(void **)(*((_QWORD *)&v111 + 1) + 8 * j);
        v35 = (void *)MEMORY[0x1C3BD6630]();
        v36 = (void *)objc_opt_new();
        objc_msgSend(v34, "label");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "setLabel:", v37);

        objc_msgSend(v34, "value");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "setValue:", v38);

        objc_msgSend(v28, "addObject:", v36);
        objc_autoreleasePoolPop(v35);
      }
      v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v111, v125, 16);
    }
    while (v31);
  }

  objc_msgSend(v97, "setEmailAddresses:", v28);
  v101 = (void *)objc_opt_new();
  v107 = 0u;
  v108 = 0u;
  v109 = 0u;
  v110 = 0u;
  objc_msgSend(v5, "postalAddresses");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v107, v124, 16);
  if (v39)
  {
    v40 = v39;
    v100 = *(_QWORD *)v108;
    do
    {
      for (k = 0; k != v40; ++k)
      {
        if (*(_QWORD *)v108 != v100)
          objc_enumerationMutation(obj);
        v42 = *(void **)(*((_QWORD *)&v107 + 1) + 8 * k);
        v43 = (void *)MEMORY[0x1C3BD6630]();
        v44 = (void *)objc_opt_new();
        objc_msgSend(v42, "label");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "setLabel:", v45);

        objc_msgSend(v42, "value");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "thoroughfare");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v47, "length"))
        {
          objc_msgSend(v42, "value");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "subThoroughfare");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = objc_msgSend(v49, "length");

          if (v50)
          {
            v51 = objc_alloc(MEMORY[0x1E0CB3940]);
            objc_msgSend(v42, "value");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "thoroughfare");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "value");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "subThoroughfare");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            v56 = (void *)objc_msgSend(v51, "initWithFormat:", CFSTR("%@\n%@"), v53, v55, context);
            objc_msgSend(v44, "setStreet:", v56);

            goto LABEL_27;
          }
        }
        else
        {

        }
        objc_msgSend(v42, "value");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "thoroughfare");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "setStreet:", v53);
LABEL_27:

        objc_msgSend(v42, "value");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "subLocality");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "setSubLocality:", v58);

        objc_msgSend(v42, "value");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "locality");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "setCity:", v60);

        objc_msgSend(v42, "value");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "subAdministrativeArea");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "setSubAdministrativeArea:", v62);

        objc_msgSend(v42, "value");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "administrativeArea");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "setState:", v64);

        objc_msgSend(v42, "value");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "postalCode");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "setPostalCode:", v66);

        objc_msgSend(v42, "value");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "country");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "setCountry:", v68);

        objc_msgSend(v101, "addObject:", v44);
        objc_autoreleasePoolPop(v43);
      }
      v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v107, v124, 16);
    }
    while (v40);
  }

  objc_msgSend(v97, "setPostalAddresses:", v101);
  v69 = (void *)objc_opt_new();
  v103 = 0u;
  v104 = 0u;
  v105 = 0u;
  v106 = 0u;
  objc_msgSend(v98, "socialProfiles");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v103, v123, 16);
  if (v71)
  {
    v72 = v71;
    v73 = *(_QWORD *)v104;
    do
    {
      for (m = 0; m != v72; ++m)
      {
        if (*(_QWORD *)v104 != v73)
          objc_enumerationMutation(v70);
        v75 = *(void **)(*((_QWORD *)&v103 + 1) + 8 * m);
        v76 = (void *)MEMORY[0x1C3BD6630]();
        v77 = (void *)objc_opt_new();
        objc_msgSend(v75, "label");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v77, "setLabel:", v78);

        objc_msgSend(v75, "value");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v77, "setUsername:", v79);

        objc_msgSend(v75, "label");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v77, "setService:", v80);

        objc_msgSend(v69, "addObject:", v77);
        objc_autoreleasePoolPop(v76);
      }
      v72 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v103, v123, 16);
    }
    while (v72);
  }

  objc_msgSend(v97, "setSocialProfiles:", v69);
  objc_msgSend(v98, "birthday");
  v81 = (void *)objc_claimAutoreleasedReturnValue();

  if (v81)
  {
    objc_msgSend(v98, "birthday");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    -[PPMeCardCache _cachedDateComponentsFromDateComponents:](v96, v82);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v97, "setBirthday:", v83);

  }
  objc_msgSend(v98, "nonGregorianBirthday");
  v84 = (void *)objc_claimAutoreleasedReturnValue();

  if (v84)
  {
    objc_msgSend(v98, "nonGregorianBirthday");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    -[PPMeCardCache _cachedDateComponentsFromDateComponents:](v96, v85);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v97, "setNonGregorianBirthday:", v86);

  }
  objc_msgSend(v97, "data");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  path = v96->_path;
  v102 = 0;
  v89 = objc_msgSend(v87, "writeToFile:options:error:", path, 1073741825, &v102);
  v90 = v102;

  if ((v89 & 1) == 0)
  {
    pp_contacts_log_handle();
    v91 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR))
    {
      v93 = v96->_path;
      *(_DWORD *)buf = 138412546;
      v120 = v93;
      v121 = 2112;
      v122 = v90;
      _os_log_error_impl(&dword_1C392E000, v91, OS_LOG_TYPE_ERROR, "failed to write me card cache at: %@ error: %@", buf, 0x16u);
    }

  }
  objc_autoreleasePoolPop(context);

  return v89;
}

- (BOOL)deleteMeCardCache
{
  void *v3;
  char v4;
  void *v5;
  NSString *path;
  char v7;
  NSObject *v8;
  BOOL v9;
  NSObject *v10;
  NSString *v12;
  id v13;
  uint8_t buf[4];
  NSString *v15;
  __int16 v16;
  NSObject *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "fileExistsAtPath:", self->_path);

  if ((v4 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    path = self->_path;
    v13 = 0;
    v7 = objc_msgSend(v5, "removeItemAtPath:error:", path, &v13);
    v8 = v13;

    if ((v7 & 1) != 0)
    {
      v9 = 1;
    }
    else
    {
      pp_contacts_log_handle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v12 = self->_path;
        *(_DWORD *)buf = 138412546;
        v15 = v12;
        v16 = 2112;
        v17 = v8;
        _os_log_error_impl(&dword_1C392E000, v10, OS_LOG_TYPE_ERROR, "failed to delete me card cache at: %@ error: %@", buf, 0x16u);
      }

      v9 = 0;
    }
  }
  else
  {
    pp_contacts_log_handle();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = 1;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C392E000, v8, OS_LOG_TYPE_INFO, "went to delete Me card cache but file was missing", buf, 2u);
    }
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
}

- (id)_cachedDateComponentsFromDateComponents:(void *)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a2;
  if (a1)
  {
    a1 = (void *)objc_opt_new();
    if (objc_msgSend(v3, "day") != 0x7FFFFFFFFFFFFFFFLL)
      objc_msgSend(a1, "setDay:", objc_msgSend(v3, "day"));
    if (objc_msgSend(v3, "month") != 0x7FFFFFFFFFFFFFFFLL)
      objc_msgSend(a1, "setMonth:", objc_msgSend(v3, "month"));
    if (objc_msgSend(v3, "year") != 0x7FFFFFFFFFFFFFFFLL)
      objc_msgSend(a1, "setYear:", objc_msgSend(v3, "year"));
    objc_msgSend(v3, "calendar");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "calendarIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setCalendarIdentifier:", v5);

    objc_msgSend(v3, "timeZone");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setTimeZoneName:", v7);

  }
  return a1;
}

- (id)_dateComponentsFromCachedDateComponents:(void *)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a2;
  if (a1)
  {
    a1 = (void *)objc_opt_new();
    if (objc_msgSend(v3, "hasDay"))
      objc_msgSend(a1, "setDay:", (int)objc_msgSend(v3, "day"));
    if (objc_msgSend(v3, "hasMonth"))
      objc_msgSend(a1, "setMonth:", (int)objc_msgSend(v3, "month"));
    if (objc_msgSend(v3, "hasYear"))
      objc_msgSend(a1, "setYear:", (int)objc_msgSend(v3, "year"));
    if (objc_msgSend(v3, "hasCalendarIdentifier"))
    {
      v4 = (void *)MEMORY[0x1E0C99D48];
      objc_msgSend(v3, "calendarIdentifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "calendarWithIdentifier:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "setCalendar:", v6);

    }
    if (objc_msgSend(v3, "hasTimeZoneName"))
    {
      v7 = (void *)MEMORY[0x1E0C99E80];
      objc_msgSend(v3, "timeZoneName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "timeZoneWithName:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "setTimeZone:", v9);

    }
  }

  return a1;
}

@end
