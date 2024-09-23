@implementation TLKDetailsView

- (id)setupContentView
{
  void *v3;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setButtonDelegate:", self);
  +[TLKView makeContainerShadowCompatible:](TLKView, "makeContainerShadowCompatible:", v3);
  return v3;
}

- (void)footnoteButtonPressed
{
  id v2;

  -[TLKDetailsView delegate](self, "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "footnoteButtonPressed");

}

- (BOOL)configureMenuForFootnoteButton:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  char v8;

  v4 = a3;
  -[TLKDetailsView delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[TLKDetailsView delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "configureMenuForFootnoteButton:", v4);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)useCompactMode
{
  void *v2;
  char v3;

  -[TLKView contentView](self, "contentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "useCompactMode");

  return v3;
}

- (void)setUseCompactMode:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[TLKView contentView](self, "contentView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUseCompactMode:", v3);

}

- (TLKRichText)bannerBadge
{
  void *v2;
  void *v3;

  -[TLKView contentView](self, "contentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bannerText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (TLKRichText *)v3;
}

- (void)setBannerBadge:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TLKView contentView](self, "contentView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBannerText:", v4);

}

- (TLKRichText)topText
{
  void *v2;
  void *v3;

  -[TLKView contentView](self, "contentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "topText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (TLKRichText *)v3;
}

- (void)setTopText:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TLKView contentView](self, "contentView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTopText:", v4);

}

- (TLKRichText)title
{
  void *v2;
  void *v3;

  -[TLKView contentView](self, "contentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (TLKRichText *)v3;
}

- (void)setTitle:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TLKView contentView](self, "contentView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:", v4);

}

- (BOOL)truncateTitleMiddle
{
  void *v2;
  char v3;

  -[TLKView contentView](self, "contentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "truncateTitleMiddle");

  return v3;
}

- (void)setTruncateTitleMiddle:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[TLKView contentView](self, "contentView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTruncateTitleMiddle:", v3);

}

- (TLKRichText)secondaryTitle
{
  void *v2;
  void *v3;

  -[TLKView contentView](self, "contentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "secondaryTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (TLKRichText *)v3;
}

- (void)setSecondaryTitle:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TLKView contentView](self, "contentView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSecondaryTitle:", v4);

}

- (TLKImage)secondaryTitleImage
{
  void *v2;
  void *v3;

  -[TLKView contentView](self, "contentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "secondaryTitleImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (TLKImage *)v3;
}

- (void)setSecondaryTitleImage:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TLKView contentView](self, "contentView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSecondaryTitleImage:", v4);

}

- (BOOL)secondaryTitleIsDetached
{
  void *v2;
  char v3;

  -[TLKView contentView](self, "contentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "secondaryTitleIsDetached");

  return v3;
}

- (void)setSecondaryTitleIsDetached:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[TLKView contentView](self, "contentView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSecondaryTitleIsDetached:", v3);

}

- (NSArray)details
{
  void *v2;
  void *v3;

  -[TLKView contentView](self, "contentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "detailTexts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)setDetails:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TLKView contentView](self, "contentView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDetailTexts:", v4);

}

- (TLKRichText)footnote
{
  void *v2;
  void *v3;

  -[TLKView contentView](self, "contentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "footnote");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (TLKRichText *)v3;
}

- (void)setFootnote:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TLKView contentView](self, "contentView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFootnote:", v4);

}

- (NSString)footnoteButtonText
{
  void *v2;
  void *v3;

  -[TLKView contentView](self, "contentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "footnoteButtonText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setFootnoteButtonText:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TLKView contentView](self, "contentView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFootnoteButtonText:", v4);

}

- (UIView)accessoryView
{
  void *v2;
  void *v3;

  -[TLKView contentView](self, "contentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessoryView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIView *)v3;
}

- (void)setAccessoryView:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TLKView contentView](self, "contentView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessoryView:", v4);

}

- (void)performBatchUpdates:(id)a3
{
  id v3;
  objc_super v4;
  _QWORD v5[4];
  TLKDetailsView *v6;
  id v7;

  v5[1] = 3221225472;
  v5[2] = __38__TLKDetailsView_performBatchUpdates___block_invoke;
  v5[3] = &unk_1E5C06DF0;
  v6 = self;
  v7 = a3;
  v4.receiver = v6;
  v4.super_class = (Class)TLKDetailsView;
  v5[0] = MEMORY[0x1E0C809B0];
  v3 = v7;
  -[TLKView performBatchUpdates:](&v4, sel_performBatchUpdates_, v5);

}

void __38__TLKDetailsView_performBatchUpdates___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "contentView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performBatchUpdates:", *(_QWORD *)(a1 + 40));

}

- (id)titleContainer
{
  void *v2;
  void *v3;

  -[TLKView contentView](self, "contentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "titleContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)detailsFields
{
  void *v2;
  void *v3;

  -[TLKView contentView](self, "contentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "detailsFields");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)detailsStrings
{
  void *v2;
  void *v3;

  -[TLKView contentView](self, "contentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "detailsStrings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)footnoteLabel
{
  void *v2;
  void *v3;

  -[TLKView contentView](self, "contentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "footnoteLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)footnoteLabelString
{
  void *v2;
  void *v3;

  -[TLKView contentView](self, "contentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "footnoteLabelString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)footnoteButton
{
  void *v2;
  void *v3;

  -[TLKView contentView](self, "contentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "footnoteButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)footnoteContainer
{
  void *v2;
  void *v3;

  -[TLKView contentView](self, "contentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "footnoteContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)layoutMarginsDidChange
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;

  -[TLKDetailsView layoutMargins](self, "layoutMargins");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[TLKView contentView](self, "contentView");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setLayoutMargins:", v4, v6, v8, v10);

}

- (id)viewForFirstBaselineLayout
{
  void *v2;
  void *v3;

  -[TLKView contentView](self, "contentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewForFirstBaselineLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)viewForLastBaselineLayout
{
  void *v2;
  void *v3;

  -[TLKView contentView](self, "contentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewForLastBaselineLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isAccessoryViewBottomAligned
{
  void *v2;
  char v3;

  -[TLKView contentView](self, "contentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isAccessoryViewBottomAligned");

  return v3;
}

- (void)setIsAccessoryViewBottomAligned:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[TLKView contentView](self, "contentView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIsAccessoryViewBottomAligned:", v3);

}

- (TLKDetailsViewDelegate)delegate
{
  return (TLKDetailsViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
