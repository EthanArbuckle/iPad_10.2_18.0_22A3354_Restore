@implementation TSDLayout

- (unint64_t)pageIndex
{
  id v2;

  v2 = -[TSDLayout parent](self, "parent");
  if ((objc_opt_respondsToSelector(v2, "pageIndex") & 1) != 0)
    return (unint64_t)objc_msgSend(v2, "pageIndex");
  else
    return 0xFFFFFFFFLL;
}

- (THPageLayout)pageLayout
{
  uint64_t v3;

  v3 = objc_opt_class(TSDLayout, a2);
  return (THPageLayout *)objc_msgSend((id)TSUDynamicCast(v3, -[TSDLayout parent](self, "parent")), "pageLayout");
}

- (THSectionLayout)sectionLayout
{
  uint64_t v3;

  v3 = objc_opt_class(TSDLayout, a2);
  return (THSectionLayout *)objc_msgSend((id)TSUDynamicCast(v3, -[TSDLayout parent](self, "parent")), "sectionLayout");
}

- (THInteractiveCanvasController)interactiveCanvasController
{
  id v2;
  uint64_t v3;
  uint64_t v4;

  v2 = objc_msgSend(-[TSDLayout layoutController](self, "layoutController"), "canvas");
  if (!objc_msgSend(v2, "isCanvasInteractive"))
    return 0;
  v4 = objc_opt_class(THInteractiveCanvasController, v3);
  return (THInteractiveCanvasController *)TSUDynamicCast(v4, objc_msgSend(v2, "canvasController"));
}

+ (id)layoutGeometryFittingLayoutGeometry:(id)a3 inFrame:(CGRect)a4
{
  double height;
  double width;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  id v17;
  double y;
  CGAffineTransform v20;
  CGAffineTransform v21;
  CGAffineTransform v22;
  CGAffineTransform v23;
  CGAffineTransform t1;
  CGAffineTransform t2;
  CGAffineTransform v26;
  CGAffineTransform v27;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  memset(&v27, 0, sizeof(v27));
  if (a3)
    objc_msgSend(a3, "transform");
  objc_msgSend(a3, "frame");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v16 = THScaleNeededToFitSizeInSize(v12, v14, width, height);
  memset(&v26, 0, sizeof(v26));
  CGAffineTransformMakeTranslation(&t2, -v9 - v13 * 0.5, -v11 - v15 * 0.5);
  t1 = v27;
  CGAffineTransformConcat(&v26, &t1, &t2);
  memset(&t1, 0, sizeof(t1));
  CGAffineTransformMakeScale(&v23, v16, v16);
  v22 = v26;
  CGAffineTransformConcat(&t1, &v22, &v23);
  memset(&v22, 0, sizeof(v22));
  CGAffineTransformMakeTranslation(&v21, x + width * 0.5, y + height * 0.5);
  v20 = t1;
  CGAffineTransformConcat(&v22, &v20, &v21);
  v17 = objc_alloc((Class)TSDLayoutGeometry);
  objc_msgSend(a3, "size");
  v20 = v22;
  return objc_msgSend(v17, "initWithSize:transform:", &v20);
}

+ (id)layoutGeometryFittingLayoutGeometry:(id)a3 inFrame:(CGRect)a4 scale:(double)a5
{
  double height;
  double width;
  double y;
  double x;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;
  CGAffineTransform v17;
  CGAffineTransform v18;
  CGAffineTransform v19;
  CGAffineTransform v20;
  CGAffineTransform t1;
  CGAffineTransform t2;
  CGAffineTransform v23;
  CGAffineTransform v24;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  memset(&v24, 0, sizeof(v24));
  if (a3)
    objc_msgSend(a3, "transform");
  objc_msgSend(a3, "frame");
  memset(&v23, 0, sizeof(v23));
  CGAffineTransformMakeTranslation(&t2, -v11 - v12 * 0.5, -v13 - v14 * 0.5);
  t1 = v24;
  CGAffineTransformConcat(&v23, &t1, &t2);
  memset(&t1, 0, sizeof(t1));
  CGAffineTransformMakeScale(&v20, a5, a5);
  v19 = v23;
  CGAffineTransformConcat(&t1, &v19, &v20);
  memset(&v19, 0, sizeof(v19));
  CGAffineTransformMakeTranslation(&v18, x + width * 0.5, y + height * 0.5);
  v17 = t1;
  CGAffineTransformConcat(&v19, &v17, &v18);
  v15 = objc_alloc((Class)TSDLayoutGeometry);
  objc_msgSend(a3, "size");
  v17 = v19;
  return objc_msgSend(v15, "initWithSize:transform:", &v17);
}

- (double)contentsScale
{
  double result;

  objc_msgSend(objc_msgSend(-[TSDLayout layoutController](self, "layoutController"), "canvas"), "contentsScale");
  return result;
}

@end
