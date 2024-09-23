@implementation UIAutocorrectInlinePrompt

- (UIAutocorrectInlinePrompt)initWithFrame:(CGRect)a3
{
  UIAutocorrectInlinePrompt *v3;
  NSMutableArray *v4;
  NSMutableArray *m_typedTextViews;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UIAutocorrectInlinePrompt;
  v3 = -[UIView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    m_typedTextViews = v3->m_typedTextViews;
    v3->m_typedTextViews = v4;

    -[UIView setOpaque:](v3, "setOpaque:", 0);
    -[UIView setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 1);
    -[UIView setClipsToBounds:](v3, "setClipsToBounds:", 0);
  }
  return v3;
}

- (int)textEffectsVisibilityLevelInKeyboardWindow
{
  return 12;
}

- (int)textEffectsVisibilityLevel
{
  void *v2;
  int v3;

  -[UIView superview](self, "superview");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "textEffectsVisibilityLevel");

  if (v3 <= 8)
    return 8;
  else
    return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[UIAutocorrectInlinePrompt removePromptSubviews](self, "removePromptSubviews");
  v3.receiver = self;
  v3.super_class = (Class)UIAutocorrectInlinePrompt;
  -[UIView dealloc](&v3, sel_dealloc);
}

- (void)removePromptSubviews
{
  UIView *m_correctionView;
  UIView *m_correctionAnimationView;
  UIView *m_typedTextAnimationView;
  UIView *m_correctionShadowView;

  -[NSMutableArray makeObjectsPerformSelector:](self->m_typedTextViews, "makeObjectsPerformSelector:", sel_removeFromSuperview);
  -[NSMutableArray removeAllObjects](self->m_typedTextViews, "removeAllObjects");
  -[UIView removeFromSuperview](self->m_correctionView, "removeFromSuperview");
  m_correctionView = self->m_correctionView;
  self->m_correctionView = 0;

  -[UIView removeFromSuperview](self->m_correctionAnimationView, "removeFromSuperview");
  m_correctionAnimationView = self->m_correctionAnimationView;
  self->m_correctionAnimationView = 0;

  -[UIView removeFromSuperview](self->m_typedTextAnimationView, "removeFromSuperview");
  m_typedTextAnimationView = self->m_typedTextAnimationView;
  self->m_typedTextAnimationView = 0;

  -[UIView removeFromSuperview](self->m_correctionShadowView, "removeFromSuperview");
  m_correctionShadowView = self->m_correctionShadowView;
  self->m_correctionShadowView = 0;

}

- (CGRect)shadowFrameForFrame:(CGRect)a3
{
  return CGRectInset(a3, -3.0, -5.0);
}

- (void)setCorrection:(id)a3 typedText:(id)a4 inRect:(CGRect)a5 maxX:(double)a6
{
  double height;
  double width;
  double y;
  double x;
  _BOOL8 v13;
  id v14;
  NSString *v15;
  NSString *m_correction;
  NSString *v17;
  NSString *m_typedText;
  void *v19;
  void *v20;
  void *v21;
  NSString *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  CGFloat v34;
  CGFloat v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  UIAutocorrectTextView *v49;
  double v50;
  double v51;
  NSString *v52;
  void *v53;
  NSString *v54;
  id v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  UIAutocorrectTextView *v61;
  UIView *m_correctionView;
  double v63;
  double v64;
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
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  void *v84;
  void *v85;
  int v86;
  void *v87;
  void *v88;
  double v89;
  CGFloat v90;
  double v91;
  CGFloat v92;
  double v93;
  CGFloat v94;
  double v95;
  CGFloat v96;
  void *v97;
  void *v98;
  CGFloat v99;
  CGFloat v100;
  CGFloat v101;
  CGFloat v102;
  _BOOL4 v103;
  double v104;
  double v105;
  id v106;
  CGRect v107;
  CGRect v108;
  CGRect v109;
  CGRect v110;
  CGRect v111;
  CGRect v112;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v13 = a3 == 0;
  v14 = a4;
  v15 = (NSString *)objc_msgSend(a3, "copy");
  m_correction = self->m_correction;
  self->m_correction = v15;

  v17 = (NSString *)objc_msgSend(v14, "copy");
  m_typedText = self->m_typedText;
  self->m_typedText = v17;

  -[UIAutocorrectInlinePrompt removePromptSubviews](self, "removePromptSubviews");
  -[UIView setHidden:](self, "setHidden:", v13);
  if (a3)
  {
    -[UIView superview](self, "superview");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v19)
    {
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "inputOverlayContainer");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v21, "addSubview:", self);
    }
  }
  if (self->m_correction)
  {
    self->m_fits = 1;
    self->m_originalTypedTextRectCorrectionAmount = 0.0;
    v22 = self->m_typedText;
    -[UIView superview](self, "superview");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = AutocorrectAdjustedInlineRect(v22, v23, x, y, width, height);
    v26 = v25;
    v28 = v27;
    v30 = v29;

    self->m_originalTypedTextRectCorrectionAmount = vabdd_f64(y, v26);
    +[UIScreen mainScreen](UIScreen, "mainScreen");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "scale");
    v33 = v32;

    v34 = floor(v24 * v33) / v33;
    v35 = floor(v26 * v33) / v33;
    v36 = floor(v28 * v33) / v33;
    v37 = floor(v30 * v33) / v33;
    -[UIView setFrame:](self, "setFrame:", v34, v35, v36, v37);
    self->m_originalTypedTextRect.origin.x = v34;
    self->m_originalTypedTextRect.origin.y = v35;
    self->m_originalTypedTextRect.size.width = v36;
    self->m_originalTypedTextRect.size.height = v37;
    -[UIView superview](self, "superview");
    v106 = (id)objc_claimAutoreleasedReturnValue();
    v104 = v34;
    v105 = a6;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v106, "selectionClipRect");
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {
        v42 = *MEMORY[0x1E0C9D628];
        v43 = *(double *)(MEMORY[0x1E0C9D628] + 8);
        v44 = *(double *)(MEMORY[0x1E0C9D628] + 16);
        v45 = *(double *)(MEMORY[0x1E0C9D628] + 24);
LABEL_12:
        v46 = v37 + 2.0;
        v107.origin.x = v42;
        v107.origin.y = v43;
        v107.size.width = v44;
        v107.size.height = v45;
        v47 = 0.0;
        if (CGRectIsNull(v107))
        {
          v48 = 0.0;
        }
        else
        {
          -[UIView convertRect:fromView:](self, "convertRect:fromView:", v106, v42, v43, v44, v45);
          v111.origin.x = 0.0;
          v111.origin.y = 0.0;
          v111.size.width = v36;
          v111.size.height = v37 + 2.0;
          v109 = CGRectIntersection(v108, v111);
          v48 = v109.origin.x;
          v47 = v109.origin.y;
          v36 = v109.size.width;
          v46 = v109.size.height;
        }
        v49 = -[UIAutocorrectTextView initWithFrame:string:type:edgeType:]([UIAutocorrectTextView alloc], "initWithFrame:string:type:edgeType:", self->m_typedText, 2, 0, v48, v47, v36, v46);
        -[UIView addSubview:](self, "addSubview:", v49);
        -[NSMutableArray addObject:](self->m_typedTextViews, "addObject:", v49);
        -[UIView origin](v49, "origin");
        v51 = v50;
        v52 = self->m_typedText;
        inlinePromptTextFont();
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = v52;
        v55 = v53;
        if (v54 && -[NSString length](v54, "length"))
        {
          -[NSString _legacy_sizeWithFont:forWidth:lineBreakMode:](v54, "_legacy_sizeWithFont:forWidth:lineBreakMode:", v55, 2, 3.40282347e38);
          v57 = v56;
          v59 = ceil(v58);
        }
        else
        {
          objc_msgSend(CFSTR(" "), "_legacy_sizeWithFont:forWidth:lineBreakMode:", v55, 2, 3.40282347e38);
          v57 = v60;
          v59 = 0.0;
        }

        v61 = -[UIAutocorrectTextView initWithFrame:string:type:edgeType:]([UIAutocorrectTextView alloc], "initWithFrame:string:type:edgeType:", self->m_correction, 1, 1, v48, v51, v59, v57 + 2.0);
        m_correctionView = self->m_correctionView;
        self->m_correctionView = &v61->super;

        -[UIView frame](self->m_correctionView, "frame");
        v64 = v63;
        v66 = v65;
        v68 = v67;
        v70 = v69;
        v71 = v104 + v63 + v67;
        if (v71 > v105)
        {
          -[UIView frame](v49, "frame");
          v64 = v72 + v73 - v68;
          v74 = v104 + v64;
          if (v104 + v64 <= 0.0)
          {
            if (v68 <= v105)
            {
              v64 = v105 - v68 - v104;
            }
            else
            {
              -[UIView setIsLongString:](self->m_correctionView, "setIsLongString:", 1, v74);
              v64 = -v104;
              v68 = v105;
            }
          }
          else
          {
            -[UIView setEdgeType:](self->m_correctionView, "setEdgeType:", 2, v74);
          }
          -[UIView setFrame:](self->m_correctionView, "setFrame:", v64, v66, v68, v70);
          if (v71 + v70 * -0.68 > v105)
            self->m_fits = 0;
        }
        -[UIAutocorrectInlinePrompt horizontallySquishedCorrectionFrame:](self, "horizontallySquishedCorrectionFrame:", v64, v66, v68, v70);
        v76 = v75;
        v78 = v77;
        v80 = v79;
        v82 = v81;
        -[UIView size](v49, "size");
        -[UIAutocorrectInlinePrompt correctionFrameFromDesiredFrame:textHeight:withExtraGap:](self, "correctionFrameFromDesiredFrame:textHeight:withExtraGap:", (int)v83, v76, v78, v80, v82, 0.0);
        -[UIView setFrame:](self->m_correctionView, "setFrame:");
        +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v84, "isPredictionViewControllerVisible"))
        {

        }
        else
        {
          +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          v86 = objc_msgSend(v85, "accessibilityUsesExtendedKeyboardPredictionsEnabled");

          if (!v86)
          {
            -[UIView setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 1);
            -[UIView addSubview:](self, "addSubview:", self->m_correctionView);
            goto LABEL_32;
          }
        }
        -[UIView removeFromSuperview](self->m_correctionView, "removeFromSuperview");
        -[UIView setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 0);
LABEL_32:
        -[UIView window](self, "window");
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v87, "_isTextEffectsWindow") & 1) != 0)
        {
          +[UIPeripheralHost sharedInstance](UIPeripheralHost, "sharedInstance");
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v88, "_inputViewRectToAvoid");
          v90 = v89;
          v92 = v91;
          v94 = v93;
          v96 = v95;
          -[UIView window](self, "window");
          v97 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIView superview](self, "superview");
          v98 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIView frame](self, "frame");
          objc_msgSend(v98, "convertRect:toView:", 0);
          objc_msgSend(v97, "convertRect:toWindow:", 0);
          v112.origin.x = v99;
          v112.origin.y = v100;
          v112.size.width = v101;
          v112.size.height = v102;
          v110.origin.x = v90;
          v110.origin.y = v92;
          v110.size.width = v94;
          v110.size.height = v96;
          v103 = CGRectContainsRect(v110, v112);

          if (v103)
            -[UIView setHidden:](self, "setHidden:", 1);
        }
        else
        {

        }
        return;
      }
      objc_msgSend(v106, "_selectionClipRect");
    }
    v42 = v38;
    v43 = v39;
    v44 = v40;
    v45 = v41;
    goto LABEL_12;
  }
}

- (void)addTypedTextRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  UIAutocorrectTextView *v18;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UIView superview](self, "superview");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "convertRect:toView:", self, x, y, width, height);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  v18 = -[UIAutocorrectTextView initWithFrame:string:type:edgeType:]([UIAutocorrectTextView alloc], "initWithFrame:string:type:edgeType:", 0, 2, 0, v10, v12, v14, v16 + 2.0);
  -[UIAutocorrectInlinePrompt typedTextView](self, "typedTextView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView _addSubview:positioned:relativeTo:](self, "_addSubview:positioned:relativeTo:", v18, -3, v17);

  -[NSMutableArray addObject:](self->m_typedTextViews, "addObject:", v18);
}

- (BOOL)isAcceptableTextEffectsFrame:(CGRect)a3 afterScrollBy:(double)a4
{
  double height;
  double width;
  double x;
  CGFloat v8;
  void *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  void *v18;
  BOOL IsEmpty;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  double v43;
  CGFloat v44;
  double v45;
  CGFloat v46;
  double v47;
  CGFloat v48;
  double v49;
  CGFloat v50;
  uint64_t v51;
  double v52;
  CGFloat v53;
  double v54;
  CGFloat v55;
  double v56;
  CGFloat v57;
  double v58;
  CGFloat v59;
  BOOL v60;
  double v62;
  double v63;
  double v64;
  double v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;

  height = a3.size.height;
  width = a3.size.width;
  x = a3.origin.x;
  v8 = a3.origin.y - a4;
  -[UIView superview](self, "superview");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView convertRect:toView:](self, "convertRect:toView:", v9, x, v8, width, height);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;

  -[UIView superview](self, "superview");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "bounds");
  IsEmpty = CGRectIsEmpty(v66);
  -[UIView superview](self, "superview");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  v64 = width;
  v65 = height;
  v62 = v8;
  v63 = x;
  if (IsEmpty)
  {
    objc_msgSend(v20, "superview");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "bounds");
    v24 = v23;
    v26 = v25;
    v28 = v27;
    v30 = v29;

  }
  else
  {
    objc_msgSend(v20, "bounds");
    v24 = v31;
    v26 = v32;
    v28 = v33;
    v30 = v34;
  }

  if (!_CGRectContainsRectVertically(v24, v26, v28, v30, v11, v13, v15, v17))
    return 0;
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "_window");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "screen");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView _window](self, "_window");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "screen");
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  if (v37 != v39)
    goto LABEL_9;
  -[UIView _window](self, "_window");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "screen");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "coordinateSpace");
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIView convertRect:toCoordinateSpace:](self, "convertRect:toCoordinateSpace:", v42, v63, v62, v64, v65);
  v44 = v43;
  v46 = v45;
  v48 = v47;
  v50 = v49;
  objc_msgSend(v35, "_rootInputWindowController");
  v51 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v51, "visibleInputViewFrame");
  v53 = v52;
  v55 = v54;
  v57 = v56;
  v59 = v58;

  v67.origin.x = v44;
  v67.origin.y = v46;
  v67.size.width = v48;
  v67.size.height = v50;
  v68.origin.x = v53;
  v68.origin.y = v55;
  v68.size.width = v57;
  v68.size.height = v59;
  LOBYTE(v51) = CGRectIntersectsRect(v67, v68);

  if ((v51 & 1) != 0)
    v60 = 0;
  else
LABEL_9:
    v60 = 1;

  return v60;
}

- (CGRect)horizontallySquishedCorrectionFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  double v15;
  double v16;
  double v17;
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
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double (*v53)(double, double, double);
  double (*v54)(double, double, double, double);
  uint64_t v55;
  BOOL v56;
  double (*v57)(double, double, double);
  double v58;
  uint64_t v59;
  double v60;
  _QWORD *v61;
  _QWORD *v62;
  unsigned int (**v63)(_QWORD, double, double);
  double v64;
  __n128 v65;
  void (*v66)(_QWORD *, __n128, __n128, double, double, __n128);
  _QWORD *v67;
  double v68;
  double v69;
  __n128 v70;
  __n128 v71;
  double v72;
  double v73;
  double v74;
  double v75;
  void *v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  void *v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  void *v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  void *v103;
  double v104;
  double v105;
  double v106;
  double v107;
  double v108;
  double v109;
  double v110;
  double v111;
  double v112;
  double v113;
  double v114;
  double v115;
  double v116;
  _QWORD v117[4];
  BOOL v118;
  _QWORD v119[4];
  BOOL v120;
  _QWORD aBlock[4];
  BOOL v122;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "inputDelegateManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "keyInputDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "textInputTraits");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isSingleLineDocument");

  if (v13 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    -[UIView window](self, "window");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView convertRect:toView:](self, "convertRect:toView:", v14, x, y, width, height);
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v22 = v21;

    -[UIView window](self, "window");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "convertRect:toWindow:", 0, v16, v18, v20, v22);
    v25 = v24;
    v27 = v26;
    v29 = v28;
    v31 = v30;

    objc_msgSend(v10, "window");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "convertRect:fromWindow:", 0, v25, v27, v29, v31);
    v34 = v33;
    v36 = v35;
    v38 = v37;
    v40 = v39;

    objc_msgSend(v10, "window");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "convertRect:fromView:", v41, v34, v36, v38, v40);
    v114 = v43;
    v115 = v42;
    v116 = v44;
    v113 = v45;

    objc_msgSend(v10, "bounds");
    v47 = v46;
    v49 = v48;
    v112 = v50;
    v52 = v51 + 6.0;
    v53 = UIRectGetMaxX;
    v54 = (double (*)(double, double, double, double))UIRectGetMinX;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v55 = objc_msgSend(v10, "effectiveUserInterfaceLayoutDirection");
      v56 = v55 == 1;
      if (v55 == 1)
        v57 = UIRectGetMaxX;
      else
        v57 = (double (*)(double, double, double))UIRectGetMinX;
      if (v55 == 1)
        v53 = (double (*)(double, double, double))UIRectGetMinX;
      v54 = (double (*)(double, double, double, double))v57;
    }
    else
    {
      v56 = 0;
    }
    v58 = v47 + -3.0;
    v59 = MEMORY[0x1E0C809B0];
    v60 = v49 + 0.0;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __65__UIAutocorrectInlinePrompt_horizontallySquishedCorrectionFrame___block_invoke;
    aBlock[3] = &__block_descriptor_33_e42_v48__0_CGRect__CGPoint_dd__CGSize_dd__8d40l;
    v122 = v56;
    v61 = _Block_copy(aBlock);
    v119[0] = v59;
    v119[1] = 3221225472;
    v119[2] = __65__UIAutocorrectInlinePrompt_horizontallySquishedCorrectionFrame___block_invoke_2;
    v119[3] = &__block_descriptor_33_e42_v48__0_CGRect__CGPoint_dd__CGSize_dd__8d40l;
    v120 = v56;
    v62 = _Block_copy(v119);
    v117[0] = v59;
    v117[1] = 3221225472;
    v117[2] = __65__UIAutocorrectInlinePrompt_horizontallySquishedCorrectionFrame___block_invoke_3;
    v117[3] = &__block_descriptor_33_e11_B24__0d8d16l;
    v118 = v56;
    v63 = (unsigned int (**)(_QWORD, double, double))_Block_copy(v117);
    v64 = v116;
    if (v116 <= v52)
    {
      v72 = v54(v115, v114, v116, v113);
      v73 = v54(v58, v60, v52, v112);
      if (v63[2](v63, v72, v73))
      {
        v65.n128_u64[0] = v54(v58, v60, v52, v112);
        v66 = (void (*)(_QWORD *, __n128, __n128, double, double, __n128))v61[2];
        v67 = v61;
      }
      else
      {
        v74 = ((double (*)(double, double, double, double))v53)(v58, v60, v52, v112);
        v75 = ((double (*)(double, double, double, double))v53)(v115, v114, v116, v113);
        if (!v63[2](v63, v74, v75))
        {
LABEL_19:

          goto LABEL_20;
        }
        v65.n128_u64[0] = ((double (*)(double, double, double, double))v53)(v58, v60, v52, v112);
        v66 = (void (*)(_QWORD *, __n128, __n128, double, double, __n128))v62[2];
        v67 = v62;
      }
      v69 = v114;
      v68 = v115;
      v70.n128_f64[0] = v115;
      v71.n128_f64[0] = v114;
      v64 = v116;
    }
    else
    {
      v65.n128_u64[0] = v54(v58, v60, v52, v112);
      v66 = (void (*)(_QWORD *, __n128, __n128, double, double, __n128))v61[2];
      v67 = v61;
      v69 = v114;
      v68 = v115;
      v70.n128_f64[0] = v115;
      v71.n128_f64[0] = v114;
    }
    v66(v67, v70, v71, v64, v113, v65);
    objc_msgSend(v10, "window");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "convertRect:toView:", v76, v68, v69, v64, v113);
    v78 = v77;
    v80 = v79;
    v82 = v81;
    v84 = v83;

    objc_msgSend(v10, "window");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "convertRect:toWindow:", 0, v78, v80, v82, v84);
    v87 = v86;
    v89 = v88;
    v91 = v90;
    v93 = v92;

    -[UIView window](self, "window");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "convertRect:fromWindow:", 0, v87, v89, v91, v93);
    v96 = v95;
    v98 = v97;
    v100 = v99;
    v102 = v101;

    -[UIView window](self, "window");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView convertRect:fromView:](self, "convertRect:fromView:", v103, v96, v98, v100, v102);
    x = v104;
    y = v105;
    width = v106;
    height = v107;

    goto LABEL_19;
  }
LABEL_20:

  v108 = x;
  v109 = y;
  v110 = width;
  v111 = height;
  result.size.height = v111;
  result.size.width = v110;
  result.origin.y = v109;
  result.origin.x = v108;
  return result;
}

BOOL __65__UIAutocorrectInlinePrompt_horizontallySquishedCorrectionFrame___block_invoke_3(uint64_t a1, double a2, double a3)
{
  if (*(_BYTE *)(a1 + 32))
    return a2 > a3;
  else
    return a2 < a3;
}

- (CGRect)correctionFrameFromDesiredFrame:(CGRect)a3 textHeight:(int)a4 withExtraGap:(double)a5
{
  double height;
  double width;
  double y;
  double x;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = a3.origin.y + (double)a4 + a5 + -1.0;
  if (!-[UIAutocorrectInlinePrompt isAcceptableTextEffectsFrame:afterScrollBy:](self, "isAcceptableTextEffectsFrame:afterScrollBy:", a3.origin.x, v10, a3.size.width, a3.size.height, 0.0))
  {
    v11 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    if (v11 <= 0.0)
      v11 = 1.0;
    v12 = y - height + v11;
    -[UIView window](self, "window");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView convertRect:toView:](self, "convertRect:toView:", v13, x, v12, width, height);
    v15 = v14;

    -[UIView window](self, "window");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    __UIStatusBarManagerForWindow(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "statusBarHeight");
    v19 = v18;

    v20 = v19 - v15;
    if (v15 >= v19)
      v20 = -0.0;
    v21 = v12 + v20;
    if (-[UIAutocorrectInlinePrompt isAcceptableTextEffectsFrame:afterScrollBy:](self, "isAcceptableTextEffectsFrame:afterScrollBy:", x, v21, width, height, 1.0))
    {
      v10 = v21;
    }
  }
  v22 = x;
  v23 = v10;
  v24 = width;
  v25 = height;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (id)correction
{
  return self->m_correction;
}

- (id)typedText
{
  return self->m_typedText;
}

- (id)typedTextView
{
  void *v3;

  v3 = (void *)-[NSMutableArray count](self->m_typedTextViews, "count");
  if (v3)
  {
    -[NSMutableArray objectAtIndex:](self->m_typedTextViews, "objectAtIndex:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)correctionView
{
  return self->m_correctionView;
}

- (id)correctionAnimationView
{
  return self->m_correctionAnimationView;
}

- (id)typedTextAnimationView
{
  return self->m_typedTextAnimationView;
}

- (id)correctionShadowView
{
  return self->m_correctionShadowView;
}

- (BOOL)pointInside:(CGPoint)a3 forEvent:(__GSEvent *)a4
{
  return -[UIView pointInside:forEvent:](self->m_correctionView, "pointInside:forEvent:", a4, a3.x, a3.y);
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  UIAutocorrectInlinePrompt *v6;
  UIView *m_correctionView;
  id v8;

  y = a3.y;
  x = a3.x;
  v6 = self;
  m_correctionView = self->m_correctionView;
  v8 = a4;
  -[UIView convertPoint:fromView:](m_correctionView, "convertPoint:fromView:", v6, x, y);
  LOBYTE(v6) = -[UIView pointInside:withEvent:](m_correctionView, "pointInside:withEvent:", v8);

  return (char)v6;
}

- (void)dismiss
{
  id v2;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fadeAutocorrectPrompt");

}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  self->m_mouseDown = 1;
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  UIView *m_correctionView;
  id v6;
  _BOOL4 v7;

  m_correctionView = self->m_correctionView;
  v6 = a4;
  -[UIView origin](m_correctionView, "origin");
  v7 = -[UIAutocorrectInlinePrompt pointInside:withEvent:](self, "pointInside:withEvent:", v6);

  if (self->m_mouseDown && v7)
    -[UIAutocorrectInlinePrompt dismiss](self, "dismiss");
  self->m_mouseDown = 0;
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  self->m_mouseDown = 0;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  if (objc_msgSend(v4, "_isGestureType:", 0)
    && objc_msgSend(v4, "numberOfTouchesRequired") == 1
    && objc_msgSend(v4, "numberOfTapsRequired") == 1
    || objc_msgSend(v4, "_isGestureType:", 1) && objc_msgSend(v4, "numberOfTouchesRequired") == 1)
  {
    v5 = 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UIAutocorrectInlinePrompt;
    v5 = -[UIView gestureRecognizerShouldBegin:](&v7, sel_gestureRecognizerShouldBegin_, v4);
  }

  return v5;
}

- (BOOL)prepareForAnimation:(CGRect)a3
{
  void *v5;
  UIAutocorrectTextView *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  UIView *v11;
  UIView *m_typedTextAnimationView;
  UIView *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  UIAutocorrectTextView *v19;
  UIView *m_correctionAnimationView;
  UIView *v21;

  if (!self->m_fits
    || vabdd_f64(self->m_originalTypedTextRect.origin.y, a3.origin.y) > self->m_originalTypedTextRectCorrectionAmount
                                                                      + 0.00000011920929)
  {
    return 0;
  }
  -[UIAutocorrectInlinePrompt typedTextView](self, "typedTextView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reduceWidth:", 3.0);
  v6 = [UIAutocorrectTextView alloc];
  v7 = *MEMORY[0x1E0C9D648];
  v8 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v9 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v10 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v11 = -[UIAutocorrectTextView initWithFrame:string:type:edgeType:](v6, "initWithFrame:string:type:edgeType:", self->m_typedText, 4, 0, *MEMORY[0x1E0C9D648], v8, v9, v10);
  m_typedTextAnimationView = self->m_typedTextAnimationView;
  self->m_typedTextAnimationView = v11;

  v13 = self->m_typedTextAnimationView;
  objc_msgSend(v5, "frame");
  -[UIView setFrame:](v13, "setFrame:");
  -[UIView _addSubview:positioned:relativeTo:](self, "_addSubview:positioned:relativeTo:", self->m_typedTextAnimationView, -2, v5);
  -[NSMutableArray makeObjectsPerformSelector:](self->m_typedTextViews, "makeObjectsPerformSelector:", sel_removeFromSuperview);
  if ((unint64_t)-[NSMutableArray count](self->m_typedTextViews, "count") >= 2)
    -[NSMutableArray removeObjectsInRange:](self->m_typedTextViews, "removeObjectsInRange:", 1, -[NSMutableArray count](self->m_typedTextViews, "count") - 1);
  -[UIView removeFromSuperview](self->m_correctionShadowView, "removeFromSuperview");
  -[UIView setEdgeType:](self->m_correctionView, "setEdgeType:", 0);
  -[UIView setAnimating:](self->m_correctionView, "setAnimating:", 1);
  -[UIView reduceWidth:](self->m_correctionView, "reduceWidth:", 3.0);
  -[UIView size](self->m_correctionView, "size");
  v15 = v14;
  v17 = v16;
  objc_msgSend(v5, "size");
  if (v15 >= v18)
  {
    if (v18 < v15)
    {
      -[UIView setSize:](self->m_typedTextAnimationView, "setSize:", v15, v17);
      objc_msgSend(v5, "setSize:", v15, v17);
    }
  }
  else
  {
    -[UIView setSize:](self->m_correctionView, "setSize:");
    -[UIView setNeedsDisplay](self->m_correctionView, "setNeedsDisplay");
  }
  v19 = -[UIAutocorrectTextView initWithFrame:string:type:edgeType:]([UIAutocorrectTextView alloc], "initWithFrame:string:type:edgeType:", self->m_correction, 3, 0, v7, v8, v9, v10);
  m_correctionAnimationView = self->m_correctionAnimationView;
  self->m_correctionAnimationView = &v19->super;

  v21 = self->m_correctionAnimationView;
  -[UIView frame](self->m_correctionView, "frame");
  -[UIView setFrame:](v21, "setFrame:");
  -[UIView _addSubview:positioned:relativeTo:](self, "_addSubview:positioned:relativeTo:", self->m_correctionAnimationView, -3, self->m_correctionView);

  return 1;
}

- (unsigned)usageTrackingMask
{
  return self->m_usageTrackingMask;
}

- (void)setUsageTrackingMask:(unsigned int)a3
{
  self->m_usageTrackingMask = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->m_correctionShadowView, 0);
  objc_storeStrong((id *)&self->m_typedTextAnimationView, 0);
  objc_storeStrong((id *)&self->m_correctionAnimationView, 0);
  objc_storeStrong((id *)&self->m_correctionView, 0);
  objc_storeStrong((id *)&self->m_typedTextViews, 0);
  objc_storeStrong((id *)&self->m_correction, 0);
  objc_storeStrong((id *)&self->m_typedText, 0);
}

@end
