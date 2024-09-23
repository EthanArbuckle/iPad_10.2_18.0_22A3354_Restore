@implementation SBMicroPIPTetheringMirrorView

- (SBMicroPIPTetheringMirrorView)initWithFrame:(CGRect)a3
{
  SBMicroPIPTetheringMirrorView *v3;
  SBMicroPIPTetheringMirrorContentPlaceholderView *v4;
  uint64_t v5;
  SBMicroPIPTetheringMirrorContentPlaceholderView *contentPlaceholderView;
  void *v7;
  SBMicroPIPTetheringMirrorContentPlaceholderView *v8;
  SBMicroPIPTetheringMirrorContentPlaceholderContainerView *v9;
  SBMicroPIPTetheringMirrorContentPlaceholderContainerView *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  CGAffineTransform v15;
  CGAffineTransform v16;
  CGAffineTransform v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)SBMicroPIPTetheringMirrorView;
  v3 = -[SBMicroPIPTetheringMirrorView initWithFrame:](&v18, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [SBMicroPIPTetheringMirrorContentPlaceholderView alloc];
    -[SBMicroPIPTetheringMirrorView bounds](v3, "bounds");
    v5 = -[SBMicroPIPTetheringMirrorContentPlaceholderView initWithFrame:](v4, "initWithFrame:");
    contentPlaceholderView = v3->_contentPlaceholderView;
    v3->_contentPlaceholderView = (SBMicroPIPTetheringMirrorContentPlaceholderView *)v5;

    -[SBMicroPIPTetheringMirrorContentPlaceholderView layer](v3->_contentPlaceholderView, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAnchorPoint:", 1.0, 1.0);

    -[SBMicroPIPTetheringMirrorContentPlaceholderView setCenter:](v3->_contentPlaceholderView, "setCenter:", 4.0, 4.0);
    -[SBMicroPIPTetheringMirrorContentPlaceholderView setAutoresizingMask:](v3->_contentPlaceholderView, "setAutoresizingMask:", 36);
    v8 = v3->_contentPlaceholderView;
    v14 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v16.a = *MEMORY[0x1E0C9BAA8];
    v13 = *(_OWORD *)&v16.a;
    *(_OWORD *)&v16.c = v14;
    *(_OWORD *)&v16.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    v12 = *(_OWORD *)&v16.tx;
    CGAffineTransformScale(&v17, &v16, -1.0, -1.0);
    -[SBMicroPIPTetheringMirrorContentPlaceholderView setTransform:](v8, "setTransform:", &v17);
    v9 = [SBMicroPIPTetheringMirrorContentPlaceholderContainerView alloc];
    -[SBMicroPIPTetheringMirrorView bounds](v3, "bounds");
    v10 = -[SBMicroPIPTetheringMirrorContentPlaceholderContainerView initWithFrame:](v9, "initWithFrame:");
    *(_OWORD *)&v16.a = v13;
    *(_OWORD *)&v16.c = v14;
    *(_OWORD *)&v16.tx = v12;
    CGAffineTransformScale(&v15, &v16, -1.0, -1.0);
    -[SBMicroPIPTetheringMirrorContentPlaceholderContainerView setTransform:](v10, "setTransform:", &v15);
    -[SBMicroPIPTetheringMirrorContentPlaceholderContainerView setAutoresizingMask:](v10, "setAutoresizingMask:", 18);
    -[SBMicroPIPTetheringMirrorContentPlaceholderContainerView addSubview:](v10, "addSubview:", v3->_contentPlaceholderView);
    -[SBMicroPIPTetheringMirrorView addSubview:](v3, "addSubview:", v10);

  }
  return v3;
}

- (UIView)contentPlaceholderView
{
  return (UIView *)self->_contentPlaceholderView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentPlaceholderView, 0);
}

@end
