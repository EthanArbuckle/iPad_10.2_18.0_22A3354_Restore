@implementation _PBUIWallpaperRemoteViewControllerSceneModeAssertion

- (_PBUIWallpaperRemoteViewControllerSceneModeAssertion)initWithIdentifier:(id)a3 forReason:(id)a4 sceneMode:(int64_t)a5 invalidationBlock:(id)a6
{
  _PBUIWallpaperRemoteViewControllerSceneModeAssertion *result;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_PBUIWallpaperRemoteViewControllerSceneModeAssertion;
  result = -[BSSimpleAssertion initWithIdentifier:forReason:invalidationBlock:](&v8, sel_initWithIdentifier_forReason_invalidationBlock_, a3, a4, a6);
  if (result)
    result->_sceneMode = a5;
  return result;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  void *v5;
  unint64_t sceneMode;
  uint64_t v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_PBUIWallpaperRemoteViewControllerSceneModeAssertion;
  -[BSSimpleAssertion descriptionBuilderWithMultilinePrefix:](&v9, sel_descriptionBuilderWithMultilinePrefix_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  sceneMode = self->_sceneMode;
  if (sceneMode > 3)
    v7 = 0;
  else
    v7 = (uint64_t)*(&off_1E6B959A8 + sceneMode);
  objc_msgSend(v4, "appendString:withName:", v7, CFSTR("sceneMode"));
  return v5;
}

- (int64_t)sceneMode
{
  return self->_sceneMode;
}

@end
