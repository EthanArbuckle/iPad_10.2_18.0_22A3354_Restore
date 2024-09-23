@implementation TIKeyboardBehaviors_Japanese

- (id)keyBehaviorsForState:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v3 = a3;
  if (objc_msgSend(v3, "hasCandidates"))
  {
    if ((objc_msgSend(v3, "followsIncompleteRomaji") & 1) != 0)
    {
      v4 = 12;
    }
    else if (objc_msgSend(v3, "hasInput"))
    {
      v4 = 4;
    }
    else
    {
      v4 = 11;
    }
    if ((objc_msgSend(v3, "hasCandidateSelected") & 1) != 0)
    {
      v7 = 2;
    }
    else if (objc_msgSend(v3, "hasInput"))
    {
      v7 = 10;
    }
    else
    {
      v7 = 9;
    }
    if (objc_msgSend(v3, "hasInput"))
      v9 = 4;
    else
      v9 = 1;
    +[TIKeyboardKeyBehaviors behaviorForSpaceKey:forReturnKey:forTabKey:](TIKeyboardKeyBehaviors, "behaviorForSpaceKey:forReturnKey:forTabKey:", v4, v7, v9);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (objc_msgSend(v3, "hasInput"))
    {
      v5 = 8;
      v6 = 10;
    }
    else
    {
      v5 = 11;
      v6 = 0;
    }
    +[TIKeyboardKeyBehaviors behaviorForSpaceKey:forReturnKey:](TIKeyboardKeyBehaviors, "behaviorForSpaceKey:forReturnKey:", v5, v6);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v8;

  return v10;
}

@end
