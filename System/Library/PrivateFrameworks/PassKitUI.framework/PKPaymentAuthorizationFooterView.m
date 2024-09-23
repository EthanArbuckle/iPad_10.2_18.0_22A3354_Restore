@implementation PKPaymentAuthorizationFooterView

- (PKPaymentAuthorizationFooterView)initWithFrame:(CGRect)a3
{
  return -[PKPaymentAuthorizationFooterView initWithFrame:layout:](self, "initWithFrame:layout:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (PKPaymentAuthorizationFooterView)initWithFrame:(CGRect)a3 layout:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  PKPaymentAuthorizationFooterView *v11;
  NSMutableArray *v12;
  NSMutableArray *completionHandlers;
  NSMutableArray *v14;
  NSMutableArray *deferredCompletionHandlers;
  void *v16;
  uint64_t v17;
  NSMutableArray *v18;
  NSMutableArray *dynamicRegularConstraints;
  uint64_t v20;
  char IsAvailable;
  objc_super v23;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = a4;
  v23.receiver = self;
  v23.super_class = (Class)PKPaymentAuthorizationFooterView;
  v11 = -[PKPaymentAuthorizationFooterView initWithFrame:](&v23, sel_initWithFrame_, x, y, width, height);
  if (v11)
  {
    v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    completionHandlers = v11->_completionHandlers;
    v11->_completionHandlers = v12;

    v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    deferredCompletionHandlers = v11->_deferredCompletionHandlers;
    v11->_deferredCompletionHandlers = v14;

    objc_storeStrong((id *)&v11->_layout, a4);
    v11->_constraintState = 0;
    v11->_queuedConstraintState = 0;
    -[PKPaymentAuthorizationFooterView traitCollection](v11, "traitCollection");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "userInterfaceIdiom");

    v11->_isPad = (v17 & 0xFFFFFFFFFFFFFFFBLL) == 1;
    v11->_hasPearl = PKPearlIsAvailable();
    v18 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    dynamicRegularConstraints = v11->_dynamicRegularConstraints;
    v11->_dynamicRegularConstraints = v18;

    v11->_compact = -[PKPaymentAuthorizationFooterView _shouldCompact](v11, "_shouldCompact");
    v20 = -[PKPaymentAuthorizationLayout style](v11->_layout, "style");
    v11->_compactUserIntent = v20 == 0;
    if (v20)
      IsAvailable = 0;
    else
      IsAvailable = PKSystemApertureIsAvailable();
    v11->_compactBiometrics = IsAvailable;
    -[PKPaymentAuthorizationFooterView setTranslatesAutoresizingMaskIntoConstraints:](v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PKPaymentAuthorizationFooterView _createSubviews](v11, "_createSubviews");
    -[PKPaymentAuthorizationFooterView _prepareConstraints](v11, "_prepareConstraints");
  }

  return v11;
}

- (void)dealloc
{
  objc_super v3;

  -[PKGlyphView setDelegate:](self->_glyphView, "setDelegate:", 0);
  -[PKGlyphView setState:animated:completionHandler:](self->_glyphView, "setState:animated:completionHandler:", 6, 0, 0);
  v3.receiver = self;
  v3.super_class = (Class)PKPaymentAuthorizationFooterView;
  -[PKPaymentAuthorizationFooterView dealloc](&v3, sel_dealloc);
}

- (BOOL)_shouldCompact
{
  return (PKHomeButtonIsAvailable() & 1) == 0 && !self->_isPad;
}

- (BOOL)isOffscreen
{
  return self->_constraintState == 2;
}

- (void)setRequestType:(unint64_t)a3
{
  _BOOL4 v4;

  if (self->_requestType != a3)
  {
    self->_requestType = a3;
    v4 = -[PKPaymentAuthorizationFooterView _shouldCompact](self, "_shouldCompact");
    if (self->_compact != v4)
    {
      self->_compact = v4;
      self->_constraintsDirty = 1;
      -[PKPaymentAuthorizationFooterView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
    }
    -[PKPaymentAuthorizationFooterView setState:](self, "setState:", self->_state);
  }
}

- (void)setConfirmationStyle:(unint64_t)a3
{
  if (self->_confirmationStyle != a3)
  {
    self->_confirmationStyle = a3;
    -[PKPaymentAuthorizationFooterView setState:](self, "setState:", self->_state);
  }
}

- (BOOL)setConstraintState:(int64_t)a3
{
  if (self->_constraintState == a3 && self->_queuedConstraintState == a3)
    return 0;
  self->_queuedConstraintState = a3;
  if ((-[PKPaymentAuthorizationFooterView isHidden](self, "isHidden") & 1) != 0)
    return 0;
  -[PKPaymentAuthorizationFooterView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  return 1;
}

- (void)setState:(int64_t)a3
{
  -[PKPaymentAuthorizationFooterView setState:string:animated:](self, "setState:string:animated:", a3, 0, 1);
}

- (void)setState:(int64_t)a3 string:(id)a4 animated:(BOOL)a5
{
  -[PKPaymentAuthorizationFooterView setState:string:animated:withCompletion:](self, "setState:string:animated:withCompletion:", a3, a4, a5, 0);
}

- (void)setState:(int64_t)a3 string:(id)a4 animated:(BOOL)a5 withCompletion:(id)a6
{
  _BOOL4 v7;
  void *v10;
  NSString *v11;
  NSString *v12;
  NSString *deferredStateString;
  NSMutableArray *deferredCompletionHandlers;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  id v21;
  NSMutableArray *completionHandlers;
  void *v23;
  void *v24;
  unint64_t state;
  BOOL compactBiometrics;
  uint64_t v27;
  NSString *v28;
  NSString *overrideString;
  unint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  id v34;
  _BOOL4 v35;
  void (**v36)(_QWORD);
  id v37;
  id v38;
  double v39;
  double v40;
  UILabel **p_labelView;
  void *v42;
  double v43;
  _BOOL4 v44;
  uint64_t v45;
  double v46;
  double v47;
  PKGlyphView *v48;
  _QWORD *v49;
  double v50;
  double v51;
  PKGlyphView *v52;
  double v53;
  double v54;
  PKGlyphView *v55;
  double v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  PKGlyphView *v61;
  id v62;
  uint64_t v63;
  id *v64;
  double v65;
  double v66;
  double v67;
  double v68;
  PKGlyphView *v69;
  int IsAvailable;
  PKGlyphView *glyphView;
  uint64_t v72;
  PKGlyphView *v73;
  id v74;
  id v75;
  void (**v76)(_QWORD);
  void (**v77)(_QWORD);
  void (**v78)(_QWORD);
  void (**v79)(_QWORD);
  void (**v80)(_QWORD);
  void *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t j;
  id v85;
  id v86;
  BOOL v87;
  void *v88;
  void *v89;
  void *stateTransitionIndex;
  _BOOL4 v91;
  id v92;
  id v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  _QWORD v98[4];
  void (**v99)(_QWORD);
  void (**v100)(_QWORD);
  void (**v101)(_QWORD);
  id v102[2];
  _QWORD v103[4];
  id v104;
  id v105[2];
  BOOL v106;
  _QWORD v107[4];
  id v108;
  id v109;
  _QWORD v110[4];
  id v111;
  id v112;
  id v113;
  _QWORD v114[4];
  id v115;
  id v116;
  id v117;
  id v118;
  BOOL v119;
  BOOL v120;
  _QWORD v121[4];
  void (**v122)(_QWORD);
  _QWORD v123[5];
  _QWORD v124[5];
  _QWORD v125[5];
  _QWORD v126[5];
  _QWORD v127[4];
  void (**v128)(_QWORD);
  _QWORD aBlock[5];
  id v130[2];
  BOOL v131;
  uint64_t v132;
  uint64_t *v133;
  uint64_t v134;
  uint64_t v135;
  id location;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  _BYTE v141[128];
  _BYTE v142[128];
  uint64_t v143;

  v7 = a5;
  v143 = *MEMORY[0x1E0C80C00];
  v92 = a4;
  v93 = a6;
  if (self->_deferringState)
  {
    if (a3 == 9)
    {
      v10 = 0;
      self->_deferredStateRequiresRetry = 1;
LABEL_15:
      v12 = (NSString *)objc_msgSend(v92, "copy");
      deferredStateString = self->_deferredStateString;
      self->_deferredStateString = v12;

      if (v93)
      {
        deferredCompletionHandlers = self->_deferredCompletionHandlers;
        v15 = (void *)objc_msgSend(v93, "copy");
        v16 = _Block_copy(v15);
        -[NSMutableArray addObject:](deferredCompletionHandlers, "addObject:", v16);

      }
      v139 = 0u;
      v140 = 0u;
      v137 = 0u;
      v138 = 0u;
      v17 = v10;
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v137, v142, 16);
      if (v18)
      {
        v19 = *(_QWORD *)v138;
        do
        {
          for (i = 0; i != v18; ++i)
          {
            if (*(_QWORD *)v138 != v19)
              objc_enumerationMutation(v17);
            (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v137 + 1) + 8 * i) + 16))();
          }
          v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v137, v142, 16);
        }
        while (v18);
      }
      v21 = v17;
      goto LABEL_134;
    }
LABEL_8:
    if (self->_state == a3)
    {
      v10 = 0;
    }
    else
    {
      v10 = (void *)-[NSMutableArray copy](self->_deferredCompletionHandlers, "copy");
      -[NSMutableArray removeAllObjects](self->_deferredCompletionHandlers, "removeAllObjects");
      self->_state = a3;
    }
    goto LABEL_15;
  }
  v91 = v7;
  if (a3 == 9 || !self->_biometricSuccessOutstanding)
  {
    if (a3 == 9)
    {
      v88 = 0;
      goto LABEL_31;
    }
  }
  else if (self->_state != a3)
  {
    self->_deferringState = 1;
    self->_deferredStateRequiresRetry = 0;
    v11 = self->_deferredStateString;
    self->_deferredStateString = 0;

    if (self->_deferringState)
      goto LABEL_8;
  }
  ++self->_stateTransitionIndex;
  if (self->_state == a3)
  {
    v88 = 0;
  }
  else
  {
    if (-[NSMutableArray count](self->_completionHandlers, "count"))
    {
      v88 = (void *)-[NSMutableArray copy](self->_completionHandlers, "copy");
      -[NSMutableArray removeAllObjects](self->_completionHandlers, "removeAllObjects");
    }
    else
    {
      v88 = 0;
    }
    self->_state = a3;
  }
  if (v93)
  {
    completionHandlers = self->_completionHandlers;
    v23 = (void *)objc_msgSend(v93, "copy");
    v24 = _Block_copy(v23);
    -[NSMutableArray addObject:](completionHandlers, "addObject:", v24);

  }
LABEL_31:
  state = self->_state;
  if (state > 9)
  {
LABEL_71:
    compactBiometrics = 0;
    v27 = 0;
    goto LABEL_34;
  }
  if (((1 << state) & 0x3E7) != 0)
  {
    compactBiometrics = self->_compactBiometrics;
    v27 = 2 * self->_compactBiometrics;
    goto LABEL_34;
  }
  if (state == 3)
  {
    if (self->_compactUserIntent)
    {
      compactBiometrics = self->_userIntentStyle == 1;
      v27 = 2 * compactBiometrics;
      goto LABEL_34;
    }
    goto LABEL_71;
  }
  compactBiometrics = 0;
  v27 = 1;
LABEL_34:
  v87 = -[PKPaymentAuthorizationFooterView setConstraintState:](self, "setConstraintState:", v27);
  v28 = (NSString *)objc_msgSend(v92, "copy");
  overrideString = self->_overrideString;
  self->_overrideString = v28;

  if (self->_overrideString)
    -[PKPaymentAuthorizationFooterView _titleLabelAttributedString:](self, "_titleLabelAttributedString:");
  else
    -[PKPaymentAuthorizationFooterView _titleAttributedStringForState:](self, "_titleAttributedStringForState:", a3);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  -[PKPaymentAuthorizationFooterView _payWithPasscodeTitleForState:](self, "_payWithPasscodeTitleForState:", a3);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  stateTransitionIndex = (void *)self->_stateTransitionIndex;
  if (a3 == 8)
  {
LABEL_50:
    v132 = 0;
    v133 = &v132;
    v134 = 0x2020000000;
    v135 = 1;
    v35 = a3 == 8 && v91;
    if (v35)
      self->_biometricSuccessOutstanding = 1;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __76__PKPaymentAuthorizationFooterView_setState_string_animated_withCompletion___block_invoke;
    aBlock[3] = &unk_1E3E78970;
    objc_copyWeak(v130, &location);
    v130[1] = stateTransitionIndex;
    aBlock[4] = &v132;
    v131 = v35;
    v36 = (void (**)(_QWORD))_Block_copy(aBlock);
    v37 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v38 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    switch(a3)
    {
      case 0:
      case 1:
      case 2:
      case 3:
      case 5:
      case 6:
      case 7:
        -[UIButton alpha](self->_payWithPasscodeButton, "alpha");
        if (v39 > 0.0)
          objc_msgSend(v37, "addObject:", self->_payWithPasscodeButton);
        if (compactBiometrics)
        {
          -[PKGlyphView alpha](self->_glyphView, "alpha");
          if (v40 > 0.0)
            objc_msgSend(v37, "addObject:", self->_glyphView);
          p_labelView = &self->_labelView;
          -[UILabel alpha](self->_labelView, "alpha");
          v42 = v37;
          if (v43 <= 0.0)
            goto LABEL_69;
        }
        else
        {
          objc_msgSend(v38, "addObject:", self->_glyphView);
          if (!v17)
          {
LABEL_69:
            v44 = 0;
            v45 = 0;
            switch(a3)
            {
              case 1:
                v44 = 0;
                v45 = 3;
                break;
              case 2:
                IsAvailable = PKPearlIsAvailable();
                v44 = 0;
                if (IsAvailable)
                  v45 = 5;
                else
                  v45 = 1;
                break;
              case 3:
                if (compactBiometrics)
                {
                  v45 = 0;
                  v44 = 0;
                }
                else
                {
                  v44 = self->_userIntentStyle == 1;
                  v45 = 2 * (self->_userIntentStyle == 1);
                  if (self->_userIntentStyle == 1 && !v91)
                  {
                    -[PKGlyphView setState:animated:completionHandler:](self->_glyphView, "setState:animated:completionHandler:", 6, 0, 0);
                    v44 = 1;
                  }
                }
                break;
              case 5:
              case 6:
              case 7:
                v44 = 0;
                v45 = 4;
                break;
              default:
                break;
            }
            ++v133[3];
            glyphView = self->_glyphView;
            v72 = v44 | v91;
            v127[0] = MEMORY[0x1E0C809B0];
            v127[1] = 3221225472;
            v127[2] = __76__PKPaymentAuthorizationFooterView_setState_string_animated_withCompletion___block_invoke_3;
            v127[3] = &unk_1E3E614F0;
            v128 = v36;
            -[PKGlyphView setState:animated:completionHandler:](glyphView, "setState:animated:completionHandler:", v45, v72, v127);
            v64 = (id *)&v128;
            goto LABEL_121;
          }
          p_labelView = &self->_labelView;
          v42 = v38;
        }
        objc_msgSend(v42, "addObject:", *p_labelView);
        goto LABEL_69;
      case 4:
        -[PKGlyphView alpha](self->_glyphView, "alpha");
        if (v65 > 0.0)
          objc_msgSend(v37, "addObject:", self->_glyphView);
        -[UILabel alpha](self->_labelView, "alpha");
        if (v66 > 0.0)
          objc_msgSend(v37, "addObject:", self->_labelView);
        objc_msgSend(v38, "addObject:", self->_payWithPasscodeButton);
        ++v133[3];
        if (self->_preventBiometricStateFallbacks)
        {
          v36[2](v36);
        }
        else
        {
          v73 = self->_glyphView;
          v126[0] = MEMORY[0x1E0C809B0];
          v126[1] = 3221225472;
          v126[2] = __76__PKPaymentAuthorizationFooterView_setState_string_animated_withCompletion___block_invoke_4;
          v126[3] = &unk_1E3E614F0;
          v49 = v126;
          v126[4] = v36;
          -[PKGlyphView setState:animated:completionHandler:](v73, "setState:animated:completionHandler:", 0, v91, v126);
LABEL_120:
          v64 = (id *)(v49 + 4);
LABEL_121:

        }
LABEL_122:
        v114[0] = MEMORY[0x1E0C809B0];
        v114[1] = 3221225472;
        v114[2] = __76__PKPaymentAuthorizationFooterView_setState_string_animated_withCompletion___block_invoke_9;
        v114[3] = &unk_1E3E78998;
        objc_copyWeak(&v118, &location);
        v86 = v37;
        v115 = v86;
        v74 = v17;
        v116 = v74;
        v119 = v91;
        v75 = v38;
        v117 = v75;
        v120 = v87;
        v76 = (void (**)(_QWORD))_Block_copy(v114);
        v110[0] = MEMORY[0x1E0C809B0];
        v110[1] = 3221225472;
        v110[2] = __76__PKPaymentAuthorizationFooterView_setState_string_animated_withCompletion___block_invoke_10;
        v110[3] = &unk_1E3E61EE8;
        objc_copyWeak(&v113, &location);
        v111 = v74;
        v112 = v89;
        v77 = (void (**)(_QWORD))_Block_copy(v110);
        v107[0] = MEMORY[0x1E0C809B0];
        v107[1] = 3221225472;
        v107[2] = __76__PKPaymentAuthorizationFooterView_setState_string_animated_withCompletion___block_invoke_11;
        v107[3] = &unk_1E3E61B68;
        objc_copyWeak(&v109, &location);
        v85 = v75;
        v108 = v85;
        v78 = (void (**)(_QWORD))_Block_copy(v107);
        ++v133[3];
        v103[0] = MEMORY[0x1E0C809B0];
        v103[1] = 3221225472;
        v103[2] = __76__PKPaymentAuthorizationFooterView_setState_string_animated_withCompletion___block_invoke_12;
        v103[3] = &unk_1E3E712F8;
        objc_copyWeak(v105, &location);
        v105[1] = stateTransitionIndex;
        v79 = v36;
        v104 = v79;
        v106 = v91;
        v80 = (void (**)(_QWORD))_Block_copy(v103);
        if (v91)
        {
          v81 = (void *)MEMORY[0x1E0DC3F10];
          v98[0] = MEMORY[0x1E0C809B0];
          v98[1] = 3221225472;
          v98[2] = __76__PKPaymentAuthorizationFooterView_setState_string_animated_withCompletion___block_invoke_14;
          v98[3] = &unk_1E3E78A10;
          objc_copyWeak(v102, &location);
          v102[1] = stateTransitionIndex;
          v99 = v77;
          v100 = v78;
          v101 = v80;
          objc_msgSend(v81, "_animateUsingDefaultTimingWithOptions:animations:completion:", 0, v76, v98);

          objc_destroyWeak(v102);
        }
        else
        {
          v76[2](v76);
          v77[2](v77);
          v78[2](v78);
          v80[2](v80);
        }
        v79[2](v79);

        objc_destroyWeak(v105);
        objc_destroyWeak(&v109);

        objc_destroyWeak(&v113);
        objc_destroyWeak(&v118);

        objc_destroyWeak(v130);
        _Block_object_dispose(&v132, 8);
        goto LABEL_126;
      case 8:
        if (v91)
          self->_biometricSuccessOutstanding = 1;
        -[UIButton alpha](self->_payWithPasscodeButton, "alpha");
        if (v50 > 0.0)
          objc_msgSend(v37, "addObject:", self->_payWithPasscodeButton);
        -[PKGlyphView alpha](self->_glyphView, "alpha");
        if (v51 == 0.0)
          objc_msgSend(v38, "addObject:", self->_glyphView);
        if (v17)
          objc_msgSend(v38, "addObject:", self->_labelView);
        ++v133[3];
        v52 = self->_glyphView;
        v125[0] = MEMORY[0x1E0C809B0];
        v125[1] = 3221225472;
        v125[2] = __76__PKPaymentAuthorizationFooterView_setState_string_animated_withCompletion___block_invoke_5;
        v125[3] = &unk_1E3E614F0;
        v49 = v125;
        v125[4] = v36;
        -[PKGlyphView setState:animated:completionHandler:](v52, "setState:animated:completionHandler:", 12, v91, v125);
        goto LABEL_120;
      case 10:
      case 11:
        -[UIButton alpha](self->_payWithPasscodeButton, "alpha");
        if (v46 > 0.0)
          objc_msgSend(v37, "addObject:", self->_payWithPasscodeButton);
        -[PKGlyphView alpha](self->_glyphView, "alpha");
        if (v47 == 0.0)
          objc_msgSend(v38, "addObject:", self->_glyphView);
        if (v17)
          objc_msgSend(v38, "addObject:", self->_labelView);
        ++v133[3];
        v48 = self->_glyphView;
        v124[0] = MEMORY[0x1E0C809B0];
        v124[1] = 3221225472;
        v124[2] = __76__PKPaymentAuthorizationFooterView_setState_string_animated_withCompletion___block_invoke_6;
        v124[3] = &unk_1E3E614F0;
        v49 = v124;
        v124[4] = v36;
        -[PKGlyphView setState:animated:completionHandler:](v48, "setState:animated:completionHandler:", 7, v91, v124);
        goto LABEL_120;
      case 12:
        -[UIButton alpha](self->_payWithPasscodeButton, "alpha");
        if (v67 > 0.0)
          objc_msgSend(v37, "addObject:", self->_payWithPasscodeButton);
        -[PKGlyphView alpha](self->_glyphView, "alpha");
        if (v68 == 0.0)
          objc_msgSend(v38, "addObject:", self->_glyphView);
        if (v17)
          objc_msgSend(v38, "addObject:", self->_labelView);
        ++v133[3];
        v69 = self->_glyphView;
        v123[0] = MEMORY[0x1E0C809B0];
        v123[1] = 3221225472;
        v123[2] = __76__PKPaymentAuthorizationFooterView_setState_string_animated_withCompletion___block_invoke_7;
        v123[3] = &unk_1E3E614F0;
        v49 = v123;
        v123[4] = v36;
        -[PKGlyphView setState:animated:completionHandler:](v69, "setState:animated:completionHandler:", 11, v91, v123);
        goto LABEL_120;
      case 13:
        -[UIButton alpha](self->_payWithPasscodeButton, "alpha");
        if (v53 > 0.0)
          objc_msgSend(v37, "addObject:", self->_payWithPasscodeButton);
        -[PKGlyphView alpha](self->_glyphView, "alpha");
        if (v54 == 0.0)
          objc_msgSend(v38, "addObject:", self->_glyphView);
        if (v17)
          objc_msgSend(v38, "addObject:", self->_labelView);
        -[PKGlyphView setColorMode:animated:](self->_glyphView, "setColorMode:animated:", 3, v91);
        ++v133[3];
        v55 = self->_glyphView;
        v121[0] = MEMORY[0x1E0C809B0];
        v121[1] = 3221225472;
        v121[2] = __76__PKPaymentAuthorizationFooterView_setState_string_animated_withCompletion___block_invoke_8;
        v121[3] = &unk_1E3E614F0;
        v122 = v36;
        -[PKGlyphView setState:animated:completionHandler:](v55, "setState:animated:completionHandler:", 10, v91, v121);
        -[PKPaymentAuthorizationLayout glyphDimension](self->_layout, "glyphDimension");
        objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:weight:scale:", 4, 1, v56 / 43.0 * 34.0);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", CFSTR("exclamationmark"), v57);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKGlyphView primaryColor](self->_glyphView, "primaryColor");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "_flatImageWithColor:", v59);
        v60 = (void *)objc_claimAutoreleasedReturnValue();

        v61 = self->_glyphView;
        v62 = objc_retainAutorelease(v60);
        v63 = objc_msgSend(v62, "CGImage");
        objc_msgSend(v62, "alignmentRectInsets");
        -[PKGlyphView setCustomImage:withAlignmentEdgeInsets:](v61, "setCustomImage:withAlignmentEdgeInsets:", v63);

        v64 = (id *)&v122;
        goto LABEL_121;
      default:
        goto LABEL_122;
    }
  }
  if (a3 != 9)
  {
    self->_biometricSuccessOutstanding = 0;
    goto LABEL_50;
  }
  v30 = self->_state;
  if (v30 <= 5)
  {
    if (v17)
      -[UILabel setAttributedText:](self->_labelView, "setAttributedText:", v17);
    if (!self->_hasPearl || self->_state == 4)
    {
      AudioServicesPlaySystemSound(0x573u);
      v31 = 24;
      if (!self->_hasPearl)
        v31 = 23;
      objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR___PKPaymentAuthorizationFooterView__completionHandlers[v31]), "layer");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CD26F8], "pkui_shakeAnimation");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = (id)objc_msgSend(v32, "pkui_addAdditiveAnimation:", v33);

    }
  }
  if (v93)
    (*((void (**)(id, BOOL))v93 + 2))(v93, v30 < 6);
LABEL_126:
  v96 = 0u;
  v97 = 0u;
  v94 = 0u;
  v95 = 0u;
  v21 = v88;
  v82 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v94, v141, 16);
  if (v82)
  {
    v83 = *(_QWORD *)v95;
    do
    {
      for (j = 0; j != v82; ++j)
      {
        if (*(_QWORD *)v95 != v83)
          objc_enumerationMutation(v21);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v94 + 1) + 8 * j) + 16))();
      }
      v82 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v94, v141, 16);
    }
    while (v82);
  }

  objc_destroyWeak(&location);
LABEL_134:

}

void __76__PKPaymentAuthorizationFooterView_setState_string_animated_withCompletion___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  id v7;
  id v8;
  int v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _QWORD v28[4];
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    if (WeakRetained[59] == *(id *)(a1 + 48))
    {
      v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v5 = *(_QWORD *)(v4 + 24) - 1;
      *(_QWORD *)(v4 + 24) = v5;
      if (!v5)
      {
        if (*(_BYTE *)(a1 + 56))
          *((_BYTE *)WeakRetained + 496) = 0;
        v6 = *((unsigned __int8 *)WeakRetained + 480);
        v7 = WeakRetained[75];
        v8 = WeakRetained[61];
        v9 = *((unsigned __int8 *)v3 + 481);
        *((_BYTE *)v3 + 480) = 0;
        *((_BYTE *)v3 + 481) = 0;
        v10 = v3[61];
        v3[61] = 0;

        if (objc_msgSend(v3[63], "count"))
          v11 = (void *)objc_msgSend(v3[63], "copy");
        else
          v11 = 0;
        objc_msgSend(v3[63], "removeAllObjects");
        if (objc_msgSend(v3[64], "count"))
          v12 = (void *)objc_msgSend(v3[64], "copy");
        else
          v12 = 0;
        objc_msgSend(v3[64], "removeAllObjects");
        v32 = 0u;
        v33 = 0u;
        v30 = 0u;
        v31 = 0u;
        v13 = v11;
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v31;
          do
          {
            for (i = 0; i != v15; ++i)
            {
              if (*(_QWORD *)v31 != v16)
                objc_enumerationMutation(v13);
              (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i) + 16))();
            }
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
          }
          while (v15);
        }

        if (v6)
        {
          if (v9)
            v18 = 0;
          else
            v18 = v8;
          v28[0] = MEMORY[0x1E0C809B0];
          v28[1] = 3221225472;
          v28[2] = __76__PKPaymentAuthorizationFooterView_setState_string_animated_withCompletion___block_invoke_2;
          v28[3] = &unk_1E3E62288;
          v29 = v12;
          objc_msgSend(v3, "setState:string:animated:withCompletion:", v7, v18, 1, v28);
          if (v9)
            objc_msgSend(v3, "setState:string:animated:", 9, v8, 1);
          v19 = v29;
        }
        else
        {
          v26 = 0u;
          v27 = 0u;
          v24 = 0u;
          v25 = 0u;
          v19 = v12;
          v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
          if (v20)
          {
            v21 = v20;
            v22 = *(_QWORD *)v25;
            do
            {
              for (j = 0; j != v21; ++j)
              {
                if (*(_QWORD *)v25 != v22)
                  objc_enumerationMutation(v19);
                (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * j) + 16))(*(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * j));
              }
              v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
            }
            while (v21);
          }
        }

      }
    }
  }

}

void __76__PKPaymentAuthorizationFooterView_setState_string_animated_withCompletion___block_invoke_2(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v1);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v6 + 1) + 8 * v5) + 16))(*(_QWORD *)(*((_QWORD *)&v6 + 1) + 8 * v5));
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

uint64_t __76__PKPaymentAuthorizationFooterView_setState_string_animated_withCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __76__PKPaymentAuthorizationFooterView_setState_string_animated_withCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __76__PKPaymentAuthorizationFooterView_setState_string_animated_withCompletion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __76__PKPaymentAuthorizationFooterView_setState_string_animated_withCompletion___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __76__PKPaymentAuthorizationFooterView_setState_string_animated_withCompletion___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __76__PKPaymentAuthorizationFooterView_setState_string_animated_withCompletion___block_invoke_8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __76__PKPaymentAuthorizationFooterView_setState_string_animated_withCompletion___block_invoke_9(uint64_t a1)
{
  id *WeakRetained;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  int v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v3 = *(id *)(a1 + 32);
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v11;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v11 != v6)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "setAlpha:", 0.0, (_QWORD)v10);
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v5);
    }

    if (*(_QWORD *)(a1 + 40))
    {
      objc_msgSend(WeakRetained[52], "attributedText");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((PKEqualObjects() & 1) != 0 || !*(_BYTE *)(a1 + 64))
      {

      }
      else
      {
        v9 = objc_msgSend(*(id *)(a1 + 48), "containsObject:", WeakRetained[52]);

        if (v9)
          objc_msgSend(WeakRetained[52], "setAlpha:", 0.0);
      }
    }
    if (*(_BYTE *)(a1 + 65))
    {
      objc_msgSend(WeakRetained, "updateConstraintsIfNeeded");
      objc_msgSend(WeakRetained, "layoutIfNeeded");
    }
  }

}

void __76__PKPaymentAuthorizationFooterView_setState_string_animated_withCompletion___block_invoke_10(uint64_t a1)
{
  id *WeakRetained;
  uint64_t v3;
  id *v4;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    if (*(_QWORD *)(a1 + 32))
    {
      objc_msgSend(WeakRetained[52], "setAttributedText:");
      WeakRetained = v4;
    }
    v3 = *(_QWORD *)(a1 + 40);
    if (v3)
    {
      objc_msgSend(v4[54], "setTitle:forState:", v3, 0);
      WeakRetained = v4;
    }
  }

}

void __76__PKPaymentAuthorizationFooterView_setState_string_animated_withCompletion___block_invoke_11(uint64_t a1)
{
  id WeakRetained;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    v3 = *(id *)(a1 + 32);
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v9;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v9 != v6)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "setAlpha:", 1.0, (_QWORD)v8);
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v5);
    }

  }
}

void __76__PKPaymentAuthorizationFooterView_setState_string_animated_withCompletion___block_invoke_12(uint64_t a1)
{
  id *v2;
  _QWORD *WeakRetained;
  _QWORD *v4;
  dispatch_time_t v5;
  _QWORD block[4];
  id v7[2];
  char v8;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    if (WeakRetained[59] == *(_QWORD *)(a1 + 48))
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
      if (v4[75] == 1 && !*((_BYTE *)v4 + 598))
      {
        v5 = dispatch_time(0, 1850000000);
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __76__PKPaymentAuthorizationFooterView_setState_string_animated_withCompletion___block_invoke_13;
        block[3] = &unk_1E3E76CB0;
        objc_copyWeak(v7, v2);
        v7[1] = *(id *)(a1 + 48);
        v8 = *(_BYTE *)(a1 + 56);
        dispatch_after(v5, MEMORY[0x1E0C80D38], block);
        objc_destroyWeak(v7);
      }
    }
  }

}

void __76__PKPaymentAuthorizationFooterView_setState_string_animated_withCompletion___block_invoke_13(uint64_t a1)
{
  _QWORD *WeakRetained;
  _QWORD *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && WeakRetained[59] == *(_QWORD *)(a1 + 40) && WeakRetained[75] == 1)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "setState:string:animated:", 4, 0, *(unsigned __int8 *)(a1 + 48));
    WeakRetained = v3;
  }

}

void __76__PKPaymentAuthorizationFooterView_setState_string_animated_withCompletion___block_invoke_14(id *a1)
{
  _QWORD block[4];
  id v3;
  id v4;
  id v5;
  id v6[2];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__PKPaymentAuthorizationFooterView_setState_string_animated_withCompletion___block_invoke_15;
  block[3] = &unk_1E3E789E8;
  objc_copyWeak(v6, a1 + 7);
  v6[1] = a1[8];
  v3 = a1[4];
  v4 = a1[5];
  v5 = a1[6];
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(v6);
}

void __76__PKPaymentAuthorizationFooterView_setState_string_animated_withCompletion___block_invoke_15(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  id v9[2];

  v2 = (id *)(a1 + 56);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v4 = WeakRetained;
  if (WeakRetained && *((_QWORD *)WeakRetained + 59) == *(_QWORD *)(a1 + 64))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    v5 = (void *)MEMORY[0x1E0DC3F10];
    v6 = *(_QWORD *)(a1 + 40);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __76__PKPaymentAuthorizationFooterView_setState_string_animated_withCompletion___block_invoke_16;
    v7[3] = &unk_1E3E789C0;
    objc_copyWeak(v9, v2);
    v9[1] = *(id *)(a1 + 64);
    v8 = *(id *)(a1 + 48);
    objc_msgSend(v5, "_animateUsingDefaultTimingWithOptions:animations:completion:", 0, v6, v7);

    objc_destroyWeak(v9);
  }

}

void __76__PKPaymentAuthorizationFooterView_setState_string_animated_withCompletion___block_invoke_16(uint64_t a1)
{
  _QWORD *WeakRetained;
  _QWORD *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && WeakRetained[59] == *(_QWORD *)(a1 + 48))
  {
    v3 = WeakRetained;
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    WeakRetained = v3;
  }

}

- (void)_createSubviews
{
  UIView *v3;
  UIView *separatorView;
  UIView *v5;
  void *v6;
  UIView *v7;
  UIView *lockupView;
  PKGlyphView *v9;
  PKGlyphView *glyphView;
  double v11;
  double v12;
  NSString *v13;
  void *v14;
  uint64_t v15;
  PKContinuousButton *v16;
  UIButton *payWithPasscodeButton;
  UIButton *v18;
  void *v19;
  void *v20;
  UILabel *v21;
  UILabel *labelView;
  UILabel *v23;
  void *v24;
  void *v25;
  int64_t v26;
  NSString **v27;
  UILabel *v28;
  void *v29;
  uint64_t v30;
  __int128 v31;
  int64x2_t v32;

  v3 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
  separatorView = self->_separatorView;
  self->_separatorView = v3;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_separatorView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v5 = self->_separatorView;
  PKAuthorizationSeparatorColor();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](v5, "setBackgroundColor:", v6);

  -[PKPaymentAuthorizationFooterView addSubview:](self, "addSubview:", self->_separatorView);
  v7 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
  lockupView = self->_lockupView;
  self->_lockupView = v7;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_lockupView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[PKPaymentAuthorizationFooterView addSubview:](self, "addSubview:", self->_lockupView);
  v9 = (PKGlyphView *)objc_msgSend(objc_alloc(MEMORY[0x1E0D6BFF0]), "initWithStyle:", 1);
  glyphView = self->_glyphView;
  self->_glyphView = v9;

  -[PKGlyphView setDelegate:](self->_glyphView, "setDelegate:", self);
  -[PKGlyphView updateRasterizationScale:](self->_glyphView, "updateRasterizationScale:", PKUIScreenScale());
  -[PKGlyphView setTranslatesAutoresizingMaskIntoConstraints:](self->_glyphView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[PKGlyphView setAlpha:](self->_glyphView, "setAlpha:", 0.0);
  -[UIView addSubview:](self->_lockupView, "addSubview:", self->_glyphView);
  self->_emphasizedEdge = -[PKGlyphView userIntentEdge](self->_glyphView, "userIntentEdge");
  PKFloatRoundToPixel();
  v12 = v11;
  v13 = (NSString *)*MEMORY[0x1E0DC48D0];
  PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4A90], (NSString *)*MEMORY[0x1E0DC48D0]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "lineHeight");
  PKFloatRoundToPixel();
  v30 = v15;
  v31 = xmmword_19DEE0240;
  v32 = vdupq_n_s64(2uLL);
  v16 = -[PKContinuousButton initWithConfiguration:]([PKContinuousButton alloc], "initWithConfiguration:", &v30);
  payWithPasscodeButton = self->_payWithPasscodeButton;
  self->_payWithPasscodeButton = &v16->super;

  -[UIButton setContentEdgeInsets:](self->_payWithPasscodeButton, "setContentEdgeInsets:", v12, 25.0, 16.0 - v12, 25.0);
  -[UIButton addTarget:action:forControlEvents:](self->_payWithPasscodeButton, "addTarget:action:forControlEvents:", self, sel__payWithPasscodePressed, 64);
  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_payWithPasscodeButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v18 = self->_payWithPasscodeButton;
  -[PKPaymentAuthorizationFooterView _payWithPasscodeTitleForState:](self, "_payWithPasscodeTitleForState:", self->_state);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton setTitle:forState:](v18, "setTitle:forState:", v19, 0);

  -[UIButton titleLabel](self->_payWithPasscodeButton, "titleLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setFont:", v14);
  objc_msgSend(v20, "setLineBreakMode:", 4);
  -[UIButton sizeToFit](self->_payWithPasscodeButton, "sizeToFit");
  -[UIButton setAlpha:](self->_payWithPasscodeButton, "setAlpha:", 0.0);
  -[PKPaymentAuthorizationFooterView addSubview:](self, "addSubview:", self->_payWithPasscodeButton);
  v21 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  labelView = self->_labelView;
  self->_labelView = v21;

  -[UILabel setAlpha:](self->_labelView, "setAlpha:", 0.0);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_labelView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v23 = self->_labelView;
  PKLocalizedPaymentString(CFSTR("IN_APP_PAYMENT_TOUCH_ID"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentAuthorizationFooterView _titleLabelAttributedString:](self, "_titleLabelAttributedString:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setAttributedText:](v23, "setAttributedText:", v25);

  -[UILabel setOpaque:](self->_labelView, "setOpaque:", 0);
  -[UILabel setAdjustsFontSizeToFitWidth:](self->_labelView, "setAdjustsFontSizeToFitWidth:", 1);
  v26 = -[PKPaymentAuthorizationLayout style](self->_layout, "style");
  v27 = (NSString **)MEMORY[0x1E0DC4A88];
  if (v26 != 1)
    v27 = (NSString **)MEMORY[0x1E0DC4B60];
  v28 = self->_labelView;
  PKFontForDefaultDesign(*v27, v13);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v28, "setFont:", v29);

  -[UIView addSubview:](self->_lockupView, "addSubview:", self->_labelView);
}

- (void)updateRotation
{
  -[PKGlyphView updateRotation](self->_glyphView, "updateRotation");
}

- (void)setHidden:(BOOL)a3
{
  _BOOL4 v3;
  int *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)PKPaymentAuthorizationFooterView;
  -[PKPaymentAuthorizationFooterView setHidden:](&v6, sel_setHidden_);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", self->_staticRegularConstraints);
    objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", self->_dynamicRegularConstraints);
    v5 = &OBJC_IVAR___PKPaymentAuthorizationFooterView__hiddenConstraints;
  }
  else
  {
    if (self->_constraintState != self->_queuedConstraintState || self->_constraintsDirty)
    {
      -[PKPaymentAuthorizationFooterView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
      -[PKPaymentAuthorizationFooterView updateConstraintsIfNeeded](self, "updateConstraintsIfNeeded");
    }
    v5 = &OBJC_IVAR___PKPaymentAuthorizationFooterView__dynamicRegularConstraints;
    objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", self->_hiddenConstraints);
    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", self->_staticRegularConstraints);
  }
  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", *(Class *)((char *)&self->super.super.super.isa + *v5));
}

- (void)setHidesSeparatorView:(BOOL)a3
{
  if (((!self->_hidesSeparatorView ^ a3) & 1) == 0)
  {
    self->_hidesSeparatorView = a3;
    -[UIView setHidden:](self->_separatorView, "setHidden:");
  }
}

- (id)createDefaultHeightConstraintForConstraintState:(int64_t)a3
{
  double v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  void *v15;

  if ((unint64_t)a3 >= 2)
  {
    if (a3 == 2)
    {
      -[PKPaymentAuthorizationFooterView heightAnchor](self, "heightAnchor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = 0.0;
      goto LABEL_15;
    }
    return 0;
  }
  else
  {
    if (-[PKPaymentAuthorizationLayout style](self->_layout, "style"))
    {
      if (a3 != 1)
      {
        v12 = 0.0;
        if (!self->_compact)
        {
          PKConstrainedAuthorizationViewBodyFont((NSString *)*MEMORY[0x1E0DC48D0]);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "_bodyLeading");
          v12 = v14;

        }
        -[PKPaymentAuthorizationFooterView bottomAnchor](self, "bottomAnchor");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel lastBaselineAnchor](self->_labelView, "lastBaselineAnchor");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "constraintEqualToAnchor:constant:", v15, v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_16;
      }
      if (self->_compact)
        v5 = 101.0;
      else
        v5 = fmax(self->_minimumHeight, 101.0);
      -[PKPaymentAuthorizationFooterView heightAnchor](self, "heightAnchor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = v5;
LABEL_15:
      objc_msgSend(v6, "constraintEqualToConstant:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_16:

      return v9;
    }
    -[PKPaymentAuthorizationFooterView heightAnchor](self, "heightAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToConstant:", 201.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v11) = 1144750080;
    objc_msgSend(v9, "setPriority:", v11);
  }
  return v9;
}

- (void)updateConstraints
{
  id WeakRetained;
  int64_t queuedConstraintState;
  double v6;
  double v7;
  double v8;
  NSLayoutConstraint *separatorLeftConstraint;
  void *v10;
  void *v11;
  NSLayoutConstraint *v12;
  NSLayoutConstraint *v13;
  _BOOL4 compact;
  NSMutableArray *dynamicRegularConstraints;
  void *v16;
  UILabel *labelView;
  void *v18;
  void *v19;
  NSMutableArray *v20;
  id v21;
  int64_t v22;
  NSMutableArray *v23;
  UIButton *payWithPasscodeButton;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  objc_super v29;

  v29.receiver = self;
  v29.super_class = (Class)PKPaymentAuthorizationFooterView;
  -[PKPaymentAuthorizationFooterView updateConstraints](&v29, sel_updateConstraints);
  if ((-[PKPaymentAuthorizationFooterView isHidden](self, "isHidden") & 1) != 0)
    return;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "authorizationFooterViewWillChangeConstraints:", self);
  self->_constraintsDirty = 0;
  queuedConstraintState = self->_queuedConstraintState;
  if (self->_constraintState != queuedConstraintState)
  {
    self->_constraintState = queuedConstraintState;
    if (queuedConstraintState != 1 || !self->_isPad)
    {
      self->_minimumHeight = 0.0;
    }
    else
    {
      -[PKPaymentAuthorizationFooterView frame](self, "frame");
      self->_minimumHeight = fmax(v6, self->_minimumHeight);
    }
  }
  if (-[NSMutableArray count](self->_dynamicRegularConstraints, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", self->_dynamicRegularConstraints);
    -[NSMutableArray removeAllObjects](self->_dynamicRegularConstraints, "removeAllObjects");
  }
  if (!-[PKPaymentAuthorizationLayout shouldSuppressTotal](self->_layout, "shouldSuppressTotal")
    || (v7 = 0.0, !self->_occludesBodyView))
  {
    -[PKPaymentAuthorizationLayout contentHorizontalMargin](self->_layout, "contentHorizontalMargin");
    v7 = (double)(uint64_t)v8;
  }
  separatorLeftConstraint = self->_separatorLeftConstraint;
  if (separatorLeftConstraint)
  {
    -[NSLayoutConstraint setConstant:](separatorLeftConstraint, "setConstant:", v7);
  }
  else
  {
    -[UIView leftAnchor](self->_separatorView, "leftAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentAuthorizationFooterView leftAnchor](self, "leftAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToAnchor:constant:", v11, v7);
    v12 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    v13 = self->_separatorLeftConstraint;
    self->_separatorLeftConstraint = v12;

  }
  -[NSMutableArray addObject:](self->_dynamicRegularConstraints, "addObject:", self->_separatorLeftConstraint);
  compact = self->_compact;
  dynamicRegularConstraints = self->_dynamicRegularConstraints;
  -[UIView bottomAnchor](self->_lockupView, "bottomAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  labelView = self->_labelView;
  if (compact)
    -[UILabel lastBaselineAnchor](labelView, "lastBaselineAnchor");
  else
    -[UILabel bottomAnchor](labelView, "bottomAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToAnchor:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](dynamicRegularConstraints, "addObject:", v19);

  v20 = self->_dynamicRegularConstraints;
  v21 = -[PKPaymentAuthorizationFooterView createDefaultHeightConstraintForConstraintState:](self, "createDefaultHeightConstraintForConstraintState:", self->_constraintState);
  -[NSMutableArray addObject:](v20, "addObject:", v21);

  v22 = self->_queuedConstraintState;
  if (!v22 || v22 == 2)
  {
    v23 = self->_dynamicRegularConstraints;
    payWithPasscodeButton = self->_payWithPasscodeButton;
    goto LABEL_28;
  }
  if (v22 == 1)
  {
    v23 = self->_dynamicRegularConstraints;
    payWithPasscodeButton = self->_payWithPasscodeButton;
    if (self->_compact)
    {
      -[UIButton topAnchor](payWithPasscodeButton, "topAnchor");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentAuthorizationFooterView topAnchor](self, "topAnchor");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "constraintEqualToAnchor:constant:", v26, 34.0);
      v27 = objc_claimAutoreleasedReturnValue();
LABEL_29:
      v28 = (void *)v27;
      -[NSMutableArray addObject:](v23, "addObject:", v27);

      goto LABEL_30;
    }
LABEL_28:
    -[UIButton centerYAnchor](payWithPasscodeButton, "centerYAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentAuthorizationFooterView centerYAnchor](self, "centerYAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToAnchor:", v26);
    v27 = objc_claimAutoreleasedReturnValue();
    goto LABEL_29;
  }
LABEL_30:
  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", self->_dynamicRegularConstraints);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "authorizationFooterViewDidChangeConstraints:", self);

}

- (void)_prepareConstraints
{
  id v3;
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  PKGlyphView *glyphView;
  double v25;
  void *v26;
  void *v27;
  PKGlyphView *v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  NSArray *v38;
  NSArray *staticRegularConstraints;
  void *v40;
  NSArray *v41;
  NSArray *hiddenConstraints;
  _QWORD v43[2];

  v43[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_separatorView, 2, 0, self, 2, 1.0, 0.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_separatorView, 3, 0, self, 3, 1.0, 0.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v5);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_separatorView, 8, 0, 0, 0, 1.0, PKUIPixelLength());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v6);

  PKConstrainedAuthorizationViewBodyFont((NSString *)*MEMORY[0x1E0DC48D0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_bodyLeading");

  -[UIView leadingAnchor](self->_lockupView, "leadingAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentAuthorizationFooterView leadingAnchor](self, "leadingAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintEqualToAnchor:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v10);

  -[UIView trailingAnchor](self->_lockupView, "trailingAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentAuthorizationFooterView trailingAnchor](self, "trailingAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToAnchor:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v13);

  -[UIView topAnchor](self->_lockupView, "topAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentAuthorizationFooterView topAnchor](self, "topAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  PKFloatRoundToPixel();
  objc_msgSend(v14, "constraintGreaterThanOrEqualToAnchor:constant:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v16);

  -[UIView centerYAnchor](self->_lockupView, "centerYAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentAuthorizationFooterView centerYAnchor](self, "centerYAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v20) = 1144750080;
  objc_msgSend(v19, "setPriority:", v20);
  objc_msgSend(v3, "addObject:", v19);
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_glyphView, 9, 0, self->_lockupView, 9, 1.0, 0.0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v21);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_glyphView, 3, 0, self->_lockupView, 3, 1.0, 0.0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v22);

  v23 = (void *)MEMORY[0x1E0CB3718];
  glyphView = self->_glyphView;
  -[PKPaymentAuthorizationLayout glyphDimension](self->_layout, "glyphDimension");
  objc_msgSend(v23, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", glyphView, 7, 0, 0, 0, 1.0, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v26);

  v27 = (void *)MEMORY[0x1E0CB3718];
  v28 = self->_glyphView;
  -[PKPaymentAuthorizationLayout glyphDimension](self->_layout, "glyphDimension");
  objc_msgSend(v27, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v28, 8, 0, 0, 0, 1.0, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v30);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_payWithPasscodeButton, 9, 0, self->_lockupView, 9, 1.0, 0.0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v31);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_payWithPasscodeButton, 7, -1, self, 7, 1.0, -20.0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v32);

  if (-[PKPaymentAuthorizationLayout style](self->_layout, "style"))
  {
    PKFloatRoundToPixel();
    v34 = v33;
  }
  else
  {
    v34 = 30.0;
  }
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_labelView, 5, 0, self->_lockupView, 5, 1.0, 0.0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v35);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_labelView, 6, 0, self->_lockupView, 6, 1.0, 0.0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v36);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_labelView, 12, 0, self->_glyphView, 4, 1.0, v34);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v37);

  v38 = (NSArray *)objc_msgSend(v3, "copy");
  staticRegularConstraints = self->_staticRegularConstraints;
  self->_staticRegularConstraints = v38;

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self, 8, 0, 0, 0, 1.0, 0.0);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v43[0] = v40;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 1);
  v41 = (NSArray *)objc_claimAutoreleasedReturnValue();
  hiddenConstraints = self->_hiddenConstraints;
  self->_hiddenConstraints = v41;

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", self->_staticRegularConstraints);
  -[PKPaymentAuthorizationFooterView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");

}

- (id)_titleLabelAttributedString:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[3];
  _QWORD v15[4];

  v15[3] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0DC1288];
  v4 = a3;
  objc_msgSend(v3, "defaultParagraphStyle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v6, "setAlignment:", 1);
  v14[0] = *MEMORY[0x1E0DC1138];
  PKConstrainedAuthorizationViewBodyFont((NSString *)*MEMORY[0x1E0DC48D0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x1E0DC1178];
  v15[0] = v7;
  v15[1] = v6;
  v9 = *MEMORY[0x1E0DC1140];
  v14[1] = v8;
  v14[2] = v9;
  PKAuthorizationViewValueLabelColor();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v4, v11);
  return v12;
}

- (id)_titleAttributedStringForState:(int64_t)a3
{
  void *v3;
  NSString *biometricConfirmationTitle;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  uint64_t v9;
  int64_t userIntentStyle;
  unint64_t requestType;

  v3 = 0;
  switch(a3)
  {
    case 0:
    case 2:
    case 5:
      if (PKPearlIsAvailable())
        goto LABEL_12;
      biometricConfirmationTitle = self->_biometricConfirmationTitle;
      if (!biometricConfirmationTitle)
      {
        switch(self->_confirmationStyle)
        {
          case 0uLL:
            v6 = CFSTR("IN_APP_PAYMENT_TOUCH_ID");
            goto LABEL_27;
          case 1uLL:
            v6 = CFSTR("IN_APP_PAYMENT_CONFIRM_WITH_TOUCH_ID");
            goto LABEL_27;
          case 2uLL:
            v6 = CFSTR("IN_APP_PAYMENT_GET_WITH_TOUCH_ID");
            goto LABEL_27;
          case 3uLL:
            v6 = CFSTR("IN_APP_PAYMENT_INSTALL_WITH_TOUCH_ID");
            goto LABEL_27;
          case 4uLL:
            v6 = CFSTR("IN_APP_PAYMENT_RENT_WITH_TOUCH_ID");
            goto LABEL_27;
          case 5uLL:
            v6 = CFSTR("IN_APP_PAYMENT_REDEEM_WITH_TOUCH_ID");
            goto LABEL_27;
          case 6uLL:
            v6 = CFSTR("IN_APP_PAYMENT_ADD_WITH_TOUCH_ID");
            goto LABEL_27;
          case 7uLL:
            v6 = CFSTR("IN_APP_PAYMENT_SUBSCRIBE_WITH_TOUCH_ID");
            goto LABEL_27;
          case 8uLL:
            v6 = CFSTR("IN_APP_PAYMENT_SUBSCRIBE_AND_INSTALL_WITH_TOUCH_ID");
            goto LABEL_27;
          default:
            goto LABEL_30;
        }
      }
      goto LABEL_17;
    case 1:
      v7 = CFSTR("GENERIC_PEARL_FAILURE");
      goto LABEL_13;
    case 3:
      if (self->_queuedConstraintState == 2)
      {
        v8 = CFSTR(" ");
        goto LABEL_29;
      }
      userIntentStyle = self->_userIntentStyle;
      switch(userIntentStyle)
      {
        case 1:
          if (self->_isPad)
          {
            if (self->_emphasizedEdge == 1)
              v7 = CFSTR("IN_APP_PAYMENT_PUSH_BUTTON_SECONDARY_PAD_TOP");
            else
              v7 = CFSTR("IN_APP_PAYMENT_PUSH_BUTTON_SECONDARY_PAD");
          }
          else
          {
            v7 = CFSTR("IN_APP_PAYMENT_PUSH_BUTTON_SECONDARY");
          }
          goto LABEL_13;
        case 3:
          v7 = CFSTR("ACCESSIBILITY_PUSH_BUTTON_SWITCH_CONTROL");
          goto LABEL_13;
        case 2:
          v7 = CFSTR("ACCESSIBILITY_PUSH_BUTTON_ASSISTIVE_TOUCH");
LABEL_13:
          PKLocalizedPearlString(&v7->isa);
          v9 = objc_claimAutoreleasedReturnValue();
          goto LABEL_28;
      }
LABEL_30:
      v3 = 0;
      return v3;
    case 6:
      v7 = CFSTR("CAMERA_OBSCURED_FOOTER_INSTRUCTION");
      goto LABEL_13;
    case 7:
      v7 = CFSTR("POSE_OUT_OF_RANGE_DOWN_INSTRUCTION");
      goto LABEL_13;
    case 8:
      if (!self->_hasPearl)
        goto LABEL_30;
LABEL_12:
      v7 = CFSTR("GENERIC_PEARL");
      goto LABEL_13;
    case 9:
      if (self->_state == 1)
        goto LABEL_30;
      v6 = CFSTR("IN_APP_PAYMENT_TRY_AGAIN");
      goto LABEL_27;
    case 10:
      goto LABEL_26;
    case 11:
      biometricConfirmationTitle = self->_authorizingTitle;
      if (biometricConfirmationTitle)
      {
LABEL_17:
        v8 = biometricConfirmationTitle;
        goto LABEL_29;
      }
      requestType = self->_requestType;
      if (requestType == 3)
      {
LABEL_26:
        v6 = CFSTR("IN_APP_PAYMENT_PROCESSING");
      }
      else
      {
        if (requestType == 4)
        {
          PKLocalizedFeatureString();
          v9 = objc_claimAutoreleasedReturnValue();
          goto LABEL_28;
        }
        v6 = CFSTR("IN_APP_PAYMENT_AUTHORIZING");
      }
LABEL_27:
      PKLocalizedPaymentString(&v6->isa);
      v9 = objc_claimAutoreleasedReturnValue();
LABEL_28:
      v8 = (__CFString *)v9;
      if (!v9)
        goto LABEL_30;
LABEL_29:
      -[PKPaymentAuthorizationFooterView _titleLabelAttributedString:](self, "_titleLabelAttributedString:", v8);
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      return v3;
    case 12:
      v6 = CFSTR("IN_APP_PAYMENT_AUTHORIZED");
      goto LABEL_27;
    default:
      return v3;
  }
}

- (id)_payWithPasscodeTitleForState:(int64_t)a3
{
  NSString *confirmationTitle;
  id result;
  unint64_t confirmationStyle;
  void *v7;
  __CFString *v8;

  confirmationTitle = self->_confirmationTitle;
  if (confirmationTitle)
    return confirmationTitle;
  confirmationStyle = self->_confirmationStyle;
  v7 = 0;
  switch(confirmationStyle)
  {
    case 0uLL:
      if (!-[PKPaymentAuthorizationLayout isAMPPayment](self->_layout, "isAMPPayment", a3))
        goto LABEL_6;
      v8 = CFSTR("IN_APP_PAYMENT_STORE_PURCHASE");
      goto LABEL_15;
    case 1uLL:
      v8 = CFSTR("IN_APP_PAYMENT_STORE_CONFIRM");
      goto LABEL_15;
    case 2uLL:
      v8 = CFSTR("IN_APP_PAYMENT_STORE_GET");
      goto LABEL_15;
    case 3uLL:
      v8 = CFSTR("IN_APP_PAYMENT_STORE_INSTALL");
      goto LABEL_15;
    case 4uLL:
      v8 = CFSTR("IN_APP_PAYMENT_STORE_RENT");
      goto LABEL_15;
    case 5uLL:
      v8 = CFSTR("IN_APP_PAYMENT_STORE_REDEEM");
      goto LABEL_15;
    case 6uLL:
      v8 = CFSTR("IN_APP_PAYMENT_STORE_ADD");
      goto LABEL_15;
    case 7uLL:
      v8 = CFSTR("IN_APP_PAYMENT_STORE_SUBSCRIBE");
      goto LABEL_15;
    case 8uLL:
      v8 = CFSTR("IN_APP_PAYMENT_STORE_SUBSCRIBE_AND_INSTALL");
      goto LABEL_15;
    case 9uLL:
      goto LABEL_16;
    default:
LABEL_6:
      v8 = CFSTR("IN_APP_PAYMENT_PAY_WITH_PASSCODE");
LABEL_15:
      PKLocalizedPaymentString(&v8->isa);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_16:
      result = v7;
      break;
  }
  return result;
}

- (void)glyphView:(id)a3 revealingCheckmark:(BOOL)a4
{
  void *v5;
  int64_t completionStyle;
  SystemSoundID v7;

  if (self->_state == 12)
  {
    -[PKPaymentAuthorizationFooterView window](self, "window", a3, a4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      kdebug_trace();
      completionStyle = self->_completionStyle;
      if (!completionStyle)
      {
        v7 = 1394;
        goto LABEL_8;
      }
      if (completionStyle == 1)
      {
        v7 = 1275;
LABEL_8:
        AudioServicesPlaySystemSound(v7);
      }
    }
  }
}

- (void)glyphViewUserIntentEdgeDidChange:(id)a3
{
  unsigned int v4;

  v4 = objc_msgSend(a3, "userIntentEdge");
  if (self->_emphasizedEdge != v4)
  {
    self->_emphasizedEdge = v4;
    if (self->_isPad)
      -[PKPaymentAuthorizationFooterView setState:string:animated:](self, "setState:string:animated:", self->_state, self->_overrideString, 1);
  }
}

- (void)_payWithPasscodePressed
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "authorizationFooterViewPasscodeButtonPressed:", self);

}

- (int64_t)state
{
  return self->_state;
}

- (PKPaymentAuthorizationLayout)layout
{
  return self->_layout;
}

- (void)setLayout:(id)a3
{
  objc_storeStrong((id *)&self->_layout, a3);
}

- (unint64_t)requestType
{
  return self->_requestType;
}

- (unint64_t)confirmationStyle
{
  return self->_confirmationStyle;
}

- (int64_t)userIntentStyle
{
  return self->_userIntentStyle;
}

- (void)setUserIntentStyle:(int64_t)a3
{
  self->_userIntentStyle = a3;
}

- (NSString)biometricConfirmationTitle
{
  return self->_biometricConfirmationTitle;
}

- (void)setBiometricConfirmationTitle:(id)a3
{
  objc_storeStrong((id *)&self->_biometricConfirmationTitle, a3);
}

- (NSString)confirmationTitle
{
  return self->_confirmationTitle;
}

- (void)setConfirmationTitle:(id)a3
{
  objc_storeStrong((id *)&self->_confirmationTitle, a3);
}

- (NSString)authorizingTitle
{
  return self->_authorizingTitle;
}

- (void)setAuthorizingTitle:(id)a3
{
  objc_storeStrong((id *)&self->_authorizingTitle, a3);
}

- (BOOL)occludesBodyView
{
  return self->_occludesBodyView;
}

- (void)setOccludesBodyView:(BOOL)a3
{
  self->_occludesBodyView = a3;
}

- (BOOL)hidesSeparatorView
{
  return self->_hidesSeparatorView;
}

- (int64_t)completionStyle
{
  return self->_completionStyle;
}

- (void)setCompletionStyle:(int64_t)a3
{
  self->_completionStyle = a3;
}

- (BOOL)preventPasscodeFallbackForBiometricFailure
{
  return self->_preventPasscodeFallbackForBiometricFailure;
}

- (void)setPreventPasscodeFallbackForBiometricFailure:(BOOL)a3
{
  self->_preventPasscodeFallbackForBiometricFailure = a3;
}

- (BOOL)preventBiometricStateFallbacks
{
  return self->_preventBiometricStateFallbacks;
}

- (void)setPreventBiometricStateFallbacks:(BOOL)a3
{
  self->_preventBiometricStateFallbacks = a3;
}

- (PKPaymentAuthorizationFooterViewDelegate)delegate
{
  return (PKPaymentAuthorizationFooterViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_authorizingTitle, 0);
  objc_storeStrong((id *)&self->_confirmationTitle, 0);
  objc_storeStrong((id *)&self->_biometricConfirmationTitle, 0);
  objc_storeStrong((id *)&self->_layout, 0);
  objc_storeStrong((id *)&self->_dynamicRegularConstraints, 0);
  objc_storeStrong((id *)&self->_staticRegularConstraints, 0);
  objc_storeStrong((id *)&self->_hiddenConstraints, 0);
  objc_storeStrong((id *)&self->_separatorLeftConstraint, 0);
  objc_storeStrong((id *)&self->_deferredCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_completionHandlers, 0);
  objc_storeStrong((id *)&self->_deferredStateString, 0);
  objc_storeStrong((id *)&self->_overrideString, 0);
  objc_storeStrong((id *)&self->_lockupView, 0);
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_passbookPaymentDetailsView, 0);
  objc_storeStrong((id *)&self->_payWithPasscodeButton, 0);
  objc_storeStrong((id *)&self->_glyphView, 0);
  objc_storeStrong((id *)&self->_labelView, 0);
}

@end
