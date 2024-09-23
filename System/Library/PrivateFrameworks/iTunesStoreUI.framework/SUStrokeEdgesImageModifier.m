@implementation SUStrokeEdgesImageModifier

- (void)dealloc
{
  objc_super v3;

  self->_strokeColor = 0;
  v3.receiver = self;
  v3.super_class = (Class)SUStrokeEdgesImageModifier;
  -[SUStrokeEdgesImageModifier dealloc](&v3, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  BOOL v17;
  BOOL v18;
  BOOL v19;
  int v20;
  int v21;
  BOOL v22;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_14;
  -[SUStrokeEdgesImageModifier edgeInsets](self, "edgeInsets");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  objc_msgSend(a3, "edgeInsets");
  v17 = v8 == v16 && v6 == v13;
  v18 = v17 && v12 == v15;
  v19 = v18 && v10 == v14;
  if (v19
    && (v20 = -[SUStrokeEdgesImageModifier fitToImage](self, "fitToImage"),
        v20 == objc_msgSend(a3, "fitToImage")))
  {
    v21 = -[UIColor isEqual:](-[SUStrokeEdgesImageModifier strokeColor](self, "strokeColor"), "isEqual:", objc_msgSend(a3, "strokeColor"));
    if (v21)
    {
      v22 = -[SUStrokeEdgesImageModifier strokeCurrentPath](self, "strokeCurrentPath");
      LOBYTE(v21) = v22 ^ objc_msgSend(a3, "strokeCurrentPath") ^ 1;
    }
  }
  else
  {
LABEL_14:
    LOBYTE(v21) = 0;
  }
  return v21;
}

- (void)drawAfterImageForContext:(CGContext *)a3 imageFrame:(CGRect)a4 finalSize:(CGSize)a5
{
  double height;
  double width;
  double y;
  CGFloat x;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGFloat v21;
  double v22;
  BOOL v23;
  double v24;
  double v25;
  double v26;
  CGFloat v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double rect;
  double rect_8;
  CGFloat rect_8a;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;

  height = a5.height;
  width = a5.width;
  rect = a4.size.height;
  rect_8 = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  CGContextSetCompositeOperation();
  -[SUStrokeEdgesImageModifier edgeInsets](self, "edgeInsets");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  if (-[SUStrokeEdgesImageModifier strokeCurrentPath](self, "strokeCurrentPath"))
  {
    if (v12 >= v16)
      v19 = v12;
    else
      v19 = v16;
    if (v14 >= v18)
      v20 = v14;
    else
      v20 = v18;
    if (v19 < v20)
      v19 = v20;
    CGContextSetLineWidth(a3, v19);
    CGContextSetStrokeColorWithColor(a3, -[UIColor CGColor](-[SUStrokeEdgesImageModifier strokeColor](self, "strokeColor"), "CGColor"));
    CGContextStrokePath(a3);
  }
  else
  {
    v32 = v16;
    CGContextSetFillColorWithColor(a3, -[UIColor CGColor](-[SUStrokeEdgesImageModifier strokeColor](self, "strokeColor"), "CGColor"));
    v31 = *MEMORY[0x24BDBF090];
    v21 = x;
    v22 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v23 = -[SUStrokeEdgesImageModifier fitToImage](self, "fitToImage");
    if (height >= width)
      v24 = height;
    else
      v24 = width;
    if (height >= width)
      v25 = width;
    else
      v25 = height;
    if (rect_8 > rect)
      v26 = v25;
    else
      v26 = v24;
    if (rect_8 <= rect)
      v24 = v25;
    if (v23)
      v27 = rect;
    else
      v27 = v26;
    if (v23)
      v28 = rect_8;
    else
      v28 = v24;
    if (v23)
      v29 = y;
    else
      v29 = v22;
    rect_8a = v29;
    if (v23)
      v30 = v21;
    else
      v30 = v31;
    if (v12 > 0.00000011920929)
    {
      v36.size.width = v28 - v14 - v18;
      v36.origin.x = v14 + v30;
      v36.origin.y = rect_8a;
      v36.size.height = v12;
      CGContextFillRect(a3, v36);
    }
    if (v18 > 0.00000011920929)
    {
      v37.origin.x = v30;
      v37.origin.y = rect_8a;
      v37.size.width = v28;
      v37.size.height = v27;
      v38.origin.x = CGRectGetMaxX(v37) - v18;
      v38.origin.y = rect_8a;
      v38.size.width = v18;
      v38.size.height = v27;
      CGContextFillRect(a3, v38);
    }
    if (v32 > 0.00000011920929)
    {
      v39.origin.x = v30;
      v39.origin.y = rect_8a;
      v39.size.width = v28;
      v39.size.height = v27;
      v40.origin.y = CGRectGetMaxY(v39) - v32;
      v40.size.width = v28 - v14 - v18;
      v40.origin.x = v14 + v30;
      v40.size.height = v32;
      CGContextFillRect(a3, v40);
    }
    if (v14 > 0.00000011920929)
    {
      v41.origin.x = v30;
      v41.origin.y = rect_8a;
      v41.size.width = v14;
      v41.size.height = v27;
      CGContextFillRect(a3, v41);
    }
  }
}

- (UIEdgeInsets)edgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_edgeInsets.top;
  left = self->_edgeInsets.left;
  bottom = self->_edgeInsets.bottom;
  right = self->_edgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setEdgeInsets:(UIEdgeInsets)a3
{
  self->_edgeInsets = a3;
}

- (BOOL)fitToImage
{
  return self->_fitToImage;
}

- (void)setFitToImage:(BOOL)a3
{
  self->_fitToImage = a3;
}

- (UIColor)strokeColor
{
  return self->_strokeColor;
}

- (void)setStrokeColor:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (BOOL)strokeCurrentPath
{
  return self->_strokeCurrentPath;
}

- (void)setStrokeCurrentPath:(BOOL)a3
{
  self->_strokeCurrentPath = a3;
}

@end
