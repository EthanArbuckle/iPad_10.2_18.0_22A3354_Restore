@implementation _UNCNContactResolver

- (_UNCNContactResolver)init
{
  _UNCNContactResolver *v2;
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
  v11.super_class = (Class)_UNCNContactResolver;
  v2 = -[_UNCNContactResolver init](&v11, sel_init);
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  unsigned int v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  unsigned int v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  unsigned int v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  unsigned int v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  NSObject *v49;
  void *v51;
  id v52;
  id v53;
  id v54;
  uint8_t buf[4];
  uint64_t v56;
  __int16 v57;
  void *v58;
  __int16 v59;
  id v60;
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a4;
  v53 = a5;
  v52 = a6;
  v16 = a7;
  v54 = a8;
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  if (objc_msgSend(v14, "length"))
  {
    -[_UNCNContactResolver resultForContactIdentifier:](self, "resultForContactIdentifier:", v14);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("\tcontactIdentifier - %@: %@"), v14, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "appendString:", v19);

  }
  else
  {
    v18 = 0;
  }
  v20 = v15;
  if ((objc_msgSend(v18, "isStrongestMatch") & 1) == 0 && objc_msgSend(v53, "length"))
  {
    -[_UNCNContactResolver bestMatchForPhoneNumber:](self, "bestMatchForPhoneNumber:", v53);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "isStrongerMatchThanOtherMatch:", v18);
    if (v22)
    {
      v23 = v21;

      v18 = v23;
    }
    v24 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v53, "un_logDigest");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "stringWithFormat:", CFSTR("\tphoneNumber - %@: %@ preferResult:%d"), v25, v21, v22);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "appendString:", v26);

    v20 = v15;
  }
  if ((objc_msgSend(v18, "isStrongestMatch") & 1) == 0 && objc_msgSend(v20, "length"))
  {
    -[_UNCNContactResolver bestMatchForEmailAddress:](self, "bestMatchForEmailAddress:", v20);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "isStrongerMatchThanOtherMatch:", v18);
    if (v28)
    {
      v29 = v27;

      v18 = v29;
    }
    v30 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v20, "un_logDigest");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "stringWithFormat:", CFSTR("\temailAddress - %@: %@ preferResult:%d"), v31, v27, v28);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "appendString:", v32);

    v20 = v15;
  }
  if ((objc_msgSend(v18, "isStrongestMatch") & 1) == 0 && objc_msgSend(v52, "length"))
  {
    -[_UNCNContactResolver bestMatchForUserIdentifier:bundleIdentifier:](self, "bestMatchForUserIdentifier:bundleIdentifier:", v52, v54);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "isStrongerMatchThanOtherMatch:", v18);
    if (v34)
    {
      v35 = v33;

      v18 = v35;
    }
    v36 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v52, "un_logDigest");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "stringWithFormat:", CFSTR("\tuserIdentifier - %@: %@ preferResult:%d"), v37, v33, v34);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "appendString:", v38);

    v20 = v15;
  }
  if ((objc_msgSend(v18, "isStrongestMatch") & 1) == 0 && objc_msgSend(v16, "length"))
  {
    -[_UNCNContactResolver bestMatchForUsername:bundleIdentifier:](self, "bestMatchForUsername:bundleIdentifier:", v16, v54);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v39, "isStrongerMatchThanOtherMatch:", v18);
    if (v40)
    {
      v41 = v39;

      v18 = v41;
    }
    v42 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v16, "un_logDigest");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "stringWithFormat:", CFSTR("\tusername - %@: %@ preferResult:%d"), v43, v39, v40);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "appendString:", v44);

    v20 = v15;
  }
  if (objc_msgSend(v18, "isSuggestedContact"))
  {
    v45 = NCUILogCommunicationNotifications;
    if (os_log_type_enabled((os_log_t)NCUILogCommunicationNotifications, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2149F4000, v45, OS_LOG_TYPE_DEFAULT, "_UNCNContactResolver rejecting pure suggested contact. Not yet supported.", buf, 2u);
    }

    v18 = 0;
  }
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "timeIntervalSinceDate:", v51);
  v48 = v47;
  v49 = NCUILogCommunicationNotifications;
  if (os_log_type_enabled((os_log_t)NCUILogCommunicationNotifications, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134349570;
    v56 = v48;
    v57 = 2112;
    v58 = v18;
    v59 = 2112;
    v60 = v17;
    _os_log_impl(&dword_2149F4000, v49, OS_LOG_TYPE_DEFAULT, "_UNCNContactResolver found results in %{public}fms:\n\tFinal match:%@\n%@", buf, 0x20u);
  }

  return v18;
}

- (id)confirm:(BOOL)a3 match:(id)a4
{
  _BOOL4 v4;
  id v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  int v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  CNContactStore *contactStore;
  id v20;
  id v21;
  void *v22;
  CNContactStore *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  id v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  int v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  int v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  int v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  void *v65;
  void *v66;
  NSObject *v67;
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
  -[_UNCNContactResolver contactForIdentifier:](self, "contactForIdentifier:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v6, "identifierOfMatchLabel");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v6, "matchType");
    v12 = objc_msgSend(v6, "isSuggestedContact");
    if (v12)
    {
      v13 = v10;
      v14 = v13;
      if (v4)
      {
        v71 = v12;
        v15 = (void *)objc_msgSend(v13, "copyWithCuratingAllSuggestions");
        v16 = (void *)objc_msgSend(v15, "mutableCopy");

        v17 = objc_alloc_init(MEMORY[0x24BDBADB8]);
LABEL_7:
        objc_msgSend(v17, "confirmSuggestion:", v14);
LABEL_24:
        contactStore = self->_contactStore;
        v75 = 0;
        -[CNContactStore executeSaveRequest:error:](contactStore, "executeSaveRequest:error:", v17, &v75);
        v20 = v75;
        v18 = 0;
        if (v20 || !v16)
          goto LABEL_36;
        v21 = objc_alloc_init(MEMORY[0x24BDBADA8]);
        v22 = v21;
        if (v71)
          objc_msgSend(v21, "addContact:toContainerWithIdentifier:", v16, 0);
        else
          objc_msgSend(v21, "updateContact:", v16);
        v23 = self->_contactStore;
        v74 = 0;
        -[CNContactStore executeSaveRequest:error:](v23, "executeSaveRequest:error:", v22, &v74, v8);
        v20 = v74;
        if (v20)
        {
          v24 = (void *)NCUILogCommunicationNotifications;
          if (os_log_type_enabled((os_log_t)NCUILogCommunicationNotifications, OS_LOG_TYPE_ERROR))
          {
            v67 = v24;
            objc_msgSend(v20, "localizedDescription");
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136446978;
            v89 = "-[_UNCNContactResolver confirm:match:]";
            v90 = 2114;
            v91 = v69;
            v92 = 2114;
            v93 = v68;
            v94 = 2114;
            v95 = v6;
            _os_log_error_impl(&dword_2149F4000, v67, OS_LOG_TYPE_ERROR, "%{public}s: Failed to %{public}@ match. Save request error %{public}@. Match:%{public}@", buf, 0x2Au);

            v8 = v69;
            v18 = 0;
            goto LABEL_35;
          }
          v18 = 0;
        }
        else
        {
          objc_msgSend(v16, "identifier");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[_UNCNContactResolver _fullnameForCNContact:](self, "_fullnameForCNContact:", v16);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          +[_UNCNContactResolverResult resultWithCNContactIdentifier:cnContactFullname:suggestedContact:matchType:matchTypeSuggested:identifierOfMatchLabel:](_UNCNContactResolverResult, "resultWithCNContactIdentifier:cnContactFullname:suggestedContact:matchType:matchTypeSuggested:identifierOfMatchLabel:", v25, v26, 0, 0, 0, 0);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          v27 = NCUILogCommunicationNotifications;
          if (os_log_type_enabled((os_log_t)NCUILogCommunicationNotifications, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136446722;
            v89 = "-[_UNCNContactResolver confirm:match:]";
            v90 = 2114;
            v8 = v69;
            v91 = v69;
            v92 = 2114;
            v93 = v18;
            _os_log_impl(&dword_2149F4000, v27, OS_LOG_TYPE_DEFAULT, "%{public}s: Succeeded to %{public}@ match. New match or nil:%{public}@", buf, 0x20u);
LABEL_35:

LABEL_36:
LABEL_37:

            goto LABEL_38;
          }
        }
        v8 = v69;
        goto LABEL_35;
      }
      v17 = objc_alloc_init(MEMORY[0x24BDBADB8]);
      v16 = 0;
LABEL_23:
      objc_msgSend(v17, "rejectSuggestion:", v14);
      v71 = 0;
      goto LABEL_24;
    }
    if (objc_msgSend(v6, "isMatchTypeSuggested") && objc_msgSend(v73, "length"))
    {
      switch(v11)
      {
        case 0:
          if (os_log_type_enabled((os_log_t)NCUILogCommunicationNotifications, OS_LOG_TYPE_ERROR))
            -[_UNCNContactResolver confirm:match:].cold.4();
          goto LABEL_18;
        case 1:
          v71 = 0;
          v82 = 0u;
          v83 = 0u;
          v80 = 0u;
          v81 = 0u;
          objc_msgSend(v10, "emailAddresses");
          obj = (id)objc_claimAutoreleasedReturnValue();
          v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v80, v97, 16);
          if (!v30)
            goto LABEL_66;
          v31 = v30;
          v70 = v8;
          v32 = *(_QWORD *)v81;
LABEL_41:
          v33 = 0;
          while (1)
          {
            if (*(_QWORD *)v81 != v32)
              objc_enumerationMutation(obj);
            v34 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * v33);
            objc_msgSend(v34, "identifier", v70);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = objc_msgSend(v35, "isEqualToString:", v73);

            if (v36)
              break;
            if (v31 == ++v33)
            {
              v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v80, v97, 16);
              if (v31)
                goto LABEL_41;
              goto LABEL_65;
            }
          }
          v14 = v34;
          if (!v4)
            goto LABEL_74;
          v16 = (void *)objc_msgSend(v10, "mutableCopy");
          objc_msgSend(v10, "emailAddresses");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v52 = (void *)objc_msgSend(v51, "mutableCopy");

          v53 = objc_alloc(MEMORY[0x24BDBAD38]);
          objc_msgSend(v14, "value");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          v55 = (void *)objc_msgSend(v53, "initWithLabel:value:", 0, v54);

          v56 = v52;
          objc_msgSend(v52, "addObject:", v55);
          objc_msgSend(v16, "setEmailAddresses:", v52);
          goto LABEL_73;
        case 2:
          v71 = 0;
          v78 = 0u;
          v79 = 0u;
          v76 = 0u;
          v77 = 0u;
          objc_msgSend(v10, "phoneNumbers");
          obj = (id)objc_claimAutoreleasedReturnValue();
          v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, v96, 16);
          if (!v37)
            goto LABEL_66;
          v38 = v37;
          v70 = v8;
          v39 = *(_QWORD *)v77;
          break;
        case 3:
          v71 = 0;
          v86 = 0u;
          v87 = 0u;
          v84 = 0u;
          v85 = 0u;
          objc_msgSend(v10, "socialProfiles");
          obj = (id)objc_claimAutoreleasedReturnValue();
          v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v84, v98, 16);
          if (!v44)
          {
LABEL_66:
            v14 = 0;
            v16 = 0;
            goto LABEL_75;
          }
          v45 = v44;
          v70 = v8;
          v46 = *(_QWORD *)v85;
LABEL_59:
          v47 = 0;
          while (1)
          {
            if (*(_QWORD *)v85 != v46)
              objc_enumerationMutation(obj);
            v48 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * v47);
            objc_msgSend(v48, "identifier", v70);
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            v50 = objc_msgSend(v49, "isEqualToString:", v73);

            if (v50)
              break;
            if (v45 == ++v47)
            {
              v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v84, v98, 16);
              if (!v45)
                goto LABEL_65;
              goto LABEL_59;
            }
          }
          v14 = v48;
          if (!v4)
            goto LABEL_74;
          v16 = (void *)objc_msgSend(v10, "mutableCopy");
          objc_msgSend(v10, "socialProfiles");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          v62 = (void *)objc_msgSend(v61, "mutableCopy");

          objc_msgSend(v14, "value");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "service");
          v55 = (void *)objc_claimAutoreleasedReturnValue();

          v64 = objc_alloc(MEMORY[0x24BDBAD38]);
          objc_msgSend(v14, "value");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          v66 = (void *)objc_msgSend(v64, "initWithLabel:value:", v55, v65);

          v56 = v62;
          objc_msgSend(v62, "addObject:", v66);
          objc_msgSend(v16, "setSocialProfiles:", v62);

          goto LABEL_73;
        default:
          goto LABEL_18;
      }
LABEL_50:
      v40 = 0;
      while (1)
      {
        if (*(_QWORD *)v77 != v39)
          objc_enumerationMutation(obj);
        v41 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * v40);
        objc_msgSend(v41, "identifier", v70);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = objc_msgSend(v42, "isEqualToString:", v73);

        if (v43)
          break;
        if (v38 == ++v40)
        {
          v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, v96, 16);
          if (v38)
            goto LABEL_50;
LABEL_65:
          v14 = 0;
          goto LABEL_74;
        }
      }
      v14 = v41;
      if (!v4)
      {
LABEL_74:
        v16 = 0;
        v8 = v70;
        goto LABEL_75;
      }
      v16 = (void *)objc_msgSend(v10, "mutableCopy");
      objc_msgSend(v10, "phoneNumbers");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = (void *)objc_msgSend(v57, "mutableCopy");

      v59 = objc_alloc(MEMORY[0x24BDBAD38]);
      objc_msgSend(v14, "value");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = (void *)objc_msgSend(v59, "initWithLabel:value:", 0, v60);

      v56 = v58;
      objc_msgSend(v58, "addObject:", v55);
      objc_msgSend(v16, "setPhoneNumbers:", v58);
LABEL_73:
      v8 = v70;

LABEL_75:
      if (v14)
      {
        v17 = objc_alloc_init(MEMORY[0x24BDBADB8]);
        if (v4)
          goto LABEL_7;
        goto LABEL_23;
      }
    }
    else
    {
      if (os_log_type_enabled((os_log_t)NCUILogCommunicationNotifications, OS_LOG_TYPE_ERROR))
        -[_UNCNContactResolver confirm:match:].cold.3();
LABEL_18:
      v16 = 0;
    }
    if (os_log_type_enabled((os_log_t)NCUILogCommunicationNotifications, OS_LOG_TYPE_ERROR))
      -[_UNCNContactResolver confirm:match:].cold.2();
    v14 = 0;
    v18 = 0;
    goto LABEL_37;
  }
  if (os_log_type_enabled((os_log_t)NCUILogCommunicationNotifications, OS_LOG_TYPE_ERROR))
    -[_UNCNContactResolver confirm:match:].cold.1();
  v14 = 0;
  v16 = 0;
  v18 = 0;
LABEL_38:
  v28 = v18;

  return v28;
}

- (id)resultForContactIdentifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[_UNCNContactResolver contactForIdentifier:](self, "contactForIdentifier:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UNCNContactResolver _fullnameForCNContact:](self, "_fullnameForCNContact:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UNCNContactResolverResult resultWithCNContactIdentifier:cnContactFullname:suggestedContact:matchType:matchTypeSuggested:identifierOfMatchLabel:](_UNCNContactResolverResult, "resultWithCNContactIdentifier:cnContactFullname:suggestedContact:matchType:matchTypeSuggested:identifierOfMatchLabel:", v6, v7, -[_UNCNContactResolver _isSuggestedForContact:](self, "_isSuggestedForContact:", v5), 0, 0, 0);
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
  v11[2] = __48___UNCNContactResolver_bestMatchForPhoneNumber___block_invoke;
  v11[3] = &unk_24D2702C0;
  v11[4] = self;
  v12 = v6;
  v8 = v6;
  -[_UNCNContactResolver bestMatchForPredicate:contactToMatch:](self, "bestMatchForPredicate:contactToMatch:", v7, v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
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
  _UNCNContactResolver *v22;
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

            if (!-[_UNCNContactResolver _isSuggestedForContact:](v22, "_isSuggestedForContact:", v23)
              && !-[_UNCNContactResolver _isSuggestedForLabeledValue:](v22, "_isSuggestedForLabeledValue:", v18))
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
      -[_UNCNContactResolver _matchForContact:matchingLabel:matchType:](v22, "_matchForContact:matchingLabel:matchType:", v23, v24, 2);
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
  v9[2] = __49___UNCNContactResolver_bestMatchForEmailAddress___block_invoke;
  v9[3] = &unk_24D2702C0;
  v9[4] = self;
  v10 = v4;
  v6 = v4;
  -[_UNCNContactResolver bestMatchForPredicate:contactToMatch:](self, "bestMatchForPredicate:contactToMatch:", v5, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
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

        if (!-[_UNCNContactResolver _isSuggestedForContact:](self, "_isSuggestedForContact:", v7)
          && !-[_UNCNContactResolver _isSuggestedForLabeledValue:](self, "_isSuggestedForLabeledValue:", v16))
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
  -[_UNCNContactResolver _matchForContact:matchingLabel:matchType:](self, "_matchForContact:matchingLabel:matchType:", v7, v11, 1);
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

  -[_UNCNContactResolver bestMatchForSocialProfile:bundleIdentifier:](self, "bestMatchForSocialProfile:bundleIdentifier:", v9, v7);
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

  -[_UNCNContactResolver bestMatchForSocialProfile:bundleIdentifier:](self, "bestMatchForSocialProfile:bundleIdentifier:", v9, v7);
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
  v13[2] = __67___UNCNContactResolver_bestMatchForSocialProfile_bundleIdentifier___block_invoke;
  v13[3] = &unk_24D2702E8;
  v13[4] = self;
  v14 = v6;
  v15 = v7;
  v9 = v7;
  v10 = v6;
  -[_UNCNContactResolver bestMatchForPredicate:contactToMatch:](self, "bestMatchForPredicate:contactToMatch:", v8, v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
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

                if (-[_UNCNContactResolver _isSuggestedForContact:](self, "_isSuggestedForContact:", v34))
                {
                  v13 = v9;
                }
                else
                {
                  v13 = v9;
                  if (!-[_UNCNContactResolver _isSuggestedForLabeledValue:](self, "_isSuggestedForLabeledValue:", v9))
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
        if (!-[_UNCNContactResolver _isSuggestedForContact:](self, "_isSuggestedForContact:", v34)
          && v9
          && !-[_UNCNContactResolver _isSuggestedForLabeledValue:](self, "_isSuggestedForLabeledValue:", v9))
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
    -[_UNCNContactResolver _matchForContact:matchingLabel:matchType:](self, "_matchForContact:matchingLabel:matchType:", v34, v9, 3);
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
  void *v12;
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
    v12 = (void *)NCUILogCommunicationNotifications;
    if (os_log_type_enabled((os_log_t)NCUILogCommunicationNotifications, OS_LOG_TYPE_ERROR))
      -[_UNCNContactResolver bestMatchForPredicate:contactToMatch:].cold.1(v12, v11);
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
LABEL_6:
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
          goto LABEL_6;
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
  id v10;

  v4 = a3;
  contactStore = self->_contactStore;
  contactStoreSearchKeys = self->_contactStoreSearchKeys;
  v10 = 0;
  -[CNContactStore unifiedContactWithIdentifier:keysToFetch:error:](contactStore, "unifiedContactWithIdentifier:keysToFetch:error:", v4, contactStoreSearchKeys, &v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v10;
  if (v8 && os_log_type_enabled((os_log_t)NCUILogCommunicationNotifications, OS_LOG_TYPE_ERROR))
    -[_UNCNContactResolver contactForIdentifier:].cold.1();

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
  -[_UNCNContactResolver _fullnameForCNContact:](self, "_fullnameForCNContact:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[_UNCNContactResolver _isSuggestedForContact:](self, "_isSuggestedForContact:", v9);

  v13 = -[_UNCNContactResolver _isSuggestedForLabeledValue:](self, "_isSuggestedForLabeledValue:", v8);
  objc_msgSend(v8, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  +[_UNCNContactResolverResult resultWithCNContactIdentifier:cnContactFullname:suggestedContact:matchType:matchTypeSuggested:identifierOfMatchLabel:](_UNCNContactResolverResult, "resultWithCNContactIdentifier:cnContactFullname:suggestedContact:matchType:matchTypeSuggested:identifierOfMatchLabel:", v10, v11, v12, a5, v13, v14);
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
  OUTLINED_FUNCTION_1_0(&dword_2149F4000, v0, v1, "%{public}s: Unable to find suggested contact to %{public}@ match. Match:%{public}@", v2);
  OUTLINED_FUNCTION_2_0();
}

- (void)confirm:match:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136446722;
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_2149F4000, v0, v1, "%{public}s: Could not create save request for %{public}@ match. Match:%{public}@", v2);
  OUTLINED_FUNCTION_2_0();
}

- (void)confirm:match:.cold.3()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136446722;
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_2149F4000, v0, v1, "%{public}s: Nothing to %{public}@ on match. Match:%{public}@", v2);
  OUTLINED_FUNCTION_2_0();
}

- (void)confirm:match:.cold.4()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136446722;
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_2149F4000, v0, v1, "%{public}s: Cannot %{public}@ contact match on contact identifier. Contact identifiers can't be suggested. Match:%{public}@", v2);
  OUTLINED_FUNCTION_2_0();
}

- (void)bestMatchForPredicate:(void *)a1 contactToMatch:(void *)a2 .cold.1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  int v5;
  const char *v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(a2, "localizedDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 136446466;
  v6 = "-[_UNCNContactResolver bestMatchForPredicate:contactToMatch:]";
  v7 = 2114;
  v8 = v4;
  _os_log_error_impl(&dword_2149F4000, v3, OS_LOG_TYPE_ERROR, "%{public}s: Error querying for contacts based on predicate. Error:%{public}@", (uint8_t *)&v5, 0x16u);

  OUTLINED_FUNCTION_2_0();
}

- (void)contactForIdentifier:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136446722;
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_2149F4000, v0, v1, "%{public}s: Error querying for contact based on identifier:%{public}@ error:%{public}@", v2);
  OUTLINED_FUNCTION_2_0();
}

@end
