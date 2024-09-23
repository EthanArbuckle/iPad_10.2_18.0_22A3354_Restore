@implementation _UIKBFeedbackGeneratorPartner

+ (id)feedbackGeneratorWithView:(id)a3
{
  id v3;
  _UIKBFeedbackGenerator *v4;
  _UIKBFeedbackGenerator *v5;

  v3 = a3;
  if (+[_UIKBFeedbackGeneratorPartner _isVisceralEnabled](_UIKBFeedbackGeneratorPartner, "_isVisceralEnabled"))
  {
    v4 = objc_alloc_init(_UIKBFeedbackGenerator);
  }
  else
  {
    v4 = -[UIFeedbackGenerator initWithView:]([_UIKeyboardFeedbackGenerator alloc], "initWithView:", v3);
  }
  v5 = v4;

  return v5;
}

+ (void)cooldownSystemSoundsForObject:(id)a3
{
  void *v3;
  id v4;

  v4 = a3;
  if (objc_msgSend((id)objc_opt_class(), "_shouldPreheatAndCoolSystemSounds"))
  {
    +[UIDevice currentDevice](UIDevice, "currentDevice");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_unregisterForSystemSounds:", v4);

  }
}

+ (void)preheatSystemSoundsForObject:(id)a3
{
  void *v3;
  id v4;

  v4 = a3;
  if (objc_msgSend((id)objc_opt_class(), "_shouldPreheatAndCoolSystemSounds"))
  {
    +[UIDevice currentDevice](UIDevice, "currentDevice");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_registerForSystemSounds:", v4);

  }
}

+ (BOOL)_shouldPreheatAndCoolSystemSounds
{
  return !+[_UIKBFeedbackGeneratorPartner _isVisceralEnabled](_UIKBFeedbackGeneratorPartner, "_isVisceralEnabled");
}

+ (BOOL)_isVisceralEnabled
{
  int v2;
  int v3;
  BOOL v4;

  v2 = _os_feature_enabled_impl();
  v3 = MGGetBoolAnswer();
  if (v2)
    v4 = v3 == 0;
  else
    v4 = 1;
  if (v4)
    return v2;
  else
    return _os_feature_enabled_impl();
}

+ (id)feedbackGeneratorWithCoordinateSpace:(id)a3
{
  void *v4;
  void *v5;

  _viewFromCoordinateSpace(a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "feedbackGeneratorWithView:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
