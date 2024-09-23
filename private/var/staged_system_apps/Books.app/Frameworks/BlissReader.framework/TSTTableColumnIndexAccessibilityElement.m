@implementation TSTTableColumnIndexAccessibilityElement

- (unsigned)columnIndex
{
  return -[TSTTableColumnOrRowIndexAccessibilityElement cellID](self, "cellID") >> 16;
}

- (void)setColumnIndex:(unsigned __int8)a3
{
  -[TSTTableColumnOrRowIndexAccessibilityElement _setCellID:](self, "_setCellID:", ((unint64_t)a3 << 16) | 0xFFFF);
}

- (int)direction
{
  return 1;
}

- (CGRect)_frameInCanvasWithTableRep:(id)a3 canvasHostingLayer:(id)a4 firstGoodCellFrame:(CGRect)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  objc_class *v11;
  void *v12;
  void *v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  CGFloat MinY;
  CGFloat v23;
  CGFloat v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CGFloat MinX;
  char v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect result;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v30 = 0;
  v11 = (objc_class *)objc_opt_class(CALayer);
  v12 = (void *)__TSAccessibilityCastAsClass(v11, (uint64_t)objc_msgSend(objc_msgSend(a3, "tsaxTableChrome"), "tsaxValueForKey:", CFSTR("mChromeColumnBodyLayer")), 1, &v30);
  if (v30)
    abort();
  v13 = v12;
  objc_msgSend(v12, "bounds");
  objc_msgSend(v13, "convertRect:toLayer:", a4);
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v31.origin.x = x;
  v31.origin.y = y;
  v31.size.width = width;
  v31.size.height = height;
  MinX = CGRectGetMinX(v31);
  v32.origin.x = v15;
  v32.origin.y = v17;
  v32.size.width = v19;
  v32.size.height = v21;
  MinY = CGRectGetMinY(v32);
  v33.size.width = width;
  v23 = MinY;
  v33.origin.x = x;
  v33.origin.y = y;
  v33.size.height = height;
  v24 = CGRectGetWidth(v33);
  v34.origin.x = v15;
  v34.origin.y = v17;
  v34.size.width = v19;
  v34.size.height = v21;
  v25 = CGRectGetHeight(v34);
  v26 = MinX;
  v27 = v23;
  v28 = v24;
  result.size.height = v25;
  result.size.width = v28;
  result.origin.y = v27;
  result.origin.x = v26;
  return result;
}

@end
