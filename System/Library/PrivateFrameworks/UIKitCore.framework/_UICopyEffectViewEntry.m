@implementation _UICopyEffectViewEntry

- (void)addEffectToView:(id)a3
{
  _UIVisualEffectViewBackdropCaptureGroup *captureGroup;
  id v5;
  id v6;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    captureGroup = self->_captureGroup;
    v5 = v6;
    objc_msgSend(v5, "setCaptureGroup:", captureGroup);
    objc_msgSend(v5, "setRenderMode:", 2);

  }
}

- (void)setCaptureGroup:(id)a3
{
  objc_storeStrong((id *)&self->_captureGroup, a3);
}

- (void)removeEffectFromView:(id)a3
{
  id v3;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v3, "removeFromCurrentCaptureGroup");

}

- (BOOL)canTransitionToEffect:(id)a3
{
  return 0;
}

- (id)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UICopyEffectViewEntry;
  -[_UIVisualEffectViewEntry description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" captureGroup=%@"), self->_captureGroup);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (_UIVisualEffectViewBackdropCaptureGroup)captureGroup
{
  return self->_captureGroup;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_captureGroup, 0);
}

@end
