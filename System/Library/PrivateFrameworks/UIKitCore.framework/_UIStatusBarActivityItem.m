@implementation _UIStatusBarActivityItem

- (id)dependentEntryKeys
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("activityEntry"));
}

- (UIEdgeInsets)activityIndicatorAlignmentRectInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 0.0;
  v3 = 0.0;
  v4 = 0.0;
  v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (_UIStatusBarActivityIndicator)activityIndicator
{
  _UIStatusBarActivityIndicator *activityIndicator;

  activityIndicator = self->_activityIndicator;
  if (!activityIndicator)
  {
    -[_UIStatusBarActivityItem _create_activityIndicator](self, "_create_activityIndicator");
    activityIndicator = self->_activityIndicator;
  }
  return activityIndicator;
}

- (void)_create_activityIndicator
{
  _UIStatusBarActivityIndicator *v3;
  _UIStatusBarActivityIndicator *v4;
  _UIStatusBarActivityIndicator *activityIndicator;

  v3 = [_UIStatusBarActivityIndicator alloc];
  v4 = -[UIActivityIndicatorView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  activityIndicator = self->_activityIndicator;
  self->_activityIndicator = v4;

  -[UIActivityIndicatorView setActivityIndicatorViewStyle:](self->_activityIndicator, "setActivityIndicatorViewStyle:", 6);
  -[_UIStatusBarActivityItem activityIndicatorAlignmentRectInsets](self, "activityIndicatorAlignmentRectInsets");
  -[_UIStatusBarActivityIndicator setAlignmentRectInsets:](self->_activityIndicator, "setAlignmentRectInsets:");
}

- (BOOL)_enableForType:(int64_t)a3
{
  return 1;
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

    LODWORD(v9) = -[_UIStatusBarActivityItem _enableForType:](self, "_enableForType:", v10);
    -[_UIStatusBarActivityItem activityIndicator](self, "activityIndicator");
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
        v21 = &dbl_186682E90[v13];
      else
        v21 = (double *)((char *)&unk_186682E80 + 8 * v13);
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
          -[_UIStatusBarItem statusBar](self, "statusBar");
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
  v28.super_class = (Class)_UIStatusBarActivityItem;
  -[_UIStatusBarItem applyUpdate:toDisplayItem:](&v28, sel_applyUpdate_toDisplayItem_, v6, v7);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

- (void)setActivityIndicator:(id)a3
{
  objc_storeStrong((id *)&self->_activityIndicator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityIndicator, 0);
}

@end
