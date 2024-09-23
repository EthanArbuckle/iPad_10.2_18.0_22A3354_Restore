@implementation TUIProactiveCandidateCell

- (void)commonInit
{
  id v3;
  void *v4;
  id v5;

  v3 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  -[TUIProactiveCandidateCell setSlotContentView:](self, "setSlotContentView:", v3);

  -[TUIProactiveCandidateCell contentView](self, "contentView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[TUIProactiveCandidateCell slotContentView](self, "slotContentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", v4);

}

- (TUIProactiveCandidateCell)initWithFrame:(CGRect)a3
{
  TUIProactiveCandidateCell *v3;
  TUIProactiveCandidateCell *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TUIProactiveCandidateCell;
  v3 = -[TUICandidateBaseCell initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[TUIProactiveCandidateCell commonInit](v3, "commonInit");
  return v4;
}

- (TUIProactiveCandidateCell)initWithCoder:(id)a3
{
  TUIProactiveCandidateCell *v3;
  TUIProactiveCandidateCell *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TUIProactiveCandidateCell;
  v3 = -[TUIProactiveCandidateCell initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[TUIProactiveCandidateCell commonInit](v3, "commonInit");
  return v4;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TUIProactiveCandidateCell;
  -[TUICandidateBaseCell layoutSubviews](&v3, sel_layoutSubviews);
  -[TUIProactiveCandidateCell updateSlotContentView](self, "updateSlotContentView");
}

- (void)setCandidate:(id)a3
{
  TIKeyboardCandidate *v5;
  TIKeyboardCandidate *candidate;
  char v7;
  TIKeyboardCandidate *v8;

  v5 = (TIKeyboardCandidate *)a3;
  candidate = self->_candidate;
  if (candidate != v5)
  {
    v8 = v5;
    v7 = -[TIKeyboardCandidate isEqual:](candidate, "isEqual:", v5);
    v5 = v8;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_candidate, a3);
      -[TUIProactiveCandidateCell updateSlotContentView](self, "updateSlotContentView");
      v5 = v8;
    }
  }

}

- (void)updateSlotContentView
{
  void *v3;
  double v4;
  double x;
  double v6;
  double y;
  double v8;
  double width;
  double v10;
  double height;
  void *v12;
  double v13;
  CGFloat v14;
  void *v15;
  double v16;
  CGFloat v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  void *v25;
  void *v26;
  double v27;
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
  uint64_t *v38;
  uint64_t v39;
  id v40;
  CGRect v41;
  CGRect v42;

  -[TUIProactiveCandidateCell candidate](self, "candidate");
  v40 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v40, "slotID"))
  {
    objc_msgSend(MEMORY[0x1E0CD2720], "objectForSlot:", objc_msgSend(v40, "slotID"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIProactiveCandidateCell bounds](self, "bounds");
    x = v4;
    y = v6;
    width = v8;
    height = v10;
    if (objc_msgSend(v40, "isStickerCandidate"))
    {
      -[TUICandidateBaseCell style](self, "style");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "minimumCellPadding");
      v14 = v13 * 0.5;
      -[TUICandidateBaseCell style](self, "style");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "minimumCellPadding");
      v17 = v16 * 0.5;
      v41.origin.x = x;
      v41.origin.y = y;
      v41.size.width = width;
      v41.size.height = height;
      v42 = CGRectInset(v41, v14, v17);
      x = v42.origin.x;
      y = v42.origin.y;
      width = v42.size.width;
      height = v42.size.height;

    }
    -[TUICandidateBaseCell style](self, "style");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "extraCellPadding");
    v20 = y + v19 * 0.5;

    -[TUIProactiveCandidateCell slotContentView](self, "slotContentView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setFrame:", x, v20, width, height);

    -[TUIProactiveCandidateCell slotContentView](self, "slotContentView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "layer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setContents:", v3);

    v24 = TUIScreenScaleForView(self);
    -[TUIProactiveCandidateCell slotContentView](self, "slotContentView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "layer");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setContentsScale:", v24);

    v27 = TUIScreenScaleForView(self);
    -[TUIProactiveCandidateCell slotContentView](self, "slotContentView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "layer");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setRasterizationScale:", v27);

    -[TUICandidateBaseCell style](self, "style");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[TUICandidateBaseCell style](self, "style");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "proactiveCandidateContentsGravity");
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      if (v32)
      {
        -[TUICandidateBaseCell style](self, "style");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "proactiveCandidateContentsGravity");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        -[TUIProactiveCandidateCell slotContentView](self, "slotContentView");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "layer");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "setContentsGravity:", v34);

LABEL_13:
        -[TUIProactiveCandidateCell slotContentView](self, "slotContentView");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "setAutoresizingMask:", 18);
        goto LABEL_14;
      }
    }
    else
    {

    }
    if (objc_msgSend(v40, "isStickerCandidate"))
      v38 = (uint64_t *)MEMORY[0x1E0CD2F90];
    else
      v38 = (uint64_t *)MEMORY[0x1E0CD2F88];
    v39 = *v38;
    -[TUIProactiveCandidateCell slotContentView](self, "slotContentView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "layer");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setContentsGravity:", v39);
    goto LABEL_13;
  }
  -[TUIProactiveCandidateCell slotContentView](self, "slotContentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layer");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setContents:", 0);
LABEL_14:

}

- (TIKeyboardCandidate)candidate
{
  return self->_candidate;
}

- (UIView)slotContentView
{
  return self->_slotContentView;
}

- (void)setSlotContentView:(id)a3
{
  objc_storeStrong((id *)&self->_slotContentView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_slotContentView, 0);
  objc_storeStrong((id *)&self->_candidate, 0);
}

+ (id)reuseIdentifier
{
  return CFSTR("TUIProactiveCandidateCell");
}

@end
