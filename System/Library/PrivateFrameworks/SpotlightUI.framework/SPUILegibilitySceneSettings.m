@implementation SPUILegibilitySceneSettings

- (_UILegibilitySettings)legibilitySettings
{
  void *v2;
  void *v3;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 2000);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (_UILegibilitySettings *)v3;
}

- (id)keyDescriptionForSetting:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  __CFString *v5;
  objc_super v7;
  uint64_t v8;
  uint64_t v9;

  if (a3 == 2000)
  {
    v5 = CFSTR("legibilitySettings");
  }
  else
  {
    v8 = v3;
    v9 = v4;
    v7.receiver = self;
    v7.super_class = (Class)SPUILegibilitySceneSettings;
    -[FBSSettings keyDescriptionForSetting:](&v7, sel_keyDescriptionForSetting_);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(int64_t)a5
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  objc_super v9;
  uint64_t v10;
  uint64_t v11;

  if (a5 == 2000)
  {
    v7 = 0;
  }
  else
  {
    v10 = v5;
    v11 = v6;
    v9.receiver = self;
    v9.super_class = (Class)SPUILegibilitySceneSettings;
    -[FBSSettings valueDescriptionForFlag:object:ofSetting:](&v9, sel_valueDescriptionForFlag_object_ofSetting_, a3, a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

@end
