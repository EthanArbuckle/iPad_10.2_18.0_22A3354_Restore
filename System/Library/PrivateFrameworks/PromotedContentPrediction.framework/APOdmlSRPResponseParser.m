@implementation APOdmlSRPResponseParser

+ (BOOL)isValidResponse:(id)a3
{
  return objc_msgSend_odmlEnabled(a3, a2, (uint64_t)a3);
}

+ (id)parseResponseForFeatureValues:(id)a3
{
  id v3;
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  void *v21;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (objc_msgSend_featuresCount(v3, v5, v6))
  {
    v9 = 0;
    do
    {
      objc_msgSend_featuresAtIndex_(v3, v7, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_multiarrayFromFeature_(MEMORY[0x1E0C9E970], v11, (uint64_t)v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_featureValueWithMultiArray_(MEMORY[0x1E0C9E918], v13, (uint64_t)v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_name(v10, v15, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setValue_forKey_(v4, v18, (uint64_t)v14, v17);

      ++v9;
    }
    while (v9 < objc_msgSend_featuresCount(v3, v19, v20));
  }
  v21 = (void *)objc_msgSend_copy(v4, v7, v8);

  return v21;
}

@end
