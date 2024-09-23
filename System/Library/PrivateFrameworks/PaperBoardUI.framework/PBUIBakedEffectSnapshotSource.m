@implementation PBUIBakedEffectSnapshotSource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_effectConfiguration, 0);
  objc_storeStrong((id *)&self->_snapshot, 0);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong((id *)&self->_cacheIdentifier, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = objc_alloc_init((Class)objc_opt_class());
  -[PBUIBakedEffectSnapshotSource cacheIdentifier](self, "cacheIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCacheIdentifier:", v5);

  -[PBUIBakedEffectSnapshotSource legibilitySettings](self, "legibilitySettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLegibilitySettings:", v6);

  -[PBUIBakedEffectSnapshotSource snapshot](self, "snapshot");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSnapshot:", v7);

  return v4;
}

- (void)setSnapshot:(id)a3
{
  objc_storeStrong((id *)&self->_snapshot, a3);
}

- (UIImage)snapshot
{
  return self->_snapshot;
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (void)setLegibilitySettings:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setEffectConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_effectConfiguration, a3);
}

- (void)setCacheIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)cacheIdentifier
{
  return self->_cacheIdentifier;
}

- (PBUIBakedEffectSnapshotSource)initWithSnapshotSource:(id)a3
{
  id v4;
  PBUIBakedEffectSnapshotSource *v5;
  void *v6;
  uint64_t v7;
  NSString *cacheIdentifier;
  void *v9;
  uint64_t v10;
  _UILegibilitySettings *legibilitySettings;
  uint64_t v12;
  UIImage *snapshot;
  uint64_t v14;
  PBUIWallpaperEffectConfiguration *effectConfiguration;
  PBUIBakedEffectSnapshotSource *v16;

  v4 = a3;
  if (v4)
  {
    v5 = -[PBUIBakedEffectSnapshotSource init](self, "init");
    if (v5)
    {
      objc_msgSend(v4, "cacheIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "copy");
      cacheIdentifier = v5->_cacheIdentifier;
      v5->_cacheIdentifier = (NSString *)v7;

      objc_msgSend(v4, "legibilitySettings");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "copy");
      legibilitySettings = v5->_legibilitySettings;
      v5->_legibilitySettings = (_UILegibilitySettings *)v10;

      objc_msgSend(v4, "snapshot");
      v12 = objc_claimAutoreleasedReturnValue();
      snapshot = v5->_snapshot;
      v5->_snapshot = (UIImage *)v12;

      +[PBUIWallpaperEffectConfiguration normal]();
      v14 = objc_claimAutoreleasedReturnValue();
      effectConfiguration = v5->_effectConfiguration;
      v5->_effectConfiguration = (PBUIWallpaperEffectConfiguration *)v14;

    }
    self = v5;
    v16 = self;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (BOOL)effectsAreBakedIn
{
  return 1;
}

- (NSString)description
{
  return (NSString *)-[PBUIBakedEffectSnapshotSource descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[PBUIBakedEffectSnapshotSource descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBUIBakedEffectSnapshotSource cacheIdentifier](self, "cacheIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:", v5, CFSTR("cacheIdentifier"));

  -[PBUIBakedEffectSnapshotSource snapshot](self, "snapshot");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v4, "appendObject:withName:", v6, CFSTR("snapshot"));

  -[PBUIBakedEffectSnapshotSource effectConfiguration](self, "effectConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v4, "appendObject:withName:", v8, CFSTR("effectConfiguration"));

  return v4;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[PBUIBakedEffectSnapshotSource succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (PBUIWallpaperEffectConfiguration)effectConfiguration
{
  return self->_effectConfiguration;
}

@end
