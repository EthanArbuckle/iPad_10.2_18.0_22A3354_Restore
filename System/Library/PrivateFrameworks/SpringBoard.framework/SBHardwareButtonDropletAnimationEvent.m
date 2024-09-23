@implementation SBHardwareButtonDropletAnimationEvent

- (int64_t)type
{
  return 39;
}

- (SBHardwareButtonDropletAnimationEvent)initWithPreludeToken:(id)a3 zoomUpToken:(id)a4
{
  id v8;
  id v9;
  SBHardwareButtonDropletAnimationEvent *v10;
  SBHardwareButtonDropletAnimationEvent *v11;
  void *v13;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  if ((v8 == 0) != (v9 != 0))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBHardwareButtonDropletAnimationEvent.m"), 28, CFSTR("Must have either preludeToken OR zoomUpToken"));

  }
  v14.receiver = self;
  v14.super_class = (Class)SBHardwareButtonDropletAnimationEvent;
  v10 = -[SBHardwareButtonDropletAnimationEvent init](&v14, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_preludeToken, a3);
    objc_storeStrong((id *)&v11->_zoomUpToken, a4);
  }

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[SBHardwareButtonDropletAnimationEvent initWithPreludeToken:zoomUpToken:]([SBHardwareButtonDropletAnimationEvent alloc], "initWithPreludeToken:zoomUpToken:", self->_preludeToken, self->_zoomUpToken);
}

- (unint64_t)eventSubtype
{
  return 0;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  id v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBHardwareButtonDropletAnimationEvent;
  -[SBSwitcherModifierEvent descriptionBuilderWithMultilinePrefix:](&v8, sel_descriptionBuilderWithMultilinePrefix_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "appendObject:withName:", self->_preludeToken, CFSTR("preludeToken"));
  v6 = (id)objc_msgSend(v4, "appendObject:withName:", self->_zoomUpToken, CFSTR("zoomUpToken"));
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoomUpToken, 0);
  objc_storeStrong((id *)&self->_preludeToken, 0);
}

@end
