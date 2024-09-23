@implementation TIKeyboardBehaviors_Pinyin

- (id)keyBehaviorsForState:(id)a3
{
  id v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  int v17;
  uint64_t v18;
  void *v19;

  v3 = a3;
  v4 = objc_msgSend(v3, "hasInput");
  v5 = objc_msgSend(v3, "hasCandidates");
  if (v4)
  {
    if (!v5)
    {
      v18 = 8;
      v15 = 10;
LABEL_50:
      +[TIKeyboardKeyBehaviors behaviorForSpaceKey:forReturnKey:](TIKeyboardKeyBehaviors, "behaviorForSpaceKey:forReturnKey:", v18, v15);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_51;
    }
    v6 = objc_msgSend(v3, "hardwareKeyboardMode");
    v7 = objc_msgSend(v3, "spaceConfirmation");
    v8 = v7;
    if (v6)
    {
      v9 = objc_msgSend(v3, "hasCandidateSelected");
      v10 = 5;
      if (v9)
        v10 = 2;
      v11 = 3;
      if (v9)
        v11 = 4;
      v12 = v8 == 0;
      if (v8)
        v13 = v10;
      else
        v13 = v11;
      if (v12)
        v14 = 2;
      else
        v14 = 10;
      if (objc_msgSend(v3, "userSelectedCurrentCandidate"))
        v15 = 2;
      else
        v15 = v14;
    }
    else if (v7
           && (!objc_msgSend(v3, "showsExtendedList")
            || (objc_msgSend(v3, "showsCandidatesInLayout") & 1) != 0))
    {
      if (objc_msgSend(v3, "hasCandidateSelected"))
        v13 = 2;
      else
        v13 = 5;
      v15 = 10;
    }
    else
    {
      if (objc_msgSend(v3, "hasCandidateSelected"))
        v13 = 4;
      else
        v13 = 3;
      v15 = 2;
    }
LABEL_49:
    v18 = v13;
    goto LABEL_50;
  }
  if (v5)
  {
    if (!objc_msgSend(v3, "hardwareKeyboardMode"))
    {
      if (objc_msgSend(v3, "hasCandidateSelected"))
      {
        if (objc_msgSend(v3, "showsExtendedList")
          && !objc_msgSend(v3, "hardwareKeyboardMode"))
        {
          v18 = 4;
        }
        else if (objc_msgSend(v3, "spaceConfirmation"))
        {
          v18 = 5;
        }
        else
        {
          v18 = 4;
        }
        v15 = 2;
      }
      else
      {
        v18 = 7;
        v15 = 9;
      }
      goto LABEL_50;
    }
    v16 = objc_msgSend(v3, "spaceConfirmation");
    v17 = objc_msgSend(v3, "hasCandidateSelected");
    if (v16)
    {
      if (v17)
        v13 = 2;
      else
        v13 = 7;
      v17 = objc_msgSend(v3, "hasCandidateSelected");
    }
    else if (v17)
    {
      v13 = 4;
    }
    else
    {
      v13 = 7;
    }
    if (v17)
      v15 = 2;
    else
      v15 = 9;
    goto LABEL_49;
  }
  v19 = 0;
LABEL_51:

  return v19;
}

@end
