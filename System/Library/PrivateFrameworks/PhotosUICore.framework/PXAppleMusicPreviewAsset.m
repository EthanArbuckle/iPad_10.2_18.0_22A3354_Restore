@implementation PXAppleMusicPreviewAsset

- (int64_t)px_storyResourceKind
{
  return 2;
}

- (PXAppleMusicPreviewAsset)initWithOriginalAsset:(id)a3
{
  id v5;
  PXAppleMusicPreviewAsset *v6;
  PXAppleMusicPreviewAsset *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXAppleMusicPreviewAsset;
  v6 = -[PXAppleMusicPreviewAsset init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_originalAsset, a3);

  return v7;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  return self->_originalAsset;
}

- (BOOL)isEqual:(id)a3
{
  PXAppleMusicPreviewAsset *v4;
  void *v5;
  void *v6;
  char v7;

  v4 = (PXAppleMusicPreviewAsset *)a3;
  if (v4 == self)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[PXAppleMusicPreviewAsset identifier](v4, "identifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXAppleMusicPreviewAsset identifier](self, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5 == v6)
        v7 = 1;
      else
        v7 = objc_msgSend(v5, "isEqual:", v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)flags
{
  void *v2;
  unint64_t v3;

  -[PXAppleMusicPreviewAsset originalAsset](self, "originalAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "flags") & 0xFFFFFFFFFFFFFFFDLL;

  return v3;
}

- (Class)audioSessionClass
{
  return (Class)objc_opt_class();
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration
{
  return +[PXAppleMusicPreviewAsset previewClipDuration](PXAppleMusicPreviewAsset, "previewClipDuration");
}

- (int64_t)catalog
{
  return 3;
}

- (PXAppleMusicAsset)originalAsset
{
  return self->_originalAsset;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalAsset, 0);
}

+ ($3CC8671D27C23BF42ADDB32F2B5E48AE)previewClipDuration
{
  return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeMakeWithSeconds((CMTime *)retstr, 90.0, PXAudioDefaultCMTimeScale);
}

@end
