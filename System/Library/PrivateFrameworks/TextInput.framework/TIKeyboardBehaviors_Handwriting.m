@implementation TIKeyboardBehaviors_Handwriting

- (id)keyBehaviorsForState:(id)a3
{
  id v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  void *v9;

  v3 = a3;
  v4 = objc_msgSend(v3, "hasInput");
  v5 = objc_msgSend(v3, "hasCandidates");
  v6 = v5;
  if (v4)
  {
    v7 = objc_msgSend(v3, "hasCandidateSelected");
    if (v6)
    {
      if (v7)
        v8 = 2;
      else
        v8 = 5;
      goto LABEL_13;
    }
    if ((v7 & 1) == 0)
    {
      v8 = 8;
LABEL_13:
      +[TIKeyboardKeyBehaviors behaviorForSpaceKey:forReturnKey:](TIKeyboardKeyBehaviors, "behaviorForSpaceKey:forReturnKey:", v8, 9);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    }
  }
  else if (v5)
  {
    if (objc_msgSend(v3, "hasCandidateSelected"))
      v8 = 2;
    else
      v8 = 7;
    goto LABEL_13;
  }
  v9 = 0;
LABEL_14:

  return v9;
}

@end
