@implementation PICompositionExporterImageOptions

- (PICompositionExporterImageOptions)init
{
  PICompositionExporterImageOptions *v2;
  uint64_t v3;
  NSArray *auxiliaryImageTypes;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PICompositionExporterImageOptions;
  v2 = -[PICompositionExporterOptions init](&v6, sel_init);
  v2->_JPEGCompressionQuality = 0.0;
  objc_msgSend(MEMORY[0x1E0D52160], "defaultAuxiliaryImageTypes");
  v3 = objc_claimAutoreleasedReturnValue();
  auxiliaryImageTypes = v2->_auxiliaryImageTypes;
  v2->_auxiliaryImageTypes = (NSArray *)v3;

  return v2;
}

- (id)imageExportFormatForURL:(id)a3 isHDR:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  NUImageExportFormat *imageExportFormat;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t *v14;
  os_log_t *v15;
  void *v16;
  void *v17;
  NUImageExportFormat *v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  void *specific;
  NUImageExportFormat *v23;
  NUImageExportFormat *v24;
  double v25;
  os_log_t v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  os_log_t v32;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NUImageExportFormat *v38;
  id v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v4 = a4;
  v44 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  imageExportFormat = self->_imageExportFormat;
  if (imageExportFormat)
  {
    if (!v6)
    {
LABEL_24:
      v24 = imageExportFormat;
      goto LABEL_25;
    }
    v9 = (void *)MEMORY[0x1E0CEC3F8];
    objc_msgSend(v6, "pathExtension");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "typeWithFilenameExtension:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[NUImageExportFormat fileType](self->_imageExportFormat, "fileType");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v12, "isEqualToString:", v13) & 1) != 0)
    {
LABEL_23:

      imageExportFormat = self->_imageExportFormat;
      goto LABEL_24;
    }
    v14 = (uint64_t *)MEMORY[0x1E0D52390];
    if (*MEMORY[0x1E0D52390] != -1)
      dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_422);
    v15 = (os_log_t *)MEMORY[0x1E0D52380];
    v16 = (void *)*MEMORY[0x1E0D52380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52380], OS_LOG_TYPE_DEFAULT))
    {
      v17 = (void *)MEMORY[0x1E0CB3940];
      v18 = self->_imageExportFormat;
      v19 = v16;
      objc_msgSend(v17, "stringWithFormat:", CFSTR("Export URL UTI (%@) does not match expected export format (%@)"), v12, v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v41 = v20;
      _os_log_impl(&dword_1A6382000, v19, OS_LOG_TYPE_DEFAULT, "Continue: %{public}@", buf, 0xCu);

      v21 = *v14;
      specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
      v15 = (os_log_t *)MEMORY[0x1E0D52380];
      if (specific)
      {
        if (v21 != -1)
          dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_422);
LABEL_17:
        v26 = *v15;
        if (os_log_type_enabled(*v15, OS_LOG_TYPE_ERROR))
        {
          v27 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
          v28 = (void *)MEMORY[0x1E0CB3978];
          v39 = v27;
          v29 = v26;
          objc_msgSend(v28, "callStackSymbols");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "componentsJoinedByString:", CFSTR("\n"));
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v41 = v27;
          v42 = 2114;
          v43 = v31;
          _os_log_error_impl(&dword_1A6382000, v29, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_31:
          goto LABEL_22;
        }
        goto LABEL_22;
      }
      if (v21 != -1)
        dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_422);
    }
    else if (dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]))
    {
      goto LABEL_17;
    }
    v32 = *v15;
    if (os_log_type_enabled(*v15, OS_LOG_TYPE_ERROR))
    {
      v34 = (void *)MEMORY[0x1E0CB3978];
      v29 = v32;
      objc_msgSend(v34, "callStackSymbols");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "componentsJoinedByString:", CFSTR("\n"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v41 = v36;
      _os_log_error_impl(&dword_1A6382000, v29, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      goto LABEL_31;
    }
LABEL_22:
    v37 = v12;
    v38 = self->_imageExportFormat;
    _NUAssertContinueHandler();
    goto LABEL_23;
  }
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D52148], "defaultFormatForURL:", v6);
    v23 = (NUImageExportFormat *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v23 = (NUImageExportFormat *)objc_alloc_init(MEMORY[0x1E0D52158]);
  }
  v24 = v23;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[PICompositionExporterImageOptions JPEGCompressionQuality](self, "JPEGCompressionQuality");
    if (v25 != 0.0)
    {
      -[PICompositionExporterImageOptions JPEGCompressionQuality](self, "JPEGCompressionQuality");
      -[NUImageExportFormat setCompressionQuality:](v24, "setCompressionQuality:");
    }
  }
LABEL_25:
  if (-[PICompositionExporterImageOptions enableHDR](self, "enableHDR", v37, v38))
  {
    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        -[NUImageExportFormat setBitDepth:](v24, "setBitDepth:", 10);
    }
  }

  return v24;
}

- (NUImageExportFormat)imageExportFormat
{
  return (NUImageExportFormat *)objc_getProperty(self, a2, 48, 1);
}

- (void)setImageExportFormat:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (double)JPEGCompressionQuality
{
  return self->_JPEGCompressionQuality;
}

- (void)setJPEGCompressionQuality:(double)a3
{
  self->_JPEGCompressionQuality = a3;
}

- (id)metadataProcessor
{
  return objc_getProperty(self, a2, 64, 1);
}

- (void)setMetadataProcessor:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 64);
}

- (BOOL)optimizeForSharing
{
  return self->_optimizeForSharing;
}

- (void)setOptimizeForSharing:(BOOL)a3
{
  self->_optimizeForSharing = a3;
}

- (BOOL)applyImageOrientationAsMetadata
{
  return self->_applyImageOrientationAsMetadata;
}

- (void)setApplyImageOrientationAsMetadata:(BOOL)a3
{
  self->_applyImageOrientationAsMetadata = a3;
}

- (BOOL)optimizeForBackgroundProcessing
{
  return self->_optimizeForBackgroundProcessing;
}

- (void)setOptimizeForBackgroundProcessing:(BOOL)a3
{
  self->_optimizeForBackgroundProcessing = a3;
}

- (BOOL)enableHDR
{
  return self->_enableHDR;
}

- (void)setEnableHDR:(BOOL)a3
{
  self->_enableHDR = a3;
}

- (NSArray)auxiliaryImageTypes
{
  return self->_auxiliaryImageTypes;
}

- (void)setAuxiliaryImageTypes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_auxiliaryImageTypes, 0);
  objc_storeStrong(&self->_metadataProcessor, 0);
  objc_storeStrong((id *)&self->_imageExportFormat, 0);
}

@end
