@implementation SBReusableSnapshotItemContainer

- (void)setAppLayout:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBReusableSnapshotItemContainer;
  v4 = a3;
  -[SBFluidSwitcherItemContainer setAppLayout:](&v5, sel_setAppLayout_, v4);
  -[SBReusableSnapshotItemContainer _updateSnapshotViewWithAppLayout:](self, "_updateSnapshotViewWithAppLayout:", v4, v5.receiver, v5.super_class);

}

- (void)_updateSnapshotViewWithAppLayout:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SBReusableSnapshotItemContainer _snapshotView](self, "_snapshotView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAppLayout:", v4);

}

- (id)_snapshotView
{
  uint64_t v3;
  void *v4;
  void *v5;

  v3 = objc_opt_class();
  -[SBFluidSwitcherItemContainer contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  SBSafeCast(v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (SBReusableSnapshotItemContainer)initWithFrame:(CGRect)a3 appLayout:(id)a4 delegate:(id)a5 active:(BOOL)a6 windowScene:(id)a7
{
  _BOOL8 v8;
  double height;
  double width;
  double y;
  double x;
  id v15;
  SBReusableSnapshotItemContainer *v16;
  SBReusableSnapshotItemContainer *v17;
  objc_super v19;

  v8 = a6;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v15 = a4;
  v19.receiver = self;
  v19.super_class = (Class)SBReusableSnapshotItemContainer;
  v16 = -[SBFluidSwitcherItemContainer initWithFrame:appLayout:delegate:active:windowScene:](&v19, sel_initWithFrame_appLayout_delegate_active_windowScene_, v15, a5, v8, a7, x, y, width, height);
  v17 = v16;
  if (v16)
    -[SBReusableSnapshotItemContainer _updateSnapshotViewWithAppLayout:](v16, "_updateSnapshotViewWithAppLayout:", v15);

  return v17;
}

- (void)prepareForReuse
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)SBReusableSnapshotItemContainer;
  -[SBFluidSwitcherItemContainer prepareForReuse](&v2, sel_prepareForReuse);
}

- (void)setContentView:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBReusableSnapshotItemContainer.m"), 39, CFSTR("Only SBAppSwitcherReusableSnapshotView * allowed"));

  }
  -[SBFluidSwitcherItemContainer contentView](self, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBReusableSnapshotItemContainer.m"), 40, CFSTR("Can't change content view once set"));

  }
  v10.receiver = self;
  v10.super_class = (Class)SBReusableSnapshotItemContainer;
  -[SBFluidSwitcherItemContainer setContentView:](&v10, sel_setContentView_, v5);
  -[SBFluidSwitcherItemContainer appLayout](self, "appLayout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBReusableSnapshotItemContainer _updateSnapshotViewWithAppLayout:](self, "_updateSnapshotViewWithAppLayout:", v7);

}

@end
