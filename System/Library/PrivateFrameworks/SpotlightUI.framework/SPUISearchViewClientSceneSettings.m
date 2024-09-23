@implementation SPUISearchViewClientSceneSettings

- (double)distanceToTopOfIcons
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

- (unint64_t)searchHeaderLayerRenderID
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 1001);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = objc_msgSend(v3, "unsignedLongLongValue");
  else
    v4 = 0;

  return v4;
}

- (unsigned)searchHeaderContextID
{
  void *v2;
  void *v3;
  unsigned int v4;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 1002);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = objc_msgSend(v3, "unsignedIntValue");
  else
    v4 = 0;

  return v4;
}

- (unint64_t)searchHeaderBackgroundLayerRenderID
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
    v4 = objc_msgSend(v3, "unsignedLongLongValue");
  else
    v4 = 0;

  return v4;
}

- (unsigned)searchHeaderBackgroundContextID
{
  void *v2;
  void *v3;
  unsigned int v4;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 1004);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = objc_msgSend(v3, "unsignedIntValue");
  else
    v4 = 0;

  return v4;
}

- (double)keyboardHeight
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 1005);
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

- (double)keyboardProtectorHeight
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 1006);
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

- (BOOL)isKeyboardPresented
{
  void *v2;
  char IsYes;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "flagForSetting:", 1007);
  IsYes = BSSettingFlagIsYes();

  return IsYes;
}

- (CGSize)searchBarSize
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 1008);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "CGSizeValue");
    v5 = v4;
    v7 = v6;
  }
  else
  {
    v5 = *MEMORY[0x24BDBF148];
    v7 = *(double *)(MEMORY[0x24BDBF148] + 8);
  }

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (CGSize)dockedSearchBarSize
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 1009);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "CGSizeValue");
    v5 = v4;
    v7 = v6;
  }
  else
  {
    v5 = *MEMORY[0x24BDBF148];
    v7 = *(double *)(MEMORY[0x24BDBF148] + 8);
  }

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (double)searchBarCornerRadius
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 1010);
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

- (unint64_t)searchHeaderBlurLayerRenderID
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 1011);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = objc_msgSend(v3, "unsignedLongLongValue");
  else
    v4 = 0;

  return v4;
}

- (unsigned)searchHeaderBlurContextID
{
  void *v2;
  void *v3;
  unsigned int v4;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 1012);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = objc_msgSend(v3, "unsignedIntValue");
  else
    v4 = 0;

  return v4;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[FBSSettings initWithSettings:]([SPUISearchViewMutableClientSceneSettings alloc], "initWithSettings:", self);
}

- (id)keyDescriptionForSetting:(int64_t)a3
{
  void *v3;
  objc_super v5;

  if ((unint64_t)(a3 - 1000) > 0xC)
  {
    v5.receiver = self;
    v5.super_class = (Class)SPUISearchViewClientSceneSettings;
    -[FBSSettings keyDescriptionForSetting:](&v5, sel_keyDescriptionForSetting_);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    SPUISearchViewSceneClientSettingsKeyDescription(a3);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(int64_t)a5
{
  void *v5;
  objc_super v7;

  if ((unint64_t)(a5 - 1000) > 0xC)
  {
    v7.receiver = self;
    v7.super_class = (Class)SPUISearchViewClientSceneSettings;
    -[FBSSettings valueDescriptionForFlag:object:ofSetting:](&v7, sel_valueDescriptionForFlag_object_ofSetting_, a3, a4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    SPUISearchViewClientSceneSettingsValueDescription(a5, a3, a4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

@end
