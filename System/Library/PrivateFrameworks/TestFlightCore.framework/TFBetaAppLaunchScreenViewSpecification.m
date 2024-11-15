@implementation TFBetaAppLaunchScreenViewSpecification

- (TFBetaAppLaunchScreenViewSpecification)initWithTraitCollection:(id)a3
{
  id v4;
  TFBetaAppLaunchScreenViewSpecification *v5;
  TFBetaAppLaunchScreenViewSpecification *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  UIFontMetrics *titleFontMetrics;
  void *v11;
  void *v12;
  uint64_t v13;
  UIFontMetrics *subtitleFontMetrics;
  void *v15;
  void *v16;
  uint64_t v17;
  UIFontMetrics *bodyTitleFontMetrics;
  void *v19;
  void *v20;
  uint64_t v21;
  UIFontMetrics *bodyTextFontMetrics;
  void *v23;
  void *v24;
  uint64_t v25;
  UIFontMetrics *primaryButtonTextFontMetrics;
  uint64_t v27;
  UIFont *titleFont;
  uint64_t v29;
  UIFont *subtitleFont;
  uint64_t v31;
  UIFont *bodyTitleFont;
  uint64_t v33;
  UIFont *bodyTextFont;
  uint64_t v35;
  UIFont *primaryButtonTextFont;
  UIFontMetrics *v37;
  __n128 v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  double v42;
  UIFontMetrics *v43;
  __n128 v44;
  uint64_t v45;
  uint64_t v46;
  double v47;
  __n128 v48;
  uint64_t v49;
  uint64_t v50;
  double v51;
  UIFontMetrics *v52;
  __n128 v53;
  uint64_t v54;
  uint64_t v55;
  double v56;
  UIFontMetrics *v57;
  __n128 v58;
  uint64_t v59;
  uint64_t v60;
  double v61;
  __n128 v62;
  uint64_t v63;
  uint64_t v64;
  double v65;
  __n128 v66;
  uint64_t v67;
  uint64_t v68;
  double v69;
  __n128 v70;
  uint64_t v71;
  double v72;
  uint64_t v73;
  double v74;
  double v75;
  objc_super v77;

  v4 = a3;
  v77.receiver = self;
  v77.super_class = (Class)TFBetaAppLaunchScreenViewSpecification;
  v5 = -[TFBetaAppLaunchScreenViewSpecification init](&v77, sel_init);
  v6 = v5;
  if (v5)
  {
    v7 = (void *)MEMORY[0x24BDF6A80];
    -[TFBetaAppLaunchScreenViewSpecification _titleFontStyle](v5, "_titleFontStyle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "metricsForTextStyle:", v8);
    v9 = objc_claimAutoreleasedReturnValue();
    titleFontMetrics = v6->_titleFontMetrics;
    v6->_titleFontMetrics = (UIFontMetrics *)v9;

    v11 = (void *)MEMORY[0x24BDF6A80];
    -[TFBetaAppLaunchScreenViewSpecification _subtitleFontStyle](v6, "_subtitleFontStyle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "metricsForTextStyle:", v12);
    v13 = objc_claimAutoreleasedReturnValue();
    subtitleFontMetrics = v6->_subtitleFontMetrics;
    v6->_subtitleFontMetrics = (UIFontMetrics *)v13;

    v15 = (void *)MEMORY[0x24BDF6A80];
    -[TFBetaAppLaunchScreenViewSpecification _bodyTitleFontStyle](v6, "_bodyTitleFontStyle");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "metricsForTextStyle:", v16);
    v17 = objc_claimAutoreleasedReturnValue();
    bodyTitleFontMetrics = v6->_bodyTitleFontMetrics;
    v6->_bodyTitleFontMetrics = (UIFontMetrics *)v17;

    v19 = (void *)MEMORY[0x24BDF6A80];
    -[TFBetaAppLaunchScreenViewSpecification _bodyTextFontStyle](v6, "_bodyTextFontStyle");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "metricsForTextStyle:", v20);
    v21 = objc_claimAutoreleasedReturnValue();
    bodyTextFontMetrics = v6->_bodyTextFontMetrics;
    v6->_bodyTextFontMetrics = (UIFontMetrics *)v21;

    v23 = (void *)MEMORY[0x24BDF6A80];
    -[TFBetaAppLaunchScreenViewSpecification _primaryButtonTextFontStyle](v6, "_primaryButtonTextFontStyle");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "metricsForTextStyle:", v24);
    v25 = objc_claimAutoreleasedReturnValue();
    primaryButtonTextFontMetrics = v6->_primaryButtonTextFontMetrics;
    v6->_primaryButtonTextFontMetrics = (UIFontMetrics *)v25;

    -[TFBetaAppLaunchScreenViewSpecification _createTitleFontForTraitCollection:](v6, "_createTitleFontForTraitCollection:", v4);
    v27 = objc_claimAutoreleasedReturnValue();
    titleFont = v6->_titleFont;
    v6->_titleFont = (UIFont *)v27;

    -[TFBetaAppLaunchScreenViewSpecification _createSubtitleFontForTraitCollection:](v6, "_createSubtitleFontForTraitCollection:", v4);
    v29 = objc_claimAutoreleasedReturnValue();
    subtitleFont = v6->_subtitleFont;
    v6->_subtitleFont = (UIFont *)v29;

    -[TFBetaAppLaunchScreenViewSpecification _createBodyTitleFontForTraitCollection:](v6, "_createBodyTitleFontForTraitCollection:", v4);
    v31 = objc_claimAutoreleasedReturnValue();
    bodyTitleFont = v6->_bodyTitleFont;
    v6->_bodyTitleFont = (UIFont *)v31;

    -[TFBetaAppLaunchScreenViewSpecification _createBodyTextFontForTraitCollection:](v6, "_createBodyTextFontForTraitCollection:", v4);
    v33 = objc_claimAutoreleasedReturnValue();
    bodyTextFont = v6->_bodyTextFont;
    v6->_bodyTextFont = (UIFont *)v33;

    -[TFBetaAppLaunchScreenViewSpecification _createPrimaryButtonTextFontForTraitCollection:](v6, "_createPrimaryButtonTextFontForTraitCollection:", v4);
    v35 = objc_claimAutoreleasedReturnValue();
    primaryButtonTextFont = v6->_primaryButtonTextFont;
    v6->_primaryButtonTextFont = (UIFont *)v35;

    v6->_viewTopMarginAdditionalPaddingAsFractionOfTotalHeight = 0.05;
    v37 = v6->_titleFontMetrics;
    v38.n128_u64[0] = 24.0;
    PPMScaledFloatValue(v39, v40, v38);
    v41 = -[UIFontMetrics scaledValueForValue:](v37, "scaledValueForValue:");
    v6->_viewTopMarginToTitleLabelFirstBaseline = v42;
    v43 = v6->_subtitleFontMetrics;
    v44.n128_u64[0] = 0x4044000000000000;
    PPMScaledFloatValue(v41, v45, v44);
    v46 = -[UIFontMetrics scaledValueForValue:](v43, "scaledValueForValue:");
    v6->_titleLabelLastBaselineToSubtitleLabelFirstBaseline = v47;
    v6->_bottommostLabelLastBaselineToLockupTopEdge = 44.0;
    v48.n128_u64[0] = 0x4040000000000000;
    v50 = PPMScaledFloatValue(v46, v49, v48);
    v6->_bottommostLabelLastBaselineToImageTopEdge = v51;
    v52 = v6->_bodyTitleFontMetrics;
    v53.n128_u64[0] = 0x4044000000000000;
    PPMScaledFloatValue(v50, v54, v53);
    v55 = -[UIFontMetrics scaledValueForValue:](v52, "scaledValueForValue:");
    v6->_lockupBottomEdgeToBodyTitleLabelFirstBaseline = v56;
    v57 = v6->_bodyTextFontMetrics;
    v58.n128_u64[0] = 28.0;
    PPMScaledFloatValue(v55, v59, v58);
    v60 = -[UIFontMetrics scaledValueForValue:](v57, "scaledValueForValue:");
    v6->_bodyTitleLabelLastBaselineToBodyTextLabelFirstBaseline = v61;
    v62.n128_u64[0] = 20.0;
    v64 = PPMScaledFloatValue(v60, v63, v62);
    v6->_buttonBackgroundTopEdgeToPrimaryButtonTopEdge = v65;
    v66.n128_u64[0] = 0x4049000000000000;
    v68 = PPMScaledFloatValue(v64, v67, v66);
    v6->_buttonHeight = v69;
    v70.n128_u64[0] = 8.0;
    PPMScaledFloatValue(v68, v71, v70);
    v6->_interButtonPadding = v72;
    v73 = objc_msgSend(v4, "horizontalSizeClass");
    v6->_scrollViewContentLayoutInsets.top = 0.0;
    v74 = 34.0;
    if (v73 == 2)
      v74 = 140.0;
    v75 = 130.0;
    v6->_scrollViewContentLayoutInsets.left = v74;
    if (v73 != 2)
      v75 = 24.0;
    v6->_scrollViewContentLayoutInsets.bottom = 0.0;
    v6->_scrollViewContentLayoutInsets.right = v74;
    v6->_buttonModuleContentLayoutInsets.top = 0.0;
    v6->_buttonModuleContentLayoutInsets.left = v75;
    v6->_buttonModuleContentLayoutInsets.bottom = 10.0;
    v6->_buttonModuleContentLayoutInsets.right = v75;
  }

  return v6;
}

- (double)primaryButtonCornerRadius
{
  __n128 v2;
  double result;

  v2.n128_u64[0] = 15.0;
  PPMScaledFloatValue(self, a2, v2);
  return result;
}

- (CGSize)headerIconViewSize
{
  __n128 v2;
  double v3;
  double v4;
  CGSize result;

  v2.n128_u64[0] = 0x4044000000000000;
  PPMScaledFloatValue(self, a2, v2);
  result.height = v4;
  result.width = v3;
  return result;
}

- (id)_createTitleFontForTraitCollection:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x24BDF6A78];
  v5 = a3;
  -[TFBetaAppLaunchScreenViewSpecification _titleFontStyle](self, "_titleFontStyle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tf_systemFontWithTextStyle:weight:forTraitCollection:", v6, v5, *MEMORY[0x24BDF7868]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_titleFontStyle
{
  return (id)*MEMORY[0x24BDF7848];
}

- (id)_createSubtitleFontForTraitCollection:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x24BDF6A78];
  v5 = a3;
  -[TFBetaAppLaunchScreenViewSpecification _subtitleFontStyle](self, "_subtitleFontStyle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tf_systemFontWithTextStyle:weight:forTraitCollection:", v6, v5, *MEMORY[0x24BDF7888]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_subtitleFontStyle
{
  return (id)*MEMORY[0x24BDF77B0];
}

- (id)_createBodyTitleFontForTraitCollection:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x24BDF6A78];
  v5 = a3;
  -[TFBetaAppLaunchScreenViewSpecification _bodyTitleFontStyle](self, "_bodyTitleFontStyle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tf_systemFontWithTextStyle:weight:forTraitCollection:", v6, v5, *MEMORY[0x24BDF7890]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_bodyTitleFontStyle
{
  return (id)*MEMORY[0x24BDF77B0];
}

- (id)_createBodyTextFontForTraitCollection:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x24BDF6A78];
  v5 = a3;
  -[TFBetaAppLaunchScreenViewSpecification _bodyTextFontStyle](self, "_bodyTextFontStyle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tf_systemFontWithTextStyle:weight:forTraitCollection:", v6, v5, *MEMORY[0x24BDF7888]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_bodyTextFontStyle
{
  return (id)*MEMORY[0x24BDF7810];
}

- (id)_createPrimaryButtonTextFontForTraitCollection:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x24BDF6A78];
  v5 = a3;
  -[TFBetaAppLaunchScreenViewSpecification _primaryButtonTextFontStyle](self, "_primaryButtonTextFontStyle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tf_systemFontWithTextStyle:weight:forTraitCollection:", v6, v5, *MEMORY[0x24BDF7888]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_primaryButtonTextFontStyle
{
  return (id)*MEMORY[0x24BDF7858];
}

- (UIColor)backgroundColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x24BDF6950], "systemBackgroundColor");
}

- (UIColor)buttonTintColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x24BDF6950], "systemBlueColor");
}

- (UIColor)overButtonTintTextColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
}

- (UIColor)textColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
}

- (UIEdgeInsets)scrollViewContentLayoutInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_scrollViewContentLayoutInsets.top;
  left = self->_scrollViewContentLayoutInsets.left;
  bottom = self->_scrollViewContentLayoutInsets.bottom;
  right = self->_scrollViewContentLayoutInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (double)viewTopMarginAdditionalPaddingAsFractionOfTotalHeight
{
  return self->_viewTopMarginAdditionalPaddingAsFractionOfTotalHeight;
}

- (double)bottommostLabelLastBaselineToLockupTopEdge
{
  return self->_bottommostLabelLastBaselineToLockupTopEdge;
}

- (double)bottommostLabelLastBaselineToImageTopEdge
{
  return self->_bottommostLabelLastBaselineToImageTopEdge;
}

- (UIEdgeInsets)buttonModuleContentLayoutInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_buttonModuleContentLayoutInsets.top;
  left = self->_buttonModuleContentLayoutInsets.left;
  bottom = self->_buttonModuleContentLayoutInsets.bottom;
  right = self->_buttonModuleContentLayoutInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (double)buttonBackgroundTopEdgeToPrimaryButtonTopEdge
{
  return self->_buttonBackgroundTopEdgeToPrimaryButtonTopEdge;
}

- (double)buttonHeight
{
  return self->_buttonHeight;
}

- (double)interButtonPadding
{
  return self->_interButtonPadding;
}

- (double)viewTopMarginToTitleLabelFirstBaseline
{
  return self->_viewTopMarginToTitleLabelFirstBaseline;
}

- (double)titleLabelLastBaselineToSubtitleLabelFirstBaseline
{
  return self->_titleLabelLastBaselineToSubtitleLabelFirstBaseline;
}

- (double)lockupBottomEdgeToBodyTitleLabelFirstBaseline
{
  return self->_lockupBottomEdgeToBodyTitleLabelFirstBaseline;
}

- (double)bodyTitleLabelLastBaselineToBodyTextLabelFirstBaseline
{
  return self->_bodyTitleLabelLastBaselineToBodyTextLabelFirstBaseline;
}

- (UIFont)titleFont
{
  return self->_titleFont;
}

- (UIFont)subtitleFont
{
  return self->_subtitleFont;
}

- (UIFont)bodyTitleFont
{
  return self->_bodyTitleFont;
}

- (UIFont)bodyTextFont
{
  return self->_bodyTextFont;
}

- (UIFont)primaryButtonTextFont
{
  return self->_primaryButtonTextFont;
}

- (UIFontMetrics)titleFontMetrics
{
  return self->_titleFontMetrics;
}

- (UIFontMetrics)subtitleFontMetrics
{
  return self->_subtitleFontMetrics;
}

- (UIFontMetrics)bodyTitleFontMetrics
{
  return self->_bodyTitleFontMetrics;
}

- (UIFontMetrics)bodyTextFontMetrics
{
  return self->_bodyTextFontMetrics;
}

- (UIFontMetrics)primaryButtonTextFontMetrics
{
  return self->_primaryButtonTextFontMetrics;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primaryButtonTextFontMetrics, 0);
  objc_storeStrong((id *)&self->_bodyTextFontMetrics, 0);
  objc_storeStrong((id *)&self->_bodyTitleFontMetrics, 0);
  objc_storeStrong((id *)&self->_subtitleFontMetrics, 0);
  objc_storeStrong((id *)&self->_titleFontMetrics, 0);
  objc_storeStrong((id *)&self->_primaryButtonTextFont, 0);
  objc_storeStrong((id *)&self->_bodyTextFont, 0);
  objc_storeStrong((id *)&self->_bodyTitleFont, 0);
  objc_storeStrong((id *)&self->_subtitleFont, 0);
  objc_storeStrong((id *)&self->_titleFont, 0);
}

@end
