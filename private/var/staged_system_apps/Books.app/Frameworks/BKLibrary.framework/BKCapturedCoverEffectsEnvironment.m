@implementation BKCapturedCoverEffectsEnvironment

+ (id)newCapturedEnvironment:(id)a3
{
  id v3;
  BKCapturedCoverEffectsEnvironment *v4;
  void *v5;

  if (!a3)
    return 0;
  v3 = a3;
  v4 = objc_alloc_init(BKCapturedCoverEffectsEnvironment);
  -[BKCapturedCoverEffectsEnvironment setCoverEffectsContent:](v4, "setCoverEffectsContent:", objc_msgSend(v3, "coverEffectsContent"));
  -[BKCapturedCoverEffectsEnvironment setCoverEffectsNightMode:](v4, "setCoverEffectsNightMode:", objc_msgSend(v3, "coverEffectsNightMode"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "coverEffectRTLOverride"));

  -[BKCapturedCoverEffectsEnvironment setCoverEffectRTLOverride:](v4, "setCoverEffectRTLOverride:", v5);
  return v4;
}

+ (id)newCapturedEnvironmentWithNightMode:(BOOL)a3 rtlOverride:(id)a4
{
  _BOOL8 v4;
  id v5;
  BKCapturedCoverEffectsEnvironment *v6;

  v4 = a3;
  v5 = a4;
  v6 = objc_alloc_init(BKCapturedCoverEffectsEnvironment);
  -[BKCapturedCoverEffectsEnvironment setCoverEffectsNightMode:](v6, "setCoverEffectsNightMode:", v4);
  -[BKCapturedCoverEffectsEnvironment setCoverEffectRTLOverride:](v6, "setCoverEffectRTLOverride:", v5);

  return v6;
}

- (unint64_t)coverEffectsContent
{
  return self->_coverEffectsContent;
}

- (void)setCoverEffectsContent:(unint64_t)a3
{
  self->_coverEffectsContent = a3;
}

- (BOOL)coverEffectsNightMode
{
  return self->_coverEffectsNightMode;
}

- (void)setCoverEffectsNightMode:(BOOL)a3
{
  self->_coverEffectsNightMode = a3;
}

- (NSNumber)coverEffectRTLOverride
{
  return self->_coverEffectRTLOverride;
}

- (void)setCoverEffectRTLOverride:(id)a3
{
  objc_storeStrong((id *)&self->_coverEffectRTLOverride, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coverEffectRTLOverride, 0);
}

@end
