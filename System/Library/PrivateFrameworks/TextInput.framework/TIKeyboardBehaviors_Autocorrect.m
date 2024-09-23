@implementation TIKeyboardBehaviors_Autocorrect

- (id)keyBehaviorsForState:(id)a3
{
  void *v3;

  if (objc_msgSend(a3, "hasCandidates"))
  {
    +[TIKeyboardKeyBehaviors behaviorForSpaceKey:forReturnKey:](TIKeyboardKeyBehaviors, "behaviorForSpaceKey:forReturnKey:", 7, 9);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

@end
