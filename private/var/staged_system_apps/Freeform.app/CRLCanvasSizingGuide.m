@implementation CRLCanvasSizingGuide

- (CRLCanvasSizingGuide)initWithType:(int64_t)a3 frame:(CGRect)a4
{
  double height;
  double width;
  CGFloat y;
  CGFloat x;
  CRLCanvasSizingGuide *v9;
  CRLCanvasSizingGuide *v10;
  double v11;
  objc_super v13;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v13.receiver = self;
  v13.super_class = (Class)CRLCanvasSizingGuide;
  v9 = -[CRLCanvasAbstractGuide init](&v13, "init");
  v10 = v9;
  if (v9)
  {
    v9->mAlignmentFrame.origin.x = x;
    v9->mAlignmentFrame.origin.y = y;
    v9->mAlignmentFrame.size.width = width;
    v9->mAlignmentFrame.size.height = height;
    v9->mIsHorizontal = a3 == 0;
    if (a3)
      v11 = height;
    else
      v11 = width;
    -[CRLCanvasAbstractGuide setOffset:](v9, "setOffset:", v11);
  }
  return v10;
}

- (BOOL)isAssociatedContentVisibleInUnscaledRect:(CGRect)a3
{
  return sub_100060F38(self->mAlignmentFrame.origin.x, self->mAlignmentFrame.origin.y, self->mAlignmentFrame.size.width, self->mAlignmentFrame.size.height, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (id)renderableWithICC:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  CRLCanvasSizingGuideUILayer *v8;
  id v9;
  void *v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CRLCanvasRenderable renderable](CRLCanvasRenderable, "renderable"));
  v6 = -[CRLCanvasSizingGuideUILayer initForRect:withICC:showWidth:showHeight:]([CRLCanvasSizingGuideUILayer alloc], "initForRect:withICC:showWidth:showHeight:", v4, self->mAlignmentFrame.origin.x, self->mAlignmentFrame.origin.y, self->mAlignmentFrame.size.width, self->mAlignmentFrame.size.height);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[CRLCanvasRenderable renderableFromLayer:](CRLCanvasRenderable, "renderableFromLayer:", v6));
  objc_msgSend(v5, "addSubrenderable:", v7);

  v8 = [CRLCanvasSizingGuideUILayer alloc];
  -[CRLCanvasAbstractGuide snappingObjectFrame](self, "snappingObjectFrame");
  v9 = -[CRLCanvasSizingGuideUILayer initForRect:withICC:showWidth:showHeight:](v8, "initForRect:withICC:showWidth:showHeight:", v4);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[CRLCanvasRenderable renderableFromLayer:](CRLCanvasRenderable, "renderableFromLayer:", v9));
  objc_msgSend(v5, "addSubrenderable:", v10);

  return v5;
}

- (id)description
{
  const __CFString *v2;

  if (self->mIsHorizontal)
    v2 = CFSTR("Horizontal");
  else
    v2 = CFSTR("Vertical");
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<CRLCanvasSizingGuide %p: %@ sizing guide with offset %f>"), self, v2, *(_QWORD *)&self->super.mOffset);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mLayer, 0);
}

@end
