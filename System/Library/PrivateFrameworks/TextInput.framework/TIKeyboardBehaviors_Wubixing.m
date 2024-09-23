@implementation TIKeyboardBehaviors_Wubixing

- (id)keyBehaviorsForState:(id)a3
{
  id v3;
  int v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v3 = a3;
  v4 = objc_msgSend(v3, "hasCandidates");
  v5 = objc_msgSend(v3, "hasInput");
  if (v4)
  {
    if ((v5 & 1) != 0 || objc_msgSend(v3, "hasCandidateSelected"))
    {
      if (objc_msgSend(v3, "spaceConfirmation"))
      {
        if (objc_msgSend(v3, "hardwareKeyboardMode"))
        {
          if (objc_msgSend(v3, "userSelectedCurrentCandidate"))
            v6 = 2;
          else
            v6 = 10;
        }
        else
        {
          v6 = 10;
        }
        v7 = 2;
      }
      else
      {
        v7 = 4;
        v6 = 2;
      }
    }
    else
    {
      v7 = 7;
      v6 = 9;
    }
    goto LABEL_16;
  }
  if (v5)
  {
    v7 = 8;
    v6 = 8;
LABEL_16:
    +[TIKeyboardKeyBehaviors behaviorForSpaceKey:forReturnKey:](TIKeyboardKeyBehaviors, "behaviorForSpaceKey:forReturnKey:", v7, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  v8 = 0;
LABEL_17:

  return v8;
}

@end
