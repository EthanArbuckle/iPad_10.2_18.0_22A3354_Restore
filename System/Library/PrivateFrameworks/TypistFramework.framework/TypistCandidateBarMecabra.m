@implementation TypistCandidateBarMecabra

- (TypistCandidateBarMecabra)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TypistCandidateBarMecabra;
  return -[TypistCandidateBar init](&v3, sel_init);
}

- (id)candidateUIInformation:(id)a3
{
  id v3;
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v3 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__9;
  v14 = __Block_byref_object_dispose__9;
  v15 = 0;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __52__TypistCandidateBarMecabra_candidateUIInformation___block_invoke;
  v7[3] = &unk_251A7CA40;
  v4 = v3;
  v8 = v4;
  v9 = &v10;
  +[TypistKeyboardUtilities runOnMainThread:](TypistKeyboardUtilities, "runOnMainThread:", v7);
  v5 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v5;
}

void __52__TypistCandidateBarMecabra_candidateUIInformation___block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  __CFString *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  __CFString *v28;
  _BOOL8 v29;
  uint64_t v30;
  uint64_t v31;
  const __CFString *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  id obj;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _QWORD v64[6];
  _QWORD v65[6];
  _BYTE v66[128];
  _BYTE v67[128];
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDF6FF8], "allWindowsIncludingInternalWindows:onlyVisibleWindows:", 1, 0);
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v1 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v60, v68, 16);
  if (v2)
  {
    v3 = *(_QWORD *)v61;
    v4 = CFSTR("TUICandidateCell");
    v48 = v1;
    v40 = *(_QWORD *)v61;
    do
    {
      v5 = 0;
      v41 = v2;
      do
      {
        if (*(_QWORD *)v61 != v3)
          objc_enumerationMutation(v1);
        v6 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * v5);
        v56 = 0u;
        v57 = 0u;
        v58 = 0u;
        v59 = 0u;
        v46 = v6;
        objc_msgSend(v6, "allSubViews");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v56, v67, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v57;
          v49 = v7;
          v42 = *(_QWORD *)v57;
          v43 = v5;
          do
          {
            v11 = 0;
            v44 = v9;
            do
            {
              if (*(_QWORD *)v57 != v10)
                objc_enumerationMutation(v7);
              v12 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * v11);
              NSClassFromString(CFSTR("UIKeyboardCandidateInlineFloatingView"));
              if ((objc_opt_isKindOfClass() & 1) != 0
                || (NSClassFromString(CFSTR("TUICandidateView")), (objc_opt_isKindOfClass() & 1) != 0))
              {
                v45 = v11;
                v54 = 0u;
                v55 = 0u;
                v52 = 0u;
                v53 = 0u;
                v47 = v12;
                objc_msgSend(v12, "allSubViews");
                obj = (id)objc_claimAutoreleasedReturnValue();
                v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v66, 16);
                if (v13)
                {
                  v14 = v13;
                  v15 = *(_QWORD *)v53;
                  while (2)
                  {
                    for (i = 0; i != v14; ++i)
                    {
                      if (*(_QWORD *)v53 != v15)
                        objc_enumerationMutation(obj);
                      v17 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
                      NSClassFromString(&v4->isa);
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        v18 = v4;
                        objc_msgSend(v17, "performSelector:", sel_textLabel);
                        v19 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v17, "performSelector:", sel_candidateNumberLabel);
                        v20 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v19, "text");
                        v21 = (void *)objc_claimAutoreleasedReturnValue();
                        v22 = objc_msgSend(v21, "isEqualToString:", *(_QWORD *)(a1 + 32));

                        if ((v22 & 1) != 0)
                        {
                          objc_msgSend(v17, "superview");
                          v23 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v47, "frame");
                          objc_msgSend(v23, "convertRect:toView:", v46);
                          UIRectGetCenter();
                          v25 = v24;
                          v27 = v26;

                          objc_msgSend(v20, "text");
                          v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
                          v29 = objc_msgSend(v17, "performSelector:", sel_isFocused) != 0;
                          v30 = objc_msgSend(v20, "isHidden") ^ 1;
                          v31 = *(_QWORD *)(a1 + 32);
                          v64[0] = CFSTR("candidateString");
                          v64[1] = CFSTR("candidateNumberString");
                          v32 = &stru_251A7DE60;
                          if (v28)
                            v32 = v28;
                          v65[0] = v31;
                          v65[1] = v32;
                          v64[2] = CFSTR("isFocused");
                          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v29);
                          v33 = (void *)objc_claimAutoreleasedReturnValue();
                          v65[2] = v33;
                          v64[3] = CFSTR("rowSelected");
                          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v30);
                          v34 = (void *)objc_claimAutoreleasedReturnValue();
                          v65[3] = v34;
                          v64[4] = CFSTR("centerX");
                          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v25);
                          v35 = (void *)objc_claimAutoreleasedReturnValue();
                          v65[4] = v35;
                          v64[5] = CFSTR("centerY");
                          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v27);
                          v36 = (void *)objc_claimAutoreleasedReturnValue();
                          v65[5] = v36;
                          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v65, v64, 6);
                          v37 = objc_claimAutoreleasedReturnValue();
                          v38 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
                          v39 = *(void **)(v38 + 40);
                          *(_QWORD *)(v38 + 40) = v37;

                          v1 = v48;
                          goto LABEL_32;
                        }

                        v4 = v18;
                      }
                    }
                    v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v66, 16);
                    if (v14)
                      continue;
                    break;
                  }
                }

                v1 = v48;
                v7 = v49;
                v10 = v42;
                v5 = v43;
                v9 = v44;
                v11 = v45;
              }
              ++v11;
            }
            while (v11 != v9);
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v56, v67, 16);
          }
          while (v9);
        }

        ++v5;
        v3 = v40;
      }
      while (v5 != v41);
      v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v60, v68, 16);
    }
    while (v2);
  }
LABEL_32:

}

- (id)getVisibleCandidates
{
  return (id)-[objc_class getVisibleCandidateList:](+[TypistKeyboardData keyboardData](TypistKeyboardData, "keyboardData"), "getVisibleCandidateList:", CFSTR("typistCandidateBarTypeMecabra"));
}

- (BOOL)hasVisibleCandidate:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  char v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[TypistCandidateBarMecabra getVisibleCandidates](self, "getVisibleCandidates");
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "candidate", (_QWORD)v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "isEqualToString:", v4);

        if ((v10 & 1) != 0)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (BOOL)hasCandidate:(id)a3 withAlternativeText:(id)a4
{
  return -[TypistCandidateBarMecabra getIndexOfCandidate:withAlternativeText:](self, "getIndexOfCandidate:withAlternativeText:", a3, a4) != -1;
}

- (BOOL)hasCandidate:(id)a3 withAlternativeText:(id)a4 inRange:(_NSRange)a5
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v7;
  BOOL v9;

  length = a5.length;
  location = a5.location;
  v7 = -[TypistCandidateBarMecabra getIndexOfCandidate:withAlternativeText:](self, "getIndexOfCandidate:withAlternativeText:", a3, a4);
  v9 = v7 >= location && v7 - location < length;
  return v7 >= 0 && v9;
}

- (id)getAllCandidates
{
  int v3;
  objc_class *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  objc_super v14;

  v3 = 50;
  do
  {
    if (-[TypistCandidateBar hasCandidates](self, "hasCandidates"))
      break;
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    TYLog(CFSTR("%@: Waiting for visible candidates"), v6, v7, v8, v9, v10, v11, v12, (char)v5);

    +[TypistKeyboardUtilities waitFor:](TypistKeyboardUtilities, "waitFor:", 0.1);
    --v3;
  }
  while (v3);
  v14.receiver = self;
  v14.super_class = (Class)TypistCandidateBarMecabra;
  -[TypistCandidateBar getAllCandidates](&v14, sel_getAllCandidates);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int64_t)getIndexOfCandidate:(id)a3
{
  return -[TypistCandidateBarMecabra getIndexOfCandidate:withAlternativeText:](self, "getIndexOfCandidate:withAlternativeText:", a3, 0);
}

- (int64_t)getIndexOfCandidate:(id)a3 withAlternativeText:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;

  v6 = a3;
  v7 = a4;
  if (+[TypistKeyboardUtilities hasMarkedText](TypistKeyboardUtilities, "hasMarkedText"))
  {
    +[TypistKeyboardUtilities markedText](TypistKeyboardUtilities, "markedText");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", v6);

    if ((v9 & 1) != 0)
    {
      v10 = 0;
      goto LABEL_18;
    }
  }
  -[TypistCandidateBarMecabra getAllCandidates](self, "getAllCandidates");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v11, "count"))
    goto LABEL_16;
  v10 = 0;
  while (1)
  {
    objc_msgSend(v11, "objectAtIndex:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "candidate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isEqualToString:", v13) & 1) == 0)
    {

      goto LABEL_11;
    }
    if (!v7)
      break;
    objc_msgSend(v12, "alternativeText");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v7, "isEqualToString:", v14);

    if ((v15 & 1) != 0)
      goto LABEL_14;
LABEL_11:
    ++v10;

    if (v10 >= objc_msgSend(v11, "count"))
    {
      v10 = 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_15;
    }
  }

LABEL_14:
LABEL_15:
  if (v10 == 0x7FFFFFFFFFFFFFFFLL)
LABEL_16:
    v10 = -1;

LABEL_18:
  return v10;
}

- (BOOL)scrollCandidateBarByOneScreen
{
  uint64_t v3;

  if (-[TypistCandidateBarMecabra isExtendedCandidateViewMode](self, "isExtendedCandidateViewMode"))
    v3 = 1;
  else
    v3 = 2;
  return -[TypistCandidateBarMecabra scrollCandidateBar:](self, "scrollCandidateBar:", v3);
}

- (int64_t)selectCandidate:(id)a3
{
  id v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  _QWORD v20[4];
  id v21;
  uint64_t v22;
  uint64_t v23;

  v4 = a3;
  if (-[TypistCandidateBar hasCandidate:](self, "hasCandidate:", v4))
  {
    v5 = -[TypistCandidateBarMecabra getIndexOfCandidate:](self, "getIndexOfCandidate:", v4);
    if (-[TypistCandidateBar hasCandidate:](self, "hasCandidate:", v4))
    {
      if (!-[TypistCandidateBarMecabra hasVisibleCandidate:](self, "hasVisibleCandidate:", v4))
      {
        TYLog(CFSTR("Looking for candidate [%@] in the candidate bar..."), v6, v7, v8, v9, v10, v11, v12, (char)v4);
        if (-[TypistCandidateBarMecabra scrollCandidateBarByOneScreen](self, "scrollCandidateBarByOneScreen"))
        {
          while (!-[TypistCandidateBarMecabra hasVisibleCandidate:](self, "hasVisibleCandidate:", v4)
               && -[TypistCandidateBarMecabra scrollCandidateBarByOneScreen](self, "scrollCandidateBarByOneScreen"))
            ;
        }
      }
    }
    if (v5 <= 0x7FFFFFFFFFFFFFFELL)
    {
      -[TypistCandidateBar centerOfCandidate:](self, "centerOfCandidate:", v4);
      v14 = v13;
      v16 = v15;
      v17 = (void *)MEMORY[0x24BE7CE50];
      v20[0] = MEMORY[0x24BDAC760];
      v20[1] = 3221225472;
      v20[2] = __45__TypistCandidateBarMecabra_selectCandidate___block_invoke;
      v20[3] = &unk_251A7D480;
      v21 = v4;
      v22 = v14;
      v23 = v16;
      objc_msgSend(v17, "eventStreamWithEventActions:", v20);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[TypistKeyboardUtilities launchRecapWithSyntheticEventStream:](TypistKeyboardUtilities, "launchRecapWithSyntheticEventStream:", v18);
      +[TypistKeyboardUtilities waitFor:](TypistKeyboardUtilities, "waitFor:", 0.2);

    }
  }
  else
  {
    v5 = -1;
  }

  return v5;
}

void __45__TypistCandidateBarMecabra_selectCandidate___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;

  v3 = (void *)MEMORY[0x24BE7CE38];
  v14 = a2;
  objc_msgSend(v3, "touchScreenDigitizerSender");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setSenderProperties:", v4);

  v5 = *(_QWORD *)(a1 + 32);
  NSStringFromCGPoint(*(CGPoint *)(a1 + 40));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  TYLog(CFSTR("Tapping [%@] candidate center at: %@"), v6, v7, v8, v9, v10, v11, v12, v5);

  objc_msgSend(v14, "tap:", *(double *)(a1 + 40), *(double *)(a1 + 48));
}

- (int64_t)selectCandidateAtIndex:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int64_t v16;

  -[TypistCandidateBarMecabra getAllCandidates](self, "getAllCandidates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count") <= (unint64_t)a3)
  {
    v16 = -1;
  }
  else
  {
    -[objc_class showCandidateAtIndex:](+[TypistKeyboardData keyboardData](TypistKeyboardData, "keyboardData"), "showCandidateAtIndex:", a3);
    objc_msgSend(v5, "objectAtIndex:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "candidate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    TYLog(CFSTR("The candidate at position %@ is %@"), v9, v10, v11, v12, v13, v14, v15, (char)v8);

    v16 = -[TypistCandidateBarMecabra selectCandidate:](self, "selectCandidate:", v7);
  }

  return v16;
}

- (void)showExtendedCandidateView
{
  if (!-[TypistCandidateBarMecabra isExtendedCandidateViewMode](self, "isExtendedCandidateViewMode"))
    -[TypistCandidateBarMecabra toggleExtendedCandidateViewMode](self, "toggleExtendedCandidateViewMode");
}

- (void)hideExtendedCandidateView
{
  if (-[TypistCandidateBarMecabra isExtendedCandidateViewMode](self, "isExtendedCandidateViewMode"))
    -[TypistCandidateBarMecabra toggleExtendedCandidateViewMode](self, "toggleExtendedCandidateViewMode");
}

- (void)toggleExtendedCandidateViewMode
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  _QWORD v6[5];
  uint64_t v7;
  double *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;

  v7 = 0;
  v8 = (double *)&v7;
  v9 = 0x3010000000;
  v11 = 0;
  v12 = 0;
  v10 = &unk_2494BA09E;
  -[objc_class getExtendedCandidateViewToggleButtonCenter](+[TypistKeyboardData keyboardData](TypistKeyboardData, "keyboardData"), "getExtendedCandidateViewToggleButtonCenter");
  v11 = v2;
  v12 = v3;
  if (v8[4] != *MEMORY[0x24BDBEFB0] || v8[5] != *(double *)(MEMORY[0x24BDBEFB0] + 8))
  {
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __60__TypistCandidateBarMecabra_toggleExtendedCandidateViewMode__block_invoke;
    v6[3] = &unk_251A7D4A8;
    v6[4] = &v7;
    objc_msgSend(MEMORY[0x24BE7CE50], "eventStreamWithEventActions:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[TypistKeyboardUtilities launchRecapWithSyntheticEventStream:](TypistKeyboardUtilities, "launchRecapWithSyntheticEventStream:", v5);
    +[TypistKeyboardUtilities waitFor:](TypistKeyboardUtilities, "waitFor:", 0.5);

  }
  _Block_object_dispose(&v7, 8);
}

void __60__TypistCandidateBarMecabra_toggleExtendedCandidateViewMode__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  v3 = (void *)MEMORY[0x24BE7CE38];
  v13 = a2;
  objc_msgSend(v3, "touchScreenDigitizerSender");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setSenderProperties:", v4);

  NSStringFromCGPoint(*(CGPoint *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  TYLog(CFSTR("Tapping center of toggle button: %@"), v6, v7, v8, v9, v10, v11, v12, (char)v5);

  objc_msgSend(v13, "tap:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
}

- (BOOL)scrollCandidateBar:(int)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  _BOOL4 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const __CFString *v19;
  _QWORD v21[7];
  int v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  _QWORD v29[4];

  if ((a3 & 0xFFFFFFFE) == 2)
  {
    if (-[TypistCandidateBarMecabra isExtendedCandidateViewMode](self, "isExtendedCandidateViewMode"))
    {
LABEL_9:
      v12 = -[TypistCandidateBarMecabra isExtendedCandidateViewMode](self, "isExtendedCandidateViewMode");
      v19 = CFSTR("Bar View");
      if (v12)
        v19 = CFSTR("Extended View");
      TYLogl(OS_LOG_TYPE_ERROR, CFSTR("scrollCandidateBar: Invalid scroll direction for candidate view mode: %@"), v13, v14, v15, v16, v17, v18, (char)v19);
      LOBYTE(v11) = 0;
      return v11;
    }
  }
  else if (a3 <= 1
         && !-[TypistCandidateBarMecabra isExtendedCandidateViewMode](self, "isExtendedCandidateViewMode"))
  {
    goto LABEL_9;
  }
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x2020000000;
  v29[3] = 0x3FF0000000000000;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__9;
  v27 = __Block_byref_object_dispose__9;
  v28 = 0;
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __48__TypistCandidateBarMecabra_scrollCandidateBar___block_invoke;
  v21[3] = &unk_251A7D4F8;
  v21[4] = self;
  v21[5] = v29;
  v22 = a3;
  v21[6] = &v23;
  +[TypistKeyboardUtilities runOnMainThread:](TypistKeyboardUtilities, "runOnMainThread:", v21);
  if (v24[5])
  {
    +[TypistKeyboardUtilities launchRecapWithSyntheticEventStream:](TypistKeyboardUtilities, "launchRecapWithSyntheticEventStream:");
    +[TypistKeyboardUtilities waitFor:](TypistKeyboardUtilities, "waitFor:", 0.5);
  }
  -[TypistCandidateBarMecabra getVisibleCandidates](self, "getVisibleCandidates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "candidate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TypistCandidateBarMecabra getAllCandidates](self, "getAllCandidates");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lastObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "candidate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v7, "isEqualToString:", v10) ^ 1;

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(v29, 8);
  return v11;
}

void __48__TypistCandidateBarMecabra_scrollCandidateBar___block_invoke(uint64_t a1)
{
  unint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  id v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  void *v34;
  id v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  void *v46;
  double v47;
  double v48;
  void *v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  double v63;
  double v64;
  double v65;
  double v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  id obj;
  id obja;
  _QWORD v75[9];
  double v76;
  double v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  _BYTE v90[128];
  _BYTE v91[128];
  _BYTE v92[128];
  uint64_t v93;

  v93 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "getVisibleCandidates");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(obj, "count");
  objc_msgSend(*(id *)(a1 + 32), "getAllCandidates");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 >= objc_msgSend(v3, "count"))
  {

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "getVisibleCandidates");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lastObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "candidate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = a1;
    objc_msgSend(*(id *)(a1 + 32), "getAllCandidates");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lastObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "candidate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v6, "isEqualToString:", v9);

    if ((v10 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDF6FF8], "allWindowsIncludingInternalWindows:onlyVisibleWindows:", 1, 0);
      v86 = 0u;
      v87 = 0u;
      v88 = 0u;
      v89 = 0u;
      obja = (id)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v86, v92, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v87;
        v14 = 0.0;
        v15 = 0.0;
        v16 = 0.0;
        v17 = 0.0;
        v18 = v71;
        v70 = *(_QWORD *)v87;
        do
        {
          v19 = 0;
          v72 = v12;
          do
          {
            if (*(_QWORD *)v87 != v13)
              objc_enumerationMutation(obja);
            v20 = *(void **)(*((_QWORD *)&v86 + 1) + 8 * v19);
            NSClassFromString(CFSTR("UIRemoteKeyboardWindow"));
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v20, "allSubViews");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v82 = 0u;
              v83 = 0u;
              v84 = 0u;
              v85 = 0u;
              v22 = v21;
              v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v82, v91, 16);
              if (v23)
              {
                v24 = v23;
                v25 = *(_QWORD *)v83;
                while (2)
                {
                  for (i = 0; i != v24; ++i)
                  {
                    if (*(_QWORD *)v83 != v25)
                      objc_enumerationMutation(v22);
                    v27 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * i);
                    NSClassFromString(CFSTR("UIKeyboardCandidateBar"));
                    if ((objc_opt_isKindOfClass() & 1) == 0)
                    {
                      NSClassFromString(CFSTR("UIKeyboardCandidateGridCollectionView"));
                      if ((objc_opt_isKindOfClass() & 1) == 0)
                      {
                        NSClassFromString(CFSTR("TUICandidateView"));
                        if ((objc_opt_isKindOfClass() & 1) == 0)
                          continue;
                      }
                    }
                    v28 = v27;
                    if (objc_msgSend(*(id *)(v18 + 32), "isExtendedCandidateViewMode"))
                    {
                      v81 = 0u;
                      v79 = 0u;
                      v80 = 0u;
                      v78 = 0u;
                      objc_msgSend(v28, "allSubViews");
                      v29 = (void *)objc_claimAutoreleasedReturnValue();
                      v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v78, v90, 16);
                      if (v30)
                      {
                        v31 = v30;
                        v32 = *(_QWORD *)v79;
                        while (2)
                        {
                          for (j = 0; j != v31; ++j)
                          {
                            if (*(_QWORD *)v79 != v32)
                              objc_enumerationMutation(v29);
                            v34 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * j);
                            NSClassFromString(CFSTR("UICollectionView"));
                            if ((objc_opt_isKindOfClass() & 1) != 0)
                            {
                              v35 = v34;

                              v28 = v35;
                              goto LABEL_31;
                            }
                          }
                          v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v78, v90, 16);
                          if (v31)
                            continue;
                          break;
                        }
                      }
LABEL_31:

                    }
                    objc_msgSend(v28, "superview");
                    v36 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v28, "frame");
                    v38 = v37;
                    v40 = v39;
                    v42 = v41;
                    v44 = v43;
                    objc_msgSend(v20, "rootViewController");
                    v45 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v45, "view");
                    v46 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v36, "convertRect:toView:", v46, v38, v40, v42, v44);
                    v17 = v47;
                    v16 = v48;

                    objc_msgSend(v28, "superview");
                    v49 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v28, "frame");
                    v51 = v50;
                    v53 = v52;
                    v55 = v54;
                    v57 = v56;
                    objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
                    v58 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v58, "delegate");
                    v59 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v59, "window");
                    v60 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v60, "rootViewController");
                    v61 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v61, "view");
                    v62 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v49, "convertRect:toView:", v62, v51, v53, v55, v57);
                    UIRectGetCenter();
                    v15 = v63;
                    v14 = v64;

                    v18 = v71;
                    goto LABEL_33;
                  }
                  v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v82, v91, 16);
                  if (v24)
                    continue;
                  break;
                }
LABEL_33:
                v13 = v70;
                v12 = v72;
              }

            }
            ++v19;
          }
          while (v19 != v12);
          v12 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v86, v92, 16);
        }
        while (v12);
      }
      else
      {
        v14 = 0.0;
        v15 = 0.0;
        v16 = 0.0;
        v17 = 0.0;
        v18 = v71;
      }
      *(double *)(*(_QWORD *)(*(_QWORD *)(v18 + 40) + 8) + 24) = v17 / 300.0;
      v76 = 0.0;
      v77 = 0.0;
      switch(*(_DWORD *)(v18 + 56))
      {
        case 0:
          v65 = -0.5;
          goto LABEL_43;
        case 1:
          v65 = 0.5;
LABEL_43:
          v77 = v16 * v65 + 0.0;
          break;
        case 2:
          v66 = -0.5;
          goto LABEL_46;
        case 3:
          v66 = 0.5;
LABEL_46:
          v76 = v17 * v66 + 0.0;
          break;
        default:
          break;
      }
      +[TypistKeyboardUtilities correctForRotation:orientation:](TypistKeyboardUtilities, "correctForRotation:orientation:", &v76, +[TypistKeyboardUtilities toUIDeviceOrientation:](TypistKeyboardUtilities, "toUIDeviceOrientation:", +[TypistKeyboardUtilities getUIInterfaceOrientation](TypistKeyboardUtilities, "getUIInterfaceOrientation")));
      v75[0] = MEMORY[0x24BDAC760];
      v75[1] = 3221225472;
      v75[2] = __48__TypistCandidateBarMecabra_scrollCandidateBar___block_invoke_2;
      v75[3] = &unk_251A7D4D0;
      *(double *)&v75[5] = v15;
      *(double *)&v75[6] = v14;
      *(double *)&v75[7] = v15 + v76;
      *(double *)&v75[8] = v14 + v77;
      v75[4] = *(_QWORD *)(v18 + 40);
      objc_msgSend(MEMORY[0x24BE7CE50], "eventStreamWithEventActions:", v75);
      v67 = objc_claimAutoreleasedReturnValue();
      v68 = *(_QWORD *)(*(_QWORD *)(v18 + 48) + 8);
      v69 = *(void **)(v68 + 40);
      *(_QWORD *)(v68 + 40) = v67;

    }
  }
}

void __48__TypistCandidateBarMecabra_scrollCandidateBar___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;

  v3 = (void *)MEMORY[0x24BE7CE38];
  v14 = a2;
  objc_msgSend(v3, "touchScreenDigitizerSender");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setSenderProperties:", v4);

  NSStringFromCGPoint(*(CGPoint *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromCGPoint(*(CGPoint *)(a1 + 56));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  TYLog(CFSTR("Scrolling candidate bar...dragging from %@ to %@"), v6, v7, v8, v9, v10, v11, v12, (char)v5);

  objc_msgSend(v14, "dragWithStartPoint:endPoint:duration:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
}

- (BOOL)scrollToCandidateOnBar:(id)a3
{
  return 1;
}

- (BOOL)scrollToCandidateOnBarByPosition:(int64_t)a3
{
  return 1;
}

- (BOOL)isExtendedCandidateViewMode
{
  return -[objc_class isExtendedCandidateViewMode](+[TypistKeyboardData keyboardData](TypistKeyboardData, "keyboardData"), "isExtendedCandidateViewMode");
}

@end
