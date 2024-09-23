@implementation TIKeyboardBehaviors_Zhuyin_LiveConversion

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
  if (objc_msgSend(v3, "hasInput"))
  {
    if (objc_msgSend(v3, "followsZhuyin"))
    {
      v4 = 100;
      v5 = 2;
LABEL_17:
      +[TIKeyboardKeyBehaviors behaviorForSpaceKey:forReturnKey:](TIKeyboardKeyBehaviors, "behaviorForSpaceKey:forReturnKey:", v4, v5);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_18;
    }
    if (objc_msgSend(v3, "hasCandidateSelected"))
      v8 = 4;
    else
      v8 = 12;
    if (objc_msgSend(v3, "hasCandidateSelected"))
      v7 = 4;
    else
      v7 = 3;
    v6 = v8;
    goto LABEL_14;
  }
  if (objc_msgSend(v3, "hasCandidates"))
  {
    if (!objc_msgSend(v3, "hasCandidateSelected"))
    {
      v4 = 7;
      v5 = 9;
      goto LABEL_17;
    }
    v6 = 4;
    v7 = 4;
LABEL_14:
    +[TIKeyboardKeyBehaviors behaviorForSpaceKey:forReturnKey:forTabKey:](TIKeyboardKeyBehaviors, "behaviorForSpaceKey:forReturnKey:forTabKey:", v6, 2, v7);
    v9 = objc_claimAutoreleasedReturnValue();
LABEL_18:
    v10 = (void *)v9;
    goto LABEL_19;
  }
  v10 = 0;
LABEL_19:

  return v10;
}

@end
