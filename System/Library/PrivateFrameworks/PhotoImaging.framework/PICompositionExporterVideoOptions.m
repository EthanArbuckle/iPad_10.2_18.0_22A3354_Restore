@implementation PICompositionExporterVideoOptions

- (PICompositionExporterVideoOptions)init
{
  PICompositionExporterVideoOptions *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PICompositionExporterVideoOptions;
  v2 = -[PICompositionExporterOptions init](&v4, sel_init);
  -[PICompositionExporterOptions setColorSpace:](v2, "setColorSpace:", 0);
  return v2;
}

- (id)description
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  void *v11;
  void *v13;

  v13 = (void *)MEMORY[0x1E0CB3940];
  v3 = objc_opt_class();
  -[PICompositionExporterOptions priority](self, "priority");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PICompositionExporterOptions colorSpace](self, "colorSpace");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PICompositionExporterOptions scalePolicy](self, "scalePolicy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PICompositionExporterVideoOptions videoCodecType](self, "videoCodecType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PICompositionExporterVideoOptions bypassOutputSettingsIfNoComposition](self, "bypassOutputSettingsIfNoComposition"))
  {
    v8 = CFSTR("YES");
  }
  else
  {
    v8 = CFSTR("NO");
  }
  if (-[PICompositionExporterVideoOptions applyVideoOrientationAsMetadata](self, "applyVideoOrientationAsMetadata"))
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  if (-[PICompositionExporterVideoOptions requireHardwareEncoder](self, "requireHardwareEncoder"))
    v10 = CFSTR("YES");
  else
    v10 = CFSTR("NO");
  objc_msgSend(v13, "stringWithFormat:", CFSTR("<%@:%p - priority: %@, color space: %@, scale policy: %@, video codec type: %@, bypass settings: %@, orientation as metadata: %@, hardware encoder: %@>"), v3, self, v4, v5, v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)metadataProcessor
{
  return objc_getProperty(self, a2, 48, 1);
}

- (void)setMetadataProcessor:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (NSString)videoCodecType
{
  return self->_videoCodecType;
}

- (void)setVideoCodecType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (BOOL)preserveSourceColorSpace
{
  return self->_preserveSourceColorSpace;
}

- (void)setPreserveSourceColorSpace:(BOOL)a3
{
  self->_preserveSourceColorSpace = a3;
}

- (BOOL)bypassOutputSettingsIfNoComposition
{
  return self->_bypassOutputSettingsIfNoComposition;
}

- (void)setBypassOutputSettingsIfNoComposition:(BOOL)a3
{
  self->_bypassOutputSettingsIfNoComposition = a3;
}

- (BOOL)applyVideoOrientationAsMetadata
{
  return self->_applyVideoOrientationAsMetadata;
}

- (void)setApplyVideoOrientationAsMetadata:(BOOL)a3
{
  self->_applyVideoOrientationAsMetadata = a3;
}

- (BOOL)requireHardwareEncoder
{
  return self->_requireHardwareEncoder;
}

- (void)setRequireHardwareEncoder:(BOOL)a3
{
  self->_requireHardwareEncoder = a3;
}

- (BOOL)includeCinematicVideoTracks
{
  return self->_includeCinematicVideoTracks;
}

- (void)setIncludeCinematicVideoTracks:(BOOL)a3
{
  self->_includeCinematicVideoTracks = a3;
}

- (BOOL)computeDigest
{
  return self->_computeDigest;
}

- (void)setComputeDigest:(BOOL)a3
{
  self->_computeDigest = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoCodecType, 0);
  objc_storeStrong(&self->_metadataProcessor, 0);
}

@end
