@implementation HVSearchableItemHelper

+ (BOOL)mailItemIsRecent:(id)a3 emailHeaders:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  double v11;
  double v12;
  double v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  BOOL v17;
  double v18;
  double v19;
  double v20;
  __CFString *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  uint64_t v30;
  NSObject *v31;
  void *context;
  NSObject *v34;
  NSObject *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  NSObject *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  NSObject *v45;
  __int16 v46;
  NSObject *v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "attributeSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contentCreationDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    hv_default_log_handle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      goto LABEL_10;
    objc_msgSend(v5, "uniqueIdentifier");
    v16 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v41 = v16;
    _os_log_impl(&dword_21AA1D000, v9, OS_LOG_TYPE_DEFAULT, "No contentCreationDate on searchable item with id: %{public}@", buf, 0xCu);
LABEL_8:

    goto LABEL_10;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v9 = objc_claimAutoreleasedReturnValue();
    -[NSObject dateByAddingTimeInterval:](v9, "dateByAddingTimeInterval:", -31536000.0);
    v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "timeIntervalSince1970");
    v12 = v11;
    -[NSObject timeIntervalSince1970](v10, "timeIntervalSince1970");
    if (v12 < v13)
    {
      hv_default_log_handle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
LABEL_29:
        v17 = 0;
LABEL_32:

        goto LABEL_33;
      }
      objc_msgSend(v5, "uniqueIdentifier");
      v15 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v41 = v15;
      v42 = 2114;
      v43 = v8;
      v44 = 2114;
      v45 = v9;
      v46 = 2114;
      v47 = v10;
      _os_log_impl(&dword_21AA1D000, v14, OS_LOG_TYPE_DEFAULT, "Item %{public}@ is older than a year (creationDate: %{public}@, now: %{public}@, cutoff: %{public}@)", buf, 0x2Au);
LABEL_28:

      goto LABEL_29;
    }
    -[NSObject dateByAddingTimeInterval:](v9, "dateByAddingTimeInterval:", -2592000.0);
    v14 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "timeIntervalSince1970");
    v19 = v18;
    -[NSObject timeIntervalSince1970](v14, "timeIntervalSince1970");
    if (v19 < v20)
    {
      v21 = CFSTR("list-id");
      if (v6)
      {
        objc_msgSend(v6, "objectForKey:", CFSTR("list-id"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v22)
        {
          v34 = v14;
          v35 = v10;
          context = (void *)MEMORY[0x22074FDF0]();
          v36 = 0u;
          v37 = 0u;
          v38 = 0u;
          v39 = 0u;
          objc_msgSend(v6, "allKeys");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v36, buf, 16);
          if (v24)
          {
            v25 = v24;
            v26 = *(_QWORD *)v37;
            while (2)
            {
              for (i = 0; i != v25; ++i)
              {
                if (*(_QWORD *)v37 != v26)
                  objc_enumerationMutation(v23);
                v28 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
                v29 = (void *)MEMORY[0x22074FDF0]();
                v30 = objc_msgSend(v28, "caseInsensitiveCompare:", CFSTR("list-id"));
                objc_autoreleasePoolPop(v29);
                if (!v30)
                {

                  objc_autoreleasePoolPop(context);
                  v14 = v34;
                  v10 = v35;
                  goto LABEL_26;
                }
              }
              v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v36, buf, 16);
              if (v25)
                continue;
              break;
            }
          }

          objc_autoreleasePoolPop(context);
          v17 = 1;
          v14 = v34;
          v10 = v35;
          goto LABEL_32;
        }

LABEL_26:
        hv_default_log_handle();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v5, "uniqueIdentifier");
          v31 = objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v41 = v31;
          v42 = 2114;
          v43 = v8;
          v44 = 2114;
          v45 = v9;
          v46 = 2114;
          v47 = v14;
          _os_log_impl(&dword_21AA1D000, v15, OS_LOG_TYPE_DEFAULT, "Item %{public}@ is a group message older than a month (creationDate: %{public}@, now: %{public}@, cutoff: %{public}@)", buf, 0x2Au);

        }
        goto LABEL_28;
      }

    }
    v17 = 1;
    goto LABEL_32;
  }
  hv_default_log_handle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
  {
    objc_msgSend(v5, "uniqueIdentifier");
    v16 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v41 = v16;
    _os_log_fault_impl(&dword_21AA1D000, v9, OS_LOG_TYPE_FAULT, "Invalid contentCreationDate on searchable item %{public}@ sent", buf, 0xCu);
    goto LABEL_8;
  }
LABEL_10:
  v17 = 0;
LABEL_33:

  return v17;
}

+ (id)mailItemMessageIdHeaderValues:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "attributeSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "emailHeaders");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(a1, "messageIdHeaderValuesFromHeaders:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)messageIdHeaderValuesFromHeaders:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)MEMORY[0x22074FDF0]();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("message-id"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Message-id"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Message-Id"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v5)
      {
        objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("MESSAGE-ID"));
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v5)
        {
          v15 = 0u;
          v16 = 0u;
          v13 = 0u;
          v14 = 0u;
          v6 = v3;
          v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
          if (v7)
          {
            v8 = v7;
            v9 = *(_QWORD *)v14;
            while (2)
            {
              for (i = 0; i != v8; ++i)
              {
                if (*(_QWORD *)v14 != v9)
                  objc_enumerationMutation(v6);
                v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
                if (objc_msgSend(v11, "length", (_QWORD)v13) == 10
                  && !objc_msgSend(v11, "caseInsensitiveCompare:", CFSTR("message-id")))
                {
                  objc_msgSend(v6, "objectForKeyedSubscript:", v11);
                  v5 = (void *)objc_claimAutoreleasedReturnValue();
                  goto LABEL_16;
                }
              }
              v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
              if (v8)
                continue;
              break;
            }
          }
          v5 = 0;
LABEL_16:

        }
      }
    }
  }
  objc_autoreleasePoolPop(v4);

  return v5;
}

+ (BOOL)mailItemIsValid:(id)a3 emailHeaders:(id)a4 mailboxIdentifiers:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  const char *v15;
  NSObject *v17;
  const char *v18;
  int v19;
  NSObject *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  objc_msgSend(v8, "bundleID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    hv_default_log_handle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v8, "uniqueIdentifier");
      v14 = objc_claimAutoreleasedReturnValue();
      v19 = 138543362;
      v20 = v14;
      v15 = "Item %{public}@ is malformed - no bundleID";
LABEL_14:
      _os_log_impl(&dword_21AA1D000, v13, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v19, 0xCu);
      goto LABEL_15;
    }
LABEL_16:
    LOBYTE(a4) = 0;
    goto LABEL_17;
  }
  if (!a4)
  {
    hv_default_log_handle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      goto LABEL_17;
    objc_msgSend(v8, "uniqueIdentifier");
    v14 = objc_claimAutoreleasedReturnValue();
    v19 = 138543362;
    v20 = v14;
    v15 = "Item %{public}@ not valid - no value for emailHeaders";
    goto LABEL_14;
  }
  objc_msgSend(a1, "mailItemMessageIdHeaderValues:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    hv_default_log_handle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v8, "uniqueIdentifier");
      v14 = objc_claimAutoreleasedReturnValue();
      v19 = 138543362;
      v20 = v14;
      v15 = "Item %{public}@ not valid - no message-id header";
      goto LABEL_14;
    }
    goto LABEL_16;
  }
  objc_msgSend(v8, "attributeSet");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "accountIdentifier");
  v13 = objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    hv_default_log_handle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v8, "uniqueIdentifier");
      v17 = objc_claimAutoreleasedReturnValue();
      v19 = 138543362;
      v20 = v17;
      v18 = "Item %{public}@ is malformed - no source";
LABEL_22:
      _os_log_impl(&dword_21AA1D000, v14, OS_LOG_TYPE_DEFAULT, v18, (uint8_t *)&v19, 0xCu);

    }
LABEL_15:

    goto LABEL_16;
  }
  if (v9 && (objc_opt_respondsToSelector() & 1) == 0)
  {
    hv_default_log_handle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v8, "uniqueIdentifier");
      v17 = objc_claimAutoreleasedReturnValue();
      v19 = 138543362;
      v20 = v17;
      v18 = "Item %{public}@ is malformed - mailbox list is present but is not an array";
      goto LABEL_22;
    }
    goto LABEL_15;
  }
  LOBYTE(a4) = 1;
LABEL_17:

  return (char)a4;
}

+ (BOOL)mailItemIsInDrafts:(id)a3 mailboxIdentifiers:(id)a4
{
  id v5;
  int v6;
  NSObject *v7;
  void *v8;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = objc_msgSend(a4, "containsObject:", *MEMORY[0x24BDC1958]);
  if (v6)
  {
    hv_default_log_handle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "uniqueIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v8;
      _os_log_impl(&dword_21AA1D000, v7, OS_LOG_TYPE_DEFAULT, "Item %{public}@ is in draft mailbox", (uint8_t *)&v10, 0xCu);

    }
  }

  return v6;
}

+ (BOOL)mailItemIsInSent:(id)a3 mailboxIdentifiers:(id)a4
{
  id v5;
  int v6;
  NSObject *v7;
  void *v8;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = objc_msgSend(a4, "containsObject:", *MEMORY[0x24BDC1970]);
  if (v6)
  {
    hv_default_log_handle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "uniqueIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v8;
      _os_log_impl(&dword_21AA1D000, v7, OS_LOG_TYPE_DEFAULT, "Item %{public}@ in sent mailbox", (uint8_t *)&v10, 0xCu);

    }
  }

  return v6;
}

+ (BOOL)mailItemIsInTrash:(id)a3 mailboxIdentifiers:(id)a4
{
  id v5;
  int v6;
  NSObject *v7;
  void *v8;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = objc_msgSend(a4, "containsObject:", *MEMORY[0x24BDC1978]);
  if (v6)
  {
    hv_default_log_handle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "uniqueIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v8;
      _os_log_impl(&dword_21AA1D000, v7, OS_LOG_TYPE_DEFAULT, "Item %{public}@ in trash mailbox", (uint8_t *)&v10, 0xCu);

    }
  }

  return v6;
}

+ (BOOL)mailItemIsFromSupportedAccount:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  NSObject *v7;
  void *v8;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "attributeSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accountType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    hv_default_log_handle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "uniqueIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v8;
      _os_log_impl(&dword_21AA1D000, v7, OS_LOG_TYPE_DEFAULT, "Item %{public}@ missing account type", (uint8_t *)&v10, 0xCu);

    }
    goto LABEL_8;
  }
  if ((objc_msgSend(v5, "isEqual:", *MEMORY[0x24BDC18C8]) & 1) != 0
    || (objc_msgSend(v5, "isEqual:", *MEMORY[0x24BDC18D0]) & 1) != 0)
  {
LABEL_8:
    v6 = 1;
    goto LABEL_9;
  }
  v6 = objc_msgSend(v5, "isEqual:", *MEMORY[0x24BDC18C0]);
LABEL_9:

  return v6;
}

+ (BOOL)searchableItemIsEmpty:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "attributeSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "HTMLContentDataNoCopy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {

LABEL_4:
    v7 = 0;
    goto LABEL_5;
  }
  objc_msgSend(v4, "textContentNoCopy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    goto LABEL_4;
  hv_default_log_handle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "uniqueIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543362;
    v12 = v10;
    _os_log_impl(&dword_21AA1D000, v9, OS_LOG_TYPE_DEFAULT, "Item %{public}@ is empty", (uint8_t *)&v11, 0xCu);

  }
  v7 = 1;
LABEL_5:

  return v7;
}

+ (BOOL)searchableItemIsOutgoing:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  NSObject *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  int v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_alloc(MEMORY[0x24BDBCF20]);
  objc_msgSend(v3, "attributeSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accountHandles");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithArray:", v6);

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(v3, "attributeSet", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "authorAddresses");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v9);
        if ((objc_msgSend(v7, "containsObject:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i)) & 1) != 0)
        {
          LODWORD(v10) = 1;
          goto LABEL_11;
        }
      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
      if (v10)
        continue;
      break;
    }
  }
LABEL_11:

  hv_default_log_handle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "uniqueIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v21 = v14;
    v22 = 1024;
    v23 = v10;
    _os_log_impl(&dword_21AA1D000, v13, OS_LOG_TYPE_DEFAULT, "searchableItemIsOutgoing %{public}@: %d", buf, 0x12u);

  }
  return v10;
}

+ (BOOL)mailItemIsSPAM:(id)a3 emailHeaders:(id)a4 mailboxIdentifiers:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t i;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  BOOL v41;
  NSObject *v43;
  void *v45;
  const char *v46;
  NSObject *v47;
  void *v48;
  void *v50;
  NSObject *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *context;
  id v56;
  id v57;
  void *v58;
  id obj;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  uint8_t buf[4];
  void *v72;
  __int16 v73;
  void *v74;
  _BYTE v75[128];
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v9, "containsObject:", *MEMORY[0x24BDC1968]))
  {
    hv_default_log_handle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v7, "uniqueIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v72 = v11;
      v12 = "Item %{public}@ spam - in junk mailbox";
LABEL_45:
      _os_log_impl(&dword_21AA1D000, v10, OS_LOG_TYPE_DEFAULT, v12, buf, 0xCu);

      goto LABEL_46;
    }
    goto LABEL_46;
  }
  if (!v8)
  {
    hv_default_log_handle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v7, "uniqueIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v72 = v11;
      v12 = "invalid item %{public}@ - email headers are nil";
      goto LABEL_45;
    }
LABEL_46:
    v41 = 1;
    goto LABEL_47;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    hv_default_log_handle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v7, "uniqueIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v72 = v11;
      v12 = "invalid item %{public}@ - email headers are not a dictionary";
      goto LABEL_45;
    }
    goto LABEL_46;
  }
  v69 = 0u;
  v70 = 0u;
  v67 = 0u;
  v68 = 0u;
  v10 = v8;
  v13 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v67, v76, 16);
  if (!v13)
  {
    v41 = 0;
    goto LABEL_47;
  }
  v14 = v13;
  v56 = v9;
  v57 = v8;
  v58 = v7;
  v15 = *(_QWORD *)v68;
LABEL_8:
  v16 = 0;
  while (1)
  {
    if (*(_QWORD *)v68 != v15)
      objc_enumerationMutation(v10);
    v17 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * v16);
    v18 = (void *)MEMORY[0x22074FDF0]();
    objc_msgSend(v17, "lowercaseString");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v19, "isEqualToString:", CFSTR("x-spam-level")))
    {
      -[NSObject objectForKeyedSubscript:](v10, "objectForKeyedSubscript:", v17);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "firstObject");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v21, "hasPrefix:", CFSTR("*****")))
      {
        hv_default_log_handle();
        v43 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
          goto LABEL_61;
        objc_msgSend(v58, "uniqueIdentifier");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v72 = v45;
        v46 = "Item %{public}@ spam - spam assasin header";
        goto LABEL_60;
      }
      goto LABEL_19;
    }
    if (objc_msgSend(v19, "isEqualToString:", CFSTR("x-ms-exchange-organization-pcl")))
    {
      -[NSObject objectForKeyedSubscript:](v10, "objectForKeyedSubscript:", v17);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "firstObject");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v21, "integerValue") >= 4)
      {
        hv_default_log_handle();
        v43 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
          goto LABEL_61;
        objc_msgSend(v58, "uniqueIdentifier");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v72 = v45;
        v46 = "Item %{public}@ spam - exchange pcl header";
        goto LABEL_60;
      }
      goto LABEL_19;
    }
    if (objc_msgSend(v19, "isEqualToString:", CFSTR("x-ms-exchange-organization-scl")))
    {
      -[NSObject objectForKeyedSubscript:](v10, "objectForKeyedSubscript:", v17);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "firstObject");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v21, "integerValue") >= 5)
      {
        hv_default_log_handle();
        v43 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        {
LABEL_61:

          v9 = v56;
          goto LABEL_62;
        }
        objc_msgSend(v58, "uniqueIdentifier");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v72 = v45;
        v46 = "Item %{public}@ spam - exchange scl header";
LABEL_60:
        _os_log_impl(&dword_21AA1D000, v43, OS_LOG_TYPE_DEFAULT, v46, buf, 0xCu);

        goto LABEL_61;
      }
LABEL_19:

      goto LABEL_20;
    }
    if (!objc_msgSend(v19, "isEqualToString:", CFSTR("x-tm-as-result")))
    {
      if (objc_msgSend(v19, "isEqualToString:", CFSTR("x-proofpoint-spam-details")))
      {
        context = (void *)MEMORY[0x22074FDF0]();
        -[NSObject objectForKeyedSubscript:](v10, "objectForKeyedSubscript:", v17);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "firstObject");
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        v32 = context;
        v65 = 0u;
        v66 = 0u;
        v63 = 0u;
        v64 = 0u;
        v54 = v31;
        objc_msgSend(v31, "componentsSeparatedByString:", CFSTR(" "));
        obj = (id)objc_claimAutoreleasedReturnValue();
        v60 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v75, 16);
        if (v60)
        {
          v62 = *(_QWORD *)v64;
          v53 = v15;
          while (2)
          {
            for (i = 0; i != v60; ++i)
            {
              if (*(_QWORD *)v64 != v62)
                objc_enumerationMutation(obj);
              v34 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * i);
              v35 = (void *)MEMORY[0x22074FDF0]();
              if ((objc_msgSend(v34, "isEqualToString:", CFSTR("rule=spam")) & 1) != 0
                || objc_msgSend(v34, "isEqualToString:", CFSTR("rule=probablespam")))
              {
                hv_default_log_handle();
                v47 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
                {
                  objc_msgSend(v58, "uniqueIdentifier");
                  v48 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543618;
                  v72 = v48;
                  v73 = 2112;
                  v74 = v34;
                  _os_log_impl(&dword_21AA1D000, v47, OS_LOG_TYPE_DEFAULT, "Item %{public}@ spam - has x-proofpoint-spam-details rule match: %@", buf, 0x16u);

                }
                goto LABEL_57;
              }
              if ((objc_msgSend(v34, "hasPrefix:", CFSTR("spamscore=")) & 1) != 0
                || objc_msgSend(v34, "hasPrefix:", CFSTR("phishscore=")))
              {
                v36 = objc_msgSend(v34, "rangeOfString:options:", CFSTR("="), 2);
                objc_msgSend(v34, "substringFromIndex:", v36 + v37);
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                v39 = objc_msgSend(v38, "integerValue");

                if (v39 >= 80)
                {
                  hv_default_log_handle();
                  v47 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
                  {
                    objc_msgSend(v58, "uniqueIdentifier");
                    v50 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138543618;
                    v72 = v50;
                    v73 = 2112;
                    v74 = v34;
                    _os_log_impl(&dword_21AA1D000, v47, OS_LOG_TYPE_DEFAULT, "Item %{public}@ spam - has x-proofpoint-spam-details rule match: %@", buf, 0x16u);

                  }
LABEL_57:
                  v9 = v56;

                  objc_autoreleasePoolPop(v35);
                  objc_autoreleasePoolPop(context);
                  goto LABEL_62;
                }
              }
              objc_autoreleasePoolPop(v35);
            }
            v15 = v53;
            v32 = context;
            v60 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v75, 16);
            if (v60)
              continue;
            break;
          }
        }

        objc_autoreleasePoolPop(v32);
      }
      goto LABEL_20;
    }
    v61 = v18;
    v24 = v14;
    v25 = v15;
    -[NSObject objectForKeyedSubscript:](v10, "objectForKeyedSubscript:", v17);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "firstObject");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v27, "lowercaseString");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "hasPrefix:", CFSTR("yes"));

    if (v29)
      break;

    v15 = v25;
    v14 = v24;
    v18 = v61;
LABEL_20:

    objc_autoreleasePoolPop(v18);
    if (++v16 == v14)
    {
      v40 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v67, v76, 16);
      v14 = v40;
      if (!v40)
      {
        v41 = 0;
        v8 = v57;
        v7 = v58;
        v9 = v56;
        goto LABEL_47;
      }
      goto LABEL_8;
    }
  }
  hv_default_log_handle();
  v51 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v58, "uniqueIdentifier");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v72 = v52;
    _os_log_impl(&dword_21AA1D000, v51, OS_LOG_TYPE_DEFAULT, "Item %{public}@ spam - trend micro header", buf, 0xCu);

  }
  v9 = v56;
  v18 = v61;
LABEL_62:

  objc_autoreleasePoolPop(v18);
  v41 = 1;
  v8 = v57;
  v7 = v58;
LABEL_47:

  return v41;
}

+ (BOOL)mailItemIsRecent:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(v4, "attributeSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "emailHeaders");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a1) = objc_msgSend(a1, "mailItemIsRecent:emailHeaders:", v4, v6);

  return (char)a1;
}

+ (BOOL)mailItemIsValid:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(v4, "attributeSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "emailHeaders");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attributeSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "mailboxIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a1) = objc_msgSend(a1, "mailItemIsValid:emailHeaders:mailboxIdentifiers:", v4, v6, v8);

  return (char)a1;
}

+ (BOOL)mailItemIsSPAM:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(v4, "attributeSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "emailHeaders");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attributeSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "mailboxIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a1) = objc_msgSend(a1, "mailItemIsSPAM:emailHeaders:mailboxIdentifiers:", v4, v6, v8);

  return (char)a1;
}

+ (BOOL)mailItemIsInDrafts:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(v4, "attributeSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mailboxIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a1) = objc_msgSend(a1, "mailItemIsInDrafts:mailboxIdentifiers:", v4, v6);

  return (char)a1;
}

+ (BOOL)mailItemIsInSent:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(v4, "attributeSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mailboxIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a1) = objc_msgSend(a1, "mailItemIsInSent:mailboxIdentifiers:", v4, v6);

  return (char)a1;
}

+ (BOOL)mailItemIsInTrash:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(v4, "attributeSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mailboxIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a1) = objc_msgSend(a1, "mailItemIsInTrash:mailboxIdentifiers:", v4, v6);

  return (char)a1;
}

+ (BOOL)mailItemIsTooBig:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unint64_t v6;
  NSObject *v7;
  void *v8;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "attributeSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "HTMLContentDataNoCopy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (v6 > 0xC8000)
  {
    hv_default_log_handle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "uniqueIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v8;
      _os_log_impl(&dword_21AA1D000, v7, OS_LOG_TYPE_DEFAULT, "Item %{public}@ is too big", (uint8_t *)&v10, 0xCu);

    }
  }

  return v6 > 0xC8000;
}

+ (id)textContentNoCopyRetainingBackingBuffer:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  __CFString *v8;

  v3 = a3;
  v4 = (void *)MEMORY[0x22074FDF0]();
  objc_msgSend(v3, "attributeSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "textContentNoCopy");
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
LABEL_6:
    objc_autoreleasePoolPop(v4);
    v8 = v6;
    goto LABEL_7;
  }
  if ((unint64_t)-[__CFString length](v6, "length") >= 0xC9)
  {
    if (CFStringGetCharactersPtr(v6))
    {
      objc_setAssociatedObject(v6, sel_textContentNoCopyRetainingBackingBuffer_, v3, (void *)1);
      -[__CFString _pas_setRetainsConmingledBackingStore:](v6, "_pas_setRetainsConmingledBackingStore:", 1);
    }
    goto LABEL_6;
  }
  objc_msgSend(v3, "attributeSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textContent");
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v4);
LABEL_7:

  return v8;
}

+ (id)htmlContentDataNoCopyRetainingBackingBuffer:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  v4 = (void *)MEMORY[0x22074FDF0]();
  objc_msgSend(v3, "attributeSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "HTMLContentDataNoCopy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    goto LABEL_5;
  if ((unint64_t)objc_msgSend(v6, "length") >= 0xC9)
  {
    objc_setAssociatedObject(v6, sel_htmlContentDataNoCopyRetainingBackingBuffer_, v3, (void *)1);
LABEL_5:
    objc_autoreleasePoolPop(v4);
    v8 = v6;
    goto LABEL_6;
  }
  objc_msgSend(v3, "attributeSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "HTMLContentData");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v4);
LABEL_6:

  return v8;
}

+ (id)serializeAttributesAndBody:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  HVSearchableItemSerializedAttributes *v7;
  void *v8;
  void *v9;
  void *v10;
  HVSearchableItemSerializedAttributes *v11;

  v3 = a3;
  v4 = (void *)MEMORY[0x22074FDF0]();
  v5 = (void *)objc_opt_new();
  objc_msgSend(v3, "attributeSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:", v6);

  v7 = [HVSearchableItemSerializedAttributes alloc];
  objc_msgSend(v5, "data");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attributeSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "HTMLContentDataNoCopy");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[HVSearchableItemSerializedAttributes initWithAttributeSetData:attributeSetCoder:htmlContentData:](v7, "initWithAttributeSetData:attributeSetCoder:htmlContentData:", v8, v5, v10);

  objc_autoreleasePoolPop(v4);
  return v11;
}

+ (id)deserializeAttributes:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (objc_class *)MEMORY[0x24BDC23D0];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithData:", v4);

  objc_msgSend(v5, "decode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)deserializeAttributes:(id)a3 andBody:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a4;
  objc_msgSend(a1, "deserializeAttributes:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "uniqueIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "domainIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC2478]), "initWithUniqueIdentifier:domainIdentifier:attributeSet:", v9, v10, v8);
    v12 = v11;
    if (v6)
    {
      objc_msgSend(v11, "attributeSet");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setHTMLContentData:", v6);

    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (id)deserializeAttributesAndBody:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "attributeSetData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "htmlContentData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "deserializeAttributes:andBody:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)sanitizeHandles:(id)a3
{
  return (id)objc_msgSend(a3, "_pas_filteredArrayWithTest:", &__block_literal_global_147);
}

uint64_t __42__HVSearchableItemHelper_sanitizeHandles___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end
