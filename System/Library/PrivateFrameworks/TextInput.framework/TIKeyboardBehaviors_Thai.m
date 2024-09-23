@implementation TIKeyboardBehaviors_Thai

- (id)keyBehaviorsForState:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a3;
  if (objc_msgSend(v3, "hasAutocorrection"))
  {
    if (objc_msgSend(v3, "isContinuousPathUnderway"))
      v4 = 7;
    else
      v4 = 2;
  }
  else
  {
    v4 = 7;
  }
  +[TIKeyboardKeyBehaviors behaviorForSpaceKey:forReturnKey:](TIKeyboardKeyBehaviors, "behaviorForSpaceKey:forReturnKey:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
