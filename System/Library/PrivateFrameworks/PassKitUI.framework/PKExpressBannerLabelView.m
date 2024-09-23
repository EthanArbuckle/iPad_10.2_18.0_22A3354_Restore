@implementation PKExpressBannerLabelView

- (PKExpressBannerLabelView)init
{

  return 0;
}

- (PKExpressBannerLabelView)initWithFrame:(CGRect)a3
{

  return 0;
}

- (PKExpressBannerLabelView)initWithCoder:(id)a3
{

  return 0;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  NSString *v6;
  NSString *v7;
  NSComparisonResult v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKExpressBannerLabelView;
  -[PKExpressBannerLabelView traitCollectionDidChange:](&v9, sel_traitCollectionDidChange_, v4);
  -[PKExpressBannerLabelView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4
    || (objc_msgSend(v4, "preferredContentSizeCategory"),
        v6 = (NSString *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "preferredContentSizeCategory"),
        v7 = (NSString *)objc_claimAutoreleasedReturnValue(),
        v8 = UIContentSizeCategoryCompareToCategory(v6, v7),
        v7,
        v6,
        v8))
  {
    -[PKExpressBannerLabelView _updateLabelAnimated:]((uint64_t)self);
  }

}

- (void)_updateLabelAnimated:(uint64_t)a1
{
  char v2;
  double v3;
  double v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  id v32;
  id WeakRetained;
  _QWORD v35[5];
  char v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _QWORD v41[4];
  id v42;
  id v43;
  id location;
  void *v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v2 = objc_msgSend((id)a1, "isHidden");
    v4 = *(double *)(a1 + 432);
    v3 = *(double *)(a1 + 440);
    v5 = *(void **)(a1 + 448);
    if (v5)
    {
      if ((v2 & 1) != 0)
      {
        objc_msgSend(v5, "removeFromSuperview");
        v6 = *(id *)(a1 + 456);
        v7 = *(void **)(a1 + 456);
        *(_QWORD *)(a1 + 456) = 0;

        v39 = 0u;
        v40 = 0u;
        v37 = 0u;
        v38 = 0u;
        v8 = v6;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
        if (v9)
        {
          v10 = *(_QWORD *)v38;
          do
          {
            for (i = 0; i != v9; ++i)
            {
              if (*(_QWORD *)v38 != v10)
                objc_enumerationMutation(v8);
              objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * i), "removeFromSuperview");
            }
            v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
          }
          while (v9);
        }
        v12 = v8;
      }
      else
      {
        if (!*(_QWORD *)(a1 + 456))
        {
          v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v14 = *(void **)(a1 + 456);
          *(_QWORD *)(a1 + 456) = v13;

          v5 = *(void **)(a1 + 448);
        }
        v15 = v5;
        objc_msgSend(*(id *)(a1 + 456), "addObject:", v15);
        objc_msgSend(v15, "layer");
        v8 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setValue:forKeyPath:", &unk_1E3FACB70, CFSTR("filters.blur.inputRadius"));
        objc_msgSend(MEMORY[0x1E0D676D0], "springAnimationWithKeyPath:", CFSTR("filters.blur.inputRadius"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "pkui_updateForAdditiveAnimationFromScalar:toScalar:", 0.0, 8.33333333);
        v17 = (id)objc_msgSend(v8, "pkui_addAdditiveAnimation:", v16);
        objc_initWeak(&location, (id)a1);
        v41[0] = MEMORY[0x1E0C809B0];
        v41[1] = 3221225472;
        v41[2] = __49__PKExpressBannerLabelView__updateLabelAnimated___block_invoke;
        v41[3] = &unk_1E3E62FA0;
        objc_copyWeak(&v43, &location);
        v12 = v15;
        v42 = v12;
        objc_msgSend(v12, "pkui_setAlpha:animated:withCompletion:", 1, v41, 0.0);

        objc_destroyWeak(&v43);
        objc_destroyWeak(&location);

      }
      v18 = *(void **)(a1 + 448);
      *(_QWORD *)(a1 + 448) = 0;

      *(_OWORD *)(a1 + 432) = *MEMORY[0x1E0C9D820];
    }
    if (*(_QWORD *)(a1 + 424))
    {
      objc_msgSend((id)a1, "traitCollection");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v19)
      {
        v20 = objc_alloc_init(MEMORY[0x1E0DC3990]);
        v21 = *(void **)(a1 + 448);
        *(_QWORD *)(a1 + 448) = v20;

        objc_msgSend(*(id *)(a1 + 448), "setNumberOfLines:", 1);
        v22 = *(void **)(a1 + 448);
        objc_msgSend(MEMORY[0x1E0DC1350], "sbui_systemAperturePreferredFontForTextStyle:compatibleWithTraitCollection:", 4, v19);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setFont:", v23);

        objc_msgSend(*(id *)(a1 + 448), "setLineBreakMode:", 4);
        objc_msgSend(*(id *)(a1 + 448), "setAdjustsFontSizeToFitWidth:", 1);
        objc_msgSend(*(id *)(a1 + 448), "setMinimumScaleFactor:", 0.8);
        objc_msgSend(*(id *)(a1 + 448), "setText:", *(_QWORD *)(a1 + 424));
        objc_msgSend(*(id *)(a1 + 448), "sizeToFit");
        v24 = *(int *)(a1 + 416);
        if (v24 >= 4)
        {
          __break(1u);
          return;
        }
        objc_msgSend(*(id *)(a1 + 448), "setAnchorPoint:", dbl_19DF18350[v24], dbl_19DF18330[v24]);
        objc_msgSend(*(id *)(a1 + 448), "layer");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_alloc(MEMORY[0x1E0CD2780]);
        v27 = (void *)objc_msgSend(v26, "initWithType:", *MEMORY[0x1E0CD2C88]);
        objc_msgSend(v27, "setName:", CFSTR("blur"));
        v45 = v27;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v45, 1);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setFilters:", v28);

        objc_msgSend((id)a1, "addSubview:", *(_QWORD *)(a1 + 448));
        objc_msgSend(*(id *)(a1 + 448), "frame");
        *(_QWORD *)(a1 + 432) = v29;
        *(_QWORD *)(a1 + 440) = v30;
        objc_msgSend((id)a1, "setNeedsLayout");
        v35[0] = MEMORY[0x1E0C809B0];
        v35[1] = 3221225472;
        v35[2] = __49__PKExpressBannerLabelView__updateLabelAnimated___block_invoke_2;
        v35[3] = &unk_1E3E64C10;
        v36 = v2 ^ 1;
        v35[4] = a1;
        objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v35);
        if ((v2 & 1) == 0)
        {
          objc_msgSend(*(id *)(a1 + 448), "pkui_setAlpha:animated:", 1, 1.0);
          objc_msgSend(MEMORY[0x1E0D676D0], "springAnimationWithKeyPath:", CFSTR("filters.blur.inputRadius"));
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "pkui_updateForAdditiveAnimationFromScalar:toScalar:", 8.33333333, 0.0);
          v32 = (id)objc_msgSend(v25, "pkui_addAdditiveAnimation:", v31);

        }
        if (v4 != *(double *)(a1 + 432) || v3 != *(double *)(a1 + 440))
        {
          WeakRetained = objc_loadWeakRetained((id *)(a1 + 464));
          objc_msgSend(WeakRetained, "expressLabelViewDidChangeSize:", a1);

        }
        goto LABEL_30;
      }
    }
    if (v4 != *(double *)(a1 + 432) || v3 != *(double *)(a1 + 440))
    {
      v19 = objc_loadWeakRetained((id *)(a1 + 464));
      objc_msgSend(v19, "expressLabelViewDidChangeSize:", a1);
LABEL_30:

    }
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat *p_height;
  double v4;
  double v5;
  CGSize result;

  if (self->_label)
  {
    p_height = &self->_size.height;
    v4 = fmin(self->_size.width, a3.width);
  }
  else
  {
    p_height = (CGFloat *)(MEMORY[0x1E0C9D820] + 8);
    v4 = *MEMORY[0x1E0C9D820];
  }
  v5 = *p_height;
  result.height = v5;
  result.width = v4;
  return result;
}

- (void)layoutSubviews
{
  UILabel *label;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  objc_super v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)PKExpressBannerLabelView;
  -[PKExpressBannerLabelView layoutSubviews](&v14, sel_layoutSubviews);
  -[PKExpressBannerLabelView bounds](self, "bounds");
  if (self && self->_alignmentEdge >= 4)
    __break(1u);
  label = self->_label;
  if (label)
  {
    PKSizeAlignedInRect();
    -[UILabel setFrame:](label, "setFrame:");
  }
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = self->_obsoleteLabels;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        objc_msgSend(v9, "frame", (_QWORD)v10);
        PKSizeAlignedInRect();
        objc_msgSend(v9, "setFrame:");
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    }
    while (v6);
  }

}

void __49__PKExpressBannerLabelView__updateLabelAnimated___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  void *v3;
  id *v4;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(*(id *)(a1 + 32), "superview");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    WeakRetained = v4;
    if (v3)
    {
      objc_msgSend(v4[57], "removeObjectIdenticalTo:", *(_QWORD *)(a1 + 32));
      objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
      WeakRetained = v4;
    }
  }

}

uint64_t __49__PKExpressBannerLabelView__updateLabelAnimated___block_invoke_2(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 40))
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "setAlpha:", 0.0);
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_obsoleteLabels, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end
