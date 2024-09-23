@implementation UIKBPhoneToCarPlayTransformation

+ (id)transformationIdentifier
{
  return CFSTR("ptc");
}

+ (id)cachedKeys
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)__cachedKeys;
  if (!__cachedKeys)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)__cachedKeys;
    __cachedKeys = v3;

    v2 = (void *)__cachedKeys;
  }
  return v2;
}

+ (unint64_t)columnBySwappingForLeftHandDriveIfNeeded:(unint64_t)a3
{
  char IsRightHandDrive;
  unint64_t v5;
  unint64_t v6;

  IsRightHandDrive = UIKeyboardCarPlayIsRightHandDrive();
  if ((a3 & 0xFFFFFFFFFFFFFFFCLL) == 4)
    v5 = a3 - 3;
  else
    v5 = a3;
  if (a3 - 1 <= 2)
    v6 = a3 + 4;
  else
    v6 = v5;
  if ((IsRightHandDrive & 1) != 0)
    return a3;
  else
    return v6;
}

+ (id)fillFrame:(CGRect)a3 withEmptyKeyNamed:(id)a4 inKeyplane:(id)a5 withTransformationContext:(id)a6
{
  double height;
  double width;
  double y;
  double x;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  double v31;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  objc_msgSend(a1, "cachedKeys");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKey:", v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(v14, "removeKey:", v17);
  }
  else
  {
    objc_msgSend(v14, "firstCachedKeyWithName:", CFSTR("Return-Key"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v18, "copy");

  }
  objc_msgSend(v17, "setDisplayType:", 0);
  objc_msgSend(v17, "setInteractionType:", 0);
  objc_msgSend(v17, "setDisplayString:", &stru_1E16EDF20);
  objc_msgSend(v17, "setRepresentedString:", &stru_1E16EDF20);
  objc_msgSend(v17, "setFrame:", x, y, width, height);
  objc_msgSend(v17, "setPaddedFrame:", x, y, width, height);
  objc_msgSend(v17, "setName:", v13);
  objc_msgSend(a1, "cachedKeys");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "name");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKey:", v17, v20);

  objc_msgSend(v17, "frame");
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v28 = v27;
  objc_msgSend(v15, "screenTraits");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v29, "screen");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "scale");
  objc_msgSend(v14, "insertKey:withFrame:andShiftKeys:scale:", v17, 0, v22, v24, v26, v28, v31);

  return v17;
}

+ (void)removeAddedKeysFromKeyplane:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(a1, "cachedKeys", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(v4, "removeKey:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++));
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

+ (id)transformQWERTYKeyplane:(id)a3 withTransformationContext:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  uint64_t v14;
  double v15;
  double v16;
  BOOL v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  id v40;
  double (**v41)(_QWORD, double);
  void *v42;
  id v43;
  void *v44;
  id v45;
  void (**v46)(_QWORD, double, double, double, double);
  void (**v47)(void *, uint64_t, _QWORD);
  uint64_t v48;
  uint64_t v49;
  double v50;
  uint64_t j;
  void *v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  id v58;
  int v59;
  double MaxX;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  void *v68;
  double v69;
  void *v70;
  void *v71;
  void *v72;
  double v73;
  void *v74;
  void *v75;
  id v77;
  id v78;
  id v79;
  unsigned int v80;
  id v81;
  id v82;
  void *v83;
  id obj;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  _QWORD v89[4];
  id v90;
  id v91;
  uint64_t *v92;
  _QWORD v93[4];
  id v94;
  id v95;
  _QWORD *v96;
  id v97;
  _QWORD v98[4];
  _QWORD v99[4];
  id v100;
  id v101;
  _QWORD aBlock[4];
  id v103;
  uint64_t v104;
  id *v105;
  uint64_t v106;
  uint64_t (*v107)(uint64_t, uint64_t);
  void (*v108)(uint64_t);
  id v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  _BYTE v114[128];
  _BYTE v115[128];
  uint64_t v116;
  CGRect v117;
  CGRect v118;

  v116 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v81 = a1;
  objc_msgSend(a1, "removeAddedKeysFromKeyplane:", v6);
  v82 = v6;
  objc_msgSend(v6, "keyUnionFrame");
  v9 = v8;
  v11 = v10;
  v83 = v7;
  objc_msgSend(v7, "screenTraits");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "screen");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "scale");

  objc_msgSend(v6, "frame");
  v14 = objc_msgSend(v6, "numberOfRows");
  LODWORD(v6) = UIKeyboardAlwaysShowCandidateBarForCurrentInputMode();
  objc_msgSend(v83, "keyboardSize");
  v80 = v6;
  UICeilToScale((v15 - v9) / (double)(v14 + (unint64_t)v6), 1.0);
  v17 = v16 <= 0.0 || v14 == 0;
  if (!v17 && v11 > 0.0)
  {
    v18 = v16;
    objc_msgSend(v82, "keys");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "keyboardSize");
    v21 = v20 / v11;
    if (v20 / v11 != 1.0)
    {
      v112 = 0u;
      v113 = 0u;
      v110 = 0u;
      v111 = 0u;
      v22 = v19;
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v110, v115, 16);
      if (v23)
      {
        v24 = *(_QWORD *)v111;
        do
        {
          for (i = 0; i != v23; ++i)
          {
            if (*(_QWORD *)v111 != v24)
              objc_enumerationMutation(v22);
            v26 = *(void **)(*((_QWORD *)&v110 + 1) + 8 * i);
            objc_msgSend(v26, "frame");
            v28 = v27;
            v30 = v29;
            v32 = v31;
            v34 = v33;
            objc_msgSend(v26, "shape");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = (void *)objc_msgSend(v35, "copy");

            objc_msgSend(v36, "setFrame:", v21 * v28, v30, v21 * v32, v34);
            objc_msgSend(v26, "setShape:", v36);

          }
          v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v110, v115, 16);
        }
        while (v23);
      }

    }
    v104 = 0;
    v105 = (id *)&v104;
    v106 = 0x3032000000;
    v107 = __Block_byref_object_copy__149;
    v108 = __Block_byref_object_dispose__149;
    v109 = 0;
    objc_msgSend(v19, "sortedArrayUsingComparator:", &__block_literal_global_408);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __86__UIKBPhoneToCarPlayTransformation_transformQWERTYKeyplane_withTransformationContext___block_invoke_2;
    aBlock[3] = &unk_1E16B4780;
    v40 = v38;
    v103 = v40;
    v99[0] = v39;
    v99[1] = 3221225472;
    v99[2] = __86__UIKBPhoneToCarPlayTransformation_transformQWERTYKeyplane_withTransformationContext___block_invoke_3;
    v99[3] = &unk_1E16DA698;
    v41 = _Block_copy(aBlock);
    v101 = v41;
    v79 = v40;
    v100 = v79;
    v42 = _Block_copy(v99);
    v98[0] = 0;
    v98[1] = v98;
    v98[2] = 0x2020000000;
    v98[3] = 0;
    v93[0] = v39;
    v93[1] = 3221225472;
    v93[2] = __86__UIKBPhoneToCarPlayTransformation_transformQWERTYKeyplane_withTransformationContext___block_invoke_4;
    v93[3] = &unk_1E16DA6C0;
    v96 = v98;
    v97 = v81;
    v77 = v82;
    v94 = v77;
    v43 = v83;
    v95 = v43;
    v44 = _Block_copy(v93);
    v89[0] = v39;
    v89[1] = 3221225472;
    v89[2] = __86__UIKBPhoneToCarPlayTransformation_transformQWERTYKeyplane_withTransformationContext___block_invoke_5;
    v89[3] = &unk_1E16DA6E8;
    v92 = &v104;
    v45 = v42;
    v90 = v45;
    v46 = v44;
    v91 = v46;
    v47 = (void (**)(void *, uint64_t, _QWORD))_Block_copy(v89);
    v87 = 0u;
    v88 = 0u;
    v85 = 0u;
    v86 = 0u;
    obj = v37;
    v48 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v85, v114, 16);
    if (v48)
    {
      v49 = *(_QWORD *)v86;
      v50 = v18 * round(v18 / v18);
      do
      {
        for (j = 0; j != v48; ++j)
        {
          if (*(_QWORD *)v86 != v49)
            objc_enumerationMutation(obj);
          v52 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * j);
          objc_msgSend(v52, "frame", v77, v79);
          v54 = v53;
          v56 = v55;
          v57 = v9 + v18 * ((double)v80 + (double)(int)(objc_msgSend(v52, "displayRowHint") - 1));
          v58 = v105[5];
          if (v58
            && (v59 = objc_msgSend(v58, "displayRowHint"), v59 == objc_msgSend(v52, "displayRowHint")))
          {
            objc_msgSend(v105[5], "frame");
            MaxX = CGRectGetMaxX(v117);
            if (objc_msgSend(v105[5], "interactionType") == 14)
            {
              UIRoundToScale(v54, 1.0);
              v47[2](v47, 1, 0);
              objc_msgSend(v105[5], "frame");
              MaxX = CGRectGetMaxX(v118);
            }
            v61 = MaxX - v54;
            UIRoundToScale(v56 - v61, 1.0);
            v63 = v62;
            v64 = v54 + v61;
          }
          else
          {
            v65 = v41[2](v41, v54);
            UIFloorToScale(v65, 1.0);
            v64 = v66;
            UIRoundToScale(v56, 1.0);
            v63 = v67;
            objc_msgSend(v43, "keyboardSize");
            v47[2](v47, 0, 1);
            if (v64 > 1.0)
            {
              v46[2](v46, 0.0, v57, v64, v50);
              v68 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v68, "frame");
              (*((void (**)(id, void *, uint64_t))v45 + 2))(v45, v68, 1);

            }
          }
          (*((void (**)(id, void *, uint64_t, double, double, double, double))v45 + 2))(v45, v52, 1, v64, v57, v63, v50);
          if (objc_msgSend(v52, "visible"))
          {
            objc_msgSend(v52, "frame");
            if (v69 > 0.0)
              objc_storeStrong(v105 + 5, v52);
          }
        }
        v48 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v85, v114, 16);
      }
      while (v48);
    }

    objc_msgSend(v43, "keyboardSize");
    v47[2](v47, 0, 1);
    if (v80)
    {
      objc_msgSend(v81, "cachedKeys");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "objectForKey:", CFSTR("Candidate-Selection"));
      v71 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v71)
      {
        objc_msgSend(v77, "firstCachedKeyWithName:", CFSTR("Space-Key"));
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        v71 = (void *)objc_msgSend(v72, "copy");

      }
      objc_msgSend(v71, "setName:", CFSTR("Candidate-Selection"), v77);
      objc_msgSend(v71, "setDisplayString:", &stru_1E16EDF20);
      objc_msgSend(v71, "setRepresentedString:", &stru_1E16EDF20);
      objc_msgSend(v71, "setDisplayType:", 1);
      objc_msgSend(v71, "setInteractionType:", 3);
      objc_msgSend(v43, "keyboardSize");
      objc_msgSend(v71, "setFrame:", 0.0, v9, v73, v18);
      objc_msgSend(v71, "frame");
      objc_msgSend(v71, "setPaddedFrame:");
      objc_msgSend(v81, "cachedKeys");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "name");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "setObject:forKey:", v71, v75);

      objc_msgSend(v71, "frame");
      objc_msgSend(v78, "insertKey:withFrame:andShiftKeys:scale:", v71, 0);

    }
    _Block_object_dispose(v98, 8);

    _Block_object_dispose(&v104, 8);
  }

  return v82;
}

uint64_t __86__UIKBPhoneToCarPlayTransformation_transformQWERTYKeyplane_withTransformationContext___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  uint64_t v17;

  v4 = a3;
  objc_msgSend(a2, "frame");
  v6 = v5;
  v8 = v7;
  objc_msgSend(v4, "frame");
  v10 = v9;
  v12 = v11;

  if (vabdd_f64(v8, v12) >= 0.1)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x1E0CB37E8];
    v15 = v12;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x1E0CB37E8];
    v15 = v10;
  }
  objc_msgSend(v14, "numberWithDouble:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v13, "compare:", v16);

  return v17;
}

double __86__UIKBPhoneToCarPlayTransformation_transformQWERTYKeyplane_withTransformationContext___block_invoke_2(uint64_t a1, double a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  float v9;
  float v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v8, "floatValue", (_QWORD)v12);
        if (vabdd_f64(a2, v9) <= 1.0)
        {
          objc_msgSend(v8, "floatValue");
          a2 = v10;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  return a2;
}

void __86__UIKBPhoneToCarPlayTransformation_transformQWERTYKeyplane_withTransformationContext___block_invoke_3(uint64_t a1, void *a2, int a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7)
{
  id v13;
  double MaxX;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  id v20;
  CGRect v21;

  v13 = a2;
  v21.origin.x = a4;
  v21.origin.y = a5;
  v21.size.width = a6;
  v21.size.height = a7;
  MaxX = CGRectGetMaxX(v21);
  v15 = (*(double (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  if (v15 == MaxX)
  {
    v16 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", MaxX);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObject:", v17);

  }
  else
  {
    a6 = v15 - a4;
  }
  objc_msgSend(v13, "shape");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (id)objc_msgSend(v18, "copy");

  objc_msgSend(v20, "setFrame:", a4, a5, a6, a7);
  if (a3)
    v19 = 0.5;
  else
    v19 = 0.0;
  objc_msgSend(v20, "setPaddedFrame:", a4 + 0.0, a5 + 0.5, a6 - v19, a7 + -0.5);
  objc_msgSend(v13, "setShape:", v20);

}

id __86__UIKBPhoneToCarPlayTransformation_transformQWERTYKeyplane_withTransformationContext___block_invoke_4(uint64_t a1, double a2, double a3, double a4, double a5)
{
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Empty-Key-%ld"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  objc_msgSend(*(id *)(a1 + 56), "fillFrame:withEmptyKeyNamed:inKeyplane:withTransformationContext:", v10, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), a2, a3, a4, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

void __86__UIKBPhoneToCarPlayTransformation_transformQWERTYKeyplane_withTransformationContext___block_invoke_5(_QWORD *a1, uint64_t a2, int a3, double a4)
{
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGFloat v15;
  uint64_t v16;
  double MaxX;
  CGFloat v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  CGRect v23;
  CGRect v24;

  objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "frame");
  if (*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
  {
    v12 = v8;
    v13 = v9;
    v14 = v11;
    if (a3 && (v15 = v10, CGRectGetMaxX(*(CGRect *)&v8) <= a4 + -10.0))
    {
      v16 = a1[5];
      v23.origin.x = v12;
      v23.origin.y = v13;
      v23.size.width = v15;
      v23.size.height = v14;
      MaxX = CGRectGetMaxX(v23);
      v24.origin.x = v12;
      v24.origin.y = v13;
      v24.size.width = v15;
      v24.size.height = v14;
      v18 = CGRectGetMaxX(v24);
      (*(void (**)(uint64_t, double, double, double, double))(v16 + 16))(v16, MaxX, v13, a4 - v18, v14);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = a1[4];
      objc_msgSend(v19, "frame");
      (*(void (**)(uint64_t, void *, uint64_t))(v20 + 16))(v20, v19, a2);
      v21 = *(_QWORD *)(a1[6] + 8);
      v22 = *(void **)(v21 + 40);
      *(_QWORD *)(v21 + 40) = v19;

    }
    else
    {
      (*(void (**)(double, double, double, double))(a1[4] + 16))(v12, v13, a4 - v12, v14);
    }
  }
}

+ (id)transform10KeyKeyplane:(id)a3 withTransformationContext:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  double v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  int v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v49;
  double v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "keyUnionFrame");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  objc_msgSend(v7, "keyboardSize");
  v15 = v14;
  objc_msgSend(v7, "keyboardSize");
  v49 = round((v16 - v9) * 0.25);
  v50 = v9;
  if (v49 > 0.0)
  {
    v17 = v15 * 0.125;
    if (v15 * 0.125 > 0.0)
    {
      objc_msgSend(v6, "keys");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = 0u;
      v52 = 0u;
      v53 = 0u;
      v54 = 0u;
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
      if (v19)
      {
        v20 = v19;
        v21 = v11 * 0.125;
        v22 = round(v13 * 0.25);
        v23 = *(_QWORD *)v52;
        do
        {
          for (i = 0; i != v20; ++i)
          {
            if (*(_QWORD *)v52 != v23)
              objc_enumerationMutation(v18);
            v25 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
            objc_msgSend(v25, "shape", *(_QWORD *)&v49, *(_QWORD *)&v50);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = (void *)objc_msgSend(v26, "copy");

            objc_msgSend(v27, "frame");
            v29 = v28;
            v31 = v30;
            v33 = v32;
            v35 = v34;
            if (objc_msgSend(v25, "displayType") == 9
              || objc_msgSend(v25, "displayType") == 2)
            {
              objc_msgSend(v25, "setVisible:", 0);
            }
            else
            {
              v36 = v50 + v49 * round(v31 / v22) + 1.0;
              v37 = v49 * round(v35 / v22);
              v38 = (double)(unint64_t)objc_msgSend(a1, "columnBySwappingForLeftHandDriveIfNeeded:", vcvtad_u64_f64(v29 / v21));
              UIRoundToScale(v17 * v38, 1.0);
              v40 = v39;
              v41 = round(v33 / v21);
              v42 = objc_msgSend(v25, "interactionType");
              v43 = 3.0;
              if (v42 != 3)
                v43 = v41;
              UIRoundToScale(v17 * (v43 + v38), 1.0);
              v45 = v44;
              objc_msgSend(v7, "keyboardSize");
              if (v45 < v46)
                v46 = v45;
              v47 = v46 - v40;
              objc_msgSend(v27, "setFrame:", v40, v36, v46 - v40, v37);
              objc_msgSend(v27, "setPaddedFrame:", v40, v36, v47, v37);
              objc_msgSend(v25, "setShape:", v27);
            }

          }
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
        }
        while (v20);
      }

    }
  }

  return v6;
}

+ (id)transformKeyplane:(id)a3 withTransformationContext:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  unsigned __int8 v9;
  uint64_t v11;
  void *v12;
  void *v14;
  int v15;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "visualStyling");
  v9 = BYTE2(v8);
  objc_msgSend(v6, "setVisualStyling:", v8 & 0xFFFFFFFFFFFFFFC0 | 3);
  if (v9 > 0x22u || ((1 << v9) & 0x600000002) == 0)
  {
    objc_msgSend(v6, "name");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "containsString:", CFSTR("iPhone"));

    if (!v15)
      goto LABEL_7;
    objc_msgSend(a1, "transformQWERTYKeyplane:withTransformationContext:", v6, v7);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(a1, "transform10KeyKeyplane:withTransformationContext:", v6, v7);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v12 = (void *)v11;

  v6 = v12;
LABEL_7:

  return v6;
}

+ (id)cachedKeysForTransformationContext:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "cachedKeys", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
