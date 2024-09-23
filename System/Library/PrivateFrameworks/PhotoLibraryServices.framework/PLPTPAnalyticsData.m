@implementation PLPTPAnalyticsData

- (PLPTPAnalyticsData)init
{
  PLPTPAnalyticsData *v2;
  void *v3;
  uint64_t v4;
  NSString *uuid;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PLPTPAnalyticsData;
  v2 = -[PLPTPAnalyticsData init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "UUIDString");
    v4 = objc_claimAutoreleasedReturnValue();
    uuid = v2->_uuid;
    v2->_uuid = (NSString *)v4;

  }
  return v2;
}

- (void)updateWithPlatformInformation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSString *v7;
  void *v8;
  void *v9;
  _QWORD *v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  id *v17;
  id v18;
  NSString *vendor;
  id v20;
  NSString *platform;
  id v22;
  NSString *v23;
  NSString *platformVersion;
  NSString *v25;
  NSString *buildVersion;
  NSString *v27;
  NSString *transport;
  void *v29;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v29 = v4;
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D75490]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v29;
    if (!v6 || (v7 = self->_vendor, v6, v5 = v29, !v7))
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D754E0]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      v10 = (_QWORD *)MEMORY[0x1E0D754E8];
      if (!v8
        || (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0D754E8]) & 1) == 0
        && (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0D754F0]) & 1) == 0)
      {
        v11 = (id)*MEMORY[0x1E0D754F8];

        v9 = v11;
      }
      objc_msgSend(v29, "objectForKeyedSubscript:", *MEMORY[0x1E0D754B8]);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)v12;
      v14 = *MEMORY[0x1E0D754C8];
      if (v12)
        v15 = (void *)v12;
      else
        v15 = (void *)*MEMORY[0x1E0D754C8];
      v16 = v15;

      if (!objc_msgSend(v16, "isEqualToString:", v14))
        goto LABEL_17;
      if ((objc_msgSend(v9, "isEqualToString:", *v10) & 1) != 0)
      {
        v17 = (id *)MEMORY[0x1E0D754C0];
      }
      else
      {
        if (!objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0D754F0]))
        {
LABEL_17:
          vendor = self->_vendor;
          self->_vendor = (NSString *)v9;
          v20 = v9;

          platform = self->_platform;
          self->_platform = (NSString *)v16;
          v22 = v16;

          objc_msgSend(v29, "objectForKeyedSubscript:", *MEMORY[0x1E0D75500]);
          v23 = (NSString *)objc_claimAutoreleasedReturnValue();
          platformVersion = self->_platformVersion;
          self->_platformVersion = v23;

          objc_msgSend(v29, "objectForKeyedSubscript:", *MEMORY[0x1E0D754B0]);
          v25 = (NSString *)objc_claimAutoreleasedReturnValue();
          buildVersion = self->_buildVersion;
          self->_buildVersion = v25;

          objc_msgSend(v29, "objectForKeyedSubscript:", *MEMORY[0x1E0D754D8]);
          v27 = (NSString *)objc_claimAutoreleasedReturnValue();
          transport = self->_transport;
          self->_transport = v27;

          v5 = v29;
          goto LABEL_18;
        }
        v17 = (id *)MEMORY[0x1E0D754D0];
      }
      v18 = *v17;

      v16 = v18;
      goto LABEL_17;
    }
  }
LABEL_18:

}

- (void)incrementConversionCountForAssetType:(signed __int16)a3
{
  int v3;
  NSObject *v4;
  _DWORD v5[2];
  uint64_t v6;

  v3 = a3;
  v6 = *MEMORY[0x1E0C80C00];
  if ((a3 - 2) < 2)
  {
    PLPTPGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5[0] = 67109120;
      v5[1] = v3;
      _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_ERROR, "Unexpected asset type for transcode: %d", (uint8_t *)v5, 8u);
    }

  }
  else if (a3 == 1)
  {
    ++self->_videoTranscodedCount;
  }
  else if (!a3)
  {
    ++self->_imageTranscodedCount;
  }
}

- (id)cplStateString
{
  int64_t cplState;
  const __CFString *v3;

  cplState = self->_cplState;
  v3 = CFSTR("Optimize Storage");
  if (cplState == 2)
    v3 = CFSTR("Keep Originals");
  if (cplState)
    return (id)v3;
  else
    return CFSTR("Off");
}

- (void)report
{
  NSObject *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  PLPTPAnalyticsData *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  PLPTPGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v13 = 138412290;
    v14 = self;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEBUG, "PTP Analytics:\n%@", (uint8_t *)&v13, 0xCu);
  }

  v4 = objc_alloc_init(MEMORY[0x1E0D731C0]);
  v5 = *MEMORY[0x1E0D73B70];
  objc_msgSend(v4, "setPayloadValue:forKey:onEventWithName:", self->_uuid, *MEMORY[0x1E0D73B80], *MEMORY[0x1E0D73B70]);
  objc_msgSend(v4, "setPayloadValue:forKey:onEventWithName:", self->_vendor, *MEMORY[0x1E0D73BB0], v5);
  objc_msgSend(v4, "setPayloadValue:forKey:onEventWithName:", self->_platform, *MEMORY[0x1E0D73BB8], v5);
  objc_msgSend(v4, "setPayloadValue:forKey:onEventWithName:", self->_platformVersion, *MEMORY[0x1E0D73BC0], v5);
  objc_msgSend(v4, "setPayloadValue:forKey:onEventWithName:", self->_transport, *MEMORY[0x1E0D73BC8], v5);
  -[PLPTPAnalyticsData cplStateString](self, "cplStateString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPayloadValue:forKey:onEventWithName:", v6, *MEMORY[0x1E0D73B78], v5);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_libraryAssetCount);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPayloadValue:forKey:onEventWithName:", v7, *MEMORY[0x1E0D73BA8], v5);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_deferredRenderCount);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPayloadValue:forKey:onEventWithName:", v8, *MEMORY[0x1E0D73B88], v5);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_imageTranscodedCount);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPayloadValue:forKey:onEventWithName:", v9, *MEMORY[0x1E0D73BA0], v5);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_videoTranscodedCount);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPayloadValue:forKey:onEventWithName:", v10, *MEMORY[0x1E0D73BD0], v5);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_downloadedCount);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPayloadValue:forKey:onEventWithName:", v11, *MEMORY[0x1E0D73B90], v5);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_timeDisconnected - self->_timeConnected);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPayloadValue:forKey:onEventWithName:", v12, *MEMORY[0x1E0D73B98], v5);

  objc_msgSend(v4, "publishEventWithName:", v5);
}

- (id)description
{
  void *v3;
  NSString *platformVersion;
  NSString *transport;
  void *v6;
  void *v7;
  __int128 v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v9 = *(_OWORD *)&self->_vendor;
  platformVersion = self->_platformVersion;
  transport = self->_transport;
  -[PLPTPAnalyticsData cplStateString](self, "cplStateString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("make: %@, os: %@, os_version: %@, transport: %@, clp_state: %@, library_asset_count: %lu, deferred_renders: %lu, videos_trancoded: %lu, images_transcoded: %lu, downloaded: %lu, duration: %g"), v9, platformVersion, transport, v6, self->_libraryAssetCount, self->_deferredRenderCount, self->_videoTranscodedCount, self->_imageTranscodedCount, self->_downloadedCount, (self->_timeDisconnected - self->_timeConnected) / 1000000000.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)vendor
{
  return self->_vendor;
}

- (void)setVendor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)platform
{
  return self->_platform;
}

- (void)setPlatform:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)platformVersion
{
  return self->_platformVersion;
}

- (void)setPlatformVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)buildVersion
{
  return self->_buildVersion;
}

- (void)setBuildVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)transport
{
  return self->_transport;
}

- (void)setTransport:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (int64_t)cplState
{
  return self->_cplState;
}

- (void)setCplState:(int64_t)a3
{
  self->_cplState = a3;
}

- (unint64_t)libraryAssetCount
{
  return self->_libraryAssetCount;
}

- (void)setLibraryAssetCount:(unint64_t)a3
{
  self->_libraryAssetCount = a3;
}

- (unint64_t)videoTranscodedCount
{
  return self->_videoTranscodedCount;
}

- (void)setVideoTranscodedCount:(unint64_t)a3
{
  self->_videoTranscodedCount = a3;
}

- (unint64_t)imageTranscodedCount
{
  return self->_imageTranscodedCount;
}

- (void)setImageTranscodedCount:(unint64_t)a3
{
  self->_imageTranscodedCount = a3;
}

- (unint64_t)downloadedCount
{
  return self->_downloadedCount;
}

- (void)setDownloadedCount:(unint64_t)a3
{
  self->_downloadedCount = a3;
}

- (unint64_t)deferredRenderCount
{
  return self->_deferredRenderCount;
}

- (void)setDeferredRenderCount:(unint64_t)a3
{
  self->_deferredRenderCount = a3;
}

- (double)timeConnected
{
  return self->_timeConnected;
}

- (void)setTimeConnected:(double)a3
{
  self->_timeConnected = a3;
}

- (double)timeDisconnected
{
  return self->_timeDisconnected;
}

- (void)setTimeDisconnected:(double)a3
{
  self->_timeDisconnected = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transport, 0);
  objc_storeStrong((id *)&self->_buildVersion, 0);
  objc_storeStrong((id *)&self->_platformVersion, 0);
  objc_storeStrong((id *)&self->_platform, 0);
  objc_storeStrong((id *)&self->_vendor, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end
