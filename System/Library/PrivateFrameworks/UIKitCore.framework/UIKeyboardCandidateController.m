@implementation UIKeyboardCandidateController

- (void)_setRenderConfig:(id)a3
{
  id v3;
  id v5;

  v3 = a3;
  v5 = a3;
  objc_storeStrong((id *)&self->_renderConfig, v3);
  LODWORD(v3) = self->_darkKeyboard;
  if ((_DWORD)v3 != (objc_msgSend(v5, "lightKeyboard") ^ 1))
  {
    self->_darkKeyboard = objc_msgSend(v5, "lightKeyboard") ^ 1;
    -[UIKeyboardCandidateController updateStates](self, "updateStates");
  }

}

- (void)setScreenTraits:(id)a3
{
  UIKBScreenTraits *v5;
  UIKBScreenTraits *v6;

  v5 = (UIKBScreenTraits *)a3;
  if (self->_screenTraits != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_screenTraits, a3);
    -[UIKeyboardCandidateController updateStates](self, "updateStates");
    v5 = v6;
  }

}

- (void)setReuseArrowButtonToExpandAssistantBarItems:(BOOL)a3
{
  self->_reuseArrowButtonToExpandAssistantBarItems = a3;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__UIKeyboardCandidateController_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ECD7E9D8 != -1)
    dispatch_once(&qword_1ECD7E9D8, block);
  return (id)_MergedGlobals_1105;
}

- (void)updateStates
{
  -[UIKeyboardCandidateController updateConfigurations](self, "updateConfigurations");
  -[UIKeyboardCandidateController updateStatesForBar](self, "updateStatesForBar");
  -[UIKeyboardCandidateController updateStatesForInlineView](self, "updateStatesForInlineView");
  -[UIKeyboardCandidateController updateStatesForKey](self, "updateStatesForKey");
}

- (void)updateStatesForInlineView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  void *v39;
  double v40;
  double v41;
  void *v42;
  void *v43;
  double v44;
  double v45;
  void *v46;
  double v47;
  CGFloat v48;
  double v49;
  CGFloat v50;
  double v51;
  double v52;
  void *v53;
  void *v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  void *v63;
  void *v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double MaxY;
  double v76;
  double v77;
  void *v78;
  double v79;
  double v80;
  void *v81;
  double v82;
  double v83;
  void *v84;
  double v85;
  double v86;
  double v87;
  void *v88;
  double v89;
  uint64_t v90;
  uint64_t v91;
  double v92;
  double v93;
  void *v94;
  double v95;
  double v96;
  double v97;
  double v98;
  void *v99;
  double v100;
  double v101;
  void *v102;
  void *v103;
  uint64_t v104;
  void *v105;
  _BOOL4 v106;
  void *v107;
  double v108;
  double v109;
  void *v110;
  double v111;
  double v112;
  void *v113;
  void *v114;
  double v115;
  double v116;
  double v117;
  double v118;
  double v119;
  double v120;
  double v121;
  void *v122;
  void *v123;
  double v124;
  void *v125;
  char v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  char v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  double MinY;
  CGFloat v138;
  CGFloat rect;
  id v140;
  CGRect v141;
  CGRect v142;
  CGRect v143;
  CGRect v144;
  CGRect v145;
  CGRect v146;

  if ((-[UIKeyboardCandidateController activeCandidateViewType](self, "activeCandidateViewType") & 4) == 0)
    return;
  -[UIKeyboardCandidateController inlineView](self, "inlineView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKeyboardCandidateViewImageRenderer sharedImageRenderer](UIKeyboardCandidateViewImageRenderer, "sharedImageRenderer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setViewForTraitCollection:", v3);

  -[UIKeyboardCandidateController inlineConfiguration](self, "inlineConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "initialState");
  v140 = (id)objc_claimAutoreleasedReturnValue();

  -[UIKeyboardCandidateController inlineConfiguration](self, "inlineConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "extendedState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "inputDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "inputDelegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "insertionPointColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v140, "style");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setHighlightedBackgroundColor:", v13);

    objc_msgSend(v12, "insertionPointColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "style");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setHighlightedBackgroundColor:", v15);

    objc_msgSend(v12, "insertionPointColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v140, "style");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "highlightedTextColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "_distanceFrom:", v19);
    if (v20 != 1.79769313e308 && v20 <= 0.1)
    {
      objc_msgSend(v140, "style");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "highlightedBackgroundColor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "_inverseColor");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v140, "style");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setHighlightedTextColor:", v23);

      objc_msgSend(v140, "style");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "highlightedBackgroundColor");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "_inverseColor");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v140, "style");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setHighlightedCandidateNumberColor:", v27);

      objc_msgSend(v140, "style");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "highlightedBackgroundColor");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "_inverseColor");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "style");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setHighlightedTextColor:", v31);

      objc_msgSend(v140, "style");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "highlightedBackgroundColor");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "_inverseColor");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "style");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setHighlightedCandidateNumberColor:", v35);

    }
  }
  +[UIKeyboardCandidateViewConfiguration lineHeightMultiplierForCurrentLanguage](UIKeyboardCandidateViewConfiguration, "lineHeightMultiplierForCurrentLanguage");
  v38 = v37;
  objc_msgSend(v140, "style");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "rowHeight");
  v41 = v38 * v40;
  objc_msgSend(v140, "style");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setRowHeight:", v41);

  objc_msgSend(v7, "style");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "rowHeight");
  v45 = v38 * v44;
  objc_msgSend(v7, "style");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setRowHeight:", v45);

  -[UIKeyboardCandidateController inlineRect](self, "inlineRect");
  v48 = v47;
  v50 = v49;
  v138 = v51;
  rect = v52;
  -[UIKeyboardCandidateController inlineViewContainer](self, "inlineViewContainer");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "superview");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "bounds");
  v56 = v55;
  v58 = v57;
  v60 = v59;
  v62 = v61;

  -[UIKeyboardCandidateController inlineViewContainer](self, "inlineViewContainer");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "superview");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "safeAreaInsets");
  v66 = v56 + v65;
  v68 = v58 + v67;
  v70 = v60 - (v65 + v69);
  v72 = v62 - (v67 + v71);

  -[UIKeyboardCandidateController candidateBarHeight](self, "candidateBarHeight");
  v74 = v72 - v73;
  v141.origin.x = v66;
  v141.origin.y = v68;
  v141.size.width = v70;
  v141.size.height = v74;
  if (CGRectGetHeight(v141) > 0.0)
  {
    v142.origin.x = v66;
    v142.origin.y = v68;
    v142.size.width = v70;
    v142.size.height = v74;
    if (!CGRectIsNull(v142))
    {
      v143.origin.x = v66;
      v143.origin.y = v68;
      v143.size.width = v70;
      v143.size.height = v74;
      if (!CGRectIsEmpty(v143))
      {
        v144.origin.x = v48;
        v144.origin.y = v50;
        v144.size.height = rect;
        v144.size.width = v138;
        MinY = CGRectGetMinY(v144);
        v145.origin.x = v66;
        v145.origin.y = v68;
        v145.size.width = v70;
        v145.size.height = v74;
        MaxY = CGRectGetMaxY(v145);
        v146.origin.x = v48;
        v146.origin.y = v50;
        v146.size.width = v138;
        v146.size.height = rect;
        v76 = MaxY - CGRectGetMaxY(v146);
        if (MinY >= v76)
          v77 = MinY;
        else
          v77 = v76;
        objc_msgSend(v7, "style", *(_QWORD *)&MinY);
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v78, "rowHeight");
        v80 = v79;

        -[UIKeyboardCandidateController inlineConfiguration](self, "inlineConfiguration");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v81, "preferredInlineFloatingViewSize");
        v83 = v82;

        if (v80 < v83)
          v80 = v83;
        objc_msgSend(v7, "style");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v84, "rowHeight");
        if (v85 <= 0.0)
          goto LABEL_20;
        objc_msgSend(v7, "additionalHeight");
        v87 = v80 + v86;

        if (v77 < v87)
        {
          objc_msgSend(v7, "style");
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v88, "rowHeight");
          v90 = (uint64_t)((v77 - v80) / v89);

          v91 = 2;
          if (v90 > 2)
            v91 = v90;
          v92 = (double)v91;
          objc_msgSend(v7, "style");
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v84, "rowHeight");
          objc_msgSend(v7, "setAdditionalHeight:", v93 * v92);
LABEL_20:

        }
      }
    }
  }
  -[UIKeyboardCandidateController inlineConfiguration](self, "inlineConfiguration");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "preferredInlineFloatingViewSize");
  v96 = v95;
  v98 = v97;

  -[UIKeyboardCandidateController inlineViewContainer](self, "inlineViewContainer");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "setPreferredSize:", v96, v38 * v98);

  objc_msgSend(v7, "additionalHeight");
  v101 = v100;
  -[UIKeyboardCandidateController inlineViewContainer](self, "inlineViewContainer");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v102, "setExtendedStateAdditionalHeight:", v101);

  -[UIKeyboardCandidateController inlineConfiguration](self, "inlineConfiguration");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  v104 = objc_msgSend(v103, "inlineFloatingViewAdjustMode");
  -[UIKeyboardCandidateController inlineViewContainer](self, "inlineViewContainer");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v105, "setAdjustMode:", v104);

  v106 = -[UIKeyboardCandidateController inlineRectIsVertical](self, "inlineRectIsVertical");
  objc_msgSend(v140, "style");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v107, "minimumCellPadding");
  v109 = v108;
  objc_msgSend(v140, "style");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "minimumCellPadding");
  v112 = v111;
  -[UIKeyboardCandidateController inlineViewContainer](self, "inlineViewContainer");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  v114 = v113;
  v115 = 0.0;
  if (v106)
    v116 = v109;
  else
    v116 = 0.0;
  if (v106)
    v117 = 0.0;
  else
    v117 = v109;
  if (v106)
    v118 = v112;
  else
    v118 = 0.0;
  if (v106)
    v119 = 0.0;
  else
    v119 = v112;
  objc_msgSend(v113, "setCellPadding:", v116, v117, v118, v119);

  -[UIKeyboardCandidateController candidateBarHeight](self, "candidateBarHeight");
  v121 = v120;
  -[UIKeyboardCandidateController inlineViewContainer](self, "inlineViewContainer");
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v122, "setExtraInsets:", 0.0, 0.0, v121, 0.0);

  -[UIKeyboardCandidateController inlineViewContainer](self, "inlineViewContainer");
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v123, "shouldExtendUpwards"))
  {
    objc_msgSend(v7, "additionalHeight");
    v115 = -v124;
  }
  objc_msgSend(v7, "setYOffset:", v115);

  -[UIKeyboardCandidateController inlineViewState](self, "inlineViewState");
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  v126 = objc_msgSend(v125, "isEqual:", v140);

  if ((v126 & 1) == 0)
  {
    -[UIKeyboardCandidateController inlineView](self, "inlineView");
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v127, "state");
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardCandidateController inlineViewState](self, "inlineViewState");
    v129 = (void *)objc_claimAutoreleasedReturnValue();

    if (v128 == v129)
      -[UIKeyboardCandidateController setInlineState:extended:animated:options:force:completion:](self, "setInlineState:extended:animated:options:force:completion:", v140, 0, 0, 0, 1, 0);
    -[UIKeyboardCandidateController setInlineViewState:](self, "setInlineViewState:", v140);
  }
  -[UIKeyboardCandidateController extendedInlineViewState](self, "extendedInlineViewState");
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  v131 = objc_msgSend(v130, "isEqual:", v7);

  if ((v131 & 1) == 0)
  {
    -[UIKeyboardCandidateController inlineView](self, "inlineView");
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v132, "state");
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardCandidateController extendedInlineViewState](self, "extendedInlineViewState");
    v134 = (void *)objc_claimAutoreleasedReturnValue();

    if (v133 == v134)
      -[UIKeyboardCandidateController setInlineState:extended:animated:options:force:completion:](self, "setInlineState:extended:animated:options:force:completion:", v7, 1, 0, 0, 1, 0);
    -[UIKeyboardCandidateController setExtendedInlineViewState:](self, "setExtendedInlineViewState:", v7);
  }
  if (!-[UIKeyboardCandidateController inLineCandidateViewIsHosted](self, "inLineCandidateViewIsHosted"))
  {
    -[UIKeyboardCandidateController inlineView](self, "inlineView");
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    +[UITraitCollection traitCollectionWithLayoutDirection:](UITraitCollection, "traitCollectionWithLayoutDirection:", -[UIKeyboardCandidateController layoutDirectionForCurrentInputMode](self, "layoutDirectionForCurrentInputMode"));
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v135, "_setLocalOverrideTraitCollection:", v136);

  }
}

- (void)updateStatesForBar
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  void *v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  double v46;
  double v47;
  void *v48;
  double v49;
  double v50;
  void *v51;
  void *v52;
  double Height;
  double v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  double v59;
  double v60;
  void *v61;
  double v62;
  void *v63;
  double v64;
  void *v65;
  void *v66;
  double v67;
  void *v68;
  void *v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  void *v75;
  double v76;
  void *v77;
  id v78;
  double v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  int v85;
  double v86;
  void *v87;
  char v88;
  double v89;
  void *v90;
  double v91;
  double v92;
  void *v93;
  void *v94;
  double v95;
  double v96;
  void *v97;
  void *v98;
  BOOL v99;
  void *v100;
  uint64_t v101;
  void *v102;
  double v103;
  double v104;
  void *v105;
  void *v106;
  double v107;
  double v108;
  double v109;
  int64_t v110;
  void *v111;
  void *v112;
  void *v113;
  double v114;
  double v115;
  void *v116;
  double v117;
  double v118;
  double v119;
  double v120;
  double v121;
  double v122;
  double v123;
  double v124;
  void *v125;
  void *v126;
  double v127;
  double v128;
  double v129;
  double v130;
  double v131;
  double v132;
  double v133;
  double v134;
  void *v135;
  void *v136;
  double v137;
  double v138;
  double v139;
  double v140;
  double v141;
  double v142;
  double v143;
  double v144;
  void *v145;
  void *v146;
  double v147;
  double v148;
  double v149;
  double v150;
  double v151;
  double v152;
  double v153;
  double v154;
  void *v155;
  void *v156;
  double v157;
  double v158;
  double v159;
  double v160;
  double v161;
  double v162;
  double v163;
  double v164;
  void *v165;
  void *v166;
  double v167;
  double v168;
  double v169;
  double v170;
  double v171;
  double v172;
  double v173;
  double v174;
  void *v175;
  void *v176;
  double v177;
  double v178;
  double v179;
  double v180;
  double v181;
  double v182;
  double v183;
  double v184;
  void *v185;
  void *v186;
  double v187;
  double v188;
  double v189;
  double v190;
  double v191;
  double v192;
  double v193;
  double v194;
  void *v195;
  void *v196;
  double v197;
  double v198;
  double v199;
  double v200;
  double v201;
  double v202;
  double v203;
  double v204;
  void *v205;
  void *v206;
  double v207;
  double v208;
  double v209;
  double v210;
  double v211;
  double v212;
  double v213;
  double v214;
  void *v215;
  void *v216;
  double v217;
  double v218;
  double v219;
  double v220;
  double v221;
  double v222;
  double v223;
  double v224;
  void *v225;
  void *v226;
  double v227;
  double v228;
  double v229;
  double v230;
  double v231;
  double v232;
  double v233;
  double v234;
  void *v235;
  void *v236;
  double v237;
  double v238;
  double v239;
  double v240;
  double v241;
  void *v242;
  char v243;
  void *v244;
  void *v245;
  void *v246;
  void *v247;
  void *v248;
  char v249;
  void *v250;
  void *v251;
  void *v252;
  void *v253;
  void *v254;
  char v255;
  void *v256;
  void *v257;
  void *v258;
  void *v259;
  void *v260;
  void *v261;
  int v262;
  _QWORD v263[5];
  uint64_t v264;
  uint64_t *v265;
  uint64_t v266;
  uint64_t v267;
  CGRect v268;
  CGRect v269;

  if ((-[UIKeyboardCandidateController activeCandidateViewType](self, "activeCandidateViewType") & 2) == 0)
    return;
  -[UIKeyboardCandidateController bar](self, "bar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKeyboardCandidateViewImageRenderer sharedImageRenderer](UIKeyboardCandidateViewImageRenderer, "sharedImageRenderer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setViewForTraitCollection:", v3);

  -[UIKeyboardCandidateController barConfiguration](self, "barConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "initialState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIKeyboardCandidateController barConfiguration](self, "barConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "extendedState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIKeyboardCandidateController barConfiguration](self, "barConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "extendedScrolledState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIKeyboardCandidateController screenTraits](self, "screenTraits");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardCandidateController rowHeightForBarForOrientation:](self, "rowHeightForBarForOrientation:", objc_msgSend(v11, "orientation"));
  v13 = v12;

  objc_msgSend(v6, "style");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setRowHeight:", v13);

  objc_msgSend(v8, "style");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setRowHeight:", v13);

  objc_msgSend(v10, "style");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setRowHeight:", v13);

  if (self->_activeCandidateViewType == 6)
  {
    objc_msgSend(v6, "setArrowButtonPosition:", 0);
    objc_msgSend(v6, "style");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "arrowButtonSeparatorImage");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "style");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setRightEdgeSeparatorImage:", v18);

  }
  -[UIKeyboardCandidateController setAdditionalExtendedBarBackdropOffset:](self, "setAdditionalExtendedBarBackdropOffset:", 0.0);
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "inputDelegateManager");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "forwardingInputDelegate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[UIKeyboardCandidateController barIsExtended](self, "barIsExtended"))
  {
    -[UIKeyboardCandidateController extendedBarState](self, "extendedBarState");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "yOffset");
    objc_msgSend(v8, "setYOffset:");

    -[UIKeyboardCandidateController extendedBarState](self, "extendedBarState");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "additionalHeight");
    objc_msgSend(v8, "setAdditionalHeight:");

    -[UIKeyboardCandidateController extendedScrolledBarState](self, "extendedScrolledBarState");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "yOffset");
    objc_msgSend(v10, "setYOffset:");

    -[UIKeyboardCandidateController extendedScrolledBarState](self, "extendedScrolledBarState");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "additionalHeight");
    objc_msgSend(v10, "setAdditionalHeight:");

    goto LABEL_37;
  }
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "frame");
  v29 = v28;
  v31 = v30;
  v33 = v32;
  v35 = v34;
  v262 = objc_msgSend(v27, "showsCandidateBar");
  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "currentInputMode");
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIKeyboardCandidateController screenTraits](self, "screenTraits");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKeyboardImpl deviceSpecificPaddingForInterfaceOrientation:inputMode:](UIKeyboardImpl, "deviceSpecificPaddingForInterfaceOrientation:inputMode:", objc_msgSend(v38, "orientation"), v37);
  v40 = v39;

  -[UIKeyboardCandidateController screenTraits](self, "screenTraits");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKeyboardImpl deviceSpecificStaticHitBufferForInterfaceOrientation:inputMode:](UIKeyboardImpl, "deviceSpecificStaticHitBufferForInterfaceOrientation:inputMode:", objc_msgSend(v41, "orientation"), v37);
  v43 = v42;

  v268.origin.x = v29;
  v268.origin.y = v31;
  v268.size.width = v33;
  v268.size.height = v35;
  v44 = v40 + CGRectGetHeight(v268) - v43;
  -[UIKeyboardCandidateController screenTraits](self, "screenTraits");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardCandidateController candidateBarEdgeInsetsForOrientation:](self, "candidateBarEdgeInsetsForOrientation:", objc_msgSend(v45, "orientation"));
  v47 = v46;

  -[UIKeyboardCandidateController screenTraits](self, "screenTraits");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardCandidateController candidateBarHeightForOrientation:](self, "candidateBarHeightForOrientation:", objc_msgSend(v48, "orientation"));
  v50 = v47 + v49;

  objc_msgSend(v27, "window");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  if (v51)
    objc_msgSend(v27, "window");
  else
    -[UIKeyboardCandidateController screenTraits](self, "screenTraits");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "bounds");
  Height = CGRectGetHeight(v269);

  v54 = v44 + v50;
  -[UIKeyboardCandidateController barConfiguration](self, "barConfiguration");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = objc_msgSend(v55, "rowsToExtend");

  if (v56)
  {
    -[UIKeyboardCandidateController extendedBarState](self, "extendedBarState");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "style");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "rowHeight");
    v60 = v59;
    -[UIKeyboardCandidateController barConfiguration](self, "barConfiguration");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = v60 * (double)(unint64_t)objc_msgSend(v61, "rowsToExtend");

    -[UIKeyboardCandidateController barConfiguration](self, "barConfiguration");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v57) = -[UIKeyboardCandidateController shouldShowSortControlForConfiguration:](self, "shouldShowSortControlForConfiguration:", v63);

    v64 = 0.0;
    if ((_DWORD)v57)
    {
      -[UIKeyboardCandidateController extendedBarState](self, "extendedBarState");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "style");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "rowHeight");
      v62 = v62 + v67;

    }
  }
  else
  {
    objc_msgSend(v27, "window");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    __UIStatusBarManagerForWindow(v68);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "statusBarHeight");
    v71 = v70;

    v64 = 0.0;
    if (v71 > v47)
    {
      -[UIKeyboardCandidateController setAdditionalExtendedBarBackdropOffset:](self, "setAdditionalExtendedBarBackdropOffset:", -(v71 - v47));
      v64 = v71;
    }
    v62 = v47 + Height - v54 - v71;
  }
  if (objc_msgSend(v6, "arrowButtonDirection"))
  {
    v72 = v54 - v40;
    v73 = 0.0;
    if (v262)
      v73 = v50;
    v74 = v72 - v73;
    objc_msgSend(v8, "setAdditionalHeight:", v72 - v73);
    v75 = v10;
    v76 = v74;
  }
  else
  {
    if (v22)
    {
      v264 = 0;
      v265 = &v264;
      v266 = 0x2050000000;
      v77 = (void *)qword_1ECD7E9F0;
      v267 = qword_1ECD7E9F0;
      if (!qword_1ECD7E9F0)
      {
        v263[0] = MEMORY[0x1E0C809B0];
        v263[1] = 3221225472;
        v263[2] = __getTUIEmojiSearchTextFieldClass_block_invoke_0;
        v263[3] = &unk_1E16B14C0;
        v263[4] = &v264;
        __getTUIEmojiSearchTextFieldClass_block_invoke_0((uint64_t)v263);
        v77 = (void *)v265[3];
      }
      v78 = objc_retainAutorelease(v77);
      _Block_object_dispose(&v264, 8);
      objc_msgSend(v78, "preferredHeight");
      v54 = v54 + v79;
    }
    objc_msgSend(v8, "setYOffset:", -v62);
    objc_msgSend(v8, "setAdditionalHeight:", v62);
    objc_msgSend(v10, "setYOffset:", -v62 - v54);
    v76 = Height - v50 - v64;
    v75 = v10;
  }
  objc_msgSend(v75, "setAdditionalHeight:", v76);
  if (objc_msgSend(v27, "usesContinuousPath"))
  {
    if (qword_1ECD7E9F8 != -1)
      dispatch_once(&qword_1ECD7E9F8, &__block_literal_global_568_0);
    objc_msgSend(MEMORY[0x1E0DBDCA8], "sharedPreferencesController");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "valueForPreferenceKey:", CFSTR("DisableCPCandidateBarScrolling"));
    v81 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v80) = objc_msgSend(v81, "BOOLValue");
    if ((_DWORD)v80)
    {
      objc_msgSend(v6, "style");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "setScrollDisabled:", 1);

    }
  }
  if (-[UIKeyboardCandidateController reuseArrowButtonToExpandAssistantBarItems](self, "reuseArrowButtonToExpandAssistantBarItems")&& objc_msgSend(v6, "arrowButtonPosition") == 7)
  {
    -[UIKeyboardCandidateController candidateResultSet](self, "candidateResultSet");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v83, "hasCandidates") & 1) != 0)
    {
      -[UIKeyboardCandidateController candidateResultSet](self, "candidateResultSet");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      v85 = objc_msgSend(v84, "hasOnlyCompletionCandidates");

      if (!v85)
        goto LABEL_36;
    }
    else
    {

    }
    objc_msgSend(v6, "setArrowButtonDirection:", 2);
  }
LABEL_36:

LABEL_37:
  if (objc_msgSend(v6, "arrowButtonPosition") == 2)
  {
    v86 = 0.0;
    if (+[UIKeyboardImpl isSplit](UIKeyboardImpl, "isSplit"))
    {
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      v88 = objc_msgSend(v87, "centerFilled");

      if ((v88 & 1) == 0)
      {
        -[UIKeyboardCandidateController splitGap](self, "splitGap");
        v86 = v89;
      }
    }
    objc_msgSend(v6, "setArrowButtonOffset:", v86, 0.0);
    objc_msgSend(v8, "setArrowButtonOffset:", v86, 0.0);
    objc_msgSend(v10, "setArrowButtonOffset:", v86, 0.0);
    objc_msgSend(v6, "style");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "rowHeight");
    v92 = v91;
    objc_msgSend(v8, "style");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "setRowHeight:", v92);

    objc_msgSend(v6, "style");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "rowHeight");
    v96 = v95;
    objc_msgSend(v10, "style");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v97, "setRowHeight:", v96);

  }
  -[UIKeyboardCandidateController barConfiguration](self, "barConfiguration");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  v99 = -[UIKeyboardCandidateController shouldShowSortControlForConfiguration:](self, "shouldShowSortControlForConfiguration:", v98);

  if (!v99)
  {
    objc_msgSend(v8, "setSortControlPosition:", 0);
    objc_msgSend(v10, "setSortControlPosition:", 0);
  }
  if (!-[UIKeyboardCandidateController shouldShowDisambiguationCandidates](self, "shouldShowDisambiguationCandidates"))
    objc_msgSend(v6, "setDisambiguationGridPosition:", 0);
  if (!-[UIKeyboardCandidateController shouldShowDisambiguationCandidatesInExtendedView](self, "shouldShowDisambiguationCandidatesInExtendedView"))
  {
    objc_msgSend(v8, "setDisambiguationGridPosition:", 0);
    objc_msgSend(v10, "setDisambiguationGridPosition:", 0);
  }
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  v101 = objc_msgSend(v100, "currentHandBias");

  if (!v22
    && (v101 == 1 || v101 == 2 && -[UIKeyboardCandidateController adjustForLeftHandBias](self, "adjustForLeftHandBias")))
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "frame");
    v104 = v103;
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v105, "_layout");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v106, "biasedKeyboardWidthRatio");
    v108 = v104 * (1.0 - v107);

    if (v101 == 1)
      v109 = 0.0;
    else
      v109 = v108;
    if (v101 != 1)
      v108 = 0.0;
    v110 = -[UIKeyboardCandidateController layoutDirectionForCurrentInputMode](self, "layoutDirectionForCurrentInputMode");
    if ((v101 != 2) == (v110 == 1))
    {
      objc_msgSend(v6, "style");
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v111, "setArrowButtonPadding:", 0.0, v108, 0.0, v109);

      objc_msgSend(v8, "style");
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v112, "setArrowButtonPadding:", 0.0, v108, 0.0, v109);

      objc_msgSend(v10, "style");
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v113, "setArrowButtonPadding:", 0.0, v108, 0.0, v109);

    }
    if (v110 == 1)
      v114 = v108;
    else
      v114 = v109;
    if (v110 == 1)
      v115 = v109;
    else
      v115 = v108;
    objc_msgSend(v6, "style");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v116, "gridPadding");
    v118 = v117 + 0.0;
    v120 = v115 + v119;
    v122 = v121 + 0.0;
    v124 = v114 + v123;
    objc_msgSend(v6, "style");
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v125, "setGridPadding:", v118, v120, v122, v124);

    objc_msgSend(v8, "style");
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v126, "gridPadding");
    v128 = v127 + 0.0;
    v130 = v115 + v129;
    v132 = v131 + 0.0;
    v134 = v114 + v133;
    objc_msgSend(v8, "style");
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v135, "setGridPadding:", v128, v130, v132, v134);

    objc_msgSend(v10, "style");
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v136, "gridPadding");
    v138 = v137 + 0.0;
    v140 = v115 + v139;
    v142 = v141 + 0.0;
    v144 = v114 + v143;
    objc_msgSend(v10, "style");
    v145 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v145, "setGridPadding:", v138, v140, v142, v144);

    objc_msgSend(v6, "style");
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v146, "gridPadding");
    v148 = v147;
    v150 = v149;
    v152 = v151;
    v154 = v153;
    objc_msgSend(v6, "style");
    v155 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v155, "setGridLinePadding:", v148, v150, v152, v154);

    objc_msgSend(v8, "style");
    v156 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v156, "gridPadding");
    v158 = v157;
    v160 = v159;
    v162 = v161;
    v164 = v163;
    objc_msgSend(v8, "style");
    v165 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v165, "setGridLinePadding:", v158, v160, v162, v164);

    objc_msgSend(v10, "style");
    v166 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v166, "gridPadding");
    v168 = v167;
    v170 = v169;
    v172 = v171;
    v174 = v173;
    objc_msgSend(v10, "style");
    v175 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v175, "setGridLinePadding:", v168, v170, v172, v174);

    objc_msgSend(v6, "style");
    v176 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v176, "sortControlPadding");
    v178 = v177 + 0.0;
    v180 = v115 + v179;
    v182 = v181 + 0.0;
    v184 = v114 + v183;
    objc_msgSend(v6, "style");
    v185 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v185, "setSortControlPadding:", v178, v180, v182, v184);

    objc_msgSend(v8, "style");
    v186 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v186, "sortControlPadding");
    v188 = v187 + 0.0;
    v190 = v115 + v189;
    v192 = v191 + 0.0;
    v194 = v114 + v193;
    objc_msgSend(v8, "style");
    v195 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v195, "setSortControlPadding:", v188, v190, v192, v194);

    objc_msgSend(v10, "style");
    v196 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v196, "sortControlPadding");
    v198 = v197 + 0.0;
    v200 = v115 + v199;
    v202 = v201 + 0.0;
    v204 = v114 + v203;
    objc_msgSend(v10, "style");
    v205 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v205, "setSortControlPadding:", v198, v200, v202, v204);

    objc_msgSend(v6, "disambiguationStyle");
    v206 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v206, "gridPadding");
    v208 = v207 + 0.0;
    v210 = v115 + v209;
    v212 = v211 + 0.0;
    v214 = v114 + v213;
    objc_msgSend(v6, "disambiguationStyle");
    v215 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v215, "setGridPadding:", v208, v210, v212, v214);

    objc_msgSend(v8, "disambiguationStyle");
    v216 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v216, "gridPadding");
    v218 = v217 + 0.0;
    v220 = v115 + v219;
    v222 = v221 + 0.0;
    v224 = v114 + v223;
    objc_msgSend(v8, "disambiguationStyle");
    v225 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v225, "setGridPadding:", v218, v220, v222, v224);

    objc_msgSend(v10, "disambiguationStyle");
    v226 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v226, "gridPadding");
    v228 = v227 + 0.0;
    v230 = v115 + v229;
    v232 = v231 + 0.0;
    v234 = v114 + v233;
    objc_msgSend(v10, "disambiguationStyle");
    v235 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v235, "setGridPadding:", v228, v230, v232, v234);

  }
  objc_msgSend(v6, "style");
  v236 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v236, "singleSlottedCellMargin");
  if (v237 <= 0.0)
    goto LABEL_69;
  -[UIKeyboardCandidateController singleSlottedCellMargin](self, "singleSlottedCellMargin");
  v239 = v238;

  if (v239 > 0.0)
  {
    -[UIKeyboardCandidateController singleSlottedCellMargin](self, "singleSlottedCellMargin");
    v241 = v240;
    objc_msgSend(v6, "style");
    v236 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v236, "setSingleSlottedCellMargin:", v241);
LABEL_69:

  }
  -[UIKeyboardCandidateController updateOpacitiesToState:](self, "updateOpacitiesToState:", v6);
  -[UIKeyboardCandidateController updateArrowButtonImageNameToState:](self, "updateArrowButtonImageNameToState:", v6);
  -[UIKeyboardCandidateController barState](self, "barState");
  v242 = (void *)objc_claimAutoreleasedReturnValue();
  v243 = objc_msgSend(v242, "isEqual:", v6);

  if ((v243 & 1) == 0)
  {
    -[UIKeyboardCandidateController bar](self, "bar");
    v244 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v244, "state");
    v245 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardCandidateController barState](self, "barState");
    v246 = (void *)objc_claimAutoreleasedReturnValue();

    if (v245 == v246)
    {
      -[UIKeyboardCandidateController bar](self, "bar");
      v247 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v247, "setState:animated:force:completion:", v6, 0, 1, 0);

      -[UIKeyboardCandidateController syncIsExtended](self, "syncIsExtended");
    }
    -[UIKeyboardCandidateController setBarState:](self, "setBarState:", v6);
  }
  -[UIKeyboardCandidateController extendedBarState](self, "extendedBarState");
  v248 = (void *)objc_claimAutoreleasedReturnValue();
  v249 = objc_msgSend(v248, "isEqual:", v8);

  if ((v249 & 1) == 0)
  {
    -[UIKeyboardCandidateController bar](self, "bar");
    v250 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v250, "state");
    v251 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardCandidateController extendedBarState](self, "extendedBarState");
    v252 = (void *)objc_claimAutoreleasedReturnValue();

    if (v251 == v252)
    {
      -[UIKeyboardCandidateController bar](self, "bar");
      v253 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v253, "setState:animated:force:completion:", v8, 0, 1, 0);

      -[UIKeyboardCandidateController syncIsExtended](self, "syncIsExtended");
    }
    -[UIKeyboardCandidateController setExtendedBarState:](self, "setExtendedBarState:", v8);
  }
  -[UIKeyboardCandidateController extendedScrolledBarState](self, "extendedScrolledBarState");
  v254 = (void *)objc_claimAutoreleasedReturnValue();
  v255 = objc_msgSend(v254, "isEqual:", v10);

  if ((v255 & 1) == 0)
  {
    -[UIKeyboardCandidateController bar](self, "bar");
    v256 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v256, "state");
    v257 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardCandidateController extendedScrolledBarState](self, "extendedScrolledBarState");
    v258 = (void *)objc_claimAutoreleasedReturnValue();

    if (v257 == v258)
    {
      -[UIKeyboardCandidateController bar](self, "bar");
      v259 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v259, "setState:animated:force:completion:", v10, 0, 1, 0);

      -[UIKeyboardCandidateController syncIsExtended](self, "syncIsExtended");
    }
    -[UIKeyboardCandidateController setExtendedScrolledBarState:](self, "setExtendedScrolledBarState:", v10);
  }
  -[UIKeyboardCandidateController bar](self, "bar");
  v260 = (void *)objc_claimAutoreleasedReturnValue();
  +[UITraitCollection traitCollectionWithLayoutDirection:](UITraitCollection, "traitCollectionWithLayoutDirection:", -[UIKeyboardCandidateController layoutDirectionForCurrentInputMode](self, "layoutDirectionForCurrentInputMode"));
  v261 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v260, "_setLocalOverrideTraitCollection:", v261);

  -[UIKeyboardCandidateController setupPanGestureRecognizerIfNeeded](self, "setupPanGestureRecognizerIfNeeded");
}

- (void)updateConfigurations
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  double v16;
  double v17;
  __objc2_class **v18;
  __objc2_class **v19;
  void *v20;
  void *v21;
  __objc2_class **v22;
  void *v23;
  char v24;
  _BOOL4 v25;
  __objc2_class **v26;
  BOOL v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  int v33;
  _BOOL4 v34;
  _BOOL4 v35;
  void *v36;
  void *v37;
  int v38;
  __objc2_class **v39;
  __objc2_class **v40;
  BOOL v41;
  void *v42;
  void *v43;
  double v44;
  double v45;
  void *v46;
  double v47;
  double v48;
  double v49;
  BOOL v50;
  void *v51;
  __objc2_class *v52;
  void *v53;
  id v54;

  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentInputMode");
  v54 = (id)objc_claimAutoreleasedReturnValue();

  -[UIKeyboardCandidateController screenTraits](self, "screenTraits");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "orientation") - 3;

  -[UIKeyboardCandidateController screenTraits](self, "screenTraits");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "idiom");

  if (v7 == 1)
  {
    -[UIKeyboardCandidateController bar](self, "bar");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_rootInputWindowController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "placement");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      v12 = v10;
    }
    else
    {
      +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "containerRootController");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "placement");
      v12 = (id)objc_claimAutoreleasedReturnValue();

    }
    if (objc_msgSend(v12, "isFloatingAssistantView"))
    {
      v22 = off_1E167ADB0;
      if (v5 < 2)
        v22 = off_1E167ADB8;
    }
    else
    {
      if (+[UIKeyboardImpl isSplit](UIKeyboardImpl, "isSplit")
        && (+[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance"),
            v23 = (void *)objc_claimAutoreleasedReturnValue(),
            v24 = objc_msgSend(v23, "centerFilled"),
            v23,
            (v24 & 1) == 0))
      {
        objc_msgSend(v54, "identifier");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        TIInputModeGetBaseLanguage();
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v29, "isEqualToString:", CFSTR("ja"));

        v22 = off_1E167ADE0;
        v26 = off_1E167ADE8;
        v27 = v30 == 0;
      }
      else
      {
        v25 = +[UIKeyboardImpl isFloating](UIKeyboardImpl, "isFloating");
        v22 = off_1E167ADA0;
        if (v5 < 2)
          v22 = off_1E167ADA8;
        v26 = off_1E167ADC0;
        v27 = !v25;
      }
      if (!v27)
        v22 = v26;
    }
    -[__objc2_class configuration](*v22, "configuration");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardCandidateController setBarConfiguration:](self, "setBarConfiguration:", v31);

    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "liveConversionEnabled");

    v34 = -[UIKeyboardCandidateController inlineRectIsVertical](self, "inlineRectIsVertical");
    v35 = v34;
    if (v33)
    {
      objc_msgSend(v54, "identifier");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      TIInputModeGetVariant();
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v37, "isEqualToString:", CFSTR("Zhuyin"));

      if (v35)
      {
        v39 = off_1E167ADF0;
        v40 = off_1E167ADF8;
      }
      else
      {
        v39 = off_1E167ADD0;
        v40 = off_1E167ADD8;
      }
      v41 = v38 == 0;
    }
    else
    {
      v39 = off_1E167ADC8;
      v40 = off_1E167ADF0;
      v41 = !v34;
    }
    if (!v41)
      v39 = v40;
    -[__objc2_class configuration](*v39, "configuration");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardCandidateController setInlineConfiguration:](self, "setInlineConfiguration:", v42);

  }
  else
  {
    if (os_variant_has_internal_diagnostics())
    {
      TIGetCandidateViewExperimentsValue();
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v53, "integerValue");

    }
    else
    {
      v13 = 0;
    }
    if (v13 <= 1)
      v14 = 1;
    else
      v14 = v13;
    -[UIKeyboardCandidateController screenTraits](self, "screenTraits");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKeyboardImpl deviceSpecificPaddingForInterfaceOrientation:inputMode:](UIKeyboardImpl, "deviceSpecificPaddingForInterfaceOrientation:inputMode:", objc_msgSend(v15, "orientation"), v54);
    v17 = v16;

    if (v17 <= 0.0)
    {
      if (v5 >= 2)
      {
        if (v13 >= 2)
        {
          -[UIKeyboardCandidateController screenTraits](self, "screenTraits");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "bounds");
          v45 = v44;

          -[UIKeyboardCandidateController screenTraits](self, "screenTraits");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "bounds");
          v48 = v47;

          if (v45 >= v48)
            v49 = v45;
          else
            v49 = v48;
          v50 = v14 != 2 && v49 <= 568.0;
          v18 = off_1E167AE00;
          if (!v50)
            v18 = off_1E167AE28;
        }
        else
        {
          v18 = off_1E167AE08;
        }
      }
      else
      {
        v18 = off_1E167AE18;
      }
    }
    else
    {
      v18 = off_1E167AE20;
      v19 = off_1E167AE30;
      if (v13 < 2)
        v19 = off_1E167AE10;
      if (v5 >= 2)
        v18 = v19;
    }
    -[__objc2_class configuration](*v18, "configuration");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardCandidateController setBarConfiguration:](self, "setBarConfiguration:", v51);

    if (-[UIKeyboardCandidateController inlineRectIsVertical](self, "inlineRectIsVertical"))
      v52 = UIKeyboardCandidateViewConfigurationPhoneVerticalInline;
    else
      v52 = UIKeyboardCandidateViewConfigurationPhoneInline;
    -[__objc2_class configuration](v52, "configuration");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardCandidateController setInlineConfiguration:](self, "setInlineConfiguration:", v12);
  }

  -[UIKeyboardCandidateController updateStyles](self, "updateStyles");
}

- (UIKBScreenTraits)screenTraits
{
  return self->_screenTraits;
}

- (void)updateStyles
{
  _BOOL8 v3;
  void *v4;
  _BOOL8 v5;
  void *v6;
  _BOOL8 v7;
  id v8;

  v3 = -[UIKeyboardCandidateController darkKeyboard](self, "darkKeyboard");
  -[UIKeyboardCandidateController barConfiguration](self, "barConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDarkKeyboard:", v3);

  v5 = -[UIKeyboardCandidateController darkKeyboard](self, "darkKeyboard");
  -[UIKeyboardCandidateController inlineConfiguration](self, "inlineConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDarkKeyboard:", v5);

  v7 = -[UIKeyboardCandidateController darkKeyboard](self, "darkKeyboard");
  -[UIKeyboardCandidateController keyConfiguration](self, "keyConfiguration");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDarkKeyboard:", v7);

}

- (BOOL)darkKeyboard
{
  return self->_darkKeyboard;
}

- (void)setInlineConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_inlineConfiguration, a3);
}

- (void)setBarConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_barConfiguration, a3);
}

- (UIKeyboardCandidateViewConfiguration)keyConfiguration
{
  return self->_keyConfiguration;
}

- (BOOL)inlineRectIsVertical
{
  return self->_inlineRectIsVertical;
}

- (UIKeyboardCandidateViewConfiguration)inlineConfiguration
{
  return self->_inlineConfiguration;
}

- (UIKeyboardCandidateViewConfiguration)barConfiguration
{
  return self->_barConfiguration;
}

- (void)updateStatesForKey
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  char isKindOfClass;
  uint64_t v13;
  void *v14;
  double Height;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  CGRect v39;

  if ((-[UIKeyboardCandidateController activeCandidateViewType](self, "activeCandidateViewType") & 1) != 0)
  {
    -[UIKeyboardCandidateController key](self, "key");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKeyboardCandidateViewImageRenderer sharedImageRenderer](UIKeyboardCandidateViewImageRenderer, "sharedImageRenderer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setViewForTraitCollection:", v3);

    -[UIKeyboardCandidateController keyConfiguration](self, "keyConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "initialState");
    v38 = (id)objc_claimAutoreleasedReturnValue();

    -[UIKeyboardCandidateController keyConfiguration](self, "keyConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "extendedState");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIKeyboardCandidateController keyConfiguration](self, "keyConfiguration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[UIKeyboardCandidateController shouldShowSortControlForConfiguration:](self, "shouldShowSortControlForConfiguration:", v8))
    {
      v9 = objc_msgSend(v38, "sortControlPosition");
    }
    else
    {
      v9 = 0;
    }
    objc_msgSend(v38, "setSortControlPosition:", v9);

    if (-[UIKeyboardCandidateController shouldShowDisambiguationCandidates](self, "shouldShowDisambiguationCandidates"))
      v10 = objc_msgSend(v38, "disambiguationGridPosition");
    else
      v10 = 0;
    objc_msgSend(v38, "setDisambiguationGridPosition:", v10);
    -[UIKeyboardCandidateController keyConfiguration](self, "keyConfiguration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      v13 = objc_msgSend(v38, "primaryGridRowType");
      -[UIKeyboardCandidateController key](self, "key");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "frame");
      Height = CGRectGetHeight(v39);
      v16 = ceil(Height * 0.25);
      if (v13 == 1)
        v17 = v16;
      else
        v17 = Height;

      objc_msgSend(v38, "style");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setRowHeight:", v17);

      objc_msgSend(v38, "disambiguationStyle");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setRowHeight:", v17);

    }
    -[UIKeyboardCandidateController updateOpacitiesToState:](self, "updateOpacitiesToState:", v38);
    -[UIKeyboardCandidateController keyState](self, "keyState");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "isEqual:", v38);

    if ((v21 & 1) == 0)
    {
      -[UIKeyboardCandidateController key](self, "key");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "state");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKeyboardCandidateController keyState](self, "keyState");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23 == v24)
      {
        -[UIKeyboardCandidateController key](self, "key");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setState:animated:force:completion:", v38, 0, 1, 0);

      }
      -[UIKeyboardCandidateController setKeyState:](self, "setKeyState:", v38);
    }
    -[UIKeyboardCandidateController extendedKeyState](self, "extendedKeyState");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "isEqual:", v7);

    if ((v27 & 1) == 0)
    {
      -[UIKeyboardCandidateController key](self, "key");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "state");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKeyboardCandidateController extendedKeyState](self, "extendedKeyState");
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      if (v29 == v30)
      {
        -[UIKeyboardCandidateController key](self, "key");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "setState:animated:force:completion:", v7, 0, 1, 0);

      }
      -[UIKeyboardCandidateController setExtendedKeyState:](self, "setExtendedKeyState:", v7);
    }
    -[UIKeyboardCandidateController key](self, "key");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "state");
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v33)
    {
      -[UIKeyboardCandidateController key](self, "key");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKeyboardCandidateController keyState](self, "keyState");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setState:animated:force:completion:", v35, 0, 1, 0);

    }
    -[UIKeyboardCandidateController key](self, "key");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    +[UITraitCollection traitCollectionWithLayoutDirection:](UITraitCollection, "traitCollectionWithLayoutDirection:", -[UIKeyboardCandidateController layoutDirectionForCurrentInputMode](self, "layoutDirectionForCurrentInputMode"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "_setLocalOverrideTraitCollection:", v37);

  }
}

- (BOOL)isExtended
{
  if (+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI"))
    return self->_isExtended;
  if ((-[UIKeyboardCandidateController activeCandidateViewType](self, "activeCandidateViewType") & 2) != 0
    && -[UIKeyboardCandidateController barIsExtended](self, "barIsExtended")
    || (-[UIKeyboardCandidateController activeCandidateViewType](self, "activeCandidateViewType") & 4) != 0
    && -[UIKeyboardCandidateController inlineViewIsExtended](self, "inlineViewIsExtended"))
  {
    return 1;
  }
  return -[UIKeyboardCandidateController activeCandidateViewType](self, "activeCandidateViewType") & 1;
}

- (int64_t)activeCandidateViewType
{
  return self->_activeCandidateViewType;
}

void __47__UIKeyboardCandidateController_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)_MergedGlobals_1105;
  _MergedGlobals_1105 = (uint64_t)v1;

}

- (UIKeyboardCandidateController)init
{
  UIKeyboardCandidateController *v2;
  uint64_t v3;
  NSMutableArray *activeViews;
  _UIAssertionController *v5;
  _UIAssertionController *assertionController;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UIKeyboardCandidateController;
  v2 = -[UIKeyboardCandidateController init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
    v3 = objc_claimAutoreleasedReturnValue();
    activeViews = v2->_activeViews;
    v2->_activeViews = (NSMutableArray *)v3;

    v2->_adjustForLeftHandBias = 1;
    v2->_hideDisambiguationCandidates = 0;
    v5 = -[_UIAssertionController initWithAssertionSubject:]([_UIAssertionController alloc], "initWithAssertionSubject:", v2);
    assertionController = v2->_assertionController;
    v2->_assertionController = v5;

  }
  return v2;
}

- (BOOL)barIsExtended
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;

  -[UIKeyboardCandidateController bar](self, "bar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "state");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[UIKeyboardCandidateController bar](self, "bar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "state");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardCandidateController extendedBarState](self, "extendedBarState");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 == v7)
    {
      v11 = 1;
    }
    else
    {
      -[UIKeyboardCandidateController bar](self, "bar");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "state");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKeyboardCandidateController extendedScrolledBarState](self, "extendedScrolledBarState");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v9 == v10;

    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (TUICandidateView)bar
{
  return self->_bar;
}

- (void)dealloc
{
  objc_super v3;

  -[TUICandidateView removeFromSuperview](self->_bar, "removeFromSuperview");
  -[UIView removeFromSuperview](self->_inlineViewContainer, "removeFromSuperview");
  v3.receiver = self;
  v3.super_class = (Class)UIKeyboardCandidateController;
  -[UIKeyboardCandidateController dealloc](&v3, sel_dealloc);
}

- (UIView)candidateBar
{
  return (UIView *)self->_bar;
}

- (UIView)candidateKey
{
  return (UIView *)self->_key;
}

- (UIView)inlineCandidateView
{
  return (UIView *)self->_inlineViewContainer;
}

- (id)loadCandidateBar
{
  TUICandidateView *bar;
  TUICandidateView *v4;
  TUICandidateView *v5;

  bar = self->_bar;
  if (!bar)
  {
    -[UIKeyboardCandidateController loadDefaultStates](self, "loadDefaultStates");
    v4 = (TUICandidateView *)objc_msgSend(objc_alloc((Class)getTUICandidateViewClass()), "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v5 = self->_bar;
    self->_bar = v4;

    -[TUICandidateView setState:](self->_bar, "setState:", self->_barState);
    -[TUICandidateView setDelegate:](self->_bar, "setDelegate:", self);
    bar = self->_bar;
  }
  return bar;
}

- (id)loadInlineCandidateView
{
  void *v3;
  UIKeyboardCandidateInlineFloatingView *v4;
  void *v5;
  UIKeyboardCandidateInlineFloatingView *inlineViewContainer;
  UIKeyboardCandidateInlineFloatingView *v7;
  UIKeyboardCandidateInlineFloatingView *v8;
  UIKeyboardCandidateInlineFloatingView *v9;
  void *v10;

  if (!self->_inlineView && !self->_hostedInlineViewContainer)
  {
    -[UIKeyboardCandidateController loadDefaultStates](self, "loadDefaultStates");
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "inputOverlayContainer");
    v4 = (UIKeyboardCandidateInlineFloatingView *)objc_claimAutoreleasedReturnValue();

    -[UIKeyboardCandidateController loadInProcessInlineCandidateView](self, "loadInProcessInlineCandidateView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setHidden:](self->_inlineViewContainer, "setHidden:", 1);
    inlineViewContainer = self->_inlineViewContainer;
    if (!inlineViewContainer)
    {
      v7 = [UIKeyboardCandidateInlineFloatingView alloc];
      v8 = -[UIKeyboardCandidateInlineFloatingView initWithFrame:](v7, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      v9 = self->_inlineViewContainer;
      self->_inlineViewContainer = v8;

      -[UIView setHidden:](self->_inlineViewContainer, "setHidden:", 1);
      inlineViewContainer = self->_inlineViewContainer;
    }
    +[UITraitCollection traitCollectionWithUserInterfaceLevel:](UITraitCollection, "traitCollectionWithUserInterfaceLevel:", 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView _setLocalOverrideTraitCollection:](inlineViewContainer, "_setLocalOverrideTraitCollection:", v10);

    -[UIView addSubview:](self->_inlineViewContainer, "addSubview:", v5);
    if (v4 != self->_inlineViewContainer)
      -[UIView addSubview:](v4, "addSubview:");

  }
  return self->_inlineViewContainer;
}

- (id)loadInProcessInlineCandidateView
{
  TUICandidateView *v3;
  TUICandidateView *inlineView;

  v3 = (TUICandidateView *)objc_msgSend(objc_alloc((Class)getTUICandidateViewClass()), "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  inlineView = self->_inlineView;
  self->_inlineView = v3;

  -[TUICandidateView setState:](self->_inlineView, "setState:", self->_inlineViewState);
  -[TUICandidateView setDelegate:](self->_inlineView, "setDelegate:", self);
  return self->_inlineView;
}

- (id)newCandidateKeyWithFrame:(CGRect)a3 configuration:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  TUICandidateView *v9;
  TUICandidateView *key;
  TUICandidateView *v11;
  TUICandidateView *v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UIKeyboardCandidateController setKeyConfiguration:](self, "setKeyConfiguration:", a4);
  v9 = (TUICandidateView *)objc_msgSend(objc_alloc((Class)getTUICandidateViewClass()), "initWithFrame:", x, y, width, height);
  key = self->_key;
  self->_key = v9;
  v11 = v9;

  -[TUICandidateView setDelegate:](self->_key, "setDelegate:", self);
  v12 = self->_key;

  return v12;
}

- (void)setActiveCandidateViewType:(int64_t)a3
{
  char v3;
  NSMutableArray *activeViews;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSMutableArray *v10;
  id v11;
  NSMutableArray *v12;
  id v13;

  v3 = a3;
  self->_activeCandidateViewType = a3;
  -[NSMutableArray removeAllObjects](self->_activeViews, "removeAllObjects");
  if ((v3 & 1) != 0 && self->_key)
  {
    activeViews = self->_activeViews;
    -[UIKeyboardCandidateController key](self, "key");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](activeViews, "addObject:", v6);

  }
  if ((v3 & 2) != 0)
  {
    v9 = -[UIKeyboardCandidateController loadCandidateBar](self, "loadCandidateBar");
    v10 = self->_activeViews;
    -[UIKeyboardCandidateController bar](self, "bar");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v10, "addObject:", v8);
  }
  else
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_layout");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "setHidden:", 0);
  }

  if ((v3 & 4) != 0)
  {
    v11 = -[UIKeyboardCandidateController loadInlineCandidateView](self, "loadInlineCandidateView");
    if (!-[UIKeyboardCandidateController inLineCandidateViewIsHosted](self, "inLineCandidateViewIsHosted"))
    {
      v12 = self->_activeViews;
      -[UIKeyboardCandidateController inlineView](self, "inlineView");
      v13 = (id)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](v12, "addObject:", v13);

    }
  }
}

- (NSArray)activeCandidateViews
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_activeViews, "copy");
}

- (int64_t)candidateViewTypeForView:(id)a3
{
  TUICandidateView *v4;
  int64_t v5;

  v4 = (TUICandidateView *)a3;
  if (self->_bar == v4)
  {
    v5 = 2;
  }
  else if (self->_inlineView == v4)
  {
    v5 = 4;
  }
  else
  {
    v5 = self->_key == v4;
  }

  return v5;
}

- (id)firstNonEmptyActiveCandidateView
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[UIKeyboardCandidateController activeViews](self, "activeViews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[UIKeyboardCandidateController activeViews](self, "activeViews", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v10, "candidateResultSet");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "hasCandidates");

        if (v12)
        {
          v13 = v10;

          v4 = v13;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

- (BOOL)inLineCandidateViewIsHosted
{
  return 0;
}

- (void)resetHostedInlineCandidateView
{
  if (-[UIKeyboardCandidateController inLineCandidateViewIsHosted](self, "inLineCandidateViewIsHosted"))
    -[UIKeyboardCandidateController removeInlineView](self, "removeInlineView");
}

- (void)loadDefaultStates
{
  void *v3;
  UIKeyboardCandidateViewState *v4;
  UIKeyboardCandidateViewState *barState;
  void *v6;
  UIKeyboardCandidateViewState *v7;
  UIKeyboardCandidateViewState *extendedBarState;
  UIKeyboardCandidateViewState *v9;
  UIKeyboardCandidateViewState *extendedScrolledBarState;
  id v11;

  if (!self->_barState)
  {
    -[UIKeyboardCandidateController updateConfigurations](self, "updateConfigurations");
    -[UIKeyboardCandidateController barConfiguration](self, "barConfiguration");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "initialState");
    v4 = (UIKeyboardCandidateViewState *)objc_claimAutoreleasedReturnValue();
    barState = self->_barState;
    self->_barState = v4;

    -[UIKeyboardCandidateController barConfiguration](self, "barConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "extendedState");
    v7 = (UIKeyboardCandidateViewState *)objc_claimAutoreleasedReturnValue();
    extendedBarState = self->_extendedBarState;
    self->_extendedBarState = v7;

    -[UIKeyboardCandidateController barConfiguration](self, "barConfiguration");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "extendedScrolledState");
    v9 = (UIKeyboardCandidateViewState *)objc_claimAutoreleasedReturnValue();
    extendedScrolledBarState = self->_extendedScrolledBarState;
    self->_extendedScrolledBarState = v9;

  }
}

- (BOOL)shouldShowSortControlForConfiguration:(id)a3
{
  BOOL v4;
  void *v5;
  void *v6;

  if ((objc_msgSend(a3, "shouldAlwaysShowSortControl") & 1) != 0)
    return 1;
  -[UIKeyboardCandidateController candidateResultSet](self, "candidateResultSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sortMethods");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (unint64_t)objc_msgSend(v6, "count") > 1;

  return v4;
}

- (BOOL)shouldShowDisambiguationCandidates
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;

  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentLinguisticInputMode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(&unk_1E1A980E8, "stringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("Pinyin"), "stringByAppendingString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "rangeOfString:", v7) == 0x7FFFFFFFFFFFFFFFLL)
    LOBYTE(v8) = 0;
  else
    v8 = !-[UIKeyboardCandidateController hideDisambiguationCandidates](self, "hideDisambiguationCandidates");

  return v8;
}

- (void)setHideDisambiguationCandidates:(BOOL)a3
{
  if (self->_hideDisambiguationCandidates != a3)
  {
    self->_hideDisambiguationCandidates = a3;
    -[UIKeyboardCandidateController updateStates](self, "updateStates");
  }
}

- (void)setInlineState:(id)a3 extended:(BOOL)a4 animated:(BOOL)a5 options:(unint64_t)a6 force:(BOOL)a7 completion:(id)a8
{
  _BOOL8 v8;
  _BOOL8 v10;
  id v13;
  id v14;
  id v15;

  v8 = a7;
  v10 = a5;
  v13 = a8;
  v14 = a3;
  -[UIKeyboardCandidateController inlineView](self, "inlineView");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setState:animated:options:force:completion:", v14, v10, a6, v8, v13);

}

- (void)updateOpacitiesToState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[UIKeyboardCandidateController opacities](self, "opacities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    -[UIKeyboardCandidateController opacities](self, "opacities", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allKeys");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (!v8)
      goto LABEL_14;
    v9 = v8;
    v10 = *(_QWORD *)v28;
    while (1)
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v28 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v11);
        -[UIKeyboardCandidateController opacities](self, "opacities");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKeyedSubscript:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        v15 = objc_msgSend(v12, "integerValue");
        if ((v15 & 4) != 0)
        {
          objc_msgSend(v14, "doubleValue");
          v23 = v22;
          objc_msgSend(v4, "style");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "setForegroundOpacity:", v23);

          objc_msgSend(v14, "doubleValue");
          v26 = v25;
          objc_msgSend(v4, "disambiguationStyle");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "setForegroundOpacity:", v26);
        }
        else
        {
          if ((v15 & 1) == 0)
            goto LABEL_12;
          objc_msgSend(v14, "doubleValue");
          v17 = v16;
          objc_msgSend(v4, "style");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setBackgroundOpacity:", v17);

          objc_msgSend(v14, "doubleValue");
          v20 = v19;
          objc_msgSend(v4, "disambiguationStyle");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "setBackgroundOpacity:", v20);
        }

LABEL_12:
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      if (!v9)
      {
LABEL_14:

        break;
      }
    }
  }

}

- (void)updateArrowButtonImageNameToState:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "_hasMarkedText") & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DBDBD0], "imageNameForTextEffectsButton");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  -[UIKeyboardCandidateController setIsTextEffectsButtonPresented:](self, "setIsTextEffectsButtonPresented:", v5 != 0);
  objc_msgSend(v9, "style");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "arrowButtonImageName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 != v7)
  {
    objc_msgSend(v9, "style");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setArrowButtonImageName:", v5);

  }
}

- (double)rowHeightForBarForOrientation:(int64_t)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  int v17;
  void *v19;
  unint64_t v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;

  -[UIKeyboardCandidateController screenTraits](self, "screenTraits", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardCandidateController screenTraits](self, "screenTraits");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = UIKeyboardComputeKeyboardIdiomFromScreenTraits(v4, objc_msgSend(v5, "idiom"), 0);

  if ((unint64_t)(v6 - 23) < 4 || v6 == 1)
  {
    -[UIKeyboardCandidateController bar](self, "bar");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_rootInputWindowController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "placement");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      v12 = v10;
    }
    else
    {
      +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "containerRootController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "placement");
      v12 = (id)objc_claimAutoreleasedReturnValue();

    }
    if ((objc_msgSend(v12, "isFloatingAssistantView") & 1) != 0)
    {
      v15 = 42.0;
    }
    else
    {
      -[UIKeyboardCandidateController screenTraits](self, "screenTraits");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "isFloating");

      if (v17)
        v15 = 44.5;
      else
        v15 = 55.0;
    }

  }
  else
  {
    -[UIKeyboardCandidateController screenTraits](self, "screenTraits");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "orientation") - 3;

    v21 = 38.0;
    if (v6 == 22)
      v21 = 45.0;
    if (v6 == 21)
      v21 = 44.0;
    if (v20 >= 2)
      v22 = v21;
    else
      v22 = 32.0;
    -[UIKeyboardCandidateController barState](self, "barState", v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "style");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "candidateFont");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "lineHeight");
    v27 = v26;

    +[UIKeyboardCandidateViewConfiguration lineHeightMultiplierForCurrentLanguage](UIKeyboardCandidateViewConfiguration, "lineHeightMultiplierForCurrentLanguage");
    v29 = round(v27 * v28) + 1.0;
    if (v22 >= v29)
      return v22;
    else
      return v29;
  }
  return v15;
}

- (double)candidateBarWidth
{
  void *v3;
  uint64_t v4;
  void *v5;
  char v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;

  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) != 1)
    goto LABEL_8;
  -[UIKeyboardCandidateController screenTraits](self, "screenTraits");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isKeyboardMinorEdgeWidth");

  -[UIKeyboardCandidateController screenTraits](self, "screenTraits");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "keyboardWidth");
  v9 = v8;

  if ((v6 & 1) != 0)
  {
    if (v9 < 1024.0)
    {
      -[UIKeyboardCandidateController screenTraits](self, "screenTraits");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "keyboardWidth");
      v12 = v11;

      if (v12 >= 768.0)
        return 452.0;
      goto LABEL_8;
    }
    return 656.0;
  }
  if (v9 < 1366.0)
  {
    -[UIKeyboardCandidateController screenTraits](self, "screenTraits");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "keyboardWidth");
    v16 = v15;

    if (v16 >= 1024.0)
      return 656.0;
LABEL_8:
    -[UIKeyboardCandidateController screenTraits](self, "screenTraits");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "keyboardWidth");
    v19 = v18;

    return v19;
  }
  return 846.0;
}

- (double)candidateBarHeight
{
  void *v3;
  double v4;
  double v5;

  -[UIKeyboardCandidateController screenTraits](self, "screenTraits");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardCandidateController candidateBarHeightForOrientation:](self, "candidateBarHeightForOrientation:", objc_msgSend(v3, "orientation"));
  v5 = v4;

  return v5;
}

- (double)candidateBarHeightForOrientation:(int64_t)a3
{
  double v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double result;

  if (-[UIKeyboardCandidateController shouldShowDisambiguationCandidates](self, "shouldShowDisambiguationCandidates")
    && ((unint64_t)(a3 - 1) < 2 || +[UIKeyboardImpl isFloating](UIKeyboardImpl, "isFloating")))
  {
    -[UIKeyboardCandidateController rowHeightForBarForOrientation:](self, "rowHeightForBarForOrientation:", a3);
    v6 = v5;
    -[UIKeyboardCandidateController barState](self, "barState");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "disambiguationStyle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "rowHeight");
    v10 = v6 + v9;

    return v10;
  }
  else
  {
    -[UIKeyboardCandidateController rowHeightForBarForOrientation:](self, "rowHeightForBarForOrientation:", a3);
  }
  return result;
}

- (UIEdgeInsets)candidateBarEdgeInsetsForOrientation:(int64_t)a3
{
  void *v4;
  void *v5;
  unint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  UIEdgeInsets result;

  -[UIKeyboardCandidateController screenTraits](self, "screenTraits", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "idiom"))
  {

LABEL_5:
    v8 = 0.0;
    v7 = 0.0;
    goto LABEL_6;
  }
  -[UIKeyboardCandidateController screenTraits](self, "screenTraits");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "orientation") - 3;

  if (v6 >= 2)
    goto LABEL_5;
  v7 = 2.0;
  v8 = 6.0;
LABEL_6:
  v9 = 0.0;
  v10 = v7;
  result.right = v10;
  result.bottom = v9;
  result.left = v7;
  result.top = v8;
  return result;
}

- (CGSize)maximumSizeForInlineView
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGSize result;

  -[UIKeyboardCandidateViewConfiguration preferredInlineFloatingViewSize](self->_inlineConfiguration, "preferredInlineFloatingViewSize");
  v4 = v3;
  -[UIKeyboardCandidateViewConfiguration preferredInlineFloatingViewSize](self->_inlineConfiguration, "preferredInlineFloatingViewSize");
  v6 = v5;
  -[UIKeyboardCandidateViewConfiguration extendedState](self->_inlineConfiguration, "extendedState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "style");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "rowHeight");
  v10 = v9;
  -[UIKeyboardCandidateViewConfiguration extendedState](self->_inlineConfiguration, "extendedState");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "additionalHeight");
  v13 = v10 + v12;

  if (v6 >= v13)
    v14 = v6;
  else
    v14 = v13;
  v15 = v4;
  result.height = v14;
  result.width = v15;
  return result;
}

- (BOOL)inlineViewIsExtended
{
  UIKeyboardCandidateController *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = self;
  -[UIKeyboardCandidateController inlineView](self, "inlineView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "state");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardCandidateController extendedInlineViewState](v2, "extendedInlineViewState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = v4 == v5;

  return (char)v2;
}

- (BOOL)isKeyExtended
{
  UIKeyboardCandidateController *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = self;
  -[UIKeyboardCandidateController key](self, "key");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "state");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardCandidateController extendedKeyState](v2, "extendedKeyState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = v4 == v5;

  return (char)v2;
}

- (void)syncIsExtended
{
  void *v3;
  void *v4;
  id v5;

  if (+[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess"))
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "remoteTextInputPartner");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[UIKeyboardCandidateController isExtended](self, "isExtended"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "forwardKeyboardOperation:object:", sel_setIsExtended_, v4);

  }
}

- (void)setIsExtended:(BOOL)a3
{
  self->_isExtended = a3;
}

- (void)setupAnimatorWithCurve:(int64_t)a3
{
  void *v5;
  UIViewPropertyAnimator *v6;
  UIViewPropertyAnimator *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id location;

  -[UIKeyboardCandidateController animator](self, "animator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = [UIViewPropertyAnimator alloc];
    objc_msgSend((id)objc_opt_class(), "candidateViewAnimationDuration");
    v7 = -[UIViewPropertyAnimator initWithDuration:curve:animations:](v6, "initWithDuration:curve:animations:", a3, &__block_literal_global_303);
    -[UIKeyboardCandidateController setAnimator:](self, "setAnimator:", v7);

    objc_initWeak(&location, self);
    -[UIKeyboardCandidateController animator](self, "animator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __56__UIKeyboardCandidateController_setupAnimatorWithCurve___block_invoke_2;
    v9[3] = &unk_1E16B42F8;
    objc_copyWeak(&v10, &location);
    objc_msgSend(v8, "addCompletion:", v9);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

void __56__UIKeyboardCandidateController_setupAnimatorWithCurve___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setAnimator:", 0);

}

- (void)extendKeyboardBackdropHeight:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  double v10;
  id v11;

  -[UIKeyboardCandidateController bar](self, "bar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "state");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardCandidateController barState](self, "barState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 != v7)
  {
    -[UIKeyboardCandidateController additionalExtendedBarBackdropOffset](self, "additionalExtendedBarBackdropOffset");
    a3 = v8 + a3;
  }
  -[UIKeyboardCandidateController bar](self, "bar");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_rootInputWindowController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "candidateViewAnimationDuration");
  objc_msgSend(v9, "extendKeyboardBackdropHeight:withDuration:", a3, v10);

}

- (void)toggleBarExtended
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  -[UIKeyboardCandidateController barConfiguration](self, "barConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "shouldAnimateStateTransition");

  if (v4)
  {
    -[UIKeyboardCandidateController animator](self, "animator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[UIKeyboardCandidateController animator](self, "animator");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "state");

      if (v7)
      {
        -[UIKeyboardCandidateController animator](self, "animator");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "stopAnimation:", 0);

        -[UIKeyboardCandidateController animator](self, "animator");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "finishAnimationAtPosition:", 0);

      }
    }
    -[UIKeyboardCandidateController setupAnimatorWithCurve:](self, "setupAnimatorWithCurve:", 0);
    -[UIKeyboardCandidateController animator](self, "animator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardCandidateController toggleBarExtendedWithAnimator:](self, "toggleBarExtendedWithAnimator:", v10);

    -[UIKeyboardCandidateController animator](self, "animator");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "startAnimation");

  }
  else
  {
    -[UIKeyboardCandidateController toggleBarExtendedUnanimated](self, "toggleBarExtendedUnanimated");
  }
  v15 = CFSTR("isExtended");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[UIKeyboardCandidateController barIsExtended](self, "barIsExtended"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "postNotificationName:object:userInfo:", CFSTR("UIKeyboardWillToggleCandidateBar"), 0, v13);

}

- (void)toggleBarExtendedUnanimated
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  id v21;

  -[UIKeyboardCandidateController bar](self, "bar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "state");
  v21 = (id)objc_claimAutoreleasedReturnValue();

  -[UIKeyboardCandidateController bar](self, "bar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "state");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardCandidateController barState](self, "barState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == v6)
  {
    -[UIKeyboardCandidateController extendedBarState](self, "extendedBarState");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKeyboardImpl keyboardWindow](UIKeyboardImpl, "keyboardWindow");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIEditMenuSceneComponent sceneComponentForView:](_UIEditMenuSceneComponent, "sceneComponentForView:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dismissCurrentMenu");

    -[UIKeyboardCandidateController bar](self, "bar");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "resetSortControlIndex");

    if (!v7)
      goto LABEL_11;
  }
  else
  {
    -[UIKeyboardCandidateController barState](self, "barState");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
      goto LABEL_11;
  }
  -[UIKeyboardCandidateController bar](self, "bar");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "state");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "yOffset");

  -[UIKeyboardCandidateController bar](self, "bar");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setState:animated:animator:options:force:completion:", v7, 0, 0, 0, 0, 0);

  -[UIKeyboardCandidateController syncIsExtended](self, "syncIsExtended");
  -[UIKeyboardCandidateController barConfiguration](self, "barConfiguration");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v12) = objc_msgSend(v14, "willCoverKeyboardLayout");

  if ((_DWORD)v12)
  {
    -[UIKeyboardCandidateController extendedBarState](self, "extendedBarState");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v16 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v16, "_layout");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "setHidden:", v7 == v15);
    +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v16) = objc_msgSend(v18, "_isBackdropVisible");

    if ((v16 & 1) == 0)
    {
      v19 = 0.0;
      if (v7 != v15)
        v19 = 1.0;
      objc_msgSend(v17, "setAlpha:", v19);
    }

  }
LABEL_11:
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "updateKeyboardConfigurations");

}

- (void)toggleBarExtendedWithAnimator:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  int v32;
  void *v33;
  int v34;
  UIKBBackdropView *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  UIKBBackdropView *v45;
  void *v46;
  double v47;
  BOOL v48;
  double v49;
  double v50;
  void *v51;
  double v52;
  double v53;
  void *v54;
  double v55;
  double v56;
  void *v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  BOOL v66;
  double v67;
  double v68;
  _UIKeyboardCandidateSlidingMaskView *v69;
  void *v70;
  double v71;
  double v72;
  void *v73;
  double v74;
  _UIKeyboardCandidateSlidingMaskView *v75;
  void *v76;
  uint64_t v77;
  _UIKeyboardCandidateSlidingMaskView *v78;
  uint64_t v79;
  UIKBBackdropView *v80;
  UIKBBackdropView *v81;
  UIKBBackdropView *v82;
  void *v83;
  char v84;
  double v85;
  void *v86;
  BOOL v87;
  double v88;
  _QWORD v89[4];
  id v90;
  BOOL v91;
  _QWORD v92[5];
  id v93;
  _QWORD v94[4];
  UIKBBackdropView *v95;
  _QWORD v96[4];
  UIKBBackdropView *v97;
  _QWORD v98[4];
  id v99;
  _QWORD v100[5];
  UIKBBackdropView *v101;
  _QWORD v102[5];
  UIKBBackdropView *v103;
  _QWORD v104[4];
  _UIKeyboardCandidateSlidingMaskView *v105;
  double v106;
  double v107;
  double v108;
  double v109;
  double v110;
  double v111;
  double v112;
  double v113;
  BOOL v114;
  _QWORD v115[5];
  _QWORD v116[5];
  _QWORD v117[6];

  v4 = a3;
  -[UIKeyboardCandidateController bar](self, "bar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "state");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIKeyboardCandidateController bar](self, "bar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "state");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardCandidateController barState](self, "barState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 == v9)
  {
    -[UIKeyboardCandidateController extendedBarState](self, "extendedBarState");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKeyboardImpl keyboardWindow](UIKeyboardImpl, "keyboardWindow");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIEditMenuSceneComponent sceneComponentForView:](_UIEditMenuSceneComponent, "sceneComponentForView:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "dismissCurrentMenu");

    -[UIKeyboardCandidateController bar](self, "bar");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "resetSortControlIndex");

    if (!v13)
      goto LABEL_29;
    goto LABEL_7;
  }
  -[UIKeyboardCandidateController bar](self, "bar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "state");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardCandidateController extendedScrolledBarState](self, "extendedScrolledBarState");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11 == v12)
    objc_msgSend(v4, "addAnimations:", &__block_literal_global_52_0);
  -[UIKeyboardCandidateController barState](self, "barState");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
LABEL_7:
    -[UIKeyboardCandidateController bar](self, "bar");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "state");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "yOffset");
    v20 = v19;

    -[UIKeyboardCandidateController bar](self, "bar");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = MEMORY[0x1E0C809B0];
    v117[0] = MEMORY[0x1E0C809B0];
    v117[1] = 3221225472;
    v117[2] = __63__UIKeyboardCandidateController_toggleBarExtendedWithAnimator___block_invoke_2;
    v117[3] = &unk_1E16B3FD8;
    v117[4] = self;
    objc_msgSend(v21, "setState:animated:animator:options:force:completion:", v13, 1, v4, 0, 0, v117);

    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "_layout");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v24, "setHidden:", 0);
    -[UIKeyboardCandidateController barConfiguration](self, "barConfiguration");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "shouldResizeKeyboardBackdrop");

    if (v26)
    {
      v116[0] = v22;
      v116[1] = 3221225472;
      v116[2] = __63__UIKeyboardCandidateController_toggleBarExtendedWithAnimator___block_invoke_3;
      v116[3] = &unk_1E16B1B28;
      v116[4] = self;
      objc_msgSend(v4, "addAnimations:", v116);
    }
    else
    {
      -[UIKeyboardCandidateController bar](self, "bar");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "state");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "yOffset");
      v30 = v29;

      if (v20 != v30)
      {
        v115[0] = v22;
        v115[1] = 3221225472;
        v115[2] = __63__UIKeyboardCandidateController_toggleBarExtendedWithAnimator___block_invoke_4;
        v115[3] = &unk_1E16B1B28;
        v115[4] = self;
        objc_msgSend(v4, "addAnimations:", v115);
      }
      -[UIKeyboardCandidateController barConfiguration](self, "barConfiguration");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "willCoverKeyboardLayout");

      if (v32)
      {
        +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v33, "_isBackdropVisible");

        if (v34)
        {
          v35 = [UIKBBackdropView alloc];
          objc_msgSend(v24, "frame");
          v37 = v36;
          v39 = v38;
          v41 = v40;
          v43 = v42;
          -[UIKeyboardCandidateController renderConfig](self, "renderConfig");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = -[UIKBBackdropView initWithFrame:style:](v35, "initWithFrame:style:", objc_msgSend(v44, "backdropStyle"), v37, v39, v41, v43);

          objc_msgSend(v24, "superview");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "insertSubview:above:", v45, v24);

        }
        else
        {
          v45 = 0;
        }
        objc_msgSend(v13, "additionalHeight");
        v48 = v47 <= 0.0;
        v49 = v47;
        v88 = v47;
        v50 = 1.0;
        if (!v48)
          v50 = 0.0;
        -[UIView setAlpha:](v45, "setAlpha:", v50);
        -[UIKeyboardCandidateController bar](self, "bar");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "frame");
        v53 = v52;
        -[UIKeyboardCandidateController extendedBarState](self, "extendedBarState");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "additionalHeight");
        v56 = v55;

        -[UIKeyboardCandidateController bar](self, "bar");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "bounds");
        v60 = v59;
        v62 = v61;
        v64 = v63;
        v65 = v58;
        v48 = v49 <= 0.0;
        v66 = v49 > 0.0;
        v67 = v53 + v56 + v58;
        if (v48)
          v68 = v53 + v56 + v58;
        else
          v68 = v58;

        v69 = [_UIKeyboardCandidateSlidingMaskView alloc];
        -[UIKeyboardCandidateController bar](self, "bar");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v70, "frame");
        v72 = v71;
        -[UIKeyboardCandidateController extendedBarState](self, "extendedBarState");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "additionalHeight");
        v75 = -[_UIKeyboardCandidateSlidingMaskView initWithFrame:opaqueHeight:fadeHeight:](v69, "initWithFrame:opaqueHeight:fadeHeight:", v60, v62, v64, v65, v72, v74);

        -[UIKeyboardCandidateController bar](self, "bar");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v76, "setMaskView:", v75);

        -[UIView setFrame:](v75, "setFrame:", v60, v62, v64, v68);
        v77 = MEMORY[0x1E0C809B0];
        v104[0] = MEMORY[0x1E0C809B0];
        v104[1] = 3221225472;
        v104[2] = __63__UIKeyboardCandidateController_toggleBarExtendedWithAnimator___block_invoke_5;
        v104[3] = &unk_1E16BF8D8;
        v78 = v75;
        v105 = v78;
        v87 = v66;
        v114 = v66;
        v79 = v77;
        v106 = v60;
        v107 = v62;
        v108 = v64;
        v109 = v67;
        v110 = v60;
        v111 = v62;
        v112 = v64;
        v113 = v65;
        objc_msgSend(v4, "addAnimations:", v104);
        v102[0] = v77;
        v102[1] = 3221225472;
        v102[2] = __63__UIKeyboardCandidateController_toggleBarExtendedWithAnimator___block_invoke_6;
        v102[3] = &unk_1E16BE3C0;
        v102[4] = self;
        v80 = v45;
        v103 = v80;
        objc_msgSend(v4, "addCompletion:", v102);
        if (v88 <= 0.0)
        {
          v96[0] = v77;
          v96[1] = 3221225472;
          v96[2] = __63__UIKeyboardCandidateController_toggleBarExtendedWithAnimator___block_invoke_11;
          v96[3] = &unk_1E16B1B28;
          v82 = v80;
          v97 = v82;
          objc_msgSend(v4, "addAnimations:delayFactor:", v96, 0.6);
          v94[0] = v79;
          v94[1] = 3221225472;
          v94[2] = __63__UIKeyboardCandidateController_toggleBarExtendedWithAnimator___block_invoke_12;
          v94[3] = &unk_1E16B42D0;
          v95 = v82;
          objc_msgSend(v4, "addCompletion:", v94);

          v81 = v97;
        }
        else
        {
          v100[0] = v77;
          v100[1] = 3221225472;
          v100[2] = __63__UIKeyboardCandidateController_toggleBarExtendedWithAnimator___block_invoke_7;
          v100[3] = &unk_1E16B1B50;
          v100[4] = self;
          v101 = v80;
          objc_msgSend(v4, "addAnimations:", v100);
          v98[0] = v77;
          v98[1] = 3221225472;
          v98[2] = __63__UIKeyboardCandidateController_toggleBarExtendedWithAnimator___block_invoke_10;
          v98[3] = &unk_1E16B42D0;
          v99 = v24;
          objc_msgSend(v4, "addCompletion:", v98);

          v81 = v101;
        }

        v92[0] = v79;
        v92[1] = 3221225472;
        v92[2] = __63__UIKeyboardCandidateController_toggleBarExtendedWithAnimator___block_invoke_13;
        v92[3] = &unk_1E16BE3C0;
        v92[4] = self;
        v93 = v6;
        objc_msgSend(v4, "addCompletion:", v92);
        +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        v84 = objc_msgSend(v83, "_isBackdropVisible");

        if ((v84 & 1) == 0)
        {
          v85 = 0.0;
          if (v88 > 0.0)
            v85 = 1.0;
          objc_msgSend(v24, "setAlpha:", v85);
          v89[0] = v79;
          v89[1] = 3221225472;
          v89[2] = __63__UIKeyboardCandidateController_toggleBarExtendedWithAnimator___block_invoke_14;
          v89[3] = &unk_1E16B1B78;
          v90 = v24;
          v91 = v87;
          objc_msgSend(v4, "addAnimations:", v89);

        }
      }
    }
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "updateKeyboardConfigurations");

  }
LABEL_29:

}

void __63__UIKeyboardCandidateController_toggleBarExtendedWithAnimator___block_invoke()
{
  void *v0;
  id v1;

  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  +[UIInputViewAnimationStyle animationStyleDefault](UIInputViewAnimationStyle, "animationStyleDefault");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "maximizeWithAnimationStyle:force:", v0, 1);

}

uint64_t __63__UIKeyboardCandidateController_toggleBarExtendedWithAnimator___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "syncIsExtended");
}

void __63__UIKeyboardCandidateController_toggleBarExtendedWithAnimator___block_invoke_3(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "bar");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "state");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "yOffset");
  objc_msgSend(v1, "extendKeyboardBackdropHeight:");

}

void __63__UIKeyboardCandidateController_toggleBarExtendedWithAnimator___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "bar");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_rootInputWindowController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "bar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "state");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "yOffset");
  v6 = v5;
  objc_msgSend((id)objc_opt_class(), "candidateViewAnimationDuration");
  objc_msgSend(v2, "candidateBarWillChangeHeight:withDuration:", v6, v7);

}

uint64_t __63__UIKeyboardCandidateController_toggleBarExtendedWithAnimator___block_invoke_5(uint64_t a1)
{
  double *v1;
  double *v2;
  double *v3;
  double *v4;

  if (*(_BYTE *)(a1 + 104))
    v1 = (double *)(a1 + 40);
  else
    v1 = (double *)(a1 + 72);
  if (*(_BYTE *)(a1 + 104))
    v2 = (double *)(a1 + 48);
  else
    v2 = (double *)(a1 + 80);
  if (*(_BYTE *)(a1 + 104))
    v3 = (double *)(a1 + 56);
  else
    v3 = (double *)(a1 + 88);
  if (*(_BYTE *)(a1 + 104))
    v4 = (double *)(a1 + 64);
  else
    v4 = (double *)(a1 + 96);
  return objc_msgSend(*(id *)(a1 + 32), "setFrame:", *v1, *v2, *v3, *v4);
}

uint64_t __63__UIKeyboardCandidateController_toggleBarExtendedWithAnimator___block_invoke_6(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "bar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setMaskView:", 0);

  return objc_msgSend(*(id *)(a1 + 40), "removeFromSuperview");
}

void __63__UIKeyboardCandidateController_toggleBarExtendedWithAnimator___block_invoke_7(uint64_t a1)
{
  double v2;
  double v3;
  _QWORD v4[4];
  id v5;

  objc_msgSend((id)objc_opt_class(), "candidateViewAnimationDuration");
  v3 = v2;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __63__UIKeyboardCandidateController_toggleBarExtendedWithAnimator___block_invoke_8;
  v4[3] = &unk_1E16B1B28;
  v5 = *(id *)(a1 + 40);
  +[UIView animateKeyframesWithDuration:delay:options:animations:completion:](UIView, "animateKeyframesWithDuration:delay:options:animations:completion:", 0, v4, 0, v3, 0.0);

}

void __63__UIKeyboardCandidateController_toggleBarExtendedWithAnimator___block_invoke_8(uint64_t a1)
{
  _QWORD v1[4];
  id v2;

  v1[0] = MEMORY[0x1E0C809B0];
  v1[1] = 3221225472;
  v1[2] = __63__UIKeyboardCandidateController_toggleBarExtendedWithAnimator___block_invoke_9;
  v1[3] = &unk_1E16B1B28;
  v2 = *(id *)(a1 + 32);
  +[UIView addKeyframeWithRelativeStartTime:relativeDuration:animations:](UIView, "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v1, 0.0, 0.4);

}

uint64_t __63__UIKeyboardCandidateController_toggleBarExtendedWithAnimator___block_invoke_9(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

uint64_t __63__UIKeyboardCandidateController_toggleBarExtendedWithAnimator___block_invoke_10(uint64_t result, uint64_t a2)
{
  if (!a2)
    return objc_msgSend(*(id *)(result + 32), "setHidden:", 1);
  return result;
}

uint64_t __63__UIKeyboardCandidateController_toggleBarExtendedWithAnimator___block_invoke_11(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __63__UIKeyboardCandidateController_toggleBarExtendedWithAnimator___block_invoke_12(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

void __63__UIKeyboardCandidateController_toggleBarExtendedWithAnimator___block_invoke_13(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  if (a2 == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "bar");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setState:", *(_QWORD *)(a1 + 40));

    objc_msgSend(*(id *)(a1 + 32), "syncIsExtended");
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "updateKeyboardConfigurations");

  }
}

uint64_t __63__UIKeyboardCandidateController_toggleBarExtendedWithAnimator___block_invoke_14(uint64_t a1)
{
  double v1;

  v1 = 0.0;
  if (!*(_BYTE *)(a1 + 40))
    v1 = 1.0;
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", v1);
}

- (void)toggleInlineViewExtendedAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  id v18;

  v4 = a3;
  -[UIKeyboardCandidateController inlineView](self, "inlineView", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "state");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardCandidateController inlineViewState](self, "inlineViewState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 == v8)
  {
    -[UIKeyboardCandidateController extendedInlineViewState](self, "extendedInlineViewState");
    v18 = (id)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardCandidateController inlineViewContainer](self, "inlineViewContainer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "shouldExtendUpwards");
    v14 = 0.0;
    if (v13)
    {
      objc_msgSend(v18, "additionalHeight", 0.0);
      v14 = -v15;
    }
    objc_msgSend(v18, "setYOffset:", v14);

  }
  else
  {
    -[UIKeyboardCandidateController inlineView](self, "inlineView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "state");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardCandidateController extendedInlineViewState](self, "extendedInlineViewState");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10 != v11)
      return;
    -[UIKeyboardCandidateController inlineViewState](self, "inlineViewState");
    v18 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (v18)
  {
    -[UIKeyboardCandidateController setInlineState:extended:animated:options:force:completion:](self, "setInlineState:extended:animated:options:force:completion:", v18, v7 == v8, v4, 0, 0, 0);
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardCandidateController inlineViewContainer](self, "inlineViewContainer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "yOffset");
    objc_msgSend(v16, "updateDictationPopoverLocationForCandidateInlineView:yOffset:", v17);

  }
}

- (void)toggleKeyViewExtendedAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;

  v4 = a3;
  v15 = a4;
  -[UIKeyboardCandidateController key](self, "key");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "state");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardCandidateController keyState](self, "keyState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 == v8)
  {
    -[UIKeyboardCandidateController extendedKeyState](self, "extendedKeyState");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[UIKeyboardCandidateController key](self, "key");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "state");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardCandidateController extendedKeyState](self, "extendedKeyState");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10 != v11)
      goto LABEL_7;
    -[UIKeyboardCandidateController keyState](self, "keyState");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v13 = (void *)v12;
  if (v12)
  {
    -[UIKeyboardCandidateController key](self, "key");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setState:animated:options:force:completion:", v13, v4, 0, 0, v15);

  }
LABEL_7:

}

- (void)collapse
{
  if ((-[UIKeyboardCandidateController activeCandidateViewType](self, "activeCandidateViewType") & 2) != 0
    && -[UIKeyboardCandidateController barIsExtended](self, "barIsExtended"))
  {
    -[UIKeyboardCandidateController toggleBarExtended](self, "toggleBarExtended");
    +[UIKBAnalyticsDispatcher candidateViewExtended:direction:](UIKBAnalyticsDispatcher, "candidateViewExtended:direction:", CFSTR("Automatic"), CFSTR("Close"));
  }
  if ((-[UIKeyboardCandidateController activeCandidateViewType](self, "activeCandidateViewType") & 4) != 0
    && -[UIKeyboardCandidateController inlineViewIsExtended](self, "inlineViewIsExtended"))
  {
    -[UIKeyboardCandidateController toggleInlineViewExtendedAnimated:completion:](self, "toggleInlineViewExtendedAnimated:completion:", 0, 0);
  }
  if ((-[UIKeyboardCandidateController activeCandidateViewType](self, "activeCandidateViewType") & 1) != 0)
  {
    if (-[UIKeyboardCandidateController isKeyExtended](self, "isKeyExtended"))
      -[UIKeyboardCandidateController toggleKeyViewExtendedAnimated:completion:](self, "toggleKeyViewExtendedAnimated:completion:", 0, 0);
  }
}

- (void)removeInlineView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  UIView *hostedInlineViewContainer;
  UIKeyboardCandidateSceneHostingController *hostingController;

  -[TUICandidateView resetSortControlIndex](self->_inlineView, "resetSortControlIndex");
  -[UIKeyboardCandidateController inlineViewContainer](self, "inlineViewContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 1);

  -[UIKeyboardCandidateController inlineViewState](self, "inlineViewState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardCandidateController inlineView](self, "inlineView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setState:", v4);

  -[UIKeyboardCandidateController inlineViewContainer](self, "inlineViewContainer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setInlineText:inlineRect:maxX:layout:", 0, 1, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24), 3.40282347e38);

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardCandidateController inlineViewContainer](self, "inlineViewContainer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "updateDictationPopoverLocationForCandidateInlineView:yOffset:", v8, 0.0);

  -[UIView removeFromSuperview](self->_hostedInlineViewContainer, "removeFromSuperview");
  hostedInlineViewContainer = self->_hostedInlineViewContainer;
  self->_hostedInlineViewContainer = 0;

  hostingController = self->_hostingController;
  self->_hostingController = 0;

}

- (id)snapshot
{
  _UIKeyboardCandidateSnapshotView *v3;
  _UIKeyboardCandidateSnapshotView *v4;

  if (self->_bar)
  {
    v3 = [_UIKeyboardCandidateSnapshotView alloc];
    -[TUICandidateView bounds](self->_bar, "bounds");
    v4 = -[UIView initWithFrame:](v3, "initWithFrame:");
    -[UIView setOpaque:](v4, "setOpaque:", 0);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)setupPanGestureRecognizerIfNeeded
{
  void *v3;
  int v4;
  void *v5;
  UIPanGestureRecognizer *v6;
  void *v7;
  void *v8;
  void *v9;
  TUICandidateView *bar;
  void *v11;
  TUICandidateView *v12;
  id v13;

  if ((-[UIKeyboardCandidateController activeCandidateViewType](self, "activeCandidateViewType") & 2) != 0
    && (-[UIKeyboardCandidateController barConfiguration](self, "barConfiguration"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "allowsPullDownGesture"),
        v3,
        v4))
  {
    -[UIKeyboardCandidateController panGestureRecognizer](self, "panGestureRecognizer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      v6 = -[UIPanGestureRecognizer initWithTarget:action:]([UIPanGestureRecognizer alloc], "initWithTarget:action:", self, sel_panGestureRecognizerAction_);
      -[UIKeyboardCandidateController setPanGestureRecognizer:](self, "setPanGestureRecognizer:", v6);

      -[UIKeyboardCandidateController panGestureRecognizer](self, "panGestureRecognizer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setMaximumNumberOfTouches:", 1);

      -[UIKeyboardCandidateController panGestureRecognizer](self, "panGestureRecognizer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setDelegate:", self);

      -[UIKeyboardCandidateController panGestureRecognizer](self, "panGestureRecognizer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_setHysteresis:", 20.0);

    }
    bar = self->_bar;
    -[UIKeyboardCandidateController panGestureRecognizer](self, "panGestureRecognizer");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    -[TUICandidateView addGestureRecognizer:](bar, "addGestureRecognizer:");
  }
  else
  {
    -[UIKeyboardCandidateController panGestureRecognizer](self, "panGestureRecognizer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
      return;
    v12 = self->_bar;
    -[UIKeyboardCandidateController panGestureRecognizer](self, "panGestureRecognizer");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    -[TUICandidateView removeGestureRecognizer:](v12, "removeGestureRecognizer:");
  }

}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  BOOL v8;

  v4 = a3;
  -[UIKeyboardCandidateController panGestureRecognizer](self, "panGestureRecognizer");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v4 || (objc_opt_respondsToSelector() & 1) == 0)
    return 1;
  if (!-[TUICandidateView showingArrowButton](self->_bar, "showingArrowButton"))
    return 0;
  -[UIKeyboardCandidateController bar](self, "bar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "state");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "arrowButtonDirection") != 2;

  return v8;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double Current;
  void *v17;
  double v18;
  double v19;
  double v20;
  BOOL v21;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "phase"))
    goto LABEL_7;
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_layout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "currentKeyplane");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "visualStyling") & 0xFF0000;

  if (v10 != 0x10000)
  {
LABEL_7:
    v21 = 1;
  }
  else
  {
    objc_msgSend(v5, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "frame");
    if (v12 <= 0.0)
    {
      v21 = 1;
    }
    else
    {
      v13 = v12;
      objc_msgSend(v6, "locationInView:", v11);
      v15 = v14;
      Current = CFAbsoluteTimeGetCurrent();
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "lastTouchDownTimestamp");
      v19 = v18;

      v20 = Current - v19;
      if (Current - v19 < 0.0)
        v20 = 0.0;
      v21 = v15 <= v13 * (exp(-(v20 * v20) - v20 * v20) * -0.25 + 0.95);
    }

  }
  return v21;
}

- (void)panGestureRecognizerAction:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  UISpringTimingParameters *v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  BOOL v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  void *v37;
  id location;

  v4 = a3;
  -[UIKeyboardCandidateController extendedBarState](self, "extendedBarState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "additionalHeight");
  v7 = v6;

  if (v7 == 0.0)
    v8 = 50.0;
  else
    v8 = v7;
  v9 = objc_msgSend(v4, "state");
  if ((unint64_t)(v9 - 3) < 3)
  {
    objc_msgSend((id)objc_opt_class(), "candidateViewAnimationDuration");
    v11 = v10;
    -[UIKeyboardCandidateController animator](self, "animator");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "fractionComplete");
    v14 = v13;

    -[UIKeyboardCandidateController bar](self, "bar");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "velocityInView:", v15);
    v17 = v16 / v8;

    v18 = v14 + v11 * v17 * 0.5;
    -[UIKeyboardCandidateController animator](self, "animator");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v18 < 0.5)
      v17 = -v17;
    objc_msgSend(v19, "setReversed:", v18 < 0.5);

    v21 = -[UISpringTimingParameters initWithDampingRatio:initialVelocity:]([UISpringTimingParameters alloc], "initWithDampingRatio:initialVelocity:", 1.0, v17, v17);
    v22 = v11;
    if (v17 > 0.0)
      v22 = (1.0 - v14 + 1.0 - v14) / v17;
    if (v11 >= v22)
      v23 = v22;
    else
      v23 = v11;
    -[UIKeyboardCandidateController animator](self, "animator");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "continueAnimationWithTimingParameters:durationFactor:", v21, v23 / v11);

    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "candidateBarDidExtendWithGesture");

    goto LABEL_22;
  }
  if (v9 == 2)
  {
    -[UIKeyboardCandidateController panGestureRecognizer](self, "panGestureRecognizer");
    v21 = (UISpringTimingParameters *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardCandidateController bar](self, "bar");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISpringTimingParameters translationInView:](v21, "translationInView:", v34);
    v36 = v35 / v8;
    -[UIKeyboardCandidateController animator](self, "animator");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setFractionComplete:", v36);

    goto LABEL_22;
  }
  if (v9 != 1)
    goto LABEL_23;
  objc_msgSend(v4, "view");
  v21 = (UISpringTimingParameters *)objc_claimAutoreleasedReturnValue();
  if (v21 != (UISpringTimingParameters *)self->_bar
    || -[UIKeyboardCandidateController barIsExtended](self, "barIsExtended"))
  {
LABEL_22:

    goto LABEL_23;
  }
  v26 = -[UIKeyboardCandidateController isTextEffectsButtonPresented](self, "isTextEffectsButtonPresented");

  if (!v26)
  {
    objc_initWeak(&location, self);
    -[UIKeyboardCandidateController bar](self, "bar");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "resetSortControlIndex");

    -[UIKeyboardCandidateController setupAnimatorWithCurve:](self, "setupAnimatorWithCurve:", 2);
    -[UIKeyboardCandidateController animator](self, "animator");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "state");

    if (v29)
    {
      -[UIKeyboardCandidateController animator](self, "animator");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "stopAnimation:", 0);

      -[UIKeyboardCandidateController animator](self, "animator");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "finishAnimationAtPosition:", 0);

    }
    -[UIKeyboardCandidateController animator](self, "animator");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardCandidateController toggleBarExtendedWithAnimator:](self, "toggleBarExtendedWithAnimator:", v32);

    -[UIKeyboardCandidateController bar](self, "bar");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setUserInteractionEnabled:", 0);

    +[UIKBAnalyticsDispatcher candidateViewExtended:direction:](UIKBAnalyticsDispatcher, "candidateViewExtended:direction:", CFSTR("Gesture"), CFSTR("Open"));
    objc_destroyWeak(&location);
  }
LABEL_23:

}

- (void)setCandidateResultSet:(id)a3
{
  TIKeyboardCandidateResultSet *v5;
  int64_t activeCandidateViewType;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  TIKeyboardCandidateResultSet *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = (TIKeyboardCandidateResultSet *)a3;
  if (self->_candidateResultSet != v5)
  {
    objc_storeStrong((id *)&self->_candidateResultSet, a3);
    -[UIKeyboardCandidateController updateStates](self, "updateStates");
    -[UIKeyboardCandidateController resetSortControlIndexAfterCandidatesChanged](self, "resetSortControlIndexAfterCandidatesChanged");
    activeCandidateViewType = self->_activeCandidateViewType;
    -[UIKeyboardCandidateController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      -[UIKeyboardCandidateController delegate](self, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      activeCandidateViewType &= objc_msgSend(v9, "preferredCandidateViewTypeForCandidateResultSet:", v5);

    }
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    -[UIKeyboardCandidateController activeViews](self, "activeViews", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v18 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          if ((-[UIKeyboardCandidateController candidateViewTypeForView:](self, "candidateViewTypeForView:", v15) & activeCandidateViewType) != 0)
            v16 = v5;
          else
            v16 = 0;
          objc_msgSend(v15, "setCandidateResultSet:", v16);
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v12);
    }

    -[UIKeyboardCandidateController setCurrentCandidate:](self, "setCurrentCandidate:", 0);
    -[UIKeyboardCandidateController candidatesDidChange](self, "candidatesDidChange");
  }

}

- (void)clearCurrentCandidate
{
  -[UIKeyboardCandidateController setCurrentCandidate:](self, "setCurrentCandidate:", 0);
}

- (void)setInlineText:(id)a3
{
  id v4;
  NSString *v5;
  NSString *inlineText;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[NSString isEqualToString:](self->_inlineText, "isEqualToString:", v4))
  {
    v5 = (NSString *)objc_msgSend(v4, "copy");
    inlineText = self->_inlineText;
    self->_inlineText = v5;

    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[UIKeyboardCandidateController activeViews](self, "activeViews", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v13;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "setInlineText:", v4);
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v9);
    }

  }
}

- (void)resetSortControlIndexAfterCandidatesChanged
{
  -[TUICandidateView resetSortControlIndex](self->_key, "resetSortControlIndex");
  -[TUICandidateView resetSortControlIndex](self->_inlineView, "resetSortControlIndex");
}

+ (double)candidateViewAnimationDuration
{
  if (qword_1ECD7E9E0 != -1)
    dispatch_once(&qword_1ECD7E9E0, &__block_literal_global_68);
  return *(double *)&qword_1ECD7E9E8;
}

void __63__UIKeyboardCandidateController_candidateViewAnimationDuration__block_invoke()
{
  uint64_t *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (uint64_t *)qword_1ECD7EA00;
  v7 = qword_1ECD7EA00;
  if (!qword_1ECD7EA00)
  {
    v1 = TextInputUILibrary_2();
    v0 = (uint64_t *)dlsym(v1, "TUICandidateViewAnimationDuration");
    v5[3] = (uint64_t)v0;
    qword_1ECD7EA00 = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (v0)
  {
    qword_1ECD7E9E8 = *v0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSTimeInterval getTUICandidateViewAnimationDuration(void)");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("UIKeyboardCandidateController.m"), 21, CFSTR("%s"), dlerror());

    __break(1u);
  }
}

- (int64_t)layoutDirectionForCurrentInputMode
{
  void *v2;
  void *v3;
  void *v4;
  int64_t IsDefaultRightToLeft;

  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentInputMode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "normalizedIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  IsDefaultRightToLeft = UIKeyboardInputModeIsDefaultRightToLeft(v4);

  return IsDefaultRightToLeft;
}

- (void)setCandidates:(id)a3 inlineText:(id)a4 inlineRect:(CGRect)a5 maxX:(double)a6 layout:(BOOL)a7
{
  -[UIKeyboardCandidateController setCandidates:type:inlineText:inlineRect:maxX:layout:](self, "setCandidates:type:inlineText:inlineRect:maxX:layout:", a3, 5, a4, a7, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height, a6);
}

- (void)setCandidates:(id)a3 type:(int)a4 inlineText:(id)a5 inlineRect:(CGRect)a6 maxX:(double)a7 layout:(BOOL)a8
{
  -[UIKeyboardCandidateController setCandidates:type:inlineText:inlineRect:maxX:layout:inlineCandidatesAreHosted:](self, "setCandidates:type:inlineText:inlineRect:maxX:layout:inlineCandidatesAreHosted:", a3, *(_QWORD *)&a4, a5, a8, 0, a6.origin.x, a6.origin.y, a6.size.width, a6.size.height, a7);
}

- (void)setCandidates:(id)a3 type:(int)a4 inlineText:(id)a5 inlineRect:(CGRect)a6 maxX:(double)a7 layout:(BOOL)a8 inlineCandidatesAreHosted:(BOOL)a9
{
  void *v9;
  _BOOL4 v10;
  _BOOL8 v11;
  double height;
  double width;
  double y;
  double x;
  id v19;
  id v20;
  char v21;
  _BOOL8 v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  char v27;
  _BOOL8 v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  const __CFString *v37;
  _QWORD v38[2];

  v10 = a9;
  v11 = a8;
  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v38[1] = *MEMORY[0x1E0C80C00];
  v19 = a5;
  v20 = a3;
  -[UIKeyboardCandidateController setInlineRect:](self, "setInlineRect:", x, y, width, height);
  -[UIKeyboardCandidateController setCandidateResultSet:](self, "setCandidateResultSet:", v20);

  -[UIKeyboardCandidateController setInlineText:](self, "setInlineText:", v19);
  v21 = -[UIKeyboardCandidateController activeCandidateViewType](self, "activeCandidateViewType");
  v22 = ((v21 & 4) == 0
      || (-[TUICandidateView candidateResultSet](self->_inlineView, "candidateResultSet"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          (objc_msgSend(v9, "hasCandidates") & 1) == 0))
     && !v10;
  -[UIKeyboardCandidateController inlineViewContainer](self, "inlineViewContainer");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setHidden:", v22);

  if ((v21 & 4) != 0)
  -[UIKeyboardCandidateController inlineViewContainer](self, "inlineViewContainer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "isHidden");

  if (v25)
    -[UIKeyboardCandidateController removeInlineView](self, "removeInlineView");
  -[UIKeyboardCandidateController inlineViewContainer](self, "inlineViewContainer");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "isHidden");

  if ((v27 & 1) == 0)
  {
    v28 = -[UIKeyboardCandidateController inlineRectIsVertical](self, "inlineRectIsVertical");
    -[UIKeyboardCandidateController inlineViewContainer](self, "inlineViewContainer");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setInlineRectIsVertical:", v28);

    -[UIKeyboardCandidateController inlineViewContainer](self, "inlineViewContainer");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setInlineText:inlineRect:maxX:layout:", v19, v11, x, y, width, height, a7);

  }
  v31 = v25 ^ 1u;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = CFSTR("isVisible");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v31);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v33;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, &v37, 1);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "postNotificationName:object:userInfo:", CFSTR("UIKeyboardInlineCandidateBarVisibilityChangedNotification"), 0, v34);

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardCandidateController inlineViewContainer](self, "inlineViewContainer");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "updateDictationPopoverLocationForCandidateInlineView:yOffset:", v36, 0.0);

}

- (void)updateHostedInlineCandidatesWithInlineText:(id)a3 type:(int)a4 inlineRect:(CGRect)a5 maxX:(double)a6 layout:(BOOL)a7
{
  -[UIKeyboardCandidateController setCandidates:type:inlineText:inlineRect:maxX:layout:inlineCandidatesAreHosted:](self, "setCandidates:type:inlineText:inlineRect:maxX:layout:inlineCandidatesAreHosted:", 0, *(_QWORD *)&a4, a3, a7, 1, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height, a6);
  -[UIKeyboardCandidateController clientExpandedStateChanged:](self, "clientExpandedStateChanged:", -[UIKeyboardCandidateSceneHostingController isExpanded](self->_hostingController, "isExpanded"));
}

- (BOOL)isExtendedList
{
  _BOOL4 v3;
  unint64_t v4;
  _BOOL4 v5;

  v3 = (-[UIKeyboardCandidateController activeCandidateViewType](self, "activeCandidateViewType") & 2) != 0
    && -[UIKeyboardCandidateController barIsExtended](self, "barIsExtended");
  v4 = -[UIKeyboardCandidateController activeCandidateViewType](self, "activeCandidateViewType");
  if ((v4 & 4) == 0 || v3)
    return (v4 >> 2) & 1 | v3;
  else
    LOBYTE(v5) = -[UIKeyboardCandidateController inlineViewIsExtended](self, "inlineViewIsExtended");
  return v5;
}

- (BOOL)isFloatingList
{
  return ((unint64_t)-[UIKeyboardCandidateController activeCandidateViewType](self, "activeCandidateViewType") >> 2) & 1;
}

- (void)setUIKeyboardCandidateListDelegate:(id)a3
{
  -[UIKeyboardCandidateController setCandidateListDelegate:](self, "setCandidateListDelegate:");
  if (!a3)
  {
    -[UIKeyboardCandidateController collapse](self, "collapse");
    -[UIKeyboardCandidateController setCandidateResultSet:](self, "setCandidateResultSet:", 0);
    -[UIKeyboardCandidateController removeInlineView](self, "removeInlineView");
  }
}

- (void)showCandidateAtIndex:(unint64_t)a3
{
  -[UIKeyboardCandidateController showCandidateAtIndex:animated:scrollPosition:](self, "showCandidateAtIndex:animated:scrollPosition:", a3, 0, 0);
}

- (void)showCandidateAtIndex:(unint64_t)a3 animated:(BOOL)a4 scrollPosition:(unint64_t)a5
{
  _BOOL8 v6;
  void *v8;
  id v9;

  v6 = a4;
  -[UIKeyboardCandidateController firstNonEmptyActiveCandidateView](self, "firstNonEmptyActiveCandidateView");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", a3, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v9, "setSelectedIndexPath:animated:scrollPosition:", v8, v6, a5);

}

- (BOOL)showCandidate:(id)a3
{
  return -[UIKeyboardCandidateController showCandidate:animated:scrollPosition:](self, "showCandidate:animated:scrollPosition:", a3, 0, 0);
}

- (BOOL)showCandidate:(id)a3 animated:(BOOL)a4 scrollPosition:(unint64_t)a5
{
  _BOOL8 v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a4;
  v8 = a3;
  -[UIKeyboardCandidateController firstNonEmptyActiveCandidateView](self, "firstNonEmptyActiveCandidateView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8)
  {
    objc_msgSend(v9, "indexPathForCandidate:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v10, "setSelectedIndexPath:animated:scrollPosition:", v11, v6, a5);
  else
    objc_msgSend(v10, "setSelectedIndexPath:", v11);

  return v11 != 0;
}

- (BOOL)hasCandidateInForwardDirection:(BOOL)a3 granularity:(int)a4
{
  uint64_t v4;
  _BOOL8 v5;
  void *v6;

  v4 = *(_QWORD *)&a4;
  v5 = a3;
  -[UIKeyboardCandidateController firstNonEmptyActiveCandidateView](self, "firstNonEmptyActiveCandidateView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v6, "hasCandidateInForwardDirection:granularity:", v5, v4);

  return v4;
}

- (void)showCandidateInForwardDirection:(BOOL)a3 granularity:(int)a4
{
  uint64_t v4;
  _BOOL8 v5;
  _BOOL4 v7;
  id v8;

  v4 = *(_QWORD *)&a4;
  v5 = a3;
  if (a4 == 1 && (-[UIKeyboardCandidateController activeCandidateViewType](self, "activeCandidateViewType") & 4) != 0)
  {
    v7 = -[UIKeyboardCandidateController inlineViewIsExtended](self, "inlineViewIsExtended");
    if (!v5)
    {
      if (!v7)
        goto LABEL_8;
      LOBYTE(v7) = -[UIKeyboardCandidateController hasCandidateInForwardDirection:granularity:](self, "hasCandidateInForwardDirection:granularity:", 0, 1);
    }
    if (!v7)
      -[UIKeyboardCandidateController toggleInlineViewExtendedAnimated:completion:](self, "toggleInlineViewExtendedAnimated:completion:", 1, &__block_literal_global_72_1);
  }
LABEL_8:
  -[UIKeyboardCandidateController firstNonEmptyActiveCandidateView](self, "firstNonEmptyActiveCandidateView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "showCandidateInForwardDirection:granularity:", v5, v4);

}

- (void)acceptSelectedCandidate
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  -[UIKeyboardCandidateController firstNonEmptyActiveCandidateView](self, "firstNonEmptyActiveCandidateView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectedCandidate");
  v4 = objc_claimAutoreleasedReturnValue();
  -[UIKeyboardCandidateController setCurrentCandidate:](self, "setCurrentCandidate:", v4);

  -[UIKeyboardCandidateController candidateListDelegate](self, "candidateListDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[UIKeyboardCandidateController candidateListDelegate](self, "candidateListDelegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "candidateListAcceptCandidate:", self);

  }
}

- (BOOL)handleNumberKey:(unint64_t)a3
{
  void *v6;
  char v7;

  if ((-[UIKeyboardCandidateController activeCandidateViewType](self, "activeCandidateViewType") & 4) == 0)
    return 0;
  -[UIKeyboardCandidateController inlineView](self, "inlineView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "handleNumberKey:", a3);

  return v7;
}

- (BOOL)handleTabKeyWithShift:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  int v5;

  v3 = !a3;
  -[UIKeyboardCandidateController firstNonEmptyActiveCandidateView](self, "firstNonEmptyActiveCandidateView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hasCandidateInForwardDirection:granularity:", v3, 3);
  if (v5)
    objc_msgSend(v4, "showCandidateInForwardDirection:granularity:", v3, 3);

  return v5;
}

- (TIKeyboardCandidate)currentCandidate
{
  TIKeyboardCandidate *currentCandidate;
  TIKeyboardCandidate *v3;
  void *v4;

  currentCandidate = self->_currentCandidate;
  if (currentCandidate)
  {
    v3 = currentCandidate;
  }
  else
  {
    -[UIKeyboardCandidateController firstNonEmptyActiveCandidateView](self, "firstNonEmptyActiveCandidateView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "selectedCandidate");
    v3 = (TIKeyboardCandidate *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (unint64_t)currentIndex
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;

  -[UIKeyboardCandidateController firstNonEmptyActiveCandidateView](self, "firstNonEmptyActiveCandidateView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "selectedIndexPath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      if (objc_msgSend(v5, "section"))
      {
        -[UIKeyboardCandidateController candidateResultSet](self, "candidateResultSet");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "candidates");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "selectedCandidate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v8, "indexOfObject:", v9);

      }
      else
      {
        v10 = objc_msgSend(v6, "row");
      }
    }
    else
    {
      v10 = 0x7FFFFFFFFFFFFFFFLL;
    }

  }
  else
  {
    v10 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v10;
}

- (void)candidateAcceptedAtIndex:(unint64_t)a3
{
  -[UIKeyboardCandidateController showCandidate:](self, "showCandidate:", 0);
}

- (BOOL)hasCandidates
{
  void *v2;
  char v3;

  -[UIKeyboardCandidateController candidateResultSet](self, "candidateResultSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasCandidates");

  return v3;
}

- (id)keyboardBehaviors
{
  void *v2;
  int v3;
  Class *v4;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "accessibilityUsesExtendedKeyboardPredictionsEnabled");

  v4 = (Class *)0x1E0DBDBC0;
  if (!v3)
    v4 = (Class *)0x1E0DBDBC8;
  return objc_alloc_init(*v4);
}

- (id)statisticsIdentifier
{
  char v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id *v9;
  void *v10;
  char v11;
  _BOOL4 v12;
  id *v13;
  id v14;

  v3 = -[UIKeyboardCandidateController activeCandidateViewType](self, "activeCandidateViewType");
  -[UIKeyboardCandidateController screenTraits](self, "screenTraits");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "idiom");
  v6 = v5;
  if ((v3 & 2) != 0)
  {
    if (v5 == 1 && +[UIKeyboardImpl isSplit](UIKeyboardImpl, "isSplit"))
    {
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "centerFilled");

      if ((v11 & 1) == 0)
      {
        v12 = -[UIKeyboardCandidateController barIsExtended](self, "barIsExtended");
        v9 = (id *)MEMORY[0x1E0DBE6E0];
        v13 = (id *)MEMORY[0x1E0DBE6D8];
        goto LABEL_13;
      }
    }
    else
    {

    }
    v12 = -[UIKeyboardCandidateController barIsExtended](self, "barIsExtended");
    v9 = (id *)MEMORY[0x1E0DBE6A0];
    v13 = (id *)MEMORY[0x1E0DBE698];
LABEL_13:
    if (v12)
      v9 = v13;
    goto LABEL_15;
  }

  if (!v6)
  {
    if ((-[UIKeyboardCandidateController activeCandidateViewType](self, "activeCandidateViewType") & 4) != 0)
    {
      v12 = -[UIKeyboardCandidateController inlineViewIsExtended](self, "inlineViewIsExtended");
      v9 = (id *)MEMORY[0x1E0DBE6F8];
      v13 = (id *)MEMORY[0x1E0DBE6F0];
      goto LABEL_13;
    }
    if ((-[UIKeyboardCandidateController activeCandidateViewType](self, "activeCandidateViewType") & 1) != 0)
    {
      v9 = (id *)MEMORY[0x1E0DBE700];
      goto LABEL_15;
    }
LABEL_18:
    v14 = 0;
    return v14;
  }
  -[UIKeyboardCandidateController screenTraits](self, "screenTraits");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "idiom");

  if (v8 != 1)
    goto LABEL_18;
  if ((-[UIKeyboardCandidateController activeCandidateViewType](self, "activeCandidateViewType") & 4) != 0)
  {
    v12 = -[UIKeyboardCandidateController inlineViewIsExtended](self, "inlineViewIsExtended");
    v9 = (id *)MEMORY[0x1E0DBE6D0];
    v13 = (id *)MEMORY[0x1E0DBE6C8];
    goto LABEL_13;
  }
  if ((-[UIKeyboardCandidateController activeCandidateViewType](self, "activeCandidateViewType") & 1) == 0)
    goto LABEL_18;
  v9 = (id *)MEMORY[0x1E0DBE6E8];
LABEL_15:
  v14 = *v9;
  return v14;
}

- (unint64_t)selectedSortIndex
{
  void *v2;
  unint64_t v3;

  -[UIKeyboardCandidateController firstNonEmptyActiveCandidateView](self, "firstNonEmptyActiveCandidateView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "selectedSortControlIndex");

  return v3;
}

- (void)candidatesDidChange
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("UIKeyboardCandidatesChanged"), 0);

}

- (void)revealHiddenCandidates
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[UIKeyboardCandidateController firstNonEmptyActiveCandidateView](self, "firstNonEmptyActiveCandidateView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v10 = v3;
    -[UIKeyboardCandidateController candidateResultSet](self, "candidateResultSet");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "disambiguationCandidates");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    v3 = v10;
    if (v6)
    {
      if ((objc_msgSend(v10, "hasCandidateInForwardDirection:granularity:inGridType:", 1, 0, 1) & 1) == 0)
        objc_msgSend(v10, "setDisambiguationSelectedIndexPath:", 0);
      objc_msgSend(v10, "showCandidateInForwardDirection:granularity:inGridType:", 1, 0, 1);
      objc_msgSend(v10, "selectedDisambiguationCandidate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(v7, "copy");

      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v8, "setGeneratedByChoosePinyin:", 1);
      objc_msgSend(v10, "disambiguationSelectedIndexPath");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKeyboardCandidateController candidateView:didAcceptCandidate:atIndexPath:inGridType:generateFeedback:](self, "candidateView:didAcceptCandidate:atIndexPath:inGridType:generateFeedback:", v10, v8, v9, 1, 0);

      v3 = v10;
    }
  }

}

- (id)candidateAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  -[UIKeyboardCandidateController candidateResultSet](self, "candidateResultSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "candidates");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7 <= a3)
  {
    v10 = 0;
  }
  else
  {
    -[UIKeyboardCandidateController candidateResultSet](self, "candidateResultSet");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "candidates");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndex:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (int64_t)viewOffsetForCandidateAtIndex:(unint64_t)a3
{
  void *v4;
  void *v5;
  int64_t v6;

  -[UIKeyboardCandidateController candidateAtIndex:](self, "candidateAtIndex:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[UIKeyboardCandidateController firstNonEmptyActiveCandidateView](self, "firstNonEmptyActiveCandidateView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "viewOffsetForCandidate:", v4);

  }
  else
  {
    v6 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v6;
}

- (int64_t)rowForCandidateAtIndex:(unint64_t)a3
{
  void *v4;
  void *v5;
  int64_t v6;

  -[UIKeyboardCandidateController candidateAtIndex:](self, "candidateAtIndex:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[UIKeyboardCandidateController firstNonEmptyActiveCandidateView](self, "firstNonEmptyActiveCandidateView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "rowForCandidate:", v4);

  }
  else
  {
    v6 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v6;
}

- (id)secureCandidateRenderTraits
{
  __objc2_class **v3;
  void *v4;
  uint64_t v5;
  int v6;
  double Height;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double Width;
  void *v14;
  double v15;
  uint64_t v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  float v37;
  double v38;
  void *v39;
  void *v40;
  void *v42;
  void *v43;
  void *v44;
  double v45;
  void *v46;
  void *v47;
  void *v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;

  v3 = off_1E167B000;
  if ((-[UIKeyboardCandidateController activeCandidateViewType](self, "activeCandidateViewType") & 2) != 0
    || !-[UIKeyboardCandidateController activeCandidateViewType](self, "activeCandidateViewType"))
  {
    -[UIKeyboardCandidateController barState](self, "barState");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "style");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      -[UIKeyboardCandidateController barConfiguration](self, "barConfiguration");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "initialState");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "style");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
    -[UIKeyboardCandidateController bar](self, "bar");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bounds");
    Width = v12;

    -[UIKeyboardCandidateController screenTraits](self, "screenTraits");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardCandidateController rowHeightForBarForOrientation:](self, "rowHeightForBarForOrientation:", objc_msgSend(v14, "orientation"));
    Height = v15;

    -[UIKeyboardCandidateController barConfiguration](self, "barConfiguration");
    v16 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  if ((-[UIKeyboardCandidateController activeCandidateViewType](self, "activeCandidateViewType") & 1) != 0)
  {
    -[TUICandidateView state](self->_key, "state");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "style");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      -[UIKeyboardCandidateController keyConfiguration](self, "keyConfiguration");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "initialState");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "style");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
    -[TUICandidateView bounds](self->_key, "bounds");
    Width = CGRectGetWidth(v49);
    -[TUICandidateView bounds](self->_key, "bounds");
    Height = CGRectGetWidth(v50);
    objc_msgSend(v4, "rowHeight");
    if (Height >= v45)
      Height = v45;
    -[UIKeyboardCandidateController keyConfiguration](self, "keyConfiguration");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 0;
LABEL_10:
    v5 = objc_msgSend(v17, "maxNumberOfProactiveCandidates");

    if (Width != 0.0)
      goto LABEL_12;
    goto LABEL_11;
  }
  if ((-[UIKeyboardCandidateController activeCandidateViewType](self, "activeCandidateViewType") & 4) != 0)
  {
    -[UIKeyboardCandidateController inlineViewState](self, "inlineViewState");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "style");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      -[UIKeyboardCandidateController inlineConfiguration](self, "inlineConfiguration");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "initialState");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "style");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
    -[TUICandidateView bounds](self->_inlineView, "bounds");
    Width = CGRectGetWidth(v51);
    -[TUICandidateView bounds](self->_inlineView, "bounds");
    Height = CGRectGetHeight(v52);
    -[UIKeyboardCandidateController inlineConfiguration](self, "inlineConfiguration");
    v16 = objc_claimAutoreleasedReturnValue();
LABEL_9:
    v17 = (void *)v16;
    v6 = 1;
    goto LABEL_10;
  }
  v4 = 0;
  v5 = 0;
  v6 = 1;
  Height = 0.0;
LABEL_11:
  +[UIScreen mainScreen](UIScreen, "mainScreen");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "bounds");
  Width = v19;

LABEL_12:
  objc_msgSend(off_1E167A828, "systemFontOfSize:", 14.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "fontName");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = objc_alloc_init(MEMORY[0x1E0DBDC58]);
  v23 = objc_alloc(MEMORY[0x1E0DBDC60]);
  if (-[UIKeyboardCandidateController darkKeyboard](self, "darkKeyboard"))
    objc_msgSend(MEMORY[0x1E0DBDC50], "whiteColor");
  else
    objc_msgSend(MEMORY[0x1E0DBDC50], "blackColor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(v23, "initWithFontName:maxFontSize:minFontSize:textColor:", v21, v24, 17.0, 15.0);
  objc_msgSend(v22, "setHeaderTextTraits:", v25);

  objc_msgSend(v22, "headerTextTraits");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setInputTextTraits:", v26);

  if (v6)
  {
    objc_msgSend(v22, "setResultCountToSingleCellWidth:", MEMORY[0x1E0C9AA60]);
    if (Width <= 0.0)
      +[UIKeyboardPredictionCellMetrics secureCandidateEstimatedMetricsDictionary](UIKeyboardPredictionCellMetrics, "secureCandidateEstimatedMetricsDictionary");
    else
      +[UIKeyboardPredictionCellMetrics secureCandidateEstimatedMetricsDictionaryForWidth:](UIKeyboardPredictionCellMetrics, "secureCandidateEstimatedMetricsDictionaryForWidth:", Width);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setCellWidthOptions:", v35);

    objc_msgSend(v22, "cellWidthOptions");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "objectForKeyedSubscript:", *MEMORY[0x1E0DBE3A0]);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "floatValue");
    -[UIKeyboardCandidateController setSingleSlottedCellMargin:](self, "setSingleSlottedCellMargin:", (Width - v37) * 0.5);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v4, "maxNumberOfProactiveCells");
    v29 = 0;
    if (v28 <= 1)
      v30 = 1;
    else
      v30 = v28;
    v31 = v30 + 1;
    do
    {
      if (v29)
      {
        v32 = Width / (double)(int)v29;
        if (v29 == 1)
        {
          objc_msgSend(v4, "singleSlottedCellMargin");
          v32 = v32 - (v33 + v33);
        }
      }
      else
      {
        v32 = 0.0;
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v32);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "addObject:", v34);

      ++v29;
    }
    while (v31 != v29);
    objc_msgSend(v22, "setResultCountToSingleCellWidth:", v27);
    v3 = off_1E167B000;
  }

  objc_msgSend(v22, "setSingleCellHeight:", Height);
  objc_msgSend(v4, "extraCellPadding");
  objc_msgSend(v22, "setSingleCellVerticalPadding:", v38 * 0.5);
  objc_msgSend(v22, "setMaxCellCount:", v5);
  -[__objc2_class mainScreen](v3[153], "mainScreen");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "scale");
  objc_msgSend(v22, "setScreenScale:");

  -[UIKeyboardCandidateController barConfiguration](self, "barConfiguration");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setIsCandidateUI:", objc_msgSend(v40, "shouldUsePredictionViewSecureRenderTraits") ^ 1);

  return v22;
}

- (void)candidateViewDidTapArrowButton:(id)a3
{
  -[UIKeyboardCandidateController toggleCandidateView:animated:completion:](self, "toggleCandidateView:animated:completion:", a3, 1, 0);
}

- (void)toggleCandidateView:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  __CFString **v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;

  v6 = a4;
  v21 = a3;
  v8 = a5;
  -[UIKeyboardCandidateController bar](self, "bar");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9 == v21)
  {
    -[UIKeyboardCandidateController bar](self, "bar");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "state");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardCandidateController barState](self, "barState");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = UIKBAnalyticsCandidateUIDirectionOpen;
    if (v13 != v14)
      v15 = UIKBAnalyticsCandidateUIDirectionClose;
    +[UIKBAnalyticsDispatcher candidateViewExtended:direction:](UIKBAnalyticsDispatcher, "candidateViewExtended:direction:", CFSTR("Button"), *v15);

    if (-[UIKeyboardCandidateController isTextEffectsButtonPresented](self, "isTextEffectsButtonPresented"))
    {
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "delegateAsResponder");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v17, "performSelector:withObject:", sel__showTextFormattingAnimationOptions_, 0);
    }
    else
    {
      if (!-[UIKeyboardCandidateController reuseArrowButtonToExpandAssistantBarItems](self, "reuseArrowButtonToExpandAssistantBarItems")|| (-[UIKeyboardCandidateController bar](self, "bar"), v18 = (void *)objc_claimAutoreleasedReturnValue(), objc_msgSend(v18, "state"), v19 = (void *)objc_claimAutoreleasedReturnValue(), v20 = objc_msgSend(v19, "arrowButtonDirection"), v19, v18, v20 != 2))
      {
        -[UIKeyboardCandidateController toggleBarExtended](self, "toggleBarExtended");
        goto LABEL_16;
      }
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "postNotificationName:object:userInfo:", CFSTR("UIKeyboardShouldExpandAssistantBarItems"), 0, 0);
    }

  }
  else
  {
    -[UIKeyboardCandidateController inlineView](self, "inlineView");
    v10 = (id)objc_claimAutoreleasedReturnValue();

    if (v10 == v21)
    {
      -[UIKeyboardCandidateController toggleInlineViewExtendedAnimated:completion:](self, "toggleInlineViewExtendedAnimated:completion:", v6, v8);
    }
    else
    {
      -[UIKeyboardCandidateController key](self, "key");
      v11 = (id)objc_claimAutoreleasedReturnValue();

      if (v11 == v21)
        -[UIKeyboardCandidateController toggleKeyViewExtendedAnimated:completion:](self, "toggleKeyViewExtendedAnimated:completion:", v6, v8);
    }
  }
LABEL_16:

}

- (void)candidateViewDidTapInlineText:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[UIKeyboardCandidateController bar](self, "bar");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 == v10)
  {
    objc_msgSend(v10, "state");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardCandidateController extendedScrolledBarState](self, "extendedScrolledBarState");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5 != v6)
      goto LABEL_4;
    -[UIKeyboardCandidateController extendedBarState](self, "extendedBarState");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setState:animated:options:force:completion:", v7, 1, 0, 0, &__block_literal_global_87_1);

    +[UIInputViewAnimationStyle animationStyleDefault](UIInputViewAnimationStyle, "animationStyleDefault");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDontMerge:", 1);
    objc_msgSend(v4, "setExtraOptions:", 0);
    objc_msgSend((id)objc_opt_class(), "candidateViewAnimationDuration");
    objc_msgSend(v4, "setDuration:");
    +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "maximizeWithAnimationStyle:force:", v4, 1);

    objc_msgSend(v10, "state");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "yOffset");
    -[UIKeyboardCandidateController extendKeyboardBackdropHeight:](self, "extendKeyboardBackdropHeight:");

  }
LABEL_4:

}

- (void)candidateViewWillBeginDragging:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  -[UIKeyboardCandidateController bar](self, "bar");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 != v11)
    goto LABEL_2;
  objc_msgSend(v11, "state");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardCandidateController extendedBarState](self, "extendedBarState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == v6)
  {
    -[UIKeyboardCandidateController extendedScrolledBarState](self, "extendedScrolledBarState");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[UIKeyboardCandidateController extendedScrolledBarState](self, "extendedScrolledBarState");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setState:animated:options:force:completion:", v8, 1, 0, 0, &__block_literal_global_88_1);

      +[UIInputViewAnimationStyle animationStyleDefault](UIInputViewAnimationStyle, "animationStyleDefault");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setDontMerge:", 1);
      objc_msgSend(v4, "setExtraOptions:", 0);
      objc_msgSend((id)objc_opt_class(), "candidateViewAnimationDuration");
      objc_msgSend(v4, "setDuration:");
      +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "minimizeWithAnimationStyle:force:", v4, 1);

      objc_msgSend(v11, "state");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "yOffset");
      -[UIKeyboardCandidateController extendKeyboardBackdropHeight:](self, "extendKeyboardBackdropHeight:");

LABEL_2:
    }
  }

}

- (void)candidateViewSelectionDidChange:(id)a3 inGridType:(int64_t)a4
{
  void *v5;
  char v6;
  id v7;

  -[UIKeyboardCandidateController candidateListDelegate](self, "candidateListDelegate", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[UIKeyboardCandidateController candidateListDelegate](self, "candidateListDelegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "candidateListSelectionDidChange:", self);

  }
}

- (void)candidateViewNeedsToExpand:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  -[UIKeyboardCandidateController inlineView](self, "inlineView");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __60__UIKeyboardCandidateController_candidateViewNeedsToExpand___block_invoke;
    v6[3] = &unk_1E16B3FD8;
    v7 = v4;
    -[UIKeyboardCandidateController toggleInlineViewExtendedAnimated:completion:](self, "toggleInlineViewExtendedAnimated:completion:", 1, v6);

  }
}

void __60__UIKeyboardCandidateController_candidateViewNeedsToExpand___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "selectedIndexPath");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setSelectedIndexPath:animated:scrollPosition:", v2, 0, 0);

}

- (void)candidateView:(id)a3 didAcceptCandidate:(id)a4 atIndexPath:(id)a5 inGridType:(int64_t)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;

  v10 = a5;
  v11 = a4;
  v13 = a3;
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "updateIdleDetection:", 0);

  -[UIKeyboardCandidateController candidateView:didAcceptCandidate:atIndexPath:inGridType:generateFeedback:](self, "candidateView:didAcceptCandidate:atIndexPath:inGridType:generateFeedback:", v13, v11, v10, a6, 1);
}

- (void)candidateView:(id)a3 didAcceptCandidate:(id)a4 atIndexPath:(id)a5 inGridType:(int64_t)a6 generateFeedback:(BOOL)a7
{
  _BOOL4 v7;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  id v13;

  v7 = a7;
  -[UIKeyboardCandidateController setCurrentCandidate:](self, "setCurrentCandidate:", a4);
  -[UIKeyboardCandidateController candidateListDelegate](self, "candidateListDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    -[UIKeyboardCandidateController candidateListDelegate](self, "candidateListDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "candidateListAcceptCandidate:", self);

  }
  if (v7)
  {
    if (-[UIKBScreenTraits idiom](self->_screenTraits, "idiom") == 3)
    {
      +[UIDevice currentDevice](UIDevice, "currentDevice");
      v13 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "_playSystemSound:", 1123);
    }
    else
    {
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v13 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "feedbackGenerator");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "actionOccurred:", 10);

    }
  }
}

- (void)dimKeys:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  -[UIKeyboardCandidateController opacities](self, "opacities");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqual:", v6);

  if ((v5 & 1) == 0)
  {
    -[UIKeyboardCandidateController setOpacities:](self, "setOpacities:", v6);
    -[UIKeyboardCandidateController updateStates](self, "updateStates");
  }

}

- (id)obtainHideDisambiguationCandidatesAssertionForReason:(id)a3
{
  return -[_UIAssertionController vendAssertionOfType:initialState:reason:requiresExplicitInvalidation:](self->_assertionController, "vendAssertionOfType:initialState:reason:requiresExplicitInvalidation:", 0, 1, a3, 1);
}

- (BOOL)assertionActivationStateForType:(unint64_t)a3
{
  return !a3 && -[UIKeyboardCandidateController hideDisambiguationCandidates](self, "hideDisambiguationCandidates");
}

- (void)assertionActivationStateChangedToState:(BOOL)a3 forType:(unint64_t)a4
{
  if (!a4)
    -[UIKeyboardCandidateController setHideDisambiguationCandidates:](self, "setHideDisambiguationCandidates:", a3);
}

- (void)setInlineRectIsVertical:(BOOL)a3
{
  self->_inlineRectIsVertical = a3;
  -[UIKeyboardCandidateSceneHostingController setHostIsTextVertical:](self->_hostingController, "setHostIsTextVertical:");
}

- (UIView)hostingParentView
{
  return self->_hostedInlineViewContainer;
}

- (BOOL)hostTextIsVertical
{
  void *v2;
  char v3;

  -[UIKeyboardCandidateController inlineViewContainer](self, "inlineViewContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "inlineRectIsVertical");

  return v3;
}

- (void)clientStateChangedWithIsExpanded:(BOOL)a3 isVisible:(BOOL)a4
{
  _BOOL8 v4;

  v4 = a3;
  -[UIKeyboardCandidateController clientVisibilityChanged:](self, "clientVisibilityChanged:", a4);
  -[UIKeyboardCandidateController clientExpandedStateChanged:](self, "clientExpandedStateChanged:", v4);
}

- (void)clientExpandedStateChanged:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  float v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  double v30;
  float v31;
  void *v32;
  void *v33;
  int v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  double v45;
  double v46;
  void *v47;
  id v48;

  v3 = a3;
  -[UIKeyboardCandidateController inlineViewState](self, "inlineViewState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardCandidateController inlineConfiguration](self, "inlineConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v3)
  {
    objc_msgSend(v6, "initialState");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5 == v28)
      return;
    -[UIKeyboardCandidateController inlineViewState](self, "inlineViewState");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "yOffset");
    v31 = v30;

    -[UIKeyboardCandidateController inlineViewContainer](self, "inlineViewContainer");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v32, "shouldExtendUpwards"))
    {
      -[UIKeyboardCandidateController inlineViewContainer](self, "inlineViewContainer");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "position");

      if (v34 != 1)
      {
LABEL_11:
        -[UIView frame](self->_inlineViewContainer, "frame");
        v37 = v36;
        v39 = v38;
        v41 = v40;
        v43 = v42 - v31;
        -[UIKeyboardCandidateController inlineViewState](self, "inlineViewState");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "additionalHeight");
        v46 = v41 - v45;

        -[UIView setFrame:](self->_inlineViewContainer, "setFrame:", v37, v43, v39, v46);
        -[UIKeyboardCandidateController inlineConfiguration](self, "inlineConfiguration");
        v48 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "initialState");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIKeyboardCandidateController setInlineViewState:](self, "setInlineViewState:", v47);

        return;
      }
      -[UIKeyboardCandidateController inlineViewState](self, "inlineViewState");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "additionalHeight");
      v31 = v31 - v35;
    }

    goto LABEL_11;
  }
  objc_msgSend(v6, "extendedState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 != v8)
  {
    -[UIKeyboardCandidateController inlineConfiguration](self, "inlineConfiguration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "extendedState");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardCandidateController setInlineViewState:](self, "setInlineViewState:", v10);

    -[UIKeyboardCandidateController inlineViewState](self, "inlineViewState");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "yOffset");
    v13 = v12;

    -[UIKeyboardCandidateController inlineViewContainer](self, "inlineViewContainer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v10) = objc_msgSend(v14, "shouldExtendUpwards");

    if ((_DWORD)v10)
    {
      -[UIKeyboardCandidateController inlineViewState](self, "inlineViewState");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "additionalHeight");
      v13 = v13 - v16;

    }
    -[UIView frame](self->_inlineViewContainer, "frame");
    v18 = v17;
    v20 = v19;
    v22 = v21;
    v24 = v23 + v13;
    -[UIKeyboardCandidateController inlineViewState](self, "inlineViewState");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "additionalHeight");
    v27 = v22 + v26;

    -[UIView setFrame:](self->_inlineViewContainer, "setFrame:", v18, v24, v20, v27);
  }
}

- (void)clientVisibilityChanged:(BOOL)a3
{
  -[UIView setHidden:](self->_inlineViewContainer, "setHidden:", !a3);
}

- (void)hostedInlineFloatingViewFrameUpdated
{
  void *v3;
  void *v4;
  id v5;

  -[UIKeyboardCandidateController inlineView](self, "inlineView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardCandidateController inlineView](self, "inlineView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "state");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setState:animated:options:force:completion:", v4, 0, 0, 1, 0);

}

- (void)hostedInlineFloatingViewIsTextVerticalUpdated:(BOOL)a3
{
  void *v4;
  void *v5;
  id v6;

  -[UIKeyboardCandidateController updateStates](self, "updateStates", a3);
  -[UIKeyboardCandidateController inlineView](self, "inlineView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardCandidateController inlineView](self, "inlineView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "state");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setState:animated:options:force:completion:", v5, 0, 0, 1, 0);

}

- (UIKeyboardCandidateControllerDelegate)delegate
{
  return (UIKeyboardCandidateControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (TIKeyboardCandidateResultSet)candidateResultSet
{
  return self->_candidateResultSet;
}

- (NSString)inlineText
{
  return self->_inlineText;
}

- (CGRect)inlineRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_inlineRect.origin.x;
  y = self->_inlineRect.origin.y;
  width = self->_inlineRect.size.width;
  height = self->_inlineRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setInlineRect:(CGRect)a3
{
  self->_inlineRect = a3;
}

- (BOOL)adjustForLeftHandBias
{
  return self->_adjustForLeftHandBias;
}

- (void)setAdjustForLeftHandBias:(BOOL)a3
{
  self->_adjustForLeftHandBias = a3;
}

- (BOOL)reuseArrowButtonToExpandAssistantBarItems
{
  return self->_reuseArrowButtonToExpandAssistantBarItems;
}

- (double)splitGap
{
  return self->_splitGap;
}

- (void)setSplitGap:(double)a3
{
  self->_splitGap = a3;
}

- (UIKeyboardCandidateListDelegate)candidateListDelegate
{
  return (UIKeyboardCandidateListDelegate *)objc_loadWeakRetained((id *)&self->_candidateListDelegate);
}

- (void)setCandidateListDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_candidateListDelegate, a3);
}

- (void)setBar:(id)a3
{
  objc_storeStrong((id *)&self->_bar, a3);
}

- (TUICandidateView)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
  objc_storeStrong((id *)&self->_key, a3);
}

- (TUICandidateView)inlineView
{
  return self->_inlineView;
}

- (void)setInlineView:(id)a3
{
  objc_storeStrong((id *)&self->_inlineView, a3);
}

- (UIKeyboardCandidateInlineFloatingView)inlineViewContainer
{
  return self->_inlineViewContainer;
}

- (void)setInlineViewContainer:(id)a3
{
  objc_storeStrong((id *)&self->_inlineViewContainer, a3);
}

- (UIView)hostedInlineViewContainer
{
  return self->_hostedInlineViewContainer;
}

- (void)setHostedInlineViewContainer:(id)a3
{
  objc_storeStrong((id *)&self->_hostedInlineViewContainer, a3);
}

- (NSMutableArray)activeViews
{
  return self->_activeViews;
}

- (void)setActiveViews:(id)a3
{
  objc_storeStrong((id *)&self->_activeViews, a3);
}

- (void)setKeyConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_keyConfiguration, a3);
}

- (UIKeyboardCandidateViewState)barState
{
  return self->_barState;
}

- (void)setBarState:(id)a3
{
  objc_storeStrong((id *)&self->_barState, a3);
}

- (UIKeyboardCandidateViewState)extendedBarState
{
  return self->_extendedBarState;
}

- (void)setExtendedBarState:(id)a3
{
  objc_storeStrong((id *)&self->_extendedBarState, a3);
}

- (UIKeyboardCandidateViewState)extendedScrolledBarState
{
  return self->_extendedScrolledBarState;
}

- (void)setExtendedScrolledBarState:(id)a3
{
  objc_storeStrong((id *)&self->_extendedScrolledBarState, a3);
}

- (UIKeyboardCandidateViewState)inlineViewState
{
  return self->_inlineViewState;
}

- (void)setInlineViewState:(id)a3
{
  objc_storeStrong((id *)&self->_inlineViewState, a3);
}

- (UIKeyboardCandidateViewState)extendedInlineViewState
{
  return self->_extendedInlineViewState;
}

- (void)setExtendedInlineViewState:(id)a3
{
  objc_storeStrong((id *)&self->_extendedInlineViewState, a3);
}

- (UIKeyboardCandidateViewState)keyState
{
  return self->_keyState;
}

- (void)setKeyState:(id)a3
{
  objc_storeStrong((id *)&self->_keyState, a3);
}

- (UIKeyboardCandidateViewState)extendedKeyState
{
  return self->_extendedKeyState;
}

- (void)setExtendedKeyState:(id)a3
{
  objc_storeStrong((id *)&self->_extendedKeyState, a3);
}

- (double)additionalExtendedBarBackdropOffset
{
  return self->_additionalExtendedBarBackdropOffset;
}

- (void)setAdditionalExtendedBarBackdropOffset:(double)a3
{
  self->_additionalExtendedBarBackdropOffset = a3;
}

- (void)setCurrentCandidate:(id)a3
{
  objc_storeStrong((id *)&self->_currentCandidate, a3);
}

- (void)setDarkKeyboard:(BOOL)a3
{
  self->_darkKeyboard = a3;
}

- (BOOL)darkKeyboardChanged
{
  return self->_darkKeyboardChanged;
}

- (void)setDarkKeyboardChanged:(BOOL)a3
{
  self->_darkKeyboardChanged = a3;
}

- (NSDictionary)opacities
{
  return self->_opacities;
}

- (void)setOpacities:(id)a3
{
  objc_storeStrong((id *)&self->_opacities, a3);
}

- (double)singleSlottedCellMargin
{
  return self->_singleSlottedCellMargin;
}

- (void)setSingleSlottedCellMargin:(double)a3
{
  self->_singleSlottedCellMargin = a3;
}

- (UIPanGestureRecognizer)panGestureRecognizer
{
  return self->_panGestureRecognizer;
}

- (void)setPanGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_panGestureRecognizer, a3);
}

- (UIViewPropertyAnimator)animator
{
  return self->_animator;
}

- (void)setAnimator:(id)a3
{
  objc_storeStrong((id *)&self->_animator, a3);
}

- (UIKBRenderConfig)renderConfig
{
  return self->_renderConfig;
}

- (void)setRenderConfig:(id)a3
{
  objc_storeStrong((id *)&self->_renderConfig, a3);
}

- (UIKeyboardCandidateSceneHostingController)hostingController
{
  return self->_hostingController;
}

- (void)setHostingController:(id)a3
{
  objc_storeStrong((id *)&self->_hostingController, a3);
}

- (BOOL)hideDisambiguationCandidates
{
  return self->_hideDisambiguationCandidates;
}

- (BOOL)isTextEffectsButtonPresented
{
  return self->_isTextEffectsButtonPresented;
}

- (void)setIsTextEffectsButtonPresented:(BOOL)a3
{
  self->_isTextEffectsButtonPresented = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostingController, 0);
  objc_storeStrong((id *)&self->_renderConfig, 0);
  objc_storeStrong((id *)&self->_animator, 0);
  objc_storeStrong((id *)&self->_panGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_opacities, 0);
  objc_storeStrong((id *)&self->_currentCandidate, 0);
  objc_storeStrong((id *)&self->_extendedKeyState, 0);
  objc_storeStrong((id *)&self->_keyState, 0);
  objc_storeStrong((id *)&self->_extendedInlineViewState, 0);
  objc_storeStrong((id *)&self->_inlineViewState, 0);
  objc_storeStrong((id *)&self->_extendedScrolledBarState, 0);
  objc_storeStrong((id *)&self->_extendedBarState, 0);
  objc_storeStrong((id *)&self->_barState, 0);
  objc_storeStrong((id *)&self->_keyConfiguration, 0);
  objc_storeStrong((id *)&self->_inlineConfiguration, 0);
  objc_storeStrong((id *)&self->_barConfiguration, 0);
  objc_storeStrong((id *)&self->_activeViews, 0);
  objc_storeStrong((id *)&self->_hostedInlineViewContainer, 0);
  objc_storeStrong((id *)&self->_inlineViewContainer, 0);
  objc_storeStrong((id *)&self->_inlineView, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_bar, 0);
  objc_destroyWeak((id *)&self->_candidateListDelegate);
  objc_storeStrong((id *)&self->_screenTraits, 0);
  objc_storeStrong((id *)&self->_inlineText, 0);
  objc_storeStrong((id *)&self->_candidateResultSet, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_assertionController, 0);
}

@end
