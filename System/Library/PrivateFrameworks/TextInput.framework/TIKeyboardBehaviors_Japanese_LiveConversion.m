@implementation TIKeyboardBehaviors_Japanese_LiveConversion

- (id)keyBehaviorsForState:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  if ((objc_msgSend(v4, "hasCandidates") & 1) != 0 || !objc_msgSend(v4, "hasInput"))
  {
    v8.receiver = self;
    v8.super_class = (Class)TIKeyboardBehaviors_Japanese_LiveConversion;
    -[TIKeyboardBehaviors_Japanese keyBehaviorsForState:](&v8, sel_keyBehaviorsForState_, v4);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[TIKeyboardKeyBehaviors behaviorForSpaceKey:forReturnKey:forTabKey:](TIKeyboardKeyBehaviors, "behaviorForSpaceKey:forReturnKey:forTabKey:", 7, 10, 3);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;

  return v6;
}

@end
