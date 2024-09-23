@implementation UIKBLinearCandidateView

- (void)updateCandidateKey
{
  void *v3;
  void *v4;
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
  void *v15;
  UIKBLinearCandidateView *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  id v30;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "candidateController");
  v30 = (id)objc_claimAutoreleasedReturnValue();

  -[UIKBCandidateView candidateKey](self, "candidateKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[UIView bounds](self, "bounds");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    -[UIKBLinearCandidateView getConfiguration](self, "getConfiguration");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v30, "newCandidateKeyWithFrame:configuration:", v13, v6, v8, v10, v12);
    -[UIKBCandidateView setCandidateKey:](self, "setCandidateKey:", v14);

  }
  -[UIKBCandidateView candidateKey](self, "candidateKey");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "superview");
  v16 = (UIKBLinearCandidateView *)objc_claimAutoreleasedReturnValue();

  if (v16 != self)
  {
    -[UIKBCandidateView candidateKey](self, "candidateKey");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "removeFromSuperview");

    -[UIKBCandidateView candidateKey](self, "candidateKey");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setHidden:", 0);

    -[UIKBCandidateView candidateKey](self, "candidateKey");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addSubview:](self, "addSubview:", v19);

  }
  -[UIView bounds](self, "bounds");
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v27 = v26;
  -[UIKBCandidateView candidateKey](self, "candidateKey");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setFrame:", v21, v23, v25, v27);

  -[UIKBCandidateView candidateKey](self, "candidateKey");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setAutoresizingMask:", 18);

  objc_msgSend(v30, "setActiveCandidateViewType:", 1);
}

- (id)getConfiguration
{
  return +[UIKeyboardCandidateViewConfiguration configuration](UIKeyboardCandidateViewConfigurationTVLinear, "configuration");
}

- (void)refreshSelectedCandidate
{
  -[UIKBLinearCandidateView refreshSelectedCandidateAnimated:](self, "refreshSelectedCandidateAnimated:", 1);
}

- (void)refreshSelectedCandidateAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "candidateController");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[UIKBKeyView key](self, "key");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "showCandidateAtIndex:animated:scrollPosition:", objc_msgSend(v6, "selectedVariantIndex"), v3, 16);

}

- (unint64_t)focusableVariantCount
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "candidateController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "candidates");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "candidates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  return v6;
}

@end
