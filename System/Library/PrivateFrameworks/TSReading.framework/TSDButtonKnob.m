@implementation TSDButtonKnob

- (TSDButtonKnob)initWithImage:(id)a3 tag:(unint64_t)a4 onRep:(id)a5
{
  double v9;
  double v10;
  TSDButtonKnob *v11;
  objc_super v13;

  if (a3)
  {
    objc_msgSend(a3, "size");
  }
  else
  {
    v9 = *MEMORY[0x24BDBF148];
    v10 = *(double *)(MEMORY[0x24BDBF148] + 8);
  }
  v13.receiver = self;
  v13.super_class = (Class)TSDButtonKnob;
  v11 = -[TSDKnob initWithType:position:radius:tag:onRep:](&v13, sel_initWithType_position_radius_tag_onRep_, 0, a4, a5, *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8), fmax(v9, v10) * 0.5);
  if (v11)
  {
    v11->mImage = (TSUImage *)a3;
    v11->mEnabled = 1;
  }
  return v11;
}

- (TSDButtonKnob)initWithType:(int)a3 position:(CGPoint)a4 radius:(double)a5 tag:(unint64_t)a6 onRep:(id)a7
{
  return -[TSDButtonKnob initWithImage:tag:onRep:](self, "initWithImage:tag:onRep:", 0, a6, a7, a4.x, a4.y, a5);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSDButtonKnob;
  -[TSDKnob dealloc](&v3, sel_dealloc);
}

- (BOOL)isHitByUnscaledPoint:(CGPoint)a3 andRep:(id)a4 returningDistance:(double *)a5
{
  double y;
  double x;
  CALayer *v10;
  float v11;
  objc_super v13;

  y = a3.y;
  x = a3.x;
  v10 = -[TSDKnob layer](self, "layer");
  if (-[CALayer isHidden](v10, "isHidden"))
    return 0;
  -[CALayer opacity](v10, "opacity");
  if (v11 <= 0.0)
    return 0;
  v13.receiver = self;
  v13.super_class = (Class)TSDButtonKnob;
  return -[TSDKnob isHitByUnscaledPoint:andRep:returningDistance:](&v13, sel_isHitByUnscaledPoint_andRep_returningDistance_, a4, a5, x, y);
}

- (id)knobImage
{
  void *v3;
  TSUImage *mImage;
  CGFloat v5;
  CGBlendMode v6;

  if (!-[TSDButtonKnob isEnabled](self, "isEnabled"))
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C40], "lightGrayColor");
    mImage = self->mImage;
    v5 = 0.5;
    v6 = kCGBlendModeDestinationOut;
    return TSUCompositeImageWithColor(mImage, v3, v6, v5);
  }
  if (-[TSDButtonKnob isHighlighted](self, "isHighlighted"))
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C40], "blackColor");
    mImage = self->mImage;
    v5 = 0.466666669;
    v6 = kCGBlendModeSourceAtop;
    return TSUCompositeImageWithColor(mImage, v3, v6, v5);
  }
  return self->mImage;
}

- (void)setImage:(id)a3
{
  TSUImage *mImage;

  mImage = self->mImage;
  if (mImage != a3)
  {

    self->mImage = (TSUImage *)a3;
    -[TSDButtonKnob p_updateLayerImage](self, "p_updateLayerImage");
  }
}

- (void)setEnabled:(BOOL)a3
{
  if (self->mEnabled != a3)
  {
    self->mEnabled = a3;
    -[TSDButtonKnob p_updateLayerImage](self, "p_updateLayerImage");
  }
}

- (void)setHighlighted:(BOOL)a3
{
  if (self->mHighlighted != a3)
  {
    self->mHighlighted = a3;
    -[TSDButtonKnob p_updateLayerImage](self, "p_updateLayerImage");
  }
}

- (void)p_updateLayerImage
{
  id v3;
  uint64_t v4;

  v3 = -[TSDButtonKnob knobImage](self, "knobImage");
  -[TSDCanvas contentsScale](-[TSDRep canvas](-[TSDKnob rep](self, "rep"), "canvas"), "contentsScale");
  v4 = objc_msgSend(v3, "CGImageForContentsScale:");
  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
  -[CALayer setContents:](-[TSDKnob layer](self, "layer"), "setContents:", v4);
  objc_msgSend(MEMORY[0x24BDE57D8], "commit");
}

- (TSUImage)image
{
  return self->mImage;
}

- (BOOL)isEnabled
{
  return self->mEnabled;
}

- (BOOL)isHighlighted
{
  return self->mHighlighted;
}

@end
