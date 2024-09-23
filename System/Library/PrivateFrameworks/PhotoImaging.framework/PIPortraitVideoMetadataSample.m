@implementation PIPortraitVideoMetadataSample

- (void)nu_updateDigest:(id)a3
{
  PIPortraitVideoMetadataSample *v3;

  v3 = self;
  objc_msgSend(a3, "addBytes:length:", &v3, 8);
}

- (PIPortraitVideoMetadataSample)initWithMetadataGroup:(id)a3 majorVersion:(unsigned int)a4 minorVersion:(unsigned int)a5 error:(id *)a6
{
  uint64_t v7;
  uint64_t v8;
  id v11;
  PIPortraitVideoMetadataSample *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  id v18;
  void *v20;
  void *v21;
  objc_super v22;

  v7 = *(_QWORD *)&a5;
  v8 = *(_QWORD *)&a4;
  v11 = a3;
  if (v11)
  {
    if (a6)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PIPortraitVideoMetadata.m"), 43, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("metadataGroup != nil"));

    if (a6)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PIPortraitVideoMetadata.m"), 44, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("outError != NULL"));

LABEL_3:
  v22.receiver = self;
  v22.super_class = (Class)PIPortraitVideoMetadataSample;
  v12 = -[PIPortraitVideoMetadataSample init](&v22, sel_init);
  if (v12)
  {
    -[PIPortraitVideoMetadataSample valueWithIdentifier:inGroup:ofClass:](v12, "valueWithIdentifier:inGroup:ofClass:", CFSTR("mdta/com.apple.quicktime.cinematic-video.rendering"), v11, objc_opt_class());
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(MEMORY[0x1E0D7F5D0], "objectFromData:withMajorVersion:minorVersion:", v13, v8, v7);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[PIPortraitVideoMetadataSample setTimedMetadata:](v12, "setTimedMetadata:", v14);

      -[PIPortraitVideoMetadataSample timedMetadata](v12, "timedMetadata");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
LABEL_9:

        goto LABEL_10;
      }
      v16 = (void *)MEMORY[0x1E0D520A0];
      v17 = CFSTR("Could not decode timed rendering data");
      v18 = v13;
    }
    else
    {
      v16 = (void *)MEMORY[0x1E0D520A0];
      v17 = CFSTR("Missing rendering metadata");
      v18 = v11;
    }
    objc_msgSend(v16, "invalidError:object:", v17, v18);
    *a6 = (id)objc_claimAutoreleasedReturnValue();

    v12 = 0;
    goto LABEL_9;
  }
LABEL_10:

  return v12;
}

- (void)applyToRenderRequest:(id)a3
{
  -[PTTimedRenderingMetadata applyToRenderRequest:](self->_timedMetadata, "applyToRenderRequest:", a3);
}

- (id)valueWithIdentifier:(id)a3 inGroup:(id)a4 ofClass:(Class)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  _QWORD *v12;
  os_log_t *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  int v20;
  id v21;
  __int16 v22;
  Class v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void *)MEMORY[0x1E0C8B220];
  objc_msgSend(a4, "items");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "metadataItemsFromArray:filteredByIdentifier:", v9, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "count"))
  {
    v11 = objc_msgSend(v10, "count");
    v12 = (_QWORD *)MEMORY[0x1E0D52390];
    v13 = (os_log_t *)MEMORY[0x1E0D52398];
    if (v11 >= 2)
    {
      if (*MEMORY[0x1E0D52390] != -1)
        dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_8540);
      v14 = *v13;
      if (os_log_type_enabled(*v13, OS_LOG_TYPE_ERROR))
      {
        v20 = 138412546;
        v21 = v7;
        v22 = 2112;
        v23 = (Class)v10;
        _os_log_error_impl(&dword_1A6382000, v14, OS_LOG_TYPE_ERROR, "PIPortraitVideoMetadataSample: unexpected number of items for identifier %@: %@", (uint8_t *)&v20, 0x16u);
      }
    }
    objc_msgSend(v10, "firstObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "value");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = v16;
    }
    else
    {
      if (*v12 != -1)
        dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_8540);
      v18 = *v13;
      if (os_log_type_enabled(*v13, OS_LOG_TYPE_ERROR))
      {
        v20 = 138412546;
        v21 = v16;
        v22 = 2112;
        v23 = a5;
        _os_log_error_impl(&dword_1A6382000, v18, OS_LOG_TYPE_ERROR, "PIPortraitVideoMetadataSample: item %@ is not of expected class %@", (uint8_t *)&v20, 0x16u);
      }
      v17 = 0;
    }

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (PTTimedRenderingMetadata)timedMetadata
{
  return self->_timedMetadata;
}

- (void)setTimedMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_timedMetadata, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timedMetadata, 0);
}

+ (NSString)renderingMetadataIdentifier
{
  return (NSString *)CFSTR("mdta/com.apple.quicktime.cinematic-video.rendering");
}

@end
