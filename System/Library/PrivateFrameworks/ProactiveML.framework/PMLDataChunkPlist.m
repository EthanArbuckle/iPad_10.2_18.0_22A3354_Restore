@implementation PMLDataChunkPlist

- (id)plist
{
  PMLDataChunkPlist *v2;
  NSData *backingData;
  uint64_t v4;
  id v5;
  id plist;
  NSObject *v7;
  id v8;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_parsed)
  {
    backingData = v2->super._backingData;
    v10 = 0;
    objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", backingData, 0, 0, &v10);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = v10;
    plist = v2->_plist;
    v2->_plist = (id)v4;

    if (!v2->_plist)
    {
      PML_LogHandle();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v12 = v5;
        _os_log_error_impl(&dword_2159BB000, v7, OS_LOG_TYPE_ERROR, "Error loading plist chunk: %@", buf, 0xCu);
      }

    }
  }
  v8 = v2->_plist;
  objc_sync_exit(v2);

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_plist, 0);
}

+ (unsigned)dataChunkType
{
  return 1;
}

+ (id)chunkWithPlist:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  NSObject *v6;
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v8 = 0;
  objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", a3, 200, 0, &v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v8;
  if (v3)
  {
    v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithData:", v3);
  }
  else
  {
    PML_LogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v10 = v4;
      _os_log_error_impl(&dword_2159BB000, v6, OS_LOG_TYPE_ERROR, "Error writing plist chunk: %@", buf, 0xCu);
    }

    v5 = 0;
  }

  return v5;
}

@end
