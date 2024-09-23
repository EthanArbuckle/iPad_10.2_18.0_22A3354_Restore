@implementation TSKHighlightController

- (void)setPath:(CGPath *)a3
{
  CGPath *path;

  path = self->_path;
  if (path != a3)
  {
    CGPathRelease(path);
    self->_path = CGPathRetain(a3);
  }
}

- (void)dealloc
{
  objc_super v3;

  -[TSKHighlightController reset](self, "reset");
  v3.receiver = self;
  v3.super_class = (Class)TSKHighlightController;
  -[TSKHighlightController dealloc](&v3, sel_dealloc);
}

- (void)reset
{
  -[TSKHighlightController setImage:](self, "setImage:", 0);
  -[TSKHighlightController setPath:](self, "setPath:", 0);
  -[CALayer setDelegate:](self->_containingLayer, "setDelegate:", 0);
  -[NSArray makeObjectsPerformSelector:withObject:](-[CALayer sublayers](self->_containingLayer, "sublayers"), "makeObjectsPerformSelector:withObject:", sel_setDelegate_, 0);

  self->_containingLayer = 0;
}

- (BOOL)drawRoundedRect
{
  return 0;
}

- (id)actionForLayer:(id)a3 forKey:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x24BDBCEF8], "null", a3, a4);
}

- (void)hide
{
  -[CALayer setHidden:](self->_containingLayer, "setHidden:", 1);
}

- (void)createLayerWithZOrder:(double)a3 contentsScaleForLayers:(double)a4
{
  void *v7;
  uint64_t v8;
  CALayer *v9;
  double v10;
  double v11;
  CALayer *v12;

  if (self->_containingLayer)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKHighlightController createLayerWithZOrder:contentsScaleForLayers:]");
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKHighlightController.m"), 91, CFSTR("Shouldn't be creating _containingLayer again"));
    -[TSKHighlightController reset](self, "reset");
  }
  if (a4 <= 0.0)
    a4 = 1.0;
  v9 = (CALayer *)objc_alloc_init(MEMORY[0x24BDE56D0]);
  self->_containingLayer = v9;
  v10 = *MEMORY[0x24BDBEFB0];
  v11 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  -[CALayer setAnchorPoint:](v9, "setAnchorPoint:", *MEMORY[0x24BDBEFB0], v11);
  -[CALayer setEdgeAntialiasingMask:](self->_containingLayer, "setEdgeAntialiasingMask:", 0);
  -[CALayer setContentsScale:](self->_containingLayer, "setContentsScale:", a4);
  -[CALayer setZPosition:](self->_containingLayer, "setZPosition:", a3);
  -[CALayer setDelegate:](self->_containingLayer, "setDelegate:", self);
  v12 = (CALayer *)objc_alloc_init(MEMORY[0x24BDE56D0]);
  self->_imageLayer = v12;
  -[CALayer setAnchorPoint:](v12, "setAnchorPoint:", v10, v11);
  -[CALayer setEdgeAntialiasingMask:](self->_imageLayer, "setEdgeAntialiasingMask:", 0);
  -[CALayer setContentsScale:](self->_imageLayer, "setContentsScale:", a4);
  -[CALayer addSublayer:](self->_containingLayer, "addSublayer:", self->_imageLayer);
  -[CALayer setDelegate:](self->_imageLayer, "setDelegate:", self);

}

- (CGRect)buildLayersForPath:(CGPath *)a3 withImage:(id)a4
{
  double *v7;
  CGSize v8;
  __int128 v9;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v14;
  double v15;
  CGFloat v16;
  CGFloat v17;
  double v18;
  double v19;
  double v20;
  double v21;
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
  CGAffineTransform v32;
  CGAffineTransform v33;
  CGRect BoundingBox;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect result;

  v7 = (double *)MEMORY[0x24BDBF090];
  v8 = *(CGSize *)(MEMORY[0x24BDBF090] + 16);
  self->_overallRect.origin = (CGPoint)*MEMORY[0x24BDBF090];
  self->_overallRect.size = v8;
  -[TSKHighlightController setImage:](self, "setImage:", a4);
  -[TSKHighlightController setPath:](self, "setPath:", a3);
  if (a3)
  {
    BoundingBox = CGPathGetBoundingBox(a3);
    v35 = CGRectIntegral(BoundingBox);
    v9 = *(_OWORD *)&self->_layerTransform.c;
    *(_OWORD *)&v33.a = *(_OWORD *)&self->_layerTransform.a;
    *(_OWORD *)&v33.c = v9;
    *(_OWORD *)&v33.tx = *(_OWORD *)&self->_layerTransform.tx;
    v36 = CGRectApplyAffineTransform(v35, &v33);
    x = v36.origin.x;
    y = v36.origin.y;
    width = v36.size.width;
    height = v36.size.height;
    -[TSKHighlightController viewScale](self, "viewScale");
    if (v14 != 0.0)
    {
      -[TSKHighlightController viewScale](self, "viewScale");
      v16 = v15;
      -[TSKHighlightController viewScale](self, "viewScale");
      CGAffineTransformMakeScale(&v32, v16, v17);
      v37.origin.x = x;
      v37.origin.y = y;
      v37.size.width = width;
      v37.size.height = height;
      v38 = CGRectApplyAffineTransform(v37, &v32);
      x = v38.origin.x;
      y = v38.origin.y;
      width = v38.size.width;
      height = v38.size.height;
    }
    v39.origin.x = x;
    v39.origin.y = y;
    v39.size.width = width;
    v39.size.height = height;
    self->_overallRect = CGRectIntegral(v39);
    -[CALayer setFrame:](self->_containingLayer, "setFrame:", *v7, v7[1], v7[2], v7[3]);
    v18 = self->_overallRect.origin.x;
    v19 = self->_overallRect.origin.y;
    v20 = self->_overallRect.size.width;
    v21 = self->_overallRect.size.height;
    objc_msgSend(a4, "size");
    v23 = v22;
    v25 = v24;
    *(float *)&v22 = (v24 - v21) * 0.5;
    *(float *)&v24 = (v23 - v20) * 0.5;
    v26 = v18 - roundf(*(float *)&v24);
    v27 = v19 - roundf(*(float *)&v22);
    -[CALayer setContents:](self->_imageLayer, "setContents:", -[TSUImage CGImage](self->_image, "CGImage"));
    -[CALayer setFrame:](self->_imageLayer, "setFrame:", v26, v27, v23, v25);
    -[CALayer setContentsGravity:](self->_imageLayer, "setContentsGravity:", *MEMORY[0x24BDE5C78]);
    -[CALayer setHidden:](self->_containingLayer, "setHidden:", 0);
  }
  v28 = self->_overallRect.origin.x;
  v29 = self->_overallRect.origin.y;
  v30 = self->_overallRect.size.width;
  v31 = self->_overallRect.size.height;
  result.size.height = v31;
  result.size.width = v30;
  result.origin.y = v29;
  result.origin.x = v28;
  return result;
}

- (void)setTransform:(CGAffineTransform *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;

  v3 = *(_OWORD *)&a3->a;
  v4 = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_layerTransform.tx = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_layerTransform.c = v4;
  *(_OWORD *)&self->_layerTransform.a = v3;
  v5 = *(_OWORD *)&a3->a;
  v6 = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_canvasTransform.tx = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_canvasTransform.c = v6;
  *(_OWORD *)&self->_canvasTransform.a = v5;
}

- (CGAffineTransform)transform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].d;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[1].b;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[1].ty;
  return self;
}

- (void)setCanvasTransform:(CGAffineTransform *)a3 layerTransform:(CGAffineTransform *)a4
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;

  v4 = *(_OWORD *)&a3->a;
  v5 = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_canvasTransform.tx = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_canvasTransform.c = v5;
  *(_OWORD *)&self->_canvasTransform.a = v4;
  v6 = *(_OWORD *)&a4->a;
  v7 = *(_OWORD *)&a4->c;
  *(_OWORD *)&self->_layerTransform.tx = *(_OWORD *)&a4->tx;
  *(_OWORD *)&self->_layerTransform.c = v7;
  *(_OWORD *)&self->_layerTransform.a = v6;
}

- (CALayer)layer
{
  return self->_containingLayer;
}

- (double)viewScale
{
  return self->_viewScale;
}

- (void)setViewScale:(double)a3
{
  self->_viewScale = a3;
}

- (CGPath)path
{
  return self->_path;
}

- (TSUImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

@end
