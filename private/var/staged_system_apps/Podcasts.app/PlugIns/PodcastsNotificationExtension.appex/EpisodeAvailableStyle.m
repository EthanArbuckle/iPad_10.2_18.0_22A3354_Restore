@implementation EpisodeAvailableStyle

+ (id)defaultStyle
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000F5F4;
  block[3] = &unk_100029100;
  block[4] = a1;
  if (qword_1000333C0 != -1)
    dispatch_once(&qword_1000333C0, block);
  return (id)qword_1000333C8;
}

- (id)_initDefault
{
  char *v2;
  _QWORD *v3;
  MTDynamicTypeConstant *v4;
  void *v5;
  MTDynamicTypeConstant *v6;
  void *v7;
  MTDynamicTypeConstant *v8;
  void *v9;
  MTDynamicTypeConstant *v10;
  void *v11;
  MTDynamicTypeConstant *v12;
  void *v13;
  MTDynamicTypeConstant *v14;
  void *v15;
  MTDynamicTypeConstant *v16;
  void *v17;
  MTDynamicTypeConstant *v18;
  void *v19;
  MTDynamicTypeConstant *v20;
  void *v21;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)EpisodeAvailableStyle;
  v2 = -[EpisodeAvailableStyle init](&v23, "init");
  v3 = v2;
  if (v2)
  {
    *(_OWORD *)(v2 + 8) = xmmword_100026FD0;
    v4 = -[MTDynamicTypeConstant initWithDefaultConstant:textStyle:]([MTDynamicTypeConstant alloc], "initWithDefaultConstant:textStyle:", UIFontTextStyleBody, 20.0);
    v5 = (void *)v3[3];
    v3[3] = v4;

    v6 = -[MTDynamicTypeConstant initWithDefaultConstant:textStyle:]([MTDynamicTypeConstant alloc], "initWithDefaultConstant:textStyle:", UIFontTextStyleTitle1, 24.0);
    v7 = (void *)v3[4];
    v3[4] = v6;

    v8 = -[MTDynamicTypeConstant initWithDefaultConstant:textStyle:]([MTDynamicTypeConstant alloc], "initWithDefaultConstant:textStyle:", UIFontTextStyleBody, 24.0);
    v9 = (void *)v3[5];
    v3[5] = v8;

    v10 = -[MTDynamicTypeConstant initWithDefaultConstant:textStyle:]([MTDynamicTypeConstant alloc], "initWithDefaultConstant:textStyle:", UIFontTextStyleSubheadline, 24.0);
    v11 = (void *)v3[6];
    v3[6] = v10;

    v12 = -[MTDynamicTypeConstant initWithDefaultConstant:textStyle:]([MTDynamicTypeConstant alloc], "initWithDefaultConstant:textStyle:", UIFontTextStyleBody, 24.0);
    v13 = (void *)v3[7];
    v3[7] = v12;

    v14 = -[MTDynamicTypeConstant initWithDefaultConstant:textStyle:]([MTDynamicTypeConstant alloc], "initWithDefaultConstant:textStyle:", UIFontTextStyleBody, 24.0);
    v15 = (void *)v3[8];
    v3[8] = v14;

    v16 = -[MTDynamicTypeConstant initWithDefaultConstant:textStyle:]([MTDynamicTypeConstant alloc], "initWithDefaultConstant:textStyle:", UIFontTextStyleSubheadline, 32.0);
    v17 = (void *)v3[9];
    v3[9] = v16;

    v18 = -[MTDynamicTypeConstant initWithDefaultConstant:textStyle:]([MTDynamicTypeConstant alloc], "initWithDefaultConstant:textStyle:", UIFontTextStyleSubheadline, 24.0);
    v19 = (void *)v3[10];
    v3[10] = v18;

    v20 = -[MTDynamicTypeConstant initWithDefaultConstant:textStyle:]([MTDynamicTypeConstant alloc], "initWithDefaultConstant:textStyle:", UIFontTextStyleSubheadline, 24.0);
    v21 = (void *)v3[11];
    v3[11] = v20;

  }
  return v3;
}

- (id)newArtworkView
{
  UIImageView *v2;

  v2 = objc_opt_new(UIImageView);
  -[UIImageView mt_configureForDisplayingArtworkWithRadius:](v2, "mt_configureForDisplayingArtworkWithRadius:", 4.0);
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

- (double)spacingBetweenTextAndArtwork
{
  return self->_spacingBetweenTextAndArtwork;
}

- (void)setSpacingBetweenTextAndArtwork:(double)a3
{
  self->_spacingBetweenTextAndArtwork = a3;
}

- (MTDynamicTypeConstant)container_To_artTop
{
  return self->_container_To_artTop;
}

- (void)setContainer_To_artTop:(id)a3
{
  objc_storeStrong((id *)&self->_container_To_artTop, a3);
}

- (MTDynamicTypeConstant)artTop_To_mainHeaderBL
{
  return self->_artTop_To_mainHeaderBL;
}

- (void)setArtTop_To_mainHeaderBL:(id)a3
{
  objc_storeStrong((id *)&self->_artTop_To_mainHeaderBL, a3);
}

- (MTDynamicTypeConstant)mainHeaderBL_To_showTitleBL
{
  return self->_mainHeaderBL_To_showTitleBL;
}

- (void)setMainHeaderBL_To_showTitleBL:(id)a3
{
  objc_storeStrong((id *)&self->_mainHeaderBL_To_showTitleBL, a3);
}

- (MTDynamicTypeConstant)showTitleBL_To_dateBaseline_Min
{
  return self->_showTitleBL_To_dateBaseline_Min;
}

- (void)setShowTitleBL_To_dateBaseline_Min:(id)a3
{
  objc_storeStrong((id *)&self->_showTitleBL_To_dateBaseline_Min, a3);
}

- (MTDynamicTypeConstant)dateBL_To_titleBL
{
  return self->_dateBL_To_titleBL;
}

- (void)setDateBL_To_titleBL:(id)a3
{
  objc_storeStrong((id *)&self->_dateBL_To_titleBL, a3);
}

- (MTDynamicTypeConstant)episodeTitleBL_To_divider
{
  return self->_episodeTitleBL_To_divider;
}

- (void)setEpisodeTitleBL_To_divider:(id)a3
{
  objc_storeStrong((id *)&self->_episodeTitleBL_To_divider, a3);
}

- (MTDynamicTypeConstant)divider_To_summaryBL
{
  return self->_divider_To_summaryBL;
}

- (void)setDivider_To_summaryBL:(id)a3
{
  objc_storeStrong((id *)&self->_divider_To_summaryBL, a3);
}

- (MTDynamicTypeConstant)summaryBL_To_metadataBL
{
  return self->_summaryBL_To_metadataBL;
}

- (void)setSummaryBL_To_metadataBL:(id)a3
{
  objc_storeStrong((id *)&self->_summaryBL_To_metadataBL, a3);
}

- (MTDynamicTypeConstant)metadataBL_To_bottomBL
{
  return self->_metadataBL_To_bottomBL;
}

- (void)setMetadataBL_To_bottomBL:(id)a3
{
  objc_storeStrong((id *)&self->_metadataBL_To_bottomBL, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadataBL_To_bottomBL, 0);
  objc_storeStrong((id *)&self->_summaryBL_To_metadataBL, 0);
  objc_storeStrong((id *)&self->_divider_To_summaryBL, 0);
  objc_storeStrong((id *)&self->_episodeTitleBL_To_divider, 0);
  objc_storeStrong((id *)&self->_dateBL_To_titleBL, 0);
  objc_storeStrong((id *)&self->_showTitleBL_To_dateBaseline_Min, 0);
  objc_storeStrong((id *)&self->_mainHeaderBL_To_showTitleBL, 0);
  objc_storeStrong((id *)&self->_artTop_To_mainHeaderBL, 0);
  objc_storeStrong((id *)&self->_container_To_artTop, 0);
}

@end
