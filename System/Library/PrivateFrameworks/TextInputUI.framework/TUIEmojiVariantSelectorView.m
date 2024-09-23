@implementation TUIEmojiVariantSelectorView

- (TUIEmojiVariantSelectorView)initWithFrame:(CGRect)a3 emojiToken:(id)a4 originRect:(CGRect)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v10;
  double v11;
  double v12;
  double v13;
  id v15;
  TUIEmojiVariantSelectorView *v16;
  TUIEmojiVariantSelectorView *v17;
  id v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  double v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  TUIDrawingView *v62;
  void *v63;
  void *v64;
  TUIDrawingView *v65;
  void *v66;
  id v67;
  uint64_t v68;
  void *v69;
  void *v70;
  id v71;
  uint64_t v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  uint64_t v78;
  UIView *variantCellContainerView;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  NSArray *v85;
  void *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t i;
  TUIEmojiVariantCell *v91;
  void *v92;
  NSArray *arrangedVariantCells;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  objc_super v99;
  _BYTE v100[128];
  uint64_t v101;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v10 = a3.size.height;
  v11 = a3.size.width;
  v12 = a3.origin.y;
  v13 = a3.origin.x;
  v101 = *MEMORY[0x1E0C80C00];
  v15 = a4;
  v99.receiver = self;
  v99.super_class = (Class)TUIEmojiVariantSelectorView;
  v16 = -[TUIEmojiVariantSelectorView initWithFrame:](&v99, sel_initWithFrame_, v13, v12, v11, v10);
  v17 = v16;
  if (v16)
  {
    v16->_originRect.origin.x = x;
    v16->_originRect.origin.y = y;
    v16->_originRect.size.width = width;
    v16->_originRect.size.height = height;
    objc_storeStrong((id *)&v16->_baseEmojiToken, a4);
    v18 = objc_alloc(MEMORY[0x1E0DC3F10]);
    v19 = *MEMORY[0x1E0C9D648];
    v20 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v21 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v22 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v23 = (void *)objc_msgSend(v18, "initWithFrame:", *MEMORY[0x1E0C9D648], v20, v21, v22);
    -[TUIEmojiVariantSelectorView setDeepShadowView:](v17, "setDeepShadowView:", v23);

    -[TUIEmojiVariantSelectorView deepShadowView](v17, "deepShadowView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "layer");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v26) = 1045220557;
    objc_msgSend(v25, "setShadowOpacity:", v26);

    -[TUIEmojiVariantSelectorView deepShadowView](v17, "deepShadowView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "layer");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setShadowRadius:", 7.0);

    -[TUIEmojiVariantSelectorView deepShadowView](v17, "deepShadowView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "layer");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setShadowOffset:", 0.0, 6.0);

    -[TUIEmojiVariantSelectorView deepShadowView](v17, "deepShadowView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "layer");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setMasksToBounds:", 0);

    -[TUIEmojiVariantSelectorView deepShadowView](v17, "deepShadowView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setUserInteractionEnabled:", 0);

    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v34 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v35 = objc_msgSend(v34, "CGColor");
    -[TUIEmojiVariantSelectorView deepShadowView](v17, "deepShadowView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "layer");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setShadowColor:", v35);

    -[TUIEmojiVariantSelectorView deepShadowView](v17, "deepShadowView");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIEmojiVariantSelectorView addSubview:](v17, "addSubview:", v38);

    v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v19, v20, v21, v22);
    -[TUIEmojiVariantSelectorView setKeyShadowView:](v17, "setKeyShadowView:", v39);

    -[TUIEmojiVariantSelectorView keyShadowView](v17, "keyShadowView");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "layer");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v42) = 1050253722;
    objc_msgSend(v41, "setShadowOpacity:", v42);

    -[TUIEmojiVariantSelectorView keyShadowView](v17, "keyShadowView");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "layer");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setShadowRadius:", 0.0);

    -[TUIEmojiVariantSelectorView keyShadowView](v17, "keyShadowView");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "layer");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setShadowOffset:", 0.0, 1.0);

    -[TUIEmojiVariantSelectorView keyShadowView](v17, "keyShadowView");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "layer");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setMasksToBounds:", 0);

    -[TUIEmojiVariantSelectorView keyShadowView](v17, "keyShadowView");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "setUserInteractionEnabled:", 0);

    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v50 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v51 = objc_msgSend(v50, "CGColor");
    -[TUIEmojiVariantSelectorView keyShadowView](v17, "keyShadowView");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "layer");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "setShadowColor:", v51);

    -[TUIEmojiVariantSelectorView keyShadowView](v17, "keyShadowView");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIEmojiVariantSelectorView addSubview:](v17, "addSubview:", v54);

    v55 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v19, v20, v21, v22);
    -[TUIEmojiVariantSelectorView setBackdropView:](v17, "setBackdropView:", v55);

    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithDynamicProvider:", &__block_literal_global_6648);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIEmojiVariantSelectorView backdropView](v17, "backdropView");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "setBackgroundColor:", v56);

    -[TUIEmojiVariantSelectorView backdropView](v17, "backdropView");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "layer");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "setMasksToBounds:", 1);

    -[TUIEmojiVariantSelectorView backdropView](v17, "backdropView");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "setUserInteractionEnabled:", 0);

    -[TUIEmojiVariantSelectorView backdropView](v17, "backdropView");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIEmojiVariantSelectorView addSubview:](v17, "addSubview:", v61);

    v62 = -[TUIDrawingView initWithFrame:]([TUIDrawingView alloc], "initWithFrame:", v19, v20, v21, v22);
    -[TUIEmojiVariantSelectorView setBackgroundMaskView:](v17, "setBackgroundMaskView:", v62);

    -[TUIEmojiVariantSelectorView backgroundMaskView](v17, "backgroundMaskView");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIEmojiVariantSelectorView backdropView](v17, "backdropView");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "setMaskView:", v63);

    v65 = -[TUIDrawingView initWithFrame:]([TUIDrawingView alloc], "initWithFrame:", v19, v20, v21, v22);
    -[TUIEmojiVariantSelectorView setBorderView:](v17, "setBorderView:", v65);

    -[TUIEmojiVariantSelectorView borderView](v17, "borderView");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "setUserInteractionEnabled:", 0);

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v67 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v68 = objc_msgSend(v67, "CGColor");
    -[TUIEmojiVariantSelectorView borderView](v17, "borderView");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "shapeLayer");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "setFillColor:", v68);

    objc_msgSend(MEMORY[0x1E0DC3658], "systemFillColor");
    v71 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v72 = objc_msgSend(v71, "CGColor");
    -[TUIEmojiVariantSelectorView borderView](v17, "borderView");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "shapeLayer");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "setStrokeColor:", v72);

    -[TUIEmojiVariantSelectorView borderView](v17, "borderView");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "shapeLayer");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "setLineWidth:", 1.0);

    -[TUIEmojiVariantSelectorView borderView](v17, "borderView");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIEmojiVariantSelectorView addSubview:](v17, "addSubview:", v77);

    v78 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v19, v20, v21, v22);
    variantCellContainerView = v17->_variantCellContainerView;
    v17->_variantCellContainerView = (UIView *)v78;

    -[TUIEmojiVariantSelectorView addSubview:](v17, "addSubview:", v17->_variantCellContainerView);
    v80 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v19, v20, v21, v22);
    -[TUIEmojiVariantSelectorView setSeparatorView:](v17, "setSeparatorView:", v80);

    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithDynamicProvider:", &__block_literal_global_5_6650);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIEmojiVariantSelectorView separatorView](v17, "separatorView");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "setBackgroundColor:", v81);

    -[TUIEmojiVariantSelectorView variantCellContainerView](v17, "variantCellContainerView");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIEmojiVariantSelectorView separatorView](v17, "separatorView");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "addSubview:", v84);

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v85 = (NSArray *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "skinToneVariants");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v95 = 0u;
    v96 = 0u;
    v97 = 0u;
    v98 = 0u;
    v87 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v95, v100, 16);
    if (v87)
    {
      v88 = v87;
      v89 = *(_QWORD *)v96;
      do
      {
        for (i = 0; i != v88; ++i)
        {
          if (*(_QWORD *)v96 != v89)
            objc_enumerationMutation(v86);
          v91 = -[TUIEmojiVariantCell initWithFrame:token:]([TUIEmojiVariantCell alloc], "initWithFrame:token:", *(_QWORD *)(*((_QWORD *)&v95 + 1) + 8 * i), v19, v20, v21, v22);
          -[TUIEmojiVariantCell setVariantSelectorView:](v91, "setVariantSelectorView:", v17);
          -[TUIEmojiVariantSelectorView variantCellContainerView](v17, "variantCellContainerView");
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v92, "addSubview:", v91);

          -[NSArray addObject:](v85, "addObject:", v91);
        }
        v88 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v95, v100, 16);
      }
      while (v88);
    }
    arrangedVariantCells = v17->_arrangedVariantCells;
    v17->_arrangedVariantCells = v85;

  }
  return v17;
}

- (CGSize)_emojiCellSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  objc_msgSend((id)objc_opt_class(), "emojiTextAttributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("🆒"), "sizeWithAttributes:", v2);
  v4 = v3;
  v6 = v5;

  v7 = v4 + 3.0;
  v8 = v6 + 3.0 + 3.0;
  result.height = v8;
  result.width = v7;
  return result;
}

- (unint64_t)_numberOfVariants
{
  void *v2;
  unint64_t v3;

  -[EMFEmojiToken skinToneVariants](self->_baseEmojiToken, "skinToneVariants");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  -[TUIEmojiVariantSelectorView _emojiCellSize](self, "_emojiCellSize", a3.width, a3.height);
  v5 = v4;
  v7 = (v6 + 6.0) * (double)-[TUIEmojiVariantSelectorView _numberOfVariants](self, "_numberOfVariants") + 15.0 + 6.0;
  v8 = v5 + 6.0 + 6.0 + CGRectGetHeight(self->_originRect) + 8.0;
  v9 = v7;
  result.height = v8;
  result.width = v9;
  return result;
}

- (id)_backgroundBezierPathForContainerRect:(CGRect)a3 originRect:(CGRect)a4
{
  CGFloat x;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  void *v9;
  id v10;
  void (**v11)(void *, uint64_t, uint64_t, double, double, double, double, double, double);
  double MaxY;
  CGFloat v13;
  double v14;
  double v15;
  double MinX;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGFloat MinY;
  double v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  double v36;
  CGFloat v37;
  id v38;
  double v40;
  double v41;
  CGFloat v42;
  double v43;
  double height;
  double MaxX;
  double v46;
  CGFloat width;
  CGFloat v48;
  double y;
  _QWORD aBlock[4];
  id v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;

  height = a4.size.height;
  width = a3.size.width;
  v48 = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v5 = a3.size.height;
  v6 = a3.size.width;
  v7 = a3.origin.y;
  v8 = a3.origin.x;
  v41 = *(double *)&TUIEmojiVariantSelectorBubbleRadius;
  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __80__TUIEmojiVariantSelectorView__backgroundBezierPathForContainerRect_originRect___block_invoke;
  aBlock[3] = &unk_1E24FBC50;
  v10 = v9;
  v51 = v10;
  v11 = (void (**)(void *, uint64_t, uint64_t, double, double, double, double, double, double))_Block_copy(aBlock);
  v52.origin.x = v8;
  v52.origin.y = v7;
  v52.size.width = v6;
  v52.size.height = v5;
  MaxY = CGRectGetMaxY(v52);
  v13 = x;
  v53.origin.x = x;
  v53.origin.y = y;
  v53.size.width = v48;
  v53.size.height = height;
  v14 = MaxY - CGRectGetMinY(v53);
  v15 = y + v14;
  v54.size.height = height - v14;
  v40 = height - v14;
  v54.origin.x = x;
  v54.origin.y = v15;
  v54.size.width = v48;
  MinX = CGRectGetMinX(v54);
  v55.origin.x = v8;
  v42 = v7;
  v55.origin.y = v7;
  v55.size.width = width;
  v55.size.height = v5;
  v17 = vabdd_f64(MinX, CGRectGetMinX(v55));
  if (v17 >= *(double *)&TUIEmojiVariantSelectorBubbleRadius + *(double *)&TUIEmojiVariantSelectorBubbleRadius)
    v18 = v41;
  else
    v18 = v17 * 0.5;
  v43 = v18;
  v56.origin.x = x;
  v56.origin.y = v15;
  v56.size.width = v48;
  v56.size.height = v40;
  MaxX = CGRectGetMaxX(v56);
  v57.origin.x = v8;
  v57.origin.y = v7;
  v57.size.width = width;
  v57.size.height = v5;
  v19 = vabdd_f64(MaxX, CGRectGetMaxX(v57));
  if (v19 >= *(double *)&TUIEmojiVariantSelectorBubbleRadius + *(double *)&TUIEmojiVariantSelectorBubbleRadius)
    v20 = v41;
  else
    v20 = v19 * 0.5;
  v46 = v20;
  v58.origin.x = x;
  v58.origin.y = v15;
  v58.size.width = v48;
  v58.size.height = v40;
  v21 = CGRectGetMinX(v58);
  v59.origin.x = x;
  v59.origin.y = v15;
  v59.size.width = v48;
  v59.size.height = v40;
  v22 = CGRectGetMaxY(v59);
  objc_msgSend(v10, "moveToPoint:", v21 + 6.0, v22);
  objc_msgSend(v10, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 4, 0, v21, v22, 6.0, 6.0);
  v60.origin.x = v13;
  v60.origin.y = v15;
  v60.size.width = v48;
  v60.size.height = v40;
  v23 = CGRectGetMinX(v60);
  v61.origin.x = v13;
  v61.origin.y = v15;
  v61.size.width = v48;
  v61.size.height = v40;
  MinY = CGRectGetMinY(v61);
  v25 = v41;
  v11[2](v11, 2, 1, v23, MinY, 0.0, v41, v43, v41);
  v62.origin.x = v8;
  v62.origin.y = v42;
  v62.size.width = width;
  v62.size.height = v5;
  v26 = CGRectGetMinX(v62);
  v63.origin.x = v8;
  v63.origin.y = v42;
  v63.size.width = width;
  v63.size.height = v5;
  v27 = CGRectGetMaxY(v63);
  v11[2](v11, 4, 0, v26, v27, v43, 0.0, v43, v41);
  v64.origin.x = v8;
  v64.origin.y = v42;
  v64.size.width = width;
  v64.size.height = v5;
  v28 = CGRectGetMinX(v64);
  v65.origin.x = v8;
  v65.origin.y = v42;
  v65.size.width = width;
  v65.size.height = v5;
  v29 = CGRectGetMinY(v65);
  v11[2](v11, 1, 0, v28, v29, 0.0, v25, v25, v25);
  v66.origin.x = v8;
  v66.origin.y = v42;
  v66.size.width = width;
  v66.size.height = v5;
  v30 = CGRectGetMaxX(v66);
  v67.origin.x = v8;
  v67.origin.y = v42;
  v67.size.width = width;
  v67.size.height = v5;
  v31 = CGRectGetMinY(v67);
  v11[2](v11, 2, 0, v30, v31, -v25, 0.0, v25, v25);
  v68.origin.x = v8;
  v68.origin.y = v42;
  v68.size.width = width;
  v68.size.height = v5;
  v32 = CGRectGetMaxX(v68);
  v69.origin.x = v8;
  v69.origin.y = v42;
  v69.size.width = width;
  v69.size.height = v5;
  v33 = CGRectGetMaxY(v69);
  v11[2](v11, 8, 0, v32, v33, 0.0, -v25, v46, v25);
  v70.origin.x = v13;
  v70.origin.y = v15;
  v70.size.width = v48;
  v70.size.height = v40;
  v34 = CGRectGetMaxX(v70);
  v71.origin.x = v13;
  v71.origin.y = v15;
  v71.size.width = v48;
  v71.size.height = v40;
  v35 = CGRectGetMinY(v71);
  v11[2](v11, 1, 1, v34, v35, v46, 0.0, v46, v41);
  v72.origin.x = v13;
  v72.origin.y = v15;
  v72.size.width = v48;
  v72.size.height = v40;
  v36 = CGRectGetMaxX(v72);
  v73.origin.x = v13;
  v73.origin.y = v15;
  v73.size.width = v48;
  v73.size.height = v40;
  v37 = CGRectGetMaxY(v73);
  v11[2](v11, 8, 0, v36, v37, 0.0, -6.0, 6.0, 6.0);
  objc_msgSend(v10, "closePath");
  v38 = v10;

  return v38;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
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
  void *v30;
  const CGPath *v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  CGFloat width;
  CGFloat height;
  void *v45;
  const CGPath *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  double v53;
  double v54;
  uint64_t v60;
  void *v61;
  double v62;
  _QWORD *p_x;
  CGFloat v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void (**v68)(void *, void *);
  void *v69;
  double v70;
  double v71;
  CGRect *v72;
  double v73;
  double v77;
  CGRect *v78;
  CGFloat v79;
  void *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t i;
  double v85;
  double v86;
  double v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  _QWORD aBlock[5];
  BOOL v93;
  uint64_t v94;
  CGRect *v95;
  uint64_t v96;
  void *v97;
  __int128 v98;
  double v99;
  uint64_t v100;
  objc_super v101;
  _BYTE v102[128];
  uint64_t v103;
  CGRect v104;
  CGRect v105;

  v103 = *MEMORY[0x1E0C80C00];
  v101.receiver = self;
  v101.super_class = (Class)TUIEmojiVariantSelectorView;
  -[TUIEmojiVariantSelectorView layoutSubviews](&v101, sel_layoutSubviews);
  -[TUIEmojiVariantSelectorView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9 - (CGRectGetHeight(self->_originRect) + 8.0);
  -[TUIEmojiVariantSelectorView bounds](self, "bounds");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  -[TUIEmojiVariantSelectorView borderView](self, "borderView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setFrame:", v12, v14, v16, v18);

  -[TUIEmojiVariantSelectorView bounds](self, "bounds");
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v27 = v26;
  -[TUIEmojiVariantSelectorView backdropView](self, "backdropView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setFrame:", v21, v23, v25, v27);

  -[TUIEmojiVariantSelectorView variantCellContainerView](self, "variantCellContainerView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setFrame:", v4, v6, v8, v10);

  -[TUIEmojiVariantSelectorView deepShadowView](self, "deepShadowView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setFrame:", v4, v6, v8, v10);

  v85 = v6;
  v86 = v4;
  v104.origin.x = v4;
  v104.origin.y = v6;
  v87 = v8;
  v104.size.width = v8;
  v104.size.height = v10;
  v31 = CGPathCreateWithRect(v104, 0);
  -[TUIEmojiVariantSelectorView deepShadowView](self, "deepShadowView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "layer");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setShadowPath:", v31);

  if (v31)
    CGPathRelease(v31);
  -[TUIEmojiVariantSelectorView superview](self, "superview");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUIEmojiVariantSelectorView convertRect:fromView:](self, "convertRect:fromView:", v34, self->_originRect.origin.x, self->_originRect.origin.y, self->_originRect.size.width, self->_originRect.size.height);
  v36 = v35;
  v38 = v37;
  v40 = v39;
  v42 = v41;

  width = self->_originRect.size.width;
  height = self->_originRect.size.height;
  -[TUIEmojiVariantSelectorView keyShadowView](self, "keyShadowView");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setFrame:", v36, v38, v40, v42);

  v105.origin.x = 0.0;
  v105.origin.y = 0.0;
  v105.size.width = width;
  v105.size.height = height;
  v46 = CGPathCreateWithRoundedRect(v105, 6.0, 6.0, 0);
  -[TUIEmojiVariantSelectorView keyShadowView](self, "keyShadowView");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "layer");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setShadowPath:", v46);

  if (v46)
    CGPathRelease(v46);
  -[TUIEmojiVariantSelectorView _backgroundBezierPathForContainerRect:originRect:](self, "_backgroundBezierPathForContainerRect:originRect:", v86, v85, v87, v10, v36, v38, v40, v42);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUIEmojiVariantSelectorView borderView](self, "borderView");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setPath:", v49);

  -[TUIEmojiVariantSelectorView backgroundMaskView](self, "backgroundMaskView");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "setPath:", v49);

  v52 = -[TUIEmojiVariantSelectorView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
  -[TUIEmojiVariantSelectorView _emojiCellSize](self, "_emojiCellSize");
  v54 = v53;
  v94 = 0;
  v95 = (CGRect *)&v94;
  v96 = 0x4010000000;
  v97 = &unk_18C81310E;
  __asm { FMOV            V0.2D, #6.0 }
  v98 = _Q0;
  v99 = v54;
  v100 = v60;
  if (v52 == 1)
  {
    -[TUIEmojiVariantSelectorView variantCellContainerView](self, "variantCellContainerView");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "frame");
    v95[1].origin.x = v62 - (v54 + 6.0);

  }
  UIRectCenteredYInRect();
  p_x = (_QWORD *)&v95->origin.x;
  v95[1].origin.x = v64;
  p_x[5] = v65;
  p_x[6] = v66;
  p_x[7] = v67;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __45__TUIEmojiVariantSelectorView_layoutSubviews__block_invoke;
  aBlock[3] = &unk_1E24FBC78;
  aBlock[4] = &v94;
  v93 = v52 == 1;
  v68 = (void (**)(void *, void *))_Block_copy(aBlock);
  -[NSArray firstObject](self->_arrangedVariantCells, "firstObject");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v68[2](v68, v69);
  if (v52 == 1)
  {
    objc_msgSend(v69, "frame");
    v71 = v70 + -11.0;
    v72 = v95;
  }
  else
  {
    v72 = v95;
    v71 = v95[1].origin.x + 4.0;
  }
  -[UIView setFrame:](self->_separatorView, "setFrame:", v71, 0.0, 1.0, v72[1].size.height + -6.0);
  -[UIView frame](self->_separatorView, "frame");
  UIRectCenteredYInRect();
  -[UIView setFrame:](self->_separatorView, "setFrame:");
  -[UIView frame](self->_separatorView, "frame");
  if (v52 == 1)
  {
    v77 = v73 - (CGRectGetWidth(v95[1]) + 10.0);
    v78 = v95;
  }
  else
  {
    v79 = CGRectGetWidth(*(CGRect *)&v73);
    v78 = v95;
    v77 = v95[1].origin.x + v79 + 6.0 + 8.0;
  }
  v78[1].origin.x = v77;
  v90 = 0u;
  v91 = 0u;
  v88 = 0u;
  v89 = 0u;
  -[NSArray subarrayWithRange:](self->_arrangedVariantCells, "subarrayWithRange:", 1, -[NSArray count](self->_arrangedVariantCells, "count") - 1);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v88, v102, 16);
  if (v81)
  {
    v82 = v81;
    v83 = *(_QWORD *)v89;
    do
    {
      for (i = 0; i != v82; ++i)
      {
        if (*(_QWORD *)v89 != v83)
          objc_enumerationMutation(v80);
        v68[2](v68, *(void **)(*((_QWORD *)&v88 + 1) + 8 * i));
      }
      v82 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v88, v102, 16);
    }
    while (v82);
  }

  _Block_object_dispose(&v94, 8);
}

- (void)_unhighlightAllViews
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = self->_arrangedVariantCells;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "setHighlighted:", 0, (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (id)_variantCellAtLocation:(CGPoint)a3
{
  CGFloat x;
  double v5;
  CGFloat v6;
  NSArray *v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;
  CGPoint v19;
  CGRect v20;

  x = a3.x;
  v18 = *MEMORY[0x1E0C80C00];
  -[UIView frame](self->_variantCellContainerView, "frame", a3.x, a3.y);
  UIRectGetCenter();
  v6 = v5;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = self->_arrangedVariantCells;
  v8 = (id)-[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v11, "frame", (_QWORD)v13);
        v19.x = x;
        v19.y = v6;
        if (CGRectContainsPoint(v20, v19))
        {
          v8 = v11;
          goto LABEL_11;
        }
      }
      v8 = (id)-[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_11:

  return v8;
}

- (BOOL)_highlightCellAtLocation:(CGPoint)a3
{
  void *v4;

  -[TUIEmojiVariantSelectorView _variantCellAtLocation:](self, "_variantCellAtLocation:", a3.x, a3.y);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[TUIEmojiVariantSelectorView _unhighlightAllViews](self, "_unhighlightAllViews");
    objc_msgSend(v4, "setHighlighted:", 1);
  }

  return v4 != 0;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  uint64_t i;
  objc_super v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (!v8)
    goto LABEL_12;
  v9 = v8;
  v10 = 0;
  v11 = *(_QWORD *)v15;
  do
  {
    for (i = 0; i != v9; ++i)
    {
      if (*(_QWORD *)v15 != v11)
        objc_enumerationMutation(v6);
      if (v10)
      {
        v10 = 1;
      }
      else
      {
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "locationInView:", self);
        v10 = -[TUIEmojiVariantSelectorView _highlightCellAtLocation:](self, "_highlightCellAtLocation:");
      }
    }
    v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  }
  while (v9);
  if (!v10)
  {
LABEL_12:
    v13.receiver = self;
    v13.super_class = (Class)TUIEmojiVariantSelectorView;
    -[TUIEmojiVariantSelectorView touchesBegan:withEvent:](&v13, sel_touchesBegan_withEvent_, v6, v7);
  }

}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  uint64_t i;
  objc_super v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (!v8)
    goto LABEL_12;
  v9 = v8;
  v10 = 0;
  v11 = *(_QWORD *)v15;
  do
  {
    for (i = 0; i != v9; ++i)
    {
      if (*(_QWORD *)v15 != v11)
        objc_enumerationMutation(v6);
      if (v10)
      {
        v10 = 1;
      }
      else
      {
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "locationInView:", self);
        v10 = -[TUIEmojiVariantSelectorView _highlightCellAtLocation:](self, "_highlightCellAtLocation:");
      }
    }
    v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  }
  while (v9);
  if (!v10)
  {
LABEL_12:
    v13.receiver = self;
    v13.super_class = (Class)TUIEmojiVariantSelectorView;
    -[TUIEmojiVariantSelectorView touchesMoved:withEvent:](&v13, sel_touchesMoved_withEvent_, v6, v7);
  }

}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  EMFEmojiToken *v15;
  EMFEmojiToken *selectedVariant;
  void *v17;
  objc_super v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (!v8)
    goto LABEL_11;
  v9 = v8;
  v10 = 0;
  v11 = *(_QWORD *)v20;
  do
  {
    for (i = 0; i != v9; ++i)
    {
      if (*(_QWORD *)v20 != v11)
        objc_enumerationMutation(v6);
      objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "locationInView:", self);
      -[TUIEmojiVariantSelectorView _variantCellAtLocation:](self, "_variantCellAtLocation:");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v13)
      {
        objc_msgSend(v13, "emojiToken");
        v15 = (EMFEmojiToken *)objc_claimAutoreleasedReturnValue();
        selectedVariant = self->_selectedVariant;
        self->_selectedVariant = v15;

        -[TUIEmojiVariantSelectorView delegate](self, "delegate");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "variantSelectorValueChanged:", self);

        v10 = 1;
      }

    }
    v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  }
  while (v9);
  if ((v10 & 1) == 0)
  {
LABEL_11:
    v18.receiver = self;
    v18.super_class = (Class)TUIEmojiVariantSelectorView;
    -[TUIEmojiVariantSelectorView touchesEnded:withEvent:](&v18, sel_touchesEnded_withEvent_, v6, v7);
  }

}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  objc_super v8;

  v6 = a4;
  v7 = a3;
  -[TUIEmojiVariantSelectorView _unhighlightAllViews](self, "_unhighlightAllViews");
  v8.receiver = self;
  v8.super_class = (Class)TUIEmojiVariantSelectorView;
  -[TUIEmojiVariantSelectorView touchesCancelled:withEvent:](&v8, sel_touchesCancelled_withEvent_, v7, v6);

}

- (UIView)variantCellContainerView
{
  return self->_variantCellContainerView;
}

- (EMFEmojiToken)selectedVariant
{
  return self->_selectedVariant;
}

- (NSArray)allVariants
{
  return self->_allVariants;
}

- (TUIEmojiVariantSelectorViewDelegate)delegate
{
  return (TUIEmojiVariantSelectorViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIView)deepShadowView
{
  return self->_deepShadowView;
}

- (void)setDeepShadowView:(id)a3
{
  objc_storeStrong((id *)&self->_deepShadowView, a3);
}

- (UIView)keyShadowView
{
  return self->_keyShadowView;
}

- (void)setKeyShadowView:(id)a3
{
  objc_storeStrong((id *)&self->_keyShadowView, a3);
}

- (UIView)backdropView
{
  return self->_backdropView;
}

- (void)setBackdropView:(id)a3
{
  objc_storeStrong((id *)&self->_backdropView, a3);
}

- (TUIDrawingView)backgroundMaskView
{
  return self->_backgroundMaskView;
}

- (void)setBackgroundMaskView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundMaskView, a3);
}

- (TUIDrawingView)borderView
{
  return self->_borderView;
}

- (void)setBorderView:(id)a3
{
  objc_storeStrong((id *)&self->_borderView, a3);
}

- (UIView)separatorView
{
  return self->_separatorView;
}

- (void)setSeparatorView:(id)a3
{
  objc_storeStrong((id *)&self->_separatorView, a3);
}

- (CGRect)originRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_originRect.origin.x;
  y = self->_originRect.origin.y;
  width = self->_originRect.size.width;
  height = self->_originRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setOriginRect:(CGRect)a3
{
  self->_originRect = a3;
}

- (EMFEmojiToken)baseEmojiToken
{
  return self->_baseEmojiToken;
}

- (void)setBaseEmojiToken:(id)a3
{
  objc_storeStrong((id *)&self->_baseEmojiToken, a3);
}

- (NSArray)arrangedVariantCells
{
  return self->_arrangedVariantCells;
}

- (void)setArrangedVariantCells:(id)a3
{
  objc_storeStrong((id *)&self->_arrangedVariantCells, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_arrangedVariantCells, 0);
  objc_storeStrong((id *)&self->_baseEmojiToken, 0);
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_borderView, 0);
  objc_storeStrong((id *)&self->_backgroundMaskView, 0);
  objc_storeStrong((id *)&self->_backdropView, 0);
  objc_storeStrong((id *)&self->_keyShadowView, 0);
  objc_storeStrong((id *)&self->_deepShadowView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_allVariants, 0);
  objc_storeStrong((id *)&self->_selectedVariant, 0);
  objc_storeStrong((id *)&self->_variantCellContainerView, 0);
}

double __45__TUIEmojiVariantSelectorView_layoutSubviews__block_invoke(uint64_t a1, void *a2)
{
  int v3;
  double v4;
  uint64_t v5;
  double result;

  objc_msgSend(a2, "setFrame:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 56));
  v3 = *(unsigned __int8 *)(a1 + 40);
  v4 = CGRectGetWidth(*(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32)) + 6.0;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (v3)
    v4 = -v4;
  result = *(double *)(v5 + 32) + v4;
  *(double *)(v5 + 32) = result;
  return result;
}

uint64_t __80__TUIEmojiVariantSelectorView__backgroundBezierPathForContainerRect_originRect___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, double a4, double a5, double a6, double a7, double a8, double a9)
{
  objc_msgSend(*(id *)(a1 + 32), "addLineToPoint:", a4 + a6, a5 + a7);
  return objc_msgSend(*(id *)(a1 + 32), "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", a2, a3, a4, a5, a8, a9);
}

id __67__TUIEmojiVariantSelectorView_initWithFrame_emojiToken_originRect___block_invoke_2(uint64_t a1, void *a2)
{
  if (objc_msgSend(a2, "userInterfaceStyle") == 2)
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.1);
  else
    UIKeyboardGetLightCandidateSeparatorColor();
  return (id)objc_claimAutoreleasedReturnValue();
}

id __67__TUIEmojiVariantSelectorView_initWithFrame_emojiToken_originRect___block_invoke(uint64_t a1, void *a2)
{
  if (objc_msgSend(a2, "userInterfaceStyle") == 2)
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.42, 0.42, 0.42, 1.0);
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)emojiTextAttributes
{
  void *v2;
  void *v3;
  uint64_t v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = *MEMORY[0x1E0DC32A0];
  objc_msgSend(MEMORY[0x1E0DC37E8], "systemFontOfSize:", 32.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
