@implementation SDAirDropHandlerNotes

- (SDAirDropHandlerNotes)initWithTransfer:(id)a3
{
  SDAirDropHandlerNotes *v3;
  SDAirDropHandlerNotes *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;
  void *v10;

  v9.receiver = self;
  v9.super_class = (Class)SDAirDropHandlerNotes;
  v3 = -[SDAirDropHandlerGenericFiles initWithTransfer:bundleIdentifier:](&v9, "initWithTransfer:bundleIdentifier:", a3, CFSTR("com.apple.mobilenotes"));
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler bundleProxy](v3, "bundleProxy"));

    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler bundleProxy](v4, "bundleProxy"));
      v10 = v6;
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v10, 1));
      -[SDAirDropHandlerGenericFiles setAvailableApplications:](v4, "setAvailableApplications:", v7);

    }
  }
  return v4;
}

- (BOOL)canHandleTransfer
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  if (!-[SDAirDropHandler isJustFiles](self, "isJustFiles"))
    return 0;
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer", 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "metaData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rawFiles"));

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    v9 = kSFOperationFileNameKey;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i), "objectForKeyedSubscript:", v9));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "pathExtension"));

        LODWORD(v11) = SFIsNote(v12);
        if (!(_DWORD)v11)
        {
          v13 = 0;
          goto LABEL_13;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v7)
        continue;
      break;
    }
  }
  v13 = 1;
LABEL_13:

  return v13;
}

- (int64_t)transferTypes
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SDAirDropHandlerNotes;
  return (unint64_t)-[SDAirDropHandlerGenericFiles transferTypes](&v3, "transferTypes") | 0x100;
}

- (id)suitableContentsDescription
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSString *v12;
  void *v13;
  uint64_t v15;
  const __CFString *v16;
  void *v17;
  void *v18;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler senderName](self, "senderName"));
  v4 = -[SDAirDropHandler totalSharedItemsCount](self, "totalSharedItemsCount");
  v16 = CFSTR("NOTE");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v4));
  v17 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1));
  v18 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v18, 1));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler alertMessageLocalizedKeyForTypeDicts:](self, "alertMessageLocalizedKeyForTypeDicts:", v7));

  LODWORD(v6) = -[SDAirDropHandler isModernProgress](self, "isModernProgress");
  v10 = SFLocalizedStringForKey(v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  if ((_DWORD)v6)
    v12 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v11, v4, v15);
  else
    v12 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v11, v3, v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  return v13;
}

- (void)updatePossibleActions
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)SDAirDropHandlerNotes;
  -[SDAirDropHandlerGenericFiles updatePossibleActions](&v2, "updatePossibleActions");
}

- (id)createDestination
{
  NSString *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  id v13;

  v3 = NSHomeDirectory();
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v4, 1));
  v13 = 0;
  v6 = sub_10019B6D4(v5, &v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = v13;

  if (!v7)
  {
    v10 = airdrop_log(v9);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_1000BDA20(self, (uint64_t)v8, v11);

  }
  return v7;
}

+ (id)extractNotesURLs:(id)a3
{
  id v3;
  NSMutableArray *v4;
  id v5;
  id v6;
  __int128 v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  void *v31;
  _BYTE v32[128];

  v3 = a3;
  v4 = objc_opt_new(NSMutableArray);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v25;
    *(_QWORD *)&v7 = 136315394;
    v23 = v7;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v25 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager", v23, (_QWORD)v24));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "path"));
        v14 = objc_msgSend(v12, "fileExistsAtPath:", v13);

        if (v14)
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "absoluteString"));
          v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "pathExtension"));

          v18 = SFIsNote(v17);
          if ((v18 & 1) != 0)
          {
            -[NSMutableArray addObject:](v4, "addObject:", v11);
          }
          else
          {
            v20 = airdrop_log(v18);
            v21 = objc_claimAutoreleasedReturnValue(v20);
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v23;
              v29 = "+[SDAirDropHandlerNotes extractNotesURLs:]";
              v30 = 2112;
              v31 = v11;
              _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "### %s - dropped URL:[%@]", buf, 0x16u);
            }

          }
        }
        else
        {
          v19 = airdrop_log(v15);
          v17 = objc_claimAutoreleasedReturnValue(v19);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = v23;
            v29 = "+[SDAirDropHandlerNotes extractNotesURLs:]";
            v30 = 2112;
            v31 = v11;
            _os_log_fault_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_FAULT, "### %s -- URL does not exist on filesystem:[%@]", buf, 0x16u);
          }
        }

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    }
    while (v8);
  }

  return v4;
}

- (id)defaultOpenActionBundleID
{
  return 0;
}

@end
