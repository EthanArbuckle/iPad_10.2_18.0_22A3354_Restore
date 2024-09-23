@implementation SDLogArchiveUnit

+ (id)logArchiveUnitWithDictionary:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___SDLogArchiveUnit;
  v5 = objc_msgSend(objc_msgSendSuper2(&v9, "alloc"), "init");
  v6 = v5;
  if (v4 && v5)
  {
    v7 = objc_msgSend(v4, "mutableCopy");
    objc_msgSend(v6, "setArchive_arguments:", v7);

  }
  return v6;
}

- (void)logArchiveOverride:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  void *v27;
  _BYTE v28[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDLogArchiveUnit archive_arguments](self, "archive_arguments"));

  if (v5)
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v19 = v4;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v21 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDLogArchiveUnit archive_arguments](self, "archive_arguments"));
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v11));
          objc_msgSend(v12, "setValue:forKey:", v13, v11);

          v14 = sub_100026C34();
          v15 = objc_claimAutoreleasedReturnValue(v14);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v11));
            *(_DWORD *)buf = 138412546;
            v25 = v11;
            v26 = 2112;
            v27 = v16;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Updated %@ to %@", buf, 0x16u);

          }
          v17 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v11));
          objc_msgSend(v17, "logWithSubsystem:category:msg:", "com.apple.sysdiagnose", "containers", CFSTR("Updated %@ to %@"), v11, v18);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
      }
      while (v8);
    }

    v4 = v19;
  }

}

- (NSMutableDictionary)archive_arguments
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setArchive_arguments:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_archive_arguments, 0);
}

@end
