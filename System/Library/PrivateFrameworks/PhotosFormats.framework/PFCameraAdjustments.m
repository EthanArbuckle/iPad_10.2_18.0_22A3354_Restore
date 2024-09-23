@implementation PFCameraAdjustments

- (PFCameraAdjustments)initWithAdjustments:(id)a3
{
  id v4;
  PFCameraAdjustments *v5;
  uint64_t v6;
  NSString *effectFilterName;
  uint64_t v8;
  NSString *portraitEffectFilterName;
  uint64_t v10;
  AVApplePortraitMetadata *portraitMetadata;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PFCameraAdjustments;
  v5 = -[PFCameraAdjustments init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "effectFilterName");
    v6 = objc_claimAutoreleasedReturnValue();
    effectFilterName = v5->_effectFilterName;
    v5->_effectFilterName = (NSString *)v6;

    objc_msgSend(v4, "portraitEffectFilterName");
    v8 = objc_claimAutoreleasedReturnValue();
    portraitEffectFilterName = v5->_portraitEffectFilterName;
    v5->_portraitEffectFilterName = (NSString *)v8;

    objc_msgSend(v4, "portraitMetadata");
    v10 = objc_claimAutoreleasedReturnValue();
    portraitMetadata = v5->_portraitMetadata;
    v5->_portraitMetadata = (AVApplePortraitMetadata *)v10;

    v5->_depthEnabled = objc_msgSend(v4, "isDepthEnabled");
    v5->_isEligibleForCinematicAudioEffectProcessing = objc_msgSend(v4, "isEligibleForCinematicAudioEffectProcessing");
    v5->_cinematicVideoRenderingVersion = objc_msgSend(v4, "cinematicVideoRenderingVersion");
    objc_msgSend(v4, "cropRect");
    v5->_cropRect.origin.x = v12;
    v5->_cropRect.origin.y = v13;
    v5->_cropRect.size.width = v14;
    v5->_cropRect.size.height = v15;
    v5->_sloMoEnabled = objc_msgSend(v4, "isSloMoEnabled");
  }

  return v5;
}

- (PFCameraAdjustments)initWithEffectFilter:(id)a3 cropRect:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v10;
  PFCameraAdjustments *v11;
  PFCameraAdjustments *v12;
  objc_super v14;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v10 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PFCameraAdjustments;
  v11 = -[PFCameraAdjustments init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_effectFilterName, a3);
    v12->_cropRect.origin.x = x;
    v12->_cropRect.origin.y = y;
    v12->_cropRect.size.width = width;
    v12->_cropRect.size.height = height;
  }

  return v12;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[PFCameraAdjustments initWithAdjustments:]([PFMutableCameraAdjustments alloc], "initWithAdjustments:", self);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[PFCameraAdjustments effectFilterName](self, "effectFilterName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("effectFilterName"));

  -[PFCameraAdjustments portraitEffectFilterName](self, "portraitEffectFilterName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("portraitEffectFilterName"));

  -[PFCameraAdjustments portraitMetadata](self, "portraitMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("portraitMetadata"));

  objc_msgSend(v4, "encodeBool:forKey:", -[PFCameraAdjustments isDepthEnabled](self, "isDepthEnabled"), CFSTR("depthEnabled"));
  objc_msgSend(v4, "encodeBool:forKey:", -[PFCameraAdjustments isEligibleForCinematicAudioEffectProcessing](self, "isEligibleForCinematicAudioEffectProcessing"), CFSTR("isEligibleForCinematicAudioEffectProcessing"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[PFCameraAdjustments cinematicVideoRenderingVersion](self, "cinematicVideoRenderingVersion"), CFSTR("cinematicVideoRenderingVersion"));
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &self->_cropRect, "{CGRect={CGPoint=dd}{CGSize=dd}}");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("cropRect"));
  objc_msgSend(v4, "encodeBool:forKey:", -[PFCameraAdjustments isSloMoEnabled](self, "isSloMoEnabled"), CFSTR("sloMoEnabled"));

}

- (PFCameraAdjustments)initWithCoder:(id)a3
{
  id v4;
  PFCameraAdjustments *v5;
  uint64_t v6;
  NSString *effectFilterName;
  uint64_t v8;
  NSString *portraitEffectFilterName;
  uint64_t v10;
  AVApplePortraitMetadata *portraitMetadata;
  void *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PFCameraAdjustments;
  v5 = -[PFCameraAdjustments init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("effectFilterName"));
    v6 = objc_claimAutoreleasedReturnValue();
    effectFilterName = v5->_effectFilterName;
    v5->_effectFilterName = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("portraitEffectFilterName"));
    v8 = objc_claimAutoreleasedReturnValue();
    portraitEffectFilterName = v5->_portraitEffectFilterName;
    v5->_portraitEffectFilterName = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("portraitMetadata"));
    v10 = objc_claimAutoreleasedReturnValue();
    portraitMetadata = v5->_portraitMetadata;
    v5->_portraitMetadata = (AVApplePortraitMetadata *)v10;

    v5->_depthEnabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("depthEnabled"));
    v5->_isEligibleForCinematicAudioEffectProcessing = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isEligibleForCinematicAudioEffectProcessing"));
    v5->_cinematicVideoRenderingVersion = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("cinematicVideoRenderingVersion"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cropRect"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "getValue:size:", &v5->_cropRect, 32);
    if (!PFCameraAdjustmentsCropIsValid(v5->_cropRect.origin.x, v5->_cropRect.origin.y, v5->_cropRect.size.width, v5->_cropRect.size.height))
    {
      v5->_cropRect.origin = 0u;
      v5->_cropRect.size = 0u;
    }
    v5->_sloMoEnabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("sloMoEnabled"));

  }
  return v5;
}

- (BOOL)hasCrop
{
  CGFloat v2;
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;

  -[PFCameraAdjustments cropRect](self, "cropRect");
  return PFCameraAdjustmentsCropIsValid(v2, v3, v4, v5);
}

- (BOOL)canBeRenderedByCapturePipelineWithVideoComplement:(BOOL)a3 deferredIdentifier:(id)a4
{
  _BOOL4 v4;
  id v6;
  BOOL depthEnabled;
  void *v8;

  v4 = a3;
  v6 = a4;
  if (v6)
  {
    if (!v4)
    {
      depthEnabled = self->_depthEnabled;
      goto LABEL_8;
    }
    if (self->_depthEnabled && !-[PFCameraAdjustments hasCrop](self, "hasCrop"))
    {
      -[PFCameraAdjustments effectFilterName](self, "effectFilterName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      depthEnabled = v8 == 0;

      goto LABEL_8;
    }
  }
  depthEnabled = 0;
LABEL_8:

  return depthEnabled;
}

- (NSString)effectFilterName
{
  return self->_effectFilterName;
}

- (NSString)portraitEffectFilterName
{
  return self->_portraitEffectFilterName;
}

- (AVApplePortraitMetadata)portraitMetadata
{
  return self->_portraitMetadata;
}

- (BOOL)isDepthEnabled
{
  return self->_depthEnabled;
}

- (BOOL)isEligibleForCinematicAudioEffectProcessing
{
  return self->_isEligibleForCinematicAudioEffectProcessing;
}

- (unint64_t)cinematicVideoRenderingVersion
{
  return self->_cinematicVideoRenderingVersion;
}

- (CGRect)cropRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_cropRect.origin.x;
  y = self->_cropRect.origin.y;
  width = self->_cropRect.size.width;
  height = self->_cropRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (BOOL)isSloMoEnabled
{
  return self->_sloMoEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_portraitMetadata, 0);
  objc_storeStrong((id *)&self->_portraitEffectFilterName, 0);
  objc_storeStrong((id *)&self->_effectFilterName, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
