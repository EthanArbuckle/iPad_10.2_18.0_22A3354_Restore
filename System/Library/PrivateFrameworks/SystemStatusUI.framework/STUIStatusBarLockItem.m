@implementation STUIStatusBarLockItem

+ (STUIStatusBarIdentifier)textDisplayIdentifier
{
  return (STUIStatusBarIdentifier *)objc_msgSend(a1, "displayItemIdentifierFromString:", CFSTR("textDisplayIdentifier"));
}

- (id)dependentEntryKeys
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0DB0CF8]);
}

- (BOOL)canEnableDisplayItem:(id)a3 fromData:(id)a4
{
  BOOL v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)STUIStatusBarLockItem;
  if (!-[STUIStatusBarItem canEnableDisplayItem:fromData:](&v8, sel_canEnableDisplayItem_fromData_, a3, a4))
    return -[STUIStatusBarLockItem showsLock](self, "showsLock");
  v5 = 1;
  -[STUIStatusBarLockItem setShowsLock:](self, "setShowsLock:", 1);
  -[STUIStatusBarLockItem lockDisappearanceTimer](self, "lockDisappearanceTimer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "invalidate");

  -[STUIStatusBarLockItem setLockDisappearanceTimer:](self, "setLockDisappearanceTimer:", 0);
  return v5;
}

- (id)applyUpdate:(id)a3 toDisplayItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  int v31;
  id v33;
  void *v34;
  void *v35;
  _QWORD v36[5];
  objc_super v37;
  _QWORD v38[2];
  _QWORD v39[3];

  v39[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v37.receiver = self;
  v37.super_class = (Class)STUIStatusBarLockItem;
  -[STUIStatusBarItem applyUpdate:toDisplayItem:](&v37, sel_applyUpdate_toDisplayItem_, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "data");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "lockEntry");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "defaultDisplayIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11 != v12)
  {
    objc_msgSend(v7, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "textDisplayIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13 == v14)
    {
      v15 = -[STUIStatusBarLockItem showsLock](self, "showsLock")
          ? objc_msgSend(v10, "isEnabled") ^ 1
          : 0;
      objc_msgSend(v7, "setEnabled:", v15);
      if (objc_msgSend(v7, "isEnabled"))
      {
        -[STUIStatusBarLockItem stringView](self, "stringView");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("UIStatusBar: Unlocked"), CFSTR("Unlocked"), 0);
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        v33 = objc_alloc(MEMORY[0x1E0CB3498]);
        v38[0] = *MEMORY[0x1E0DC1138];
        objc_msgSend(v6, "styleAttributes");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "font");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v39[0] = v21;
        v38[1] = *MEMORY[0x1E0DC1140];
        objc_msgSend(v6, "styleAttributes");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "textColor");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v39[1] = v23;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, v38, 2);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = (void *)objc_msgSend(v33, "initWithString:attributes:", v34, v24);

        v26 = v35;
        objc_msgSend(v35, "setAttributedString:", v25);
        objc_msgSend(v35, "baselineOffset");
        v28 = v27;
        objc_msgSend(v35, "intrinsicContentSize");
        objc_msgSend(v7, "setBaselineOffset:", v28 - v29);

LABEL_16:
        goto LABEL_23;
      }
    }
    goto LABEL_23;
  }
  if (!objc_msgSend(v6, "dataChanged"))
    goto LABEL_23;
  if ((objc_msgSend(v10, "isEnabled") & 1) == 0 && -[STUIStatusBarLockItem showsLock](self, "showsLock"))
  {
    -[STUIStatusBarItem statusBar](self, "statusBar");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "areAnimationsEnabled");

    if (!v17)
    {
      -[STUIStatusBarLockItem setShowsLock:](self, "setShowsLock:", 0);
      objc_msgSend(v7, "setEnabled:", 0);
      goto LABEL_18;
    }
    -[STUIStatusBarLockItem lockView](self, "lockView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __51__STUIStatusBarLockItem_applyUpdate_toDisplayItem___block_invoke;
    v36[3] = &unk_1E8D63300;
    v36[4] = self;
    objc_msgSend(v18, "animateUnlockWithCompletionBlock:", v36);
    goto LABEL_12;
  }
  if (objc_msgSend(v10, "isEnabled"))
  {
    -[STUIStatusBarLockItem lockView](self, "lockView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "resetLock");
LABEL_12:

  }
LABEL_18:
  if (objc_msgSend(v10, "unlockFailureCount") != self->_unlockFailureCount)
  {
    self->_unlockFailureCount = objc_msgSend(v10, "unlockFailureCount");
    if ((objc_msgSend(v6, "enablementChanged") & 1) == 0)
    {
      if (objc_msgSend(v7, "isEnabled"))
      {
        -[STUIStatusBarItem statusBar](self, "statusBar");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "areAnimationsEnabled");

        if (v31)
        {
          -[STUIStatusBarLockItem lockView](self, "lockView");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "jiggleWithCompletionBlock:", 0);
          goto LABEL_16;
        }
      }
    }
  }
LABEL_23:

  return v8;
}

void __51__STUIStatusBarLockItem_applyUpdate_toDisplayItem___block_invoke(uint64_t a1, int a2)
{
  void *v3;
  id v4;
  _QWORD v5[5];

  if (a2)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __51__STUIStatusBarLockItem_applyUpdate_toDisplayItem___block_invoke_2;
    v5[3] = &unk_1E8D63D60;
    v5[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:repeats:block:", 0, v5, 1.0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setLockDisappearanceTimer:", v3);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setShowsLock:", 0);
    objc_msgSend(*(id *)(a1 + 32), "statusBar");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "updateWithAnimations:", MEMORY[0x1E0C9AA60]);

  }
}

void __51__STUIStatusBarLockItem_applyUpdate_toDisplayItem___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "setShowsLock:", 0);
  objc_msgSend(*(id *)(a1 + 32), "statusBar");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateWithAnimations:", MEMORY[0x1E0C9AA60]);

}

- (id)additionAnimationForDisplayItemWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  _QWORD v18[9];
  _QWORD v19[5];
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)STUIStatusBarLockItem;
  v4 = a3;
  -[STUIStatusBarItem additionAnimationForDisplayItemWithIdentifier:](&v20, sel_additionAnimationForDisplayItemWithIdentifier_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "textDisplayIdentifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v4)
  {
    v7 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __71__STUIStatusBarLockItem_additionAnimationForDisplayItemWithIdentifier___block_invoke;
    v19[3] = &unk_1E8D63958;
    v19[4] = self;
    +[STUIStatusBarAnimation animationWithBlock:](STUIStatusBarAnimation, "animationWithBlock:", v19);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)objc_opt_class(), "defaultDisplayIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[STUIStatusBarItem displayItemForIdentifier:](self, "displayItemForIdentifier:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "absoluteFrame");
    v18[0] = v7;
    v18[1] = 3221225472;
    v18[2] = __71__STUIStatusBarLockItem_additionAnimationForDisplayItemWithIdentifier___block_invoke_4;
    v18[3] = &unk_1E8D63D88;
    v18[5] = v11;
    v18[6] = v12;
    v18[7] = v13;
    v18[8] = v14;
    v18[4] = self;
    +[STUIStatusBarAnimation animationWithBlock:](STUIStatusBarAnimation, "animationWithBlock:", v18);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubAnimation:forDisplayItemWithIdentifier:", v15, v16);

    v5 = v8;
  }
  return v5;
}

void __71__STUIStatusBarLockItem_additionAnimationForDisplayItemWithIdentifier___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  double x;
  double y;
  double width;
  double height;
  _BOOL8 v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  uint64_t v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t);
  void *v28;
  id v29;
  _QWORD v30[4];
  id v31;
  double v32;
  double v33;
  double v34;
  double v35;
  CGRect v36;

  v6 = a3;
  v7 = a4;
  objc_msgSend(*(id *)(a1 + 32), "statusBar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "styleAttributes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "effectiveLayoutDirection");

  objc_msgSend(v6, "absoluteFrame");
  x = v36.origin.x;
  y = v36.origin.y;
  width = v36.size.width;
  height = v36.size.height;
  v15 = v10 == 1;
  v16 = CGRectGetWidth(v36) * 0.5;
  v17 = -v16;
  if (v10 == 1)
    v17 = v16;
  v18 = x + v17;
  objc_msgSend(v6, "setFloating:", 1);
  objc_msgSend(v6, "setAbsoluteFrame:", v18, y, width, height);
  v19 = (void *)MEMORY[0x1E0DC3F10];
  v20 = *(_QWORD *)(a1 + 32);
  v29 = v7;
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __71__STUIStatusBarLockItem_additionAnimationForDisplayItemWithIdentifier___block_invoke_2;
  v30[3] = &unk_1E8D62B70;
  v31 = v6;
  v32 = x;
  v33 = y;
  v34 = width;
  v35 = height;
  v25 = MEMORY[0x1E0C809B0];
  v26 = 3221225472;
  v27 = __71__STUIStatusBarLockItem_additionAnimationForDisplayItemWithIdentifier___block_invoke_3;
  v28 = &unk_1E8D63638;
  v21 = v7;
  v22 = v6;
  objc_msgSend(v19, "_animateWithDuration:delay:options:factory:animations:completion:", 0, v20, v30, &v25, 0.91, 0.0);
  objc_msgSend(*(id *)(a1 + 32), "stringView", v25, v26, v27, v28);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setExpandsFromLeftToRight:", v15);

  objc_msgSend(*(id *)(a1 + 32), "stringView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "animateCompletionBlock:", 0);

}

uint64_t __71__STUIStatusBarLockItem_additionAnimationForDisplayItemWithIdentifier___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAbsoluteFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  return objc_msgSend(*(id *)(a1 + 32), "setFloating:", 0);
}

uint64_t __71__STUIStatusBarLockItem_additionAnimationForDisplayItemWithIdentifier___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __71__STUIStatusBarLockItem_additionAnimationForDisplayItemWithIdentifier___block_invoke_4(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGRect v20;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "absoluteFrame");
  x = v20.origin.x;
  y = v20.origin.y;
  width = v20.size.width;
  height = v20.size.height;
  if (!CGRectEqualToRect(v20, *(CGRect *)(a1 + 40)))
  {
    objc_msgSend(v6, "setFloating:", 1);
    objc_msgSend(v6, "setAbsoluteFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
    v12 = (void *)MEMORY[0x1E0DC3F10];
    v13 = *(_QWORD *)(a1 + 32);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __71__STUIStatusBarLockItem_additionAnimationForDisplayItemWithIdentifier___block_invoke_5;
    v14[3] = &unk_1E8D62B70;
    v15 = v6;
    v16 = x;
    v17 = y;
    v18 = width;
    v19 = height;
    objc_msgSend(v12, "_animateWithDuration:delay:options:factory:animations:completion:", 0, v13, v14, v7, 0.91, 0.0);

  }
}

uint64_t __71__STUIStatusBarLockItem_additionAnimationForDisplayItemWithIdentifier___block_invoke_5(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAbsoluteFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  return objc_msgSend(*(id *)(a1 + 32), "setFloating:", 0);
}

- (id)_basicAnimationForView:(id)a3 withKeyPath:(id)a4
{
  void *v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMass:", 2.0);
  objc_msgSend(v4, "setStiffness:", 300.0);
  objc_msgSend(v4, "setDamping:", 400.0);
  objc_msgSend(v4, "setDuration:", 0.91);
  v5 = objc_alloc(MEMORY[0x1E0CD27D0]);
  LODWORD(v6) = 1046809695;
  LODWORD(v7) = 990250344;
  LODWORD(v8) = 1057860847;
  LODWORD(v9) = 1064564184;
  v10 = (void *)objc_msgSend(v5, "initWithControlPoints::::", v6, v7, v8, v9);
  objc_msgSend(v4, "setTimingFunction:", v10);

  return v4;
}

- (id)removalAnimationForDisplayItemWithIdentifier:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  BOOL v8;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "textDisplayIdentifier");
  v5 = objc_claimAutoreleasedReturnValue();
  if ((id)v5 != v4)
  {
    v6 = (void *)v5;
    v7 = 0;
LABEL_6:

    goto LABEL_7;
  }
  v8 = -[STUIStatusBarLockItem showsLock](self, "showsLock");

  if (!v8)
  {
    +[STUIStatusBarAnimationFactory fadeAnimationWithDuration:](STUIStatusBarAnimationFactory, "fadeAnimationWithDuration:", 0.25);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "defaultDisplayIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubAnimation:forDisplayItemWithIdentifier:", v7, v6);
    goto LABEL_6;
  }
  v7 = 0;
LABEL_7:

  return v7;
}

- (STUIStatusBarLockView)lockView
{
  STUIStatusBarLockView *lockView;

  lockView = self->_lockView;
  if (!lockView)
  {
    -[STUIStatusBarLockItem _create_lockView](self, "_create_lockView");
    lockView = self->_lockView;
  }
  return lockView;
}

- (void)_create_lockView
{
  STUIStatusBarLockView *v3;
  STUIStatusBarLockView *v4;
  STUIStatusBarLockView *lockView;

  v3 = [STUIStatusBarLockView alloc];
  v4 = -[STUIStatusBarLockView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  lockView = self->_lockView;
  self->_lockView = v4;

}

- (_UIExpandingGlyphsView)stringView
{
  _UIExpandingGlyphsView *stringView;

  stringView = self->_stringView;
  if (!stringView)
  {
    -[STUIStatusBarLockItem _create_stringView](self, "_create_stringView");
    stringView = self->_stringView;
  }
  return stringView;
}

- (void)_create_stringView
{
  id v3;
  _UIExpandingGlyphsView *v4;
  _UIExpandingGlyphsView *stringView;

  v3 = objc_alloc(MEMORY[0x1E0DC4148]);
  v4 = (_UIExpandingGlyphsView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  stringView = self->_stringView;
  self->_stringView = v4;

  -[_UIExpandingGlyphsView setFadesOut:](self->_stringView, "setFadesOut:", 0);
}

- (id)viewForIdentifier:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "defaultDisplayIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    -[STUIStatusBarLockItem lockView](self, "lockView");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "textDisplayIdentifier");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    if (v6 == v4)
    {
      -[STUIStatusBarLockItem stringView](self, "stringView");
      v7 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10.receiver = self;
      v10.super_class = (Class)STUIStatusBarLockItem;
      -[STUIStatusBarItem viewForIdentifier:](&v10, sel_viewForIdentifier_, v4);
      v7 = objc_claimAutoreleasedReturnValue();
    }
  }
  v8 = (void *)v7;

  return v8;
}

- (void)setLockView:(id)a3
{
  objc_storeStrong((id *)&self->_lockView, a3);
}

- (void)setStringView:(id)a3
{
  objc_storeStrong((id *)&self->_stringView, a3);
}

- (NSTimer)lockDisappearanceTimer
{
  return self->_lockDisappearanceTimer;
}

- (void)setLockDisappearanceTimer:(id)a3
{
  objc_storeStrong((id *)&self->_lockDisappearanceTimer, a3);
}

- (BOOL)showsLock
{
  return self->_showsLock;
}

- (void)setShowsLock:(BOOL)a3
{
  self->_showsLock = a3;
}

- (int64_t)unlockFailureCount
{
  return self->_unlockFailureCount;
}

- (void)setUnlockFailureCount:(int64_t)a3
{
  self->_unlockFailureCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockDisappearanceTimer, 0);
  objc_storeStrong((id *)&self->_stringView, 0);
  objc_storeStrong((id *)&self->_lockView, 0);
}

@end
