@implementation SPUISearchViewSceneSettings

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[FBSSettings initWithSettings:]([SPUIMutableSearchViewSceneSettings alloc], "initWithSettings:", self);
}

- (double)revealProgress
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 1000);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  v4 = 0.0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "doubleValue");
    v4 = v5;
  }

  return v4;
}

- (unint64_t)presentationSource
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 1002);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = objc_msgSend(v3, "integerValue");
  else
    v4 = 0;

  return v4;
}

- (unint64_t)presentationIntent
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 1003);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = objc_msgSend(v3, "integerValue");
  else
    v4 = 0;

  return v4;
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  __CFString *v5;
  objc_super v7;
  uint64_t v8;
  uint64_t v9;

  switch(a3)
  {
    case 0x3E8uLL:
      return CFSTR("revealProgress");
    case 0x3EBuLL:
      return CFSTR("deactivationReasons");
    case 0x3EAuLL:
      v5 = CFSTR("presentationSource");
      break;
    default:
      v8 = v3;
      v9 = v4;
      v7.receiver = self;
      v7.super_class = (Class)SPUISearchViewSceneSettings;
      -[SPUILegibilitySceneSettings keyDescriptionForSetting:](&v7, sel_keyDescriptionForSetting_);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
  }
  return v5;
}

- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5
{
  id v8;
  uint64_t v10;
  void *v11;
  objc_super v13;

  v8 = a4;
  if (a5 - 1000 > 3 || a5 == 1001)
  {
    v13.receiver = self;
    v13.super_class = (Class)SPUISearchViewSceneSettings;
    -[SPUILegibilitySceneSettings valueDescriptionForFlag:object:ofSetting:](&v13, sel_valueDescriptionForFlag_object_ofSetting_, a3, v8, a5);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    SPUISearchViewSceneSettingValueDescription(a5, v8);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v11 = (void *)v10;

  return v11;
}

@end
