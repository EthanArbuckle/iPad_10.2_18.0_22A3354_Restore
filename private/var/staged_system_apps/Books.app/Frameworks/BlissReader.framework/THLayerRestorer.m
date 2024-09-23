@implementation THLayerRestorer

- (THLayerRestorer)initWithLayer:(id)a3
{
  THLayerRestorer *v4;
  CALayer *v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)THLayerRestorer;
  v4 = -[THLayerRestorer init](&v11, "init");
  if (v4)
  {
    v5 = (CALayer *)objc_msgSend(a3, "superlayer");
    v4->mSuperlayer = v5;
    v4->mZOrder = -[NSArray indexOfObject:](-[CALayer sublayers](v5, "sublayers"), "indexOfObject:", a3);
    objc_msgSend(a3, "frame");
    v4->mFrame.origin.x = v6;
    v4->mFrame.origin.y = v7;
    v4->mFrame.size.width = v8;
    v4->mFrame.size.height = v9;
  }
  return v4;
}

- (void)restoreLayer:(id)a3
{
  objc_msgSend(a3, "setFrame:", self->mFrame.origin.x, self->mFrame.origin.y, self->mFrame.size.width, self->mFrame.size.height);
  -[CALayer insertSublayer:atIndex:](self->mSuperlayer, "insertSublayer:atIndex:", a3, LODWORD(self->mZOrder));
}

@end
