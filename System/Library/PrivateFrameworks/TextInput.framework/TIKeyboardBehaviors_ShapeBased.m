@implementation TIKeyboardBehaviors_ShapeBased

- (id)keyBehaviorsForState:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = a3;
  if (objc_msgSend(v3, "hasCandidates"))
  {
    if ((objc_msgSend(v3, "hasCandidateSelected") & 1) != 0 || objc_msgSend(v3, "hasInput"))
    {
      v4 = 4;
      v5 = 2;
    }
    else
    {
      v4 = 7;
      v5 = 9;
    }
    goto LABEL_9;
  }
  if (objc_msgSend(v3, "hasInput"))
  {
    v4 = 8;
    v5 = 8;
LABEL_9:
    +[TIKeyboardKeyBehaviors behaviorForSpaceKey:forReturnKey:](TIKeyboardKeyBehaviors, "behaviorForSpaceKey:forReturnKey:", v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  v6 = 0;
LABEL_10:

  return v6;
}

@end
