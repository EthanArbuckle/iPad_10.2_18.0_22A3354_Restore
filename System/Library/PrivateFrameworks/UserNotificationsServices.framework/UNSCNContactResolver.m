@implementation UNSCNContactResolver

- (UNSCNContactResolver)init
{
  UNSCNContactResolver *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSArray *contactStoreSearchKeys;
  uint64_t v8;
  CNContactStore *contactStore;
  objc_super v11;
  _QWORD v12[5];

  v12[4] = *MEMORY[0x24BDAC8D0];
  v11.receiver = self;
  v11.super_class = (Class)UNSCNContactResolver;
  v2 = -[UNSCNContactResolver init](&v11, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBACC0], "descriptorForRequiredKeysForStyle:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *MEMORY[0x24BDBA348];
    v12[0] = v3;
    v12[1] = v4;
    v5 = *MEMORY[0x24BDBA3C8];
    v12[2] = *MEMORY[0x24BDBA288];
    v12[3] = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 4);
    v6 = objc_claimAutoreleasedReturnValue();
    contactStoreSearchKeys = v2->_contactStoreSearchKeys;
    v2->_contactStoreSearchKeys = (NSArray *)v6;

    objc_msgSend(MEMORY[0x24BDBACF8], "storeWithOptions:", 3);
    v8 = objc_claimAutoreleasedReturnValue();
    contactStore = v2->_contactStore;
    v2->_contactStore = (CNContactStore *)v8;

  }
  return v2;
}

- (id)resultForContactIdentifier:(id)a3 emailAddress:(id)a4 phoneNumber:(id)a5 userIdentifier:(id)a6 username:(id)a7 bundleIdentifier:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  unsigned int v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  unsigned int v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  unsigned int v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  unsigned int v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  NSObject *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  NSObject *v54;
  void *v56;
  void *v57;
  id v58;
  id v59;
  id v60;
  uint8_t buf[4];
  uint64_t v62;
  __int16 v63;
  void *v64;
  __int16 v65;
  id v66;
  uint64_t v67;

  v67 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v59 = a6;
  v17 = a7;
  v60 = a8;
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  v57 = v14;
  if (objc_msgSend(v14, "length"))
  {
    -[UNSCNContactResolver resultForContactIdentifier:](self, "resultForContactIdentifier:", v14);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("\tcontactIdentifier - %@: %@"), v14, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "appendString:", v20);

  }
  else
  {
    v19 = 0;
  }
  v21 = v15;
  v58 = v17;
  if ((objc_msgSend(v19, "isStrongestMatch") & 1) == 0 && objc_msgSend(v16, "length"))
  {
    v22 = v16;
    -[UNSCNContactResolver bestMatchForPhoneNumber:](self, "bestMatchForPhoneNumber:", v16);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "isStrongerMatchThanOtherMatch:", v19);
    if (v24)
    {
      v25 = v23;

      v19 = v25;
    }
    v26 = (void *)MEMORY[0x24BDD17C8];
    v16 = v22;
    objc_msgSend(v22, "un_logDigest");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "stringWithFormat:", CFSTR("\tphoneNumber - %@: %@ preferResult:%d"), v27, v23, v24);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "appendString:", v28);

    v21 = v15;
    v17 = v58;
  }
  if ((objc_msgSend(v19, "isStrongestMatch") & 1) == 0 && objc_msgSend(v21, "length"))
  {
    v29 = v16;
    -[UNSCNContactResolver bestMatchForEmailAddress:](self, "bestMatchForEmailAddress:", v21);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "isStrongerMatchThanOtherMatch:", v19);
    if (v31)
    {
      v32 = v30;

      v19 = v32;
    }
    v33 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v21, "un_logDigest");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "stringWithFormat:", CFSTR("\temailAddress - %@: %@ preferResult:%d"), v34, v30, v31);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "appendString:", v35);

    v21 = v15;
    v16 = v29;
    v17 = v58;
  }
  if ((objc_msgSend(v19, "isStrongestMatch") & 1) == 0)
  {
    if (objc_msgSend(v59, "length"))
    {
      v36 = v16;
      -[UNSCNContactResolver bestMatchForUserIdentifier:bundleIdentifier:](self, "bestMatchForUserIdentifier:bundleIdentifier:", v59, v60);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v37, "isStrongerMatchThanOtherMatch:", v19);
      if (v38)
      {
        v39 = v37;

        v19 = v39;
      }
      v40 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v59, "un_logDigest");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "stringWithFormat:", CFSTR("\tuserIdentifier - %@: %@ preferResult:%d"), v41, v37, v38);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "appendString:", v42);

      v21 = v15;
      v16 = v36;
    }
    v17 = v58;
  }
  if ((objc_msgSend(v19, "isStrongestMatch") & 1) == 0 && objc_msgSend(v17, "length"))
  {
    v43 = v16;
    -[UNSCNContactResolver bestMatchForUsername:bundleIdentifier:](self, "bestMatchForUsername:bundleIdentifier:", v17, v60);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v44, "isStrongerMatchThanOtherMatch:", v19);
    if (v45)
    {
      v46 = v44;

      v19 = v46;
    }
    v47 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v17, "un_logDigest");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "stringWithFormat:", CFSTR("\tusername - %@: %@ preferResult:%d"), v48, v44, v45);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "appendString:", v49);

    v17 = v58;
    v21 = v15;
    v16 = v43;
  }
  if (objc_msgSend(v19, "isSuggestedContact"))
  {
    UNSLogCommunicationNotifications();
    v50 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_249B71000, v50, OS_LOG_TYPE_DEFAULT, "_UNCNContactResolver rejecting pure suggested contact. Not yet supported.", buf, 2u);
    }

    v19 = 0;
  }
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "timeIntervalSinceDate:", v56);
  v53 = v52;
  UNSLogCommunicationNotifications();
  v54 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134349570;
    v62 = v53;
    v63 = 2112;
    v64 = v19;
    v65 = 2112;
    v66 = v18;
    _os_log_impl(&dword_249B71000, v54, OS_LOG_TYPE_DEFAULT, "_UNCNContactResolver found results in %{public}fms:\n\tFinal match:%@\n%@", buf, 0x20u);
  }

  return v19;
}

- (id)confirm:(BOOL)a3 match:(id)a4
{
  _BOOL4 v4;
  id v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  int v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  CNContactStore *contactStore;
  id v23;
  void *v24;
  CNContactStore *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  int v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  int v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  int v51;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  __CFString *v69;
  __CFString *v70;
  int v71;
  id obj;
  void *v73;
  id v74;
  id v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  uint8_t buf[4];
  const char *v89;
  __int16 v90;
  __CFString *v91;
  __int16 v92;
  void *v93;
  __int16 v94;
  id v95;
  _BYTE v96[128];
  _BYTE v97[128];
  _BYTE v98[128];
  uint64_t v99;

  v4 = a3;
  v99 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = CFSTR("reject");
  if (v4)
    v7 = CFSTR("confirm");
  v8 = v7;
  objc_msgSend(v6, "cnContactIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNSCNContactResolver contactForIdentifier:](self, "contactForIdentifier:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v6, "identifierOfMatchLabel");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v6, "matchType");
    v13 = objc_msgSend(v6, "isSuggestedContact");
    if (v13)
    {
      v73 = v10;
      v14 = v10;
      v15 = v14;
      if (v4)
      {
        v71 = v13;
        v16 = (void *)objc_msgSend(v14, "copyWithCuratingAllSuggestions");
        v17 = (void *)objc_msgSend(v16, "mutableCopy");

        v18 = objc_alloc_init(MEMORY[0x24BDBADB8]);
LABEL_7:
        objc_msgSend(v18, "confirmSuggestion:", v15);
LABEL_25:
        contactStore = self->_contactStore;
        v75 = 0;
        -[CNContactStore executeSaveRequest:error:](contactStore, "executeSaveRequest:error:", v18, &v75);
        v21 = v75;
        v19 = 0;
        if (v21 || !v17)
          goto LABEL_37;
        v23 = objc_alloc_init(MEMORY[0x24BDBADA8]);
        v24 = v23;
        if (v71)
          objc_msgSend(v23, "addContact:toContainerWithIdentifier:", v17, 0);
        else
          objc_msgSend(v23, "updateContact:", v17);
        v69 = v8;
        v25 = self->_contactStore;
        v74 = 0;
        -[CNContactStore executeSaveRequest:error:](v25, "executeSaveRequest:error:", v24, &v74);
        v21 = v74;
        if (v21)
        {
          UNSLogCommunicationNotifications();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            -[NSObject localizedDescription](v21, "localizedDescription");
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136446978;
            v89 = "-[UNSCNContactResolver confirm:match:]";
            v90 = 2114;
            v91 = v69;
            v92 = 2114;
            v93 = v67;
            v94 = 2114;
            v95 = v6;
            _os_log_error_impl(&dword_249B71000, v26, OS_LOG_TYPE_ERROR, "%{public}s: Failed to %{public}@ match. Save request error %{public}@. Match:%{public}@", buf, 0x2Au);

            v8 = v69;
            v19 = 0;
            goto LABEL_36;
          }
          v19 = 0;
        }
        else
        {
          objc_msgSend(v17, "identifier");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          -[UNSCNContactResolver _fullnameForCNContact:](self, "_fullnameForCNContact:", v17);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          +[UNSCNContactResolverResult resultWithCNContactIdentifier:cnContactFullname:suggestedContact:matchType:matchTypeSuggested:identifierOfMatchLabel:](UNSCNContactResolverResult, "resultWithCNContactIdentifier:cnContactFullname:suggestedContact:matchType:matchTypeSuggested:identifierOfMatchLabel:", v27, v28, 0, 0, 0, 0);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          UNSLogCommunicationNotifications();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136446722;
            v89 = "-[UNSCNContactResolver confirm:match:]";
            v90 = 2114;
            v8 = v69;
            v91 = v69;
            v92 = 2114;
            v93 = v19;
            _os_log_impl(&dword_249B71000, v26, OS_LOG_TYPE_DEFAULT, "%{public}s: Succeeded to %{public}@ match. New match or nil:%{public}@", buf, 0x20u);
LABEL_36:

LABEL_37:
            v10 = v73;
LABEL_38:

            goto LABEL_39;
          }
        }
        v8 = v69;
        goto LABEL_36;
      }
      v18 = objc_alloc_init(MEMORY[0x24BDBADB8]);
      v17 = 0;
LABEL_24:
      objc_msgSend(v18, "rejectSuggestion:", v15);
      v71 = 0;
      goto LABEL_25;
    }
    if (objc_msgSend(v6, "isMatchTypeSuggested") && -[NSObject length](v11, "length"))
    {
      v73 = v10;
      switch(v12)
      {
        case 0:
          UNSLogCommunicationNotifications();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            -[UNSCNContactResolver confirm:match:].cold.4();
          goto LABEL_18;
        case 1:
          v71 = 0;
          v82 = 0u;
          v83 = 0u;
          v80 = 0u;
          v81 = 0u;
          objc_msgSend(v10, "emailAddresses");
          obj = (id)objc_claimAutoreleasedReturnValue();
          v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v80, v97, 16);
          if (!v31)
            goto LABEL_67;
          v32 = v31;
          v70 = v8;
          v33 = *(_QWORD *)v81;
LABEL_42:
          v34 = 0;
          while (1)
          {
            if (*(_QWORD *)v81 != v33)
              objc_enumerationMutation(obj);
            v35 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * v34);
            objc_msgSend(v35, "identifier");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = objc_msgSend(v36, "isEqualToString:", v11);

            if (v37)
              break;
            if (v32 == ++v34)
            {
              v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v80, v97, 16);
              if (v32)
                goto LABEL_42;
              goto LABEL_66;
            }
          }
          v15 = v35;
          if (!v4)
            goto LABEL_75;
          v10 = v73;
          v17 = (void *)objc_msgSend(v73, "mutableCopy");
          objc_msgSend(v73, "emailAddresses");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          v53 = (void *)objc_msgSend(v52, "mutableCopy");

          v54 = objc_alloc(MEMORY[0x24BDBAD38]);
          objc_msgSend(v15, "value");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v56 = (void *)objc_msgSend(v54, "initWithLabel:value:", 0, v55);

          v57 = v53;
          objc_msgSend(v53, "addObject:", v56);
          objc_msgSend(v17, "setEmailAddresses:", v53);
          goto LABEL_74;
        case 2:
          v71 = 0;
          v78 = 0u;
          v79 = 0u;
          v76 = 0u;
          v77 = 0u;
          objc_msgSend(v10, "phoneNumbers");
          obj = (id)objc_claimAutoreleasedReturnValue();
          v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, v96, 16);
          if (!v38)
            goto LABEL_67;
          v39 = v38;
          v70 = v8;
          v40 = *(_QWORD *)v77;
          break;
        case 3:
          v71 = 0;
          v86 = 0u;
          v87 = 0u;
          v84 = 0u;
          v85 = 0u;
          objc_msgSend(v10, "socialProfiles");
          obj = (id)objc_claimAutoreleasedReturnValue();
          v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v84, v98, 16);
          if (!v45)
          {
LABEL_67:
            v15 = 0;
            v17 = 0;
            goto LABEL_76;
          }
          v46 = v45;
          v70 = v8;
          v47 = *(_QWORD *)v85;
LABEL_60:
          v48 = 0;
          while (1)
          {
            if (*(_QWORD *)v85 != v47)
              objc_enumerationMutation(obj);
            v49 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * v48);
            objc_msgSend(v49, "identifier");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            v51 = objc_msgSend(v50, "isEqualToString:", v11);

            if (v51)
              break;
            if (v46 == ++v48)
            {
              v46 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v84, v98, 16);
              if (!v46)
                goto LABEL_66;
              goto LABEL_60;
            }
          }
          v15 = v49;
          if (!v4)
            goto LABEL_75;
          v10 = v73;
          v17 = (void *)objc_msgSend(v73, "mutableCopy");
          objc_msgSend(v73, "socialProfiles");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          v68 = (void *)objc_msgSend(v62, "mutableCopy");

          objc_msgSend(v15, "value");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "service");
          v56 = (void *)objc_claimAutoreleasedReturnValue();

          v64 = objc_alloc(MEMORY[0x24BDBAD38]);
          objc_msgSend(v15, "value");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          v66 = (void *)objc_msgSend(v64, "initWithLabel:value:", v56, v65);

          v57 = v68;
          objc_msgSend(v68, "addObject:", v66);
          objc_msgSend(v17, "setSocialProfiles:", v68);

          goto LABEL_74;
        default:
          goto LABEL_19;
      }
LABEL_51:
      v41 = 0;
      while (1)
      {
        if (*(_QWORD *)v77 != v40)
          objc_enumerationMutation(obj);
        v42 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * v41);
        objc_msgSend(v42, "identifier");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = objc_msgSend(v43, "isEqualToString:", v11);

        if (v44)
          break;
        if (v39 == ++v41)
        {
          v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, v96, 16);
          if (v39)
            goto LABEL_51;
LABEL_66:
          v15 = 0;
          goto LABEL_75;
        }
      }
      v15 = v42;
      if (!v4)
      {
LABEL_75:
        v17 = 0;
        v8 = v70;
        v10 = v73;
        goto LABEL_76;
      }
      v10 = v73;
      v17 = (void *)objc_msgSend(v73, "mutableCopy");
      objc_msgSend(v73, "phoneNumbers");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = (void *)objc_msgSend(v58, "mutableCopy");

      v60 = objc_alloc(MEMORY[0x24BDBAD38]);
      objc_msgSend(v15, "value");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = (void *)objc_msgSend(v60, "initWithLabel:value:", 0, v61);

      v57 = v59;
      objc_msgSend(v59, "addObject:", v56);
      objc_msgSend(v17, "setPhoneNumbers:", v59);
LABEL_74:
      v8 = v70;

LABEL_76:
      if (v15)
      {
        v18 = objc_alloc_init(MEMORY[0x24BDBADB8]);
        if (v4)
          goto LABEL_7;
        goto LABEL_24;
      }
    }
    else
    {
      UNSLogCommunicationNotifications();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        -[UNSCNContactResolver confirm:match:].cold.3();
LABEL_18:

LABEL_19:
      v17 = 0;
    }
    UNSLogCommunicationNotifications();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[UNSCNContactResolver confirm:match:].cold.2();
    v15 = 0;
    v19 = 0;
    goto LABEL_38;
  }
  UNSLogCommunicationNotifications();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    -[UNSCNContactResolver confirm:match:].cold.1();
  v15 = 0;
  v17 = 0;
  v19 = 0;
LABEL_39:

  v29 = v19;
  return v29;
}

- (id)resultForContactIdentifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[UNSCNContactResolver contactForIdentifier:](self, "contactForIdentifier:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSCNContactResolver _fullnameForCNContact:](self, "_fullnameForCNContact:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[UNSCNContactResolverResult resultWithCNContactIdentifier:cnContactFullname:suggestedContact:matchType:matchTypeSuggested:identifierOfMatchLabel:](UNSCNContactResolverResult, "resultWithCNContactIdentifier:cnContactFullname:suggestedContact:matchType:matchTypeSuggested:identifierOfMatchLabel:", v6, v7, -[UNSCNContactResolver _isSuggestedForContact:](self, "_isSuggestedForContact:", v5), 0, 0, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)bestMatchForPhoneNumber:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[5];
  id v12;

  v4 = (objc_class *)MEMORY[0x24BDBAD88];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithStringValue:", v5);

  objc_msgSend(MEMORY[0x24BDBACA0], "predicateForContactsMatchingPhoneNumber:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __48__UNSCNContactResolver_bestMatchForPhoneNumber___block_invoke;
  v11[3] = &unk_251B14398;
  v11[4] = self;
  v12 = v6;
  v8 = v6;
  -[UNSCNContactResolver bestMatchForPredicate:contactToMatch:](self, "bestMatchForPredicate:contactToMatch:", v7, v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t __48__UNSCNContactResolver_bestMatchForPhoneNumber___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "matchThatMatchesPhoneNumber:forContact:", *(_QWORD *)(a1 + 40), a2);
}

- (id)matchThatMatchesPhoneNumber:(id)a3 forContact:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  id v18;
  void *v19;
  void *v20;
  UNSCNContactResolver *v22;
  id v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  objc_msgSend(v7, "phoneNumbers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v9)
  {
    v10 = v9;
    v22 = self;
    v23 = v7;
    v24 = 0;
    v11 = *(_QWORD *)v26;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v26 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v13, "value");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "lastFourDigits");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "lastFourDigits");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v15, "isEqualToString:", v16))
        {
          v17 = objc_msgSend(v14, "isLikePhoneNumber:", v6);

          if (v17)
          {
            v18 = v13;

            if (!-[UNSCNContactResolver _isSuggestedForContact:](v22, "_isSuggestedForContact:", v23)
              && !-[UNSCNContactResolver _isSuggestedForLabeledValue:](v22, "_isSuggestedForLabeledValue:", v18))
            {

              v24 = v18;
              goto LABEL_16;
            }
            v24 = v18;
          }
        }
        else
        {

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (v10)
        continue;
      break;
    }
LABEL_16:

    v19 = v24;
    if (v24)
    {
      v7 = v23;
      -[UNSCNContactResolver _matchForContact:matchingLabel:matchType:](v22, "_matchForContact:matchingLabel:matchType:", v23, v24, 2);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v20 = 0;
      v7 = v23;
    }
  }
  else
  {

    v19 = 0;
    v20 = 0;
  }

  return v20;
}

- (id)bestMatchForEmailAddress:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBACA0], "predicateForContactsMatchingEmailAddress:groupIdentifiers:limitToOneResult:", v4, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __49__UNSCNContactResolver_bestMatchForEmailAddress___block_invoke;
  v9[3] = &unk_251B14398;
  v9[4] = self;
  v10 = v4;
  v6 = v4;
  -[UNSCNContactResolver bestMatchForPredicate:contactToMatch:](self, "bestMatchForPredicate:contactToMatch:", v5, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __49__UNSCNContactResolver_bestMatchForEmailAddress___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_matchThatMatchesEmailAddress:forContact:", *(_QWORD *)(a1 + 40), a2);
}

- (id)_matchThatMatchesEmailAddress:(id)a3 forContact:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(v7, "emailAddresses", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (!v9)
  {

    v11 = 0;
LABEL_17:
    v17 = 0;
    goto LABEL_18;
  }
  v10 = v9;
  v11 = 0;
  v12 = *(_QWORD *)v20;
  while (2)
  {
    for (i = 0; i != v10; ++i)
    {
      if (*(_QWORD *)v20 != v12)
        objc_enumerationMutation(v8);
      v14 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
      objc_msgSend(v14, "value");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v15, "caseInsensitiveCompare:", v6))
      {
        v16 = v14;

        if (!-[UNSCNContactResolver _isSuggestedForContact:](self, "_isSuggestedForContact:", v7)
          && !-[UNSCNContactResolver _isSuggestedForLabeledValue:](self, "_isSuggestedForLabeledValue:", v16))
        {

          v11 = v16;
          goto LABEL_14;
        }
        v11 = v16;
      }

    }
    v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v10)
      continue;
    break;
  }
LABEL_14:

  if (!v11)
    goto LABEL_17;
  -[UNSCNContactResolver _matchForContact:matchingLabel:matchType:](self, "_matchForContact:matchingLabel:matchType:", v7, v11, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_18:

  return v17;
}

- (id)bestMatchForUsername:(id)a3 bundleIdentifier:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v6 = (objc_class *)MEMORY[0x24BDBAD80];
  v7 = a4;
  v8 = a3;
  v9 = objc_alloc_init(v6);
  objc_msgSend(v9, "setUsername:", v8);

  v13[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBundleIdentifiers:", v10);

  -[UNSCNContactResolver bestMatchForSocialProfile:bundleIdentifier:](self, "bestMatchForSocialProfile:bundleIdentifier:", v9, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)bestMatchForUserIdentifier:(id)a3 bundleIdentifier:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v6 = (objc_class *)MEMORY[0x24BDBAD80];
  v7 = a4;
  v8 = a3;
  v9 = objc_alloc_init(v6);
  objc_msgSend(v9, "setUserIdentifier:", v8);

  v13[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBundleIdentifiers:", v10);

  -[UNSCNContactResolver bestMatchForSocialProfile:bundleIdentifier:](self, "bestMatchForSocialProfile:bundleIdentifier:", v9, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)bestMatchForSocialProfile:(id)a3 bundleIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[5];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDBACA0], "predicateForContactsMatchingSocialProfile:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __67__UNSCNContactResolver_bestMatchForSocialProfile_bundleIdentifier___block_invoke;
  v13[3] = &unk_251B143C0;
  v13[4] = self;
  v14 = v6;
  v15 = v7;
  v9 = v7;
  v10 = v6;
  -[UNSCNContactResolver bestMatchForPredicate:contactToMatch:](self, "bestMatchForPredicate:contactToMatch:", v8, v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

uint64_t __67__UNSCNContactResolver_bestMatchForSocialProfile_bundleIdentifier___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_matchThatMatchesSocialProfile:bundleIdentifier:forContact:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), a2);
}

- (id)_matchThatMatchesSocialProfile:(id)a3 bundleIdentifier:(id)a4 forContact:(id)a5
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t i;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  id obj;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  void *v33;
  id v34;
  id v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v32 = a3;
  v37 = a4;
  v7 = a5;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  objc_msgSend(v7, "socialProfiles");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
  if (v30)
  {
    v9 = 0;
    obj = v8;
    v29 = *(_QWORD *)v45;
    v10 = v32;
    v34 = v7;
    while (2)
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v45 != v29)
          objc_enumerationMutation(obj);
        v31 = v11;
        v33 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * v11);
        objc_msgSend(v33, "value", obj);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = 0u;
        v41 = 0u;
        v42 = 0u;
        v43 = 0u;
        objc_msgSend(v12, "bundleIdentifiers");
        v36 = (id)objc_claimAutoreleasedReturnValue();
        v39 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
        if (v39)
        {
          v38 = *(_QWORD *)v41;
          v13 = v9;
          do
          {
            for (i = 0; i != v39; ++i)
            {
              if (*(_QWORD *)v41 != v38)
                objc_enumerationMutation(v36);
              v15 = objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * i), "isEqual:", v37);
              objc_msgSend(v12, "username");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v16, "length"))
              {
                objc_msgSend(v10, "username");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v17, "length"))
                {
                  objc_msgSend(v12, "username");
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v10, "username");
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                  v20 = objc_msgSend(v18, "isEqualToString:", v19);

                }
                else
                {
                  v20 = 0;
                }

              }
              else
              {
                v20 = 0;
              }

              objc_msgSend(v12, "userIdentifier");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v21, "length"))
              {
                objc_msgSend(v10, "userIdentifier");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v22, "length"))
                {
                  objc_msgSend(v12, "userIdentifier");
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v10, "userIdentifier");
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  v25 = objc_msgSend(v23, "isEqualToString:", v24);

                  v10 = v32;
                }
                else
                {
                  v25 = 0;
                }

              }
              else
              {
                v25 = 0;
              }

              if ((v15 & (v20 | v25)) == 1)
              {
                v9 = v33;

                if (-[UNSCNContactResolver _isSuggestedForContact:](self, "_isSuggestedForContact:", v34))
                {
                  v13 = v9;
                }
                else
                {
                  v13 = v9;
                  if (!-[UNSCNContactResolver _isSuggestedForLabeledValue:](self, "_isSuggestedForLabeledValue:", v9))
                    goto LABEL_29;
                }
              }
            }
            v9 = v13;
            v39 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
          }
          while (v39);
        }
LABEL_29:

        v7 = v34;
        if (!-[UNSCNContactResolver _isSuggestedForContact:](self, "_isSuggestedForContact:", v34)
          && v9
          && !-[UNSCNContactResolver _isSuggestedForLabeledValue:](self, "_isSuggestedForLabeledValue:", v9))
        {

          goto LABEL_37;
        }

        v11 = v31 + 1;
      }
      while (v31 + 1 != v30);
      v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
      if (v30)
        continue;
      break;
    }

    if (!v9)
    {
      v26 = 0;
      goto LABEL_39;
    }
LABEL_37:
    -[UNSCNContactResolver _matchForContact:matchingLabel:matchType:](self, "_matchForContact:matchingLabel:matchType:", v34, v9, 3);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {

    v9 = 0;
    v26 = 0;
    v10 = v32;
  }
LABEL_39:

  return v26;
}

- (id)bestMatchForPredicate:(id)a3 contactToMatch:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  CNContactStore *contactStore;
  NSArray *contactStoreSearchKeys;
  void *v10;
  id v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  char v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  id v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  contactStore = self->_contactStore;
  contactStoreSearchKeys = self->_contactStoreSearchKeys;
  v28 = 0;
  -[CNContactStore unifiedContactsMatchingPredicate:keysToFetch:error:](contactStore, "unifiedContactsMatchingPredicate:keysToFetch:error:", v6, contactStoreSearchKeys, &v28);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v28;
  if (v11)
  {
    UNSLogCommunicationNotifications();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[UNSCNContactResolver bestMatchForPredicate:contactToMatch:].cold.1(v11, v12);

  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v13 = v10;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v14)
  {
    v15 = v14;
    v16 = 0;
    v17 = *(_QWORD *)v25;
LABEL_7:
    v18 = 0;
    while (1)
    {
      if (*(_QWORD *)v25 != v17)
        objc_enumerationMutation(v13);
      v7[2](v7, *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v18));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v19;
      if (v19 && objc_msgSend(v19, "isStrongerMatchThanOtherMatch:", v16, (_QWORD)v24))
      {
        v21 = v20;

        v16 = v21;
      }
      v22 = objc_msgSend(v16, "isStrongestMatch", (_QWORD)v24);

      if ((v22 & 1) != 0)
        break;
      if (v15 == ++v18)
      {
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
        if (v15)
          goto LABEL_7;
        break;
      }
    }
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)contactForIdentifier:(id)a3
{
  id v4;
  CNContactStore *contactStore;
  NSArray *contactStoreSearchKeys;
  void *v7;
  id v8;
  NSObject *v9;
  id v11;

  v4 = a3;
  contactStore = self->_contactStore;
  contactStoreSearchKeys = self->_contactStoreSearchKeys;
  v11 = 0;
  -[CNContactStore unifiedContactWithIdentifier:keysToFetch:error:](contactStore, "unifiedContactWithIdentifier:keysToFetch:error:", v4, contactStoreSearchKeys, &v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v11;
  if (v8)
  {
    UNSLogCommunicationNotifications();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[UNSCNContactResolver contactForIdentifier:].cold.1();

  }
  return v7;
}

- (id)_fullnameForCNContact:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDBACC0], "stringFromContact:style:", a3, 0);
}

- (id)_matchForContact:(id)a3 matchingLabel:(id)a4 matchType:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  _BOOL8 v12;
  _BOOL8 v13;
  void *v14;
  void *v15;

  v8 = a4;
  v9 = a3;
  objc_msgSend(v9, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNSCNContactResolver _fullnameForCNContact:](self, "_fullnameForCNContact:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[UNSCNContactResolver _isSuggestedForContact:](self, "_isSuggestedForContact:", v9);

  v13 = -[UNSCNContactResolver _isSuggestedForLabeledValue:](self, "_isSuggestedForLabeledValue:", v8);
  objc_msgSend(v8, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  +[UNSCNContactResolverResult resultWithCNContactIdentifier:cnContactFullname:suggestedContact:matchType:matchTypeSuggested:identifierOfMatchLabel:](UNSCNContactResolverResult, "resultWithCNContactIdentifier:cnContactFullname:suggestedContact:matchType:matchTypeSuggested:identifierOfMatchLabel:", v10, v11, v12, a5, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (BOOL)_isSuggestedForContact:(id)a3
{
  return objc_msgSend(a3, "isSuggested");
}

- (BOOL)_isSuggestedForLabeledValue:(id)a3
{
  return objc_msgSend(a3, "isSuggested");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactStoreSearchKeys, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
}

- (void)confirm:match:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136446722;
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_249B71000, v0, v1, "%{public}s: Unable to find suggested contact to %{public}@ match. Match:%{public}@", v2);
  OUTLINED_FUNCTION_2_0();
}

- (void)confirm:match:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136446722;
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_249B71000, v0, v1, "%{public}s: Could not create save request for %{public}@ match. Match:%{public}@", v2);
  OUTLINED_FUNCTION_2_0();
}

- (void)confirm:match:.cold.3()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136446722;
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_249B71000, v0, v1, "%{public}s: Nothing to %{public}@ on match. Match:%{public}@", v2);
  OUTLINED_FUNCTION_2_0();
}

- (void)confirm:match:.cold.4()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136446722;
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_249B71000, v0, v1, "%{public}s: Cannot %{public}@ contact match on contact identifier. Contact identifiers can't be suggested. Match:%{public}@", v2);
  OUTLINED_FUNCTION_2_0();
}

- (void)bestMatchForPredicate:(void *)a1 contactToMatch:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  const char *v5;
  __int16 v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 136446466;
  v5 = "-[UNSCNContactResolver bestMatchForPredicate:contactToMatch:]";
  v6 = 2114;
  v7 = v3;
  _os_log_error_impl(&dword_249B71000, a2, OS_LOG_TYPE_ERROR, "%{public}s: Error querying for contacts based on predicate. Error:%{public}@", (uint8_t *)&v4, 0x16u);

  OUTLINED_FUNCTION_2_0();
}

- (void)contactForIdentifier:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136446722;
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_249B71000, v0, v1, "%{public}s: Error querying for contact based on identifier:%{public}@ error:%{public}@", v2);
  OUTLINED_FUNCTION_2_0();
}

@end
