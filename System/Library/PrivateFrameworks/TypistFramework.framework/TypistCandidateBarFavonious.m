@implementation TypistCandidateBarFavonious

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
  v13 = __Block_byref_object_copy__10;
  v14 = __Block_byref_object_dispose__10;
  v15 = 0;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __54__TypistCandidateBarFavonious_candidateUIInformation___block_invoke;
  v7[3] = &unk_251A7CA40;
  v4 = v3;
  v8 = v4;
  v9 = &v10;
  +[TypistKeyboardUtilities runOnMainThread:](TypistKeyboardUtilities, "runOnMainThread:", v7);
  v5 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v5;
}

void __54__TypistCandidateBarFavonious_candidateUIInformation___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  _BOOL8 v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  id obj;
  void *v30;
  uint64_t v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _QWORD v41[4];
  _QWORD v42[4];
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDF6FF8], "allWindowsIncludingInternalWindows:onlyVisibleWindows:", 1, 0);
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
  if (v1)
  {
    v2 = v1;
    v3 = *(_QWORD *)v38;
    v27 = *(_QWORD *)v38;
    do
    {
      v4 = 0;
      v28 = v2;
      do
      {
        if (*(_QWORD *)v38 != v3)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v4);
        NSClassFromString(CFSTR("UIRemoteKeyboardWindow"));
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v30 = v5;
          v31 = v4;
          v35 = 0u;
          v36 = 0u;
          v33 = 0u;
          v34 = 0u;
          objc_msgSend(v5, "allSubViews");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
          if (v7)
          {
            v8 = v7;
            v9 = *(_QWORD *)v34;
            while (2)
            {
              for (i = 0; i != v8; ++i)
              {
                if (*(_QWORD *)v34 != v9)
                  objc_enumerationMutation(v6);
                v11 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
                NSClassFromString(CFSTR("UIMorphingLabel"));
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  objc_msgSend(v11, "performSelector:", sel_textLabel);
                  v12 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v12, "text");
                  v13 = (void *)objc_claimAutoreleasedReturnValue();
                  v14 = objc_msgSend(v13, "isEqualToString:", *(_QWORD *)(a1 + 32));

                  if (v14)
                  {
                    objc_msgSend(v11, "superview");
                    v15 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v11, "frame");
                    objc_msgSend(v15, "convertRect:toView:", v30);
                    UIRectGetCenter();
                    v17 = v16;
                    v19 = v18;

                    v20 = objc_msgSend(v11, "performSelector:", sel_isFocused) != 0;
                    v42[0] = *(_QWORD *)(a1 + 32);
                    v41[0] = CFSTR("candidateString");
                    v41[1] = CFSTR("isFocused");
                    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v20);
                    v21 = (void *)objc_claimAutoreleasedReturnValue();
                    v42[1] = v21;
                    v41[2] = CFSTR("centerX");
                    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v17);
                    v22 = (void *)objc_claimAutoreleasedReturnValue();
                    v42[2] = v22;
                    v41[3] = CFSTR("centerY");
                    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v19);
                    v23 = (void *)objc_claimAutoreleasedReturnValue();
                    v42[3] = v23;
                    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v42, v41, 4);
                    v24 = objc_claimAutoreleasedReturnValue();
                    v25 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
                    v26 = *(void **)(v25 + 40);
                    *(_QWORD *)(v25 + 40) = v24;

                    goto LABEL_19;
                  }

                }
              }
              v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
              if (v8)
                continue;
              break;
            }
          }
LABEL_19:

          v3 = v27;
          v2 = v28;
          v4 = v31;
        }
        ++v4;
      }
      while (v4 != v2);
      v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
    }
    while (v2);
  }

}

- (id)getAllCandidates
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TypistCandidateBarFavonious;
  -[TypistCandidateBar getAllCandidates](&v8, sel_getAllCandidates);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __47__TypistCandidateBarFavonious_getAllCandidates__block_invoke;
  v6[3] = &unk_251A7D548;
  v4 = v3;
  v7 = v4;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v6);

  return v4;
}

void __47__TypistCandidateBarFavonious_getAllCandidates__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(a2, "candidate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByTrimmingCharactersInSet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:atIndexedSubscript:", v6, a3);

}

- (id)getVisibleCandidates
{
  return (id)-[objc_class getVisibleCandidateList:](+[TypistKeyboardData keyboardData](TypistKeyboardData, "keyboardData"), "getVisibleCandidateList:", CFSTR("typistCandidateBarTypeFavonious"));
}

- (int64_t)getIndexOfCandidate:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  int v8;
  int64_t v9;

  v4 = a3;
  -[TypistCandidateBarFavonious getAllCandidates](self, "getAllCandidates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  while (v6 < objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "objectAtIndex:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", v4);
    ++v6;

    if (v8)
    {
      if (v6 != 0x8000000000000000)
      {
        v9 = v6 - 1;
        goto LABEL_7;
      }
      break;
    }
  }
  v9 = -1;
LABEL_7:

  return v9;
}

- (BOOL)hasVisibleCandidate:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[TypistCandidateBarFavonious getVisibleCandidates](self, "getVisibleCandidates");
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v5);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "isEqualToString:", v4, (_QWORD)v10) & 1) != 0)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (int64_t)selectCandidate:(id)a3
{
  int64_t v4;

  v4 = -[TypistCandidateBarFavonious getIndexOfCandidate:](self, "getIndexOfCandidate:", a3);
  if (v4 < 0)
    return -1;
  else
    return -[TypistCandidateBarFavonious selectCandidateAtIndex:](self, "selectCandidateAtIndex:", v4);
}

- (int64_t)selectCandidateAtIndex:(int64_t)a3
{
  void *v4;
  _QWORD v6[5];

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __54__TypistCandidateBarFavonious_selectCandidateAtIndex___block_invoke;
  v6[3] = &__block_descriptor_40_e34_v16__0___RCPEventStreamComposer__8l;
  v6[4] = a3;
  objc_msgSend(MEMORY[0x24BE7CE50], "eventStreamWithEventActions:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[TypistKeyboardUtilities launchRecapWithSyntheticEventStream:](TypistKeyboardUtilities, "launchRecapWithSyntheticEventStream:", v4);

  return a3;
}

void __54__TypistCandidateBarFavonious_selectCandidateAtIndex___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  double x;
  double y;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  CGPoint v17;

  v3 = (void *)MEMORY[0x24BE7CE38];
  v16 = a2;
  objc_msgSend(v3, "touchScreenDigitizerSender");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setSenderProperties:", v4);

  -[objc_class getCandidateCenterAtIndex:](+[TypistKeyboardData keyboardData](TypistKeyboardData, "keyboardData"), "getCandidateCenterAtIndex:", *(_QWORD *)(a1 + 32));
  x = v17.x;
  y = v17.y;
  v7 = *(_QWORD *)(a1 + 32);
  NSStringFromCGPoint(v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  TYLog(CFSTR("Tapping index %li candidate center at: %@"), v8, v9, v10, v11, v12, v13, v14, v7);

  objc_msgSend(v16, "tap:", x, y);
}

@end
