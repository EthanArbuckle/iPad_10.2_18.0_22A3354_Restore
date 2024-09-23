@implementation PLAssetsdClientService

- (void)addPhotoLibraryUnavailabilityHandler:(id)a3
{
  PLAssetsdClientService *v4;
  NSMutableArray *libraryUnavailabilityHandlers;
  NSMutableArray *v6;
  NSMutableArray *v7;
  void *v8;
  id v9;

  v9 = a3;
  v4 = self;
  objc_sync_enter(v4);
  libraryUnavailabilityHandlers = v4->_libraryUnavailabilityHandlers;
  if (!libraryUnavailabilityHandlers)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = v4->_libraryUnavailabilityHandlers;
    v4->_libraryUnavailabilityHandlers = v6;

    libraryUnavailabilityHandlers = v4->_libraryUnavailabilityHandlers;
  }
  v8 = (void *)MEMORY[0x19AEC3014](v9);
  -[NSMutableArray addObject:](libraryUnavailabilityHandlers, "addObject:", v8);

  objc_sync_exit(v4);
}

- (void)downloadStatusForIdentifier:(id)a3 progress:(double)a4 completed:(BOOL)a5 data:(id)a6 error:(id)a7
{
  _BOOL8 v8;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v8 = a5;
  v19 = a6;
  v12 = a7;
  v13 = (void *)MEMORY[0x1E0C99E08];
  v14 = a3;
  objc_msgSend(v13, "dictionary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v14, CFSTR("taskIdentifier"));

  if (a4 >= 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v16, CFSTR("progress"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v17, CFSTR("completed"));

  if (v12)
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v12, CFSTR("error"));
  if (v19)
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v19, CFSTR("data"));
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "postNotificationName:object:userInfo:", CFSTR("PLGatekeeperUpdateCPLDownloadStatusNotification"), self, v15);

}

- (void)libraryBecameUnavailable:(id)a3 reason:(id)a4
{
  id v6;
  id v7;
  PLAssetsdClientService *v8;
  NSMutableArray *v9;
  NSMutableArray *libraryUnavailabilityHandlers;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  v9 = v8->_libraryUnavailabilityHandlers;
  libraryUnavailabilityHandlers = v8->_libraryUnavailabilityHandlers;
  v8->_libraryUnavailabilityHandlers = 0;

  objc_sync_exit(v8);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v11 = v9;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v17;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(v11);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v15) + 16))(*(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v15));
        ++v15;
      }
      while (v13 != v15);
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v13);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_libraryUnavailabilityHandlers, 0);
}

@end
