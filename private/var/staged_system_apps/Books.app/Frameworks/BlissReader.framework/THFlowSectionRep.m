@implementation THFlowSectionRep

- (void)canvasDidScrollInFlowMode
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MaxY;
  double MinY;
  CGFloat rect;
  CGRect v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;

  if (!objc_msgSend(objc_msgSend(-[THFlowSectionRep layout](self, "layout"), "children"), "count"))
  {
    objc_msgSend(-[THFlowSectionRep interactiveCanvasController](self, "interactiveCanvasController"), "visibleUnscaledRectForContent");
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;
    -[THFlowSectionRep frameInUnscaledCanvas](self, "frameInUnscaledCanvas");
    y = v17.origin.y;
    width = v17.size.width;
    height = v17.size.height;
    rect = v17.origin.x;
    MaxY = CGRectGetMaxY(v17);
    v18.origin.x = v4;
    v18.origin.y = v6;
    v18.size.width = v8;
    v18.size.height = v10;
    if (MaxY > CGRectGetMinY(v18))
    {
      v19.origin.x = rect;
      v19.origin.y = y;
      v19.size.width = width;
      v19.size.height = height;
      MinY = CGRectGetMinY(v19);
      v20.origin.x = v4;
      v20.origin.y = v6;
      v20.size.width = v8;
      v20.size.height = v10;
      if (MinY < CGRectGetMaxY(v20))
        objc_msgSend(-[THFlowSectionRep interactiveCanvasController](self, "interactiveCanvasController"), "invalidateLayoutInBackground:", -[THFlowSectionRep layout](self, "layout"));
    }
  }
}

@end
