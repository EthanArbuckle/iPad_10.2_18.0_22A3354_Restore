@implementation BKScrubberLayerImp

- (BKScrubberLayerImp)initWithLayer:(id)a3 orientation:(int)a4
{
  id v6;
  BKScrubberLayerImp *v7;
  BKScrubberLayerImp *v8;
  id v9;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BKScrubberLayerImp;
  v7 = -[BKScrubberLayerImp init](&v11, "init");
  v8 = v7;
  if (v7)
  {
    v9 = objc_storeWeak((id *)&v7->_layer, v6);
    objc_msgSend(v6, "setDelegate:", v8);

    v8->_orientation = a4;
  }

  return v8;
}

- (void)setOrientation:(int)a3
{
  id WeakRetained;

  self->_orientation = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_layer);
  objc_msgSend(WeakRetained, "setNeedsDisplay");

}

- (void)displayLayer:(id)a3
{
  unsigned int v4;
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  unsigned int v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  id v18;
  id v19;

  v19 = a3;
  v4 = -[BKScrubberLayerImp orientation](self, "orientation");
  v5 = CFSTR("Vertical");
  if (!v4)
    v5 = CFSTR("Horizontal");
  v6 = v5;
  if (self->_themeInterfaceStyle == 2)
    v7 = CFSTR("Dark");
  else
    v7 = CFSTR("Light");
  v8 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKScrubberLayerImp traitCollection](self, "traitCollection"));
  if (self->_isKnob)
  {
    v10 = -[BKScrubberLayerImp _isExpanded](self, "_isExpanded");
    v11 = &stru_296430;
    if (v10)
      v11 = CFSTR("Expanded");
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("ScrollBarOverlay_%@Thumb_Regular_%@_%@"), v11, v6, v8));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _kitImageNamed:withTrait:](UIImage, "_kitImageNamed:withTrait:", v12, v9));
    v14 = 0.333333333;
    v15 = 0.0;
    if (v4)
      v16 = 0.0;
    else
      v16 = 0.333333333;
    if (v4)
    {
      v15 = 0.333333333;
      v17 = 1.0;
    }
    else
    {
      v17 = 0.333333333;
    }
    if (!v4)
      v14 = 1.0;
    objc_msgSend(v19, "setContentsCenter:", v16, v15, v17, v14);
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("ScrollBarOverlay_Track_Regular_%@_%@"), v6, v8));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _kitImageNamed:withTrait:](UIImage, "_kitImageNamed:withTrait:", v12, v9));
  }

  if (v13)
  {
    v18 = objc_retainAutorelease(v13);
    objc_msgSend(v19, "setContents:", objc_msgSend(v18, "CGImage"));
    objc_msgSend(v18, "scale");
    objc_msgSend(v19, "setContentsScale:");
  }

}

- (BOOL)_isExpanded
{
  return 0;
}

- (CALayer)layer
{
  return (CALayer *)objc_loadWeakRetained((id *)&self->_layer);
}

- (void)setLayer:(id)a3
{
  objc_storeWeak((id *)&self->_layer, a3);
}

- (int64_t)themeInterfaceStyle
{
  return self->_themeInterfaceStyle;
}

- (void)setThemeInterfaceStyle:(int64_t)a3
{
  self->_themeInterfaceStyle = a3;
}

- (UITraitCollection)traitCollection
{
  return self->_traitCollection;
}

- (void)setTraitCollection:(id)a3
{
  objc_storeStrong((id *)&self->_traitCollection, a3);
}

- (int)orientation
{
  return self->_orientation;
}

- (BOOL)isKnob
{
  return self->_isKnob;
}

- (void)setIsKnob:(BOOL)a3
{
  self->_isKnob = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traitCollection, 0);
  objc_destroyWeak((id *)&self->_layer);
}

@end
