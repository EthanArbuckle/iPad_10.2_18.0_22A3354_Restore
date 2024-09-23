@implementation RUIStyle

- (RUIStyle)init
{
  char *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  int64x2_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  objc_super v32;

  v32.receiver = self;
  v32.super_class = (Class)RUIStyle;
  v2 = -[RUIStyle init](&v32, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "tableBackgroundColor");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)*((_QWORD *)v2 + 2);
    *((_QWORD *)v2 + 2) = v3;

    objc_msgSend(MEMORY[0x24BEBD4B8], "tableCellBlueTextColor");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)*((_QWORD *)v2 + 4);
    *((_QWORD *)v2 + 4) = v5;

    objc_msgSend(MEMORY[0x24BEBD4B8], "tableCellBlueTextColor");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)*((_QWORD *)v2 + 3);
    *((_QWORD *)v2 + 3) = v7;

    objc_msgSend(MEMORY[0x24BEBD4B8], "tableCellBlueTextColor");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)*((_QWORD *)v2 + 6);
    *((_QWORD *)v2 + 6) = v9;

    objc_msgSend(MEMORY[0x24BEBD4B8], "_labelColor");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)*((_QWORD *)v2 + 5);
    *((_QWORD *)v2 + 5) = v11;

    objc_msgSend(MEMORY[0x24BEBD4B8], "_labelColor");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)*((_QWORD *)v2 + 7);
    *((_QWORD *)v2 + 7) = v13;

    RemoteUIHeaderTextColor();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)*((_QWORD *)v2 + 8);
    *((_QWORD *)v2 + 8) = v15;

    RemoteUISubheaderTextColor();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)*((_QWORD *)v2 + 9);
    *((_QWORD *)v2 + 9) = v17;

    RemoteUIDetailHeaderTextColor();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)*((_QWORD *)v2 + 10);
    *((_QWORD *)v2 + 10) = v19;

    RemoteUIFooterTextColor();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = (void *)*((_QWORD *)v2 + 11);
    *((_QWORD *)v2 + 11) = v21;

    objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = (void *)*((_QWORD *)v2 + 12);
    *((_QWORD *)v2 + 12) = v23;

    v25 = vdupq_n_s64(4uLL);
    *(int64x2_t *)(v2 + 104) = v25;
    *(int64x2_t *)(v2 + 120) = v25;
    *((_QWORD *)v2 + 17) = 1;
    RemoteUIFooterFont();
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = (void *)*((_QWORD *)v2 + 19);
    *((_QWORD *)v2 + 19) = v26;

    objc_msgSend(v2, "setSubHeaderTopMargin:", 0.0);
    objc_msgSend(v2, "setHeaderImagePadding:", 12.0);
    objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:weight:", 19.0, *MEMORY[0x24BEBB600]);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setNavBarButtonLabelFont:", v28);

    objc_msgSend(v2, "setNavBarLabelSpacingWithImage:", 8.0);
    objc_msgSend(v2, "setFooterTopMargin:", 7.0);
    objc_msgSend(v2, "setUseNonOBStyleButton:", 0);
    objc_msgSend(v2, "setHeaderMargin:", 0.0, 0.0, 8.0, 0.0);
    objc_msgSend(v2, "setHeaderContainerSideMargin:", 20.0);
    objc_msgSend(v2, "setSectionHeaderHeight:", *MEMORY[0x24BEBE770]);
    objc_msgSend(MEMORY[0x24BEBD4B8], "_secondaryLabelColor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setSpinnerLabelColor:", v29);

    objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 15.0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setSpinnerLabelFont:", v30);

  }
  return (RUIStyle *)v2;
}

- (void)setUseNonOBStyleButton:(BOOL)a3
{
  self->_useNonOBStyleButton = a3;
}

- (void)setSubHeaderTopMargin:(double)a3
{
  self->_subHeaderTopMargin = a3;
}

- (void)setSpinnerLabelFont:(id)a3
{
  objc_storeStrong((id *)&self->_spinnerLabelFont, a3);
}

- (void)setSpinnerLabelColor:(id)a3
{
  objc_storeStrong((id *)&self->_spinnerLabelColor, a3);
}

- (void)setSectionHeaderHeight:(double)a3
{
  self->_sectionHeaderHeight = a3;
}

- (void)setNavBarLabelSpacingWithImage:(double)a3
{
  self->_navBarLabelSpacingWithImage = a3;
}

- (void)setNavBarButtonLabelFont:(id)a3
{
  objc_storeStrong((id *)&self->_navBarButtonLabelFont, a3);
}

- (void)setHeaderMargin:(UIEdgeInsets)a3
{
  self->_headerMargin = a3;
}

- (void)setHeaderImagePadding:(double)a3
{
  self->_headerImagePadding = a3;
}

- (void)setHeaderContainerSideMargin:(double)a3
{
  self->_headerContainerSideMargin = a3;
}

- (void)setFooterTopMargin:(double)a3
{
  self->_footerTopMargin = a3;
}

+ (RUIStyle)sharedInstance
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)sharedInstance_instances;
  if (!sharedInstance_instances)
  {
    v4 = objc_opt_new();
    v5 = (void *)sharedInstance_instances;
    sharedInstance_instances = v4;

    v3 = (void *)sharedInstance_instances;
  }
  NSStringFromClass((Class)a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v7 = (void *)objc_opt_new();
    v8 = (void *)sharedInstance_instances;
    NSStringFromClass((Class)a1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, v9);

  }
  return (RUIStyle *)v7;
}

+ (id)defaultStyle
{
  void *v2;

  if (defaultStyle_onceToken != -1)
    dispatch_once(&defaultStyle_onceToken, &__block_literal_global_1);
  if (defaultStyle_isATV)
  {
    +[RUIStyle frontRowStyle](RUIStyle, "frontRowStyle");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (defaultStyle_isAppleWatch)
  {
    +[RUIStyle watchDefaultStyle](RUIStyle, "watchDefaultStyle");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = (void *)objc_opt_new();
  }
  return v2;
}

uint64_t __24__RUIStyle_defaultStyle__block_invoke()
{
  uint64_t result;

  result = MGGetSInt32Answer();
  defaultStyle_isATV = (_DWORD)result == 4;
  defaultStyle_isAppleWatch = (_DWORD)result == 6;
  return result;
}

+ (id)osloStyle
{
  return (id)objc_opt_new();
}

+ (id)setupAssistantStyle
{
  return (id)objc_opt_new();
}

+ (id)setupAssistantModalStyle
{
  return (id)objc_opt_new();
}

+ (id)frontRowStyle
{
  return (id)objc_opt_new();
}

+ (id)watchDefaultStyle
{
  objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (int64_t)navBarActivityIndicatorStyle
{
  return 100;
}

- (int64_t)tableViewStyle
{
  return 2;
}

- (void)applyToNavigationController:(id)a3
{
  id v4;

  objc_msgSend(a3, "navigationBar");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[RUIStyle applyToNavigationBar:](self, "applyToNavigationBar:", v4);

}

- (void)applyToNavigationBar:(id)a3
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "setRequestedContentSize:", 3);
  if (_isInternalInstall())
  {
    _RUILoggingFacility();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 138412290;
      v6 = v3;
      _os_log_impl(&dword_209E87000, v4, OS_LOG_TYPE_DEFAULT, "applyToNavigationBar: %@", (uint8_t *)&v5, 0xCu);
    }

  }
}

- (BOOL)supportActivityIndicatorInPinView
{
  return 0;
}

- (id)boldButtonTitleColorWithTintColor:(id)a3
{
  id v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x24BEBD4B8]);
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __46__RUIStyle_boldButtonTitleColorWithTintColor___block_invoke;
    v7[3] = &unk_24C2976D0;
    v8 = v3;
    v5 = (void *)objc_msgSend(v4, "initWithDynamicProvider:", v7);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

id __46__RUIStyle_boldButtonTitleColorWithTintColor___block_invoke(uint64_t a1)
{
  return +[RUIStyle _staticButtonTitleColorWithTintColor:](RUIStyle, "_staticButtonTitleColorWithTintColor:", *(_QWORD *)(a1 + 32));
}

+ (id)_staticButtonTitleColorWithTintColor:(id)a3
{
  CGColor *v3;
  const CGFloat *Components;
  double v5;
  double v6;
  double v7;

  v3 = (CGColor *)objc_msgSend(objc_retainAutorelease(a3), "CGColor");
  Components = CGColorGetComponents(v3);
  if (CGColorGetNumberOfComponents(v3) == 2)
  {
    v5 = *Components;
    v6 = *Components;
    v7 = *Components;
  }
  else
  {
    v7 = *Components;
    v6 = Components[1];
    v5 = Components[2];
  }
  if ((v6 * 255.0 * 587.0 + v7 * 255.0 * 299.0 + v5 * 255.0 * 114.0) / 1000.0 >= 125.0)
    objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
  else
    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColor, a3);
}

- (UIColor)radioGroupSelectedColor
{
  return self->_radioGroupSelectedColor;
}

- (void)setRadioGroupSelectedColor:(id)a3
{
  objc_storeStrong((id *)&self->_radioGroupSelectedColor, a3);
}

- (UIColor)buttonRowTextColor
{
  return self->_buttonRowTextColor;
}

- (void)setButtonRowTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_buttonRowTextColor, a3);
}

- (UIColor)labelRowTextColor
{
  return self->_labelRowTextColor;
}

- (void)setLabelRowTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_labelRowTextColor, a3);
}

- (UIColor)selectPageDetailTextColor
{
  return self->_selectPageDetailTextColor;
}

- (void)setSelectPageDetailTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_selectPageDetailTextColor, a3);
}

- (UIColor)titleLabelTextColor
{
  return self->_titleLabelTextColor;
}

- (void)setTitleLabelTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabelTextColor, a3);
}

- (UIColor)headerLabelTextColor
{
  return self->_headerLabelTextColor;
}

- (void)setHeaderLabelTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_headerLabelTextColor, a3);
}

- (UIColor)subHeaderLabelTextColor
{
  return self->_subHeaderLabelTextColor;
}

- (void)setSubHeaderLabelTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_subHeaderLabelTextColor, a3);
}

- (UIColor)detailHeaderLabelTextColor
{
  return self->_detailHeaderLabelTextColor;
}

- (void)setDetailHeaderLabelTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_detailHeaderLabelTextColor, a3);
}

- (UIColor)footerLabelTextColor
{
  return self->_footerLabelTextColor;
}

- (void)setFooterLabelTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_footerLabelTextColor, a3);
}

- (UIColor)focusedRowTextColor
{
  return self->_focusedRowTextColor;
}

- (void)setFocusedRowTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_focusedRowTextColor, a3);
}

- (int64_t)labelRowTextAlignment
{
  return self->_labelRowTextAlignment;
}

- (void)setLabelRowTextAlignment:(int64_t)a3
{
  self->_labelRowTextAlignment = a3;
}

- (int64_t)headerLabelAlignment
{
  return self->_headerLabelAlignment;
}

- (void)setHeaderLabelAlignment:(int64_t)a3
{
  self->_headerLabelAlignment = a3;
}

- (int64_t)subHeaderLabelAlignment
{
  return self->_subHeaderLabelAlignment;
}

- (void)setSubHeaderLabelAlignment:(int64_t)a3
{
  self->_subHeaderLabelAlignment = a3;
}

- (int64_t)footerLabelAlignment
{
  return self->_footerLabelAlignment;
}

- (void)setFooterLabelAlignment:(int64_t)a3
{
  self->_footerLabelAlignment = a3;
}

- (int64_t)footerLinkAlignment
{
  return self->_footerLinkAlignment;
}

- (void)setFooterLinkAlignment:(int64_t)a3
{
  self->_footerLinkAlignment = a3;
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (void)setTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_tintColor, a3);
}

- (UIFont)footerFont
{
  return self->_footerFont;
}

- (void)setFooterFont:(id)a3
{
  objc_storeStrong((id *)&self->_footerFont, a3);
}

- (double)subHeaderTopMargin
{
  return self->_subHeaderTopMargin;
}

- (double)sectionSpacing
{
  return self->_sectionSpacing;
}

- (void)setSectionSpacing:(double)a3
{
  self->_sectionSpacing = a3;
}

- (double)headerImagePadding
{
  return self->_headerImagePadding;
}

- (double)footerTopMargin
{
  return self->_footerTopMargin;
}

- (BOOL)useNonOBStyleButton
{
  return self->_useNonOBStyleButton;
}

- (UIEdgeInsets)headerMargin
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_headerMargin.top;
  left = self->_headerMargin.left;
  bottom = self->_headerMargin.bottom;
  right = self->_headerMargin.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (double)multiChoiceStackViewTopAndBottomMargin
{
  return self->_multiChoiceStackViewTopAndBottomMargin;
}

- (void)setMultiChoiceStackViewTopAndBottomMargin:(double)a3
{
  self->_multiChoiceStackViewTopAndBottomMargin = a3;
}

- (double)multiChoiceStackViewElementSpacing
{
  return self->_multiChoiceStackViewElementSpacing;
}

- (void)setMultiChoiceStackViewElementSpacing:(double)a3
{
  self->_multiChoiceStackViewElementSpacing = a3;
}

- (double)headerContainerSideMargin
{
  return self->_headerContainerSideMargin;
}

- (double)sectionHeaderHeight
{
  return self->_sectionHeaderHeight;
}

- (UIColor)spinnerLabelColor
{
  return self->_spinnerLabelColor;
}

- (UIFont)spinnerLabelFont
{
  return self->_spinnerLabelFont;
}

- (UIFont)navBarButtonLabelFont
{
  return self->_navBarButtonLabelFont;
}

- (double)navBarLabelSpacingWithImage
{
  return self->_navBarLabelSpacingWithImage;
}

- (double)minimumHeightOfAdaptiveSheet
{
  return self->_minimumHeightOfAdaptiveSheet;
}

- (void)setMinimumHeightOfAdaptiveSheet:(double)a3
{
  self->_minimumHeightOfAdaptiveSheet = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navBarButtonLabelFont, 0);
  objc_storeStrong((id *)&self->_spinnerLabelFont, 0);
  objc_storeStrong((id *)&self->_spinnerLabelColor, 0);
  objc_storeStrong((id *)&self->_footerFont, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_focusedRowTextColor, 0);
  objc_storeStrong((id *)&self->_footerLabelTextColor, 0);
  objc_storeStrong((id *)&self->_detailHeaderLabelTextColor, 0);
  objc_storeStrong((id *)&self->_subHeaderLabelTextColor, 0);
  objc_storeStrong((id *)&self->_headerLabelTextColor, 0);
  objc_storeStrong((id *)&self->_titleLabelTextColor, 0);
  objc_storeStrong((id *)&self->_selectPageDetailTextColor, 0);
  objc_storeStrong((id *)&self->_labelRowTextColor, 0);
  objc_storeStrong((id *)&self->_buttonRowTextColor, 0);
  objc_storeStrong((id *)&self->_radioGroupSelectedColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

@end
