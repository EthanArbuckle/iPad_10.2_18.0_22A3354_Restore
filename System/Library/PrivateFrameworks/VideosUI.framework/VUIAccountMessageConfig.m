@implementation VUIAccountMessageConfig

- (VUIAccountMessageConfig)init
{
  VUIAccountMessageConfig *v2;
  VUIAccountMessageConfig *v3;
  uint64_t v4;
  NSDictionary *visibilityBehaviours;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VUIAccountMessageConfig;
  v2 = -[VUIAccountMessageConfig init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    -[VUIAccountMessageConfig _createVisibilityDictionary](v2, "_createVisibilityDictionary");
    v4 = objc_claimAutoreleasedReturnValue();
    visibilityBehaviours = v3->_visibilityBehaviours;
    v3->_visibilityBehaviours = (NSDictionary *)v4;

    v3->_fallbackVisibilityType = -[VUIAccountMessageConfig _getFallbackVisibilityType](v3, "_getFallbackVisibilityType");
    *(_WORD *)&v3->_alwaysForceOpenSidebarAnimated = 0;
  }
  return v3;
}

- (int64_t)_getFallbackVisibilityType
{
  void *v2;
  void *v3;
  int64_t v4;

  +[VUIFeaturesConfiguration defaultsStringValueForKey:](VUIFeaturesConfiguration, "defaultsStringValueForKey:", CFSTR("fallbackVisibilityType"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = VUIAccountMessageVisibilityTypeFromString(v2);
  else
    v4 = 1;

  return v4;
}

- (void)setVisibilityBehaviours:(id)a3
{
  objc_storeStrong((id *)&self->_visibilityBehaviours, a3);
}

- (void)setFallbackVisibilityType:(int64_t)a3
{
  self->_fallbackVisibilityType = a3;
}

- (void)setAlwaysForceOpenSidebarNonAnimated:(BOOL)a3
{
  self->_alwaysForceOpenSidebarNonAnimated = a3;
}

- (void)setAlwaysForceOpenSidebarAnimated:(BOOL)a3
{
  self->_alwaysForceOpenSidebarAnimated = a3;
}

- (id)_createVisibilityDictionary
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[2];
  _QWORD v8[2];
  _QWORD v9[2];
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("highVisibility");
  v8[0] = CFSTR("animateMessageIn");
  v8[1] = CFSTR("forceOpenSidebar");
  v9[0] = MEMORY[0x1E0C9AAB0];
  v9[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v2;
  v10[1] = CFSTR("passiveVisibility");
  v6[0] = CFSTR("animateMessageIn");
  v6[1] = CFSTR("forceOpenSidebar");
  v7[0] = MEMORY[0x1E0C9AAA0];
  v7[1] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSDictionary)visibilityBehaviours
{
  return self->_visibilityBehaviours;
}

- (int64_t)fallbackVisibilityType
{
  return self->_fallbackVisibilityType;
}

- (BOOL)alwaysForceOpenSidebarAnimated
{
  return self->_alwaysForceOpenSidebarAnimated;
}

- (BOOL)alwaysForceOpenSidebarNonAnimated
{
  return self->_alwaysForceOpenSidebarNonAnimated;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visibilityBehaviours, 0);
}

@end
