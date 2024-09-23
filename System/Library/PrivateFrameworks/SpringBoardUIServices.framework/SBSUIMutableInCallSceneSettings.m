@implementation SBSUIMutableInCallSceneSettings

- (id)copyWithZone:(_NSZone *)a3
{
  return -[FBSSettings initWithSettings:]([SBSUIInCallSceneSettings alloc], "initWithSettings:", self);
}

- (void)setInCallPresentationMode:(int64_t)a3
{
  void *v4;
  id v5;

  -[FBSSettings otherSettings](self, "otherSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forSetting:", v4, 3001);

}

- (BOOL)isAttachedToWindowedAccessory
{
  void *v2;
  void *v3;
  char v4;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 3002);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (void)setAttachedToWindowedAccessory:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  -[FBSSettings otherSettings](self, "otherSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forSetting:", v4, 3002);

}

- (CGRect)windowedAccessoryCutoutFrameInScreen
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 3003);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "CGRectValue");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (void)setWindowedAccessoryCutoutFrameInScreen:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v7;
  id v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[FBSSettings otherSettings](self, "otherSettings");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", x, y, width, height);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forSetting:", v7, 3003);

}

- (void)setScreenSharingPresentation:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  -[FBSSettings otherSettings](self, "otherSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forSetting:", v4, 3004);

}

- (BOOL)systemControlsShouldPresentAsEmbedded
{
  void *v2;
  void *v3;
  char v4;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 3005);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (void)setSystemControlsShouldPresentAsEmbedded:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  -[FBSSettings otherSettings](self, "otherSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forSetting:", v4, 3005);

}

- (void)setBeingShownAboveCoverSheet:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  objc_super v7;

  v3 = a3;
  -[FBSSettings otherSettings](self, "otherSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forSetting:", v6, 3006);

  if (v3)
  {
    v7.receiver = self;
    v7.super_class = (Class)SBSUIMutableInCallSceneSettings;
    -[SBSUIMutableInCallSceneSettings setDeactivationReasons:](&v7, sel_setDeactivationReasons_, -[SBSUIMutableInCallSceneSettings deactivationReasons](self, "deactivationReasons") & 0xFFFFFFFFFFFFFFFDLL);
  }
}

- (void)setDeactivationReasons:(unint64_t)a3
{
  void *v5;
  void *v6;
  int v7;
  unint64_t v8;
  objc_super v9;

  -[FBSSettings otherSettings](self, "otherSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForSetting:", 3006);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  if (v7)
    v8 = a3 & 0xFFFFFFFFFFFFFFFDLL;
  else
    v8 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBSUIMutableInCallSceneSettings;
  -[SBSUIMutableInCallSceneSettings setDeactivationReasons:](&v9, sel_setDeactivationReasons_, v8);
}

- (void)setRequestedPresentationConfigurationIdentifier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[FBSSettings otherSettings](self, "otherSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forSetting:", v4, 3007);

}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  objc_super v4;

  if (a3 - 3001 <= 6)
    return off_1E4C40B58[a3 - 3001];
  v4.receiver = self;
  v4.super_class = (Class)SBSUIMutableInCallSceneSettings;
  -[FBSSettings keyDescriptionForSetting:](&v4, sel_keyDescriptionForSetting_);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5
{
  void *v5;
  objc_super v7;

  if (a5 - 3001 > 6)
  {
    v7.receiver = self;
    v7.super_class = (Class)SBSUIMutableInCallSceneSettings;
    -[FBSSettings valueDescriptionForFlag:object:ofSetting:](&v7, sel_valueDescriptionForFlag_object_ofSetting_, a3, a4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    SBSUIInCallSceneClientSettingValueDescription_0(a5, a4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (int64_t)inCallPresentationMode
{
  return self->_inCallPresentationMode;
}

- (BOOL)isScreenSharingPresentation
{
  return self->_screenSharingPresentation;
}

- (NSUUID)requestedPresentationConfigurationIdentifier
{
  return self->_requestedPresentationConfigurationIdentifier;
}

- (BOOL)isBeingShownAboveCoverSheet
{
  return self->_beingShownAboveCoverSheet;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestedPresentationConfigurationIdentifier, 0);
}

@end
