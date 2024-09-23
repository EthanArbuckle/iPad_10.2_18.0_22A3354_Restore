@implementation UIKBResizableKeyplaneTransformation

+ (id)transformationIdentifier
{
  return CFSTR("rk");
}

+ (double)estimatedProgressForHeight:(double)a3
{
  double v3;

  v3 = fmin(fmax((a3 + -300.0) / 300.0, 0.0), 1.0);
  return v3 * v3 * (3.0 - (v3 + v3));
}

+ (id)transformKeyplane:(id)a3 withTransformationContext:(id)a4
{
  id v5;
  id v6;
  void *v7;
  _BYTE *v8;
  void *v9;
  id v10;
  unsigned __int8 *v11;
  int v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  _BYTE *v23;
  BOOL v24;
  id v25;
  void *v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  unsigned __int8 *v34;
  int v35;
  unsigned __int8 *v36;
  int v37;
  double v38;
  double v39;
  double v40;
  unsigned __int8 *v41;
  int v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  unint64_t v49;
  double v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  void *v71;
  double v72;
  void *v73;
  double v74;
  unsigned __int8 *v75;
  int v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double MaxY;
  void *v85;
  void *v86;
  double v87;
  double v88;
  unsigned __int8 *v89;
  int v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  void *v98;
  void *v99;
  double v100;
  void *v101;
  void *v102;
  uint64_t v103;
  uint64_t v104;
  double v105;
  uint64_t v106;
  uint64_t i;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  id v113;
  double v114;
  void *v115;
  void *v116;
  void *v117;
  double v118;
  id v119;
  double v120;
  double v121;
  void *v122;
  void *v123;
  double v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  void *v129;
  _BYTE v130[128];
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  _QWORD v136[3];
  CGRect v137;

  v136[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if ((objc_msgSend(v5, "visualStyling") & 0xFF0000) == 0x260000)
  {
    objc_msgSend(v5, "firstCachedKeyWithName:", CFSTR("Delete-Key"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      objc_msgSend(v5, "removeKey:", v7);
    objc_msgSend(v6, "screenTraits");
    v8 = (_BYTE *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8 && v8[35])
    {

    }
    else
    {
      objc_msgSend(v6, "screenTraits");
      v11 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
      if (!v11)
      {
        v13 = 0;
LABEL_17:

        goto LABEL_18;
      }
      v12 = v11[37];

      if (!v12)
      {
LABEL_18:
        objc_msgSend(v5, "frame");
        v16 = v15;
        v18 = v17;
        objc_msgSend(v6, "keyboardSize");
        v20 = v19;
        v22 = v21;
        objc_msgSend(v6, "screenTraits");
        v23 = (_BYTE *)objc_claimAutoreleasedReturnValue();
        if (v23 && v23[37])
        {
          if (v20 == 0.0)
          {
LABEL_21:

LABEL_27:
            v25 = v5;
LABEL_28:

            goto LABEL_29;
          }
        }
        else
        {
          v24 = v16 == v20;
          if (v18 != v22)
            v24 = 0;
          if (v20 == 0.0 || v24)
            goto LABEL_21;
        }

        if (v22 == 0.0)
          goto LABEL_27;
        v124 = v20;
        objc_msgSend(v6, "screenTraits");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "screen");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "scale");
        v30 = v29;

        objc_msgSend(v5, "numberOfRows");
        objc_msgSend(v5, "firstCachedKeyWithName:", CFSTR("Emoji-InputView-Key"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "firstCachedKeyWithName:", CFSTR("Emoji-Category-Control-Key"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "firstCachedKeyWithName:", CFSTR("Emoji-International-Key"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "screenTraits");
        v34 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        if (v34)
        {
          v35 = v34[37];

          if (v35)
          {
            if (v32)
              objc_msgSend(v5, "removeKey:", v32);
            if (v33)
              objc_msgSend(v5, "removeKey:", v33);
          }
        }
        objc_msgSend(v6, "screenTraits");
        v36 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        v123 = v33;
        v114 = v22;
        if (v36)
        {
          v37 = v36[37];

          v38 = 0.0;
          if (v37)
          {
            v39 = 0.0;
LABEL_39:
            v40 = v22;
LABEL_52:
            if (v31)
            {
              objc_msgSend(v31, "frame");
              v118 = v57;
              v120 = v16;
              v59 = v58;
              v60 = v30;
              v62 = v61;
              v64 = v63;
              objc_msgSend(v32, "frame");
              v66 = v40 - v59 - v39 * v65;
              v67 = v38 + v38;
              v68 = v38;
              v69 = v18;
              v70 = v124 - v67;
              v136[0] = v31;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v136, 1);
              v71 = (void *)objc_claimAutoreleasedReturnValue();
              v72 = v70 - v62;
              v30 = v60;
              v18 = v69;
              v38 = v68;
              objc_msgSend(v5, "resizeKeys:withOffset:scale:", v71, v72, v66 - v64, v60);

              v135 = v31;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v135, 1);
              v73 = (void *)objc_claimAutoreleasedReturnValue();
              v74 = v59 - v59;
              v16 = v120;
              objc_msgSend(v5, "repositionKeys:withOffset:scale:", v73, v68 - v118, v74, v60);

            }
            if (v32)
            {
              objc_msgSend(v6, "screenTraits");
              v75 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
              if (!v75 || (v76 = v75[37], v75, !v76))
              {
                objc_msgSend(v32, "frame", *(_QWORD *)&v114);
                v121 = v77;
                v79 = v78;
                v80 = v38;
                v82 = v81;
                objc_msgSend(v31, "frame");
                v83 = v16;
                MaxY = CGRectGetMaxY(v137);
                objc_msgSend(v32, "originalFrame");
                v134 = v32;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v134, 1);
                v85 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v5, "resizeKeys:withOffset:scale:", v85, v124 - (v80 + v80) - v82, 0.0, v30);

                v133 = v32;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v133, 1);
                v86 = (void *)objc_claimAutoreleasedReturnValue();
                v87 = MaxY - v79;
                v16 = v83;
                objc_msgSend(v5, "repositionKeys:withOffset:scale:", v86, v80 - v121, v87, v30);

              }
            }
            v116 = v31;
            v88 = v114;
            if (v33)
            {
              objc_msgSend(v6, "screenTraits");
              v89 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
              if (!v89 || (v90 = v89[37], v89, !v90))
              {
                objc_msgSend(v33, "frame", *(_QWORD *)&v114);
                v91 = v30;
                v93 = v92;
                v95 = v94;
                objc_msgSend(v32, "frame");
                v97 = v96;
                v132 = v33;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v132, 1);
                v98 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v5, "resizeKeys:withOffset:scale:", v98, 0.0 - v95, 0.0, v91);

                v131 = v33;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v131, 1);
                v99 = (void *)objc_claimAutoreleasedReturnValue();
                v100 = v97 - v93;
                v30 = v91;
                objc_msgSend(v5, "repositionKeys:withOffset:scale:", v99, 0.0, v100, v91);

              }
            }
            v115 = v32;
            v117 = v7;
            v119 = v6;
            +[UIKBShapeOperator operatorWithScale:](UIKBShapeOperator, "operatorWithScale:", v30, *(_QWORD *)&v114);
            v101 = (void *)objc_claimAutoreleasedReturnValue();
            v125 = 0u;
            v126 = 0u;
            v127 = 0u;
            v128 = 0u;
            v122 = v5;
            objc_msgSend(v5, "subtrees");
            v102 = (void *)objc_claimAutoreleasedReturnValue();
            v103 = objc_msgSend(v102, "countByEnumeratingWithState:objects:count:", &v125, v130, 16);
            if (v103)
            {
              v104 = v103;
              v105 = v88 - v18;
              v106 = *(_QWORD *)v126;
              do
              {
                for (i = 0; i != v104; ++i)
                {
                  if (*(_QWORD *)v126 != v106)
                    objc_enumerationMutation(v102);
                  v108 = *(void **)(*((_QWORD *)&v125 + 1) + 8 * i);
                  if (objc_msgSend(v108, "type") == 3)
                  {
                    objc_msgSend(v108, "shape");
                    v109 = (void *)objc_claimAutoreleasedReturnValue();
                    v129 = v109;
                    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v129, 1);
                    v110 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v101, "shapesByResizingShapes:withOffset:", v110, v124 - v16, v105);
                    v111 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v111, "firstObject");
                    v112 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v108, "setShape:", v112);

                  }
                }
                v104 = objc_msgSend(v102, "countByEnumeratingWithState:objects:count:", &v125, v130, 16);
              }
              while (v104);
            }

            v5 = v122;
            objc_msgSend(v122, "setObject:forProperty:", 0, CFSTR("KBunionFrame"));
            objc_msgSend(v122, "setObject:forProperty:", 0, CFSTR("KBunionPaddedFrame"));

            v113 = v122;
            v7 = v117;
            v6 = v119;
            goto LABEL_28;
          }
        }
        objc_msgSend(v6, "screenTraits", *(_QWORD *)&v22);
        v41 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        if (!v41)
        {
          v43 = v32;
          v45 = v31;
          v55 = 0;
          v39 = 1.0;
          v38 = 0.0;
          v40 = v22;
LABEL_51:

          v31 = v45;
          v32 = v43;
          v33 = v123;
          goto LABEL_52;
        }
        v42 = v41[35];

        if (!v42)
        {
          v39 = 1.0;
          v38 = 0.0;
          goto LABEL_39;
        }
        v43 = v32;
        objc_msgSend(v6, "screenTraits");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = v31;
        if ((unint64_t)(objc_msgSend(v44, "orientation") - 1) >= 2)
        {
          +[UIDevice currentDevice](UIDevice, "currentDevice");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = v7;
          v48 = objc_msgSend(v46, "userInterfaceIdiom");

          v49 = v48 & 0xFFFFFFFFFFFFFFFBLL;
          v7 = v47;

          v39 = 0.0;
          if (v49 != 1)
          {
LABEL_47:
            +[UIKeyboard activeKeyboard](UIKeyboard, "activeKeyboard");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "window");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            v53 = v52;
            if (v52)
            {
              v54 = v52;
            }
            else
            {
              +[UIWindow _applicationKeyWindow](UIWindow, "_applicationKeyWindow");
              v54 = (id)objc_claimAutoreleasedReturnValue();
            }
            v55 = v54;

            objc_msgSend(v55, "safeAreaInsets");
            v40 = v22 - v39 * v56;
            v38 = 15.0;
            goto LABEL_51;
          }
        }
        else
        {

        }
        objc_msgSend((id)objc_opt_class(), "estimatedProgressForHeight:", v22);
        v39 = v50;
        goto LABEL_47;
      }
    }
    objc_msgSend(v5, "firstCachedKeyWithName:", CFSTR("Space-Key"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      objc_msgSend(v5, "removeKey:", v9);
    objc_msgSend(v5, "firstCachedKeyWithName:", CFSTR("Emoji-Search-Control-Key"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
      objc_msgSend(v5, "removeKey:", v13);
    objc_msgSend(v5, "firstCachedKeyWithName:", CFSTR("Dismiss-Key"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
      objc_msgSend(v5, "removeKey:", v14);

    goto LABEL_17;
  }
  v10 = v5;
LABEL_29:

  return v5;
}

@end
