@implementation SFDeviceAssetQuery

+ (BOOL)deviceWantsH264
{
  if (deviceWantsH264_onceToken != -1)
    dispatch_once(&deviceWantsH264_onceToken, &__block_literal_global_45);
  return deviceWantsH264_deviceWantsH264;
}

uint64_t __37__SFDeviceAssetQuery_deviceWantsH264__block_invoke()
{
  uint64_t result;

  result = ((uint64_t (*)(uint64_t))softLinkVTIsHardwareDecodeSupported[0])(1752589105);
  deviceWantsH264_deviceWantsH264 = (_DWORD)result == 0;
  return result;
}

- (SFDeviceAssetQuery)initWithAssetType:(id)a3 productType:(id)a4
{
  id v6;
  id v7;
  SFDeviceAssetQuery *v8;
  SFDeviceAssetQuery *v9;
  uint64_t v10;
  NSString *assetType;
  uint64_t v12;
  NSString *productType;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SFDeviceAssetQuery;
  v8 = -[SFDeviceAssetQuery init](&v15, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_version = 1;
    v8->_legacyAsset = 0;
    v8->_h264 = objc_msgSend((id)objc_opt_class(), "deviceWantsH264");
    v10 = objc_msgSend(v6, "copy");
    assetType = v9->_assetType;
    v9->_assetType = (NSString *)v10;

    v12 = objc_msgSend(v7, "copy");
    productType = v9->_productType;
    v9->_productType = (NSString *)v12;

    ASPrintF();
    v9->_ucat = (LogCategory *)LogCategoryCreateEx();
  }

  return v9;
}

- (SFDeviceAssetQuery)initWithHomePodColor:(unint64_t)a3
{
  return -[SFDeviceAssetQuery initWithHomePodColor:version:](self, "initWithHomePodColor:version:", a3, 1);
}

- (SFDeviceAssetQuery)initWithHomePodColor:(unint64_t)a3 version:(unsigned int)a4
{
  void *v6;
  SFDeviceAssetQuery *v7;
  void *v8;
  uint64_t v9;
  NSString *color;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("AudioAccessory%d,1"), *(_QWORD *)&a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SFDeviceAssetQuery initWithAssetType:productType:](self, "initWithAssetType:productType:", CFSTR("com.apple.MobileAsset.SharingDeviceAssets"), v6);
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringValue");
    v9 = objc_claimAutoreleasedReturnValue();
    color = v7->_color;
    v7->_color = (NSString *)v9;

  }
  return v7;
}

- (SFDeviceAssetQuery)initWithSingleHomePodColor:(unsigned __int8)a3 version:(unsigned int)a4
{
  uint64_t v4;
  void *v6;
  SFDeviceAssetQuery *v7;
  void *v8;
  uint64_t v9;
  NSString *color;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("AudioAccessorySingle%d,1"), *(_QWORD *)&a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SFDeviceAssetQuery initWithAssetType:productType:](self, "initWithAssetType:productType:", CFSTR("com.apple.MobileAsset.SharingDeviceAssets"), v6);
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringValue");
    v9 = objc_claimAutoreleasedReturnValue();
    color = v7->_color;
    v7->_color = (NSString *)v9;

  }
  return v7;
}

- (SFDeviceAssetQuery)initWithBluetoothProductIdentifier:(unint64_t)a3 color:(unint64_t)a4
{
  void *v6;
  SFDeviceAssetQuery *v7;
  void *v8;
  uint64_t v9;
  NSString *color;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%d"), CFSTR("Device1,"), a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SFDeviceAssetQuery initWithAssetType:productType:](self, "initWithAssetType:productType:", CFSTR("com.apple.MobileAsset.SharingDeviceAssets"), v6);
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringValue");
    v9 = objc_claimAutoreleasedReturnValue();
    color = v7->_color;
    v7->_color = (NSString *)v9;

  }
  return v7;
}

- (SFDeviceAssetQuery)initWithTagColor:(unint64_t)a3
{
  SFDeviceAssetQuery *v4;
  void *v5;
  uint64_t v6;
  NSString *color;

  v4 = -[SFDeviceAssetQuery initWithAssetType:productType:](self, "initWithAssetType:productType:", CFSTR("com.apple.MobileAsset.SharingDeviceAssets"), CFSTR("AirTag1,1"));
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringValue");
    v6 = objc_claimAutoreleasedReturnValue();
    color = v4->_color;
    v4->_color = (NSString *)v6;

  }
  return v4;
}

- (SFDeviceAssetQuery)initWithProductType:(id)a3 additionalQueryParameters:(id)a4
{
  id v6;
  SFDeviceAssetQuery *v7;
  void *v8;
  SFDeviceAssetQuery *v9;
  id v10;
  uint64_t v11;
  NSDictionary *additionalQueryParameters;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *, void *);
  void *v17;
  SFDeviceAssetQuery *v18;
  id v19;

  v6 = a4;
  v7 = -[SFDeviceAssetQuery initWithAssetType:productType:](self, "initWithAssetType:productType:", CFSTR("com.apple.MobileAsset.SharingDeviceAssets"), a3);
  if (v7)
  {
    v8 = (void *)objc_opt_new();
    v14 = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __68__SFDeviceAssetQuery_initWithProductType_additionalQueryParameters___block_invoke;
    v17 = &unk_1E482F5F0;
    v9 = v7;
    v18 = v9;
    v19 = v8;
    v10 = v8;
    objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", &v14);
    v11 = objc_msgSend(v10, "copy", v14, v15, v16, v17);
    additionalQueryParameters = v9->_additionalQueryParameters;
    v9->_additionalQueryParameters = (NSDictionary *)v11;

  }
  return v7;
}

void __68__SFDeviceAssetQuery_initWithProductType_additionalQueryParameters___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  __CFString *v7;
  char v8;
  __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  int v12;
  __CFString *v13;
  __CFString *v14;
  __CFString *v15;
  int v16;
  __CFString *v17;

  v5 = a2;
  v6 = a3;
  v17 = (__CFString *)v5;
  v7 = CFSTR("ProductType");
  if (v7 == v17)
  {

    goto LABEL_22;
  }
  if ((v17 == 0) != (v7 != 0))
  {
    v8 = -[__CFString isEqual:](v17, "isEqual:", v7);

    if ((v8 & 1) != 0)
      goto LABEL_22;
  }
  else
  {

  }
  v9 = v17;
  v10 = CFSTR("H264");
  if (v10 == v9)
  {

    goto LABEL_12;
  }
  v11 = v10;
  if ((v17 == 0) != (v10 != 0))
  {
    v12 = -[__CFString isEqual:](v9, "isEqual:", v10);

    if (!v12)
      goto LABEL_14;
LABEL_12:
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 9) = objc_msgSend(v6, "BOOLValueSafe");
    goto LABEL_22;
  }

LABEL_14:
  v13 = v9;
  v14 = CFSTR("CL");
  if (v14 == v13)
  {

  }
  else
  {
    v15 = v14;
    if ((v17 == 0) == (v14 != 0))
    {

LABEL_21:
      objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v6, v13);
      goto LABEL_22;
    }
    v16 = -[__CFString isEqual:](v13, "isEqual:", v14);

    if (!v16)
      goto LABEL_21;
  }
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 56), a3);
LABEL_22:

}

- (void)dealloc
{
  LogCategory *ucat;
  objc_super v4;

  ucat = self->_ucat;
  if (ucat && (ucat->var3 & 0x40000) != 0)
  {
    LogCategory_Remove();
    self->_ucat = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)SFDeviceAssetQuery;
  -[SFDeviceAssetQuery dealloc](&v4, sel_dealloc);
}

- (NSString)stringIdentifier
{
  id v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v13;
  void *v14;
  void *v15;

  -[SFDeviceAssetQuery loggingProductType](self, "loggingProductType");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  NSAppendPrintF();
  v3 = 0;

  if (-[SFDeviceAssetQuery legacyAsset](self, "legacyAsset", v13))
  {
    NSAppendPrintF();
    v4 = v3;

    v3 = v4;
  }
  if (-[SFDeviceAssetQuery h264](self, "h264"))
  {
    NSAppendPrintF();
    v5 = v3;

    v3 = v5;
  }
  -[SFDeviceAssetQuery color](self, "color");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[SFDeviceAssetQuery color](self, "color");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    NSAppendPrintF();
    v7 = v3;

    v3 = v7;
  }
  -[SFDeviceAssetQuery additionalQueryParameters](self, "additionalQueryParameters", v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9)
  {
    -[SFDeviceAssetQuery additionalQueryParameters](self, "additionalQueryParameters");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    SFCompactStringFromCollection(v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    NSAppendPrintF();
    v11 = v3;

    v3 = v11;
  }
  return (NSString *)v3;
}

- (NSString)variantIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[SFDeviceAssetQuery color](self, "color");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("CL_%@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSString)effectiveProductType
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;

  -[SFDeviceAssetQuery mappedProductType](self, "mappedProductType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[SFDeviceAssetQuery productType](self, "productType");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  if (!-[SFDeviceAssetQuery legacyAsset](self, "legacyAsset"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), v6, CFSTR("-v2"));
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v7;
  }
  return (NSString *)v6;
}

- (id)loggingProductType
{
  id v3;
  void *v4;
  id v5;
  void *v7;
  void *v8;

  -[SFDeviceAssetQuery productType](self, "productType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSAppendPrintF();
  v3 = 0;

  -[SFDeviceAssetQuery mappedProductType](self, "mappedProductType", v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[SFDeviceAssetQuery mappedProductType](self, "mappedProductType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSAppendPrintF();
    v5 = v3;

    v3 = v5;
  }
  return v3;
}

- (id)description
{
  id v3;
  id v4;
  uint64_t v6;
  void *v7;
  id v8;

  v6 = objc_opt_class();
  NSAppendPrintF();
  v8 = 0;
  -[SFDeviceAssetQuery stringIdentifier](self, "stringIdentifier", v6, self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSAppendPrintF();
  v3 = v8;

  NSAppendPrintF();
  v4 = v3;

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  SFDeviceAssetQuery *v4;
  SFDeviceAssetQuery *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  int v11;
  BOOL v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  int v24;
  unint64_t v25;

  v4 = (SFDeviceAssetQuery *)a3;
  if (v4 == self)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[SFDeviceAssetQuery productType](self, "productType");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFDeviceAssetQuery productType](v5, "productType");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v6;
      v9 = v7;
      v10 = v9;
      if (v8 == v9)
      {

      }
      else
      {
        if ((v8 == 0) == (v9 != 0))
        {
          v12 = 0;
          v17 = v9;
          v15 = v8;
          goto LABEL_26;
        }
        v11 = objc_msgSend(v8, "isEqual:", v9);

        if (!v11)
        {
          v12 = 0;
LABEL_27:

          goto LABEL_28;
        }
      }
      -[SFDeviceAssetQuery color](self, "color");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFDeviceAssetQuery color](v5, "color");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v13;
      v16 = v14;
      v17 = v16;
      if (v15 == v16)
      {

      }
      else
      {
        if ((v15 == 0) == (v16 != 0))
        {
          v12 = 0;
          v23 = v16;
          v21 = v15;
          goto LABEL_25;
        }
        v18 = objc_msgSend(v15, "isEqual:", v16);

        if (!v18)
        {
          v12 = 0;
LABEL_26:

          goto LABEL_27;
        }
      }
      -[SFDeviceAssetQuery additionalQueryParameters](self, "additionalQueryParameters");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFDeviceAssetQuery additionalQueryParameters](v5, "additionalQueryParameters");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v19;
      v22 = v20;
      v23 = v22;
      if (v21 == v22)
      {

      }
      else
      {
        if ((v21 == 0) == (v22 != 0))
        {

LABEL_24:
          v12 = 0;
          goto LABEL_25;
        }
        v24 = objc_msgSend(v21, "isEqual:", v22);

        if (!v24)
          goto LABEL_24;
      }
      v25 = -[SFDeviceAssetQuery version](self, "version");
      v12 = v25 == -[SFDeviceAssetQuery version](v5, "version");
LABEL_25:

      goto LABEL_26;
    }
    v12 = 0;
  }
LABEL_28:

  return v12;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  -[SFDeviceAssetQuery productType](self, "productType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[SFDeviceAssetQuery color](self, "color");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[SFDeviceAssetQuery additionalQueryParameters](self, "additionalQueryParameters");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");

  return v8;
}

- (BOOL)legacyAsset
{
  return self->_legacyAsset;
}

- (void)setLegacyAsset:(BOOL)a3
{
  self->_legacyAsset = a3;
}

- (LogCategory)ucat
{
  return self->_ucat;
}

- (NSString)assetType
{
  return self->_assetType;
}

- (BOOL)h264
{
  return self->_h264;
}

- (void)setH264:(BOOL)a3
{
  self->_h264 = a3;
}

- (unint64_t)version
{
  return self->_version;
}

- (NSString)productType
{
  return self->_productType;
}

- (NSString)mappedProductType
{
  return self->_mappedProductType;
}

- (void)setMappedProductType:(id)a3
{
  objc_storeStrong((id *)&self->_mappedProductType, a3);
}

- (NSString)color
{
  return self->_color;
}

- (NSDictionary)additionalQueryParameters
{
  return self->_additionalQueryParameters;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalQueryParameters, 0);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_mappedProductType, 0);
  objc_storeStrong((id *)&self->_productType, 0);
  objc_storeStrong((id *)&self->_assetType, 0);
}

@end
