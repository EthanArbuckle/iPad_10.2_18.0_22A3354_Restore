@implementation SiriTTSAudioHardware

- (void)setDuckOthers:(BOOL)a3
{
  NSObject *v3;
  uint8_t v4[16];

  TTSGetServiceLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_fault_impl(&dword_19AD45000, v3, OS_LOG_TYPE_FAULT, "Volume ducking is unsupported on non-macOS devices.", v4, 2u);
  }

}

- (void)fetchHardwareInfo
{
  void *v3;
  void *v4;
  NSString *v5;
  NSString *routeType;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  int v14;
  id v15;
  NSObject *v16;
  float v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D48560], "sharedAVSystemController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attributeForKey:", *MEMORY[0x1E0D48050]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D480C8]);
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  routeType = self->_routeType;
  self->_routeType = v5;

  if (-[NSString isEqualToString:](self->_routeType, "isEqualToString:", CFSTR("Speaker")))
    self->_isAppleProduct = 1;
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D48168]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  self->_isBluetooth = objc_msgSend(v7, "BOOLValue");

  if (!self->_isBluetooth)
    goto LABEL_10;
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D48148]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "componentsSeparatedByString:", CFSTR(","));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count") == 2)
  {
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "length");
    if (v11 - 1 >= 0)
    {
      v12 = v11;
      v13 = 1;
      do
      {
        v14 = objc_msgSend(v10, "characterAtIndex:", --v12);
        if (objc_msgSend(v10, "characterAtIndex:", v12) - 48 > 9)
          break;
        self->_vendorId += (v14 - 48) * v13;
        v13 *= 10;
      }
      while (v12 > 0);
    }
    objc_msgSend(v9, "lastObject");
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    self->_productId = strtol((const char *)objc_msgSend(v15, "UTF8String"), 0, 10);

    self->_isAppleProduct = self->_vendorId == 76;
LABEL_10:
    v17 = 0.0;
    if (objc_msgSend(v3, "getActiveCategoryVolume:andName:", &v17, 0))
      self->_volume = v17;
    goto LABEL_15;
  }
  TTSGetServiceLog();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    v17 = 5.7779e-34;
    v18 = v8;
    _os_log_error_impl(&dword_19AD45000, v16, OS_LOG_TYPE_ERROR, "Unexpected model ID pattern: %@", (uint8_t *)&v17, 0xCu);
  }

LABEL_15:
}

- (NSString)routeType
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (BOOL)isBluetooth
{
  return self->_isBluetooth;
}

- (BOOL)isAppleProduct
{
  return self->_isAppleProduct;
}

- (int64_t)vendorId
{
  return self->_vendorId;
}

- (int64_t)productId
{
  return self->_productId;
}

- (float)volume
{
  return self->_volume;
}

- (BOOL)duckOthers
{
  return self->_duckOthers;
}

- (unsigned)audioDeviceID
{
  return self->_audioDeviceID;
}

- (void)setAudioDeviceID:(unsigned int)a3
{
  self->_audioDeviceID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routeType, 0);
}

+ (id)defaultOutput
{
  SiriTTSAudioHardware *v2;

  v2 = objc_alloc_init(SiriTTSAudioHardware);
  -[SiriTTSAudioHardware fetchHardwareInfo](v2, "fetchHardwareInfo");
  return v2;
}

@end
