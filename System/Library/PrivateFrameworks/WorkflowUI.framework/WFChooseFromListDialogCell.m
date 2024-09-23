@implementation WFChooseFromListDialogCell

- (WFChooseFromListDialogCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  WFChooseFromListDialogCell *v4;
  void *v5;
  WFTLKSimpleRowView *v6;
  void *v7;
  void *v8;
  WFChooseFromListDialogCell *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)WFChooseFromListDialogCell;
  v4 = -[WFChooseFromListDialogCell initWithStyle:reuseIdentifier:](&v11, sel_initWithStyle_reuseIdentifier_, 0, a4);
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFChooseFromListDialogCell setBackgroundColor:](v4, "setBackgroundColor:", v5);

    v6 = objc_alloc_init(WFTLKSimpleRowView);
    -[WFChooseFromListDialogCell contentView](v4, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", v6);

    objc_storeWeak((id *)&v4->_rowView, v6);
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD828]), "initWithDelegate:", v4);
    -[WFChooseFromListDialogCell addInteraction:](v4, "addInteraction:", v8);
    v9 = v4;

  }
  return v4;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGSize result;

  height = a3.height;
  -[WFChooseFromListDialogCell contentView](self, "contentView", a3.width);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;

  -[WFChooseFromListDialogCell rowView](self, "rowView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sizeThatFits:", v7, height);
  v10 = v9;
  v12 = v11;

  if (v12 >= 54.0)
    v13 = v12;
  else
    v13 = 54.0;
  v14 = v10;
  result.height = v13;
  result.width = v14;
  return result;
}

- (void)layoutSubviews
{
  void *v3;
  double x;
  double y;
  double width;
  double height;
  void *v8;
  objc_super v9;
  CGRect v10;
  CGRect v11;

  v9.receiver = self;
  v9.super_class = (Class)WFChooseFromListDialogCell;
  -[WFChooseFromListDialogCell layoutSubviews](&v9, sel_layoutSubviews);
  -[WFChooseFromListDialogCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v11 = CGRectInset(v10, 8.0, 0.0);
  x = v11.origin.x;
  y = v11.origin.y;
  width = v11.size.width;
  height = v11.size.height;
  -[WFChooseFromListDialogCell rowView](self, "rowView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFrame:", x, y, width, height);

}

- (void)setListItem:(id)a3
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  Class TLKFormattedTextClass;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  WFChooseFromListDialogCell *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_storeStrong((id *)&self->_listItem, a3);
  v6 = v5;
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[WFChooseFromListDialogCell rowView](self, "rowView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "title");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "length");

      if (v9)
      {
        TLKFormattedTextClass = getTLKFormattedTextClass();
        objc_msgSend(v6, "title");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[objc_class formattedTextWithString:](TLKFormattedTextClass, "formattedTextWithString:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v12, "setIsBold:", 1);
        -[WFChooseFromListDialogCell displayConfiguration](self, "displayConfiguration");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "titleLineLimit");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
          objc_msgSend(v12, "setMaxLines:", objc_msgSend(v14, "unsignedIntegerValue"));
        getTLKRichTextClass();
        v15 = (void *)objc_opt_new();
        v21[0] = v12;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setFormattedTextItems:", v16);

        objc_msgSend(v7, "setLeadingTitle:", v15);
        -[WFChooseFromListDialogCell setPrefersSeparatorInsetForImage:](self, "setPrefersSeparatorInsetForImage:", 0);
        v17[0] = MEMORY[0x24BDAC760];
        v17[1] = 3221225472;
        v17[2] = __42__WFChooseFromListDialogCell_setListItem___block_invoke;
        v17[3] = &unk_24E603588;
        v18 = v6;
        v19 = v7;
        v20 = self;
        objc_msgSend(v18, "prepareForDisplayWithCompletionHandler:", v17);

      }
    }
  }

}

- (unint64_t)tlkCornerRoundingStyleForWFRoundingStyle:(unint64_t)a3
{
  if (a3 - 1 >= 3)
    return 0;
  else
    return a3;
}

- (void)setChecked:(BOOL)a3
{
  uint64_t v3;

  self->_checked = a3;
  if (a3)
    v3 = 3;
  else
    v3 = 0;
  -[WFChooseFromListDialogCell setAccessoryType:](self, "setAccessoryType:", v3);
}

- (void)setFillVisualStylingProvider:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  objc_storeStrong((id *)&self->_fillVisualStylingProvider, a3);
  v5 = a3;
  objc_msgSend(MEMORY[0x24BEBD428], "effectWithStyle:", 1200);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBDAF0], "effectForBlurEffect:style:", v11, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDB38]), "initWithEffect:", v6);
  objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "colorWithAlphaComponent:", 0.4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBackgroundColor:", v9);

  -[WFChooseFromListDialogCell setSelectedBackgroundView:](self, "setSelectedBackgroundView:", v7);
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDA30]), "initWithView:", self);
  objc_msgSend(MEMORY[0x24BEBD820], "effectWithPreview:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD848], "styleWithEffect:shape:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (WFChooseFromListDialogViewController)viewController
{
  return (WFChooseFromListDialogViewController *)objc_loadWeakRetained((id *)&self->_viewController);
}

- (void)setViewController:(id)a3
{
  objc_storeWeak((id *)&self->_viewController, a3);
}

- (WFDialogListItem)listItem
{
  return self->_listItem;
}

- (BOOL)isChecked
{
  return self->_checked;
}

- (MTVisualStylingProvider)fillVisualStylingProvider
{
  return self->_fillVisualStylingProvider;
}

- (NSCache)imageCache
{
  return self->_imageCache;
}

- (void)setImageCache:(id)a3
{
  objc_storeStrong((id *)&self->_imageCache, a3);
}

- (WFListDisplayConfiguration)displayConfiguration
{
  return self->_displayConfiguration;
}

- (void)setDisplayConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_displayConfiguration, a3);
}

- (BOOL)prefersSeparatorInsetForImage
{
  return self->_prefersSeparatorInsetForImage;
}

- (void)setPrefersSeparatorInsetForImage:(BOOL)a3
{
  self->_prefersSeparatorInsetForImage = a3;
}

- (TLKSimpleRowView)rowView
{
  return (TLKSimpleRowView *)objc_loadWeakRetained((id *)&self->_rowView);
}

- (void)setRowView:(id)a3
{
  objc_storeWeak((id *)&self->_rowView, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_rowView);
  objc_storeStrong((id *)&self->_displayConfiguration, 0);
  objc_storeStrong((id *)&self->_imageCache, 0);
  objc_storeStrong((id *)&self->_fillVisualStylingProvider, 0);
  objc_storeStrong((id *)&self->_listItem, 0);
  objc_destroyWeak((id *)&self->_viewController);
}

void __42__WFChooseFromListDialogCell_setListItem___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, void *, void *);
  void *v25;
  id v26;
  id v27;
  id v28;
  __int128 v29;
  id location;
  _QWORD v31[4];
  id v32;
  _QWORD v33[4];
  id v34;

  v3 = a2;
  v4 = MEMORY[0x24BDAC760];
  v33[0] = MEMORY[0x24BDAC760];
  v33[1] = 3221225472;
  v33[2] = __42__WFChooseFromListDialogCell_setListItem___block_invoke_2;
  v33[3] = &unk_24E603510;
  v5 = *(void **)(a1 + 32);
  v34 = *(id *)(a1 + 40);
  if ((objc_msgSend(v5, "loadSubtitleWithCompletion:", v33) & 1) == 0)
    objc_msgSend(*(id *)(a1 + 40), "setLeadingSubtitle:", 0);
  v31[0] = v4;
  v31[1] = 3221225472;
  v31[2] = __42__WFChooseFromListDialogCell_setListItem___block_invoke_3;
  v31[3] = &unk_24E603510;
  v6 = *(void **)(a1 + 32);
  v32 = *(id *)(a1 + 40);
  if ((objc_msgSend(v6, "loadAltTextWithCompletion:", v31) & 1) == 0)
    objc_msgSend(*(id *)(a1 + 40), "setTrailingTitle:", 0);
  objc_msgSend(*(id *)(a1 + 48), "imageCache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setLeadingImage:", v8);

  objc_msgSend(*(id *)(a1 + 40), "leadingImage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = 1;
  }
  else
  {
    objc_initWeak(&location, *(id *)(a1 + 48));
    v11 = *(void **)(a1 + 32);
    v22 = v4;
    v23 = 3221225472;
    v24 = __42__WFChooseFromListDialogCell_setListItem___block_invoke_4;
    v25 = &unk_24E603560;
    objc_copyWeak(&v28, &location);
    __asm { FMOV            V0.2D, #31.0 }
    v29 = _Q0;
    v26 = v3;
    v27 = *(id *)(a1 + 40);
    v10 = objc_msgSend(v11, "loadImageWithSize:completion:", &v22, 31.0, 31.0);
    if ((_DWORD)v10)
    {
      objc_msgSend(*(id *)(a1 + 40), "leadingImage", v22, v23, v24, v25, v26);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v17)
      {
        v18 = objc_alloc(getTLKImageClass());
        v19 = (void *)objc_opt_new();
        v20 = (void *)objc_msgSend(v18, "initWithImage:", v19);

        objc_msgSend(v20, "setSize:", 31.0, 31.0);
        objc_msgSend(*(id *)(a1 + 40), "setLeadingImage:", v20);

      }
    }

    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
  }
  objc_msgSend(*(id *)(a1 + 48), "viewController", v22, v23, v24, v25);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "updateCellSeparatorInsets");

  objc_msgSend(*(id *)(a1 + 48), "setPrefersSeparatorInsetForImage:", v10);
}

void __42__WFChooseFromListDialogCell_setListItem___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (objc_msgSend(v3, "length"))
  {
    -[objc_class formattedTextWithString:](getTLKFormattedTextClass(), "formattedTextWithString:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setMaxLines:", 2);
    getTLKRichTextClass();
    v5 = (void *)objc_opt_new();
    v7[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setFormattedTextItems:", v6);

    objc_msgSend(*(id *)(a1 + 32), "setLeadingSubtitle:", v5);
  }

}

void __42__WFChooseFromListDialogCell_setListItem___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (objc_msgSend(v3, "length"))
  {
    -[objc_class formattedTextWithString:](getTLKFormattedTextClass(), "formattedTextWithString:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setMaxLines:", 1);
    getTLKRichTextClass();
    v5 = (void *)objc_opt_new();
    v7[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setFormattedTextItems:", v6);

    objc_msgSend(*(id *)(a1 + 32), "setTrailingTitle:", v5);
  }

}

void __42__WFChooseFromListDialogCell_setListItem___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  __int128 v15;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __42__WFChooseFromListDialogCell_setListItem___block_invoke_5;
    block[3] = &unk_24E603538;
    v10 = v6;
    v8 = v5;
    v15 = *(_OWORD *)(a1 + 56);
    v11 = v8;
    v12 = WeakRetained;
    v13 = *(id *)(a1 + 32);
    v14 = *(id *)(a1 + 40);
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
}

void __42__WFChooseFromListDialogCell_setListItem___block_invoke_5(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *TLKImageClass;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", *MEMORY[0x24BEC1820]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v2;
  if (v2)
    v3 = objc_msgSend(v2, "unsignedIntegerValue");
  else
    v3 = 0;
  objc_msgSend(*(id *)(a1 + 40), "UIImage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageWithRenderingMode:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  TLKImageClass = (void *)getTLKImageClass();
  objc_msgSend(*(id *)(a1 + 40), "tintColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UIColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(TLKImageClass, "applyTintColor:toImage:", v8, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(objc_alloc((Class)getTLKImageClass()), "initWithImage:", v9);
  objc_msgSend(v10, "setSize:", *(double *)(a1 + 72), *(double *)(a1 + 80));
  objc_msgSend(v10, "setCornerRoundingStyle:", objc_msgSend(*(id *)(a1 + 48), "tlkCornerRoundingStyleForWFRoundingStyle:", v3));
  objc_msgSend(*(id *)(a1 + 48), "imageCache");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKey:", v10, *(_QWORD *)(a1 + 56));

  objc_msgSend(*(id *)(a1 + 48), "listItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = objc_msgSend(v12, "isEqual:", *(_QWORD *)(a1 + 56));

  if ((_DWORD)v8)
    objc_msgSend(*(id *)(a1 + 64), "setLeadingImage:", v10);

}

@end
