@implementation EpisodeListAvailableStyle

+ (id)defaultStyle
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000F9C0;
  block[3] = &unk_100029100;
  block[4] = a1;
  if (qword_1000333D0 != -1)
    dispatch_once(&qword_1000333D0, block);
  return (id)qword_1000333D8;
}

- (id)_initDefault
{
  EpisodeListAvailableStyle *v2;
  EpisodeListAvailableStyle *v3;
  MTDynamicTypeConstant *v4;
  MTDynamicTypeConstant *cell_container_To_mainHeaderBL;
  MTDynamicTypeConstant *v6;
  MTDynamicTypeConstant *cell_mainHeaderBL_To_collectionViewTop;
  MTDynamicTypeConstant *v8;
  MTDynamicTypeConstant *cell_topAndBottomPadding;
  MTDynamicTypeConstant *v10;
  MTDynamicTypeConstant *v11;
  MTDynamicTypeConstant *cell_titleBL_To_subtitleBL;
  MTDynamicTypeConstant *v13;
  MTDynamicTypeConstant *seeMore_containerTop_To_buttonBL;
  MTDynamicTypeConstant *v15;
  MTDynamicTypeConstant *seeMore_buttonBL_To_containerBottom;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)EpisodeListAvailableStyle;
  v2 = -[EpisodeListAvailableStyle init](&v18, "init");
  v3 = v2;
  if (v2)
  {
    v2->_defaultMarginH = 16.0;
    *(_OWORD *)&v2->_cell_artworkDimension = xmmword_100026FE0;
    v2->_cell_playButtonToContentSpacing = 12.0;
    v4 = -[MTDynamicTypeConstant initWithDefaultConstant:textStyle:]([MTDynamicTypeConstant alloc], "initWithDefaultConstant:textStyle:", UIFontTextStyleTitle1, 44.0);
    cell_container_To_mainHeaderBL = v3->_cell_container_To_mainHeaderBL;
    v3->_cell_container_To_mainHeaderBL = v4;

    v6 = -[MTDynamicTypeConstant initWithDefaultConstant:textStyle:]([MTDynamicTypeConstant alloc], "initWithDefaultConstant:textStyle:", UIFontTextStyleTitle1, 14.0);
    cell_mainHeaderBL_To_collectionViewTop = v3->_cell_mainHeaderBL_To_collectionViewTop;
    v3->_cell_mainHeaderBL_To_collectionViewTop = v6;

    v8 = -[MTDynamicTypeConstant initWithDefaultConstant:textStyle:]([MTDynamicTypeConstant alloc], "initWithDefaultConstant:textStyle:", UIFontTextStyleBody, 16.0);
    cell_topAndBottomPadding = v3->_cell_topAndBottomPadding;
    v3->_cell_topAndBottomPadding = v8;

    v10 = [MTDynamicTypeConstant alloc];
    v11 = -[MTDynamicTypeConstant initWithDefaultConstant:textStyle:](v10, "initWithDefaultConstant:textStyle:", UIFontTextStyleSubhead, 18.0);
    cell_titleBL_To_subtitleBL = v3->_cell_titleBL_To_subtitleBL;
    v3->_cell_titleBL_To_subtitleBL = v11;

    v13 = -[MTDynamicTypeConstant initWithDefaultConstant:textStyle:]([MTDynamicTypeConstant alloc], "initWithDefaultConstant:textStyle:", UIFontTextStyleBody, 32.0);
    seeMore_containerTop_To_buttonBL = v3->_seeMore_containerTop_To_buttonBL;
    v3->_seeMore_containerTop_To_buttonBL = v13;

    v15 = -[MTDynamicTypeConstant initWithDefaultConstant:textStyle:]([MTDynamicTypeConstant alloc], "initWithDefaultConstant:textStyle:", UIFontTextStyleBody, 24.0);
    seeMore_buttonBL_To_containerBottom = v3->_seeMore_buttonBL_To_containerBottom;
    v3->_seeMore_buttonBL_To_containerBottom = v15;

  }
  return v3;
}

- (id)cell_newTitleLabel
{
  MTDynamicTypeLabel *v2;

  v2 = -[MTDynamicTypeLabel initWithTextStyle:symbolicTraits:]([MTDynamicTypeLabel alloc], "initWithTextStyle:symbolicTraits:", UIFontTextStyleBody, 0);
  -[MTDynamicTypeLabel setNumberOfLines:](v2, "setNumberOfLines:", 2);
  return v2;
}

- (id)cell_newSubtitleLabel
{
  MTDynamicTypeLabel *v2;
  void *v3;

  v2 = -[MTDynamicTypeLabel initWithTextStyle:symbolicTraits:]([MTDynamicTypeLabel alloc], "initWithTextStyle:symbolicTraits:", UIFontTextStyleFootnote, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGrayColor](UIColor, "systemGrayColor"));
  -[MTDynamicTypeLabel setTextColor:](v2, "setTextColor:", v3);

  -[MTDynamicTypeLabel setNumberOfLines:](v2, "setNumberOfLines:", 1);
  return v2;
}

- (id)cell_newArtworkView
{
  double v2;
  double v3;
  UIImageView *v4;

  -[EpisodeListAvailableStyle cell_artworkDimension](self, "cell_artworkDimension");
  v3 = v2;
  v4 = objc_opt_new(UIImageView);
  -[UIImageView mt_configureForDisplayingArtworkWithRadius:](v4, "mt_configureForDisplayingArtworkWithRadius:", 4.0);
  -[UIImageView setFrame:](v4, "setFrame:", 0.0, 0.0, v3, v3);
  return v4;
}

- (id)cell_newPlayButton
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MTButtonWithTouchInsets buttonWithType:](MTButtonWithTouchInsets, "buttonWithType:", 0));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("notifications_play_grayback")));
  objc_msgSend(v2, "setImage:forState:", v3, 0);
  objc_msgSend(v2, "setImageEdgeInsets:", UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
  objc_msgSend(v2, "sizeToFit");

  return v2;
}

- (id)cell_newHorizontalSeparatorView
{
  UIView *v2;
  void *v3;
  double v4;
  double v5;
  void *v6;

  v2 = objc_opt_new(UIView);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v3, "scale");
  v5 = v4;

  -[UIView setFrame:](v2, "setFrame:", 0.0, 0.0, 0.0, 1.0 / v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor cellSeparatorColor](UIColor, "cellSeparatorColor"));
  -[UIView setBackgroundColor:](v2, "setBackgroundColor:", v6);

  return v2;
}

- (id)newSeeMoreButton
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 1));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont mt_preferredFontForTextStyle:](UIFont, "mt_preferredFontForTextStyle:", UIFontTextStyleBody));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "titleLabel"));
  objc_msgSend(v4, "setFont:", v3);

  objc_msgSend(v2, "setTitleEdgeInsets:", UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("SEE_MORE_BUTTON_TITLE"), &stru_1000292B8, 0));
  objc_msgSend(v2, "setTitle:forState:", v6, 0);

  return v2;
}

- (double)defaultMarginH
{
  return self->_defaultMarginH;
}

- (void)setDefaultMarginH:(double)a3
{
  self->_defaultMarginH = a3;
}

- (MTDynamicTypeConstant)seeMore_containerTop_To_buttonBL
{
  return self->_seeMore_containerTop_To_buttonBL;
}

- (void)setSeeMore_containerTop_To_buttonBL:(id)a3
{
  objc_storeStrong((id *)&self->_seeMore_containerTop_To_buttonBL, a3);
}

- (MTDynamicTypeConstant)seeMore_buttonBL_To_containerBottom
{
  return self->_seeMore_buttonBL_To_containerBottom;
}

- (void)setSeeMore_buttonBL_To_containerBottom:(id)a3
{
  objc_storeStrong((id *)&self->_seeMore_buttonBL_To_containerBottom, a3);
}

- (double)cell_artworkDimension
{
  return self->_cell_artworkDimension;
}

- (void)setCell_artworkDimension:(double)a3
{
  self->_cell_artworkDimension = a3;
}

- (double)cell_artworkToContentSpacing
{
  return self->_cell_artworkToContentSpacing;
}

- (void)setCell_artworkToContentSpacing:(double)a3
{
  self->_cell_artworkToContentSpacing = a3;
}

- (double)cell_playButtonToContentSpacing
{
  return self->_cell_playButtonToContentSpacing;
}

- (void)setCell_playButtonToContentSpacing:(double)a3
{
  self->_cell_playButtonToContentSpacing = a3;
}

- (MTDynamicTypeConstant)cell_container_To_mainHeaderBL
{
  return self->_cell_container_To_mainHeaderBL;
}

- (void)setCell_container_To_mainHeaderBL:(id)a3
{
  objc_storeStrong((id *)&self->_cell_container_To_mainHeaderBL, a3);
}

- (MTDynamicTypeConstant)cell_mainHeaderBL_To_collectionViewTop
{
  return self->_cell_mainHeaderBL_To_collectionViewTop;
}

- (void)setCell_mainHeaderBL_To_collectionViewTop:(id)a3
{
  objc_storeStrong((id *)&self->_cell_mainHeaderBL_To_collectionViewTop, a3);
}

- (MTDynamicTypeConstant)cell_titleBL_To_subtitleBL
{
  return self->_cell_titleBL_To_subtitleBL;
}

- (void)setCell_titleBL_To_subtitleBL:(id)a3
{
  objc_storeStrong((id *)&self->_cell_titleBL_To_subtitleBL, a3);
}

- (MTDynamicTypeConstant)cell_topAndBottomPadding
{
  return self->_cell_topAndBottomPadding;
}

- (void)setCell_topAndBottomPadding:(id)a3
{
  objc_storeStrong((id *)&self->_cell_topAndBottomPadding, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cell_topAndBottomPadding, 0);
  objc_storeStrong((id *)&self->_cell_titleBL_To_subtitleBL, 0);
  objc_storeStrong((id *)&self->_cell_mainHeaderBL_To_collectionViewTop, 0);
  objc_storeStrong((id *)&self->_cell_container_To_mainHeaderBL, 0);
  objc_storeStrong((id *)&self->_seeMore_buttonBL_To_containerBottom, 0);
  objc_storeStrong((id *)&self->_seeMore_containerTop_To_buttonBL, 0);
}

@end
