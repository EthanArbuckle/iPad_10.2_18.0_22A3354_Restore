@implementation THNoteCardEmptyLayer

- (THNoteCardEmptyLayer)initWithStudyOptions:(id)a3 unfilteredContentAvailable:(BOOL)a4 darkMode:(BOOL)a5
{
  _BOOL4 v6;
  THNoteCardEmptyLayer *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)THNoteCardEmptyLayer;
  v8 = -[THNoteCardEmptyLayer init](&v10, "init");
  if (v8)
  {
    v8->_studyOptions = (THStudyOptions *)a3;
    v8->_isUnfilteredContentAvailable = v6;
    v8->_darkMode = a5;
    if (v6)
      -[THNoteCardEmptyLayer p_setupWhenUnfilteredContentIsAvailable](v8, "p_setupWhenUnfilteredContentIsAvailable");
    else
      -[THNoteCardEmptyLayer p_setupWhenUnfilteredContentIsNotAvailable](v8, "p_setupWhenUnfilteredContentIsNotAvailable");
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THNoteCardEmptyLayer;
  -[THNoteCardBodyLayer dealloc](&v3, "dealloc");
}

- (void)setLayoutContext:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)THNoteCardEmptyLayer;
  -[THNoteCardBodyLayer setLayoutContext:](&v5, "setLayoutContext:");
  objc_msgSend(a3, "scale");
  -[THMultiLineLabel setScale:](self->_headingLabel, "setScale:");
  objc_msgSend(a3, "scale");
  -[THMultiLineLabel setScale:](self->_bodyLabel, "setScale:");
  objc_msgSend(a3, "scale");
  -[THInteractiveButtonLayer setScale:](self->_viewAllCardsButton, "setScale:");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  double v4;
  double v5;
  double v6;
  CGSize result;

  width = a3.width;
  -[THNoteCardLayoutContext noteCardBodyHeight](-[THNoteCardBodyLayer layoutContext](self, "layoutContext", a3.width, a3.height), "noteCardBodyHeight");
  v5 = v4;
  v6 = width;
  result.height = v5;
  result.width = v6;
  return result;
}

- (id)interactiveLayers
{
  return +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", self->_viewAllCardsButton, 0);
}

- (BOOL)shouldForceCentered
{
  return 1;
}

- (void)layoutSublayers
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGFloat x;
  CGFloat y;
  CGFloat v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat MaxY;
  double v21;
  double v22;
  double v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  double height;
  double width;
  double v29;
  double v30;
  CGFloat v31;
  CGFloat v32;
  double v33;
  objc_super v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;

  v34.receiver = self;
  v34.super_class = (Class)THNoteCardEmptyLayer;
  -[THNoteCardEmptyLayer layoutSublayers](&v34, "layoutSublayers");
  -[THNoteCardLayoutContext scale](-[THNoteCardBodyLayer layoutContext](self, "layoutContext"), "scale");
  v4 = v3 + v3;
  v29 = v3;
  v30 = v3 + v3;
  height = self->_buttonSize.height;
  width = self->_buttonSize.width;
  -[THNoteCardEmptyLayer frame](self, "frame");
  -[THMultiLineLabel setFrame:](self->_headingLabel, "setFrame:");
  -[THNoteCardEmptyLayer frame](self, "frame");
  -[THMultiLineLabel setFrame:](self->_bodyLabel, "setFrame:");
  -[THMultiLineLabel resizeToFitCurrentWidth](self->_headingLabel, "resizeToFitCurrentWidth");
  -[THMultiLineLabel resizeToFitCurrentWidth](self->_bodyLabel, "resizeToFitCurrentWidth");
  -[THMultiLineLabel bounds](self->_headingLabel, "bounds");
  v6 = v5;
  v8 = v7;
  -[THMultiLineLabel bounds](self->_bodyLabel, "bounds");
  v32 = v10;
  v33 = v9;
  v11 = v10;
  -[THNoteCardEmptyLayer frame](self, "frame");
  x = v35.origin.x;
  y = v35.origin.y;
  v14 = v35.size.width;
  v15 = v35.size.height;
  v16 = v4 + v8 + v11;
  v17 = (CGRectGetWidth(v35) - v6) * 0.5;
  v36.origin.x = x;
  v36.origin.y = y;
  v36.size.width = v14;
  v36.size.height = v15;
  v18 = (CGRectGetHeight(v36) - v16) * 0.5;
  v37.origin.x = v17;
  v37.origin.y = v18;
  v37.size.width = v6;
  v37.size.height = v8;
  v38 = CGRectIntegral(v37);
  -[THMultiLineLabel setFrame:](self->_headingLabel, "setFrame:", v38.origin.x, v38.origin.y, v38.size.width, v38.size.height);
  v26 = v15;
  v39.origin.x = x;
  v39.origin.y = y;
  v39.size.width = v14;
  v39.size.height = v15;
  v19 = (CGRectGetWidth(v39) - v33) * 0.5;
  v40.origin.x = v17;
  v40.origin.y = v18;
  v40.size.width = v6;
  v40.size.height = v8;
  MaxY = CGRectGetMaxY(v40);
  v41.size.height = v32;
  v21 = v30 + MaxY;
  v31 = v19;
  v41.origin.x = v19;
  v41.origin.y = v21;
  v41.size.width = v33;
  v42 = CGRectIntegral(v41);
  -[THMultiLineLabel setFrame:](self->_bodyLabel, "setFrame:", v42.origin.x, v42.origin.y, v42.size.width, v42.size.height);
  if (self->_viewAllCardsButton)
  {
    v22 = TSDMultiplySizeScalar(width, height, v29);
    v24 = v23;
    v43.size.height = v26;
    v43.origin.x = x;
    v43.origin.y = y;
    v43.size.width = v14;
    v25 = (CGRectGetWidth(v43) - v22) * 0.5;
    v44.origin.x = v31;
    v44.size.height = v32;
    v44.origin.y = v21;
    v44.size.width = v33;
    v45.origin.y = v29 * 93.0 + CGRectGetMaxY(v44);
    v45.origin.x = v25;
    v45.size.width = v22;
    v45.size.height = v24;
    v46 = CGRectIntegral(v45);
    -[THInteractiveButtonLayer setFrame:](self->_viewAllCardsButton, "setFrame:", v46.origin.x, v46.origin.y, v46.size.width, v46.size.height);
  }
}

- (void)viewAllCards:(id)a3
{
  -[THStudyOptions showAll](self->_studyOptions, "showAll", a3);
}

- (void)p_setupWhenUnfilteredContentIsAvailable
{
  id v3;
  id v4;
  id v5;
  double v6;

  v3 = objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("To view your study cards\\U002C tap View All Cards\\U002C\nor tap the gear icon for more options."), &stru_43D7D8, 0);
  -[THNoteCardEmptyLayer p_setupHeadingLabel:bodyLabel:](self, "p_setupHeadingLabel:bodyLabel:", objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("You\\U2019ve hidden all study cards."), &stru_43D7D8, 0), v3);
  self->_viewAllCardsButton = objc_alloc_init(THInteractiveButtonLayer);
  v4 = objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("View All Cards"), &stru_43D7D8, 0);
  v5 = +[TSUFont systemFontOfSize:](TSUFont, "systemFontOfSize:", 14.0);
  objc_msgSend(v4, "sizeWithAttributes:", +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", objc_msgSend(v5, "platformFont"), NSFontAttributeName, 0));
  self->_buttonSize.width = ceil(v6) + 34.0;
  self->_buttonSize.height = 35.0;
  -[THInteractiveButtonLayer setNormalBackgroundImage:](self->_viewAllCardsButton, "setNormalBackgroundImage:", objc_msgSend(+[TSUImage imageNamed:inBundle:](TSUImage, "imageNamed:inBundle:", CFSTR("NoNotes-Button-N"), THBundle()), "stretchedImageOfSize:leftCapWidth:rightCapWidth:topCapHeight:bottomCapHeight:", self->_buttonSize.width, self->_buttonSize.height, 10.0, 10.0, 10.0, 10.0));
  -[THInteractiveButtonLayer setPressedBackgroundImage:](self->_viewAllCardsButton, "setPressedBackgroundImage:", objc_msgSend(+[TSUImage imageNamed:inBundle:](TSUImage, "imageNamed:inBundle:", CFSTR("NoNotes-Button-P"), THBundle()), "stretchedImageOfSize:leftCapWidth:rightCapWidth:topCapHeight:bottomCapHeight:", self->_buttonSize.width, self->_buttonSize.height, 10.0, 10.0, 10.0, 10.0));
  -[THInteractiveButtonLayer setTitle:](self->_viewAllCardsButton, "setTitle:", v4);
  -[THInteractiveButtonLayer setTitleFont:](self->_viewAllCardsButton, "setTitleFont:", v5);
  -[THInteractiveButtonLayer setTitleColor:](self->_viewAllCardsButton, "setTitleColor:", +[TSUColor colorWithRed:green:blue:alpha:](TSUColor, "colorWithRed:green:blue:alpha:", 0.57254902, 0.57254902, 0.57254902, 1.0));
  -[THInteractiveButtonLayer setTitleShadowColor:](self->_viewAllCardsButton, "setTitleShadowColor:", +[TSUColor colorWithRed:green:blue:alpha:](TSUColor, "colorWithRed:green:blue:alpha:", 1.0, 1.0, 1.0, 0.5));
  -[THInteractiveButtonLayer setTitleShadowOffset:](self->_viewAllCardsButton, "setTitleShadowOffset:", 0.0, -1.0);
  -[THInteractiveButtonLayer setTitleShadowBlurRadius:](self->_viewAllCardsButton, "setTitleShadowBlurRadius:", 1.0);
  -[THNoteCardLayoutContext scale](-[THNoteCardBodyLayer layoutContext](self, "layoutContext"), "scale");
  -[THInteractiveButtonLayer setScale:](self->_viewAllCardsButton, "setScale:");
  -[THInteractiveButtonLayer setTarget:action:](self->_viewAllCardsButton, "setTarget:action:", self, "viewAllCards:");
  -[THNoteCardEmptyLayer addSublayer:](self, "addSublayer:", self->_viewAllCardsButton);
}

- (void)p_setupWhenUnfilteredContentIsNotAvailable
{
  id v3;

  v3 = objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("This chapter doesn\\U2019t have study cards."), &stru_43D7D8, 0);
  -[THNoteCardEmptyLayer p_setupHeadingLabel:bodyLabel:](self, "p_setupHeadingLabel:bodyLabel:", v3, objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("Study cards are only available for chapters with\nhighlights\\U002C notes\\U002C or glossary terms."), &stru_43D7D8, 0));
}

- (void)p_setupHeadingLabel:(id)a3 bodyLabel:(id)a4
{
  THMultiLineLabel *v7;
  double y;
  double width;
  double height;
  THMultiLineLabel *v11;
  double v12;
  id v13;
  uint64_t v14;
  THMultiLineLabel *v15;
  double v16;
  id v17;
  uint64_t v18;

  v7 = [THMultiLineLabel alloc];
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v11 = -[THMultiLineLabel initWithFrame:](v7, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  self->_headingLabel = v11;
  -[THMultiLineLabel setDelegate:](v11, "setDelegate:", self);
  -[THMultiLineLabel setText:](self->_headingLabel, "setText:", a3);
  -[THMultiLineLabel setFont:](self->_headingLabel, "setFont:", +[TSUFont systemFontOfSize:](TSUFont, "systemFontOfSize:", 50.0));
  -[THMultiLineLabel setTextColor:](self->_headingLabel, "setTextColor:", THNoteCardEmptyHeadingTextColor(self->_darkMode));
  -[THMultiLineLabel setBackgroundColor:](self->_headingLabel, "setBackgroundColor:", objc_msgSend(+[TSUColor clearColor](TSUColor, "clearColor"), "CGColor"));
  -[THMultiLineLabel setAlignment:](self->_headingLabel, "setAlignment:", 1);
  -[TSUFont lineHeight](-[THMultiLineLabel font](self->_headingLabel, "font"), "lineHeight");
  -[THMultiLineLabel setLineHeight:](self->_headingLabel, "setLineHeight:", fmax(v12, 50.0));
  -[THNoteCardLayoutContext scale](-[THNoteCardBodyLayer layoutContext](self, "layoutContext"), "scale");
  v13 = -[THMultiLineLabel setScale:](self->_headingLabel, "setScale:");
  -[THMultiLineLabel setContentsScale:](self->_headingLabel, "setContentsScale:", TSUScreenScale(v13, v14));
  -[THNoteCardEmptyLayer addSublayer:](self, "addSublayer:", self->_headingLabel);
  v15 = -[THMultiLineLabel initWithFrame:]([THMultiLineLabel alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
  self->_bodyLabel = v15;
  -[THMultiLineLabel setDelegate:](v15, "setDelegate:", self);
  -[THMultiLineLabel setText:](self->_bodyLabel, "setText:", a4);
  -[THMultiLineLabel setFont:](self->_bodyLabel, "setFont:", +[TSUFont systemFontOfSize:](TSUFont, "systemFontOfSize:", 25.0));
  -[THMultiLineLabel setTextColor:](self->_bodyLabel, "setTextColor:", THNoteCardEmptyBodyTextColor(self->_darkMode));
  -[THMultiLineLabel setBackgroundColor:](self->_bodyLabel, "setBackgroundColor:", objc_msgSend(+[TSUColor clearColor](TSUColor, "clearColor"), "CGColor"));
  -[THMultiLineLabel setAlignment:](self->_bodyLabel, "setAlignment:", 1);
  -[TSUFont lineHeight](-[THMultiLineLabel font](self->_bodyLabel, "font"), "lineHeight");
  -[THMultiLineLabel setLineHeight:](self->_bodyLabel, "setLineHeight:", fmax(v16, 33.0));
  -[THNoteCardLayoutContext scale](-[THNoteCardBodyLayer layoutContext](self, "layoutContext"), "scale");
  v17 = -[THMultiLineLabel setScale:](self->_bodyLabel, "setScale:");
  -[THMultiLineLabel setContentsScale:](self->_bodyLabel, "setContentsScale:", TSUScreenScale(v17, v18));
  -[THNoteCardEmptyLayer addSublayer:](self, "addSublayer:", self->_bodyLabel);
}

@end
