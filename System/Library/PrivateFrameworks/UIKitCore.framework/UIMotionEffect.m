@implementation UIMotionEffect

- (id)_animationIdentifier
{
  NSString *animationIdentifier;
  void *v4;
  objc_class *v5;
  void *v6;
  NSString *v7;
  NSString *v8;

  animationIdentifier = self->_animationIdentifier;
  if (!animationIdentifier)
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p>"), v6, self);
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    v8 = self->_animationIdentifier;
    self->_animationIdentifier = v7;

    animationIdentifier = self->_animationIdentifier;
  }
  return animationIdentifier;
}

- (id)_preferredMotionAnalyzerSettings
{
  return objc_retainAutorelease(self->_preferredMotionAnalyzerSettings);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animationIdentifier, 0);
  objc_storeStrong((id *)&self->_preferredMotionAnalyzerSettings, 0);
}

- (UIMotionEffect)init
{
  UIMotionEffect *v2;
  UIMotionEffect *v3;
  UIMotionEffect *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIMotionEffect;
  v2 = -[UIMotionEffect init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    UIMotionEffectCommonInit(v2);
    v4 = v3;
  }

  return v3;
}

- (NSDictionary)keyPathsAndRelativeValuesForViewerOffset:(UIOffset)viewerOffset
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

- (id)_keyPathsAndRelativeValuesForPose:(id)a3
{
  objc_msgSend(a3, "viewerOffset");
  return -[UIMotionEffect keyPathsAndRelativeValuesForViewerOffset:](self, "keyPathsAndRelativeValuesForViewerOffset:");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;

  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "_setPreferredMotionAnalyzerSettings:", self->_preferredMotionAnalyzerSettings);
  return v4;
}

- (UIMotionEffect)initWithCoder:(NSCoder *)coder
{
  NSCoder *v3;
  UIMotionEffect *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UIMotionEffect;
  v3 = coder;
  v4 = -[UIMotionEffect init](&v8, sel_init);
  UIMotionEffectCommonInit(v4);
  -[NSCoder decodeObjectForKey:](v3, "decodeObjectForKey:", CFSTR("preferredMotionAnalyzerSettingsDictionary"), v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    +[PTSettings settingsFromArchiveDictionary:](_UIMotionAnalyzerSettings, "settingsFromArchiveDictionary:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIMotionEffect _setPreferredMotionAnalyzerSettings:](v4, "_setPreferredMotionAnalyzerSettings:", v6);

  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  _UIMotionAnalyzerSettings *preferredMotionAnalyzerSettings;
  id v4;
  id v5;

  preferredMotionAnalyzerSettings = self->_preferredMotionAnalyzerSettings;
  v4 = a3;
  -[PTSettings archiveDictionary](preferredMotionAnalyzerSettings, "archiveDictionary");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("preferredMotionAnalyzerSettingsDictionary"));

}

- (void)_setPreferredMotionAnalyzerSettings:(id)a3
{
  _UIMotionAnalyzerSettings *v5;
  _UIMotionAnalyzerSettings **p_preferredMotionAnalyzerSettings;
  _UIMotionAnalyzerSettings *preferredMotionAnalyzerSettings;
  _UIMotionAnalyzerSettings *v8;

  v5 = (_UIMotionAnalyzerSettings *)a3;
  preferredMotionAnalyzerSettings = self->_preferredMotionAnalyzerSettings;
  p_preferredMotionAnalyzerSettings = &self->_preferredMotionAnalyzerSettings;
  if (preferredMotionAnalyzerSettings != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_preferredMotionAnalyzerSettings, a3);
    v5 = v8;
  }

}

@end
