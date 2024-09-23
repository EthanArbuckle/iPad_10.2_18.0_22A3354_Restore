@implementation PKPeerPaymentRecipientCache

+ (id)sharedCache
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__PKPeerPaymentRecipientCache_sharedCache__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_MergedGlobals_286 != -1)
    dispatch_once(&_MergedGlobals_286, block);
  return (id)qword_1ECF22C70;
}

void __42__PKPeerPaymentRecipientCache_sharedCache__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "__init");
  v2 = (void *)qword_1ECF22C70;
  qword_1ECF22C70 = v1;

}

- (PKPeerPaymentRecipientCache)init
{
  PKPeerPaymentRecipientCache *v3;

  objc_msgSend((id)objc_opt_class(), "sharedCache");
  v3 = (PKPeerPaymentRecipientCache *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__init
{
  PKPeerPaymentRecipientCache *v2;
  PKMapContainer *v3;
  PKMapContainer *mapContainer;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKPeerPaymentRecipientCache;
  v2 = -[PKPeerPaymentRecipientCache init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(PKMapContainer);
    mapContainer = v2->_mapContainer;
    v2->_mapContainer = v3;

    v2->_mapAccessLock._os_unfair_lock_opaque = 0;
    -[PKPeerPaymentRecipientCache _updateMapsFromDisk](v2, "_updateMapsFromDisk");
    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:suspensionBehavior:", v2, sel__handlePurgedNotification_, CFSTR("PKDistributedNotificationPeerPaymentRecipientCachePurged"), 0, 2);

    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:suspensionBehavior:", v2, sel__handleDiskMapChangedNotification_, CFSTR("PKDistributedNotificationPeerPaymentRecipientCacheWrittenToDisk"), 0, 2);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)PKPeerPaymentRecipientCache;
  -[PKPeerPaymentRecipientCache dealloc](&v4, sel_dealloc);
}

- (id)recipientForRecipientAddress:(id)a3
{
  void *v4;
  os_unfair_lock_s *p_mapAccessLock;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  PKIDSNormalizedAddress(a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    p_mapAccessLock = &self->_mapAccessLock;
    os_unfair_lock_lock(&self->_mapAccessLock);
    -[PKPeerPaymentRecipientCache _keyForRecipientAddress:](self, "_keyForRecipientAddress:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKMapContainer recipientMap](self->_mapContainer, "recipientMap");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v8, "hasExpired") & 1) != 0)
    {
      -[PKMapContainer recipientMap](self->_mapContainer, "recipientMap");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "removeObjectForKey:", v6);
      v10 = 0;
    }
    else
    {
      objc_msgSend(v8, "item");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v9, "copy");
    }

    os_unfair_lock_unlock(p_mapAccessLock);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)cacheRecipient:(id)a3 forRecipientAddress:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  PKCacheRecipientItem *v10;
  id v11;

  v11 = a3;
  PKIDSNormalizedAddress(a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11 && v6)
  {
    os_unfair_lock_lock(&self->_mapAccessLock);
    -[PKPeerPaymentRecipientCache _keyForRecipientAddress:](self, "_keyForRecipientAddress:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "cacheableCopy");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKMapContainer recipientMap](self->_mapContainer, "recipientMap");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[PKCacheRecipientItem initWithItem:]([PKCacheRecipientItem alloc], "initWithItem:", v8);
    objc_msgSend(v9, "setObject:forKey:", v10, v7);

    -[PKPeerPaymentRecipientCache _locked_setMapNeedsWrite](self, "_locked_setMapNeedsWrite");
    os_unfair_lock_unlock(&self->_mapAccessLock);

  }
}

- (void)purgeRecipientWithRecipientAddress:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  PKIDSNormalizedAddress(a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    os_unfair_lock_lock(&self->_mapAccessLock);
    -[PKPeerPaymentRecipientCache _keyForRecipientAddress:](self, "_keyForRecipientAddress:", v6);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKMapContainer recipientMap](self->_mapContainer, "recipientMap");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObjectForKey:", v4);

    -[PKPeerPaymentRecipientCache _locked_setMapNeedsWrite](self, "_locked_setMapNeedsWrite");
    os_unfair_lock_unlock(&self->_mapAccessLock);

  }
}

- (BOOL)purgeCache
{
  os_unfair_lock_s *p_mapAccessLock;
  void *v4;
  void *v5;

  p_mapAccessLock = &self->_mapAccessLock;
  os_unfair_lock_lock(&self->_mapAccessLock);
  -[PKMapContainer removeAllObjects](self->_mapContainer, "removeAllObjects");
  os_unfair_lock_unlock(p_mapAccessLock);
  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_instanceName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("PKDistributedNotificationPeerPaymentRecipientCachePurged"), v5);

  return -[PKPeerPaymentRecipientCache _writeMapToDisk](self, "_writeMapToDisk");
}

- (BOOL)lowFrequencyDeviceScoreSubmissionRequiredForRecipientAddress:(id)a3
{
  void *v4;
  os_unfair_lock_s *p_mapAccessLock;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;

  PKIDSNormalizedAddress(a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    p_mapAccessLock = &self->_mapAccessLock;
    os_unfair_lock_lock(&self->_mapAccessLock);
    -[PKPeerPaymentRecipientCache _keyForRecipientAddress:](self, "_keyForRecipientAddress:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKMapContainer scoreMap](self->_mapContainer, "scoreMap");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8 && !objc_msgSend(v8, "hasExpired"))
    {
      v10 = 0;
    }
    else
    {
      -[PKMapContainer scoreMap](self->_mapContainer, "scoreMap");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "removeObjectForKey:", v6);

      -[PKPeerPaymentRecipientCache _locked_setMapNeedsWrite](self, "_locked_setMapNeedsWrite");
      v10 = 1;
    }
    os_unfair_lock_unlock(p_mapAccessLock);

  }
  else
  {
    v10 = 1;
  }

  return v10;
}

- (void)noteSubmittedLowFrequencyDeviceScoreForRecipientAddress:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  PKCacheScoreItem *v9;
  id v10;

  PKIDSNormalizedAddress(a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v10 = v4;
    os_unfair_lock_lock(&self->_mapAccessLock);
    -[PKPeerPaymentRecipientCache _keyForRecipientAddress:](self, "_keyForRecipientAddress:", v10);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKMapContainer scoreMap](self->_mapContainer, "scoreMap");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      -[PKMapContainer scoreMap](self->_mapContainer, "scoreMap");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_alloc_init(PKCacheScoreItem);
      objc_msgSend(v8, "setObject:forKey:", v9, v5);

      -[PKPeerPaymentRecipientCache _locked_setMapNeedsWrite](self, "_locked_setMapNeedsWrite");
    }
    os_unfair_lock_unlock(&self->_mapAccessLock);

    v4 = v10;
  }

}

- (id)_keyForRecipientAddress:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PKPeerPaymentRecipientCache:%@"), a3);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dataUsingEncoding:", 4);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "SHA256Hash");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hexEncoding");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (BOOL)_canReadMap
{
  id v3;

  if (_canReadMap___readAccess)
    return 1;
  PKPeerPaymentRecipientCacheArchivePath();
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  _canReadMap___readAccess = access((const char *)objc_msgSend(v3, "UTF8String"), 4) == 0;

  return _canReadMap___readAccess != 0;
}

- (BOOL)_canWriteMap
{
  void *v3;
  void *v4;
  id v5;

  if (_canWriteMap___writeAccess)
    return 1;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PKPeerPaymentRecipientCacheDirectoryPath();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v4, 1, 0, 0);

  PKPeerPaymentRecipientCacheDirectoryPath();
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  _canWriteMap___writeAccess = access((const char *)objc_msgSend(v5, "UTF8String"), 2) == 0;

  return _canWriteMap___writeAccess != 0;
}

- (void)_handlePurgedNotification:(id)a3
{
  void *v4;
  void *v5;
  char v6;

  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_instanceName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  if ((v6 & 1) == 0)
  {
    os_unfair_lock_lock(&self->_mapAccessLock);
    -[PKMapContainer removeAllObjects](self->_mapContainer, "removeAllObjects");
    os_unfair_lock_unlock(&self->_mapAccessLock);
  }
}

- (void)_handleDiskMapChangedNotification:(id)a3
{
  void *v4;
  void *v5;
  char v6;

  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_instanceName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  if ((v6 & 1) == 0)
    -[PKPeerPaymentRecipientCache _updateMapsFromDisk](self, "_updateMapsFromDisk");
}

- (void)_updateMapsFromDisk
{
  os_unfair_lock_s *p_mapAccessLock;
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  NSObject *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (-[PKPeerPaymentRecipientCache _canReadMap](self, "_canReadMap"))
  {
    p_mapAccessLock = &self->_mapAccessLock;
    os_unfair_lock_lock(&self->_mapAccessLock);
    PKPeerPaymentRecipientCacheArchivePath();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:options:error:", v4, 0, &v16);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v16;
    if (v5)
    {
      v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v5, 0);
      v8 = objc_opt_class();
      v9 = *MEMORY[0x1E0CB2CD0];
      v15 = v6;
      -[NSObject decodeTopLevelObjectOfClass:forKey:error:](v7, "decodeTopLevelObjectOfClass:forKey:error:", v8, v9, &v15);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v15;

      if (v10)
      {
        -[PKMapContainer updateWithContainer:](self->_mapContainer, "updateWithContainer:", v10);
      }
      else
      {
        PKLogFacilityTypeGetObject(0xBuLL);
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v18 = v4;
          v19 = 2112;
          v20 = v11;
          _os_log_impl(&dword_18FC92000, v13, OS_LOG_TYPE_DEFAULT, "Error: Failed to decode the peer payment recipient cache at path: %@ with error: %@. Removing file.", buf, 0x16u);
        }

        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "removeItemAtPath:error:", v4, 0);

      }
    }
    else
    {
      PKLogFacilityTypeGetObject(0xBuLL);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v18 = v4;
        v19 = 2112;
        v20 = v6;
        _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "Error: Failed to read peer payment recipient cache data from path: %@ with error: %@", buf, 0x16u);
      }
      v11 = v6;
    }

    os_unfair_lock_unlock(p_mapAccessLock);
  }
  else
  {
    PKLogFacilityTypeGetObject(0xBuLL);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      PKPeerPaymentRecipientCacheArchivePath();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v18 = v12;
      _os_log_impl(&dword_18FC92000, v11, OS_LOG_TYPE_DEFAULT, "Note: Unable to read from the peer payment recipient cache path: %@", buf, 0xCu);

    }
  }

}

- (void)_locked_setMapNeedsWrite
{
  NSTimer *v3;
  NSTimer *mapNeedsWriteTimer;
  void *v5;
  _QWORD v6[5];

  if (!self->_mapNeedsWriteTimer)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __55__PKPeerPaymentRecipientCache__locked_setMapNeedsWrite__block_invoke;
    v6[3] = &unk_1E2ADC668;
    v6[4] = self;
    objc_msgSend(MEMORY[0x1E0C99E88], "timerWithTimeInterval:repeats:block:", 0, v6, 3.0);
    v3 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    mapNeedsWriteTimer = self->_mapNeedsWriteTimer;
    self->_mapNeedsWriteTimer = v3;

    objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addTimer:forMode:", self->_mapNeedsWriteTimer, *MEMORY[0x1E0C99860]);

  }
}

uint64_t __55__PKPeerPaymentRecipientCache__locked_setMapNeedsWrite__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_writeMapToDisk");
}

- (BOOL)_writeMapToDisk
{
  os_unfair_lock_s *p_mapAccessLock;
  NSTimer *mapNeedsWriteTimer;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  BOOL v9;
  NSObject *v10;
  NSObject *v11;
  int v13;
  NSObject *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  p_mapAccessLock = &self->_mapAccessLock;
  os_unfair_lock_lock(&self->_mapAccessLock);
  -[NSTimer invalidate](self->_mapNeedsWriteTimer, "invalidate");
  mapNeedsWriteTimer = self->_mapNeedsWriteTimer;
  self->_mapNeedsWriteTimer = 0;

  if (-[PKPeerPaymentRecipientCache _canWriteMap](self, "_canWriteMap"))
  {
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self->_mapContainer, 1, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      PKPeerPaymentRecipientCacheArchivePath();
      v6 = objc_claimAutoreleasedReturnValue();
      if (-[NSObject writeToFile:atomically:](v5, "writeToFile:atomically:", v6, 1))
      {
        objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)objc_opt_class(), "_instanceName");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "postNotificationName:object:", CFSTR("PKDistributedNotificationPeerPaymentRecipientCacheWrittenToDisk"), v8);

        v9 = 1;
LABEL_14:

        goto LABEL_15;
      }
      PKLogFacilityTypeGetObject(0xBuLL);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v13 = 138412290;
        v14 = v6;
        _os_log_impl(&dword_18FC92000, v11, OS_LOG_TYPE_DEFAULT, "Error: Failed to write peer payment recipient cache to path: %@", (uint8_t *)&v13, 0xCu);
      }

    }
    else
    {
      PKLogFacilityTypeGetObject(0xBuLL);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v13) = 0;
        _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "Error: Failed to write nil peer payment recipient cache.", (uint8_t *)&v13, 2u);
      }
    }
    v9 = 0;
    goto LABEL_14;
  }
  PKLogFacilityTypeGetObject(0xBuLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    PKPeerPaymentRecipientCacheArchivePath();
    v10 = objc_claimAutoreleasedReturnValue();
    v13 = 138412290;
    v14 = v10;
    _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "Note: Unable to write to the peer payment recipient cache at path: %@", (uint8_t *)&v13, 0xCu);

  }
  v9 = 0;
LABEL_15:

  os_unfair_lock_unlock(p_mapAccessLock);
  return v9;
}

+ (id)_instanceName
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__PKPeerPaymentRecipientCache__instanceName__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ECF22C80 != -1)
    dispatch_once(&qword_1ECF22C80, block);
  return (id)qword_1ECF22C78;
}

void __44__PKPeerPaymentRecipientCache__instanceName__block_invoke()
{
  void *v0;
  objc_class *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v0 = (void *)MEMORY[0x1E0CB3940];
  v1 = (objc_class *)objc_opt_class();
  NSStringFromClass(v1);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("%@-%i"), v4, PKGetMyPid());
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1ECF22C78;
  qword_1ECF22C78 = v2;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapNeedsWriteTimer, 0);
  objc_storeStrong((id *)&self->_mapContainer, 0);
}

@end
