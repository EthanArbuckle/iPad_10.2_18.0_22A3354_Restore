@implementation CRLCanvasButtonKnob

- (CRLCanvasButtonKnob)initWithImage:(id)a3 highlightedImage:(id)a4 radius:(double)a5 tag:(unint64_t)a6 onRep:(id)a7
{
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  double v17;
  id v18;
  double v19;
  CRLCanvasButtonKnob *v20;
  CRLCanvasButtonKnob *v21;
  uint64_t v22;
  CRLCanvasRenderable *imageRenderable;
  void *v24;
  objc_super v26;

  v13 = a3;
  v14 = a4;
  v16 = a7;
  if (a5 == 0.0)
  {
    *(_QWORD *)&v17 = objc_opt_class(self, v15).n128_u64[0];
    objc_msgSend(v18, "p_radiusFromImage:", v13, v17);
    a5 = v19;
  }
  v26.receiver = self;
  v26.super_class = (Class)CRLCanvasButtonKnob;
  v20 = -[CRLCanvasKnob initWithType:position:radius:tag:onRep:](&v26, "initWithType:position:radius:tag:onRep:", 0, a6, v16, CGPointZero.x, CGPointZero.y, a5);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_image, a3);
    objc_storeStrong((id *)&v21->_highlightedImage, a4);
    v21->_enabled = 1;
    v22 = objc_claimAutoreleasedReturnValue(+[CRLCanvasRenderable renderable](CRLCanvasRenderable, "renderable"));
    imageRenderable = v21->_imageRenderable;
    v21->_imageRenderable = (CRLCanvasRenderable *)v22;

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnob renderable](v21, "renderable"));
    objc_msgSend(v24, "addSubrenderable:", v21->_imageRenderable);

  }
  return v21;
}

- (CRLCanvasButtonKnob)initWithImage:(id)a3 radius:(double)a4 tag:(unint64_t)a5 onRep:(id)a6
{
  return -[CRLCanvasButtonKnob initWithImage:highlightedImage:radius:tag:onRep:](self, "initWithImage:highlightedImage:radius:tag:onRep:", a3, 0, a5, a6, a4);
}

+ (double)p_radiusFromImage:(id)a3
{
  double width;
  double height;

  if (a3)
  {
    objc_msgSend(a3, "size");
  }
  else
  {
    width = CGSizeZero.width;
    height = CGSizeZero.height;
  }
  return fmax(width, height) * 0.5;
}

- (BOOL)isHitByUnscaledPoint:(CGPoint)a3 inputType:(int64_t)a4 returningDistance:(double *)a5
{
  double y;
  double x;
  void *v10;
  float v11;
  BOOL v12;
  objc_super v14;

  y = a3.y;
  x = a3.x;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnob renderable](self, "renderable"));
  if ((objc_msgSend(v10, "isHidden") & 1) != 0 || (objc_msgSend(v10, "opacity"), v11 <= 0.0))
  {
    v12 = 0;
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)CRLCanvasButtonKnob;
    v12 = -[CRLCanvasKnob isHitByUnscaledPoint:inputType:returningDistance:](&v14, "isHitByUnscaledPoint:inputType:returningDistance:", a4, a5, x, y);
  }

  return v12;
}

- (id)knobImage
{
  void *v3;
  void *v4;
  CRLImage *v5;
  CRLImage *v6;
  void *v8;

  if (-[CRLCanvasButtonKnob isEnabled](self, "isEnabled"))
  {
    if (!-[CRLCanvasButtonKnob isHighlighted](self, "isHighlighted"))
    {
      v6 = self->_image;
      return v6;
    }
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasButtonKnob highlightedImage](self, "highlightedImage"));
    v4 = v3;
    if (!v3)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[CRLColor blackColor](CRLColor, "blackColor"));
      v6 = (CRLImage *)objc_claimAutoreleasedReturnValue(-[CRLImage compositedImageWithColor:alpha:blendMode:](self->_image, "compositedImageWithColor:alpha:blendMode:", v8, 20, 0.466666669));

      goto LABEL_7;
    }
    v5 = v3;
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[CRLColor lightGrayColor](CRLColor, "lightGrayColor"));
    v5 = (CRLImage *)objc_claimAutoreleasedReturnValue(-[CRLImage compositedImageWithColor:alpha:blendMode:](self->_image, "compositedImageWithColor:alpha:blendMode:", v4, 23, 0.5));
  }
  v6 = v5;
LABEL_7:

  return v6;
}

- (void)setImage:(id)a3
{
  CRLImage *v5;
  uint64_t v6;
  double v7;
  double v8;
  id v9;
  CRLImage *v10;

  v5 = (CRLImage *)a3;
  if (self->_image != v5)
  {
    v10 = v5;
    objc_storeStrong((id *)&self->_image, a3);
    -[CRLCanvasKnob radius](self, "radius");
    if (v10 && v7 == 0.0)
    {
      *(_QWORD *)&v8 = objc_opt_class(self, v6).n128_u64[0];
      objc_msgSend(v9, "p_radiusFromImage:", v10, v8);
      -[CRLCanvasKnob setRadius:](self, "setRadius:");
      -[CRLCanvasKnob updateHitRegionPath](self, "updateHitRegionPath");
    }
    -[CRLCanvasButtonKnob updateRenderableImage](self, "updateRenderableImage");
    v5 = v10;
  }

}

- (void)setHighlightedImage:(id)a3
{
  CRLImage *v5;
  CRLImage *v6;

  v5 = (CRLImage *)a3;
  if (self->_highlightedImage != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_highlightedImage, a3);
    -[CRLCanvasButtonKnob updateRenderableImage](self, "updateRenderableImage");
    v5 = v6;
  }

}

- (void)setEnabled:(BOOL)a3
{
  if (self->_enabled != a3)
  {
    self->_enabled = a3;
    -[CRLCanvasButtonKnob updateRenderableImage](self, "updateRenderableImage");
  }
}

- (void)setHighlighted:(BOOL)a3
{
  if (self->_highlighted != a3)
  {
    self->_highlighted = a3;
    -[CRLCanvasButtonKnob updateRenderableImage](self, "updateRenderableImage");
  }
}

- (void)updateRenderableImage
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasButtonKnob knobImage](self, "knobImage"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnob rep](self, "rep"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "canvas"));
  objc_msgSend(v5, "contentsScale");
  v6 = objc_msgSend(v3, "CGImageForContentsScale:");

  +[CATransaction begin](CATransaction, "begin");
  +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
  v8 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasButtonKnob imageRenderable](self, "imageRenderable"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasButtonKnob knobImage](self, "knobImage"));
  objc_msgSend(v7, "size");
  objc_msgSend(v8, "setBounds:", sub_10005FDDC());

  objc_msgSend(v8, "setContents:", v6);
  +[CATransaction commit](CATransaction, "commit");

}

- (CRLImage)image
{
  return self->_image;
}

- (CRLImage)highlightedImage
{
  return self->_highlightedImage;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

- (CRLCanvasRenderable)imageRenderable
{
  return (CRLCanvasRenderable *)objc_getProperty(self, a2, 128, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageRenderable, 0);
  objc_storeStrong((id *)&self->_highlightedImage, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end
