@implementation STUIStatusBarActivityItem

- (id)dependentEntryKeys
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0DB0C60]);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityIndicator, 0);
}

- (id)applyUpdate:(id)a3 toDisplayItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  double v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  BOOL v19;
  uint64_t v20;
  double *v21;
  double v22;
  char v23;
  void *v24;
  void *v25;
  void *v26;
  objc_super v28;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v6, "dataChanged") & 1) != 0 || objc_msgSend(v6, "styleAttributesChanged"))
  {
    objc_msgSend(v6, "data");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "activityEntry");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "type");

    LODWORD(v9) = -[STUIStatusBarActivityItem _enableForType:](self, "_enableForType:", v10);
    -[STUIStatusBarActivityItem activityIndicator](self, "activityIndicator");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if ((_DWORD)v9)
    {
      v13 = (v10 & 2) == 0;
      objc_msgSend(v6, "styleAttributes");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "iconScale");
      v16 = v15;

      v17 = 7;
      if (v16 > 1.0)
        v17 = 12;
      v18 = 6;
      if (v16 > 1.0)
        v18 = 11;
      v19 = (v10 & 1) == 0;
      if ((v10 & 1) != 0)
        v20 = v17;
      else
        v20 = v18;
      if (v19)
        v21 = (double *)((char *)&unk_1CFEBFBF0 + 8 * v13);
      else
        v21 = (double *)((char *)&unk_1CFEBFBE0 + 8 * v13);
      v22 = *v21;
      if (v20 == objc_msgSend(v12, "activityIndicatorViewStyle"))
      {
        objc_msgSend(v12, "setActivityIndicatorViewStyle:", v20);
        objc_msgSend(v12, "setAnimationDuration:", v22);
      }
      else
      {
        v23 = objc_msgSend(v6, "styleAttributesChanged");
        objc_msgSend(v12, "setActivityIndicatorViewStyle:", v20);
        objc_msgSend(v12, "setAnimationDuration:", v22);
        if ((v23 & 1) == 0)
        {
          -[STUIStatusBarItem statusBar](self, "statusBar");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "styleAttributes");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "applyStyleAttributes:", v25);

        }
      }
      objc_msgSend(v12, "startAnimating");
    }
    else
    {
      objc_msgSend(v11, "stopAnimating");
      objc_msgSend(v7, "setEnabled:", 0);
    }

  }
  v28.receiver = self;
  v28.super_class = (Class)STUIStatusBarActivityItem;
  -[STUIStatusBarItem applyUpdate:toDisplayItem:](&v28, sel_applyUpdate_toDisplayItem_, v6, v7);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

- (STUIStatusBarActivityIndicator)activityIndicator
{
  STUIStatusBarActivityIndicator *activityIndicator;

  activityIndicator = self->_activityIndicator;
  if (!activityIndicator)
  {
    -[STUIStatusBarActivityItem _create_activityIndicator](self, "_create_activityIndicator");
    activityIndicator = self->_activityIndicator;
  }
  return activityIndicator;
}

- (void)_create_activityIndicator
{
  STUIStatusBarActivityIndicator *v3;
  STUIStatusBarActivityIndicator *v4;
  STUIStatusBarActivityIndicator *activityIndicator;

  v3 = [STUIStatusBarActivityIndicator alloc];
  v4 = -[STUIStatusBarActivityIndicator initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  activityIndicator = self->_activityIndicator;
  self->_activityIndicator = v4;

  -[STUIStatusBarActivityIndicator setActivityIndicatorViewStyle:](self->_activityIndicator, "setActivityIndicatorViewStyle:", 6);
  -[STUIStatusBarActivityItem activityIndicatorAlignmentRectInsets](self, "activityIndicatorAlignmentRectInsets");
  -[STUIStatusBarActivityIndicator setAlignmentRectInsets:](self->_activityIndicator, "setAlignmentRectInsets:");
}

- (UIEdgeInsets)activityIndicatorAlignmentRectInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = *MEMORY[0x1E0DC49E8];
  v3 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
  v4 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
  v5 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (BOOL)_enableForType:(int64_t)a3
{
  return 1;
}

- (void)setActivityIndicator:(id)a3
{
  objc_storeStrong((id *)&self->_activityIndicator, a3);
}

void __81__STUIStatusBarActivityItem_Split_additionAnimationForDisplayItemWithIdentifier___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v4;
  void *v5;
  void (**v6)(id, uint64_t);

  v4 = *(void **)(a1 + 32);
  v6 = a4;
  objc_msgSend(v4, "activityView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startAnimating");

  v6[2](v6, 1);
}

void __80__STUIStatusBarActivityItem_Split_removalAnimationForDisplayItemWithIdentifier___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v4;
  id v5;
  id v6;

  v4 = *(void **)(a1 + 32);
  v5 = a4;
  objc_msgSend(v4, "activityView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stopAnimatingWithCompletionHandler:", v5);

}

@end
