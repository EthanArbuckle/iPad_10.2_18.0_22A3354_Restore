@implementation CRLMovieKnob

- (CRLMovieKnob)initWithImage:(id)a3 radius:(double)a4 backgroundColor:(id)a5 onRep:(id)a6
{
  id v11;
  id v12;
  id v13;
  CRLMovieKnob *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  objc_super v28;

  v11 = a5;
  objc_storeStrong((id *)&self->_backgroundColor, a5);
  v12 = a6;
  v13 = a3;
  v28.receiver = self;
  v28.super_class = (Class)CRLMovieKnob;
  v14 = -[CRLCanvasButtonKnob initWithImage:radius:tag:onRep:](&v28, "initWithImage:radius:tag:onRep:", 0, 5, v12, a4);

  -[CRLCanvasKnob setWorksWhenEditingDisabled:](v14, "setWorksWhenEditingDisabled:", 1);
  -[CRLCanvasKnob setWorksWhenRepLocked:](v14, "setWorksWhenRepLocked:", 1);
  -[CRLCanvasKnob setShouldDisplayDirectlyOverRep:](v14, "setShouldDisplayDirectlyOverRep:", 1);
  -[CRLCanvasKnob setRadius:](v14, "setRadius:", a4);
  -[CRLCanvasButtonKnob setImage:](v14, "setImage:", v13);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnob renderable](v14, "renderable"));
  objc_msgSend(v15, "bounds");
  v17 = v16;

  if (v17 != 0.0)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnob renderable](v14, "renderable"));
    objc_msgSend(v18, "bounds");
    v23 = sub_100061400(v19, v20, v21, v22);
    v25 = v24;
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasButtonKnob imageRenderable](v14, "imageRenderable"));
    objc_msgSend(v26, "setPosition:", v23, v25);

  }
  -[CRLMovieKnob setHidden:](v14, "setHidden:", 0);

  return v14;
}

- (CRLMovieKnob)initWithImage:(id)a3 size:(CGSize)a4 backgroundColor:(id)a5 cornerRadius:(double)a6 onRep:(id)a7
{
  self->_size = a4;
  self->_cornerRadius = a6;
  return -[CRLMovieKnob initWithImage:radius:backgroundColor:onRep:](self, "initWithImage:radius:backgroundColor:onRep:", a3, a5, a7, 0.0);
}

- (void)updateHitRegionPath
{
  double v3;
  id v4;

  -[CRLCanvasKnob radius](self, "radius");
  v4 = (id)objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPathWithOvalInRect:](CRLBezierPath, "bezierPathWithOvalInRect:", -v3, -v3, v3 + v3, v3 + v3));
  -[CRLCanvasKnob setHitRegionPath:](self, "setHitRegionPath:", v4);

}

- (void)setBackgroundCircleColor:(id)a3
{
  id v4;
  uint64_t v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;

  v4 = a3;
  *(_QWORD *)&v6 = objc_opt_class(CRLCanvasShapeRenderable, v5).n128_u64[0];
  v8 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnob renderable](self, "renderable", v6));
  v10 = sub_100221D0C(v8, v9);
  v13 = (id)objc_claimAutoreleasedReturnValue(v10);

  v11 = objc_msgSend(v4, "CGColor");
  objc_msgSend(v13, "setFillColor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[CRLColor clearColor](CRLColor, "clearColor"));
  objc_msgSend(v13, "setStrokeColor:", objc_msgSend(v12, "CGColor"));

}

- (id)createKnobRenderable
{
  id v3;
  double v4;
  CGPath *Mutable;
  double v6;
  CGFloat v7;
  double y;
  CGRect v10;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[CRLCanvasShapeRenderable renderable](CRLCanvasShapeRenderable, "renderable"));
  -[CRLCanvasKnob radius](self, "radius");
  if (v4 == 0.0)
  {
    objc_msgSend(v3, "setBounds:", sub_10005FDDC());
    objc_msgSend(v3, "setCornerRadius:", self->_cornerRadius);
    objc_msgSend(v3, "setBackgroundColor:", -[CRLColor CGColor](self->_backgroundColor, "CGColor"));
  }
  else
  {
    Mutable = CGPathCreateMutable();
    -[CRLCanvasKnob radius](self, "radius");
    v7 = v6 + v6;
    y = CGPointZero.y;
    objc_msgSend(v3, "setBounds:", CGPointZero.x, y, v7, v7);
    v10.origin.x = CGPointZero.x;
    v10.origin.y = y;
    v10.size.width = v7;
    v10.size.height = v7;
    CGPathAddEllipseInRect(Mutable, 0, v10);
    objc_msgSend(v3, "setPath:", Mutable);
    CGPathRelease(Mutable);
    objc_msgSend(v3, "setFillColor:", -[CRLColor CGColor](self->_backgroundColor, "CGColor"));
  }

  return v3;
}

- (BOOL)isHidden
{
  return self->_hidden;
}

- (void)setHidden:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  if (self->_hidden != a3)
  {
    v3 = a3;
    self->_hidden = a3;
    v4 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnob renderable](self, "renderable"));
    objc_msgSend(v4, "setHidden:", v3);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

@end
