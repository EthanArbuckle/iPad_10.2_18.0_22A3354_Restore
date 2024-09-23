@implementation TUICandidateBaseCell

- (TUICandidateBaseCell)initWithFrame:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TUICandidateBaseCell;
  return -[TUICandidateBaseCell initWithFrame:](&v4, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  int v5;
  double v6;
  double v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TUICandidateBaseCell;
  -[TUICandidateBaseCell layoutSubviews](&v9, sel_layoutSubviews);
  -[TUICandidateBaseCell updateColors](self, "updateColors");
  -[TUICandidateBaseCell style](self, "style");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[TUICandidateBaseCell style](self, "style");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "applyCornerRadiusToAllCandidates");

    if (!v5)
      return;
    -[TUICandidateBaseCell style](self, "style");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "cellCornerRadius");
    v7 = v6;
    -[TUICandidateBaseCell layer](self, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setCornerRadius:", v7);

  }
}

- (void)updateColors
{
  void *v3;
  id v4;

  -[TUICandidateBaseCell cellBackgroundImage](self, "cellBackgroundImage");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[TUICandidateBaseCell cellBackgroundColor](self, "cellBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUICandidateBaseCell updateBackground:color:](self, "updateBackground:color:", v4, v3);

}

- (id)cellBackgroundColor
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  uint64_t v8;
  void *v9;

  -[TUICandidateBaseCell style](self, "style");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[TUICandidateBaseCell style](self, "style");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "spaceConfirmationCandidateCellBackgroundColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5 == 0;

  }
  else
  {
    v6 = 1;
  }

  if ((-[TUICandidateBaseCell isHighlighted](self, "isHighlighted") & 1) != 0
    || ((-[TUICandidateBaseCell isSelected](self, "isSelected") ^ 1 | v6) & 1) != 0)
  {
    if ((-[TUICandidateBaseCell isSelected](self, "isSelected") & 1) != 0
      || -[TUICandidateBaseCell isHighlighted](self, "isHighlighted"))
    {
      -[TUICandidateBaseCell style](self, "style");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "highlightedBackgroundColor");
      v8 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[TUICandidateBaseCell style](self, "style");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "cellBackgroundColor");
      v8 = objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    -[TUICandidateBaseCell style](self, "style");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "spaceConfirmationCandidateCellBackgroundColor");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v8;

  return v9;
}

- (id)cellBackgroundImage
{
  void *v3;
  uint64_t v4;
  void *v5;

  if ((-[TUICandidateBaseCell isSelected](self, "isSelected") & 1) != 0
    || -[TUICandidateBaseCell isHighlighted](self, "isHighlighted"))
  {
    -[TUICandidateBaseCell style](self, "style");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "highlightedCellBackgroundImage");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[TUICandidateBaseCell style](self, "style");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "cellBackgroundImage");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)v4;

  return v5;
}

- (void)updateBackground:(id)a3 color:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;

  v13 = a3;
  v6 = a4;
  if (v13)
  {
    -[TUICandidateBaseCell backgroundImageView](self, "backgroundImageView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      v8 = objc_alloc(MEMORY[0x1E0DC3890]);
      -[TUICandidateBaseCell bounds](self, "bounds");
      v9 = (void *)objc_msgSend(v8, "initWithFrame:");
      -[TUICandidateBaseCell setBackgroundImageView:](self, "setBackgroundImageView:", v9);

    }
    -[TUICandidateBaseCell backgroundImageView](self, "backgroundImageView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setImage:", v13);

    -[TUICandidateBaseCell backgroundImageView](self, "backgroundImageView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUICandidateBaseCell setBackgroundView:](self, "setBackgroundView:", v11);

    v12 = 0;
  }
  else
  {
    -[TUICandidateBaseCell setBackgroundView:](self, "setBackgroundView:", 0);
    v12 = v6;
  }
  -[TUICandidateBaseCell setBackgroundColor:](self, "setBackgroundColor:", v12);

}

- (void)setSelected:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TUICandidateBaseCell;
  -[TUICandidateBaseCell setSelected:](&v4, sel_setSelected_, a3);
  -[TUICandidateBaseCell updateColors](self, "updateColors");
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  int v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t);
  void *v12;
  TUICandidateBaseCell *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  TUICandidateBaseCell *v18;
  objc_super v19;

  v3 = a3;
  v19.receiver = self;
  v19.super_class = (Class)TUICandidateBaseCell;
  -[TUICandidateBaseCell setHighlighted:](&v19, sel_setHighlighted_);
  -[TUICandidateBaseCell style](self, "style");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[TUICandidateBaseCell style](self, "style");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "performScalingAnimationOnCellHighlight");

    if (v7)
    {
      if (v3)
      {
        v14 = MEMORY[0x1E0C809B0];
        v15 = 3221225472;
        v16 = __39__TUICandidateBaseCell_setHighlighted___block_invoke;
        v17 = &unk_1E24FC068;
        v18 = self;
        v8 = &v14;
      }
      else
      {
        v9 = MEMORY[0x1E0C809B0];
        v10 = 3221225472;
        v11 = __39__TUICandidateBaseCell_setHighlighted___block_invoke_2;
        v12 = &unk_1E24FC068;
        v13 = self;
        v8 = &v9;
      }
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v8, 0.1, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18);
    }
  }
  else
  {

  }
  -[TUICandidateBaseCell updateColors](self, "updateColors");
}

- (TUICandidateViewStyle)style
{
  return self->_style;
}

- (void)setStyle:(id)a3
{
  objc_storeStrong((id *)&self->_style, a3);
}

- (UIImageView)backgroundImageView
{
  return self->_backgroundImageView;
}

- (void)setBackgroundImageView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundImageView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundImageView, 0);
  objc_storeStrong((id *)&self->_style, 0);
}

uint64_t __39__TUICandidateBaseCell_setHighlighted___block_invoke(uint64_t a1)
{
  void *v2;
  CGAffineTransform v4;
  CGAffineTransform v5;

  CGAffineTransformMakeScale(&v5, 0.95, 0.95);
  v2 = *(void **)(a1 + 32);
  v4 = v5;
  return objc_msgSend(v2, "setTransform:", &v4);
}

uint64_t __39__TUICandidateBaseCell_setHighlighted___block_invoke_2(uint64_t a1)
{
  void *v1;
  __int128 v2;
  _OWORD v4[3];

  v1 = *(void **)(a1 + 32);
  v2 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v4[0] = *MEMORY[0x1E0C9BAA8];
  v4[1] = v2;
  v4[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  return objc_msgSend(v1, "setTransform:", v4);
}

@end
