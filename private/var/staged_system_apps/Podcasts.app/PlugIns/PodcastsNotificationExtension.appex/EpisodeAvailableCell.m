@implementation EpisodeAvailableCell

- (EpisodeAvailableCell)initWithFrame:(CGRect)a3
{
  EpisodeAvailableCell *v3;
  uint64_t v4;
  EpisodeListAvailableStyle *style;
  uint64_t v6;
  UIImageView *artworkView;
  uint64_t v8;
  MTButtonWithTouchInsets *playButton;
  uint64_t v10;
  UILabel *titleLabel;
  uint64_t v12;
  UILabel *subtitleLabel;
  uint64_t v14;
  UIView *separatorView;
  void *v16;
  objc_super v18;
  _QWORD v19[5];

  v18.receiver = self;
  v18.super_class = (Class)EpisodeAvailableCell;
  v3 = -[EpisodeAvailableCell initWithFrame:](&v18, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_claimAutoreleasedReturnValue(+[EpisodeListAvailableStyle defaultStyle](EpisodeListAvailableStyle, "defaultStyle"));
    style = v3->_style;
    v3->_style = (EpisodeListAvailableStyle *)v4;

    v6 = objc_claimAutoreleasedReturnValue(-[EpisodeListAvailableStyle cell_newArtworkView](v3->_style, "cell_newArtworkView"));
    artworkView = v3->_artworkView;
    v3->_artworkView = (UIImageView *)v6;

    v8 = objc_claimAutoreleasedReturnValue(-[EpisodeListAvailableStyle cell_newPlayButton](v3->_style, "cell_newPlayButton"));
    playButton = v3->_playButton;
    v3->_playButton = (MTButtonWithTouchInsets *)v8;

    v10 = objc_claimAutoreleasedReturnValue(-[EpisodeListAvailableStyle cell_newTitleLabel](v3->_style, "cell_newTitleLabel"));
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = (UILabel *)v10;

    v12 = objc_claimAutoreleasedReturnValue(-[EpisodeListAvailableStyle cell_newSubtitleLabel](v3->_style, "cell_newSubtitleLabel"));
    subtitleLabel = v3->_subtitleLabel;
    v3->_subtitleLabel = (UILabel *)v12;

    v14 = objc_claimAutoreleasedReturnValue(-[EpisodeListAvailableStyle cell_newHorizontalSeparatorView](v3->_style, "cell_newHorizontalSeparatorView"));
    separatorView = v3->_separatorView;
    v3->_separatorView = (UIView *)v14;

    -[UIView setHidden:](v3->_separatorView, "setHidden:", 1);
    -[MTButtonWithTouchInsets addTarget:action:forControlEvents:](v3->_playButton, "addTarget:action:forControlEvents:", v3, "playButtonTapped:", 64);
    v19[0] = v3->_artworkView;
    v19[1] = v3->_playButton;
    v19[2] = v3->_titleLabel;
    v19[3] = v3->_subtitleLabel;
    v19[4] = v3->_separatorView;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v19, 5));
    -[EpisodeAvailableCell ensureInstalledSubviews:](v3, "ensureInstalledSubviews:", v16);

  }
  return v3;
}

- (void)setEpisodePropertySource:(id)a3
{
  EpisodePropertySource *v5;
  EpisodePropertySource *v6;

  v5 = (EpisodePropertySource *)a3;
  if (self->_episodePropertySource != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_episodePropertySource, a3);
    -[EpisodeAvailableCell reloadValues](self, "reloadValues");
    v5 = v6;
  }

}

- (void)playButtonTapped:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[EpisodeAvailableCell delegate](self, "delegate", a3));
  objc_msgSend(v4, "handlePlayActionForEpisodeAvailableCell:", self);

}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  void *v6;
  objc_super v7;

  v3 = a3;
  if (-[EpisodeAvailableCell isHighlighted](self, "isHighlighted") != a3)
  {
    v7.receiver = self;
    v7.super_class = (Class)EpisodeAvailableCell;
    -[EpisodeAvailableCell setHighlighted:](&v7, "setHighlighted:", v3);
    if ((-[EpisodeAvailableCell isHighlighted](self, "isHighlighted") & 1) != 0)
      v5 = objc_claimAutoreleasedReturnValue(+[UIColor cellSelectedBackgroundColor](UIColor, "cellSelectedBackgroundColor"));
    else
      v5 = objc_claimAutoreleasedReturnValue(+[UIColor backgroundColor](UIColor, "backgroundColor"));
    v6 = (void *)v5;
    -[EpisodeAvailableCell setBackgroundColor:](self, "setBackgroundColor:", v5);

  }
}

- (void)prepareForReuse
{
  EpisodePropertySource *episodePropertySource;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)EpisodeAvailableCell;
  -[EpisodeAvailableCell prepareForReuse](&v7, "prepareForReuse");
  episodePropertySource = self->_episodePropertySource;
  self->_episodePropertySource = 0;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[EpisodeAvailableCell artworkView](self, "artworkView"));
  objc_msgSend(v4, "setImage:", 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[EpisodeAvailableCell titleLabel](self, "titleLabel"));
  objc_msgSend(v5, "setText:", &stru_1000292B8);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[EpisodeAvailableCell subtitleLabel](self, "subtitleLabel"));
  objc_msgSend(v6, "setText:", &stru_1000292B8);

  -[EpisodeAvailableCell setSeparatorHidden:](self, "setSeparatorHidden:", 0);
}

- (void)setSeparatorHidden:(BOOL)a3
{
  if (self->_separatorHidden != a3)
  {
    self->_separatorHidden = a3;
    -[EpisodeAvailableCell invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    -[EpisodeAvailableCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)EpisodeAvailableCell;
  -[EpisodeAvailableCell traitCollectionDidChange:](&v4, "traitCollectionDidChange:", a3);
  -[EpisodeAvailableCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)layoutSubviews
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  void *v18;
  CGFloat v19;
  double v20;
  void *v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  double v32;
  double MaxX;
  double v34;
  CGFloat v35;
  double v36;
  CGFloat v37;
  double v38;
  CGFloat v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  CGFloat v45;
  double Height;
  double v47;
  double v48;
  double v49;
  double v50;
  double MinX;
  double v52;
  double v53;
  double v54;
  CGFloat v55;
  double v56;
  CGFloat v57;
  double v58;
  CGFloat v59;
  double v60;
  double v61;
  double v62;
  double v63;
  void *v64;
  double v65;
  double v66;
  void *v67;
  double v68;
  double v69;
  void *v70;
  double v71;
  CGFloat x;
  CGFloat v73;
  void *v74;
  double v75;
  double v76;
  double v77;
  double v78;
  CGFloat v79;
  double v80;
  double MinY;
  double v82;
  double v83;
  double v84;
  double v85;
  CGFloat v86;
  CGFloat y;
  double v88;
  double v89;
  double v90;
  CGFloat v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double MaxY;
  double v98;
  double v99;
  double Width;
  double v101;
  double v102;
  double v103;
  double v104;
  CGRect rect;
  __objc2_class *v106;
  CGRect v107;
  CGRect v108;
  CGRect v109;
  CGRect v110;
  CGRect v111;
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

  *(_QWORD *)&rect.size.height = self;
  v106 = EpisodeAvailableCell;
  -[CGFloat layoutSubviews]((objc_super *)&rect.size.height, "layoutSubviews");
  v3 = -[EpisodeAvailableCell effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[EpisodeAvailableCell separatorView](self, "separatorView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[EpisodeAvailableCell artworkView](self, "artworkView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[EpisodeAvailableCell playButton](self, "playButton"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[EpisodeAvailableCell titleLabel](self, "titleLabel"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[EpisodeAvailableCell subtitleLabel](self, "subtitleLabel"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[EpisodeAvailableCell style](self, "style"));
  -[EpisodeAvailableCell bounds](self, "bounds");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "cell_topAndBottomPadding"));
  objc_msgSend(v18, "currentConstant");
  rect.size.width = v19;

  objc_msgSend(v9, "defaultMarginH");
  v101 = v20;
  v107.origin.x = v11;
  v107.origin.y = v13;
  v107.size.width = v15;
  v107.size.height = v17;
  MaxY = CGRectGetMaxY(v107);
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v21, "scale");
  v94 = v22;

  v108.origin.x = v11;
  v108.origin.y = v13;
  v108.size.width = v15;
  v108.size.height = v17;
  Width = CGRectGetWidth(v108);
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v23, "scale");
  v92 = v24;

  objc_msgSend(v5, "frame");
  v26 = v25;
  v28 = v27;
  v30 = v29;
  objc_msgSend(v9, "defaultMarginH");
  v32 = v31;
  rect.origin.y = v28;
  v102 = v17;
  if (v3 == (id)1)
  {
    v109.origin.x = v11;
    v109.origin.y = v13;
    v109.size.width = v15;
    v109.size.height = v17;
    MaxX = CGRectGetMaxX(v109);
    v110.origin.x = v26;
    v110.origin.y = rect.size.width;
    v110.size.width = v28;
    v110.size.height = v30;
    v34 = MaxX - CGRectGetWidth(v110) - v32;
  }
  else
  {
    v34 = v11 + v31;
  }
  v35 = v30;
  objc_msgSend(v6, "frame");
  v37 = v36;
  objc_msgSend(v6, "frame");
  v39 = v38;
  objc_msgSend(v9, "defaultMarginH");
  v41 = v40;
  if (v3 == (id)1)
  {
    v42 = v11 + v40;
  }
  else
  {
    v111.origin.x = v11;
    v111.origin.y = v13;
    v111.size.width = v15;
    v111.size.height = v102;
    v43 = CGRectGetMaxX(v111);
    v112.origin.x = 0.0;
    v112.origin.y = 0.0;
    v112.size.width = v37;
    v112.size.height = v39;
    v42 = v43 - CGRectGetWidth(v112) - v41;
  }
  rect.origin.x = v42;
  v44 = v39;
  v45 = v34;
  v113.origin.x = v34;
  v113.origin.y = rect.size.width;
  v113.size.width = rect.origin.y;
  v113.size.height = v35;
  Height = CGRectGetHeight(v113);
  v114.origin.y = 0.0;
  v114.origin.x = rect.origin.x;
  v114.size.width = v37;
  v114.size.height = v39;
  v47 = rect.size.width + (Height - CGRectGetHeight(v114)) * 0.5;
  v99 = v47;
  v96 = v37;
  v104 = v34;
  v91 = v35;
  if (v3 == (id)1)
  {
    v115.origin.x = rect.origin.x;
    v115.origin.y = v47;
    v115.size.width = v37;
    v115.size.height = v44;
    v48 = CGRectGetMaxX(v115);
    objc_msgSend(v9, "cell_playButtonToContentSpacing");
    v50 = v48 + v49;
    v116.origin.x = v45;
    v116.origin.y = rect.size.width;
    v116.size.width = rect.origin.y;
    v116.size.height = v35;
    MinX = CGRectGetMinX(v116);
    objc_msgSend(v9, "cell_artworkToContentSpacing");
  }
  else
  {
    v117.origin.x = v34;
    v117.origin.y = rect.size.width;
    v117.size.width = rect.origin.y;
    v117.size.height = v35;
    v53 = CGRectGetMaxX(v117);
    objc_msgSend(v9, "cell_artworkToContentSpacing");
    v50 = v53 + v54;
    v118.origin.x = rect.origin.x;
    v118.origin.y = v47;
    v118.size.width = v37;
    v118.size.height = v44;
    MinX = CGRectGetMinX(v118);
    objc_msgSend(v9, "cell_playButtonToContentSpacing");
  }
  v55 = MinX - v52 - v50;
  v95 = MaxY - 1.0 / v94;
  v98 = 1.0 / v92;
  objc_msgSend(v7, "sizeThatFits:", v55, v102);
  v57 = v56;
  v59 = v58;
  v90 = v55;
  objc_msgSend(v8, "sizeThatFits:", v55, v102);
  v61 = v60;
  v119.origin.x = v50;
  v119.origin.y = rect.size.width;
  v119.size.width = v57;
  v93 = v57;
  v119.size.height = v59;
  v89 = v59;
  v62 = v50;
  v63 = CGRectGetMaxY(v119);
  v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "font"));
  objc_msgSend(v64, "descender");
  v66 = v63 - v65;
  v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "cell_titleBL_To_subtitleBL"));
  objc_msgSend(v67, "currentConstant");
  v69 = v66 + v68;
  v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "font"));
  objc_msgSend(v70, "descender");
  v103 = v61;
  v88 = v69 + v71 - v61;

  v120.origin.x = v62;
  v120.origin.y = rect.size.width;
  v120.size.width = v57;
  v120.size.height = v59;
  v128.origin.x = v62;
  v128.origin.y = v88;
  v128.size.width = v55;
  v128.size.height = v61;
  v121 = CGRectUnion(v120, v128);
  x = v121.origin.x;
  v86 = v121.size.height;
  y = v121.origin.y;
  v73 = v121.size.width;
  v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "font"));
  objc_msgSend(v74, "ascender");
  v76 = -v75;

  v122.origin.x = v104;
  v122.origin.y = rect.size.width;
  v122.size.width = rect.origin.y;
  v122.size.height = v91;
  v77 = CGRectGetHeight(v122);
  v123.origin.x = x;
  v123.size.height = v86;
  v123.origin.y = y;
  v123.size.width = v73;
  v78 = (v77 - CGRectGetHeight(v123)) * 0.5;
  if (v78 <= v76)
    v78 = v76;
  v79 = rect.size.width + v78;
  v80 = v88 + v78;
  objc_msgSend(v5, "setFrame:", v104);
  objc_msgSend(v7, "setFrame:", v62, v79, v93, v89);
  objc_msgSend(v8, "setFrame:", v62, v80, v90, v103);
  objc_msgSend(v4, "setFrame:", v101, v95, Width, v98);
  objc_msgSend(v4, "setHidden:", -[EpisodeAvailableCell separatorHidden](self, "separatorHidden"));
  v124.size.height = v44;
  v124.origin.x = rect.origin.x;
  v124.origin.y = v99;
  v124.size.width = v96;
  MinY = CGRectGetMinY(v124);
  v125.origin.x = v104;
  v125.origin.y = rect.size.width;
  v125.size.width = rect.origin.y;
  v125.size.height = v91;
  v82 = -fmax(MinY - CGRectGetMinY(v125), 0.0);
  v126.origin.x = v104;
  v126.origin.y = rect.size.width;
  v126.size.width = rect.origin.y;
  v126.size.height = v91;
  v83 = CGRectGetMaxY(v126);
  v127.origin.x = rect.origin.x;
  v127.origin.y = v99;
  v127.size.width = v96;
  v127.size.height = v44;
  v84 = -fmax(v83 - CGRectGetMaxY(v127), 0.0);
  objc_msgSend(v9, "cell_playButtonToContentSpacing");
  objc_msgSend(v6, "setTouchInsets:", v82, -v85, v84, -v85);
  objc_msgSend(v6, "setFrame:", rect.origin.x, v99, v96, v44);

}

- (void)ensureInstalledSubviews:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  EpisodeAvailableCell *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        v10 = (EpisodeAvailableCell *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "superview"));

        if (v10 != self)
          -[EpisodeAvailableCell addSubview:](self, "addSubview:", v9);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

}

+ (double)defaultHeight
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[EpisodeListAvailableStyle defaultStyle](EpisodeListAvailableStyle, "defaultStyle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "cell_topAndBottomPadding"));
  objc_msgSend(v3, "currentConstant");
  v5 = v4;

  objc_msgSend(v2, "cell_artworkDimension");
  v7 = v6 + v5 * 2.0;

  return v7;
}

- (CGSize)intrinsicContentSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  CGSize result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[EpisodeAvailableCell artworkView](self, "artworkView"));
  objc_msgSend(v2, "frame");
  v4 = v3;

  v5 = 0.0;
  v6 = v4;
  result.height = v6;
  result.width = v5;
  return result;
}

- (void)reloadValues
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = (id)objc_claimAutoreleasedReturnValue(-[EpisodeAvailableCell episodePropertySource](self, "episodePropertySource"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "title"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[EpisodeAvailableCell titleLabel](self, "titleLabel"));
  objc_msgSend(v4, "setText:", v3);

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedDurationAndPodcastTitleString"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[EpisodeAvailableCell subtitleLabel](self, "subtitleLabel"));
  objc_msgSend(v6, "setText:", v5);

  -[EpisodeAvailableCell loadArtworkImage](self, "loadArtworkImage");
  -[EpisodeAvailableCell setNeedsLayout](self, "setNeedsLayout");
  -[EpisodeAvailableCell invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");

}

- (void)applyImage:(id)a3 fromSource:(id)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v6 = a3;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100013EE0;
  block[3] = &unk_100028A80;
  block[4] = self;
  v10 = a4;
  v11 = v6;
  v7 = v6;
  v8 = v10;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

- (void)loadArtworkImage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  id v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[EpisodeAvailableCell episodePropertySource](self, "episodePropertySource"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "podcastUuid"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "preloadedImageWithSize:", (double)0x50uLL, (double)0x50uLL));
  if (v5)
  {
    -[EpisodeAvailableCell applyImage:fromSource:](self, "applyImage:fromSource:", v5, v3);
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    if (objc_msgSend(v4, "length"))
      objc_msgSend(v6, "addObject:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[EpisodeAvailableCell artworkView](self, "artworkView"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "image"));

    if (!v8)
      objc_msgSend(v6, "addObject:", kMTLibraryDefaultImageKey);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000140C8;
    v9[3] = &unk_100028A58;
    v9[4] = self;
    v10 = v3;
    -[EpisodeAvailableCell _fetchImageWithSize:imageKeyWithFallbackKeys:completion:](self, "_fetchImageWithSize:imageKeyWithFallbackKeys:completion:", v6, v9, (double)0x50uLL, (double)0x50uLL);

  }
}

- (void)_fetchImageWithSize:(CGSize)a3 imageKeyWithFallbackKeys:(id)a4 completion:(id)a5
{
  double height;
  double width;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17[3];
  id location;

  height = a3.height;
  width = a3.width;
  v9 = a4;
  v10 = a5;
  if (v10)
  {
    if (objc_msgSend(v9, "count"))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "firstObject"));
      if (objc_msgSend(v11, "length"))
      {
        objc_initWeak(&location, self);
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[PUIObjCArtworkProvider shared](PUIObjCArtworkProvider, "shared"));
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472;
        v14[2] = sub_100014268;
        v14[3] = &unk_100028AD0;
        objc_copyWeak(v17, &location);
        v16 = v10;
        v13 = v12;
        v15 = v13;
        v17[1] = *(id *)&width;
        v17[2] = *(id *)&height;
        objc_msgSend(v13, "artworkPathForShow:size:completionHandler:", v11, v14, width, height);

        objc_destroyWeak(v17);
        objc_destroyWeak(&location);
      }
      else
      {
        (*((void (**)(id, _QWORD))v10 + 2))(v10, 0);
      }

    }
    else
    {
      (*((void (**)(id, _QWORD))v10 + 2))(v10, 0);
    }
  }

}

- (EpisodeAvailableCellDelegate)delegate
{
  return (EpisodeAvailableCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (EpisodePropertySource)episodePropertySource
{
  return self->_episodePropertySource;
}

- (BOOL)separatorHidden
{
  return self->_separatorHidden;
}

- (EpisodeListAvailableStyle)style
{
  return self->_style;
}

- (UIView)separatorView
{
  return self->_separatorView;
}

- (UIImageView)artworkView
{
  return self->_artworkView;
}

- (MTButtonWithTouchInsets)playButton
{
  return self->_playButton;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_playButton, 0);
  objc_storeStrong((id *)&self->_artworkView, 0);
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_episodePropertySource, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
