@implementation THNoteCardContentLayer

- (id)p_commonInit:(BOOL)a3 darkMode:(BOOL)a4
{
  THNoteCardContentLayer *v6;
  THNoteCardContentLayer *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)THNoteCardContentLayer;
  v6 = -[THNoteCardContentLayer init](&v9, "init");
  v7 = v6;
  if (v6)
  {
    -[THNoteCardContentLayer setFrame:](v6, "setFrame:", TSDRectWithSize(v6));
    v7->_isBackLayer = a3;
    v7->_darkMode = a4;
    -[THNoteCardContentLayer p_setupBackground](v7, "p_setupBackground");
    -[THNoteCardContentLayer p_setupBorder](v7, "p_setupBorder");
    -[THNoteCardContentLayer p_setupBodyScrollLayer](v7, "p_setupBodyScrollLayer");
    -[THNoteCardContentLayer p_setupTitleLabel](v7, "p_setupTitleLabel");
    -[THNoteCardContentLayer p_setupPageNumberLabel](v7, "p_setupPageNumberLabel");
    -[THNoteCardContentLayer p_setupCardNumberLabel](v7, "p_setupCardNumberLabel");
    -[THNoteCardContentLayer p_setupFlipLabel](v7, "p_setupFlipLabel");
    -[THNoteCardContentLayer p_setupColorBar](v7, "p_setupColorBar");
  }
  return v7;
}

- (id)initFrontContentLayerWithDarkMode:(BOOL)a3
{
  return -[THNoteCardContentLayer p_commonInit:darkMode:](self, "p_commonInit:darkMode:", 0, a3);
}

- (id)initBackContentLayerWithDarkMode:(BOOL)a3
{
  return -[THNoteCardContentLayer p_commonInit:darkMode:](self, "p_commonInit:darkMode:", 1, a3);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THNoteCardContentLayer;
  -[THNoteCardContentLayer dealloc](&v3, "dealloc");
}

- (void)reset
{
  -[THNoteCardBodyLayer reset](self->_bodyLayer, "reset");
}

- (void)clearContents
{
  -[THNoteCardContentLayer setBodyLayer:](self, "setBodyLayer:", 0);
  -[THMultiLineLabel setText:](self->_titleLabel, "setText:", &stru_43D7D8);
  -[THMultiLineLabel setText:](self->_pageNumberLabel, "setText:", &stru_43D7D8);
  -[THMultiLineLabel setHidden:](self->_flipLabel, "setHidden:", 1);
  -[THMultiLineLabel setText:](self->_cardNumberLabel, "setText:", &stru_43D7D8);
  -[CALayer setBackgroundColor:](self->_colorBarLayer, "setBackgroundColor:", 0);
}

- (void)setBodyLayer:(id)a3
{
  THNoteCardBodyLayer *bodyLayer;
  THNoteCardBodyLayer *v6;

  bodyLayer = self->_bodyLayer;
  if (bodyLayer != a3)
  {

    v6 = (THNoteCardBodyLayer *)a3;
    self->_bodyLayer = v6;
    -[THNoteCardBodyLayer setLayoutContext:](v6, "setLayoutContext:", self->_layoutContext);
    -[THInteractiveScrollLayer setContentLayer:](self->_bodyScrollLayer, "setContentLayer:", self->_bodyLayer);
    -[THNoteCardContentLayer setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setTitle:(id)a3
{
  -[THMultiLineLabel setText:](self->_titleLabel, "setText:", a3);
  -[THNoteCardContentLayer setNeedsLayout](self, "setNeedsLayout");
}

- (void)setCardNumberString:(id)a3
{
  -[THMultiLineLabel setText:](self->_cardNumberLabel, "setText:", a3);
  -[THNoteCardContentLayer setNeedsLayout](self, "setNeedsLayout");
}

- (void)setPageNumber:(id)a3
{
  -[THMultiLineLabel setText:](self->_pageNumberLabel, "setText:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("page %@"), &stru_43D7D8, 0), a3));
  -[THNoteCardContentLayer setNeedsLayout](self, "setNeedsLayout");
}

- (CGRect)pageNumberLabelFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[THNoteCardContentLayer layoutIfNeeded](self, "layoutIfNeeded");
  -[THMultiLineLabel frame](self->_pageNumberLabel, "frame");
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void)setPageNumberHovered:(BOOL)a3
{
  self->_pageNumberHovered = a3;
  -[THNoteCardContentLayer p_updatePageNumberDisplay](self, "p_updatePageNumberDisplay");
}

- (void)setPageNumberPressed:(BOOL)a3
{
  self->_pageNumberPressed = a3;
  -[THNoteCardContentLayer p_updatePageNumberDisplay](self, "p_updatePageNumberDisplay");
}

- (void)setFlipAffordanceHovered:(BOOL)a3
{
  self->_flipAffordanceHovered = a3;
  -[THNoteCardContentLayer p_updateFlipAffordanceDisplay](self, "p_updateFlipAffordanceDisplay");
}

- (void)setFlipAffordancePressed:(BOOL)a3
{
  self->_flipAffordancePressed = a3;
  -[THNoteCardContentLayer p_updateFlipAffordanceDisplay](self, "p_updateFlipAffordanceDisplay");
}

- (void)setColorBarColor:(CGColor *)a3
{
  -[CALayer setBackgroundColor:](self->_colorBarLayer, "setBackgroundColor:", a3);
}

- (void)setShowFlipGlyph:(BOOL)a3
{
  -[THMultiLineLabel setHidden:](self->_flipLabel, "setHidden:", !a3);
}

- (BOOL)hasBody
{
  return self->_bodyLayer != 0;
}

- (CGRect)flipGlyphFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[THNoteCardContentLayer layoutIfNeeded](self, "layoutIfNeeded");
  -[THMultiLineLabel frame](self->_flipLabel, "frame");
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void)setLayoutContext:(id)a3
{
  THNoteCardLayoutContext *layoutContext;
  double v6;

  layoutContext = self->_layoutContext;
  if (layoutContext != a3)
  {

    self->_layoutContext = (THNoteCardLayoutContext *)a3;
    -[THNoteCardBodyLayer setLayoutContext:](self->_bodyLayer, "setLayoutContext:", a3);
    -[THNoteCardLayoutContext noteCardShadowOpacity](self->_layoutContext, "noteCardShadowOpacity");
    *(float *)&v6 = v6;
    -[CALayer setShadowOpacity:](self->_backgroundLayer, "setShadowOpacity:", v6);
    -[THNoteCardContentLayer p_shadowOffsetForCurrentScreenScale](self, "p_shadowOffsetForCurrentScreenScale");
    -[CALayer setShadowOffset:](self->_backgroundLayer, "setShadowOffset:");
    -[THNoteCardContentLayer p_shadowRadiusForCurrentScreenScale](self, "p_shadowRadiusForCurrentScreenScale");
    -[CALayer setShadowRadius:](self->_backgroundLayer, "setShadowRadius:");
    objc_msgSend(a3, "textScale");
    -[THMultiLineLabel setScale:](self->_titleLabel, "setScale:");
    objc_msgSend(a3, "textScale");
    -[THMultiLineLabel setScale:](self->_pageNumberLabel, "setScale:");
    objc_msgSend(a3, "textScale");
    -[THMultiLineLabel setScale:](self->_cardNumberLabel, "setScale:");
    objc_msgSend(a3, "textScale");
    -[THMultiLineLabel setScale:](self->_flipLabel, "setScale:");
    -[THNoteCardContentLayer setNeedsLayout](self, "setNeedsLayout");
  }
}

- (NSArray)interactiveLayers
{
  NSMutableArray *v3;
  NSArray *v4;

  -[THNoteCardContentLayer layoutIfNeeded](self, "layoutIfNeeded");
  v3 = +[NSMutableArray arrayWithObjects:](NSMutableArray, "arrayWithObjects:", self->_bodyScrollLayer, 0);
  v4 = -[THNoteCardBodyLayer interactiveLayers](self->_bodyLayer, "interactiveLayers");
  if (v4)
    -[NSMutableArray addObjectsFromArray:](v3, "addObjectsFromArray:", v4);
  return &v3->super;
}

- (void)setDisplayAttributes:(_THNoteCardDisplayAttributes)a3 animated:(BOOL)a4 duration:(double)a5
{
  _BOOL4 v6;
  unint64_t v7;
  TSUColor *v9;
  TSUColor *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  CABasicAnimation *v15;
  CABasicAnimation *v16;
  id v17;
  CABasicAnimation *v18;

  v6 = a4;
  v7 = *(_QWORD *)&a3.drawBorder;
  if (!self->_backgroundLayer)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNoteCardContentLayer setDisplayAttributes:animated:duration:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNoteCardContentLayer.mm"), 245, CFSTR("invalid nil value for '%s'"), "_backgroundLayer");
  if (!self->_borderLayer)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNoteCardContentLayer setDisplayAttributes:animated:duration:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNoteCardContentLayer.mm"), 246, CFSTR("invalid nil value for '%s'"), "_borderLayer");
  v9 = THNoteCardBackgroundColor(-[THNoteCardContentLayer darkMode](self, "darkMode"));
  if ((v7 & 0x1000000) != 0)
    v9 = THNoteDarkenBackgroundColor(-[THNoteCardContentLayer darkMode](self, "darkMode"));
  v10 = v9;
  -[THNoteCardContentLayer setShowFlipGlyph:](self, "setShowFlipGlyph:", (v7 >> 16) & 1);
  if ((v7 & 0x100000000) != 0)
    v10 = THNoteDarkerBackgroundColor(-[THNoteCardContentLayer darkMode](self, "darkMode"));
  if ((v7 & 1) != 0)
    v11 = -[THNoteCardContentLayer p_borderColorForCurrentScreenScale](self, "p_borderColorForCurrentScreenScale");
  else
    v11 = +[TSUColor clearColor](TSUColor, "clearColor");
  v12 = v11;
  if ((v7 & 0x100) != 0)
    v13 = +[TSUColor blackColor](TSUColor, "blackColor");
  else
    v13 = +[TSUColor clearColor](TSUColor, "clearColor");
  v14 = v13;
  if (v6)
  {
    v15 = +[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("backgroundColor"));
    -[CABasicAnimation setFromValue:](v15, "setFromValue:", -[CALayer backgroundColor](self->_backgroundLayer, "backgroundColor"));
    -[CABasicAnimation setToValue:](v15, "setToValue:", -[TSUColor CGColor](v10, "CGColor"));
    v16 = +[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("shadowColor"));
    -[CABasicAnimation setFromValue:](v16, "setFromValue:", -[CALayer shadowColor](self->_backgroundLayer, "shadowColor"));
    -[CABasicAnimation setToValue:](v16, "setToValue:", objc_msgSend(v14, "CGColor"));
    v17 = +[CAAnimationGroup animation](CAAnimationGroup, "animation");
    objc_msgSend(v17, "setAnimations:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v15, v16, 0));
    objc_msgSend(v17, "setDuration:", a5);
    -[CALayer addAnimation:forKey:](self->_backgroundLayer, "addAnimation:forKey:", v17, CFSTR("displayAttributes"));
    v18 = +[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("borderColor"));
    -[CABasicAnimation setFromValue:](v18, "setFromValue:", -[CALayer borderColor](self->_borderLayer, "borderColor"));
    -[CABasicAnimation setToValue:](v18, "setToValue:", objc_msgSend(v12, "CGColor"));
    -[CABasicAnimation setDuration:](v18, "setDuration:", a5);
    -[CALayer addAnimation:forKey:](self->_borderLayer, "addAnimation:forKey:", v18, CFSTR("displayAttributes"));
  }
  -[CALayer setBackgroundColor:](self->_backgroundLayer, "setBackgroundColor:", -[TSUColor CGColor](v10, "CGColor"));
  -[CALayer setShadowColor:](self->_backgroundLayer, "setShadowColor:", objc_msgSend(v14, "CGColor"));
  -[CALayer setBorderColor:](self->_borderLayer, "setBorderColor:", objc_msgSend(v12, "CGColor"));
  *(_WORD *)&self->_displayAttributes.drawBorder = v7;
  self->_displayAttributes.drawFlipGlyph = BYTE2(v7);
  self->_displayAttributes.darkenBackground = BYTE3(v7);
  self->_displayAttributes.useDarkerBackground = BYTE4(v7);
}

- (void)setDarkMode:(BOOL)a3
{
  if (self->_darkMode != a3)
  {
    self->_darkMode = a3;
    -[THNoteCardContentLayer setDisplayAttributes:animated:duration:](self, "setDisplayAttributes:animated:duration:", *(unsigned int *)&self->_displayAttributes.drawBorder | ((unint64_t)self->_displayAttributes.useDarkerBackground << 32), 0, 0.0);
    -[THMultiLineLabel setTextColor:](self->_titleLabel, "setTextColor:", THNoteCardHeaderColor(-[THNoteCardContentLayer darkMode](self, "darkMode")));
    -[THMultiLineLabel setTextColor:](self->_pageNumberLabel, "setTextColor:", THNoteCardHeaderColor(-[THNoteCardContentLayer darkMode](self, "darkMode")));
    -[THMultiLineLabel setTextColor:](self->_cardNumberLabel, "setTextColor:", THNoteCardFooterColor(-[THNoteCardContentLayer darkMode](self, "darkMode")));
    -[THNoteCardContentLayer p_updateFlipAffordanceDisplay](self, "p_updateFlipAffordanceDisplay");
  }
}

- (void)layoutSublayers
{
  UIUserInterfaceLayoutDirection v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  unsigned int v20;
  THNoteCardLayoutContext *layoutContext;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  CGFloat v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  CGFloat v64;
  double v65;
  CGFloat v66;
  double v67;
  CGFloat v68;
  double v69;
  CGFloat v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  THNoteCardLayoutContext *v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  CGFloat v84;
  CGFloat v85;
  CGFloat v86;
  double MinY;
  CGFloat v88;
  double MaxY;
  double v90;
  CGFloat recta;
  double v92;
  double v93;
  CGFloat v94;
  CGFloat v95;
  CGFloat v96;
  objc_super v97;
  CGRect v98;
  CGRect v99;
  CGRect v100;
  CGRect v101;
  CGRect v102;
  CGRect v103;
  CGRect v104;
  CGRect v105;
  CGRect v106;
  CGRect v107;
  CGRect v108;
  CGRect v109;
  CGRect v110;
  CGRect v111;
  CGRect v112;

  v97.receiver = self;
  v97.super_class = (Class)THNoteCardContentLayer;
  -[THNoteCardContentLayer layoutSublayers](&v97, "layoutSublayers");
  v3 = -[UIApplication userInterfaceLayoutDirection](+[UIApplication sharedApplication](UIApplication, "sharedApplication"), "userInterfaceLayoutDirection");
  -[THNoteCardContentLayer bounds](self, "bounds");
  v5 = v4;
  v7 = v6;
  -[CALayer setFrame:](self->_borderLayer, "setFrame:");
  -[CALayer frame](self->_borderLayer, "frame");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  -[CALayer borderWidth](self->_borderLayer, "borderWidth");
  v17 = v16;
  -[CALayer borderWidth](self->_borderLayer, "borderWidth");
  v19 = v18;
  v98.origin.x = v9;
  v98.origin.y = v11;
  v98.size.width = v13;
  v98.size.height = v15;
  v99 = CGRectInset(v98, v17, v19);
  -[CALayer setFrame:](self->_backgroundLayer, "setFrame:", v99.origin.x, v99.origin.y, v99.size.width, v99.size.height);
  -[CALayer bounds](self->_backgroundLayer, "bounds");
  -[CALayer setShadowPath:](self->_backgroundLayer, "setShadowPath:", -[TSDBezierPath CGPath](+[TSDBezierPath bezierPathWithRect:](TSDBezierPath, "bezierPathWithRect:"), "CGPath"));
  v20 = -[THNoteCardBodyLayer shouldForceCentered](self->_bodyLayer, "shouldForceCentered");
  layoutContext = self->_layoutContext;
  if (v20)
  {
    -[THNoteCardLayoutContext noteCardBodyWidth](layoutContext, "noteCardBodyWidth");
    -[THNoteCardLayoutContext noteCardBodyHeight](self->_layoutContext, "noteCardBodyHeight");
  }
  else
  {
    -[THNoteCardLayoutContext noteCardBodyLeftMargin](layoutContext, "noteCardBodyLeftMargin");
    -[THNoteCardLayoutContext noteCardBodyTopMargin](self->_layoutContext, "noteCardBodyTopMargin");
  }
  -[THNoteCardLayoutContext noteCardBodyWidth](self->_layoutContext, "noteCardBodyWidth");
  -[THInteractiveScrollLayer setFrame:](self->_bodyScrollLayer, "setFrame:", TSDRoundedRect(-[THNoteCardLayoutContext noteCardBodyHeight](self->_layoutContext, "noteCardBodyHeight")));
  -[THInteractiveScrollLayer bounds](self->_bodyScrollLayer, "bounds");
  -[THNoteCardBodyLayer setFrame:](self->_bodyLayer, "setFrame:");
  -[THNoteCardBodyLayer sizeToFit](self->_bodyLayer, "sizeToFit");
  -[THMultiLineLabel resizeToFitTightly](self->_pageNumberLabel, "resizeToFitTightly");
  if (v3 == UIUserInterfaceLayoutDirectionRightToLeft)
  {
    -[THNoteCardLayoutContext noteCardRightMargin](self->_layoutContext, "noteCardRightMargin");
    v23 = v22;
  }
  else
  {
    -[THMultiLineLabel bounds](self->_pageNumberLabel, "bounds");
    v25 = v5 - v24;
    -[THNoteCardLayoutContext noteCardRightMargin](self->_layoutContext, "noteCardRightMargin");
    v23 = v25 - v26;
  }
  -[THNoteCardLayoutContext noteCardHeaderBaselineOffset](self->_layoutContext, "noteCardHeaderBaselineOffset");
  v28 = v27;
  -[THMultiLineLabel firstLineAscent](self->_pageNumberLabel, "firstLineAscent");
  -[THMultiLineLabel setPosition:](self->_pageNumberLabel, "setPosition:", v23, v28 - v29);
  -[THMultiLineLabel frame](self->_pageNumberLabel, "frame");
  v101 = CGRectIntegral(v100);
  -[THMultiLineLabel setFrame:](self->_pageNumberLabel, "setFrame:", v101.origin.x, v101.origin.y, v101.size.width, v101.size.height);
  -[THMultiLineLabel resizeToFitTightly](self->_titleLabel, "resizeToFitTightly");
  -[THMultiLineLabel frame](self->_titleLabel, "frame");
  v31 = v30;
  v33 = v32;
  -[THMultiLineLabel bounds](self->_pageNumberLabel, "bounds");
  v35 = v5 - v34;
  -[THNoteCardLayoutContext noteCardLeftMargin](self->_layoutContext, "noteCardLeftMargin");
  v37 = v35 - v36;
  -[THNoteCardLayoutContext noteCardRightMargin](self->_layoutContext, "noteCardRightMargin");
  v39 = v37 - v38;
  -[THNoteCardLayoutContext noteCardSectionTitlePaddingToPageNumber](self->_layoutContext, "noteCardSectionTitlePaddingToPageNumber");
  v41 = v39 - v40;
  if (v31 >= v41)
    v31 = v41;
  -[THNoteCardLayoutContext noteCardLeftMargin](self->_layoutContext, "noteCardLeftMargin");
  if (v3 == UIUserInterfaceLayoutDirectionRightToLeft)
    v43 = v5 - v31 - v42;
  else
    v43 = v42;
  -[THNoteCardLayoutContext noteCardHeaderBaselineOffset](self->_layoutContext, "noteCardHeaderBaselineOffset");
  v45 = v44;
  -[THMultiLineLabel firstLineAscent](self->_titleLabel, "firstLineAscent");
  v102.origin.y = v45 - v46;
  v102.origin.x = v43;
  v102.size.width = v31;
  v102.size.height = v33;
  v103 = CGRectIntegral(v102);
  -[THMultiLineLabel setFrame:](self->_titleLabel, "setFrame:", v103.origin.x, v103.origin.y, v103.size.width, v103.size.height);
  -[THMultiLineLabel resizeToFitTightly](self->_cardNumberLabel, "resizeToFitTightly");
  if (v3 == UIUserInterfaceLayoutDirectionRightToLeft)
  {
    -[THMultiLineLabel bounds](self->_cardNumberLabel, "bounds");
    v48 = v5 - v47;
    -[THNoteCardLayoutContext noteCardLeftMargin](self->_layoutContext, "noteCardLeftMargin");
    v50 = v48 - v49;
  }
  else
  {
    -[THNoteCardLayoutContext noteCardLeftMargin](self->_layoutContext, "noteCardLeftMargin");
    v50 = v51;
  }
  -[THNoteCardLayoutContext noteCardFooterBaselineOffset](self->_layoutContext, "noteCardFooterBaselineOffset");
  v53 = v7 - v52;
  -[THMultiLineLabel firstLineAscent](self->_cardNumberLabel, "firstLineAscent");
  -[THMultiLineLabel setPosition:](self->_cardNumberLabel, "setPosition:", v50, v53 - v54);
  -[THMultiLineLabel frame](self->_cardNumberLabel, "frame");
  v105 = CGRectIntegral(v104);
  -[THMultiLineLabel setFrame:](self->_cardNumberLabel, "setFrame:", v105.origin.x, v105.origin.y, v105.size.width, v105.size.height);
  -[THMultiLineLabel resizeToFitTightly](self->_flipLabel, "resizeToFitTightly");
  if (v3 == UIUserInterfaceLayoutDirectionRightToLeft)
  {
    -[THNoteCardLayoutContext noteCardLeftMargin](self->_layoutContext, "noteCardLeftMargin");
    v56 = v55;
  }
  else
  {
    -[THMultiLineLabel bounds](self->_flipLabel, "bounds");
    v58 = v5 - v57;
    -[THNoteCardLayoutContext noteCardLeftMargin](self->_layoutContext, "noteCardLeftMargin");
    v56 = v58 - v59;
  }
  -[THNoteCardLayoutContext noteCardFooterBaselineOffset](self->_layoutContext, "noteCardFooterBaselineOffset");
  v61 = v7 - v60;
  -[THMultiLineLabel firstLineAscent](self->_flipLabel, "firstLineAscent");
  -[THMultiLineLabel setPosition:](self->_flipLabel, "setPosition:", v56, v61 - v62);
  -[THMultiLineLabel frame](self->_flipLabel, "frame");
  v107 = CGRectIntegral(v106);
  -[THMultiLineLabel setFrame:](self->_flipLabel, "setFrame:", v107.origin.x, v107.origin.y, v107.size.width, v107.size.height);
  -[THNoteCardBodyLayer contentFrame](self->_bodyLayer, "contentFrame");
  -[THNoteCardContentLayer convertRect:fromLayer:](self, "convertRect:fromLayer:", self->_bodyLayer);
  v64 = v63;
  v66 = v65;
  v68 = v67;
  v70 = v69;
  -[THInteractiveScrollLayer frame](self->_bodyScrollLayer, "frame");
  v95 = v72;
  v96 = v71;
  v94 = v73;
  v75 = v74;
  -[THNoteCardLayoutContext noteCardColorBarPaddingFromScrollBottom](self->_layoutContext, "noteCardColorBarPaddingFromScrollBottom");
  v77 = v76;
  v78 = self->_layoutContext;
  if (v3 == UIUserInterfaceLayoutDirectionRightToLeft)
  {
    -[THNoteCardLayoutContext noteCardColorBarWidth](v78, "noteCardColorBarWidth");
    v80 = v5 - v79;
    -[THNoteCardLayoutContext noteCardLeftMargin](self->_layoutContext, "noteCardLeftMargin");
    v82 = v80 - v81;
  }
  else
  {
    -[THNoteCardLayoutContext noteCardLeftMargin](v78, "noteCardLeftMargin");
  }
  v93 = v82;
  -[THNoteCardLayoutContext noteCardColorBarWidth](self->_layoutContext, "noteCardColorBarWidth");
  v92 = v83;
  v108.origin.x = v64;
  v108.origin.y = v66;
  v108.size.width = v68;
  v108.size.height = v70;
  recta = v70;
  v84 = v68;
  v85 = v66;
  v86 = v64;
  MinY = CGRectGetMinY(v108);
  v109.origin.x = v96;
  v109.origin.y = v95;
  v109.size.width = v94;
  v109.size.height = v75 - v77;
  v88 = fmax(MinY, CGRectGetMinY(v109));
  v110.origin.x = v86;
  v110.origin.y = v85;
  v110.size.width = v84;
  v110.size.height = recta;
  MaxY = CGRectGetMaxY(v110);
  v111.origin.x = v96;
  v111.origin.y = v95;
  v111.size.width = v94;
  v111.size.height = v75 - v77;
  v90 = fmin(MaxY, CGRectGetMaxY(v111));
  v112.size.height = 0.0;
  v112.origin.x = v93;
  v112.origin.y = v88;
  v112.size.width = v92;
  -[CALayer setFrame:](self->_colorBarLayer, "setFrame:", v93, v88, v92, v90 - CGRectGetMinY(v112));
}

- (void)setContentsScale:(double)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)THNoteCardContentLayer;
  -[THNoteCardContentLayer setContentsScale:](&v4, "setContentsScale:", a3);
  -[THNoteCardContentLayer p_borderWidthForCurrentScreenScale](self, "p_borderWidthForCurrentScreenScale");
  -[CALayer setBorderWidth:](self->_borderLayer, "setBorderWidth:");
  if (self->_displayAttributes.drawBorder)
    -[CALayer setBorderColor:](self->_borderLayer, "setBorderColor:", objc_msgSend(-[THNoteCardContentLayer p_borderColorForCurrentScreenScale](self, "p_borderColorForCurrentScreenScale"), "CGColor"));
  -[THNoteCardContentLayer p_shadowOffsetForCurrentScreenScale](self, "p_shadowOffsetForCurrentScreenScale");
  -[CALayer setShadowOffset:](self->_backgroundLayer, "setShadowOffset:");
  -[THNoteCardContentLayer p_shadowRadiusForCurrentScreenScale](self, "p_shadowRadiusForCurrentScreenScale");
  -[CALayer setShadowRadius:](self->_backgroundLayer, "setShadowRadius:");
  -[THNoteCardContentLayer setNeedsLayout](self, "setNeedsLayout");
}

- (void)p_setupBackground
{
  double v3;

  if (!self->_backgroundLayer
    || (objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNoteCardContentLayer p_setupBackground]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNoteCardContentLayer.mm"), 456, CFSTR("expected nil value for '%s'"), "_backgroundLayer"), !self->_backgroundLayer))
  {
    self->_backgroundLayer = (CALayer *)objc_alloc_init((Class)TSDNoDefaultImplicitActionLayer);
    -[CALayer setBackgroundColor:](self->_backgroundLayer, "setBackgroundColor:", -[TSUColor CGColor](THNoteCardBackgroundColor(-[THNoteCardContentLayer darkMode](self, "darkMode")), "CGColor"));
    -[CALayer setShadowColor:](self->_backgroundLayer, "setShadowColor:", objc_msgSend(+[TSUColor blackColor](TSUColor, "blackColor"), "CGColor"));
    -[THNoteCardLayoutContext noteCardShadowOpacity](self->_layoutContext, "noteCardShadowOpacity");
    *(float *)&v3 = v3;
    -[CALayer setShadowOpacity:](self->_backgroundLayer, "setShadowOpacity:", v3);
    -[THNoteCardContentLayer p_shadowOffsetForCurrentScreenScale](self, "p_shadowOffsetForCurrentScreenScale");
    -[CALayer setShadowOffset:](self->_backgroundLayer, "setShadowOffset:");
    -[THNoteCardContentLayer p_shadowRadiusForCurrentScreenScale](self, "p_shadowRadiusForCurrentScreenScale");
    -[CALayer setShadowRadius:](self->_backgroundLayer, "setShadowRadius:");
    -[THNoteCardContentLayer addSublayer:](self, "addSublayer:", self->_backgroundLayer);
    -[THNoteCardContentLayer setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)p_setupBorder
{
  if (!self->_borderLayer
    || (objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNoteCardContentLayer p_setupBorder]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNoteCardContentLayer.mm"), 475, CFSTR("expected nil value for '%s'"), "_borderLayer"), !self->_borderLayer))
  {
    self->_borderLayer = (CALayer *)objc_alloc_init((Class)TSDNoDefaultImplicitActionLayer);
    -[THNoteCardContentLayer p_borderWidthForCurrentScreenScale](self, "p_borderWidthForCurrentScreenScale");
    -[CALayer setBorderWidth:](self->_borderLayer, "setBorderWidth:");
    -[CALayer setBorderColor:](self->_borderLayer, "setBorderColor:", objc_msgSend(-[THNoteCardContentLayer p_borderColorForCurrentScreenScale](self, "p_borderColorForCurrentScreenScale"), "CGColor"));
    -[THNoteCardContentLayer addSublayer:](self, "addSublayer:", self->_borderLayer);
    -[THNoteCardContentLayer setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)p_setupBodyScrollLayer
{
  THInteractiveScrollLayer *v3;

  v3 = objc_alloc_init(THInteractiveScrollLayer);
  self->_bodyScrollLayer = v3;
  -[THNoteCardContentLayer addSublayer:](self, "addSublayer:", v3);
  -[THNoteCardContentLayer setNeedsLayout](self, "setNeedsLayout");
}

- (void)p_setupTitleLabel
{
  THMultiLineLabel *v3;
  id v4;
  uint64_t v5;

  v3 = -[THMultiLineLabel initWithFrame:]([THMultiLineLabel alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  self->_titleLabel = v3;
  -[THMultiLineLabel setAlignment:](v3, "setAlignment:", 4);
  -[THMultiLineLabel setDelegate:](self->_titleLabel, "setDelegate:", self);
  -[THMultiLineLabel setAnchorPoint:](self->_titleLabel, "setAnchorPoint:", CGPointZero.x, CGPointZero.y);
  -[THMultiLineLabel setFont:](self->_titleLabel, "setFont:", +[TSUFont systemFontOfSize:](TSUFont, "systemFontOfSize:", 21.0));
  -[THMultiLineLabel setTextColor:](self->_titleLabel, "setTextColor:", THNoteCardHeaderColor(-[THNoteCardContentLayer darkMode](self, "darkMode")));
  -[THNoteCardLayoutContext textScale](self->_layoutContext, "textScale");
  v4 = -[THMultiLineLabel setScale:](self->_titleLabel, "setScale:");
  -[THMultiLineLabel setContentsScale:](self->_titleLabel, "setContentsScale:", TSUScreenScale(v4, v5));
  -[THNoteCardContentLayer addSublayer:](self, "addSublayer:", self->_titleLabel);
}

- (void)p_setupPageNumberLabel
{
  THMultiLineLabel *v3;
  id v4;
  uint64_t v5;

  v3 = -[THMultiLineLabel initWithFrame:]([THMultiLineLabel alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  self->_pageNumberLabel = v3;
  -[THMultiLineLabel setAlignment:](v3, "setAlignment:", 4);
  -[THMultiLineLabel setDelegate:](self->_pageNumberLabel, "setDelegate:", self);
  -[THMultiLineLabel setAnchorPoint:](self->_pageNumberLabel, "setAnchorPoint:", CGPointZero.x, CGPointZero.y);
  -[THMultiLineLabel setFont:](self->_pageNumberLabel, "setFont:", +[TSUFont systemFontOfSize:](TSUFont, "systemFontOfSize:", 21.0));
  -[THMultiLineLabel setTextColor:](self->_pageNumberLabel, "setTextColor:", THNoteCardHeaderColor(-[THNoteCardContentLayer darkMode](self, "darkMode")));
  -[THNoteCardLayoutContext textScale](self->_layoutContext, "textScale");
  v4 = -[THMultiLineLabel setScale:](self->_pageNumberLabel, "setScale:");
  -[THMultiLineLabel setContentsScale:](self->_pageNumberLabel, "setContentsScale:", TSUScreenScale(v4, v5));
  -[THNoteCardContentLayer addSublayer:](self, "addSublayer:", self->_pageNumberLabel);
  -[THNoteCardContentLayer p_updatePageNumberDisplay](self, "p_updatePageNumberDisplay");
}

- (void)p_setupCardNumberLabel
{
  THMultiLineLabel *v3;
  id v4;
  uint64_t v5;

  v3 = -[THMultiLineLabel initWithFrame:]([THMultiLineLabel alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  self->_cardNumberLabel = v3;
  -[THMultiLineLabel setAlignment:](v3, "setAlignment:", 4);
  -[THMultiLineLabel setDelegate:](self->_cardNumberLabel, "setDelegate:", self);
  -[THMultiLineLabel setAnchorPoint:](self->_cardNumberLabel, "setAnchorPoint:", CGPointZero.x, CGPointZero.y);
  -[THMultiLineLabel setFont:](self->_cardNumberLabel, "setFont:", +[TSUFont systemFontOfSize:](TSUFont, "systemFontOfSize:", 25.0));
  -[THMultiLineLabel setTextColor:](self->_cardNumberLabel, "setTextColor:", THNoteCardFooterColor(-[THNoteCardContentLayer darkMode](self, "darkMode")));
  -[THNoteCardLayoutContext textScale](self->_layoutContext, "textScale");
  v4 = -[THMultiLineLabel setScale:](self->_cardNumberLabel, "setScale:");
  -[THMultiLineLabel setContentsScale:](self->_cardNumberLabel, "setContentsScale:", TSUScreenScale(v4, v5));
  -[THNoteCardContentLayer addSublayer:](self, "addSublayer:", self->_cardNumberLabel);
}

- (void)p_setupFlipLabel
{
  THMultiLineLabel *v3;
  id v4;
  uint64_t v5;

  v3 = objc_alloc_init(THMultiLineLabel);
  self->_flipLabel = v3;
  -[THMultiLineLabel setAlignment:](v3, "setAlignment:", 4);
  -[THMultiLineLabel setDelegate:](self->_flipLabel, "setDelegate:", self);
  -[THMultiLineLabel setAnchorPoint:](self->_flipLabel, "setAnchorPoint:", CGPointZero.x, CGPointZero.y);
  -[THMultiLineLabel setFont:](self->_flipLabel, "setFont:", +[TSUFont systemFontOfSize:](TSUFont, "systemFontOfSize:", 25.0));
  -[THMultiLineLabel setTextColor:](self->_flipLabel, "setTextColor:", THNoteCardFooterFlipCardColor(-[THNoteCardContentLayer darkMode](self, "darkMode")));
  -[THNoteCardLayoutContext textScale](self->_layoutContext, "textScale");
  -[THMultiLineLabel setScale:](self->_flipLabel, "setScale:");
  v4 = -[THMultiLineLabel setText:](self->_flipLabel, "setText:", objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("Flip Card"), &stru_43D7D8, 0));
  -[THMultiLineLabel setContentsScale:](self->_flipLabel, "setContentsScale:", TSUScreenScale(v4, v5));
  -[THNoteCardContentLayer addSublayer:](self, "addSublayer:", self->_flipLabel);
  -[THNoteCardContentLayer p_updateFlipAffordanceDisplay](self, "p_updateFlipAffordanceDisplay");
}

- (void)p_setupColorBar
{
  CALayer *v3;

  v3 = (CALayer *)objc_alloc_init((Class)TSDNoDefaultImplicitActionLayer);
  self->_colorBarLayer = v3;
  -[CALayer setDelegate:](v3, "setDelegate:", self);
  -[THNoteCardContentLayer addSublayer:](self, "addSublayer:", self->_colorBarLayer);
}

- (void)p_updatePageNumberDisplay
{
  unsigned int v3;
  int v4;
  TSUColor *v5;

  if (-[THNoteCardContentLayer pageNumberHovered](self, "pageNumberHovered"))
  {
    v3 = -[THNoteCardContentLayer pageNumberPressed](self, "pageNumberPressed");
    v4 = -[THNoteCardContentLayer darkMode](self, "darkMode");
    if (v3)
      v5 = THNoteCardPressedTextColor(v4);
    else
      v5 = THNoteCardHoveredTextColor(v4);
  }
  else
  {
    v5 = THNoteCardHeaderColor(-[THNoteCardContentLayer darkMode](self, "darkMode"));
  }
  -[THMultiLineLabel setTextColor:](self->_pageNumberLabel, "setTextColor:", v5);
}

- (void)p_updateFlipAffordanceDisplay
{
  unsigned int v3;
  int v4;
  TSUColor *v5;

  v3 = -[THNoteCardContentLayer flipAffordancePressed](self, "flipAffordancePressed");
  v4 = -[THNoteCardContentLayer darkMode](self, "darkMode");
  if (v3)
    v5 = THNoteCardPressedTextColor(v4);
  else
    v5 = THNoteCardFooterFlipCardColor(v4);
  -[THMultiLineLabel setTextColor:](self->_flipLabel, "setTextColor:", v5);
}

- (id)p_borderColorForCurrentScreenScale
{
  double v3;

  -[THNoteCardContentLayer contentsScale](self, "contentsScale");
  return THNoteCardBorderColor(-[THNoteCardContentLayer darkMode](self, "darkMode"), v3 > 1.0);
}

- (double)p_borderWidthForCurrentScreenScale
{
  double v2;

  -[THNoteCardContentLayer contentsScale](self, "contentsScale");
  return 1.0 / v2;
}

- (CGSize)p_shadowOffsetForCurrentScreenScale
{
  THNoteCardLayoutContext *layoutContext;
  double v3;
  double v4;
  CGSize result;

  layoutContext = self->_layoutContext;
  -[THNoteCardContentLayer contentsScale](self, "contentsScale");
  -[THNoteCardLayoutContext noteCardShadowOffsetForScreenScale:](layoutContext, "noteCardShadowOffsetForScreenScale:");
  result.height = v4;
  result.width = v3;
  return result;
}

- (double)p_shadowRadiusForCurrentScreenScale
{
  THNoteCardLayoutContext *layoutContext;
  double result;

  layoutContext = self->_layoutContext;
  -[THNoteCardContentLayer contentsScale](self, "contentsScale");
  -[THNoteCardLayoutContext noteCardShadowRadiusForScreenScale:](layoutContext, "noteCardShadowRadiusForScreenScale:");
  return result;
}

- (THNoteCardLayoutContext)layoutContext
{
  return self->_layoutContext;
}

- (BOOL)pageNumberHovered
{
  return self->_pageNumberHovered;
}

- (BOOL)pageNumberPressed
{
  return self->_pageNumberPressed;
}

- (BOOL)flipAffordanceHovered
{
  return self->_flipAffordanceHovered;
}

- (BOOL)flipAffordancePressed
{
  return self->_flipAffordancePressed;
}

- (BOOL)darkMode
{
  return self->_darkMode;
}

- (id).cxx_construct
{
  *((_DWORD *)self + 24) = 257;
  *((_BYTE *)self + 100) = 0;
  return self;
}

@end
