@implementation PPKImageReader

- (id)_readAnnotationsFromDataProvider:(CGDataProvider *)a3
{
  CGImageSource *v4;
  CGImageSource *v5;
  CGImageMetadataRef v6;
  CGImageMetadataRef v7;
  void *v8;
  void *v9;
  _BYTE *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint8_t buf[16];

  v4 = CGImageSourceCreateWithDataProvider(a3, 0);
  if (!v4)
    return 0;
  v5 = v4;
  v6 = CGImageSourceCopyMetadataAtIndex(v4, 0, 0);
  if (v6)
  {
    v7 = v6;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%@"), kMetadataPrefixPaperKit, kMetadataEncryptedModelTag);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PPKImageReader _readDataFromTagAtPath:inMetadata:](self, "_readDataFromTagAtPath:inMetadata:", v8, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[PPKPayloadEncryption sharedInstance]();
    v10 = (_BYTE *)objc_claimAutoreleasedReturnValue();
    -[PPKPayloadEncryption decryptData:](v10, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      +[PPKImageWriter log]();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DDB0F000, v12, OS_LOG_TYPE_DEFAULT, "Did not find enc_model, attempting to read unencrypted model", buf, 2u);
      }

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%@"), kMetadataPrefixPaperKit, kMetadataModelTag);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPKImageReader _readDataFromTagAtPath:inMetadata:](self, "_readDataFromTagAtPath:inMetadata:", v13, v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    CFRelease(v7);

  }
  else
  {
    v11 = 0;
  }
  CFRelease(v5);
  return v11;
}

- (id)_readDataFromTagAtPath:(id)a3 inMetadata:(CGImageMetadata *)a4
{
  CGImageMetadataTag *v4;
  CGImageMetadataTag *v5;
  CFTypeRef v6;
  void *v7;
  CFTypeID v8;
  objc_class *v9;
  id v10;
  void *v11;

  v4 = CGImageMetadataCopyTagWithPath(a4, 0, (CFStringRef)a3);
  if (v4)
  {
    v5 = v4;
    v6 = CGImageMetadataTagCopyValue(v4);
    if (v6)
    {
      v7 = (void *)v6;
      v8 = CFGetTypeID(v6);
      if (v8 == CFStringGetTypeID())
      {
        v9 = (objc_class *)MEMORY[0x1E0C99D50];
        v10 = v7;
        v11 = (void *)objc_msgSend([v9 alloc], "initWithBase64EncodedString:options:", v10, 0);

      }
      else
      {
        v11 = 0;
      }
      CFRelease(v7);
    }
    else
    {
      v11 = 0;
    }
    CFRelease(v5);
  }
  else
  {
    v11 = 0;
  }
  return v11;
}

+ (id)_privateImageMetadataDescriptors
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[4];
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v8[0] = kMetadataPrefixAnnotationKit;
  v7[0] = kMetadataEncryptedBaseImageModelTag;
  v7[1] = kMetadataBaseImageTag;
  v7[2] = kMetadataEncryptedModelTag;
  v7[3] = kMetadataModelTag;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v2;
  v8[1] = kMetadataPrefixPaperKit;
  v6[0] = kMetadataEncryptedModelTag;
  v6[1] = kMetadataModelTag;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
