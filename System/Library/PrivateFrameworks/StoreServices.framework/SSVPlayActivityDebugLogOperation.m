@implementation SSVPlayActivityDebugLogOperation

- (void)main
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  SSVPlayActivityFeedSerialization *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[SSVPlayActivityDebugLogOperation playActivityEvents](self, "playActivityEvents");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
  {
    NSTemporaryDirectory();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("com.apple.PlayActivityFeed"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v4, 1, 0, 0);
    v18 = v4;
    objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("PlayActivityEvents.log"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E48], "outputStreamToFileAtPath:append:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "open");
    objc_msgSend(CFSTR("\n-----------------------------------------\n"), "dataUsingEncoding:", 4);
    v19 = (id)objc_claimAutoreleasedReturnValue();
    v6 = objc_alloc_init(SSVPlayActivityFeedSerialization);
    +[SSDevice currentDevice](SSDevice, "currentDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "storeFrontIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSVPlayActivityFeedSerialization setCurrentStoreFrontID:](v6, "setCurrentStoreFrontID:", v8);

    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v9 = v2;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v21 != v12)
            objc_enumerationMutation(v9);
          -[SSVPlayActivityFeedSerialization propertyListObjectWithPlayActivityEvent:](v6, "propertyListObjectWithPlayActivityEvent:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14
            && objc_msgSend(MEMORY[0x1E0CB38B0], "writePropertyList:toStream:format:options:error:", v14, v5, 100, 0, 0) >= 1)
          {
            v15 = objc_retainAutorelease(v19);
            objc_msgSend(v5, "write:maxLength:", objc_msgSend(v15, "bytes"), objc_msgSend(v15, "length"));
          }

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v11);
    }

    objc_msgSend(v5, "close");
  }

}

- (NSArray)playActivityEvents
{
  return self->_playActivityEvents;
}

- (void)setPlayActivityEvents:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 248);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playActivityEvents, 0);
}

@end
