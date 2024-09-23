@implementation TIKeyboardBehaviors_Zhuyin

- (id)keyBehaviorsForState:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = a3;
  if (objc_msgSend(v3, "hasInput"))
  {
    if (objc_msgSend(v3, "followsZhuyin"))
    {
      v4 = 100;
    }
    else if (objc_msgSend(v3, "hasCandidateSelected"))
    {
      v4 = 4;
    }
    else
    {
      v4 = 3;
    }
  }
  else
  {
    if (!objc_msgSend(v3, "hasCandidates"))
    {
      v6 = 0;
      goto LABEL_13;
    }
    if (!objc_msgSend(v3, "hasCandidateSelected"))
    {
      v4 = 7;
      v5 = 9;
      goto LABEL_11;
    }
    v4 = 4;
  }
  v5 = 2;
LABEL_11:
  +[TIKeyboardKeyBehaviors behaviorForSpaceKey:forReturnKey:](TIKeyboardKeyBehaviors, "behaviorForSpaceKey:forReturnKey:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:

  return v6;
}

@end
