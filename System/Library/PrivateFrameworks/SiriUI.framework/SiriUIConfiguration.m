@implementation SiriUIConfiguration

- (SiriUIConfiguration)initWithFlamesViewFidelity:(int64_t)a3 isSystemHostedPresentation:(BOOL)a4
{
  return -[SiriUIConfiguration initWithFlamesViewFidelity:isSystemHostedPresentation:allowResizingBetweenModes:siriViewMode:showsSensitiveUI:](self, "initWithFlamesViewFidelity:isSystemHostedPresentation:allowResizingBetweenModes:siriViewMode:showsSensitiveUI:", a3, a4, 0, 0, 0);
}

- (SiriUIConfiguration)initWithFlamesViewFidelity:(int64_t)a3 isSystemHostedPresentation:(BOOL)a4 allowResizingBetweenModes:(BOOL)a5 siriViewMode:(int64_t)a6 showsSensitiveUI:(BOOL)a7
{
  SiriUIConfiguration *result;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SiriUIConfiguration;
  result = -[SiriUIConfiguration init](&v13, sel_init);
  if (result)
  {
    result->_isSystemHostedPresentation = a4;
    result->_flamesViewFidelity = a3;
    result->_siriViewMode = a6;
    result->_allowResizingBetweenModes = a5;
    result->_showsSensitiveUI = a7;
  }
  return result;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[SiriUIConfiguration flamesViewFidelity](self, "flamesViewFidelity");
  NSStringFromBOOL();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriUIConfiguration isSystemHostedPresentation](self, "isSystemHostedPresentation");
  NSStringFromBOOL();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriUIConfiguration _NSStringFromSiriViewMode:](self, "_NSStringFromSiriViewMode:", -[SiriUIConfiguration siriViewMode](self, "siriViewMode"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriUIConfiguration showsSensitiveUI](self, "showsSensitiveUI");
  NSStringFromBOOL();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<SiriUIConfiguration flamesViewFidelity: %@, isSystemHostedPresentation: %@, siriViewMode: %@, showsSensitiveUI: %@>"), v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_NSStringFromSiriViewMode:(int64_t)a3
{
  if ((unint64_t)(a3 - 4) > 4)
    return CFSTR("AFUISiriViewModeNone");
  else
    return off_24D7D9CF8[a3 - 4];
}

- (int64_t)flamesViewFidelity
{
  return self->_flamesViewFidelity;
}

- (BOOL)isSystemHostedPresentation
{
  return self->_isSystemHostedPresentation;
}

- (BOOL)allowResizingBetweenModes
{
  return self->_allowResizingBetweenModes;
}

- (int64_t)siriViewMode
{
  return self->_siriViewMode;
}

- (BOOL)showsSensitiveUI
{
  return self->_showsSensitiveUI;
}

@end
