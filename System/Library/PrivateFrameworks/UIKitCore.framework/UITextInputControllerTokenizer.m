@implementation UITextInputControllerTokenizer

void __91___UITextInputControllerTokenizer__closestTokenSubrangeForPosition_granularity_downstream___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  __CFString *v4;
  id WeakRetained;
  id v6;
  void *v7;
  uint64_t v8;
  CFIndex v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  CFIndex v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  uint64_t v23;
  unint64_t v24;
  id v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  CFIndex *v30;
  CFIndex v31;
  CFIndex v32;
  BOOL v33;
  BOOL v34;
  uint64_t v35;
  uint64_t v36;
  unsigned int v37;
  char v38;
  uint64_t v39;
  __CFString *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  __CFStringTokenizer *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  CFIndex *v56;
  CFIndex v57;
  unint64_t i;
  CFRange CurrentTokenRange;
  CFIndex location;
  CFIndex v61;
  BOOL v62;
  CFIndex v63;
  CFIndex v64;
  CFIndex v65;
  uint64_t *v66;
  _QWORD *v67;
  _QWORD *v68;
  CFIndex v69;
  uint64_t *v70;
  uint64_t v71;
  id v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  CFIndex v77;
  CFIndex v78;
  CFRange v79;
  CFIndex v80;
  CFIndex v81;
  BOOL v82;
  CFIndex v83;
  CFIndex v84;
  uint64_t *v85;
  uint64_t *v87;
  uint64_t v88;
  uint64_t *v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  void *v93;
  void *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  id v102;
  uint64_t v103;
  _QWORD v104[5];
  _QWORD v105[5];
  uint64_t v106;
  uint64_t *v107;
  uint64_t v108;
  void *v109;
  __int128 v110;
  CFRange v111;
  CFRange v112;

  v3 = a2;
  objc_msgSend(v3, "string");
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v4);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  v6 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  objc_msgSend(v6, "beginningOfDocument");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(WeakRetained, "offsetFromPosition:toPosition:", v7, *(_QWORD *)(a1 + 40));

  v9 = -[__CFString length](v4, "length");
  if (*(uint64_t *)(a1 + 64) < 1)
  {
    v14 = 0;
    goto LABEL_17;
  }
  v103 = v8;
  v10 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  objc_msgSend(v10, "positionFromPosition:offset:", *(_QWORD *)(a1 + 40), -*(_QWORD *)(a1 + 64));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  objc_msgSend(v12, "positionFromPosition:offset:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    if (v13)
      goto LABEL_4;
  }
  else
  {
    v25 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
    objc_msgSend(v25, "beginningOfDocument");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
      goto LABEL_4;
  }
  v26 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  objc_msgSend(v26, "endOfDocument");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_4:
  v14 = 0;
  if (v11 && v13)
  {
    v15 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
    objc_msgSend(v15, "textRangeFromPosition:toPosition:", v11, v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      v17 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
      v102 = v3;
      v18 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
      objc_msgSend(v18, "beginningOfDocument");
      v101 = v16;
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v17, "offsetFromPosition:toPosition:", v19, v11);

      v20 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
      v21 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
      objc_msgSend(v21, "beginningOfDocument");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v20, "offsetFromPosition:toPosition:", v22, v13);

      v3 = v102;
      v24 = -[__CFString length](v4, "length");
      if (v23 - v14 >= v24)
        v9 = v24;
      else
        v9 = v23 - v14;
      v16 = v101;
    }
    else
    {
      v14 = 0;
    }

  }
  v8 = v103;
LABEL_17:
  v27 = *(_QWORD *)(a1 + 32);
  if (v27)
  {
    v28 = *(_QWORD *)(a1 + 72);
    v29 = 1;
    if (v28 == 1)
      v29 = 2;
    v30 = (CFIndex *)(v27 + OBJC_IVAR____UITextInputControllerTokenizer__textInput[v29]);
    v31 = *v30;
    if (*v30 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v32 = v30[1] + v31;
      v33 = v14 >= v31 && v14 + v9 <= v32;
      if (!v33)
      {
        v34 = v28 == 1;
        v35 = 6;
        if (v34)
          v35 = 5;
        *(_BYTE *)(v27 + OBJC_IVAR____UITextInputControllerTokenizer__textInput[v35]) = 1;
      }
    }
  }
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_29:
    *(_OWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32) = xmmword_186679030;
    goto LABEL_123;
  }
  v36 = *(_QWORD *)(a1 + 72);
  v37 = 0;
  v38 = 1;
  switch(v36)
  {
    case 0:
      *(_OWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32) = xmmword_186679030;
      if (!*(_BYTE *)(a1 + 80))
      {
        v41 = v8 - 1;
        if (v8 < 1)
          goto LABEL_123;
        v40 = v4;
        goto LABEL_47;
      }
      v39 = v8 + 1;
      if (v8 + 1 < (unint64_t)-[__CFString length](v4, "length"))
      {
        v40 = v4;
        v41 = v8 + 1;
LABEL_47:
        v47 = -[__CFString rangeOfComposedCharacterSequenceAtIndex:](v40, "rangeOfComposedCharacterSequenceAtIndex:", v41);
        v48 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        *(_QWORD *)(v48 + 32) = v47;
        *(_QWORD *)(v48 + 40) = v49;
        goto LABEL_123;
      }
      if (v39 == -[__CFString length](v4, "length"))
      {
        v50 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        *(_QWORD *)(v50 + 32) = v39;
        *(_QWORD *)(v50 + 40) = 0;
      }
      goto LABEL_123;
    case 1:
      goto LABEL_37;
    case 2:
      v38 = 0;
      v37 = 1;
      goto LABEL_37;
    case 3:
      v38 = 0;
      v37 = 2;
      goto LABEL_37;
    case 4:
      v38 = 0;
      v37 = 3;
LABEL_37:
      v42 = *(_QWORD *)(a1 + 32);
      if (v42)
      {
        v43 = 3;
        if (v36 == 1)
          v43 = 4;
        v44 = *(__CFStringTokenizer **)(v42 + OBJC_IVAR____UITextInputControllerTokenizer__textInput[v43]);
        if ((v38 & 1) != 0)
          goto LABEL_51;
      }
      else
      {
        v44 = 0;
        if ((v38 & 1) != 0)
          goto LABEL_51;
      }
      if (v44 && v37 != *(_DWORD *)(v42 + 48))
      {
        -[_UITextInputControllerTokenizer setTokenizer:forGranularity:](v42, 0, v36);
        goto LABEL_57;
      }
LABEL_51:
      if (!v44)
      {
LABEL_57:
        v112.location = v14;
        v112.length = v9;
        v44 = CFStringTokenizerCreate(0, v4, v112, v37, 0);
        -[_UITextInputControllerTokenizer setTokenizer:forGranularity:](*(_QWORD *)(a1 + 32), (uint64_t)v44, *(_QWORD *)(a1 + 72));
        v52 = *(_QWORD *)(a1 + 32);
        if (!v52 || *(_QWORD *)(a1 + 72) == 1)
        {
LABEL_61:
          if (v52)
          {
            v53 = 6;
            if (*(_QWORD *)(a1 + 72) == 1)
              v53 = 5;
            *(_BYTE *)(v52 + OBJC_IVAR____UITextInputControllerTokenizer__textInput[v53]) = 0;
            v54 = *(_QWORD *)(a1 + 32);
            if (v54)
            {
              v55 = 1;
              if (*(_QWORD *)(a1 + 72) == 1)
                v55 = 2;
              v56 = (CFIndex *)(v54 + OBJC_IVAR____UITextInputControllerTokenizer__textInput[v55]);
              *v56 = v14;
              v56[1] = v9;
            }
          }
          goto LABEL_68;
        }
        *(_DWORD *)(v52 + 48) = v37;
LABEL_60:
        v52 = *(_QWORD *)(a1 + 32);
        goto LABEL_61;
      }
      if (v42)
      {
        v51 = 6;
        if (v36 == 1)
          v51 = 5;
        if (*(_BYTE *)(v42 + OBJC_IVAR____UITextInputControllerTokenizer__textInput[v51]))
        {
          v111.location = v14;
          v111.length = v9;
          CFStringTokenizerSetString(v44, v4, v111);
          goto LABEL_60;
        }
      }
LABEL_68:
      v106 = 0;
      v107 = &v106;
      v108 = 0x3010000000;
      v109 = &unk_18685B0AF;
      v110 = xmmword_186684A30;
      if (*(_BYTE *)(a1 + 80))
      {
        v57 = v14 + v9;
        for (i = v8; i < -[__CFString length](v4, "length"); ++i)
        {
          CFStringTokenizerGoToTokenAtIndex(v44, i);
          CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(v44);
          if (CurrentTokenRange.location == -1)
          {
            v70 = v107;
            v107[4] = -1;
            v68 = v70 + 4;
            v68[1] = CurrentTokenRange.length;
            v67 = v68 + 1;
          }
          else
          {
            if (CurrentTokenRange.location <= v14)
              location = v14;
            else
              location = CurrentTokenRange.location;
            v61 = CurrentTokenRange.location + CurrentTokenRange.length;
            if (CurrentTokenRange.location + CurrentTokenRange.length >= v57)
              v61 = v57;
            v62 = v61 <= location;
            v63 = v61 - location;
            if (v62)
              v64 = 0;
            else
              v64 = v63;
            if (v62)
              v65 = 0;
            else
              v65 = location;
            v66 = v107;
            v107[5] = v64;
            v67 = v66 + 5;
            *(v67 - 1) = v65;
            v68 = v67 - 1;
            if (v65 != -1)
            {
              v69 = v65 + v64;
              if (v69 > v8)
              {
                v75 = *(_QWORD *)off_1E1678C48;
                v105[0] = MEMORY[0x1E0C809B0];
                v105[1] = 3221225472;
                v105[2] = __91___UITextInputControllerTokenizer__closestTokenSubrangeForPosition_granularity_downstream___block_invoke_2;
                v105[3] = &unk_1E16E6C58;
                v105[4] = &v106;
                objc_msgSend(v3, "enumerateAttribute:inRange:options:usingBlock:", v75, v8, v69 - v8, 0, v105);
                break;
              }
            }
          }
          *v68 = -1;
          *v67 = 0;
        }
      }
      else
      {
        if (*(_QWORD *)(a1 + 72) == 3)
        {
          v71 = v8;
          v72 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
          v73 = objc_msgSend(v72, "selectionAffinity");

          if (v73)
            v74 = -1;
          else
            v74 = 0;
          v8 = v71;
        }
        else
        {
          v74 = -1;
        }
        v76 = v74 + v8;
        if (v74 + v8 >= 0)
        {
          v77 = v14 + v9;
          v78 = v74 + v8;
          do
          {
            CFStringTokenizerGoToTokenAtIndex(v44, v78);
            v79 = CFStringTokenizerGetCurrentTokenRange(v44);
            if (v79.location == -1)
            {
              v87 = v107;
              v107[4] = -1;
              v87[5] = v79.length;
            }
            else
            {
              if (v79.location <= v14)
                v80 = v14;
              else
                v80 = v79.location;
              v81 = v79.location + v79.length;
              if (v79.location + v79.length >= v77)
                v81 = v77;
              v82 = v81 <= v80;
              v83 = v81 - v80;
              if (v82)
                v83 = 0;
              if (v82)
                v84 = 0;
              else
                v84 = v80;
              v85 = v107;
              v107[4] = v84;
              v85[5] = v83;
              if (v84 != -1 && v76 >= v84)
              {
                v88 = *(_QWORD *)off_1E1678C48;
                v104[0] = MEMORY[0x1E0C809B0];
                v104[1] = 3221225472;
                v104[2] = __91___UITextInputControllerTokenizer__closestTokenSubrangeForPosition_granularity_downstream___block_invoke_3;
                v104[3] = &unk_1E16E6C58;
                v104[4] = &v106;
                objc_msgSend(v3, "enumerateAttribute:inRange:options:usingBlock:", v88, v84, v76 - v84, 2, v104);
                break;
              }
            }
            v33 = v78-- < 1;
          }
          while (!v33);
        }
      }
      v89 = v107;
      v90 = v107[4];
      if (v90 == -1)
        v90 = 0x7FFFFFFFFFFFFFFFLL;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32) = v90;
      v91 = v89[5];
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = v91;
      if (v91 >= 1)
      {
        objc_msgSend(v3, "string");
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v92, "substringWithRange:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        v95 = objc_msgSend(v93, "rangeOfCharacterFromSet:options:", v94, 4);
        v97 = v96;

        v98 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        v99 = *(_QWORD *)(v98 + 32);
        if (v99 + v95 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v100 = *(_QWORD *)(v98 + 40);
          if (v99 + v95 + v97 == v100 + v99)
            *(_QWORD *)(v98 + 40) = v100 - v97;
        }
      }
      _Block_object_dispose(&v106, 8);
LABEL_123:

      return;
    case 5:
      v45 = -[__CFString length](v4, "length");
      v46 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      *(_QWORD *)(v46 + 32) = 0;
      *(_QWORD *)(v46 + 40) = v45;
      goto LABEL_123;
    default:
      goto LABEL_29;
  }
}

void __91___UITextInputControllerTokenizer__closestTokenSubrangeForPosition_granularity_downstream___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  id v8;
  BOOL v9;
  id v10;

  v8 = a2;
  if (v8)
  {
    v10 = v8;
    v9 = objc_msgSend(v8, "embeddingType") == 1;
    v8 = v10;
    if (v9)
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = a3
                                                                  - *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                              + 32);
      *a5 = 1;
    }
  }

}

void __91___UITextInputControllerTokenizer__closestTokenSubrangeForPosition_granularity_downstream___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  id v9;
  BOOL v10;
  uint64_t v11;
  unint64_t v12;
  id v13;

  v9 = a2;
  if (v9)
  {
    v13 = v9;
    v10 = objc_msgSend(v9, "embeddingType") == 1;
    v9 = v13;
    if (v10)
    {
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v12 = *(_QWORD *)(v11 + 32);
      if (a3 + a4 >= v12)
        *(_QWORD *)(v11 + 40) = a3 + a4 - v12;
      *a5 = 1;
    }
  }

}

@end
