@implementation _UIStatusBarLockItem

+ (_UIStatusBarIdentifier)textDisplayIdentifier
{
  return (_UIStatusBarIdentifier *)objc_msgSend(a1, "displayItemIdentifierFromString:", CFSTR("textDisplayIdentifier"));
}

- (id)dependentEntryKeys
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("lockEntry"));
}

- (BOOL)canEnableDisplayItem:(id)a3 fromData:(id)a4
{
  BOOL v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_UIStatusBarLockItem;
  if (!-[_UIStatusBarItem canEnableDisplayItem:fromData:](&v8, sel_canEnableDisplayItem_fromData_, a3, a4))
    return -[_UIStatusBarLockItem showsLock](self, "showsLock");
  v5 = 1;
  -[_UIStatusBarLockItem setShowsLock:](self, "setShowsLock:", 1);
  -[_UIStatusBarLockItem lockDisappearanceTimer](self, "lockDisappearanceTimer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "invalidate");

  -[_UIStatusBarLockItem setLockDisappearanceTimer:](self, "setLockDisappearanceTimer:", 0);
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
  double v26;
  double v27;
  double v28;
  void *v29;
  int v30;
  id v32;
  void *v33;
  void *v34;
  _QWORD v35[5];
  objc_super v36;
  _QWORD v37[2];
  _QWORD v38[3];

  v38[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v36.receiver = self;
  v36.super_class = (Class)_UIStatusBarLockItem;
  -[_UIStatusBarItem applyUpdate:toDisplayItem:](&v36, sel_applyUpdate_toDisplayItem_, v6, v7);
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
      v15 = -[_UIStatusBarLockItem showsLock](self, "showsLock")
          ? objc_msgSend(v10, "isEnabled") ^ 1
          : 0;
      objc_msgSend(v7, "setEnabled:", v15);
      if (objc_msgSend(v7, "isEnabled"))
      {
        -[_UIStatusBarLockItem stringView](self, "stringView");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        _UILocalizedStringInSystemLanguage(CFSTR("UIStatusBar: Unlocked"), CFSTR("Unlocked"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_alloc(MEMORY[0x1E0CB3498]);
        v37[0] = *(_QWORD *)off_1E1678D90;
        objc_msgSend(v6, "styleAttributes");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "font");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v38[0] = v20;
        v37[1] = *(_QWORD *)off_1E1678D98;
        objc_msgSend(v6, "styleAttributes");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "textColor");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v38[1] = v22;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 2);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = (void *)objc_msgSend(v32, "initWithString:attributes:", v33, v23);

        v25 = v34;
        objc_msgSend(v34, "setAttributedString:", v24);
        objc_msgSend(v34, "baselineOffset");
        v27 = v26;
        objc_msgSend(v34, "intrinsicContentSize");
        objc_msgSend(v7, "setBaselineOffset:", v27 - v28);

LABEL_16:
        goto LABEL_23;
      }
    }
    goto LABEL_23;
  }
  if (!objc_msgSend(v6, "dataChanged"))
    goto LABEL_23;
  if ((objc_msgSend(v10, "isEnabled") & 1) == 0 && -[_UIStatusBarLockItem showsLock](self, "showsLock"))
  {
    -[_UIStatusBarItem statusBar](self, "statusBar");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "areAnimationsEnabled");

    if (!v17)
    {
      -[_UIStatusBarLockItem setShowsLock:](self, "setShowsLock:", 0);
      objc_msgSend(v7, "setEnabled:", 0);
      goto LABEL_18;
    }
    -[_UIStatusBarLockItem lockView](self, "lockView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __50___UIStatusBarLockItem_applyUpdate_toDisplayItem___block_invoke;
    v35[3] = &unk_1E16B3FD8;
    v35[4] = self;
    objc_msgSend(v18, "animateUnlockWithCompletionBlock:", v35);
    goto LABEL_12;
  }
  if (objc_msgSend(v10, "isEnabled"))
  {
    -[_UIStatusBarLockItem lockView](self, "lockView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "resetLock");
LABEL_12:

  }
LABEL_18:
  if (objc_msgSend(v10, "unlockFailureCount") != self->_unlockFailureCount)
  {
    self->_unlockFailureCount = objc_msgSend(v10, "unlockFailureCount");
    if ((objc_msgSend(v6, "enabilityChanged") & 1) == 0)
    {
      if (objc_msgSend(v7, "isEnabled"))
      {
        -[_UIStatusBarItem statusBar](self, "statusBar");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v29, "areAnimationsEnabled");

        if (v30)
        {
          -[_UIStatusBarLockItem lockView](self, "lockView");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "jiggleWithCompletionBlock:", 0);
          goto LABEL_16;
        }
      }
    }
  }
LABEL_23:

  return v8;
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
  v20.super_class = (Class)_UIStatusBarLockItem;
  v4 = a3;
  -[_UIStatusBarItem additionAnimationForDisplayItemWithIdentifier:](&v20, sel_additionAnimationForDisplayItemWithIdentifier_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "textDisplayIdentifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v4)
  {
    v7 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __70___UIStatusBarLockItem_additionAnimationForDisplayItemWithIdentifier___block_invoke;
    v19[3] = &unk_1E16E0078;
    v19[4] = self;
    +[_UIStatusBarAnimation animationWithBlock:](_UIStatusBarAnimation, "animationWithBlock:", v19);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)objc_opt_class(), "defaultDisplayIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIStatusBarItem displayItemForIdentifier:](self, "displayItemForIdentifier:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "absoluteFrame");
    v18[0] = v7;
    v18[1] = 3221225472;
    v18[2] = __70___UIStatusBarLockItem_additionAnimationForDisplayItemWithIdentifier___block_invoke_4;
    v18[3] = &unk_1E16E0468;
    v18[5] = v11;
    v18[6] = v12;
    v18[7] = v13;
    v18[8] = v14;
    v18[4] = self;
    +[_UIStatusBarAnimation animationWithBlock:](_UIStatusBarAnimation, "animationWithBlock:", v18);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubAnimation:forDisplayItemWithIdentifier:", v15, v16);

    v5 = v8;
  }
  return v5;
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
  v8 = -[_UIStatusBarLockItem showsLock](self, "showsLock");

  if (!v8)
  {
    +[_UIStatusBarAnimationFactory fadeAnimationWithDuration:](_UIStatusBarAnimationFactory, "fadeAnimationWithDuration:", 0.25);
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

- (_UIStatusBarLockView)lockView
{
  _UIStatusBarLockView *lockView;

  lockView = self->_lockView;
  if (!lockView)
  {
    -[_UIStatusBarLockItem _create_lockView](self, "_create_lockView");
    lockView = self->_lockView;
  }
  return lockView;
}

- (void)_create_lockView
{
  _UIStatusBarLockView *v3;
  _UIStatusBarLockView *v4;
  _UIStatusBarLockView *lockView;

  v3 = [_UIStatusBarLockView alloc];
  v4 = -[_UIStatusBarLockView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  lockView = self->_lockView;
  self->_lockView = v4;

}

- (_UIExpandingGlyphsView)stringView
{
  _UIExpandingGlyphsView *stringView;

  stringView = self->_stringView;
  if (!stringView)
  {
    -[_UIStatusBarLockItem _create_stringView](self, "_create_stringView");
    stringView = self->_stringView;
  }
  return stringView;
}

- (void)_create_stringView
{
  _UIExpandingGlyphsView *v3;
  _UIExpandingGlyphsView *v4;
  _UIExpandingGlyphsView *stringView;

  v3 = [_UIExpandingGlyphsView alloc];
  v4 = -[_UIExpandingGlyphsView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
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
    -[_UIStatusBarLockItem lockView](self, "lockView");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "textDisplayIdentifier");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    if (v6 == v4)
    {
      -[_UIStatusBarLockItem stringView](self, "stringView");
      v7 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10.receiver = self;
      v10.super_class = (Class)_UIStatusBarLockItem;
      -[_UIStatusBarItem viewForIdentifier:](&v10, sel_viewForIdentifier_, v4);
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
