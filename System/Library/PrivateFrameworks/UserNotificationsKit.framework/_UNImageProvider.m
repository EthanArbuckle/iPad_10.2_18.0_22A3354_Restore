@implementation _UNImageProvider

+ (id)imageDataForContentURL:(id)a3
{
  id v4;
  int v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  const __CFString *v9;
  char v10;
  NSObject *v11;
  NSObject *v12;
  int v14;
  const char *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  _BOOL4 v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  NCRegisterUserNotificationsUILogging();
  if (v4)
  {
    v5 = objc_msgSend(v4, "isFileURL");
    if (!v5)
      goto LABEL_6;
    objc_msgSend(a1, "_imageDataFromFileSystemForContactURL:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = NCUILogCommunicationNotifications;
    if (os_log_type_enabled((os_log_t)NCUILogCommunicationNotifications, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 136446722;
      v15 = "+[_UNImageProvider imageDataForContentURL:]";
      v16 = 2114;
      v17 = v4;
      v18 = 1026;
      LODWORD(v19) = v6 != 0;
      _os_log_impl(&dword_2149F4000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s: contentURL:%{public}@ Trying to fetch from file system FIRST. Success:%{public}d", (uint8_t *)&v14, 0x1Cu);
    }
    if (!v6)
    {
LABEL_6:
      objc_msgSend(a1, "_imageDataFromIntentsForContentURL:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = NCUILogCommunicationNotifications;
      if (os_log_type_enabled((os_log_t)NCUILogCommunicationNotifications, OS_LOG_TYPE_DEFAULT))
      {
        v9 = CFSTR("FIRST");
        v14 = 136446978;
        v15 = "+[_UNImageProvider imageDataForContentURL:]";
        if (v5)
          v9 = CFSTR("SECOND");
        v16 = 2114;
        v17 = v4;
        v18 = 2114;
        v19 = v9;
        v20 = 1026;
        v21 = v6 != 0;
        _os_log_impl(&dword_2149F4000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s: contentURL:%{public}@ Trying to fetch from intents %{public}@. Success:%{public}d", (uint8_t *)&v14, 0x26u);
      }
      if (v6)
        v10 = 1;
      else
        v10 = v5;
      if ((v10 & 1) == 0)
      {
        objc_msgSend(a1, "_imageDataFromFileSystemForContactURL:", v4);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = NCUILogCommunicationNotifications;
        if (os_log_type_enabled((os_log_t)NCUILogCommunicationNotifications, OS_LOG_TYPE_DEFAULT))
        {
          v14 = 136446722;
          v15 = "+[_UNImageProvider imageDataForContentURL:]";
          v16 = 2114;
          v17 = v4;
          v18 = 1026;
          LODWORD(v19) = v6 != 0;
          _os_log_impl(&dword_2149F4000, v11, OS_LOG_TYPE_DEFAULT, "%{public}s: contentURL:%{public}@ Trying to fetch from file system SECOND. Success:%{public}d", (uint8_t *)&v14, 0x1Cu);
        }
      }
    }
  }
  else
  {
    v12 = NCUILogCommunicationNotifications;
    if (os_log_type_enabled((os_log_t)NCUILogCommunicationNotifications, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 136446210;
      v15 = "+[_UNImageProvider imageDataForContentURL:]";
      _os_log_impl(&dword_2149F4000, v12, OS_LOG_TYPE_DEFAULT, "%{public}s: contentURL:nil", (uint8_t *)&v14, 0xCu);
    }
    v6 = 0;
  }

  return v6;
}

+ (id)generateEphemeralContactsForImageRenderingWithContext:(id)a3 bundleIdentifier:(id)a4 descriptorForRequiredKeys:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  int v22;
  void *v23;
  _BOOL4 v24;
  NSObject *v25;
  void *v26;
  void *v27;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  uint8_t buf[4];
  id v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  NCRegisterUserNotificationsUILogging();
  v11 = (void *)NCUILogCommunicationNotifications;
  if (os_log_type_enabled((os_log_t)NCUILogCommunicationNotifications, OS_LOG_TYPE_DEFAULT))
  {
    v12 = v11;
    objc_msgSend(v8, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "un_logDigest");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v34 = v9;
    v35 = 2082;
    v36 = "+[_UNImageProvider generateEphemeralContactsForImageRenderingWithContext:bundleIdentifier:descriptorForRequiredKeys:]";
    v37 = 2114;
    v38 = v14;
    _os_log_impl(&dword_2149F4000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}s: Context identifier:%{public}@ Start getting contacts", buf, 0x20u);

  }
  if (v8)
  {
    objc_msgSend(a1, "_contactForImageRenderingFromContentURLWithContext:bundleIdentifier:", v8, v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v16 = (void *)NCUILogCommunicationNotifications;
      if (os_log_type_enabled((os_log_t)NCUILogCommunicationNotifications, OS_LOG_TYPE_DEFAULT))
      {
        v17 = v16;
        objc_msgSend(v8, "identifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "un_logDigest");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v34 = v9;
        v35 = 2082;
        v36 = "+[_UNImageProvider generateEphemeralContactsForImageRenderingWithContext:bundleIdentifier:descriptorForRequiredKeys:]";
        v37 = 2114;
        v38 = v19;
        _os_log_impl(&dword_2149F4000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}s: Context identifier:%{public}@ Contact created from content URL", buf, 0x20u);

      }
      v32 = v15;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v32, 1);
      v20 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = objc_msgSend(v9, "un_isFirstPartyIdentifier");
      v23 = (void *)NCUILogCommunicationNotifications;
      v24 = os_log_type_enabled((os_log_t)NCUILogCommunicationNotifications, OS_LOG_TYPE_DEFAULT);
      if (!v22)
      {
        if (v24)
        {
          v29 = v23;
          objc_msgSend(v8, "identifier");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "un_logDigest");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v34 = v9;
          v35 = 2082;
          v36 = "+[_UNImageProvider generateEphemeralContactsForImageRenderingWithContext:bundleIdentifier:descriptorForRequiredKeys:]";
          v37 = 2114;
          v38 = v31;
          _os_log_impl(&dword_2149F4000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}s: Context identifier:%{public}@ No contact created because no data found content URL provided", buf, 0x20u);

        }
        v21 = (void *)MEMORY[0x24BDBD1A8];
        goto LABEL_14;
      }
      if (v24)
      {
        v25 = v23;
        objc_msgSend(v8, "identifier");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "un_logDigest");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v34 = v9;
        v35 = 2082;
        v36 = "+[_UNImageProvider generateEphemeralContactsForImageRenderingWithContext:bundleIdentifier:descriptorForRequiredKeys:]";
        v37 = 2114;
        v38 = v27;
        _os_log_impl(&dword_2149F4000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}s: Context identifier:%{public}@ Contacts created from recipients for snowglobe (1st party only)", buf, 0x20u);

      }
      objc_msgSend(a1, "_contactsForImageRenderingFromRecipientsWithContext:bundleIdentifier:descriptorForRequiredKeys:", v8, v9, v10);
      v20 = objc_claimAutoreleasedReturnValue();
    }
    v21 = (void *)v20;
LABEL_14:

    goto LABEL_15;
  }
  v21 = (void *)MEMORY[0x24BDBD1A8];
LABEL_15:

  return v21;
}

+ (id)_imageDataFromIntentsForContentURL:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  const char *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  void *v25;
  void *v26;
  id v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  _BYTE v33[18];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = NCUILogCommunicationNotifications;
  if (os_log_type_enabled((os_log_t)NCUILogCommunicationNotifications, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v29 = "+[_UNImageProvider _imageDataFromIntentsForContentURL:]";
    v30 = 2114;
    v31 = v3;
    _os_log_impl(&dword_2149F4000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s: contentURL:%{public}@ Starting Read", buf, 0x16u);
  }
  objc_msgSend(MEMORY[0x24BDD9DA8], "imageWithURL:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "_imageData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
LABEL_20:
      objc_msgSend(MEMORY[0x24BDBCE60], "now", v26);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "timeIntervalSinceDate:", v4);
      v22 = v21;
      v23 = NCUILogCommunicationNotifications;
      if (os_log_type_enabled((os_log_t)NCUILogCommunicationNotifications, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446978;
        v29 = "+[_UNImageProvider _imageDataFromIntentsForContentURL:]";
        v30 = 2114;
        v31 = v3;
        v32 = 1026;
        *(_DWORD *)v33 = v8 != 0;
        *(_WORD *)&v33[4] = 2050;
        *(_QWORD *)&v33[6] = v22;
        _os_log_impl(&dword_2149F4000, v23, OS_LOG_TYPE_DEFAULT, "%{public}s: contentURL:%{public}@ Ending Read. Success:%{public}d. Finished in:%{public}f milliseconds", buf, 0x26u);
      }

      goto LABEL_23;
    }
    objc_msgSend(v7, "_uri");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "isFileURL"))
    {
      v10 = objc_retainAutorelease(v9);
      objc_msgSend(v10, "fileSystemRepresentation");
      v11 = (const char *)sandbox_extension_issue_file();
      if (!v11)
      {
        v25 = (void *)NCUILogCommunicationNotifications;
        if (os_log_type_enabled((os_log_t)NCUILogCommunicationNotifications, OS_LOG_TYPE_ERROR))
          +[_UNImageProvider _imageDataFromIntentsForContentURL:].cold.2((uint64_t)v3, v10, v25);
        v8 = 0;
        goto LABEL_19;
      }
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:", v11, strlen(v11) + 1, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_setSandboxExtensionData:", v12);

    }
    objc_msgSend(MEMORY[0x24BDD9DB8], "sharedConnection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0;
    objc_msgSend(v13, "loadDataImageFromImage:scaledSize:error:", v7, &v27, *MEMORY[0x24BDD98F8], *(double *)(MEMORY[0x24BDD98F8] + 8));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v27;

    if (!v14 || v15)
    {
      v19 = NCUILogCommunicationNotifications;
      if (os_log_type_enabled((os_log_t)NCUILogCommunicationNotifications, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446978;
        v29 = "+[_UNImageProvider _imageDataFromIntentsForContentURL:]";
        v30 = 2114;
        v31 = v3;
        v32 = 2114;
        *(_QWORD *)v33 = v7;
        *(_WORD *)&v33[8] = 2114;
        *(_QWORD *)&v33[10] = v15;
        _os_log_error_impl(&dword_2149F4000, v19, OS_LOG_TYPE_ERROR, "%{public}s: contentURL:%{public}@ Failed to fetch icon data from INImage %{public}@ with error %{public}@", buf, 0x2Au);
      }
      v8 = 0;
    }
    else
    {
      objc_msgSend(v14, "_imageData");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)NCUILogClient;
      if (os_log_type_enabled((os_log_t)NCUILogClient, OS_LOG_TYPE_DEFAULT))
      {
        v17 = v16;
        objc_msgSend(v7, "_identifier");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136446722;
        v29 = "+[_UNImageProvider _imageDataFromIntentsForContentURL:]";
        v30 = 2114;
        v31 = v3;
        v32 = 2114;
        *(_QWORD *)v33 = v26;
        _os_log_impl(&dword_2149F4000, v17, OS_LOG_TYPE_DEFAULT, "%{public}s: contentURL:%{public}@ Successfully fetched identity image with identifier '%{public}@'", buf, 0x20u);

      }
    }

LABEL_19:
    goto LABEL_20;
  }
  v18 = NCUILogCommunicationNotifications;
  if (os_log_type_enabled((os_log_t)NCUILogCommunicationNotifications, OS_LOG_TYPE_ERROR))
    +[_UNImageProvider _imageDataFromIntentsForContentURL:].cold.1((uint64_t)v3, v18);
  v8 = 0;
LABEL_23:

  return v8;
}

+ (id)_imageDataFromFileSystemForContactURL:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  _QWORD v20[3];

  v20[2] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = NCUILogCommunicationNotifications;
  if (os_log_type_enabled((os_log_t)NCUILogCommunicationNotifications, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v16 = "+[_UNImageProvider _imageDataFromFileSystemForContactURL:]";
    v17 = 2114;
    v18 = v3;
    _os_log_impl(&dword_2149F4000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s: contentURL:%{public}@ Starting Read", buf, 0x16u);
  }
  v14 = 0;
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:options:error:", v3, 1, &v14);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v14;
  if (v7)
  {
    v8 = NCUILogCommunicationNotifications;
    if (os_log_type_enabled((os_log_t)NCUILogCommunicationNotifications, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      v16 = "+[_UNImageProvider _imageDataFromFileSystemForContactURL:]";
      v17 = 2114;
      v18 = v3;
      v19 = 2114;
      v20[0] = v7;
      _os_log_impl(&dword_2149F4000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s: contentURL:%{public}@ Error reading image data %{public}@", buf, 0x20u);
    }
  }
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "timeIntervalSinceDate:", v4);
  v11 = v10;
  v12 = NCUILogCommunicationNotifications;
  if (os_log_type_enabled((os_log_t)NCUILogCommunicationNotifications, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446978;
    v16 = "+[_UNImageProvider _imageDataFromFileSystemForContactURL:]";
    v17 = 2114;
    v18 = v3;
    v19 = 1026;
    LODWORD(v20[0]) = v6 != 0;
    WORD2(v20[0]) = 2050;
    *(_QWORD *)((char *)v20 + 6) = v11;
    _os_log_impl(&dword_2149F4000, v12, OS_LOG_TYPE_DEFAULT, "%{public}s: contentURL:%{public}@ Ending Read. Success:%{public}d. Finished in:%{public}f milliseconds", buf, 0x26u);
  }

  return v6;
}

+ (id)_contactForImageRenderingFromContentURLWithContext:(id)a3 bundleIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  int v19;
  id v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  _BOOL4 v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)NCUILogCommunicationNotifications;
  if (os_log_type_enabled((os_log_t)NCUILogCommunicationNotifications, OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    objc_msgSend(v6, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "un_logDigest");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "contentURL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "contentURL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138544386;
    v20 = v7;
    v21 = 2082;
    v22 = "+[_UNImageProvider _contactForImageRenderingFromContentURLWithContext:bundleIdentifier:]";
    v23 = 2114;
    v24 = v11;
    v25 = 1026;
    v26 = v12 != 0;
    v27 = 2114;
    v28 = v13;
    _os_log_impl(&dword_2149F4000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}s: Context identifier:%{public}@ Will attempt to get image data:%{public}d withURL:%{public}@", (uint8_t *)&v19, 0x30u);

  }
  objc_msgSend(v6, "contentURL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    v15 = 0;
    goto LABEL_7;
  }
  objc_msgSend(a1, "imageDataForContentURL:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15)
  {
LABEL_7:
    v16 = 0;
    goto LABEL_8;
  }
  v16 = objc_alloc_init(MEMORY[0x24BDBAD50]);
  objc_msgSend(v16, "setImageData:", v15);
LABEL_8:
  v17 = v16;

  return v17;
}

+ (id)_contactsForImageRenderingFromRecipientsWithContext:(id)a3 bundleIdentifier:(id)a4 descriptorForRequiredKeys:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  unint64_t v19;
  BOOL v20;
  void *v21;
  void *v22;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  id v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v24 = v7;
  objc_msgSend(v7, "allContacts");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v27)
  {
    v25 = v11;
    v26 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v27; ++i)
      {
        if (*(_QWORD *)v29 != v26)
          objc_enumerationMutation(v11);
        v13 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v13, "cnContactIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v14)
          goto LABEL_8;
        +[_UNNotificationContactService sharedInstance](_UNNotificationContactService, "sharedInstance");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = v9;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v32, 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "curatedContactForContact:bundleIdentifier:keysToFetch:", v13, v8, v16);
        v17 = (id)objc_claimAutoreleasedReturnValue();

        if (!v17)
        {
LABEL_8:
          objc_msgSend(v13, "displayName");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "rangeOfString:", CFSTR(" "));
          v17 = objc_alloc_init(MEMORY[0x24BDBAD50]);
          v20 = (unint64_t)objc_msgSend(v18, "length") < 3 || v19 == 0;
          if (v20 || v19 >= objc_msgSend(v18, "length") - 1)
          {
            objc_msgSend(v17, "setGivenName:", v18);
          }
          else
          {
            objc_msgSend(v18, "substringWithRange:", 0, v19);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = v25;
            objc_msgSend(v18, "substringWithRange:", v19 + 1, objc_msgSend(v18, "length") + ~v19);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "setGivenName:", v21);
            objc_msgSend(v17, "setFamilyName:", v22);

          }
        }
        objc_msgSend(v10, "addObject:", v17);

      }
      v27 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v27);
  }

  return v10;
}

+ (id)generateEphemeralContactsForImageRenderingWithContext:(id)a3 descriptorForRequiredKeys:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  if (a3)
  {
    v6 = a4;
    v7 = a3;
    objc_msgSend(v7, "bundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "generateEphemeralContactsForImageRenderingWithContext:bundleIdentifier:descriptorForRequiredKeys:", v7, v8, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = (void *)MEMORY[0x24BDBD1A8];
  }
  return v9;
}

+ (void)_imageDataFromIntentsForContentURL:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 136446466;
  v3 = "+[_UNImageProvider _imageDataFromIntentsForContentURL:]";
  v4 = 2114;
  v5 = a1;
  _os_log_error_impl(&dword_2149F4000, a2, OS_LOG_TYPE_ERROR, "%{public}s: contentURL:%{public}@ Failed to create an INIntent from url. Cannot proceed with loading data from INImageServiceConnection.", (uint8_t *)&v2, 0x16u);
}

+ (void)_imageDataFromIntentsForContentURL:(void *)a3 .cold.2(uint64_t a1, id a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  int v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = objc_retainAutorelease(a2);
  v6 = a3;
  v7 = objc_msgSend(v5, "fileSystemRepresentation");
  v8 = *__error();
  v9 = 136446978;
  v10 = "+[_UNImageProvider _imageDataFromIntentsForContentURL:]";
  v11 = 2114;
  v12 = a1;
  v13 = 2080;
  v14 = v7;
  v15 = 1026;
  v16 = v8;
  _os_log_error_impl(&dword_2149F4000, v6, OS_LOG_TYPE_ERROR, "%{public}s: contentURL:%{public}@ Failed to issue sandbox extension for '%s' with error %{public}d", (uint8_t *)&v9, 0x26u);

}

@end
