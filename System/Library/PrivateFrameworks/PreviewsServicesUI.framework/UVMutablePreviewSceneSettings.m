@implementation UVMutablePreviewSceneSettings

- (CGSize)previewMaximumSize
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
  objc_msgSend(v2, "objectForSetting:", 1100101);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "CGSizeValue");
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)setPreviewMaximumSize:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  void *v5;
  void *v6;
  _QWORD v7[2];

  height = a3.height;
  width = a3.width;
  -[FBSSettings otherSettings](self, "otherSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *(CGFloat *)v7 = width;
  *(CGFloat *)&v7[1] = height;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithBytes:objCType:", v7, "{CGSize=dd}");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forSetting:", v6, 1100101);

}

- (int64_t)previewSceneLayout
{
  void *v2;
  void *v3;
  int64_t v4;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 1100102);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

- (void)setPreviewSceneLayout:(int64_t)a3
{
  void *v4;
  id v5;

  -[FBSSettings otherSettings](self, "otherSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forSetting:", v4, 1100102);

}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[FBSSettings initWithSettings:]([UVPreviewSceneSettings alloc], "initWithSettings:", self);
}

- (id)makeCopy
{
  return (id)-[UVMutablePreviewSceneSettings copy](self, "copy");
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithSettings:", self);
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  const __CFString *v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  objc_super v12;

  if (a3 == 1100102)
    v5 = CFSTR("previewSceneLayout");
  else
    v5 = 0;
  if (a3 == 1100101)
    v6 = CFSTR("previewMaximumSize");
  else
    v6 = (__CFString *)v5;
  v7 = v6;
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)UVMutablePreviewSceneSettings;
    -[FBSSettings keyDescriptionForSetting:](&v12, sel_keyDescriptionForSetting_, a3);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  return v10;
}

- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  objc_super v14;

  v8 = a4;
  _PreviewSceneSettingValueDescription(a5, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)UVMutablePreviewSceneSettings;
    -[FBSSettings valueDescriptionForFlag:object:ofSetting:](&v14, sel_valueDescriptionForFlag_object_ofSetting_, a3, v8, a5);
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;

  return v12;
}

@end
