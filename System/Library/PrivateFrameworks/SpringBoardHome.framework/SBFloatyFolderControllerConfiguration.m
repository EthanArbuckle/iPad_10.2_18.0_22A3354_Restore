@implementation SBFloatyFolderControllerConfiguration

- (SBFloatyFolderControllerConfiguration)initWithConfiguration:(id)a3
{
  id v4;
  SBFloatyFolderControllerConfiguration *v5;
  void *v6;
  char isKindOfClass;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBFloatyFolderControllerConfiguration;
  v5 = -[SBFolderControllerConfiguration initWithConfiguration:](&v9, sel_initWithConfiguration_, v4);
  if (v5)
  {
    objc_opt_self();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
      v5->_backgroundEffect = objc_msgSend(v4, "backgroundEffect");
  }

  return v5;
}

- (unint64_t)backgroundEffect
{
  return self->_backgroundEffect;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBFloatyFolderControllerConfiguration;
  -[SBFolderControllerConfiguration descriptionBuilderWithMultilinePrefix:](&v7, sel_descriptionBuilderWithMultilinePrefix_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "appendInteger:withName:", -[SBFloatyFolderControllerConfiguration backgroundEffect](self, "backgroundEffect"), CFSTR("backgroundEffect"));
  return v4;
}

- (void)setBackgroundEffect:(unint64_t)a3
{
  self->_backgroundEffect = a3;
}

@end
