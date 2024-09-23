@implementation UNSImageProvider

+ (id)imageDataForContentURL:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  const __CFString *v10;
  char v11;
  NSObject *v12;
  int v14;
  const char *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  _BOOL4 v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    UNSLogImageProvider();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 136446210;
      v15 = "+[UNSImageProvider imageDataForContentURL:]";
      _os_log_impl(&dword_249B71000, v12, OS_LOG_TYPE_DEFAULT, "%{public}s: contentURL:nil", (uint8_t *)&v14, 0xCu);
    }
    v7 = 0;
    goto LABEL_19;
  }
  v6 = objc_msgSend(v4, "isFileURL");
  if (!v6)
    goto LABEL_13;
  objc_msgSend(a1, "_imageDataFromFileSystemForContactURL:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  UNSLogImageProvider();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 136446722;
    v15 = "+[UNSImageProvider imageDataForContentURL:]";
    v16 = 2114;
    v17 = v5;
    v18 = 1026;
    LODWORD(v19) = v7 != 0;
    _os_log_impl(&dword_249B71000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s: contentURL:%{public}@ Trying to fetch from file system FIRST. Success:%{public}d", (uint8_t *)&v14, 0x1Cu);
  }

  if (!v7)
  {
LABEL_13:
    objc_msgSend(a1, "_imageDataFromIntentsForContentURL:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    UNSLogImageProvider();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = CFSTR("FIRST");
      v14 = 136446978;
      v15 = "+[UNSImageProvider imageDataForContentURL:]";
      if (v6)
        v10 = CFSTR("SECOND");
      v16 = 2114;
      v17 = v5;
      v18 = 2114;
      v19 = v10;
      v20 = 1026;
      v21 = v7 != 0;
      _os_log_impl(&dword_249B71000, v9, OS_LOG_TYPE_DEFAULT, "%{public}s: contentURL:%{public}@ Trying to fetch from intents %{public}@. Success:%{public}d", (uint8_t *)&v14, 0x26u);
    }

    v11 = v7 ? 1 : v6;
    if ((v11 & 1) == 0)
    {
      objc_msgSend(a1, "_imageDataFromFileSystemForContactURL:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      UNSLogImageProvider();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v14 = 136446722;
        v15 = "+[UNSImageProvider imageDataForContentURL:]";
        v16 = 2114;
        v17 = v5;
        v18 = 1026;
        LODWORD(v19) = v7 != 0;
        _os_log_impl(&dword_249B71000, v12, OS_LOG_TYPE_DEFAULT, "%{public}s: contentURL:%{public}@ Trying to fetch from file system SECOND. Success:%{public}d", (uint8_t *)&v14, 0x1Cu);
      }
LABEL_19:

    }
  }

  return v7;
}

+ (id)generateEphemeralContactsForImageRenderingWithContext:(id)a3 bundleIdentifier:(id)a4 descriptorForRequiredKeys:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  int v20;
  NSObject *v21;
  _BOOL4 v22;
  void *v23;
  void *v24;
  void *v26;
  void *v27;
  void *v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  UNSLogImageProvider();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "un_logDigest");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v30 = v9;
    v31 = 2082;
    v32 = "+[UNSImageProvider generateEphemeralContactsForImageRenderingWithContext:bundleIdentifier:descriptorForRequiredKeys:]";
    v33 = 2114;
    v34 = v13;
    _os_log_impl(&dword_249B71000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}s: Context identifier:%{public}@ Start getting contacts", buf, 0x20u);

  }
  if (v8)
  {
    objc_msgSend(a1, "_contactForImageRenderingFromContentURLWithContext:bundleIdentifier:", v8, v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      UNSLogImageProvider();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v8, "identifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "un_logDigest");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v30 = v9;
        v31 = 2082;
        v32 = "+[UNSImageProvider generateEphemeralContactsForImageRenderingWithContext:bundleIdentifier:descriptorForRequiredKeys:]";
        v33 = 2114;
        v34 = v17;
        _os_log_impl(&dword_249B71000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}s: Context identifier:%{public}@ Contact created from content URL", buf, 0x20u);

      }
      v28 = v14;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v28, 1);
      v18 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v20 = objc_msgSend(v9, "un_isFirstPartyIdentifier");
      UNSLogImageProvider();
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
      if (!v20)
      {
        if (v22)
        {
          objc_msgSend(v8, "identifier");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "un_logDigest");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v30 = v9;
          v31 = 2082;
          v32 = "+[UNSImageProvider generateEphemeralContactsForImageRenderingWithContext:bundleIdentifier:descriptorForRequiredKeys:]";
          v33 = 2114;
          v34 = v27;
          _os_log_impl(&dword_249B71000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}s: Context identifier:%{public}@ No contact created because no data found content URL provided", buf, 0x20u);

        }
        v19 = (void *)MEMORY[0x24BDBD1A8];
        goto LABEL_14;
      }
      if (v22)
      {
        objc_msgSend(v8, "identifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "un_logDigest");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v30 = v9;
        v31 = 2082;
        v32 = "+[UNSImageProvider generateEphemeralContactsForImageRenderingWithContext:bundleIdentifier:descriptorForRequiredKeys:]";
        v33 = 2114;
        v34 = v24;
        _os_log_impl(&dword_249B71000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}s: Context identifier:%{public}@ Contacts created from recipients for snowglobe (1st party only)", buf, 0x20u);

      }
      objc_msgSend(a1, "_contactsForImageRenderingFromRecipientsWithContext:bundleIdentifier:descriptorForRequiredKeys:", v8, v9, v10);
      v18 = objc_claimAutoreleasedReturnValue();
    }
    v19 = (void *)v18;
LABEL_14:

    goto LABEL_15;
  }
  v19 = (void *)MEMORY[0x24BDBD1A8];
LABEL_15:

  return v19;
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
  NSObject *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  id v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  _BYTE v29[18];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  UNSLogImageProvider();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v25 = "+[UNSImageProvider _imageDataFromIntentsForContentURL:]";
    v26 = 2114;
    v27 = v3;
    _os_log_impl(&dword_249B71000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s: contentURL:%{public}@ Starting Read", buf, 0x16u);
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
      objc_msgSend(MEMORY[0x24BDBCE60], "now");
      v18 = objc_claimAutoreleasedReturnValue();
      -[NSObject timeIntervalSinceDate:](v18, "timeIntervalSinceDate:", v4);
      v20 = v19;
      UNSLogImageProvider();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446978;
        v25 = "+[UNSImageProvider _imageDataFromIntentsForContentURL:]";
        v26 = 2114;
        v27 = v3;
        v28 = 1026;
        *(_DWORD *)v29 = v8 != 0;
        *(_WORD *)&v29[4] = 2050;
        *(_QWORD *)&v29[6] = v20;
        _os_log_impl(&dword_249B71000, v21, OS_LOG_TYPE_DEFAULT, "%{public}s: contentURL:%{public}@ Ending Read. Success:%{public}d. Finished in:%{public}f milliseconds", buf, 0x26u);
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
        UNSLogImageProvider();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          +[UNSImageProvider _imageDataFromIntentsForContentURL:].cold.2((uint64_t)v3, v10, v15);
        v8 = 0;
        goto LABEL_19;
      }
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:", v11, strlen(v11) + 1, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_setSandboxExtensionData:", v12);

    }
    objc_msgSend(MEMORY[0x24BDD9DB8], "sharedConnection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0;
    objc_msgSend(v13, "loadDataImageFromImage:scaledSize:error:", v7, &v23, *MEMORY[0x24BDD98F8], *(double *)(MEMORY[0x24BDD98F8] + 8));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v23;

    if (!v14 || v15)
    {
      UNSLogImageProvider();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446978;
        v25 = "+[UNSImageProvider _imageDataFromIntentsForContentURL:]";
        v26 = 2114;
        v27 = v3;
        v28 = 2114;
        *(_QWORD *)v29 = v7;
        *(_WORD *)&v29[8] = 2114;
        *(_QWORD *)&v29[10] = v15;
        _os_log_error_impl(&dword_249B71000, v16, OS_LOG_TYPE_ERROR, "%{public}s: contentURL:%{public}@ Failed to fetch icon data from INImage %{public}@ with error %{public}@", buf, 0x2Au);
      }
      v8 = 0;
    }
    else
    {
      objc_msgSend(v14, "_imageData");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      UNSLogImageProvider();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v7, "_identifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136446722;
        v25 = "+[UNSImageProvider _imageDataFromIntentsForContentURL:]";
        v26 = 2114;
        v27 = v3;
        v28 = 2114;
        *(_QWORD *)v29 = v17;
        _os_log_impl(&dword_249B71000, v16, OS_LOG_TYPE_DEFAULT, "%{public}s: contentURL:%{public}@ Successfully fetched identity image with identifier '%{public}@'", buf, 0x20u);

      }
    }

LABEL_19:
    goto LABEL_20;
  }
  UNSLogImageProvider();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    +[UNSImageProvider _imageDataFromIntentsForContentURL:].cold.1((uint64_t)v3, v18);
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
  UNSLogImageProvider();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v16 = "+[UNSImageProvider _imageDataFromFileSystemForContactURL:]";
    v17 = 2114;
    v18 = v3;
    _os_log_impl(&dword_249B71000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s: contentURL:%{public}@ Starting Read", buf, 0x16u);
  }

  v14 = 0;
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:options:error:", v3, 1, &v14);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v14;
  if (v7)
  {
    UNSLogImageProvider();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      v16 = "+[UNSImageProvider _imageDataFromFileSystemForContactURL:]";
      v17 = 2114;
      v18 = v3;
      v19 = 2114;
      v20[0] = v7;
      _os_log_impl(&dword_249B71000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s: contentURL:%{public}@ Error reading image data %{public}@", buf, 0x20u);
    }

  }
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "timeIntervalSinceDate:", v4);
  v11 = v10;
  UNSLogImageProvider();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446978;
    v16 = "+[UNSImageProvider _imageDataFromFileSystemForContactURL:]";
    v17 = 2114;
    v18 = v3;
    v19 = 1026;
    LODWORD(v20[0]) = v6 != 0;
    WORD2(v20[0]) = 2050;
    *(_QWORD *)((char *)v20 + 6) = v11;
    _os_log_impl(&dword_249B71000, v12, OS_LOG_TYPE_DEFAULT, "%{public}s: contentURL:%{public}@ Ending Read. Success:%{public}d. Finished in:%{public}f milliseconds", buf, 0x26u);
  }

  return v6;
}

+ (id)_contactForImageRenderingFromContentURLWithContext:(id)a3 bundleIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  int v18;
  id v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  _BOOL4 v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  UNSLogImageProvider();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "un_logDigest");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "contentURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "contentURL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138544386;
    v19 = v7;
    v20 = 2082;
    v21 = "+[UNSImageProvider _contactForImageRenderingFromContentURLWithContext:bundleIdentifier:]";
    v22 = 2114;
    v23 = v10;
    v24 = 1026;
    v25 = v11 != 0;
    v26 = 2114;
    v27 = v12;
    _os_log_impl(&dword_249B71000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}s: Context identifier:%{public}@ Will attempt to get image data:%{public}d withURL:%{public}@", (uint8_t *)&v18, 0x30u);

  }
  objc_msgSend(v6, "contentURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    v14 = 0;
    goto LABEL_7;
  }
  objc_msgSend(a1, "imageDataForContentURL:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
LABEL_7:
    v15 = 0;
    goto LABEL_8;
  }
  v15 = objc_alloc_init(MEMORY[0x24BDBAD50]);
  objc_msgSend(v15, "setImageData:", v14);
LABEL_8:
  v16 = v15;

  return v16;
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
        +[UNSNotificationContactService sharedInstance](UNSNotificationContactService, "sharedInstance");
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

+ (void)_imageDataFromIntentsForContentURL:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 136446466;
  v3 = "+[UNSImageProvider _imageDataFromIntentsForContentURL:]";
  v4 = 2114;
  v5 = a1;
  _os_log_error_impl(&dword_249B71000, a2, OS_LOG_TYPE_ERROR, "%{public}s: contentURL:%{public}@ Failed to create an INIntent from url. Cannot proceed with loading data from INImageServiceConnection.", (uint8_t *)&v2, 0x16u);
}

+ (void)_imageDataFromIntentsForContentURL:(NSObject *)a3 .cold.2(uint64_t a1, id a2, NSObject *a3)
{
  uint64_t v5;
  int v6;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend(objc_retainAutorelease(a2), "fileSystemRepresentation");
  v6 = *__error();
  v7 = 136446978;
  v8 = "+[UNSImageProvider _imageDataFromIntentsForContentURL:]";
  v9 = 2114;
  v10 = a1;
  v11 = 2080;
  v12 = v5;
  v13 = 1026;
  v14 = v6;
  _os_log_error_impl(&dword_249B71000, a3, OS_LOG_TYPE_ERROR, "%{public}s: contentURL:%{public}@ Failed to issue sandbox extension for '%s' with error %{public}d", (uint8_t *)&v7, 0x26u);
}

@end
