@implementation RCOverlayBarLayer

+ (double)selectionBarWidth
{
  double result;

  +[RCOverlayBarLayer _internalSelectionBarWidth](RCOverlayBarLayer, "_internalSelectionBarWidth");
  return result;
}

+ (double)selectionKnobRadius
{
  double result;

  +[RCOverlayBarLayer _internalSelectionKnobRadius](RCOverlayBarLayer, "_internalSelectionKnobRadius");
  return result;
}

+ (double)_internalSelectionBarWidth
{
  void *v2;
  void *v3;
  NSString *v4;
  void *v5;
  double v6;
  double v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "traitCollection"));
  v4 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "preferredContentSizeCategory"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  if (UIContentSizeCategoryIsAccessibilityCategory(v4))
    objc_msgSend(v5, "selectionBarWidthAX");
  else
    objc_msgSend(v5, "selectionBarWidth");
  v7 = v6;

  return v7;
}

+ (double)_internalSelectionKnobRadius
{
  void *v2;
  void *v3;
  NSString *v4;
  void *v5;
  double v6;
  double v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "traitCollection"));
  v4 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "preferredContentSizeCategory"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  if (UIContentSizeCategoryIsAccessibilityCategory(v4))
    objc_msgSend(v5, "selectionKnobRadiusAX");
  else
    objc_msgSend(v5, "selectionKnobRadius");
  v7 = v6;

  return v7;
}

- (RCOverlayBarLayer)initWithColor:(id)a3 selectionExtentIncludingKnobs:(double)a4 topKnob:(BOOL)a5 bottomKnob:(BOOL)a6 widthMultiplier:(double)a7 barWidthMatchesKnobs:(BOOL)a8
{
  _BOOL8 v10;
  _BOOL8 v11;
  id v15;
  RCOverlayBarLayer *v16;
  RCOverlayBarLayer *v17;
  objc_super v19;

  v10 = a6;
  v11 = a5;
  v15 = a3;
  v19.receiver = self;
  v19.super_class = (Class)RCOverlayBarLayer;
  v16 = -[RCOverlayBarLayer init](&v19, "init");
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_color, a3);
    v17->_widthMultiplier = a7;
    v17->_barWidthMatchesKnobs = a8;
    -[RCOverlayBarLayer _loadWithColor:selectionExtentIncludingKnobs:topKnob:bottomKnob:](v17, "_loadWithColor:selectionExtentIncludingKnobs:topKnob:bottomKnob:", v15, v11, v10, a4);
  }

  return v17;
}

- (double)selectionKnobRadius
{
  double v3;

  +[RCOverlayBarLayer _internalSelectionKnobRadius](RCOverlayBarLayer, "_internalSelectionKnobRadius");
  return v3 * self->_widthMultiplier;
}

- (double)selectionBarWidth
{
  double v3;
  double result;

  if (-[RCOverlayBarLayer barWidthMatchesKnobs](self, "barWidthMatchesKnobs"))
  {
    -[RCOverlayBarLayer selectionKnobRadius](self, "selectionKnobRadius");
    return v3 + v3;
  }
  else
  {
    +[RCOverlayBarLayer _internalSelectionBarWidth](RCOverlayBarLayer, "_internalSelectionBarWidth");
  }
  return result;
}

- (id)barComponents
{
  CALayer *bottomKnob;
  _QWORD v4[3];

  bottomKnob = self->_bottomKnob;
  v4[0] = self->_topKnob;
  v4[1] = bottomKnob;
  v4[2] = self->_bar;
  return (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v4, 3));
}

- (void)setColor:(id)a3
{
  id v5;
  UIColor **p_color;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v5 = a3;
  p_color = &self->_color;
  if ((objc_msgSend(v5, "isEqual:", self->_color) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_color, a3);
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCOverlayBarLayer barComponents](self, "barComponents", 0));
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v14;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v14 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v11);
          objc_msgSend(v12, "setBackgroundColor:", -[UIColor CGColor](*p_color, "CGColor"));
          objc_msgSend(v12, "setOpaque:", 1);
          v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v9);
    }

  }
}

- (void)setBarGlyph:(id)a3
{
  id v5;

  v5 = a3;
  if ((objc_msgSend(v5, "isEqual:", self->_barGlyph) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_barGlyph, a3);
    objc_msgSend(v5, "scale");
    -[CALayer setContentsScale:](self->_bar, "setContentsScale:");
    -[CALayer setContentsGravity:](self->_bar, "setContentsGravity:", kCAGravityCenter);
    -[CALayer setContents:](self->_bar, "setContents:", objc_msgSend(objc_retainAutorelease(v5), "CGImage"));
  }

}

- (void)_loadWithColor:(id)a3 selectionExtentIncludingKnobs:(double)a4 topKnob:(BOOL)a5 bottomKnob:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;
  _QWORD *v16;
  id v17;
  void ***v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  CALayer *v23;
  CALayer *topKnob;
  uint64_t v25;
  CALayer *v26;
  CALayer *bottomKnob;
  uint64_t v28;
  CALayer *v29;
  CALayer *bar;
  double v31;
  double Height;
  double v33;
  double v34;
  double v35;
  double v36;
  double MaxY;
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
  double Width;
  void **v49;
  uint64_t v50;
  id (*v51)(uint64_t);
  void *v52;
  id v53;
  double v54;
  _QWORD v55[4];
  id v56;
  double v57;
  double v58;
  double v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;

  v6 = a6;
  v7 = a5;
  v10 = a3;
  -[RCOverlayBarLayer selectionKnobRadius](self, "selectionKnobRadius");
  v12 = v11;
  -[RCOverlayBarLayer selectionBarWidth](self, "selectionBarWidth");
  v14 = v13;
  v55[0] = _NSConcreteStackBlock;
  v55[1] = 3221225472;
  v55[2] = sub_1000384C8;
  v55[3] = &unk_1001ABC68;
  v57 = a4;
  v58 = v12;
  v59 = v13;
  v15 = v10;
  v56 = v15;
  v16 = objc_retainBlock(v55);
  v49 = _NSConcreteStackBlock;
  v50 = 3221225472;
  v51 = sub_100038538;
  v52 = &unk_1001ABC90;
  v54 = v12;
  v17 = v15;
  v53 = v17;
  v18 = objc_retainBlock(&v49);
  v22 = ((uint64_t (*)(void ***, uint64_t, uint64_t, uint64_t))v18[2])(v18, v19, v20, v21);
  v23 = (CALayer *)objc_claimAutoreleasedReturnValue(v22);
  topKnob = self->_topKnob;
  self->_topKnob = v23;

  if (!v7)
  {
    -[CALayer bounds](self->_topKnob, "bounds", v49, v50, v51, v52);
    -[CALayer setBounds:](self->_topKnob, "setBounds:");
  }
  v25 = ((uint64_t (*)(void ***))v18[2])(v18);
  v26 = (CALayer *)objc_claimAutoreleasedReturnValue(v25);
  bottomKnob = self->_bottomKnob;
  self->_bottomKnob = v26;

  if (!v6)
  {
    -[CALayer bounds](self->_bottomKnob, "bounds");
    -[CALayer setBounds:](self->_bottomKnob, "setBounds:");
  }
  v28 = ((uint64_t (*)(_QWORD *))v16[2])(v16);
  v29 = (CALayer *)objc_claimAutoreleasedReturnValue(v28);
  bar = self->_bar;
  self->_bar = v29;

  v31 = RCRoundCoord(v12 + v14 * -0.5);
  -[CALayer bounds](self->_topKnob, "bounds");
  Height = CGRectGetHeight(v60);
  v33 = RCRoundCoord(Height);
  -[CALayer frame](self->_bar, "frame");
  v35 = RCRoundCoord(v34);
  -[CALayer frame](self->_bar, "frame");
  -[CALayer setFrame:](self->_bar, "setFrame:", v31, v33, v35, RCRoundCoord(v36));
  -[CALayer frame](self->_bar, "frame");
  MaxY = CGRectGetMaxY(v61);
  if (-[RCOverlayBarLayer barWidthMatchesKnobs](self, "barWidthMatchesKnobs"))
    v38 = v12;
  else
    v38 = 0.0;
  v39 = RCRoundCoord(MaxY - v38);
  -[CALayer frame](self->_bottomKnob, "frame");
  v41 = RCRoundCoord(v40);
  -[CALayer frame](self->_bottomKnob, "frame");
  -[CALayer setFrame:](self->_bottomKnob, "setFrame:", 0.0, v39, v41, RCRoundCoord(v42));
  if (-[RCOverlayBarLayer barWidthMatchesKnobs](self, "barWidthMatchesKnobs"))
    v43 = v12;
  else
    v43 = 0.0;
  v44 = RCRoundCoord(v43);
  -[CALayer frame](self->_topKnob, "frame");
  v46 = RCRoundCoord(v45);
  -[CALayer frame](self->_topKnob, "frame");
  -[CALayer setFrame:](self->_topKnob, "setFrame:", 0.0, v44, v46, RCRoundCoord(v47));
  -[CALayer frame](self->_bottomKnob, "frame");
  Width = CGRectGetWidth(v62);
  -[CALayer frame](self->_bottomKnob, "frame");
  -[RCOverlayBarLayer setBounds:](self, "setBounds:", 0.0, 0.0, Width, CGRectGetMaxY(v63));
  -[RCOverlayBarLayer setAnchorPoint:](self, "setAnchorPoint:", CGPointZero.x, CGPointZero.y);
  -[RCOverlayBarLayer addSublayer:](self, "addSublayer:", self->_bar);
  if (v7)
    -[RCOverlayBarLayer addSublayer:](self, "addSublayer:", self->_topKnob);
  if (v6)
    -[RCOverlayBarLayer addSublayer:](self, "addSublayer:", self->_bottomKnob);

}

- (void)layoutSublayers
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double MidX;
  CGFloat v16;
  double v17;
  double Height;
  CGFloat v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGFloat v25;
  double v26;
  double v27;
  double v28;
  CGFloat v29;
  double v30;
  double v31;
  double v32;
  unsigned int v33;
  CALayer *topKnob;
  double MidY;
  double v36;
  unsigned int v37;
  uint64_t v38;
  double MinY;
  double v43;
  objc_super v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;

  v44.receiver = self;
  v44.super_class = (Class)RCOverlayBarLayer;
  -[RCOverlayBarLayer layoutSublayers](&v44, "layoutSublayers");
  -[RCOverlayBarLayer bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CALayer frame](self->_bottomKnob, "frame");
  v12 = v11;
  v14 = v13;
  v45.origin.x = v4;
  v45.origin.y = v6;
  v45.size.width = v8;
  v45.size.height = v10;
  MidX = CGRectGetMidX(v45);
  -[CALayer bounds](self->_bottomKnob, "bounds");
  v16 = CGRectGetMidX(v46);
  v17 = RCRoundCoord(MidX - v16);
  v47.origin.x = v4;
  v47.origin.y = v6;
  v47.size.width = v8;
  v47.size.height = v10;
  Height = CGRectGetHeight(v47);
  -[CALayer frame](self->_bottomKnob, "frame");
  v19 = CGRectGetHeight(v48);
  -[CALayer setFrame:](self->_bottomKnob, "setFrame:", v17, RCRoundCoord(Height - v19), v12, v14);
  -[CALayer frame](self->_topKnob, "frame");
  v21 = v20;
  v23 = v22;
  v49.origin.x = v4;
  v49.origin.y = v6;
  v49.size.width = v8;
  v49.size.height = v10;
  v24 = CGRectGetMidX(v49);
  -[CALayer bounds](self->_topKnob, "bounds");
  v25 = CGRectGetMidX(v50);
  -[CALayer setFrame:](self->_topKnob, "setFrame:", RCRoundCoord(v24 - v25), 0.0, v21, v23);
  -[CALayer frame](self->_bar, "frame");
  v27 = v26;
  v29 = v28;
  v51.origin.x = v4;
  v51.origin.y = v6;
  v51.size.width = v8;
  v51.size.height = v10;
  v30 = CGRectGetMidX(v51);
  -[RCOverlayBarLayer selectionBarWidth](self, "selectionBarWidth");
  v32 = RCRoundCoord(v30 + v31 * -0.5);
  v33 = -[RCOverlayBarLayer barWidthMatchesKnobs](self, "barWidthMatchesKnobs");
  topKnob = self->_topKnob;
  if (v33)
  {
    -[CALayer frame](topKnob, "frame");
    MidY = CGRectGetMidY(v52);
  }
  else
  {
    -[CALayer bounds](topKnob, "bounds");
    MidY = CGRectGetMaxY(v53);
  }
  v36 = MidY;
  v37 = -[RCOverlayBarLayer barWidthMatchesKnobs](self, "barWidthMatchesKnobs");
  -[CALayer frame](self->_bottomKnob, "frame");
  if (v37)
    MinY = CGRectGetMidY(*(CGRect *)&v38);
  else
    MinY = CGRectGetMinY(*(CGRect *)&v38);
  v43 = MinY;
  v54.origin.x = v32;
  v54.origin.y = v36;
  v54.size.width = v27;
  v54.size.height = v29;
  -[CALayer setFrame:](self->_bar, "setFrame:", v32, v36, v27, v43 - CGRectGetMinY(v54));
}

- (UIColor)color
{
  return self->_color;
}

- (UIImage)barGlyph
{
  return self->_barGlyph;
}

- (double)widthMultiplier
{
  return self->_widthMultiplier;
}

- (void)setWidthMultiplier:(double)a3
{
  self->_widthMultiplier = a3;
}

- (BOOL)barWidthMatchesKnobs
{
  return self->_barWidthMatchesKnobs;
}

- (void)setBarWidthMatchesKnobs:(BOOL)a3
{
  self->_barWidthMatchesKnobs = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_barGlyph, 0);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_bottomKnob, 0);
  objc_storeStrong((id *)&self->_bar, 0);
  objc_storeStrong((id *)&self->_topKnob, 0);
}

@end
