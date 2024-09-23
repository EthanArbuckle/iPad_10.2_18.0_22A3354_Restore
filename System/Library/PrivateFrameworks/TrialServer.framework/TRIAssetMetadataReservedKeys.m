@implementation TRIAssetMetadataReservedKeys

+ (BOOL)isEncryptedForMetadata:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  if (!a3)
    return 0;
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("trialIsEncrypted"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "BOOLValue");
  else
    v5 = 0;

  return v5;
}

+ ($61A80719B04F7407D3E47539F1B23CAA)compressionModeForMetadata:(id)a3
{
  void *v3;
  void *v4;
  _BOOL8 v5;

  if (a3)
  {
    objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("__trialAppleFSCompressionMode"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "lowercaseString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = v4 && (objc_msgSend(v4, "isEqualToString:", CFSTR("lzbitmap")) & 1) != 0;
  }
  else
  {
    return ($61A80719B04F7407D3E47539F1B23CAA)0;
  }
  return ($61A80719B04F7407D3E47539F1B23CAA)v5;
}

@end
