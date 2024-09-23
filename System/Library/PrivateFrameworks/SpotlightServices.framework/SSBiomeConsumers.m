@implementation SSBiomeConsumers

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_7 != -1)
    dispatch_once(&sharedInstance_onceToken_7, &__block_literal_global_35);
  return (id)sharedInstance_sharedInstance_3;
}

void __34__SSBiomeConsumers_sharedInstance__block_invoke()
{
  SSBiomeConsumers *v0;
  void *v1;

  v0 = objc_alloc_init(SSBiomeConsumers);
  v1 = (void *)sharedInstance_sharedInstance_3;
  sharedInstance_sharedInstance_3 = (uint64_t)v0;

}

- (SSBiomeConsumers)init
{
  SSBiomeConsumers *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSArray *consumers;
  SSBiomeConsumers *v9;
  objc_super v11;
  _QWORD v12[5];

  v12[4] = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)SSBiomeConsumers;
  v2 = -[SSBiomeConsumers init](&v11, sel_init);
  if (v2 && +[SSBiomeConsumers enabled](SSBiomeConsumers, "enabled"))
  {
    +[SSAppInFocus sharedInstance](SSAppInFocus, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v3;
    +[SSAppIntent sharedInstance](SSAppIntent, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v12[1] = v4;
    +[SSMediaNowPlaying sharedInstance](SSMediaNowPlaying, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v12[2] = v5;
    +[SSSystemSettingsSearchTerms sharedInstance](SSSystemSettingsSearchTerms, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12[3] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 4);
    v7 = objc_claimAutoreleasedReturnValue();
    consumers = v2->_consumers;
    v2->_consumers = (NSArray *)v7;

    v9 = v2;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)start
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = self->_consumers;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "start", (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)stop
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = self->_consumers;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "stop", (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_consumers, 0);
}

@end
