@implementation UIHandwritingAssistantView

- (UIHandwritingAssistantView)initWithFrame:(CGRect)a3 keyplane:(id)a4 key:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  id v12;
  UIHandwritingAssistantView *v13;
  UIHandwritingAssistantView *v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  objc_class *v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  UIKBHandwritingCandidateView *v48;
  UIKBHandwritingCandidateView *v49;
  void *v50;
  void *v51;
  double v52;
  double v53;
  double v54;
  double v55;
  UIKeyboardCandidatePocketShadow *v56;
  UIKeyboardCandidatePocketShadow *v57;
  void *v58;
  void *v59;
  objc_super v61;
  _QWORD v62[5];
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  uint64_t v66;
  CGRect v67;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11 = a4;
  v12 = a5;
  v61.receiver = self;
  v61.super_class = (Class)UIHandwritingAssistantView;
  v13 = -[UIKBKeyView initWithFrame:keyplane:key:](&v61, sel_initWithFrame_keyplane_key_, v11, v12, x, y, width, height);
  v14 = v13;
  if (v13)
  {
    -[UIView setOpaque:](v13, "setOpaque:", 0);
    -[UIView setUserInteractionEnabled:](v14, "setUserInteractionEnabled:", 1);
    v15 = 0;
    if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1)
      v15 = +[UIKeyboardImpl isFloating](UIKeyboardImpl, "isFloating") ^ 1;
    -[UIHandwritingAssistantView assistantFrameForKeyplane:key:](v14, "assistantFrameForKeyplane:key:", v11, v12);
    v17 = v16;
    v19 = v18;
    v21 = v20;
    v23 = v22;
    v63 = 0;
    v64 = &v63;
    v65 = 0x2050000000;
    v24 = (void *)_MergedGlobals_3_28;
    v66 = _MergedGlobals_3_28;
    if (!_MergedGlobals_3_28)
    {
      v62[0] = MEMORY[0x1E0C809B0];
      v62[1] = 3221225472;
      v62[2] = __getTUISystemInputAssistantViewClass_block_invoke_0;
      v62[3] = &unk_1E16B14C0;
      v62[4] = &v63;
      __getTUISystemInputAssistantViewClass_block_invoke_0((uint64_t)v62);
      v24 = (void *)v64[3];
    }
    v25 = objc_retainAutorelease(v24);
    _Block_object_dispose(&v63, 8);
    v26 = (void *)objc_msgSend([v25 alloc], "initWithFrame:", v17, v19, v21, v23);
    -[UIHandwritingAssistantView setSystemInputAssistantView:](v14, "setSystemInputAssistantView:", v26);

    objc_msgSend(v12, "paddedFrame");
    v28 = v27;
    -[UIHandwritingAssistantView systemInputAssistantView](v14, "systemInputAssistantView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setCenterViewWidth:", v28);

    -[UIView _inheritedRenderConfig](v14, "_inheritedRenderConfig");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIHandwritingAssistantView systemInputAssistantView](v14, "systemInputAssistantView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setRenderConfig:", v30);

    -[UIHandwritingAssistantView systemInputAssistantView](v14, "systemInputAssistantView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setBackgroundVisible:", 0);

    -[UIHandwritingAssistantView systemInputAssistantView](v14, "systemInputAssistantView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setShowsButtonBarItemsInline:", v15);

    -[UIHandwritingAssistantView systemInputAssistantView](v14, "systemInputAssistantView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setAutoresizingMask:", 18);

    +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "systemInputAssistantViewController");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIHandwritingAssistantView systemInputAssistantView](v14, "systemInputAssistantView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setDelegate:", v36);

    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "inputDelegateManager");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "keyInputDelegate");
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v40, "__isKindOfUIResponder") & 1) == 0)
    {
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "delegateAsResponder");
      v42 = objc_claimAutoreleasedReturnValue();

      v40 = (void *)v42;
    }
    _UIResponderFindInputAssistantItem(v40);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if ((_DWORD)v15)
    {
      +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "systemInputAssistantViewController");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "setInputAssistantButtonItemsForResponder:", 0);

      -[UIHandwritingAssistantView systemInputAssistantView](v14, "systemInputAssistantView");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "setInputAssistantItem:", v43);

    }
    -[UIHandwritingAssistantView systemInputAssistantView](v14, "systemInputAssistantView");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addSubview:](v14, "addSubview:", v47);

    v48 = [UIKBHandwritingCandidateView alloc];
    -[UIView bounds](v14, "bounds");
    v49 = -[UIKBHandwritingCandidateView initWithFrame:keyplane:key:](v48, "initWithFrame:keyplane:key:", v11, v12);
    -[UIHandwritingAssistantView setCandidateView:](v14, "setCandidateView:", v49);

    -[UIHandwritingAssistantView candidateView](v14, "candidateView");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIHandwritingAssistantView systemInputAssistantView](v14, "systemInputAssistantView");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "setCenterView:", v50);

    -[UIView setClipsToBounds:](v14, "setClipsToBounds:", 0);
    if ((_DWORD)v15)
    {
      +[UIKeyboardCandidatePocketShadow widthWithShadow:](UIKeyboardCandidatePocketShadow, "widthWithShadow:", 0);
      v53 = v52;
      -[UIView bounds](v14, "bounds");
      +[UIKBHandwritingCandidateView shadowYForBounds:shadowHeight:](UIKBHandwritingCandidateView, "shadowYForBounds:shadowHeight:");
      v55 = v54;
      v56 = [UIKeyboardCandidatePocketShadow alloc];
      v67.origin.x = v17;
      v67.origin.y = v19;
      v67.size.width = v21;
      v67.size.height = v23;
      v57 = -[UIKeyboardCandidatePocketShadow initWithFrame:](v56, "initWithFrame:", CGRectGetMaxX(v67) - v53, v55, v53, 36.0);
      -[UIHandwritingAssistantView setRightBorder:](v14, "setRightBorder:", v57);

      -[UIHandwritingAssistantView rightBorder](v14, "rightBorder");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "setDrawsShadow:", 0);

      -[UIHandwritingAssistantView rightBorder](v14, "rightBorder");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView addSubview:](v14, "addSubview:", v59);

    }
  }

  return v14;
}

- (id)candidateList
{
  void *v2;
  void *v3;

  -[UIHandwritingAssistantView candidateView](self, "candidateView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "candidateList");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (CGRect)assistantFrameForKeyplane:(id)a3 key:(id)a4
{
  id v6;
  double v7;
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
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGRect result;

  v6 = a3;
  objc_msgSend(a4, "paddedFrame");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1
    && !+[UIKeyboardImpl isFloating](UIKeyboardImpl, "isFloating"))
  {
    v14 = -v8;
    objc_msgSend(v6, "firstCachedKeyWithName:", CFSTR("Delete-Key"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "frame");
    v17 = v20;

  }
  else
  {
    -[UIView bounds](self, "bounds");
    v14 = v13;
    v10 = v15;
    v17 = v16;
    v12 = v18;
  }

  v21 = v14;
  v22 = v10;
  v23 = v17;
  v24 = v12;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (void)updateForKeyplane:(id)a3 key:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  id v13;

  v6 = a4;
  v7 = a3;
  -[UIHandwritingAssistantView candidateView](self, "candidateView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateForKeyplane:key:", v7, v6);

  objc_msgSend(v6, "paddedFrame");
  v10 = v9;

  -[UIHandwritingAssistantView systemInputAssistantView](self, "systemInputAssistantView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setCenterViewWidth:", v10);

  -[UIView _inheritedRenderConfig](self, "_inheritedRenderConfig");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[UIHandwritingAssistantView systemInputAssistantView](self, "systemInputAssistantView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setRenderConfig:", v13);

}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  void *v4;
  double y;
  double x;
  id v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  UIHandwritingAssistantView *v15;
  uint64_t v16;
  int v17;
  void *v18;
  void *v19;
  char v20;
  objc_super v22;

  y = a3.y;
  x = a3.x;
  v8 = a4;
  -[UIHandwritingAssistantView systemInputAssistantView](self, "systemInputAssistantView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "convertPoint:fromView:", self, x, y);
  v11 = v10;
  v13 = v12;

  -[UIHandwritingAssistantView systemInputAssistantView](self, "systemInputAssistantView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "hitTest:withEvent:", v8, v11, v13);
  v15 = (UIHandwritingAssistantView *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    v22.receiver = self;
    v22.super_class = (Class)UIHandwritingAssistantView;
    -[UIView hitTest:withEvent:](&v22, sel_hitTest_withEvent_, v8, x, y);
    v15 = (UIHandwritingAssistantView *)objc_claimAutoreleasedReturnValue();
  }
  if (v15 == self)
  {
    v17 = 0;
  }
  else
  {
    -[UIHandwritingAssistantView systemInputAssistantView](self, "systemInputAssistantView");
    v16 = objc_claimAutoreleasedReturnValue();
    if (v15 == (UIHandwritingAssistantView *)v16)
    {
      v17 = 0;
      v14 = v15;
    }
    else
    {
      v14 = (void *)v16;
      -[UIHandwritingAssistantView candidateView](self, "candidateView");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (!-[UIView isDescendantOfView:](v15, "isDescendantOfView:", v4))
      {

        goto LABEL_16;
      }
      v17 = 1;
    }
  }
  +[UIKeyboardCandidateController sharedInstance](UIKeyboardCandidateController, "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "candidateResultSet");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "hasCandidates");

  if (v17)
  if (v15 != self)

  if ((v20 & 1) == 0)
  {
    v14 = v15;
    v15 = 0;
LABEL_16:

  }
  return v15;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  BOOL v14;
  objc_super v16;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[UIHandwritingAssistantView systemInputAssistantView](self, "systemInputAssistantView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "convertPoint:fromView:", self, x, y);
  v10 = v9;
  v12 = v11;

  -[UIHandwritingAssistantView systemInputAssistantView](self, "systemInputAssistantView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v13, "pointInside:withEvent:", v7, v10, v12) & 1) != 0)
  {
    v14 = 1;
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)UIHandwritingAssistantView;
    v14 = -[UIView pointInside:withEvent:](&v16, sel_pointInside_withEvent_, v7, x, y);
  }

  return v14;
}

- (void)dimKeys:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(v4, "allKeys", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v4, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v10, "integerValue") & 4) != 0)
        {
          objc_msgSend(v11, "doubleValue");
          -[UIView setAlpha:](self, "setAlpha:");
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

}

- (TUISystemInputAssistantView)systemInputAssistantView
{
  return self->_systemInputAssistantView;
}

- (void)setSystemInputAssistantView:(id)a3
{
  objc_storeStrong((id *)&self->_systemInputAssistantView, a3);
}

- (UIKBHandwritingCandidateView)candidateView
{
  return self->_candidateView;
}

- (void)setCandidateView:(id)a3
{
  objc_storeStrong((id *)&self->_candidateView, a3);
}

- (UIKeyboardCandidatePocketShadow)rightBorder
{
  return self->_rightBorder;
}

- (void)setRightBorder:(id)a3
{
  objc_storeStrong((id *)&self->_rightBorder, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightBorder, 0);
  objc_storeStrong((id *)&self->_candidateView, 0);
  objc_storeStrong((id *)&self->_systemInputAssistantView, 0);
}

@end
