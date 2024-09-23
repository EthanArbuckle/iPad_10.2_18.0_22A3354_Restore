id UNCommunicationContextFromBBCommunicationContext(void *a1)
{
  id v1;
  id v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v2 = objc_alloc_init(MEMORY[0x24BDF88D0]);
  objc_msgSend(v1, "recipients");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v22;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(v5);
        UNContactFromBBContact(*(void **)(*((_QWORD *)&v21 + 1) + 8 * v9));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10, (_QWORD)v21);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v7);
  }

  objc_msgSend(v1, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setIdentifier:", v11);

  objc_msgSend(v1, "associatedObjectUri");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAssociatedObjectUri:", v12);

  objc_msgSend(v1, "bundleIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBundleIdentifier:", v13);

  objc_msgSend(v1, "displayName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDisplayName:", v14);

  objc_msgSend(v1, "sender");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v1, "sender");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    UNContactFromBBContact(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v2, "setSender:", v17);
  }
  objc_msgSend(v2, "setRecipients:", v4, (_QWORD)v21);
  objc_msgSend(v1, "contentURL");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setContentURL:", v18);

  objc_msgSend(v1, "imageName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setImageName:", v19);

  objc_msgSend(v2, "setSystemImage:", objc_msgSend(v1, "systemImage"));
  objc_msgSend(v2, "setMentionsCurrentUser:", objc_msgSend(v1, "mentionsCurrentUser"));
  objc_msgSend(v2, "setNotifyRecipientAnyway:", objc_msgSend(v1, "notifyRecipientAnyway"));
  objc_msgSend(v2, "setReplyToCurrentUser:", objc_msgSend(v1, "isReplyToCurrentUser"));
  objc_msgSend(v2, "setRecipientCount:", objc_msgSend(v1, "recipientCount"));
  objc_msgSend(v2, "setCapabilities:", objc_msgSend(v1, "capabilities") & 1);
  objc_msgSend(v2, "setBusinessCorrespondence:", objc_msgSend(v1, "isBusinessCorrespondence"));

  return v2;
}

id UNContactFromBBContact(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v1 = a1;
  v2 = objc_msgSend(v1, "handleType");
  if (v2 == 1)
    v3 = 1;
  else
    v3 = 2 * (v2 == 2);
  v4 = objc_alloc_init(MEMORY[0x24BDF88D8]);
  objc_msgSend(v1, "handle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHandle:", v5);

  objc_msgSend(v4, "setHandleType:", v3);
  objc_msgSend(v1, "displayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDisplayName:", v6);

  objc_msgSend(v4, "setDisplayNameSuggested:", objc_msgSend(v1, "isDisplayNameSuggested"));
  objc_msgSend(v1, "serviceName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setServiceName:", v7);

  objc_msgSend(v1, "customIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCustomIdentifier:", v8);

  objc_msgSend(v1, "cnContactIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCnContactIdentifier:", v9);

  objc_msgSend(v1, "cnContactFullname");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCnContactFullname:", v10);

  v11 = objc_msgSend(v1, "isCNContactIdentifierSuggested");
  objc_msgSend(v4, "setCnContactIdentifierSuggested:", v11);
  return v4;
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

