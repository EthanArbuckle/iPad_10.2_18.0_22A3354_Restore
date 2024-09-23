@implementation CRLCanvasSizingGuideUILayer

- (id)initForRect:(CGRect)a3 withICC:(id)a4 showWidth:(BOOL)a5 showHeight:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  double height;
  double width;
  double y;
  double x;
  id v13;
  CRLCanvasSizingGuideUILayer *v14;
  CRLCanvasSpacingGuideUILayer *v15;
  CRLCanvasSpacingGuideUILayer *v16;
  objc_super v18;

  v6 = a6;
  v7 = a5;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v13 = a4;
  v18.receiver = self;
  v18.super_class = (Class)CRLCanvasSizingGuideUILayer;
  v14 = -[CRLCanvasSizingGuideUILayer init](&v18, "init");
  if (v14)
  {
    if (v7)
    {
      v15 = -[CRLCanvasSpacingGuideUILayer initWithSpacingRect:ofOrientation:icc:useVisibleRect:]([CRLCanvasSpacingGuideUILayer alloc], "initWithSpacingRect:ofOrientation:icc:useVisibleRect:", 0, v13, 0, x, y - (15.0 + 7.0), width, 15.0);
      -[CRLCanvasSizingGuideUILayer addSublayer:](v14, "addSublayer:", v15);

    }
    if (v6)
    {
      v16 = -[CRLCanvasSpacingGuideUILayer initWithSpacingRect:ofOrientation:icc:useVisibleRect:]([CRLCanvasSpacingGuideUILayer alloc], "initWithSpacingRect:ofOrientation:icc:useVisibleRect:", 1, v13, 0, x - (15.0 + 7.0), y, 15.0, height);
      -[CRLCanvasSizingGuideUILayer addSublayer:](v14, "addSublayer:", v16);

    }
  }

  return v14;
}

- (id)initForLayout:(id)a3 withICC:(id)a4 showWidth:(BOOL)a5 showHeight:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  id v10;
  id v11;
  double v12;
  double v13;
  id v14;
  double v15;
  _OWORD v17[3];
  __int128 v18;
  __int128 v19;
  __int128 v20;

  v6 = a6;
  v7 = a5;
  v10 = a3;
  v11 = a4;
  objc_msgSend(v11, "viewScale");
  v13 = v12;
  objc_msgSend(v10, "boundsForStandardKnobs");
  v14 = -[CRLCanvasSizingGuideUILayer initForRect:withICC:showWidth:showHeight:](self, "initForRect:withICC:showWidth:showHeight:", v11, v7, v6);

  v19 = 0u;
  v20 = 0u;
  v18 = 0u;
  if (v10)
  {
    objc_msgSend(v10, "transformInRoot");
    v15 = *(double *)&v20;
  }
  else
  {
    v15 = 0.0;
  }
  *(_QWORD *)&v20 = sub_1003C65A0(v13 * v15);
  *((_QWORD *)&v20 + 1) = sub_1003C65A0(v13 * *((double *)&v20 + 1));
  v17[0] = v18;
  v17[1] = v19;
  v17[2] = v20;
  objc_msgSend(v14, "setAffineTransform:", v17);

  return v14;
}

@end
