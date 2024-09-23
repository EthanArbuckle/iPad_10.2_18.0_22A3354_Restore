@implementation TSTTableBadge

+ (id)badgeWithType:(int)a3 color:(id)a4 viewScale:(double)a5 frame:(CGRect)a6
{
  double height;
  double width;
  double y;
  double x;
  uint64_t v12;
  TSTTableBadge *v13;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v12 = *(_QWORD *)&a3;
  v13 = objc_alloc_init(TSTTableBadge);
  -[TSTTableBadge setBadgeType:](v13, "setBadgeType:", v12);
  -[TSTTableBadge setColor:](v13, "setColor:", a4);
  -[TSTTableBadge setViewScale:](v13, "setViewScale:", a5);
  -[TSTTableBadge setFrame:](v13, "setFrame:", x, y, width, height);
  return v13;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSTTableBadge;
  -[TSTTableBadge dealloc](&v3, sel_dealloc);
}

- (void)drawInContext:(CGContext *)a3
{
  int v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  TSUColor *v14;
  CGPath *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;

  v5 = -[TSTTableBadge badgeType](self, "badgeType");
  switch(v5)
  {
    case 3:
      -[TSTTableBadge viewScale](self, "viewScale");
      v17 = v16;
      -[TSTTableBadge frame](self, "frame");
      TSTTableBadgeDrawCellErrorIndicator(a3, v17, v18, v19, v20, v21);
      break;
    case 2:
      -[TSTTableBadge frame](self, "frame");
      break;
    case 1:
      -[TSTTableBadge frame](self, "frame");
      v7 = v6;
      v9 = v8;
      v11 = v10;
      v13 = v12;
      v14 = -[TSTTableBadge color](self, "color");
      CGContextSaveGState(a3);
      v15 = newTSTTableBadgeCellCommentBadgePath(v7, v9, v11, v13);
      CGContextAddPath(a3, v15);
      CGContextSetFillColorWithColor(a3, (CGColorRef)-[TSUColor CGColor](v14, "CGColor"));
      CGContextFillPath(a3);
      CGPathRelease(v15);
      CGContextRestoreGState(a3);
      break;
  }
}

- (int)badgeType
{
  return self->_badgeType;
}

- (void)setBadgeType:(int)a3
{
  self->_badgeType = a3;
}

- (TSUColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (double)viewScale
{
  return self->_viewScale;
}

- (void)setViewScale:(double)a3
{
  self->_viewScale = a3;
}

- (CGRect)frame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_frame.origin.x;
  y = self->_frame.origin.y;
  width = self->_frame.size.width;
  height = self->_frame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  self->_frame = a3;
}

@end
