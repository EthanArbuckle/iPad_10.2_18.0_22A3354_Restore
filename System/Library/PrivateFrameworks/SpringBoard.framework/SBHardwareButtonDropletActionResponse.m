@implementation SBHardwareButtonDropletActionResponse

- (int64_t)type
{
  return 42;
}

- (SBHardwareButtonDropletActionResponse)initWithPreludeToken:(id)a3 zoomUpToken:(id)a4 appLayout:(id)a5 action:(unint64_t)a6
{
  unint64_t v12;
  unint64_t v13;
  id v14;
  SBHardwareButtonDropletActionResponse *v15;
  void *v16;
  void *v18;
  void *v19;
  objc_super v20;

  v12 = (unint64_t)a3;
  v13 = (unint64_t)a4;
  v14 = a5;
  v20.receiver = self;
  v20.super_class = (Class)SBHardwareButtonDropletActionResponse;
  v15 = -[SBChainableModifierEventResponse init](&v20, sel_init);
  if (v15)
  {
    if (a6 != 1)
    {
      if (!a6)
      {
        if (v12)
        {
          if (!v14)
          {
LABEL_6:
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, v15, CFSTR("SBHardwareButtonDropletActionResponse.m"), 35, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("appLayout != nil"));
LABEL_15:

          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, v15, CFSTR("SBHardwareButtonDropletActionResponse.m"), 34, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("preludeToken != nil"));

          if (!v14)
            goto LABEL_6;
        }
      }
LABEL_9:
      v15->_action = a6;
      objc_storeStrong((id *)&v15->_preludeToken, a3);
      objc_storeStrong((id *)&v15->_zoomUpToken, a4);
      objc_storeStrong((id *)&v15->_appLayout, a5);
      goto LABEL_10;
    }
    if (v12 | v13)
    {
      if (v14)
        goto LABEL_9;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, v15, CFSTR("SBHardwareButtonDropletActionResponse.m"), 39, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("zoomUpToken != nil || preludeToken != nil"));

      if (v14)
        goto LABEL_9;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, v15, CFSTR("SBHardwareButtonDropletActionResponse.m"), 40, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("appLayout != nil"));
    goto LABEL_15;
  }
LABEL_10:

  return v15;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SBHardwareButtonDropletActionResponse;
  -[SBChainableModifierEventResponse descriptionBuilderWithMultilinePrefix:](&v10, sel_descriptionBuilderWithMultilinePrefix_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "appendObject:withName:", self->_preludeToken, CFSTR("preludeToken"));
  v6 = (id)objc_msgSend(v4, "appendObject:withName:", self->_zoomUpToken, CFSTR("zoomUpToken"));
  v7 = (id)objc_msgSend(v4, "appendObject:withName:", self->_appLayout, CFSTR("appLayout"));
  v8 = (id)objc_msgSend(v4, "appendInteger:withName:", self->_action, CFSTR("action"));
  return v4;
}

- (SBHardwareButtonLaunchPreludeAnimationToken)preludeToken
{
  return self->_preludeToken;
}

- (SBHardwareButtonLaunchZoomUpAnimationToken)zoomUpToken
{
  return self->_zoomUpToken;
}

- (SBAppLayout)appLayout
{
  return self->_appLayout;
}

- (unint64_t)action
{
  return self->_action;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appLayout, 0);
  objc_storeStrong((id *)&self->_zoomUpToken, 0);
  objc_storeStrong((id *)&self->_preludeToken, 0);
}

@end
