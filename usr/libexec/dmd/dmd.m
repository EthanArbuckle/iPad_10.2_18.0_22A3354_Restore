void sub_100003D28(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  DMDPolicyRegistration *v16;
  uint64_t v17;
  NSObject *v18;
  const char *v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  NSDate *v26;
  unsigned int v27;
  id v28;
  void *v29;
  void *v30;
  uint64_t v31;
  NSObject *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  id v36;
  id v37;
  uint8_t buf[4];
  DMDPolicyRegistration *v39;
  __int16 v40;
  void *v41;
  NSErrorUserInfoKey v42;
  id v43;

  v5 = a2;
  v6 = a3;
  if (!v6)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "identifier"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[DMDPolicyRegistration fetchRequest](DMDPolicyRegistration, "fetchRequest"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("identifier"), v10));
    objc_msgSend(v12, "setPredicate:", v13);

    v37 = 0;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "execute:", &v37));
    v15 = v37;
    if (!v14)
    {
      v20 = DMFPolicyLog();
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        sub_1000789E4(v15);

      v22 = *(_QWORD *)(a1 + 48);
      v23 = DMFErrorWithCodeAndUserInfo(3900, 0);
      v16 = (DMDPolicyRegistration *)objc_claimAutoreleasedReturnValue(v23);
      (*(void (**)(uint64_t, _QWORD, DMDPolicyRegistration *))(v22 + 16))(v22, 0, v16);
      goto LABEL_21;
    }
    v35 = v14;
    if (objc_msgSend(v14, "count"))
    {
      v16 = (DMDPolicyRegistration *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "firstObject"));
      v17 = DMFPolicyLog();
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v39 = v16;
        v40 = 2114;
        v41 = v10;
        v19 = "Updating existing registration %{public}@ with identifier %{public}@";
LABEL_14:
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, v19, buf, 0x16u);
      }
    }
    else
    {
      v16 = -[DMDPolicyRegistration initWithContext:]([DMDPolicyRegistration alloc], "initWithContext:", v5);
      v24 = DMFPolicyLog();
      v18 = objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v39 = v16;
        v40 = 2114;
        v41 = v10;
        v19 = "Adding new registration %{public}@ with identifier %{public}@";
        goto LABEL_14;
      }
    }

    -[DMDPolicyRegistration setIdentifier:](v16, "setIdentifier:", v10);
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "policyTypes"));
    -[DMDPolicyRegistration setPolicyTypes:](v16, "setPolicyTypes:", v25);
    v26 = objc_opt_new(NSDate);
    -[DMDPolicyRegistration setModificationDate:](v16, "setModificationDate:", v26);

    v36 = v15;
    v27 = objc_msgSend(v5, "save:", &v36);
    v28 = v36;

    if (v27)
    {
      v29 = *(void **)(a1 + 40);
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "allObjects"));
      objc_msgSend(v29, "requestPoliciesForTypes:replyHandler:", v30, *(_QWORD *)(a1 + 48));
    }
    else
    {
      v31 = DMFPolicyLog();
      v32 = objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        sub_100078A5C((uint64_t)v16, v28);

      v33 = *(_QWORD *)(a1 + 48);
      v34 = DMFErrorWithCodeAndUserInfo(3901, 0);
      v30 = (void *)objc_claimAutoreleasedReturnValue(v34);
      (*(void (**)(uint64_t, _QWORD, void *))(v33 + 16))(v33, 0, v30);
    }
    v14 = v35;

    v15 = v28;
LABEL_21:

    goto LABEL_22;
  }
  v7 = DMFPolicyLog();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    sub_100078AE0(v6);

  v9 = *(_QWORD *)(a1 + 48);
  v42 = NSUnderlyingErrorKey;
  v43 = v6;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1));
  v11 = DMFErrorWithCodeAndUserInfo(3901, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  (*(void (**)(uint64_t, _QWORD, void *))(v9 + 16))(v9, 0, v12);
LABEL_22:

}

void sub_1000042D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100004480(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100004494(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSMutableArray *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  NSMutableArray *v27;
  void *v28;
  uint64_t v29;
  void *i;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  NSObject *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  id v39;
  id v40;
  uint64_t v41;
  void *j;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  const __CFString *v51;
  void *v52;
  void *v53;
  id v54;
  id v55;
  id v56;
  id v57;
  uint64_t v58;
  void *k;
  void *v60;
  void *v61;
  id v62;
  id v63;
  id v64;
  void *v65;
  void *v66;
  uint64_t v67;
  unint64_t v68;
  void *v69;
  void *v70;
  void *v71;
  unsigned __int8 v72;
  void *v73;
  id v74;
  void *v75;
  id v76;
  id v77;
  void *v78;
  void *v79;
  unsigned int v80;
  id v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  id v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  id v90;
  id obj;
  uint64_t v92;
  void *v93;
  NSMutableArray *v94;
  void *v95;
  uint64_t v96;
  id v97;
  id v98;
  void *v99;
  void *v100;
  NSMutableArray *v101;
  id v102;
  uint64_t v103;
  unint64_t v104;
  void *v105;
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
  id v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  _BYTE v123[128];
  _BYTE v124[128];
  _BYTE v125[128];
  uint8_t v126[4];
  uint64_t v127;
  _QWORD v128[2];
  _BYTE v129[128];
  NSErrorUserInfoKey v130;
  id v131;

  v85 = a2;
  v5 = a3;
  if (!v5)
  {
    v90 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
    v119 = 0u;
    v120 = 0u;
    v121 = 0u;
    v122 = 0u;
    obj = *(id *)(a1 + 32);
    v97 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v119, v129, 16);
    if (!v97)
      goto LABEL_78;
    v96 = *(_QWORD *)v120;
    v92 = DMFEffectivePolicyTypeApplication;
    v86 = DMFEffectivePolicyTypeWeb;
    v87 = DMFEffectivePolicyTypeApplicationCategory;
    v84 = DMFEffectivePolicyTypeWebCategory;
    v83 = DMFEffectivePolicyTypeiCloudAccountLogout;
    v88 = DMFEffectivePolicyTypeCategory;
    v89 = a1;
    while (1)
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v120 != v96)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v119 + 1) + 8 * (_QWORD)v11);
        v13 = objc_opt_new(NSMutableArray);
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[DMDEffectivePolicy fetchRequest](DMDEffectivePolicy, "fetchRequest"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("type"), v12));
        objc_msgSend(v14, "setPredicate:", v15);

        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", CFSTR("priority"), 0));
        v128[0] = v16;
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", CFSTR("policy"), 1));
        v128[1] = v17;
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v128, 2));
        objc_msgSend(v14, "setSortDescriptors:", v18);

        v118 = 0;
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "execute:", &v118));
        v20 = v118;
        if (v19)
        {
          -[NSMutableArray addObjectsFromArray:](v13, "addObjectsFromArray:", v19);
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "effectiveSettingsStore"));
          v105 = v12;
          v98 = v20;
          v99 = v19;
          v100 = v21;
          if (objc_msgSend(v12, "isEqualToString:", v92))
          {
            v116 = 0u;
            v117 = 0u;
            v114 = 0u;
            v115 = 0u;
            v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "shield"));
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "applications"));

            v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v114, v125, 16);
            if (v24)
            {
              v25 = v24;
              v26 = v14;
              v27 = v13;
              v28 = v11;
              v29 = *(_QWORD *)v115;
              do
              {
                for (i = 0; i != v25; i = (char *)i + 1)
                {
                  if (*(_QWORD *)v115 != v29)
                    objc_enumerationMutation(v23);
                  v31 = *(void **)(a1 + 40);
                  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v114 + 1)
                                                                                     + 8 * (_QWORD)i), "bundleIdentifier"));
                  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "_effectivePolicyForManagedSettingsIdentifier:type:excludedIdentifiers:", v32, v105, 0));
                  -[NSMutableArray addObject:](v27, "addObject:", v33);

                }
                v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v114, v125, 16);
              }
              while (v25);
              goto LABEL_29;
            }
            goto LABEL_35;
          }
          if (objc_msgSend(v12, "isEqualToString:", v86))
          {
            v112 = 0u;
            v113 = 0u;
            v110 = 0u;
            v111 = 0u;
            v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "shield"));
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "webDomains"));

            v39 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v110, v124, 16);
            if (v39)
            {
              v40 = v39;
              v26 = v14;
              v27 = v13;
              v28 = v11;
              v41 = *(_QWORD *)v111;
              do
              {
                for (j = 0; j != v40; j = (char *)j + 1)
                {
                  if (*(_QWORD *)v111 != v41)
                    objc_enumerationMutation(v23);
                  v43 = *(void **)(a1 + 40);
                  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v110 + 1)
                                                                                     + 8 * (_QWORD)j), "domain"));
                  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "_effectivePolicyForManagedSettingsIdentifier:type:excludedIdentifiers:", v44, v105, 0));
                  -[NSMutableArray addObject:](v27, "addObject:", v45);

                }
                v40 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v110, v124, 16);
              }
              while (v40);
LABEL_29:
              v11 = v28;
              v13 = v27;
              v14 = v26;
              v19 = v99;
              v21 = v100;
            }
LABEL_35:

LABEL_36:
            if (-[NSMutableArray count](v13, "count"))
            {
              v93 = v14;
              v95 = v11;
              v102 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v19, "count"));
              v54 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v19, "count"));
              v104 = DMFLowestPolicyPriority;
              v106 = 0u;
              v107 = 0u;
              v108 = 0u;
              v109 = 0u;
              v94 = v13;
              v101 = v13;
              v55 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v101, "countByEnumeratingWithState:objects:count:", &v106, v123, 16);
              if (v55)
              {
                v56 = v55;
                v57 = 0;
                v103 = 0;
                v58 = *(_QWORD *)v107;
                do
                {
                  for (k = 0; k != v56; k = (char *)k + 1)
                  {
                    if (*(_QWORD *)v107 != v58)
                      objc_enumerationMutation(v101);
                    v60 = *(void **)(*((_QWORD *)&v106 + 1) + 8 * (_QWORD)k);
                    v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "identifier"));
                    v62 = objc_msgSend(v60, "policy");
                    v63 = objc_msgSend(v60, "priority");
                    v64 = v63;
                    if (v61)
                    {
                      v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", v62));
                      objc_msgSend(v102, "setObject:forKeyedSubscript:", v65, v61);

                      v66 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", v64));
                      objc_msgSend(v54, "setObject:forKeyedSubscript:", v66, v61);

                    }
                    else
                    {
                      if ((uint64_t)v62 <= v103)
                        v67 = v103;
                      else
                        v67 = (uint64_t)v62;
                      v68 = v104;
                      if ((unint64_t)v63 < v104)
                        v68 = (unint64_t)v63;
                      v103 = v67;
                      v104 = v68;
                    }
                    v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "excludedIdentifiers"));
                    v70 = v69;
                    if (v69)
                    {
                      if (v57)
                        objc_msgSend(v57, "unionSet:", v69);
                      else
                        v57 = objc_msgSend(v69, "mutableCopy");
                    }

                  }
                  v56 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v101, "countByEnumeratingWithState:objects:count:", &v106, v123, 16);
                }
                while (v56);
              }
              else
              {
                v57 = 0;
                v103 = 0;
              }

              v20 = v98;
              if (objc_msgSend(v105, "isEqualToString:", v88))
              {
                a1 = v89;
                v71 = v102;
                v72 = objc_msgSend(*(id *)(v89 + 40), "isInLegacyDowntimeWithPolicies:priorities:", v102, v54);
                v73 = v93;
                v19 = v99;
              }
              else
              {
                a1 = v89;
                v73 = v93;
                v19 = v99;
                v71 = v102;
                if ((objc_msgSend(v105, "isEqualToString:", v87) & 1) != 0
                  || objc_msgSend(v105, "isEqualToString:", v84))
                {
                  v72 = objc_msgSend(*(id *)(v89 + 40), "isInManagedSettingsDowntime");
                }
                else
                {
                  v72 = 0;
                }
              }
              v74 = objc_alloc((Class)DMFEffectivePolicy);
              v75 = v71;
              if (!objc_msgSend(v71, "count"))
                v71 = 0;
              if (objc_msgSend(v54, "count"))
                v76 = v54;
              else
                v76 = 0;
              LOBYTE(v82) = v72;
              v77 = objc_msgSend(v74, "initWithType:defaultPolicy:currentPoliciesByIdentifier:defaultPriority:prioritiesByIdentifier:excludedIdentifiers:downtimeEnforced:", v105, v103, v71, v104, v76, v57, v82);
              objc_msgSend(v90, "setObject:forKeyedSubscript:", v77, v105);

              v13 = v94;
              v11 = v95;
              v21 = v100;
              v14 = v73;
            }
            else
            {
              v20 = v98;
            }
            goto LABEL_71;
          }
          if (objc_msgSend(v12, "isEqualToString:", v87))
          {
            v46 = *(void **)(a1 + 40);
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "shield"));
            v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "applicationCategories"));
            v48 = v46;
            v49 = v47;
            v50 = v12;
            v51 = CFSTR("bundleIdentifier");
          }
          else
          {
            if (!objc_msgSend(v12, "isEqualToString:", v84))
            {
              if (objc_msgSend(v12, "isEqualToString:", v83))
              {
                v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "account"));
                v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "denyiCloudLogout"));
                v80 = objc_msgSend(v79, "BOOLValue");

                if (v80)
                {
                  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "_effectivePolicyForManagedSettingsIdentifier:type:excludedIdentifiers:", 0, v12, 0));
                  -[NSMutableArray addObject:](v13, "addObject:", v23);
                  goto LABEL_35;
                }
              }
              goto LABEL_36;
            }
            v52 = *(void **)(a1 + 40);
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "shield"));
            v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "webDomainCategories"));
            v48 = v52;
            v49 = v47;
            v50 = v12;
            v51 = CFSTR("domain");
          }
          v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "_effectiveCategoryPoliciesForCategoryShieldPolicy:type:excludedIdentifiersKey:", v49, v50, v51));
          -[NSMutableArray addObjectsFromArray:](v13, "addObjectsFromArray:", v53);

          goto LABEL_35;
        }
        v34 = DMFPolicyLog();
        v35 = objc_claimAutoreleasedReturnValue(v34);
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          sub_100078B58(v126, v20, &v127, v35);

        v36 = *(_QWORD *)(a1 + 48);
        v37 = DMFErrorWithCodeAndUserInfo(3900, 0);
        v21 = (void *)objc_claimAutoreleasedReturnValue(v37);
        (*(void (**)(uint64_t, _QWORD, void *))(v36 + 16))(v36, 0, v21);
LABEL_71:

        if (!v19)
        {

          v7 = 0;
          v8 = v90;
          goto LABEL_80;
        }
        v11 = (char *)v11 + 1;
      }
      while (v11 != v97);
      v81 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v119, v129, 16);
      v97 = v81;
      if (!v81)
      {
LABEL_78:

        v8 = v90;
        (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
        v7 = 0;
        goto LABEL_80;
      }
    }
  }
  v6 = *(_QWORD *)(a1 + 48);
  v130 = NSUnderlyingErrorKey;
  v131 = v5;
  v7 = v5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v131, &v130, 1));
  v9 = DMFErrorWithCodeAndUserInfo(3900, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  (*(void (**)(uint64_t, _QWORD, void *))(v6 + 16))(v6, 0, v10);

LABEL_80:
}

uint64_t sub_100005194(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

void sub_1000051A8(uint64_t a1)
{
  void *v2;
  unint64_t date;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  double v12;
  double v13;
  uint64_t v14;
  NSObject *v15;
  _BOOL4 v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  double v23;

  v2 = (void *)xpc_copy_event(objc_msgSend(CFSTR("com.apple.alarm"), "UTF8String"), objc_msgSend(CFSTR("com.apple.dmd.emergency-mode.alarm"), "UTF8String"));
  if (v2)
  {
    date = xpc_dictionary_get_date(v2, (const char *)objc_msgSend(CFSTR("Date"), "UTF8String"));
    if (date < 0x3B9ACA00)
    {
      v4 = DMFEmergencyModeLog(date);
      v5 = objc_claimAutoreleasedReturnValue(v4);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
        sub_100078E74(v5);

      v6 = *(_QWORD *)(a1 + 32);
      v7 = DMFErrorWithCodeAndUserInfo(3902, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
      (*(void (**)(uint64_t, _QWORD, void *))(v6 + 16))(v6, 0, v8);
      goto LABEL_16;
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)(date / 0x3B9ACA00)));
    v11 = objc_msgSend(v8, "timeIntervalSinceNow");
    v13 = v12;
    v14 = DMFEmergencyModeLog(v11);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
    if (v13 <= 0.0)
    {
      if (v16)
      {
        v20 = 138543618;
        v21 = v8;
        v22 = 2048;
        v23 = v13;
        v17 = "Emergency Mode ended on %{public}@, %f seconds ago";
        goto LABEL_14;
      }
    }
    else if (v16)
    {
      v20 = 138543618;
      v21 = v8;
      v22 = 2048;
      v23 = v13;
      v17 = "Emergency Mode will end on %{public}@, %f seconds from now";
LABEL_14:
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v20, 0x16u);
    }

    v18 = *(_QWORD *)(a1 + 32);
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v13));
    (*(void (**)(uint64_t, void *, _QWORD))(v18 + 16))(v18, v19, 0);

LABEL_16:
    goto LABEL_17;
  }
  v9 = ((uint64_t (*)(void))DMFEmergencyModeLog)();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v20) = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Emergency Mode is not set", (uint8_t *)&v20, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
LABEL_17:

}

uint64_t sub_100005418(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

void sub_100005E9C(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100005EBC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_100005F84(id a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[2];

  v4[0] = CEMQuery_activeManagedUsers;
  v4[1] = CEMQuery_maximumResidentUsers;
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v4, 2));
  v2 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v1));
  v3 = (void *)qword_1000EB680;
  qword_1000EB680 = v2;

}

void sub_100006074(id a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[53];

  v4[0] = CEMQuery_UDID;
  v4[1] = CEMQuery_organizationInfo;
  v4[2] = CEMQuery_mdmOptions;
  v4[3] = CEMQuery_lastCloudBackupDate;
  v4[4] = CEMQuery_awaitingConfiguration;
  v4[5] = CEMQuery_iTunesStoreAccountIsActive;
  v4[6] = CEMQuery_iTunesStoreAccountHash;
  v4[7] = CEMQuery_deviceName;
  v4[8] = CEMQuery_osVersion;
  v4[9] = CEMQuery_buildVersion;
  v4[10] = CEMQuery_modelName;
  v4[11] = CEMQuery_model;
  v4[12] = CEMQuery_productName;
  v4[13] = CEMQuery_marketingName;
  v4[14] = CEMQuery_serialNumber;
  v4[15] = CEMQuery_deviceCapacity;
  v4[16] = CEMQuery_availableDeviceCapacity;
  v4[17] = CEMQuery_IMEI;
  v4[18] = CEMQuery_MEID;
  v4[19] = CEMQuery_modemFirmwareVersion;
  v4[20] = CEMQuery_cellularTechnology;
  v4[21] = CEMQuery_batteryLevel;
  v4[22] = CEMQuery_isSupervised;
  v4[23] = CEMQuery_isMultiUser;
  v4[24] = CEMQuery_isDeviceLocatorServiceEnabled;
  v4[25] = CEMQuery_isActivationLockEnabled;
  v4[26] = CEMQuery_isDoNotDisturbInEffect;
  v4[27] = CEMQuery_deviceID;
  v4[28] = CEMQuery_easDeviceIdentifier;
  v4[29] = CEMQuery_isCloudBackupEnabled;
  v4[30] = CEMQuery_activeManagedUsers;
  v4[31] = CEMQuery_isMDMLostModeEnabled;
  v4[32] = CEMQuery_maximumResidentUsers;
  v4[33] = CEMQuery_diagnosticSubmissionEnabled;
  v4[34] = CEMQuery_appAnalyticsEnabled;
  v4[35] = CEMQuery_ICCID;
  v4[36] = CEMQuery_bluetoothMAC;
  v4[37] = CEMQuery_wiFiMAC;
  v4[38] = CEMQuery_ethernetMACs;
  v4[39] = CEMQuery_currentCarrierNetwork;
  v4[40] = CEMQuery_simCarrierNetwork;
  v4[41] = CEMQuery_subscriberCarrierNetwork;
  v4[42] = CEMQuery_carrierSettingsVersion;
  v4[43] = CEMQuery_phoneNumber;
  v4[44] = CEMQuery_dataRoamingEnabled;
  v4[45] = CEMQuery_voiceRoamingEnabled;
  v4[46] = CEMQuery_personalHotspotEnabled;
  v4[47] = CEMQuery_isNetworkTethered;
  v4[48] = CEMQuery_isRoaming;
  v4[49] = CEMQuery_subscriberMCC;
  v4[50] = CEMQuery_subscriberMNC;
  v4[51] = CEMQuery_currentMCC;
  v4[52] = CEMQuery_currentMNC;
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v4, 53));
  v2 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v1));
  v3 = (void *)qword_1000EB690;
  qword_1000EB690 = v2;

}

void sub_100006438(id a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[3];

  v4[0] = CEMQuery_iTunesStoreAccountIsActive;
  v4[1] = CEMQuery_iTunesStoreAccountHash;
  v4[2] = CEMQuery_pushToken;
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v4, 3));
  v2 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v1));
  v3 = (void *)qword_1000EB6A0;
  qword_1000EB6A0 = v2;

}

void sub_100006538(id a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[3];

  v4[0] = CEMQuery_organizationInfo;
  v4[1] = CEMQuery_mdmOptions;
  v4[2] = CEMQuery_pushToken;
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v4, 3));
  v2 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v1));
  v3 = (void *)qword_1000EB6B0;
  qword_1000EB6B0 = v2;

}

void sub_100006660(id a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v3[49];
  _QWORD v4[49];

  v3[0] = CEMQuery_UDID;
  v3[1] = CEMQuery_lastCloudBackupDate;
  v4[0] = DMFDeviceUniqueIdentifierKey;
  v4[1] = DMFDeviceLastCloudBackupDateKey;
  v3[2] = CEMQuery_awaitingConfiguration;
  v3[3] = CEMQuery_iTunesStoreAccountIsActive;
  v4[2] = DMFDeviceAwaitingConfigurationKey;
  v4[3] = DMFDeviceiTunesStoreAccountIsActiveKey;
  v3[4] = CEMQuery_iTunesStoreAccountHash;
  v3[5] = CEMQuery_deviceName;
  v4[4] = DMFDeviceiTunesStoreAccountHashKey;
  v4[5] = DMFDeviceNameKey;
  v3[6] = CEMQuery_osVersion;
  v3[7] = CEMQuery_buildVersion;
  v4[6] = DMFDeviceOSVersionKey;
  v4[7] = DMFDeviceBuildVersionKey;
  v3[8] = CEMQuery_modelName;
  v3[9] = CEMQuery_model;
  v4[8] = DMFDeviceModelNameKey;
  v4[9] = DMFDeviceModelKey;
  v3[10] = CEMQuery_productName;
  v3[11] = CEMQuery_marketingName;
  v4[10] = DMFDeviceProductNameKey;
  v4[11] = DMFDeviceMarketingNameKey;
  v3[12] = CEMQuery_serialNumber;
  v3[13] = CEMQuery_deviceCapacity;
  v4[12] = DMFDeviceSerialNumberKey;
  v4[13] = DMFDeviceCapacityKey;
  v3[14] = CEMQuery_availableDeviceCapacity;
  v3[15] = CEMQuery_IMEI;
  v4[14] = DMFDeviceAvailableCapacityKey;
  v4[15] = DMFDeviceIMEIKey;
  v3[16] = CEMQuery_MEID;
  v3[17] = CEMQuery_modemFirmwareVersion;
  v4[16] = DMFDeviceMEIDKey;
  v4[17] = DMFDeviceModemFirmwareVersionKey;
  v3[18] = CEMQuery_cellularTechnology;
  v3[19] = CEMQuery_batteryLevel;
  v4[18] = DMFDeviceCellularTechnologyKey;
  v4[19] = DMFDeviceBatteryLevelKey;
  v3[20] = CEMQuery_isSupervised;
  v3[21] = CEMQuery_isMultiUser;
  v4[20] = DMFDeviceIsSupervisedKey;
  v4[21] = DMFDeviceIsEphemeralMultiUserKey;
  v3[22] = CEMQuery_isDeviceLocatorServiceEnabled;
  v3[23] = CEMQuery_isActivationLockEnabled;
  v4[22] = DMFDeviceIsDeviceLocatorServiceEnabledKey;
  v4[23] = DMFDeviceIsActivationLockEnabledKey;
  v3[24] = CEMQuery_isDoNotDisturbInEffect;
  v3[25] = CEMQuery_deviceID;
  v4[24] = DMFDeviceIsDNDInEffectKey;
  v4[25] = DMFDeviceIdentifierKey;
  v3[26] = CEMQuery_easDeviceIdentifier;
  v3[27] = CEMQuery_isCloudBackupEnabled;
  v4[26] = DMFDeviceEASIdentifierKey;
  v4[27] = DMFDeviceIsCloudBackupEnabledKey;
  v3[28] = CEMQuery_isMDMLostModeEnabled;
  v3[29] = CEMQuery_maximumResidentUsers;
  v4[28] = DMFDeviceIsLostModeEnabledKey;
  v4[29] = DMFDeviceMaximumResidentUsersKey;
  v3[30] = CEMQuery_diagnosticSubmissionEnabled;
  v3[31] = CEMQuery_appAnalyticsEnabled;
  v4[30] = DMFDeviceDiagnosticSubmissionEnabledKey;
  v4[31] = DMFDeviceAppAnalyticsEnabledKey;
  v3[32] = CEMQuery_ICCID;
  v3[33] = CEMQuery_bluetoothMAC;
  v4[32] = DMFDeviceICCIDKey;
  v4[33] = DMFDeviceBluetoothMACKey;
  v3[34] = CEMQuery_wiFiMAC;
  v3[35] = CEMQuery_currentCarrierNetwork;
  v4[34] = DMFDeviceWiFiMACKey;
  v4[35] = DMFDeviceCurrentCarrierNetworkKey;
  v3[36] = CEMQuery_simCarrierNetwork;
  v3[37] = CEMQuery_subscriberCarrierNetwork;
  v4[36] = DMFDeviceSIMCarrierNetworkKey;
  v4[37] = DMFDeviceSubscriberCarrierNetworkKey;
  v3[38] = CEMQuery_carrierSettingsVersion;
  v3[39] = CEMQuery_phoneNumber;
  v4[38] = DMFDeviceCarrierSettingsVersionKey;
  v4[39] = DMFDevicePhoneNumberKey;
  v3[40] = CEMQuery_dataRoamingEnabled;
  v3[41] = CEMQuery_voiceRoamingEnabled;
  v4[40] = DMFDeviceDataRoamingEnabledKey;
  v4[41] = DMFDeviceVoiceRoamingEnabledKey;
  v3[42] = CEMQuery_personalHotspotEnabled;
  v3[43] = CEMQuery_isNetworkTethered;
  v4[42] = DMFDevicePersonalHotspotEnabledKey;
  v4[43] = DMFDeviceIsNetworkTetheredKey;
  v3[44] = CEMQuery_isRoaming;
  v3[45] = CEMQuery_subscriberMCC;
  v4[44] = DMFDeviceIsRoamingKey;
  v4[45] = DMFDeviceSubscriberMCCKey;
  v3[46] = CEMQuery_subscriberMNC;
  v3[47] = CEMQuery_currentMCC;
  v4[46] = DMFDeviceSubscriberMNCKey;
  v4[47] = DMFDeviceCurrentMCCKey;
  v3[48] = CEMQuery_currentMNC;
  v4[48] = DMFDeviceCurrentMNCKey;
  v1 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v4, v3, 49));
  v2 = (void *)qword_1000EB6C0;
  qword_1000EB6C0 = v1;

}

void sub_100006CE4(id a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v3[49];
  _QWORD v4[49];

  v3[0] = DMFDeviceUniqueIdentifierKey;
  v3[1] = DMFDeviceLastCloudBackupDateKey;
  v4[0] = CEMQuery_UDID;
  v4[1] = CEMQuery_lastCloudBackupDate;
  v3[2] = DMFDeviceAwaitingConfigurationKey;
  v3[3] = DMFDeviceiTunesStoreAccountIsActiveKey;
  v4[2] = CEMQuery_awaitingConfiguration;
  v4[3] = CEMQuery_iTunesStoreAccountIsActive;
  v3[4] = DMFDeviceiTunesStoreAccountHashKey;
  v3[5] = DMFDeviceNameKey;
  v4[4] = CEMQuery_iTunesStoreAccountHash;
  v4[5] = CEMQuery_deviceName;
  v3[6] = DMFDeviceOSVersionKey;
  v3[7] = DMFDeviceBuildVersionKey;
  v4[6] = CEMQuery_osVersion;
  v4[7] = CEMQuery_buildVersion;
  v3[8] = DMFDeviceModelNameKey;
  v3[9] = DMFDeviceModelKey;
  v4[8] = CEMQuery_modelName;
  v4[9] = CEMQuery_model;
  v3[10] = DMFDeviceProductNameKey;
  v3[11] = DMFDeviceMarketingNameKey;
  v4[10] = CEMQuery_productName;
  v4[11] = CEMQuery_marketingName;
  v3[12] = DMFDeviceSerialNumberKey;
  v3[13] = DMFDeviceCapacityKey;
  v4[12] = CEMQuery_serialNumber;
  v4[13] = CEMQuery_deviceCapacity;
  v3[14] = DMFDeviceAvailableCapacityKey;
  v3[15] = DMFDeviceIMEIKey;
  v4[14] = CEMQuery_availableDeviceCapacity;
  v4[15] = CEMQuery_IMEI;
  v3[16] = DMFDeviceMEIDKey;
  v3[17] = DMFDeviceModemFirmwareVersionKey;
  v4[16] = CEMQuery_MEID;
  v4[17] = CEMQuery_modemFirmwareVersion;
  v3[18] = DMFDeviceCellularTechnologyKey;
  v3[19] = DMFDeviceBatteryLevelKey;
  v4[18] = CEMQuery_cellularTechnology;
  v4[19] = CEMQuery_batteryLevel;
  v3[20] = DMFDeviceIsSupervisedKey;
  v3[21] = DMFDeviceIsEphemeralMultiUserKey;
  v4[20] = CEMQuery_isSupervised;
  v4[21] = CEMQuery_isMultiUser;
  v3[22] = DMFDeviceIsDeviceLocatorServiceEnabledKey;
  v3[23] = DMFDeviceIsActivationLockEnabledKey;
  v4[22] = CEMQuery_isDeviceLocatorServiceEnabled;
  v4[23] = CEMQuery_isActivationLockEnabled;
  v3[24] = DMFDeviceIsDNDInEffectKey;
  v3[25] = DMFDeviceIdentifierKey;
  v4[24] = CEMQuery_isDoNotDisturbInEffect;
  v4[25] = CEMQuery_deviceID;
  v3[26] = DMFDeviceEASIdentifierKey;
  v3[27] = DMFDeviceIsCloudBackupEnabledKey;
  v4[26] = CEMQuery_easDeviceIdentifier;
  v4[27] = CEMQuery_isCloudBackupEnabled;
  v3[28] = DMFDeviceIsLostModeEnabledKey;
  v3[29] = DMFDeviceMaximumResidentUsersKey;
  v4[28] = CEMQuery_isMDMLostModeEnabled;
  v4[29] = CEMQuery_maximumResidentUsers;
  v3[30] = DMFDeviceDiagnosticSubmissionEnabledKey;
  v3[31] = DMFDeviceAppAnalyticsEnabledKey;
  v4[30] = CEMQuery_diagnosticSubmissionEnabled;
  v4[31] = CEMQuery_appAnalyticsEnabled;
  v3[32] = DMFDeviceICCIDKey;
  v3[33] = DMFDeviceBluetoothMACKey;
  v4[32] = CEMQuery_ICCID;
  v4[33] = CEMQuery_bluetoothMAC;
  v3[34] = DMFDeviceWiFiMACKey;
  v3[35] = DMFDeviceCurrentCarrierNetworkKey;
  v4[34] = CEMQuery_wiFiMAC;
  v4[35] = CEMQuery_currentCarrierNetwork;
  v3[36] = DMFDeviceSIMCarrierNetworkKey;
  v3[37] = DMFDeviceSubscriberCarrierNetworkKey;
  v4[36] = CEMQuery_simCarrierNetwork;
  v4[37] = CEMQuery_subscriberCarrierNetwork;
  v3[38] = DMFDeviceCarrierSettingsVersionKey;
  v3[39] = DMFDevicePhoneNumberKey;
  v4[38] = CEMQuery_carrierSettingsVersion;
  v4[39] = CEMQuery_phoneNumber;
  v3[40] = DMFDeviceDataRoamingEnabledKey;
  v3[41] = DMFDeviceVoiceRoamingEnabledKey;
  v4[40] = CEMQuery_dataRoamingEnabled;
  v4[41] = CEMQuery_voiceRoamingEnabled;
  v3[42] = DMFDevicePersonalHotspotEnabledKey;
  v3[43] = DMFDeviceIsNetworkTetheredKey;
  v4[42] = CEMQuery_personalHotspotEnabled;
  v4[43] = CEMQuery_isNetworkTethered;
  v3[44] = DMFDeviceIsRoamingKey;
  v3[45] = DMFDeviceSubscriberMCCKey;
  v4[44] = CEMQuery_isRoaming;
  v4[45] = CEMQuery_subscriberMCC;
  v3[46] = DMFDeviceSubscriberMNCKey;
  v3[47] = DMFDeviceCurrentMCCKey;
  v4[46] = CEMQuery_subscriberMNC;
  v4[47] = CEMQuery_currentMCC;
  v3[48] = DMFDeviceCurrentMNCKey;
  v4[48] = CEMQuery_currentMNC;
  v1 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v4, v3, 49));
  v2 = (void *)qword_1000EB6D0;
  qword_1000EB6D0 = v1;

}

void sub_10000B5EC(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  uint64_t v15;

  v3 = a2;
  v4 = DMFConfigurationEngineLog(v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_100071088();
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "predicateType"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier"));
    v9 = *(_QWORD *)(a1 + 40);
    v10 = 138543874;
    v11 = v7;
    v12 = 2114;
    v13 = v8;
    v14 = 2114;
    v15 = v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Predicate type: %{public}@ with unique identifier: %{public}@ succeeded stopping Usage Tracking monitor with budget identifier: %{public}@", (uint8_t *)&v10, 0x20u);

  }
}

void sub_10000C854(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_10000C890(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x2Au);
}

uint64_t sub_10000C8E0()
{
  uint64_t v0;

  return v0;
}

int64_t sub_10000EE80(id a1, NSDictionary *a2, NSDictionary *a3)
{
  uint64_t v4;
  NSDictionary *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = DMFDeclarationPayloadIdentifierKey;
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](a2, "objectForKeyedSubscript:", v4));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", v4));

  v8 = objc_msgSend(v6, "compare:", v7);
  return (int64_t)v8;
}

id sub_10000FF84(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "activationPredicateObserverDidTrigger:", *(_QWORD *)(a1 + 40));
}

void sub_1000103A0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10001045C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000104E8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000105B8(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  id v3;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "uniqueIdentifier"));
  objc_msgSend(v1, "activationPredicateObserverManager:didObserveChangeForPredicateWithIdentifier:", v2, v3);

}

void sub_100010660(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_100010674(id a1, NSString *a2, DMDActivationPredicateObserver *a3, BOOL *a4)
{
  -[DMDActivationPredicateObserver updateObserverRegistration](a3, "updateObserverRegistration");
}

void sub_100011280(id a1)
{
  id v1;
  void *v2;

  v1 = -[DMDAirPlayManager initPrivate]([DMDAirPlayManager alloc], "initPrivate");
  v2 = (void *)qword_1000EB6D8;
  qword_1000EB6D8 = (uint64_t)v1;

}

void sub_100011704(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_list va;

  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100011724(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100011734(uint64_t a1)
{

}

void sub_10001173C(_QWORD *a1, uint64_t a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id obj[5];

  if (a2 == 1)
  {
    obj[3] = v2;
    obj[4] = v3;
    v5 = (void *)a1[4];
    v4 = a1[5];
    v6 = a1[8];
    v7 = a1[6];
    v8 = *(_QWORD *)(a1[7] + 8);
    obj[0] = *(id *)(v8 + 40);
    objc_msgSend(v5, "_setOutputDevices:forSessionType:password:error:", v4, v6, v7, obj);
    objc_storeStrong((id *)(v8 + 40), obj[0]);
  }
}

void sub_100011FB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v12;
  va_list va;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v12 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_100011FE4(uint64_t a1)
{
  double v1;
  uint64_t v2;
  id v3;
  __int128 v4;
  _QWORD v5[4];
  __int128 v6;
  uint64_t v7;

  v1 = *(double *)(a1 + 64);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100012074;
  v5[3] = &unk_1000B9C80;
  v2 = *(_QWORD *)(a1 + 56);
  v7 = *(_QWORD *)(a1 + 48);
  v4 = *(_OWORD *)(a1 + 32);
  v3 = (id)v4;
  v6 = v4;
  MRAVReconnaissanceSessionBeginSearch(v2, v5, v1);

}

intptr_t sub_100012074(uint64_t a1, CFTypeRef cf, uint64_t a3, uint64_t a4)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSErrorUserInfoKey v11;
  uint64_t v12;

  if (cf)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = CFRetain(cf);
  }
  else if (a4)
  {
    v11 = NSUnderlyingErrorKey;
    v12 = a4;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1));
    v6 = DMFErrorWithCodeAndUserInfo(1301, v5);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_1000122B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_1000122D8(uint64_t a1, void *a2)
{
  id result;
  unint64_t v5;
  void *v6;
  NSData *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  char *v13;
  void *v14;
  unsigned int v15;
  CFArrayRef v16;
  CFTypeRef v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *values;

  result = objc_msgSend(a2, "count");
  if (!result)
    return result;
  v5 = 0;
  while (1)
  {
    values = (void *)CFArrayGetValueAtIndex((CFArrayRef)a2, v5);
    if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 8))
      break;
    v14 = (void *)MRAVOutputDeviceCopyName();
    v15 = objc_msgSend(v14, "isEqualToString:", *(_QWORD *)(a1 + 40));

    if (v15)
      goto LABEL_16;
LABEL_14:
    ++v5;
    result = objc_msgSend(a2, "count");
    if (v5 >= (unint64_t)result)
      return result;
  }
  v6 = (void *)MRAVOutputDeviceCopyMACAddress();
  v7 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", ether_aton((const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "UTF8String")), objc_msgSend(v6, "length"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = objc_retainAutorelease(v6);
  v10 = objc_msgSend(v9, "bytes");
  v11 = objc_retainAutorelease(v8);
  v12 = objc_msgSend(v11, "bytes");
  if (!objc_msgSend(v9, "length"))
  {
LABEL_12:

    goto LABEL_14;
  }
  v13 = 0;
  do
  {
    if ((char *)objc_msgSend(v9, "length") - 1 <= v13)
    {
      if ((*((unsigned __int8 *)v12 + 5) ^ *((unsigned __int8 *)v10 + 5)) > 0xF)
        goto LABEL_12;
    }
    else if (v13[(_QWORD)v10] != v13[(_QWORD)v12])
    {
      goto LABEL_12;
    }
    ++v13;
  }
  while (objc_msgSend(v9, "length") > v13);

LABEL_16:
  v16 = CFArrayCreate(kCFAllocatorDefault, (const void **)&values, 1, &kCFTypeArrayCallBacks);
  v17 = CFAutorelease(v16);
  v18 = objc_claimAutoreleasedReturnValue(v17);
  v19 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v20 = *(void **)(v19 + 40);
  *(_QWORD *)(v19 + 40) = v18;

  return (id)dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

void sub_100012538(id a1)
{
  id v1;
  void *v2;

  v1 = objc_msgSend(objc_alloc((Class)objc_opt_class(DMDiphoneOSAppController)), "initPrivate");
  v2 = (void *)qword_1000EB6E8;
  qword_1000EB6E8 = (uint64_t)v1;

}

void sub_1000128C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_1000128F4(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "manifest"));

  return v2;
}

void sub_100012B78(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;
  id v6;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "bundleIdentifier"));
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);

}

void sub_100013638(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;

  v3 = a2;
  if (v3)
  {
    v4 = DMFAppLog();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_100071934(a1, (uint64_t)v3, v5);

  }
  v6 = *(_QWORD *)(a1 + 48);
  if (v6)
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);

}

void sub_1000138E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100013918(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100013928(uint64_t a1)
{

}

void sub_100013930(uint64_t a1, void *a2)
{
  id v4;
  id v5;

  v4 = a2;
  if (v4)
  {
    v5 = v4;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    v4 = v5;
  }

}

void sub_100014614(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  unsigned __int8 v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  id v18;

  v5 = a2;
  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_metadataForBundleIdentifier:", *(_QWORD *)(a1 + 40)));
  if (v7)
    goto LABEL_4;
  if (v5)
  {
    v7 = objc_msgSend(*(id *)(a1 + 32), "_newMetadataDictionary");
LABEL_4:
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("Attributes")));
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v5, CFSTR("Removable"));

    v9 = *(void **)(a1 + 32);
    v10 = *(_QWORD *)(a1 + 40);
    v18 = 0;
    v11 = objc_msgSend(v9, "_setMetadata:forBundleIdentifier:error:", v7, v10, &v18);
    v12 = v18;
    v13 = v12;
    if ((v11 & 1) == 0 && !v12)
    {
      v14 = DMFErrorWithCodeAndUserInfo(0, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue(v14);
    }
    v15 = *(_QWORD *)(a1 + 48);
    if (v15)
    {
      if (v6)
        v16 = v6;
      else
        v16 = v13;
      (*(void (**)(uint64_t, id))(v15 + 16))(v15, v16);
    }

    goto LABEL_13;
  }
  v17 = *(_QWORD *)(a1 + 48);
  if (v17)
    (*(void (**)(uint64_t, id))(v17 + 16))(v17, v6);
LABEL_13:

}

void sub_10001472C(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  void (*v8)(void);
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;

  v5 = a3;
  if (v5)
  {
    v6 = DMFAppLog();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_100071A30(a1);

    v8 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
LABEL_5:
    v8();
    goto LABEL_13;
  }
  if (a2 != 3)
  {
    v13 = *(_QWORD *)(a1 + 56);
    if (v13 != a2)
    {
      v14 = *(void **)(a1 + 32);
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_1000148CC;
      v15[3] = &unk_1000B9DE0;
      v16 = v14;
      v18 = *(id *)(a1 + 48);
      v17 = *(id *)(a1 + 40);
      +[IXAppInstallCoordinator setRemovability:forAppWithBundleID:byClient:completion:](IXAppInstallCoordinator, "setRemovability:forAppWithBundleID:byClient:completion:", v13, v16, 3, v15);

      goto LABEL_13;
    }
    v8 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
    goto LABEL_5;
  }
  v9 = DMFErrorWithCodeAndUserInfo(5000, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = DMFAppLog();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    sub_1000719C4(a1);

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
LABEL_13:

}

void sub_1000148CC(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  void (*v6)(void);

  v3 = a2;
  if (v3)
  {
    v4 = DMFAppLog();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1000719C4(a1);

    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  else
  {
    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  v6();

}

id sub_100014A6C()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)qword_1000EB718;
  v7 = qword_1000EB718;
  if (!qword_1000EB718)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_100018B04;
    v3[3] = &unk_1000B9F10;
    v3[4] = &v4;
    sub_100018B04((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_100014B0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100016248(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, char a17)
{
  objc_destroyWeak(&location);
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

void sub_100016268(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "_metadataByBundleIdentifier"));
  v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "allKeys"));
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void sub_1000172EC(id a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v10[2];
  _QWORD v11[2];
  _QWORD v12[2];
  _QWORD v13[2];
  _QWORD v14[2];
  _QWORD v15[2];
  _QWORD v16[2];
  _QWORD v17[2];
  _QWORD v18[5];
  _QWORD v19[5];
  _QWORD v20[2];
  _QWORD v21[2];
  _QWORD v22[2];
  _QWORD v23[2];
  _QWORD v24[7];
  _QWORD v25[7];

  v22[0] = &off_1000C32E8;
  v22[1] = &off_1000C3300;
  v23[0] = &off_1000C3378;
  v23[1] = &off_1000C32D0;
  v24[0] = &off_1000C3360;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v23, v22, 2));
  v25[0] = v9;
  v24[1] = &off_1000C32D0;
  v20[0] = &off_1000C3390;
  v20[1] = &off_1000C33A8;
  v21[0] = &off_1000C32E8;
  v21[1] = &off_1000C3360;
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v21, v20, 2));
  v25[1] = v1;
  v24[2] = &off_1000C3300;
  v18[0] = &off_1000C3390;
  v18[1] = &off_1000C33A8;
  v19[0] = &off_1000C32E8;
  v19[1] = &off_1000C3360;
  v18[2] = &off_1000C32E8;
  v18[3] = &off_1000C32D0;
  v19[2] = &off_1000C3378;
  v19[3] = &off_1000C3348;
  v18[4] = &off_1000C3300;
  v19[4] = &off_1000C3348;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v19, v18, 5));
  v25[2] = v2;
  v24[3] = &off_1000C3318;
  v16[0] = &off_1000C32D0;
  v16[1] = &off_1000C3300;
  v17[0] = &off_1000C3348;
  v17[1] = &off_1000C3348;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v17, v16, 2));
  v25[3] = v3;
  v24[4] = &off_1000C33C0;
  v14[0] = &off_1000C33A8;
  v14[1] = &off_1000C3300;
  v15[0] = &off_1000C3360;
  v15[1] = &off_1000C32D0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v15, v14, 2));
  v25[4] = v4;
  v24[5] = &off_1000C32E8;
  v12[0] = &off_1000C33A8;
  v12[1] = &off_1000C3300;
  v13[0] = &off_1000C3360;
  v13[1] = &off_1000C32D0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v13, v12, 2));
  v25[5] = v5;
  v24[6] = &off_1000C3378;
  v10[0] = &off_1000C33A8;
  v10[1] = &off_1000C3300;
  v11[0] = &off_1000C3360;
  v11[1] = &off_1000C32D0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v11, v10, 2));
  v25[6] = v6;
  v7 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v25, v24, 7));
  v8 = (void *)qword_1000EB6F8;
  qword_1000EB6F8 = v7;

}

void sub_100017BD0(id a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v3[9];
  _QWORD v4[9];

  v3[0] = &off_1000C3300;
  v3[1] = &off_1000C33D8;
  v4[0] = &off_1000C32D0;
  v4[1] = &off_1000C3300;
  v3[2] = &off_1000C3390;
  v3[3] = &off_1000C3318;
  v4[2] = &off_1000C32E8;
  v4[3] = &off_1000C33F0;
  v3[4] = &off_1000C33A8;
  v3[5] = &off_1000C3408;
  v4[4] = &off_1000C3360;
  v4[5] = &off_1000C3300;
  v3[6] = &off_1000C32E8;
  v3[7] = &off_1000C3360;
  v4[6] = &off_1000C3378;
  v4[7] = &off_1000C33F0;
  v3[8] = &off_1000C32D0;
  v4[8] = &off_1000C33F0;
  v1 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v4, v3, 9));
  v2 = (void *)qword_1000EB708;
  qword_1000EB708 = v1;

}

void sub_100017FA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, char a17)
{
  objc_destroyWeak(&location);
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

void sub_100017FC0(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "_metadataByBundleIdentifier"));
  v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32)));
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void sub_100018230(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location, char a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23)
{
  objc_destroyWeak(&location);
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a19, 8);
  _Unwind_Resume(a1);
}

void sub_100018264(uint64_t a1)
{
  uint64_t v2;
  id *v3;
  id WeakRetained;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id obj;

  v2 = *(_QWORD *)(a1 + 40);
  v3 = (id *)(a1 + 64);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "_metadataByBundleIdentifier"));
  v7 = *(_QWORD *)(a1 + 32);
  v6 = a1 + 32;
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v2, v7);

  v8 = objc_loadWeakRetained(v3);
  v9 = *(_QWORD *)(*(_QWORD *)(v6 + 24) + 8);
  obj = *(id *)(v9 + 40);
  LOBYTE(WeakRetained) = objc_msgSend(v8, "writeManagementInformationToDiskWithError:", &obj);
  objc_storeStrong((id *)(v9 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v6 + 16) + 8) + 24) = (_BYTE)WeakRetained;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v6 + 16) + 8) + 24))
  {
    v12 = DMFAppLog(v10, v11);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_100071FCC(v6, v13, v14, v15, v16, v17, v18, v19);

  }
}

void sub_10001861C(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v10;
  uint64_t v11;
  NSErrorUserInfoKey v12;
  void *v13;

  if (a4)
  {
    v4 = *(_QWORD *)(a1 + 40);
    v12 = NSUnderlyingErrorKey;
    v13 = a4;
    v5 = a4;
    v6 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1));
    v7 = DMFErrorWithCodeAndUserInfo(2604, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    (*(void (**)(uint64_t, _QWORD, void *))(v4 + 16))(v4, 0, v8);

  }
  else
  {
    v10 = *(void **)(a1 + 32);
    v11 = *(_QWORD *)(a1 + 40);
    v6 = 0;
    objc_msgSend(v10, "_getEnterpriseAppMetadataFromData:completion:", a2, v11);
  }

}

Class sub_100018B04(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;

  v3 = 0;
  if (!qword_1000EB720)
  {
    v4 = off_1000B9F30;
    v5 = 0;
    qword_1000EB720 = _sl_dlopen(&v4, &v3);
  }
  if (!qword_1000EB720)
    sub_100072034(&v3);
  if (v3)
    free(v3);
  result = objc_getClass("PRSettingsProvider");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    sub_1000720B0();
  qword_1000EB718 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_100018BE0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_100018C24(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100018D54(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  uint64_t v18;
  id v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v3 = a2;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        if (!objc_msgSend(v8, "updateState"))
        {
          v9 = *(void **)(a1 + 32);
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bundleIdentifier"));
          objc_msgSend(v9, "addObject:", v10);

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v5);
  }
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100018EF8;
  v15[3] = &unk_1000BA008;
  v11 = *(void **)(a1 + 40);
  v16 = *(id *)(a1 + 32);
  v12 = *(id *)(a1 + 48);
  v13 = *(_QWORD *)(a1 + 56);
  v14 = *(void **)(a1 + 64);
  v17 = v12;
  v18 = v13;
  v19 = v14;
  v20 = *(id *)(a1 + 72);
  objc_msgSend(v11, "getUpdatesWithCompletionBlock:", v15);

}

void sub_100018EF8(id *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  _QWORD *v14;
  NSMutableDictionary *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  _QWORD *v22;
  NSMutableDictionary *v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  NSMutableDictionary *v28;
  id v29;
  Block_layout *v30;
  id v31;
  id v32;
  _QWORD *v33;
  id v34;
  _QWORD v35[5];
  id v36;
  _QWORD v37[4];
  id v38;
  id v39;
  id v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];

  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v3 = a2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v43 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * (_QWORD)i);
        if (!objc_msgSend(v7, "updateState"))
        {
          v8 = a1[4];
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bundleIdentifier"));
          objc_msgSend(v8, "addObject:", v9);

        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
    }
    while (v4);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[5], "bundleIdentifiers"));
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_100019234;
  v37[3] = &unk_1000B9F50;
  v11 = a1[5];
  v12 = a1[6];
  v38 = v11;
  v39 = v12;
  v13 = v10;
  v40 = v13;
  v41 = a1[7];
  v14 = objc_retainBlock(v37);
  v15 = objc_opt_new(NSMutableDictionary);
  v16 = objc_msgSend(a1[5], "type");
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x3032000000;
  v35[3] = sub_1000192DC;
  v35[4] = sub_1000192EC;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[5], "propertyKeys"));
  v18 = v17;
  if (v17)
    v19 = v17;
  else
    v19 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[6], "_allPropertyKeys"));
  v36 = v19;

  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[6], "jobManager"));
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100019384;
  v25[3] = &unk_1000B9FE0;
  v21 = a1[5];
  v33 = v35;
  v26 = v21;
  v30 = &stru_1000B9F90;
  v22 = v14;
  v31 = v22;
  v34 = v16;
  v27 = a1[4];
  v23 = v15;
  v24 = a1[6];
  v28 = v23;
  v29 = v24;
  v32 = a1[8];
  objc_msgSend(v20, "getJobsUsingBlock:", v25);

  _Block_object_dispose(v35, 8);
}

void sub_100019214(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100019234(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v5 = a2;
  v6 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "managedAppsOnly")
    && (v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "managementInformationForBundleIdentifier:", v5)),
        v7,
        !v7))
  {
    v9 = 0;
  }
  else
  {
    v8 = *(void **)(a1 + 48);
    if ((v8 || *(_QWORD *)(a1 + 56)) && (objc_msgSend(v8, "containsObject:", v5) & 1) == 0)
      v9 = (uint64_t)objc_msgSend(*(id *)(a1 + 56), "isEqualToNumber:", v6);
    else
      v9 = 1;
  }

  return v9;
}

uint64_t sub_1000192DC(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_1000192EC(uint64_t a1)
{

}

BOOL sub_1000192F4(id a1, ASDJob *a2)
{
  ASDJob *v2;
  BOOL v3;
  void *v4;
  id v5;

  v2 = a2;
  if (-[ASDJob storeItemID](v2, "storeItemID"))
  {
    v3 = 0;
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASDJob bundleID](v2, "bundleID"));
    if (objc_msgSend(v4, "hasPrefix:", CFSTR("com.apple.")))
    {
      v5 = objc_msgSend(objc_alloc((Class)LSApplicationRecord), "initWithBundleIdentifierOfSystemPlaceholder:error:", v4, 0);
      v3 = v5 != 0;

    }
    else
    {
      v3 = 0;
    }

  }
  return v3;
}

void sub_100019384(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  _QWORD *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  id v41;
  id obj;
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _QWORD v52[5];
  id v53;
  id v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  _BYTE v63[128];
  _QWORD v64[3];
  _BYTE v65[128];

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "managedAppsOnly"))
  {
    v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "arrayByAddingObject:", CFSTR("managementInformation")));
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  obj = v3;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v65, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v59;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v59 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * (_QWORD)v10);
        v12 = objc_autoreleasePoolPush();
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bundleID"));
        v14 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
        v15 = *(_QWORD *)(a1 + 72);
        v16 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", objc_msgSend(v11, "storeItemID")));
        if (!(*(unsigned int (**)(uint64_t, void *, id))(v15 + 16))(v15, v13, v16))
          goto LABEL_13;
        v17 = 1;
        if (!v14)
          v17 = 2;
        v18 = *(_QWORD *)(a1 + 96) & v17;

        if (v18)
        {
          v16 = objc_msgSend(objc_alloc((Class)DMFApp), "initWithJob:hasUpdateAvailable:propertyKeys:", v11, objc_msgSend(*(id *)(a1 + 40), "containsObject:", v13), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40));
          objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v16, v13);
LABEL_13:

        }
        objc_autoreleasePoolPop(v12);
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v65, 16);
    }
    while (v8);
  }

  v52[0] = _NSConcreteStackBlock;
  v52[1] = 3221225472;
  v52[2] = sub_1000197F4;
  v52[3] = &unk_1000B9FB8;
  v19 = *(_QWORD *)(a1 + 96);
  v52[4] = *(_QWORD *)(a1 + 56);
  v57 = v19;
  v55 = *(id *)(a1 + 72);
  v20 = *(id *)(a1 + 40);
  v21 = *(_QWORD *)(a1 + 88);
  v53 = v20;
  v56 = v21;
  v54 = *(id *)(a1 + 48);
  v22 = objc_retainBlock(v52);
  v23 = objc_msgSend((id)objc_opt_class(*(_QWORD *)(a1 + 56)), "enumeratorForOrdinaryApps");
  v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  v64[0] = v24;
  v25 = objc_msgSend((id)objc_opt_class(*(_QWORD *)(a1 + 56)), "enumeratorForUserAppPlaceholders");
  v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
  v64[1] = v26;
  v27 = objc_msgSend((id)objc_opt_class(*(_QWORD *)(a1 + 56)), "enumeratorForSystemAppPlaceholders");
  v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
  v64[2] = v28;
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v64, 3));

  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v41 = v29;
  v30 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v48, v63, 16);
  if (v30)
  {
    v31 = v30;
    v43 = *(_QWORD *)v49;
    do
    {
      v32 = 0;
      do
      {
        if (*(_QWORD *)v49 != v43)
          objc_enumerationMutation(v41);
        v33 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * (_QWORD)v32);
        v44 = 0u;
        v45 = 0u;
        v46 = 0u;
        v47 = 0u;
        v34 = v33;
        v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v44, v62, 16);
        if (v35)
        {
          v36 = v35;
          v37 = *(_QWORD *)v45;
          do
          {
            v38 = 0;
            do
            {
              if (*(_QWORD *)v45 != v37)
                objc_enumerationMutation(v34);
              v39 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * (_QWORD)v38);
              v40 = objc_autoreleasePoolPush();
              ((void (*)(_QWORD *, uint64_t))v22[2])(v22, v39);
              objc_autoreleasePoolPop(v40);
              v38 = (char *)v38 + 1;
            }
            while (v36 != v38);
            v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v44, v62, 16);
          }
          while (v36);
        }

        v32 = (char *)v32 + 1;
      }
      while (v32 != v31);
      v31 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v48, v63, 16);
    }
    while (v31);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
}

void sub_1000197F4(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;

  v8 = a2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bundleIdentifier"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "compatibilityObject"));
    if ((*(_QWORD *)(a1 + 72) & (unint64_t)objc_msgSend(*(id *)(a1 + 32), "appTypeFromProxy:", v4)) != 0)
    {
      v5 = *(_QWORD *)(a1 + 56);
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "itemID"));
      LODWORD(v5) = (*(uint64_t (**)(uint64_t, void *, void *))(v5 + 16))(v5, v3, v6);

      if ((_DWORD)v5)
      {
        v7 = objc_msgSend(objc_alloc((Class)DMFApp), "initWithApplicationRecord:hasUpdateAvailable:propertyKeys:", v8, objc_msgSend(*(id *)(a1 + 40), "containsObject:", v3), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
        objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v7, v3);

      }
    }

  }
}

void sub_1000199C4(id a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v3[42];

  v3[0] = CFSTR("type");
  v3[1] = CFSTR("displayName");
  v3[2] = CFSTR("bundleIdentifier");
  v3[3] = CFSTR("storeItemIdentifier");
  v3[4] = CFSTR("externalVersionIdentifier");
  v3[5] = CFSTR("distributorIdentifier");
  v3[6] = CFSTR("version");
  v3[7] = CFSTR("shortVersion");
  v3[8] = CFSTR("staticUsage");
  v3[9] = CFSTR("dynamicUsage");
  v3[10] = CFSTR("onDemandResourcesUsage");
  v3[11] = CFSTR("sharedUsage");
  v3[12] = CFSTR("installationState");
  v3[13] = CFSTR("isPlaceholder");
  v3[14] = CFSTR("isRestricted");
  v3[15] = CFSTR("isBlocked");
  v3[16] = CFSTR("isUserBasedVPP");
  v3[17] = CFSTR("isDeviceBasedVPP");
  v3[18] = CFSTR("isLicenseExpired");
  v3[19] = CFSTR("isLicenseRevoked");
  v3[20] = CFSTR("isUPP");
  v3[21] = CFSTR("isValidated");
  v3[22] = CFSTR("isAppClip");
  v3[23] = CFSTR("isAppStoreVendable");
  v3[24] = CFSTR("isBetaApp");
  v3[25] = CFSTR("isAdHocCodeSigned");
  v3[26] = CFSTR("hasUpdateAvailable");
  v3[27] = CFSTR("VPNUUIDString");
  v3[28] = CFSTR("cellularSliceUUIDString");
  v3[29] = CFSTR("contentFilterUUIDString");
  v3[30] = CFSTR("DNSProxyUUIDString");
  v3[31] = CFSTR("relayUUIDString");
  v3[32] = CFSTR("associatedDomains");
  v3[33] = CFSTR("associatedDomainsEnableDirectDownloads");
  v3[34] = CFSTR("removable");
  v3[35] = CFSTR("tapToPayScreenLock");
  v3[36] = CFSTR("allowUserToHide");
  v3[37] = CFSTR("allowUserToLock");
  v3[38] = CFSTR("configuration");
  v3[39] = CFSTR("feedback");
  v3[40] = CFSTR("sourceIdentifier");
  v3[41] = CFSTR("managementInformation");
  v1 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v3, 42));
  v2 = (void *)qword_1000EB728;
  qword_1000EB728 = v1;

}

void sub_100019CB4(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSErrorUserInfoKey v15;
  id v16;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  v10 = *(_QWORD *)(a1 + 32);
  if (a2)
  {
    (*(void (**)(uint64_t, _QWORD))(v10 + 16))(v10, 0);
  }
  else
  {
    if (v8)
    {
      v15 = NSUnderlyingErrorKey;
      v16 = v8;
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1));
      v12 = DMFErrorWithCodeAndUserInfo(1005, v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v13);

    }
    else
    {
      v14 = DMFErrorWithCodeAndUserInfo(1005, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue(v14);
      (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v11);
    }

  }
}

void sub_100019F54(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v4 = a2;
  if (!v4)
  {
    v3 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
LABEL_6:
    v3();
    goto LABEL_7;
  }
  if (!*(_BYTE *)(a1 + 56))
  {
    v3 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
    goto LABEL_6;
  }
  objc_msgSend(*(id *)(a1 + 32), "_installUserAppForRequest:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
LABEL_7:

}

void sub_10001A104(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  void *v22;
  _BYTE v23[128];

  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v3 = a2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v19;
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v19 != v6)
        objc_enumerationMutation(v3);
      v8 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v7);
      v9 = *(void **)(a1 + 32);
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bundleID"));
      LOBYTE(v9) = objc_msgSend(v9, "isEqualToString:", v10);

      if ((v9 & 1) != 0)
        break;
      if (v5 == (id)++v7)
      {
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
        if (v5)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", objc_msgSend(v8, "persistentID")));

    if (!v11)
      goto LABEL_12;
    v12 = *(void **)(a1 + 40);
    v22 = v11;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v22, 1));
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10001A304;
    v16[3] = &unk_1000BA0C8;
    v17 = *(id *)(a1 + 48);
    objc_msgSend(v12, "resumeJobsWithIDs:completionBlock:", v13, v16);

  }
  else
  {
LABEL_9:

LABEL_12:
    v14 = *(_QWORD *)(a1 + 48);
    v15 = DMFErrorWithCodeAndUserInfo(1003, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v15);
    (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v11);
  }

}

void sub_10001A304(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSErrorUserInfoKey v12;
  id v13;

  v5 = a3;
  v6 = v5;
  v7 = *(_QWORD *)(a1 + 32);
  if (a2)
  {
    (*(void (**)(uint64_t, _QWORD))(v7 + 16))(v7, 0);
  }
  else
  {
    if (v5)
    {
      v12 = NSUnderlyingErrorKey;
      v13 = v5;
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1));
      v9 = DMFErrorWithCodeAndUserInfo(1003, v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v10);

    }
    else
    {
      v11 = DMFErrorWithCodeAndUserInfo(1003, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue(v11);
      (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);
    }

  }
}

void sub_10001A614(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;

  v3 = a2;
  if (v3 && (v4 = objc_msgSend(*(id *)(a1 + 32), "allowFreePurchases"), (_DWORD)v4))
  {
    v6 = DMFAppLog(v4, v5);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = 138543362;
      v10 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Install free app for request: %{public}@", (uint8_t *)&v9, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 40), "_downloadAppForRequest:type:completion:", *(_QWORD *)(a1 + 32), 3, *(_QWORD *)(a1 + 48));
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void sub_10001A7F4(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void (*v9)(uint64_t, _QWORD);
  NSErrorUserInfoKey v10;
  void *v11;

  v4 = *(_QWORD *)(a1 + 32);
  if (a4)
  {
    v10 = NSUnderlyingErrorKey;
    v11 = a4;
    v5 = a4;
    v6 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1));
    v7 = DMFErrorWithCodeAndUserInfo(1005, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v8);

  }
  else
  {
    v9 = *(void (**)(uint64_t, _QWORD))(v4 + 16);
    v6 = 0;
    v9(v4, 0);
  }

}

void sub_10001A9EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10001AA14(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "performSelectorOnMainThread:withObject:waitUntilDone:", "_updateForegroundBundleIdentifiers", 0, 0);

}

void sub_10001AA94(id a1)
{
  id v1;
  void *v2;
  id v3;

  v3 = (id)objc_opt_new(ASDJobManagerOptions);
  objc_msgSend(v3, "setShouldFilterExternalOriginatedDownloads:", 0);
  v1 = objc_msgSend(objc_alloc((Class)ASDJobManager), "initWithOptions:", v3);
  v2 = (void *)qword_1000EB738;
  qword_1000EB738 = (uint64_t)v1;

}

void sub_10001AB2C(id a1)
{
  ASDUpdatesService *v1;
  void *v2;

  v1 = objc_opt_new(ASDUpdatesService);
  v2 = (void *)qword_1000EB748;
  qword_1000EB748 = (uint64_t)v1;

}

void sub_10001AEC8(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  if (a3)
  {
    (*(void (**)(_QWORD, _QWORD))(v3 + 16))(*(_QWORD *)(a1 + 32), 0);
  }
  else
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "authenticatedAccount"));
    (*(void (**)(uint64_t, id, _QWORD))(v3 + 16))(v3, v4, 0);

  }
}

void sub_10001B180(uint64_t a1, int a2, void *a3, uint64_t a4, void *a5)
{
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  const __CFString *v14;
  id v15;
  void *v16;
  id v17;
  uint64_t v18;
  id v19;
  int v20;
  const __CFString *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  id v27;

  v9 = a3;
  v10 = a5;
  v12 = DMFAppLog(v10, v11);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    if (a2)
      v14 = CFSTR("YES");
    else
      v14 = CFSTR("NO");
    v15 = objc_msgSend((id)objc_opt_class(*(_QWORD *)(a1 + 32)), "changeTypeAsString:", a4);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v20 = 138544130;
    v21 = v14;
    v22 = 2114;
    v23 = v9;
    v24 = 2114;
    v25 = v16;
    v26 = 2114;
    v27 = v10;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Send app store request result: success: %{public}@, metadata: %{public}@, change type: %{public}@, error: %{public}@", (uint8_t *)&v20, 0x2Au);

  }
  if (v10)
  {
    v17 = 0;
    v18 = 0;
    v19 = v10;
  }
  else
  {
    v17 = v9;
    v18 = a4;
    v19 = 0;
  }
  (*(void (**)(_QWORD, id, uint64_t, id))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v17, v18, v19);

}

void sub_10001B708(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  void (*v7)(uint64_t, _QWORD);
  NSErrorUserInfoKey v8;
  void *v9;

  v2 = *(_QWORD *)(a1 + 32);
  if (a2)
  {
    v8 = NSUnderlyingErrorKey;
    v9 = a2;
    v3 = a2;
    v4 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1));
    v5 = DMFErrorWithCodeAndUserInfo(1005, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v6);

  }
  else
  {
    v7 = *(void (**)(uint64_t, _QWORD))(v2 + 16);
    v4 = 0;
    v7(v2, 0);
  }

}

void sub_10001B8F0(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;
  id v6;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "bundleIdentifier"));
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);

}

void sub_10001C094(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10001C0AC(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_10001C0BC(uint64_t a1)
{

}

void sub_10001C0C4(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t isKindOfClass;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v5 = a2;
  v7 = v5;
  if (a3 != 1)
  {
    v8 = DMFAppLog(v5, v6);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_1000721F4();

  }
  if (v7)
  {
    v10 = a1 + 32;
    _CFPreferencesAppSynchronizeWithContainer(*(_QWORD *)(a1 + 32), v7);
    v11 = _CFPreferencesCopyAppValueWithContainer(CFSTR("com.apple.feedback.managed"), *(_QWORD *)(a1 + 32), v7);
    if (v11)
    {
      v12 = objc_opt_class(NSDictionary);
      isKindOfClass = objc_opt_isKindOfClass(v11, v12);
      if ((isKindOfClass & 1) != 0)
      {
        v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v16 = v11;
        v17 = *(NSObject **)(v15 + 40);
        *(_QWORD *)(v15 + 40) = v16;
      }
      else
      {
        v19 = DMFAppLog(isKindOfClass, v14);
        v17 = objc_claimAutoreleasedReturnValue(v19);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          sub_10007218C(v10, v17, v20, v21, v22, v23, v24, v25);
      }

    }
  }
  else
  {
    v18 = DMFAppLog(v5, v6);
    v11 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_100072128();
  }

}

void sub_10001C380(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10001C3A0(_QWORD *a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;

  v5 = a2;
  v7 = v5;
  if (a3 != 1)
  {
    v8 = DMFAppLog(v5, v6);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_1000722C4();

  }
  if (v7)
  {
    _CFPreferencesSetAppValueWithContainer(CFSTR("com.apple.feedback.managed"), a1[5], a1[4], v7);
    _CFPreferencesAppSynchronizeWithContainer(a1[4], v7);
    _CFPreferencesPostValuesChangedInDomains(+[NSArray arrayWithObject:](NSArray, "arrayWithObject:", a1[4]));
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
  }
  else
  {
    v10 = DMFAppLog(v5, v6);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_100072260();

  }
}

void sub_10001C7C4(uint64_t a1, void *a2)
{
  id v3;
  DMDAppMetadata *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  _QWORD v19[5];
  DMDAppMetadata *v20;
  id v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;

  v3 = a2;
  v4 = objc_opt_new(DMDAppMetadata);
  -[DMDAppMetadata setIsStoreApp:](v4, "setIsStoreApp:", 1);
  -[DMDAppMetadata setBundleIdentifier:](v4, "setBundleIdentifier:", *(_QWORD *)(a1 + 32));
  -[DMDAppMetadata setStoreItemIdentifier:](v4, "setStoreItemIdentifier:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "_applyStoreDictionary:toAppMetadata:", v3, v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMDAppMetadata bundleIdentifier](v4, "bundleIdentifier"));
  if (v5)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
  else
  {
    v8 = DMFAppLog(v6, v7);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 32);
      v11 = *(_QWORD *)(a1 + 40);
      v12 = *(_QWORD *)(a1 + 56);
      *(_DWORD *)buf = 138543874;
      v23 = v10;
      v24 = 2114;
      v25 = v11;
      v26 = 2114;
      v27 = v12;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Get metadata with device lookup for bundle identifier: %{public}@, store item identifier: %{public}@, persona: %{public}@", buf, 0x20u);
    }

    v13 = *(_QWORD *)(a1 + 32);
    v14 = *(_QWORD *)(a1 + 40);
    v15 = *(void **)(a1 + 48);
    v16 = *(_QWORD *)(a1 + 56);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10001C994;
    v19[3] = &unk_1000BA270;
    v17 = *(id *)(a1 + 64);
    v18 = *(_QWORD *)(a1 + 48);
    v21 = v17;
    v19[4] = v18;
    v20 = v4;
    objc_msgSend(v15, "sendAppRequestWithBundleIdentifier:storeItemIdentifier:personaIdentifier:type:skipDownloads:completion:", v13, v14, v16, 2, 1, v19);

  }
}

void sub_10001C994(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;

  v7 = a4;
  v9 = v7;
  if (v7)
  {
    v10 = DMFAppLog(v7, v8);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_100072330((uint64_t)v9, v11, v12, v13, v14, v15, v16, v17);

    (*(void (**)(_QWORD, _QWORD, void *))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), 0, v9);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_applyStoreDictionary:toAppMetadata:", a2, *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 40), "setNeedsRedownload:", a3 == 4);
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "bundleIdentifier"));

    v19 = *(_QWORD *)(a1 + 48);
    if (v18)
    {
      (*(void (**)(_QWORD, _QWORD, _QWORD))(v19 + 16))(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), 0);
    }
    else
    {
      v20 = DMFErrorWithCodeAndUserInfo(2606, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
      (*(void (**)(uint64_t, _QWORD, void *))(v19 + 16))(v19, 0, v21);

    }
  }

}

void sub_10001CD7C(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

void sub_10001CD88(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void sub_10001CE4C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  uint64_t v18;
  NSErrorUserInfoKey v19;
  void *v20;

  v5 = a2;
  if (a3)
  {
    v6 = *(_QWORD *)(a1 + 40);
    v19 = NSUnderlyingErrorKey;
    v20 = a3;
    v7 = a3;
    v8 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1));
    v9 = DMFErrorWithCodeAndUserInfo(1006, v8);
    v10 = (id)objc_claimAutoreleasedReturnValue(v9);
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v10);
  }
  else
  {
    v11 = 0;
    v8 = objc_msgSend(objc_alloc((Class)SSAuthenticationContext), "initWithAccount:", v5);
    v12 = objc_alloc((Class)SSRedeemCodesRequest);
    v18 = *(_QWORD *)(a1 + 32);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v18, 1));
    v10 = objc_msgSend(v12, "initWithRedeemCodes:", v13);

    objc_msgSend(v10, "setAuthenticationContext:", v8);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10001CFF8;
    v15[3] = &unk_1000BA308;
    v14 = *(id *)(a1 + 40);
    v16 = 0;
    v17 = v14;
    objc_msgSend(v10, "startWithRedeemResponseBlock:", v15);

  }
}

void sub_10001CFF8(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSErrorUserInfoKey v13;
  uint64_t v14;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 40);
  if (v6)
  {
    v8 = *(_QWORD *)(a1 + 32);
    if (v8)
    {
      v13 = NSUnderlyingErrorKey;
      v14 = v8;
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1));
      v10 = DMFErrorWithCodeAndUserInfo(1006, v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v11);

    }
    else
    {
      v12 = DMFErrorWithCodeAndUserInfo(1006, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue(v12);
      (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v9);
    }

  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(v7 + 16))(*(_QWORD *)(a1 + 40), 0);
  }

}

void sub_10001D1E4(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  void *v22;
  _BYTE v23[128];

  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v3 = a2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v19;
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v19 != v6)
        objc_enumerationMutation(v3);
      v8 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v7);
      v9 = *(void **)(a1 + 32);
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bundleID"));
      LOBYTE(v9) = objc_msgSend(v9, "isEqualToString:", v10);

      if ((v9 & 1) != 0)
        break;
      if (v5 == (id)++v7)
      {
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
        if (v5)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", objc_msgSend(v8, "persistentID")));

    if (!v11)
      goto LABEL_12;
    v12 = *(void **)(a1 + 40);
    v22 = v11;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v22, 1));
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10001D3E4;
    v16[3] = &unk_1000BA0C8;
    v17 = *(id *)(a1 + 48);
    objc_msgSend(v12, "cancelJobsWithIDs:completionBlock:", v13, v16);

  }
  else
  {
LABEL_9:

LABEL_12:
    v14 = *(_QWORD *)(a1 + 48);
    v15 = DMFErrorWithCodeAndUserInfo(1100, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v15);
    (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v11);
  }

}

void sub_10001D3E4(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSErrorUserInfoKey v12;
  id v13;

  v5 = a3;
  v6 = v5;
  v7 = *(_QWORD *)(a1 + 32);
  if (a2)
  {
    (*(void (**)(uint64_t, _QWORD))(v7 + 16))(v7, 0);
  }
  else
  {
    if (v5)
    {
      v12 = NSUnderlyingErrorKey;
      v13 = v5;
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1));
      v9 = DMFErrorWithCodeAndUserInfo(1100, v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v10);

    }
    else
    {
      v11 = DMFErrorWithCodeAndUserInfo(1100, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue(v11);
      (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);
    }

  }
}

void sub_10001D5DC(uint64_t a1, char a2, void *a3)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  id v10;

  if ((a2 & 1) == 0)
  {
    v6 = a3;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("DMDAppController+Remove+iphoneOS.m"), 64, CFSTR("Assertion couldn't be acquired: %@"), v6);

  }
  v5 = *(void **)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10001D6C8;
  v8[3] = &unk_1000B9D68;
  v8[4] = v5;
  v9 = v4;
  v10 = *(id *)(a1 + 48);
  objc_msgSend(v5, "_uninstallAppWithBundleIdentifier:completion:", v9, v8);

}

void sub_10001D6C8(_QWORD *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  v3 = (void *)a1[4];
  v4 = a1[5];
  v5 = a2;
  objc_msgSend(v3, "removeTerminationAssertionForBundleIdentifier:", v4);
  (*(void (**)(void))(a1[6] + 16))();

}

void sub_10001D89C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  id v6;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10001D93C;
  v4[3] = &unk_1000BA380;
  v5 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 56);
  +[IXAppInstallCoordinator uninstallAppWithBundleID:options:completion:](IXAppInstallCoordinator, "uninstallAppWithBundleID:options:completion:", v2, v3, v4);

}

void sub_10001D93C(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  objc_msgSend(v4, "resumeSync");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t sub_10001D988(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_10001DF1C(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (v3)
    objc_msgSend(*(id *)(a1 + 32), "_updateEndedForLifeCycle:", *(_QWORD *)(a1 + 40));
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void sub_10001E1D4(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;

  v4 = a3;
  v6 = DMFAppLog(v4, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = v7;
  if (v4)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_100072404(a1, (uint64_t)v4, v8);
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(_QWORD *)(a1 + 32);
    v10 = 138543362;
    v11 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "DMF successfully restarted app: %{public}@", (uint8_t *)&v10, 0xCu);
  }

}

void sub_10001E4D0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10001E56C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10001E5C0(id a1)
{
  NSMutableDictionary *v1;
  void *v2;

  v1 = objc_opt_new(NSMutableDictionary);
  v2 = (void *)qword_1000EB758;
  qword_1000EB758 = (uint64_t)v1;

}

void sub_10001EDB0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  _Unwind_Resume(exception_object);
}

void sub_10001EDD0(id a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[9];
  _QWORD v13[9];

  v1 = (void *)objc_claimAutoreleasedReturnValue(+[DMFApp stringForInstallationState:](DMFApp, "stringForInstallationState:", 0));
  v12[0] = v1;
  v13[0] = &off_1000C3420;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[DMFApp stringForInstallationState:](DMFApp, "stringForInstallationState:", 1));
  v12[1] = v2;
  v13[1] = &off_1000C3438;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[DMFApp stringForInstallationState:](DMFApp, "stringForInstallationState:", 2));
  v12[2] = v3;
  v13[2] = &off_1000C3450;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[DMFApp stringForInstallationState:](DMFApp, "stringForInstallationState:", 3));
  v12[3] = v4;
  v13[3] = &off_1000C3468;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[DMFApp stringForInstallationState:](DMFApp, "stringForInstallationState:", 4));
  v12[4] = v5;
  v13[4] = &off_1000C3480;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[DMFApp stringForInstallationState:](DMFApp, "stringForInstallationState:", 5));
  v12[5] = v6;
  v13[5] = &off_1000C3498;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[DMFApp stringForInstallationState:](DMFApp, "stringForInstallationState:", 6));
  v12[6] = v7;
  v13[6] = &off_1000C34B0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[DMFApp stringForInstallationState:](DMFApp, "stringForInstallationState:", 7));
  v12[7] = v8;
  v13[7] = &off_1000C34C8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[DMFApp stringForInstallationState:](DMFApp, "stringForInstallationState:", 8));
  v12[8] = v9;
  v13[8] = &off_1000C34E0;
  v10 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v13, v12, 9));
  v11 = (void *)qword_1000EB768;
  qword_1000EB768 = v10;

}

void sub_10001EFD4(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v2 = (void *)qword_1000EB768;
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "stateMachine"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "currentState"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "name"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", v4));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v5, "unsignedIntegerValue");

}

void sub_10001F1A4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  _Unwind_Resume(exception_object);
}

uint64_t sub_10001F1C4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_10001F1D4(uint64_t a1)
{

}

void sub_10001F1DC(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "stateMachine"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "currentState"));
  v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "name"));
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void sub_10001F2B8(uint64_t a1)
{
  void *v2;
  NSString *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "stateMachine"));
  v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CATStateMachineEvent eventWithTrigger:context:](CATStateMachineEvent, "eventWithTrigger:context:", v4, 0));
  objc_msgSend(v2, "transitionWithTriggeringEvent:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  objc_msgSend(*(id *)(a1 + 32), "setLastModified:", v6);

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "observers", 0));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v12, "willStartInstallingForLifeCycle:") & 1) != 0)
          objc_msgSend(v12, "willStartInstallingForLifeCycle:", *(_QWORD *)(a1 + 32));
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

void sub_10001F4CC(uint64_t a1)
{
  void *v2;
  NSString *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "stateMachine"));
  v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CATStateMachineEvent eventWithTrigger:context:](CATStateMachineEvent, "eventWithTrigger:context:", v4, 0));
  objc_msgSend(v2, "transitionWithTriggeringEvent:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  objc_msgSend(*(id *)(a1 + 32), "setLastModified:", v6);

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "observers", 0));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v12, "didStartInstallingForLifeCycle:") & 1) != 0)
          objc_msgSend(v12, "didStartInstallingForLifeCycle:", *(_QWORD *)(a1 + 32));
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

void sub_10001F6E0(uint64_t a1)
{
  void *v2;
  NSString *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "stateMachine"));
  v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CATStateMachineEvent eventWithTrigger:context:](CATStateMachineEvent, "eventWithTrigger:context:", v4, 0));
  objc_msgSend(v2, "transitionWithTriggeringEvent:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  objc_msgSend(*(id *)(a1 + 32), "setLastModified:", v6);

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "observers", 0));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v12, "didPauseInstallingForLifeCycle:") & 1) != 0)
          objc_msgSend(v12, "didPauseInstallingForLifeCycle:", *(_QWORD *)(a1 + 32));
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

void sub_10001F8F4(uint64_t a1)
{
  void *v2;
  NSString *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "stateMachine"));
  v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CATStateMachineEvent eventWithTrigger:context:](CATStateMachineEvent, "eventWithTrigger:context:", v4, 0));
  objc_msgSend(v2, "transitionWithTriggeringEvent:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  objc_msgSend(*(id *)(a1 + 32), "setLastModified:", v6);

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "observers", 0));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v12, "didResumeInstallingForLifeCycle:") & 1) != 0)
          objc_msgSend(v12, "didResumeInstallingForLifeCycle:", *(_QWORD *)(a1 + 32));
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

void sub_10001FB08(uint64_t a1)
{
  void *v2;
  NSString *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "stateMachine"));
  v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CATStateMachineEvent eventWithTrigger:context:](CATStateMachineEvent, "eventWithTrigger:context:", v4, 0));
  objc_msgSend(v2, "transitionWithTriggeringEvent:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  objc_msgSend(*(id *)(a1 + 32), "setLastModified:", v6);

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "observers", 0));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v12, "didCancelInstallingForLifeCycle:") & 1) != 0)
          objc_msgSend(v12, "didCancelInstallingForLifeCycle:", *(_QWORD *)(a1 + 32));
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

void sub_10001FD1C(uint64_t a1)
{
  void *v2;
  NSString *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "stateMachine"));
  v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CATStateMachineEvent eventWithTrigger:context:](CATStateMachineEvent, "eventWithTrigger:context:", v4, 0));
  objc_msgSend(v2, "transitionWithTriggeringEvent:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  objc_msgSend(*(id *)(a1 + 32), "setLastModified:", v6);

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "observers", 0));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v12, "didFailInstallingForLifeCycle:") & 1) != 0)
          objc_msgSend(v12, "didFailInstallingForLifeCycle:", *(_QWORD *)(a1 + 32));
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

void sub_10001FF30(uint64_t a1)
{
  void *v2;
  NSString *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "stateMachine"));
  v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CATStateMachineEvent eventWithTrigger:context:](CATStateMachineEvent, "eventWithTrigger:context:", v4, 0));
  objc_msgSend(v2, "transitionWithTriggeringEvent:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  objc_msgSend(*(id *)(a1 + 32), "setLastModified:", v6);

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "observers", 0));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v12, "didFinishInstallingForLifeCycle:") & 1) != 0)
          objc_msgSend(v12, "didFinishInstallingForLifeCycle:", *(_QWORD *)(a1 + 32));
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

void sub_100020144(uint64_t a1)
{
  void *v2;
  NSString *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "stateMachine"));
  v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CATStateMachineEvent eventWithTrigger:context:](CATStateMachineEvent, "eventWithTrigger:context:", v4, 0));
  objc_msgSend(v2, "transitionWithTriggeringEvent:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  objc_msgSend(*(id *)(a1 + 32), "setLastModified:", v6);

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "observers", 0));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v12, "willStartUpdatingForLifeCycle:") & 1) != 0)
          objc_msgSend(v12, "willStartUpdatingForLifeCycle:", *(_QWORD *)(a1 + 32));
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

void sub_100020358(uint64_t a1)
{
  void *v2;
  NSString *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "stateMachine"));
  v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CATStateMachineEvent eventWithTrigger:context:](CATStateMachineEvent, "eventWithTrigger:context:", v4, 0));
  objc_msgSend(v2, "transitionWithTriggeringEvent:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  objc_msgSend(*(id *)(a1 + 32), "setLastModified:", v6);

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "observers", 0));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v12, "didStartUpdatingForLifeCycle:") & 1) != 0)
          objc_msgSend(v12, "didStartUpdatingForLifeCycle:", *(_QWORD *)(a1 + 32));
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

void sub_10002056C(uint64_t a1)
{
  void *v2;
  NSString *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "stateMachine"));
  v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CATStateMachineEvent eventWithTrigger:context:](CATStateMachineEvent, "eventWithTrigger:context:", v4, 0));
  objc_msgSend(v2, "transitionWithTriggeringEvent:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  objc_msgSend(*(id *)(a1 + 32), "setLastModified:", v6);

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "observers", 0));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v12, "didPauseUpdatingForLifeCycle:") & 1) != 0)
          objc_msgSend(v12, "didPauseUpdatingForLifeCycle:", *(_QWORD *)(a1 + 32));
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

void sub_100020780(uint64_t a1)
{
  void *v2;
  NSString *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "stateMachine"));
  v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CATStateMachineEvent eventWithTrigger:context:](CATStateMachineEvent, "eventWithTrigger:context:", v4, 0));
  objc_msgSend(v2, "transitionWithTriggeringEvent:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  objc_msgSend(*(id *)(a1 + 32), "setLastModified:", v6);

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "observers", 0));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v12, "didResumeUpdatingForLifeCycle:") & 1) != 0)
          objc_msgSend(v12, "didResumeUpdatingForLifeCycle:", *(_QWORD *)(a1 + 32));
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

void sub_100020994(uint64_t a1)
{
  void *v2;
  NSString *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "stateMachine"));
  v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CATStateMachineEvent eventWithTrigger:context:](CATStateMachineEvent, "eventWithTrigger:context:", v4, 0));
  objc_msgSend(v2, "transitionWithTriggeringEvent:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  objc_msgSend(*(id *)(a1 + 32), "setLastModified:", v6);

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "observers", 0));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v12, "didCancelUpdatingForLifeCycle:") & 1) != 0)
          objc_msgSend(v12, "didCancelUpdatingForLifeCycle:", *(_QWORD *)(a1 + 32));
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

void sub_100020BA8(uint64_t a1)
{
  void *v2;
  NSString *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "stateMachine"));
  v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CATStateMachineEvent eventWithTrigger:context:](CATStateMachineEvent, "eventWithTrigger:context:", v4, 0));
  objc_msgSend(v2, "transitionWithTriggeringEvent:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  objc_msgSend(*(id *)(a1 + 32), "setLastModified:", v6);

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "observers", 0));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v12, "didFailUpdatingForLifeCycle:") & 1) != 0)
          objc_msgSend(v12, "didFailUpdatingForLifeCycle:", *(_QWORD *)(a1 + 32));
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

void sub_100020DBC(uint64_t a1)
{
  void *v2;
  NSString *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "stateMachine"));
  v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CATStateMachineEvent eventWithTrigger:context:](CATStateMachineEvent, "eventWithTrigger:context:", v4, 0));
  objc_msgSend(v2, "transitionWithTriggeringEvent:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  objc_msgSend(*(id *)(a1 + 32), "setLastModified:", v6);

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "observers", 0));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v12, "didFinishUpdatingForLifeCycle:") & 1) != 0)
          objc_msgSend(v12, "didFinishUpdatingForLifeCycle:", *(_QWORD *)(a1 + 32));
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

void sub_100020FD0(uint64_t a1)
{
  void *v2;
  NSString *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "stateMachine"));
  v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CATStateMachineEvent eventWithTrigger:context:](CATStateMachineEvent, "eventWithTrigger:context:", v4, 0));
  objc_msgSend(v2, "transitionWithTriggeringEvent:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  objc_msgSend(*(id *)(a1 + 32), "setLastModified:", v6);

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "observers", 0));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v12, "willStartUninstallingForLifeCycle:") & 1) != 0)
          objc_msgSend(v12, "willStartUninstallingForLifeCycle:", *(_QWORD *)(a1 + 32));
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

void sub_1000211E4(uint64_t a1)
{
  void *v2;
  NSString *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "stateMachine"));
  v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CATStateMachineEvent eventWithTrigger:context:](CATStateMachineEvent, "eventWithTrigger:context:", v4, 0));
  objc_msgSend(v2, "transitionWithTriggeringEvent:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  objc_msgSend(*(id *)(a1 + 32), "setLastModified:", v6);

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "observers", 0));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v12, "didFailUninstallingForLifeCycle:") & 1) != 0)
          objc_msgSend(v12, "didFailUninstallingForLifeCycle:", *(_QWORD *)(a1 + 32));
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

void sub_1000213F8(uint64_t a1)
{
  void *v2;
  NSString *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "stateMachine"));
  v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CATStateMachineEvent eventWithTrigger:context:](CATStateMachineEvent, "eventWithTrigger:context:", v4, 0));
  objc_msgSend(v2, "transitionWithTriggeringEvent:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  objc_msgSend(*(id *)(a1 + 32), "setLastModified:", v6);

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "observers", 0));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v12, "didFinishUninstallingForLifeCycle:") & 1) != 0)
          objc_msgSend(v12, "didFinishUninstallingForLifeCycle:", *(_QWORD *)(a1 + 32));
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

void sub_10002162C(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "observers"));
  objc_msgSend(v2, "addPointer:", *(_QWORD *)(a1 + 40));

}

void sub_100021704(uint64_t a1)
{
  id v2;
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "observers"));
  v2 = objc_msgSend(v8, "count");
  if (v2)
  {
    v3 = v2;
    v4 = 0;
    while (1)
    {
      v5 = *(id *)(a1 + 40);
      if (v5 == objc_msgSend(v8, "pointerAtIndex:", v4))
        break;
      if (v3 == (id)++v4)
        goto LABEL_8;
    }
    objc_msgSend(v8, "removePointerAtIndex:", v4);
    if (!objc_msgSend(v8, "count"))
    {
      v6 = (void *)objc_opt_class(*(_QWORD *)(a1 + 32));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier"));
      objc_msgSend(v6, "_removeLifeCycleForBundleIdentifier:", v7);

    }
  }
LABEL_8:

}

void sub_10002182C(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "observers", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v7, "didChangeInstallingProgressForLifeCycle:") & 1) != 0)
          objc_msgSend(v7, "didChangeInstallingProgressForLifeCycle:", *(_QWORD *)(a1 + 32));
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

void sub_1000219B8(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "observers", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v7, "didChangeUpdatingProgressForLifeCycle:") & 1) != 0)
          objc_msgSend(v7, "didChangeUpdatingProgressForLifeCycle:", *(_QWORD *)(a1 + 32));
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

void sub_100021C10(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "observers", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v7, "didResetStateForLifeCycle:state:") & 1) != 0)
          objc_msgSend(v7, "didResetStateForLifeCycle:state:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

void sub_100022318(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;

  v2 = objc_msgSend(*(id *)(a1 + 32), "currentState");
  if (v2 == (id)4)
  {
    v7 = DMFAppLog(4, v3);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier"));
      v14 = 138543362;
      v15 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "lifecycle event: [%{public}@] installed -> applicationsWillInstall -> willStartUpdating", (uint8_t *)&v14, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 32), "willStartUpdating");
  }
  else if (v2)
  {
    v10 = DMFAppLog(v2, v3);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "currentStateName"));
      v14 = 138543618;
      v15 = v12;
      v16 = 2114;
      v17 = v13;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "lifecycle event: [%{public}@] <%{public}@> -> applicationsWillInstall -> <no change>", (uint8_t *)&v14, 0x16u);

    }
  }
  else
  {
    v4 = DMFAppLog(0, v3);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier"));
      v14 = 138543362;
      v15 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "lifecycle event: [%{public}@] uninstalled -> applicationsWillInstall -> willStartInstalling", (uint8_t *)&v14, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 32), "willStartInstalling");
  }
}

void sub_100022538(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  unsigned int v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  int v32;
  void *v33;
  __int16 v34;
  void *v35;

  v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "currentState");
  switch((unint64_t)v4)
  {
    case 0uLL:
      v6 = DMFAppLog(v4, v5);
      v7 = objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier"));
        v32 = 138543362;
        v33 = v8;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "lifecycle event: [%{public}@] uninstalled -> applicationInstallsDidStart -> willStartInstalling -> didStartInstalling", (uint8_t *)&v32, 0xCu);

      }
      objc_msgSend(*(id *)(a1 + 32), "willStartInstalling");
      goto LABEL_8;
    case 1uLL:
      v9 = DMFAppLog(v4, v5);
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier"));
        v32 = 138543362;
        v33 = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "lifecycle event: [%{public}@] queued -> applicationInstallsDidStart -> didStartInstalling", (uint8_t *)&v32, 0xCu);

      }
LABEL_8:
      objc_msgSend(*(id *)(a1 + 32), "didStartInstalling");
      goto LABEL_27;
    case 4uLL:
      v16 = DMFAppLog(v4, v5);
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier"));
        v32 = 138543362;
        v33 = v18;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "lifecycle event: [%{public}@] installed -> applicationInstallsDidStart -> willStartUpdating -> didStartUpdating", (uint8_t *)&v32, 0xCu);

      }
      objc_msgSend(*(id *)(a1 + 32), "willStartUpdating");
      goto LABEL_17;
    case 5uLL:
      v19 = DMFAppLog(v4, v5);
      v20 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier"));
        v32 = 138543362;
        v33 = v21;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "lifecycle event: [%{public}@] queued -> applicationInstallsDidStart -> didStartUpdating", (uint8_t *)&v32, 0xCu);

      }
LABEL_17:
      objc_msgSend(*(id *)(a1 + 32), "didStartUpdating");
      goto LABEL_27;
    case 8uLL:
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "appState"));
      if ((objc_msgSend(v22, "isDowngraded") & 1) != 0)
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "appState"));
        v24 = objc_msgSend(v23, "isPlaceholder");

        if (v24)
        {
          v27 = DMFAppLog(v25, v26);
          v28 = objc_claimAutoreleasedReturnValue(v27);
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier"));
            v32 = 138543362;
            v33 = v29;
            _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "lifecycle event: [%{public}@] uninstalling -> applicationInstallsDidStart -> didFinishUninstalling (special case)", (uint8_t *)&v32, 0xCu);

          }
          v25 = objc_msgSend(*(id *)(a1 + 32), "didFinishUninstalling");
        }
      }
      else
      {

      }
      v30 = DMFAppLog(v25, v26);
      v13 = objc_claimAutoreleasedReturnValue(v30);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier"));
        v32 = 138543362;
        v33 = v31;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "lifecycle event: [%{public}@] uninstalling -> applicationInstallsDidStart -> <no change> (not special case)", (uint8_t *)&v32, 0xCu);

      }
      goto LABEL_26;
    default:
      v12 = DMFAppLog(v4, v5);
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "currentStateName"));
        v32 = 138543618;
        v33 = v14;
        v34 = 2114;
        v35 = v15;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "lifecycle event: [%{public}@] <%{public}@> -> applicationInstallsDidStart -> <no change>", (uint8_t *)&v32, 0x16u);

      }
LABEL_26:

LABEL_27:
      return;
  }
}

void sub_100022974(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;

  v2 = objc_msgSend(*(id *)(a1 + 32), "currentState");
  if (v2 == (id)6)
  {
    v7 = DMFAppLog(6, v3);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier"));
      v14 = 138543362;
      v15 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "lifecycle event: [%{public}@] updating -> applicationInstallsDidChange -> didChangeUpdatingProgress", (uint8_t *)&v14, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 32), "didChangeUpdatingProgress");
  }
  else if (v2 == (id)2)
  {
    v4 = DMFAppLog(2, v3);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier"));
      v14 = 138543362;
      v15 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "lifecycle event: [%{public}@] installing -> applicationInstallsDidChange -> didChangeInstallingProgress", (uint8_t *)&v14, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 32), "didChangeInstallingProgress");
  }
  else
  {
    v10 = DMFAppLog(v2, v3);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "currentStateName"));
      v14 = 138543618;
      v15 = v12;
      v16 = 2114;
      v17 = v13;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "lifecycle event: [%{public}@] <%{public}@> -> applicationInstallsDidChange -> <no change>", (uint8_t *)&v14, 0x16u);

    }
  }
}

void sub_100022B98(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;

  v2 = objc_msgSend(*(id *)(a1 + 32), "currentState");
  if (v2 == (id)6)
  {
    v7 = DMFAppLog(6, v3);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier"));
      v14 = 138543362;
      v15 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "lifecycle event: [%{public}@] updating -> applicationInstallsDidPause -> didPauseUpdating", (uint8_t *)&v14, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 32), "didPauseUpdating");
  }
  else if (v2 == (id)2)
  {
    v4 = DMFAppLog(2, v3);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier"));
      v14 = 138543362;
      v15 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "lifecycle event: [%{public}@] installing -> applicationInstallsDidPause -> didPauseInstalling", (uint8_t *)&v14, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 32), "didPauseInstalling");
  }
  else
  {
    v10 = DMFAppLog(v2, v3);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "currentStateName"));
      v14 = 138543618;
      v15 = v12;
      v16 = 2114;
      v17 = v13;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "lifecycle event: [%{public}@] <%{public}@> -> applicationInstallsDidPause -> <no change>", (uint8_t *)&v14, 0x16u);

    }
  }
}

void sub_100022DBC(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;

  v2 = objc_msgSend(*(id *)(a1 + 32), "currentState");
  if (v2 == (id)7)
  {
    v7 = DMFAppLog(7, v3);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier"));
      v14 = 138543362;
      v15 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "lifecycle event: [%{public}@] update paused -> applicationInstallsDidResume -> didResumeUpdating", (uint8_t *)&v14, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 32), "didResumeUpdating");
  }
  else if (v2 == (id)3)
  {
    v4 = DMFAppLog(3, v3);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier"));
      v14 = 138543362;
      v15 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "lifecycle event: [%{public}@] installation paused -> applicationInstallsDidResume -> didResumeInstalling", (uint8_t *)&v14, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 32), "didResumeInstalling");
  }
  else
  {
    v10 = DMFAppLog(v2, v3);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "currentStateName"));
      v14 = 138543618;
      v15 = v12;
      v16 = 2114;
      v17 = v13;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "lifecycle event: [%{public}@] <%{public}@> -> applicationInstallsDidResume -> <no change>", (uint8_t *)&v14, 0x16u);

    }
  }
}

void sub_100022FE0(uint64_t a1)
{
  char *v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;

  v2 = (char *)objc_msgSend(*(id *)(a1 + 32), "currentState");
  if ((unint64_t)(v2 - 5) < 3)
  {
    v7 = DMFAppLog(v2, v3);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier"));
      v14 = 138543362;
      v15 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "lifecycle event: [%{public}@] <update queued | updating | update paused> -> applicationInstallsDidCancel -> didCancelUpdating", (uint8_t *)&v14, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 32), "didCancelUpdating");
  }
  else if ((unint64_t)(v2 - 1) > 2)
  {
    v10 = DMFAppLog(v2, v3);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "currentStateName"));
      v14 = 138543618;
      v15 = v12;
      v16 = 2114;
      v17 = v13;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "lifecycle event: [%{public}@] <%{public}@> -> applicationInstallsDidCancel -> <no change>", (uint8_t *)&v14, 0x16u);

    }
  }
  else
  {
    v4 = DMFAppLog(v2, v3);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier"));
      v14 = 138543362;
      v15 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "lifecycle event: [%{public}@] <installation queued | installing | installation paused> -> applicationInstallsDidCancel -> didCancelInstalling", (uint8_t *)&v14, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 32), "didCancelInstalling");
  }
}

void sub_10002320C(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;

  v2 = objc_msgSend(*(id *)(a1 + 32), "currentState");
  switch((unint64_t)v2)
  {
    case 1uLL:
      v10 = DMFAppLog(v2, v3);
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier"));
        v20 = 138543362;
        v21 = v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "lifecycle event: [%{public}@] installation queued -> applicationsDidFailToInstall -> didStartInstalling -> didFailInstalling", (uint8_t *)&v20, 0xCu);

      }
      objc_msgSend(*(id *)(a1 + 32), "didStartInstalling");
      goto LABEL_11;
    case 2uLL:
    case 3uLL:
      v4 = DMFAppLog(v2, v3);
      v5 = objc_claimAutoreleasedReturnValue(v4);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier"));
        v20 = 138543362;
        v21 = v6;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "lifecycle event: [%{public}@] <installing | installation paused> -> applicationsDidFailToInstall -> didFailInstalling", (uint8_t *)&v20, 0xCu);

      }
LABEL_11:
      objc_msgSend(*(id *)(a1 + 32), "didFailInstalling");
      return;
    case 5uLL:
      v17 = DMFAppLog(v2, v3);
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier"));
        v20 = 138543362;
        v21 = v19;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "lifecycle event: [%{public}@] update queued -> applicationsDidFailToInstall -> didStartUpdating -> didFailUpdating", (uint8_t *)&v20, 0xCu);

      }
      objc_msgSend(*(id *)(a1 + 32), "didStartUpdating");
      goto LABEL_18;
    case 6uLL:
    case 7uLL:
      v7 = DMFAppLog(v2, v3);
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier"));
        v20 = 138543362;
        v21 = v9;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "lifecycle event: [%{public}@] <updating | update paused> -> applicationsDidFailToInstall -> didFailUpdating", (uint8_t *)&v20, 0xCu);

      }
LABEL_18:
      objc_msgSend(*(id *)(a1 + 32), "didFailUpdating");
      break;
    default:
      v13 = DMFAppLog(v2, v3);
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "currentStateName"));
        v20 = 138543618;
        v21 = v15;
        v22 = 2114;
        v23 = v16;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "lifecycle event: [%{public}@] <%{public}@> -> applicationsDidFailToInstall -> <no change>", (uint8_t *)&v20, 0x16u);

      }
      break;
  }
}

void sub_100023524(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  int v26;
  void *v27;
  __int16 v28;
  void *v29;

  v2 = objc_msgSend(*(id *)(a1 + 32), "currentState");
  switch((unint64_t)v2)
  {
    case 1uLL:
      v4 = DMFAppLog(v2, v3);
      v5 = objc_claimAutoreleasedReturnValue(v4);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier"));
        v26 = 138543362;
        v27 = v6;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "lifecycle event: [%{public}@] installation queued -> applicationsDidInstall -> didStartInstalling -> didFinishInstalling", (uint8_t *)&v26, 0xCu);

      }
      objc_msgSend(*(id *)(a1 + 32), "didStartInstalling");
      goto LABEL_11;
    case 2uLL:
      v7 = DMFAppLog(v2, v3);
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier"));
        v26 = 138543362;
        v27 = v9;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "lifecycle event: [%{public}@] installing -> applicationsDidInstall -> didFinishInstalling", (uint8_t *)&v26, 0xCu);

      }
      goto LABEL_11;
    case 3uLL:
      v10 = DMFAppLog(v2, v3);
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier"));
        v26 = 138543362;
        v27 = v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "lifecycle event: [%{public}@] installation paused -> applicationsDidInstall -> didResumeInstalling -> didFinishInstalling", (uint8_t *)&v26, 0xCu);

      }
      objc_msgSend(*(id *)(a1 + 32), "didResumeInstalling");
LABEL_11:
      objc_msgSend(*(id *)(a1 + 32), "didFinishInstalling");
      return;
    case 5uLL:
      v17 = DMFAppLog(v2, v3);
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier"));
        v26 = 138543362;
        v27 = v19;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "lifecycle event: [%{public}@] update queued -> applicationsDidInstall -> didStartUpdating -> didFinishUpdating", (uint8_t *)&v26, 0xCu);

      }
      objc_msgSend(*(id *)(a1 + 32), "didStartUpdating");
      goto LABEL_24;
    case 6uLL:
      v20 = DMFAppLog(v2, v3);
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier"));
        v26 = 138543362;
        v27 = v22;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "lifecycle event: [%{public}@] updating -> applicationsDidInstall -> didFinishUpdating", (uint8_t *)&v26, 0xCu);

      }
      goto LABEL_24;
    case 7uLL:
      v23 = DMFAppLog(v2, v3);
      v24 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier"));
        v26 = 138543362;
        v27 = v25;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "lifecycle event: [%{public}@] update paused -> applicationsDidInstall -> didResumeUpdating -> didFinishUpdating", (uint8_t *)&v26, 0xCu);

      }
      objc_msgSend(*(id *)(a1 + 32), "didResumeUpdating");
LABEL_24:
      objc_msgSend(*(id *)(a1 + 32), "didFinishUpdating");
      break;
    default:
      v13 = DMFAppLog(v2, v3);
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "currentStateName"));
        v26 = 138543618;
        v27 = v15;
        v28 = 2114;
        v29 = v16;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "lifecycle event: [%{public}@] <%{public}@> -> applicationsDidInstall -> <no change>", (uint8_t *)&v26, 0x16u);

      }
      break;
  }
}

void sub_10002391C(uint64_t a1)
{
  char *v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;

  v2 = (char *)objc_msgSend(*(id *)(a1 + 32), "currentState");
  if ((unint64_t)(v2 - 1) < 3)
  {
    v7 = DMFAppLog(v2, v3);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier"));
      v17 = 138543362;
      v18 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "lifecycle event: [%{public}@] <installation queued | installing | installation paused> -> applicationsWillUninstall -> didCancelInstalling", (uint8_t *)&v17, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 32), "didCancelInstalling");
  }
  else if ((unint64_t)(v2 - 5) >= 3)
  {
    if (v2 == (char *)4)
    {
      v10 = DMFAppLog(4, v3);
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier"));
        v17 = 138543362;
        v18 = v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "lifecycle event: [%{public}@] installed -> applicationsWillUninstall -> willStartUninstalling", (uint8_t *)&v17, 0xCu);

      }
      objc_msgSend(*(id *)(a1 + 32), "willStartUninstalling");
    }
    else
    {
      v13 = DMFAppLog(v2, v3);
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "currentStateName"));
        v17 = 138543618;
        v18 = v15;
        v19 = 2114;
        v20 = v16;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "lifecycle event: [%{public}@] <%{public}@> -> applicationsWillUninstall -> <no change>", (uint8_t *)&v17, 0x16u);

      }
    }
  }
  else
  {
    v4 = DMFAppLog(v2, v3);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier"));
      v17 = 138543362;
      v18 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "lifecycle event: [%{public}@] <update queued | updating | update paused> -> applicationsWillUninstall -> didCancelUpdating", (uint8_t *)&v17, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 32), "didCancelUpdating");
  }
}

void sub_100023BC0(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;

  v2 = objc_msgSend(*(id *)(a1 + 32), "currentState");
  v4 = DMFAppLog(v2, v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v2 == (id)8)
  {
    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier"));
      v10 = 138543362;
      v11 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "lifecycle event: [%{public}@] uninstalling -> applicationsDidFailToUninstall -> didFailUninstalling", (uint8_t *)&v10, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 32), "didFailUninstalling");
  }
  else
  {
    if (v6)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "currentStateName"));
      v10 = 138543618;
      v11 = v8;
      v12 = 2114;
      v13 = v9;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "lifecycle event: [%{public}@] <%{public}@> -> applicationsDidFailToUninstall -> <no change>", (uint8_t *)&v10, 0x16u);

    }
  }
}

void sub_100023D5C(uint64_t a1)
{
  char *v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;

  v2 = (char *)objc_msgSend(*(id *)(a1 + 32), "currentState");
  if ((unint64_t)(v2 - 1) < 3)
  {
    v7 = DMFAppLog(v2, v3);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier"));
      v17 = 138543362;
      v18 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "lifecycle event: [%{public}@] <installation queued | installing | installation paused> -> applicationsDidUninstall -> didCancelInstalling", (uint8_t *)&v17, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 32), "didCancelInstalling");
  }
  else if ((unint64_t)(v2 - 5) >= 3)
  {
    if (v2 == (char *)8)
    {
      v10 = DMFAppLog(8, v3);
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier"));
        v17 = 138543362;
        v18 = v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "lifecycle event: [%{public}@] uninstalling -> applicationsDidUninstall -> didFinishUninstalling", (uint8_t *)&v17, 0xCu);

      }
      objc_msgSend(*(id *)(a1 + 32), "didFinishUninstalling");
    }
    else
    {
      v13 = DMFAppLog(v2, v3);
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "currentStateName"));
        v17 = 138543618;
        v18 = v15;
        v19 = 2114;
        v20 = v16;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "lifecycle event: [%{public}@] <%{public}@> -> applicationsDidUninstall -> <no change>", (uint8_t *)&v17, 0x16u);

      }
    }
  }
  else
  {
    v4 = DMFAppLog(v2, v3);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier"));
      v17 = 138543362;
      v18 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "lifecycle event: [%{public}@] <update queued | updating | update paused> -> applicationsDidUninstall -> didCancelUpdating", (uint8_t *)&v17, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 32), "didCancelUpdating");
  }
}

id sub_1000244C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;

  v4 = *(void **)(a1 + 32);
  if (a3)
    return objc_msgSend(v4, "endOperationWithError:");
  else
    return objc_msgSend(v4, "runWithRequest:bundleIdentifier:", *(_QWORD *)(a1 + 40), a2);
}

void sub_1000246E8(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  NSObject *v30;
  uint64_t v31;
  NSObject *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  id v36;
  id v37;
  uint8_t buf[4];
  void *v39;
  _QWORD v40[2];
  _QWORD v41[2];
  void *v42;
  uint64_t v43;
  void *v44;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "payloadMetadataObjectID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectWithID:", v5));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "payload"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "payloadDictionary"));
  v37 = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[CEMAssetBase declarationForPayload:error:](CEMAssetBase, "declarationForPayload:error:", v8, &v37));
  v10 = v37;

  if (v9)
  {
    v12 = objc_opt_respondsToSelector(v9, "dmf_installAssetOperationWithReferenceResolver:error:");
    if ((v12 & 1) != 0)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "unknownPayloadKeys"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "allObjects"));

      if (objc_msgSend(v14, "count"))
      {
        v15 = *(void **)(a1 + 32);
        v43 = DMFDeclarationStateReasonKey;
        v40[0] = DMFDeclarationStateReasonKey;
        v40[1] = DMFCEMReasonCodeUnknownPayloadKeys;
        v41[0] = DMFCEMReasonCodeUnknownPayloadKeys;
        v41[1] = v14;
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v41, v40, 2));
        v42 = v16;
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v42, 1));
        v44 = v17;
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1));
        objc_msgSend(v15, "addStatusEntriesFromDictionary:", v18);

      }
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "assetResolver"));
      v36 = v10;
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "dmf_installAssetOperationWithReferenceResolver:error:", v19, &v36));
      v21 = v36;

      v23 = DMFConfigurationEngineLog(v22);
      v24 = objc_claimAutoreleasedReturnValue(v23);
      v25 = v24;
      if (v20)
      {
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
          *(_DWORD *)buf = 138543362;
          v39 = v26;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "%{public}@: Asset will install", buf, 0xCu);

        }
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "taskOperationProvider"));
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "database"));
        objc_msgSend(v27, "prepareToRunOperation:withContext:withDatabase:", v20, 0, v28);

        objc_msgSend(v20, "addTarget:selector:forOperationEvents:userInfo:", *(_QWORD *)(a1 + 32), "installOperationDidFinish:asset:", 6, v9);
        objc_msgSend(*(id *)(a1 + 32), "enqueueOperation:", v20);
      }
      else
      {
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          sub_1000725E0();

        objc_msgSend(*(id *)(a1 + 32), "endOperationMarkingPayloadMetadata:failedWithError:", v6, v21);
      }

      v10 = v21;
    }
    else
    {
      v31 = DMFConfigurationEngineLog(v12);
      v32 = objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        sub_100072670();

      v33 = *(void **)(a1 + 32);
      v34 = DMFErrorWithCodeAndUserInfo(4, 0);
      v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
      objc_msgSend(v33, "endOperationMarkingPayloadMetadata:failedWithError:", v6, v35);

    }
  }
  else
  {
    v29 = DMFConfigurationEngineLog(v11);
    v30 = objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      sub_100072550();

    objc_msgSend(*(id *)(a1 + 32), "endOperationMarkingPayloadMetadata:failedWithError:", v6, v10);
  }

}

void sub_100024B70(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint8_t buf[4];
  void *v19;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "payloadMetadataObjectID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectWithID:", v5));

  v7 = *(_QWORD *)(a1 + 40);
  v9 = DMFConfigurationEngineLog(v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  v11 = v10;
  if (v7)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_100072750();

    objc_msgSend(*(id *)(a1 + 32), "endOperationMarkingPayloadMetadata:failedWithError:", v6, *(_QWORD *)(a1 + 40));
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
      *(_DWORD *)buf = 138543362;
      v19 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: Installed asset successfully", buf, 0xCu);

    }
    v13 = *(void **)(a1 + 32);
    v16 = DMFCommandStateStatusKey;
    v17 = DMFDeclarationStatusInstalled;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1));
    objc_msgSend(v13, "addStatusEntriesFromDictionary:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "resultObject"));
    if (v15)
      objc_msgSend(v6, "setInstallMetadata:", v15);
    objc_msgSend(v6, "setInstalled:", 1);
    objc_msgSend(*(id *)(a1 + 32), "endOperationWithPayloadMetadata:", v6);

  }
}

void sub_100024DE0(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  NSObject *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint8_t buf[4];
  void *v41;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "payloadMetadataObjectID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectWithID:", v5));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "payload"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "payloadDictionary"));
  v37 = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[CEMAssetBase declarationForPayload:error:](CEMAssetBase, "declarationForPayload:error:", v8, &v37));
  v10 = v37;

  if (v9)
  {
    v12 = objc_opt_respondsToSelector(v9, "dmf_removeAssetOperationWithInstallMetadata:error:");
    if ((v12 & 1) != 0)
    {
      v13 = objc_msgSend(v6, "installed");
      if ((v13 & 1) != 0)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "installMetadata"));
        v36 = v10;
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "dmf_removeAssetOperationWithInstallMetadata:error:", v14, &v36));
        v16 = v36;

        v18 = DMFConfigurationEngineLog(v17);
        v19 = objc_claimAutoreleasedReturnValue(v18);
        v20 = v19;
        if (v15)
        {
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
            *(_DWORD *)buf = 138543362;
            v41 = v21;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "%{public}@: Installed asset will be removed", buf, 0xCu);

          }
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "taskOperationProvider"));
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "database"));
          objc_msgSend(v22, "prepareToRunOperation:withContext:withDatabase:", v15, 0, v23);

          objc_msgSend(v15, "addTarget:selector:forOperationEvents:userInfo:", *(_QWORD *)(a1 + 32), "removeOperationDidFinish:asset:", 6, v9);
          objc_msgSend(*(id *)(a1 + 32), "enqueueOperation:", v15);
        }
        else
        {
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            sub_1000727E0();

          objc_msgSend(*(id *)(a1 + 32), "endOperationMarkingPayloadMetadata:failedWithError:", v6, v16);
        }

        v10 = v16;
      }
      else
      {
        v31 = DMFConfigurationEngineLog(v13);
        v32 = objc_claimAutoreleasedReturnValue(v31);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
          *(_DWORD *)buf = 138543362;
          v41 = v33;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "%{public}@: Uninstalled asset did remove successfully", buf, 0xCu);

        }
        v34 = *(void **)(a1 + 32);
        v38 = DMFDeclarationStateStatusKey;
        v39 = DMFDeclarationStatusRemoved;
        v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1));
        objc_msgSend(v34, "addStatusEntriesFromDictionary:", v35);

        objc_msgSend(*(id *)(a1 + 32), "endOperationWithPayloadMetadata:", v6);
      }
    }
    else
    {
      v26 = DMFConfigurationEngineLog(v12);
      v27 = objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        sub_100072670();

      v28 = *(void **)(a1 + 32);
      v29 = DMFErrorWithCodeAndUserInfo(4, 0);
      v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
      objc_msgSend(v28, "endOperationMarkingPayloadMetadata:failedWithError:", v6, v30);

    }
  }
  else
  {
    v24 = DMFConfigurationEngineLog(v11);
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      sub_100072550();

    objc_msgSend(*(id *)(a1 + 32), "endOperationMarkingPayloadMetadata:failedWithError:", v6, v10);
  }

}

void sub_10002523C(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint8_t buf[4];
  void *v18;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "payloadMetadataObjectID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectWithID:", v5));

  v7 = *(_QWORD *)(a1 + 40);
  v9 = DMFConfigurationEngineLog(v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  v11 = v10;
  if (v7)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_100072870();

    objc_msgSend(*(id *)(a1 + 32), "endOperationMarkingPayloadMetadata:failedWithError:", v6, *(_QWORD *)(a1 + 40));
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
      *(_DWORD *)buf = 138543362;
      v18 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: Removed asset successfully", buf, 0xCu);

    }
    v13 = *(void **)(a1 + 32);
    v15 = DMFCommandStateStatusKey;
    v16 = DMFDeclarationStatusRemoved;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1));
    objc_msgSend(v13, "addStatusEntriesFromDictionary:", v14);

    objc_msgSend(v6, "setInstallMetadata:", 0);
    objc_msgSend(v6, "setInstalled:", 0);
    objc_msgSend(*(id *)(a1 + 32), "endOperationWithPayloadMetadata:", v6);
  }

}

void sub_100025600(id a1)
{
  NSMutableDictionary *v1;
  void *v2;

  v1 = objc_opt_new(NSMutableDictionary);
  v2 = (void *)qword_1000EB778;
  qword_1000EB778 = (uint64_t)v1;

}

void sub_100025720(id a1)
{
  DMDBluetoothManager *v1;
  void *v2;

  v1 = objc_opt_new(DMDBluetoothManager);
  v2 = (void *)qword_1000EB788;
  qword_1000EB788 = (uint64_t)v1;

}

void sub_100025B5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_100025B74(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;

  v3 = 0;
  if (!qword_1000EB7A0)
  {
    v4 = off_1000BA5D8;
    v5 = 0;
    qword_1000EB7A0 = _sl_dlopen(&v4, &v3);
  }
  if (!qword_1000EB7A0)
    sub_100072944(&v3);
  if (v3)
    free(v3);
  result = objc_getClass("STManagementState");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    sub_1000729C0();
  qword_1000EB798 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_100025D88(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  NSMutableDictionary *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  NSObject *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  objc_class *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  NSMutableDictionary *v50;
  id v51;
  id v52;
  id v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  uint8_t buf[4];
  void *v58;
  _QWORD v59[2];
  _QWORD v60[2];
  void *v61;
  uint64_t v62;
  void *v63;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "payloadMetadataObjectID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectWithID:", v5));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "payload"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "payloadDictionary"));
  v54 = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[CEMCommandBase commandForPayload:error:](CEMCommandBase, "commandForPayload:error:", v8, &v54));
  v10 = v54;

  if (v9)
  {
    v12 = objc_msgSend(v9, "conformsToProtocol:", &OBJC_PROTOCOL___DMDRequestProvidingCommand);
    if ((v12 & 1) != 0)
    {
      v13 = objc_opt_new(NSMutableDictionary);
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "unknownPayloadKeys"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "allObjects"));

      if (objc_msgSend(v15, "count"))
      {
        v62 = DMFCommandStateReasonKey;
        v59[0] = DMFCommandStateReasonCodeKey;
        v59[1] = DMFCEMReasonCodeUnknownPayloadKeys;
        v60[0] = DMFCEMReasonCodeUnknownPayloadKeys;
        v60[1] = v15;
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v60, v59, 2));
        v61 = v16;
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v61, 1));
        v63 = v17;
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v63, &v62, 1));
        -[NSMutableDictionary addEntriesFromDictionary:](v13, "addEntriesFromDictionary:", v18);

        objc_msgSend(*(id *)(a1 + 32), "addStatusEntriesFromDictionary:", v13);
      }
      v50 = v13;
      v19 = v9;
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "payloadContext"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "organization"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "identifier"));
      objc_msgSend(v20, "setOrganizationIdentifier:", v22);

      objc_msgSend(v20, "setAssetProvidersByPayloadIdentifier:", 0);
      v53 = v10;
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "dmf_executeRequestWithContext:error:", v20, &v53));
      v24 = v53;

      if (!v24)
      {
        if (v23)
        {
          v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "taskOperationProvider"));
          v52 = 0;
          v36 = (objc_class *)objc_msgSend(v35, "operationClassForRequest:error:", v23, &v52);
          v24 = v52;

          if (!v36)
          {
            v47 = DMFConfigurationEngineLog(v37);
            v27 = objc_claimAutoreleasedReturnValue(v47);
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
              sub_100072B50();
            goto LABEL_8;
          }
          v25 = objc_msgSend([v36 alloc], "initWithRequest:", v23);
          v38 = (uint64_t)v25;
        }
        else
        {
          v51 = 0;
          v38 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "dmf_executeOperationWithContext:error:", v20, &v51));
          v25 = v51;
          v24 = v25;
        }
        if (v38)
        {
          v48 = v15;
          v39 = (void *)v38;
          v40 = DMFConfigurationEngineLog(v25);
          v41 = objc_claimAutoreleasedReturnValue(v40);
          if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
          {
            v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
            *(_DWORD *)buf = 138543362;
            v58 = v42;
            _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_INFO, "%{public}@: Execute command will start", buf, 0xCu);

          }
          if (objc_msgSend(v19, "dmf_requestExecutesWithoutReturning"))
          {
            v43 = *(void **)(a1 + 32);
            v55 = DMFCommandStateStatusKey;
            v56 = DMFCommandStatusExecuted;
            v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v56, &v55, 1));
            objc_msgSend(v43, "addStatusEntriesFromDictionary:", v44);

            objc_msgSend(v6, "setInstalled:", 1);
            objc_msgSend(*(id *)(a1 + 32), "endOperationWithPayloadMetadata:", v6);
          }
          v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "taskOperationProvider", v48, v50));
          v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "database"));
          objc_msgSend(v45, "prepareToRunOperation:withContext:withDatabase:", v39, 0, v46);

          objc_msgSend(v39, "addTarget:selector:forOperationEvents:userInfo:", *(_QWORD *)(a1 + 32), "operationDidFinish:userInfo:", 6, v19);
          objc_msgSend(*(id *)(a1 + 32), "enqueueOperation:", v39);

          v15 = v49;
          goto LABEL_9;
        }
      }
      v26 = DMFConfigurationEngineLog(v25);
      v27 = objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        sub_100072AC4();
LABEL_8:

      objc_msgSend(*(id *)(a1 + 32), "endOperationMarkingPayloadMetadata:failedWithError:", v6, v24);
LABEL_9:

      v10 = v24;
      goto LABEL_16;
    }
    v30 = DMFConfigurationEngineLog(v12);
    v31 = objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      sub_100072BE0();

    v32 = *(void **)(a1 + 32);
    v33 = DMFErrorWithCodeAndUserInfo(4, 0);
    v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
    objc_msgSend(v32, "endOperationMarkingPayloadMetadata:failedWithError:", v6, v34);

  }
  else
  {
    v28 = DMFConfigurationEngineLog(v11);
    v29 = objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      sub_100072A38();

    objc_msgSend(*(id *)(a1 + 32), "endOperationMarkingPayloadMetadata:failedWithError:", v6, v10);
  }
LABEL_16:

}

void sub_1000263EC(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint8_t buf[4];
  void *v26;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "payloadMetadataObjectID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectWithID:", v5));

  v7 = *(_QWORD *)(a1 + 40);
  v9 = DMFConfigurationEngineLog(v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  v11 = v10;
  if (v7)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_100072CBC();

    objc_msgSend(*(id *)(a1 + 32), "endOperationMarkingPayloadMetadata:failedWithError:", v6, *(_QWORD *)(a1 + 40));
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
      *(_DWORD *)buf = 138543362;
      v26 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: Executed command successfully", buf, 0xCu);

    }
    v13 = *(void **)(a1 + 32);
    v23 = DMFCommandStateStatusKey;
    v24 = DMFCommandStatusExecuted;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1));
    objc_msgSend(v13, "addStatusEntriesFromDictionary:", v14);

    if (objc_msgSend(*(id *)(a1 + 48), "conformsToProtocol:", &OBJC_PROTOCOL___DMDRequestProvidingCommand))
    {
      v15 = *(id *)(a1 + 48);
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 56), "resultObject"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "payloadContext"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "dmf_statusForResult:context:", v16, v17));

      if (v18)
      {
        v19 = *(void **)(a1 + 32);
        v21 = DMFDeclarationStatePayloadKey;
        v22 = v18;
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1));
        objc_msgSend(v19, "addStatusEntriesFromDictionary:", v20);

      }
    }
    objc_msgSend(v6, "setInstalled:", 1);
    objc_msgSend(*(id *)(a1 + 32), "endOperationWithPayloadMetadata:", v6);
  }

}

void sub_100026DC8(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "payloadMetadataObjectID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectWithID:", v5));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "payload"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "payloadDictionary"));
  v17 = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[CEMCommandBase commandForPayload:error:](CEMCommandBase, "commandForPayload:error:", v8, &v17));
  v10 = v17;

  v12 = DMFConfigurationEngineLog(v11);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
  if (v9)
  {
    if (v14)
      sub_100072E0C(v6, v13);
  }
  else if (v14)
  {
    sub_100072D4C(v6, v10, v13);
  }

  v15 = *(void **)(a1 + 32);
  v18 = DMFCommandStateStatusKey;
  v19 = DMFDeclarationStatusRemoved;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1));
  objc_msgSend(v15, "addStatusEntriesFromDictionary:", v16);

  objc_msgSend(*(id *)(a1 + 32), "endOperationWithPayloadMetadata:", v6);
}

void sub_100026FA8(id a1)
{
  void *v1;

  v1 = (void *)qword_1000EB7A8;
  qword_1000EB7A8 = (uint64_t)&off_1000C2A48;

}

void sub_100027034(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  NSMutableArray *v7;

  v7 = objc_opt_new(NSMutableArray);
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "supportedConfigurationTypes"));
  -[NSMutableArray addObjectsFromArray:](v7, "addObjectsFromArray:", v2);

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "supportedAssetTypes"));
  -[NSMutableArray addObjectsFromArray:](v7, "addObjectsFromArray:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "supportedActivationTypes"));
  -[NSMutableArray addObjectsFromArray:](v7, "addObjectsFromArray:", v4);

  v5 = objc_claimAutoreleasedReturnValue(-[NSMutableArray sortedArrayUsingSelector:](v7, "sortedArrayUsingSelector:", "caseInsensitiveCompare:"));
  v6 = (void *)qword_1000EB7B8;
  qword_1000EB7B8 = v5;

}

void sub_100027130(id a1)
{
  void *v1;

  v1 = (void *)qword_1000EB7C8;
  qword_1000EB7C8 = (uint64_t)&off_1000C2A60;

}

void sub_100027188(id a1)
{
  void *v1;

  v1 = (void *)qword_1000EB7D8;
  qword_1000EB7D8 = (uint64_t)&off_1000C2A78;

}

void sub_1000271E0(id a1)
{
  void *v1;

  v1 = (void *)qword_1000EB7E8;
  qword_1000EB7E8 = (uint64_t)&off_1000C2A90;

}

void sub_100027238(id a1)
{
  void *v1;

  v1 = (void *)qword_1000EB7F8;
  qword_1000EB7F8 = (uint64_t)&off_1000C2AA8;

}

void sub_100027290(id a1)
{
  void *v1;

  v1 = (void *)qword_1000EB808;
  qword_1000EB808 = (uint64_t)&off_1000C2AC0;

}

void sub_1000272E8(id a1)
{
  void *v1;

  v1 = (void *)qword_1000EB818;
  qword_1000EB818 = (uint64_t)&off_1000C2AD8;

}

void sub_100027340(id a1)
{
  id v1;
  NSBundle *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;

  v1 = objc_alloc((Class)NSManagedObjectModel);
  v2 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(DMFSetDeclarationsRequest));
  v6 = (id)objc_claimAutoreleasedReturnValue(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "URLForResource:withExtension:", CFSTR("DMDConfigurationDatabaseModel"), CFSTR("momd")));
  v4 = objc_msgSend(v1, "initWithContentsOfURL:", v3);
  v5 = (void *)qword_1000EB828;
  qword_1000EB828 = (uint64_t)v4;

}

void sub_1000274C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000274DC(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_1000274EC(uint64_t a1)
{

}

void sub_1000274F4(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(+[DMDConfigurationOrganization fetchRequest](DMDConfigurationOrganization, "fetchRequest"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "execute:", 0));
  v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "description"));
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void sub_100027818(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  v3 = objc_autoreleasePoolPush();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_autoreleasePoolPop(v3);

}

void sub_100027B5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  id *v22;
  id *v23;

  objc_destroyWeak(v23);
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100027B8C(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[5];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v18 = objc_msgSend(v9, "count");
    v11 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", v18);
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v12 = v9;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v21;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v21 != v15)
            objc_enumerationMutation(v12);
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v16), "eventStatusMessageWithPayloadIdentifier:", v7));
          objc_msgSend(v11, "addObject:", v17);

          v16 = (char *)v16 + 1;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v14);
    }

    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100027D54;
    v19[3] = &unk_1000BA778;
    v19[4] = v18;
    objc_msgSend(WeakRetained, "sendEvents:organizationIdentifier:completionHandler:", v11, v8, v19);

  }
}

void sub_100027D54(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;

  v4 = DMFConfigurationEngineLog(a1);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = v5;
  if (a2)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_100072EA0(a1, v6, v7);
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = 134217984;
    v10 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Successfully sent %lu events from subscription manager", (uint8_t *)&v9, 0xCu);
  }

}

void sub_100027E24(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "databaseInitializationOperationDidFinish");

}

void sub_100028060(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  uint8_t v5[16];

  v2 = objc_autoreleasePoolPush();
  v3 = DMFConfigurationEngineLog(v2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Engine did resume", v5, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "delegateDidResume");
  objc_msgSend(*(id *)(a1 + 32), "enqueueDeclarationProcessingOperationIfNeeded");
  objc_autoreleasePoolPop(v2);
}

id sub_1000281E8(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  uint8_t v6[16];

  v2 = DMFConfigurationEngineLog(a1);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Engine will suspend", v6, 2u);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "queue"));
  objc_msgSend(v4, "setSuspended:", 1);

  return objc_msgSend(*(id *)(a1 + 32), "delegateWillSuspend");
}

void sub_100028558(uint64_t a1)
{
  NSMutableArray *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v2 = objc_opt_new(NSMutableArray);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "organizationControllerByIdentifier"));
  objc_sync_enter(v3);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "organizationControllerByIdentifier", 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allValues"));

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v15;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v5);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v8), "organization"));
        -[NSMutableArray addObject:](v2, "addObject:", v9);

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  objc_sync_exit(v3);
  v10 = (void *)objc_opt_new(DMFFetchConfigurationOrganizationsResultObject);
  v11 = objc_alloc((Class)NSDictionary);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray valueForKey:](v2, "valueForKey:", CFSTR("identifier")));
  v13 = objc_msgSend(v11, "initWithObjects:forKeys:", v2, v12);
  objc_msgSend(v10, "setOrganizationsByIdentifier:", v13);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void sub_100028734(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10002885C(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSMutableArray *v5;
  void *v6;
  NSMutableArray *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  NSMutableArray *v11;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "eventSubscriptionManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "startDate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "organizationIdentifier"));
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "eventStatusesByPayloadIdentifierSinceStartDate:organizationIdentifier:", v3, v4));

  v5 = objc_opt_new(NSMutableArray);
  v6 = (void *)objc_opt_new(DMFFetchStreamEventsResultObject);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100028984;
  v9[3] = &unk_1000BA818;
  v10 = *(id *)(a1 + 40);
  v11 = v5;
  v7 = v5;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v9);
  objc_msgSend(v6, "setEventStatuses:", v7);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void sub_100028984(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  unsigned int v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v5 = a2;
  v6 = a3;
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "eventIdentifiers"));
  if (v7)
  {
    v8 = (void *)v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "eventIdentifiers"));
    v10 = objc_msgSend(v9, "containsObject:", v5);

    if (v10)
    {
      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      v18 = 0u;
      v11 = v6;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v18;
        do
        {
          v15 = 0;
          do
          {
            if (*(_QWORD *)v18 != v14)
              objc_enumerationMutation(v11);
            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v15), "eventStatusMessageWithPayloadIdentifier:", v5, (_QWORD)v17));
            objc_msgSend(*(id *)(a1 + 40), "addObject:", v16);

            v15 = (char *)v15 + 1;
          }
          while (v13 != v15);
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        }
        while (v13);
      }

    }
  }

}

void sub_100029168(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  _QWORD *v9;
  _QWORD v10[5];
  id v11;

  v2 = objc_autoreleasePoolPush();
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x3032000000;
  v10[3] = sub_10002929C;
  v10[4] = sub_1000292AC;
  v11 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "database"));
  v4 = objc_msgSend(v3, "newBackgroundContext");

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000292B4;
  v6[3] = &unk_1000BA868;
  v7 = *(id *)(a1 + 40);
  v9 = v10;
  v5 = v4;
  v8 = v5;
  objc_msgSend(v5, "performBlockAndWait:", v6);
  objc_msgSend(*(id *)(a1 + 32), "enqueueDeclarationProcessingOperationIfNeeded");
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  _Block_object_dispose(v10, 8);
  objc_autoreleasePoolPop(v2);
}

void sub_100029284(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10002929C(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_1000292AC(uint64_t a1)
{

}

void sub_1000292B4(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  unsigned __int8 v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  id v27;
  id obj;
  _BYTE v29[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[DMDConfigurationOrganization fetchRequestMatchingConfigurationOrganizationWithIdentifier:](DMDConfigurationOrganization, "fetchRequestMatchingConfigurationOrganizationWithIdentifier:", a1[4]));
  v3 = (uint64_t)(a1 + 6);
  v4 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v4 + 40);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "execute:", &obj));
  objc_storeStrong((id *)(v4 + 40), obj);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[DMDDeclarationPayloadMetadata fetchRequestForFailedDeclarationsFromOrganizationWithIdentifier:](DMDDeclarationPayloadMetadata, "fetchRequestForFailedDeclarationsFromOrganizationWithIdentifier:", a1[4]));
    v8 = (void *)a1[5];
    v9 = *(_QWORD *)(a1[6] + 8);
    v27 = *(id *)(v9 + 40);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "executeFetchRequest:error:", v7, &v27));
    objc_storeStrong((id *)(v9 + 40), v27);
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v11 = v10;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v24;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v24 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)v15), "setFailed:", 0);
          v15 = (char *)v15 + 1;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
      }
      while (v13);
    }

    v16 = (void *)a1[5];
    v17 = *(_QWORD *)(a1[6] + 8);
    v22 = *(id *)(v17 + 40);
    v18 = objc_msgSend(v16, "save:", &v22);
    objc_storeStrong((id *)(v17 + 40), v22);
    if ((v18 & 1) == 0)
    {
      v20 = DMFConfigurationEngineLog(v19);
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        sub_100072F0C(v3);

    }
  }

}

void sub_1000295D4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v5 = DMFConfigurationEngineLog(v3);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_100072F84(v4);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void sub_10002976C(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v5 = DMFConfigurationEngineLog(v3);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_100072F84(v4);

  }
  v7 = *(_QWORD *)(a1 + 40);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "resultObject"));
  (*(void (**)(uint64_t, void *, void *))(v7 + 16))(v7, v8, v4);

}

void sub_100029988(uint64_t a1, void *a2)
{
  id v3;
  DMDEventSubscriptionRegistration *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  unsigned __int8 v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  id v29;
  id v30;
  uint64_t v31;
  void *v32;

  v3 = a2;
  v4 = -[DMDEventSubscriptionRegistration initWithContext:]([DMDEventSubscriptionRegistration alloc], "initWithContext:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "subscriptionDeclaration"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "organizationIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "declarationIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "declarationServerHash"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[DMDDeclarationPayloadMetadata fetchRequestForActiveDeclarationFromOrganizationWithIdentifier:withIdentifier:serverHash:](DMDConfigurationPayloadMetadata, "fetchRequestForActiveDeclarationFromOrganizationWithIdentifier:withIdentifier:serverHash:", v6, v7, v8));

  v30 = 0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "executeFetchRequest:error:", v9, &v30));
  v11 = v30;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "firstObject"));
  -[DMDEventSubscriptionRegistration setPayloadMetadata:](v4, "setPayloadMetadata:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEventSubscriptionRegistration payloadMetadata](v4, "payloadMetadata"));
  if (v13)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "payloadEvents"));
    -[DMDEventSubscriptionRegistration setEvents:](v4, "setEvents:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "payloadSchedule"));
    -[DMDEventSubscriptionRegistration setSchedule:](v4, "setSchedule:", v16);

    v29 = v11;
    v17 = objc_msgSend(v3, "save:", &v29);
    v18 = v29;

    if ((v17 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "performSelectorOnMainThread:withObject:waitUntilDone:", "updateEventSubscriptions", 0, 1);
    }
    else
    {
      v27 = DMFConfigurationEngineLog(v19);
      v28 = objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        sub_100073074(a1 + 32);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    v11 = v18;
  }
  else
  {
    v20 = DMFConfigurationEngineLog(v14);
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      sub_100072FFC(a1 + 32);

    v22 = *(_QWORD *)(a1 + 48);
    v31 = DMFConfigurationPayloadIdentifierErrorKey;
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "declarationIdentifier"));
    v32 = v23;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1));
    v25 = DMFErrorWithCodeAndUserInfo(4004, v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    (*(void (**)(uint64_t, void *))(v22 + 16))(v22, v26);

  }
}

void sub_100029D2C(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  unsigned __int8 v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  NSObject *v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  id v29;
  _BYTE v30[128];

  v3 = a2;
  v4 = a1 + 32;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "organizationIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "subscriptionDeclaration"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "declarationIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[DMDEventSubscriptionRegistration fetchRequestMatchingRegistrationFromOrganizationWithIdentifier:payloadIdentifier:](DMDEventSubscriptionRegistration, "fetchRequestMatchingRegistrationFromOrganizationWithIdentifier:payloadIdentifier:", v5, v7));

  v29 = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "executeFetchRequest:error:", v8, &v29));
  v10 = v29;
  v11 = v10;
  if (v9)
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v12 = v9;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v26;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v26 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(v3, "deleteObject:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)v16));
          v16 = (char *)v16 + 1;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      }
      while (v14);
    }

    v24 = v11;
    v17 = objc_msgSend(v3, "save:", &v24);
    v18 = v24;

    if ((v17 & 1) == 0)
    {
      v20 = DMFConfigurationEngineLog(v19);
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        sub_100073164(v18);

    }
    objc_msgSend(*(id *)(a1 + 40), "performSelectorOnMainThread:withObject:waitUntilDone:", "updateEventSubscriptions", 0, 1);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    v11 = v18;
  }
  else
  {
    v22 = DMFConfigurationEngineLog(v10);
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      sub_1000730EC(v4);

  }
}

void sub_10002A128(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *i;
  void *v16;
  DMDSubscriptionEvent *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  unsigned int v22;
  id v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  _QWORD *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  id obj;
  void *v42;
  void *v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  id v49;
  _BYTE v50[128];
  uint64_t v51;
  uint64_t v52;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "database"));
  v3 = objc_msgSend(v2, "newBackgroundContext");

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[DMDConfigurationOrganization fetchRequestMatchingConfigurationOrganizationWithIdentifier:](DMDConfigurationOrganization, "fetchRequestMatchingConfigurationOrganizationWithIdentifier:", *(_QWORD *)(a1 + 40)));
  v49 = 0;
  v43 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "executeFetchRequest:error:", v4, &v49));
  v6 = v49;

  if (v5)
  {
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));
    if (v42)
    {
      v37 = (_QWORD *)(a1 + 40);
      v38 = a1;
      v39 = v5;
      v40 = v6;
      v47 = 0u;
      v48 = 0u;
      v45 = 0u;
      v46 = 0u;
      obj = *(id *)(a1 + 48);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v46;
        v11 = DMFDeclarationEventsMessageInReplyToKey;
        v12 = DMFDeclarationEventsMessageEventTypeKey;
        v13 = DMFDeclarationEventsMessageEventTimestampKey;
        v14 = DMFDeclarationEventsMessageEventPayloadKey;
        do
        {
          for (i = 0; i != v9; i = (char *)i + 1)
          {
            if (*(_QWORD *)v46 != v10)
              objc_enumerationMutation(obj);
            v16 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * (_QWORD)i);
            v17 = -[DMDSubscriptionEvent initWithContext:]([DMDSubscriptionEvent alloc], "initWithContext:", v43);
            -[DMDSubscriptionEvent setOrganization:](v17, "setOrganization:", v42);
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", v11));
            -[DMDSubscriptionEvent setPayloadIdentifier:](v17, "setPayloadIdentifier:", v18);

            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", v12));
            -[DMDSubscriptionEvent setEventType:](v17, "setEventType:", v19);

            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", v13));
            -[DMDSubscriptionEvent setDate:](v17, "setDate:", v20);

            v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", v14));
            -[DMDSubscriptionEvent setDetails:](v17, "setDetails:", v21);

          }
          v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
        }
        while (v9);
      }

      v44 = v40;
      v22 = objc_msgSend(v43, "save:", &v44);
      v23 = v44;

      if (v22)
      {
        v25 = objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
        -[NSObject postNotificationName:object:](v25, "postNotificationName:object:", CFSTR("DMDConfigurationSourceEventsDidChange"), *v37);
      }
      else
      {
        v36 = DMFConfigurationEngineLog(v24);
        v25 = objc_claimAutoreleasedReturnValue(v36);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          sub_1000732C0(v23);
      }
      v5 = v39;

      (*(void (**)(void))(*(_QWORD *)(v38 + 56) + 16))();
      v6 = v23;
    }
    else
    {
      v28 = DMFConfigurationEngineLog(0);
      v29 = objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        sub_100073254((uint64_t *)(a1 + 40), v29, v30);

      v31 = *(_QWORD *)(a1 + 56);
      v32 = *(_QWORD *)(a1 + 40);
      v51 = DMFConfigurationOrganizationIdentifierErrorKey;
      v52 = v32;
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v52, &v51, 1));
      v34 = DMFErrorWithCodeAndUserInfo(4002, v33);
      v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
      (*(void (**)(uint64_t, void *))(v31 + 16))(v31, v35);

    }
  }
  else
  {
    v26 = DMFConfigurationEngineLog(v7);
    v27 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      sub_1000731DC(v6);

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

void sub_10002AB38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10002AB60(uint64_t a1)
{
  id *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "error"));

  if (v3)
  {
    v5 = DMFConfigurationEngineLog(v4);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_1000733B0((uint64_t)v2);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*v2, "resultObject"));
  if (objc_msgSend(v7, "count"))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "enqueueOperations:", v7);

  }
}

void sub_10002B24C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_10002B610(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_10002B640(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  NSObject *v17;
  id v18;
  id v19;
  uint64_t v20;
  void *i;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  void *v28;
  uint64_t v29;
  id v30;
  id v31;
  uint64_t v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  id v41;
  id v42;
  uint8_t v43[4];
  uint64_t v44;
  _BYTE v45[128];
  const __CFString *v46;
  const __CFString *v47;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[DMDConfigurationOrganization fetchRequest](DMDConfigurationOrganization, "fetchRequest"));
  v47 = CFSTR("identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v47, 1));
  objc_msgSend(v2, "setPropertiesToFetch:", v3);

  objc_msgSend(v2, "setResultType:", 2);
  v42 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "execute:", &v42));
  v5 = v42;
  v6 = v5;
  if (!v4)
  {
    v7 = DMFConfigurationEngineLog(v5);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_100073680(v6);

  }
  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForKeyPath:", CFSTR("identifier")));
  v10 = (void *)v9;
  if (v9)
    v11 = (void *)v9;
  else
    v11 = &__NSArray0__struct;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[DMDConfigurationPayloadMetadata fetchRequest](DMDConfigurationPayloadMetadata, "fetchRequest"));
  v46 = CFSTR("organization");
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v46, 1));
  objc_msgSend(v12, "setRelationshipKeyPathsForPrefetching:", v13);

  v41 = v6;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "execute:", &v41));
  v15 = v41;

  if (v14)
  {
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v17 = v14;
    v18 = -[NSObject countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
    if (v18)
    {
      v19 = v18;
      v33 = v14;
      v34 = v15;
      v35 = v4;
      v36 = v2;
      v20 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v19; i = (char *)i + 1)
        {
          if (*(_QWORD *)v38 != v20)
            objc_enumerationMutation(v17);
          v22 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)i);
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "organization"));
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "identifier"));

          if (v24)
          {
            v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "objectForKeyedSubscript:", v24));

            if (v26)
            {
              v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "objectForKeyedSubscript:", v24));
              v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "identifier"));
              -[NSObject addObject:](v27, "addObject:", v28);

            }
            else
            {
              v30 = objc_alloc((Class)NSMutableArray);
              v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "identifier"));
              v31 = objc_msgSend(v30, "initWithObjects:", v27, 0);
              objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setObject:forKeyedSubscript:", v31, v24);

            }
          }
          else
          {
            v29 = DMFConfigurationEngineLog(v25);
            v27 = objc_claimAutoreleasedReturnValue(v29);
            if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
              sub_10007360C(v43, v22, &v44, v27);
          }

        }
        v19 = -[NSObject countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
      }
      while (v19);
      v4 = v35;
      v2 = v36;
      v15 = v34;
      v14 = v33;
    }
  }
  else
  {
    v32 = DMFConfigurationEngineLog(v16);
    v17 = objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_100073594(v15);
  }

}

void sub_10002BA04(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  uint64_t v4;
  NSObject *v5;

  v2 = a2;
  v3 = objc_msgSend(v2, "count");
  if (v3)
  {
    v4 = DMFConfigurationEngineLog(v3);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1000736F8(v2);

  }
}

void sub_10002BA5C(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  uint64_t v4;
  NSObject *v5;

  v2 = a2;
  v3 = objc_msgSend(v2, "count");
  if (v3)
  {
    v4 = DMFConfigurationEngineLog(v3);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_100073778(v2);

  }
}

void sub_10002BC58(id *a1)
{
  NSMutableDictionary *v2;
  NSMutableDictionary *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  uint64_t v10;
  void (**v11)(id, NSMutableDictionary *, uint64_t, _QWORD *);
  NSMutableDictionary *v12;
  _QWORD v13[5];
  NSMutableDictionary *v14;
  uint64_t *v15;
  _QWORD v16[4];
  id v17;
  NSMutableDictionary *v18;
  NSMutableDictionary *v19;
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = sub_10002929C;
  v26 = sub_1000292AC;
  v27 = 0;
  v2 = objc_opt_new(NSMutableDictionary);
  v3 = objc_opt_new(NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "organizationIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[5], "database"));
  v6 = objc_msgSend(v5, "newBackgroundContext");

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10002BE48;
  v16[3] = &unk_1000BA9E8;
  v7 = v4;
  v17 = v7;
  v21 = &v22;
  v20 = a1[6];
  v8 = v2;
  v18 = v8;
  v9 = v3;
  v19 = v9;
  objc_msgSend(v6, "performBlockAndWait:", v16);
  v10 = v23[5];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10002C298;
  v13[3] = &unk_1000BAA58;
  v11 = (void (**)(id, NSMutableDictionary *, uint64_t, _QWORD *))a1[6];
  v13[4] = a1[5];
  v12 = v9;
  v14 = v12;
  v15 = &v22;
  v11[2](v11, v8, v10, v13);

  _Block_object_dispose(&v22, 8);
}

void sub_10002BE24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10002BE48(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  NSMutableDictionary *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSMutableArray *v16;
  NSMutableArray *v17;
  void *v18;
  void *j;
  uint64_t v20;
  NSMutableArray *v21;
  void *v22;
  id v23;
  id v24;
  uint64_t v25;
  void *k;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  NSObject *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  NSMutableArray *v39;
  id v40;
  NSMutableDictionary *v41;
  NSMutableDictionary *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  id obj;
  _BYTE v56[128];
  _BYTE v57[128];
  _BYTE v58[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[DMDPayloadMetadata fetchRequestForPayloadMetadatasPendingStatusUpdateFromOrganizationWithIdentifier:](DMDPayloadMetadata, "fetchRequestForPayloadMetadatasPendingStatusUpdateFromOrganizationWithIdentifier:", *(_QWORD *)(a1 + 32)));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  obj = *(id *)(v3 + 40);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "execute:", &obj));
  objc_storeStrong((id *)(v3 + 40), obj);
  if (v4)
  {
    v35 = v2;
    v6 = objc_opt_new(NSMutableDictionary);
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v34 = v4;
    v7 = v4;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v51, v58, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v52;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v52 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * (_QWORD)i);
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "identifier"));
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", v13));
          v15 = v14;
          if (v14)
            v16 = v14;
          else
            v16 = objc_opt_new(NSMutableArray);
          v17 = v16;

          -[NSMutableArray addObject:](v17, "addObject:", v12);
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "identifier"));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v17, v18);

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v51, v58, 16);
      }
      while (v9);
    }

    v39 = objc_opt_new(NSMutableArray);
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:");
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v41 = v6;
    v40 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v41, "countByEnumeratingWithState:objects:count:", &v47, v57, 16);
    if (v40)
    {
      v37 = DMFDeclarationStatusMessageInReplyToKey;
      v38 = *(_QWORD *)v48;
      v36 = DMFDeclarationStatusMessageStatesKey;
      do
      {
        for (j = 0; j != v40; j = (char *)j + 1)
        {
          if (*(_QWORD *)v48 != v38)
            objc_enumerationMutation(v41);
          v20 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * (_QWORD)j);
          v42 = objc_opt_new(NSMutableDictionary);
          -[NSMutableDictionary setObject:forKeyedSubscript:](v42, "setObject:forKeyedSubscript:", v20, v37);
          v21 = objc_opt_new(NSMutableArray);
          v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v41, "objectForKeyedSubscript:", v20));
          v43 = 0u;
          v44 = 0u;
          v45 = 0u;
          v46 = 0u;
          v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v43, v56, 16);
          if (v23)
          {
            v24 = v23;
            v25 = *(_QWORD *)v44;
            do
            {
              for (k = 0; k != v24; k = (char *)k + 1)
              {
                if (*(_QWORD *)v44 != v25)
                  objc_enumerationMutation(v22);
                v27 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * (_QWORD)k);
                v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "stateDictionary"));
                -[NSMutableArray addObject:](v21, "addObject:", v28);

                v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "stateChangeTimestamp"));
                v30 = *(void **)(a1 + 48);
                v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectID"));
                objc_msgSend(v30, "setObject:forKeyedSubscript:", v29, v31);

              }
              v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v43, v56, 16);
            }
            while (v24);
          }
          -[NSMutableDictionary setObject:forKeyedSubscript:](v42, "setObject:forKeyedSubscript:", v21, v36);
          -[NSMutableArray addObject:](v39, "addObject:", v42);

        }
        v40 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v41, "countByEnumeratingWithState:objects:count:", &v47, v57, 16);
      }
      while (v40);
    }

    v4 = v34;
    v2 = v35;
  }
  else
  {
    v32 = DMFConfigurationEngineLog(v5);
    v33 = objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      sub_1000737F8(a1 + 64);

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

void sub_10002C298(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  uint64_t v13;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v5 = DMFConfigurationEngineLog(v3);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_100073870();

  }
  else
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10002C388;
    v11[3] = &unk_1000BAA10;
    v7 = *(void **)(a1 + 40);
    v11[4] = *(_QWORD *)(a1 + 32);
    v8 = v7;
    v9 = *(_QWORD *)(a1 + 48);
    v12 = v8;
    v13 = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[DMDBlockOperation blockOperationWithBlock:](DMDBlockOperation, "blockOperationWithBlock:", v11));
    objc_msgSend(v10, "setQueuePriority:", 8);
    objc_msgSend(*(id *)(a1 + 32), "enqueueDatabaseModificationOperation:completionHandler:", v10, &stru_1000BAA30);

  }
}

void sub_10002C388(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint64_t v10;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "database"));
  v3 = objc_msgSend(v2, "newBackgroundContext");

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002C434;
  v7[3] = &unk_1000BA868;
  v4 = *(id *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v9 = v3;
  v10 = v5;
  v8 = v4;
  v6 = v3;
  objc_msgSend(v6, "performBlockAndWait:", v7);

}

void sub_10002C434(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  unsigned __int8 v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  id obj;
  _BYTE v32[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[DMDPayloadMetadata fetchRequest](DMDPayloadMetadata, "fetchRequest"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "allKeys"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("self IN %@"), v3));
  objc_msgSend(v2, "setPredicate:", v4);

  v5 = a1 + 48;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v6 + 40);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "execute:", &obj));
  objc_storeStrong((id *)(v6 + 40), obj);
  if (!v7)
  {
    v24 = DMFConfigurationEngineLog(v8);
    v23 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      sub_1000738D4(v5);
    goto LABEL_14;
  }
  v25 = a1 + 48;
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v28 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
        v15 = *(void **)(a1 + 32);
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectID"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", v16));
        objc_msgSend(v14, "setLastStatusReportTimestamp:", v17);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v11);
  }

  v18 = *(void **)(a1 + 40);
  v19 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v26 = *(id *)(v19 + 40);
  v20 = objc_msgSend(v18, "save:", &v26);
  objc_storeStrong((id *)(v19 + 40), v26);
  if ((v20 & 1) == 0)
  {
    v22 = DMFConfigurationEngineLog(v21);
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      sub_10007394C(v25);
LABEL_14:

  }
}

void sub_10002C684(id a1, NSError *a2)
{
  NSError *v2;
  NSError *v3;
  uint64_t v4;
  NSObject *v5;

  v2 = a2;
  v3 = v2;
  if (v2)
  {
    v4 = DMFConfigurationEngineLog(v2);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1000739C4(v3);

  }
}

void sub_10002C6D8(id a1, NSError *a2)
{
  NSError *v2;
  NSError *v3;
  uint64_t v4;
  NSObject *v5;

  v2 = a2;
  v3 = v2;
  if (v2)
  {
    v4 = DMFConfigurationEngineLog(v2);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_100073A3C(v3);

  }
}

void sub_10002C840(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  NSMutableArray *v11;
  NSMutableArray *v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *, _QWORD, _QWORD *);
  NSMutableArray *v24;
  void *v25;
  void *v26;
  _QWORD v27[5];
  NSMutableArray *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  id v33;
  uint64_t v34;
  NSMutableArray *v35;
  _BYTE v36[128];

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "organizationIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[DMDSubscriptionEvent fetchRequestMatchingEventsFromOrganizationWithIdentifier:](DMDSubscriptionEvent, "fetchRequestMatchingEventsFromOrganizationWithIdentifier:", v4));

  v33 = 0;
  v26 = v3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "executeFetchRequest:error:", v5, &v33));
  v7 = v33;
  v8 = v7;
  if (!v6)
  {
    v9 = DMFConfigurationEngineLog(v7);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_100073AB4(a1 + 32, v8, v10);

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  v25 = v8;
  v11 = objc_opt_new(NSMutableArray);
  v12 = objc_opt_new(NSMutableArray);
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v13 = v6;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v36, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(_QWORD *)v30 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i);
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "dictionaryRepresentation", v25));
        if (v19)
          -[NSMutableArray addObject:](v11, "addObject:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectID"));
        if (v20)
          -[NSMutableArray addObject:](v12, "addObject:", v20);

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v36, 16);
    }
    while (v15);
  }

  v34 = DMFDeclarationStatusMessagesKey;
  v35 = v11;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1));
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_10002CB00;
  v27[3] = &unk_1000B9B40;
  v22 = *(_QWORD *)(a1 + 48);
  v27[4] = *(_QWORD *)(a1 + 40);
  v28 = v12;
  v23 = *(void (**)(uint64_t, void *, _QWORD, _QWORD *))(v22 + 16);
  v24 = v12;
  v23(v22, v21, 0, v27);

}

void sub_10002CB00(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  _QWORD v8[4];
  NSObject *v9;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v5 = DMFConfigurationEngineLog(v3);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_100073B74();
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "database"));
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10002CBC4;
    v8[3] = &unk_1000BA528;
    v9 = *(id *)(a1 + 40);
    objc_msgSend(v7, "performBackgroundTask:", v8);

    v6 = v9;
  }

}

void sub_10002CBC4(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  id v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v3 = a2;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectWithID:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v8)));
        objc_msgSend(v3, "deleteObject:", v9);

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }

  v15 = 0;
  v10 = objc_msgSend(v3, "save:", &v15);
  v11 = v15;
  v12 = v11;
  if ((v10 & 1) == 0)
  {
    v13 = DMFConfigurationEngineLog(v11);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_100073BD8();

  }
}

void sub_10002CDFC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10002D1A4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10002D40C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

uint64_t sub_10002D418(uint64_t a1)
{
  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)a1 + 8) + 40);
}

uint64_t sub_10002D42C(uint64_t a1)
{
  return *(_QWORD *)a1;
}

void sub_10002D488(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSMutableDictionary *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  void *v32;
  objc_class *v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  NSObject *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  NSObject *v45;
  uint64_t v46;
  NSObject *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  NSObject *v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  id v58;
  id v59;
  id v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  uint8_t buf[4];
  void *v66;
  _QWORD v67[2];
  _QWORD v68[2];
  void *v69;
  uint64_t v70;
  void *v71;
  _BYTE v72[128];

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "payloadMetadataObjectID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectWithID:", v4));

  v6 = objc_opt_new(NSMutableDictionary);
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "outgoingPayloadMetadataReferences"));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v61, v72, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v62;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v62 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * (_QWORD)i);
        v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "installMetadata"));
        if (!v13)
        {
          v42 = *(void **)(a1 + 32);
          v43 = DMFErrorWithCodeAndUserInfo(0, 0);
          v18 = (id)objc_claimAutoreleasedReturnValue(v43);
          objc_msgSend(v42, "endOperationWithError:", v18);
          goto LABEL_19;
        }
        v14 = (void *)v13;
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "identifier"));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v14, v15);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v61, v72, 16);
      if (v9)
        continue;
      break;
    }
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "payload"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "payloadDictionary"));
  v60 = 0;
  v18 = (id)objc_claimAutoreleasedReturnValue(+[CEMConfigurationBase declarationForPayload:error:](CEMConfigurationBase, "declarationForPayload:error:", v17, &v60));
  v7 = v60;

  if (v18)
  {
    v20 = objc_msgSend(v18, "conformsToProtocol:", &OBJC_PROTOCOL___DMDRequestProvidingConfiguration);
    if ((v20 & 1) != 0)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "unknownPayloadKeys"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "allObjects"));

      if (objc_msgSend(v22, "count"))
      {
        v56 = *(void **)(a1 + 32);
        v70 = DMFDeclarationStateReasonKey;
        v67[0] = DMFDeclarationStateReasonKey;
        v67[1] = DMFCEMReasonCodeUnknownPayloadKeys;
        v68[0] = DMFCEMReasonCodeUnknownPayloadKeys;
        v68[1] = v22;
        v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v68, v67, 2));
        v69 = v23;
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v69, 1));
        v71 = v24;
        v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v71, &v70, 1));
        objc_msgSend(v56, "addStatusEntriesFromDictionary:", v25);

      }
      v57 = v22;
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "payloadContext"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "organization"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "identifier"));
      objc_msgSend(v26, "setOrganizationIdentifier:", v28);

      objc_msgSend(v26, "setAssetProvidersByPayloadIdentifier:", v6);
      v18 = v18;
      v59 = v7;
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "dmf_installRequestWithContext:error:", v26, &v59));
      v30 = v59;

      if (v29)
      {
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "taskOperationProvider"));
        v58 = v30;
        v33 = (objc_class *)objc_msgSend(v32, "operationClassForRequest:error:", v29, &v58);
        v55 = v58;

        v35 = DMFConfigurationEngineLog(v34);
        v36 = objc_claimAutoreleasedReturnValue(v35);
        v37 = v36;
        if (v33)
        {
          if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
          {
            v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
            *(_DWORD *)buf = 138543362;
            v66 = v38;
            _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_INFO, "%{public}@: Configuration will install", buf, 0xCu);

          }
          v39 = objc_msgSend([v33 alloc], "initWithRequest:", v29);
          v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "taskOperationProvider"));
          v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "database"));
          objc_msgSend(v40, "prepareToRunOperation:withContext:withDatabase:", v39, 0, v41);

          objc_msgSend(v39, "addTarget:selector:forOperationEvents:userInfo:", *(_QWORD *)(a1 + 32), "installationOperationDidFinish:userInfo:", 6, v18);
          objc_msgSend(*(id *)(a1 + 32), "enqueueOperation:", v39);

          v30 = v55;
          goto LABEL_33;
        }
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
          sub_100073D5C();

        v53 = *(void **)(a1 + 32);
        v54 = v5;
        v30 = v55;
      }
      else
      {
        v51 = DMFConfigurationEngineLog(v31);
        v52 = objc_claimAutoreleasedReturnValue(v51);
        if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
          sub_100073CCC();

        v53 = *(void **)(a1 + 32);
        v54 = v5;
      }
      objc_msgSend(v53, "endOperationMarkingPayloadMetadata:failedWithError:", v54, v30);
LABEL_33:

      v7 = v30;
      goto LABEL_19;
    }
    v46 = DMFConfigurationEngineLog(v20);
    v47 = objc_claimAutoreleasedReturnValue(v46);
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      sub_100073DE8();

    v48 = *(void **)(a1 + 32);
    v49 = DMFErrorWithCodeAndUserInfo(4, 0);
    v50 = (void *)objc_claimAutoreleasedReturnValue(v49);
    objc_msgSend(v48, "endOperationMarkingPayloadMetadata:failedWithError:", v5, v50);

  }
  else
  {
    v44 = DMFConfigurationEngineLog(v19);
    v45 = objc_claimAutoreleasedReturnValue(v44);
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      sub_100073C3C();

    objc_msgSend(*(id *)(a1 + 32), "endOperationMarkingPayloadMetadata:failedWithError:", v5, v7);
  }
LABEL_19:

}

void sub_10002DB18(id *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  id *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;

  v3 = a1[4];
  v4 = a2;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "payloadMetadataObjectID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectWithID:", v5));

  v8 = a1 + 5;
  v7 = a1[5];
  if (!v7)
  {
LABEL_7:
    v16 = DMFConfigurationEngineLog(v7);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
      *(_DWORD *)buf = 138543362;
      v34 = v18;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: Configuration did install successfully ", buf, 0xCu);

    }
    v19 = a1[4];
    v31 = DMFDeclarationStateStatusKey;
    v32 = DMFDeclarationStatusInstalled;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1));
    objc_msgSend(v19, "addStatusEntriesFromDictionary:", v20);

    if (objc_msgSend(a1[6], "conformsToProtocol:", &OBJC_PROTOCOL___DMDRequestProvidingConfiguration))
    {
      v21 = a1[6];
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[7], "resultObject"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "payloadContext"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "dmf_statusForResult:context:", v22, v23));

      if (v24)
      {
        v25 = a1[4];
        v29 = DMFDeclarationStatePayloadKey;
        v30 = v24;
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1));
        objc_msgSend(v25, "addStatusEntriesFromDictionary:", v26);

      }
    }
    objc_msgSend(v6, "setInstalled:", 1);
    objc_msgSend(a1[4], "endOperationWithPayloadMetadata:", v6);
    goto LABEL_18;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "domain"));
  if (objc_msgSend(v9, "isEqualToString:", DMFErrorDomain))
  {
    v10 = objc_msgSend(*v8, "code");

    if (v10 == (id)1900)
    {
      v12 = DMFConfigurationEngineLog(v11);
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*v8, "verboseDescription"));
        *(_DWORD *)buf = 138543618;
        v34 = v14;
        v35 = 2114;
        v36 = v15;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: Ignoring expected removal error: %{public}@", buf, 0x16u);

      }
      goto LABEL_7;
    }
  }
  else
  {

  }
  v27 = DMFConfigurationEngineLog(v11);
  v28 = objc_claimAutoreleasedReturnValue(v27);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    sub_100073EC0();

  objc_msgSend(a1[4], "endOperationMarkingPayloadMetadata:failedWithError:", v6, a1[5]);
LABEL_18:

}

uint64_t sub_10002DE44(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return objc_opt_class(v2, a2);
}

void sub_10002F50C(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  NSObject *v32;
  uint64_t v33;
  NSObject *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  objc_class *v43;
  uint64_t v44;
  uint64_t v45;
  NSObject *v46;
  NSObject *v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  uint64_t v52;
  NSObject *v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  id v58;
  id v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint8_t buf[4];
  void *v66;
  _QWORD v67[2];
  _QWORD v68[2];
  void *v69;
  uint64_t v70;
  void *v71;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "payloadMetadataObjectID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectWithID:", v5));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "payload"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "payloadDictionary"));
  v60 = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[CEMConfigurationBase declarationForPayload:error:](CEMConfigurationBase, "declarationForPayload:error:", v8, &v60));
  v10 = v60;

  if (v9)
  {
    v12 = objc_msgSend(v9, "conformsToProtocol:", &OBJC_PROTOCOL___DMDRequestProvidingConfiguration);
    if ((v12 & 1) == 0)
    {
      v33 = DMFConfigurationEngineLog(v12);
      v34 = objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        sub_100073DE8();

      v35 = *(void **)(a1 + 32);
      v36 = DMFErrorWithCodeAndUserInfo(4, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue(v36);
      objc_msgSend(v35, "endOperationMarkingPayloadMetadata:failedWithError:", v6, v14);
      goto LABEL_30;
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "unknownPayloadKeys"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "allObjects"));

    if (objc_msgSend(v14, "count"))
    {
      v15 = *(void **)(a1 + 32);
      v70 = DMFDeclarationStateReasonKey;
      v67[0] = DMFCommandStateReasonCodeKey;
      v67[1] = DMFCEMReasonCodeUnknownPayloadKeys;
      v68[0] = DMFCEMReasonCodeUnknownPayloadKeys;
      v68[1] = v14;
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v68, v67, 2));
      v69 = v16;
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v69, 1));
      v71 = v17;
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v71, &v70, 1));
      objc_msgSend(v15, "addStatusEntriesFromDictionary:", v18);

    }
    v19 = objc_msgSend(v6, "installed");
    if ((v19 & 1) == 0)
    {
      v37 = DMFConfigurationEngineLog(v19);
      v38 = objc_claimAutoreleasedReturnValue(v37);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
        *(_DWORD *)buf = 138543362;
        v66 = v39;
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "%{public}@: Uninstalled configuration did remove successfully", buf, 0xCu);

      }
      v40 = *(void **)(a1 + 32);
      v63 = DMFDeclarationStateStatusKey;
      v64 = DMFDeclarationStatusRemoved;
      v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v64, &v63, 1));
      objc_msgSend(v40, "addStatusEntriesFromDictionary:", v41);

      objc_msgSend(*(id *)(a1 + 32), "endOperationWithPayloadMetadata:", v6);
      goto LABEL_30;
    }
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "payloadContext"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "organization"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "identifier"));
    objc_msgSend(v20, "setOrganizationIdentifier:", v22);

    objc_msgSend(v20, "setAssetProvidersByPayloadIdentifier:", 0);
    v23 = v9;
    v59 = v10;
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "dmf_removeRequestWithContext:error:", v20, &v59));
    v25 = v59;

    if (v24 || !v25)
    {
      if (!v24)
      {
        v52 = DMFConfigurationEngineLog(v26);
        v53 = objc_claimAutoreleasedReturnValue(v52);
        if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
        {
          v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
          *(_DWORD *)buf = 138543362;
          v66 = v57;
          _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "%{public}@: Installed configuration did remove successfully", buf, 0xCu);

        }
        v54 = *(void **)(a1 + 32);
        v61 = DMFDeclarationStateStatusKey;
        v62 = DMFDeclarationStatusRemoved;
        v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v62, &v61, 1));
        objc_msgSend(v54, "addStatusEntriesFromDictionary:", v55);

        objc_msgSend(v6, "setInstalled:", 0);
        objc_msgSend(*(id *)(a1 + 32), "endOperationWithPayloadMetadata:", v6);
        goto LABEL_29;
      }
      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "taskOperationProvider"));
      v58 = v25;
      v43 = (objc_class *)objc_msgSend(v42, "operationClassForRequest:error:", v24, &v58);
      v56 = v58;

      v45 = DMFConfigurationEngineLog(v44);
      v46 = objc_claimAutoreleasedReturnValue(v45);
      v47 = v46;
      if (v43)
      {
        if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
        {
          v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
          *(_DWORD *)buf = 138543362;
          v66 = v48;
          _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_INFO, "%{public}@: Installed configuration will remove", buf, 0xCu);

        }
        v49 = objc_msgSend([v43 alloc], "initWithRequest:", v24);
        v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "taskOperationProvider"));
        v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "database"));
        objc_msgSend(v50, "prepareToRunOperation:withContext:withDatabase:", v49, 0, v51);

        objc_msgSend(v49, "addTarget:selector:forOperationEvents:userInfo:", *(_QWORD *)(a1 + 32), "removalOperationDidFinish:userInfo:", 6, v23);
        objc_msgSend(*(id *)(a1 + 32), "enqueueOperation:", v49);

        v25 = v56;
        goto LABEL_29;
      }
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        sub_100074104();

      v29 = *(void **)(a1 + 32);
      v30 = v6;
      v25 = v56;
    }
    else
    {
      v27 = DMFConfigurationEngineLog(v26);
      v28 = objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        sub_100074074();

      v29 = *(void **)(a1 + 32);
      v30 = v6;
    }
    objc_msgSend(v29, "endOperationMarkingPayloadMetadata:failedWithError:", v30, v25, v56);
LABEL_29:

    v10 = v25;
LABEL_30:

    goto LABEL_31;
  }
  v31 = DMFConfigurationEngineLog(v11);
  v32 = objc_claimAutoreleasedReturnValue(v31);
  if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    sub_100073FE4();

  objc_msgSend(*(id *)(a1 + 32), "endOperationMarkingPayloadMetadata:failedWithError:", v6, v10);
LABEL_31:

}

void sub_10002FC48(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint8_t buf[4];
  void *v26;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "payloadMetadataObjectID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectWithID:", v5));

  v7 = *(_QWORD *)(a1 + 40);
  v9 = DMFConfigurationEngineLog(v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  v11 = v10;
  if (v7)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_100074190();

    objc_msgSend(*(id *)(a1 + 32), "endOperationMarkingPayloadMetadata:failedWithError:", v6, *(_QWORD *)(a1 + 40));
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
      *(_DWORD *)buf = 138543362;
      v26 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: Configuration did remove successfully", buf, 0xCu);

    }
    v13 = *(void **)(a1 + 32);
    v23 = DMFDeclarationStateStatusKey;
    v24 = DMFDeclarationStatusRemoved;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1));
    objc_msgSend(v13, "addStatusEntriesFromDictionary:", v14);

    if (objc_msgSend(*(id *)(a1 + 48), "conformsToProtocol:", &OBJC_PROTOCOL___DMDRequestProvidingConfiguration))
    {
      v15 = *(id *)(a1 + 48);
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 56), "resultObject"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "payloadContext"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "dmf_statusForResult:context:", v16, v17));

      if (v18)
      {
        v19 = *(void **)(a1 + 32);
        v21 = DMFDeclarationStatePayloadKey;
        v22 = v18;
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1));
        objc_msgSend(v19, "addStatusEntriesFromDictionary:", v20);

      }
    }
    objc_msgSend(v6, "setInstalled:", 0);
    objc_msgSend(*(id *)(a1 + 32), "endOperationWithPayloadMetadata:", v6);
  }

}

void sub_10002FFEC(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  uint64_t v25;
  void *v26;
  objc_class *v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  NSObject *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  uint64_t v36;
  NSObject *v37;
  uint64_t v38;
  NSObject *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  NSObject *v44;
  void *v45;
  void *v46;
  id v47;
  id v48;
  id v49;
  id v50;
  uint8_t buf[4];
  void *v52;
  _QWORD v53[2];
  _QWORD v54[2];
  void *v55;
  uint64_t v56;
  void *v57;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "payloadMetadataObjectID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectWithID:", v5));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "payload"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "payloadDictionary"));
  v50 = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[CEMConfigurationBase declarationForPayload:error:](CEMConfigurationBase, "declarationForPayload:error:", v8, &v50));
  v10 = v50;

  if (v9)
  {
    v12 = objc_msgSend(v9, "conformsToProtocol:", &OBJC_PROTOCOL___DMDRequestProvidingConfiguration);
    if ((v12 & 1) != 0)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "unknownPayloadKeys"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "allObjects"));

      if (objc_msgSend(v14, "count"))
      {
        v15 = *(void **)(a1 + 32);
        v56 = DMFDeclarationStateReasonKey;
        v53[0] = DMFCommandStateReasonCodeKey;
        v53[1] = DMFCEMReasonCodeUnknownPayloadKeys;
        v54[0] = DMFCEMReasonCodeUnknownPayloadKeys;
        v54[1] = v14;
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v54, v53, 2));
        v55 = v16;
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v55, 1));
        v57 = v17;
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v57, &v56, 1));
        objc_msgSend(v15, "addStatusEntriesFromDictionary:", v18);

      }
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "payloadContext"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "organization"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "identifier"));
      objc_msgSend(v19, "setOrganizationIdentifier:", v21);

      objc_msgSend(v19, "setAssetProvidersByPayloadIdentifier:", 0);
      v22 = v9;
      v49 = v10;
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "dmf_replaceRequestWithContext:error:", v19, &v49));
      v24 = v49;

      if (v23)
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "taskOperationProvider"));
        v48 = v24;
        v27 = (objc_class *)objc_msgSend(v26, "operationClassForRequest:error:", v23, &v48);
        v47 = v48;

        v29 = DMFConfigurationEngineLog(v28);
        v30 = objc_claimAutoreleasedReturnValue(v29);
        v31 = v30;
        if (v27)
        {
          if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
          {
            v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
            *(_DWORD *)buf = 138543362;
            v52 = v32;
            _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "%{public}@: Configuration will replace", buf, 0xCu);

          }
          v33 = objc_msgSend([v27 alloc], "initWithRequest:", v23);
          v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "taskOperationProvider"));
          v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "database"));
          objc_msgSend(v34, "prepareToRunOperation:withContext:withDatabase:", v33, 0, v35);

          objc_msgSend(v33, "addTarget:selector:forOperationEvents:userInfo:", *(_QWORD *)(a1 + 32), "installationOperationDidFinish:userInfo:", 6, v22);
          objc_msgSend(*(id *)(a1 + 32), "enqueueOperation:", v33);

          v24 = v47;
          goto LABEL_23;
        }
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          sub_100074340();

        v45 = *(void **)(a1 + 32);
        v46 = v6;
        v24 = v47;
      }
      else
      {
        v43 = DMFConfigurationEngineLog(v25);
        v44 = objc_claimAutoreleasedReturnValue(v43);
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
          sub_1000742B0();

        v45 = *(void **)(a1 + 32);
        v46 = v6;
      }
      objc_msgSend(v45, "endOperationMarkingPayloadMetadata:failedWithError:", v46, v24, v47);
LABEL_23:

      v10 = v24;
      goto LABEL_24;
    }
    v38 = DMFConfigurationEngineLog(v12);
    v39 = objc_claimAutoreleasedReturnValue(v38);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      sub_100073DE8();

    v40 = *(void **)(a1 + 32);
    v41 = DMFErrorWithCodeAndUserInfo(4, 0);
    v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
    objc_msgSend(v40, "endOperationMarkingPayloadMetadata:failedWithError:", v6, v42);

  }
  else
  {
    v36 = DMFConfigurationEngineLog(v11);
    v37 = objc_claimAutoreleasedReturnValue(v36);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      sub_100074220();

    objc_msgSend(*(id *)(a1 + 32), "endOperationMarkingPayloadMetadata:failedWithError:", v6, v10);
  }
LABEL_24:

}

void sub_100030580(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint8_t buf[4];
  void *v26;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "payloadMetadataObjectID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectWithID:", v5));

  v7 = *(_QWORD *)(a1 + 40);
  v9 = DMFConfigurationEngineLog(v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  v11 = v10;
  if (v7)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_1000743CC();

    objc_msgSend(*(id *)(a1 + 32), "endOperationMarkingPayloadMetadata:failedWithError:", v6, *(_QWORD *)(a1 + 40));
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
      *(_DWORD *)buf = 138543362;
      v26 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: Configuration did replace successfully", buf, 0xCu);

    }
    v13 = *(void **)(a1 + 32);
    v23 = DMFDeclarationStateStatusKey;
    v24 = DMFDeclarationStatusInstalled;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1));
    objc_msgSend(v13, "addStatusEntriesFromDictionary:", v14);

    if (objc_msgSend(*(id *)(a1 + 48), "conformsToProtocol:", &OBJC_PROTOCOL___DMDRequestProvidingConfiguration))
    {
      v15 = *(id *)(a1 + 48);
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 56), "resultObject"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "payloadContext"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "dmf_statusForResult:context:", v16, v17));

      if (v18)
      {
        v19 = *(void **)(a1 + 32);
        v21 = DMFDeclarationStatePayloadKey;
        v22 = v18;
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1));
        objc_msgSend(v19, "addStatusEntriesFromDictionary:", v20);

      }
    }
    objc_msgSend(v6, "setInstalled:", 1);
    objc_msgSend(*(id *)(a1 + 32), "endOperationWithPayloadMetadata:", v6);
  }

}

void sub_100030948(id a1)
{
  DMDSecureUnarchiveFromConfigurationSourceDataTransformer *v1;

  v1 = objc_opt_new(DMDSecureUnarchiveFromConfigurationSourceDataTransformer);
  +[DMDSecureUnarchiveFromConfigurationSourceDataTransformer setValueTransformer:forName:](DMDSecureUnarchiveFromConfigurationSourceDataTransformer, "setValueTransformer:forName:", v1, CFSTR("DMDSecureUnarchiveFromConfigurationSourceDataTransformer"));

}

void sub_1000309D4(id a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v3[2];

  v3[0] = objc_opt_class(NSXPCListenerEndpoint);
  v3[1] = objc_opt_class(DMFReportingRequirements);
  v1 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v3, 2));
  v2 = (void *)qword_1000EB840;
  qword_1000EB840 = v1;

}

void sub_100030AE4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  id v16;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    v8 = DMFConfigurationEngineLog(v6);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_10007445C(a1, v7);

    objc_msgSend(*(id *)(a1 + 40), "assetResolutionFailedWithError:", v7);
    objc_msgSend(*(id *)(a1 + 32), "endOperationWithResultObject:", 0);
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "assetReference"));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100030BEC;
    v13[3] = &unk_1000BAAE8;
    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(void **)(a1 + 40);
    v14 = 0;
    v15 = v11;
    v16 = v12;
    objc_msgSend(v5, "configurationEngineRequestedAsset:completion:", v10, v13);

  }
}

void sub_100030BEC(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = DMFConfigurationEngineLog(v6);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  v10 = v9;
  if (v7)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_10007450C(a1, v6);

    objc_msgSend(*(id *)(a1 + 48), "assetResolutionFailedWithError:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "controller"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "assetIdentifier"));
      v13 = 138543618;
      v14 = v11;
      v15 = 2114;
      v16 = v12;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%{public}@ successfully resolved asset %{public}@", (uint8_t *)&v13, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 48), "assetResolutionDidSucceedWithAssetURL:", v5);
  }
  objc_msgSend(*(id *)(a1 + 40), "endOperationWithResultObject:", 0);

}

void sub_100030D98(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

void sub_1000318AC(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_10003199C(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  void *v21;
  id v22;
  id v23;
  uint8_t buf[4];
  void *v25;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8)
  {
    v11 = DMFConfigurationEngineLog(v9);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_100074750(a1, v8);
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", DMFDeclarationEventsMessagesKey));
    v14 = objc_msgSend(v13, "count");

    if (v14)
    {
      v16 = *(void **)(a1 + 32);
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_100031B64;
      v19[3] = &unk_1000BAB60;
      v20 = 0;
      v21 = v16;
      v22 = v7;
      v23 = v10;
      objc_msgSend(v16, "fetchRemoteProxy:", v19);

      goto LABEL_7;
    }
    v17 = DMFConfigurationEngineLog(v15);
    v12 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "controller"));
      *(_DWORD *)buf = 138543362;
      v25 = v18;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%{public}@ skipping events because there are no updates to report", buf, 0xCu);

    }
  }

  objc_msgSend(*(id *)(a1 + 32), "endOperationWithResultObject:", 0);
LABEL_7:

}

void sub_100031B64(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  _QWORD v10[5];
  id v11;

  v5 = a3;
  v6 = v5;
  if (*(_QWORD *)(a1 + 32))
  {
    v7 = DMFConfigurationEngineLog(v5);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_1000747E8(a1, v6);

    objc_msgSend(*(id *)(a1 + 40), "endOperationWithResultObject:", 0);
  }
  else
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100031C40;
    v10[3] = &unk_1000BAB38;
    v9 = *(_QWORD *)(a1 + 48);
    v10[4] = *(_QWORD *)(a1 + 40);
    v11 = *(id *)(a1 + 56);
    objc_msgSend(a2, "configurationEventsDidChange:completion:", v9, v10);

  }
}

void sub_100031C40(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;

  v3 = a2;
  v4 = DMFConfigurationEngineLog(v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_100074880(a1, v3);
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "controller"));
    v9 = 138543362;
    v10 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%{public}@ successfully sent events", (uint8_t *)&v9, 0xCu);

  }
  v8 = *(_QWORD *)(a1 + 40);
  if (v8)
    (*(void (**)(uint64_t, id))(v8 + 16))(v8, v3);
  objc_msgSend(*(id *)(a1 + 32), "endOperationWithResultObject:", 0);

}

void sub_10003213C(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  id v21;
  uint8_t buf[4];
  void *v23;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8)
  {
    v11 = DMFConfigurationEngineLog(v9);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_100074918(a1, v8);
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", DMFDeclarationStatusMessagesKey));
    v14 = objc_msgSend(v13, "count");

    if (v14)
    {
      v16 = *(void **)(a1 + 32);
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_1000322FC;
      v19[3] = &unk_1000BABB0;
      v19[4] = v16;
      v20 = v7;
      v21 = v10;
      objc_msgSend(v16, "fetchRemoteProxy:", v19);

      goto LABEL_7;
    }
    v17 = DMFConfigurationEngineLog(v15);
    v12 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "controller"));
      *(_DWORD *)buf = 138543362;
      v23 = v18;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%{public}@ skipping status update because there are no updates to report", buf, 0xCu);

    }
  }

  objc_msgSend(*(id *)(a1 + 32), "endOperationWithResultObject:", 0);
LABEL_7:

}

void sub_1000322FC(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  _QWORD v10[5];
  id v11;

  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7 = DMFConfigurationEngineLog(v5);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_1000749B0(a1, v6);

    objc_msgSend(*(id *)(a1 + 32), "endOperationWithResultObject:", 0);
  }
  else
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000323D4;
    v10[3] = &unk_1000BAB38;
    v9 = *(_QWORD *)(a1 + 40);
    v10[4] = *(_QWORD *)(a1 + 32);
    v11 = *(id *)(a1 + 48);
    objc_msgSend(a2, "configurationStatusDidChange:completion:", v9, v10);

  }
}

void sub_1000323D4(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;

  v3 = a2;
  v4 = DMFConfigurationEngineLog(v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_100074A48(a1, v3);
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "controller"));
    v9 = 138543362;
    v10 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%{public}@ successfully sent status updates", (uint8_t *)&v9, 0xCu);

  }
  v8 = *(_QWORD *)(a1 + 40);
  if (v8)
    (*(void (**)(uint64_t, id))(v8 + 16))(v8, v3);
  objc_msgSend(*(id *)(a1 + 32), "endOperationWithResultObject:", 0);

}

void sub_100032678(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  id v11;
  uint64_t v12;
  _QWORD v13[5];
  id v14;
  id v15;
  uint8_t buf[16];

  v5 = a2;
  v6 = a3;
  v7 = DMFConfigurationEngineLog(v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = v8;
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Connected successfully to anonymous connection", buf, 2u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_100074AE0((uint64_t)v6, v9);

    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000327A8;
    v13[3] = &unk_1000BABD8;
    v10 = *(void **)(a1 + 32);
    v11 = *(id *)(a1 + 40);
    v12 = *(_QWORD *)(a1 + 32);
    v15 = v11;
    v13[4] = v12;
    v14 = v6;
    objc_msgSend(v10, "_tryConnectingToNamedService:completion:", 1, v13);

  }
}

void sub_1000327A8(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  void (*v10)(void);
  uint8_t v11[16];

  v5 = a2;
  v6 = a3;
  v7 = DMFConfigurationEngineLog(v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = v8;
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Connected successfully to named connection", v11, 2u);
    }

    v10 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_100074B54(a1, v9);

    v10 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  v10();

}

void sub_100032B18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100032B30(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100032B40(uint64_t a1)
{

}

void sub_100032B48(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

}

void sub_100032B88(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  if (v7)
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = 0;

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = 0;

}

id sub_100032EF8()
{
  id v0;
  void *v1;
  id v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  _BOOL8 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  id v29;
  _BYTE v30[128];

  v0 = sub_1000334C4();
  v1 = (void *)objc_claimAutoreleasedReturnValue(v0);
  v2 = sub_100033504(v1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  if (v3)
  {
    v24 = 0;
    v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "getMobileEquipmentInfoFor:error:", v3, &v24));
    v5 = v24;
    if (v4)
    {
      v4 = v4;
      v6 = v4;
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        sub_100074CA4();
      v6 = 0;
    }
  }
  else
  {
    v29 = 0;
    v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "getMobileEquipmentInfo:", &v29));
    v5 = v29;
    if (v4)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "meInfoList"));
      v8 = v7;
      if (v7)
      {
        v27 = 0u;
        v28 = 0u;
        v25 = 0u;
        v26 = 0u;
        v9 = v7;
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v26;
          while (2)
          {
            for (i = 0; i != v11; i = (char *)i + 1)
            {
              if (*(_QWORD *)v26 != v12)
                objc_enumerationMutation(v9);
              v14 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
              if (objc_msgSend(v14, "slotId") == (id)1)
              {
                v6 = v14;

                goto LABEL_25;
              }
            }
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
            if (v11)
              continue;
            break;
          }
        }

      }
      else
      {
        v15 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
        if (v15)
          sub_100074C70(v15, v16, v17, v18, v19, v20, v21, v22);
      }
      v6 = 0;
LABEL_25:

    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        sub_100074C08();
      v6 = 0;
    }
  }

  return v6;
}

void sub_100033168(id a1)
{
  id v1;
  void *v2;
  id obj;

  v1 = sub_100032EF8();
  v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "MEID"));

  if (objc_msgSend(obj, "length"))
    objc_storeStrong((id *)&qword_1000EB850, obj);

}

void sub_100033220(id a1)
{
  uint64_t v1;
  const void *v2;
  unint64_t v3;
  BOOL v4;
  void *v5;
  uint64_t v6;
  _OWORD v7[2];
  uint64_t v8;

  v8 = 0;
  memset(v7, 0, sizeof(v7));
  v1 = _CTServerConnectionCreate(kCFAllocatorDefault, sub_1000332A8, v7);
  if (v1)
  {
    v2 = (const void *)v1;
    v6 = 0;
    v3 = (unint64_t)_CTServerConnectionCopyFirmwareVersion(v1, &v6) >> 32;
    if (v6)
      v4 = v3 == 0;
    else
      v4 = 0;
    if (v4)
    {
      v5 = (void *)qword_1000EB860;
      qword_1000EB860 = v6;

    }
    CFRelease(v2);
  }
}

void sub_1000332A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412546;
    v6 = a2;
    v7 = 2112;
    v8 = a3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "_ServerConnectionCallback: notification = %@, notificationInfo = %@", (uint8_t *)&v5, 0x16u);
  }
}

id sub_1000334C4()
{
  if (qword_1000EB878 != -1)
    dispatch_once(&qword_1000EB878, &stru_1000BAD70);
  return (id)qword_1000EB870;
}

id sub_100033504(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  const char *v8;
  uint32_t v9;
  _BOOL8 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  id v20;
  id v21;
  uint8_t buf[4];
  id v23;

  v1 = a1;
  v2 = v1;
  if (v1)
  {
    v21 = 0;
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "getPreferredDataSubscriptionContextSync:", &v21));
    v4 = v21;
    v5 = v4;
    if (!v3)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v23 = v5;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "getPreferredDataSubscriptionContextSync failed: %{public}@", buf, 0xCu);
      }
      v18 = 0;
      v7 = v5;
      goto LABEL_19;
    }
    v20 = v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "getSIMStatus:error:", v3, &v20));
    v7 = v20;

    if (v6)
    {
      if (!objc_msgSend(v6, "isEqualToString:", kCTSIMSupportSIMStatusNotInserted))
      {
        v18 = v3;
        goto LABEL_18;
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v8 = "rejecting data SIM that isn't inserted";
        v9 = 2;
LABEL_15:
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v8, buf, v9);
      }
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v23 = v7;
      v8 = "getSIMStatus failed: %{public}@";
      v9 = 12;
      goto LABEL_15;
    }
    v18 = 0;
LABEL_18:

LABEL_19:
    goto LABEL_20;
  }
  v10 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
  if (v10)
    sub_100074D74(v10, v11, v12, v13, v14, v15, v16, v17);
  v18 = 0;
LABEL_20:

  return v18;
}

void sub_100033AD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100033AE8(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  unsigned __int8 v9;
  id v10;
  id v11;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100074FB0();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  }
  else
  {
    v7 = sub_1000334C4();
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v11 = 0;
    v9 = objc_msgSend(v8, "getInternationalDataAccessSync:error:", v5, &v11);
    v10 = v11;
    if (v10)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        sub_100074F48();
      v9 = 0;
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v9;

  }
}

void sub_100033C4C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100075080();
  }
  else
  {
    v7 = sub_1000334C4();
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "setInternationalDataAccessSync:status:", v5, *(unsigned __int8 *)(a1 + 32)));
    if (v9 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100075018();

  }
}

void sub_1000344D0(uint64_t a1, int a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v5 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    sub_100075324(a2, (uint64_t)v5);
  v6 = *(_QWORD *)(a1 + 32);
  if (v5 && a2)
  {
    (*(void (**)(uint64_t, id, _QWORD))(v6 + 16))(v6, v5, 0);
  }
  else
  {
    v7 = DMFErrorWithCodeAndUserInfo(203, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    (*(void (**)(uint64_t, _QWORD, void *))(v6 + 16))(v6, 0, v8);

  }
}

void sub_10003477C(uint64_t a1, int a2)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    sub_100075414(a2);
  v4 = *(_QWORD *)(a1 + 32);
  if (a2)
  {
    (*(void (**)(uint64_t, _QWORD))(v4 + 16))(v4, 0);
  }
  else
  {
    v5 = DMFErrorWithCodeAndUserInfo(201, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v6);

  }
}

void sub_100034800(id a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_opt_new(CoreTelephonyClient);
  v2 = (void *)qword_1000EB870;
  qword_1000EB870 = v1;

}

void sub_100034828(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

id sub_10003494C(uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  if (a2)
    return objc_msgSend(v2, "endOperationWithError:", a2);
  else
    return objc_msgSend(v2, "endOperationWithResultObject:", 0);
}

id sub_100034C14(uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  if (a2)
    return objc_msgSend(v2, "endOperationWithError:", a2);
  else
    return objc_msgSend(v2, "endOperationWithResultObject:", 0);
}

id sub_100035DF4(uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  if (a2)
    return objc_msgSend(v2, "endOperationWithDMFErrorCode:", 1804);
  else
    return objc_msgSend(v2, "endOperationWithResultObject:", 0);
}

void sub_100035E4C(id a1)
{
  id v1;
  void *v2;

  v1 = objc_msgSend(objc_alloc((Class)objc_opt_class(DMDiOSDeviceController)), "initPrivate");
  v2 = (void *)qword_1000EB880;
  qword_1000EB880 = (uint64_t)v1;

}

void sub_100037888(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  uint64_t v9;
  va_list va;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  va_list va1;

  va_start(va1, a8);
  va_start(va, a8);
  v9 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000378B4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_1000378C4(uint64_t a1)
{

}

void sub_1000378CC(uint64_t a1, unint64_t a2, void *a3)
{
  id v6;

  v6 = a3;
  if (v6)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100075BDC();
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a2 < 2;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void sub_100037B20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  uint64_t v9;
  va_list va;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  va_list va1;

  va_start(va1, a8);
  va_start(va, a8);
  v9 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_100037B4C(uint64_t a1, char a2, void *a3)
{
  id v6;

  v6 = a3;
  if (v6)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100075C44();
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a2;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void sub_100037D34(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_100037D58(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 2u);
}

void sub_1000382D0(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  uint64_t v4;

  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 88));
  _Unwind_Resume(a1);
}

void sub_100038310(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  id WeakRetained;
  uint8_t v5[16];

  v2 = DMFConfigurationEngineLog(a1);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Detected keychain lock change", v5, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "keybagLockStateDidChange");

}

void sub_10003838C(uint64_t a1)
{
  id WeakRetained;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  uint8_t v5[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "keybagLockStateDidChange");

  v3 = DMFConfigurationEngineLog(v2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Detected keychain first unlock", v5, 2u);
  }

}

void sub_100038404(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  id WeakRetained;
  uint8_t v5[16];

  v2 = DMFConfigurationEngineLog(a1);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Detected network change", v5, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "networkDidChange");

}

void sub_10003879C(uint64_t a1, void *a2)
{
  id v3;
  dispatch_queue_global_t global_queue;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD block[4];
  id v10;
  uint64_t v11;
  id v12;

  v3 = a2;
  global_queue = dispatch_get_global_queue(0, 0);
  v5 = objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003884C;
  block[3] = &unk_1000B9BD0;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(a1 + 40);
  v10 = v3;
  v11 = v6;
  v12 = v7;
  v8 = v3;
  dispatch_async(v5, block);

}

void sub_10003884C(uint64_t a1)
{
  uint64_t *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSErrorUserInfoKey v9;
  uint64_t v10;

  v2 = (uint64_t *)(a1 + 32);
  if (*(_QWORD *)(a1 + 32))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100075CAC(v2);
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(a1 + 40);
    if (v3)
    {
      v9 = NSUnderlyingErrorKey;
      v10 = v3;
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1));
      v6 = DMFErrorWithCodeAndUserInfo(500, v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
      objc_msgSend(v4, "endOperationWithError:", v7);

    }
    else
    {
      v8 = DMFErrorWithCodeAndUserInfo(500, 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue(v8);
      objc_msgSend(v4, "endOperationWithError:", v5);
    }

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "clearLastLocationRequestedDate");
    objc_msgSend(*(id *)(a1 + 40), "endOperationWithResultObject:", 0);
  }
}

uint64_t DMDPolicyFromDeclarationMode(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = a1;
  v2 = v1;
  if (!v1)
    goto LABEL_8;
  if ((objc_msgSend(v1, "isEqualToString:", DMFDeclarationPayloadModeDisallowed) & 1) == 0)
  {
    if ((objc_msgSend(v2, "isEqualToString:", DMFDeclarationPayloadModeAsk) & 1) != 0)
    {
      v3 = 2;
      goto LABEL_9;
    }
    if ((objc_msgSend(v2, "isEqualToString:", DMFDeclarationPayloadModeWarn) & 1) != 0)
    {
      v3 = 1;
      goto LABEL_9;
    }
LABEL_8:
    v3 = 0;
    goto LABEL_9;
  }
  v3 = 4;
LABEL_9:

  return v3;
}

uint64_t DMDDeclarationModeIsValid(void *a1)
{
  uint64_t v1;
  id v2;
  unsigned int v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  int v8;

  v1 = DMFDeclarationPayloadModeOverride;
  v2 = a1;
  v3 = objc_msgSend(v2, "isEqualToString:", v1);
  v4 = objc_msgSend(v2, "isEqualToString:", DMFDeclarationPayloadModeDisallowed);
  v5 = objc_msgSend(v2, "isEqualToString:", DMFDeclarationPayloadModeAsk);
  v6 = objc_msgSend(v2, "isEqualToString:", DMFDeclarationPayloadModeWarn);
  v7 = objc_msgSend(v2, "isEqualToString:", DMFDeclarationPayloadModeAllowed);

  if (v2)
    v8 = v3;
  else
    v8 = 1;
  if (v8 | v4 | v5)
    return v2 != 0;
  else
    return v6 | v7;
}

void sub_10003913C(uint64_t a1, void *a2)
{
  id v3;
  dispatch_queue_global_t global_queue;
  NSObject *v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;

  v3 = a2;
  global_queue = dispatch_get_global_queue(0, 0);
  v5 = objc_claimAutoreleasedReturnValue(global_queue);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000391DC;
  v8[3] = &unk_1000B9BA8;
  v6 = *(_QWORD *)(a1 + 32);
  v9 = v3;
  v10 = v6;
  v7 = v3;
  dispatch_async(v5, v8);

}

void sub_1000391DC(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  NSErrorUserInfoKey v6;
  uint64_t v7;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (v1)
  {
    v6 = NSUnderlyingErrorKey;
    v7 = v1;
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v7, &v6, 1));
    v4 = DMFErrorWithCodeAndUserInfo(400, v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    objc_msgSend(v2, "endOperationWithError:", v5);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "endOperationWithResultObject:", 0);
  }
}

void sub_100039AF8(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  void *v10;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v5 = DMFConfigurationEngineLog(v3);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_100075FE4(v4);

    objc_msgSend(*(id *)(a1 + 32), "endOperationWithError:", v4);
  }
  else
  {
    v7 = *(void **)(a1 + 32);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100039BB4;
    v8[3] = &unk_1000B9B40;
    v9 = 0;
    v10 = v7;
    objc_msgSend(v7, "fixupDatabaseWithCompletionHandler:", v8);

  }
}

void sub_100039BB4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  uint8_t v7[16];

  v4 = DMFConfigurationEngineLog(a1);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = v5;
  if (a2)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_100076060(a1);

    objc_msgSend(*(id *)(a1 + 40), "setError:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "successfully loaded configuration database", v7, 2u);
    }

  }
}

void sub_10003A0C0(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  unsigned __int8 v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  id v19;
  uint64_t v20;
  id v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  uint64_t v26;
  id v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  void *v31;

  v5 = a2;
  v6 = a3;
  v7 = DMFConfigurationEngineLog(v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "verboseDescription"));
      *(_DWORD *)buf = 138543618;
      v29 = v5;
      v30 = 2114;
      v31 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "unable to load persistent store %{public}@: %{public}@", buf, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      sub_100076204((uint64_t)v5, v9);

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "type"));
  v12 = objc_msgSend(v11, "isEqualToString:", NSSQLiteStoreType);

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "URL"));
    v25 = 0;
    v14 = objc_msgSend(v13, "setResourceValue:forKey:error:", 0, NSURLIsExcludedFromBackupKey, &v25);
    v15 = v25;

    if ((v14 & 1) == 0)
    {
      v17 = DMFConfigurationEngineLog(v16);
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        sub_100076154((uint64_t)v5, v15, v18);

    }
  }
  objc_msgSend(*(id *)(a1 + 40), "removeObject:", v5);
  if (!objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    v19 = objc_msgSend(*(id *)(a1 + 32), "count");
    v20 = *(_QWORD *)(a1 + 48);
    if (v19)
    {
      v26 = DMFErrorFailedConfigurationDatabaseStoreKey;
      v21 = objc_msgSend(*(id *)(a1 + 32), "copy");
      v27 = v21;
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1));
      v23 = DMFErrorWithCodeAndUserInfo(4007, v22);
      v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
      (*(void (**)(uint64_t, void *))(v20 + 16))(v20, v24);

    }
    else
    {
      (*(void (**)(_QWORD, _QWORD))(v20 + 16))(*(_QWORD *)(a1 + 48), 0);
    }
  }

}

void sub_10003A3C8(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  char v6;
  uint64_t v7;
  void *i;
  uint64_t v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  unsigned __int8 v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  void *v36;
  id v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  NSErrorUserInfoKey v43;
  id v44;
  NSErrorUserInfoKey v45;
  id v46;
  uint8_t buf[4];
  uint64_t v48;
  _BYTE v49[128];

  v34 = a2;
  v35 = a1;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "database"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "persistentStoreCoordinator"));

  v42 = 0u;
  v40 = 0u;
  v41 = 0u;
  v39 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "persistentStores"));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v39, v49, 16);
  if (v5)
  {
    v6 = 0;
    v7 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v40 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "metadataForPersistentStore:", v9));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("DMDEngineDatabaseFixedDigitalHealthUsageEventMetadataKey")));
        v12 = objc_msgSend(v11, "BOOLValue");

        if ((v12 & 1) == 0)
        {
          v14 = DMFConfigurationEngineLog(v13);
          v15 = objc_claimAutoreleasedReturnValue(v14);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138543362;
            v48 = v9;
            _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "persistent store %{public}@ has not been fixed up yet", buf, 0xCu);
          }

          v6 = 1;
        }

      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v39, v49, 16);
    }
    while (v5);

    if ((v6 & 1) != 0)
    {
      v17 = DMFConfigurationEngineLog(v16);
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        sub_100076278(v18);

      v19 = (void *)objc_claimAutoreleasedReturnValue(+[DMDEventSubscriptionRegistration fetchRequest](DMDEventSubscriptionRegistration, "fetchRequest"));
      v38 = 0;
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "execute:", &v38));
      v21 = v38;
      v22 = v21;
      if (v20)
      {
        v23 = *(void **)(v35 + 32);
        v37 = v22;
        v24 = objc_msgSend(v23, "updateMetadataForManagedObjectContext:error:", v34, &v37);
        v25 = v37;

        v26 = *(_QWORD *)(v35 + 40);
        if ((v24 & 1) != 0)
        {
          (*(void (**)(_QWORD, _QWORD))(v26 + 16))(*(_QWORD *)(v35 + 40), 0);
LABEL_31:

          goto LABEL_32;
        }
        if (v25)
        {
          v43 = NSUnderlyingErrorKey;
          v44 = v25;
          v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1));
          v31 = DMFErrorWithCodeAndUserInfo(4007, v28);
          v30 = (void *)objc_claimAutoreleasedReturnValue(v31);
        }
        else
        {
          v33 = DMFErrorWithCodeAndUserInfo(4007, 0);
          v30 = (void *)objc_claimAutoreleasedReturnValue(v33);
          v28 = v30;
        }
        (*(void (**)(uint64_t, void *))(v26 + 16))(v26, v30);
        v22 = v25;
        if (!v25)
        {
LABEL_30:

          v25 = v22;
          goto LABEL_31;
        }
      }
      else
      {
        v27 = *(_QWORD *)(v35 + 40);
        if (v21)
        {
          v45 = NSUnderlyingErrorKey;
          v46 = v21;
          v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v46, &v45, 1));
          v29 = DMFErrorWithCodeAndUserInfo(4007, v28);
          v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
        }
        else
        {
          v32 = DMFErrorWithCodeAndUserInfo(4007, 0);
          v30 = (void *)objc_claimAutoreleasedReturnValue(v32);
          v28 = v30;
        }
        (*(void (**)(uint64_t, void *))(v27 + 16))(v27, v30);
        if (!v22)
          goto LABEL_30;
      }

      goto LABEL_30;
    }
  }
  else
  {

  }
  (*(void (**)(void))(*(_QWORD *)(v35 + 40) + 16))();
LABEL_32:

}

void sub_10003A7B8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void **a14, uint64_t a15, void (*a16)(_QWORD *a1, uint64_t a2), void *a17, id a18, uint64_t a19, id a20,id a21,void *a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,__int16 buf)
{
  id v37;
  uint64_t v38;
  NSObject *v39;
  void *v40;
  unsigned __int8 v41;
  id v42;
  void *v43;
  id v44;
  uint64_t v45;

  if (a2 == 1)
  {
    v37 = objc_begin_catch(exception_object);
    v38 = DMFConfigurationEngineLog(v37);
    v39 = objc_claimAutoreleasedReturnValue(v38);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
    {
      buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "configuration database has been deprecated, destroying persistent stores and reloading", (uint8_t *)&buf, 2u);
    }

    v40 = *(void **)(a10 + 32);
    a22 = 0;
    v41 = objc_msgSend(v40, "destroyPersistentStoresWithError:", &a22);
    v42 = a22;

    if ((v41 & 1) != 0)
    {
      a14 = _NSConcreteStackBlock;
      a15 = 3221225472;
      a16 = sub_10003A914;
      a17 = &unk_1000BAE80;
      v43 = *(void **)(a10 + 32);
      a21 = *(id *)(a10 + 40);
      v44 = v42;
      v45 = *(_QWORD *)(a10 + 32);
      a18 = v44;
      a19 = v45;
      a20 = a9;
      objc_msgSend(v43, "loadPersistentStoresWithCompletionHandler:", &a14);

    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a10 + 40) + 16))();
    }

    objc_end_catch();
    JUMPOUT(0x10003A76CLL);
  }
  _Unwind_Resume(exception_object);
}

void sub_10003A914(_QWORD *a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  unsigned __int8 v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  NSErrorUserInfoKey v14;
  id v15;

  if (a2)
  {
    (*(void (**)(_QWORD, _QWORD))(a1[7] + 16))(a1[7], a1[4]);
  }
  else
  {
    v3 = (void *)a1[5];
    v4 = a1[6];
    v13 = 0;
    v5 = objc_msgSend(v3, "updateMetadataForManagedObjectContext:error:", v4, &v13);
    v6 = v13;
    v7 = v6;
    v8 = a1[7];
    if ((v5 & 1) != 0)
    {
      (*(void (**)(uint64_t, _QWORD))(v8 + 16))(v8, 0);
    }
    else
    {
      if (v6)
      {
        v14 = NSUnderlyingErrorKey;
        v15 = v6;
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1));
        v10 = DMFErrorWithCodeAndUserInfo(4007, v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
        (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v11);

      }
      else
      {
        v12 = DMFErrorWithCodeAndUserInfo(4007, 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue(v12);
        (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);
      }

    }
  }
}

id sub_10003B188(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performDatabaseModificationOperationWithManagedObjectContext:", *(_QWORD *)(a1 + 40));
}

void sub_10003F208(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

uint64_t sub_10003F23C(uint64_t a1, uint64_t a2)
{
  return a2;
}

int64_t sub_10003F9F8(id a1, NSDictionary *a2, NSDictionary *a3)
{
  uint64_t v4;
  NSDictionary *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = DMFDeclarationPayloadIdentifierKey;
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](a2, "objectForKeyedSubscript:", v4));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", v4));

  v8 = objc_msgSend(v6, "compare:", v7);
  return (int64_t)v8;
}

void sub_10003FEFC(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  unsigned __int8 v20;
  uint64_t v21;
  const __CFString *v22;
  DMDConfigurationSourceRepresentation *v23;
  uint64_t v24;
  void *v25;
  DMDConfigurationSource *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  unsigned __int8 v36;
  id v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  id v48;
  _BYTE v49[128];
  uint64_t v50;
  const __CFString *v51;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "request"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "organizationIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[DMDConfigurationOrganization fetchRequestMatchingConfigurationOrganizationWithIdentifier:](DMDConfigurationOrganization, "fetchRequestMatchingConfigurationOrganizationWithIdentifier:", v3));

  v48 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "execute:", &v48));
  v6 = v48;
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));
    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "organizationIdentifier"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "clientIdentifier"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@:%@"), v8, v9));

      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "machServiceName"));
      v12 = objc_msgSend(v11, "length");

      if (v12)
      {
        v40 = v6;
        v41 = v5;
        v42 = v4;
        v46 = 0u;
        v47 = 0u;
        v44 = 0u;
        v45 = 0u;
        v39 = v7;
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "persistentConfigurationSources"));
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v45;
LABEL_6:
          v17 = 0;
          while (1)
          {
            if (*(_QWORD *)v45 != v16)
              objc_enumerationMutation(v13);
            v18 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * v17);
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "identifier"));
            v20 = objc_msgSend(v19, "isEqualToString:", v10);

            if ((v20 & 1) != 0)
              break;
            if (v15 == (id)++v17)
            {
              v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
              if (v15)
                goto LABEL_6;
              goto LABEL_12;
            }
          }
          v26 = v18;

          v7 = v39;
          if (v26)
            goto LABEL_19;
        }
        else
        {
LABEL_12:

          v7 = v39;
        }
        v26 = -[DMDConfigurationSource initWithContext:]([DMDConfigurationSource alloc], "initWithContext:", *(_QWORD *)(a1 + 40));
        -[DMDConfigurationSource setOrganization:](v26, "setOrganization:", v7);
LABEL_19:
        -[DMDConfigurationSource setIdentifier:](v26, "setIdentifier:", v10);
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "configurationSourceName"));
        -[DMDConfigurationSource setDisplayName:](v26, "setDisplayName:", v27);

        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "machServiceName"));
        -[DMDConfigurationSource setMachServiceName:](v26, "setMachServiceName:", v28);

        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "reportingRequirements"));
        -[DMDConfigurationSource setReportingRequirements:](v26, "setReportingRequirements:", v29);

        v23 = -[DMDConfigurationSourceRepresentation initWithConfigurationSource:]([DMDConfigurationSourceRepresentation alloc], "initWithConfigurationSource:", v26);
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "listenerEndpoint"));
        -[DMDConfigurationSourceRepresentation setListenerEndpoint:](v23, "setListenerEndpoint:", v30);

        v5 = v41;
        v4 = v42;
        v6 = v40;
      }
      else
      {
        v23 = objc_opt_new(DMDConfigurationSourceRepresentation);
        -[DMDConfigurationSourceRepresentation setIdentifier:](v23, "setIdentifier:", v10);
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "organizationIdentifier"));
        -[DMDConfigurationSourceRepresentation setOrganizationIdentifier:](v23, "setOrganizationIdentifier:", v31);

        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "configurationSourceName"));
        -[DMDConfigurationSourceRepresentation setDisplayName:](v23, "setDisplayName:", v32);

        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "machServiceName"));
        -[DMDConfigurationSourceRepresentation setMachServiceName:](v23, "setMachServiceName:", v33);

        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "listenerEndpoint"));
        -[DMDConfigurationSourceRepresentation setListenerEndpoint:](v23, "setListenerEndpoint:", v34);

        v26 = (DMDConfigurationSource *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "reportingRequirements"));
        -[DMDConfigurationSourceRepresentation setReportingRequirements:](v23, "setReportingRequirements:", v26);
      }

      v35 = *(void **)(a1 + 40);
      v43 = v6;
      v36 = objc_msgSend(v35, "save:", &v43);
      v37 = v43;

      v38 = *(void **)(a1 + 32);
      if ((v36 & 1) != 0)
        objc_msgSend(v38, "performSelectorOnMainThread:withObject:waitUntilDone:", "delegateUpdatedDeclarationSourceAndEndOperation:", v23, 0);
      else
        objc_msgSend(v38, "setError:", v37);
      v6 = v37;
    }
    else
    {
      v50 = DMFConfigurationOrganizationIdentifierErrorKey;
      v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "organizationIdentifier"));
      v10 = (void *)v21;
      v22 = CFSTR("(null)");
      if (v21)
        v22 = (const __CFString *)v21;
      v51 = v22;
      v23 = (DMDConfigurationSourceRepresentation *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v51, &v50, 1));
      v24 = DMFErrorWithCodeAndUserInfo(4002, v23);
      v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
      objc_msgSend(*(id *)(a1 + 32), "setError:", v25);

    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setError:", v6);
  }

}

uint64_t sub_100041DE4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_100042124(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_1000421AC(uint64_t a1)
{
  const char *v2;
  const char *v3;
  const char *v4;
  _QWORD v6[5];
  _QWORD v7[5];
  _QWORD v8[5];
  _QWORD handler[5];

  v2 = (const char *)objc_msgSend(CFSTR("com.apple.alarm"), "UTF8String");
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1000422D8;
  handler[3] = &unk_1000BAF50;
  handler[4] = *(_QWORD *)(a1 + 32);
  xpc_set_event_stream_handler(v2, (dispatch_queue_t)&_dispatch_main_q, handler);
  v3 = (const char *)objc_msgSend(CFSTR("com.apple.distnoted.matching"), "UTF8String");
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000424E0;
  v8[3] = &unk_1000BAF50;
  v8[4] = *(_QWORD *)(a1 + 32);
  xpc_set_event_stream_handler(v3, (dispatch_queue_t)&_dispatch_main_q, v8);

  v4 = (const char *)objc_msgSend(CFSTR("com.apple.notifyd.matching"), "UTF8String");
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000426CC;
  v7[3] = &unk_1000BAF50;
  v7[4] = *(_QWORD *)(a1 + 32);
  xpc_set_event_stream_handler(v4, (dispatch_queue_t)&_dispatch_main_q, v7);

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10004284C;
  v6[3] = &unk_1000BAFC8;
  v6[4] = *(_QWORD *)(a1 + 32);
  return +[MOEffectiveSettings startObservingChangesWithHandler:](MOEffectiveSettings, "startObservingChangesWithHandler:", v6);
}

void sub_1000422D8(uint64_t a1, void *a2)
{
  id v3;
  const char *string;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t v16[128];
  uint8_t buf[4];
  void *v18;

  v3 = a2;
  string = xpc_dictionary_get_string(v3, _xpc_event_key_name);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", string));
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v18 = v5;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Received xpc stream event (alarm) with name: %{public}@", buf, 0xCu);
  }
  if (v5)
  {
    xpc_set_event(objc_msgSend(CFSTR("com.apple.alarm"), "UTF8String"), string, 0);
    v6 = *(id *)(*(_QWORD *)(a1 + 32) + 8);
    objc_sync_enter(v6);
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v7 = *(id *)(*(_QWORD *)(a1 + 32) + 8);
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v7);
          v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
          if ((objc_opt_respondsToSelector(v11, "handleAlarmWithIdentifier:") & 1) != 0)
            objc_msgSend(v11, "handleAlarmWithIdentifier:", v5, (_QWORD)v12);
        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }

    objc_sync_exit(v6);
  }

}

void sub_1000424BC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000424E0(uint64_t a1, void *a2)
{
  id v3;
  NSString *v4;
  void *v5;
  xpc_object_t dictionary;
  void *v7;
  void *v8;
  _QWORD *v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;

  v3 = a2;
  v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", xpc_dictionary_get_string(v3, _xpc_event_key_name));
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  dictionary = xpc_dictionary_get_dictionary(v3, (const char *)objc_msgSend(CFSTR("UserInfo"), "UTF8String"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(dictionary);

  if (v7)
    v8 = (void *)_CFXPCCreateCFObjectFromXPCObject(v7);
  else
    v8 = 0;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v17 = v5;
    v18 = 2114;
    v19 = v8;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Received xpc stream event (distributed notification matching) with name: %{public}@ user info: %{public}@", buf, 0x16u);
  }
  v9 = *(_QWORD **)(a1 + 32);
  v10 = v9[2];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100042680;
  v13[3] = &unk_1000BAF78;
  v14 = v5;
  v15 = v8;
  v11 = v8;
  v12 = v5;
  objc_msgSend(v9, "_dispatchToListenerForKey:inMap:withBlock:", v12, v10, v13);

}

void sub_100042680(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector(v3, "handleDistributedNotificationWithName:userInfo:") & 1) != 0)
    objc_msgSend(v3, "handleDistributedNotificationWithName:userInfo:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void sub_1000426CC(uint64_t a1, xpc_object_t xdict)
{
  NSString *v3;
  void *v4;
  _QWORD *v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[4];
  void *v11;

  v3 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", xpc_dictionary_get_string(xdict, _xpc_event_key_name));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Received xpc stream event (notify matching) with name: %{public}@", buf, 0xCu);
  }
  v5 = *(_QWORD **)(a1 + 32);
  v6 = v5[3];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100042800;
  v8[3] = &unk_1000BAFA0;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v5, "_dispatchToListenerForKey:inMap:withBlock:", v7, v6, v8);

}

void sub_100042800(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector(v3, "handleNotifyMatchingNotificationWithName:") & 1) != 0)
    objc_msgSend(v3, "handleNotifyMatchingNotificationWithName:", *(_QWORD *)(a1 + 32));

}

void sub_10004284C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  char *v8;
  char *v9;
  uint64_t v10;
  char *i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t v16[128];
  uint8_t buf[4];
  id v18;
  __int16 v19;
  id v20;

  v5 = a2;
  v6 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v18 = v5;
    v19 = 2114;
    v20 = v6;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Received effective settings change for event: %{public}@, groups: %{public}@", buf, 0x16u);
  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = v6;
  v8 = (char *)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(a1 + 32), "_dispatchToListenerForKey:inMap:withBlock:");
      }
      v9 = (char *)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

void sub_100042A00(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector(v3, "handleManagedEffectiveSettingsChangeInGroup:") & 1) != 0)
    objc_msgSend(v3, "handleManagedEffectiveSettingsChangeInGroup:", *(_QWORD *)(a1 + 32));

}

void sub_100042BD0(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void sub_100042D50(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000433A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  objc_destroyWeak(location);
  objc_destroyWeak(&a20);
  _Unwind_Resume(a1);
}

void sub_1000433C4(uint64_t a1, void *a2)
{
  id WeakRetained;
  void (**v4)(_QWORD, _QWORD, _QWORD, _QWORD);
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "eventsHandler"));

  if (v4)
    ((void (**)(_QWORD, _QWORD, _QWORD, id))v4)[2](v4, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), v5);

}

void sub_10004354C(_QWORD *a1, uint64_t a2, void *a3)
{
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "organizationIdentifier"));
  v5 = objc_msgSend(v4, "isEqual:", a1[4]);

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "eventStatusesSinceStartDate:", a1[6]));
    v7 = (void *)a1[5];
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "payloadIdentifier"));
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, v8);

  }
}

void sub_100043804(id a1)
{
  DMDSecureUnarchiveFromEventSubscriptionRegistrationDataTransformer *v1;

  v1 = objc_opt_new(DMDSecureUnarchiveFromEventSubscriptionRegistrationDataTransformer);
  +[DMDSecureUnarchiveFromEventSubscriptionRegistrationDataTransformer setValueTransformer:forName:](DMDSecureUnarchiveFromEventSubscriptionRegistrationDataTransformer, "setValueTransformer:forName:", v1, CFSTR("DMDSecureUnarchiveFromEventSubscriptionRegistrationDataTransformer"));

}

void sub_100043890(id a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v3[3];

  v3[0] = objc_opt_class(CEMEventSubscriptionDeclaration_Schedule);
  v3[1] = objc_opt_class(NSArray);
  v3[2] = objc_opt_class(CEMEventBase);
  v1 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v3, 3));
  v2 = (void *)qword_1000EB8A0;
  qword_1000EB8A0 = v1;

}

void sub_100043ED8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100043EF4(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "streamEventsHandler"));
  objc_msgSend(v4, "startNotificationStreamWithEventsHandler:", v5);

}

void sub_100043F44(uint64_t a1)
{
  void *v1;
  void *v2;
  void (**v3)(_QWORD, _QWORD);
  NSDate *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "lastDateScheduleElapsed"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "eventStatusesSinceStartDate:", v1));

  v3 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "streamEventsHandler"));
  ((void (**)(_QWORD, void *))v3)[2](v3, v2);

  v4 = objc_opt_new(NSDate);
  objc_msgSend(WeakRetained, "setLastDateScheduleElapsed:", v4);

}

void sub_1000440AC(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "eventStatusRollupSinceStartDate:", *(_QWORD *)(a1 + 32)));
  if (v4)
  {
    v5 = v4;
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v4);
    v4 = v5;
  }

}

void sub_1000443FC(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  id v7;

  v7 = a2;
  v5 = *(void **)(a1 + 32);
  if (a3)
  {
    objc_msgSend(v5, "endOperationWithError:", a3);
  }
  else
  {
    v6 = objc_msgSend(objc_alloc((Class)DMFFetchAppsResultObject), "initWithAppsByBundleIdentifier:", v7);
    objc_msgSend(v5, "endOperationWithResultObject:", v6);

  }
}

void sub_100044780(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;

  v5 = a2;
  if (a3)
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    objc_msgSend(*(id *)(a1 + 48), "_fetchAppsForBundleIdentifier:type:completion:", v5, objc_msgSend(*(id *)(a1 + 32), "type"), *(_QWORD *)(a1 + 40));

}

void sub_1000447F0(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  DMFApp *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  uint64_t v37;
  void *j;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  id v44;
  id v45;
  uint64_t v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  unsigned __int8 v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  NSObject *v56;
  uint64_t v57;
  id v58;
  void *v59;
  uint64_t v60;
  id v61;
  id v62;
  id v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  uint8_t buf[4];
  uint64_t v77;
  _BYTE v78[128];
  _BYTE v79[128];
  _BYTE v80[128];

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = v6;
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v62 = objc_msgSend(v5, "mutableCopy");
    v61 = v5;
    if (objc_msgSend(*(id *)(a1 + 32), "managedAppsOnly"))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "bundleIdentifiers"));
      v72 = 0u;
      v73 = 0u;
      v74 = 0u;
      v75 = 0u;
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "managedBundleIdentifiers"));
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v72, v80, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v73;
        v59 = v9;
        do
        {
          for (i = 0; i != v11; i = (char *)i + 1)
          {
            if (*(_QWORD *)v73 != v12)
              objc_enumerationMutation(v9);
            v14 = *(_QWORD *)(*((_QWORD *)&v72 + 1) + 8 * (_QWORD)i);
            v15 = objc_autoreleasePoolPush();
            if (!v8 || objc_msgSend(v8, "containsObject:", v14))
            {
              v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v14, v59));

              if (!v16)
              {
                v17 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppLifeCycle lifeCycleForBundleIdentifier:](DMDAppLifeCycle, "lifeCycleForBundleIdentifier:", v14));
                if (!objc_msgSend(v17, "currentState"))
                {
                  v18 = objc_opt_new(DMFApp);
                  -[DMFApp setType:](v18, "setType:", 0);
                  -[DMFApp setBundleIdentifier:](v18, "setBundleIdentifier:", v14);
                  -[DMFApp setInstallationState:](v18, "setInstallationState:", 0);
                  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "VPNUUIDStringForBundleIdentifier:", v14));
                  -[DMFApp setVPNUUIDString:](v18, "setVPNUUIDString:", v19);

                  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "cellularSliceUUIDStringForBundleIdentifier:", v14));
                  -[DMFApp setCellularSliceUUIDString:](v18, "setCellularSliceUUIDString:", v20);

                  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "contentFilterUUIDStringForBundleIdentifier:", v14));
                  -[DMFApp setContentFilterUUIDString:](v18, "setContentFilterUUIDString:", v21);

                  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "DNSProxyUUIDStringForBundleIdentifier:", v14));
                  -[DMFApp setDNSProxyUUIDString:](v18, "setDNSProxyUUIDString:", v22);

                  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "relayUUIDStringForBundleIdentifier:", v14));
                  -[DMFApp setRelayUUIDString:](v18, "setRelayUUIDString:", v23);

                  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "associatedDomainsForBundleIdentifier:", v14));
                  -[DMFApp setAssociatedDomains:](v18, "setAssociatedDomains:", v24);

                  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "associatedDomainsEnableDirectDownloadsForBundleIdentifier:", v14));
                  -[DMFApp setAssociatedDomainsEnableDirectDownloads:](v18, "setAssociatedDomainsEnableDirectDownloads:", v25);

                  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "removabilityForBundleIdentifier:", v14));
                  -[DMFApp setRemovable:](v18, "setRemovable:", v26);

                  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "tapToPayScreenLockForBundleIdentifier:", v14));
                  -[DMFApp setTapToPayScreenLock:](v18, "setTapToPayScreenLock:", v27);

                  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "allowUserToHideForBundleIdentifier:", v14));
                  -[DMFApp setAllowUserToHide:](v18, "setAllowUserToHide:", v28);

                  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "allowUserToLockForBundleIdentifier:", v14));
                  -[DMFApp setAllowUserToLock:](v18, "setAllowUserToLock:", v29);

                  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "configurationForBundleIdentifier:", v14));
                  -[DMFApp setConfiguration:](v18, "setConfiguration:", v30);

                  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "feedbackForBundleIdentifier:", v14));
                  -[DMFApp setFeedback:](v18, "setFeedback:", v31);

                  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "managementInformationForBundleIdentifier:", v14));
                  -[DMFApp setManagementInformation:](v18, "setManagementInformation:", v32);

                  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "sourceIdentifierForBundleIdentifier:", v14));
                  -[DMFApp setSourceIdentifier:](v18, "setSourceIdentifier:", v33);

                  v9 = v59;
                  objc_msgSend(v62, "setObject:forKeyedSubscript:", v18, v14);

                  v5 = v61;
                }

              }
            }
            objc_autoreleasePoolPop(v15);
          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v72, v80, 16);
        }
        while (v11);
      }

      v70 = 0u;
      v71 = 0u;
      v68 = 0u;
      v69 = 0u;
      v34 = v5;
      v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v68, v79, 16);
      if (v35)
      {
        v36 = v35;
        v37 = *(_QWORD *)v69;
        do
        {
          for (j = 0; j != v36; j = (char *)j + 1)
          {
            if (*(_QWORD *)v69 != v37)
              objc_enumerationMutation(v34);
            v39 = *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * (_QWORD)j);
            v40 = objc_autoreleasePoolPush();
            v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "objectForKeyedSubscript:", v39));
            v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "managementInformation"));

            if (!v42)
              objc_msgSend(v62, "setObject:forKeyedSubscript:", 0, v39);
            objc_autoreleasePoolPop(v40);
          }
          v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v68, v79, 16);
        }
        while (v36);
      }

      v5 = v61;
    }
    if (objc_msgSend(*(id *)(a1 + 32), "advanceTransientStates", v59))
      objc_msgSend(*(id *)(a1 + 40), "advanceTransientStates");
    if (objc_msgSend(*(id *)(a1 + 32), "deleteFeedback"))
    {
      v66 = 0u;
      v67 = 0u;
      v64 = 0u;
      v65 = 0u;
      v43 = v62;
      v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v64, v78, 16);
      if (v44)
      {
        v45 = v44;
        v7 = 0;
        v46 = *(_QWORD *)v65;
        v60 = 138543362;
        do
        {
          v47 = 0;
          v48 = v7;
          do
          {
            if (*(_QWORD *)v65 != v46)
              objc_enumerationMutation(v43);
            v49 = *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * (_QWORD)v47);
            v50 = objc_autoreleasePoolPush();
            v51 = *(void **)(a1 + 40);
            v63 = v48;
            v52 = objc_msgSend(v51, "setFeedback:forBundleIdentifier:error:", 0, v49, &v63);
            v7 = v63;

            if ((v52 & 1) == 0)
            {
              v55 = DMFAppLog(v53, v54);
              v56 = objc_claimAutoreleasedReturnValue(v55);
              if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543362;
                v77 = v49;
                _os_log_error_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_ERROR, "Could not delete feedback for bundle identifier: %{public}@", buf, 0xCu);
              }

            }
            objc_autoreleasePoolPop(v50);
            v47 = (char *)v47 + 1;
            v48 = v7;
          }
          while (v45 != v47);
          v45 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v64, v78, 16);
        }
        while (v45);
      }
      else
      {
        v7 = 0;
      }

      v5 = v61;
    }
    else
    {
      v7 = 0;
    }
    v57 = *(_QWORD *)(a1 + 48);
    v58 = objc_msgSend(v62, "copy", v60);
    (*(void (**)(uint64_t, id, _QWORD))(v57 + 16))(v57, v58, 0);

  }
}

void sub_100045B30(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;

  v6 = a2;
  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "endOperationWithError:", a3);
  }
  else
  {
    v5 = (void *)objc_opt_new(DMFFetchDeclarationsResultObject);
    objc_msgSend(v5, "setPayloadDescriptions:", v6);
    objc_msgSend(*(id *)(a1 + 32), "endOperationWithResultObject:", v5);

  }
}

void sub_100046278(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  NSErrorUserInfoKey v12;
  void *v13;

  v5 = a2;
  v6 = *(void **)(a1 + 32);
  if (a3)
  {
    v12 = NSUnderlyingErrorKey;
    v13 = a3;
    v7 = a3;
    v8 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1));
    v9 = DMFErrorWithCodeAndUserInfo(600, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    objc_msgSend(v6, "endOperationWithError:", v10);

  }
  else
  {
    v11 = 0;
    v8 = objc_msgSend(objc_alloc((Class)DMFFetchLocationResultObject), "initWithLocation:", v5);
    objc_msgSend(v6, "endOperationWithResultObject:", v8);

  }
}

void sub_10004648C(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "nonStoreBooks"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "storeBooks"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "arrayByAddingObjectsFromArray:", v3));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v4, "count")));
  objc_msgSend(*(id *)(a1 + 32), "moveTransientStatesForward");
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v10);
        v12 = objc_alloc((Class)DMFBook);
        v13 = objc_msgSend(v12, "initWithBook:", v11, (_QWORD)v16);
        objc_msgSend(v5, "addObject:", v13);

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  v14 = *(void **)(a1 + 40);
  v15 = objc_msgSend(objc_alloc((Class)DMFFetchManagedBooksResultObject), "initWithBooks:", v5);
  objc_msgSend(v14, "endOperationWithResultObject:", v15);

}

id sub_100046750(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;

  v3 = *(void **)(a1 + 32);
  if (a3)
    return objc_msgSend(v3, "endOperationWithError:");
  else
    return objc_msgSend(v3, "endOperationWithResultObject:", a2);
}

id sub_1000477B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;

  v3 = *(void **)(a1 + 32);
  if (a3)
    return objc_msgSend(v3, "endOperationWithError:");
  else
    return objc_msgSend(v3, "endOperationWithResultObject:", a2);
}

void sub_100047D4C(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  int v19;
  void *v20;

  v5 = a2;
  v6 = v5;
  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "endOperationWithError:", a3);
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bundleIdentifier"));

    v8 = *(void **)(a1 + 32);
    if (v7)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bundleIdentifier"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "personaIdentifier"));
      v11 = objc_msgSend(v8, "appCoordinatorExistsForBundleIdentifier:persona:", v9, v10);

      if (!v11)
      {
        objc_msgSend(*(id *)(a1 + 32), "setMetadata:", v6);
        objc_msgSend(*(id *)(a1 + 32), "_runWithRequest:", *(_QWORD *)(a1 + 40));
        goto LABEL_11;
      }
      v14 = DMFAppLog(v12, v13);
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bundleIdentifier"));
        v19 = 138543362;
        v20 = v16;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Abandoning install because of existing install coordinator for bundle identifier %{public}@", (uint8_t *)&v19, 0xCu);

      }
      v17 = *(void **)(a1 + 32);
      v18 = 2616;
    }
    else
    {
      v17 = *(void **)(a1 + 32);
      v18 = 2606;
    }
    objc_msgSend(v17, "endOperationWithDMFErrorCode:", v18);
  }
LABEL_11:

}

id sub_1000481D8(uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  if (a2)
    return objc_msgSend(v2, "endOperationWithError:", a2);
  else
    return objc_msgSend(v2, "endOperationWithResultObject:", 0);
}

id sub_100048438(uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  if (a2)
    return objc_msgSend(v2, "endOperationWithError:", a2);
  else
    return objc_msgSend(v2, "endOperationWithResultObject:", 0);
}

void sub_100048620(id a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", &__NSArray0__struct));
  v2 = (void *)qword_1000EB8B0;
  qword_1000EB8B0 = v1;

}

void sub_100048974(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;
  NSErrorUserInfoKey v8;
  uint64_t v9;

  v2 = *(void **)(a1 + 32);
  v1 = *(_QWORD *)(a1 + 40);
  if (v1)
  {
    v8 = NSUnderlyingErrorKey;
    v9 = v1;
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1));
    v4 = DMFErrorWithCodeAndUserInfo(2002, v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    objc_msgSend(v2, "endOperationWithError:", v5);

  }
  else
  {
    v6 = DMFErrorWithCodeAndUserInfo(2002, 0);
    v7 = (id)objc_claimAutoreleasedReturnValue(v6);
    objc_msgSend(v2, "endOperationWithError:");

  }
}

void sub_100049E18(id a1)
{
  uint64_t v1;
  void *v2;
  const __CFString *v3;
  uint64_t v4;

  v3 = CFSTR("whitelistedAppBundleIDs");
  v4 = MCFeatureAppLockBundleIDs;
  v1 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v4, &v3, 1));
  v2 = (void *)qword_1000EB8C0;
  qword_1000EB8C0 = v1;

}

id sub_10004A13C(uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  if (a2)
    return objc_msgSend(v2, "endOperationWithError:", a2);
  else
    return objc_msgSend(v2, "endOperationWithResultObject:", 0);
}

void sub_10004A5D4(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;

  v9 = a3;
  v5 = *(void **)(a1 + 32);
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "endOperationWithError:", a2);
  }
  else
  {
    v6 = objc_alloc((Class)DMFInstallManagedBookResultObject);
    v7 = objc_msgSend(objc_alloc((Class)DMFBook), "initWithBook:", v9);
    v8 = objc_msgSend(v6, "initWithBook:", v7);
    objc_msgSend(v5, "endOperationWithResultObject:", v8);

  }
  objc_msgSend(*(id *)(a1 + 40), "stayAliveThroughHereAtLeast");

}

id sub_10004B658(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  unsigned int v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v13;
  NSErrorUserInfoKey v14;
  id v15;

  if (a2 == 1)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
    v4 = *(_QWORD *)(a1 + 32);
    v13 = 0;
    v5 = objc_msgSend(v3, "openSensitiveURL:withOptions:error:", v4, 0, &v13);
    v6 = v13;

    v7 = *(void **)(a1 + 40);
    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 40), "endOperationWithResultObject:", 0);
    }
    else
    {
      if (v6)
      {
        v14 = NSUnderlyingErrorKey;
        v15 = v6;
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1));
        v9 = DMFErrorWithCodeAndUserInfo(1406, v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
        objc_msgSend(v7, "endOperationWithError:", v10);

      }
      else
      {
        v11 = DMFErrorWithCodeAndUserInfo(1406, 0);
        v8 = (void *)objc_claimAutoreleasedReturnValue(v11);
        objc_msgSend(v7, "endOperationWithError:", v8);
      }

    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "endOperationWithDMFErrorCode:", 2607);
  }
  byte_1000EB8D0 = 0;
  return objc_msgSend(*(id *)(a1 + 48), "stayAliveThroughHereAtLeast");
}

_QWORD *sub_10004C2F0(_QWORD *result, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;

  if (result[4])
  {
    v2 = result;
    v3 = DMFErrorWithCodeAndUserInfo(a2, 0);
    result = (id)objc_claimAutoreleasedReturnValue(v3);
    *(_QWORD *)v2[4] = result;
  }
  return result;
}

void sub_10004C4AC(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  NSErrorUserInfoKey v7;
  void *v8;

  v2 = *(void **)(a1 + 32);
  if (a2)
  {
    v7 = NSUnderlyingErrorKey;
    v8 = a2;
    v3 = a2;
    v4 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v8, &v7, 1));
    v5 = DMFErrorWithCodeAndUserInfo(2900, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    objc_msgSend(v2, "endOperationWithError:", v6);

  }
  else
  {
    v4 = 0;
    objc_msgSend(v2, "endOperationWithResultObject:", 0);
  }

}

void sub_10004C69C(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_opt_new(*(_QWORD *)(a1 + 32));
  v2 = (void *)qword_1000EB8D8;
  qword_1000EB8D8 = v1;

}

void sub_10004C77C(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  NSBundle *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  dispatch_source_t v16;
  NSObject *v17;
  dispatch_time_t v18;
  NSObject *v19;
  id v20;
  NSObject *v21;
  void *v22;
  id v23;
  _QWORD handler[5];
  id v25;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "completionBlock"));

  v3 = *(_QWORD *)(a1 + 48);
  if (v2)
  {
    v4 = DMFErrorWithCodeAndUserInfo(602, 0);
    v23 = (id)objc_claimAutoreleasedReturnValue(v4);
    (*(void (**)(uint64_t, _QWORD, id))(v3 + 16))(v3, 0, v23);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setCompletionBlock:", *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 32), "setOriginator:", *(_QWORD *)(a1 + 40));
    v5 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(DMFConnection));
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v7 = +[CLEmergencyEnablementAssertion newAssertionForBundle:withReason:](CLEmergencyEnablementAssertion, "newAssertionForBundle:withReason:", v6, CFSTR("DMDLostDeviceLocationManager getCurrentLocationForOriginator:completion:"));
    +[CLLocationManager setAuthorizationStatusByType:forBundle:](CLLocationManager, "setAuthorizationStatusByType:forBundle:", 3, v6);
    v8 = objc_alloc((Class)CLLocationManager);
    v9 = *(void **)(a1 + 32);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "queue"));
    v11 = objc_msgSend(v8, "initWithEffectiveBundle:delegate:onQueue:", v6, v9, v10);
    objc_msgSend(*(id *)(a1 + 32), "setLocationManager:", v11);

    v12 = *(void **)(a1 + 32);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "locationManager"));
    objc_msgSend(v13, "setDelegate:", v12);

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "locationManager"));
    objc_msgSend(v14, "setDesiredAccuracy:", kCLLocationAccuracyBest);

    v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "queue"));
    v16 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v15);
    objc_msgSend(*(id *)(a1 + 32), "setTimeoutTimerDispatchSource:", v16);

    v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "timeoutTimerDispatchSource"));
    v18 = dispatch_time(0xFFFFFFFFFFFFFFFELL, 30000000000);
    dispatch_source_set_timer(v17, v18, 0x3B9ACA00uLL, 0x3B9ACA00uLL);

    v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "timeoutTimerDispatchSource"));
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10004CA3C;
    handler[3] = &unk_1000B9BA8;
    handler[4] = *(_QWORD *)(a1 + 32);
    v25 = v7;
    v20 = v7;
    dispatch_source_set_event_handler(v19, handler);

    v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "timeoutTimerDispatchSource"));
    dispatch_activate(v21);

    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "locationManager"));
    objc_msgSend(v22, "requestLocation");

  }
}

void sub_10004CA3C(uint64_t a1)
{
  NSObject *v2;
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (**v11)(_QWORD, _QWORD, _QWORD);
  uint64_t v12;
  void *v13;

  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "queue"));
  dispatch_assert_queue_V2(v2);

  v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
  if (v3)
    sub_10007754C(v3, v4, v5, v6, v7, v8, v9, v10);
  v11 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "completionBlock"));
  objc_msgSend(*(id *)(a1 + 32), "_cleanupAfterResponseFromLocationManagerOrTimeout");
  if (v11)
  {
    v12 = DMFErrorWithCodeAndUserInfo(801, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    ((void (**)(_QWORD, _QWORD, void *))v11)[2](v11, 0, v13);

  }
}

void sub_10004CC00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10004CC18(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  unsigned int v5;
  id v6;
  void *v7;
  id v8;
  id v9;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v9 = 0;
  v5 = objc_msgSend(v4, "removeItemAtURL:error:", v3, &v9);

  v6 = v9;
  if (v5)
  {

  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "domain"));
    if ((objc_msgSend(v7, "isEqualToString:", NSCocoaErrorDomain) & 1) != 0)
    {
      v8 = objc_msgSend(*(id *)(a1 + 32), "code");

      if (v8 == (id)4)
        goto LABEL_9;
    }
    else
    {

    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_1000775E8();
  }
LABEL_9:

}

void sub_10004D110(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10004D15C(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_10004D16C(uint64_t a1)
{

}

void sub_10004D174(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = 1;
  v3 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithContentsOfURL:](NSDictionary, "dictionaryWithContentsOfURL:", a2));
  v4 = *(_QWORD *)(a1[5] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "objectForKeyedSubscript:", kMCMDMLostModeLastLocationRequestDateKey));
  v7 = *(_QWORD *)(a1[6] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

void sub_10004D638(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_10004D664(_QWORD *a1, void *a2)
{
  id v3;
  NSDate *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  unsigned int v9;
  id v10;
  _BOOL8 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  _QWORD v20[2];
  _QWORD v21[2];
  _QWORD v22[2];
  _QWORD v23[2];

  v3 = a2;
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
  v4 = objc_opt_new(NSDate);
  -[NSDate timeIntervalSinceReferenceDate](v4, "timeIntervalSinceReferenceDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));

  v22[0] = kMCMDMLostModeLastLocationRequestDateKey;
  v22[1] = CFSTR("originator");
  v6 = a1[4];
  v23[0] = v5;
  v23[1] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v23, v22, 2));
  if (objc_msgSend(v7, "writeToURL:atomically:", v3, 1))
  {
    v20[0] = NSFileProtectionKey;
    v20[1] = NSURLIsExcludedFromBackupKey;
    v21[0] = NSFileProtectionNone;
    v21[1] = &__kCFBooleanTrue;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v21, v20, 2));
    v19 = 0;
    v9 = objc_msgSend(v3, "setResourceValues:error:", v8, &v19);
    v10 = v19;

    if (v9)
    {
      *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_1000776EC();
    }

  }
  else
  {
    v11 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v11)
      sub_100077754(v11, v12, v13, v14, v15, v16, v17, v18);
  }

}

id sub_10004DA80(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "stayAliveThroughHereAtLeast");
}

void sub_10004DAB0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  id v8;

  if (a2)
  {
    v3 = *(_QWORD *)(a1 + 48);
    if (v3)
      (*(void (**)(uint64_t, _QWORD))(v3 + 16))(v3, 0);
  }
  else
  {
    v4 = *(void **)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10004DB78;
    v6[3] = &unk_1000BB3A8;
    v8 = *(id *)(a1 + 48);
    v7 = *(id *)(a1 + 40);
    objc_msgSend(v4, "promptUserForiTunesAccount:accountNameEditable:canCreateNewAccount:assertion:completionBlock:", 0, 1, 1, v5, v6);

  }
}

id sub_10004DB78(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    (*(void (**)(uint64_t, BOOL))(v3 + 16))(v3, a2 == 0);
  return objc_msgSend(*(id *)(a1 + 32), "stayAliveThroughHereAtLeast");
}

void sub_10004DCB8(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    (*(void (**)(void))(v6 + 16))();

}

void sub_10004DD90(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_opt_new(*(_QWORD *)(a1 + 32));
  v2 = (void *)qword_1000EB8E8;
  qword_1000EB8E8 = v1;

}

void sub_10004DDF4(id a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_opt_new(HSCloudClient);
  v2 = (void *)qword_1000EB8F8;
  qword_1000EB8F8 = v1;

}

id sub_10004DF90(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "stayAliveThroughHereAtLeast");
}

void sub_10004E030(uint64_t a1)
{
  void *v2;
  dispatch_queue_global_t global_queue;
  NSObject *v4;
  _QWORD block[4];
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "memberQueueCleanUp");
  v2 = *(void **)(a1 + 40);
  if (v2)
  {
    global_queue = dispatch_get_global_queue(0, 0);
    v4 = objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10004E0C4;
    block[3] = &unk_1000BB4A8;
    v6 = v2;
    dispatch_async(v4, block);

  }
}

uint64_t sub_10004E0C4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_10004EAEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,char a57)
{
  _Block_object_dispose(&a57, 8);
  _Unwind_Resume(a1);
}

id sub_10004EB18()
{
  if (qword_1000EB910 != -1)
    dispatch_once(&qword_1000EB910, &stru_1000BB6A8);
  return (id)qword_1000EB908;
}

uint64_t sub_10004EB58(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_10004EB68(uint64_t a1)
{

}

void sub_10004EB70(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;

  v7 = a2;
  if (objc_msgSend(v7, "persistentIdentifier") == *(id *)(a1 + 40))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }

}

id sub_10004EBDC(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishDownloads:", *(_QWORD *)(a1 + 40));
}

id sub_10004EBE8()
{
  if (qword_1000EB920 != -1)
    dispatch_once(&qword_1000EB920, &stru_1000BB6C8);
  return (id)qword_1000EB918;
}

void sub_10004F48C(uint64_t a1)
{
  void *v2;
  dispatch_queue_global_t global_queue;
  NSObject *v4;

  objc_msgSend(*(id *)(a1 + 32), "memberQueueRereadNonStoreBooksManifest");
  v2 = *(void **)(a1 + 40);
  if (v2)
  {
    global_queue = dispatch_get_global_queue(0, 0);
    v4 = objc_claimAutoreleasedReturnValue(global_queue);
    dispatch_async(v4, v2);

  }
}

void sub_10004F588(uint64_t a1)
{
  void *v2;
  dispatch_queue_global_t global_queue;
  NSObject *v4;

  objc_msgSend(*(id *)(a1 + 32), "memberQueueRereadStoreBooksManifest");
  v2 = *(void **)(a1 + 40);
  if (v2)
  {
    global_queue = dispatch_get_global_queue(0, 0);
    v4 = objc_claimAutoreleasedReturnValue(global_queue);
    dispatch_async(v4, v2);

  }
}

id sub_10004F6BC(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;

  v2 = *(_QWORD *)(a1 + 40);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "memberQueuePersistentIDToNonStoreBook"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "persistentID"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v2, v4);

  return objc_msgSend(*(id *)(a1 + 32), "memberQueueCommitNonStoreBooksManifest");
}

id sub_10004F7EC(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;

  v2 = *(_QWORD *)(a1 + 40);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "memberQueueiTunesStoreIDToStoreBook"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "iTunesStoreID"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v2, v4);

  return objc_msgSend(*(id *)(a1 + 32), "memberQueueCommitStoreBooksManifest");
}

void sub_10004F908(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "memberQueuePersistentIDToNonStoreBook"));
  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40)));

  v3 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setState:", *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 32), "memberQueueCommitNonStoreBooksManifest");
    v3 = v4;
  }

}

void sub_10004FA2C(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "memberQueueiTunesStoreIDToStoreBook"));
  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40)));

  v3 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setState:", *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 32), "memberQueueCommitStoreBooksManifest");
    v3 = v4;
  }

}

void sub_10004FCF0(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;

  v3 = a2;
  if (v3 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_100077890();
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    (*(void (**)(void))(v4 + 16))();

}

uint64_t sub_10004FD4C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_10004FF18(uint64_t a1)
{
  NSMutableArray *v2;
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  unsigned int v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  dispatch_queue_global_t global_queue;
  NSObject *v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  void *v30;
  void *v31;
  __CFString *v32;
  void *v33;
  unsigned int v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  dispatch_queue_global_t v39;
  NSObject *v40;
  id v41;
  void *v42;
  void *v43;
  NSMutableArray *v44;
  _QWORD v45[5];
  NSMutableArray *v46;
  id v47;
  id v48;
  id v49;
  id v50;
  _QWORD block[4];
  id v52;
  id v53;
  id v54;
  id v55;
  _QWORD v56[2];

  v2 = objc_opt_new(NSMutableArray);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "memberQueuePersistentIDToNonStoreBook"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "persistentID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", v4));

  v6 = (__CFString *)*(id *)(a1 + 48);
  if (-[__CFString length](v6, "length"))
  {
    if (v5)
      goto LABEL_3;
LABEL_7:
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[DMDPaths managedNonStoreBooksDirectory](DMDPaths, "managedNonStoreBooksDirectory"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "persistentID"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "MCHashedFilenameWithPrefix:extension:", 0, v6));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "stringByAppendingPathComponent:", v15));
    objc_msgSend(*(id *)(a1 + 40), "setFullPath:", v16);

    objc_msgSend(*(id *)(a1 + 40), "setKind:", v6);
    goto LABEL_14;
  }

  v6 = CFSTR("pdf");
  if (!v5)
    goto LABEL_7;
LABEL_3:
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "kind"));
  v8 = objc_msgSend(v7, "isEqualToString:", v6);

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "fullPath"));
    objc_msgSend(*(id *)(a1 + 40), "setFullPath:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "state"));
    v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("Managed"));

    if (v11)
    {
      objc_msgSend(*(id *)(a1 + 40), "setPreviousVersion:", v5);
      v12 = CFSTR("Updating");
LABEL_15:
      objc_msgSend(*(id *)(a1 + 40), "setState:", v12);
      goto LABEL_16;
    }
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "downloadIdentifier"));

    if (v24)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "downloadIdentifier"));
      -[NSMutableArray addObject:](v2, "addObject:", v25);

    }
LABEL_14:
    v12 = CFSTR("Installing");
    goto LABEL_15;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_100077920(v5, (uint64_t)v6);
  v17 = DMFErrorWithCodeAndUserInfo(2612, 0);
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (v18)
  {
    v19 = (void *)v18;
    global_queue = dispatch_get_global_queue(0, 0);
    v21 = objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100050550;
    block[3] = &unk_1000BB4F8;
    v55 = *(id *)(a1 + 72);
    v52 = v19;
    v53 = *(id *)(a1 + 40);
    v54 = *(id *)(a1 + 56);
    v22 = v19;
    dispatch_async(v21, block);

    v23 = v55;
    goto LABEL_19;
  }
LABEL_16:
  v42 = v5;
  v44 = v2;
  v22 = objc_msgSend(objc_alloc((Class)NSURLRequest), "initWithURL:", *(_QWORD *)(a1 + 64));
  v26 = objc_alloc((Class)SSDownloadMetadata);
  v23 = objc_msgSend(v26, "initWithKind:", SSDownloadKindDocument);
  v27 = objc_msgSend(objc_alloc((Class)SSDownload), "initWithDownloadMetadata:", v23);
  v28 = objc_msgSend(objc_alloc((Class)SSDownloadAsset), "initWithURLRequest:", v22);
  objc_msgSend(v28, "setValue:forProperty:", &off_1000C3540, SSDownloadAssetPropertyAllowedRetryCount);
  objc_msgSend(v28, "setValue:forProperty:", &__kCFBooleanTrue, SSDownloadAssetPropertyIsExternal);
  v29 = SSDownloadAssetTypeMedia;
  objc_msgSend(v28, "setValue:forProperty:", SSDownloadAssetTypeMedia, SSDownloadAssetPropertyType);
  objc_msgSend(v28, "setValue:forProperty:", NSFileProtectionCompleteUntilFirstUserAuthentication, SSDownloadAssetPropertyFileProtectionType);
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "fullPath"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v30));
  objc_msgSend(v28, "setValue:forProperty:", v31, SSDownloadAssetPropertyDestinationURL);

  v56[0] = CFSTR("epub");
  v56[1] = CFSTR("ibooks");
  v32 = v6;
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v56, 2));
  v34 = objc_msgSend(v33, "containsObject:", v32);

  if (v34)
    objc_msgSend(v28, "setValue:forProperty:", &off_1000C3558, SSDownloadAssetPropertyProcessingTypes);
  objc_msgSend(v27, "addAsset:forType:", v28, v29, v42);
  objc_msgSend(v27, "setValue:forProperty:", &__kCFBooleanTrue, SSDownloadPropertyIsSharedResource);
  objc_msgSend(v27, "setValue:forProperty:", &__kCFBooleanTrue, SSDownloadPropertyShouldSuppressErrorDialogs);
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", objc_msgSend(v27, "persistentIdentifier")));
  objc_msgSend(*(id *)(a1 + 40), "setDownloadIdentifier:", v35);

  v36 = *(_QWORD *)(a1 + 40);
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "memberQueuePersistentIDToNonStoreBook"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "persistentID"));
  objc_msgSend(v37, "setObject:forKeyedSubscript:", v36, v38);

  objc_msgSend(*(id *)(a1 + 32), "memberQueueCommitNonStoreBooksManifest");
  v39 = dispatch_get_global_queue(0, 0);
  v40 = objc_claimAutoreleasedReturnValue(v39);
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472;
  v45[2] = sub_1000505B8;
  v45[3] = &unk_1000BB570;
  v45[4] = *(_QWORD *)(a1 + 32);
  v2 = v44;
  v46 = v44;
  v47 = *(id *)(a1 + 40);
  v48 = v27;
  v50 = *(id *)(a1 + 72);
  v49 = *(id *)(a1 + 56);
  v41 = v27;
  dispatch_async(v40, v45);

  v5 = v43;
LABEL_19:

}

id sub_100050550(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 56);
  if (v2)
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(a1 + 40);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "state"));
    (*(void (**)(uint64_t, uint64_t, void *, void *))(v2 + 16))(v2, v3, v4, v5);

  }
  return objc_msgSend(*(id *)(a1 + 48), "stayAliveThroughHereAtLeast");
}

void sub_1000505B8(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100050678;
  v6[3] = &unk_1000BB548;
  v7 = *(id *)(a1 + 48);
  v4 = *(id *)(a1 + 56);
  v5 = *(_QWORD *)(a1 + 32);
  v8 = v4;
  v9 = v5;
  v11 = *(id *)(a1 + 72);
  v10 = *(id *)(a1 + 64);
  objc_msgSend(v2, "cancelNonStoreDownloadsWithDownloadIdentifiers:completionBlock:", v3, v6);

}

void sub_100050678(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint8_t buf[4];
  void *v16;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "friendlyName"));
    *(_DWORD *)buf = 138543362;
    v16 = v2;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Beginning download of book %{public}@", buf, 0xCu);

  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "fullPath"));
  v5 = objc_msgSend(v3, "fileExistsAtPath:", v4);

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "fullPath"));
    objc_msgSend(v3, "removeItemAtPath:error:", v6, 0);

  }
  v7 = sub_10004EB18();
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v14 = *(_QWORD *)(a1 + 40);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v14, 1));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10005084C;
  v10[3] = &unk_1000BB520;
  v10[4] = *(_QWORD *)(a1 + 48);
  v11 = *(id *)(a1 + 32);
  v13 = *(id *)(a1 + 64);
  v12 = *(id *)(a1 + 56);
  objc_msgSend(v8, "addDownloads:completionBlock:", v9, v10);

}

void sub_10005084C(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSErrorUserInfoKey v14;
  id v15;

  v3 = a2;
  if (v3)
  {
    v4 = v3;
    v14 = NSUnderlyingErrorKey;
    v15 = v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1));
    v6 = DMFErrorWithCodeAndUserInfo(2613, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

    v8 = *(void **)(a1 + 32);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "persistentID"));
    objc_msgSend(v8, "setState:forNonStoreBookWithPersistentID:", CFSTR("Failed"), v9);

    v10 = *(_QWORD *)(a1 + 56);
    if (v10)
      (*(void (**)(uint64_t, void *, _QWORD, const __CFString *))(v10 + 16))(v10, v7, *(_QWORD *)(a1 + 40), CFSTR("Failed"));
    objc_msgSend(*(id *)(a1 + 48), "stayAliveThroughHereAtLeast");

  }
  else
  {
    v11 = *(_QWORD *)(a1 + 56);
    if (v11)
    {
      v12 = *(void **)(a1 + 40);
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "state"));
      (*(void (**)(uint64_t, _QWORD, void *, void *))(v11 + 16))(v11, 0, v12, v13);

    }
    objc_msgSend(*(id *)(a1 + 48), "stayAliveThroughHereAtLeast");
  }
}

void sub_100050C38(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  _BOOL8 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  id v33;
  int v34;
  uint8_t buf[4];
  void *v36;
  NSErrorUserInfoKey v37;
  id v38;

  v5 = a2;
  v6 = a3;
  if (!v6)
  {
    if (objc_msgSend(v5, "count"))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", 0));
      if ((objc_msgSend(v11, "isVPPLicensed") & 1) != 0
        || +[DMDManagedMediaManager shouldBypassVPPLicenseCheck](DMDManagedMediaManager, "shouldBypassVPPLicenseCheck"))
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "title"));
          *(_DWORD *)buf = 138543362;
          v36 = v12;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Found book: %{public}@", buf, 0xCu);

        }
        v8 = (void *)objc_opt_new(MDMBook);
        objc_msgSend(v8, "setITunesStoreID:", *(_QWORD *)(a1 + 32));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "title"));
        objc_msgSend(v8, "setTitle:", v13);

        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "author"));
        objc_msgSend(v8, "setAuthor:", v14);

        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "redownloadParameters"));
        objc_msgSend(v8, "setBuyParams:", v15);

        if (v8)
        {
          v16 = *(_QWORD *)(a1 + 56);
          if (v16)
            (*(void (**)(uint64_t, _QWORD, void *))(v16 + 16))(v16, 0, v8);
          goto LABEL_24;
        }
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
          sub_1000779F8();

      }
    }
    if (*(_DWORD *)(a1 + 64))
    {
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472;
      v29[2] = sub_100050F84;
      v29[3] = &unk_1000BB5C0;
      v17 = *(void **)(a1 + 32);
      v30 = *(id *)(a1 + 40);
      v31 = v17;
      v32 = *(id *)(a1 + 48);
      v34 = *(_DWORD *)(a1 + 64);
      v33 = *(id *)(a1 + 56);
      objc_msgSend(v30, "refreshBookPurchaseHistoryCompletion:", v29);

    }
    else
    {
      v18 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v18)
        sub_1000779C0(v18, v19, v20, v21, v22, v23, v24, v25);
      v26 = *(_QWORD *)(a1 + 56);
      if (v26)
      {
        v27 = DMFErrorWithCodeAndUserInfo(2615, 0);
        v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
        (*(void (**)(uint64_t, void *, _QWORD))(v26 + 16))(v26, v28, 0);

      }
    }
    v8 = 0;
    goto LABEL_24;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_100077A6C();
  v7 = *(_QWORD *)(a1 + 56);
  if (v7)
  {
    v37 = NSUnderlyingErrorKey;
    v38 = v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1));
    v9 = DMFErrorWithCodeAndUserInfo(1505, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    (*(void (**)(uint64_t, void *, _QWORD))(v7 + 16))(v7, v10, 0);

LABEL_24:
  }
  objc_msgSend(*(id *)(a1 + 48), "stayAliveThroughHereAtLeast");

}

id sub_100050F84(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "searchBookPurchaseHistoryForiTunesStoreID:assertion:triesLeft:completionBlock:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), (*(_DWORD *)(a1 + 64) - 1), *(_QWORD *)(a1 + 56));
}

id sub_10005125C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = *(_QWORD *)(a1 + 40);
  v3 = DMFErrorWithCodeAndUserInfo(2614, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  (*(void (**)(uint64_t, void *, _QWORD, const __CFString *))(v2 + 16))(v2, v4, 0, CFSTR("Failed"));

  return objc_msgSend(*(id *)(a1 + 32), "stayAliveThroughHereAtLeast");
}

void sub_1000512BC(uint64_t a1, char a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  id v14;
  id v15;

  if ((a2 & 1) != 0)
  {
    v4 = *(_QWORD *)(a1 + 32);
    v3 = *(void **)(a1 + 40);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000513C4;
    v12[3] = &unk_1000BB638;
    v5 = *(_QWORD *)(a1 + 48);
    v6 = *(id *)(a1 + 56);
    v7 = *(_QWORD *)(a1 + 40);
    v8 = *(void **)(a1 + 48);
    v15 = v6;
    v12[4] = v7;
    v13 = v8;
    v14 = *(id *)(a1 + 32);
    objc_msgSend(v3, "searchBookPurchaseHistoryForiTunesStoreID:assertion:completionBlock:", v5, v4, v12);

  }
  else
  {
    v9 = *(_QWORD *)(a1 + 56);
    if (v9)
    {
      v10 = DMFErrorWithCodeAndUserInfo(2608, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      (*(void (**)(uint64_t, void *, _QWORD, const __CFString *))(v9 + 16))(v9, v11, 0, CFSTR("Failed"));

    }
    objc_msgSend(*(id *)(a1 + 32), "stayAliveThroughHereAtLeast");
  }
}

void sub_1000513C4(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void (**v8)(id, id, _QWORD, const __CFString *);
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    v8 = (void (**)(id, id, _QWORD, const __CFString *))a1[7];
    if (v8)
      v8[2](v8, v5, 0, CFSTR("Failed"));
  }
  else
  {
    objc_msgSend(v6, "setState:", CFSTR("Installing"));
    objc_msgSend(a1[4], "setStoreManagedBook:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[BLDownloadQueue sharedInstance](BLDownloadQueue, "sharedInstance"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "buyParams"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[5], "stringValue"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100051518;
    v12[3] = &unk_1000BB610;
    v15 = a1[7];
    v13 = v7;
    v14 = a1[6];
    objc_msgSend(v9, "addDownloadWithPurchaseParameters:storeID:completion:", v10, v11, v12);

  }
  objc_msgSend(a1[6], "stayAliveThroughHereAtLeast");

}

id sub_100051518(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;

  v4 = *(_QWORD *)(a1 + 48);
  if (v4)
  {
    v5 = *(void **)(a1 + 32);
    v6 = a3;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "state"));
    (*(void (**)(uint64_t, id, void *, void *))(v4 + 16))(v4, v6, v5, v7);

  }
  return objc_msgSend(*(id *)(a1 + 40), "stayAliveThroughHereAtLeast");
}

void sub_100051654(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10005166C(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;

  v2 = objc_alloc((Class)NSArray);
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "memberQueueiTunesStoreIDToStoreBook"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allValues"));
  v4 = objc_msgSend(v2, "initWithArray:copyItems:", v3, 1);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

void sub_1000517B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000517D0(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;

  v2 = objc_alloc((Class)NSArray);
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "memberQueuePersistentIDToNonStoreBook"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allValues"));
  v4 = objc_msgSend(v2, "initWithArray:copyItems:", v3, 1);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

id sub_100051C58(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "memberQueueMoveTransientStatesForward");
}

void sub_100051D44(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  dispatch_queue_global_t global_queue;
  NSObject *v8;
  void *v9;
  dispatch_queue_global_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  dispatch_queue_global_t v14;
  NSObject *v15;
  _QWORD block[5];
  id v17;
  id v18;
  id v19;
  id v20;

  objc_msgSend(*(id *)(a1 + 32), "memberQueueCleanUp");
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "memberQueuePersistentIDToNonStoreBook"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40)));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "memberQueuePersistentIDToNonStoreBook"));
    objc_msgSend(v4, "removeObjectForKey:", *(_QWORD *)(a1 + 40));

    objc_msgSend(*(id *)(a1 + 32), "memberQueueCommitNonStoreBooksManifest");
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "downloadIdentifier"));

    if (v6)
    {
      global_queue = dispatch_get_global_queue(0, 0);
      v8 = objc_claimAutoreleasedReturnValue(global_queue);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100051F2C;
      block[3] = &unk_1000BB548;
      block[4] = *(_QWORD *)(a1 + 32);
      v17 = v3;
      v18 = v5;
      v20 = *(id *)(a1 + 56);
      v19 = *(id *)(a1 + 48);
      dispatch_async(v8, block);

    }
    else
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "fullPath"));
      objc_msgSend(v5, "removeItemAtPath:error:", v12, 0);

      v13 = *(void **)(a1 + 56);
      if (v13)
      {
        v14 = dispatch_get_global_queue(0, 0);
        v15 = objc_claimAutoreleasedReturnValue(v14);
        dispatch_async(v15, v13);

      }
      objc_msgSend(*(id *)(a1 + 48), "stayAliveThroughHereAtLeast");
    }

  }
  else
  {
    v9 = *(void **)(a1 + 56);
    if (v9)
    {
      v10 = dispatch_get_global_queue(0, 0);
      v11 = objc_claimAutoreleasedReturnValue(v10);
      dispatch_async(v11, v9);

    }
    objc_msgSend(*(id *)(a1 + 48), "stayAliveThroughHereAtLeast");
  }

}

void sub_100051F2C(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;

  v2 = *(void **)(a1 + 32);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "downloadIdentifier"));
  v10 = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v10, 1));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100052048;
  v5[3] = &unk_1000BA908;
  v6 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 40);
  v9 = *(id *)(a1 + 64);
  v8 = *(id *)(a1 + 56);
  objc_msgSend(v2, "cancelNonStoreDownloadsWithDownloadIdentifiers:completionBlock:", v4, v5);

}

id sub_100052048(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "fullPath"));
  objc_msgSend(v2, "removeItemAtPath:error:", v3, 0);

  v4 = *(_QWORD *)(a1 + 56);
  if (v4)
    (*(void (**)(void))(v4 + 16))();
  return objc_msgSend(*(id *)(a1 + 48), "stayAliveThroughHereAtLeast");
}

id sub_1000521B0(uint64_t a1)
{
  void *v2;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "memberQueueiTunesStoreIDToStoreBook"));
  objc_msgSend(v2, "removeObjectForKey:", *(_QWORD *)(a1 + 40));

  return objc_msgSend(*(id *)(a1 + 32), "memberQueueCommitStoreBooksManifest");
}

uint64_t sub_1000521EC(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void sub_100052334(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[5];
  id v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "finishDownloads:", *(_QWORD *)(a1 + 40));
  +[SSDownloadManager removePersistenceIdentifier:](SSDownloadManager, "removePersistenceIdentifier:", CFSTR("com.apple.mdmd.downloads.media.nonstore"));
  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "memberQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000523F4;
  block[3] = &unk_1000BB2E0;
  block[4] = *(_QWORD *)(a1 + 48);
  v5 = *(id *)(a1 + 64);
  v4 = *(id *)(a1 + 56);
  dispatch_async(v2, block);

}

void sub_1000523F4(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  dispatch_queue_global_t global_queue;
  NSObject *v8;
  uint8_t v9[16];

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Removing managed books.", v9, 2u);
  }
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "memberQueuePersistentIDToNonStoreBook"));
  objc_msgSend(v2, "removeAllObjects");

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[DMDPaths managedNonStoreBooksDirectory](DMDPaths, "managedNonStoreBooksDirectory"));
  objc_msgSend(v3, "removeItemAtPath:error:", v4, 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[DMDPaths managedStoreBooksManifestPath](DMDPaths, "managedStoreBooksManifestPath"));
  objc_msgSend(v3, "removeItemAtPath:error:", v5, 0);

  MCSendManagedBooksChangedNotification();
  v6 = *(void **)(a1 + 48);
  if (v6)
  {
    global_queue = dispatch_get_global_queue(0, 0);
    v8 = objc_claimAutoreleasedReturnValue(global_queue);
    dispatch_async(v8, v6);

  }
  objc_msgSend(*(id *)(a1 + 40), "stayAliveThroughHereAtLeast");

}

void sub_1000525D0(id a1)
{
  void *v1;
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;

  v1 = (void *)objc_opt_new(SSDownloadManagerOptions);
  v5 = SSDownloadKindDocument;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v5, 1));
  objc_msgSend(v1, "setDownloadKinds:", v2);

  objc_msgSend(v1, "setPersistenceIdentifier:", CFSTR("com.apple.mdmd.downloads.media.nonstore"));
  objc_msgSend(v1, "setShouldFilterExternalOriginatedDownloads:", 1);
  v3 = objc_msgSend(objc_alloc((Class)SSDownloadManager), "initWithManagerOptions:", v1);
  v4 = (void *)qword_1000EB908;
  qword_1000EB908 = (uint64_t)v3;

}

void sub_1000526AC(id a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v3[2];

  v3[0] = CFSTR("Failed");
  v3[1] = CFSTR("Unknown");
  v1 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v3, 2));
  v2 = (void *)qword_1000EB918;
  qword_1000EB918 = v1;

}

void sub_100052C9C(id a1)
{
  NSBundle *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v1 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(DMFConnection));
  v4 = (id)objc_claimAutoreleasedReturnValue(v1);
  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("%@ is about to install and manage the app “%@” from the App Store.\nYour iTunes account will not be charged for this app."), &stru_1000BC2E0, CFSTR("DMFNotifications")));
  v3 = (void *)qword_1000EB928;
  qword_1000EB928 = v2;

}

void sub_100052EE0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  id v10;
  uint8_t buf[4];
  uint64_t v12;

  v3 = DMFAppLog(a1, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Start redeeming app with bundle identifier: %{public}@", buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 40), "_setState:", 2);
  v7 = *(void **)(a1 + 48);
  v6 = *(void **)(a1 + 56);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100053008;
  v8[3] = &unk_1000BB710;
  v8[4] = *(_QWORD *)(a1 + 40);
  v9 = v6;
  v10 = *(id *)(a1 + 32);
  objc_msgSend(v7, "startRedeemingAppWithCode:completion:", v9, v8);

}

void sub_100053008(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "_setUnusedRedemptionCode:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "_setState:", 11);
    objc_msgSend(*(id *)(a1 + 32), "_showInstallationFailurePromptIfNeeded");
    objc_msgSend(*(id *)(a1 + 32), "_resetRemovabilityWithBundleIdentifier:", *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 32), "_resetTapToPayScreenLock");
    objc_msgSend(*(id *)(a1 + 32), "endOperationWithError:", v4);
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](DMDAppController, "sharedController"));
    objc_msgSend(v3, "sendManagedAppsChangedNotification");

    objc_msgSend(*(id *)(a1 + 32), "_endOperationWithBundleIdentifier:", *(_QWORD *)(a1 + 48));
  }

}

void sub_1000532AC(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  v7 = a2;
  objc_msgSend(v3, "_setState:", 11);
  objc_msgSend(*(id *)(a1 + 32), "_showInstallationFailurePromptIfNeeded");
  v4 = *(void **)(a1 + 32);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "metadata"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bundleIdentifier"));
  objc_msgSend(v4, "_resetRemovabilityWithBundleIdentifier:", v6);

  objc_msgSend(*(id *)(a1 + 32), "_resetTapToPayScreenLock");
  objc_msgSend(*(id *)(a1 + 32), "endOperationWithError:", v7);

}

void sub_100053344(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  uint8_t buf[4];
  void *v20;

  v2 = *(void **)(a1 + 32);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "removable"));
  objc_msgSend(v2, "_setRemovability:", v3);

  v4 = *(void **)(a1 + 32);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "tapToPayScreenLock"));
  objc_msgSend(v4, "_setTapToPayScreenLock:", v5);

  v8 = DMFAppLog(v6, v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "host"));
    *(_DWORD *)buf = 138543362;
    v20 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Start installing enterprise app with manifest URL from: %{public}@", buf, 0xCu);

  }
  v12 = *(_QWORD *)(a1 + 48);
  v11 = *(void **)(a1 + 56);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000534C0;
  v14[3] = &unk_1000BB520;
  v15 = v11;
  v16 = *(id *)(a1 + 40);
  v13 = *(id *)(a1 + 64);
  v17 = *(_QWORD *)(a1 + 32);
  v18 = v13;
  objc_msgSend(v15, "startInstallingEnterpriseAppWithManifestURL:completion:", v12, v14);

}

void sub_1000534C0(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  if (v9)
  {
    v3 = *(void **)(a1 + 32);
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "personaIdentifier"));
    objc_msgSend(v3, "updateBundleIDPersonaIDMappingForPersonaID:addingBundleID:completionHandler:", v4, 0, 0);

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "_setState:", 6);
    objc_msgSend(*(id *)(a1 + 48), "_applyManagementPiecesForRequest:", *(_QWORD *)(a1 + 40));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](DMDAppController, "sharedController"));
    objc_msgSend(v5, "sendManagedAppsChangedNotification");

    v6 = *(void **)(a1 + 48);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "metadata"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bundleIdentifier"));
    objc_msgSend(v6, "_endOperationWithBundleIdentifier:", v8);

  }
}

void sub_10005359C(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  id v9;

  v2 = *(void **)(a1 + 32);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "personaIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "metadata"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bundleIdentifier"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100053674;
  v7[3] = &unk_1000BB788;
  v6 = *(void **)(a1 + 56);
  v7[4] = *(_QWORD *)(a1 + 48);
  v8 = v6;
  v9 = *(id *)(a1 + 64);
  objc_msgSend(v2, "updateBundleIDPersonaIDMappingForPersonaID:addingBundleID:completionHandler:", v3, v5, v7);

}

void sub_100053674(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSErrorUserInfoKey v12;
  void *v13;

  v3 = a2;
  v5 = v3;
  if (v3)
  {
    v6 = DMFAppLog(v3, v4);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_100077C90();

    v8 = *(_QWORD *)(a1 + 40);
    v12 = NSUnderlyingErrorKey;
    v13 = v5;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1));
    v10 = DMFErrorWithCodeAndUserInfo(1003, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v11);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void sub_100053858(int8x16_t *a1, uint64_t a2)
{
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int8x16_t v7;
  _QWORD v8[4];
  int8x16_t v9;
  uint8_t buf[4];
  uint64_t v11;

  v3 = DMFAppLog(a1, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = a1[2].i64[0];
    *(_DWORD *)buf = 138543362;
    v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Start installing system app with bundle identifier: %{public}@", buf, 0xCu);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](DMDAppController, "sharedController"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100053974;
  v8[3] = &unk_1000B9B40;
  v7 = a1[2];
  v9 = vextq_s8(v7, v7, 8uLL);
  objc_msgSend(v6, "installSystemAppWithBundleIdentifier:completion:", (id)v7.i64[0], v8);

}

void sub_100053974(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = v3;
  if (v3)
  {
    objc_msgSend(v4, "_showInstallationFailurePromptIfNeeded");
    objc_msgSend(*(id *)(a1 + 32), "endOperationWithError:", v5);
  }
  else
  {
    objc_msgSend(v4, "_endOperationWithBundleIdentifier:", *(_QWORD *)(a1 + 40));
  }

}

void sub_100053BC0(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  _BOOL4 v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  void *v28;
  unsigned __int8 v29;
  void *v30;
  void *v31;
  unsigned __int8 v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  uint64_t v37;
  uint64_t v38;
  NSObject *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
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
  uint64_t v64;
  void *v65;
  void **v66;
  uint64_t v67;
  void (*v68)(uint64_t, void *);
  void *v69;
  id v70;
  _QWORD v71[4];
  id v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  void *v76;
  uint8_t buf[4];
  uint64_t v78;
  __int16 v79;
  void *v80;
  __int16 v81;
  id v82;

  v5 = a3;
  v7 = DMFAppLog(v5, v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(_QWORD *)(a1 + 32);
    v10 = objc_msgSend((id)objc_opt_class(*(_QWORD *)(a1 + 40)), "descriptionForChangeType:", a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    *(_DWORD *)buf = 138543874;
    v78 = v9;
    v79 = 2114;
    v80 = v11;
    v81 = 2114;
    v82 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "SINF swap attempt complete for %{public}@, change type = %{public}@, error = %{public}@", buf, 0x20u);

  }
  if (a2 == 4)
  {
    v16 = DMFAppLog(v12, v13);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v78 = v18;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Attempting to re-download of device-licensed app: %{public}@", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 40), "_redownloadDeviceAppForRequest:", *(_QWORD *)(a1 + 48));
  }
  else
  {
    if (a2)
    {
      v15 = 1;
    }
    else
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "domain"));
      if (objc_msgSend(v14, "isEqualToString:", ASDServerErrorDomain))
        v15 = objc_msgSend(v5, "code") != (id)9610;
      else
        v15 = 1;

    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "metadata"));
    v20 = objc_msgSend(v19, "isUserLicensed");

    if (v20 && v15)
    {
      v23 = DMFAppLog(v21, v22);
      v24 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        v25 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543362;
        v78 = v25;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Attempting to re-download a user-licensed app where we know the license exists: %{public}@", buf, 0xCu);
      }

      objc_msgSend(*(id *)(a1 + 40), "_redownloadUserAppForRequest:", *(_QWORD *)(a1 + 48));
    }
    else
    {
      v26 = objc_msgSend(*(id *)(a1 + 48), "allowFreePurchases");
      if ((v26 & 1) != 0)
      {
        v28 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](DMDAppController, "sharedController"));
        v29 = objc_msgSend(v28, "userIsSignedIn");
        v30 = *(void **)(a1 + 40);
        if ((v29 & 1) != 0)
        {
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "metadata"));
          v32 = objc_msgSend(v31, "isFree");

          if ((v32 & 1) != 0)
          {
            v35 = DMFAppLog(v33, v34);
            v36 = objc_claimAutoreleasedReturnValue(v35);
            if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
            {
              v37 = *(_QWORD *)(a1 + 32);
              *(_DWORD *)buf = 138543362;
              v78 = v37;
              _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Attempting to purchase free app: %{public}@", buf, 0xCu);
            }

            objc_msgSend(*(id *)(a1 + 40), "_purchaseFreeAppForRequest:", *(_QWORD *)(a1 + 48));
          }
          else
          {
            objc_msgSend(*(id *)(a1 + 40), "_setState:", 1);
            objc_msgSend(*(id *)(a1 + 40), "_applyManagementPiecesForRequest:", *(_QWORD *)(a1 + 48));
            v51 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](DMDAppController, "sharedController"));
            v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "removable"));
            v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "metadata"));
            v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "bundleIdentifier"));
            v71[0] = _NSConcreteStackBlock;
            v71[1] = 3221225472;
            v71[2] = sub_100054148;
            v71[3] = &unk_1000BAD98;
            v72 = *(id *)(a1 + 48);
            objc_msgSend(v51, "setRemovability:forBundleIdentifier:completion:", v52, v54, v71);

            v55 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](DMDAppController, "sharedController"));
            v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "tapToPayScreenLock"));
            v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "metadata"));
            v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "bundleIdentifier"));
            v66 = _NSConcreteStackBlock;
            v67 = 3221225472;
            v68 = sub_1000541AC;
            v69 = &unk_1000BAD98;
            v70 = *(id *)(a1 + 48);
            objc_msgSend(v55, "setTapToPayScreenLock:forBundleIdentifier:completion:", v56, v58, &v66);

            v59 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](DMDAppController, "sharedController", v66, v67, v68, v69));
            objc_msgSend(v59, "sendManagedAppsChangedNotification");

            v60 = *(void **)(a1 + 40);
            v73 = DMFBundleIdentifierErrorKey;
            v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "metadata"));
            v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "bundleIdentifier"));
            v74 = v62;
            v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v74, &v73, 1));
            v64 = DMFErrorWithCodeAndUserInfo(1001, v63);
            v65 = (void *)objc_claimAutoreleasedReturnValue(v64);
            objc_msgSend(v60, "endOperationWithError:", v65);

          }
        }
        else
        {
          objc_msgSend(v30, "_promptToSignInAndInstallAppForRequest:", *(_QWORD *)(a1 + 48));
        }
      }
      else
      {
        v38 = DMFAppLog(v26, v27);
        v39 = objc_claimAutoreleasedReturnValue(v38);
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
          sub_100077D1C(a1, v39, v40, v41, v42, v43, v44, v45);

        v46 = *(void **)(a1 + 40);
        v75 = DMFBundleIdentifierErrorKey;
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "metadata"));
        v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "bundleIdentifier"));
        v76 = v47;
        v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v76, &v75, 1));
        v49 = DMFErrorWithCodeAndUserInfo(2605, v48);
        v50 = (void *)objc_claimAutoreleasedReturnValue(v49);
        objc_msgSend(v46, "endOperationWithError:", v50);

      }
    }
  }

}

void sub_100054148(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;

  v2 = a2;
  v4 = v2;
  if (v2)
  {
    v5 = DMFAppLog(v2, v3);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_100077D84();

  }
}

void sub_1000541AC(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;

  v2 = a2;
  v4 = v2;
  if (v2)
  {
    v5 = DMFAppLog(v2, v3);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_100077E00();

  }
}

void sub_1000543B4(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void (*v10)(void);

  v5 = a4;
  v7 = v5;
  if (v5)
  {
    v8 = DMFAppLog(v5, v6);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_100077E7C();

    v10 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    v10 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  v10();

}

void sub_100054604(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "_setState:", 11);
  objc_msgSend(*(id *)(a1 + 32), "_showInstallationFailurePromptIfNeeded");
  objc_msgSend(*(id *)(a1 + 32), "endOperationWithError:", v4);

}

void sub_100054658(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  __int16 v30;
  id v31;

  v6 = a2;
  v7 = a4;
  v9 = DMFAppLog(v7, v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "metadata"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bundleIdentifier"));
    v28 = 138543618;
    v29 = v12;
    v30 = 2114;
    v31 = v6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "appstored response for: %{public}@, metadata=%{public}@", (uint8_t *)&v28, 0x16u);

  }
  if (v7)
  {
    v15 = DMFAppLog(v13, v14);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "metadata"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "bundleIdentifier"));
      v28 = 138543618;
      v29 = v18;
      v30 = 2114;
      v31 = v7;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Error getting app: %{public}@, %{public}@", (uint8_t *)&v28, 0x16u);

    }
    v19 = *(void **)(a1 + 40);
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "personaIdentifier"));
    objc_msgSend(v19, "updateBundleIDPersonaIDMappingForPersonaID:addingBundleID:completionHandler:", v20, 0, 0);

    v21 = *(void **)(a1 + 32);
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "metadata"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "bundleIdentifier"));
    objc_msgSend(v21, "_resetRemovabilityWithBundleIdentifier:", v23);

    objc_msgSend(*(id *)(a1 + 32), "_resetTapToPayScreenLock");
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_setState:", 6);
    objc_msgSend(*(id *)(a1 + 32), "_applyManagementPiecesForRequest:", *(_QWORD *)(a1 + 48));
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](DMDAppController, "sharedController"));
    objc_msgSend(v24, "sendManagedAppsChangedNotification");

    v25 = *(void **)(a1 + 32);
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "metadata"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "bundleIdentifier"));
    objc_msgSend(v25, "_endOperationWithBundleIdentifier:", v27);

  }
}

void sub_1000548B8(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;

  v2 = *(void **)(a1 + 32);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "personaIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "metadata"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bundleIdentifier"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000549BC;
  v10[3] = &unk_1000BB828;
  v6 = *(void **)(a1 + 56);
  v10[4] = *(_QWORD *)(a1 + 48);
  v13 = v6;
  v11 = *(id *)(a1 + 40);
  v7 = *(id *)(a1 + 32);
  v9 = *(void **)(a1 + 64);
  v8 = *(_QWORD *)(a1 + 72);
  v12 = v7;
  v15 = v8;
  v14 = v9;
  objc_msgSend(v2, "updateBundleIDPersonaIDMappingForPersonaID:addingBundleID:completionHandler:", v3, v5, v10);

}

void sub_1000549BC(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  int v24;
  void *v25;
  NSErrorUserInfoKey v26;
  void *v27;

  v3 = a2;
  v5 = v3;
  if (v3)
  {
    v6 = DMFAppLog(v3, v4);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_100077C90();

    v8 = *(_QWORD *)(a1 + 56);
    v26 = NSUnderlyingErrorKey;
    v27 = v5;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1));
    v10 = DMFErrorWithCodeAndUserInfo(1003, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v11);
  }
  else
  {
    v12 = *(void **)(a1 + 32);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "removable"));
    objc_msgSend(v12, "_setRemovability:", v13);

    v14 = *(void **)(a1 + 32);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "tapToPayScreenLock"));
    objc_msgSend(v14, "_setTapToPayScreenLock:", v15);

    v18 = DMFAppLog(v16, v17);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "personaIdentifier"));
      v24 = 138543362;
      v25 = v20;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "_downloadStoreAppForRequest persona:%{public}@", (uint8_t *)&v24, 0xCu);

    }
    v21 = *(void **)(a1 + 32);
    v22 = *(id *)(a1 + 48);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "metadata"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "storeItemIdentifier"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "personaIdentifier"));
    objc_msgSend(v22, "sendAppRequestWithBundleIdentifier:storeItemIdentifier:personaIdentifier:type:skipDownloads:completion:", 0, v11, v23, *(_QWORD *)(a1 + 72), 0, *(_QWORD *)(a1 + 64));

  }
}

uint64_t sub_10005525C(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_setState:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "metadata"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "lifeCycle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](DMDAppController, "sharedController"));
  objc_msgSend(v3, "addObserver:", v4);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

id sub_1000552DC(uint64_t a1, uint64_t a2)
{
  if (a2 == 1)
    return (id)(*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "_setState:", 10);
  return objc_msgSend(*(id *)(a1 + 32), "endOperationWithDMFErrorCode:", 1000);
}

id sub_100055594(uint64_t a1, uint64_t a2)
{
  void *v3;

  v3 = *(void **)(a1 + 32);
  if (a2 == 1)
    return objc_msgSend(v3, "_showStorePromptToSignInAndInstallAppForRequest:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v3, "_setState:", 10);
  return objc_msgSend(*(id *)(a1 + 32), "endOperationWithDMFErrorCode:", 1000);
}

void sub_1000556CC(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  id v11;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "_setState:", 11);
    objc_msgSend(*(id *)(a1 + 32), "endOperationWithError:", v6);
  }
  else if (v5)
  {
    v8 = *(void **)(a1 + 40);
    v7 = *(void **)(a1 + 48);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000557BC;
    v9[3] = &unk_1000BB8C8;
    v9[4] = *(_QWORD *)(a1 + 32);
    v10 = 0;
    v11 = v7;
    objc_msgSend(v8, "getMetadataForAppRequest:completion:", v7, v9);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_setState:", 11);
    objc_msgSend(*(id *)(a1 + 32), "endOperationWithDMFErrorCode:", 2608);
  }

}

id sub_1000557BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;

  v4 = *(void **)(a1 + 32);
  if (a3)
  {
    objc_msgSend(v4, "_setState:", 11);
    return objc_msgSend(*(id *)(a1 + 32), "endOperationWithError:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    objc_msgSend(v4, "setMetadata:", a2);
    return objc_msgSend(*(id *)(a1 + 32), "_installStoreAppForRequest:", *(_QWORD *)(a1 + 48));
  }
}

id sub_100055C28(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setRedemptionCode:", *(_QWORD *)(a1 + 32));
}

id sub_100055D60(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setUnusedRedemptionCode:", *(_QWORD *)(a1 + 32));
}

void sub_100056098(id a1, NSError *a2)
{
  NSError *v2;
  uint64_t v3;
  NSError *v4;
  uint64_t v5;
  NSObject *v6;

  v2 = a2;
  v4 = v2;
  if (v2)
  {
    v5 = DMFAppLog(v2, v3);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_100078074();

  }
}

void sub_100056164(id a1, NSError *a2)
{
  NSError *v2;
  uint64_t v3;
  NSError *v4;
  uint64_t v5;
  NSObject *v6;

  v2 = a2;
  v4 = v2;
  if (v2)
  {
    v5 = DMFAppLog(v2, v3);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_1000780D4();

  }
}

void sub_100056280(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;

  v3 = a2;
  v5 = v3;
  if (v3)
  {
    v6 = DMFAppLog(v3, v4);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_100078134(a1);

  }
}

void sub_1000563AC(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;

  v3 = a2;
  v5 = v3;
  if (v3)
  {
    v6 = DMFAppLog(v3, v4);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1000781A8(a1);

  }
}

uint64_t sub_100056428(uint64_t a1)
{
  return *(_QWORD *)(a1 + 32);
}

void sub_1000565B4(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a2;
  v8 = v5;
  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "endOperationWithError:", a3);
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bundleIdentifier"));

    v7 = *(void **)(a1 + 32);
    if (v6)
    {
      objc_msgSend(v7, "setMetadata:", v8);
      objc_msgSend(*(id *)(a1 + 32), "_runWithRequest:", *(_QWORD *)(a1 + 40));
    }
    else
    {
      objc_msgSend(v7, "endOperationWithDMFErrorCode:", 2606);
    }
  }

}

void sub_1000568A4(uint64_t a1, uint64_t a2)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  uint64_t v20;

  if (a2)
  {
    v4 = objc_msgSend(*(id *)(a1 + 40), "_setState:forBundleIdentifier:", 18, *(_QWORD *)(a1 + 48));
    v6 = DMFAppLog(v4, v5);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    v8 = v7;
    if (a2 == 2)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        sub_10007821C(a1, v8, v9, v10, v11, v12, v13, v14);
    }
    else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v18 = *(_QWORD *)(a1 + 32);
      v19 = 138543362;
      v20 = v18;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Request to manage app %{public}@ denied.", (uint8_t *)&v19, 0xCu);
    }

  }
  else
  {
    v15 = DMFAppLog(a1, 0);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = *(_QWORD *)(a1 + 32);
      v19 = 138543362;
      v20 = v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Request to manage app %{public}@ approved by user.", (uint8_t *)&v19, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 40), "_manageApp");
  }
}

uint64_t sub_100056AF4(uint64_t a1, uint64_t a2)
{
  uint64_t (*v3)(void);

  if (a2 == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "recordNewPrompt");
    objc_msgSend(*(id *)(a1 + 32), "writeTimestampsToFile");
    goto LABEL_5;
  }
  if (a2)
  {
LABEL_5:
    v3 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16);
    return v3();
  }
  v3 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  return v3();
}

uint64_t sub_100056DAC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_100057184(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;

  v3 = DMFAppLog(a1, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "personaIdentifier"));
    v7 = 138543618;
    v8 = v5;
    v9 = 2114;
    v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Associating app %{public}@ with persona %{public}@ in UserManagement", (uint8_t *)&v7, 0x16u);

  }
}

void sub_1000573CC(id a1, NSDictionary *a2, int64_t a3, NSError *a4)
{
  NSError *v4;
  uint64_t v5;
  NSError *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v4 = a4;
  v6 = v4;
  if (v4)
  {
    v7 = DMFAppLog(v4, v5);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_100078334((uint64_t)v6, v8, v9, v10, v11, v12, v13, v14);

  }
}

void sub_100057574(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;

  v2 = a2;
  v4 = v2;
  if (v2)
  {
    v5 = DMFAppLog(v2, v3);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_100078398();

  }
}

void sub_1000576A0(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;

  v2 = a2;
  v4 = v2;
  if (v2)
  {
    v5 = DMFAppLog(v2, v3);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_100078404();

  }
}

void sub_100057C58(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BOOL8 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;

  v1 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_systemGroupContainerPathWithGroupIdentifier:", CFSTR("systemgroup.com.apple.configurationprofiles")));
  v2 = (void *)qword_1000EB938;
  qword_1000EB938 = v1;

  if (qword_1000EB938)
  {
    if ((objc_msgSend((id)qword_1000EB938, "isEqualToString:", CFSTR("/private/var/containers/Shared/SystemGroup/systemgroup.com.apple.configurationprofiles")) & 1) != 0)return;
    v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3)
      sub_1000784A8(v3, v4, v5, v6, v7, v8, v9, v10);
  }
  else
  {
    v11 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v11)
      sub_100078470(v11, v12, v13, v14, v15, v16, v17, v18);
  }
  v19 = (void *)qword_1000EB938;
  qword_1000EB938 = (uint64_t)CFSTR("/private/var/containers/Shared/SystemGroup/systemgroup.com.apple.configurationprofiles");

}

void sub_100057D74(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_systemProfileStorageDirectory"));
  v1 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("ManagementPromptPolicy.plist")));
  v2 = (void *)qword_1000EB948;
  qword_1000EB948 = v1;

}

void sub_100057E34(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_systemProfileStorageDirectory"));
  v1 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("MDMAppManagement.plist")));
  v2 = (void *)qword_1000EB958;
  qword_1000EB958 = v1;

}

void sub_100057EF4(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "purchasedBooksDirectory"));
  v1 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("Purchases.plist")));
  v2 = (void *)qword_1000EB968;
  qword_1000EB968 = v1;

}

void sub_100057FB4(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_userDirectory"));
  v1 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("/Media/Books/Purchases")));
  v2 = (void *)qword_1000EB978;
  qword_1000EB978 = v1;

}

void sub_100058074(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_systemProfileStorageDirectory"));
  v1 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("ManagedBooks.plist")));
  v2 = (void *)qword_1000EB988;
  qword_1000EB988 = v1;

}

void sub_100058134(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_managedNonStoreBooksSystemGroupContainer"));
  v1 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("Library")));
  v2 = (void *)qword_1000EB998;
  qword_1000EB998 = v1;

}

void sub_1000581F4(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "managedNonStoreBooksDirectory"));
  v1 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("Managed.plist")));
  v2 = (void *)qword_1000EB9A8;
  qword_1000EB9A8 = v1;

}

void sub_1000582B4(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_systemProfileStorageDirectory"));
  v1 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("LostModeRequest.plist")));
  v2 = (void *)qword_1000EB9B8;
  qword_1000EB9B8 = v1;

}

void sub_100058374(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_systemProfileStorageDirectory"));
  v1 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("MDM.plist")));
  v2 = (void *)qword_1000EB9C8;
  qword_1000EB9C8 = v1;

}

void sub_100058440(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_systemProfileLibraryDirectory"));
  v1 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("ConfigurationProfiles")));
  v2 = (void *)qword_1000EB9D8;
  qword_1000EB9D8 = v1;

}

void sub_100058500(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "configurationProfilesSystemGroupContainer"));
  v1 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("Library")));
  v2 = (void *)qword_1000EB9E8;
  qword_1000EB9E8 = v1;

}

void sub_1000587AC(id a1)
{
  CATOperationQueue *v1;
  void *v2;

  v1 = objc_opt_new(CATOperationQueue);
  v2 = (void *)qword_1000EBA00;
  qword_1000EBA00 = (uint64_t)v1;

}

uint64_t sub_100058DBC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_10005A308(id a1)
{
  DMDSecureUnarchiveFromPayloadMetadataDataTransformer *v1;

  v1 = objc_opt_new(DMDSecureUnarchiveFromPayloadMetadataDataTransformer);
  +[DMDSecureUnarchiveFromPayloadMetadataDataTransformer setValueTransformer:forName:](DMDSecureUnarchiveFromPayloadMetadataDataTransformer, "setValueTransformer:forName:", v1, CFSTR("DMDSecureUnarchiveFromPayloadMetadataDataTransformer"));

}

void sub_10005A394(id a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;

  v3 = objc_opt_class(NSObject);
  v1 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v3, 1));
  v2 = (void *)qword_1000EBA18;
  qword_1000EBA18 = v1;

}

void sub_10005A450(id a1)
{
  DMDPersonalHotspotManager *v1;
  void *v2;

  v1 = objc_opt_new(DMDPersonalHotspotManager);
  v2 = (void *)qword_1000EBA28;
  qword_1000EBA28 = (uint64_t)v1;

}

void sub_10005A8F0(uint64_t a1, void *a2)
{
  id v3;
  dispatch_queue_global_t global_queue;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD block[4];
  id v10;
  uint64_t v11;
  id v12;

  v3 = a2;
  global_queue = dispatch_get_global_queue(0, 0);
  v5 = objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005A9A0;
  block[3] = &unk_1000B9BD0;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(a1 + 40);
  v10 = v3;
  v11 = v6;
  v12 = v7;
  v8 = v3;
  dispatch_async(v5, block);

}

id sub_10005A9A0(uint64_t a1)
{
  uint64_t *v2;

  v2 = (uint64_t *)(a1 + 32);
  if (*(_QWORD *)(a1 + 32))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_10007883C(v2);
    objc_msgSend(*(id *)(a1 + 40), "endOperationWithDMFErrorCode:", 3200);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "endOperationWithResultObject:", 0);
  }
  return objc_msgSend(*(id *)(a1 + 48), "stayAliveThroughHereAtLeast");
}

uint64_t sub_10005AD6C(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_10005AD7C(uint64_t a1)
{

}

void sub_10005AD84(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  unsigned __int8 v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  id v29;
  NSErrorUserInfoKey v30;
  void *v31;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "domain"));
    if (-[NSObject isEqualToString:](v8, "isEqualToString:", NSCocoaErrorDomain)
      && objc_msgSend(v7, "code") == (id)256)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "userInfo"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", NSSQLiteErrorDomain));
      v11 = objc_msgSend(v10, "isEqualToNumber:", &off_1000C3570);

      if (!v11)
      {
LABEL_8:
        v13 = DMFPolicyLog();
        v14 = objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          sub_100078940();

        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "userInfo"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", NSLocalizedDescriptionKey));

        if (v16)
        {
          v30 = NSLocalizedDescriptionKey;
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "userInfo"));
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", NSLocalizedDescriptionKey));
          v31 = v18;
          v19 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1));

        }
        else
        {
          v19 = 0;
        }
        v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "domain"));
        v26 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v25, objc_msgSend(v7, "code"), v19));
        v27 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v28 = *(void **)(v27 + 40);
        *(_QWORD *)(v27 + 40) = v26;

LABEL_17:
        goto LABEL_18;
      }
      v12 = DMFPolicyLog();
      v8 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        sub_1000789A4(v8);
    }

    goto LABEL_8;
  }
  objc_msgSend(*(id *)(a1 + 32), "setIsPersistentContainerLoaded:", 1);
  v20 = objc_msgSend(*(id *)(a1 + 40), "newBackgroundContext");
  objc_msgSend(*(id *)(a1 + 32), "setInternalContext:", v20);

  v21 = objc_msgSend(*(id *)(a1 + 40), "newBackgroundContext");
  objc_msgSend(*(id *)(a1 + 32), "setRegistrationContext:", v21);

  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "URL"));
  v29 = 0;
  v23 = objc_msgSend(v22, "setResourceValue:forKey:error:", 0, NSURLIsExcludedFromBackupKey, &v29);
  v19 = v29;

  if ((v23 & 1) == 0)
  {
    v24 = DMFPolicyLog();
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      sub_1000788BC((uint64_t)v5, v19);
    goto LABEL_17;
  }
LABEL_18:

}

void sub_10005B4D0(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSPredicate *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  void *i;
  uint64_t v24;
  id v25;
  id v26;
  uint64_t v27;
  void *j;
  void *v29;
  void *v30;
  unsigned int v31;
  int v32;
  uint64_t v33;
  NSObject *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  id v38;
  id v39;
  id v40;
  char v41;
  uint64_t v42;
  void *k;
  unsigned int v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  NSObject *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  id obj;
  id v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  id v62;
  id v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  id v76;
  _BYTE v77[128];
  _BYTE v78[128];
  _BYTE v79[128];
  NSErrorUserInfoKey v80;
  void *v81;

  v5 = a2;
  v6 = a3;
  v9 = v6;
  if (v6)
  {
    v10 = DMFPolicyLog(v6, v7, v8);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_100078AE0(v9);

    v12 = *(_QWORD *)(a1 + 72);
    v80 = NSUnderlyingErrorKey;
    v81 = v9;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v81, &v80, 1));
    v14 = DMFErrorWithCodeAndUserInfo(3901, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v15);
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[DMDEffectivePolicy fetchRequest](DMDEffectivePolicy, "fetchRequest"));
    if (objc_msgSend(*(id *)(a1 + 32), "count"))
      v16 = +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("(%K IN %@) AND (%K == %@) AND (%K == %@)"), CFSTR("identifier"), *(_QWORD *)(a1 + 32), CFSTR("organizationIdentifier"), *(_QWORD *)(a1 + 40), CFSTR("declarationIdentifier"), *(_QWORD *)(a1 + 48));
    else
      v16 = +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("(%K == nil) AND (%K == %@) AND (%K == %@)"), CFSTR("identifier"), CFSTR("organizationIdentifier"), *(_QWORD *)(a1 + 40), CFSTR("declarationIdentifier"), *(_QWORD *)(a1 + 48), v54);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    objc_msgSend(v13, "setPredicate:", v17);

    v76 = 0;
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "execute:", &v76));
    v19 = v76;
    v15 = v19;
    if (v18)
    {
      v59 = v18;
      if (objc_msgSend(*(id *)(a1 + 32), "count"))
      {
        v74 = 0u;
        v75 = 0u;
        v72 = 0u;
        v73 = 0u;
        obj = *(id *)(a1 + 32);
        v62 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v72, v79, 16);
        if (v62)
        {
          v55 = v15;
          v56 = v13;
          v22 = 0;
          v60 = *(_QWORD *)v73;
          v61 = a1;
          v58 = v5;
          do
          {
            for (i = 0; i != v62; i = (char *)i + 1)
            {
              if (*(_QWORD *)v73 != v60)
                objc_enumerationMutation(obj);
              v24 = *(_QWORD *)(*((_QWORD *)&v72 + 1) + 8 * (_QWORD)i);
              v68 = 0u;
              v69 = 0u;
              v70 = 0u;
              v71 = 0u;
              v25 = v18;
              v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v68, v78, 16);
              if (v26)
              {
                v27 = *(_QWORD *)v69;
                while (2)
                {
                  for (j = 0; j != v26; j = (char *)j + 1)
                  {
                    if (*(_QWORD *)v69 != v27)
                      objc_enumerationMutation(v25);
                    v29 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * (_QWORD)j);
                    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "identifier"));
                    v31 = objc_msgSend(v30, "isEqual:", v24);

                    if (v31)
                    {
                      v26 = v29;
                      goto LABEL_25;
                    }
                  }
                  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v68, v78, 16);
                  if (v26)
                    continue;
                  break;
                }
LABEL_25:
                v5 = v58;
                v18 = v59;
              }

              a1 = v61;
              if (objc_msgSend(*(id *)(v61 + 56), "_upsertPolicy:forType:identifier:priority:organizationIdentifier:declarationIdentifier:policyToUpdate:managedObjectContext:", *(_QWORD *)(v61 + 80), *(_QWORD *)(v61 + 64), v24, *(_QWORD *)(v61 + 88), *(_QWORD *)(v61 + 40), *(_QWORD *)(v61 + 48), v26, v5))v22 = 1;

            }
            v62 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v72, v79, 16);
          }
          while (v62);
          v32 = v22 & 1;
          v13 = v56;
          v9 = 0;
          v15 = v55;
        }
        else
        {
          v32 = 0;
        }

      }
      else if (objc_msgSend(v18, "count"))
      {
        v66 = 0u;
        v67 = 0u;
        v64 = 0u;
        v65 = 0u;
        v38 = v18;
        v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v64, v77, 16);
        if (v39)
        {
          v40 = v39;
          v41 = 0;
          v42 = *(_QWORD *)v65;
          do
          {
            for (k = 0; k != v40; k = (char *)k + 1)
            {
              if (*(_QWORD *)v65 != v42)
                objc_enumerationMutation(v38);
              if (objc_msgSend(*(id *)(a1 + 56), "_upsertPolicy:forType:identifier:priority:organizationIdentifier:declarationIdentifier:policyToUpdate:managedObjectContext:", *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 64), 0, *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * (_QWORD)k), v5))v41 = 1;
            }
            v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v64, v77, 16);
          }
          while (v40);
          v32 = v41 & 1;
        }
        else
        {
          v32 = 0;
        }

        v18 = v59;
      }
      else
      {
        v32 = objc_msgSend(*(id *)(a1 + 56), "_upsertPolicy:forType:identifier:priority:organizationIdentifier:declarationIdentifier:policyToUpdate:managedObjectContext:", *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 64), 0, *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0, v5);
      }
      v63 = v15;
      v44 = objc_msgSend(v5, "save:", &v63);
      v45 = v63;

      if (v44)
      {
        if (v32)
          objc_msgSend(*(id *)(a1 + 56), "_notifyClientsRegisteredForPolicyType:", *(_QWORD *)(a1 + 64));
        (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
      }
      else
      {
        v49 = DMFPolicyLog(v46, v47, v48);
        v50 = objc_claimAutoreleasedReturnValue(v49);
        if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
          sub_100078C44(v45);

        v51 = *(_QWORD *)(a1 + 72);
        v52 = DMFErrorWithCodeAndUserInfo(3901, 0);
        v53 = (void *)objc_claimAutoreleasedReturnValue(v52);
        (*(void (**)(uint64_t, void *))(v51 + 16))(v51, v53);

      }
      v15 = v45;
    }
    else
    {
      v33 = DMFPolicyLog(v19, v20, v21);
      v34 = objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        sub_100078BCC(v15);

      v35 = *(_QWORD *)(a1 + 72);
      v36 = DMFErrorWithCodeAndUserInfo(3900, 0);
      v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
      (*(void (**)(uint64_t, void *))(v35 + 16))(v35, v37);

    }
  }

}

void sub_10005BD1C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  void *i;
  void *v26;
  void *v27;
  unsigned int v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  id v36;
  id v37;
  uint64_t v38;
  void *j;
  uint64_t v40;
  NSObject *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  NSObject *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  id v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  id v64;
  uint8_t buf[4];
  void *v66;
  __int16 v67;
  uint64_t v68;
  __int16 v69;
  void *v70;
  _BYTE v71[128];
  _BYTE v72[128];
  NSErrorUserInfoKey v73;
  void *v74;

  v5 = a2;
  v6 = a3;
  v9 = v6;
  if (v6)
  {
    v10 = DMFPolicyLog(v6, v7, v8);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_100078AE0(v9);

    v12 = *(_QWORD *)(a1 + 56);
    v73 = NSUnderlyingErrorKey;
    v74 = v9;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v74, &v73, 1));
    v14 = DMFErrorWithCodeAndUserInfo(3901, v13);
    v15 = (id)objc_claimAutoreleasedReturnValue(v14);
    (*(void (**)(uint64_t, id))(v12 + 16))(v12, v15);
  }
  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[DMDEffectivePolicy fetchRequest](DMDEffectivePolicy, "fetchRequest"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("(%K == %@) AND (%K == %@)"), CFSTR("organizationIdentifier"), *(_QWORD *)(a1 + 32), CFSTR("declarationIdentifier"), *(_QWORD *)(a1 + 40)));
    objc_msgSend(v16, "setPredicate:", v17);

    v64 = 0;
    v54 = v16;
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "execute:", &v64));
    v19 = v64;
    v20 = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithCapacity:", objc_msgSend(v18, "count"));
    v60 = 0u;
    v61 = 0u;
    v62 = 0u;
    v63 = 0u;
    v21 = v18;
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v60, v72, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v61;
      do
      {
        for (i = 0; i != v23; i = (char *)i + 1)
        {
          if (*(_QWORD *)v61 != v24)
            objc_enumerationMutation(v21);
          v26 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * (_QWORD)i);
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "type"));
          objc_msgSend(v20, "addObject:", v27);

          objc_msgSend(v5, "deleteObject:", v26);
        }
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v60, v72, 16);
      }
      while (v23);
    }

    v59 = v19;
    v28 = objc_msgSend(v5, "save:", &v59);
    v15 = v59;

    if (v28)
    {
      v32 = objc_msgSend(v21, "count");
      if (v32)
      {
        v57 = 0u;
        v58 = 0u;
        v55 = 0u;
        v56 = 0u;
        v35 = v20;
        v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v55, v71, 16);
        if (v36)
        {
          v37 = v36;
          v38 = *(_QWORD *)v56;
          do
          {
            for (j = 0; j != v37; j = (char *)j + 1)
            {
              if (*(_QWORD *)v56 != v38)
                objc_enumerationMutation(v35);
              objc_msgSend(*(id *)(a1 + 48), "_notifyClientsRegisteredForPolicyType:", *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * (_QWORD)j));
            }
            v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v55, v71, 16);
          }
          while (v37);
        }

      }
      v40 = DMFPolicyLog(v32, v33, v34);
      v41 = objc_claimAutoreleasedReturnValue(v40);
      v9 = 0;
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "allObjects"));
        v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "componentsJoinedByString:", CFSTR(",")));
        v44 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        v66 = v43;
        v67 = 2114;
        v68 = v44;
        _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "Successfully removed policy types %{public}@ for declaration %{public}@", buf, 0x16u);

      }
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    }
    else
    {
      v45 = DMFPolicyLog(v29, v30, v31);
      v46 = objc_claimAutoreleasedReturnValue(v45);
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
        v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "allObjects"));
        v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "componentsJoinedByString:", CFSTR(",")));
        v51 = *(_QWORD *)(a1 + 40);
        v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "verboseDescription"));
        *(_DWORD *)buf = 138543874;
        v66 = v50;
        v67 = 2114;
        v68 = v51;
        v69 = 2114;
        v70 = v52;
        _os_log_error_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_ERROR, "Error removing policies types %{public}@ for declaration %{public}@: %{public}@", buf, 0x20u);

      }
      v47 = *(_QWORD *)(a1 + 56);
      v48 = DMFErrorWithCodeAndUserInfo(3901, 0);
      v49 = (void *)objc_claimAutoreleasedReturnValue(v48);
      (*(void (**)(uint64_t, void *))(v47 + 16))(v47, v49);

      v9 = 0;
    }
    v13 = v54;

  }
}

void sub_10005C29C(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[DMDEffectivePolicy fetchRequest](DMDEffectivePolicy, "fetchRequest"));
    v6 = *(void **)(a1 + 32);
    if (!v6)
      v6 = &__NSArray0__struct;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("NOT (%K IN %@)"), CFSTR("organizationIdentifier"), v6));
    objc_msgSend(v5, "setPredicate:", v7);

    objc_msgSend(*(id *)(a1 + 40), "_removeOrphanedPoliciesFromFetchRequest:managedObjectContext:completionHandler:", v5, v8, *(_QWORD *)(a1 + 48));
  }

}

void sub_10005C40C(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void **v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t, uint64_t);
  void *v14;
  __CFString *v15;
  __CFString *v16;
  id v17;

  v10 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[DMDEffectivePolicy fetchRequest](DMDEffectivePolicy, "fetchRequest"));
    v6 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
    v7 = *(void **)(a1 + 32);
    v11 = _NSConcreteStackBlock;
    v12 = 3221225472;
    v13 = sub_10005C558;
    v14 = &unk_1000BBB90;
    v15 = CFSTR("organizationIdentifier");
    v16 = CFSTR("declarationIdentifier");
    v8 = v6;
    v17 = v8;
    objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", &v11);
    if (objc_msgSend(v8, "count"))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate orPredicateWithSubpredicates:](NSCompoundPredicate, "orPredicateWithSubpredicates:", v8));
      objc_msgSend(v5, "setPredicate:", v9);

    }
    objc_msgSend(*(id *)(a1 + 40), "_removeOrphanedPoliciesFromFetchRequest:managedObjectContext:completionHandler:", v5, v10, *(_QWORD *)(a1 + 48), v10, v11, v12, v13, v14);

  }
}

void sub_10005C558(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("(%K == %@) AND NOT (%K IN %@)"), *(_QWORD *)(a1 + 32), a2, *(_QWORD *)(a1 + 40), a3));
  objc_msgSend(*(id *)(a1 + 48), "addObject:", v4);

}

void sub_10005CDC4(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "dateByAddingUnit:value:toDate:options:", 16, 1, v4, 0));

  objc_msgSend(*(id *)(a1 + 32), "_enableEmergencyModeUntilDate:referenceDate:withCompletionHandler:", v3, v4, *(_QWORD *)(a1 + 40));
}

void sub_10005CEF8(uint64_t a1)
{
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dateByAddingTimeInterval:", *(double *)(a1 + 48)));
  objc_msgSend(*(id *)(a1 + 32), "_enableEmergencyModeUntilDate:referenceDate:withCompletionHandler:", v2, v3, *(_QWORD *)(a1 + 40));

}

uint64_t sub_10005D230(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  uint8_t v6[16];

  xpc_set_event(objc_msgSend(CFSTR("com.apple.alarm"), "UTF8String"), objc_msgSend(CFSTR("com.apple.dmd.emergency-mode.alarm"), "UTF8String"), 0);
  v2 = notify_post((const char *)objc_msgSend(DMFEmergencyModeChangedNotification, "UTF8String"));
  v3 = DMFEmergencyModeLog(v2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Disabling Emergency Mode", v6, 2u);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

id sub_10005D5D0(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyClientsRegisteredForPolicyType:", DMFEffectivePolicyTypeCategory);
}

id sub_10005D778(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyClientsRegisteredForPolicyType:", DMFEffectivePolicyTypeCategory);
}

id sub_10005D78C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyClientsRegisteredForPolicyType:", DMFEffectivePolicyTypeApplication);
}

id sub_10005D928(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyClientsRegisteredForPolicyType:", DMFEffectivePolicyTypeShield);
}

id sub_10005D93C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyClientsRegisteredForPolicyType:", DMFEffectivePolicyTypeiCloudAccountLogout);
}

id sub_10005D950(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyClientsRegisteredForPolicyType:", DMFEffectivePolicyTypeDowntime);
}

void sub_10005DADC(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v1 = objc_opt_new(*(_QWORD *)(a1 + 32));
  v2 = (void *)qword_1000EBA38;
  qword_1000EBA38 = v1;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[UMUserManager sharedManager](UMUserManager, "sharedManager"));
  objc_msgSend(v3, "registerUserSwitchStakeHolder:", qword_1000EBA38);

}

void sub_10005DB78(id a1)
{
  void *v1;
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[UMUserManager sharedManager](UMUserManager, "sharedManager"));
  if ((objc_msgSend(v2, "isMultiUser") & 1) != 0)
  {
    v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "currentUser"));
    byte_1000EBA48 = objc_msgSend(v1, "userType") == (id)1;

  }
  else
  {
    byte_1000EBA48 = 0;
  }

}

id _assertionQueue()
{
  if (qword_1000EBA60 != -1)
    dispatch_once(&qword_1000EBA60, &stru_1000BBC20);
  return (id)qword_1000EBA58;
}

void sub_10005DC2C(id a1)
{
  dispatch_queue_t v1;
  void *v2;

  v1 = dispatch_queue_create("DMDPowerAssertion Queue", 0);
  v2 = (void *)qword_1000EBA58;
  qword_1000EBA58 = (uint64_t)v1;

}

id sub_10005DDAC(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_retain");
}

id sub_10005DE44(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_release");
}

id sub_10005DEBC(uint64_t a1)
{
  id v2;

  if (objc_msgSend(*(id *)(a1 + 32), "isParked"))
  {
    v2 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, CFSTR("Trying to park a power assertion that's already parked."), 0));
    objc_exception_throw(v2);
  }
  objc_msgSend(*(id *)(a1 + 32), "setIsParked:", 1);
  return objc_msgSend(*(id *)(a1 + 32), "_release");
}

id sub_10005DF90(uint64_t a1)
{
  id v2;

  if ((objc_msgSend(*(id *)(a1 + 32), "isParked") & 1) == 0)
  {
    v2 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, CFSTR("Trying to unpark a power assertion that's not parked."), 0));
    objc_exception_throw(v2);
  }
  objc_msgSend(*(id *)(a1 + 32), "setIsParked:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "_retain");
}

id sub_10005E42C(uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  if (a2)
    return objc_msgSend(v2, "endOperationWithError:", a2);
  else
    return objc_msgSend(v2, "endOperationWithResultObject:", 0);
}

id sub_10005E570(uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  if (a2)
    return objc_msgSend(v2, "endOperationWithError:", a2);
  else
    return objc_msgSend(v2, "endOperationWithResultObject:", 0);
}

void sub_10005E964(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  unsigned int v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  id obj;
  _QWORD v40[5];
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100079000((uint64_t)v6);
    objc_msgSend(*(id *)(a1 + 32), "endOperationWithError:", v6);
    goto LABEL_26;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    sub_100078F94((uint64_t)v5, v7, v8, v9, v10, v11, v12, v13);
  v14 = objc_opt_class(NSDictionary);
  if ((objc_opt_isKindOfClass(v5, v14) & 1) == 0)
    goto LABEL_21;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kCTCellularPlanSlotVinylSlotInfoListKey")));
  v16 = objc_opt_class(NSArray);
  if ((objc_opt_isKindOfClass(v15, v16) & 1) == 0)
  {

    goto LABEL_21;
  }
  if (!v15)
  {
LABEL_21:
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "invalidResponseError:", v5));
    v17 = 0;
    goto LABEL_22;
  }
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v17 = v15;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
  if (!v18)
  {
LABEL_19:
    v26 = 0;
LABEL_28:

LABEL_22:
    v27 = *(void **)(a1 + 32);
    if (v26)
      goto LABEL_24;
    goto LABEL_23;
  }
  v19 = v18;
  v20 = *(_QWORD *)v43;
  obj = v17;
LABEL_12:
  v21 = 0;
  while (1)
  {
    if (*(_QWORD *)v43 != v20)
      objc_enumerationMutation(obj);
    v22 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * v21);
    v23 = objc_opt_class(NSDictionary);
    if ((objc_opt_isKindOfClass(v22, v23) & 1) == 0)
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "invalidResponseError:", v5));
      v17 = obj;
      goto LABEL_28;
    }
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("kCTCellularPlanSlotCardType")));
    v25 = objc_msgSend(v24, "isEqual:", &off_1000C35A0);

    if (v25)
      break;
    if (v19 == (id)++v21)
    {
      v17 = obj;
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
      if (v19)
        goto LABEL_12;
      goto LABEL_19;
    }
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    sub_100078F28((uint64_t)v22, v29, v30, v31, v32, v33, v34, v35);
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("kCTCellularPlanSlotCsnKey")));
  v17 = obj;

  if (v26)
  {
    v36 = *(void **)(a1 + 40);
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "eSIMServerURL"));
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v40[2] = sub_10005ECAC;
    v40[3] = &unk_1000B9B40;
    v38 = *(void **)(a1 + 40);
    v40[4] = *(_QWORD *)(a1 + 32);
    v41 = v38;
    objc_msgSend(v36, "refreshCellularPlansWithCSN:serverURL:completion:", v26, v37, v40);

    goto LABEL_25;
  }
  v27 = *(void **)(a1 + 32);
LABEL_23:
  v28 = DMFErrorWithCodeAndUserInfo(202, 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue(v28);
LABEL_24:
  objc_msgSend(v27, "endOperationWithError:", v26);
LABEL_25:

LABEL_26:
}

id sub_10005ECAC(uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  if (a2)
    return objc_msgSend(v2, "endOperationWithError:", a2);
  else
    return objc_msgSend(v2, "endOperationWithResultObject:", 0);
}

void sub_10005EDF0(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;

  v6 = a2;
  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "endOperationWithError:", a3);
  }
  else
  {
    v5 = (void *)objc_opt_new(DMFRefreshStatusResultObject);
    objc_msgSend(v5, "setNumberOfUpdates:", v6);
    objc_msgSend(*(id *)(a1 + 32), "endOperationWithResultObject:", v5);

  }
}

id sub_10005F0FC(uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  if (a2)
    return objc_msgSend(v2, "endOperationWithError:", a2);
  else
    return objc_msgSend(v2, "endOperationWithResultObject:", 0);
}

void sub_10005F360(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;

  v3 = a2;
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_1000790B8();
    objc_msgSend(*(id *)(a1 + 40), "endOperationWithError:", v3);
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](DMDAppController, "sharedController"));
    v5 = *(void **)(a1 + 32);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10005F440;
    v8[3] = &unk_1000B9B40;
    v6 = v5;
    v7 = *(_QWORD *)(a1 + 40);
    v9 = v6;
    v10 = v7;
    objc_msgSend(v4, "setTapToPayScreenLock:forBundleIdentifier:completion:", 0, v6, v8);

  }
}

void sub_10005F440(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  unsigned __int8 v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[5];
  id v12;

  v3 = a2;
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100079124();
    objc_msgSend(*(id *)(a1 + 40), "endOperationWithError:", v3);
  }
  else
  {
    v4 = (void *)objc_opt_class(*(_QWORD *)(a1 + 40));
    v5 = *(_QWORD *)(a1 + 32);
    v12 = 0;
    v6 = objc_msgSend(v4, "removeAppMetadataForBundleIdentifier:error:", v5, &v12);
    v7 = v12;
    v8 = *(void **)(a1 + 40);
    if ((v6 & 1) != 0)
    {
      v9 = (void *)objc_opt_class(v8);
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_10005F530;
      v11[3] = &unk_1000BAD98;
      v10 = *(_QWORD *)(a1 + 32);
      v11[4] = *(_QWORD *)(a1 + 40);
      objc_msgSend(v9, "removeAppWithBundleIdentifier:completion:", v10, v11);
    }
    else
    {
      objc_msgSend(v8, "endOperationWithError:", v7);
    }

  }
}

void sub_10005F530(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  NSErrorUserInfoKey v7;
  void *v8;

  v2 = *(void **)(a1 + 32);
  if (a2)
  {
    v7 = NSUnderlyingErrorKey;
    v8 = a2;
    v3 = a2;
    v4 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v8, &v7, 1));
    v5 = DMFErrorWithCodeAndUserInfo(1100, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    objc_msgSend(v2, "endOperationWithError:", v6);

  }
  else
  {
    v4 = 0;
    objc_msgSend(v2, "endOperationWithResultObject:", 0);
  }

}

id sub_10005FE18(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  int v7;
  uint64_t v8;

  v3 = DMFAppLog(a1, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v7 = 138543362;
    v8 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Start uninstalling app with bundle identifier: %{public}@", (uint8_t *)&v7, 0xCu);
  }

  return objc_msgSend(*(id *)(a1 + 40), "startUninstallingAppWithBundleIdentifier:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
}

id sub_10005FEC8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  int v7;
  uint64_t v8;

  v3 = DMFAppLog(a1, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v7 = 138543362;
    v8 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Start uninstalling app with bundle identifier: %{public}@", (uint8_t *)&v7, 0xCu);
  }

  return objc_msgSend(*(id *)(a1 + 40), "startUninstallingAppWithBundleIdentifier:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
}

void sub_10005FF90(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

void sub_100060318(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  unsigned __int8 v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;
  NSErrorUserInfoKey v18;
  id v19;
  NSErrorUserInfoKey v20;
  id v21;

  v3 = a2;
  v4 = v3;
  if (!v3)
  {
    if (*(_BYTE *)(a1 + 48))
    {
      v9 = *(void **)(a1 + 32);
      v10 = *(_QWORD *)(a1 + 40);
      v17 = 0;
      v11 = objc_msgSend(v9, "_removeRestrictionsWithRequest:error:", v10, &v17);
      v12 = v17;
      v6 = v12;
      if ((v11 & 1) == 0)
      {
        v13 = *(void **)(a1 + 32);
        if (!v12)
        {
          v16 = DMFErrorWithCodeAndUserInfo(1900, 0);
          v6 = (void *)objc_claimAutoreleasedReturnValue(v16);
          objc_msgSend(v13, "endOperationWithError:", v6);
          goto LABEL_10;
        }
        v18 = NSUnderlyingErrorKey;
        v19 = v12;
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1));
        v14 = DMFErrorWithCodeAndUserInfo(1900, v8);
        v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
        objc_msgSend(v13, "endOperationWithError:", v15);

        goto LABEL_3;
      }
    }
    else
    {
      v6 = 0;
    }
    objc_msgSend(*(id *)(a1 + 32), "endOperationWithResultObject:", 0);
    goto LABEL_10;
  }
  v5 = *(void **)(a1 + 32);
  v20 = NSUnderlyingErrorKey;
  v21 = v3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1));
  v7 = DMFErrorWithCodeAndUserInfo(1900, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  objc_msgSend(v5, "endOperationWithError:", v8);
LABEL_3:

LABEL_10:
}

id sub_1000609AC(uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  if (a2)
    return objc_msgSend(v2, "endOperationWithError:", a2);
  else
    return objc_msgSend(v2, "endOperationWithResultObject:", 0);
}

id sub_100060F8C(uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  if (a2)
    return objc_msgSend(v2, "endOperationWithError:", a2);
  else
    return objc_msgSend(v2, "endOperationWithResultObject:", 0);
}

id sub_100061270(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "endOperationWithResultObject:", 0);
  return objc_msgSend(*(id *)(a1 + 40), "stayAliveThroughHereAtLeast");
}

void sub_100061738(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  NSErrorUserInfoKey v7;
  void *v8;

  v2 = *(void **)(a1 + 32);
  if (a2)
  {
    v7 = NSUnderlyingErrorKey;
    v8 = a2;
    v3 = a2;
    v4 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v8, &v7, 1));
    v5 = DMFErrorWithCodeAndUserInfo(1900, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    objc_msgSend(v2, "endOperationWithError:", v6);

  }
  else
  {
    v4 = 0;
    objc_msgSend(v2, "endOperationWithResultObject:", 0);
  }

}

id sub_100062738(uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  if (a2)
    return objc_msgSend(v2, "endOperationWithError:", a2);
  else
    return objc_msgSend(v2, "endOperationWithResultObject:", 0);
}

void sub_100062B8C(id a1)
{
  DMDServer *v1;
  void *v2;

  v1 = objc_opt_new(DMDServer);
  v2 = (void *)qword_1000EBA78;
  qword_1000EBA78 = (uint64_t)v1;

}

id sub_100063304(uint64_t a1, uint64_t a2)
{
  void *v4;

  if (a2)
    return objc_msgSend(*(id *)(a1 + 32), "endOperationWithError:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](DMDAppController, "sharedController"));
  objc_msgSend(v4, "sendManagedAppsChangedNotification");

  return objc_msgSend(*(id *)(a1 + 32), "endOperationWithResultObject:", 0);
}

void sub_100063838(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10006385C(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (v5)
    objc_msgSend(WeakRetained, "endOperationWithError:", v5);
  else
    objc_msgSend(WeakRetained, "endOperationWithResultObject:", 0);

}

id sub_100063E3C(uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  if (a2)
    return objc_msgSend(v2, "endOperationWithError:", a2);
  else
    return objc_msgSend(v2, "endOperationWithResultObject:", 0);
}

id sub_100064228(uint64_t a1, uint64_t a2)
{
  void *v4;

  if (a2)
    return objc_msgSend(*(id *)(a1 + 32), "endOperationWithError:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](DMDAppController, "sharedController"));
  objc_msgSend(v4, "sendManagedAppsChangedNotification");

  return objc_msgSend(*(id *)(a1 + 32), "endOperationWithResultObject:", 0);
}

void sub_100064CA4(id a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;

  v1 = DMFErrorWithCodeAndUserInfo(800, 0);
  v2 = objc_claimAutoreleasedReturnValue(v1);
  v3 = (void *)qword_1000EBA88;
  qword_1000EBA88 = v2;

}

uint64_t sub_100064ECC(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void sub_100064EE0(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "authenticatedAccount"));
  objc_msgSend(*(id *)(a1 + 32), "setAuthenticatedAccount:", 0);
  if (v6)
  {
    (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40));
  }
  else
  {
    v4 = *(_QWORD *)(a1 + 40);
    if (v3)
    {
      (*(void (**)(_QWORD))(v4 + 16))(*(_QWORD *)(a1 + 40));
    }
    else
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_storeLoginFailedError"));
      (*(void (**)(uint64_t, void *, _QWORD))(v4 + 16))(v4, v5, 0);

    }
  }

}

void _performBlockOnMainThread(void *a1)
{
  void *v1;
  void *v2;
  void (**v3)(void);
  _QWORD block[4];
  void (**v5)(void);

  v3 = a1;
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread currentThread](NSThread, "currentThread"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread mainThread](NSThread, "mainThread"));

  if (v1 == v2)
  {
    v3[2]();
  }
  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100065158;
    block[3] = &unk_1000BB4A8;
    v5 = v3;
    dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);

  }
}

uint64_t sub_100065158(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_100065308(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  if (objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "completionBlock")))
    sub_100079820();
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000653F0;
  v5[3] = &unk_1000BA1F8;
  v6 = *(id *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "setCompletionBlock:", v5);
  objc_msgSend((id)objc_opt_class(*(_QWORD *)(a1 + 32)), "timeout");
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "timeoutTimer"));
  objc_msgSend(v3, "setFireDate:", v2);

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "request"));
  objc_msgSend(v4, "start");

}

uint64_t sub_1000653F0(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void sub_100065454(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "completionBlock"));
  if (!v2)
    sub_100079848();

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantFuture](NSDate, "distantFuture"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "timeoutTimer"));
  objc_msgSend(v4, "setFireDate:", v3);

  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "request"));
  objc_msgSend(v5, "cancel");

}

uint64_t sub_1000655E4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t sub_1000656D8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_100065794(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = DMFErrorWithCodeAndUserInfo(801, 0);
  v3 = (id)objc_claimAutoreleasedReturnValue(v2);
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v3);

}

void sub_100065ADC(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  id v16;

  v3 = a2;
  v5 = v3;
  if (v3)
  {
    v6 = DMFAppLog(v3, v4);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_100079870();

    objc_msgSend(*(id *)(a1 + 40), "endOperationWithError:", v5);
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](DMDAppController, "sharedController"));
    v9 = DMFBundleIdentifierErrorKey;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100065BE4;
    v13[3] = &unk_1000BB710;
    v10 = *(id *)(a1 + 32);
    v11 = *(_QWORD *)(a1 + 40);
    v12 = *(void **)(a1 + 48);
    v14 = v10;
    v15 = v11;
    v16 = v12;
    objc_msgSend(v8, "setTapToPayScreenLock:forBundleIdentifier:completion:", 0, v9, v13);

  }
}

void sub_100065BE4(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  unsigned __int8 v9;
  id v10;
  void *v11;
  uint64_t v12;
  unsigned __int8 v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  _QWORD v21[5];
  id v22;
  id v23;

  v3 = a2;
  v5 = v3;
  if (v3)
  {
    v6 = DMFAppLog(v3, v4);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_100079938();

    objc_msgSend(*(id *)(a1 + 40), "endOperationWithError:", v5);
  }
  else
  {
    v8 = *(_QWORD *)(a1 + 32);
    v23 = 0;
    v9 = +[DMDRemoveAppOperation removeAppMetadataForBundleIdentifier:error:](DMDRemoveAppOperation, "removeAppMetadataForBundleIdentifier:error:", v8, &v23);
    v10 = v23;
    if ((v9 & 1) != 0)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](DMDAppController, "sharedController"));
      v12 = *(_QWORD *)(a1 + 32);
      v22 = 0;
      v13 = objc_msgSend(v11, "removePersonaMappingForBundleID:error:", v12, &v22);
      v14 = v22;

      if ((v13 & 1) == 0)
      {
        v17 = DMFAppLog(v15, v16);
        v18 = objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          sub_1000798D4();

      }
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](DMDAppController, "sharedController"));
      objc_msgSend(v19, "sendManagedAppsChangedNotification");

      if ((objc_msgSend(*(id *)(a1 + 48), "options") & 1) != 0)
      {
        v21[0] = _NSConcreteStackBlock;
        v21[1] = 3221225472;
        v21[2] = sub_100065DA0;
        v21[3] = &unk_1000BAD98;
        v20 = *(_QWORD *)(a1 + 32);
        v21[4] = *(_QWORD *)(a1 + 40);
        +[DMDRemoveAppOperation removeAppWithBundleIdentifier:completion:](DMDRemoveAppOperation, "removeAppWithBundleIdentifier:completion:", v20, v21);
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 40), "endOperationWithResultObject:", 0);
      }

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "endOperationWithError:", v10);
    }

  }
}

void sub_100065DA0(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  NSErrorUserInfoKey v7;
  void *v8;

  v2 = *(void **)(a1 + 32);
  if (a2)
  {
    v7 = NSUnderlyingErrorKey;
    v8 = a2;
    v3 = a2;
    v4 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v8, &v7, 1));
    v5 = DMFErrorWithCodeAndUserInfo(1100, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    objc_msgSend(v2, "endOperationWithError:", v6);

  }
  else
  {
    v4 = 0;
    objc_msgSend(v2, "endOperationWithResultObject:", 0);
  }

}

id sub_100065F74(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "endOperationWithResultObject:", 0);
}

void sub_100066184(id a1)
{
  DMDSUManagerInstallTask_iOS *v1;
  void *v2;

  v1 = objc_opt_new(DMDSUManagerInstallTask_iOS);
  v2 = (void *)qword_1000EBA98;
  qword_1000EBA98 = (uint64_t)v1;

}

void sub_100066E8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  uint64_t v9;
  va_list va;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  va_list va1;

  va_start(va1, a8);
  va_start(va, a8);
  v9 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100066EBC(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100066ECC(uint64_t a1)
{

}

void sub_100066ED4(uint64_t a1, char a2, id obj)
{
  id v5;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), obj);
  v5 = obj;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void sub_100067394(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1000673C4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_1000676E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_10006771C(uint64_t a1, char a2, id obj)
{
  id v5;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), obj);
  v5 = obj;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void sub_1000679AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1000679DC(uint64_t a1, char a2, id obj)
{
  id v5;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), obj);
  v5 = obj;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void sub_100067C2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  uint64_t v11;
  va_list va;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v11 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v9 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_100067C68(_QWORD *a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;

  v9 = a5;
  v10 = *(void **)(*(_QWORD *)(a1[4] + 8) + 40);
  v11 = a4;
  v12 = a3;
  objc_msgSend(v10, "setDownload:", a2);
  objc_msgSend(*(id *)(*(_QWORD *)(a1[4] + 8) + 40), "setInstallPolicy:", v12);

  objc_msgSend(*(id *)(*(_QWORD *)(a1[4] + 8) + 40), "setAutoInstallOperation:", v11);
  v13 = *(_QWORD *)(a1[5] + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v9;
  v15 = v9;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1[6] + 8) + 40));
}

void sub_1000686D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_1000686FC(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "description"));

  return v2;
}

void sub_100068824(id a1, NSNumber *a2, CATSerialOperationQueue *a3, BOOL *a4)
{
  -[CATSerialOperationQueue setSuspended:](a3, "setSuspended:", 0, a4);
}

void sub_100068948(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_nameForOperationGroup:", objc_msgSend(a2, "unsignedIntegerValue")));
  v7 = *(void **)(a1 + 40);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "operations"));

  objc_msgSend(v7, "appendFormat:", CFSTR("\nGroup: %@\n%@"), v9, v8);
}

void sub_100068EFC(uint64_t a1)
{
  uint64_t v2;
  id v3;
  void *v4;
  void *v5;
  id v6;

  v6 = 0;
  v2 = objc_claimAutoreleasedReturnValue(+[NSRegularExpression regularExpressionWithPattern:options:error:](NSRegularExpression, "regularExpressionWithPattern:options:error:", CFSTR("^DM[DF](\\w+)Request$"), 0, &v6));
  v3 = v6;
  v4 = (void *)qword_1000EBAA8;
  qword_1000EBAA8 = v2;

  if (!qword_1000EBAA8)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("DMDTaskServerDelegate.m"), 178, CFSTR("%@"), v3);

  }
}

void sub_10006997C(id a1)
{
  void *v1;

  v1 = (void *)qword_1000EBAB8;
  qword_1000EBAB8 = (uint64_t)&off_1000C35E0;

}

void sub_100069F94(uint64_t a1)
{
  id v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  NSErrorUserInfoKey v10;
  id v11;

  v9 = 0;
  v2 = +[Libsysdiagnose sysdiagnoseWithMetadata:withError:](Libsysdiagnose, "sysdiagnoseWithMetadata:withError:", 0, &v9);
  v3 = v9;
  v4 = v3;
  if (v3)
  {
    v5 = *(void **)(a1 + 32);
    v10 = NSUnderlyingErrorKey;
    v11 = v3;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1));
    v7 = DMFErrorWithCodeAndUserInfo(3000, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    objc_msgSend(v5, "endOperationWithError:", v8);

  }
  else
  {
    MCSendDiagnosticsCollectedNotification();
    objc_msgSend(*(id *)(a1 + 32), "endOperationWithResultObject:", 0);
  }
  objc_msgSend(*(id *)(a1 + 40), "stayAliveThroughHereAtLeast");

}

void sub_10006A2B0(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a2;
  v8 = v5;
  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "endOperationWithError:", a3);
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bundleIdentifier"));

    v7 = *(void **)(a1 + 32);
    if (v6)
      objc_msgSend(v7, "_runWithRequest:metadata:", *(_QWORD *)(a1 + 40), v8);
    else
      objc_msgSend(v7, "endOperationWithDMFErrorCode:", 2606);
  }

}

id sub_10006A618(uint64_t a1, uint64_t a2)
{
  void *v3;

  v3 = *(void **)(a1 + 32);
  if (a2)
    return objc_msgSend(v3, "endOperationWithError:", a2);
  else
    return objc_msgSend(v3, "_endOperationWithBundleIdentifier:", *(_QWORD *)(a1 + 40));
}

void sub_10006AA10(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  if (a2 == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "_setState:forBundleIdentifier:", 7, *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "_startUpdateAppForRequest:metadata:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  }
  else
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 56), "bundleIdentifier"));
    objc_msgSend(v3, "_setState:forBundleIdentifier:", 15, v4);

  }
}

void sub_10006AC38(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[4];
  id v32;

  v3 = a2;
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "_showUpdateFailurePromptIfNeededForRequest:metadata:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 32), "endOperationWithError:", v3);
  }
  else
  {
    v4 = *(_QWORD *)(a1 + 40);
    v5 = objc_opt_class(DMFMDMv1UpdateAppRequest);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    {
      v6 = *(id *)(a1 + 40);
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](DMDAppController, "sharedController"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "VPNUUIDString"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "cellularSliceUUIDString"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "contentFilterUUIDString"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "DNSProxyUUIDString"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "relayUUIDString"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "associatedDomains"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "associatedDomainsEnableDirectDownloads"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allowUserToHide"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allowUserToLock"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "configuration"));
      v10 = objc_msgSend(v6, "managementOptions");
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sourceIdentifier"));
      objc_msgSend(v28, "setVPNUUIDString:cellularSliceUUIDString:contentFilterUUIDString:DNSProxyUUIDString:relayUUIDString:associatedDomains:enableDirectDownloads:allowUserToHide:allowUserToLock:configuration:options:sourceIdentifier:forBundleIdentifier:", v27, v26, v25, v24, v23, v7, v22, v21, v8, v9, v10, v11, *(_QWORD *)(a1 + 56));

      v12 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](DMDAppController, "sharedController"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "removable"));
      v14 = *(_QWORD *)(a1 + 56);
      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472;
      v31[2] = sub_10006AF40;
      v31[3] = &unk_1000BAD98;
      v15 = v6;
      v32 = v15;
      objc_msgSend(v12, "setRemovability:forBundleIdentifier:completion:", v13, v14, v31);

      v16 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](DMDAppController, "sharedController"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "tapToPayScreenLock"));
      v18 = *(_QWORD *)(a1 + 56);
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472;
      v29[2] = sub_10006AFA4;
      v29[3] = &unk_1000BAD98;
      v30 = v15;
      v19 = v15;
      objc_msgSend(v16, "setTapToPayScreenLock:forBundleIdentifier:completion:", v17, v18, v29);

      v20 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](DMDAppController, "sharedController"));
      objc_msgSend(v20, "sendManagedAppsChangedNotification");

    }
    objc_msgSend(*(id *)(a1 + 32), "_endOperationWithBundleIdentifier:", *(_QWORD *)(a1 + 56));
  }

}

void sub_10006AF40(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;

  v3 = a2;
  v5 = v3;
  if (v3)
  {
    v6 = DMFAppLog(v3, v4);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_100079B90(a1, (uint64_t)v5, v7);

  }
}

void sub_10006AFA4(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;

  v3 = a2;
  v5 = v3;
  if (v3)
  {
    v6 = DMFAppLog(v3, v4);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_100079C1C(a1, (uint64_t)v5, v7);

  }
}

id sub_10006B510(uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  if (a2)
    return objc_msgSend(v2, "endOperationWithError:", a2);
  else
    return objc_msgSend(v2, "endOperationWithResultObject:", 0);
}

id sub_10006B78C(uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  if (a2)
    return objc_msgSend(v2, "endOperationWithError:", a2);
  else
    return objc_msgSend(v2, "endOperationWithResultObject:", 0);
}

void sub_10006BB0C(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "initPrivate");
  v2 = (void *)qword_1000EBAC8;
  qword_1000EBAC8 = (uint64_t)v1;

}

void sub_10006BE10(id *a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  int v9;
  void *v10;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "identifier"));
    v9 = 138543362;
    v10 = v2;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Adding user notification: %{public}@", (uint8_t *)&v9, 0xCu);

  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[5], "notifications"));
  objc_msgSend(v3, "addObject:", a1[4]);

  v4 = objc_msgSend(a1[6], "copy");
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[5], "completionsByIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "identifier"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[5], "notifications"));
  v8 = objc_msgSend(v7, "count");

  if (v8 == (id)1)
    objc_msgSend(a1[5], "_showNextNotification");
}

void sub_10006C174(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  const __CFDictionary *v9;
  CFTimeInterval v10;
  CFUserNotificationRef v11;
  CFUserNotificationRef v12;
  void *v13;
  CFRunLoopSourceRef RunLoopSource;
  __CFRunLoopSource *v15;
  __CFRunLoop *Main;
  SInt32 error;
  uint8_t buf[4];
  void *v19;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "notifications"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "firstObject"));

  if (v3)
  {
    v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "defaultButtonTitle"));
    if (v4)
    {
      v5 = (void *)v4;
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "alternateButtonTitle"));
      if (v6)
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "otherButtonTitle"));
        v8 = v7 != 0;

        v6 = (void *)(32 * v8);
      }
      else
      {

      }
    }
    else
    {
      v6 = 0;
    }
    error = 0;
    v9 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_dictFromNotification:", v3));
    objc_msgSend(v3, "timeout");
    v11 = CFUserNotificationCreate(kCFAllocatorDefault, v10, (CFOptionFlags)v6, &error, v9);
    if (v11)
    {
      v12 = v11;
      objc_msgSend(v3, "setNotificationRef:", v11);
      CFRelease(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifier"));
      RunLoopSource = CFUserNotificationCreateRunLoopSource(kCFAllocatorDefault, v12, (CFUserNotificationCallBack)sub_10006C3BC, 0);
      if (RunLoopSource)
      {
        v15 = RunLoopSource;
        Main = CFRunLoopGetMain();
        CFRunLoopAddSource(Main, v15, kCFRunLoopCommonModes);
        CFRelease(v15);
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v19 = v13;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "User notification started: %{public}@", buf, 0xCu);
        }
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          sub_100079DD4((uint64_t)v13);
        objc_msgSend(*(id *)(a1 + 32), "_completeNotification:response:", v3, 4);
      }

    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        sub_100079D90();
      objc_msgSend(*(id *)(a1 + 32), "_completeNotification:response:", v3, 4);
    }

  }
}

void sub_10006C3BC(uint64_t a1, uint64_t a2)
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[DMDUserNotificationController sharedController](DMDUserNotificationController, "sharedController"));
  objc_msgSend(v4, "_notificationRef:wasDismissedWithFlags:", a1, a2);

}

void sub_10006C5F4(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t buf[4];
  void *v17;
  _BYTE v18[128];

  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "notifications", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v13;
LABEL_3:
    v6 = 0;
    while (1)
    {
      if (*(_QWORD *)v13 != v5)
        objc_enumerationMutation(v2);
      v7 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v6));
      if (objc_msgSend(v7, "notificationRef") == *(id *)(a1 + 40))
        break;
      if (v4 == (id)++v6)
      {
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
        if (v4)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v8 = v7;

    if (!v8)
      return;
    v9 = *(_QWORD *)(a1 + 48);
    if (v9 < 4)
      v10 = v9 + 1;
    else
      v10 = 0;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));
      *(_DWORD *)buf = 138543362;
      v17 = v11;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "User notification ended: %{public}@", buf, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 32), "_completeNotification:response:", v8, v10);
  }
  else
  {
LABEL_9:
    v8 = v2;
  }

}

void sub_10006C9A0(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_opt_new(*(_QWORD *)(a1 + 32));
  v2 = (void *)qword_1000EBAD8;
  qword_1000EBAD8 = v1;

}

void sub_10006CAA8(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006CB10;
  block[3] = &unk_1000BA4B0;
  v2 = *(id *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

id sub_10006CB10(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "mainQueueDidReceiveAppWhitelistChangedNotification");
}

id sub_10006CBB8()
{
  if (qword_1000EBAF8 != -1)
    dispatch_once(&qword_1000EBAF8, &stru_1000BBFC0);
  return (id)qword_1000EBAF0;
}

void sub_10006CBF8(id a1)
{
  void *v1;
  unsigned int v2;
  BOOL v3;
  __CFUserNotification *v4;
  void *v5;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  NSMutableArray *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  unsigned int v20;
  dispatch_queue_global_t global_queue;
  NSObject *v22;
  _QWORD block[4];
  NSMutableArray *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  unsigned int v30;
  _BYTE v31[128];

  v1 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
  v2 = objc_msgSend(v1, "appWhitelistState");

  if (v2)
    v3 = v2 == 6;
  else
    v3 = 1;
  if (!v3)
  {
    if (qword_1000EBAE8 && (objc_msgSend((id)qword_1000EBAE8, "displayInAppWhitelistModes") & 1) == 0)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Dismissing notification because we entered limited apps mode.", buf, 2u);
      }
      v4 = (__CFUserNotification *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1000EBAE8, "notification"));
      CFUserNotificationCancel(v4);

      v5 = (void *)qword_1000EBAE8;
      qword_1000EBAE8 = 0;

    }
    v6 = objc_opt_new(NSMutableArray);
    v7 = objc_opt_new(NSMutableArray);
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v8 = sub_10006CEB0();
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v26 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(v14, "displayInAppWhitelistModes"))
            v15 = v7;
          else
            v15 = v6;
          -[NSMutableArray addObject:](v15, "addObject:", v14);
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
      }
      while (v11);
    }

    v16 = sub_10006CEB0();
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    objc_msgSend(v17, "removeAllObjects");

    v18 = sub_10006CEB0();
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    objc_msgSend(v19, "addObjectsFromArray:", v7);

    if (-[NSMutableArray count](v6, "count"))
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
      {
        v20 = -[NSMutableArray count](v6, "count");
        *(_DWORD *)buf = 67109120;
        v30 = v20;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Canceling %d pending notifications because we entered limited apps mode.", buf, 8u);
      }
      global_queue = dispatch_get_global_queue(0, 0);
      v22 = objc_claimAutoreleasedReturnValue(global_queue);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10006CEF0;
      block[3] = &unk_1000BA4B0;
      v24 = v6;
      dispatch_async(v22, block);

    }
  }
}

id sub_10006CEB0()
{
  if (qword_1000EBB08 != -1)
    dispatch_once(&qword_1000EBB08, &stru_1000BBFE0);
  return (id)qword_1000EBB00;
}

void sub_10006CEF0(uint64_t a1)
{
  id v1;
  id v2;
  id v3;
  uint64_t v4;
  void *i;
  void *v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD);
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v4)
          objc_enumerationMutation(v1);
        v6 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i);
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "completionBlock", (_QWORD)v9));

        if (v7)
        {
          v8 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "completionBlock"));
          v8[2](v8, 3);

        }
      }
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v3);
  }

}

BOOL sub_10006D024(id a1, DMDUserNotificationQueueEntry *a2)
{
  return 1;
}

void sub_10006D0C8(uint64_t a1)
{
  id v2;
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id v6;

  v2 = sub_10006CBB8();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10006D158;
  v4[3] = &unk_1000BBF50;
  v5 = *(id *)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  dispatch_barrier_sync(v3, v4);

}

void sub_10006D158(uint64_t a1)
{
  __CFUserNotification *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  dispatch_queue_global_t global_queue;
  NSObject *v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;

  if (qword_1000EBAE8 && (*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))())
  {
    v2 = (__CFUserNotification *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1000EBAE8, "notification"));
    CFUserNotificationCancel(v2);

  }
  v3 = sub_10006CEB0();
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10006D2D0;
  v15[3] = &unk_1000BBF28;
  v16 = *(id *)(a1 + 32);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", v15));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "filteredArrayUsingPredicate:", v5));

  v7 = sub_10006CEB0();
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  objc_msgSend(v8, "removeObjectsInArray:", v6);

  global_queue = dispatch_get_global_queue(0, 0);
  v10 = objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006D2DC;
  block[3] = &unk_1000BA7F0;
  v13 = v6;
  v14 = *(id *)(a1 + 40);
  v11 = v6;
  dispatch_async(v10, block);

}

uint64_t sub_10006D2D0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_10006D2DC(uint64_t a1)
{
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD);
  uint64_t result;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "completionBlock", (_QWORD)v11));

        if (v8)
        {
          v9 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "completionBlock"));
          v9[2](v9, 3);

        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t sub_10006D710(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "unpark");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

void sub_10006D754(uint64_t a1)
{
  id v2;
  void *v3;

  v2 = sub_10006CEB0();
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  objc_msgSend(v3, "addObject:", *(_QWORD *)(a1 + 32));

  sub_10006D788();
}

void sub_10006D788()
{
  id v0;
  void *v1;
  CFStringRef v2;
  CFStringRef v3;
  CFStringRef v4;
  CFStringRef v5;
  CFStringRef v6;
  void *v7;
  NSMutableDictionary *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  const __CFString *v21;
  const __CFString *v22;
  const __CFString *v23;
  const __CFString *v24;
  _BOOL4 v25;
  CFOptionFlags v26;
  __CFUserNotification *v27;
  __CFUserNotification *v28;
  CFRunLoopSourceRef RunLoopSource;
  id v30;
  __CFRunLoopSource *v31;
  id v32;
  void *v33;
  __CFRunLoop *Main;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  double v40;
  void *v41;
  double v42;
  dispatch_time_t v43;
  void *v44;
  uint64_t v45;
  uint8_t v46;
  char v47[15];
  _QWORD block[5];
  SInt32 error;
  uint8_t v50[4];
  int v51[3];
  uint8_t buf[4];
  void *v53;
  __int16 v54;
  void *v55;
  __int16 v56;
  void *v57;
  __int16 v58;
  void *v59;
  __int16 v60;
  void *v61;

  if (qword_1000EBAE8)
    return;
  v0 = sub_10006CEB0();
  v1 = (void *)objc_claimAutoreleasedReturnValue(v0);
  if (!objc_msgSend(v1, "count"))
    goto LABEL_26;
  v2 = kCFUserNotificationAlertHeaderKey;
  v3 = kCFUserNotificationAlertMessageKey;
  v4 = kCFUserNotificationDefaultButtonTitleKey;
  v5 = kCFUserNotificationAlternateButtonTitleKey;
  v6 = kCFUserNotificationOtherButtonTitleKey;
  v45 = SBUserNotificationDontDismissOnUnlock;
  while (1)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "objectAtIndexedSubscript:", 0));
    v8 = objc_opt_new(NSMutableDictionary);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "title"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v9, v2);

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "message"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v10, v3);

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "defaultButtonText"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v11, v4);

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "alternateButtonText"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v12, v5);

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "otherButtonText"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v13, v6);

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v7, "displayOnLockScreen")));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v14, kCFUserNotificationAlertTopMostKey);

    -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, v45);
    v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "defaultButtonText"));
    if (v15)
    {
      v16 = (void *)v15;
      v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "alternateButtonText"));
      if (v17)
      {
        v18 = (void *)v17;
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "otherButtonText"));
        v44 = v1;
        v20 = v6;
        v21 = v5;
        v22 = v4;
        v23 = v3;
        v24 = v2;
        v25 = v19 != 0;

        v26 = 32 * v25;
        v2 = v24;
        v3 = v23;
        v4 = v22;
        v5 = v21;
        v6 = v20;
        v1 = v44;
        goto LABEL_9;
      }

    }
    v26 = 0;
LABEL_9:
    error = 0;
    v27 = CFUserNotificationCreate(kCFAllocatorDefault, 0.0, v26, &error, (CFDictionaryRef)v8);
    if (!v27)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        sub_100079E50(v50, &error, v51);
      goto LABEL_16;
    }
    v28 = v27;
    RunLoopSource = CFUserNotificationCreateRunLoopSource(0, v27, (CFUserNotificationCallBack)sub_10006E3DC, 0);
    if (RunLoopSource)
      break;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100079E9C(&v46, v47);
    CFRelease(v28);
LABEL_16:

    v30 = sub_10006CEB0();
    v1 = (void *)objc_claimAutoreleasedReturnValue(v30);
    if (!objc_msgSend(v1, "count"))
      goto LABEL_26;
  }
  v31 = RunLoopSource;
  v32 = sub_10006CEB0();
  v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
  objc_msgSend(v33, "removeObjectAtIndex:", 0);

  objc_storeStrong((id *)&qword_1000EBAE8, v7);
  objc_msgSend(v7, "setNotification:", v28);
  Main = CFRunLoopGetMain();
  CFRunLoopAddSource(Main, v31, kCFRunLoopCommonModes);
  CFRelease(v31);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "title"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "message"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "defaultButtonText"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "alternateButtonText"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "otherButtonText"));
    *(_DWORD *)buf = 138544386;
    v53 = v35;
    v54 = 2114;
    v55 = v36;
    v56 = 2114;
    v57 = v37;
    v58 = 2114;
    v59 = v38;
    v60 = 2114;
    v61 = v39;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Displaying alert: %{public}@ - %{public}@ [%{public}@] [%{public}@] [%{public}@]", buf, 0x34u);

  }
  objc_msgSend(v7, "dismissAfterTimeInterval");
  if (v40 <= 0.0)
  {
    CFRelease(v28);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v7, "dismissAfterTimeInterval");
      *(_DWORD *)buf = 134217984;
      v53 = v41;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Scheduling automatic alert dismissal after %0.0f seconds.", buf, 0xCu);
    }
    CFRetain(v28);
    objc_msgSend(v7, "dismissAfterTimeInterval");
    v43 = dispatch_time(0, (uint64_t)(v42 * 1000000000.0));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10006E4E4;
    block[3] = &unk_1000BA638;
    block[4] = v28;
    dispatch_after(v43, (dispatch_queue_t)&_dispatch_main_q, block);
  }

LABEL_26:
}

void sub_10006DE0C(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  DMDUserNotificationQueueEntry *v5;
  void *v6;
  id v7;
  NSBundle *v8;
  void *v9;
  void *v10;
  NSBundle *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[16];

  v2 = sub_10006E068();
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  if (!objc_msgSend(v3, "count"))
  {
    v6 = *(void **)(a1 + 56);
    if (v6)
    {
      v7 = objc_retainBlock(v6);
      objc_msgSend(v3, "addObject:", v7);

    }
    v5 = objc_opt_new(DMDUserNotificationQueueEntry);
    -[DMDUserNotificationQueueEntry setTitle:](v5, "setTitle:", *(_QWORD *)(a1 + 32));
    -[DMDUserNotificationQueueEntry setMessage:](v5, "setMessage:", *(_QWORD *)(a1 + 40));
    v8 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(DMFConnection));
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Sign In"), &stru_1000BC2E0, CFSTR("DMFNotifications")));
    -[DMDUserNotificationQueueEntry setDefaultButtonText:](v5, "setDefaultButtonText:", v10);

    v11 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(DMFConnection));
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Cancel"), &stru_1000BC2E0, CFSTR("DMFNotifications")));
    -[DMDUserNotificationQueueEntry setAlternateButtonText:](v5, "setAlternateButtonText:", v13);

    -[DMDUserNotificationQueueEntry setDisplayOnLockScreen:](v5, "setDisplayOnLockScreen:", 0);
    -[DMDUserNotificationQueueEntry setDisplayInAppWhitelistModes:](v5, "setDisplayInAppWhitelistModes:", 0);
    -[DMDUserNotificationQueueEntry setDismissAfterTimeInterval:](v5, "setDismissAfterTimeInterval:", 900.0);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10006E0A8;
    v16[3] = &unk_1000BBFA0;
    v17 = *(id *)(a1 + 48);
    -[DMDUserNotificationQueueEntry setCompletionBlock:](v5, "setCompletionBlock:", v16);
    objc_msgSend(*(id *)(a1 + 48), "park");
    v14 = sub_10006CEB0();
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    objc_msgSend(v15, "addObject:", v5);

    sub_10006D788();
    goto LABEL_9;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "An iTunes login prompt is already shown. Not showing another prompt.", buf, 2u);
  }
  v4 = *(void **)(a1 + 56);
  if (v4)
  {
    v5 = objc_retainBlock(v4);
    objc_msgSend(v3, "addObject:", v5);
LABEL_9:

  }
  objc_msgSend(*(id *)(a1 + 48), "stayAliveThroughHereAtLeast");

}

id sub_10006E068()
{
  if (qword_1000EBB18 != -1)
    dispatch_once(&qword_1000EBB18, &stru_1000BC000);
  return (id)qword_1000EBB10;
}

void sub_10006E0A8(uint64_t a1, uint64_t a2)
{
  id v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  objc_msgSend(*(id *)(a1 + 32), "unpark");
  v4 = sub_10006CBB8();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10006E140;
  v6[3] = &unk_1000BA488;
  v8 = a2;
  v7 = *(id *)(a1 + 32);
  dispatch_async(v5, v6);

}

void sub_10006E140(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  dispatch_queue_global_t global_queue;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  uint64_t v13;

  v2 = sub_10006E068();
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  if (objc_msgSend(v3, "count"))
  {
    v4 = objc_msgSend(v3, "copy");
    objc_msgSend(v3, "removeAllObjects");
    global_queue = dispatch_get_global_queue(0, 0);
    v6 = objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10006E218;
    block[3] = &unk_1000BBF78;
    v8 = *(void **)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 40);
    v11 = v4;
    v13 = v7;
    v12 = v8;
    v9 = v4;
    dispatch_async(v6, block);

  }
}

id sub_10006E218(uint64_t a1)
{
  id v2;
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t v15[128];
  uint8_t buf[4];
  id v17;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v2 = objc_msgSend(*(id *)(a1 + 32), "count");
    *(_DWORD *)buf = 134217984;
    v17 = v2;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Calling completions for %lu iTunes login events.", buf, 0xCu);
  }
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v7);
        v9 = objc_autoreleasePoolPush();
        (*(void (**)(uint64_t, _QWORD))(v8 + 16))(v8, *(_QWORD *)(a1 + 48));
        objc_autoreleasePoolPop(v9);
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

  return objc_msgSend(*(id *)(a1 + 40), "stayAliveThroughHereAtLeast", (_QWORD)v11);
}

void sub_10006E384(id a1)
{
  dispatch_queue_t v1;
  void *v2;

  v1 = dispatch_queue_create("DMDUserNotificationManager Queue", (dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent);
  v2 = (void *)qword_1000EBAF0;
  qword_1000EBAF0 = (uint64_t)v1;

}

void sub_10006E3B4(id a1)
{
  NSMutableArray *v1;
  void *v2;

  v1 = objc_opt_new(NSMutableArray);
  v2 = (void *)qword_1000EBB00;
  qword_1000EBB00 = (uint64_t)v1;

}

void sub_10006E3DC(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  const __CFString *v3;
  id v4;
  NSObject *v5;
  _QWORD block[5];
  uint8_t buf[4];
  const __CFString *v8;

  if (a2 > 3)
  {
    v3 = CFSTR("Unknown");
    v2 = 4;
  }
  else
  {
    v2 = a2;
    v3 = *(&off_1000BC020 + a2);
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v8 = v3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Alert dismissed with response: %{public}@", buf, 0xCu);
  }
  v4 = sub_10006CBB8();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006E558;
  block[3] = &unk_1000BA638;
  block[4] = v2;
  dispatch_barrier_sync(v5, block);

}

void sub_10006E4E4(uint64_t a1)
{
  uint8_t v2[16];

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Automatically dismissing alert.", v2, 2u);
  }
  CFUserNotificationCancel(*(CFUserNotificationRef *)(a1 + 32));
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

void sub_10006E558(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  dispatch_queue_global_t global_queue;
  NSObject *v10;
  id v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;

  v2 = (id)qword_1000EBAE8;
  v3 = (void *)qword_1000EBAE8;
  qword_1000EBAE8 = 0;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "completionBlock"));
  if (v4)
  {
    global_queue = dispatch_get_global_queue(0, 0);
    v10 = objc_claimAutoreleasedReturnValue(global_queue);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10006E624;
    v13[3] = &unk_1000BA488;
    v11 = v2;
    v12 = *(_QWORD *)(a1 + 32);
    v14 = v11;
    v15 = v12;
    dispatch_async(v10, v13);

  }
  sub_10006D788(v5, v6, v7, v8);

}

void sub_10006E624(uint64_t a1)
{
  void (**v2)(id, _QWORD);

  v2 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "completionBlock"));
  v2[2](v2, *(_QWORD *)(a1 + 40));

}

void sub_10006E668(id a1)
{
  NSMutableArray *v1;
  void *v2;

  v1 = objc_opt_new(NSMutableArray);
  v2 = (void *)qword_1000EBB10;
  qword_1000EBB10 = (uint64_t)v1;

}

void sub_10006E778(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  NSErrorUserInfoKey v7;
  void *v8;

  v2 = *(void **)(a1 + 32);
  if (a2)
  {
    v7 = NSUnderlyingErrorKey;
    v8 = a2;
    v3 = a2;
    v4 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v8, &v7, 1));
    v5 = DMFErrorWithCodeAndUserInfo(3100, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    objc_msgSend(v2, "endOperationWithError:", v6);

  }
  else
  {
    v4 = 0;
    objc_msgSend(v2, "endOperationWithResultObject:", 0);
  }

}

uint64_t MCProfileFilterFlagsFromDMFProfileFilterFlags(uint64_t a1)
{
  if (a1)
    return a1 & 0x3F;
  else
    return 3;
}

int main(int argc, const char **argv, const char **envp)
{
  void *v3;
  void *v4;
  dispatch_queue_global_t global_queue;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  _BYTE v11[1024];

  v3 = objc_autoreleasePoolPush();
  +[NSFileManager dmd_setUserDirSuffix:](NSFileManager, "dmd_setUserDirSuffix:", "com.apple.dmd");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager dmd_userDarwinUserTempDirectoryURL](NSFileManager, "dmd_userDarwinUserTempDirectoryURL"));
  objc_msgSend(v4, "getFileSystemRepresentation:maxLength:", v11, 1024);

  signal(15, (void (__cdecl *)(int))1);
  global_queue = dispatch_get_global_queue(21, 0);
  v6 = objc_claimAutoreleasedReturnValue(global_queue);
  v7 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, v6);
  dispatch_source_set_event_handler(v7, &stru_1000BC040);
  dispatch_activate(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[DMDServer sharedServer](DMDServer, "sharedServer"));
  objc_msgSend(v8, "run");

  objc_autoreleasePoolPop(v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](NSRunLoop, "currentRunLoop"));
  objc_msgSend(v9, "run");

  return 0;
}

void sub_10006FF04(id a1)
{
  uint64_t v1;
  NSObject *v2;
  uint8_t v3[16];

  v1 = DMFServerLog(a1);
  v2 = objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "SIGTERM received, cleaning all outstanding XPC transactions", v3, 2u);
  }

  xpc_transaction_exit_clean();
}

id DMDErrorChainFromError(void *a1)
{
  id v1;
  NSMutableArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v15;

  v1 = a1;
  v2 = objc_opt_new(NSMutableArray);
  v15 = v1;
  if (v15)
  {
    v3 = DMFDeclarationStateErrorChainLocalizedDescriptionKey;
    v4 = DMFDeclarationStateErrorChainErrorDomainKey;
    v5 = DMFDeclarationStateErrorChainErrorCodeKey;
    v6 = v15;
    do
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 4));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userInfo"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedDescription"));
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, v3);

      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "domain"));
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, v4);

      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v6, "code")));
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v11, v5);

      -[NSMutableArray addObject:](v2, "addObject:", v7);
      v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", NSUnderlyingErrorKey));

      v6 = (void *)v12;
    }
    while (v12);
  }
  v13 = -[NSMutableArray copy](v2, "copy");

  return v13;
}

void sub_100070308(id a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[DMDPaths systemGroupContainerPath](DMDPaths, "systemGroupContainerPath"));
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v4, 1));
  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "URLByAppendingPathComponent:isDirectory:", CFSTR("Library"), 1));
  v3 = (void *)qword_1000EBB20;
  qword_1000EBB20 = v2;

}

void sub_100070494(id a1)
{
  char *pw_dir;
  uid_t v2;
  passwd *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  int *v8;
  NSString *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  int *v14;
  NSString *v15;
  void *v16;
  char v17[1024];

  pw_dir = getenv("HOME");
  if (!pw_dir)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
      sub_100079F4C();
    v2 = getuid();
    v3 = getpwuid(v2);
    if (!v3)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[NSFileManager(DMDAdditions) dmd_userHomeURL]_block_invoke"));
      v13 = getuid();
      v14 = __error();
      v15 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", strerror(*v14));
      v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, CFSTR("NSFileManager+DMDAdditions.m"), 64, CFSTR("Failed to get passwd entry for uid %u: %@ (%d)"), v13, v16, *__error());

    }
    pw_dir = v3->pw_dir;
  }
  if (!realpath_DARWIN_EXTSN(pw_dir, v17))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[NSFileManager(DMDAdditions) dmd_userHomeURL]_block_invoke"));
    v8 = __error();
    v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", strerror(*v8));
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("NSFileManager+DMDAdditions.m"), 70, CFSTR("Failed to resolve user home directory: %@ (%d)"), v10, *__error());

  }
  v4 = objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:](NSURL, "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", v17, 1, 0));
  v5 = (void *)qword_1000EBB30;
  qword_1000EBB30 = v4;

}

void sub_100070708(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "dmd_userHomeURL"));
  v1 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "URLByAppendingPathComponent:isDirectory:", CFSTR("Library"), 1));
  v2 = (void *)qword_1000EBB40;
  qword_1000EBB40 = v1;

}

void sub_100070798(id a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  int *v5;
  NSString *v6;
  void *v7;
  void *v8;
  void *v9;
  int *v10;
  NSString *v11;
  void *v12;
  char v13[1024];
  char v14[1024];

  if (!confstr(65537, v14, 0x400uLL))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[NSFileManager(DMDAdditions) dmd_userDarwinUserTempDirectoryURL]_block_invoke"));
    v5 = __error();
    v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", strerror(*v5));
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("NSFileManager+DMDAdditions.m"), 91, CFSTR("Failed to initialize darwin user temp directory: %@ (%d)"), v7, *__error());

  }
  if (!realpath_DARWIN_EXTSN(v14, v13))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[NSFileManager(DMDAdditions) dmd_userDarwinUserTempDirectoryURL]_block_invoke"));
    v10 = __error();
    v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", strerror(*v10));
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("NSFileManager+DMDAdditions.m"), 94, CFSTR("Failed to resolve darwin user temp directory: %@ (%d)"), v12, *__error());

  }
  v1 = objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:](NSURL, "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", v13, 1, 0));
  v2 = (void *)qword_1000EBB50;
  qword_1000EBB50 = v1;

}

void sub_100070DBC(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "verboseDescription"));
  sub_100005ECC();
  sub_100005E9C((void *)&_mh_execute_header, v2, v3, "Request validation failed for removing profile: %{public}@", v4, v5, v6, v7, v8);

  sub_100005EB0();
}

void sub_100070E34(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "verboseDescription"));
  sub_100005ECC();
  sub_100005E9C((void *)&_mh_execute_header, v2, v3, "Request validation failed for installing profile: %{public}@", v4, v5, v6, v7, v8);

  sub_100005EB0();
}

void sub_100070EAC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005ECC();
  sub_100005EBC((void *)&_mh_execute_header, v0, v1, "%@", v2, v3, v4, v5, v6);
}

void sub_100070F10(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "font asset data is nil", v1, 2u);
}

void sub_100070F50(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "image asset data is nil", v1, 2u);
}

void sub_100070F90(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "verboseDescription"));
  sub_100005E9C((void *)&_mh_execute_header, v2, v3, "Request validation failed for setting policy: %{public}@", v4, v5, v6, v7, 2u);

  sub_100005EB0();
}

void sub_10007100C(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "verboseDescription"));
  sub_100005E9C((void *)&_mh_execute_header, v2, v3, "Request validation failed for removing policy: %{public}@", v4, v5, v6, v7, 2u);

  sub_100005EB0();
}

void sub_100071088()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  sub_10000C8EC();
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v2 + 32), "predicateType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v1 + 32), "uniqueIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v0, "debugDescription"));
  sub_10000C8A4();
  sub_10000C890((void *)&_mh_execute_header, v6, v7, "Predicate type: %{public}@ with unique identifier: %{public}@ failed stopping Usage Tracking monitor with budget identifier: %{public}@, error: %{public}@", v8, v9, v10, v11, v12);

  sub_10000C8C0();
}

void sub_100071144()
{
  void *v0;
  id v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  sub_10000C8D4();
  objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "predicateType"));
  v2 = objc_msgSend((id)sub_10000C8E0(), "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  sub_10000C868();
  sub_10000C854((void *)&_mh_execute_header, v4, v5, "Predicate type: %{public}@ with unique identifier: %{public}@ failed to extract a budget type", v6, v7, v8, v9, v10);

  sub_10000C880();
}

void sub_1000711D0()
{
  void *v0;
  id v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  sub_10000C8D4();
  objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "predicateType"));
  v2 = objc_msgSend((id)sub_10000C8E0(), "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  sub_10000C868();
  sub_10000C854((void *)&_mh_execute_header, v4, v5, "Predicate type: %{public}@ with unique identifier: %{public}@ failed to extract budgeted identifiers", v6, v7, v8, v9, v10);

  sub_10000C880();
}

void sub_10007125C()
{
  void *v0;
  id v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  sub_10000C8D4();
  objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "predicateType"));
  v2 = objc_msgSend((id)sub_10000C8E0(), "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  sub_10000C868();
  sub_10000C854((void *)&_mh_execute_header, v4, v5, "Predicate type: %{public}@ with unique identifier: %{public}@ failed to extract a budget schedule", v6, v7, v8, v9, v10);

  sub_10000C880();
}

void sub_1000712E8()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  sub_10000C8EC();
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "predicateType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v0, "uniqueIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v0, "calendarIdentifier"));
  sub_10000C8A4();
  sub_10000C890((void *)&_mh_execute_header, v5, v6, "Predicate type: %{public}@ with unique identifier: %{public}@ cannot have budget with invalid calendar day: %{public}@ calendar identifier: %{public}@", v7, v8, v9, v10, v11);

  sub_10000C8C0();
}

void sub_10007139C()
{
  NSObject *v0;
  uint64_t v1;
  void *v2;
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  void *v9;
  __int16 v10;
  uint64_t v11;

  sub_10000C8EC();
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "predicateType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "uniqueIdentifier"));
  v6 = 138543874;
  v7 = v4;
  v8 = 2114;
  v9 = v5;
  v10 = 2114;
  v11 = v1;
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Predicate type: %{public}@ with unique identifier: %{public}@ cannot have multiple budgets for day: %{public}@ ", (uint8_t *)&v6, 0x20u);

}

void sub_100071460(void *a1, void *a2, NSObject *a3)
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "predicateType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "uniqueIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "payloadCalendarIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "payloadNotificationTimes"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "payloadStartDay"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "payloadStartTime"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "payloadEndDay"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "payloadEndTime"));
  v14 = 138545154;
  v15 = v6;
  v16 = 2114;
  v17 = v7;
  v18 = 2114;
  v19 = v8;
  v20 = 2114;
  v21 = v9;
  v22 = 2114;
  v23 = v10;
  v24 = 2114;
  v25 = v11;
  v26 = 2114;
  v27 = v12;
  v28 = 2114;
  v29 = v13;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Predicate type: %{public}@ with unique identifier: %{public}@ failed to extract predicate with payload calendar identifier: %{public}@, payload notifications times: %{public}@, payload start day: %{public}@, payload start time: %{public}@, payload end day: %{public}@, payload end time: %{public}@", (uint8_t *)&v14, 0x52u);

}

void sub_1000715E4(void *a1)
{
  void *v2;
  os_log_t v3;
  os_log_type_t v4;
  const char *v5;
  uint8_t *v6;
  void *v7;
  void *v8;

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "predicateType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "uniqueIdentifier"));
  sub_10000E8CC();
  _os_log_error_impl(v2, v3, v4, v5, v6, 0x16u);

}

void sub_10007169C(void *a1)
{
  void *v2;
  void *v3;
  void *v4;
  os_log_t v5;
  os_log_type_t v6;
  const char *v7;
  uint8_t *v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "predicateType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "uniqueIdentifier"));
  sub_10000E8DC();
  sub_10000E8CC();
  _os_log_error_impl(v4, v5, v6, v7, v8, 0x20u);

}

void sub_100071754(void *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  os_log_t v6;
  os_log_type_t v7;
  const char *v8;
  uint8_t *v9;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "predicateType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "uniqueIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "endDate"));
  sub_10000E8DC();
  sub_10000E8CC();
  _os_log_error_impl(v5, v6, v7, v8, v9, 0x2Au);

}

void sub_100071830()
{
  uint64_t v0;
  os_log_t v1;

  sub_100018BF4();
  sub_100018BE0((void *)&_mh_execute_header, v0, v1, "Could not parse app management plist at path: %{public}@, error: %{public}@");
  sub_100018C1C();
}

void sub_100071890(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Could not write app management plist, unknown error", v1, 2u);
}

void sub_1000718D0(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100018C24((void *)&_mh_execute_header, a2, a3, "Could not write app management plist, error: %{public}@", a5, a6, a7, a8, 2u);
  sub_100018C1C();
}

void sub_100071934(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = 138543874;
  v6 = v3;
  v7 = 2114;
  v8 = v4;
  v9 = 2114;
  v10 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to set bundle identifiers %{public}@ for personaID %{public}@ with error: %{public}@", (uint8_t *)&v5, 0x20u);
}

void sub_1000719C4(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = *(_QWORD *)(a1 + 32);
  sub_100018C0C();
  sub_100018BE0((void *)&_mh_execute_header, v1, v2, "Could not set removability for bundle identifier: %{bundleIdentifier}@, error: %{public}@", (_QWORD)v3, DWORD2(v3));
  sub_100018C1C();
}

void sub_100071A30(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = *(_QWORD *)(a1 + 32);
  sub_100018C0C();
  sub_100018BE0((void *)&_mh_execute_header, v1, v2, "Could not get removability for bundle identifier: %{bundleIdentifier}@, error: %{public}@", (_QWORD)v3, DWORD2(v3));
  sub_100018C1C();
}

void sub_100071A9C(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Called [PRSettingsProvider removeMDMAppAttribute] since enabled was nil", v1, 2u);
}

void sub_100071ADC(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Called [PRSettingsProvider setMDMAppAttribute] enabled=%@", (uint8_t *)&v2, 0xCu);
  sub_100018C1C();
}

void sub_100071B4C()
{
  uint64_t v0;
  os_log_t v1;

  sub_100018BF4();
  sub_100018BE0((void *)&_mh_execute_header, v0, v1, "Could not set management options for bundle identifier: %{public}@, error: %{public}@");
  sub_100018C1C();
}

void sub_100071BAC()
{
  uint64_t v0;
  os_log_t v1;

  sub_100018BF4();
  sub_100018BE0((void *)&_mh_execute_header, v0, v1, "Could not set source identifier for app: %{public}@, error: %{public}@");
  sub_100018C1C();
}

void sub_100071C0C()
{
  uint64_t v0;
  os_log_t v1;

  sub_100018BF4();
  sub_100018BE0((void *)&_mh_execute_header, v0, v1, "Could not set configuration for app: %{public}@, error: %{public}@");
  sub_100018C1C();
}

void sub_100071C6C()
{
  uint64_t v0;
  os_log_t v1;

  sub_100018BF4();
  sub_100018BE0((void *)&_mh_execute_header, v0, v1, "Could not set allow user to lock for app: %{public}@, error: %{public}@");
  sub_100018C1C();
}

void sub_100071CCC()
{
  uint64_t v0;
  os_log_t v1;

  sub_100018BF4();
  sub_100018BE0((void *)&_mh_execute_header, v0, v1, "Could not set allow user to hide for app: %{public}@, error: %{public}@");
  sub_100018C1C();
}

void sub_100071D2C()
{
  uint64_t v0;
  os_log_t v1;

  sub_100018BF4();
  sub_100018BE0((void *)&_mh_execute_header, v0, v1, "Could not set associated domains enable direct downloads for app: %{public}@, error: %{public}@");
  sub_100018C1C();
}

void sub_100071D8C()
{
  uint64_t v0;
  os_log_t v1;

  sub_100018BF4();
  sub_100018BE0((void *)&_mh_execute_header, v0, v1, "Could not set associated domains for app: %{public}@, error: %{public}@");
  sub_100018C1C();
}

void sub_100071DEC()
{
  uint64_t v0;
  os_log_t v1;

  sub_100018BF4();
  sub_100018BE0((void *)&_mh_execute_header, v0, v1, "Could not set relay UUID for app: %{public}@, error: %{public}@");
  sub_100018C1C();
}

void sub_100071E4C()
{
  uint64_t v0;
  os_log_t v1;

  sub_100018BF4();
  sub_100018BE0((void *)&_mh_execute_header, v0, v1, "Could not set DNS proxy UUID for app: %{public}@, error: %{public}@");
  sub_100018C1C();
}

void sub_100071EAC()
{
  uint64_t v0;
  os_log_t v1;

  sub_100018BF4();
  sub_100018BE0((void *)&_mh_execute_header, v0, v1, "Could not set content filter UUID for app: %{public}@, error: %{public}@");
  sub_100018C1C();
}

void sub_100071F0C()
{
  uint64_t v0;
  os_log_t v1;

  sub_100018BF4();
  sub_100018BE0((void *)&_mh_execute_header, v0, v1, "Could not set cellular slice UUID for app: %{public}@, error: %{public}@");
  sub_100018C1C();
}

void sub_100071F6C()
{
  uint64_t v0;
  os_log_t v1;

  sub_100018BF4();
  sub_100018BE0((void *)&_mh_execute_header, v0, v1, "Could not set VPN UUID for app: %{public}@, error: %{public}@");
  sub_100018C1C();
}

void sub_100071FCC(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100018C24((void *)&_mh_execute_header, a2, a3, "Could not write management info to disk for bundle identifier: %{public}@", a5, a6, a7, a8, 2u);
  sub_100018C1C();
}

void sub_100072034(_QWORD *a1)
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "void *ProximityReaderLibrary(void)"));
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("DMDAppController.m"), 21, CFSTR("%s"), *a1);

  __break(1u);
}

void sub_1000720B0()
{
  void *v0;
  void *v1;

  v0 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Class getPRSettingsProviderClass(void)_block_invoke"));
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("DMDAppController.m"), 22, CFSTR("Unable to find class %s"), "PRSettingsProvider");

  __break(1u);
}

void sub_100072128()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10001CD7C(__stack_chk_guard);
  sub_100018C24((void *)&_mh_execute_header, v0, v1, "Could not acquire app container path for app %{public}@ to read feedback.", v2, v3, v4, v5, 2u);
  sub_100018C1C();
}

void sub_10007218C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100018C24((void *)&_mh_execute_header, a2, a3, "Feedback is not a dictionary for bundle identifier: %{public}@", a5, a6, a7, a8, 2u);
  sub_100018C1C();
}

void sub_1000721F4()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[14];
  uint64_t v3;

  sub_10001CD7C(__stack_chk_guard);
  sub_10001CD94();
  v3 = v0;
  sub_10001CD88((void *)&_mh_execute_header, v1, (uint64_t)v1, "Could not acquire sandbox extension for app %{public}@ to read feedback. Attempting to read anyway. Error: %llu", v2);
  sub_100018C1C();
}

void sub_100072260()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10001CD7C(__stack_chk_guard);
  sub_100018C24((void *)&_mh_execute_header, v0, v1, "Could not acquire app container path for app %{public}@ to write feedback.", v2, v3, v4, v5, 2u);
  sub_100018C1C();
}

void sub_1000722C4()
{
  uint64_t v0;
  NSObject *v1;
  uint64_t v2;
  uint8_t v3[14];
  uint64_t v4;

  sub_10001CD7C(__stack_chk_guard);
  sub_10001CD94();
  v4 = v0;
  sub_10001CD88((void *)&_mh_execute_header, v1, v2, "Could not acquire sandbox extension for app %{public}@ to write feedback. Attempting to write anyway. Error: %llu", v3);
  sub_100018C1C();
}

void sub_100072330(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100018C24((void *)&_mh_execute_header, a2, a3, "Could not get metadata: %{public}@", a5, a6, a7, a8, 2u);
  sub_100018C1C();
}

void sub_100072394(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138543362;
  v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Update foreground bundle identifiers: %{public}@", (uint8_t *)&v2, 0xCu);
  sub_100018C1C();
}

void sub_100072404(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138543618;
  v5 = v3;
  v6 = 2114;
  v7 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "DMF could not restart app: %{public}@ with error: %{public}@", (uint8_t *)&v4, 0x16u);
}

void sub_10007248C(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;

  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Could not initialize app lifecycle because no LSApplicationRecord for bundle identifier %{public}@, error: %{public}@", (uint8_t *)&v3, 0x16u);
}

void sub_100072510(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "App requests must have only one of bundle identifier, store item identifier, or manifest URL", v1, 2u);
}

void sub_100072550()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  sub_100024D84();
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "identifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v0, "verboseDescription"));
  sub_10000C868();
  sub_10000C854((void *)&_mh_execute_header, v4, v5, "%{public}@: Failed to initialize configuration payload for asset: %{public}@", v6, v7, v8, v9, v10);

  sub_10000C880();
}

void sub_1000725E0()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  sub_100024D84();
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "identifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v0, "verboseDescription"));
  sub_10000C868();
  sub_10000C854((void *)&_mh_execute_header, v4, v5, "%{public}@: Failed to initialize install operation for asset payload: %{public}@", v6, v7, v8, v9, v10);

  sub_10000C880();
}

void sub_100072670()
{
  NSObject *v0;
  uint64_t v1;
  id v2;
  void *v3;
  objc_class *v4;
  NSString *v5;
  void *v6;
  NSString *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;

  sub_100024D84();
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "identifier"));
  v4 = (objc_class *)objc_opt_class(v1);
  v5 = NSStringFromClass(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = NSStringFromProtocol((Protocol *)&OBJC_PROTOCOL___DMDOperationProvidingAsset);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = 138543874;
  v10 = v3;
  v11 = 2114;
  v12 = v6;
  v13 = 2114;
  v14 = v8;
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%{public}@: Asset class (%{public}@) does not implement %{public}@", (uint8_t *)&v9, 0x20u);

}

void sub_100072750()
{
  id *v0;
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  sub_100024D84();
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "identifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*v0, "verboseDescription"));
  sub_10000C868();
  sub_10000C854((void *)&_mh_execute_header, v4, v5, "%{public}@: Asset install operation failed: %{public}@", v6, v7, v8, v9, v10);

  sub_10000C880();
}

void sub_1000727E0()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  sub_100024D84();
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "identifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v0, "verboseDescription"));
  sub_10000C868();
  sub_10000C854((void *)&_mh_execute_header, v4, v5, "%{public}@: Failed to initialize remove operation for installed asset payload: %{public}@", v6, v7, v8, v9, v10);

  sub_10000C880();
}

void sub_100072870()
{
  id *v0;
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  sub_100024D84();
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "identifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*v0, "verboseDescription"));
  sub_10000C868();
  sub_10000C854((void *)&_mh_execute_header, v4, v5, "%{public}@: Failed to remove asset: %{public}@", v6, v7, v8, v9, v10);

  sub_10000C880();
}

void sub_100072900()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "DMFBeginTransactionRequest is deprecated please use DMDActivityTransactionOperation instead", v0, 2u);
}

void sub_100072944(_QWORD *a1)
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "void *ScreenTimeCoreLibrary(void)"));
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("DMDClearRestrictionsPasswordOperation+iOS.m"), 19, CFSTR("%s"), *a1);

  __break(1u);
}

void sub_1000729C0()
{
  void *v0;
  void *v1;

  v0 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Class getSTManagementStateClass(void)_block_invoke"));
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("DMDClearRestrictionsPasswordOperation+iOS.m"), 20, CFSTR("Unable to find class %s"), "STManagementState");

  __break(1u);
}

void sub_100072A38()
{
  void *v0;
  id v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  sub_100024D84();
  objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "identifier"));
  v2 = objc_msgSend((id)sub_10000C8E0(), "verboseDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  sub_10000C868();
  sub_10000C854((void *)&_mh_execute_header, v4, v5, "%{public}@: Failed to initialize configuration payload for command: %{public}@", v6, v7, v8, v9, v10);

  sub_10000C880();
}

void sub_100072AC4()
{
  void *v0;
  id v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  sub_100024D84();
  objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "identifier"));
  v2 = objc_msgSend((id)sub_10000C8E0(), "verboseDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  sub_10000C868();
  sub_10000C854((void *)&_mh_execute_header, v4, v5, "%{public}@: Failed to create request for command execution: %{public}@", v6, v7, v8, v9, v10);

  sub_10000C880();
}

void sub_100072B50()
{
  void *v0;
  uint64_t v1;
  objc_class *v2;
  NSString *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  sub_100024D84();
  v2 = (objc_class *)objc_opt_class(v1);
  v3 = NSStringFromClass(v2);
  objc_claimAutoreleasedReturnValue(v3);
  v4 = objc_msgSend((id)sub_10000C8E0(), "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  sub_10000C868();
  sub_10000C854((void *)&_mh_execute_header, v6, v7, "%{public}@: Failed to create operation from request for command execution: %{public}@", v8, v9, v10, v11, v12);

  sub_10000C880();
}

void sub_100072BE0()
{
  NSObject *v0;
  void *v1;
  id v2;
  uint64_t v3;
  objc_class *v4;
  NSString *v5;
  void *v6;
  NSString *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;

  sub_100024D84();
  objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "identifier"));
  v3 = sub_10000C8E0();
  v4 = (objc_class *)objc_opt_class(v3);
  v5 = NSStringFromClass(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = NSStringFromProtocol((Protocol *)&OBJC_PROTOCOL___DMDRequestProvidingCommand);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = 138543874;
  v10 = v1;
  v11 = 2114;
  v12 = v6;
  v13 = 2114;
  v14 = v8;
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%{public}@: %{public}@ does not conform to %{public}@", (uint8_t *)&v9, 0x20u);

}

void sub_100072CBC()
{
  id *v0;
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  sub_100024D84();
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "identifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*v0, "verboseDescription"));
  sub_10000C868();
  sub_10000C854((void *)&_mh_execute_header, v4, v5, "%{public}@: Execute command failed: %{public}@", v6, v7, v8, v9, v10);

  sub_10000C880();
}

void sub_100072D4C(void *a1, void *a2, NSObject *a3)
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "verboseDescription"));
  v7 = 138543618;
  v8 = v5;
  v9 = 2114;
  v10 = v6;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Failed to initialize command payload for command removal %{public}@: %{public}@", (uint8_t *)&v7, 0x16u);

}

void sub_100072E0C(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "identifier"));
  v4 = 138543362;
  v5 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Command did remove successfully %{public}@", (uint8_t *)&v4, 0xCu);

}

void sub_100072EA0(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = 134217984;
  v5 = v3;
  sub_10002D40C((void *)&_mh_execute_header, a2, a3, "Failed to send %lu events from subscription manager", (uint8_t *)&v4);
  sub_100018C1C();
}

void sub_100072F0C(uint64_t a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  v1 = objc_msgSend((id)sub_10002D418(a1), "verboseDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  sub_100005ECC();
  sub_100005E9C((void *)&_mh_execute_header, v3, v4, "Failed to clear failed state for existing declarations: %{public}@", v5, v6, v7, v8, v9);

  sub_100005EB0();
}

void sub_100072F84(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "verboseDescription"));
  sub_100005ECC();
  sub_100005E9C((void *)&_mh_execute_header, v2, v3, "process status operation failed with error: %{public}@", v4, v5, v6, v7, v8);

  sub_100005EB0();
}

void sub_100072FFC(uint64_t a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  v1 = objc_msgSend((id)sub_10002D42C(a1), "subscriptionDeclaration");
  v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  sub_100005ECC();
  sub_100005E9C((void *)&_mh_execute_header, v3, v4, "Failed to fetch payload metadata corresponding to %{public}@", v5, v6, v7, v8, v9);

  sub_100005EB0();
}

void sub_100073074(uint64_t a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  v1 = objc_msgSend((id)sub_10002D42C(a1), "subscriptionDeclaration");
  v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  sub_100005ECC();
  sub_100005E9C((void *)&_mh_execute_header, v3, v4, "Failed to save subscription to database %{public}@", v5, v6, v7, v8, v9);

  sub_100005EB0();
}

void sub_1000730EC(uint64_t a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  v1 = objc_msgSend((id)sub_10002D42C(a1), "subscriptionDeclaration");
  v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  sub_100005ECC();
  sub_100005E9C((void *)&_mh_execute_header, v3, v4, "Failed to fetch registration corresponding to %{public}@", v5, v6, v7, v8, v9);

  sub_100005EB0();
}

void sub_100073164(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "verboseDescription"));
  sub_100005ECC();
  sub_100005E9C((void *)&_mh_execute_header, v2, v3, "Failed to delete subscription from database %{public}@", v4, v5, v6, v7, v8);

  sub_100005EB0();
}

void sub_1000731DC(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "verboseDescription"));
  sub_100005ECC();
  sub_100005E9C((void *)&_mh_execute_header, v2, v3, "Could not fetch organizations from database: %{public}@", v4, v5, v6, v7, v8);

  sub_100005EB0();
}

void sub_100073254(uint64_t *a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;

  v3 = *a1;
  v4 = 138543362;
  v5 = v3;
  sub_10002D40C((void *)&_mh_execute_header, a2, a3, "Could not find organization with identifier: %{public}@", (uint8_t *)&v4);
  sub_100018C1C();
}

void sub_1000732C0(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "verboseDescription"));
  sub_100005ECC();
  sub_100005E9C((void *)&_mh_execute_header, v2, v3, "Failed to save event in database: %{public}@", v4, v5, v6, v7, v8);

  sub_100005EB0();
}

void sub_100073338(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "verboseDescription"));
  sub_100005ECC();
  sub_100005E9C((void *)&_mh_execute_header, v2, v3, "Engine will suspend due to error: %{public}@", v4, v5, v6, v7, v8);

  sub_100005EB0();
}

void sub_1000733B0(uint64_t a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  v1 = objc_msgSend((id)sub_10002D42C(a1), "error");
  v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  sub_100005ECC();
  sub_100005E9C((void *)&_mh_execute_header, v3, v4, "Database processing operation failed with error: %{public}@", v5, v6, v7, v8, v9);

  sub_100005EB0();
}

void sub_100073428(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "verboseDescription"));
  sub_100005ECC();
  sub_100005E9C((void *)&_mh_execute_header, v2, v3, "Failed to load organizations from database: %{public}@", v4, v5, v6, v7, v8);

  sub_100005EB0();
}

void sub_1000734A4(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "verboseDescription"));
  sub_100005ECC();
  sub_100005E9C((void *)&_mh_execute_header, v2, v3, "Failed to update subscription registrations: %{public}@", v4, v5, v6, v7, v8);

  sub_100005EB0();
}

void sub_10007351C(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "verboseDescription"));
  sub_100005ECC();
  sub_100005E9C((void *)&_mh_execute_header, v2, v3, "Failed to load organizations from database: %{public}@", v4, v5, v6, v7, v8);

  sub_100005EB0();
}

void sub_100073594(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "verboseDescription"));
  sub_100005ECC();
  sub_100005E9C((void *)&_mh_execute_header, v2, v3, "Failed to fetch declarations while scrubbing policy orphans %{public}@", v4, v5, v6, v7, v8);

  sub_100005EB0();
}

void sub_10007360C(uint8_t *a1, void *a2, _QWORD *a3, NSObject *a4)
{
  void *v7;

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "identifier"));
  *(_DWORD *)a1 = 138543362;
  *a3 = v7;
  _os_log_fault_impl((void *)&_mh_execute_header, a4, OS_LOG_TYPE_FAULT, "Declaration %{public}@ does not belong to an organization", a1, 0xCu);

}

void sub_100073680(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "verboseDescription"));
  sub_100005ECC();
  sub_100005E9C((void *)&_mh_execute_header, v2, v3, "Failed to load organizations from database while scrubbing policy orphans: %{public}@", v4, v5, v6, v7, v8);

  sub_100005EB0();
}

void sub_1000736F8(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "componentsJoinedByString:", CFSTR(",")));
  sub_100005ECC();
  sub_100005E9C((void *)&_mh_execute_header, v2, v3, "Found policies orphaned from any known organization. Removed identifiers %{public}@", v4, v5, v6, v7, v8);

  sub_100005EB0();
}

void sub_100073778(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "componentsJoinedByString:", CFSTR(",")));
  sub_100005ECC();
  sub_100005E9C((void *)&_mh_execute_header, v2, v3, "Found policies orphaned from any known declarations. Removed identifiers %{public}@", v4, v5, v6, v7, v8);

  sub_100005EB0();
}

void sub_1000737F8(uint64_t a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  v1 = objc_msgSend((id)sub_10002D418(a1), "verboseDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  sub_100005ECC();
  sub_100005E9C((void *)&_mh_execute_header, v3, v4, "failed to fetch declarations pending status update %{public}@", v5, v6, v7, v8, v9);

  sub_100005EB0();
}

void sub_100073870()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_100005ECC();
  sub_10002D40C((void *)&_mh_execute_header, v0, v1, "failed to update status %{public}@", v2);
  sub_100018C1C();
}

void sub_1000738D4(uint64_t a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  v1 = objc_msgSend((id)sub_10002D418(a1), "verboseDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  sub_100005ECC();
  sub_100005E9C((void *)&_mh_execute_header, v3, v4, "failed to fetch declarations to update their lastStatusUpdateTimestamp %{public}@", v5, v6, v7, v8, v9);

  sub_100005EB0();
}

void sub_10007394C(uint64_t a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  v1 = objc_msgSend((id)sub_10002D418(a1), "verboseDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  sub_100005ECC();
  sub_100005E9C((void *)&_mh_execute_header, v3, v4, "failed to save last updated timestamp in database %{public}@", v5, v6, v7, v8, v9);

  sub_100005EB0();
}

void sub_1000739C4(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "verboseDescription"));
  sub_100005ECC();
  sub_100005E9C((void *)&_mh_execute_header, v2, v3, "declaration update operation failed with error: %{public}@", v4, v5, v6, v7, v8);

  sub_100005EB0();
}

void sub_100073A3C(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "verboseDescription"));
  sub_100005ECC();
  sub_100005E9C((void *)&_mh_execute_header, v2, v3, "status update operation failed with error: %{public}@", v4, v5, v6, v7, v8);

  sub_100005EB0();
}

void sub_100073AB4(uint64_t a1, void *a2, NSObject *a3)
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;

  v5 = objc_msgSend((id)sub_10002D42C(a1), "organizationIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "verboseDescription"));
  v8 = 138543618;
  v9 = v6;
  v10 = 2114;
  v11 = v7;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Failed to fetch queued events for organization '%{public}@': %{public}@", (uint8_t *)&v8, 0x16u);

}

void sub_100073B74()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_100005ECC();
  sub_10002D40C((void *)&_mh_execute_header, v0, v1, "failed to send event %{public}@", v2);
  sub_100018C1C();
}

void sub_100073BD8()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_100005ECC();
  sub_10002D40C((void *)&_mh_execute_header, v0, v1, "failed to delete events from database: %{public}@", v2);
  sub_100018C1C();
}

void sub_100073C3C()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  sub_100024D84();
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "identifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v0, "verboseDescription"));
  sub_10000C868();
  sub_10000C854((void *)&_mh_execute_header, v4, v5, "%{public}@: Failed to initialize configuration payload for configuration install: %{public}@", v6, v7, v8, v9, v10);

  sub_10000C880();
}

void sub_100073CCC()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  sub_100024D84();
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "identifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v0, "verboseDescription"));
  sub_10000C868();
  sub_10000C854((void *)&_mh_execute_header, v4, v5, "%{public}@: Failed to create request for configuration install: %{public}@", v6, v7, v8, v9, v10);

  sub_10000C880();
}

void sub_100073D5C()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  objc_class *v4;
  NSString *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t v13;

  sub_100024D84();
  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "identifier"));
  v4 = (objc_class *)sub_10002DE44(v2, v3);
  v5 = NSStringFromClass(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  sub_10000C868();
  sub_10000C854((void *)&_mh_execute_header, v7, v8, "%{public}@: Failed to create operation from request for configuration install for %{public}@", v9, v10, v11, v12, v13);

  sub_10000C880();
}

void sub_100073DE8()
{
  NSObject *v0;
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  objc_class *v5;
  NSString *v6;
  void *v7;
  NSString *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;

  sub_100024D84();
  v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "identifier"));
  v5 = (objc_class *)sub_10002DE44(v3, v4);
  v6 = NSStringFromClass(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = NSStringFromProtocol((Protocol *)&OBJC_PROTOCOL___DMDRequestProvidingConfiguration);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = 138543874;
  v11 = v1;
  v12 = 2114;
  v13 = v7;
  v14 = 2114;
  v15 = v9;
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%{public}@: %{public}@ does not conform to %{public}@", (uint8_t *)&v10, 0x20u);

}

void sub_100073EC0()
{
  id *v0;
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  sub_100024D84();
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "identifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*v0, "verboseDescription"));
  sub_10000C868();
  sub_10000C854((void *)&_mh_execute_header, v4, v5, "%{public}@: Configuration failed install: %{public}@", v6, v7, v8, v9, v10);

  sub_10000C880();
}

void sub_100073F50(void *a1, const char *a2)
{
  void *v3;
  NSString *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "delegate"));
  v4 = NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  sub_10000C868();
  sub_10000C854((void *)&_mh_execute_header, v6, v7, "%{public}@ does not respond to %{public}@", v8, v9, v10, v11, v12);

  sub_10000C880();
}

void sub_100073FE4()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  sub_100024D84();
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "identifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v0, "verboseDescription"));
  sub_10000C868();
  sub_10000C854((void *)&_mh_execute_header, v4, v5, "%{public}@: Failed to initialize configuration payload for configuration remove: %{public}@", v6, v7, v8, v9, v10);

  sub_10000C880();
}

void sub_100074074()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  sub_100024D84();
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "identifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v0, "verboseDescription"));
  sub_10000C868();
  sub_10000C854((void *)&_mh_execute_header, v4, v5, "%{public}@: Failed to create request for installed configuration remove: %{public}@", v6, v7, v8, v9, v10);

  sub_10000C880();
}

void sub_100074104()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  objc_class *v4;
  NSString *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t v13;

  sub_100024D84();
  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "identifier"));
  v4 = (objc_class *)sub_10002DE44(v2, v3);
  v5 = NSStringFromClass(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  sub_10000C868();
  sub_10000C854((void *)&_mh_execute_header, v7, v8, "%{public}@: Failed to create operation from request for installed configuration removal: %{public}@", v9, v10, v11, v12, v13);

  sub_10000C880();
}

void sub_100074190()
{
  id *v0;
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  sub_100024D84();
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "identifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*v0, "verboseDescription"));
  sub_10000C868();
  sub_10000C854((void *)&_mh_execute_header, v4, v5, "%{public}@: Configuration failed remove: %{public}@", v6, v7, v8, v9, v10);

  sub_10000C880();
}

void sub_100074220()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  sub_100024D84();
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "identifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v0, "verboseDescription"));
  sub_10000C868();
  sub_10000C854((void *)&_mh_execute_header, v4, v5, "%{public}@: Failed to initialize configuration payload for configuration replace: %{public}@", v6, v7, v8, v9, v10);

  sub_10000C880();
}

void sub_1000742B0()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  sub_100024D84();
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "identifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v0, "verboseDescription"));
  sub_10000C868();
  sub_10000C854((void *)&_mh_execute_header, v4, v5, "%{public}@: Failed to create request for configuration replace: %{public}@", v6, v7, v8, v9, v10);

  sub_10000C880();
}

void sub_100074340()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  objc_class *v4;
  NSString *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t v13;

  sub_100024D84();
  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "identifier"));
  v4 = (objc_class *)sub_10002DE44(v2, v3);
  v5 = NSStringFromClass(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  sub_10000C868();
  sub_10000C854((void *)&_mh_execute_header, v7, v8, "%{public}@: Failed to create configuration replace operation for request: %{public}@", v9, v10, v11, v12, v13);

  sub_10000C880();
}

void sub_1000743CC()
{
  id *v0;
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  sub_100024D84();
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "identifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*v0, "verboseDescription"));
  sub_10000C868();
  sub_10000C854((void *)&_mh_execute_header, v4, v5, "%{public}@: Configuration failed replace: %{public}@", v6, v7, v8, v9, v10);

  sub_10000C880();
}

void sub_10007445C(uint64_t a1, void *a2)
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t v13;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "controller"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "assetIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "verboseDescription"));
  sub_100030D78();
  sub_100030D98((void *)&_mh_execute_header, v7, v8, "%{public}@ failed to initate connection to resolve asset %{public}@: %{public}@", v9, v10, v11, v12, v13);

  sub_100030DAC();
}

void sub_10007450C(uint64_t a1, void *a2)
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t v13;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "controller"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "assetIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "verboseDescription"));
  sub_100030D78();
  sub_100030D98((void *)&_mh_execute_header, v7, v8, "%{public}@ failed to resolve asset %{public}@: %{public}@", v9, v10, v11, v12, v13);

  sub_100030DAC();
}

void sub_1000745BC(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "identifier"));
  sub_1000318AC((void *)&_mh_execute_header, v2, v3, "Reporting status to %{public}@", v4, v5, v6, v7, 2u);

  sub_100005EB0();
}

void sub_100074638(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "identifier"));
  sub_1000318AC((void *)&_mh_execute_header, v2, v3, "Reporting events to %{public}@", v4, v5, v6, v7, 2u);

  sub_100005EB0();
}

void sub_1000746B4(NSObject *a1)
{
  NSString *v2;
  void *v3;
  int v4;
  void *v5;

  v2 = NSStringFromProtocol((Protocol *)&OBJC_PROTOCOL___DMDConfigurationSourceControllerDelegate);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = 138543362;
  v5 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, a1, OS_LOG_TYPE_ERROR, "delegate does not conform to %{public}@", (uint8_t *)&v4, 0xCu);

}

void sub_100074750(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "controller"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "verboseDescription"));
  sub_10000C868();
  sub_10000C854((void *)&_mh_execute_header, v5, v6, "%{public}@ failed to fetch events %{public}@", v7, v8, v9, v10, v11);

  sub_10000C880();
}

void sub_1000747E8(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "controller"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "verboseDescription"));
  sub_10000C868();
  sub_10000C854((void *)&_mh_execute_header, v5, v6, "%{public}@ failed to send events remote proxy could not be created: %{public}@", v7, v8, v9, v10, v11);

  sub_10000C880();
}

void sub_100074880(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "controller"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "verboseDescription"));
  sub_10000C868();
  sub_10000C854((void *)&_mh_execute_header, v5, v6, "%{public}@ failed to send events: %{public}@", v7, v8, v9, v10, v11);

  sub_10000C880();
}

void sub_100074918(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "controller"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "verboseDescription"));
  sub_10000C868();
  sub_10000C854((void *)&_mh_execute_header, v5, v6, "%{public}@ failed to fetch status update %{public}@", v7, v8, v9, v10, v11);

  sub_10000C880();
}

void sub_1000749B0(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "controller"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "verboseDescription"));
  sub_10000C868();
  sub_10000C854((void *)&_mh_execute_header, v5, v6, "%{public}@ failed to send status updates remote proxy coun't be created: %{public}@", v7, v8, v9, v10, v11);

  sub_10000C880();
}

void sub_100074A48(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "controller"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "verboseDescription"));
  sub_10000C868();
  sub_10000C854((void *)&_mh_execute_header, v5, v6, "%{public}@ failed to send status updates: %{public}@", v7, v8, v9, v10, v11);

  sub_10000C880();
}

void sub_100074AE0(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failing establishing anonymous connection with error: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_100074B54(uint64_t a1, NSObject *a2)
{
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "machServiceName"));
  v5 = *(_QWORD *)(a1 + 40);
  v6 = 138543618;
  v7 = v4;
  v8 = 2114;
  v9 = v5;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failing establishing connection to named service %{public}@ with error: %{public}@", (uint8_t *)&v6, 0x16u);

}

void sub_100074C08()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100005ECC();
  sub_100018C24((void *)&_mh_execute_header, &_os_log_default, v0, "getMobileEquipmentInfo: failed: %{public}@", v1, v2, v3, v4, v5);
  sub_100018C1C();
}

void sub_100074C70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100034828((void *)&_mh_execute_header, &_os_log_default, a3, "mobileEquipmentInfoList.meInfoList was unexpectedly nil", a5, a6, a7, a8, 0);
  sub_100034838();
}

void sub_100074CA4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100005ECC();
  sub_100018C24((void *)&_mh_execute_header, &_os_log_default, v0, "getMobileEquipmentInfoFor:error: failed: %{public}@", v1, v2, v3, v4, v5);
  sub_100018C1C();
}

void sub_100074D0C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100005ECC();
  sub_100018C24((void *)&_mh_execute_header, &_os_log_default, v0, "getLocalizedOperatorName:error: failed: %{public}@", v1, v2, v3, v4, v5);
  sub_100018C1C();
}

void sub_100074D74(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100034828((void *)&_mh_execute_header, &_os_log_default, a3, "nil client passed to _DataServiceSubscriptionContextFromClient", a5, a6, a7, a8, 0);
  sub_100034838();
}

void sub_100074DA8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100005ECC();
  sub_100018C24((void *)&_mh_execute_header, &_os_log_default, v0, "could not fetch carrier name from carrier bundle: %{public}@", v1, v2, v3, v4, v5);
  sub_100018C1C();
}

void sub_100074E10()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100005ECC();
  sub_100018C24((void *)&_mh_execute_header, &_os_log_default, v0, "copyCarrierBundleVersion:error: failed: %{public}@", v1, v2, v3, v4, v5);
  sub_100018C1C();
}

void sub_100074E78()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100005ECC();
  sub_100018C24((void *)&_mh_execute_header, &_os_log_default, v0, "copyMobileCountryCode:error: failed: %{public}@", v1, v2, v3, v4, v5);
  sub_100018C1C();
}

void sub_100074EE0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100005ECC();
  sub_100018C24((void *)&_mh_execute_header, &_os_log_default, v0, "copyMobileNetworkCode:error: failed: %{public}@", v1, v2, v3, v4, v5);
  sub_100018C1C();
}

void sub_100074F48()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100005ECC();
  sub_100018C24((void *)&_mh_execute_header, &_os_log_default, v0, "unable to determine if data roaming is allowed, assuming NO: %{public}@", v1, v2, v3, v4, v5);
  sub_100018C1C();
}

void sub_100074FB0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100005ECC();
  sub_100018C24((void *)&_mh_execute_header, &_os_log_default, v0, "unable to get a service descriptor to determine if data roaming is enabled, assuming NO: %{public}@", v1, v2, v3, v4, v5);
  sub_100018C1C();
}

void sub_100075018()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100005ECC();
  sub_100018C24((void *)&_mh_execute_header, &_os_log_default, v0, "unable to set data roaming: %{public}@", v1, v2, v3, v4, v5);
  sub_100018C1C();
}

void sub_100075080()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100005ECC();
  sub_100018C24((void *)&_mh_execute_header, &_os_log_default, v0, "unable to get a service descriptor to set data roaming: %{public}@", v1, v2, v3, v4, v5);
  sub_100018C1C();
}

void sub_1000750E8(uint64_t a1)
{
  int v1;
  const char *v2;
  __int16 v3;
  uint64_t v4;

  v1 = 136315394;
  v2 = "+[DMDCoreTelephonyUtilities isSubscriptionRoaming:client:]";
  v3 = 2112;
  v4 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%s: copyRegistrationStatus:error: failed: %@", (uint8_t *)&v1, 0x16u);
  sub_100018C1C();
}

void sub_100075174(int a1)
{
  _DWORD v1[2];

  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Voice roaming is already set to %d. Not setting again.", (uint8_t *)v1, 8u);
  sub_100034838();
}

void sub_1000751EC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100005ECC();
  sub_100018C24((void *)&_mh_execute_header, &_os_log_default, v0, "could not get voice roaming switch from carrier bundle, assuming NO: %{public}@", v1, v2, v3, v4, v5);
  sub_100018C1C();
}

void sub_100075254()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100005ECC();
  sub_100018C24((void *)&_mh_execute_header, &_os_log_default, v0, "voice roaming switch value from carrier bundle is not a BOOLean, assuming NO: %{public}@", v1, v2, v3, v4, v5);
  sub_100018C1C();
}

void sub_1000752BC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100005ECC();
  sub_100018C24((void *)&_mh_execute_header, &_os_log_default, v0, "Failed to fetch vinyl info, CTError = %@", v1, v2, v3, v4, v5);
  sub_100018C1C();
}

void sub_100075324(char a1, uint64_t a2)
{
  _DWORD v2[2];
  __int16 v3;
  uint64_t v4;

  v2[0] = 67109378;
  v2[1] = a1 & 1;
  v3 = 2112;
  v4 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "_CTServerConnectionStandaloneGetCachedVinylInfo => result = %d, dict = %@", (uint8_t *)v2, 0x12u);
  sub_100018C1C();
}

void sub_1000753AC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100005ECC();
  sub_100018C24((void *)&_mh_execute_header, &_os_log_default, v0, "Failed to download cellular profile, CTError = %@", v1, v2, v3, v4, v5);
  sub_100018C1C();
}

void sub_100075414(char a1)
{
  _DWORD v1[2];

  v1[0] = 67109120;
  v1[1] = a1 & 1;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "_CTServerConnectionStandaloneDownloadProfile => result = %d", (uint8_t *)v1, 8u);
  sub_100034838();
}

void sub_100075490(int a1)
{
  _DWORD v1[2];

  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Could not get battery level. IOReturn Error Code: %d", (uint8_t *)v1, 8u);
  sub_100034838();
}

void sub_100075508()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100005ECC();
  sub_100018C24((void *)&_mh_execute_header, &_os_log_default, v0, "Could not get Do Not Disturb state: %@", v1, v2, v3, v4, v5);
  sub_100018C1C();
}

void sub_100075570()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_100037D44();
  sub_100037D34((void *)&_mh_execute_header, &_os_log_default, v0, "copyMobileNetworkCode:error: in %s failed: %{public}@", v1, v2, v3, v4, 2u);
  sub_100018C1C();
}

void sub_1000755E4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_100037D44();
  sub_100037D34((void *)&_mh_execute_header, &_os_log_default, v0, "copyMobileCountryCode:error: in %s failed: %{public}@", v1, v2, v3, v4, 2u);
  sub_100018C1C();
}

void sub_100075658()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_100037D44();
  sub_100037D34((void *)&_mh_execute_header, &_os_log_default, v0, "getLocalizedOperatorName:error: in %s failed: %{public}@", v1, v2, v3, v4, 2u);
  sub_100018C1C();
}

void sub_1000756CC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_100037D44();
  sub_100037D34((void *)&_mh_execute_header, &_os_log_default, v0, "copyCarrierBundleValue:error: (CarrierName) in %s failed: %{public}@", v1, v2, v3, v4, 2u);
  sub_100018C1C();
}

void sub_100075740()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_100037D44();
  sub_100037D34((void *)&_mh_execute_header, &_os_log_default, v0, "copyCarrierBundleVersion:error: in %s failed: %{public}@", v1, v2, v3, v4, 2u);
  sub_100018C1C();
}

void sub_1000757B4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_100037D44();
  sub_100037D34((void *)&_mh_execute_header, &_os_log_default, v0, "getSimLabel:error: in %s failed: %{public}@", v1, v2, v3, v4, 2u);
  sub_100018C1C();
}

void sub_100075828(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100018C24((void *)&_mh_execute_header, &_os_log_default, a3, "getSimLabel:error: in %s label.unique_id is nil", a5, a6, a7, a8, 2u);
  sub_100018C1C();
}

void sub_10007589C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100018C24((void *)&_mh_execute_header, &_os_log_default, a3, "getSimLabel:error: in %s label.text is nil", a5, a6, a7, a8, 2u);
  sub_100018C1C();
}

void sub_100075910()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_100037D44();
  sub_100037D34((void *)&_mh_execute_header, &_os_log_default, v0, "getPhoneNumber:error: in %s failed: %{public}@", v1, v2, v3, v4, 2u);
  sub_100018C1C();
}

void sub_100075984(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100018C24((void *)&_mh_execute_header, &_os_log_default, a3, "getPhoneNumber:error: in %s returned nil number", a5, a6, a7, a8, 2u);
  sub_100018C1C();
}

void sub_1000759F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  sub_100037D58((void *)&_mh_execute_header, &_os_log_default, a3, "mobileEquipmentInfoList.meInfoList was unexpectedly nil", v3);
  sub_100034838();
}

void sub_100075A30(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  sub_100037D58((void *)&_mh_execute_header, &_os_log_default, a3, "ServiceSubscriptionInfo subscriptionsInUse is unexpectedly nil", v3);
  sub_100034838();
}

void sub_100075A68(const char *a1)
{
  NSString *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = NSStringFromSelector(a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  sub_100005ECC();
  sub_100037D34((void *)&_mh_execute_header, &_os_log_default, v3, "getSubscriptionInfoWithError: in %{public}@ failed: %{public}@", v4, v5, v6, v7, v8);

}

void sub_100075AFC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  sub_100037D58((void *)&_mh_execute_header, &_os_log_default, a3, "subscription has an unknown slotId, ignoring", v3);
  sub_100034838();
}

void sub_100075B34(uint8_t *a1, _BYTE *a2, uint64_t a3)
{
  *a1 = 0;
  *a2 = 0;
  sub_100037D58((void *)&_mh_execute_header, &_os_log_default, a3, "subscription with duplicate slotId, discarding first instance", a1);
}

void sub_100075B6C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  sub_100037D58((void *)&_mh_execute_header, &_os_log_default, a3, "equipmentInfo has an unknown slotId, ignoring", v3);
  sub_100034838();
}

void sub_100075BA4(uint8_t *a1, _BYTE *a2, uint64_t a3)
{
  *a1 = 0;
  *a2 = 0;
  sub_100037D58((void *)&_mh_execute_header, &_os_log_default, a3, "equipmentInfo with duplicate slotId, discarding first instance", a1);
}

void sub_100075BDC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100005ECC();
  sub_100018C24((void *)&_mh_execute_header, &_os_log_default, v0, "Can't query for device locator lock state. Error: %{public}@", v1, v2, v3, v4, v5);
  sub_100018C1C();
}

void sub_100075C44()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100005ECC();
  sub_100018C24((void *)&_mh_execute_header, &_os_log_default, v0, "Can't query for activation lock state. Error: %{public}@", v1, v2, v3, v4, v5);
  sub_100018C1C();
}

void sub_100075CAC(uint64_t *a1)
{
  uint64_t v1;
  int v2;
  uint64_t v3;

  v1 = *a1;
  v2 = 138543362;
  v3 = v1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Could not disable lost mode: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_100075D2C(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "Unexpected use of excludedIdentifiers", v1, 2u);
}

void sub_100075D6C(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  __int16 v4;
  const __CFString *v5;

  v2 = 138543618;
  v3 = a1;
  v4 = 2114;
  v5 = CFSTR("com.apple.private.dmd.emergency-mode");
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Client %{public}@ does not have required %{public}@ entitlement", (uint8_t *)&v2, 0x16u);
}

void sub_100075DF4()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "DMFEndTransactionRequest is deprecated please use DMDActivityTransactionOperation instead", v0, 2u);
}

void sub_100075E38(void *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "organizationIdentifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "verboseDescription"));
  sub_10000C854((void *)&_mh_execute_header, v4, v5, "failed to fetch existing organizations with identifier “%{public}@”: %{public}@", v6, v7, v8, v9, 2u);

  sub_10000C880();
}

void sub_100075EDC(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "organization of type %{public}@ already exists", (uint8_t *)&v2, 0xCu);
}

void sub_100075F50(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "verboseDescription"));
  sub_10000C854((void *)&_mh_execute_header, v2, v3, "failed to fetch organizations of type “%{public}@”: %{public}@", v4, v5, v6, v7, 2u);

  sub_10000C880();
}

void sub_100075FE4(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "verboseDescription"));
  sub_100005E9C((void *)&_mh_execute_header, v2, v3, "failed to load persistent stores: %{public}@", v4, v5, v6, v7, 2u);

  sub_100005EB0();
}

void sub_100076060(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "verboseDescription"));
  sub_100005E9C((void *)&_mh_execute_header, v2, v3, "failed to load persistent stores: %{public}@", v4, v5, v6, v7, 2u);

  sub_100005EB0();
}

void sub_1000760E0(uint8_t *a1, void *a2, _QWORD *a3, NSObject *a4)
{
  void *v7;

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "verboseDescription"));
  *(_DWORD *)a1 = 138543362;
  *a3 = v7;
  _os_log_error_impl((void *)&_mh_execute_header, a4, OS_LOG_TYPE_ERROR, "failed to remove legacy database: %{public}@", a1, 0xCu);

}

void sub_100076154(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "verboseDescription"));
  v6 = 138543618;
  v7 = a1;
  v8 = 2114;
  v9 = v5;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Could not set persistent store backup flag %{public}@: %{public}@", (uint8_t *)&v6, 0x16u);

}

void sub_100076204(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138543362;
  v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "successfully loaded persistent store: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_100076278(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "checking database for deprecated class", v1, 2u);
}

void sub_1000762B8()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  sub_10003F248();
  v2 = objc_msgSend((id)sub_10003F23C(v0, v1), "verboseDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  sub_10003F218();
  sub_10000C854((void *)&_mh_execute_header, v4, v5, "%{public}@ failed to fetch configuration organizations: %{public}@", v6, v7, v8, v9, v10);

  sub_10000C880();
}

void sub_100076334(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "verboseDescription"));
  sub_100005ECC();
  sub_100005E9C((void *)&_mh_execute_header, v2, v3, "Processing operation failed to commit changes: %{public}@", v4, v5, v6, v7, v8);

  sub_100005EB0();
}

void sub_1000763AC()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  sub_10003F248();
  v2 = objc_msgSend((id)sub_10003F23C(v0, v1), "verboseDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  sub_10003F218();
  sub_10000C854((void *)&_mh_execute_header, v4, v5, "%{public}@ preprocessing failed: %{public}@", v6, v7, v8, v9, v10);

  sub_10000C880();
}

void sub_100076428(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "verboseDescription"));
  sub_100005ECC();
  sub_100005E9C((void *)&_mh_execute_header, v2, v3, "Failed to preproccess database while fetching all payloads: %{public}@", v4, v5, v6, v7, v8);

  sub_100005EB0();
}

void sub_1000764A0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  id v3;
  void *v4;
  uint8_t v5[24];

  sub_10003F248();
  v3 = objc_msgSend((id)sub_10003F23C(v1, v2), "verboseDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  sub_10003F218();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "%{public}@ failed to fetch configurations: %{public}@", v5, 0x16u);

  sub_10000C880();
}

void sub_10007652C()
{
  os_log_t v0;
  uint8_t v1[24];

  sub_100005ECC();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%{public}@ failed to resolve restrictions plist URL", v1, 0xCu);
}

void sub_10007659C()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  sub_10003F248();
  v2 = objc_msgSend((id)sub_10003F23C(v0, v1), "verboseDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  sub_10003F218();
  sub_10000C854((void *)&_mh_execute_header, v4, v5, "%{public}@ failed to write restrictions: %{public}@", v6, v7, v8, v9, v10);

  sub_10000C880();
}

void sub_100076618(uint64_t a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  v1 = objc_msgSend((id)sub_10002D42C(a1), "verboseDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  sub_100005ECC();
  sub_100005E9C((void *)&_mh_execute_header, v3, v4, "Processing: Failed to fetch commands to execute %{public}@", v5, v6, v7, v8, v9);

  sub_100005EB0();
}

void sub_100076690(uint64_t a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  v1 = objc_msgSend((id)sub_10002D42C(a1), "verboseDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  sub_100005ECC();
  sub_100005E9C((void *)&_mh_execute_header, v3, v4, "Processing: Failed to fetch commands to remove %{public}@", v5, v6, v7, v8, v9);

  sub_100005EB0();
}

void sub_100076708(uint64_t a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  v1 = objc_msgSend((id)sub_10002D42C(a1), "verboseDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  sub_100005ECC();
  sub_100005E9C((void *)&_mh_execute_header, v3, v4, "Processing: Failed to fetch commands to delete %{public}@", v5, v6, v7, v8, v9);

  sub_100005EB0();
}

void sub_100076780()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10003F230();
  sub_10003F208((void *)&_mh_execute_header, v0, v1, "---", v2, v3, v4, v5, v6);
  sub_100034838();
}

void sub_1000767AC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10003F230();
  sub_10003F208((void *)&_mh_execute_header, v0, v1, "--- Enqueued command action operations ---", v2, v3, v4, v5, v6);
  sub_100034838();
}

void sub_1000767D8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10003F230();
  sub_10003F208((void *)&_mh_execute_header, v0, v1, "--- Commands pending deletion ---", v2, v3, v4, v5, v6);
  sub_100034838();
}

void sub_100076804()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10003F230();
  sub_10003F208((void *)&_mh_execute_header, v0, v1, "--- Commands pending removal ---", v2, v3, v4, v5, v6);
  sub_100034838();
}

void sub_100076830()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10003F230();
  sub_10003F208((void *)&_mh_execute_header, v0, v1, "--- Commands pending execution ---", v2, v3, v4, v5, v6);
  sub_100034838();
}

void sub_10007685C(uint64_t a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  v1 = objc_msgSend((id)sub_10002D42C(a1), "verboseDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  sub_100005ECC();
  sub_100005E9C((void *)&_mh_execute_header, v3, v4, "Failed to process activations: %{public}@", v5, v6, v7, v8, v9);

  sub_100005EB0();
}

void sub_1000768D4(uint64_t a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  v1 = objc_msgSend((id)sub_10002D42C(a1), "verboseDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  sub_100005ECC();
  sub_100005E9C((void *)&_mh_execute_header, v3, v4, "Processing: Failed to fetch declarations pending removal %{public}@", v5, v6, v7, v8, v9);

  sub_100005EB0();
}

void sub_10007694C(uint64_t a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  v1 = objc_msgSend((id)sub_10002D42C(a1), "verboseDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  sub_100005ECC();
  sub_100005E9C((void *)&_mh_execute_header, v3, v4, "Processing: Failed to fetch declarations pending install %{public}@", v5, v6, v7, v8, v9);

  sub_100005EB0();
}

void sub_1000769C4(uint64_t a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  v1 = objc_msgSend((id)sub_10002D42C(a1), "verboseDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  sub_100005ECC();
  sub_100005E9C((void *)&_mh_execute_header, v3, v4, "Processing: Failed to fetch declarations pending delete %{public}@", v5, v6, v7, v8, v9);

  sub_100005EB0();
}

void sub_100076A3C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10003F230();
  sub_10003F208((void *)&_mh_execute_header, v0, v1, "--- Enqueued declaration action operations ---", v2, v3, v4, v5, v6);
  sub_100034838();
}

void sub_100076A68()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10003F230();
  sub_10003F208((void *)&_mh_execute_header, v0, v1, "--- Declarations pending deletion ---", v2, v3, v4, v5, v6);
  sub_100034838();
}

void sub_100076A94()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10003F230();
  sub_10003F208((void *)&_mh_execute_header, v0, v1, "--- Declarations pending removal ---", v2, v3, v4, v5, v6);
  sub_100034838();
}

void sub_100076AC0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10003F230();
  sub_10003F208((void *)&_mh_execute_header, v0, v1, "--- Declarations pending install ---", v2, v3, v4, v5, v6);
  sub_100034838();
}

void sub_100076AEC(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "organizationIdentifier"));
  v4 = 138543362;
  v5 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to fetch payload metadata for organization %{public}@", (uint8_t *)&v4, 0xCu);

}

void sub_100076B80(void *a1, void *a2, NSObject *a3)
{
  id v5;
  void *v6;
  int v7;
  id v8;
  __int16 v9;
  void *v10;

  v5 = objc_msgSend(a1, "count");
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "organizationIdentifier"));
  v7 = 134218242;
  v8 = v5;
  v9 = 2114;
  v10 = v6;
  _os_log_debug_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_DEBUG, "Refreshed %lu status items for organization %{public}@", (uint8_t *)&v7, 0x16u);

}

void sub_100076C38(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "verboseDescription"));
  sub_100005E9C((void *)&_mh_execute_header, v2, v3, "Failed to fetch existing declarations: %{public}@", v4, v5, v6, v7, 2u);

  sub_100005EB0();
}

void sub_100076CB4(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "verboseDescription"));
  sub_100005E9C((void *)&_mh_execute_header, v2, v3, "Failed to initialize declarations: %{public}@", v4, v5, v6, v7, 2u);

  sub_100005EB0();
}

void sub_100076D30(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "verboseDescription"));
  sub_100005E9C((void *)&_mh_execute_header, v2, v3, "Failed to save changes: %{public}@", v4, v5, v6, v7, 2u);

  sub_100005EB0();
}

void sub_100076DAC(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;

  v3 = 138543362;
  v4 = a1;
  sub_10002D40C((void *)&_mh_execute_header, a2, a3, "Failed to instantiate payload metadata from payload dictionary: %{public}@", (uint8_t *)&v3);
}

void sub_100076E18(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "verboseDescription"));
  v5 = 138543362;
  v6 = v3;
  sub_10002D40C((void *)&_mh_execute_header, a2, v4, "Failed to save changes: %{public}@", (uint8_t *)&v5);

}

void sub_100076EA4(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "verboseDescription"));
  sub_100005ECC();
  sub_100005E9C((void *)&_mh_execute_header, v2, v3, "Failed to save changes: %{public}@", v4, v5, v6, v7, v8);

  sub_100005EB0();
}

void sub_100076F1C(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "verboseDescription"));
  sub_100005ECC();
  sub_100005E9C((void *)&_mh_execute_header, v2, v3, "Failed to fetch existing declarations for update: %{public}@", v4, v5, v6, v7, v8);

  sub_100005EB0();
}

void sub_100076F94(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "verboseDescription"));
  sub_100005ECC();
  sub_100005E9C((void *)&_mh_execute_header, v2, v3, "Failed to initialize declarations for update: %{public}@", v4, v5, v6, v7, v8);

  sub_100005EB0();
}

void sub_10007700C(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "verboseDescription"));
  sub_100005ECC();
  sub_100005E9C((void *)&_mh_execute_header, v2, v3, "Failed to fetch existing declarations for removal: %{public}@", v4, v5, v6, v7, v8);

  sub_100005EB0();
}

void sub_100077084(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Unknown event stream frequency %{public}@, defaulting to Daily", (uint8_t *)&v2, 0xCu);
}

void sub_1000770F8(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "fetch-os-update-status end with error: %@", (uint8_t *)&v2, 0xCu);
}

void sub_10007716C(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "verboseDescription"));
  sub_100005ECC();
  sub_100005E9C((void *)&_mh_execute_header, v2, v3, "Could not serialize profile: %{public}@", v4, v5, v6, v7, v8);

  sub_100005EB0();
}

void sub_1000771E4(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "verboseDescription"));
  sub_100005ECC();
  sub_100005E9C((void *)&_mh_execute_header, v2, v3, "Could not retrieve restrictions dictionary from payload: %{public}@", v4, v5, v6, v7, v8);

  sub_100005EB0();
}

void sub_10007725C(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "verboseDescription"));
  sub_100005ECC();
  sub_100005E9C((void *)&_mh_execute_header, v2, v3, "Could not process restriction heuristics for payload: %{public}@", v4, v5, v6, v7, v8);

  sub_100005EB0();
}

void sub_1000772D4(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "verboseDescription"));
  sub_100005ECC();
  sub_100005E9C((void *)&_mh_execute_header, v2, v3, "Could not apply restrictions: %{public}@", v4, v5, v6, v7, v8);

  sub_100005EB0();
}

void sub_10007734C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100034828((void *)&_mh_execute_header, &_os_log_default, a3, "The app store is not allowed, so we cannot invite to VPP", a5, a6, a7, a8, 0);
}

void sub_100077384(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100034828((void *)&_mh_execute_header, &_os_log_default, a3, "Invalid VPP invitation URL", a5, a6, a7, a8, 0);
}

void sub_1000773BC(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100018C24((void *)&_mh_execute_header, a2, a3, "Error writing manage app prompt policy data to file: %{public}@", a5, a6, a7, a8, 2u);
}

void sub_100077424(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100018C24((void *)&_mh_execute_header, a2, a3, "Error generating manage app prompt policy data from dictionary: %{public}@", a5, a6, a7, a8, 2u);
}

void sub_10007748C()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Unexpected type of data stored in LastCloudBackupDate. Ignoring.", v0, 2u);
}

void sub_1000774D0(int a1)
{
  _DWORD v1[2];

  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Unable to set device name with error %d", (uint8_t *)v1, 8u);
}

void sub_10007754C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100034828((void *)&_mh_execute_header, &_os_log_default, a3, "Location Manager timed out", a5, a6, a7, a8, 0);
  sub_100034838();
}

void sub_100077580()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100005ECC();
  sub_100018C24((void *)&_mh_execute_header, &_os_log_default, v0, "Could not read device last location requested file: %@", v1, v2, v3, v4, v5);
  sub_100018C1C();
}

void sub_1000775E8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100005ECC();
  sub_100018C24((void *)&_mh_execute_header, &_os_log_default, v0, "Could not remove device last located file: %@", v1, v2, v3, v4, v5);
  sub_100018C1C();
}

void sub_100077650(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100034828((void *)&_mh_execute_header, &_os_log_default, a3, "Location Manager returned a location, but we can't report it because we can't record that fact. Throwing location information away.", a5, a6, a7, a8, 0);
  sub_100034838();
}

void sub_100077684()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100005ECC();
  sub_100018C24((void *)&_mh_execute_header, &_os_log_default, v0, "Location Manager failed: error=%{public}@", v1, v2, v3, v4, v5);
  sub_100018C1C();
}

void sub_1000776EC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100005ECC();
  sub_100018C24((void *)&_mh_execute_header, &_os_log_default, v0, "Could not write device last located time interval URL resourve values: %@", v1, v2, v3, v4, v5);
  sub_100018C1C();
}

void sub_100077754(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100034828((void *)&_mh_execute_header, &_os_log_default, a3, "Could not write device last located time interval", a5, a6, a7, a8, 0);
  sub_100034838();
}

void sub_100077788(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100034828((void *)&_mh_execute_header, &_os_log_default, a3, "Failed to set backup exclusion on managed books directory", a5, a6, a7, a8, 0);
}

void sub_1000777C0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100005ECC();
  sub_100018C24((void *)&_mh_execute_header, &_os_log_default, v0, "Cannot write book without persistent ID to manifest: %{public}@", v1, v2, v3, v4, v5);
  sub_100018C1C();
}

void sub_100077828()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100005ECC();
  sub_100018C24((void *)&_mh_execute_header, &_os_log_default, v0, "Cannot write book without iTunes Store ID to manifest: %{public}@", v1, v2, v3, v4, v5);
  sub_100018C1C();
}

void sub_100077890()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100005ECC();
  sub_100018C24((void *)&_mh_execute_header, &_os_log_default, v0, "Cannot cancel downloads. Ignoring. Error: %{public}@", v1, v2, v3, v4, v5);
  sub_100018C1C();
}

void sub_1000778F8()
{
  __assert_rtn("-[DMDManagedMediaManager installNonStoreBook:fileExtension:URL:assertion:completionBlock:]", "DMDManagedMediaManager+iOS.m", 509, "book.persistentID");
}

void sub_100077920(void *a1, uint64_t a2)
{
  void *v3;
  uint8_t v4[12];
  __int16 v5;
  uint64_t v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "kind"));
  sub_100005ECC();
  v5 = 2114;
  v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Replacing a book of kind %{public}@ with a book of kind %{public}@ is not allowed.", v4, 0x16u);

}

void sub_1000779C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100034828((void *)&_mh_execute_header, &_os_log_default, a3, "Could not find book in VPP purchase history.", a5, a6, a7, a8, 0);
}

void sub_1000779F8()
{
  uint8_t v0[24];

  sub_100005ECC();
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "We found a book, but it was not VPP-licensed. Book %{public}@", v0, 0xCu);
  sub_100018C1C();
}

void sub_100077A6C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100005ECC();
  sub_100018C24((void *)&_mh_execute_header, &_os_log_default, v0, "Could not look up book purchase history. Error: %{public}@", v1, v2, v3, v4, v5);
  sub_100018C1C();
}

void sub_100077AD4(uint64_t a1)
{
  int v1;
  uint64_t v2;

  v1 = 138543362;
  v2 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Error excluding %{public}@ from backup. Path does not exist.", (uint8_t *)&v1, 0xCu);
}

void sub_100077B50(void *a1, uint64_t a2)
{
  void *v3;
  int v4;
  void *v5;
  __int16 v6;
  uint64_t v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "path"));
  v4 = 138543618;
  v5 = v3;
  v6 = 2114;
  v7 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Error excluding %{public}@ from backup %{public}@", (uint8_t *)&v4, 0x16u);

}

void sub_100077BF4(void *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  uint8_t v5[24];

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "metadata"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bundleIdentifier"));
  sub_100005ECC();
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failing install app request because we are already prompting the user about bundle identifier: %{public}@", v5, 0xCu);

  sub_10000C880();
}

void sub_100077C90()
{
  uint64_t v0;
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  sub_100024D84();
  v1 = objc_msgSend((id)sub_100056428(v0), "metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "bundleIdentifier"));
  sub_100056410();
  sub_10000C854((void *)&_mh_execute_header, v4, v5, "Error associating app with persona: %{public}@, %{public}@", v6, v7, v8, v9, v10);

  sub_10000C880();
}

void sub_100077D1C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100018C24((void *)&_mh_execute_header, a2, a3, "Failing install of app because free purchases are not allowed: %{public}@", a5, a6, a7, a8, 2u);
  sub_100018C1C();
}

void sub_100077D84()
{
  uint64_t v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  sub_100024D84();
  v1 = objc_msgSend((id)sub_100056428(v0), "removable");
  v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  sub_100056410();
  sub_10000C854((void *)&_mh_execute_header, v3, v4, "Error attempting to set removability to %{public}@ Error: %{public}@", v5, v6, v7, v8, v9);

  sub_10000C880();
}

void sub_100077E00()
{
  uint64_t v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  sub_100024D84();
  v1 = objc_msgSend((id)sub_100056428(v0), "tapToPayScreenLock");
  v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  sub_100056410();
  sub_10000C854((void *)&_mh_execute_header, v3, v4, "Error attempting to set tap to pay screen lock to %{public}@ Error: %{public}@", v5, v6, v7, v8, v9);

  sub_10000C880();
}

void sub_100077E7C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005ECC();
  sub_100018C24((void *)&_mh_execute_header, v0, v1, "Error attempting SINF swap: %{public}@", v2, v3, v4, v5, v6);
  sub_100018C1C();
}

void sub_100077EDC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005ECC();
  sub_100018C24((void *)&_mh_execute_header, v0, v1, "Invalid message format, error: %{public}@", v2, v3, v4, v5, v6);
  sub_100018C1C();
}

void sub_100077F3C(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Show user installation failure prompt", v1, 2u);
}

void sub_100077F7C()
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

  sub_100024D84();
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[DMFAppManagementInformation stringForState:](DMFAppManagementInformation, "stringForState:", v0));
  sub_100056410();
  sub_10000C854((void *)&_mh_execute_header, v2, v3, "Could not mark app state as %{public}@ for bundle identifier: %{public}@", v4, v5, v6, v7, v8);

  sub_10000C880();
}

void sub_100078004(uint64_t a1)
{
  NSObject *v1;
  int v2;
  uint64_t v3;

  v2 = 138543618;
  v3 = a1;
  sub_100018C0C();
  sub_10001CD88((void *)&_mh_execute_header, v1, (uint64_t)v1, "Could not update management info for bundle identifier: %{public}@, error: %{public}@", (uint8_t *)&v2);
  sub_100018C1C();
}

void sub_100078074()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005ECC();
  sub_100018C24((void *)&_mh_execute_header, v0, v1, "Error attempting to reset removability. Error: %{public}@", v2, v3, v4, v5, v6);
  sub_100018C1C();
}

void sub_1000780D4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005ECC();
  sub_100018C24((void *)&_mh_execute_header, v0, v1, "Error attempting to reset Tap To Pay Screen Lock. Error: %{public}@", v2, v3, v4, v5, v6);
  sub_100018C1C();
}

void sub_100078134(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  int v3;
  uint64_t v4;

  v1 = *(_QWORD *)(a1 + 32);
  v3 = 138543618;
  v4 = v1;
  sub_100018C0C();
  sub_10001CD88((void *)&_mh_execute_header, v2, (uint64_t)v2, "Error attempting to set removability to %{public}@ Error: %{public}@", (uint8_t *)&v3);
  sub_100018C1C();
}

void sub_1000781A8(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  int v3;
  uint64_t v4;

  v1 = *(_QWORD *)(a1 + 32);
  v3 = 138543618;
  v4 = v1;
  sub_100018C0C();
  sub_10001CD88((void *)&_mh_execute_header, v2, (uint64_t)v2, "Error attempting to set tapToPayControlLock to %{public}@ Error: %{public}@", (uint8_t *)&v3);
  sub_100018C1C();
}

void sub_10007821C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100018C24((void *)&_mh_execute_header, a2, a3, "Prompt to manage app %{public}@ blocked by policy. Too many requests.", a5, a6, a7, a8, 2u);
  sub_100018C1C();
}

void sub_100078284(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[DMFAppManagementInformation stringForState:](DMFAppManagementInformation, "stringForState:", a1));
  v7 = 138543618;
  v8 = v5;
  v9 = 2114;
  v10 = a2;
  sub_10001CD88((void *)&_mh_execute_header, a3, v6, "Could not mark app state as %{public}@ for bundle identifier: %{public}@", (uint8_t *)&v7);

}

void sub_100078334(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100018C24((void *)&_mh_execute_header, a2, a3, "Error attempting SINF swap: %{public}@", a5, a6, a7, a8, 2u);
  sub_100018C1C();
}

void sub_100078398()
{
  NSObject *v0;
  uint8_t v1[24];

  sub_100057704();
  sub_10001CD88((void *)&_mh_execute_header, v0, (uint64_t)v0, "Error attempting to set removability to %{public}@ Error: %{public}@", v1);
  sub_100018C1C();
}

void sub_100078404()
{
  NSObject *v0;
  uint8_t v1[24];

  sub_100057704();
  sub_10001CD88((void *)&_mh_execute_header, v0, (uint64_t)v0, "Error attempting to set tapToPayControlLock to %{public}@ Error: %{public}@", v1);
  sub_100018C1C();
}

void sub_100078470(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100034828((void *)&_mh_execute_header, &_os_log_default, a3, "Failed to get profile system group container path. Overriding with expected path", a5, a6, a7, a8, 0);
}

void sub_1000784A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100037D34((void *)&_mh_execute_header, &_os_log_default, a3, "Received a profile system group container path we weren't expecting\nExpected: %{public}@\nActual: %{public}@\nOverriding MCM with expected path", a5, a6, a7, a8, 2u);
  sub_100018C1C();
}

void sub_100078530(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100034828((void *)&_mh_execute_header, &_os_log_default, a3, "Failed to get managed books system group container", a5, a6, a7, a8, 0);
}

void sub_100078568(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100037D34((void *)&_mh_execute_header, &_os_log_default, a3, "Error getting system group container for %{public}@: %llu", a5, a6, a7, a8, 2u);
  sub_100018C1C();
}

void sub_1000785E4(uint64_t a1, uint64_t a2)
{
  int v2;
  uint64_t v3;
  __int16 v4;
  uint64_t v5;

  v2 = 138543618;
  v3 = a1;
  v4 = 2082;
  v5 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "System group container for %{public}@ path is %{public}s", (uint8_t *)&v2, 0x16u);
  sub_100018C1C();
}

void sub_100078668(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "verboseDescription"));
  v6 = 138543618;
  v7 = a1;
  v8 = 2114;
  v9 = v5;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Failed to fetch organization matching identifier (%{public}@): %{public}@", (uint8_t *)&v6, 0x16u);

}

void sub_100078718(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Payload has invalid type prefix (%{public}@) defaulting to generic payload metadata", (uint8_t *)&v2, 0xCu);
}

void sub_10007878C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10003F230();
  sub_100034828((void *)&_mh_execute_header, v0, v1, "Can't get personal hotspot state: no dynamic store", v2, v3, v4, v5, v6);
  sub_100034838();
}

void sub_1000787B8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10003F230();
  sub_100034828((void *)&_mh_execute_header, v0, v1, "Can't get personal hotspot state: no dictionary returned", v2, v3, v4, v5, v6);
  sub_100034838();
}

void sub_1000787E4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10003F230();
  sub_100034828((void *)&_mh_execute_header, v0, v1, "Can't set personal hotspot state: no netrbClient", v2, v3, v4, v5, v6);
  sub_100034838();
}

void sub_100078810()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10003F230();
  sub_100034828((void *)&_mh_execute_header, v0, v1, "Setting personal hotspot state with _NETRBClientSetGlobalServiceState() failed!", v2, v3, v4, v5, v6);
  sub_100034838();
}

void sub_10007883C(uint64_t *a1)
{
  uint64_t v1;
  int v2;
  uint64_t v3;

  v1 = *a1;
  v2 = 138543362;
  v3 = v1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Could not play sound in MDM Lost Mode: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_1000788BC(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "verboseDescription"));
  sub_10003F218();
  sub_10000C854((void *)&_mh_execute_header, v3, v4, "Could not set persistent store backup flag %{public}@: %{public}@", v5, v6, v7, v8, v9);

  sub_10000C880();
}

void sub_100078940()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_100005ECC();
  sub_10002D40C((void *)&_mh_execute_header, v0, v1, "Could not load effective policy persistent store with error: %{public}@", v2);
  sub_100018C1C();
}

void sub_1000789A4(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Could not load effective policy persistent store, the device is locked, unlock it and this should never happen again.", v1, 2u);
}

void sub_1000789E4(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "verboseDescription"));
  sub_100005ECC();
  sub_100005E9C((void *)&_mh_execute_header, v2, v3, "Error fetching existing policy registration: %{public}@", v4, v5, v6, v7, v8);

  sub_100005EB0();
}

void sub_100078A5C(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "verboseDescription"));
  sub_10003F218();
  sub_10000C854((void *)&_mh_execute_header, v3, v4, "Error saving policy registration %{public}@: %{public}@", v5, v6, v7, v8, v9);

  sub_10000C880();
}

void sub_100078AE0(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "verboseDescription"));
  sub_100005ECC();
  sub_100005E9C((void *)&_mh_execute_header, v2, v3, "Error loading persistent store: %{public}@", v4, v5, v6, v7, v8);

  sub_100005EB0();
}

void sub_100078B58(uint8_t *a1, void *a2, _QWORD *a3, NSObject *a4)
{
  void *v7;

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "verboseDescription"));
  *(_DWORD *)a1 = 138543362;
  *a3 = v7;
  _os_log_error_impl((void *)&_mh_execute_header, a4, OS_LOG_TYPE_ERROR, "Error fetching existing policy by type: %{public}@", a1, 0xCu);

}

void sub_100078BCC(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "verboseDescription"));
  sub_100005ECC();
  sub_100005E9C((void *)&_mh_execute_header, v2, v3, "Error fetching existing policies: %{public}@", v4, v5, v6, v7, v8);

  sub_100005EB0();
}

void sub_100078C44(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "verboseDescription"));
  sub_100005ECC();
  sub_100005E9C((void *)&_mh_execute_header, v2, v3, "Error saving policies: %{public}@", v4, v5, v6, v7, v8);

  sub_100005EB0();
}

void sub_100078CBC(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "verboseDescription"));
  sub_100005ECC();
  sub_100005E9C((void *)&_mh_execute_header, v2, v3, "Error fetching orphanied policies: %{public}@", v4, v5, v6, v7, v8);

  sub_100005EB0();
}

void sub_100078D34(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "verboseDescription"));
  sub_100005ECC();
  sub_100005E9C((void *)&_mh_execute_header, v2, v3, "Error fetching registrations to notify: %{public}@", v4, v5, v6, v7, v8);

  sub_100005EB0();
}

void sub_100078DAC()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_100005ECC();
  sub_10002D40C((void *)&_mh_execute_header, v0, v1, "Failed to enable Emergency Mode because end date %@{public}@ is in the past", v2);
  sub_100018C1C();
}

void sub_100078E10()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_100005ECC();
  sub_10002D40C((void *)&_mh_execute_header, v0, v1, "Failed to enable Emergency Mode because end date %@{public}@ does not have a positive Unix Epoch time", v2);
  sub_100018C1C();
}

void sub_100078E74(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "Emergency Mode does not have an end date", v1, 2u);
}

void sub_100078EB4(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Client %@ does not have required com.apple.private.dmd.policy entitlement", (uint8_t *)&v2, 0xCu);
}

void sub_100078F28(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100005EBC((void *)&_mh_execute_header, &_os_log_default, a3, "Found supported vinyl record: %@", a5, a6, a7, a8, 2u);
  sub_100018C1C();
}

void sub_100078F94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100005EBC((void *)&_mh_execute_header, &_os_log_default, a3, "Fetched vinylInfo response = %@", a5, a6, a7, a8, 2u);
  sub_100018C1C();
}

void sub_100079000(uint64_t a1)
{
  int v1;
  uint64_t v2;

  v1 = 138412290;
  v2 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Failed to retrieve vinylInfo response = %@", (uint8_t *)&v1, 0xCu);
  sub_100018C1C();
}

void sub_100079078(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "unable to register configuration source because client doesn't have a valid entitlement for application-identifier", v1, 2u);
}

void sub_1000790B8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100057704();
  sub_100037D34((void *)&_mh_execute_header, &_os_log_default, v0, "Could not remove app removability for bundle identifier: %{bundleIdentifier}@, error: %{public}@", v1, v2, v3, v4, v5);
  sub_100018C1C();
}

void sub_100079124()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100057704();
  sub_100037D34((void *)&_mh_execute_header, &_os_log_default, v0, "Could not remove app tap to pay lock screen flag for bundle identifier: %{bundleIdentifier}@, error: %{public}@", v1, v2, v3, v4, v5);
  sub_100018C1C();
}

void sub_100079190()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_10005FF90(__stack_chk_guard);
  sub_10005FF78();
  sub_100037D34((void *)&_mh_execute_header, &_os_log_default, v0, "Could not remove mapping to persona for for bundle identifier: %{bundleIdentifier}@, error: %{public}@", v1, v2, v3, v4, v5);
  sub_100018C1C();
}

void sub_1000791F8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_10005FF90(__stack_chk_guard);
  sub_10005FF78();
  sub_100037D34((void *)&_mh_execute_header, &_os_log_default, v0, "Could not remove management information for bundle identifier: %{bundleIdentifier}@, error: %{public}@", v1, v2, v3, v4, v5);
  sub_100018C1C();
}

void sub_100079260()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_10005FF90(__stack_chk_guard);
  sub_10005FF78();
  sub_100037D34((void *)&_mh_execute_header, &_os_log_default, v0, "Could not remove configuration for bundle identifier: %{bundleIdentifier}@, error: %{public}@", v1, v2, v3, v4, v5);
  sub_100018C1C();
}

void sub_1000792C8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_10005FF90(__stack_chk_guard);
  sub_10005FF78();
  sub_100037D34((void *)&_mh_execute_header, &_os_log_default, v0, "Could not remove allow user to lock flag for bundle identifier: %{bundleIdentifier}@, error: %{public}@", v1, v2, v3, v4, v5);
  sub_100018C1C();
}

void sub_100079330()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_10005FF90(__stack_chk_guard);
  sub_10005FF78();
  sub_100037D34((void *)&_mh_execute_header, &_os_log_default, v0, "Could not remove allow user to hide flag for bundle identifier: %{bundleIdentifier}@, error: %{public}@", v1, v2, v3, v4, v5);
  sub_100018C1C();
}

void sub_100079398()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_10005FF90(__stack_chk_guard);
  sub_10005FF78();
  sub_100037D34((void *)&_mh_execute_header, &_os_log_default, v0, "Could not remove associated domains enable direct downloads for bundle identifier: %{bundleIdentifier}@, error: %{public}@", v1, v2, v3, v4, v5);
  sub_100018C1C();
}

void sub_100079400()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_10005FF90(__stack_chk_guard);
  sub_10005FF78();
  sub_100037D34((void *)&_mh_execute_header, &_os_log_default, v0, "Could not remove associated domains for bundle identifier: %{bundleIdentifier}@, error: %{public}@", v1, v2, v3, v4, v5);
  sub_100018C1C();
}

void sub_100079468()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_10005FF90(__stack_chk_guard);
  sub_10005FF78();
  sub_100037D34((void *)&_mh_execute_header, &_os_log_default, v0, "Could not remove relay UUID for bundle identifier: %{bundleIdentifier}@, error: %{public}@", v1, v2, v3, v4, v5);
  sub_100018C1C();
}

void sub_1000794D0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_10005FF90(__stack_chk_guard);
  sub_10005FF78();
  sub_100037D34((void *)&_mh_execute_header, &_os_log_default, v0, "Could not remove DNS proxy UUID for bundle identifier: %{bundleIdentifier}@, error: %{public}@", v1, v2, v3, v4, v5);
  sub_100018C1C();
}

void sub_100079538()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_10005FF90(__stack_chk_guard);
  sub_10005FF78();
  sub_100037D34((void *)&_mh_execute_header, &_os_log_default, v0, "Could not remove content filter UUID for bundle identifier: %{bundleIdentifier}@, error: %{public}@", v1, v2, v3, v4, v5);
  sub_100018C1C();
}

void sub_1000795A0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_10005FF90(__stack_chk_guard);
  sub_10005FF78();
  sub_100037D34((void *)&_mh_execute_header, &_os_log_default, v0, "Could not remove CellularSlice UUID for bundle identifier: %{bundleIdentifier}@, error: %{public}@", v1, v2, v3, v4, v5);
  sub_100018C1C();
}

void sub_100079608()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_10005FF90(__stack_chk_guard);
  sub_10005FF78();
  sub_100037D34((void *)&_mh_execute_header, &_os_log_default, v0, "Could not remove VPN UUID for bundle identifier: %{bundleIdentifier}@, error: %{public}@", v1, v2, v3, v4, v5);
  sub_100018C1C();
}

void sub_100079670(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "verboseDescription"));
  v4 = 138543362;
  v5 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Could not remove restrictions: %{public}@", (uint8_t *)&v4, 0xCu);

}

void sub_100079704(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "remove-os-update end with error: %@", (uint8_t *)&v2, 0xCu);
}

void sub_100079778(void *a1)
{
  int v1;
  id v2;

  v1 = 134217984;
  v2 = objc_msgSend(a1, "authenticateResponseType");
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "User failed to log into iTunes account. Reason code: %ld", (uint8_t *)&v1, 0xCu);
}

void sub_1000797F8()
{
  __assert_rtn("-[DMDSSRequestDelegate initWithRequest:]", "DMDSSRequestDelegate+iOS.m", 42, "request");
}

void sub_100079820()
{
  __assert_rtn("-[DMDSSRequestDelegate startWithCompletionBlock:]_block_invoke", "DMDSSRequestDelegate+iOS.m", 63, "!self.completionBlock");
}

void sub_100079848()
{
  __assert_rtn("-[DMDSSRequestDelegate cancel]_block_invoke", "DMDSSRequestDelegate+iOS.m", 79, "self.completionBlock");
}

void sub_100079870()
{
  uint64_t v0;
  os_log_t v1;

  sub_100057704();
  sub_100018BE0((void *)&_mh_execute_header, v0, v1, "Could not remove app removability for bundle identifier: %{bundleIdentifier}@, error: %{public}@");
  sub_100018C1C();
}

void sub_1000798D4()
{
  uint64_t v0;
  os_log_t v1;

  sub_100057704();
  sub_100018BE0((void *)&_mh_execute_header, v0, v1, "Could not remove UserManagement persona mapping for app %{public}@, error: %{public}@");
  sub_100018C1C();
}

void sub_100079938()
{
  uint64_t v0;
  os_log_t v1;

  sub_100057704();
  sub_100018BE0((void *)&_mh_execute_header, v0, v1, "Could not remove app tap to pay screen lock setting for bundle identifier: %{bundleIdentifier}@, error: %{public}@");
  sub_100018C1C();
}

void sub_10007999C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10003F208((void *)&_mh_execute_header, &_os_log_default, a3, "remove software update failed: no error returned", a5, a6, a7, a8, 0);
}

void sub_1000799D4(uint64_t a1)
{
  uint64_t v1;
  int v2;
  uint64_t v3;

  v1 = *(_QWORD *)(*(_QWORD *)a1 + 40);
  v2 = 138543362;
  v3 = v1;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "remove software update failed: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_100079A58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10003F208((void *)&_mh_execute_header, &_os_log_default, a3, "remove software update started", a5, a6, a7, a8, 0);
}

void sub_100079A90(uint64_t a1)
{
  uint64_t v1;
  int v2;
  uint64_t v3;

  v1 = *(_QWORD *)(*(_QWORD *)a1 + 40);
  v2 = 138543362;
  v3 = v1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "could not get current software update status: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_100079B14(uint64_t a1)
{
  int v1;
  uint64_t v2;

  v1 = 138543362;
  v2 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Operation did finish: %{public}@", (uint8_t *)&v1, 0xCu);
}

void sub_100079B90(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "removable"));
  sub_100056410();
  sub_10001CD88((void *)&_mh_execute_header, a3, v5, "Error attempting to set removability to %{public}@ Error: %{public}@", v6);

  sub_10000C880();
}

void sub_100079C1C(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "tapToPayScreenLock"));
  sub_100056410();
  sub_10001CD88((void *)&_mh_execute_header, a3, v5, "Error attempting to set tapToPayScreenLock to %{public}@ Error:%{public}@", v6);

  sub_10000C880();
}

void sub_100079CA8(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Show user update failure prompt", v1, 2u);
}

void sub_100079CE8(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  __int16 v7;
  uint64_t v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[DMFAppManagementInformation stringForState:](DMFAppManagementInformation, "stringForState:", a1));
  v5 = 138543618;
  v6 = v3;
  v7 = 2114;
  v8 = a2;
  sub_10001CD88((void *)&_mh_execute_header, &_os_log_default, v4, "Could not mark app state as %{public}@ for bundle identifier: %{public}@", (uint8_t *)&v5);

}

void sub_100079D90()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Could not get notification ref for user notification.", v0, 2u);
}

void sub_100079DD4(uint64_t a1)
{
  int v1;
  uint64_t v2;

  v1 = 138543362;
  v2 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Could not get run loop source for user notification: %{public}@", (uint8_t *)&v1, 0xCu);
}

void sub_100079E50(uint8_t *buf, int *a2, _DWORD *a3)
{
  int v3;

  v3 = *a2;
  *(_DWORD *)buf = 67109120;
  *a3 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Cannot create alert. Error: %d", buf, 8u);
}

void sub_100079E9C(uint8_t *buf, _BYTE *a2)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Cannot display alert: can't create run loop source.", buf, 2u);
}

void sub_100079EDC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100034828((void *)&_mh_execute_header, &_os_log_default, a3, "Could not get file information", a5, a6, a7, a8, 0);
}

void sub_100079F14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100034828((void *)&_mh_execute_header, &_os_log_default, a3, "Memory mapping failed", a5, a6, a7, a8, 0);
}

void sub_100079F4C()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "$HOME not set, falling back to using getpwuid", v0, 2u);
}

id objc_msgSend_CSN(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "CSN");
}

id objc_msgSend_DNSProxyUUIDString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "DNSProxyUUIDString");
}

id objc_msgSend_DNSProxyUUIDStringForBundleIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "DNSProxyUUIDStringForBundleIdentifier:");
}

id objc_msgSend_DSID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "DSID");
}

id objc_msgSend_ICCID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ICCID");
}

id objc_msgSend_IMEI(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "IMEI");
}

id objc_msgSend_MCHashedFilenameWithPrefix_extension_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "MCHashedFilenameWithPrefix:extension:");
}

id objc_msgSend_MCMutableDeepCopy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "MCMutableDeepCopy");
}

id objc_msgSend_MEID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "MEID");
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URL");
}

id objc_msgSend_URLByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLByAppendingPathComponent:");
}

id objc_msgSend_URLByAppendingPathComponent_isDirectory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLByAppendingPathComponent:isDirectory:");
}

id objc_msgSend_URLForResource_withExtension_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLForResource:withExtension:");
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UTF8String");
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UUID");
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UUIDString");
}

id objc_msgSend_VPNUUIDString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "VPNUUIDString");
}

id objc_msgSend_VPNUUIDStringForBundleIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "VPNUUIDStringForBundleIdentifier:");
}

id objc_msgSend__allPropertyKeys(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_allPropertyKeys");
}

id objc_msgSend__appStoreAccountIdentifierForPersona_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_appStoreAccountIdentifierForPersona:");
}

id objc_msgSend__appleAccountForPersona_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_appleAccountForPersona:");
}

id objc_msgSend__applyChangeInLifeCycle_stateMap_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_applyChangeInLifeCycle:stateMap:");
}

id objc_msgSend__applyHeuristicsToRestrictions_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_applyHeuristicsToRestrictions:error:");
}

id objc_msgSend__applyHeuristicsToRestrictions_forProfile_ignoresUnrestrictableApps_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_applyHeuristicsToRestrictions:forProfile:ignoresUnrestrictableApps:");
}

id objc_msgSend__applyManagementPiecesForRequest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_applyManagementPiecesForRequest:");
}

id objc_msgSend__applyStoreDictionary_toAppMetadata_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_applyStoreDictionary:toAppMetadata:");
}

id objc_msgSend__attemptSINFSwap(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_attemptSINFSwap");
}

id objc_msgSend__attemptSINFSwapForRequest_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_attemptSINFSwapForRequest:completion:");
}

id objc_msgSend__budgetDays_duration_calendar_schedule_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_budgetDays:duration:calendar:schedule:");
}

id objc_msgSend__canManageBundleIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_canManageBundleIdentifier:");
}

id objc_msgSend__cleanUpStaleManagementStatesAndStartObservingApps(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_cleanUpStaleManagementStatesAndStartObservingApps");
}

id objc_msgSend__cleanupAfterResponseFromLocationManagerOrTimeout(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_cleanupAfterResponseFromLocationManagerOrTimeout");
}

id objc_msgSend__cleanupOrphanedPolicies(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_cleanupOrphanedPolicies");
}

id objc_msgSend__completeNotification_response_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_completeNotification:response:");
}

id objc_msgSend__datesForNextCurfewBoundary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_datesForNextCurfewBoundary");
}

id objc_msgSend__deviceInformationForEquipmentInfo_subscription_esimIdentifier_withClient_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_deviceInformationForEquipmentInfo:subscription:esimIdentifier:withClient:");
}

id objc_msgSend__dictFromNotification_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_dictFromNotification:");
}

id objc_msgSend__discoverDeviceWithDestinationDeviceID_scanWaitTime_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_discoverDeviceWithDestinationDeviceID:scanWaitTime:error:");
}

id objc_msgSend__discoverDeviceWithDestinationName_scanWaitTime_sessionType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_discoverDeviceWithDestinationName:scanWaitTime:sessionType:");
}

id objc_msgSend__dispatchToListenerForKey_inMap_withBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_dispatchToListenerForKey:inMap:withBlock:");
}

id objc_msgSend__dmfDownloadErrorFromSUDownloadError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_dmfDownloadErrorFromSUDownloadError:");
}

id objc_msgSend__dmfInstallErrorFromSUInstallError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_dmfInstallErrorFromSUInstallError:");
}

id objc_msgSend__dmfStatusErrorFromSUStatusError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_dmfStatusErrorFromSUStatusError:");
}

id objc_msgSend__downloadAppForRequest_type_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_downloadAppForRequest:type:completion:");
}

id objc_msgSend__downloadStatusAndPercentComplete_fromStatus_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_downloadStatusAndPercentComplete:fromStatus:");
}

id objc_msgSend__effectiveCategoryPoliciesForCategoryShieldPolicy_type_excludedIdentifiersKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_effectiveCategoryPoliciesForCategoryShieldPolicy:type:excludedIdentifiersKey:");
}

id objc_msgSend__effectivePolicyForManagedSettingsIdentifier_type_excludedIdentifiers_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_effectivePolicyForManagedSettingsIdentifier:type:excludedIdentifiers:");
}

id objc_msgSend__enableEmergencyModeUntilDate_referenceDate_withCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_enableEmergencyModeUntilDate:referenceDate:withCompletionHandler:");
}

id objc_msgSend__endOperationWithBundleIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_endOperationWithBundleIdentifier:");
}

id objc_msgSend__equipmentInfoHasEsimIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_equipmentInfoHasEsimIdentifier:");
}

id objc_msgSend__esimIdentifierFromEquipmentInfoArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_esimIdentifierFromEquipmentInfoArray:");
}

id objc_msgSend__extractComponentsFromBudgetPredicate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_extractComponentsFromBudgetPredicate:");
}

id objc_msgSend__extractComponentsFromCompositeBudgetPredicate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_extractComponentsFromCompositeBudgetPredicate:");
}

id objc_msgSend__extractComponentsFromPredicate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_extractComponentsFromPredicate:");
}

id objc_msgSend__fetchAppsForBundleIdentifier_type_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_fetchAppsForBundleIdentifier:type:completion:");
}

id objc_msgSend__findProxyInProxies_andCallBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_findProxyInProxies:andCallBlock:");
}

id objc_msgSend__getEnterpriseAppMetadataForManifestURL_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_getEnterpriseAppMetadataForManifestURL:completion:");
}

id objc_msgSend__getEnterpriseAppMetadataFromData_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_getEnterpriseAppMetadataFromData:completion:");
}

id objc_msgSend__getMetadataForBundleIdentifier_storeItemIdentifier_personaIdentifier_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_getMetadataForBundleIdentifier:storeItemIdentifier:personaIdentifier:completion:");
}

id objc_msgSend__getRequiredAppIDFromDisk(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_getRequiredAppIDFromDisk");
}

id objc_msgSend__installDeviceLicensedAppForRequest_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_installDeviceLicensedAppForRequest:completion:");
}

id objc_msgSend__installEnterpriseAppForRequest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_installEnterpriseAppForRequest:");
}

id objc_msgSend__installInteractiveProfile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_installInteractiveProfile:");
}

id objc_msgSend__installProfile_withRequest_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_installProfile:withRequest:error:");
}

id objc_msgSend__installRestrictionsPayload_withRequest_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_installRestrictionsPayload:withRequest:error:");
}

id objc_msgSend__installSilentProfileData_managingProfileIdentifier_personaID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_installSilentProfileData:managingProfileIdentifier:personaID:");
}

id objc_msgSend__installStoreAppForRequest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_installStoreAppForRequest:");
}

id objc_msgSend__installSystemAppWithBundleIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_installSystemAppWithBundleIdentifier:");
}

id objc_msgSend__installUserAppForRequest_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_installUserAppForRequest:completion:");
}

id objc_msgSend__intersectionAliasToFeatures(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_intersectionAliasToFeatures");
}

id objc_msgSend__intersectionFeatureForPayloadRestrictionKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_intersectionFeatureForPayloadRestrictionKey:");
}

id objc_msgSend__isInTransitoryState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_isInTransitoryState");
}

id objc_msgSend__isManagedBundleIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_isManagedBundleIdentifier:");
}

id objc_msgSend__isStale(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_isStale");
}

id objc_msgSend__lifeCycleByBundleIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_lifeCycleByBundleIdentifier");
}

id objc_msgSend__loadPersistentStoreIfNeeded_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_loadPersistentStoreIfNeeded:");
}

id objc_msgSend__manageApp(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_manageApp");
}

id objc_msgSend__managedDefaultsForBundleIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_managedDefaultsForBundleIdentifier:");
}

id objc_msgSend__managedNonStoreBooksSystemGroupContainer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_managedNonStoreBooksSystemGroupContainer");
}

id objc_msgSend__mapMCRestrictionsFromPayload_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_mapMCRestrictionsFromPayload:error:");
}

id objc_msgSend__messageForAirPlayPromptOnDisplayNamed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_messageForAirPlayPromptOnDisplayNamed:");
}

id objc_msgSend__metadataByBundleIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_metadataByBundleIdentifier");
}

id objc_msgSend__metadataForBundleIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_metadataForBundleIdentifier:");
}

id objc_msgSend__nameForOperationGroup_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_nameForOperationGroup:");
}

id objc_msgSend__newDatabaseWithURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_newDatabaseWithURL:");
}

id objc_msgSend__newMetadataDictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_newMetadataDictionary");
}

id objc_msgSend__nextDateAfter_matchingWeekday_hour_minute_second_inCalendar_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_nextDateAfter:matchingWeekday:hour:minute:second:inCalendar:");
}

id objc_msgSend__notificationRef_wasDismissedWithFlags_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_notificationRef:wasDismissedWithFlags:");
}

id objc_msgSend__notifyClientsRegisteredForPolicyType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_notifyClientsRegisteredForPolicyType:");
}

id objc_msgSend__now(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_now");
}

id objc_msgSend__outputContextForSessionType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_outputContextForSessionType:");
}

id objc_msgSend__performBackgroundTask_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_performBackgroundTask:");
}

id objc_msgSend__performRegistrationBackgroundTask_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_performRegistrationBackgroundTask:");
}

id objc_msgSend__predicateObserverForPredicate_withUniqueIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_predicateObserverForPredicate:withUniqueIdentifier:");
}

id objc_msgSend__profileListWithFilterFlags_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_profileListWithFilterFlags:");
}

id objc_msgSend__promptIfNeededAndUpdateAppForRequest_metadata_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_promptIfNeededAndUpdateAppForRequest:metadata:");
}

id objc_msgSend__promptIfNeededWithMessageFormat_success_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_promptIfNeededWithMessageFormat:success:");
}

id objc_msgSend__promptIfPermittedByPolicyToManageApp_appDisplayName_originator_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_promptIfPermittedByPolicyToManageApp:appDisplayName:originator:completion:");
}

id objc_msgSend__promptToManageApp_appDisplayName_originator_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_promptToManageApp:appDisplayName:originator:completion:");
}

id objc_msgSend__promptToSignInAndInstallAppForRequest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_promptToSignInAndInstallAppForRequest:");
}

id objc_msgSend__promptUserToMirrorOnDisplayNamed_withCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_promptUserToMirrorOnDisplayNamed:withCompletion:");
}

id objc_msgSend__proxyIsValidated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_proxyIsValidated:");
}

id objc_msgSend__purchaseFreeAppForRequest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_purchaseFreeAppForRequest:");
}

id objc_msgSend__redeemAppWithRedemptionCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_redeemAppWithRedemptionCode:");
}

id objc_msgSend__redownloadDeviceAppForRequest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_redownloadDeviceAppForRequest:");
}

id objc_msgSend__redownloadUserAppForRequest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_redownloadUserAppForRequest:");
}

id objc_msgSend__registerEventStreamHandlers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_registerEventStreamHandlers");
}

id objc_msgSend__registerListener_forKeys_inMap_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_registerListener:forKeys:inMap:");
}

id objc_msgSend__registerPredicateObserver(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_registerPredicateObserver");
}

id objc_msgSend__removeLifeCycleForBundleIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_removeLifeCycleForBundleIdentifier:");
}

id objc_msgSend__removeOrphanedPoliciesFromFetchRequest_managedObjectContext_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_removeOrphanedPoliciesFromFetchRequest:managedObjectContext:completionHandler:");
}

id objc_msgSend__removeProfile_withRequest_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_removeProfile:withRequest:completion:");
}

id objc_msgSend__removePromptTimestampsOutsideIntervalEnding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_removePromptTimestampsOutsideIntervalEnding:");
}

id objc_msgSend__removeRestrictionsWithRequest_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_removeRestrictionsWithRequest:error:");
}

id objc_msgSend__reportChangeToObserver_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_reportChangeToObserver:");
}

id objc_msgSend__resetRemovabilityWithBundleIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_resetRemovabilityWithBundleIdentifier:");
}

id objc_msgSend__resetStateForChangeInLifeCycle_newState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_resetStateForChangeInLifeCycle:newState:");
}

id objc_msgSend__resetTapToPayScreenLock(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_resetTapToPayScreenLock");
}

id objc_msgSend__resumeInstallationForRequest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_resumeInstallationForRequest:");
}

id objc_msgSend__resumeUpdateForBundleIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_resumeUpdateForBundleIdentifier:");
}

id objc_msgSend__rollbackProfile_withRequest_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_rollbackProfile:withRequest:completion:");
}

id objc_msgSend__runWithRequest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_runWithRequest:");
}

id objc_msgSend__runWithRequest_metadata_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_runWithRequest:metadata:");
}

id objc_msgSend__sendAppStatusChangeNotification(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_sendAppStatusChangeNotification");
}

id objc_msgSend__setMetadata_forBundleIdentifier_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setMetadata:forBundleIdentifier:error:");
}

id objc_msgSend__setOutputDevices_forSessionType_password_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setOutputDevices:forSessionType:password:error:");
}

id objc_msgSend__setQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setQueue:");
}

id objc_msgSend__setRedemptionCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setRedemptionCode:");
}

id objc_msgSend__setRemovability_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setRemovability:");
}

id objc_msgSend__setState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setState:");
}

id objc_msgSend__setState_forBundleIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setState:forBundleIdentifier:");
}

id objc_msgSend__setTapToPayAttribute_forBundleIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setTapToPayAttribute:forBundleIdentifier:");
}

id objc_msgSend__setTapToPayScreenLock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setTapToPayScreenLock:");
}

id objc_msgSend__setUnusedRedemptionCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setUnusedRedemptionCode:");
}

id objc_msgSend__showInstallationFailurePromptIfNeeded(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_showInstallationFailurePromptIfNeeded");
}

id objc_msgSend__showNextNotification(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_showNextNotification");
}

id objc_msgSend__showUpdateFailurePromptIfNeededForRequest_metadata_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_showUpdateFailurePromptIfNeededForRequest:metadata:");
}

id objc_msgSend__specialCasedRequestNamesToOperationNames(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_specialCasedRequestNamesToOperationNames");
}

id objc_msgSend__startUpdateAppForRequest_metadata_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_startUpdateAppForRequest:metadata:");
}

id objc_msgSend__startUpdatingAppForRequest_metadata_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_startUpdatingAppForRequest:metadata:completion:");
}

id objc_msgSend__stateCanBeResetSafely_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_stateCanBeResetSafely:");
}

id objc_msgSend__stopObservingLifeCycle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_stopObservingLifeCycle:");
}

id objc_msgSend__storeAppFormat(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_storeAppFormat");
}

id objc_msgSend__storeLoginFailedError(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_storeLoginFailedError");
}

id objc_msgSend__stringFromSubscriptionSlot_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_stringFromSubscriptionSlot:");
}

id objc_msgSend__subPredicateObserversForCompoundSubPredicates_withUniqueIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_subPredicateObserversForCompoundSubPredicates:withUniqueIdentifier:");
}

id objc_msgSend__supportsVoiceRoaming(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_supportsVoiceRoaming");
}

id objc_msgSend__systemGroupContainerPathWithGroupIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_systemGroupContainerPathWithGroupIdentifier:");
}

id objc_msgSend__systemProfileLibraryDirectory(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_systemProfileLibraryDirectory");
}

id objc_msgSend__systemProfileStorageDirectory(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_systemProfileStorageDirectory");
}

id objc_msgSend__testEvent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_testEvent");
}

id objc_msgSend__timestampDataForWritingToFile(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_timestampDataForWritingToFile");
}

id objc_msgSend__timestampDictionaryForWritingToFile(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_timestampDictionaryForWritingToFile");
}

id objc_msgSend__tryConnectingToNamedService_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_tryConnectingToNamedService:completion:");
}

id objc_msgSend__uninstallAppWithBundleIdentifier_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_uninstallAppWithBundleIdentifier:completion:");
}

id objc_msgSend__updateAllActivationPredicateObserverRegistrations(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateAllActivationPredicateObserverRegistrations");
}

id objc_msgSend__updateEndedForLifeCycle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateEndedForLifeCycle:");
}

id objc_msgSend__updateEventStreams_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateEventStreams:");
}

id objc_msgSend__updateLostModeFileForOriginator_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateLostModeFileForOriginator:");
}

id objc_msgSend__updateManagementInfoWithBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateManagementInfoWithBlock:");
}

id objc_msgSend__updateMetadataSettingKey_toValue_forBundleIdentifier_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateMetadataSettingKey:toValue:forBundleIdentifier:error:");
}

id objc_msgSend__upsertPolicy_forType_identifier_priority_organizationIdentifier_declarationIdentifier_policyToUpdate_managedObjectContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_upsertPolicy:forType:identifier:priority:organizationIdentifier:declarationIdentifier:policyToUpdate:managedObjectContext:");
}

id objc_msgSend__userDirectory(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_userDirectory");
}

id objc_msgSend__withSandboxExtensionForApp_do_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_withSandboxExtensionForApp:do:");
}

id objc_msgSend_aa_isPrimaryEmailVerified(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "aa_isPrimaryEmailVerified");
}

id objc_msgSend_aa_personID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "aa_personID");
}

id objc_msgSend_aa_primaryAppleAccount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "aa_primaryAppleAccount");
}

id objc_msgSend_aa_primaryAppleAccountWithPreloadedDataclasses(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "aa_primaryAppleAccountWithPreloadedDataclasses");
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "absoluteString");
}

id objc_msgSend_account(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "account");
}

id objc_msgSend_accountProperties(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accountProperties");
}

id objc_msgSend_accountTypeWithAccountTypeIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accountTypeWithAccountTypeIdentifier:");
}

id objc_msgSend_accountsWithAccountType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accountsWithAccountType:");
}

id objc_msgSend_action(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "action");
}

id objc_msgSend_activationPredicateObserverForIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activationPredicateObserverForIdentifier:");
}

id objc_msgSend_activationPredicateObserverManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activationPredicateObserverManager");
}

id objc_msgSend_activationPredicateObserverManager_didObserveChangeForPredicateWithIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activationPredicateObserverManager:didObserveChangeForPredicateWithIdentifier:");
}

id objc_msgSend_activationPredicateObserversByIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activationPredicateObserversByIdentifier");
}

id objc_msgSend_active(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "active");
}

id objc_msgSend_activeAccount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activeAccount");
}

id objc_msgSend_activeRestrictionsURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activeRestrictionsURL");
}

id objc_msgSend_activeSyncDeviceIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activeSyncDeviceIdentifier");
}

id objc_msgSend_addActivationPredicateObserverForPredicate_withUniqueIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addActivationPredicateObserverForPredicate:withUniqueIdentifier:");
}

id objc_msgSend_addAsset_forType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addAsset:forType:");
}

id objc_msgSend_addCommands(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addCommands");
}

id objc_msgSend_addDependency_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addDependency:");
}

id objc_msgSend_addDownloadWithPurchaseParameters_storeID_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addDownloadWithPurchaseParameters:storeID:completion:");
}

id objc_msgSend_addDownloads_completionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addDownloads:completionBlock:");
}

id objc_msgSend_addEntriesFromDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addEntriesFromDictionary:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObjectsFromArray:");
}

id objc_msgSend_addObserver_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObserver:");
}

id objc_msgSend_addObserver_forKeyPath_options_context_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObserver:forKeyPath:options:context:");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_addObserverForName_object_queue_usingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObserverForName:object:queue:usingBlock:");
}

id objc_msgSend_addOperation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addOperation:");
}

id objc_msgSend_addOperationWithBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addOperationWithBlock:");
}

id objc_msgSend_addOperations_waitUntilFinished_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addOperations:waitUntilFinished:");
}

id objc_msgSend_addPointer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addPointer:");
}

id objc_msgSend_addRMDSpecificResultsToDictionary_errors_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addRMDSpecificResultsToDictionary:errors:");
}

id objc_msgSend_addStateWithName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addStateWithName:");
}

id objc_msgSend_addStatusEntriesFromDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addStatusEntriesFromDictionary:");
}

id objc_msgSend_addTarget_selector_forOperationEvents_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addTarget:selector:forOperationEvents:");
}

id objc_msgSend_addTarget_selector_forOperationEvents_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addTarget:selector:forOperationEvents:userInfo:");
}

id objc_msgSend_addTerminationAssertion_forBundleIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addTerminationAssertion:forBundleIdentifier:");
}

id objc_msgSend_addTransitionToState_triggeringEvent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addTransitionToState:triggeringEvent:");
}

id objc_msgSend_advanceTransientStates(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "advanceTransientStates");
}

id objc_msgSend_alarms(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "alarms");
}

id objc_msgSend_all(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "all");
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allKeys");
}

id objc_msgSend_allKeysForObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allKeysForObject:");
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allObjects");
}

id objc_msgSend_allUsers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allUsers");
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allValues");
}

id objc_msgSend_allowFreePurchases(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allowFreePurchases");
}

id objc_msgSend_allowUserToHide(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allowUserToHide");
}

id objc_msgSend_allowUserToHideForBundleIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allowUserToHideForBundleIdentifier:");
}

id objc_msgSend_allowUserToLock(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allowUserToLock");
}

id objc_msgSend_allowUserToLockForBundleIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allowUserToLockForBundleIdentifier:");
}

id objc_msgSend_alternateButtonText(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "alternateButtonText");
}

id objc_msgSend_alternateButtonTitle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "alternateButtonTitle");
}

id objc_msgSend_ams_DSID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ams_DSID");
}

id objc_msgSend_andPredicateWithSubpredicates_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "andPredicateWithSubpredicates:");
}

id objc_msgSend_anonymousEndpoint(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "anonymousEndpoint");
}

id objc_msgSend_appClipMetadata(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appClipMetadata");
}

id objc_msgSend_appCoordinatorExistsForBundleIdentifier_persona_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appCoordinatorExistsForBundleIdentifier:persona:");
}

id objc_msgSend_appIdentityForBundleIdentifier_persona_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appIdentityForBundleIdentifier:persona:");
}

id objc_msgSend_appState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appState");
}

id objc_msgSend_appTypeFromProxy_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appTypeFromProxy:");
}

id objc_msgSend_appWhitelistState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appWhitelistState");
}

id objc_msgSend_appendFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendFormat:");
}

id objc_msgSend_applicationCategories(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "applicationCategories");
}

id objc_msgSend_applicationType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "applicationType");
}

id objc_msgSend_applications(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "applications");
}

id objc_msgSend_applyPayloadDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "applyPayloadDictionary:");
}

id objc_msgSend_applyRestrictionDictionary_clientType_clientUUID_localizedClientDescription_localizedWarningMessage_outRestrictionChanged_outEffectiveSettingsChanged_outError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "applyRestrictionDictionary:clientType:clientUUID:localizedClientDescription:localizedWarningMessage:outRestrictionChanged:outEffectiveSettingsChanged:outError:");
}

id objc_msgSend_arrayByAddingObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayByAddingObject:");
}

id objc_msgSend_arrayByAddingObjectsFromArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayByAddingObjectsFromArray:");
}

id objc_msgSend_arrayWithArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithArray:");
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithCapacity:");
}

id objc_msgSend_arrayWithObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObject:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_assertionForOperation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "assertionForOperation:");
}

id objc_msgSend_assetIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "assetIdentifier");
}

id objc_msgSend_assetProvidersByPayloadIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "assetProvidersByPayloadIdentifier");
}

id objc_msgSend_assetReference(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "assetReference");
}

id objc_msgSend_assetReferences(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "assetReferences");
}

id objc_msgSend_assetResolutionDidSucceedWithAssetURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "assetResolutionDidSucceedWithAssetURL:");
}

id objc_msgSend_assetResolutionFailedWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "assetResolutionFailedWithError:");
}

id objc_msgSend_assetResolver(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "assetResolver");
}

id objc_msgSend_associatedDomains(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "associatedDomains");
}

id objc_msgSend_associatedDomainsEnableDirectDownloads(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "associatedDomainsEnableDirectDownloads");
}

id objc_msgSend_associatedDomainsEnableDirectDownloadsForBundleIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "associatedDomainsEnableDirectDownloadsForBundleIdentifier:");
}

id objc_msgSend_associatedDomainsForBundleIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "associatedDomainsForBundleIdentifier:");
}

id objc_msgSend_authenticateResponseType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "authenticateResponseType");
}

id objc_msgSend_authenticatedAccount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "authenticatedAccount");
}

id objc_msgSend_author(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "author");
}

id objc_msgSend_autoInstallOperation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "autoInstallOperation");
}

id objc_msgSend_available(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "available");
}

id objc_msgSend_availableUpdateWithVersion_useDelay_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "availableUpdateWithVersion:useDelay:error:");
}

id objc_msgSend_base64EncodedStringWithOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "base64EncodedStringWithOptions:");
}

id objc_msgSend_begin(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "begin");
}

id objc_msgSend_block(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "block");
}

id objc_msgSend_blockOperationWithBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "blockOperationWithBlock:");
}

id objc_msgSend_blockingTask(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "blockingTask");
}

id objc_msgSend_bluetoothManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bluetoothManager");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_BOOLValueForEntitlement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValueForEntitlement:");
}

id objc_msgSend_bundleForClass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleForClass:");
}

id objc_msgSend_bundleID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleID");
}

id objc_msgSend_bundleIDsToAssertions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleIDsToAssertions");
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleIdentifier");
}

id objc_msgSend_bundleIdentifiers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleIdentifiers");
}

id objc_msgSend_bundleURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleURL");
}

id objc_msgSend_bundleVersion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleVersion");
}

id objc_msgSend_buyParams(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "buyParams");
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bytes");
}

id objc_msgSend_calendarForIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "calendarForIdentifier:");
}

id objc_msgSend_calendarIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "calendarIdentifier");
}

id objc_msgSend_calendarWithIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "calendarWithIdentifier:");
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancel");
}

id objc_msgSend_cancelAllNotificationsWithCompletionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancelAllNotificationsWithCompletionBlock:");
}

id objc_msgSend_cancelAllOperations(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancelAllOperations");
}

id objc_msgSend_cancelAppInstallationWithBundleIdentifier_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancelAppInstallationWithBundleIdentifier:completion:");
}

id objc_msgSend_cancelAppUpdateWithBundleIdentifier_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancelAppUpdateWithBundleIdentifier:completion:");
}

id objc_msgSend_cancelDownloads_completionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancelDownloads:completionBlock:");
}

id objc_msgSend_cancelJobsWithIDs_completionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancelJobsWithIDs:completionBlock:");
}

id objc_msgSend_cancelNonStoreDownloadsWithDownloadIdentifiers_completionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancelNonStoreDownloadsWithDownloadIdentifiers:completionBlock:");
}

id objc_msgSend_cancelPreviousPerformRequestsWithTarget_selector_object_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancelPreviousPerformRequestsWithTarget:selector:object:");
}

id objc_msgSend_caseInsensitiveCompare_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "caseInsensitiveCompare:");
}

id objc_msgSend_categoryShieldPolicies(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "categoryShieldPolicies");
}

id objc_msgSend_cellularSliceUUIDString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cellularSliceUUIDString");
}

id objc_msgSend_cellularSliceUUIDStringForBundleIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cellularSliceUUIDStringForBundleIdentifier:");
}

id objc_msgSend_certificatePersistentID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "certificatePersistentID");
}

id objc_msgSend_changeTypeAsString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "changeTypeAsString:");
}

id objc_msgSend_changedValues(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "changedValues");
}

id objc_msgSend_checkResourceIsReachableAndReturnError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "checkResourceIsReachableAndReturnError:");
}

id objc_msgSend_checkStatusOfBudgets_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "checkStatusOfBudgets:error:");
}

id objc_msgSend_cleanUpWithAssertion_completionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cleanUpWithAssertion:completionBlock:");
}

id objc_msgSend_clearLastLocationRequestedDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clearLastLocationRequestedDate");
}

id objc_msgSend_clearRestrictionsPasscodeWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clearRestrictionsPasscodeWithError:");
}

id objc_msgSend_clearStoredActivationLockBypassCode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clearStoredActivationLockBypassCode");
}

id objc_msgSend_clientBundleIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clientBundleIdentifier");
}

id objc_msgSend_clientIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clientIdentifier");
}

id objc_msgSend_clientRestrictionsForClientUUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clientRestrictionsForClientUUID:");
}

id objc_msgSend_clientUserInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clientUserInfo");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "code");
}

id objc_msgSend_commandForPayload_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "commandForPayload:error:");
}

id objc_msgSend_commandsWithPayloadDictionaries_organizationIdentifier_context_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "commandsWithPayloadDictionaries:organizationIdentifier:context:error:");
}

id objc_msgSend_compare_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "compare:");
}

id objc_msgSend_compatibilityObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "compatibilityObject");
}

id objc_msgSend_completionBlock(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "completionBlock");
}

id objc_msgSend_completionHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "completionHandler");
}

id objc_msgSend_completionsByIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "completionsByIdentifier");
}

id objc_msgSend_components_fromDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "components:fromDate:");
}

id objc_msgSend_componentsJoinedByString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "componentsJoinedByString:");
}

id objc_msgSend_concurrentOperationQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "concurrentOperationQueue");
}

id objc_msgSend_configuration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "configuration");
}

id objc_msgSend_configurationEngine(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "configurationEngine");
}

id objc_msgSend_configurationEngineDidResume_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "configurationEngineDidResume:");
}

id objc_msgSend_configurationEngineRequestedAsset_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "configurationEngineRequestedAsset:completion:");
}

id objc_msgSend_configurationEngineWillSuspend_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "configurationEngineWillSuspend:");
}

id objc_msgSend_configurationEventsDidChange_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "configurationEventsDidChange:completion:");
}

id objc_msgSend_configurationForBundleIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "configurationForBundleIdentifier:");
}

id objc_msgSend_configurationForDefaultMainDisplayMonitor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "configurationForDefaultMainDisplayMonitor");
}

id objc_msgSend_configurationProfilesSystemGroupContainer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "configurationProfilesSystemGroupContainer");
}

id objc_msgSend_configurationSource(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "configurationSource");
}

id objc_msgSend_configurationSourceController_fetchEventsWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "configurationSourceController:fetchEventsWithCompletionHandler:");
}

id objc_msgSend_configurationSourceController_fetchStatusUpdatesWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "configurationSourceController:fetchStatusUpdatesWithCompletionHandler:");
}

id objc_msgSend_configurationSourceControllers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "configurationSourceControllers");
}

id objc_msgSend_configurationSourceName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "configurationSourceName");
}

id objc_msgSend_configurationSourceWithIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "configurationSourceWithIdentifier:");
}

id objc_msgSend_configurationStatusDidChange_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "configurationStatusDidChange:completion:");
}

id objc_msgSend_conformsToOverridePatternWithKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "conformsToOverridePatternWithKey:");
}

id objc_msgSend_conformsToProtocol_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "conformsToProtocol:");
}

id objc_msgSend_connectWithClientTransport_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connectWithClientTransport:");
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connection");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_containsString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsString:");
}

id objc_msgSend_contentFilterUUIDString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contentFilterUUIDString");
}

id objc_msgSend_contentFilterUUIDStringForBundleIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contentFilterUUIDStringForBundleIdentifier:");
}

id objc_msgSend_context(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "context");
}

id objc_msgSend_contextForSignIn(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contextForSignIn");
}

id objc_msgSend_controller(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "controller");
}

id objc_msgSend_coordinateReadingItemAtURL_options_error_byAccessor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "coordinateReadingItemAtURL:options:error:byAccessor:");
}

id objc_msgSend_coordinateWritingItemAtURL_options_error_byAccessor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "coordinateWritingItemAtURL:options:error:byAccessor:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copy");
}

id objc_msgSend_copyCarrierBundleValue_key_bundleType_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyCarrierBundleValue:key:bundleType:error:");
}

id objc_msgSend_copyCarrierBundleVersion_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyCarrierBundleVersion:error:");
}

id objc_msgSend_copyItemAtURL_toURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyItemAtURL:toURL:error:");
}

id objc_msgSend_copyItemWithPersistentID_useSystemKeychain_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyItemWithPersistentID:useSystemKeychain:");
}

id objc_msgSend_copyMobileCountryCode_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyMobileCountryCode:error:");
}

id objc_msgSend_copyMobileNetworkCode_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyMobileNetworkCode:error:");
}

id objc_msgSend_copyRegistrationStatus_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyRegistrationStatus:error:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:");
}

id objc_msgSend_createDirectoryAtURL_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:");
}

id objc_msgSend_currentCalendar(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentCalendar");
}

id objc_msgSend_currentConnection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentConnection");
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentDevice");
}

id objc_msgSend_currentDevicePropertyKeys(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentDevicePropertyKeys");
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentHandler");
}

id objc_msgSend_currentLayout(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentLayout");
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentLocale");
}

id objc_msgSend_currentPasscodeIsCompliantWithGlobalRestrictionsOutError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentPasscodeIsCompliantWithGlobalRestrictionsOutError:");
}

id objc_msgSend_currentPasscodeIsCompliantWithProfileRestrictionsOutError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentPasscodeIsCompliantWithProfileRestrictionsOutError:");
}

id objc_msgSend_currentRestrictions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentRestrictions");
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentRunLoop");
}

id objc_msgSend_currentState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentState");
}

id objc_msgSend_currentStateName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentStateName");
}

id objc_msgSend_currentStatusWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentStatusWithError:");
}

id objc_msgSend_currentThread(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentThread");
}

id objc_msgSend_currentUser(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentUser");
}

id objc_msgSend_currentlyPickedDestinationDeviceID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentlyPickedDestinationDeviceID");
}

id objc_msgSend_currentlyPickedDestinationName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentlyPickedDestinationName");
}

id objc_msgSend_dataQuota(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataQuota");
}

id objc_msgSend_dataRoamingEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataRoamingEnabled");
}

id objc_msgSend_dataTaskWithRequest_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataTaskWithRequest:completionHandler:");
}

id objc_msgSend_dataUsed(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataUsed");
}

id objc_msgSend_dataUsingEncoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataUsingEncoding:");
}

id objc_msgSend_dataWithBytes_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithBytes:length:");
}

id objc_msgSend_dataWithContentsOfFile_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithContentsOfFile:options:error:");
}

id objc_msgSend_dataWithContentsOfURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithContentsOfURL:");
}

id objc_msgSend_dataWithPropertyList_format_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithPropertyList:format:options:error:");
}

id objc_msgSend_database(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "database");
}

id objc_msgSend_databaseInitializationOperation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "databaseInitializationOperation");
}

id objc_msgSend_databaseInitializationOperationDidFinish(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "databaseInitializationOperationDidFinish");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "date");
}

id objc_msgSend_dateByAddingTimeInterval_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dateByAddingTimeInterval:");
}

id objc_msgSend_dateByAddingUnit_value_toDate_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dateByAddingUnit:value:toDate:options:");
}

id objc_msgSend_dateFromString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dateFromString:");
}

id objc_msgSend_dateWithTimeIntervalSince1970_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dateWithTimeIntervalSince1970:");
}

id objc_msgSend_dateWithTimeIntervalSinceNow_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dateWithTimeIntervalSinceNow:");
}

id objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dateWithTimeIntervalSinceReferenceDate:");
}

id objc_msgSend_day(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "day");
}

id objc_msgSend_debugDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "debugDescription");
}

id objc_msgSend_declarationForPayload_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "declarationForPayload:error:");
}

id objc_msgSend_declarationIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "declarationIdentifier");
}

id objc_msgSend_declarationServerHash(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "declarationServerHash");
}

id objc_msgSend_declarations(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "declarations");
}

id objc_msgSend_declarationsWithDictionaries_organizationIdentifier_context_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "declarationsWithDictionaries:organizationIdentifier:context:error:");
}

id objc_msgSend_decodeObjectOfClass_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decodeObjectOfClass:forKey:");
}

id objc_msgSend_decodeObjectOfClasses_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decodeObjectOfClasses:forKey:");
}

id objc_msgSend_defaultButtonText(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultButtonText");
}

id objc_msgSend_defaultButtonTitle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultButtonTitle");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultCenter");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultManager");
}

id objc_msgSend_defaultProductKey(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultProductKey");
}

id objc_msgSend_defaultRestrictions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultRestrictions");
}

id objc_msgSend_defaultStore(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultStore");
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultWorkspace");
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "delegate");
}

id objc_msgSend_delegateDidResume(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "delegateDidResume");
}

id objc_msgSend_delegateWillSuspend(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "delegateWillSuspend");
}

id objc_msgSend_delegateWithAuthenticationContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "delegateWithAuthenticationContext:");
}

id objc_msgSend_deleteFeedback(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deleteFeedback");
}

id objc_msgSend_deleteObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deleteObject:");
}

id objc_msgSend_deleteUser_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deleteUser:completionHandler:");
}

id objc_msgSend_denyiCloudLogout(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "denyiCloudLogout");
}

id objc_msgSend_dependencies(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dependencies");
}

id objc_msgSend_dependentsOfParent_inDomain_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dependentsOfParent:inDomain:");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "description");
}

id objc_msgSend_descriptionForChangeType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "descriptionForChangeType:");
}

id objc_msgSend_descriptionForSQLiteStoreWithDatabaseURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "descriptionForSQLiteStoreWithDatabaseURL:");
}

id objc_msgSend_descriptiveProperties(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "descriptiveProperties");
}

id objc_msgSend_descriptor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "descriptor");
}

id objc_msgSend_destinationDeviceID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "destinationDeviceID");
}

id objc_msgSend_destinationName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "destinationName");
}

id objc_msgSend_destroyLegacyDatabaseIfNeeded(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "destroyLegacyDatabaseIfNeeded");
}

id objc_msgSend_destroyPersistentStoreAtURL_withType_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "destroyPersistentStoreAtURL:withType:options:error:");
}

id objc_msgSend_destroyPersistentStoresWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "destroyPersistentStoresWithError:");
}

id objc_msgSend_details(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "details");
}

id objc_msgSend_deviceClass(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceClass");
}

id objc_msgSend_deviceInfoDeviceChannelKeys(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceInfoDeviceChannelKeys");
}

id objc_msgSend_deviceInfoKeyFromDMFKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceInfoKeyFromDMFKey:");
}

id objc_msgSend_deviceInfoRMDKeys(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceInfoRMDKeys");
}

id objc_msgSend_deviceStateObserver(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceStateObserver");
}

id objc_msgSend_deviceStateProvider(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceStateProvider");
}

id objc_msgSend_deviceType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceType");
}

id objc_msgSend_deviceWithKeys_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceWithKeys:");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionary");
}

id objc_msgSend_dictionaryRepresentation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryRepresentation");
}

id objc_msgSend_dictionaryWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithCapacity:");
}

id objc_msgSend_dictionaryWithContentsOfFile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithContentsOfFile:");
}

id objc_msgSend_dictionaryWithContentsOfURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithContentsOfURL:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_dictionaryWithValuesForKeys_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithValuesForKeys:");
}

id objc_msgSend_didCancelInstalling(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didCancelInstalling");
}

id objc_msgSend_didCancelInstallingForLifeCycle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didCancelInstallingForLifeCycle:");
}

id objc_msgSend_didCancelUpdating(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didCancelUpdating");
}

id objc_msgSend_didCancelUpdatingForLifeCycle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didCancelUpdatingForLifeCycle:");
}

id objc_msgSend_didChangeInstallingProgress(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didChangeInstallingProgress");
}

id objc_msgSend_didChangeInstallingProgressForLifeCycle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didChangeInstallingProgressForLifeCycle:");
}

id objc_msgSend_didChangeUpdatingProgress(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didChangeUpdatingProgress");
}

id objc_msgSend_didChangeUpdatingProgressForLifeCycle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didChangeUpdatingProgressForLifeCycle:");
}

id objc_msgSend_didChangeValueForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didChangeValueForKey:");
}

id objc_msgSend_didFailInstalling(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didFailInstalling");
}

id objc_msgSend_didFailInstallingForLifeCycle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didFailInstallingForLifeCycle:");
}

id objc_msgSend_didFailUninstalling(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didFailUninstalling");
}

id objc_msgSend_didFailUninstallingForLifeCycle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didFailUninstallingForLifeCycle:");
}

id objc_msgSend_didFailUpdating(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didFailUpdating");
}

id objc_msgSend_didFailUpdatingForLifeCycle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didFailUpdatingForLifeCycle:");
}

id objc_msgSend_didFinishInstalling(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didFinishInstalling");
}

id objc_msgSend_didFinishInstallingForLifeCycle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didFinishInstallingForLifeCycle:");
}

id objc_msgSend_didFinishUninstalling(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didFinishUninstalling");
}

id objc_msgSend_didFinishUninstallingForLifeCycle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didFinishUninstallingForLifeCycle:");
}

id objc_msgSend_didFinishUpdating(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didFinishUpdating");
}

id objc_msgSend_didFinishUpdatingForLifeCycle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didFinishUpdatingForLifeCycle:");
}

id objc_msgSend_didPauseInstalling(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didPauseInstalling");
}

id objc_msgSend_didPauseInstallingForLifeCycle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didPauseInstallingForLifeCycle:");
}

id objc_msgSend_didPauseUpdating(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didPauseUpdating");
}

id objc_msgSend_didPauseUpdatingForLifeCycle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didPauseUpdatingForLifeCycle:");
}

id objc_msgSend_didPromptUser(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didPromptUser");
}

id objc_msgSend_didResetState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didResetState");
}

id objc_msgSend_didResetStateForLifeCycle_state_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didResetStateForLifeCycle:state:");
}

id objc_msgSend_didResumeInstalling(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didResumeInstalling");
}

id objc_msgSend_didResumeInstallingForLifeCycle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didResumeInstallingForLifeCycle:");
}

id objc_msgSend_didResumeUpdating(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didResumeUpdating");
}

id objc_msgSend_didResumeUpdatingForLifeCycle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didResumeUpdatingForLifeCycle:");
}

id objc_msgSend_didStartInstalling(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didStartInstalling");
}

id objc_msgSend_didStartInstallingForLifeCycle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didStartInstallingForLifeCycle:");
}

id objc_msgSend_didStartUpdating(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didStartUpdating");
}

id objc_msgSend_didStartUpdatingForLifeCycle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didStartUpdatingForLifeCycle:");
}

id objc_msgSend_disableManagedLostModeWithLocatedMessage_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "disableManagedLostModeWithLocatedMessage:completion:");
}

id objc_msgSend_diskUsage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "diskUsage");
}

id objc_msgSend_dismissAfterTimeInterval(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dismissAfterTimeInterval");
}

id objc_msgSend_displayCSN(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "displayCSN");
}

id objc_msgSend_displayInAppWhitelistModes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "displayInAppWhitelistModes");
}

id objc_msgSend_displayName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "displayName");
}

id objc_msgSend_displayOnLockScreen(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "displayOnLockScreen");
}

id objc_msgSend_displayWhenLocked(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "displayWhenLocked");
}

id objc_msgSend_distantFuture(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "distantFuture");
}

id objc_msgSend_distributedNotificationNames(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "distributedNotificationNames");
}

id objc_msgSend_distributorID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "distributorID");
}

id objc_msgSend_distributorInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "distributorInfo");
}

id objc_msgSend_dm_atomicWriteToURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dm_atomicWriteToURL:error:");
}

id objc_msgSend_dmd_createUserDMDDirectoryDataVault(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dmd_createUserDMDDirectoryDataVault");
}

id objc_msgSend_dmd_legacyUserConfigurationEngineDatabaseURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dmd_legacyUserConfigurationEngineDatabaseURL");
}

id objc_msgSend_dmd_setUserDirSuffix_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dmd_setUserDirSuffix:");
}

id objc_msgSend_dmd_sha1Hash(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dmd_sha1Hash");
}

id objc_msgSend_dmd_systemConfigurationEngineDirectoryURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dmd_systemConfigurationEngineDirectoryURL");
}

id objc_msgSend_dmd_systemDMDDirectoryURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dmd_systemDMDDirectoryURL");
}

id objc_msgSend_dmd_systemLibraryURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dmd_systemLibraryURL");
}

id objc_msgSend_dmd_userConfigurationDatabaseURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dmd_userConfigurationDatabaseURL");
}

id objc_msgSend_dmd_userConfigurationEngineDirectoryURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dmd_userConfigurationEngineDirectoryURL");
}

id objc_msgSend_dmd_userDMDDirectoryURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dmd_userDMDDirectoryURL");
}

id objc_msgSend_dmd_userDarwinUserTempDirectoryURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dmd_userDarwinUserTempDirectoryURL");
}

id objc_msgSend_dmd_userEffectivePoliciesDatabaseURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dmd_userEffectivePoliciesDatabaseURL");
}

id objc_msgSend_dmd_userFontDatabaseDirectoryURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dmd_userFontDatabaseDirectoryURL");
}

id objc_msgSend_dmd_userHomeURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dmd_userHomeURL");
}

id objc_msgSend_dmd_userImageDatabaseDirectoryURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dmd_userImageDatabaseDirectoryURL");
}

id objc_msgSend_dmd_userLibraryURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dmd_userLibraryURL");
}

id objc_msgSend_dmfKeyFromDeviceInfoKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dmfKeyFromDeviceInfoKey:");
}

id objc_msgSend_dmf_executeOperationWithContext_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dmf_executeOperationWithContext:error:");
}

id objc_msgSend_dmf_executeRequestWithContext_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dmf_executeRequestWithContext:error:");
}

id objc_msgSend_dmf_installAssetOperationWithReferenceResolver_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dmf_installAssetOperationWithReferenceResolver:error:");
}

id objc_msgSend_dmf_installRequestWithContext_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dmf_installRequestWithContext:error:");
}

id objc_msgSend_dmf_installSynthesizedProfileRequestWithAssetProviders_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dmf_installSynthesizedProfileRequestWithAssetProviders:error:");
}

id objc_msgSend_dmf_removeAssetOperationWithInstallMetadata_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dmf_removeAssetOperationWithInstallMetadata:error:");
}

id objc_msgSend_dmf_removeRequestWithContext_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dmf_removeRequestWithContext:error:");
}

id objc_msgSend_dmf_replaceRequestWithContext_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dmf_replaceRequestWithContext:error:");
}

id objc_msgSend_dmf_requestExecutesWithoutReturning(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dmf_requestExecutesWithoutReturning");
}

id objc_msgSend_dmf_statusForResult_context_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dmf_statusForResult:context:");
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "domain");
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "doubleValue");
}

id objc_msgSend_download(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "download");
}

id objc_msgSend_downloadAndInstallState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "downloadAndInstallState:");
}

id objc_msgSend_downloadIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "downloadIdentifier");
}

id objc_msgSend_downloadPercentComplete(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "downloadPercentComplete");
}

id objc_msgSend_downloadPhaseIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "downloadPhaseIdentifier");
}

id objc_msgSend_downloadSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "downloadSize");
}

id objc_msgSend_downloads(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "downloads");
}

id objc_msgSend_downtimeCategoryIdentifiers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "downtimeCategoryIdentifiers");
}

id objc_msgSend_dynamicUsage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dynamicUsage");
}

id objc_msgSend_eSIMServerURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "eSIMServerURL");
}

id objc_msgSend_echo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "echo");
}

id objc_msgSend_effectiveSettingsStore(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "effectiveSettingsStore");
}

id objc_msgSend_effectiveUserIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "effectiveUserIdentifier");
}

id objc_msgSend_effectiveValueForSetting_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "effectiveValueForSetting:");
}

id objc_msgSend_effectiveWhitelistedAppBundleIDs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "effectiveWhitelistedAppBundleIDs");
}

id objc_msgSend_elements(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "elements");
}

id objc_msgSend_emergencyModeListener(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "emergencyModeListener");
}

id objc_msgSend_emergencyModeQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "emergencyModeQueue");
}

id objc_msgSend_enableLostModeWithInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enableLostModeWithInfo:");
}

id objc_msgSend_enableManagedLostModeWithInfo_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enableManagedLostModeWithInfo:completion:");
}

id objc_msgSend_enabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enabled");
}

id objc_msgSend_encodeObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "encodeObject:forKey:");
}

id objc_msgSend_end(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "end");
}

id objc_msgSend_endDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "endDate");
}

id objc_msgSend_endDay(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "endDay");
}

id objc_msgSend_endHour(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "endHour");
}

id objc_msgSend_endMinute(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "endMinute");
}

id objc_msgSend_endOperationMarkingPayloadMetadata_failedWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "endOperationMarkingPayloadMetadata:failedWithError:");
}

id objc_msgSend_endOperationWithDMFErrorCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "endOperationWithDMFErrorCode:");
}

id objc_msgSend_endOperationWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "endOperationWithError:");
}

id objc_msgSend_endOperationWithPayloadMetadata_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "endOperationWithPayloadMetadata:");
}

id objc_msgSend_endOperationWithResultObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "endOperationWithResultObject:");
}

id objc_msgSend_endOperationWithWrongProductKey_action_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "endOperationWithWrongProductKey:action:");
}

id objc_msgSend_endSecond(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "endSecond");
}

id objc_msgSend_enforcedSoftwareUpdateDelayInDays(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enforcedSoftwareUpdateDelayInDays");
}

id objc_msgSend_engineProcessingOperation_assetResolverForOrganizationWithIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "engineProcessingOperation:assetResolverForOrganizationWithIdentifier:");
}

id objc_msgSend_engineProcessingOperation_enqueuedOperationsForOrganizationWithIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "engineProcessingOperation:enqueuedOperationsForOrganizationWithIdentifier:");
}

id objc_msgSend_enqueueDatabaseModificationOperation_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enqueueDatabaseModificationOperation:completionHandler:");
}

id objc_msgSend_enqueueDeclarationProcessingOperationIfNeeded(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enqueueDeclarationProcessingOperationIfNeeded");
}

id objc_msgSend_enqueueOperation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enqueueOperation:");
}

id objc_msgSend_enqueueOperations_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enqueueOperations:");
}

id objc_msgSend_entity(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "entity");
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_enumeratorForOrdinaryApps(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumeratorForOrdinaryApps");
}

id objc_msgSend_enumeratorForSystemAppPlaceholders(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumeratorForSystemAppPlaceholders");
}

id objc_msgSend_enumeratorForUserAppPlaceholders(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumeratorForUserAppPlaceholders");
}

id objc_msgSend_ephemeralConfigurationSourceControllersByIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ephemeralConfigurationSourceControllersByIdentifier");
}

id objc_msgSend_ephemeralConfigurationSources(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ephemeralConfigurationSources");
}

id objc_msgSend_ephemeralSessionConfiguration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ephemeralSessionConfiguration");
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "error");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_errorsByPropertyKey(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorsByPropertyKey");
}

id objc_msgSend_errorsForKeys(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorsForKeys");
}

id objc_msgSend_evaluatePredicateWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "evaluatePredicateWithError:");
}

id objc_msgSend_eventIdentifiers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "eventIdentifiers");
}

id objc_msgSend_eventStatusMessageWithPayloadIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "eventStatusMessageWithPayloadIdentifier:");
}

id objc_msgSend_eventStatusRollupSinceStartDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "eventStatusRollupSinceStartDate:");
}

id objc_msgSend_eventStatusesByPayloadIdentifierSinceStartDate_organizationIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "eventStatusesByPayloadIdentifierSinceStartDate:organizationIdentifier:");
}

id objc_msgSend_eventStatusesSinceStartDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "eventStatusesSinceStartDate:");
}

id objc_msgSend_eventStreamByEventType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "eventStreamByEventType");
}

id objc_msgSend_eventSubscriptionManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "eventSubscriptionManager");
}

id objc_msgSend_eventSubscriptionsByIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "eventSubscriptionsByIdentifier");
}

id objc_msgSend_eventType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "eventType");
}

id objc_msgSend_eventWithTrigger_context_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "eventWithTrigger:context:");
}

id objc_msgSend_events(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "events");
}

id objc_msgSend_eventsHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "eventsHandler");
}

id objc_msgSend_exceptionWithName_reason_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "exceptionWithName:reason:userInfo:");
}

id objc_msgSend_excludedBoolRestrictions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "excludedBoolRestrictions");
}

id objc_msgSend_excludedContent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "excludedContent");
}

id objc_msgSend_excludedIdentifiers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "excludedIdentifiers");
}

id objc_msgSend_execute_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "execute:");
}

id objc_msgSend_executeFetchRequest_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "executeFetchRequest:error:");
}

id objc_msgSend_existingCoordinatorForAppWithIdentity_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "existingCoordinatorForAppWithIdentity:error:");
}

id objc_msgSend_expiredNotificationTimes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "expiredNotificationTimes");
}

id objc_msgSend_externalVersionIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "externalVersionIdentifier");
}

id objc_msgSend_failureError(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "failureError");
}

id objc_msgSend_feedbackForBundleIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "feedbackForBundleIdentifier:");
}

id objc_msgSend_fetchActivationLockBypassKeyWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchActivationLockBypassKeyWithError:");
}

id objc_msgSend_fetchAppsForRequest_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchAppsForRequest:completion:");
}

id objc_msgSend_fetchCachedVinylInfoWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchCachedVinylInfoWithCompletion:");
}

id objc_msgSend_fetchRemoteProxy_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchRemoteProxy:");
}

id objc_msgSend_fetchRequest(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchRequest");
}

id objc_msgSend_fetchRequestForActivationsFromOrganizationWithIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchRequestForActivationsFromOrganizationWithIdentifier:");
}

id objc_msgSend_fetchRequestForActiveDeclarationFromOrganizationWithIdentifier_withIdentifier_serverHash_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchRequestForActiveDeclarationFromOrganizationWithIdentifier:withIdentifier:serverHash:");
}

id objc_msgSend_fetchRequestForActiveDeclarationsFromOrganizationWithIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchRequestForActiveDeclarationsFromOrganizationWithIdentifier:");
}

id objc_msgSend_fetchRequestForActiveDeclarationsFromOrganizationWithIdentifier_withIdentifiers_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchRequestForActiveDeclarationsFromOrganizationWithIdentifier:withIdentifiers:");
}

id objc_msgSend_fetchRequestForAvailableConfigurationsFromOrganizationWithIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchRequestForAvailableConfigurationsFromOrganizationWithIdentifier:");
}

id objc_msgSend_fetchRequestForAvailableConfigurationsFromOrganizationWithIdentifier_payloadIdentifiers_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchRequestForAvailableConfigurationsFromOrganizationWithIdentifier:payloadIdentifiers:");
}

id objc_msgSend_fetchRequestForCommandsFromOrganizationWithIdentifier_matchingPredicate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchRequestForCommandsFromOrganizationWithIdentifier:matchingPredicate:");
}

id objc_msgSend_fetchRequestForCommandsPendingDeleteFromOrganizationWithIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchRequestForCommandsPendingDeleteFromOrganizationWithIdentifier:");
}

id objc_msgSend_fetchRequestForCommandsPendingExecutionFromOrganizationWithIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchRequestForCommandsPendingExecutionFromOrganizationWithIdentifier:");
}

id objc_msgSend_fetchRequestForCommandsPendingRemovalFromOrganizationWithIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchRequestForCommandsPendingRemovalFromOrganizationWithIdentifier:");
}

id objc_msgSend_fetchRequestForConfigurationsPendingInactiveFromOrganizationWithIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchRequestForConfigurationsPendingInactiveFromOrganizationWithIdentifier:");
}

id objc_msgSend_fetchRequestForConfigurationsPendingInstallFromOrganizationWithIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchRequestForConfigurationsPendingInstallFromOrganizationWithIdentifier:");
}

id objc_msgSend_fetchRequestForConfigurationsPendingRemoveFromOrganizationWithIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchRequestForConfigurationsPendingRemoveFromOrganizationWithIdentifier:");
}

id objc_msgSend_fetchRequestForDeclarationsFromOrganizationWithIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchRequestForDeclarationsFromOrganizationWithIdentifier:");
}

id objc_msgSend_fetchRequestForDeclarationsFromOrganizationWithIdentifier_matchingPredicate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchRequestForDeclarationsFromOrganizationWithIdentifier:matchingPredicate:");
}

id objc_msgSend_fetchRequestForDeclarationsFromOrganizationWithIdentifier_withIdentifiers_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchRequestForDeclarationsFromOrganizationWithIdentifier:withIdentifiers:");
}

id objc_msgSend_fetchRequestForDeclarationsPendingDeleteFromOrganizationWithIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchRequestForDeclarationsPendingDeleteFromOrganizationWithIdentifier:");
}

id objc_msgSend_fetchRequestForFailedDeclarationsFromOrganizationWithIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchRequestForFailedDeclarationsFromOrganizationWithIdentifier:");
}

id objc_msgSend_fetchRequestForPayloadMetadatasFromOrganizationWithIdentifier_matchingPredicate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchRequestForPayloadMetadatasFromOrganizationWithIdentifier:matchingPredicate:");
}

id objc_msgSend_fetchRequestForPayloadMetadatasPendingStatusUpdateFromOrganizationWithIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchRequestForPayloadMetadatasPendingStatusUpdateFromOrganizationWithIdentifier:");
}

id objc_msgSend_fetchRequestMatchingConfigurationOrganizationWithIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchRequestMatchingConfigurationOrganizationWithIdentifier:");
}

id objc_msgSend_fetchRequestMatchingConfigurationOrganizationsOfType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchRequestMatchingConfigurationOrganizationsOfType:");
}

id objc_msgSend_fetchRequestMatchingEventsFromOrganizationWithIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchRequestMatchingEventsFromOrganizationWithIdentifier:");
}

id objc_msgSend_fetchRequestMatchingRegistrationFromOrganizationWithIdentifier_payloadIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchRequestMatchingRegistrationFromOrganizationWithIdentifier:payloadIdentifier:");
}

id objc_msgSend_fileDescriptor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileDescriptor");
}

id objc_msgSend_fileExistsAtPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileExistsAtPath:");
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileSystemRepresentation");
}

id objc_msgSend_fileURLWithFileSystemRepresentation_isDirectory_relativeToURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:");
}

id objc_msgSend_fileURLWithPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileURLWithPath:");
}

id objc_msgSend_fileURLWithPath_isDirectory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileURLWithPath:isDirectory:");
}

id objc_msgSend_filterFlags(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "filterFlags");
}

id objc_msgSend_filterQueryForScope(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "filterQueryForScope");
}

id objc_msgSend_filterRestrictionDictionary_toIncludeOnlyRestrictionsThatDifferFromRestrictions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "filterRestrictionDictionary:toIncludeOnlyRestrictionsThatDifferFromRestrictions:");
}

id objc_msgSend_filteredArrayUsingPredicate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "filteredArrayUsingPredicate:");
}

id objc_msgSend_finishDownloads_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "finishDownloads:");
}

id objc_msgSend_firstMatchInString_options_range_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "firstMatchInString:options:range:");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "firstObject");
}

id objc_msgSend_fixupDatabaseWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fixupDatabaseWithCompletionHandler:");
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "floatValue");
}

id objc_msgSend_fmipStateWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fmipStateWithCompletion:");
}

id objc_msgSend_fontDeclaration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fontDeclaration");
}

id objc_msgSend_fontURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fontURL");
}

id objc_msgSend_footnote(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "footnote");
}

id objc_msgSend_force(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "force");
}

id objc_msgSend_forceDeletion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "forceDeletion");
}

id objc_msgSend_foregroundBundleIdentifiers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "foregroundBundleIdentifiers");
}

id objc_msgSend_formattedICCIDStringFromString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "formattedICCIDStringFromString:");
}

id objc_msgSend_formattedIMEIStringFromString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "formattedIMEIStringFromString:");
}

id objc_msgSend_frequency(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "frequency");
}

id objc_msgSend_friendlyName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "friendlyName");
}

id objc_msgSend_fullPath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fullPath");
}

id objc_msgSend_getBundleIdentifierForAppRequest_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getBundleIdentifierForAppRequest:completion:");
}

id objc_msgSend_getBundleIdentifierForManifestURL_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getBundleIdentifierForManifestURL:completion:");
}

id objc_msgSend_getBundleIdentifierForStoreItemIdentifier_personaIdentifier_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getBundleIdentifierForStoreItemIdentifier:personaIdentifier:completion:");
}

id objc_msgSend_getCurrentDataServiceDescriptorSync_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getCurrentDataServiceDescriptorSync:");
}

id objc_msgSend_getCurrentLocationForOriginator_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getCurrentLocationForOriginator:completion:");
}

id objc_msgSend_getFileSystemRepresentation_maxLength_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getFileSystemRepresentation:maxLength:");
}

id objc_msgSend_getInternationalDataAccessSync_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getInternationalDataAccessSync:error:");
}

id objc_msgSend_getJobsUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getJobsUsingBlock:");
}

id objc_msgSend_getLocalizedOperatorName_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getLocalizedOperatorName:error:");
}

id objc_msgSend_getManagedUpdatesWithCompletionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getManagedUpdatesWithCompletionBlock:");
}

id objc_msgSend_getMetadataForAppRequest_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getMetadataForAppRequest:completion:");
}

id objc_msgSend_getMetadataForNonEnterpriseAppRequest_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getMetadataForNonEnterpriseAppRequest:completion:");
}

id objc_msgSend_getMobileEquipmentInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getMobileEquipmentInfo:");
}

id objc_msgSend_getMobileEquipmentInfoFor_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getMobileEquipmentInfoFor:error:");
}

id objc_msgSend_getPhoneNumber_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getPhoneNumber:error:");
}

id objc_msgSend_getPreferredDataSubscriptionContextSync_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getPreferredDataSubscriptionContextSync:");
}

id objc_msgSend_getResourceValue_forKey_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getResourceValue:forKey:error:");
}

id objc_msgSend_getSIMStatus_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getSIMStatus:error:");
}

id objc_msgSend_getSimLabel_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getSimLabel:error:");
}

id objc_msgSend_getSubscriptionInfoWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getSubscriptionInfoWithError:");
}

id objc_msgSend_getUpdatesWithCompletionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getUpdatesWithCompletionBlock:");
}

id objc_msgSend_handleAlarmWithIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleAlarmWithIdentifier:");
}

id objc_msgSend_handleConfigurationSourceRegistrationRequest_clientIdentifier_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleConfigurationSourceRegistrationRequest:clientIdentifier:completionHandler:");
}

id objc_msgSend_handleCreateConfigurationOrganizationRequest_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleCreateConfigurationOrganizationRequest:completionHandler:");
}

id objc_msgSend_handleDeactivateConfigurationOrganizationRequest_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleDeactivateConfigurationOrganizationRequest:completionHandler:");
}

id objc_msgSend_handleDistributedNotificationWithName_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleDistributedNotificationWithName:userInfo:");
}

id objc_msgSend_handleFailureInFunction_file_lineNumber_description_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleFailureInFunction:file:lineNumber:description:");
}

id objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleFailureInMethod:object:file:lineNumber:description:");
}

id objc_msgSend_handleFetchConfigurationOrganizationsRequest_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleFetchConfigurationOrganizationsRequest:completionHandler:");
}

id objc_msgSend_handleFetchDeclarationsRequest_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleFetchDeclarationsRequest:completionHandler:");
}

id objc_msgSend_handleFetchRequest_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleFetchRequest:completion:");
}

id objc_msgSend_handleFetchStreamEvents_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleFetchStreamEvents:completionHandler:");
}

id objc_msgSend_handleInstallSubscriptionRequest_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleInstallSubscriptionRequest:completionHandler:");
}

id objc_msgSend_handleManagedEffectiveSettingsChangeInGroup_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleManagedEffectiveSettingsChangeInGroup:");
}

id objc_msgSend_handleNotifyMatchingNotificationWithName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleNotifyMatchingNotificationWithName:");
}

id objc_msgSend_handleRemoveSubscriptionRequest_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleRemoveSubscriptionRequest:completionHandler:");
}

id objc_msgSend_handleSetDeclarationsRequest_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleSetDeclarationsRequest:completionHandler:");
}

id objc_msgSend_handleUpdateCommandsRequest_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleUpdateCommandsRequest:completionHandler:");
}

id objc_msgSend_handleUpdateDeclarationsRequest_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleUpdateDeclarationsRequest:completionHandler:");
}

id objc_msgSend_hasAppleInternalInstallCapability(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasAppleInternalInstallCapability");
}

id objc_msgSend_hasCDMA(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasCDMA");
}

id objc_msgSend_hasCellularDataCapability(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasCellularDataCapability");
}

id objc_msgSend_hasChanges(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasChanges");
}

id objc_msgSend_hasDataToSync(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasDataToSync");
}

id objc_msgSend_hasGSM(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasGSM");
}

id objc_msgSend_hasKeychainUnlockedSinceBoot(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasKeychainUnlockedSinceBoot");
}

id objc_msgSend_hasPersonalHotspotCapability(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasPersonalHotspotCapability");
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_hasTelephonyCapability(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasTelephonyCapability");
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hash");
}

id objc_msgSend_header(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "header");
}

id objc_msgSend_homeSharingCloudClient(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "homeSharingCloudClient");
}

id objc_msgSend_host(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "host");
}

id objc_msgSend_hour(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hour");
}

id objc_msgSend_humanReadableUpdateName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "humanReadableUpdateName");
}

id objc_msgSend_iTunesAccountHashForUniqueIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "iTunesAccountHashForUniqueIdentifier:");
}

id objc_msgSend_iTunesMetadata(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "iTunesMetadata");
}

id objc_msgSend_iTunesStoreID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "iTunesStoreID");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "identifier");
}

id objc_msgSend_identifiers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "identifiers");
}

id objc_msgSend_imageDeclaration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "imageDeclaration");
}

id objc_msgSend_imageURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "imageURL");
}

id objc_msgSend_inEDUMode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "inEDUMode");
}

id objc_msgSend_inReplyTo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "inReplyTo");
}

id objc_msgSend_includeInternalState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "includeInternalState");
}

id objc_msgSend_includePayloadContents(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "includePayloadContents");
}

id objc_msgSend_incomingPayloadMetadataReferences(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "incomingPayloadMetadataReferences");
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "init");
}

id objc_msgSend_initForOperation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initForOperation:");
}

id objc_msgSend_initPrivate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initPrivate");
}

id objc_msgSend_initWithAccount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithAccount:");
}

id objc_msgSend_initWithAction_productKey_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithAction:productKey:error:");
}

id objc_msgSend_initWithApplicationRecord_hasUpdateAvailable_propertyKeys_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithApplicationRecord:hasUpdateAvailable:propertyKeys:");
}

id objc_msgSend_initWithAppsByBundleIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithAppsByBundleIdentifier:");
}

id objc_msgSend_initWithArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithArray:");
}

id objc_msgSend_initWithArray_copyItems_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithArray:copyItems:");
}

id objc_msgSend_initWithAuthenticationContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithAuthenticationContext:");
}

id objc_msgSend_initWithBook_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBook:");
}

id objc_msgSend_initWithBooks_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBooks:");
}

id objc_msgSend_initWithBundleID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBundleID:");
}

id objc_msgSend_initWithBundleIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBundleIdentifier:");
}

id objc_msgSend_initWithBundleIdentifier_allowPlaceholder_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBundleIdentifier:allowPlaceholder:error:");
}

id objc_msgSend_initWithBundleIdentifier_efficacy_name_withHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBundleIdentifier:efficacy:name:withHandler:");
}

id objc_msgSend_initWithBundleIdentifier_personaUniqueString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBundleIdentifier:personaUniqueString:");
}

id objc_msgSend_initWithBundleIdentifier_propertyKeys_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBundleIdentifier:propertyKeys:");
}

id objc_msgSend_initWithBundleIdentifier_state_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBundleIdentifier:state:");
}

id objc_msgSend_initWithBundleIdentifierOfSystemPlaceholder_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBundleIdentifierOfSystemPlaceholder:error:");
}

id objc_msgSend_initWithBundleType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBundleType:");
}

id objc_msgSend_initWithBypassCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBypassCode:");
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCapacity:");
}

id objc_msgSend_initWithCategories_applications_webDomains_schedule_calendarIdentifier_identifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCategories:applications:webDomains:schedule:calendarIdentifier:identifier:");
}

id objc_msgSend_initWithCertificateRef_isIdentity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCertificateRef:isIdentity:");
}

id objc_msgSend_initWithCertificates_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCertificates:");
}

id objc_msgSend_initWithCommonName_data_isIdentity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCommonName:data:isIdentity:");
}

id objc_msgSend_initWithConfigurationSource_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithConfigurationSource:");
}

id objc_msgSend_initWithConfigurationSource_delegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithConfigurationSource:delegate:");
}

id objc_msgSend_initWithContentsOfURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithContentsOfURL:");
}

id objc_msgSend_initWithContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithContext:");
}

id objc_msgSend_initWithController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithController:");
}

id objc_msgSend_initWithDatabase_payloadMetadataObjectID_payloadIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDatabase:payloadMetadataObjectID:payloadIdentifier:");
}

id objc_msgSend_initWithDatabase_policyPersistence_activationManager_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDatabase:policyPersistence:activationManager:");
}

id objc_msgSend_initWithDelegate_clientType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDelegate:clientType:");
}

id objc_msgSend_initWithDelegate_uniqueIdentifier_budgetPredicate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDelegate:uniqueIdentifier:budgetPredicate:");
}

id objc_msgSend_initWithDelegate_uniqueIdentifier_compositeBudgetPredicate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDelegate:uniqueIdentifier:compositeBudgetPredicate:");
}

id objc_msgSend_initWithDelegate_uniqueIdentifier_curfewPredicate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDelegate:uniqueIdentifier:curfewPredicate:");
}

id objc_msgSend_initWithDelegate_uniqueIdentifier_iCloudAccountPredicate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDelegate:uniqueIdentifier:iCloudAccountPredicate:");
}

id objc_msgSend_initWithDelegate_uniqueIdentifier_oneTimePredicate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDelegate:uniqueIdentifier:oneTimePredicate:");
}

id objc_msgSend_initWithDelegate_uniqueIdentifier_predicate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDelegate:uniqueIdentifier:predicate:");
}

id objc_msgSend_initWithDelegate_uniqueIdentifier_subPredicateObserver_predicate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDelegate:uniqueIdentifier:subPredicateObserver:predicate:");
}

id objc_msgSend_initWithDelegate_uniqueIdentifier_subPredicateObservers_predicate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDelegate:uniqueIdentifier:subPredicateObservers:predicate:");
}

id objc_msgSend_initWithDescriptor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDescriptor:");
}

id objc_msgSend_initWithDownloadMetadata_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDownloadMetadata:");
}

id objc_msgSend_initWithEffectiveBundle_delegate_onQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithEffectiveBundle:delegate:onQueue:");
}

id objc_msgSend_initWithEntity_insertIntoManagedObjectContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithEntity:insertIntoManagedObjectContext:");
}

id objc_msgSend_initWithEventType_details_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithEventType:details:");
}

id objc_msgSend_initWithFontDeclaration_installMetadata_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFontDeclaration:installMetadata:");
}

id objc_msgSend_initWithFontDeclaration_resolver_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFontDeclaration:resolver:");
}

id objc_msgSend_initWithFormat_arguments_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFormat:arguments:");
}

id objc_msgSend_initWithImageDeclaration_installMetadata_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithImageDeclaration:installMetadata:");
}

id objc_msgSend_initWithImageDeclaration_resolver_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithImageDeclaration:resolver:");
}

id objc_msgSend_initWithItemIdentifer_externalVersionIdentifier_bundleIdentifier_bundleVersion_skipDownloads_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithItemIdentifer:externalVersionIdentifier:bundleIdentifier:bundleVersion:skipDownloads:");
}

id objc_msgSend_initWithJob_hasUpdateAvailable_propertyKeys_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithJob:hasUpdateAvailable:propertyKeys:");
}

id objc_msgSend_initWithKeyOptions_valueOptions_capacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithKeyOptions:valueOptions:capacity:");
}

id objc_msgSend_initWithKind_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithKind:");
}

id objc_msgSend_initWithListenerEndpoint_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithListenerEndpoint:");
}

id objc_msgSend_initWithListeners_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithListeners:");
}

id objc_msgSend_initWithLocation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithLocation:");
}

id objc_msgSend_initWithMachServiceName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithMachServiceName:");
}

id objc_msgSend_initWithMachServiceName_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithMachServiceName:options:");
}

id objc_msgSend_initWithManagerOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithManagerOptions:");
}

id objc_msgSend_initWithManifestDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithManifestDictionary:");
}

id objc_msgSend_initWithName_managedObjectModel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithName:managedObjectModel:");
}

id objc_msgSend_initWithObjects_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithObjects:");
}

id objc_msgSend_initWithObjects_forKeys_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithObjects:forKeys:");
}

id objc_msgSend_initWithOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithOptions:");
}

id objc_msgSend_initWithOrganization_delegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithOrganization:delegate:");
}

id objc_msgSend_initWithPersistentID_iTunesStoreID_author_title_version_type_state_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPersistentID:iTunesStoreID:author:title:version:type:state:");
}

id objc_msgSend_initWithPersistentStoreDescriptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPersistentStoreDescriptions:");
}

id objc_msgSend_initWithPolicyPersistence_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPolicyPersistence:");
}

id objc_msgSend_initWithPolicyPersistence_activationManager_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPolicyPersistence:activationManager:");
}

id objc_msgSend_initWithProductKey_humanReadableName_productName_version_build_downloadSize_installSize_isCritical_restartRequired_allowsInstallLater_isSplat_supplementalBuild_supplementalVersionExtra_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithProductKey:humanReadableName:productName:version:build:downloadSize:installSize:isCritical:restartRequired:allowsInstallLater:isSplat:supplementalBuild:supplementalVersionExtra:");
}

id objc_msgSend_initWithProductKey_status_downloadPercentComplete_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithProductKey:status:downloadPercentComplete:");
}

id objc_msgSend_initWithProfile_isManaged_signerCertificates_restrictions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithProfile:isManaged:signerCertificates:restrictions:");
}

id objc_msgSend_initWithProfileRef_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithProfileRef:");
}

id objc_msgSend_initWithProfiles_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithProfiles:");
}

id objc_msgSend_initWithQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithQueue:");
}

id objc_msgSend_initWithQueue_name_stateHandlerBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithQueue:name:stateHandlerBlock:");
}

id objc_msgSend_initWithReason_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithReason:");
}

id objc_msgSend_initWithRedeemCodes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithRedeemCodes:");
}

id objc_msgSend_initWithRequest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithRequest:");
}

id objc_msgSend_initWithRestrictions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithRestrictions:");
}

id objc_msgSend_initWithScheduleRegistration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithScheduleRegistration:");
}

id objc_msgSend_initWithSecurityInformation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithSecurityInformation:");
}

id objc_msgSend_initWithStateDescription_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithStateDescription:");
}

id objc_msgSend_initWithSubscriptionRegistration_streamEventsHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithSubscriptionRegistration:streamEventsHandler:");
}

id objc_msgSend_initWithSupportsBlockLevelEncryption_supportsFileLevelEncryption_passcodeIsSet_passcodeIsCompliantWithGlobalRestrictions_passcodeIsCompliantWithProfileRestrictions_passcodeLockGracePeriodEnforced_passcodeLockGracePeriod_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithSupportsBlockLevelEncryption:supportsFileLevelEncryption:passcodeIsSet:passcodeIsCompliantWithGlobalRestrictions:passcodeIsCompliantWithProfileRestrictions:passcodeLockGracePeriodEnforced:passcodeLockGracePeriod:");
}

id objc_msgSend_initWithTarget_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithTarget:");
}

id objc_msgSend_initWithTaskServer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithTaskServer:");
}

id objc_msgSend_initWithType_defaultPolicy_currentPoliciesByIdentifier_defaultPriority_prioritiesByIdentifier_excludedIdentifiers_downtimeEnforced_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithType:defaultPolicy:currentPoliciesByIdentifier:defaultPriority:prioritiesByIdentifier:excludedIdentifiers:downtimeEnforced:");
}

id objc_msgSend_initWithType_identifier_payloadVersion_displayName_organization_payloadDescription_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithType:identifier:payloadVersion:displayName:organization:payloadDescription:");
}

id objc_msgSend_initWithURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithURL:");
}

id objc_msgSend_initWithURLRequest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithURLRequest:");
}

id objc_msgSend_initWithUUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithUUID:");
}

id objc_msgSend_initWithUUID_type_identifier_profileVersion_displayName_organization_profileDescription_isManaged_isLocked_hasRemovalPasscode_isEncrypted_signerCertificates_payloads_restrictions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithUUID:type:identifier:profileVersion:displayName:organization:profileDescription:isManaged:isLocked:hasRemovalPasscode:isEncrypted:signerCertificates:payloads:restrictions:");
}

id objc_msgSend_initWithUpdate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithUpdate:");
}

id objc_msgSend_initWithUser_isCurrentUser_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithUser:isCurrentUser:");
}

id objc_msgSend_initWithUsername_dataQuota_dataUsed_hasDataToSync_isCurrentUser_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithUsername:dataQuota:dataUsed:hasDataToSync:isCurrentUser:");
}

id objc_msgSend_initWithUsers_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithUsers:");
}

id objc_msgSend_initWithValuesByPropertyKey_errorsByPropertyKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithValuesByPropertyKey:errorsByPropertyKey:");
}

id objc_msgSend_initWithXPCConnection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithXPCConnection:");
}

id objc_msgSend_initializationError(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initializationError");
}

id objc_msgSend_initializationOperation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initializationOperation");
}

id objc_msgSend_insertString_atIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "insertString:atIndex:");
}

id objc_msgSend_installAppForRequest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "installAppForRequest:");
}

id objc_msgSend_installMetadata(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "installMetadata");
}

id objc_msgSend_installNonStoreBook_fileExtension_URL_assertion_completionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "installNonStoreBook:fileExtension:URL:assertion:completionBlock:");
}

id objc_msgSend_installProfileData_options_outError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "installProfileData:options:outError:");
}

id objc_msgSend_installProgress(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "installProgress");
}

id objc_msgSend_installProvisioningProfileData_managingProfileIdentifier_outError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "installProvisioningProfileData:managingProfileIdentifier:outError:");
}

id objc_msgSend_installState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "installState");
}

id objc_msgSend_installStoreBookWithiTunesStoreID_originator_assertion_completionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "installStoreBookWithiTunesStoreID:originator:assertion:completionBlock:");
}

id objc_msgSend_installSystemAppWithBundleIdentifier_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "installSystemAppWithBundleIdentifier:completion:");
}

id objc_msgSend_installType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "installType");
}

id objc_msgSend_installUpdateWithOptions_withResult_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "installUpdateWithOptions:withResult:");
}

id objc_msgSend_installationSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "installationSize");
}

id objc_msgSend_installed(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "installed");
}

id objc_msgSend_installedProfileIdentifiersWithFilterFlags_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "installedProfileIdentifiersWithFilterFlags:");
}

id objc_msgSend_installedProfileWithIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "installedProfileWithIdentifier:");
}

id objc_msgSend_installedProfilesWithFilterFlags_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "installedProfilesWithFilterFlags:");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "intValue");
}

id objc_msgSend_integerForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "integerForKey:");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "integerValue");
}

id objc_msgSend_internal(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "internal");
}

id objc_msgSend_internalContext(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "internalContext");
}

id objc_msgSend_intersectSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "intersectSet:");
}

id objc_msgSend_invalidResponseError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidResponseError:");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidate");
}

id objc_msgSend_isActivationLockedWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isActivationLockedWithCompletion:");
}

id objc_msgSend_isActive(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isActive");
}

id objc_msgSend_isAdHocCodeSigned(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isAdHocCodeSigned");
}

id objc_msgSend_isAppAnalyticsAllowed(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isAppAnalyticsAllowed");
}

id objc_msgSend_isAppStoreVendable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isAppStoreVendable");
}

id objc_msgSend_isAppleInternal(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isAppleInternal");
}

id objc_msgSend_isAsynchronous(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isAsynchronous");
}

id objc_msgSend_isAutoDownload(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isAutoDownload");
}

id objc_msgSend_isAwaitingConfiguration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isAwaitingConfiguration");
}

id objc_msgSend_isBetaApp(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isBetaApp");
}

id objc_msgSend_isDeleted(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isDeleted");
}

id objc_msgSend_isDeviceBasedVPP(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isDeviceBasedVPP");
}

id objc_msgSend_isDiagnosticSubmissionAllowed(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isDiagnosticSubmissionAllowed");
}

id objc_msgSend_isDone(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isDone");
}

id objc_msgSend_isDowngraded(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isDowngraded");
}

id objc_msgSend_isDownloadComplete(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isDownloadComplete");
}

id objc_msgSend_isDownloadOnly(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isDownloadOnly");
}

id objc_msgSend_isDownloading(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isDownloading");
}

id objc_msgSend_isEnabledForDataclass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEnabledForDataclass:");
}

id objc_msgSend_isEncrypted(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEncrypted");
}

id objc_msgSend_isEnterpriseBookBackupAllowed(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEnterpriseBookBackupAllowed");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToNumber_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToNumber:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isEqualToUser_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToUser:");
}

id objc_msgSend_isExecuting(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isExecuting");
}

id objc_msgSend_isFinished(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isFinished");
}

id objc_msgSend_isFree(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isFree");
}

id objc_msgSend_isInLegacyDowntimeWithPolicies_priorities_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isInLegacyDowntimeWithPolicies:priorities:");
}

id objc_msgSend_isInManagedSettingsDowntime(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isInManagedSettingsDowntime");
}

id objc_msgSend_isInSingleAppMode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isInSingleAppMode");
}

id objc_msgSend_isInserted(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isInserted");
}

id objc_msgSend_isInstalled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isInstalled");
}

id objc_msgSend_isInstalling(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isInstalling");
}

id objc_msgSend_isKeychainUnlocked(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isKeychainUnlocked");
}

id objc_msgSend_isLocked(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isLocked");
}

id objc_msgSend_isLoginUser(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isLoginUser");
}

id objc_msgSend_isMainThread(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isMainThread");
}

id objc_msgSend_isManagedByMDM(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isManagedByMDM");
}

id objc_msgSend_isManagedLostModeActive(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isManagedLostModeActive");
}

id objc_msgSend_isMultiUser(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isMultiUser");
}

id objc_msgSend_isNetworkTethered(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isNetworkTethered");
}

id objc_msgSend_isParked(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isParked");
}

id objc_msgSend_isPasscodeSet(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isPasscodeSet");
}

id objc_msgSend_isPermittedOnCurrentPlatform(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isPermittedOnCurrentPlatform");
}

id objc_msgSend_isPersistentContainerLoaded(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isPersistentContainerLoaded");
}

id objc_msgSend_isPlaceholder(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isPlaceholder");
}

id objc_msgSend_isPromptAllowedRightNow(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isPromptAllowedRightNow");
}

id objc_msgSend_isRestricted(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isRestricted");
}

id objc_msgSend_isRoaming(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isRoaming");
}

id objc_msgSend_isSetupBuddyDone(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isSetupBuddyDone");
}

id objc_msgSend_isSplatOnly(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isSplatOnly");
}

id objc_msgSend_isStoreApp(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isStoreApp");
}

id objc_msgSend_isSubclassOfClass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isSubclassOfClass:");
}

id objc_msgSend_isSubscriptionRoaming_client_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isSubscriptionRoaming:client:");
}

id objc_msgSend_isSupervised(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isSupervised");
}

id objc_msgSend_isUserLicensed(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isUserLicensed");
}

id objc_msgSend_isVPPLicensed(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isVPPLicensed");
}

id objc_msgSend_itemID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "itemID");
}

id objc_msgSend_itemName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "itemName");
}

id objc_msgSend_jobManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "jobManager");
}

id objc_msgSend_keybagLockStateDidChange(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "keybagLockStateDidChange");
}

id objc_msgSend_kind(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "kind");
}

id objc_msgSend_lastDateScheduleElapsed(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastDateScheduleElapsed");
}

id objc_msgSend_lastLocationRequestedDateMessage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastLocationRequestedDateMessage");
}

id objc_msgSend_lastModified(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastModified");
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastObject");
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastPathComponent");
}

id objc_msgSend_lastPredicateEvaluationValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastPredicateEvaluationValue");
}

id objc_msgSend_lastStatusReportTimestamp(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastStatusReportTimestamp");
}

id objc_msgSend_layoutMonitor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "layoutMonitor");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_licenseType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "licenseType");
}

id objc_msgSend_lifeCycle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lifeCycle");
}

id objc_msgSend_lifeCycleForBundleIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lifeCycleForBundleIdentifier:");
}

id objc_msgSend_listAllPersonaWithAttributes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "listAllPersonaWithAttributes");
}

id objc_msgSend_listInstalledProvisioningProfileUUIDsWithManagedOnly_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "listInstalledProvisioningProfileUUIDsWithManagedOnly:");
}

id objc_msgSend_listenerEndpoint(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "listenerEndpoint");
}

id objc_msgSend_loadBooksForStoreIDs_withCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "loadBooksForStoreIDs:withCompletionHandler:");
}

id objc_msgSend_loadPersistentStoresWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "loadPersistentStoresWithCompletionHandler:");
}

id objc_msgSend_localTime(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localTime");
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedDescription");
}

id objc_msgSend_localizedName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedName");
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_localizedStringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedStringWithFormat:");
}

id objc_msgSend_locationManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "locationManager");
}

id objc_msgSend_lockDevice(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lockDevice");
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "longLongValue");
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lowercaseString");
}

id objc_msgSend_machServiceName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "machServiceName");
}

id objc_msgSend_mainQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainQueue");
}

id objc_msgSend_mainThread(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainThread");
}

id objc_msgSend_managedAppsOnly(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "managedAppsOnly");
}

id objc_msgSend_managedBundleIdentifiers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "managedBundleIdentifiers");
}

id objc_msgSend_managedNonStoreBooksDirectory(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "managedNonStoreBooksDirectory");
}

id objc_msgSend_managedNonStoreBooksManifestPath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "managedNonStoreBooksManifestPath");
}

id objc_msgSend_managedObjectContext(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "managedObjectContext");
}

id objc_msgSend_managedObjectModel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "managedObjectModel");
}

id objc_msgSend_managedOnly(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "managedOnly");
}

id objc_msgSend_managedSettingsGroups(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "managedSettingsGroups");
}

id objc_msgSend_managedStoreBooksManifestPath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "managedStoreBooksManifestPath");
}

id objc_msgSend_managementInformation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "managementInformation");
}

id objc_msgSend_managementInformationForBundleIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "managementInformationForBundleIdentifier:");
}

id objc_msgSend_managementOptions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "managementOptions");
}

id objc_msgSend_managementPromptPolicyPath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "managementPromptPolicyPath");
}

id objc_msgSend_managingProfileIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "managingProfileIdentifier");
}

id objc_msgSend_manifest(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "manifest");
}

id objc_msgSend_manifestDictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "manifestDictionary");
}

id objc_msgSend_manifestURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "manifestURL");
}

id objc_msgSend_maxNumberOfUsers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "maxNumberOfUsers");
}

id objc_msgSend_maximumRangeOfUnit_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "maximumRangeOfUnit:");
}

id objc_msgSend_mdmFilePath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mdmFilePath");
}

id objc_msgSend_meInfoList(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "meInfoList");
}

id objc_msgSend_memberQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "memberQueue");
}

id objc_msgSend_memberQueueCleanUp(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "memberQueueCleanUp");
}

id objc_msgSend_memberQueueCommitNonStoreBooksManifest(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "memberQueueCommitNonStoreBooksManifest");
}

id objc_msgSend_memberQueueCommitStoreBooksManifest(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "memberQueueCommitStoreBooksManifest");
}

id objc_msgSend_memberQueuePersistentIDToNonStoreBook(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "memberQueuePersistentIDToNonStoreBook");
}

id objc_msgSend_memberQueueRereadNonStoreBooksManifest(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "memberQueueRereadNonStoreBooksManifest");
}

id objc_msgSend_memberQueueRereadStoreBooksManifest(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "memberQueueRereadStoreBooksManifest");
}

id objc_msgSend_memberQueueiTunesStoreIDToStoreBook(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "memberQueueiTunesStoreIDToStoreBook");
}

id objc_msgSend_message(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "message");
}

id objc_msgSend_metadata(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "metadata");
}

id objc_msgSend_metadataForPersistentStore_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "metadataForPersistentStore:");
}

id objc_msgSend_metadataPath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "metadataPath");
}

id objc_msgSend_metadataWithPayloadDictionary_organizationIdentifier_context_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "metadataWithPayloadDictionary:organizationIdentifier:context:error:");
}

id objc_msgSend_methodForSelector_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "methodForSelector:");
}

id objc_msgSend_minusSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "minusSet:");
}

id objc_msgSend_minute(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "minute");
}

id objc_msgSend_monitorWithConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "monitorWithConfiguration:");
}

id objc_msgSend_moveTransientStatesForward(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "moveTransientStatesForward");
}

id objc_msgSend_mustInstallProfileNonInteractively_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mustInstallProfileNonInteractively:");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_mutableSetValueForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableSetValueForKey:");
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "name");
}

id objc_msgSend_needsRedownload(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "needsRedownload");
}

id objc_msgSend_netrbClient(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "netrbClient");
}

id objc_msgSend_networkDidChange(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "networkDidChange");
}

id objc_msgSend_newAssertionForBundle_withReason_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "newAssertionForBundle:withReason:");
}

id objc_msgSend_newBackgroundContext(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "newBackgroundContext");
}

id objc_msgSend_newUserDatabase(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "newUserDatabase");
}

id objc_msgSend_nextDateAfterDate_matchingComponents_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nextDateAfterDate:matchingComponents:options:");
}

id objc_msgSend_nonStoreBooks(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nonStoreBooks");
}

id objc_msgSend_normalizedPercentComplete(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "normalizedPercentComplete");
}

id objc_msgSend_notification(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "notification");
}

id objc_msgSend_notificationRef(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "notificationRef");
}

id objc_msgSend_notificationTimes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "notificationTimes");
}

id objc_msgSend_notifications(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "notifications");
}

id objc_msgSend_notifyMatchingNotifications(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "notifyMatchingNotifications");
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "now");
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "null");
}

id objc_msgSend_number(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "number");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_numberWithLongLong_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithLongLong:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_object(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "object");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_objectID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectID");
}

id objc_msgSend_objectWithID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectWithID:");
}

id objc_msgSend_observers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "observers");
}

id objc_msgSend_onDemandResourcesUsage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "onDemandResourcesUsage");
}

id objc_msgSend_openApplication_withOptions_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "openApplication:withOptions:completion:");
}

id objc_msgSend_openSensitiveURL_withOptions_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "openSensitiveURL:withOptions:error:");
}

id objc_msgSend_operation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "operation");
}

id objc_msgSend_operationClassForRequest_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "operationClassForRequest:error:");
}

id objc_msgSend_operationForRequest_targetUID_appleID_transport_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "operationForRequest:targetUID:appleID:transport:error:");
}

id objc_msgSend_operations(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "operations");
}

id objc_msgSend_options(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "options");
}

id objc_msgSend_optionsWithDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "optionsWithDictionary:");
}

id objc_msgSend_orPredicateWithSubpredicates_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "orPredicateWithSubpredicates:");
}

id objc_msgSend_organization(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "organization");
}

id objc_msgSend_organizationControllerByIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "organizationControllerByIdentifier");
}

id objc_msgSend_organizationDisplayName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "organizationDisplayName");
}

id objc_msgSend_organizationIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "organizationIdentifier");
}

id objc_msgSend_organizationType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "organizationType");
}

id objc_msgSend_originator(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "originator");
}

id objc_msgSend_otherButtonText(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "otherButtonText");
}

id objc_msgSend_otherButtonTitle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "otherButtonTitle");
}

id objc_msgSend_outgoingPayloadMetadataReferences(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "outgoingPayloadMetadataReferences");
}

id objc_msgSend_overrideDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "overrideDate");
}

id objc_msgSend_park(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "park");
}

id objc_msgSend_password(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "password");
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "path");
}

id objc_msgSend_payload(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "payload");
}

id objc_msgSend_payloadApps(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "payloadApps");
}

id objc_msgSend_payloadCalendarIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "payloadCalendarIdentifier");
}

id objc_msgSend_payloadCategories(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "payloadCategories");
}

id objc_msgSend_payloadCategoriesVersion2(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "payloadCategoriesVersion2");
}

id objc_msgSend_payloadContext(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "payloadContext");
}

id objc_msgSend_payloadDSID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "payloadDSID");
}

id objc_msgSend_payloadDateTime(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "payloadDateTime");
}

id objc_msgSend_payloadDay(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "payloadDay");
}

id objc_msgSend_payloadDays(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "payloadDays");
}

id objc_msgSend_payloadDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "payloadDescription");
}

id objc_msgSend_payloadDescriptor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "payloadDescriptor");
}

id objc_msgSend_payloadDictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "payloadDictionary");
}

id objc_msgSend_payloadEcho(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "payloadEcho");
}

id objc_msgSend_payloadEndDay(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "payloadEndDay");
}

id objc_msgSend_payloadEndTime(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "payloadEndTime");
}

id objc_msgSend_payloadEvents(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "payloadEvents");
}

id objc_msgSend_payloadFrequency(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "payloadFrequency");
}

id objc_msgSend_payloadHostnames(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "payloadHostnames");
}

id objc_msgSend_payloadIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "payloadIdentifier");
}

id objc_msgSend_payloadIdentifiers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "payloadIdentifiers");
}

id objc_msgSend_payloadIdentifiersVersion2(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "payloadIdentifiersVersion2");
}

id objc_msgSend_payloadLocalTime(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "payloadLocalTime");
}

id objc_msgSend_payloadMessage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "payloadMessage");
}

id objc_msgSend_payloadMetadata(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "payloadMetadata");
}

id objc_msgSend_payloadMetadataObjectID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "payloadMetadataObjectID");
}

id objc_msgSend_payloadMetadatas(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "payloadMetadatas");
}

id objc_msgSend_payloadMode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "payloadMode");
}

id objc_msgSend_payloadMonitor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "payloadMonitor");
}

id objc_msgSend_payloadMonitors(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "payloadMonitors");
}

id objc_msgSend_payloadNotificationTimes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "payloadNotificationTimes");
}

id objc_msgSend_payloadPhoneNumber(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "payloadPhoneNumber");
}

id objc_msgSend_payloadPredicate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "payloadPredicate");
}

id objc_msgSend_payloadPredicates(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "payloadPredicates");
}

id objc_msgSend_payloadQueries(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "payloadQueries");
}

id objc_msgSend_payloadRatingRegion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "payloadRatingRegion");
}

id objc_msgSend_payloadReference(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "payloadReference");
}

id objc_msgSend_payloadReturnStatus(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "payloadReturnStatus");
}

id objc_msgSend_payloadSchedule(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "payloadSchedule");
}

id objc_msgSend_payloadSeconds(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "payloadSeconds");
}

id objc_msgSend_payloadSpread(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "payloadSpread");
}

id objc_msgSend_payloadStandardConfigurations(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "payloadStandardConfigurations");
}

id objc_msgSend_payloadStartDay(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "payloadStartDay");
}

id objc_msgSend_payloadStartTime(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "payloadStartTime");
}

id objc_msgSend_payloadTimeBudget(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "payloadTimeBudget");
}

id objc_msgSend_payloadType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "payloadType");
}

id objc_msgSend_payloadWebSites(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "payloadWebSites");
}

id objc_msgSend_payloads(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "payloads");
}

id objc_msgSend_performBackgroundContextBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performBackgroundContextBlock:");
}

id objc_msgSend_performBackgroundTask_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performBackgroundTask:");
}

id objc_msgSend_performBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performBlock:");
}

id objc_msgSend_performBlockAndWait_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performBlockAndWait:");
}

id objc_msgSend_performSelector_withObject_afterDelay_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performSelector:withObject:afterDelay:");
}

id objc_msgSend_performSelectorOnMainThread_withObject_waitUntilDone_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performSelectorOnMainThread:withObject:waitUntilDone:");
}

id objc_msgSend_persistentConfigurationSourceControllersByIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "persistentConfigurationSourceControllersByIdentifier");
}

id objc_msgSend_persistentConfigurationSources(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "persistentConfigurationSources");
}

id objc_msgSend_persistentContainer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "persistentContainer");
}

id objc_msgSend_persistentID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "persistentID");
}

id objc_msgSend_persistentIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "persistentIdentifier");
}

id objc_msgSend_persistentStoreCoordinator(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "persistentStoreCoordinator");
}

id objc_msgSend_persistentStoreDescriptions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "persistentStoreDescriptions");
}

id objc_msgSend_persistentStores(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "persistentStores");
}

id objc_msgSend_personaID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "personaID");
}

id objc_msgSend_personaIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "personaIdentifier");
}

id objc_msgSend_phoneNumber(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "phoneNumber");
}

id objc_msgSend_playSoundWithOptions_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "playSoundWithOptions:completion:");
}

id objc_msgSend_pointerAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pointerAtIndex:");
}

id objc_msgSend_policy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "policy");
}

id objc_msgSend_policyPersistence(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "policyPersistence");
}

id objc_msgSend_policyServerListener(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "policyServerListener");
}

id objc_msgSend_policyTypes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "policyTypes");
}

id objc_msgSend_postNotificationName_object_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "postNotificationName:object:");
}

id objc_msgSend_predicatePayloadMetadata(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "predicatePayloadMetadata");
}

id objc_msgSend_predicateType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "predicateType");
}

id objc_msgSend_predicateWithBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "predicateWithBlock:");
}

id objc_msgSend_predicateWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "predicateWithFormat:");
}

id objc_msgSend_prepareToRunOperation_withContext_withDatabase_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "prepareToRunOperation:withContext:withDatabase:");
}

id objc_msgSend_preprocessDatabaseInContext_forOrganization_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "preprocessDatabaseInContext:forOrganization:error:");
}

id objc_msgSend_primaryAppleID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "primaryAppleID");
}

id objc_msgSend_primitiveValueForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "primitiveValueForKey:");
}

id objc_msgSend_priority(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "priority");
}

id objc_msgSend_probe_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "probe:");
}

id objc_msgSend_processCommandPayloadsInContext_forOrganization_enqueuedOperations_assetResolver_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processCommandPayloadsInContext:forOrganization:enqueuedOperations:assetResolver:error:");
}

id objc_msgSend_processDeclarationPayloadsInContext_forOrganization_enqueuedOperations_assetResolver_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processDeclarationPayloadsInContext:forOrganization:enqueuedOperations:assetResolver:error:");
}

id objc_msgSend_processDeclarationsForOrganizationWithIdentifier_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processDeclarationsForOrganizationWithIdentifier:completionHandler:");
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processIdentifier");
}

id objc_msgSend_processStatusForOrganizationWithIdentifier_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processStatusForOrganizationWithIdentifier:completionHandler:");
}

id objc_msgSend_productBuildVersion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "productBuildVersion");
}

id objc_msgSend_productKey(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "productKey");
}

id objc_msgSend_productKeyFromBuild_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "productKeyFromBuild:");
}

id objc_msgSend_productKeyFromStatus_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "productKeyFromStatus:");
}

id objc_msgSend_productKeyOrDefaultFromStatus_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "productKeyOrDefaultFromStatus:");
}

id objc_msgSend_productSystemName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "productSystemName");
}

id objc_msgSend_productVersion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "productVersion");
}

id objc_msgSend_productVersionExtra(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "productVersionExtra");
}

id objc_msgSend_profile(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "profile");
}

id objc_msgSend_profileData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "profileData");
}

id objc_msgSend_profileDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "profileDescription");
}

id objc_msgSend_profileIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "profileIdentifier");
}

id objc_msgSend_profileValidated(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "profileValidated");
}

id objc_msgSend_profileWithData_outError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "profileWithData:outError:");
}

id objc_msgSend_progress(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "progress");
}

id objc_msgSend_promptResetTimeInterval(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "promptResetTimeInterval");
}

id objc_msgSend_promptTimestamps(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "promptTimestamps");
}

id objc_msgSend_promptUserForiTunesAccount_accountNameEditable_canCreateNewAccount_assertion_completionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "promptUserForiTunesAccount:accountNameEditable:canCreateNewAccount:assertion:completionBlock:");
}

id objc_msgSend_promptUserToLogIntoiTunesWithTitle_message_assertion_completionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "promptUserToLogIntoiTunesWithTitle:message:assertion:completionBlock:");
}

id objc_msgSend_promptUserToLoginToiTunesIfNeededTitle_message_assertion_completionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "promptUserToLoginToiTunesIfNeededTitle:message:assertion:completionBlock:");
}

id objc_msgSend_promptUserToSignInWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "promptUserToSignInWithCompletion:");
}

id objc_msgSend_promptWindowInterval(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "promptWindowInterval");
}

id objc_msgSend_promptsAllowed(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "promptsAllowed");
}

id objc_msgSend_promptsAllowedBeforeAutomaticDenial(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "promptsAllowedBeforeAutomaticDenial");
}

id objc_msgSend_propertyKeys(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "propertyKeys");
}

id objc_msgSend_propertyListWithData_options_format_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "propertyListWithData:options:format:error:");
}

id objc_msgSend_propertyNameForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "propertyNameForKey:");
}

id objc_msgSend_purchasedBooksDirectory(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "purchasedBooksDirectory");
}

id objc_msgSend_purchasedBooksManifest(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "purchasedBooksManifest");
}

id objc_msgSend_purgeDownload_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "purgeDownload:");
}

id objc_msgSend_queryCurrentStateWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "queryCurrentStateWithError:");
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "queue");
}

id objc_msgSend_queueFileDataForAcceptance_originalFileName_outError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "queueFileDataForAcceptance:originalFileName:outError:");
}

id objc_msgSend_queueGroup(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "queueGroup");
}

id objc_msgSend_rangeAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rangeAtIndex:");
}

id objc_msgSend_readTimestampsFromFile(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "readTimestampsFromFile");
}

id objc_msgSend_recordNewPrompt(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recordNewPrompt");
}

id objc_msgSend_redemptionCode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "redemptionCode");
}

id objc_msgSend_redownloadParameters(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "redownloadParameters");
}

id objc_msgSend_refreshBookPurchaseHistoryCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "refreshBookPurchaseHistoryCompletion:");
}

id objc_msgSend_refreshCellularPlansWithCSN_serverURL_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "refreshCellularPlansWithCSN:serverURL:completion:");
}

id objc_msgSend_refreshObject_mergeChanges_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "refreshObject:mergeChanges:");
}

id objc_msgSend_refreshStatusForOrganizationWithIdentifier_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "refreshStatusForOrganizationWithIdentifier:completionHandler:");
}

id objc_msgSend_registerConfigurationSource_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerConfigurationSource:");
}

id objc_msgSend_registerConfigurationSourceOperation_didUpdateRegistrationForConfigurationSource_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerConfigurationSourceOperation:didUpdateRegistrationForConfigurationSource:");
}

id objc_msgSend_registerUserSwitchStakeHolder_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerUserSwitchStakeHolder:");
}

id objc_msgSend_registrationContext(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registrationContext");
}

id objc_msgSend_regularExpressionWithPattern_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "regularExpressionWithPattern:options:error:");
}

id objc_msgSend_relayUUIDString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "relayUUIDString");
}

id objc_msgSend_relayUUIDStringForBundleIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "relayUUIDStringForBundleIdentifier:");
}

id objc_msgSend_remoteInterface(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remoteInterface");
}

id objc_msgSend_remoteObjectProxyWithErrorHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remoteObjectProxyWithErrorHandler:");
}

id objc_msgSend_removabilityForAppWithBundleID_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removabilityForAppWithBundleID:completion:");
}

id objc_msgSend_removabilityForBundleIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removabilityForBundleIdentifier:");
}

id objc_msgSend_removable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removable");
}

id objc_msgSend_removalPasscode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removalPasscode");
}

id objc_msgSend_removeActivationPredicateObserverWithUniqueIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeActivationPredicateObserverWithUniqueIdentifier:");
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeAllObjects");
}

id objc_msgSend_removeAppMetadataForBundleIdentifier_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeAppMetadataForBundleIdentifier:error:");
}

id objc_msgSend_removeAppWithBundleIdentifier_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeAppWithBundleIdentifier:completion:");
}

id objc_msgSend_removeDeclarations(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeDeclarations");
}

id objc_msgSend_removeEffectivePolicyFromOrganizationIdentifier_declarationIdentifier_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeEffectivePolicyFromOrganizationIdentifier:declarationIdentifier:completionHandler:");
}

id objc_msgSend_removeItemAtPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeItemAtPath:error:");
}

id objc_msgSend_removeItemAtURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeItemAtURL:error:");
}

id objc_msgSend_removeMDMAppAttribute_forBundleID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeMDMAppAttribute:forBundleID:");
}

id objc_msgSend_removeNonStoreBookWithPersistentID_assertion_completionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeNonStoreBookWithPersistentID:assertion:completionBlock:");
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObjectAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectAtIndex:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_removeObjectIdenticalTo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectIdenticalTo:");
}

id objc_msgSend_removeObjectsForKeys_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectsForKeys:");
}

id objc_msgSend_removeObjectsInArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectsInArray:");
}

id objc_msgSend_removeObserver_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObserver:");
}

id objc_msgSend_removeObserver_forKeyPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObserver:forKeyPath:");
}

id objc_msgSend_removeObserver_forKeyPath_context_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObserver:forKeyPath:context:");
}

id objc_msgSend_removeObserver_name_object_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObserver:name:object:");
}

id objc_msgSend_removeOrphanedPoliciesNotBelongingToExistingDeclarationIdentifiersByOrganizationIdentifier_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeOrphanedPoliciesNotBelongingToExistingDeclarationIdentifiersByOrganizationIdentifier:completionHandler:");
}

id objc_msgSend_removeOrphanedPoliciesNotBelongingToExistingOrganizationIdentifiers_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeOrphanedPoliciesNotBelongingToExistingOrganizationIdentifiers:completionHandler:");
}

id objc_msgSend_removePersistenceIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removePersistenceIdentifier:");
}

id objc_msgSend_removePersonaMappingForBundleID_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removePersonaMappingForBundleID:error:");
}

id objc_msgSend_removePointerAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removePointerAtIndex:");
}

id objc_msgSend_removeProfileAsyncWithIdentifier_installationType_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeProfileAsyncWithIdentifier:installationType:completion:");
}

id objc_msgSend_removeProfileWithIdentifier_installationType_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeProfileWithIdentifier:installationType:completion:");
}

id objc_msgSend_removeProtectedProfileAsyncWithIdentifier_installationType_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeProtectedProfileAsyncWithIdentifier:installationType:completion:");
}

id objc_msgSend_removeProvisioningProfileWithUUID_outError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeProvisioningProfileWithUUID:outError:");
}

id objc_msgSend_removeStoreBookWithiTunesStoreID_assertion_completionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeStoreBookWithiTunesStoreID:assertion:completionBlock:");
}

id objc_msgSend_removeTerminationAssertionForBundleIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeTerminationAssertionForBundleIdentifier:");
}

id objc_msgSend_removeUpdateWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeUpdateWithError:");
}

id objc_msgSend_reportActivationPredicateObserverDidTrigger(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reportActivationPredicateObserverDidTrigger");
}

id objc_msgSend_reportingRequirements(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reportingRequirements");
}

id objc_msgSend_request(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "request");
}

id objc_msgSend_requestLocation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestLocation");
}

id objc_msgSend_requestPoliciesForTypes_replyHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestPoliciesForTypes:replyHandler:");
}

id objc_msgSend_requestWithURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestWithURL:");
}

id objc_msgSend_requiredEntitlements(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requiredEntitlements");
}

id objc_msgSend_requiresNetworkTether(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requiresNetworkTether");
}

id objc_msgSend_requiresUnlockedKeychain(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requiresUnlockedKeychain");
}

id objc_msgSend_rereadManagedAppAttributes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rereadManagedAppAttributes");
}

id objc_msgSend_resolveAssetWithContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resolveAssetWithContext:");
}

id objc_msgSend_resolver(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resolver");
}

id objc_msgSend_restrictedAppBundleIDs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "restrictedAppBundleIDs");
}

id objc_msgSend_restrictionsAfterApplyingRestrictionsDictionary_toRestrictionsDictionary_outChangeDetected_outError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "restrictionsAfterApplyingRestrictionsDictionary:toRestrictionsDictionary:outChangeDetected:outError:");
}

id objc_msgSend_resultObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resultObject");
}

id objc_msgSend_resultStatus(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resultStatus");
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resume");
}

id objc_msgSend_resumeAppInstallationWithBundleIdentifier_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resumeAppInstallationWithBundleIdentifier:completion:");
}

id objc_msgSend_resumeAppUpdateWithBundleIdentifier_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resumeAppUpdateWithBundleIdentifier:completion:");
}

id objc_msgSend_resumeJobsWithIDs_completionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resumeJobsWithIDs:completionBlock:");
}

id objc_msgSend_resumeSync(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resumeSync");
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "run");
}

id objc_msgSend_runAsUser(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "runAsUser");
}

id objc_msgSend_runConcurrently(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "runConcurrently");
}

id objc_msgSend_runOnMainThread(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "runOnMainThread");
}

id objc_msgSend_runWithRequest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "runWithRequest:");
}

id objc_msgSend_save_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "save:");
}

id objc_msgSend_scDynamicStore(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scDynamicStore");
}

id objc_msgSend_scanForUpdates_withResult_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scanForUpdates:withResult:");
}

id objc_msgSend_scanWaitInterval(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scanWaitInterval");
}

id objc_msgSend_schedule(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "schedule");
}

id objc_msgSend_scheduledAlarmIdentifiers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scheduledAlarmIdentifiers");
}

id objc_msgSend_scheduledTimerWithTimeInterval_repeats_block_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scheduledTimerWithTimeInterval:repeats:block:");
}

id objc_msgSend_scheduledTimerWithTimeInterval_target_selector_userInfo_repeats_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:");
}

id objc_msgSend_scheme(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scheme");
}

id objc_msgSend_screenTime(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "screenTime");
}

id objc_msgSend_searchBookPurchaseHistoryForiTunesStoreID_assertion_completionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "searchBookPurchaseHistoryForiTunesStoreID:assertion:completionBlock:");
}

id objc_msgSend_second(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "second");
}

id objc_msgSend_seconds(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "seconds");
}

id objc_msgSend_sendAppRequestWithBundleIdentifier_storeItemIdentifier_personaIdentifier_type_skipDownloads_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendAppRequestWithBundleIdentifier:storeItemIdentifier:personaIdentifier:type:skipDownloads:completion:");
}

id objc_msgSend_sendEvents_organizationIdentifier_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendEvents:organizationIdentifier:completionHandler:");
}

id objc_msgSend_sendManagedAppsChangedNotification(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendManagedAppsChangedNotification");
}

id objc_msgSend_sendRequestWithCompletionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendRequestWithCompletionBlock:");
}

id objc_msgSend_serialOperationQueuesByGroup(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serialOperationQueuesByGroup");
}

id objc_msgSend_serverHash(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serverHash");
}

id objc_msgSend_serviceForClientIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serviceForClientIdentifier:");
}

id objc_msgSend_serviceWithDefaultShellEndpoint(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serviceWithDefaultShellEndpoint");
}

id objc_msgSend_sessionWithConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sessionWithConfiguration:");
}

id objc_msgSend_setAccountIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAccountIdentifier:");
}

id objc_msgSend_setAccountNameEditable_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAccountNameEditable:");
}

id objc_msgSend_setActivationPredicateObserverManager_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setActivationPredicateObserverManager:");
}

id objc_msgSend_setActive_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setActive:");
}

id objc_msgSend_setAllowUserToHide_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAllowUserToHide:");
}

id objc_msgSend_setAllowUserToHide_forBundleIdentifier_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAllowUserToHide:forBundleIdentifier:error:");
}

id objc_msgSend_setAllowUserToLock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAllowUserToLock:");
}

id objc_msgSend_setAllowUserToLock_forBundleIdentifier_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAllowUserToLock:forBundleIdentifier:error:");
}

id objc_msgSend_setAlternateButtonText_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAlternateButtonText:");
}

id objc_msgSend_setAlternateButtonTitle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAlternateButtonTitle:");
}

id objc_msgSend_setAssetProvidersByPayloadIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAssetProvidersByPayloadIdentifier:");
}

id objc_msgSend_setAssetResolver_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAssetResolver:");
}

id objc_msgSend_setAssociatedDomains_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAssociatedDomains:");
}

id objc_msgSend_setAssociatedDomains_forBundleIdentifier_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAssociatedDomains:forBundleIdentifier:error:");
}

id objc_msgSend_setAssociatedDomainsEnableDirectDownloads_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAssociatedDomainsEnableDirectDownloads:");
}

id objc_msgSend_setAssociatedDomainsEnableDirectDownloads_forBundleIdentifier_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAssociatedDomainsEnableDirectDownloads:forBundleIdentifier:error:");
}

id objc_msgSend_setAuthenticatedAccount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAuthenticatedAccount:");
}

id objc_msgSend_setAuthenticationContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAuthenticationContext:");
}

id objc_msgSend_setAuthor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAuthor:");
}

id objc_msgSend_setAuthorizationStatusByType_forBundle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAuthorizationStatusByType:forBundle:");
}

id objc_msgSend_setAutoDownload_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAutoDownload:");
}

id objc_msgSend_setAutoInstallOperation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAutoInstallOperation:");
}

id objc_msgSend_setAvailable_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAvailable:");
}

id objc_msgSend_setBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBlock:");
}

id objc_msgSend_setBlockingTask_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBlockingTask:");
}

id objc_msgSend_setBoolValue_forSetting_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBoolValue:forSetting:");
}

id objc_msgSend_setBundleIDsToAssertions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBundleIDsToAssertions:");
}

id objc_msgSend_setBundleIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBundleIdentifier:");
}

id objc_msgSend_setBundleIdentifiers_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBundleIdentifiers:");
}

id objc_msgSend_setBundlesIdentifiers_forPersonaWithPersonaUniqueString_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBundlesIdentifiers:forPersonaWithPersonaUniqueString:completionHandler:");
}

id objc_msgSend_setBuyParams_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBuyParams:");
}

id objc_msgSend_setCalendarIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCalendarIdentifier:");
}

id objc_msgSend_setCanCreateNewAccount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCanCreateNewAccount:");
}

id objc_msgSend_setCellularSliceUUIDString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCellularSliceUUIDString:");
}

id objc_msgSend_setCellularSliceUUIDString_forBundleIdentifier_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCellularSliceUUIDString:forBundleIdentifier:error:");
}

id objc_msgSend_setClientBundleIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setClientBundleIdentifier:");
}

id objc_msgSend_setClientIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setClientIdentifier:");
}

id objc_msgSend_setCompletionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCompletionBlock:");
}

id objc_msgSend_setCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCompletionHandler:");
}

id objc_msgSend_setConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setConfiguration:");
}

id objc_msgSend_setConfiguration_forBundleIdentifier_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setConfiguration:forBundleIdentifier:error:");
}

id objc_msgSend_setConfigurationEngine_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setConfigurationEngine:");
}

id objc_msgSend_setConnection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setConnection:");
}

id objc_msgSend_setContentFilterUUIDString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContentFilterUUIDString:");
}

id objc_msgSend_setContentFilterUUIDString_forBundleIdentifier_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContentFilterUUIDString:forBundleIdentifier:error:");
}

id objc_msgSend_setContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContext:");
}

id objc_msgSend_setController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setController:");
}

id objc_msgSend_setCurrentlyPickedDestinationDeviceID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCurrentlyPickedDestinationDeviceID:");
}

id objc_msgSend_setCurrentlyPickedDestinationName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCurrentlyPickedDestinationName:");
}

id objc_msgSend_setDNSProxyUUIDString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDNSProxyUUIDString:");
}

id objc_msgSend_setDNSProxyUUIDString_forBundleIdentifier_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDNSProxyUUIDString:forBundleIdentifier:error:");
}

id objc_msgSend_setDSID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDSID:");
}

id objc_msgSend_setDataRoamingEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDataRoamingEnabled:");
}

id objc_msgSend_setDatabase_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDatabase:");
}

id objc_msgSend_setDatabaseInitializationOperation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDatabaseInitializationOperation:");
}

id objc_msgSend_setDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDate:");
}

id objc_msgSend_setDateStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDateStyle:");
}

id objc_msgSend_setDeclarationIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDeclarationIdentifier:");
}

id objc_msgSend_setDefaultButtonText_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDefaultButtonText:");
}

id objc_msgSend_setDefaultButtonTitle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDefaultButtonTitle:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDesiredAccuracy_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDesiredAccuracy:");
}

id objc_msgSend_setDetails_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDetails:");
}

id objc_msgSend_setDeviceName_outError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDeviceName:outError:");
}

id objc_msgSend_setDeviceStateProvider_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDeviceStateProvider:");
}

id objc_msgSend_setDidPromptUser_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDidPromptUser:");
}

id objc_msgSend_setDisableSlideToUnlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDisableSlideToUnlock:");
}

id objc_msgSend_setDismissAfterTimeInterval_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDismissAfterTimeInterval:");
}

id objc_msgSend_setDisplayInAppWhitelistModes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDisplayInAppWhitelistModes:");
}

id objc_msgSend_setDisplayName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDisplayName:");
}

id objc_msgSend_setDisplayOnLockScreen_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDisplayOnLockScreen:");
}

id objc_msgSend_setDistributorIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDistributorIdentifier:");
}

id objc_msgSend_setDownload_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDownload:");
}

id objc_msgSend_setDownloadIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDownloadIdentifier:");
}

id objc_msgSend_setDownloadKinds_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDownloadKinds:");
}

id objc_msgSend_setDownloadOnly_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDownloadOnly:");
}

id objc_msgSend_setDynamicUsage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDynamicUsage:");
}

id objc_msgSend_setEcho_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEcho:");
}

id objc_msgSend_setEffectivePolicy_forType_identifiers_priority_organizationIdentifier_declarationIdentifier_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEffectivePolicy:forType:identifiers:priority:organizationIdentifier:declarationIdentifier:completionHandler:");
}

id objc_msgSend_setEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEnabled:");
}

id objc_msgSend_setEndDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEndDate:");
}

id objc_msgSend_setEndDay_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEndDay:");
}

id objc_msgSend_setEndHour_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEndHour:");
}

id objc_msgSend_setEndMinute_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEndMinute:");
}

id objc_msgSend_setEndSecond_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEndSecond:");
}

id objc_msgSend_setError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setError:");
}

id objc_msgSend_setErrorsForKeys_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setErrorsForKeys:");
}

id objc_msgSend_setEventStatuses_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEventStatuses:");
}

id objc_msgSend_setEventSubscriptionRegistrations_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEventSubscriptionRegistrations:error:");
}

id objc_msgSend_setEventType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEventType:");
}

id objc_msgSend_setEvents_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEvents:");
}

id objc_msgSend_setEventsHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEventsHandler:");
}

id objc_msgSend_setExcludedIdentifiers_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExcludedIdentifiers:");
}

id objc_msgSend_setExportedInterface_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExportedInterface:");
}

id objc_msgSend_setExportedObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExportedObject:");
}

id objc_msgSend_setExternalVersionIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExternalVersionIdentifier:");
}

id objc_msgSend_setFailed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFailed:");
}

id objc_msgSend_setFeedback_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFeedback:");
}

id objc_msgSend_setFeedback_forBundleIdentifier_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFeedback:forBundleIdentifier:error:");
}

id objc_msgSend_setFireDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFireDate:");
}

id objc_msgSend_setFontURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFontURL:");
}

id objc_msgSend_setFootnoteText_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFootnoteText:");
}

id objc_msgSend_setForced_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setForced:");
}

id objc_msgSend_setFormatOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFormatOptions:");
}

id objc_msgSend_setFullPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFullPath:");
}

id objc_msgSend_setHasUpdateAvailable_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHasUpdateAvailable:");
}

id objc_msgSend_setHeader_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHeader:");
}

id objc_msgSend_setHour_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHour:");
}

id objc_msgSend_setITunesStoreID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setITunesStoreID:");
}

id objc_msgSend_setIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIdentifier:");
}

id objc_msgSend_setIdentifiers_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIdentifiers:");
}

id objc_msgSend_setIgnoreRemovability_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIgnoreRemovability:");
}

id objc_msgSend_setImageURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setImageURL:");
}

id objc_msgSend_setInitialState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInitialState:");
}

id objc_msgSend_setInitializationError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInitializationError:");
}

id objc_msgSend_setInstallMetadata_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInstallMetadata:");
}

id objc_msgSend_setInstallPolicy_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInstallPolicy:");
}

id objc_msgSend_setInstallationState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInstallationState:");
}

id objc_msgSend_setInstalled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInstalled:");
}

id objc_msgSend_setInternalContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInternalContext:");
}

id objc_msgSend_setInternationalDataAccessSync_status_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInternationalDataAccessSync:status:");
}

id objc_msgSend_setIsAdHocCodeSigned_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsAdHocCodeSigned:");
}

id objc_msgSend_setIsAppClip_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsAppClip:");
}

id objc_msgSend_setIsAppStoreVendable_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsAppStoreVendable:");
}

id objc_msgSend_setIsBetaApp_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsBetaApp:");
}

id objc_msgSend_setIsDeviceBasedVPP_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsDeviceBasedVPP:");
}

id objc_msgSend_setIsFree_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsFree:");
}

id objc_msgSend_setIsKeychainUnlocked_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsKeychainUnlocked:");
}

id objc_msgSend_setIsLicenseExpired_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsLicenseExpired:");
}

id objc_msgSend_setIsLicenseRevoked_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsLicenseRevoked:");
}

id objc_msgSend_setIsParked_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsParked:");
}

id objc_msgSend_setIsPersistentContainerLoaded_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsPersistentContainerLoaded:");
}

id objc_msgSend_setIsPlaceholder_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsPlaceholder:");
}

id objc_msgSend_setIsRestricted_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsRestricted:");
}

id objc_msgSend_setIsStoreApp_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsStoreApp:");
}

id objc_msgSend_setIsUPP_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsUPP:");
}

id objc_msgSend_setIsUserBasedVPP_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsUserBasedVPP:");
}

id objc_msgSend_setIsUserLicensed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsUserLicensed:");
}

id objc_msgSend_setIsValidated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsValidated:");
}

id objc_msgSend_setKind_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setKind:");
}

id objc_msgSend_setLastDateScheduleElapsed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLastDateScheduleElapsed:");
}

id objc_msgSend_setLastModified_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLastModified:");
}

id objc_msgSend_setLastPredicateEvaluationValue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLastPredicateEvaluationValue:");
}

id objc_msgSend_setLastStatusReportTimestamp_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLastStatusReportTimestamp:");
}

id objc_msgSend_setLicenseType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLicenseType:");
}

id objc_msgSend_setListenerEndpoint_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setListenerEndpoint:");
}

id objc_msgSend_setLocale_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLocale:");
}

id objc_msgSend_setLocationManager_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLocationManager:");
}

id objc_msgSend_setLogLevel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLogLevel:");
}

id objc_msgSend_setLostModeEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLostModeEnabled:");
}

id objc_msgSend_setMDMAppAttribute_withValue_forBundleID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMDMAppAttribute:withValue:forBundleID:");
}

id objc_msgSend_setMDMUseDelayPeriod_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMDMUseDelayPeriod:");
}

id objc_msgSend_setMachServiceName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMachServiceName:");
}

id objc_msgSend_setManagementInformation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setManagementInformation:");
}

id objc_msgSend_setManagementInformation_forBundleIdentifier_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setManagementInformation:forBundleIdentifier:error:");
}

id objc_msgSend_setMaxConcurrentOperationCount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMaxConcurrentOperationCount:");
}

id objc_msgSend_setMemberQueuePersistentIDToNonStoreBook_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMemberQueuePersistentIDToNonStoreBook:");
}

id objc_msgSend_setMemberQueueiTunesStoreIDToStoreBook_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMemberQueueiTunesStoreIDToStoreBook:");
}

id objc_msgSend_setMessage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMessage:");
}

id objc_msgSend_setMetadata_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMetadata:");
}

id objc_msgSend_setMetadata_forPersistentStore_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMetadata:forPersistentStore:");
}

id objc_msgSend_setMinute_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMinute:");
}

id objc_msgSend_setModificationDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setModificationDate:");
}

id objc_msgSend_setName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setName:");
}

id objc_msgSend_setNeedsRedownload_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNeedsRedownload:");
}

id objc_msgSend_setNeedsRefreshStatus(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNeedsRefreshStatus");
}

id objc_msgSend_setNotification_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNotification:");
}

id objc_msgSend_setNotificationRef_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNotificationRef:");
}

id objc_msgSend_setNotificationTimes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNotificationTimes:");
}

id objc_msgSend_setNumberOfUpdates_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNumberOfUpdates:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setObservers_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObservers:");
}

id objc_msgSend_setOnDemandResourcesUsage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOnDemandResourcesUsage:");
}

id objc_msgSend_setOption_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOption:forKey:");
}

id objc_msgSend_setOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOptions:");
}

id objc_msgSend_setOrganization_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOrganization:");
}

id objc_msgSend_setOrganizationIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOrganizationIdentifier:");
}

id objc_msgSend_setOrganizationsByIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOrganizationsByIdentifier:");
}

id objc_msgSend_setOriginator_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOriginator:");
}

id objc_msgSend_setOtherButtonText_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOtherButtonText:");
}

id objc_msgSend_setOutgoingPayloadMetadataReferences_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOutgoingPayloadMetadataReferences:");
}

id objc_msgSend_setPayload_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPayload:");
}

id objc_msgSend_setPayloadDescriptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPayloadDescriptions:");
}

id objc_msgSend_setPayloadDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPayloadDictionary:");
}

id objc_msgSend_setPayloadIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPayloadIdentifier:");
}

id objc_msgSend_setPayloadMetadata_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPayloadMetadata:");
}

id objc_msgSend_setPendingStatusUpdate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPendingStatusUpdate:");
}

id objc_msgSend_setPersistenceIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPersistenceIdentifier:");
}

id objc_msgSend_setPersistentID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPersistentID:");
}

id objc_msgSend_setPersistentStoreDescriptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPersistentStoreDescriptions:");
}

id objc_msgSend_setPersonaIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPersonaIdentifier:");
}

id objc_msgSend_setPhoneNumber_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPhoneNumber:");
}

id objc_msgSend_setPolicy_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPolicy:");
}

id objc_msgSend_setPolicyTypes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPolicyTypes:");
}

id objc_msgSend_setPowered_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPowered:");
}

id objc_msgSend_setPredicate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPredicate:");
}

id objc_msgSend_setPredicatePayloadMetadata_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPredicatePayloadMetadata:");
}

id objc_msgSend_setPreviousVersion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPreviousVersion:");
}

id objc_msgSend_setPrimitiveValue_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPrimitiveValue:forKey:");
}

id objc_msgSend_setPriority_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPriority:");
}

id objc_msgSend_setProfile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setProfile:");
}

id objc_msgSend_setPromptStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPromptStyle:");
}

id objc_msgSend_setPromptTimestamps_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPromptTimestamps:");
}

id objc_msgSend_setPropertiesToFetch_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPropertiesToFetch:");
}

id objc_msgSend_setPropertyKeys_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPropertyKeys:");
}

id objc_msgSend_setQueuePriority_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setQueuePriority:");
}

id objc_msgSend_setRebootType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRebootType:");
}

id objc_msgSend_setRedemptionCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRedemptionCode:");
}

id objc_msgSend_setRegisteredConfigurationSources_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRegisteredConfigurationSources:");
}

id objc_msgSend_setRegistrationContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRegistrationContext:");
}

id objc_msgSend_setRelationshipKeyPathsForPrefetching_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRelationshipKeyPathsForPrefetching:");
}

id objc_msgSend_setRelayUUIDString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRelayUUIDString:");
}

id objc_msgSend_setRelayUUIDString_forBundleIdentifier_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRelayUUIDString:forBundleIdentifier:error:");
}

id objc_msgSend_setRemainingTime_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRemainingTime:");
}

id objc_msgSend_setRemoteObjectInterface_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRemoteObjectInterface:");
}

id objc_msgSend_setRemovability_forAppWithBundleID_byClient_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRemovability:forAppWithBundleID:byClient:completion:");
}

id objc_msgSend_setRemovability_forBundleIdentifier_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRemovability:forBundleIdentifier:completion:");
}

id objc_msgSend_setRemovable_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRemovable:");
}

id objc_msgSend_setReportingRequirements_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setReportingRequirements:");
}

id objc_msgSend_setRequest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRequest:");
}

id objc_msgSend_setRequestType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRequestType:");
}

id objc_msgSend_setRequestUserConfirmation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRequestUserConfirmation:");
}

id objc_msgSend_setRequestedPMV_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRequestedPMV:");
}

id objc_msgSend_setRequiresNetworkTether_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRequiresNetworkTether:");
}

id objc_msgSend_setRequiresUnlockedKeychain_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRequiresUnlockedKeychain:");
}

id objc_msgSend_setResourceValue_forKey_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setResourceValue:forKey:error:");
}

id objc_msgSend_setResourceValues_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setResourceValues:error:");
}

id objc_msgSend_setResultObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setResultObject:");
}

id objc_msgSend_setResultStatus_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setResultStatus:");
}

id objc_msgSend_setResultType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setResultType:");
}

id objc_msgSend_setRunAsUser_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRunAsUser:");
}

id objc_msgSend_setSchedule_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSchedule:");
}

id objc_msgSend_setSecond_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSecond:");
}

id objc_msgSend_setServerHash_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setServerHash:");
}

id objc_msgSend_setSharedUsage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSharedUsage:");
}

id objc_msgSend_setShortVersion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShortVersion:");
}

id objc_msgSend_setShouldAddStoreAsynchronously_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShouldAddStoreAsynchronously:");
}

id objc_msgSend_setShouldFilterExternalOriginatedDownloads_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShouldFilterExternalOriginatedDownloads:");
}

id objc_msgSend_setShouldHideUserPrompts_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShouldHideUserPrompts:");
}

id objc_msgSend_setSingleAppModeBundleIndentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSingleAppModeBundleIndentifier:");
}

id objc_msgSend_setSkipBackupAttribute_toItemAtPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSkipBackupAttribute:toItemAtPath:");
}

id objc_msgSend_setSoftwareUpdateServices_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSoftwareUpdateServices:");
}

id objc_msgSend_setSortDescriptors_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSortDescriptors:");
}

id objc_msgSend_setSource_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSource:");
}

id objc_msgSend_setSourceIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSourceIdentifier:");
}

id objc_msgSend_setSourceIdentifier_forBundleIdentifier_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSourceIdentifier:forBundleIdentifier:error:");
}

id objc_msgSend_setStartDay_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStartDay:");
}

id objc_msgSend_setStartHour_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStartHour:");
}

id objc_msgSend_setStartMinute_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStartMinute:");
}

id objc_msgSend_setStartSecond_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStartSecond:");
}

id objc_msgSend_setState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setState:");
}

id objc_msgSend_setState_forBundleIdentifier_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setState:forBundleIdentifier:error:");
}

id objc_msgSend_setState_forNonStoreBookWithPersistentID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setState:forNonStoreBookWithPersistentID:");
}

id objc_msgSend_setStateChangeTimestamp_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStateChangeTimestamp:");
}

id objc_msgSend_setStateDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStateDictionary:");
}

id objc_msgSend_setStaticUsage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStaticUsage:");
}

id objc_msgSend_setStillNeedsUpdate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStillNeedsUpdate:");
}

id objc_msgSend_setStoreItemIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStoreItemIdentifier:");
}

id objc_msgSend_setStoreManagedBook_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStoreManagedBook:");
}

id objc_msgSend_setSubOperations_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSubOperations:");
}

id objc_msgSend_setSubscriptionDeclaration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSubscriptionDeclaration:");
}

id objc_msgSend_setSupportedActivations_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSupportedActivations:");
}

id objc_msgSend_setSupportedAssets_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSupportedAssets:");
}

id objc_msgSend_setSupportedCommands_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSupportedCommands:");
}

id objc_msgSend_setSupportedConfigurations_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSupportedConfigurations:");
}

id objc_msgSend_setSupportedEvents_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSupportedEvents:");
}

id objc_msgSend_setSupportedMessages_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSupportedMessages:");
}

id objc_msgSend_setSupportedPredicates_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSupportedPredicates:");
}

id objc_msgSend_setSuspended_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSuspended:");
}

id objc_msgSend_setTapToPayScreenLock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTapToPayScreenLock:");
}

id objc_msgSend_setTapToPayScreenLock_forBundleIdentifier_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTapToPayScreenLock:forBundleIdentifier:completion:");
}

id objc_msgSend_setTaskOperationProvider_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTaskOperationProvider:");
}

id objc_msgSend_setTimeStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTimeStyle:");
}

id objc_msgSend_setTimeZone_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTimeZone:");
}

id objc_msgSend_setTimeoutTimerDispatchSource_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTimeoutTimerDispatchSource:");
}

id objc_msgSend_setTimer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTimer:");
}

id objc_msgSend_setTitle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTitle:");
}

id objc_msgSend_setTransaction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTransaction:");
}

id objc_msgSend_setTransitionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTransitionHandler:");
}

id objc_msgSend_setType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setType:");
}

id objc_msgSend_setURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setURL:");
}

id objc_msgSend_setUid_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUid:");
}

id objc_msgSend_setUnusedRedemptionCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUnusedRedemptionCode:");
}

id objc_msgSend_setUsageBudget_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUsageBudget:");
}

id objc_msgSend_setVPNUUIDString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setVPNUUIDString:");
}

id objc_msgSend_setVPNUUIDString_cellularSliceUUIDString_contentFilterUUIDString_DNSProxyUUIDString_relayUUIDString_associatedDomains_enableDirectDownloads_allowUserToHide_allowUserToLock_configuration_options_sourceIdentifier_forBundleIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setVPNUUIDString:cellularSliceUUIDString:contentFilterUUIDString:DNSProxyUUIDString:relayUUIDString:associatedDomains:enableDirectDownloads:allowUserToHide:allowUserToLock:configuration:options:sourceIdentifier:forBundleIdentifier:");
}

id objc_msgSend_setVPNUUIDString_forBundleIdentifier_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setVPNUUIDString:forBundleIdentifier:error:");
}

id objc_msgSend_setValue_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setValue:forKey:");
}

id objc_msgSend_setValue_forProperty_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setValue:forProperty:");
}

id objc_msgSend_setValue_forSetting_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setValue:forSetting:");
}

id objc_msgSend_setValueTransformer_forName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setValueTransformer:forName:");
}

id objc_msgSend_setVersion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setVersion:");
}

id objc_msgSend_setVoiceRoamingEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setVoiceRoamingEnabled:");
}

id objc_msgSend_setWaitForDeletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWaitForDeletion:");
}

id objc_msgSend_setWeekday_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWeekday:");
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithArray:");
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithObjects:");
}

id objc_msgSend_set_foregroundBundleIdentifiers_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "set_foregroundBundleIdentifiers:");
}

id objc_msgSend_shared(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shared");
}

id objc_msgSend_sharedConfiguration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedConfiguration");
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedConnection");
}

id objc_msgSend_sharedController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedController");
}

id objc_msgSend_sharedDeclarationOperationQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedDeclarationOperationQueue");
}

id objc_msgSend_sharedHacks(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedHacks");
}

id objc_msgSend_sharedInstallTask(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedInstallTask");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedManager");
}

id objc_msgSend_sharedReader(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedReader");
}

id objc_msgSend_sharedServer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedServer");
}

id objc_msgSend_sharedService(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedService");
}

id objc_msgSend_sharedStakeholder(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedStakeholder");
}

id objc_msgSend_sharedUsage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedUsage");
}

id objc_msgSend_shield(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shield");
}

id objc_msgSend_shortVersionString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shortVersionString");
}

id objc_msgSend_shouldBypassVPPLicenseCheck(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldBypassVPPLicenseCheck");
}

id objc_msgSend_showNotification_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "showNotification:completion:");
}

id objc_msgSend_shutdownWithOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shutdownWithOptions:");
}

id objc_msgSend_signerCertificates(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "signerCertificates");
}

id objc_msgSend_singleAppModeBundleIndentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "singleAppModeBundleIndentifier");
}

id objc_msgSend_slotID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "slotID");
}

id objc_msgSend_slotId(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "slotId");
}

id objc_msgSend_softwareUpdateServices(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "softwareUpdateServices");
}

id objc_msgSend_sortDescriptorWithKey_ascending_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sortDescriptorWithKey:ascending:");
}

id objc_msgSend_sortUsingComparator_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sortUsingComparator:");
}

id objc_msgSend_sortedArrayUsingSelector_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sortedArrayUsingSelector:");
}

id objc_msgSend_source(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "source");
}

id objc_msgSend_sourceIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sourceIdentifier");
}

id objc_msgSend_sourceIdentifierForBundleIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sourceIdentifierForBundleIdentifier:");
}

id objc_msgSend_specificCategories(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "specificCategories");
}

id objc_msgSend_spread(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "spread");
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "standardUserDefaults");
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "start");
}

id objc_msgSend_startAirPlaySessionWithDestinationName_destinationDeviceID_password_scanWaitTime_sessionType_force_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startAirPlaySessionWithDestinationName:destinationDeviceID:password:scanWaitTime:sessionType:force:error:");
}

id objc_msgSend_startDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startDate");
}

id objc_msgSend_startDay(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startDay");
}

id objc_msgSend_startDownloadWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startDownloadWithError:");
}

id objc_msgSend_startDownloadWithMetadata_withResult_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startDownloadWithMetadata:withResult:");
}

id objc_msgSend_startHour(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startHour");
}

id objc_msgSend_startInstallWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startInstallWithError:");
}

id objc_msgSend_startInstallingEnterpriseAppWithManifestURL_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startInstallingEnterpriseAppWithManifestURL:completion:");
}

id objc_msgSend_startInstallingNonEnterpriseAppForRequest_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startInstallingNonEnterpriseAppForRequest:completion:");
}

id objc_msgSend_startMinute(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startMinute");
}

id objc_msgSend_startMonitoringBudgets_darwinNotificationName_notificationTimes_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startMonitoringBudgets:darwinNotificationName:notificationTimes:error:");
}

id objc_msgSend_startNotificationStreamWithEventsHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startNotificationStreamWithEventsHandler:");
}

id objc_msgSend_startObservingChanges(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startObservingChanges");
}

id objc_msgSend_startObservingChangesWithHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startObservingChangesWithHandler:");
}

id objc_msgSend_startRedeemingAppWithCode_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startRedeemingAppWithCode:completion:");
}

id objc_msgSend_startSecond(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startSecond");
}

id objc_msgSend_startUninstallingAppWithBundleIdentifier_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startUninstallingAppWithBundleIdentifier:completion:");
}

id objc_msgSend_startUpdatingAppForRequest_metadata_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startUpdatingAppForRequest:metadata:completion:");
}

id objc_msgSend_startWithAuthenticateResponseBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startWithAuthenticateResponseBlock:");
}

id objc_msgSend_startWithCompletionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startWithCompletionBlock:");
}

id objc_msgSend_startWithErrorHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startWithErrorHandler:");
}

id objc_msgSend_startWithRedeemResponseBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startWithRedeemResponseBlock:");
}

id objc_msgSend_startWithScheduleElapsedHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startWithScheduleElapsedHandler:");
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "state");
}

id objc_msgSend_stateChangeTimestamp(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stateChangeTimestamp");
}

id objc_msgSend_stateDictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stateDictionary");
}

id objc_msgSend_stateForBundleIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stateForBundleIdentifier:");
}

id objc_msgSend_stateMachine(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stateMachine");
}

id objc_msgSend_stateWithName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stateWithName:");
}

id objc_msgSend_staticUsage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "staticUsage");
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "status");
}

id objc_msgSend_statusForSourceDidChange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "statusForSourceDidChange:");
}

id objc_msgSend_stayAliveThroughHereAtLeast(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stayAliveThroughHereAtLeast");
}

id objc_msgSend_stillNeedsUpdate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stillNeedsUpdate");
}

id objc_msgSend_stopAirPlaySessionOfType_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopAirPlaySessionOfType:error:");
}

id objc_msgSend_stopMonitoringBudgets_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopMonitoringBudgets:completionHandler:");
}

id objc_msgSend_stopUpdatingLocation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopUpdatingLocation");
}

id objc_msgSend_storeBooks(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "storeBooks");
}

id objc_msgSend_storeItemID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "storeItemID");
}

id objc_msgSend_storeItemIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "storeItemIdentifier");
}

id objc_msgSend_streamEventsHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "streamEventsHandler");
}

id objc_msgSend_stringByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingPathComponent:");
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringForInstallationState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringForInstallationState:");
}

id objc_msgSend_stringForState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringForState:");
}

id objc_msgSend_stringFromDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringFromDate:");
}

id objc_msgSend_stringFromNumber_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringFromNumber:");
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringValue");
}

id objc_msgSend_stringWithCString_encoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithCString:encoding:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithString:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_stringWithValidatedFormat_validFormatSpecifiers_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithValidatedFormat:validFormatSpecifiers:error:");
}

id objc_msgSend_style(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "style");
}

id objc_msgSend_subOperations(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "subOperations");
}

id objc_msgSend_subPredicateObserver(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "subPredicateObserver");
}

id objc_msgSend_subPredicateObservers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "subPredicateObservers");
}

id objc_msgSend_subscriptionDeclaration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "subscriptionDeclaration");
}

id objc_msgSend_subscriptionsInUse(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "subscriptionsInUse");
}

id objc_msgSend_substringFromIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "substringFromIndex:");
}

id objc_msgSend_substringWithRange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "substringWithRange:");
}

id objc_msgSend_supportedActivationTypes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportedActivationTypes");
}

id objc_msgSend_supportedAssetTypes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportedAssetTypes");
}

id objc_msgSend_supportedCommandTypes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportedCommandTypes");
}

id objc_msgSend_supportedConfigurationTypes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportedConfigurationTypes");
}

id objc_msgSend_supportedEventTypes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportedEventTypes");
}

id objc_msgSend_supportedMessageTypes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportedMessageTypes");
}

id objc_msgSend_supportedPredicateTypes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportedPredicateTypes");
}

id objc_msgSend_supportsBlockLevelEncryption(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsBlockLevelEncryption");
}

id objc_msgSend_supportsFileLevelEncryption(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsFileLevelEncryption");
}

id objc_msgSend_switchToLoginUserWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "switchToLoginUserWithCompletionHandler:");
}

id objc_msgSend_syncToken(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "syncToken");
}

id objc_msgSend_synthesizeProfileOutUUIDs_withOldUUIDs_assetProviders_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "synthesizeProfileOutUUIDs:withOldUUIDs:assetProviders:");
}

id objc_msgSend_sysdiagnoseWithMetadata_withError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sysdiagnoseWithMetadata:withError:");
}

id objc_msgSend_systemGroupContainerPath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemGroupContainerPath");
}

id objc_msgSend_systemLostModeRequestPath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemLostModeRequestPath");
}

id objc_msgSend_systemProfileRestrictions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemProfileRestrictions");
}

id objc_msgSend_tapToPayScreenLock(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tapToPayScreenLock");
}

id objc_msgSend_tapToPayScreenLockForBundleIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tapToPayScreenLockForBundleIdentifier:");
}

id objc_msgSend_taskOperationProvider(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "taskOperationProvider");
}

id objc_msgSend_taskOperationServiceListener(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "taskOperationServiceListener");
}

id objc_msgSend_taskServer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "taskServer");
}

id objc_msgSend_taskServerDelegate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "taskServerDelegate");
}

id objc_msgSend_taskWithName_reason_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "taskWithName:reason:");
}

id objc_msgSend_terminateSyncWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "terminateSyncWithCompletionHandler:");
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "text");
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSince1970");
}

id objc_msgSend_timeIntervalSinceDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSinceDate:");
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSinceNow");
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSinceReferenceDate");
}

id objc_msgSend_timeZone(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeZone");
}

id objc_msgSend_timeout(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeout");
}

id objc_msgSend_timeoutTimer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeoutTimer");
}

id objc_msgSend_timeoutTimerDispatchSource(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeoutTimerDispatchSource");
}

id objc_msgSend_timestamp(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timestamp");
}

id objc_msgSend_timestampsKey(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timestampsKey");
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "title");
}

id objc_msgSend_transitionWithTriggeringEvent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "transitionWithTriggeringEvent:");
}

id objc_msgSend_transport(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "transport");
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "type");
}

id objc_msgSend_uninstallAppWithBundleID_options_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "uninstallAppWithBundleID:options:completion:");
}

id objc_msgSend_unionSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unionSet:");
}

id objc_msgSend_uniqueIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "uniqueIdentifier");
}

id objc_msgSend_unique_id(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unique_id");
}

id objc_msgSend_unknownPayloadKeys(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unknownPayloadKeys");
}

id objc_msgSend_unpark(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unpark");
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedIntegerValue");
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedLongLongValue");
}

id objc_msgSend_unusedRedemptionCode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unusedRedemptionCode");
}

id objc_msgSend_updateActiveRestrictionsInContext_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateActiveRestrictionsInContext:error:");
}

id objc_msgSend_updateBundleIDPersonaIDMappingForPersonaID_addingBundleID_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateBundleIDPersonaIDMappingForPersonaID:addingBundleID:completionHandler:");
}

id objc_msgSend_updateCoalescenceInterval(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateCoalescenceInterval");
}

id objc_msgSend_updateEvent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateEvent:");
}

id objc_msgSend_updateEventSubscriptions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateEventSubscriptions");
}

id objc_msgSend_updateJaliscoLibraryWithReason_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateJaliscoLibraryWithReason:completionHandler:");
}

id objc_msgSend_updateMetadataForManagedObjectContext_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateMetadataForManagedObjectContext:error:");
}

id objc_msgSend_updateObserverRegistration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateObserverRegistration");
}

id objc_msgSend_updateOrganizationControllers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateOrganizationControllers");
}

id objc_msgSend_updateState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateState");
}

id objc_msgSend_updateStateDictionaryIfNeeded(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateStateDictionaryIfNeeded");
}

id objc_msgSend_updateStatusChangeListener(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateStatusChangeListener");
}

id objc_msgSend_updateType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateType");
}

id objc_msgSend_updateWithConfigurationSource_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateWithConfigurationSource:");
}

id objc_msgSend_updateWithOrganization_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateWithOrganization:");
}

id objc_msgSend_updateWithSubscriptionRegistration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateWithSubscriptionRegistration:");
}

id objc_msgSend_updatesService(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updatesService");
}

id objc_msgSend_uprootWithAssertion_completionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "uprootWithAssertion:completionBlock:");
}

id objc_msgSend_upsertDeclarations(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "upsertDeclarations");
}

id objc_msgSend_usageBudget(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "usageBudget");
}

id objc_msgSend_usageMonitor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "usageMonitor");
}

id objc_msgSend_useDelay(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "useDelay");
}

id objc_msgSend_userDefaultVoice(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userDefaultVoice");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInfo");
}

id objc_msgSend_userIsSignedIn(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userIsSignedIn");
}

id objc_msgSend_userPersonaBundleIDList(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userPersonaBundleIDList");
}

id objc_msgSend_userPersonaUniqueString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userPersonaUniqueString");
}

id objc_msgSend_userProfileRestrictions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userProfileRestrictions");
}

id objc_msgSend_userType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userType");
}

id objc_msgSend_userValueForSetting_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userValueForSetting:");
}

id objc_msgSend_username(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "username");
}

id objc_msgSend_validateAppBundleIDs_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "validateAppBundleIDs:completion:");
}

id objc_msgSend_validateProperties_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "validateProperties:");
}

id objc_msgSend_validateRequest_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "validateRequest:error:");
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForEntitlement:");
}

id objc_msgSend_valueForFeature_withRestrictionsDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForFeature:withRestrictionsDictionary:");
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForKey:");
}

id objc_msgSend_valueForKey_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForKey:error:");
}

id objc_msgSend_valueForKeyPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForKeyPath:");
}

id objc_msgSend_valuesByPropertyKey(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valuesByPropertyKey");
}

id objc_msgSend_verboseDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "verboseDescription");
}

id objc_msgSend_version(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "version");
}

id objc_msgSend_viewContext(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "viewContext");
}

id objc_msgSend_voiceRoamingEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "voiceRoamingEnabled");
}

id objc_msgSend_vppStateFlagsWithProxy_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "vppStateFlagsWithProxy:");
}

id objc_msgSend_waitUntilAllOperationsAreFinished(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "waitUntilAllOperationsAreFinished");
}

id objc_msgSend_weakObjectsPointerArray(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "weakObjectsPointerArray");
}

id objc_msgSend_webDomainCategories(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "webDomainCategories");
}

id objc_msgSend_webDomains(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "webDomains");
}

id objc_msgSend_whitelistedClassesForRequest(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "whitelistedClassesForRequest");
}

id objc_msgSend_willChangeValueForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "willChangeValueForKey:");
}

id objc_msgSend_willStartInstalling(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "willStartInstalling");
}

id objc_msgSend_willStartInstallingForLifeCycle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "willStartInstallingForLifeCycle:");
}

id objc_msgSend_willStartUninstalling(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "willStartUninstalling");
}

id objc_msgSend_willStartUninstallingForLifeCycle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "willStartUninstallingForLifeCycle:");
}

id objc_msgSend_willStartUpdating(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "willStartUpdating");
}

id objc_msgSend_willStartUpdatingForLifeCycle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "willStartUpdatingForLifeCycle:");
}

id objc_msgSend_withCurrentDataServiceDescriptorDo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "withCurrentDataServiceDescriptorDo:");
}

id objc_msgSend_writeManagementInformationToDiskWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeManagementInformationToDiskWithError:");
}

id objc_msgSend_writeTimestampsToFile(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeTimestampsToFile");
}

id objc_msgSend_writeToFile_atomically_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToFile:atomically:");
}

id objc_msgSend_writeToFile_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToFile:options:error:");
}

id objc_msgSend_writeToURL_atomically_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToURL:atomically:");
}

id objc_msgSend_writeToURL_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToURL:options:error:");
}
