@implementation UIKBMultilingualKeyboardArtworkView

- (UIKBMultilingualKeyboardArtworkView)initWithLanguage1:(id)a3 andLanguage2:(id)a4
{
  id v7;
  id v8;
  UIKBMultilingualKeyboardArtworkView *v9;
  UIKBMultilingualKeyboardArtworkView *v10;
  void *v11;
  void *v12;
  void *v13;
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
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  unint64_t v42;
  NSObject *v43;
  NSObject *v44;
  uint8_t v45[16];
  objc_super v46;

  v7 = a3;
  v8 = a4;
  v46.receiver = self;
  v46.super_class = (Class)UIKBMultilingualKeyboardArtworkView;
  v9 = -[UIView initWithFrame:](&v46, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_language1, a3);
    objc_storeStrong((id *)&v10->_language2, a4);
    v11 = (void *)objc_opt_new();
    -[UIKBMultilingualKeyboardArtworkView setMemoji1:](v10, "setMemoji1:", v11);

    -[UIKBMultilingualKeyboardArtworkView memoji1](v10, "memoji1");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[UIKBMultilingualKeyboardArtworkView memoji1](v10, "memoji1");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setAlpha:", 0.0);

    v14 = (void *)objc_opt_class();
    objc_msgSend((id)objc_opt_class(), "_memojiAssets1");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "memojiImageForLanguage:from:", v7, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBMultilingualKeyboardArtworkView memoji1](v10, "memoji1");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setImage:", v16);

    -[UIKBMultilingualKeyboardArtworkView memoji1](v10, "memoji1");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addSubview:](v10, "addSubview:", v18);

    v19 = (void *)objc_opt_new();
    -[UIKBMultilingualKeyboardArtworkView setMemoji2:](v10, "setMemoji2:", v19);

    -[UIKBMultilingualKeyboardArtworkView memoji2](v10, "memoji2");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[UIKBMultilingualKeyboardArtworkView memoji2](v10, "memoji2");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setAlpha:", 0.0);

    v22 = (void *)objc_opt_class();
    objc_msgSend((id)objc_opt_class(), "_memojiAssets2");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "memojiImageForLanguage:from:", v8, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBMultilingualKeyboardArtworkView memoji2](v10, "memoji2");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setImage:", v24);

    -[UIKBMultilingualKeyboardArtworkView memoji2](v10, "memoji2");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addSubview:](v10, "addSubview:", v26);

    TIInputModeGetLanguage();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v26) = objc_msgSend(v27, "isEqualToString:", CFSTR("en"));

    if ((_DWORD)v26)
    {
      GetExampleSentencesForLanguage(v8);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "objectAtIndexedSubscript:", 0);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      v30 = v8;
      v31 = v8;
    }
    else
    {
      TIInputModeGetLanguage();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "isEqualToString:", CFSTR("en"));

      GetExampleSentencesForLanguage(v7);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "objectAtIndexedSubscript:", 0);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (v33)
        v30 = v7;
      else
        v30 = v8;
      v31 = v7;
    }
    GetExampleSentencesForLanguage(v30);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "objectAtIndexedSubscript:", 1);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    GetAlternativeExampleSentencesForLanguage(v31);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "objectAtIndexedSubscript:", 0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    GetAlternativeExampleSentencesForLanguage(v30);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "objectAtIndexedSubscript:", 1);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v29, "length") || !objc_msgSend(v36, "length"))
    {
      if (os_variant_has_internal_diagnostics())
      {
        __UIFaultDebugAssertLog();
        v44 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)v45 = 0;
          _os_log_fault_impl(&dword_185066000, v44, OS_LOG_TYPE_FAULT, "Multilingual Education UI: Required Examples are empty.", v45, 2u);
        }

      }
      else
      {
        v42 = initWithLanguage1_andLanguage2____s_category;
        if (!initWithLanguage1_andLanguage2____s_category)
        {
          v42 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v42, (unint64_t *)&initWithLanguage1_andLanguage2____s_category);
        }
        v43 = *(NSObject **)(v42 + 8);
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v45 = 0;
          _os_log_impl(&dword_185066000, v43, OS_LOG_TYPE_ERROR, "Multilingual Education UI: Required Examples are empty.", v45, 2u);
        }
      }
    }
    -[UIKBMultilingualKeyboardArtworkView animateBubblesWithExample1:example2:altExample1:altExample2:showAltExample:](v10, "animateBubblesWithExample1:example2:altExample1:altExample2:showAltExample:", v29, v36, v38, v40, 0);

  }
  return v10;
}

- (void)animateBubblesWithExample1:(id)a3 example2:(id)a4 altExample1:(id)a5 altExample2:(id)a6 showAltExample:(BOOL)a7
{
  _BOOL4 v7;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  _BOOL4 v18;
  UIKBTutorialConversationBubble *v19;
  id v20;
  id v21;
  UIKBTutorialConversationBubble *v22;
  void *v23;
  void *v24;
  UIKBTutorialConversationBubble *v25;
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
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  id v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  BOOL v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  BOOL v108;
  _QWORD v109[5];
  id v110;
  id v111;
  id v112;
  id v113;
  BOOL v114;
  BOOL v115;
  _QWORD v116[5];
  _QWORD v117[5];
  _QWORD v118[5];
  CGAffineTransform v119;
  CGAffineTransform v120;
  _QWORD v121[5];
  _QWORD v122[19];

  v7 = a7;
  v122[16] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  -[UIKBMultilingualKeyboardArtworkView bubble1](self, "bubble1");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "removeFromSuperview");

  -[UIKBMultilingualKeyboardArtworkView bubble2](self, "bubble2");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "removeFromSuperview");

  if (objc_msgSend(v14, "length"))
    v18 = objc_msgSend(v15, "length") != 0;
  else
    v18 = 0;
  v108 = v18;
  v19 = [UIKBTutorialConversationBubble alloc];
  if (v7 && v18)
    v20 = v14;
  else
    v20 = v12;
  if (v7 && v18)
    v21 = v15;
  else
    v21 = v13;
  v107 = v14;
  v22 = -[UIKBTutorialConversationBubble initWithText:originationDirection:](v19, "initWithText:originationDirection:", v20, 1);
  -[UIKBMultilingualKeyboardArtworkView setBubble1:](self, "setBubble1:", v22);

  -[UIKBMultilingualKeyboardArtworkView bubble1](self, "bubble1");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[UIKBMultilingualKeyboardArtworkView bubble1](self, "bubble1");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView addSubview:](self, "addSubview:", v24);

  v25 = -[UIKBTutorialConversationBubble initWithText:originationDirection:]([UIKBTutorialConversationBubble alloc], "initWithText:originationDirection:", v21, 0);
  -[UIKBMultilingualKeyboardArtworkView setBubble2:](self, "setBubble2:", v25);

  -[UIKBMultilingualKeyboardArtworkView bubble2](self, "bubble2");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[UIKBMultilingualKeyboardArtworkView bubble2](self, "bubble2");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView addSubview:](self, "addSubview:", v27);

  v76 = (void *)MEMORY[0x1E0D156E0];
  -[UIKBMultilingualKeyboardArtworkView memoji1](self, "memoji1");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "bottomAnchor");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView centerYAnchor](self, "centerYAnchor");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v105, "constraintEqualToAnchor:constant:", v104, -10.0);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  v122[0] = v103;
  -[UIKBMultilingualKeyboardArtworkView memoji1](self, "memoji1");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v102, "trailingAnchor");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView centerXAnchor](self, "centerXAnchor");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "constraintEqualToAnchor:", v100);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  v122[1] = v99;
  -[UIKBMultilingualKeyboardArtworkView memoji1](self, "memoji1");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "widthAnchor");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "constraintEqualToConstant:", 50.0);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v122[2] = v96;
  -[UIKBMultilingualKeyboardArtworkView memoji1](self, "memoji1");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "heightAnchor");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "constraintEqualToConstant:", 50.0);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v122[3] = v91;
  -[UIKBMultilingualKeyboardArtworkView memoji2](self, "memoji2");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "topAnchor");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView centerYAnchor](self, "centerYAnchor");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "constraintEqualToAnchor:constant:", v86, 10.0);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v122[4] = v85;
  -[UIKBMultilingualKeyboardArtworkView memoji2](self, "memoji2");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "leadingAnchor");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView centerXAnchor](self, "centerXAnchor");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "constraintEqualToAnchor:", v82);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v122[5] = v81;
  -[UIKBMultilingualKeyboardArtworkView memoji2](self, "memoji2");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "widthAnchor");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "constraintEqualToConstant:", 50.0);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v122[6] = v78;
  -[UIKBMultilingualKeyboardArtworkView memoji2](self, "memoji2");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "heightAnchor");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "constraintEqualToConstant:", 50.0);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v122[7] = v74;
  -[UIKBMultilingualKeyboardArtworkView bubble1](self, "bubble1");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "leadingAnchor");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBMultilingualKeyboardArtworkView memoji1](self, "memoji1");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "trailingAnchor");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "constraintEqualToAnchor:constant:", v70, -10.0);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v122[8] = v69;
  -[UIKBMultilingualKeyboardArtworkView bubble1](self, "bubble1");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "topAnchor");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBMultilingualKeyboardArtworkView memoji1](self, "memoji1");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "topAnchor");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "constraintEqualToAnchor:", v65);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v122[9] = v64;
  -[UIKBMultilingualKeyboardArtworkView bubble1](self, "bubble1");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "widthAnchor");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "constraintEqualToConstant:", 148.0);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v122[10] = v61;
  -[UIKBMultilingualKeyboardArtworkView bubble1](self, "bubble1");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "trailingAnchor");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView trailingAnchor](self, "trailingAnchor");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "constraintLessThanOrEqualToAnchor:", v58);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v122[11] = v57;
  -[UIKBMultilingualKeyboardArtworkView bubble2](self, "bubble2");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "trailingAnchor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBMultilingualKeyboardArtworkView memoji2](self, "memoji2");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "leadingAnchor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "constraintEqualToAnchor:constant:", v53, 10.0);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v122[12] = v52;
  -[UIKBMultilingualKeyboardArtworkView bubble2](self, "bubble2");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "topAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBMultilingualKeyboardArtworkView memoji2](self, "memoji2");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "topAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "constraintEqualToAnchor:", v48);
  v95 = v15;
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v122[13] = v28;
  -[UIKBMultilingualKeyboardArtworkView bubble2](self, "bubble2");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "widthAnchor");
  v93 = v12;
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "constraintEqualToConstant:", 148.0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v122[14] = v31;
  -[UIKBMultilingualKeyboardArtworkView bubble2](self, "bubble2");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "leadingAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView leadingAnchor](self, "leadingAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "constraintGreaterThanOrEqualToAnchor:", v34);
  v89 = v7;
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v122[15] = v35;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v122, 16);
  v87 = v13;
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "activateConstraints:", v36);

  -[UIKBMultilingualKeyboardArtworkView memoji1](self, "memoji1");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setAlpha:", 0.0);

  v38 = MEMORY[0x1E0C809B0];
  v121[0] = MEMORY[0x1E0C809B0];
  v121[1] = 3221225472;
  v121[2] = __114__UIKBMultilingualKeyboardArtworkView_animateBubblesWithExample1_example2_altExample1_altExample2_showAltExample___block_invoke;
  v121[3] = &unk_1E16B1B28;
  v121[4] = self;
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 4, v121, &__block_literal_global_117, 0.8, 0.0);
  memset(&v120, 0, sizeof(v120));
  CGAffineTransformMakeScale(&v120, 0.1, 0.1);
  -[UIKBMultilingualKeyboardArtworkView bubble1](self, "bubble1");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setAlpha:", 0.0);

  -[UIKBMultilingualKeyboardArtworkView bubble1](self, "bubble1");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v119 = v120;
  objc_msgSend(v40, "setTransform:", &v119);

  v118[0] = v38;
  v118[1] = 3221225472;
  v118[2] = __114__UIKBMultilingualKeyboardArtworkView_animateBubblesWithExample1_example2_altExample1_altExample2_showAltExample___block_invoke_3;
  v118[3] = &unk_1E16B1B28;
  v118[4] = self;
  +[UIView animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:](UIView, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 4, v118, &__block_literal_global_9_1, 0.5, 0.2, 0.75, 0.0);
  -[UIKBMultilingualKeyboardArtworkView memoji2](self, "memoji2");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setAlpha:", 0.0);

  v117[0] = v38;
  v117[1] = 3221225472;
  v117[2] = __114__UIKBMultilingualKeyboardArtworkView_animateBubblesWithExample1_example2_altExample1_altExample2_showAltExample___block_invoke_5;
  v117[3] = &unk_1E16B1B28;
  v117[4] = self;
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 4, v117, &__block_literal_global_10, 0.8, 0.5);
  -[UIKBMultilingualKeyboardArtworkView bubble2](self, "bubble2");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setAlpha:", 0.0);

  -[UIKBMultilingualKeyboardArtworkView bubble2](self, "bubble2");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v119 = v120;
  objc_msgSend(v43, "setTransform:", &v119);

  v116[0] = v38;
  v116[1] = 3221225472;
  v116[2] = __114__UIKBMultilingualKeyboardArtworkView_animateBubblesWithExample1_example2_altExample1_altExample2_showAltExample___block_invoke_7;
  v116[3] = &unk_1E16B1B28;
  v116[4] = self;
  v109[0] = v38;
  v109[1] = 3221225472;
  v109[2] = __114__UIKBMultilingualKeyboardArtworkView_animateBubblesWithExample1_example2_altExample1_altExample2_showAltExample___block_invoke_8;
  v109[3] = &unk_1E16BE5C8;
  v114 = v108;
  v109[4] = self;
  v110 = v93;
  v111 = v87;
  v112 = v107;
  v113 = v95;
  v115 = v89;
  v44 = v95;
  v45 = v107;
  v46 = v87;
  v47 = v93;
  +[UIView animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:](UIView, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 4, v116, v109, 0.5, 0.7, 0.75, 0.0);

}

void __114__UIKBMultilingualKeyboardArtworkView_animateBubblesWithExample1_example2_altExample1_altExample2_showAltExample___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "memoji1");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 1.0);

}

void __114__UIKBMultilingualKeyboardArtworkView_animateBubblesWithExample1_example2_altExample1_altExample2_showAltExample___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  __int128 v4;
  _OWORD v5[3];

  objc_msgSend(*(id *)(a1 + 32), "bubble1");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 1.0);

  objc_msgSend(*(id *)(a1 + 32), "bubble1");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v5[0] = *MEMORY[0x1E0C9BAA8];
  v5[1] = v4;
  v5[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v3, "setTransform:", v5);

}

void __114__UIKBMultilingualKeyboardArtworkView_animateBubblesWithExample1_example2_altExample1_altExample2_showAltExample___block_invoke_5(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "memoji2");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 1.0);

}

void __114__UIKBMultilingualKeyboardArtworkView_animateBubblesWithExample1_example2_altExample1_altExample2_showAltExample___block_invoke_7(uint64_t a1)
{
  void *v2;
  void *v3;
  __int128 v4;
  _OWORD v5[3];

  objc_msgSend(*(id *)(a1 + 32), "bubble2");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 1.0);

  objc_msgSend(*(id *)(a1 + 32), "bubble2");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v5[0] = *MEMORY[0x1E0C9BAA8];
  v5[1] = v4;
  v5[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v3, "setTransform:", v5);

}

void __114__UIKBMultilingualKeyboardArtworkView_animateBubblesWithExample1_example2_altExample1_altExample2_showAltExample___block_invoke_8(uint64_t a1)
{
  dispatch_time_t v2;
  _QWORD block[4];
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  char v9;
  id location;

  if (*(_BYTE *)(a1 + 72))
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    v2 = dispatch_time(0, 2000000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __114__UIKBMultilingualKeyboardArtworkView_animateBubblesWithExample1_example2_altExample1_altExample2_showAltExample___block_invoke_9;
    block[3] = &unk_1E16BE5A0;
    objc_copyWeak(&v8, &location);
    v4 = *(id *)(a1 + 40);
    v5 = *(id *)(a1 + 48);
    v6 = *(id *)(a1 + 56);
    v7 = *(id *)(a1 + 64);
    v9 = *(_BYTE *)(a1 + 73);
    dispatch_after(v2, MEMORY[0x1E0C80D38], block);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

void __114__UIKBMultilingualKeyboardArtworkView_animateBubblesWithExample1_example2_altExample1_altExample2_showAltExample___block_invoke_9(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(WeakRetained, "animateBubblesWithExample1:example2:altExample1:altExample2:showAltExample:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_BYTE *)(a1 + 72) == 0);

}

+ (id)memojiImageForLanguage:(id)a3 from:(id)a4
{
  id v4;
  double v5;
  uint32_t v6;
  void *v7;
  void *v8;

  v4 = a4;
  v5 = (double)(unint64_t)objc_msgSend(v4, "count");
  v6 = arc4random();
  objc_msgSend(v4, "objectAtIndexedSubscript:", vcvtmd_s64_f64((double)v6 / 4294967300.0 * v5 + (1.0 - (double)v6 / 4294967300.0) * 0.0));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[UIImage kitImageNamed:](UIImage, "kitImageNamed:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)_memojiAssets1
{
  if (qword_1ECD7A8E8 != -1)
    dispatch_once(&qword_1ECD7A8E8, &__block_literal_global_12_1);
  return (id)_MergedGlobals_5_4;
}

void __53__UIKBMultilingualKeyboardArtworkView__memojiAssets1__block_invoke()
{
  void *v0;

  v0 = (void *)_MergedGlobals_5_4;
  _MergedGlobals_5_4 = (uint64_t)&unk_1E1A92C90;

}

+ (id)_memojiAssets2
{
  if (qword_1ECD7A8F8 != -1)
    dispatch_once(&qword_1ECD7A8F8, &__block_literal_global_23);
  return (id)qword_1ECD7A8F0;
}

void __53__UIKBMultilingualKeyboardArtworkView__memojiAssets2__block_invoke()
{
  void *v0;

  v0 = (void *)qword_1ECD7A8F0;
  qword_1ECD7A8F0 = (uint64_t)&unk_1E1A92CA8;

}

- (NSString)language1
{
  return self->_language1;
}

- (NSString)language2
{
  return self->_language2;
}

- (UIImageView)memoji1
{
  return self->_memoji1;
}

- (void)setMemoji1:(id)a3
{
  objc_storeStrong((id *)&self->_memoji1, a3);
}

- (UIKBTutorialConversationBubble)bubble1
{
  return self->_bubble1;
}

- (void)setBubble1:(id)a3
{
  objc_storeStrong((id *)&self->_bubble1, a3);
}

- (UIImageView)memoji2
{
  return self->_memoji2;
}

- (void)setMemoji2:(id)a3
{
  objc_storeStrong((id *)&self->_memoji2, a3);
}

- (UIKBTutorialConversationBubble)bubble2
{
  return self->_bubble2;
}

- (void)setBubble2:(id)a3
{
  objc_storeStrong((id *)&self->_bubble2, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bubble2, 0);
  objc_storeStrong((id *)&self->_memoji2, 0);
  objc_storeStrong((id *)&self->_bubble1, 0);
  objc_storeStrong((id *)&self->_memoji1, 0);
  objc_storeStrong((id *)&self->_language2, 0);
  objc_storeStrong((id *)&self->_language1, 0);
}

@end
