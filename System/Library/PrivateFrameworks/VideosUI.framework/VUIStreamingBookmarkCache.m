@implementation VUIStreamingBookmarkCache

- (void)resumeTimeInfoForReferenceID:(id)a3 outAbsoluteResumeTime:(id *)a4 outAbsoluteTimestamp:(id *)a5 outMainContentRelativeResumeTime:(id *)a6 outMainContentRelativeTimestamp:(id *)a7
{
  id v12;
  void *v13;
  NSMutableDictionary *bookmarkCacheStore;
  VUIStreamingBookmarkCache *v15;
  NSMutableDictionary *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  const char *v23;
  uint8_t v24[16];
  _QWORD v25[4];
  id v26;
  uint8_t *v27;
  uint8_t buf[8];
  uint8_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v12 = a3;
  v13 = v12;
  if (a4)
    *a4 = 0;
  if (a5)
    *a5 = 0;
  if (a6)
    *a6 = 0;
  if (a7)
    *a7 = 0;
  if (v12)
  {
    bookmarkCacheStore = self->_bookmarkCacheStore;
    if (bookmarkCacheStore && -[NSMutableDictionary count](bookmarkCacheStore, "count"))
    {
      *(_QWORD *)buf = 0;
      v29 = buf;
      v30 = 0x3032000000;
      v31 = __Block_byref_object_copy__5;
      v32 = __Block_byref_object_dispose__5;
      v33 = 0;
      v15 = self;
      objc_sync_enter(v15);
      v16 = self->_bookmarkCacheStore;
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __166__VUIStreamingBookmarkCache_resumeTimeInfoForReferenceID_outAbsoluteResumeTime_outAbsoluteTimestamp_outMainContentRelativeResumeTime_outMainContentRelativeTimestamp___block_invoke;
      v25[3] = &unk_1E9F9BC58;
      v27 = buf;
      v26 = v13;
      -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v16, "enumerateKeysAndObjectsUsingBlock:", v25);

      objc_sync_exit(v15);
      v17 = (void *)*((_QWORD *)v29 + 5);
      if (v17)
      {
        if (a4)
        {
          objc_msgSend(v17, "absoluteResumeTime");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          *a4 = (id)objc_msgSend(v18, "copy");

        }
        if (a5)
        {
          objc_msgSend(*((id *)v29 + 5), "absoluteBookmarkTimestamp");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          *a5 = (id)objc_msgSend(v19, "copy");

        }
        if (a6)
        {
          objc_msgSend(*((id *)v29 + 5), "relativeResumeTime");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *a6 = (id)objc_msgSend(v20, "copy");

        }
        if (!a7)
          goto LABEL_30;
        objc_msgSend(*((id *)v29 + 5), "relativeBookmarkTimestamp");
        v21 = objc_claimAutoreleasedReturnValue();
        *a7 = -[NSObject copy](v21, "copy");
      }
      else
      {
        VUIDefaultLogObject();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v24 = 0;
          _os_log_impl(&dword_1D96EE000, v21, OS_LOG_TYPE_DEFAULT, "VUIStreamingBookmarkCache - Reference ID not found", v24, 2u);
        }
      }

LABEL_30:
      _Block_object_dispose(buf, 8);

      goto LABEL_31;
    }
    VUIDefaultLogObject();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v23 = "VUIStreamingBookmarkCache - Empty bookmark cache store";
LABEL_25:
      _os_log_impl(&dword_1D96EE000, v22, OS_LOG_TYPE_DEFAULT, v23, buf, 2u);
    }
  }
  else
  {
    VUIDefaultLogObject();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v23 = "VUIStreamingBookmarkCache - resumeTimeInfoForReferenceID: referenceID or canonicalID is nil";
      goto LABEL_25;
    }
  }

LABEL_31:
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_6 != -1)
    dispatch_once(&sharedInstance_onceToken_6, &__block_literal_global_37);
  return (id)sharedInstance_singleton;
}

void __43__VUIStreamingBookmarkCache_sharedInstance__block_invoke()
{
  VUIStreamingBookmarkCache *v0;
  void *v1;

  v0 = objc_alloc_init(VUIStreamingBookmarkCache);
  v1 = (void *)sharedInstance_singleton;
  sharedInstance_singleton = (uint64_t)v0;

}

- (VUIStreamingBookmarkCache)init
{
  VUIStreamingBookmarkCache *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *bookmarkCacheStore;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VUIStreamingBookmarkCache;
  v2 = -[VUIStreamingBookmarkCache init](&v7, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    bookmarkCacheStore = v2->_bookmarkCacheStore;
    v2->_bookmarkCacheStore = v3;

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", v2, sel__activeAccountChangedNotification_, *MEMORY[0x1E0DAF710], 0);

  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)VUIStreamingBookmarkCache;
  -[VUIStreamingBookmarkCache dealloc](&v4, sel_dealloc);
}

void __166__VUIStreamingBookmarkCache_resumeTimeInfoForReferenceID_outAbsoluteResumeTime_outAbsoluteTimestamp_outMainContentRelativeResumeTime_outMainContentRelativeTimestamp___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(a3, "objectForKey:", *(_QWORD *)(a1 + 32));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    *a4 = 1;
}

- (void)addBookmarkForReferenceID:(id)a3 canonicalID:(id)a4 absoluteResumeTime:(id)a5 absoluteBookmarkTimestamp:(id)a6 relativeResumeTime:(id)a7 relativeBookmarkTimestamp:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  VUIStreamingBookmark *v20;
  VUIStreamingBookmarkCache *v21;
  id v22;
  uint8_t v23[16];

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  if (v14 && v15)
  {
    v20 = -[VUIStreamingBookmark initWithAbsoluteResumeTime:absoluteTimestamp:relativeResumeTime:relativeBookmarkTimestamp:]([VUIStreamingBookmark alloc], "initWithAbsoluteResumeTime:absoluteTimestamp:relativeResumeTime:relativeBookmarkTimestamp:", v16, v17, v18, v19);
    v21 = self;
    objc_sync_enter(v21);
    if (v20)
    {
      -[NSMutableDictionary objectForKey:](v21->_bookmarkCacheStore, "objectForKey:", v15);
      v22 = (id)objc_claimAutoreleasedReturnValue();
      if (!v22)
        v22 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      objc_msgSend(v22, "setObject:forKey:", v20, v14);
      -[NSMutableDictionary setObject:forKey:](v21->_bookmarkCacheStore, "setObject:forKey:", v22, v15);

    }
    objc_sync_exit(v21);

  }
  else
  {
    VUIDefaultLogObject();
    v20 = (VUIStreamingBookmark *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v20->super, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v23 = 0;
      _os_log_impl(&dword_1D96EE000, &v20->super, OS_LOG_TYPE_DEFAULT, "VUIStreamingBookmarkCache - Unable to add bookmark because referenceID or canonicalID is nil", v23, 2u);
    }
  }

}

- (void)removeBookmarkForReferenceID:(id)a3
{
  id v4;
  VUIStreamingBookmarkCache *v5;
  NSMutableDictionary *bookmarkCacheStore;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  if (v4)
  {
    v7 = v4;
    v5 = self;
    objc_sync_enter(v5);
    bookmarkCacheStore = v5->_bookmarkCacheStore;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __58__VUIStreamingBookmarkCache_removeBookmarkForReferenceID___block_invoke;
    v8[3] = &unk_1E9F9BC80;
    v9 = v7;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](bookmarkCacheStore, "enumerateKeysAndObjectsUsingBlock:", v8);

    objc_sync_exit(v5);
    v4 = v7;
  }

}

void __58__VUIStreamingBookmarkCache_removeBookmarkForReferenceID___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "objectForKey:", *(_QWORD *)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v7, "removeObjectForKey:", *(_QWORD *)(a1 + 32));
    *a4 = 1;
  }

}

- (void)removeBookmarkForCanonicalID:(id)a3
{
  id v4;
  VUIStreamingBookmarkCache *v5;
  id v6;

  v4 = a3;
  if (v4)
  {
    v6 = v4;
    v5 = self;
    objc_sync_enter(v5);
    -[NSMutableDictionary removeObjectForKey:](v5->_bookmarkCacheStore, "removeObjectForKey:", v6);
    objc_sync_exit(v5);

    v4 = v6;
  }

}

- (void)_activeAccountChangedNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  VUIStreamingBookmarkCache *v8;
  uint8_t v9[16];

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ams_activeiTunesAccount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    VUIDefaultLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1D96EE000, v7, OS_LOG_TYPE_DEFAULT, "VUIStreamingBookmarkCache - User signs out. clear cached bookmarks", v9, 2u);
    }

    v8 = self;
    objc_sync_enter(v8);
    -[NSMutableDictionary removeAllObjects](v8->_bookmarkCacheStore, "removeAllObjects");
    objc_sync_exit(v8);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bookmarkCacheStore, 0);
}

@end
