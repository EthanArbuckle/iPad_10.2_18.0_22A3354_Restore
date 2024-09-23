@implementation UIKBResizingOffsetKeyplaneTransformation

+ (id)transformationIdentifier
{
  return CFSTR("rs");
}

+ (id)transformKeyplane:(id)a3 withTransformationContext:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v50;
  id v51;
  void *v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  _BYTE v62[128];
  uint64_t v63;
  _QWORD v64[3];
  CGRect v65;
  CGRect v66;

  v64[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "visualStyling") & 0xFF0000;
  v8 = objc_msgSend(v5, "visualStyling") & 0xFF0000;
  objc_msgSend(v6, "resizingOffset");
  if (v9 >= -170.0)
    v10 = v9;
  else
    v10 = -170.0;
  if (v7 != 589824 && v8 != 2490368 && v10 != 0.0)
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "candidateController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "candidateBarHeight");
    v10 = v10 + v13;

  }
  objc_msgSend(v5, "resizingOffset");
  v15 = v14;
  objc_msgSend(v6, "screenTraits");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "orientation");

  objc_msgSend(v6, "screenTraits");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "screen");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "scale");
  v20 = v19;

  objc_msgSend(v5, "numberOfRows");
  v21 = v10 - v15;
  if (v21 != 0.0)
  {
    objc_msgSend(v5, "setResizingOffset:", v10);
    v50 = v7;
    v51 = v6;
    if (v7 == 589824)
    {
      objc_msgSend(v5, "firstCachedKeyWithName:", CFSTR("Handwriting-Input"));
      v23 = objc_claimAutoreleasedReturnValue();
      v22 = (void *)v23;
      if (v23)
      {
        v64[0] = v23;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v64, 1);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "resizeKeys:withOffset:scale:", v24, 0.0, v21, v20);

      }
      objc_msgSend(v5, "keysForDisplayRowAtIndex:", 2);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "repositionKeys:withOffset:scale:", v27, 0.0, v21, v20);

    }
    else if (v8 == 2490368)
    {
      objc_msgSend(v5, "firstCachedKeyWithName:", CFSTR("Emoji-InputView-Key"));
      v25 = objc_claimAutoreleasedReturnValue();
      v22 = (void *)v25;
      if (v25)
      {
        v63 = v25;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v63, 1);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "resizeKeys:withOffset:scale:", v26, 0.0, v21, v20);

      }
      objc_msgSend(v5, "keys");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = (void *)objc_msgSend(v28, "mutableCopy");

      objc_msgSend(v29, "removeObject:", v22);
      objc_msgSend(v5, "repositionKeys:withOffset:scale:", v29, 0.0, v21, v20);

    }
    else
    {
      objc_msgSend(v5, "keys");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "repositionKeys:withOffset:scale:", v22, 0.0, v21, v20);
    }

    +[UIKBShapeOperator operatorWithScale:](UIKBShapeOperator, "operatorWithScale:", v20);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v52 = v5;
    objc_msgSend(v5, "subtrees");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v53, v62, 16);
    if (v32)
    {
      v33 = v32;
      v34 = *(_QWORD *)v54;
      do
      {
        for (i = 0; i != v33; ++i)
        {
          if (*(_QWORD *)v54 != v34)
            objc_enumerationMutation(v31);
          v36 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
          if (objc_msgSend(v36, "type") == 3)
          {
            objc_msgSend(v36, "shape");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v61 = v37;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v61, 1);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "shapesByResizingShapes:withOffset:", v38, 0.0, v21);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "firstObject");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "setShape:", v40);

          }
        }
        v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v53, v62, 16);
      }
      while (v33);
    }

    v5 = v52;
    objc_msgSend(v52, "setObject:forProperty:", 0, CFSTR("KBunionFrame"));
    objc_msgSend(v52, "setObject:forProperty:", 0, CFSTR("KBunionPaddedFrame"));

    v7 = v50;
    v6 = v51;
  }
  if (v7 == 589824)
  {
    objc_msgSend(v5, "firstCachedKeyWithName:", CFSTR("Candidate-Selection"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = v41;
    if (v41)
    {
      objc_msgSend(v41, "paddedFrame");
      if (CGRectGetMinY(v65) == 0.0)
      {
        v60 = v42;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v60, 1);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "insetKeys:withInsets:scale:", v43, 11.0, 0.0, 0.0, 0.0, v20);

        v59 = v42;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v59, 1);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "resizeKeys:withOffset:scale:", v44, 0.0, 11.0, v20);

      }
    }
    objc_msgSend(v5, "firstCachedKeyWithName:", CFSTR("Delete-Key"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = v45;
    if (v45)
    {
      objc_msgSend(v45, "paddedFrame");
      if (CGRectGetMinY(v66) == 0.0)
      {
        v58 = v46;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v58, 1);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "insetKeys:withInsets:scale:", v47, 11.0, 0.0, 0.0, 0.0, v20);

        v57 = v46;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v57, 1);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "resizeKeys:withOffset:scale:", v48, 0.0, 11.0, v20);

      }
    }

  }
  return v5;
}

@end
