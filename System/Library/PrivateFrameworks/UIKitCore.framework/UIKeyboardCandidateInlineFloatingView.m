@implementation UIKeyboardCandidateInlineFloatingView

- (UIKeyboardCandidateInlineFloatingView)initWithFrame:(CGRect)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  UIKeyboardCandidateInlineFloatingView *v8;
  UIKeyboardCandidateInlineFloatingView *v9;
  void *v10;
  objc_super v12;

  v4 = *MEMORY[0x1E0C9D538];
  v5 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  -[UIView size](self, "size", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v12.receiver = self;
  v12.super_class = (Class)UIKeyboardCandidateInlineFloatingView;
  v8 = -[UIView initWithFrame:](&v12, sel_initWithFrame_, v4, v5, v6, v7);
  v9 = v8;
  if (v8)
  {
    -[UIView setOpaque:](v8, "setOpaque:", 0);
    -[UIView layer](v9, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setMasksToBounds:", 0);

    v9->_tewObserverIsSet = 0;
  }
  return v9;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  if (self->_tewObserverIsSet)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView window](self, "window");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:name:object:", self, 0x1E1779FA0, v4);

  }
  v5.receiver = self;
  v5.super_class = (Class)UIKeyboardCandidateInlineFloatingView;
  -[UIView dealloc](&v5, sel_dealloc);
}

- (CGRect)adjustedInlineRectFromInlineText:(id)a3 inlineRect:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGRect result;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3;
  -[UIView superview](self, "superview");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = AutocorrectAdjustedInlineRect(v9, v10, x, y, width, height);
  v13 = v12;
  v15 = v14;
  v17 = v16;

  v18 = v11;
  v19 = v13;
  v20 = v15;
  v21 = v17;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (BOOL)isAcceptableFrame:(CGRect)a3 afterScrollBy:(double)a4
{
  CGFloat width;
  double y;
  CGFloat x;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  _BOOL4 v36;
  double v37;
  double v38;
  double v39;
  double v40;
  CGFloat v41;
  double v42;
  CGFloat v43;
  double v44;
  CGFloat v45;
  void *v46;
  double v47;
  CGFloat v48;
  double v49;
  CGFloat v50;
  double v51;
  CGFloat v52;
  double v53;
  CGFloat v54;
  _BOOL4 v55;
  void *v56;
  CGFloat v57;
  CGFloat v58;
  CGFloat v59;
  CGFloat v60;
  CGFloat v61;
  CGFloat v62;
  CGFloat v63;
  CGFloat v64;
  BOOL v65;
  BOOL v66;
  _BOOL4 v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  double v73;
  CGFloat v74;
  double v75;
  CGFloat v76;
  double v77;
  CGFloat v78;
  double v79;
  CGFloat v80;
  void *v81;
  double v82;
  CGFloat v83;
  double v84;
  CGFloat v85;
  double v86;
  CGFloat v87;
  double v88;
  CGFloat v89;
  void *v90;
  void *v91;
  void *v92;
  double v93;
  void *v94;
  double v95;
  double v96;
  double v97;
  double v98;
  void *v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  double v105;
  BOOL v106;
  void *v107;
  CGFloat v108;
  CGFloat v109;
  CGFloat v110;
  CGFloat v111;
  BOOL v112;
  CGFloat v114;
  CGFloat height;
  CGFloat v116;
  CGRect v117;
  CGRect v118;
  CGRect v119;
  CGRect v120;
  CGRect v121;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UIView superview](self, "superview");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = y - a4;
  objc_msgSend(v9, "bounds");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  -[UIView superview](self, "superview");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "safeAreaInsets");
  v21 = v12 + v20;
  v23 = v14 + v22;
  v25 = v16 - (v20 + v24);
  v27 = v18 - (v22 + v26);

  -[UIKeyboardCandidateInlineFloatingView extraInsets](self, "extraInsets");
  v29 = v21 + v28;
  v31 = v23 + v30;
  v33 = v25 - (v28 + v32);
  v35 = v27 - (v30 + v34);
  v36 = -[UIKeyboardCandidateInlineFloatingView inlineRectIsVertical](self, "inlineRectIsVertical");
  v37 = v29;
  v38 = v31;
  v39 = v33;
  v40 = v35;
  v41 = x;
  v42 = v10;
  v43 = width;
  if (v36)
  {
    v44 = height;
    v45 = height;
    if (!CGRectContainsRect(*(CGRect *)&v37, *(CGRect *)&v41))
      goto LABEL_7;
  }
  else
  {
    v44 = height;
    if (!_CGRectContainsRectVertically(v29, v31, v33, v35, x, v10, width, height))
    {
LABEL_7:
      v66 = 0;
      goto LABEL_17;
    }
  }
  -[UIView window](self, "window");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "convertRect:toView:", v46, x, v10, width, v44);
  v48 = v47;
  v50 = v49;
  v52 = v51;
  v54 = v53;

  v55 = -[UIKeyboardCandidateInlineFloatingView inlineRectIsVertical](self, "inlineRectIsVertical");
  -[UIView window](self, "window");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "bounds");
  v61 = v48;
  v62 = v50;
  v63 = v52;
  v64 = v54;
  if (v55)
  {
    v65 = CGRectContainsRect(*(CGRect *)&v57, *(CGRect *)&v61);

    if (!v65)
      goto LABEL_7;
  }
  else
  {
    v67 = _CGRectContainsRectVertically(v57, v58, v59, v60, v48, v50, v52, v54);

    if (!v67)
      goto LABEL_7;
  }
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "_window");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "screen");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView _window](self, "_window");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "screen");
  v72 = (void *)objc_claimAutoreleasedReturnValue();

  if (v70 != v72)
    goto LABEL_15;
  objc_msgSend(v9, "_convertViewPointToSceneSpaceForKeyboard:", x, v10, width, v44);
  v74 = v73;
  v76 = v75;
  v78 = v77;
  v80 = v79;
  objc_msgSend(v68, "superview");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "frame");
  objc_msgSend(v81, "_convertViewPointToSceneSpaceForKeyboard:");
  v83 = v82;
  v85 = v84;
  v87 = v86;
  v89 = v88;

  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "inputViews");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "inputAccessoryView");
  v92 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v92, "size");
  if (v93 > 0.0)
  {
    objc_msgSend(v92, "window");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "windowLevel");
    v114 = v89;
    v116 = v85;
    v95 = v78;
    v96 = v74;
    v98 = v97;
    -[UIView window](self, "window");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "windowLevel");
    v100 = v83;
    v101 = v87;
    v102 = v80;
    v103 = v76;
    v105 = v104;

    v106 = v98 <= v105;
    v76 = v103;
    v80 = v102;
    v87 = v101;
    v83 = v100;
    v74 = v96;
    v78 = v95;
    v89 = v114;
    v85 = v116;
    if (!v106)
    {
      objc_msgSend(v92, "superview");
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v92, "frame");
      objc_msgSend(v107, "_convertViewPointToSceneSpaceForKeyboard:");
      v120.origin.x = v108;
      v120.origin.y = v109;
      v120.size.width = v110;
      v120.size.height = v111;
      v117.origin.x = v83;
      v117.origin.y = v116;
      v117.size.width = v87;
      v117.size.height = v114;
      v118 = CGRectUnion(v117, v120);
      v83 = v118.origin.x;
      v85 = v118.origin.y;
      v87 = v118.size.width;
      v89 = v118.size.height;

    }
  }
  v119.origin.x = v74;
  v119.origin.y = v76;
  v119.size.width = v78;
  v119.size.height = v80;
  v121.origin.x = v83;
  v121.origin.y = v85;
  v121.size.width = v87;
  v121.size.height = v89;
  v112 = CGRectIntersectsRect(v119, v121);

  if (v112)
    v66 = 0;
  else
LABEL_15:
    v66 = 1;

LABEL_17:
  return v66;
}

- (CGRect)adjustedFrameFromDesiredFrame:(CGRect)a3 textHeight:(double)a4
{
  double height;
  double width;
  double y;
  double x;
  double v9;
  double v10;
  _BOOL8 v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double MinY;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  CGFloat rect;
  double recta;
  CGFloat v39;
  double v40;
  CGFloat v41;
  double v42;
  CGRect v43;
  CGRect v44;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a3.origin.y + a4;
  -[UIKeyboardCandidateInlineFloatingView extendedStateAdditionalHeight](self, "extendedStateAdditionalHeight");
  if (-[UIKeyboardCandidateInlineFloatingView isAcceptableFrame:afterScrollBy:](self, "isAcceptableFrame:afterScrollBy:", x, v9, width, height + v10, 0.0))
  {
    v11 = 0;
  }
  else
  {
    v12 = y - height + -9.0;
    if (-[UIKeyboardCandidateInlineFloatingView isAcceptableFrame:afterScrollBy:](self, "isAcceptableFrame:afterScrollBy:", x, v12, width, height, 0.0))
    {
      goto LABEL_14;
    }
    v13 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v39 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v41 = *MEMORY[0x1E0C9D648];
    rect = *(double *)(MEMORY[0x1E0C9D648] + 24);
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "inputDelegateManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "keyInputDelegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      while (1)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          break;
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v16, "visibleTextRect");
          v19 = v18;
          v40 = v21;
          v42 = v20;
          recta = v22;
          -[UIView superview](self, "superview");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "convertRect:toView:", v23, v19, v42, v40, recta);
          v39 = v25;
          v41 = v24;
          v13 = v26;
          rect = v27;

          break;
        }
        objc_msgSend(v16, "superview");
        v17 = objc_claimAutoreleasedReturnValue();

        v16 = (void *)v17;
        if (!v17)
          goto LABEL_11;
      }

    }
LABEL_11:
    if (v13 > 0.0)
    {
      v43.size.width = v39;
      v43.origin.x = v41;
      v43.origin.y = v13;
      v43.size.height = rect;
      MinY = CGRectGetMinY(v43);
      v44.origin.x = x;
      v44.origin.y = y - height;
      v44.size.width = width;
      v44.size.height = height;
      v12 = MinY - CGRectGetHeight(v44) + -9.0;
    }
    if (-[UIKeyboardCandidateInlineFloatingView isAcceptableFrame:afterScrollBy:](self, "isAcceptableFrame:afterScrollBy:", x, v12, width, height, 0.0))
    {
LABEL_14:
      v11 = 1;
      v9 = v12;
    }
    else
    {
      -[UIView superview](self, "superview");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "frame");
      v32 = (v30 + v31) * 0.5;

      v11 = y >= v32;
      if (y >= v32)
        v9 = v12;
    }
  }
  -[UIKeyboardCandidateInlineFloatingView setPosition:](self, "setPosition:", v11);
  v33 = x;
  v34 = v9;
  v35 = width;
  v36 = height;
  result.size.height = v36;
  result.size.width = v35;
  result.origin.y = v34;
  result.origin.x = v33;
  return result;
}

- (CGRect)adjustedFrameFromDesiredFrame:(CGRect)a3 textWidth:(double)a4
{
  double height;
  double width;
  double y;
  double x;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  _BOOL4 v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CGRect v29;
  CGRect result;
  CGRect v31;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UIKeyboardCandidateInlineFloatingView extendedStateAdditionalHeight](self, "extendedStateAdditionalHeight", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4);
  v10 = height + v9;
  if (-[UIKeyboardCandidateInlineFloatingView isAcceptableFrame:afterScrollBy:](self, "isAcceptableFrame:afterScrollBy:", x, y, width, height + v9, 0.0)&& (-[UIKeyboardCandidateInlineFloatingView inlineRect](self, "inlineRect"), v31.origin.x = x, v31.origin.y = y, v31.size.width = width, v31.size.height = v10, !CGRectIntersectsRect(v29, v31)))
  {
    v14 = 2;
  }
  else
  {
    -[UIKeyboardCandidateInlineFloatingView inlineRect](self, "inlineRect");
    v13 = v11 + v12 - height;
    if (-[UIKeyboardCandidateInlineFloatingView isAcceptableFrame:afterScrollBy:](self, "isAcceptableFrame:afterScrollBy:", x, v13, width, height, 0.0))
    {
      v14 = 1;
      y = v13;
    }
    else
    {
      -[UIKeyboardCandidateInlineFloatingView inlineRect](self, "inlineRect");
      v17 = v15 + v16;
      if (-[UIKeyboardCandidateInlineFloatingView isAcceptableFrame:afterScrollBy:](self, "isAcceptableFrame:afterScrollBy:", v15 + v16, y, width, height, 0.0))
      {
        v14 = 3;
        x = v17;
      }
      else
      {
        -[UIKeyboardCandidateInlineFloatingView inlineRect](self, "inlineRect");
        v20 = v18 + v19;
        -[UIKeyboardCandidateInlineFloatingView inlineRect](self, "inlineRect");
        v23 = v21 + v22 - height;
        v24 = -[UIKeyboardCandidateInlineFloatingView isAcceptableFrame:afterScrollBy:](self, "isAcceptableFrame:afterScrollBy:", v20, v23, width, height, 0.0);
        if (v24)
          v14 = 1;
        else
          v14 = 2;
        if (v24)
        {
          x = v20;
          y = v23;
        }
      }
    }
  }
  -[UIKeyboardCandidateInlineFloatingView setPosition:](self, "setPosition:", v14);
  v25 = x;
  v26 = y;
  v27 = width;
  v28 = height;
  result.size.height = v28;
  result.size.width = v27;
  result.origin.y = v26;
  result.origin.x = v25;
  return result;
}

- (void)adjustFrameForInlineText:(id)a3 inlineRect:(CGRect)a4 maxX:(double)a5
{
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  _BOOL4 v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  double v40;
  double x;
  double v42;
  double v43;
  double v44;
  double width;
  double v46;
  double height;
  void *v48;
  int v49;
  void *v50;
  void *v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  void *v60;
  double v61;
  CGFloat v62;
  double v63;
  CGFloat v64;
  double v65;
  CGFloat v66;
  double v67;
  CGFloat v68;
  CGFloat y;
  uint64_t v70;
  double v71;
  uint64_t v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double MaxX;
  double v84;
  _BOOL4 v85;
  _BOOL4 v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  uint64_t v95;
  uint64_t rect;
  double rect_8;
  double rect_16;
  double rect_24;
  double v100;
  CGRect v101;
  CGRect v102;
  CGRect v103;
  CGRect v104;
  CGRect v105;
  CGRect v106;
  CGRect v107;

  self->_reducedWidth = 0;
  -[UIKeyboardCandidateInlineFloatingView adjustedInlineRectFromInlineText:inlineRect:](self, "adjustedInlineRectFromInlineText:inlineRect:", a3, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  v8 = v7;
  v10 = v9;
  rect_24 = v11;
  v100 = v12;
  -[UIView frame](self, "frame");
  v95 = v14;
  rect = v13;
  -[UIKeyboardCandidateInlineFloatingView preferredSize](self, "preferredSize");
  v16 = v15;
  v18 = v17;
  rect_8 = a5;
  rect_16 = v8;
  if (-[UIKeyboardCandidateInlineFloatingView adjustMode](self, "adjustMode") == 1)
  {
    v20 = -[UIKeyboardCandidateInlineFloatingView inlineRectIsVertical](self, "inlineRectIsVertical");
    -[UIKeyboardCandidateInlineFloatingView cellPadding](self, "cellPadding");
    v22 = v21;
    v24 = v23;
    -[UIKeyboardCandidateInlineFloatingView cellPadding](self, "cellPadding");
    v27 = rect_24;
    v28 = v100;
    if (v16 >= rect_24)
      v27 = v16;
    v19 = v27 + v24 + v26;
    if (v18 >= v100)
      v28 = v18;
    v29 = v28 + v22 + v25;
    if (v20)
      v18 = v29;
    v94 = v18;
    if (!v20)
      v16 = v19;
  }
  else
  {
    v94 = v18;
  }
  -[UIView superview](self, "superview", v19);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "bounds");
  v32 = v31;
  v34 = v33;
  v36 = v35;
  v38 = v37;

  -[UIView superview](self, "superview");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "safeAreaInsets");
  x = v32 + v40;
  v43 = v34 + v42;
  width = v36 - (v40 + v44);
  height = v38 - (v42 + v46);

  -[UIView window](self, "window");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = objc_msgSend(v48, "_isTextEffectsWindow");

  if (v49)
  {
    -[UIView superview](self, "superview");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView window](self, "window");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "actualSceneBounds");
    v53 = v52;
    v55 = v54;
    v92 = v16;
    v93 = v10;
    v57 = v56;
    v59 = v58;
    -[UIView window](self, "window");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "convertRect:fromView:", v60, v53, v55, v57, v59);
    v62 = v61;
    v64 = v63;
    v66 = v65;
    v68 = v67;

    v101.origin.x = v62;
    v101.origin.y = v64;
    v101.size.width = v66;
    v16 = v92;
    v10 = v93;
    v101.size.height = v68;
    v107.origin.x = x;
    v107.origin.y = v43;
    v107.size.width = width;
    v107.size.height = height;
    v102 = CGRectIntersection(v101, v107);
    x = v102.origin.x;
    y = v102.origin.y;
    width = v102.size.width;
    height = v102.size.height;
    v71 = v94;
    v70 = v95;
    v72 = rect;
  }
  else
  {
    v71 = v94;
    v70 = v95;
    v72 = rect;
    y = v43;
  }
  v73 = v16;
  v74 = v71;
  v75 = v16;
  v76 = v71;
  v77 = CGRectGetWidth(*(CGRect *)&v72);
  v103.origin.x = x;
  v103.origin.y = y;
  v103.size.width = width;
  v103.size.height = height;
  if (v77 <= CGRectGetWidth(v103))
  {
    v79 = v76;
    v82 = rect_8;
    v81 = rect_16;
  }
  else
  {
    self->_reducedWidth = 1;
    -[UIKeyboardCandidateInlineFloatingView preferredSize](self, "preferredSize");
    v79 = v78;
    v104.origin.x = x;
    v104.origin.y = y;
    v104.size.width = width;
    v104.size.height = height;
    v80 = CGRectGetWidth(v104);
    v82 = rect_8;
    v81 = rect_16;
    if (v80 <= rect_8)
      v82 = v80;
    v75 = 312.0;
  }
  v105.origin.x = v81;
  v105.origin.y = v10;
  v105.size.width = v75;
  v105.size.height = v79;
  MaxX = CGRectGetMaxX(v105);
  if (MaxX >= v82)
  {
    v84 = v81 - (MaxX - v82);
    if (v75 < v82)
    {
      if (v82 - v75 > 1.0)
        v84 = v84 + -1.0;
      if (v82 - v75 > 2.0)
        v84 = v84 + -1.0;
    }
    v85 = -[UIKeyboardCandidateInlineFloatingView inlineRectIsVertical](self, "inlineRectIsVertical");
    if (v84 < 0.0 && !v85)
      v84 = 0.0;
  }
  else
  {
    v106.origin.x = v81;
    v106.origin.y = v10;
    v106.size.width = v75;
    v106.size.height = v79;
    v84 = v81;
    if (CGRectGetMinX(v106) < 3.0)
      v84 = 3.0;
  }
  v87 = -[UIKeyboardCandidateInlineFloatingView inlineRectIsVertical](self, "inlineRectIsVertical");
  v88 = v81;
  v89 = v10;
  v90 = rect_24;
  v91 = v100;
  if (v87)
    -[UIKeyboardCandidateInlineFloatingView adjustedFrameFromDesiredFrame:textWidth:](self, "adjustedFrameFromDesiredFrame:textWidth:", v84, v10, v75, v79, CGRectGetWidth(*(CGRect *)&v88));
  else
    -[UIKeyboardCandidateInlineFloatingView adjustedFrameFromDesiredFrame:textHeight:](self, "adjustedFrameFromDesiredFrame:textHeight:", v84, v10, v75, v79, CGRectGetHeight(*(CGRect *)&v88));
  -[UIView setFrame:](self, "setFrame:");
}

- (BOOL)shouldExtendUpwards
{
  void *v3;
  int v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  CGFloat v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;

  -[UIView superview](self, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = -[UIKeyboardCandidateInlineFloatingView position](self, "position");
    if (v4 != 1)
    {
      -[UIView frame](self, "frame");
      v6 = v5;
      v8 = v7;
      v10 = v9;
      v12 = v11;
      -[UIKeyboardCandidateInlineFloatingView extendedStateAdditionalHeight](self, "extendedStateAdditionalHeight");
      v14 = v13 + v12;
      -[UIView superview](self, "superview");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "bounds");
      v17 = v16;
      v19 = v18;
      v21 = v20;
      v23 = v22;

      -[UIView superview](self, "superview");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "safeAreaInsets");
      v26 = v17 + v25;
      v28 = v19 + v27;
      v30 = v21 - (v25 + v29);
      v32 = v23 - (v27 + v31);

      LOBYTE(v4) = !_CGRectContainsRectVertically(v26, v28, v30, v32, v6, v8, v10, v14);
    }
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (void)setInlineText:(id)a3 inlineRect:(CGRect)a4 maxX:(double)a5 layout:(BOOL)a6
{
  double height;
  double width;
  double y;
  double x;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  CGFloat v29;
  double v30;
  double v31;
  double v32;
  CGFloat v33;
  double v34;
  double v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  CGFloat v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  double v55;
  CGFloat v56;
  double v57;
  CGFloat v58;
  double v59;
  CGFloat v60;
  double v61;
  CGFloat v62;
  CGFloat v63;
  CGFloat v64;
  CGFloat v65;
  CGFloat v66;
  BOOL v67;
  id v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  void *v77;
  double v78;
  double v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  id v93;
  CGRect v94;
  CGRect v95;
  CGRect v96;
  CGRect v97;
  CGRect v98;
  CGRect v99;
  CGRect v100;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  -[UIKeyboardCandidateInlineFloatingView setInlineText:](self, "setInlineText:", a3, a6);
  -[UIKeyboardCandidateInlineFloatingView setInlineRect:](self, "setInlineRect:", x, y, width, height);
  -[UIKeyboardCandidateInlineFloatingView setMaxX:](self, "setMaxX:", a5);
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "inputOverlayContainer");
  v93 = (id)objc_claimAutoreleasedReturnValue();

  -[UIView superview](self, "superview");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v93, "bringSubviewToFront:", self);
  }
  else
  {
    objc_msgSend(v93, "addSubview:", self);
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "inputDelegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "textInputView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "_convertVisualAltitude:toView:", self, 0.0);
    -[UIView _setVisualAltitude:](self, "_setVisualAltitude:");

  }
  if (-[UIKeyboardCandidateInlineFloatingView inlineRectIsVertical](self, "inlineRectIsVertical"))
  {
    -[UIKeyboardCandidateInlineFloatingView inlineRect](self, "inlineRect");
    -[UIKeyboardCandidateInlineFloatingView setMaxX:](self, "setMaxX:", CGRectGetMinX(v94));
    -[UIKeyboardCandidateInlineFloatingView inlineRect](self, "inlineRect");
    if (v17 > 100.0)
    {
      -[UIView superview](self, "superview");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "bounds");
      v20 = v19;
      v22 = v21;
      v24 = v23;
      v26 = v25;
      -[UIView superview](self, "superview");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "safeAreaInsets");
      v29 = v20 + v28;
      v31 = v22 + v30;
      v33 = v24 - (v28 + v32);
      v35 = v26 - (v30 + v34);

      -[UIKeyboardCandidateInlineFloatingView inlineRect](self, "inlineRect");
      v99.origin.x = v36;
      v99.origin.y = v37;
      v99.size.width = v38;
      v99.size.height = v39;
      v95.origin.x = v29;
      v95.origin.y = v31 + 100.0;
      v95.size.width = v33;
      v95.size.height = v35 + -100.0;
      v96 = CGRectIntersection(v95, v99);
      -[UIKeyboardCandidateInlineFloatingView setInlineRect:](self, "setInlineRect:", v96.origin.x, v96.origin.y, v96.size.width, v96.size.height);
    }
  }
  -[UIKeyboardCandidateInlineFloatingView inlineText](self, "inlineText");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardCandidateInlineFloatingView inlineRect](self, "inlineRect");
  v42 = v41;
  v44 = v43;
  v46 = v45;
  v48 = v47;
  -[UIKeyboardCandidateInlineFloatingView maxX](self, "maxX");
  -[UIKeyboardCandidateInlineFloatingView adjustFrameForInlineText:inlineRect:maxX:](self, "adjustFrameForInlineText:inlineRect:maxX:", v40, v42, v44, v46, v48, v49);

  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "containerView");
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIView superview](self, "superview");
  v52 = objc_claimAutoreleasedReturnValue();
  if ((void *)v52 == v51)
    goto LABEL_12;
  v53 = (void *)v52;
  -[UIView superview](self, "superview");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "bounds");
  v56 = v55;
  v58 = v57;
  v60 = v59;
  v62 = v61;
  -[UIView frame](self, "frame");
  v100.origin.x = v63;
  v100.origin.y = v64;
  v100.size.width = v65;
  v100.size.height = v66;
  v97.origin.x = v56;
  v97.origin.y = v58;
  v97.size.width = v60;
  v97.size.height = v62;
  v67 = CGRectContainsRect(v97, v100);

  if (!v67)
  {
    v68 = v51;
    -[UIKeyboardCandidateInlineFloatingView inlineRect](self, "inlineRect");
    v70 = v69;
    v72 = v71;
    v74 = v73;
    v76 = v75;
    -[UIView superview](self, "superview");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "convertRect:fromView:", v77, v70, v72, v74, v76);
    -[UIKeyboardCandidateInlineFloatingView setInlineRect:](self, "setInlineRect:");

    objc_msgSend(v68, "bounds");
    -[UIKeyboardCandidateInlineFloatingView setMaxX:](self, "setMaxX:", v78 + v79);
    if (-[UIKeyboardCandidateInlineFloatingView inlineRectIsVertical](self, "inlineRectIsVertical"))
    {
      -[UIKeyboardCandidateInlineFloatingView inlineRect](self, "inlineRect");
      -[UIKeyboardCandidateInlineFloatingView setMaxX:](self, "setMaxX:", CGRectGetMinX(v98));
    }
    objc_msgSend(v68, "addSubview:", self);
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "inputDelegate");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "textInputView");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "_convertVisualAltitude:toView:", self, 0.0);
    -[UIView _setVisualAltitude:](self, "_setVisualAltitude:");

    -[UIKeyboardCandidateInlineFloatingView inlineText](self, "inlineText");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardCandidateInlineFloatingView inlineRect](self, "inlineRect");
    v85 = v84;
    v87 = v86;
    v89 = v88;
    v91 = v90;
    -[UIKeyboardCandidateInlineFloatingView maxX](self, "maxX");
    -[UIKeyboardCandidateInlineFloatingView adjustFrameForInlineText:inlineRect:maxX:](self, "adjustFrameForInlineText:inlineRect:maxX:", v83, v85, v87, v89, v91, v92);

LABEL_12:
  }
  -[UIView setNeedsLayout](self, "setNeedsLayout");
  -[UIView layoutIfNeeded](self, "layoutIfNeeded");

}

- (void)layoutSubviews
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  objc_super v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v13.receiver = self;
  v13.super_class = (Class)UIKeyboardCandidateInlineFloatingView;
  -[UIView layoutSubviews](&v13, sel_layoutSubviews);
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[UIView subviews](self, "subviews", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v7);
        -[UIView bounds](self, "bounds");
        objc_msgSend(v8, "setFrame:");
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
    }
    while (v5);
  }

}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  BOOL v14;
  objc_super v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  y = a3.y;
  x = a3.x;
  v22 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[UIView subviews](self, "subviews");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        -[UIView convertPoint:toView:](self, "convertPoint:toView:", v13, x, y);
        if ((objc_msgSend(v13, "pointInside:withEvent:", v7) & 1) != 0)
        {

          v14 = 1;
          goto LABEL_11;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v10)
        continue;
      break;
    }
  }

  v16.receiver = self;
  v16.super_class = (Class)UIKeyboardCandidateInlineFloatingView;
  v14 = -[UIView pointInside:withEvent:](&v16, sel_pointInside_withEvent_, v7, x, y);
LABEL_11:

  return v14;
}

- (id)traitCollection
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  -[UIView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[UIView window](self, "window");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    return v5;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UIKeyboardCandidateInlineFloatingView;
    -[UIView traitCollection](&v7, sel_traitCollection);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (NSString)inlineText
{
  return self->_inlineText;
}

- (void)setInlineText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 432);
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

- (BOOL)inlineRectIsVertical
{
  return self->_inlineRectIsVertical;
}

- (void)setInlineRectIsVertical:(BOOL)a3
{
  self->_inlineRectIsVertical = a3;
}

- (double)maxX
{
  return self->_maxX;
}

- (void)setMaxX:(double)a3
{
  self->_maxX = a3;
}

- (double)extendedStateAdditionalHeight
{
  return self->_extendedStateAdditionalHeight;
}

- (void)setExtendedStateAdditionalHeight:(double)a3
{
  self->_extendedStateAdditionalHeight = a3;
}

- (CGSize)preferredSize
{
  double width;
  double height;
  CGSize result;

  width = self->_preferredSize.width;
  height = self->_preferredSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setPreferredSize:(CGSize)a3
{
  self->_preferredSize = a3;
}

- (BOOL)isReducedWidth
{
  return self->_reducedWidth;
}

- (int)position
{
  return self->_position;
}

- (void)setPosition:(int)a3
{
  self->_position = a3;
}

- (CGRect)previousCollapsedFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_previousCollapsedFrame.origin.x;
  y = self->_previousCollapsedFrame.origin.y;
  width = self->_previousCollapsedFrame.size.width;
  height = self->_previousCollapsedFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setPreviousCollapsedFrame:(CGRect)a3
{
  self->_previousCollapsedFrame = a3;
}

- (int)adjustMode
{
  return self->_adjustMode;
}

- (void)setAdjustMode:(int)a3
{
  self->_adjustMode = a3;
}

- (UIEdgeInsets)extraInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_extraInsets.top;
  left = self->_extraInsets.left;
  bottom = self->_extraInsets.bottom;
  right = self->_extraInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setExtraInsets:(UIEdgeInsets)a3
{
  self->_extraInsets = a3;
}

- (UIEdgeInsets)cellPadding
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_cellPadding.top;
  left = self->_cellPadding.left;
  bottom = self->_cellPadding.bottom;
  right = self->_cellPadding.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setCellPadding:(UIEdgeInsets)a3
{
  self->_cellPadding = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inlineText, 0);
}

@end
