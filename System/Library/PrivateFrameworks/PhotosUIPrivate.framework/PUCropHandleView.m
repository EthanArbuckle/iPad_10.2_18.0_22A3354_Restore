@implementation PUCropHandleView

- (PUCropHandleView)initWithFrame:(CGRect)a3
{
  return (PUCropHandleView *)-[PUCropHandleView initForHandle:](self, "initForHandle:", 4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (id)initForHandle:(unint64_t)a3
{
  PUCropHandleView *v4;
  PUCropHandleView *v5;
  id v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  _BOOL4 v26;
  uint64_t v27;
  const __CFString *v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  double v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  double v70;
  uint64_t v71;
  void *v72;
  objc_super v74;
  void *v75;
  void *v76;
  _QWORD v77[2];
  _QWORD v78[2];
  _QWORD v79[3];

  v79[2] = *MEMORY[0x1E0C80C00];
  v74.receiver = self;
  v74.super_class = (Class)PUCropHandleView;
  v4 = -[PUCropHandleView initWithFrame:](&v74, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v5 = v4;
  if (v4)
  {
    v4->_handle = a3;
    v6 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
    objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PUCropHandleView addSubview:](v5, "addSubview:", v6);
    if (-[PUCropHandleView isLateral](v5, "isLateral"))
      v7 = 1.0;
    else
      v7 = 3.0;
    v78[0] = CFSTR("lineLength");
    v78[1] = CFSTR("lineWidth");
    v79[0] = &unk_1E59BC510;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v79[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v79, v78, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[PUCropHandleView isCorner](v5, "isCorner"))
    {
      -[PUCropHandleView _createLineView](v5, "_createLineView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUCropHandleView _createLineView](v5, "_createLineView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUCropHandleView addSubview:](v5, "addSubview:", v10);
      -[PUCropHandleView addSubview:](v5, "addSubview:", v11);
      _NSDictionaryOfVariableBindings(CFSTR("horizontalLine, verticalLine, referenceView"), v10, v11, v6, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:[horizontalLine(lineLength)]"), 0x10000, v9, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUCropHandleView addConstraints:](v5, "addConstraints:", v13);

      objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:[verticalLine(lineLength)]"), 0, v9, v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUCropHandleView addConstraints:](v5, "addConstraints:", v14);

      objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v10, 9, 0, v5, 9, 1.0, 0.0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUCropHandleView addConstraint:](v5, "addConstraint:", v15);

      objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v11, 10, 0, v5, 10, 1.0, 0.0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUCropHandleView addConstraint:](v5, "addConstraint:", v16);

      if (-[PUCropHandleView isLeft](v5, "isLeft"))
        v17 = 4;
      else
        v17 = 2;
      if (-[PUCropHandleView isTop](v5, "isTop"))
      {
        objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:[horizontalLine(lineWidth)][referenceView]"), v17, v9, v12);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[PUCropHandleView addConstraints:](v5, "addConstraints:", v18);

        v19 = (void *)MEMORY[0x1E0CB3718];
        v20 = 1.0;
        v21 = v10;
        v22 = 3;
        v23 = v11;
        v24 = 3;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:[referenceView][horizontalLine(lineWidth)]"), v17, v9, v12);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        -[PUCropHandleView addConstraints:](v5, "addConstraints:", v34);

        v19 = (void *)MEMORY[0x1E0CB3718];
        v20 = 1.0;
        v21 = v10;
        v22 = 4;
        v23 = v11;
        v24 = 4;
      }
      objc_msgSend(v19, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v21, v22, 0, v23, v24, v20, 0.0);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUCropHandleView addConstraint:](v5, "addConstraint:", v35);

      if (-[PUCropHandleView isTop](v5, "isTop"))
        v36 = 65552;
      else
        v36 = 65544;
      if (-[PUCropHandleView isLeft](v5, "isLeft"))
      {
        objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:[verticalLine(lineWidth)][referenceView]"), v36, v9, v12);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        -[PUCropHandleView addConstraints:](v5, "addConstraints:", v37);

        v38 = (void *)MEMORY[0x1E0CB3718];
        v39 = 1.0;
        v40 = v11;
        v41 = 1;
        v42 = v10;
        v43 = 1;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:[referenceView][verticalLine(lineWidth)]"), v36, v9, v12);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        -[PUCropHandleView addConstraints:](v5, "addConstraints:", v44);

        v38 = (void *)MEMORY[0x1E0CB3718];
        v39 = 1.0;
        v40 = v11;
        v41 = 2;
        v42 = v10;
        v43 = 2;
      }
      objc_msgSend(v38, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v40, v41, 0, v42, v43, v39, 0.0);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUCropHandleView addConstraint:](v5, "addConstraint:", v45);

      v77[0] = v10;
      v77[1] = v11;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v77, 2);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUCropHandleView _setLineViews:](v5, "_setLineViews:", v46);
      goto LABEL_46;
    }
    if (!-[PUCropHandleView isLateral](v5, "isLateral"))
    {
LABEL_47:
      -[PUCropHandleView _setLayoutReferenceView:](v5, "_setLayoutReferenceView:", v6);
      -[PUCropHandleView setOpaque:](v5, "setOpaque:", 0);

      return v5;
    }
    -[PUCropHandleView _createLineView](v5, "_createLineView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUCropHandleView addSubview:](v5, "addSubview:", v10);
    _NSDictionaryOfVariableBindings(CFSTR("lineView, referenceView"), v10, v6, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[PUCropHandleView isTop](v5, "isTop") || -[PUCropHandleView isBottom](v5, "isBottom"))
    {
      objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[lineView]|"), 0x10000, v9, v11);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUCropHandleView addConstraints:](v5, "addConstraints:", v25);

      v26 = -[PUCropHandleView isTop](v5, "isTop");
      if (v26)
        v27 = 4;
      else
        v27 = 3;
      if (v26)
        v28 = CFSTR("V:[lineView][referenceView]|");
      else
        v28 = CFSTR("V:|[referenceView][lineView]");
      objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v10, v27, 0, v5, 10, 1.0, 0.0);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUCropHandleView addConstraint:](v5, "addConstraint:", v29);

      objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", v28, 6, v9, v11);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUCropHandleView addConstraints:](v5, "addConstraints:", v30);

      objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v10, 8, 0, 0, 0, 1.0, v7);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUCropHandleView addConstraint:](v5, "addConstraint:", v31);

      v76 = v10;
      v32 = 1;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v76, 1);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUCropHandleView _setLineViews:](v5, "_setLineViews:", v33);
    }
    else
    {
      if (-[PUCropHandleView isLeft](v5, "isLeft"))
        v47 = 65560;
      else
        v47 = 131096;
      objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:[lineView][referenceView]|"), v47, v9, v11);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUCropHandleView addConstraints:](v5, "addConstraints:", v48);

      objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[referenceView]|"), 0, v9, v11);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUCropHandleView addConstraints:](v5, "addConstraints:", v49);

      objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[lineView]|"), 0, v9, v11);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUCropHandleView addConstraints:](v5, "addConstraints:", v50);

      objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v10, 7, 0, 0, 0, 1.0, v7);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUCropHandleView addConstraint:](v5, "addConstraint:", v51);

      if (-[PUCropHandleView isLeft](v5, "isLeft"))
        v52 = 2;
      else
        v52 = 1;
      objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v10, v52, 0, v5, 9, 1.0, 0.0);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUCropHandleView addConstraint:](v5, "addConstraint:", v33);
      v32 = 0;
    }

    v75 = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v75, 1);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUCropHandleView _setLineViews:](v5, "_setLineViews:", v53);

    -[PUCropHandleView _createLineView](v5, "_createLineView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUCropHandleView addSubview:](v5, "addSubview:", v12);
    if (v32)
    {
      objc_msgSend(v12, "heightAnchor");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "constraintEqualToConstant:", 3.0);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "setActive:", 1);

      objc_msgSend(v12, "widthAnchor");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "constraintEqualToConstant:", 25.0);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "setActive:", 1);

      objc_msgSend(v6, "centerXAnchor");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "centerXAnchor");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "constraintEqualToAnchor:", v59);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "setActive:", 1);

      if (-[PUCropHandleView isTop](v5, "isTop"))
      {
        objc_msgSend(v6, "topAnchor");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "topAnchor");
        v61 = objc_claimAutoreleasedReturnValue();
LABEL_41:
        v69 = (void *)v61;
        v70 = 3.0;
LABEL_45:
        objc_msgSend(v46, "constraintEqualToAnchor:constant:", v69, v70);
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "setActive:", 1);

LABEL_46:
        goto LABEL_47;
      }
      objc_msgSend(v6, "bottomAnchor");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "bottomAnchor");
      v71 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v12, "widthAnchor");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "constraintEqualToConstant:", 3.0);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "setActive:", 1);

      objc_msgSend(v12, "heightAnchor");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "constraintEqualToConstant:", 25.0);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "setActive:", 1);

      objc_msgSend(v6, "centerYAnchor");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "centerYAnchor");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "constraintEqualToAnchor:", v67);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "setActive:", 1);

      if (-[PUCropHandleView isLeft](v5, "isLeft"))
      {
        objc_msgSend(v6, "leftAnchor");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "leftAnchor");
        v61 = objc_claimAutoreleasedReturnValue();
        goto LABEL_41;
      }
      objc_msgSend(v6, "rightAnchor");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "rightAnchor");
      v71 = objc_claimAutoreleasedReturnValue();
    }
    v69 = (void *)v71;
    v70 = -3.0;
    goto LABEL_45;
  }
  return v5;
}

- (id)_createLineView
{
  void *v2;
  id v3;
  void *v4;

  +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  objc_msgSend(v3, "setOpaque:", 1);
  objc_msgSend(v2, "photoEditingCropHandleColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  return v3;
}

- (id)_createCornerOverlayView
{
  id v2;
  void *v3;

  v2 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.600000024);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBackgroundColor:", v3);

  objc_msgSend(v2, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  return v2;
}

- (BOOL)isTop
{
  unint64_t v2;

  v2 = -[PUCropHandleView handle](self, "handle");
  return (v2 & 0xFFFFFFFFFFFFFFFBLL) == 0 || v2 == 5;
}

- (BOOL)isLeft
{
  unint64_t v2;

  v2 = -[PUCropHandleView handle](self, "handle");
  return (v2 < 7) & (0x52u >> v2);
}

- (BOOL)isRight
{
  unint64_t v2;

  v2 = -[PUCropHandleView handle](self, "handle");
  return (v2 < 8) & (0xA4u >> v2);
}

- (BOOL)isBottom
{
  unint64_t v2;

  v2 = -[PUCropHandleView handle](self, "handle");
  return (v2 < 8) & (0xC8u >> v2);
}

- (BOOL)isCorner
{
  return (-[PUCropHandleView handle](self, "handle") & 0xFFFFFFFFFFFFFFFCLL) == 4;
}

- (BOOL)isLateral
{
  return -[PUCropHandleView handle](self, "handle") < 4;
}

- (unint64_t)oppositeHandle
{
  unint64_t v2;

  v2 = -[PUCropHandleView handle](self, "handle");
  if (v2 - 1 > 6)
    return 3;
  else
    return qword_1AB0EF988[v2 - 1];
}

- (NSArray)adjacentHandles
{
  unint64_t v2;

  v2 = -[PUCropHandleView handle](self, "handle");
  if (v2 - 1 > 6)
    return (NSArray *)&unk_1E59B9DC0;
  else
    return (NSArray *)qword_1E589DE98[v2 - 1];
}

- (unint64_t)handle
{
  return self->_handle;
}

- (BOOL)isOverlayHidden
{
  return self->_overlayHidden;
}

- (void)setOverlayHidden:(BOOL)a3
{
  self->_overlayHidden = a3;
}

- (NSArray)_lineViews
{
  return self->__lineViews;
}

- (void)_setLineViews:(id)a3
{
  objc_storeStrong((id *)&self->__lineViews, a3);
}

- (NSArray)_overlayViews
{
  return self->__overlayViews;
}

- (void)_setOverlayViews:(id)a3
{
  objc_storeStrong((id *)&self->__overlayViews, a3);
}

- (UIView)_layoutReferenceView
{
  return self->__layoutReferenceView;
}

- (void)_setLayoutReferenceView:(id)a3
{
  objc_storeStrong((id *)&self->__layoutReferenceView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__layoutReferenceView, 0);
  objc_storeStrong((id *)&self->__overlayViews, 0);
  objc_storeStrong((id *)&self->__lineViews, 0);
}

+ (id)allHandles
{
  if (allHandles___allHandlesToken != -1)
    dispatch_once(&allHandles___allHandlesToken, &__block_literal_global_22042);
  return (id)allHandles___allHandles;
}

void __30__PUCropHandleView_allHandles__block_invoke()
{
  void *v0;

  v0 = (void *)allHandles___allHandles;
  allHandles___allHandles = (uint64_t)&unk_1E59B9E80;

}

@end
