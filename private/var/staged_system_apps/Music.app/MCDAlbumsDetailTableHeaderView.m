@implementation MCDAlbumsDetailTableHeaderView

+ (id)reuseIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class(a1, a2);
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
  uint64_t v13;
  UIImageView *v14;
  void *v15;
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double Width;
  double v24;
  double v25;
  uint64_t v26;
  void *v27;
  double v28;
  CGFloat v29;
  CGFloat v30;
  double MinY;
  double MinX;
  double v33;
  CGFloat Height;
  double v35;
  double v36;
  CGFloat v37;
  CGFloat v38;
  double v39;
  double v40;
  CGFloat v41;
  CGFloat v42;
  CGFloat v43;
  double v44;
  CGFloat v45;
  double v46;
  double v47;
  CGFloat v48;
  double v49;
  CGFloat v50;
  double v51;
  CGFloat x;
  CGFloat y;
  double v54;
  CGFloat v55;
  double MaxY;
  CGFloat v57;
  unsigned int v58;
  UIImageView *favoriteIcon;
  double v60;
  double v61;
  CGFloat v62;
  double v63;
  id v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  void *v72;
  void *v73;
  uint64_t v74;
  UIImageView *v75;
  UIImageView *v76;
  void *v77;
  double v78;
  double v79;
  CGFloat v80;
  double v81;
  double v82;
  double v83;
  CGFloat v84;
  double v85;
  CGFloat v86;
  CGFloat v87;
  CGFloat v88;
  double MidY;
  double v90;
  double v91;
  double v92;
  double v93;
  uint64_t v94;
  _Unwind_Exception *v95;
  double v96;
  CGFloat v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  CGFloat v105;
  CGFloat v106;
  CGFloat v107;
  CGFloat v108;
  CGFloat v109;
  double v110;
  double rect;
  objc_super v112;
  uint64_t v113;
  uint64_t *v114;
  uint64_t v115;
  void *v116;
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
  CGRect v135;
  CGRect v136;
  CGRect v137;
  CGRect v138;
  CGRect v139;

  v112.receiver = self;
  v112.super_class = (Class)MCDAlbumsDetailTableHeaderView;
  -[MCDAlbumsDetailTableHeaderView layoutSubviews](&v112, "layoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCDAlbumsDetailTableHeaderView contentView](self, "contentView"));
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  artworkImageView = self->_artworkImageView;
  MPURectByApplyingUserInterfaceLayoutDirectionInRect(v13, 0.0, 4.0, 36.0, 36.0, v5, v7, v9, v11);
  -[UIImageView setFrame:](artworkImageView, "setFrame:");
  v14 = self->_artworkImageView;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView image](v14, "image"));
  -[UIImageView setHidden:](v14, "setHidden:", v15 == 0);

  v110 = v5;
  v16 = UIRectCenteredYInRect(CGRectZero.origin.x, CGRectZero.origin.y, 34.0, 24.0, v5, v7, v9, v11);
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v117.origin.x = v5;
  v117.origin.y = v7;
  v117.size.width = v9;
  v117.size.height = v11;
  Width = CGRectGetWidth(v117);
  v118.origin.x = v16;
  v118.origin.y = v18;
  v118.size.width = v20;
  v118.size.height = v22;
  v24 = Width - CGRectGetWidth(v118);
  v25 = v9;
  v108 = v22;
  rect = v11;
  MPURectByApplyingUserInterfaceLayoutDirectionInRect(v26, v24, v18, v20, v22, v110, v7, v9, v11);
  -[CPUIMediaButton setFrame:](self->_shuffleButton, "setFrame:");
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView image](self->_artworkImageView, "image"));

  if (v27)
  {
    v119.origin.x = 0.0;
    v119.origin.y = 4.0;
    v119.size.width = 36.0;
    v119.size.height = 36.0;
    v28 = CGRectGetMaxX(v119) + 9.0;
    v120.origin.x = v110;
    v120.origin.y = v7;
    v120.size.width = v9;
    v120.size.height = v11;
    v29 = v110;
    v30 = v7;
    MinY = CGRectGetMinY(v120);
    v121.origin.x = v24;
    v121.origin.y = v18;
    v121.size.width = v20;
    v121.size.height = v108;
    MinX = CGRectGetMinX(v121);
    v122.origin.x = 0.0;
    v122.origin.y = 4.0;
    v122.size.width = 36.0;
    v122.size.height = 36.0;
    v33 = MinX - CGRectGetMaxX(v122) + -18.0;
  }
  else
  {
    v123.origin.x = v110;
    v123.origin.y = v7;
    v123.size.width = v9;
    v123.size.height = v11;
    v29 = v110;
    v30 = v7;
    MinY = CGRectGetMinY(v123);
    v124.origin.x = v24;
    v124.origin.y = v18;
    v124.size.width = v20;
    v124.size.height = v22;
    v33 = CGRectGetMinX(v124) + -9.0;
    v28 = 0.0;
  }
  v104 = v30;
  v125.origin.x = v29;
  v125.origin.y = v30;
  v125.size.width = v25;
  v125.size.height = rect;
  Height = CGRectGetHeight(v125);
  v126.origin.x = v28;
  v126.origin.y = MinY;
  v126.size.width = v33;
  v126.size.height = Height;
  v109 = CGRectGetMinX(v126);
  v35 = v28;
  v36 = CGSizeZero.height;
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", CGSizeZero.width, v36);
  v127.size.width = v37;
  v127.size.height = v38;
  v105 = v38;
  v127.origin.y = 0.0;
  v127.origin.x = v109;
  v39 = CGRectGetWidth(v127);
  v128.origin.x = v28;
  v128.origin.y = MinY;
  v128.size.width = v33;
  v128.size.height = Height;
  v40 = CGRectGetWidth(v128);
  if (v39 < v40)
    v40 = v39;
  v106 = v40;
  v129.origin.x = v28;
  v129.origin.y = MinY;
  v41 = v33;
  v102 = v33;
  v129.size.width = v33;
  v129.size.height = Height;
  v42 = CGRectGetMinX(v129);
  -[UILabel sizeThatFits:](self->_subtitleLabel, "sizeThatFits:", CGSizeZero.width, v36);
  v130.size.width = v43;
  v45 = v44;
  v130.origin.y = 0.0;
  v130.origin.x = v42;
  v130.size.height = v45;
  v46 = CGRectGetWidth(v130);
  v131.origin.x = v35;
  v131.origin.y = MinY;
  v131.size.width = v41;
  v131.size.height = Height;
  v47 = CGRectGetWidth(v131);
  if (v46 >= v47)
    v48 = v47;
  else
    v48 = v46;
  v132.origin.y = 0.0;
  v132.size.width = v106;
  v132.origin.x = v109;
  v132.size.height = v105;
  v49 = CGRectGetHeight(v132);
  v133.origin.y = 0.0;
  v133.origin.x = v42;
  v133.size.width = v48;
  v133.size.height = v45;
  v50 = CGRectGetHeight(v133);
  v51 = v102;
  v103 = v25;
  v134.origin.x = UIRectCenteredYInRect(v35, MinY, v51, v49 + v50, v110, v104, v25, rect);
  x = v134.origin.x;
  y = v134.origin.y;
  v54 = v134.size.width;
  v55 = v134.size.height;
  v97 = CGRectGetMinY(v134);
  v135.origin.x = x;
  v135.origin.y = y;
  v135.size.width = v54;
  v135.size.height = v55;
  MaxY = CGRectGetMaxY(v135);
  v136.origin.y = 0.0;
  v136.origin.x = v42;
  v99 = v48;
  v100 = v45;
  v136.size.width = v48;
  v136.size.height = v45;
  v57 = CGRectGetHeight(v136);
  v58 = -[MCDAlbumsDetailTableHeaderView isFavorite](self, "isFavorite");
  favoriteIcon = self->_favoriteIcon;
  v101 = v42;
  v98 = v57;
  if (v58)
  {
    v96 = MaxY;
    if (favoriteIcon)
    {
      -[UIImageView setHidden:](favoriteIcon, "setHidden:", 0);
      v61 = v106;
      v60 = v109;
      v62 = v105;
    }
    else
    {
      v113 = 0;
      v114 = &v113;
      v115 = 0x2020000000;
      v72 = off_1011ECD10;
      v116 = off_1011ECD10;
      v61 = v106;
      v60 = v109;
      v62 = v105;
      if (!off_1011ECD10)
      {
        v73 = (void *)sub_1000237FC();
        v72 = dlsym(v73, "MCDFavoriteIcon");
        v114[3] = (uint64_t)v72;
        off_1011ECD10 = v72;
      }
      _Block_object_dispose(&v113, 8);
      if (!v72)
      {
        v95 = (_Unwind_Exception *)sub_100DE9368();
        _Block_object_dispose(&v113, 8);
        _Unwind_Resume(v95);
      }
      v74 = ((uint64_t (*)(void))v72)();
      v75 = (UIImageView *)objc_claimAutoreleasedReturnValue(v74);
      v76 = self->_favoriteIcon;
      self->_favoriteIcon = v75;

      v77 = (void *)objc_claimAutoreleasedReturnValue(-[MCDAlbumsDetailTableHeaderView contentView](self, "contentView"));
      objc_msgSend(v77, "addSubview:", self->_favoriteIcon);

    }
    -[UIImageView bounds](self->_favoriteIcon, "bounds");
    v79 = v61 + 4.0 + v78;
    if (v79 >= v54)
    {
      v80 = v60;
      -[UIImageView bounds](self->_favoriteIcon, "bounds", v79);
      v79 = v81 + 4.0;
      v61 = v61 - (v81 + 4.0);
    }
    else
    {
      v80 = v60;
    }
    v71 = v97;
    -[UIImageView frame](self->_favoriteIcon, "frame", v79);
    v107 = v82;
    v84 = v83;
    v86 = v85;
    v137.origin.x = v80;
    v137.origin.y = v97;
    v137.size.width = v61;
    v137.size.height = v62;
    v87 = v62;
    v88 = CGRectGetMaxX(v137) + 4.0;
    v138.origin.x = v80;
    v138.origin.y = v97;
    v138.size.width = v61;
    v138.size.height = v87;
    MidY = CGRectGetMidY(v138);
    v139.origin.x = v88;
    v139.origin.y = v107;
    v139.size.width = v84;
    v139.size.height = v86;
    v90 = MidY + CGRectGetHeight(v139) * -0.5;
    v91 = v88;
    v92 = v84;
    v93 = v86;
    v65 = v110;
    v67 = v104;
    v70 = v61;
    v68 = v103;
    v66 = v80;
    v63 = rect;
    MPURectByApplyingUserInterfaceLayoutDirectionInRect(v94, v91, v90, v92, v93, v110, v104, v103, rect);
    v64 = -[UIImageView setFrame:](self->_favoriteIcon, "setFrame:");
    v69 = v87;
    MaxY = v96;
  }
  else
  {
    v63 = rect;
    v64 = -[UIImageView setHidden:](favoriteIcon, "setHidden:", 1);
    v66 = v109;
    v65 = v110;
    v68 = v103;
    v67 = v104;
    v69 = v105;
    v70 = v106;
    v71 = v97;
  }
  MPURectByApplyingUserInterfaceLayoutDirectionInRect(v64, v66, v71, v70, v69, v65, v67, v68, v63);
  MPURectByApplyingUserInterfaceLayoutDirectionInRect(-[UILabel setFrame:](self->_titleLabel, "setFrame:"), v101, MaxY - v98, v99, v100, v65, v67, v68, v63);
  -[UILabel setFrame:](self->_subtitleLabel, "setFrame:");
}

- (UIImage)artworkImage
{
  return -[UIImageView image](self->_artworkImageView, "image");
}

- (void)setArtworkImage:(id)a3
{
  id v4;
  id v5;
  double v6;
  id v7;

  v7 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[MCDAlbumsDetailTableHeaderView artworkImage](self, "artworkImage"));

  if (v4 != v7)
  {
    -[UIImageView setImage:](self->_artworkImageView, "setImage:", v7);
    -[UIImageView setTintColor:](self->_artworkImageView, "setTintColor:", 0);
    -[UIImageView setClipsToBounds:](self->_artworkImageView, "setClipsToBounds:", 1);
    v5 = objc_msgSend(v7, "renderingMode");
    v6 = 4.5;
    if (v5 == (id)2)
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
  v7 = off_1011ECD20;
  v23 = off_1011ECD20;
  if (!off_1011ECD20)
  {
    v8 = (void *)sub_1000237FC();
    v7 = dlsym(v8, "MCDAlbumDetailFormat");
    v21[3] = (uint64_t)v7;
    off_1011ECD20 = v7;
  }
  _Block_object_dispose(&v20, 8);
  if (!v7)
  {
    sub_100DE9368();
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
