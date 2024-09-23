@implementation TIKeyboardBehaviors_Simple

- (id)keyBehaviorsForState:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a3;
  if (objc_msgSend(v3, "hasCandidates"))
  {
    if (objc_msgSend(v3, "hasCandidateSelected"))
      v4 = 4;
    else
      v4 = 3;
    +[TIKeyboardKeyBehaviors behaviorForSpaceKey:forReturnKey:](TIKeyboardKeyBehaviors, "behaviorForSpaceKey:forReturnKey:", v4, 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end
