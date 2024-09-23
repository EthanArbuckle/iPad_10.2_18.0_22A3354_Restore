@implementation PUFeedInvitationCell

- (PUFeedInvitationCell)initWithFrame:(CGRect)a3
{
  PUFeedInvitationCell *v3;
  PUFeedInvitationCell *v4;
  void *v5;
  PXSharedAlbumHeaderView *v6;
  PXSharedAlbumHeaderView *headerView;
  id v8;
  uint64_t v9;
  PXSharedAlbumInvitationView *invitationView;
  UILabel *v11;
  UILabel *dateLabel;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)PUFeedInvitationCell;
  v3 = -[PUFeedInvitationCell initWithFrame:](&v15, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[PUFeedInvitationCell contentView](v3, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4->_useInPopover = 0;
    v4->_showHeader = 1;
    v4->_showFooter = 1;
    v6 = (PXSharedAlbumHeaderView *)objc_alloc_init(MEMORY[0x1E0D7B950]);
    headerView = v4->_headerView;
    v4->_headerView = v6;

    -[PXSharedAlbumHeaderView setLayoutStyle:](v4->_headerView, "setLayoutStyle:", 1);
    objc_msgSend(v5, "addSubview:", v4->_headerView);
    v8 = objc_alloc(MEMORY[0x1E0D7B958]);
    v9 = objc_msgSend(v8, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    invitationView = v4->_invitationView;
    v4->_invitationView = (PXSharedAlbumInvitationView *)v9;

    -[PXSharedAlbumInvitationView setDelegate:](v4->_invitationView, "setDelegate:", v4);
    objc_msgSend(v5, "addSubview:", v4->_invitationView);
    v11 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    dateLabel = v4->_dateLabel;
    v4->_dateLabel = v11;

    -[UILabel setTextAlignment:](v4->_dateLabel, "setTextAlignment:", 4);
    -[UILabel setNumberOfLines:](v4->_dateLabel, "setNumberOfLines:", 1);
    -[UILabel setAdjustsFontForContentSizeCategory:](v4->_dateLabel, "setAdjustsFontForContentSizeCategory:", 1);
    objc_msgSend(v5, "addSubview:", v4->_dateLabel);
    -[PUFeedInvitationCell _updateColors](v4, "_updateColors");
    -[PUFeedInvitationCell _updateHeaderView](v4, "_updateHeaderView");
    -[PUFeedInvitationCell _updateFooter](v4, "_updateFooter");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObserver:selector:name:object:", v4, sel__contentSizeCategoryDidChangeNotification_, *MEMORY[0x1E0DC48E8], 0);

  }
  return v4;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUFeedInvitationCell;
  -[PUFeedInvitationCell layoutSubviews](&v3, sel_layoutSubviews);
  -[PUFeedInvitationCell bounds](self, "bounds");
  -[PUFeedInvitationCell _performLayoutInRect:updateSubviewFrames:](self, "_performLayoutInRect:updateSubviewFrames:", 1);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[PUFeedInvitationCell _performLayoutInRect:updateSubviewFrames:](self, "_performLayoutInRect:updateSubviewFrames:", 0, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUFeedInvitationCell;
  -[PUFeedInvitationCell prepareForReuse](&v3, sel_prepareForReuse);
  -[PUFeedInvitationCell setUseInPopover:](self, "setUseInPopover:", 0);
  -[PUFeedInvitationCell setShowHeader:](self, "setShowHeader:", 1);
  -[PUFeedInvitationCell setShowFooter:](self, "setShowFooter:", 1);
}

- (void)setInvitationSectionInfo:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  objc_storeStrong((id *)&self->_invitationSectionInfo, a3);
  if (-[PXFeedInvitationSectionInfo isLoaded](self->_invitationSectionInfo, "isLoaded"))
  {
    -[PUFeedInvitationCell headerView](self, "headerView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSectionInfo:", v6);

    -[PUFeedInvitationCell _updateInvitationView](self, "_updateInvitationView");
    -[PUFeedInvitationCell _updateDate](self, "_updateDate");
  }

}

- (void)setUseInPopover:(BOOL)a3
{
  if (self->_useInPopover != a3)
  {
    self->_useInPopover = a3;
    -[PUFeedInvitationCell _updateColors](self, "_updateColors");
  }
}

- (void)setShowHeader:(BOOL)a3
{
  if (self->_showHeader != a3)
  {
    self->_showHeader = a3;
    -[PUFeedInvitationCell _updateHeaderView](self, "_updateHeaderView");
  }
}

- (void)setShowFooter:(BOOL)a3
{
  if (self->_showFooter != a3)
  {
    self->_showFooter = a3;
    -[PUFeedInvitationCell _updateFooter](self, "_updateFooter");
  }
}

- (void)tintColorDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUFeedInvitationCell;
  -[PUFeedInvitationCell tintColorDidChange](&v3, sel_tintColorDidChange);
  -[PUFeedInvitationCell _updateColors](self, "_updateColors");
}

- (void)_contentSizeCategoryDidChangeNotification:(id)a3
{
  if (-[PUFeedInvitationCell showFooter](self, "showFooter", a3))
  {
    -[PUFeedInvitationCell _updateDate](self, "_updateDate");
    -[PUFeedInvitationCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_updateColors
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = -[PUFeedInvitationCell useInPopover](self, "useInPopover");
  objc_msgSend(MEMORY[0x1E0D7B160], "invitationParentViewBackgroundColor:", v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PUFeedInvitationCell contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v8);

  -[PUFeedInvitationCell headerView](self, "headerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUseInPopover:", v3);

  -[PUFeedInvitationCell invitationView](self, "invitationView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUseInPopover:", v3);

  -[PUFeedInvitationCell dateLabel](self, "dateLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v8);

  -[PUFeedInvitationCell setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)_updateHeaderView
{
  uint64_t v3;
  void *v4;

  v3 = -[PUFeedInvitationCell showHeader](self, "showHeader") ^ 1;
  -[PUFeedInvitationCell headerView](self, "headerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", v3);

  -[PUFeedInvitationCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)_updateInvitationView
{
  void *v3;
  id v4;

  -[PUFeedInvitationCell invitationView](self, "invitationView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PUFeedInvitationCell invitationSectionInfo](self, "invitationSectionInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInvitationSectionInfo:", v3);

  objc_msgSend(v4, "setContentInsets:", 0.0, 16.0, 0.0, 16.0);
  objc_msgSend(v4, "setCornerRadius:", 0.0);
  -[PUFeedInvitationCell setNeedsLayout](self, "setNeedsLayout");

}

- (void)_updateDate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  -[PUFeedInvitationCell invitationSectionInfo](self, "invitationSectionInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && objc_msgSend(v3, "isLoaded"))
  {
    v5 = (void *)MEMORY[0x1E0D7B168];
    objc_msgSend(v4, "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "textForDate:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)MEMORY[0x1E0CB3498];
    objc_msgSend(MEMORY[0x1E0D7B160], "activityDateSubtitleTextAttributes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "px_attributedStringWithHTMLString:defaultAttributes:", v7, v9);
    v11 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }
  -[PUFeedInvitationCell dateLabel](self, "dateLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAttributedText:", v11);

  -[PUFeedInvitationCell setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)_updateFooter
{
  uint64_t v3;
  void *v4;

  v3 = -[PUFeedInvitationCell showFooter](self, "showFooter") ^ 1;
  -[PUFeedInvitationCell dateLabel](self, "dateLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", v3);

  -[PUFeedInvitationCell setNeedsLayout](self, "setNeedsLayout");
}

- (CGSize)_performLayoutInRect:(CGRect)a3 updateSubviewFrames:(BOOL)a4
{
  _BOOL4 v4;
  double height;
  double width;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  double v20;
  _BOOL4 v21;
  CGFloat MaxY;
  double v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  CGFloat v36;
  double v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  double v42;
  double v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  CGFloat v48;
  uint64_t v49;
  double v50;
  CGSize result;
  CGRect v52;

  v4 = a4;
  height = a3.size.height;
  width = a3.size.width;
  -[PUFeedInvitationCell headerView](self, "headerView", a3.origin.x, a3.origin.y);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUFeedInvitationCell invitationView](self, "invitationView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUFeedInvitationCell dateLabel](self, "dateLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = width + -32.0;
  objc_msgSend(v8, "sizeThatFits:", width + -32.0, height);
  v49 = v12;
  v14 = v13;
  v50 = width;
  objc_msgSend(v9, "sizeThatFits:", width, height);
  v16 = v15;
  v18 = v17;
  objc_msgSend(v10, "sizeThatFits:", v11, 1.79769313e308);
  v47 = v19;
  v48 = v20;
  objc_msgSend(MEMORY[0x1E0DC3F10], "userInterfaceLayoutDirectionForSemanticContentAttribute:", -[PUFeedInvitationCell semanticContentAttribute](self, "semanticContentAttribute"));
  v21 = -[PUFeedInvitationCell showHeader](self, "showHeader");
  MaxY = 0.0;
  if (v21)
  {
    v23 = 16.0;
    v24 = v49;
    v25 = v14;
    MaxY = CGRectGetMaxY(*(CGRect *)(&MaxY - 1));
  }
  v26 = 0;
  v27 = v16;
  v28 = v18;
  v29 = CGRectGetMaxY(*(CGRect *)(&MaxY - 1));
  if (-[PUFeedInvitationCell showFooter](self, "showFooter"))
  {
    objc_msgSend(MEMORY[0x1E0D7B160], "activityCaptionTitleBaselineToSubtitleBaselineDynamicDistance");
    v31 = v30;
    objc_msgSend(MEMORY[0x1E0D7B160], "activityDateSubtitleTextAttributes");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "objectForKeyedSubscript:", *MEMORY[0x1E0DC1138]);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v33, "ascender");
    v35 = v29 + v31 - v34;
    if (v11 >= v47)
      v36 = v47;
    else
      v36 = v11;
    objc_msgSend(MEMORY[0x1E0D7B160], "activityCaptionSubtitleBaselineToCellBottomDynamicDistance2");
    v38 = v37;
    v52.origin.x = 16.0;
    v52.origin.y = v35;
    v52.size.width = v36;
    v52.size.height = v48;
    v39 = v38 + CGRectGetMaxY(v52);
    objc_msgSend(v33, "descender");
    v29 = v39 + v40 + 24.0;

  }
  if (v4)
  {
    -[PUFeedInvitationCell traitCollection](self, "traitCollection");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "displayScale");
    v43 = v42;

    if (v43 <= 0.0)
    {
      objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "scale");

    }
    PXRectRoundToPixel();
    objc_msgSend(v8, "setFrame:");
    PXRectRoundToPixel();
    objc_msgSend(v9, "setFrame:");
    PXRectRoundToPixel();
    objc_msgSend(v10, "setFrame:");
  }

  v45 = v50;
  v46 = v29 + 0.0;
  result.height = v46;
  result.width = v45;
  return result;
}

- (void)sharedAlbumInvitationView:(id)a3 didAccept:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a4;
  -[PUFeedInvitationCell _delegate](self, "_delegate", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "feedInvitationCell:didAccept:", self, v4);

}

- (void)sharedAlbumInvitationViewDidReportAsJunk:(id)a3
{
  id v4;

  -[PUFeedInvitationCell _delegate](self, "_delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "feedInvitationCellReportAsJunk:", self);

}

- (void)sharedAlbumInvitationView:(id)a3 presentViewController:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[PUFeedInvitationCell _delegate](self, "_delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "feedInvitationCell:presentViewController:", self, v5);

}

- (PXFeedInvitationSectionInfo)invitationSectionInfo
{
  return self->_invitationSectionInfo;
}

- (BOOL)useInPopover
{
  return self->_useInPopover;
}

- (BOOL)showHeader
{
  return self->_showHeader;
}

- (BOOL)showFooter
{
  return self->_showFooter;
}

- (PXSharedAlbumHeaderView)headerView
{
  return self->_headerView;
}

- (void)setHeaderView:(id)a3
{
  objc_storeStrong((id *)&self->_headerView, a3);
}

- (PXSharedAlbumInvitationView)invitationView
{
  return self->_invitationView;
}

- (void)setInvitationView:(id)a3
{
  objc_storeStrong((id *)&self->_invitationView, a3);
}

- (UILabel)dateLabel
{
  return self->_dateLabel;
}

- (void)setDateLabel:(id)a3
{
  objc_storeStrong((id *)&self->_dateLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateLabel, 0);
  objc_storeStrong((id *)&self->_invitationView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_invitationSectionInfo, 0);
}

@end
