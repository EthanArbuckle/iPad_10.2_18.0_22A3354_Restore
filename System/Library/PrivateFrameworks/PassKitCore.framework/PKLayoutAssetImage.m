@implementation PKLayoutAssetImage

+ (id)assetKey
{
  return CFSTR("images");
}

+ (id)nameToAssetsMapFromDictionaries:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *, void *);
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    if (objc_msgSend(v3, "count"))
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = MEMORY[0x1E0C809B0];
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __54__PKLayoutAssetImage_nameToAssetsMapFromDictionaries___block_invoke;
      v16[3] = &unk_1E2AD53C0;
      v17 = v5;
      v7 = v5;
      objc_msgSend(v4, "enumerateObjectsUsingBlock:", v16);
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v7, "count"));
      v11 = v6;
      v12 = 3221225472;
      v13 = __54__PKLayoutAssetImage_nameToAssetsMapFromDictionaries___block_invoke_18;
      v14 = &unk_1E2AD93B8;
      v15 = (id)objc_claimAutoreleasedReturnValue();
      v8 = v15;
      objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", &v11);
      v9 = (void *)objc_msgSend(v8, "copy", v11, v12, v13, v14);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

void __54__PKLayoutAssetImage_nameToAssetsMapFromDictionaries___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  PKRemoteImage *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;

  v12 = a2;
  objc_msgSend(v12, "PKStringForKey:", CFSTR("key"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && objc_msgSend(v3, "length"))
  {
    v5 = -[PKRemoteImage initWithDictionary:]([PKRemoteImage alloc], "initWithDictionary:", v12);
    objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v6, v4);
    }
    objc_msgSend(v12, "PKNumberForKey:", CFSTR("index"));
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    v9 = &unk_1E2C3F5C8;
    if (v7)
      v9 = (void *)v7;
    v10 = v9;

    objc_msgSend(v6, "objectForKey:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKey:", v11, v10);
    }
    objc_msgSend(v11, "safelyAddObject:", v5);

  }
}

void __54__PKLayoutAssetImage_nameToAssetsMapFromDictionaries___block_invoke_18(uint64_t a1, void *a2, void *a3)
{
  PKLayoutAssetImage *v4;
  id v5;
  unint64_t v6;
  PKRemoteImageSet *v7;
  uint64_t v8;
  PKLayoutAssetImage *v9;
  uint64_t v10;
  void *v11;
  PKRemoteImageSet *v12;
  PKRemoteImageSet *v13;
  PKRemoteImageSet *v14;
  PKLayoutAssetImage *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  PKLayoutAssetImage *v21;
  void *v22;
  _QWORD v23[4];
  PKLayoutAssetImage *v24;
  PKLayoutAssetImage *v25;
  uint8_t buf[4];
  PKLayoutAssetImage *v27;
  __int16 v28;
  PKLayoutAssetImage *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v5, "count");
  if (v6 < 2)
  {
    v22 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v21 = v4;
  v7 = 0;
  if (!objc_msgSend(v5, "count"))
  {
LABEL_11:
    if (v6 < 2)
    {
      v9 = -[PKLayoutAssetImage initWithName:remoteImage:]([PKLayoutAssetImage alloc], "initWithName:remoteImage:", v4, v7);
      if (v9)
        goto LABEL_13;
    }
    else
    {
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __54__PKLayoutAssetImage_nameToAssetsMapFromDictionaries___block_invoke_21;
      v23[3] = &unk_1E2AD9390;
      v15 = v4;
      v24 = v15;
      objc_msgSend(v22, "pk_arrayBySafelyApplyingBlock:", v23);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[PKLayoutAssetImage initWithName:subimages:]([PKLayoutAssetImage alloc], "initWithName:subimages:", v15, v16);

      if (v9)
      {
LABEL_13:
        v17 = *(void **)(a1 + 32);
        v25 = v9;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = v17;
        v4 = v21;
        objc_msgSend(v19, "safelySetObject:forKey:", v18, v21);
        goto LABEL_20;
      }
    }
    PKLogFacilityTypeGetObject(0);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v4 = v21;
      v27 = v21;
      _os_log_impl(&dword_18FC92000, v18, OS_LOG_TYPE_DEFAULT, "Error parsing image set %@", buf, 0xCu);
      v9 = 0;
    }
    else
    {
      v4 = v21;
    }
    goto LABEL_20;
  }
  v8 = 0;
  while (1)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v8);
    v9 = (PKLayoutAssetImage *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
    if (!v10)
      break;
    v11 = (void *)v10;
    v12 = -[PKRemoteImageSet initWithName:images:]([PKRemoteImageSet alloc], "initWithName:images:", v4, v10);
    v13 = v12;
    if (v6 < 2)
    {
      v14 = v12;

      v7 = v14;
      v4 = v21;
    }
    else
    {
      objc_msgSend(v22, "safelyAddObject:", v12);
    }

    if (++v8 >= (unint64_t)objc_msgSend(v5, "count"))
      goto LABEL_11;
  }
  PKLogFacilityTypeGetObject(0);
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v27 = v9;
    v28 = 2112;
    v29 = v4;
    _os_log_impl(&dword_18FC92000, v18, OS_LOG_TYPE_DEFAULT, "Missing image for index %@ in image group %@", buf, 0x16u);
  }
LABEL_20:

}

PKLayoutAssetImage *__54__PKLayoutAssetImage_nameToAssetsMapFromDictionaries___block_invoke_21(uint64_t a1, void *a2)
{
  id v3;
  PKLayoutAssetImage *v4;

  v3 = a2;
  v4 = -[PKLayoutAssetImage initWithName:remoteImage:]([PKLayoutAssetImage alloc], "initWithName:remoteImage:", *(_QWORD *)(a1 + 32), v3);

  return v4;
}

- (PKLayoutAssetImage)initWithName:(id)a3 remoteImage:(id)a4
{
  id v7;
  id v8;
  PKLayoutAssetImage *v9;
  uint64_t v10;
  PKLayoutAssetImage *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PKLayoutAssetImage;
  v9 = -[PKLayoutAssetImage init](&v13, sel_init);
  if (!v9)
    goto LABEL_6;
  if (!v7)
  {
    v11 = 0;
    goto LABEL_8;
  }
  v10 = objc_msgSend(v7, "length");
  v11 = 0;
  if (v8 && v10)
  {
    objc_storeStrong((id *)&v9->_name, a3);
    objc_storeStrong((id *)&v9->_remoteImage, a4);
LABEL_6:
    v11 = v9;
  }
LABEL_8:

  return v11;
}

- (PKLayoutAssetImage)initWithName:(id)a3 subimages:(id)a4
{
  id v7;
  id v8;
  PKLayoutAssetImage *v9;
  uint64_t v10;
  PKLayoutAssetImage *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PKLayoutAssetImage;
  v9 = -[PKLayoutAssetImage init](&v13, sel_init);
  if (!v9)
    goto LABEL_6;
  if (!v7)
  {
    v11 = 0;
    goto LABEL_8;
  }
  v10 = objc_msgSend(v7, "length");
  v11 = 0;
  if (v8 && v10)
  {
    objc_storeStrong((id *)&v9->_name, a3);
    objc_storeStrong((id *)&v9->_subimages, a4);
LABEL_6:
    v11 = v9;
  }
LABEL_8:

  return v11;
}

- (PKOSVersionRequirementRange)osVersionRange
{
  return self->_osVersionRange;
}

- (void)setOsVersionRange:(id)a3
{
  objc_storeStrong((id *)&self->_osVersionRange, a3);
}

- (NSDictionary)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSArray)subimages
{
  return self->_subimages;
}

- (void)setSubimages:(id)a3
{
  objc_storeStrong((id *)&self->_subimages, a3);
}

- (PKRemoteImageSet)remoteImage
{
  return self->_remoteImage;
}

- (void)setRemoteImage:(id)a3
{
  objc_storeStrong((id *)&self->_remoteImage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteImage, 0);
  objc_storeStrong((id *)&self->_subimages, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_osVersionRange, 0);
}

@end
