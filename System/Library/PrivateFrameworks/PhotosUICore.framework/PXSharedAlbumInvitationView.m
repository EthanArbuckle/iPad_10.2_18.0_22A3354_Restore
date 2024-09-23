@implementation PXSharedAlbumInvitationView

- (PXSharedAlbumInvitationView)initWithFrame:(CGRect)a3
{
  PXSharedAlbumInvitationView *v3;
  PXRoundedCornerOverlayView *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  PXRoundedCornerOverlayView *roundedCornerOverlayView;
  UIImageView *v11;
  UIImageView *avatarView;
  uint64_t v13;
  UILabel *infoLabel;
  void *v15;
  uint64_t v16;
  UILabel *albumTitleLabel;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  UIButton *acceptButton;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  UIButton *declineButton;
  uint64_t v29;
  UILabel *subscriberInfoLabel;
  void *v31;
  uint64_t v32;
  UILabel *reportJunkLabel;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  objc_super v39;

  v39.receiver = self;
  v39.super_class = (Class)PXSharedAlbumInvitationView;
  v3 = -[PXSharedAlbumInvitationView initWithFrame:](&v39, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [PXRoundedCornerOverlayView alloc];
    v5 = *MEMORY[0x1E0C9D648];
    v6 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v9 = -[PXRoundedCornerOverlayView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], v6, v7, v8);
    roundedCornerOverlayView = v3->_roundedCornerOverlayView;
    v3->_roundedCornerOverlayView = (PXRoundedCornerOverlayView *)v9;

    -[PXSharedAlbumInvitationView addSubview:](v3, "addSubview:", v3->_roundedCornerOverlayView);
    v3->_avatarImageTag = 0;
    v11 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    avatarView = v3->_avatarView;
    v3->_avatarView = v11;

    -[UIImageView setAccessibilityIgnoresInvertColors:](v3->_avatarView, "setAccessibilityIgnoresInvertColors:", 1);
    -[PXSharedAlbumInvitationView addSubview:](v3, "addSubview:", v3->_avatarView);
    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v5, v6, v7, v8);
    infoLabel = v3->_infoLabel;
    v3->_infoLabel = (UILabel *)v13;

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v3->_infoLabel, "setBackgroundColor:", v15);

    -[UILabel setNumberOfLines:](v3->_infoLabel, "setNumberOfLines:", 0);
    -[UILabel setTextAlignment:](v3->_infoLabel, "setTextAlignment:", 1);
    -[PXSharedAlbumInvitationView addSubview:](v3, "addSubview:", v3->_infoLabel);
    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v5, v6, v7, v8);
    albumTitleLabel = v3->_albumTitleLabel;
    v3->_albumTitleLabel = (UILabel *)v16;

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v3->_albumTitleLabel, "setBackgroundColor:", v18);

    -[UILabel setNumberOfLines:](v3->_albumTitleLabel, "setNumberOfLines:", 3);
    -[UILabel setTextAlignment:](v3->_albumTitleLabel, "setTextAlignment:", 1);
    -[PXSharedAlbumInvitationView addSubview:](v3, "addSubview:", v3->_albumTitleLabel);
    PXLocalizedStringFromTable(CFSTR("PXForYouInvitationAcceptButton"), CFSTR("PhotosUICore"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSharedAlbumInvitationView tintColor](v3, "tintColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSharedAlbumInvitationView _actionButtonWithTitle:action:buttonColor:titleColor:](v3, "_actionButtonWithTitle:action:buttonColor:titleColor:", v19, sel__acceptButtonTapped_, v20, v21);
    v22 = objc_claimAutoreleasedReturnValue();
    acceptButton = v3->_acceptButton;
    v3->_acceptButton = (UIButton *)v22;

    -[PXSharedAlbumInvitationView addSubview:](v3, "addSubview:", v3->_acceptButton);
    PXLocalizedStringFromTable(CFSTR("PXForYouInvitationDeclineButton"), CFSTR("PhotosUICore"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "tertiarySystemBackgroundColor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSharedAlbumInvitationView _actionButtonWithTitle:action:buttonColor:titleColor:](v3, "_actionButtonWithTitle:action:buttonColor:titleColor:", v24, sel__declineButtonTapped_, v25, v26);
    v27 = objc_claimAutoreleasedReturnValue();
    declineButton = v3->_declineButton;
    v3->_declineButton = (UIButton *)v27;

    -[PXSharedAlbumInvitationView addSubview:](v3, "addSubview:", v3->_declineButton);
    v29 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v5, v6, v7, v8);
    subscriberInfoLabel = v3->_subscriberInfoLabel;
    v3->_subscriberInfoLabel = (UILabel *)v29;

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v3->_subscriberInfoLabel, "setBackgroundColor:", v31);

    -[UILabel setNumberOfLines:](v3->_subscriberInfoLabel, "setNumberOfLines:", 2);
    -[UILabel setTextAlignment:](v3->_subscriberInfoLabel, "setTextAlignment:", 1);
    -[PXSharedAlbumInvitationView addSubview:](v3, "addSubview:", v3->_subscriberInfoLabel);
    v32 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v5, v6, v7, v8);
    reportJunkLabel = v3->_reportJunkLabel;
    v3->_reportJunkLabel = (UILabel *)v32;

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v3->_reportJunkLabel, "setBackgroundColor:", v34);

    -[UILabel setNumberOfLines:](v3->_reportJunkLabel, "setNumberOfLines:", 2);
    -[UILabel setLineBreakMode:](v3->_reportJunkLabel, "setLineBreakMode:", 5);
    -[UILabel setTextAlignment:](v3->_reportJunkLabel, "setTextAlignment:", 1);
    -[UILabel setUserInteractionEnabled:](v3->_reportJunkLabel, "setUserInteractionEnabled:", 1);
    v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", v3, sel__reportJunkLabelTapped_);
    -[UILabel addGestureRecognizer:](v3->_reportJunkLabel, "addGestureRecognizer:", v35);
    -[PXSharedAlbumInvitationView addSubview:](v3, "addSubview:", v3->_reportJunkLabel);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "addObserver:selector:name:object:", v3, sel__contentSizeCategoryDidChangeNotification_, *MEMORY[0x1E0DC48E8], 0);

    +[PXForYouSettings sharedInstance](PXForYouSettings, "sharedInstance");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "addDeferredKeyObserver:", v3);

    -[PXSharedAlbumInvitationView _updateColors](v3, "_updateColors");
  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC48E8], 0);

  +[PXForYouSettings sharedInstance](PXForYouSettings, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeKeyObserver:", self);

  v5.receiver = self;
  v5.super_class = (Class)PXSharedAlbumInvitationView;
  -[PXSharedAlbumInvitationView dealloc](&v5, sel_dealloc);
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXSharedAlbumInvitationView;
  -[PXSharedAlbumInvitationView layoutSubviews](&v3, sel_layoutSubviews);
  -[PXSharedAlbumInvitationView bounds](self, "bounds");
  -[PXSharedAlbumInvitationView _performLayoutInRect:updateSubviewFrames:](self, "_performLayoutInRect:updateSubviewFrames:", 1);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[PXSharedAlbumInvitationView _performLayoutInRect:updateSubviewFrames:](self, "_performLayoutInRect:updateSubviewFrames:", 0, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)setInvitationSectionInfo:(id)a3
{
  PXFeedInvitationSectionInfo *invitationSectionInfo;
  void *v6;
  id v7;

  v7 = a3;
  objc_storeStrong((id *)&self->_invitationSectionInfo, a3);
  invitationSectionInfo = self->_invitationSectionInfo;
  if (!invitationSectionInfo || -[PXFeedSectionInfo isLoaded](invitationSectionInfo, "isLoaded"))
  {
    objc_msgSend(v7, "sharedAlbum");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSharedAlbumInvitationView setSharedAlbum:](self, "setSharedAlbum:", v6);

    -[PXSharedAlbumInvitationView _updateUI](self, "_updateUI");
  }

}

- (void)setContentInsets:(UIEdgeInsets)a3
{
  if (self->_contentInsets.left != a3.left
    || self->_contentInsets.top != a3.top
    || self->_contentInsets.right != a3.right
    || self->_contentInsets.bottom != a3.bottom)
  {
    self->_contentInsets = a3;
    -[PXSharedAlbumInvitationView _updateUI](self, "_updateUI");
  }
}

- (void)setCornerRadius:(double)a3
{
  if (self->_cornerRadius != a3)
  {
    self->_cornerRadius = a3;
    -[PXSharedAlbumInvitationView _updateUI](self, "_updateUI");
  }
}

- (void)setUseInPopover:(BOOL)a3
{
  if (self->_useInPopover != a3)
  {
    self->_useInPopover = a3;
    -[PXSharedAlbumInvitationView _updateUI](self, "_updateUI");
  }
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  id v6;
  id v7;
  int v8;
  id v9;

  v9 = a3;
  v6 = a4;
  +[PXForYouSettings sharedInstance](PXForYouSettings, "sharedInstance");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7 == v9)
  {
    v8 = objc_msgSend(&unk_1E53EAAB8, "containsObject:", v6);

    if (v8)
    {
      -[PXSharedAlbumInvitationView _updateReportJunkLabel](self, "_updateReportJunkLabel");
      -[PXSharedAlbumInvitationView setNeedsLayout](self, "setNeedsLayout");
    }
  }
  else
  {

  }
}

- (void)_updateUI
{
  -[PXSharedAlbumInvitationView _updateColors](self, "_updateColors");
  -[PXSharedAlbumInvitationView _updateRoundedCornerOverlayView](self, "_updateRoundedCornerOverlayView");
  -[PXSharedAlbumInvitationView setAvatarImageTag:](self, "setAvatarImageTag:", -[PXSharedAlbumInvitationView avatarImageTag](self, "avatarImageTag") + 1);
  -[PXSharedAlbumInvitationView _updateAvatarImage:](self, "_updateAvatarImage:", -[PXSharedAlbumInvitationView avatarImageTag](self, "avatarImageTag"));
  -[PXSharedAlbumInvitationView _updateInfoLabel](self, "_updateInfoLabel");
  -[PXSharedAlbumInvitationView _updateAlbumTitleLabel](self, "_updateAlbumTitleLabel");
  -[PXSharedAlbumInvitationView _updateSubscriberInfoLabel](self, "_updateSubscriberInfoLabel");
  -[PXSharedAlbumInvitationView _updateReportJunkLabel](self, "_updateReportJunkLabel");
  -[PXSharedAlbumInvitationView _enableUserInteractions:](self, "_enableUserInteractions:", 1);
  -[PXSharedAlbumInvitationView setNeedsLayout](self, "setNeedsLayout");
}

- (CGSize)_performLayoutInRect:(CGRect)a3 updateSubviewFrames:(BOOL)a4
{
  _BOOL4 v4;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void (**v23)(_QWORD, double);
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  double v41;
  double v42;
  void *v43;
  double v44;
  double v45;
  void *v46;
  double v47;
  void *v48;
  void *v49;
  CGFloat MaxY;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  void *v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  void *v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  void *v75;
  void *v76;
  void *v77;
  double v78;
  CGFloat rect;
  double v80;
  double v81;
  double v82;
  double v83;
  _QWORD aBlock[5];
  uint64_t v85;
  double *v86;
  uint64_t v87;
  uint64_t v88;
  CGSize result;
  CGRect v90;
  CGRect v91;
  CGRect v92;
  CGRect v93;
  CGRect v94;
  CGRect v95;

  v4 = a4;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[PXSharedAlbumInvitationView traitCollection](self, "traitCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "displayScale");
  v12 = v11;

  if (v12 <= 0.0)
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "scale");

  }
  v90.origin.x = x;
  v90.origin.y = y;
  v90.size.width = width;
  v90.size.height = height;
  v14 = CGRectGetWidth(v90);
  +[PXForYouSettings sharedInstance](PXForYouSettings, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = v14;
  if ((objc_msgSend(v15, "useSquareSharedAlbumActivity") & 1) == 0)
  {
    PXFloatRoundToPixel();
    v83 = v16;
  }

  -[PXSharedAlbumInvitationView infoLabel](self, "infoLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSharedAlbumInvitationView albumTitleLabel](self, "albumTitleLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSharedAlbumInvitationView acceptButton](self, "acceptButton");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSharedAlbumInvitationView declineButton](self, "declineButton");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSharedAlbumInvitationView subscriberInfoLabel](self, "subscriberInfoLabel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSharedAlbumInvitationView reportJunkLabel](self, "reportJunkLabel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v85 = 0;
  v86 = (double *)&v85;
  v87 = 0x2020000000;
  v88 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __72__PXSharedAlbumInvitationView__performLayoutInRect_updateSubviewFrames___block_invoke;
  aBlock[3] = &unk_1E5143A58;
  aBlock[4] = &v85;
  v23 = (void (**)(_QWORD, double))_Block_copy(aBlock);
  objc_msgSend(v17, "sizeThatFits:", v14 + -32.0, 1.79769313e308);
  objc_msgSend(v18, "sizeThatFits:", v14 + -32.0, 1.79769313e308);
  objc_msgSend(v21, "sizeThatFits:", v14 + -32.0, 1.79769313e308);
  v78 = v24;
  objc_msgSend(v22, "sizeThatFits:", v14 + -32.0, 1.79769313e308);
  v80 = v25;
  objc_msgSend(v19, "sizeThatFits:", 0.0, 1.79769313e308);
  v27 = v26;
  v29 = v28;
  v77 = v20;
  objc_msgSend(v20, "sizeThatFits:", 0.0, 1.79769313e308);
  if (v27 >= v30)
    v32 = v27;
  else
    v32 = v30;
  if (v29 >= v31)
    v33 = v29;
  else
    v33 = v31;
  v81 = v33;
  v82 = v32;
  rect = v86[3];
  objc_msgSend(v17, "font");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "lineHeight");
  objc_msgSend(v18, "font");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = v19;
  objc_msgSend(v75, "lineHeight");
  +[PXActivitySpec invitationAvatarToTextBaselineDynamicDistance](PXActivitySpec, "invitationAvatarToTextBaselineDynamicDistance");
  +[PXActivitySpec invitationTextToAlbumTitleBaselineDynamicDistance](PXActivitySpec, "invitationTextToAlbumTitleBaselineDynamicDistance");
  +[PXActivitySpec invitationAlbumTitleBottomDynamicDistance](PXActivitySpec, "invitationAlbumTitleBottomDynamicDistance");
  +[PXActivitySpec invitationSubscriberInfoToButtonsDynamicDistance](PXActivitySpec, "invitationSubscriberInfoToButtonsDynamicDistance");
  v36 = v35;
  +[PXActivitySpec invitationButtonToJunkBaselineDynamicDistance](PXActivitySpec, "invitationButtonToJunkBaselineDynamicDistance");
  v73 = v37;
  +[PXActivitySpec invitationJunkBottomDynamicDistance](PXActivitySpec, "invitationJunkBottomDynamicDistance");
  v39 = v38;
  objc_msgSend(v22, "font");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "descender");
  v42 = v41;

  objc_msgSend(v22, "font");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "ascender");
  v45 = v44;

  objc_msgSend(v21, "font");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "ascender");
  v72 = v47;

  objc_msgSend(v17, "font");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "ascender");

  objc_msgSend(MEMORY[0x1E0DC1350], "px_preferredFontForTextStyle:withSymbolicTraits:options:", *MEMORY[0x1E0DC4B58], 0, 1);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "descender");
  objc_msgSend(v49, "ascender");
  v91.size.height = v83;
  v91.origin.x = 0.0;
  v91.origin.y = rect;
  v91.size.width = v14;
  MaxY = CGRectGetMaxY(v91);
  v23[2](v23, MaxY);
  if (v4)
  {
    v74 = v83 + -11.0 - (v39 + v80 + v42) + v45 - v36 - v78 + v72 - v73 - v81;
    if (-[PXSharedAlbumInvitationView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection") == 1)
    {
      -[PXSharedAlbumInvitationView bounds](self, "bounds");
      CGRectGetMaxX(v92);
      v93.origin.x = (v14 - (v82 * 2.0 + 16.0)) * 0.5;
      v93.origin.y = v74;
      v93.size.height = v81;
      v93.size.width = v82;
      CGRectGetWidth(v93);
      v94.origin.x = v82 + (v14 - (v82 * 2.0 + 16.0)) * 0.5 + 16.0;
      v94.origin.y = v74;
      v94.size.height = v81;
      v94.size.width = v82;
      CGRectGetWidth(v94);
      v95.origin.x = 16.0;
      v95.origin.y = v83 + -11.0 - (v39 + v80 + v42);
      v95.size.width = v14 + -32.0;
      v95.size.height = v80;
      CGRectGetWidth(v95);
    }
    PXRectRoundToPixel();
    v52 = v51;
    v54 = v53;
    v56 = v55;
    v58 = v57;
    -[PXSharedAlbumInvitationView roundedCornerOverlayView](self, "roundedCornerOverlayView");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "setFrame:", v52, v54, v56, v58);

    PXRectRoundToPixel();
    v61 = v60;
    v63 = v62;
    v65 = v64;
    v67 = v66;
    -[PXSharedAlbumInvitationView avatarView](self, "avatarView");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "setFrame:", v61, v63, v65, v67);

    PXRectRoundToPixel();
    objc_msgSend(v17, "setFrame:");
    PXRectRoundToPixel();
    objc_msgSend(v18, "setFrame:");
    PXRectRoundToPixel();
    objc_msgSend(v76, "setFrame:");
    PXRectRoundToPixel();
    objc_msgSend(v77, "setFrame:");
    PXRectRoundToPixel();
    objc_msgSend(v21, "setFrame:");
    PXRectRoundToPixel();
    objc_msgSend(v22, "setFrame:");
  }
  v69 = v86[3];

  _Block_object_dispose(&v85, 8);
  v70 = v14;
  v71 = v69;
  result.height = v71;
  result.width = v70;
  return result;
}

- (id)_parentViewBackgroundColor
{
  return +[PXActivitySpec invitationParentViewBackgroundColor:](PXActivitySpec, "invitationParentViewBackgroundColor:", -[PXSharedAlbumInvitationView useInPopover](self, "useInPopover"));
}

- (id)_roundedCornerViewBackgroundColor
{
  if (-[PXSharedAlbumInvitationView useInPopover](self, "useInPopover"))
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_updateColors
{
  id v3;

  -[PXSharedAlbumInvitationView _parentViewBackgroundColor](self, "_parentViewBackgroundColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PXSharedAlbumInvitationView setBackgroundColor:](self, "setBackgroundColor:", v3);

}

- (void)_updateRoundedCornerOverlayView
{
  void *v3;
  _QWORD v4[5];

  -[PXSharedAlbumInvitationView roundedCornerOverlayView](self, "roundedCornerOverlayView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __62__PXSharedAlbumInvitationView__updateRoundedCornerOverlayView__block_invoke;
  v4[3] = &unk_1E51406D0;
  v4[4] = self;
  objc_msgSend(v3, "performChanges:", v4);

}

- (void)_updateAvatarImage:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  _BOOL8 v12;
  _QWORD v13[4];
  id v14[2];
  id location;

  -[PXSharedAlbumInvitationView sharedAlbum](self, "sharedAlbum");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "cloudOwnerEmail");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cloudOwnerFirstName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cloudOwnerLastName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    -[PXSharedAlbumInvitationView px_screenScale](self, "px_screenScale");
    v11 = v10;
    v12 = -[PXSharedAlbumInvitationView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection") == 1;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __50__PXSharedAlbumInvitationView__updateAvatarImage___block_invoke;
    v13[3] = &unk_1E5147548;
    objc_copyWeak(v14, &location);
    v14[1] = (id)a3;
    +[PXActivityUtilities requestPersonImageWithTargetSize:displayScale:isRTL:matchingEmail:orPhone:withFirstName:lastName:prefersPhotosImage:withCompletion:](PXActivityUtilities, "requestPersonImageWithTargetSize:displayScale:isRTL:matchingEmail:orPhone:withFirstName:lastName:prefersPhotosImage:withCompletion:", v12, v7, 0, v8, v9, 1, 44.0, 44.0, v11, v13);
    objc_destroyWeak(v14);
    objc_destroyWeak(&location);

  }
  else
  {
    -[PXSharedAlbumInvitationView avatarView](self, "avatarView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setImage:", 0);
  }

}

- (void)_handlePersonImage:(id)a3 imageTag:(unint64_t)a4
{
  void *v6;
  id v7;

  v7 = a3;
  if (-[PXSharedAlbumInvitationView avatarImageTag](self, "avatarImageTag") == a4)
  {
    -[PXSharedAlbumInvitationView avatarView](self, "avatarView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setImage:", v7);

  }
}

- (void)_updateInfoLabel
{
  void *v3;
  void *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  -[PXSharedAlbumInvitationView sharedAlbum](self, "sharedAlbum");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cloudOwnerDisplayNameIncludingEmail:allowsEmail:", 0, 1);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    PXLocalizedStringFromTable(CFSTR("PXForYouInvitationInfo"), CFSTR("PhotosUICore"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v11;
    PXLocalizedStringWithValidatedFormat(v4, CFSTR("%@"));
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = &stru_1E5149688;
  }
  v6 = (void *)MEMORY[0x1E0CB3498];
  +[PXActivitySpec invitationInfoTextAttributes](PXActivitySpec, "invitationInfoTextAttributes", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "px_attributedStringWithHTMLString:defaultAttributes:", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSharedAlbumInvitationView infoLabel](self, "infoLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAttributedText:", v8);

}

- (void)_updateAlbumTitleLabel
{
  void *v3;
  uint64_t v4;
  void *v5;
  __CFString *v6;
  __CFString *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  -[PXSharedAlbumInvitationView sharedAlbum](self, "sharedAlbum");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedTitle");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = &stru_1E5149688;
  if (v4)
    v6 = (__CFString *)v4;
  v7 = v6;

  v8 = objc_alloc(MEMORY[0x1E0CB3498]);
  +[PXActivitySpec invitationAlbumTitleTextAttributes](PXActivitySpec, "invitationAlbumTitleTextAttributes");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "initWithString:attributes:", v7, v11);

  -[PXSharedAlbumInvitationView albumTitleLabel](self, "albumTitleLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAttributedText:", v9);

}

- (void)_updateSubscriberInfoLabel
{
  uint64_t v3;
  void *v4;
  __CFString *v5;
  __CFString *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  objc_msgSend(MEMORY[0x1E0D719E0], "sharingDisplayNameIncludingEmail:allowsEmail:", 1, 1);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  v5 = &stru_1E5149688;
  if (v3)
    v5 = (__CFString *)v3;
  v6 = v5;

  PXLocalizedStringFromTable(CFSTR("PXForYouInvitationSubscriberInfo"), CFSTR("PhotosUICore"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  PXStringWithValidatedFormat();
  v12 = (id)objc_claimAutoreleasedReturnValue();

  v8 = objc_alloc(MEMORY[0x1E0CB3498]);
  +[PXActivitySpec invitationSubscriberInfoTextAttributes](PXActivitySpec, "invitationSubscriberInfoTextAttributes", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithString:attributes:", v12, v9);
  -[PXSharedAlbumInvitationView subscriberInfoLabel](self, "subscriberInfoLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAttributedText:", v10);

}

- (void)_updateReportJunkLabel
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  NSString *v18;
  _BOOL4 IsAccessibilityCategory;
  uint64_t v20;
  void *v21;
  id v22;

  -[PXSharedAlbumInvitationView sharedAlbum](self, "sharedAlbum");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  -[PXSharedAlbumInvitationView reportJunkLabel](self, "reportJunkLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v22, "cloudOwnerIsWhitelisted")
    && (+[PXForYouSettings sharedInstance](PXForYouSettings, "sharedInstance"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "forceDisplayReportJunk"),
        v4,
        !v5))
  {
    v16 = objc_alloc(MEMORY[0x1E0CB3498]);
    +[PXActivitySpec invitationReportJunkTextAttributes](PXActivitySpec, "invitationReportJunkTextAttributes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v16, "initWithString:attributes:", CFSTR(" "), v7);
  }
  else
  {
    PXLocalizedStringFromTable(CFSTR("PXForYouInvitationReportJunkFormat"), CFSTR("PhotosUICore"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "cloudOwnerEmail");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    PXLocalizedStringWithValidatedFormat(v6, CFSTR("%@"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    PXLocalizedStringFromTable(CFSTR("PXForYouInvitationReportJunk"), CFSTR("PhotosUICore"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "rangeOfString:", v8, v21);
    v11 = v10;

    v12 = objc_alloc(MEMORY[0x1E0CB3778]);
    +[PXActivitySpec invitationReportJunkTextAttributes](PXActivitySpec, "invitationReportJunkTextAttributes");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v12, "initWithString:attributes:", v7, v13);

    +[PXActivitySpec invitationReportJunkLinkAttributes](PXActivitySpec, "invitationReportJunkLinkAttributes");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setAttributes:range:", v15, v9, v11);

  }
  objc_msgSend(v3, "setAttributedText:", v14);

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "preferredContentSizeCategory");
  v18 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v18);

  if (IsAccessibilityCategory)
    v20 = 4;
  else
    v20 = 3;
  objc_msgSend(v3, "setNumberOfLines:", v20);

}

- (id)_actionButtonWithTitle:(id)a3 action:(SEL)a4 buttonColor:(id)a5 titleColor:(id)a6
{
  id v10;
  id v11;
  id v12;
  PXCapsuleButton *v13;
  void *v14;

  v10 = a6;
  v11 = a5;
  v12 = a3;
  if (_os_feature_enabled_impl())
  {
    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 1);
    v13 = (PXCapsuleButton *)objc_claimAutoreleasedReturnValue();
    -[PXCapsuleButton addTarget:action:forControlEvents:](v13, "addTarget:action:forControlEvents:", self, a4, 0x2000);
    objc_msgSend(MEMORY[0x1E0DC3520], "filledButtonConfiguration");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setButtonSize:", 2);
    objc_msgSend(v14, "setCornerStyle:", 4);
    objc_msgSend(v14, "setTitle:", v12);

    objc_msgSend(v14, "setTitleTextAttributesTransformer:", &__block_literal_global_184_257288);
    objc_msgSend(v14, "setBaseBackgroundColor:", v11);

    objc_msgSend(v14, "setBaseForegroundColor:", v10);
    -[PXCapsuleButton setConfiguration:](v13, "setConfiguration:", v14);

  }
  else
  {
    v13 = -[PXCapsuleButton initWithColor:]([PXCapsuleButton alloc], "initWithColor:", v11);

    -[PXCapsuleButton setMaxContentSizeCategory:](v13, "setMaxContentSizeCategory:", *MEMORY[0x1E0DC48D0]);
    -[PXCapsuleButton setTitle:forState:](v13, "setTitle:forState:", v12, 0);

    -[PXCapsuleButton setTitleColor:forState:](v13, "setTitleColor:forState:", v10, 0);
    -[PXCapsuleButton addTarget:action:forControlEvents:](v13, "addTarget:action:forControlEvents:", self, a4, 64);
  }
  return v13;
}

- (void)_showOutOfNetworkInvitationMessageForSharedAlbum:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "cloudOwnerDisplayNameIncludingEmail:allowsEmail:", 1, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedTitle");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  PXLocalizedStringFromTable(CFSTR("PXForYouInvitationConfirmOutOfNetworkInvitationMessage"), CFSTR("PhotosUICore"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  PXLocalizedStringWithValidatedFormat(v7, CFSTR("%@ %@"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  PXLocalizedStringFromTable(CFSTR("PXForYouInvitationSettings"), CFSTR("PhotosUICore"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  PXLocalizedStringFromTable(CFSTR("PXCancel"), CFSTR("PhotosUICore"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v8, 0, 0, v23, v22);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0DC3448];
  v13 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __98__PXSharedAlbumInvitationView__showOutOfNetworkInvitationMessageForSharedAlbum_completionHandler___block_invoke;
  v26[3] = &unk_1E5142658;
  v14 = v5;
  v27 = v14;
  objc_msgSend(v12, "actionWithTitle:style:handler:", v10, 1, v26);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addAction:", v15);

  v16 = (void *)MEMORY[0x1E0DC3448];
  v24[0] = v13;
  v24[1] = 3221225472;
  v24[2] = __98__PXSharedAlbumInvitationView__showOutOfNetworkInvitationMessageForSharedAlbum_completionHandler___block_invoke_2;
  v24[3] = &unk_1E5142658;
  v25 = v14;
  v17 = v14;
  objc_msgSend(v16, "actionWithTitle:style:handler:", v9, 0, v24);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addAction:", v18);

  -[PXSharedAlbumInvitationView window](self, "window");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "rootViewController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "presentViewController:animated:completion:", v11, 1, 0);

}

- (void)_enableUserInteractions:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  -[PXSharedAlbumInvitationView acceptButton](self, "acceptButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUserInteractionEnabled:", v3);

  -[PXSharedAlbumInvitationView declineButton](self, "declineButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUserInteractionEnabled:", v3);

  -[PXSharedAlbumInvitationView reportJunkLabel](self, "reportJunkLabel");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setUserInteractionEnabled:", v3);

}

- (void)_acceptButtonTapped:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[5];
  id v26;
  id v27;

  -[PXSharedAlbumInvitationView sharedAlbum](self, "sharedAlbum", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0D719E0];
  objc_msgSend(v4, "photoLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pathManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "libraryURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = objc_msgSend(v5, "sharedStreamsEnabledForPhotoLibraryURL:", v8);

  if ((_DWORD)v5)
  {
    v27 = 0;
    v9 = objc_msgSend(MEMORY[0x1E0D719E0], "canAcceptPendingInvitationForAlbum:error:", v4, &v27);
    v10 = v27;
    v11 = v10;
    if (v9)
    {
      if (_os_feature_enabled_impl())
      {
        -[UIButton configuration](self->_acceptButton, "configuration");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)objc_msgSend(v12, "copy");

        -[UIButton configuration](self->_acceptButton, "configuration");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (void *)objc_msgSend(v14, "copy");

        objc_msgSend(v15, "setShowsActivityIndicator:", 1);
        objc_msgSend(v15, "setTitle:", 0);
        -[UIButton setConfiguration:](self->_acceptButton, "setConfiguration:", v15);

      }
      else
      {
        v13 = 0;
      }
      v24 = (void *)MEMORY[0x1E0D719E0];
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __51__PXSharedAlbumInvitationView__acceptButtonTapped___block_invoke;
      v25[3] = &unk_1E5140738;
      v25[4] = self;
      v26 = v13;
      v16 = v13;
      objc_msgSend(v24, "acceptPendingInvitationForAlbum:completionHandler:", v4, v25);

    }
    else
    {
      objc_msgSend(v10, "localizedDescription");
      v16 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "localizedFailureReason");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v16, v17, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)MEMORY[0x1E0DC3448];
      PXLocalizedStringFromTable(CFSTR("PXOK"), CFSTR("PhotosUICore"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "actionWithTitle:style:handler:", v20, 1, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "addAction:", v21);

      -[PXSharedAlbumInvitationView window](self, "window");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "rootViewController");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "presentViewController:animated:completion:", v18, 1, 0);

    }
  }
  else
  {
    -[PXSharedAlbumInvitationView _showOutOfNetworkInvitationMessageForSharedAlbum:completionHandler:](self, "_showOutOfNetworkInvitationMessageForSharedAlbum:completionHandler:", v4, 0);
  }

}

- (void)_declineButtonTapped:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[PXSharedAlbumInvitationView sharedAlbum](self, "sharedAlbum", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0D719E0];
  objc_msgSend(v4, "photoLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pathManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "libraryURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = objc_msgSend(v5, "sharedStreamsEnabledForPhotoLibraryURL:", v8);

  if ((_DWORD)v5)
  {
    objc_msgSend(MEMORY[0x1E0D719E0], "declinePendingInvitationForAlbum:", v4);
    -[PXSharedAlbumInvitationView _enableUserInteractions:](self, "_enableUserInteractions:", 0);
    -[PXSharedAlbumInvitationView delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v9, "sharedAlbumInvitationView:didAccept:", self, 0);

  }
  else
  {
    v10 = (void *)MEMORY[0x1E0C99D20];
    objc_msgSend(v4, "cloudGUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "arrayWithObject:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    PLPhotoSharingGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138412290;
      v15 = v12;
      _os_log_impl(&dword_1A6789000, v13, OS_LOG_TYPE_DEFAULT, "will call -[PLCloudSharedDeleteAlbumsJob deleteLocalAlbumsForMSASAlbumGUIDs:albumGUIDs:] with arguments %@", (uint8_t *)&v14, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0D719E0], "deleteLocalAlbumsForMSASAlbumsWithGUIDs:", v12);
  }

}

- (void)_reportJunk
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  v3 = (void *)MEMORY[0x1E0D719E0];
  -[PXSharedAlbumInvitationView sharedAlbum](self, "sharedAlbum");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __42__PXSharedAlbumInvitationView__reportJunk__block_invoke;
  v5[3] = &unk_1E5148600;
  v5[4] = self;
  objc_msgSend(v3, "markPendingInvitationAsSpamForAlbum:completionHandler:", v4, v5);

}

- (void)_reportJunkLabelTapped:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t);
  void *v22;
  id v23;
  id location;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0D719E0];
  objc_msgSend(v5, "photoLibraryURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = objc_msgSend(v6, "sharedStreamsEnabledForPhotoLibraryURL:", v7);

  if ((_DWORD)v6)
  {
    -[PXSharedAlbumInvitationView delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      PXLocalizedStringFromTable(CFSTR("PXForYouInvitationReportJunkAlertTitle"), CFSTR("PhotosUICore"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v9, 0, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_initWeak(&location, self);
      v11 = (void *)MEMORY[0x1E0DC3448];
      PXLocalizedStringFromTable(CFSTR("PXForYouInvitationReportJunkAlertButtonTitle"), CFSTR("PhotosUICore"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = MEMORY[0x1E0C809B0];
      v20 = 3221225472;
      v21 = __54__PXSharedAlbumInvitationView__reportJunkLabelTapped___block_invoke;
      v22 = &unk_1E5140760;
      objc_copyWeak(&v23, &location);
      objc_msgSend(v11, "actionWithTitle:style:handler:", v12, 2, &v19);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addAction:", v13, v19, v20, v21, v22);

      v14 = (void *)MEMORY[0x1E0DC3448];
      PXLocalizedStringFromTable(CFSTR("PXCancel"), CFSTR("PhotosUICore"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "actionWithTitle:style:handler:", v15, 1, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addAction:", v16);

      objc_msgSend(v10, "popoverPresentationController");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXSharedAlbumInvitationView reportJunkLabel](self, "reportJunkLabel");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setSourceView:", v18);
      objc_msgSend(v18, "bounds");
      objc_msgSend(v17, "setSourceRect:");
      objc_msgSend(v8, "sharedAlbumInvitationView:presentViewController:", self, v10);

      objc_destroyWeak(&v23);
      objc_destroyWeak(&location);

    }
  }

}

- (PXSharedAlbumInvitationViewDelegate)delegate
{
  return (PXSharedAlbumInvitationViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PXFeedInvitationSectionInfo)invitationSectionInfo
{
  return self->_invitationSectionInfo;
}

- (UIEdgeInsets)contentInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentInsets.top;
  left = self->_contentInsets.left;
  bottom = self->_contentInsets.bottom;
  right = self->_contentInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (BOOL)useInPopover
{
  return self->_useInPopover;
}

- (PXRoundedCornerOverlayView)roundedCornerOverlayView
{
  return self->_roundedCornerOverlayView;
}

- (void)setRoundedCornerOverlayView:(id)a3
{
  objc_storeStrong((id *)&self->_roundedCornerOverlayView, a3);
}

- (unint64_t)avatarImageTag
{
  return self->_avatarImageTag;
}

- (void)setAvatarImageTag:(unint64_t)a3
{
  self->_avatarImageTag = a3;
}

- (UIImageView)avatarView
{
  return self->_avatarView;
}

- (void)setAvatarView:(id)a3
{
  objc_storeStrong((id *)&self->_avatarView, a3);
}

- (UILabel)infoLabel
{
  return self->_infoLabel;
}

- (void)setInfoLabel:(id)a3
{
  objc_storeStrong((id *)&self->_infoLabel, a3);
}

- (UILabel)albumTitleLabel
{
  return self->_albumTitleLabel;
}

- (void)setAlbumTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_albumTitleLabel, a3);
}

- (UILabel)subscriberInfoLabel
{
  return self->_subscriberInfoLabel;
}

- (void)setSubscriberInfoLabel:(id)a3
{
  objc_storeStrong((id *)&self->_subscriberInfoLabel, a3);
}

- (UIButton)acceptButton
{
  return self->_acceptButton;
}

- (void)setAcceptButton:(id)a3
{
  objc_storeStrong((id *)&self->_acceptButton, a3);
}

- (UIButton)declineButton
{
  return self->_declineButton;
}

- (void)setDeclineButton:(id)a3
{
  objc_storeStrong((id *)&self->_declineButton, a3);
}

- (UILabel)reportJunkLabel
{
  return self->_reportJunkLabel;
}

- (void)setReportJunkLabel:(id)a3
{
  objc_storeStrong((id *)&self->_reportJunkLabel, a3);
}

- (PLCloudSharedAlbumProtocol)sharedAlbum
{
  return self->_sharedAlbum;
}

- (void)setSharedAlbum:(id)a3
{
  objc_storeStrong((id *)&self->_sharedAlbum, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedAlbum, 0);
  objc_storeStrong((id *)&self->_reportJunkLabel, 0);
  objc_storeStrong((id *)&self->_declineButton, 0);
  objc_storeStrong((id *)&self->_acceptButton, 0);
  objc_storeStrong((id *)&self->_subscriberInfoLabel, 0);
  objc_storeStrong((id *)&self->_albumTitleLabel, 0);
  objc_storeStrong((id *)&self->_infoLabel, 0);
  objc_storeStrong((id *)&self->_avatarView, 0);
  objc_storeStrong((id *)&self->_roundedCornerOverlayView, 0);
  objc_storeStrong((id *)&self->_invitationSectionInfo, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __54__PXSharedAlbumInvitationView__reportJunkLabelTapped___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_reportJunk");

}

void __42__PXSharedAlbumInvitationView__reportJunk__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    PLPhotoSharingGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "sharedAlbum");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "localizedTitle");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138412546;
      v8 = v6;
      v9 = 2112;
      v10 = v3;
      _os_log_impl(&dword_1A6789000, v4, OS_LOG_TYPE_ERROR, "ERROR: Failed to report shared album %@ as junk (%@)", (uint8_t *)&v7, 0x16u);

    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_enableUserInteractions:", 0);
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[NSObject sharedAlbumInvitationViewDidReportAsJunk:](v4, "sharedAlbumInvitationViewDidReportAsJunk:", *(_QWORD *)(a1 + 32));
  }

}

void __51__PXSharedAlbumInvitationView__acceptButtonTapped___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD block[5];
  id v7;
  id v8;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__PXSharedAlbumInvitationView__acceptButtonTapped___block_invoke_2;
  block[3] = &unk_1E51457C8;
  v4 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v7 = v4;
  v8 = v3;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __51__PXSharedAlbumInvitationView__acceptButtonTapped___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (_os_feature_enabled_impl())
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 496), "setConfiguration:", *(_QWORD *)(a1 + 40));
  if (*(_QWORD *)(a1 + 48))
  {
    PLPhotoSharingGetLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v3 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138412290;
      v14 = v3;
      _os_log_impl(&dword_1A6789000, v2, OS_LOG_TYPE_ERROR, "ERROR: Failed to subcribe to shared stream %@", buf, 0xCu);
    }

    v4 = (void *)MEMORY[0x1E0DC3450];
    PXLocalizedStringFromTable(CFSTR("PXForYouInvitationAlbumNoLongerSharedErrorTitle"), CFSTR("PhotosUICore"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "alertControllerWithTitle:message:preferredStyle:", v5, 0, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (void *)MEMORY[0x1E0DC3448];
    PXLocalizedStringFromTable(CFSTR("PXOK"), CFSTR("PhotosUICore"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "actionWithTitle:style:handler:", v8, 1, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addAction:", v9);

    objc_msgSend(*(id *)(a1 + 32), "window");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "rootViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "presentViewController:animated:completion:", v6, 1, 0);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_enableUserInteractions:", 0);
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v12, "sharedAlbumInvitationView:didAccept:", *(_QWORD *)(a1 + 32), 1);

  }
}

uint64_t __98__PXSharedAlbumInvitationView__showOutOfNetworkInvitationMessageForSharedAlbum_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __98__PXSharedAlbumInvitationView__showOutOfNetworkInvitationMessageForSharedAlbum_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  +[PXSystemNavigation navigateToDestination:completion:](PXSystemNavigation, "navigateToDestination:completion:", 4, 0);
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

id __84__PXSharedAlbumInvitationView__actionButtonWithTitle_action_buttonColor_titleColor___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  v2 = (void *)objc_msgSend(a2, "mutableCopy");
  objc_msgSend(MEMORY[0x1E0DC1350], "px_preferredFontForTextStyle:maxContentSizeCategory:withSymbolicTraits:", *MEMORY[0x1E0DC4B08], *MEMORY[0x1E0DC48D0], 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, *MEMORY[0x1E0DC1138]);

  return v2;
}

void __50__PXSharedAlbumInvitationView__updateAvatarImage___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id WeakRetained;
  NSObject *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v7)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "_handlePersonImage:imageTag:", v7, *(_QWORD *)(a1 + 40));

  }
  else if (v9)
  {
    PLPhotoSharingGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = 138412290;
      v14 = v10;
      _os_log_impl(&dword_1A6789000, v12, OS_LOG_TYPE_ERROR, "ERROR: Failed to retreive avatar image: %@", (uint8_t *)&v13, 0xCu);
    }

  }
}

void __62__PXSharedAlbumInvitationView__updateRoundedCornerOverlayView__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  id v11;

  v3 = *(void **)(a1 + 32);
  v11 = a2;
  objc_msgSend(v3, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayScale");
  v6 = v5;

  if (v6 <= 0.0)
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "scale");
    v6 = v8;

  }
  objc_msgSend(*(id *)(a1 + 32), "cornerRadius");
  objc_msgSend(v11, "setCornerRadius:");
  objc_msgSend(*(id *)(a1 + 32), "_roundedCornerViewBackgroundColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setBackgroundColor:", v9);

  objc_msgSend(*(id *)(a1 + 32), "_parentViewBackgroundColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setOverlayColor:", v10);

  objc_msgSend(v11, "setDisplayScale:", v6);
}

double __72__PXSharedAlbumInvitationView__performLayoutInRect_updateSubviewFrames___block_invoke(uint64_t a1, double result)
{
  uint64_t v2;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (*(double *)(v2 + 24) < result)
  {
    result = ceil(result);
    *(double *)(v2 + 24) = result;
  }
  return result;
}

+ (void)preloadResources
{
  if (preloadResources_onceToken_257337 != -1)
    dispatch_once(&preloadResources_onceToken_257337, &__block_literal_global_257338);
}

void __47__PXSharedAlbumInvitationView_preloadResources__block_invoke()
{
  id v0;

  +[PXPreloadScheduler sharedScheduler](PXPreloadScheduler, "sharedScheduler");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "scheduleTaskWithQoS:block:", 0, &__block_literal_global_128);

}

void __47__PXSharedAlbumInvitationView_preloadResources__block_invoke_2()
{
  +[PXActivitySpec invitationHeaderImage](PXActivitySpec, "invitationHeaderImage");

}

@end
