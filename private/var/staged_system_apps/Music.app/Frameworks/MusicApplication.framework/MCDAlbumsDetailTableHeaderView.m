@implementation MCDAlbumsDetailTableHeaderView

+ (id)reuseIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class(a1);
  return NSStringFromClass(v2);
}

- (MCDAlbumsDetailTableHeaderView)initWithReuseIdentifier:(id)a3
{
  MCDAlbumsDetailTableHeaderView *v3;
  id v4;
  double y;
  double width;
  double height;
  UIImageView *v8;
  UIImageView *artworkImageView;
  void *v10;
  UILabel *v11;
  UILabel *titleLabel;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  UILabel *v17;
  UILabel *subtitleLabel;
  void *v19;
  void *v20;
  void *v21;
  CPUIMediaButton *v22;
  CPUIMediaButton *shuffleButton;
  void *v24;
  void *v25;
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)MCDAlbumsDetailTableHeaderView;
  v3 = -[MCDAlbumsDetailTableHeaderView initWithReuseIdentifier:](&v27, "initWithReuseIdentifier:", a3);
  if (v3)
  {
    v4 = objc_alloc((Class)UIImageView);
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
    v8 = (UIImageView *)objc_msgSend(v4, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    artworkImageView = v3->_artworkImageView;
    v3->_artworkImageView = v8;

    -[UIImageView setContentMode:](v3->_artworkImageView, "setContentMode:", 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MCDAlbumsDetailTableHeaderView contentView](v3, "contentView"));
    objc_msgSend(v10, "addSubview:", v3->_artworkImageView);

    v11 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = v11;

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont boldSystemFontOfSize:](UIFont, "boldSystemFontOfSize:", 16.0));
    -[UILabel setFont:](v3->_titleLabel, "setFont:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _carSystemPrimaryColor](UIColor, "_carSystemPrimaryColor"));
    -[UILabel setTextColor:](v3->_titleLabel, "setTextColor:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _carSystemFocusPrimaryColor](UIColor, "_carSystemFocusPrimaryColor"));
    -[UILabel setHighlightedTextColor:](v3->_titleLabel, "setHighlightedTextColor:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MCDAlbumsDetailTableHeaderView contentView](v3, "contentView"));
    objc_msgSend(v16, "addSubview:", v3->_titleLabel);

    v17 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    subtitleLabel = v3->_subtitleLabel;
    v3->_subtitleLabel = v17;

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _carSystemSecondaryColor](UIColor, "_carSystemSecondaryColor"));
    -[UILabel setTextColor:](v3->_subtitleLabel, "setTextColor:", v19);

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _carSystemFocusSecondaryColor](UIColor, "_carSystemFocusSecondaryColor"));
    -[UILabel setHighlightedTextColor:](v3->_subtitleLabel, "setHighlightedTextColor:", v20);

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[MCDAlbumsDetailTableHeaderView contentView](v3, "contentView"));
    objc_msgSend(v21, "addSubview:", v3->_subtitleLabel);

    v22 = objc_opt_new(CPUIMediaButton);
    shuffleButton = v3->_shuffleButton;
    v3->_shuffleButton = v22;

    v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _systemImageNamed:](UIImage, "_systemImageNamed:", CFSTR("shuffle")));
    -[CPUIMediaButton setImage:forState:](v3->_shuffleButton, "setImage:forState:", v24, 0);
    -[CPUIMediaButton addTarget:action:forControlEvents:](v3->_shuffleButton, "addTarget:action:forControlEvents:", v3, "_shuffleButtonAction:", 64);
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[MCDAlbumsDetailTableHeaderView contentView](v3, "contentView"));
    objc_msgSend(v25, "addSubview:", v3->_shuffleButton);

  }
  return v3;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  UIImageView *artworkImageView;
  void *v13;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double Width;
  double v22;
  double v23;
  void *v24;
  double v25;
  CGFloat v26;
  CGFloat v27;
  double MinY;
  double MinX;
  double v30;
  CGFloat Height;
  double v32;
  double v33;
  CGFloat v34;
  CGFloat v35;
  double v36;
  double v37;
  CGFloat v38;
  CGFloat v39;
  CGFloat v40;
  double v41;
  CGFloat v42;
  double v43;
  double v44;
  CGFloat v45;
  double v46;
  CGFloat v47;
  double v48;
  CGFloat x;
  CGFloat y;
  double v51;
  CGFloat v52;
  double MaxY;
  CGFloat v54;
  unsigned int v55;
  UIImageView *favoriteIcon;
  double v57;
  double v58;
  CGFloat v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  void *v68;
  void *v69;
  uint64_t v70;
  UIImageView *v71;
  UIImageView *v72;
  void *v73;
  double v74;
  double v75;
  CGFloat v76;
  double v77;
  double v78;
  double v79;
  CGFloat v80;
  double v81;
  CGFloat v82;
  CGFloat v83;
  CGFloat v84;
  double MidY;
  double v86;
  double v87;
  double v88;
  double v89;
  _Unwind_Exception *v90;
  double v91;
  CGFloat v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  CGFloat v100;
  CGFloat v101;
  CGFloat v102;
  CGFloat v103;
  CGFloat v104;
  double v105;
  double rect;
  objc_super v107;
  uint64_t v108;
  uint64_t *v109;
  uint64_t v110;
  void *v111;
  CGRect v112;
  CGRect v113;
  CGRect v114;
  CGRect v115;
  CGRect v116;
  CGRect v117;
  CGRect v118;
  CGRect v119;
  CGRect v120;
  CGRect v121;
  CGRect v122;
  CGRect v123;
  CGRect v124;
  CGRect v125;
  CGRect v126;
  CGRect v127;
  CGRect v128;
  CGRect v129;
  CGRect v130;
  CGRect v131;
  CGRect v132;
  CGRect v133;
  CGRect v134;

  v107.receiver = self;
  v107.super_class = (Class)MCDAlbumsDetailTableHeaderView;
  -[MCDAlbumsDetailTableHeaderView layoutSubviews](&v107, "layoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCDAlbumsDetailTableHeaderView contentView](self, "contentView"));
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[UIImageView setFrame:](self->_artworkImageView, "setFrame:", MPURectByApplyingUserInterfaceLayoutDirectionInRect(0.0, 4.0, 36.0, 36.0, v5, v7, v9, v11));
  artworkImageView = self->_artworkImageView;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView image](artworkImageView, "image"));
  -[UIImageView setHidden:](artworkImageView, "setHidden:", v13 == 0);

  v105 = v5;
  v14 = UIRectCenteredYInRect(CGRectZero.origin.x, CGRectZero.origin.y, 34.0, 24.0, v5, v7, v9, v11);
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v112.origin.x = v5;
  v112.origin.y = v7;
  v112.size.width = v9;
  v112.size.height = v11;
  Width = CGRectGetWidth(v112);
  v113.origin.x = v14;
  v113.origin.y = v16;
  v113.size.width = v18;
  v113.size.height = v20;
  v22 = Width - CGRectGetWidth(v113);
  v23 = v9;
  v103 = v20;
  rect = v11;
  -[CPUIMediaButton setFrame:](self->_shuffleButton, "setFrame:", MPURectByApplyingUserInterfaceLayoutDirectionInRect(v22, v16, v18, v20, v105, v7, v9, v11));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView image](self->_artworkImageView, "image"));

  if (v24)
  {
    v114.origin.x = 0.0;
    v114.origin.y = 4.0;
    v114.size.width = 36.0;
    v114.size.height = 36.0;
    v25 = CGRectGetMaxX(v114) + 9.0;
    v115.origin.x = v105;
    v115.origin.y = v7;
    v115.size.width = v9;
    v115.size.height = v11;
    v26 = v105;
    v27 = v7;
    MinY = CGRectGetMinY(v115);
    v116.origin.x = v22;
    v116.origin.y = v16;
    v116.size.width = v18;
    v116.size.height = v103;
    MinX = CGRectGetMinX(v116);
    v117.origin.x = 0.0;
    v117.origin.y = 4.0;
    v117.size.width = 36.0;
    v117.size.height = 36.0;
    v30 = MinX - CGRectGetMaxX(v117) + -18.0;
  }
  else
  {
    v118.origin.x = v105;
    v118.origin.y = v7;
    v118.size.width = v9;
    v118.size.height = v11;
    v26 = v105;
    v27 = v7;
    MinY = CGRectGetMinY(v118);
    v119.origin.x = v22;
    v119.origin.y = v16;
    v119.size.width = v18;
    v119.size.height = v20;
    v30 = CGRectGetMinX(v119) + -9.0;
    v25 = 0.0;
  }
  v99 = v27;
  v120.origin.x = v26;
  v120.origin.y = v27;
  v120.size.width = v23;
  v120.size.height = rect;
  Height = CGRectGetHeight(v120);
  v121.origin.x = v25;
  v121.origin.y = MinY;
  v121.size.width = v30;
  v121.size.height = Height;
  v104 = CGRectGetMinX(v121);
  v32 = v25;
  v33 = CGSizeZero.height;
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", CGSizeZero.width, v33);
  v122.size.width = v34;
  v122.size.height = v35;
  v100 = v35;
  v122.origin.y = 0.0;
  v122.origin.x = v104;
  v36 = CGRectGetWidth(v122);
  v123.origin.x = v25;
  v123.origin.y = MinY;
  v123.size.width = v30;
  v123.size.height = Height;
  v37 = CGRectGetWidth(v123);
  if (v36 < v37)
    v37 = v36;
  v101 = v37;
  v124.origin.x = v25;
  v124.origin.y = MinY;
  v38 = v30;
  v97 = v30;
  v124.size.width = v30;
  v124.size.height = Height;
  v39 = CGRectGetMinX(v124);
  -[UILabel sizeThatFits:](self->_subtitleLabel, "sizeThatFits:", CGSizeZero.width, v33);
  v125.size.width = v40;
  v42 = v41;
  v125.origin.y = 0.0;
  v125.origin.x = v39;
  v125.size.height = v42;
  v43 = CGRectGetWidth(v125);
  v126.origin.x = v32;
  v126.origin.y = MinY;
  v126.size.width = v38;
  v126.size.height = Height;
  v44 = CGRectGetWidth(v126);
  if (v43 >= v44)
    v45 = v44;
  else
    v45 = v43;
  v127.origin.y = 0.0;
  v127.size.width = v101;
  v127.origin.x = v104;
  v127.size.height = v100;
  v46 = CGRectGetHeight(v127);
  v128.origin.y = 0.0;
  v128.origin.x = v39;
  v128.size.width = v45;
  v128.size.height = v42;
  v47 = CGRectGetHeight(v128);
  v48 = v97;
  v98 = v23;
  v129.origin.x = UIRectCenteredYInRect(v32, MinY, v48, v46 + v47, v105, v99, v23, rect);
  x = v129.origin.x;
  y = v129.origin.y;
  v51 = v129.size.width;
  v52 = v129.size.height;
  v92 = CGRectGetMinY(v129);
  v130.origin.x = x;
  v130.origin.y = y;
  v130.size.width = v51;
  v130.size.height = v52;
  MaxY = CGRectGetMaxY(v130);
  v131.origin.y = 0.0;
  v131.origin.x = v39;
  v94 = v45;
  v95 = v42;
  v131.size.width = v45;
  v131.size.height = v42;
  v54 = CGRectGetHeight(v131);
  v55 = -[MCDAlbumsDetailTableHeaderView isFavorite](self, "isFavorite");
  favoriteIcon = self->_favoriteIcon;
  v96 = v39;
  v93 = v54;
  if (v55)
  {
    v91 = MaxY;
    if (favoriteIcon)
    {
      -[UIImageView setHidden:](favoriteIcon, "setHidden:", 0);
      v58 = v101;
      v57 = v104;
      v59 = v100;
    }
    else
    {
      v108 = 0;
      v109 = &v108;
      v110 = 0x2020000000;
      v68 = getMCDFavoriteIconSymbolLoc_ptr;
      v111 = getMCDFavoriteIconSymbolLoc_ptr;
      v58 = v101;
      v57 = v104;
      v59 = v100;
      if (!getMCDFavoriteIconSymbolLoc_ptr)
      {
        v69 = (void *)MusicCarDisplayUILibrary_14();
        v68 = dlsym(v69, "MCDFavoriteIcon");
        v109[3] = (uint64_t)v68;
        getMCDFavoriteIconSymbolLoc_ptr = v68;
      }
      _Block_object_dispose(&v108, 8);
      if (!v68)
      {
        v90 = (_Unwind_Exception *)soft_MCDMusicGeneralLogging_cold_1();
        _Block_object_dispose(&v108, 8);
        _Unwind_Resume(v90);
      }
      v70 = ((uint64_t (*)(void))v68)();
      v71 = (UIImageView *)objc_claimAutoreleasedReturnValue(v70);
      v72 = self->_favoriteIcon;
      self->_favoriteIcon = v71;

      v73 = (void *)objc_claimAutoreleasedReturnValue(-[MCDAlbumsDetailTableHeaderView contentView](self, "contentView"));
      objc_msgSend(v73, "addSubview:", self->_favoriteIcon);

    }
    -[UIImageView bounds](self->_favoriteIcon, "bounds");
    v75 = v58 + 4.0 + v74;
    if (v75 >= v51)
    {
      v76 = v57;
      -[UIImageView bounds](self->_favoriteIcon, "bounds", v75);
      v75 = v77 + 4.0;
      v58 = v58 - (v77 + 4.0);
    }
    else
    {
      v76 = v57;
    }
    v67 = v92;
    -[UIImageView frame](self->_favoriteIcon, "frame", v75);
    v102 = v78;
    v80 = v79;
    v82 = v81;
    v132.origin.x = v76;
    v132.origin.y = v92;
    v132.size.width = v58;
    v132.size.height = v59;
    v83 = v59;
    v84 = CGRectGetMaxX(v132) + 4.0;
    v133.origin.x = v76;
    v133.origin.y = v92;
    v133.size.width = v58;
    v133.size.height = v83;
    MidY = CGRectGetMidY(v133);
    v134.origin.x = v84;
    v134.origin.y = v102;
    v134.size.width = v80;
    v134.size.height = v82;
    v86 = MidY + CGRectGetHeight(v134) * -0.5;
    v87 = v84;
    v88 = v80;
    v89 = v82;
    v61 = v105;
    v63 = v99;
    v66 = v58;
    v64 = v98;
    v62 = v76;
    v60 = rect;
    -[UIImageView setFrame:](self->_favoriteIcon, "setFrame:", MPURectByApplyingUserInterfaceLayoutDirectionInRect(v87, v86, v88, v89, v105, v99, v98, rect));
    v65 = v83;
    MaxY = v91;
  }
  else
  {
    v60 = rect;
    -[UIImageView setHidden:](favoriteIcon, "setHidden:", 1);
    v62 = v104;
    v61 = v105;
    v64 = v98;
    v63 = v99;
    v65 = v100;
    v66 = v101;
    v67 = v92;
  }
  -[UILabel setFrame:](self->_titleLabel, "setFrame:", MPURectByApplyingUserInterfaceLayoutDirectionInRect(v62, v67, v66, v65, v61, v63, v64, v60));
  -[UILabel setFrame:](self->_subtitleLabel, "setFrame:", MPURectByApplyingUserInterfaceLayoutDirectionInRect(v96, MaxY - v93, v94, v95, v61, v63, v64, v60));
}

- (UIImage)artworkImage
{
  return -[UIImageView image](self->_artworkImageView, "image");
}

- (void)setArtworkImage:(id)a3
{
  id v4;
  char *v5;
  double v6;
  id v7;

  v7 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[MCDAlbumsDetailTableHeaderView artworkImage](self, "artworkImage"));

  if (v4 != v7)
  {
    -[UIImageView setImage:](self->_artworkImageView, "setImage:", v7);
    -[UIImageView setTintColor:](self->_artworkImageView, "setTintColor:", 0);
    -[UIImageView setClipsToBounds:](self->_artworkImageView, "setClipsToBounds:", 1);
    v5 = (char *)objc_msgSend(v7, "renderingMode");
    v6 = 4.5;
    if (v5 == (_BYTE *)&dword_0 + 2)
      v6 = 0.0;
    -[UIImageView _setContinuousCornerRadius:](self->_artworkImageView, "_setContinuousCornerRadius:", v6);
    -[MCDAlbumsDetailTableHeaderView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setTemplateArtworkImage:(id)a3
{
  id v4;

  -[MCDAlbumsDetailTableHeaderView setArtworkImage:](self, "setArtworkImage:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue(+[UIColor _carSystemSecondaryColor](UIColor, "_carSystemSecondaryColor"));
  -[UIImageView setTintColor:](self->_artworkImageView, "setTintColor:", v4);

}

- (NSString)title
{
  return -[UILabel text](self->_titleLabel, "text");
}

- (void)setTitle:(id)a3
{
  void *v4;
  unsigned __int8 v5;
  id v6;

  v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MCDAlbumsDetailTableHeaderView title](self, "title"));
  v5 = objc_msgSend(v4, "isEqualToString:", v6);

  if ((v5 & 1) == 0)
    -[UILabel setText:](self->_titleLabel, "setText:", v6);

}

- (void)setContentPlayable:(BOOL)a3
{
  self->_contentPlayable = a3;
  -[CPUIMediaButton setHidden:](self->_shuffleButton, "setHidden:", !a3);
}

- (void)setDuration:(double)a3 count:(unint64_t)a4
{
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  void *v23;
  NSAttributedStringKey v24;
  id v25;
  NSAttributedStringKey v26;
  void *v27;
  NSAttributedStringKey v28;
  void *v29;

  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v7 = getMCDAlbumDetailFormatSymbolLoc_ptr;
  v23 = getMCDAlbumDetailFormatSymbolLoc_ptr;
  if (!getMCDAlbumDetailFormatSymbolLoc_ptr)
  {
    v8 = (void *)MusicCarDisplayUILibrary_14();
    v7 = dlsym(v8, "MCDAlbumDetailFormat");
    v21[3] = (uint64_t)v7;
    getMCDAlbumDetailFormatSymbolLoc_ptr = v7;
  }
  _Block_object_dispose(&v20, 8);
  if (!v7)
  {
    soft_MCDMusicGeneralLogging_cold_1();
    __break(1u);
  }
  v9 = ((uint64_t (*)(unint64_t, unint64_t))v7)(a4, llround(a3 / 60.0));
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v28 = NSFontAttributeName;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 12.0));
  v29 = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1));
  v26 = NSFontAttributeName;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont boldSystemFontOfSize:](UIFont, "boldSystemFontOfSize:", 12.0));
  v27 = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[MPUEmphasizedText attributedStringWithString:emphasisDelimiter:regularTextAttributes:emphasizedTextAttributes:](MPUEmphasizedText, "attributedStringWithString:emphasisDelimiter:regularTextAttributes:emphasizedTextAttributes:", v10, CFSTR("#"), v12, v14));
  v16 = objc_msgSend(v15, "mutableCopy");

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSParagraphStyle defaultParagraphStyle](NSParagraphStyle, "defaultParagraphStyle"));
  v18 = objc_msgSend(v17, "mutableCopy");

  objc_msgSend(v18, "setLineBreakMode:", 4);
  v24 = NSParagraphStyleAttributeName;
  v25 = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1));
  objc_msgSend(v16, "addAttributes:range:", v19, 0, objc_msgSend(v16, "length"));

  -[UILabel setAttributedText:](self->_subtitleLabel, "setAttributedText:", v16);
}

- (void)_shuffleButtonAction:(id)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD);
  id v6;

  v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MCDAlbumsDetailTableHeaderView shuffleActionBlock](self, "shuffleActionBlock"));

  if (v4)
  {
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[MCDAlbumsDetailTableHeaderView shuffleActionBlock](self, "shuffleActionBlock"));
    ((void (**)(_QWORD, id))v5)[2](v5, v6);

  }
}

- (BOOL)isFavorite
{
  return self->_favorite;
}

- (void)setFavorite:(BOOL)a3
{
  self->_favorite = a3;
}

- (BOOL)contentPlayable
{
  return self->_contentPlayable;
}

- (id)shuffleActionBlock
{
  return self->_shuffleActionBlock;
}

- (void)setShuffleActionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_shuffleActionBlock, 0);
  objc_storeStrong((id *)&self->_shuffleButton, 0);
  objc_storeStrong((id *)&self->_favoriteIcon, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_artworkImageView, 0);
}

@end
