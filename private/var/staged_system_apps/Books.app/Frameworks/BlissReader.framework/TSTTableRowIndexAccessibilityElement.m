@implementation TSTTableRowIndexAccessibilityElement

- (unsigned)rowIndex
{
  return (unsigned __int16)-[TSTTableColumnOrRowIndexAccessibilityElement cellID](self, "cellID");
}

- (void)setRowIndex:(unsigned __int16)a3
{
  -[TSTTableColumnOrRowIndexAccessibilityElement _setCellID:](self, "_setCellID:", a3 | 0xFF0000);
}

- (int)direction
{
  return 0;
}

- (CGRect)_frameInCanvasWithTableRep:(id)a3 canvasHostingLayer:(id)a4 firstGoodCellFrame:(CGRect)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  objc_class *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  double v32;
  double v33;
  double v34;
  double v35;
  CGFloat MinY;
  CGFloat MinX;
  char v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect result;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v38 = 0;
  v12 = (objc_class *)objc_opt_class(CALayer);
  v13 = (void *)__TSAccessibilityCastAsClass(v12, (uint64_t)objc_msgSend(objc_msgSend(a3, "tsaxTableChrome"), "tsaxValueForKey:", CFSTR("mChromeRowBodyLayer")), 1, &v38);
  if (v38)
    abort();
  v14 = v13;
  objc_msgSend(v13, "bounds");
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  if (-[TSTTableRowIndexAccessibilityElement tsaxRespondsToSelector:fromExtrasProtocol:](self, "tsaxRespondsToSelector:fromExtrasProtocol:", "tsaxAdjustedBoundsForChromeRowBodyLayer:", &OBJC_PROTOCOL___TSTTableRowIndexAccessibilityElementExtras))
  {
    -[TSTTableRowIndexAccessibilityElement tsaxAdjustedBoundsForChromeRowBodyLayer:](self, "tsaxAdjustedBoundsForChromeRowBodyLayer:", v14);
    v16 = v23;
    v18 = v24;
    v20 = v25;
    v22 = v26;
  }
  objc_msgSend(v14, "convertRect:toLayer:", a4, v16, v18, v20, v22);
  v27 = v39.origin.x;
  v28 = v39.origin.y;
  v29 = v39.size.width;
  v30 = v39.size.height;
  MinX = CGRectGetMinX(v39);
  v40.origin.x = x;
  v40.origin.y = y;
  v40.size.width = width;
  v40.size.height = height;
  MinY = CGRectGetMinY(v40);
  v41.origin.x = v27;
  v41.origin.y = v28;
  v41.size.width = v29;
  v41.size.height = v30;
  v31 = CGRectGetWidth(v41);
  v42.origin.x = x;
  v42.origin.y = y;
  v42.size.width = width;
  v42.size.height = height;
  v32 = CGRectGetHeight(v42);
  v34 = MinY;
  v33 = MinX;
  v35 = v31;
  result.size.height = v32;
  result.size.width = v35;
  result.origin.y = v34;
  result.origin.x = v33;
  return result;
}

@end
