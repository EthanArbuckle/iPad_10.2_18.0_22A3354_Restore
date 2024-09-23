@implementation _UIPopoverShapePathProviderTV

- (id)generatePopoverPathForParameters:(_UIPopoverShapePathParameters *)a3
{
  int64_t var1;
  unint64_t var0;
  double var4;
  _BOOL8 v7;
  _BOOL4 v8;
  double x;
  double y;
  double width;
  double v12;
  double height;
  double v14;
  void *v15;
  double MaxX;
  double v17;
  double v18;
  double v19;
  double v20;
  CGFloat v21;
  double v22;
  double v23;
  double MinY;
  CGFloat v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double var3;
  double var6;
  double MaxY;
  double var7;
  double var8;
  double var5;
  double MinX;
  double v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;

  var0 = a3->var0;
  var1 = a3->var1;
  var4 = a3->var4;
  var3 = a3->var3;
  var6 = a3->var6;
  var7 = a3->var7;
  var8 = a3->var8;
  v7 = a3->var0 == 8;
  v8 = a3->var0 == 8 || a3->var0 == 4;
  x = a3->var2.origin.x;
  y = a3->var2.origin.y;
  if (v8)
    width = a3->var2.size.width;
  else
    width = a3->var2.size.height;
  var5 = a3->var5;
  v12 = width - var5;
  if (v8)
    height = a3->var2.size.height;
  else
    height = a3->var2.size.width;
  if (var0)
    v14 = v12;
  else
    v14 = a3->var2.size.height;
  +[UIBezierPath bezierPath](UIBezierPath, "bezierPath");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v39.origin.x = x;
  v39.origin.y = y;
  v39.size.width = height;
  v39.size.height = v14;
  MaxX = CGRectGetMaxX(v39);
  v40.origin.x = x;
  v40.origin.y = y;
  v40.size.width = height;
  v40.size.height = v14;
  v17 = CGRectGetMaxY(v40) - var4;
  v41.origin.x = x;
  v41.origin.y = y;
  v41.size.width = height;
  v41.size.height = v14;
  v18 = CGRectGetMaxX(v41);
  v42.origin.x = x;
  v42.origin.y = y;
  v42.size.width = height;
  v42.size.height = v14;
  MaxY = CGRectGetMaxY(v42);
  objc_msgSend(v15, "moveToPoint:", MaxX, v17);
  if (var1 && var0)
  {
    -[_UIPopoverShapePathProviderTV _addBottomRightPinnedEdgeArrowToPath:bounds:pinnedEdgeArrowStartPoint:arrowHeight:pinnedArrowBase:arrowTipWidth:arrowTipHeight:](self, "_addBottomRightPinnedEdgeArrowToPath:bounds:pinnedEdgeArrowStartPoint:arrowHeight:pinnedArrowBase:arrowTipWidth:arrowTipHeight:", v15, x, y, height, v14, MaxX, v17, var5, var7, 0x4022000000000000, 0x4000CCCCCCCCCCCDLL);
  }
  else
  {
    -[_UIPopoverShapePathProviderTV _addCorner:startPoint:endPoint:cornerRadius:toPath:](self, "_addCorner:startPoint:endPoint:cornerRadius:toPath:", 8, v15, MaxX, v17, v18 - var4, MaxY, var4);
    if (var0)
      -[_UIPopoverShapePathProviderTV _addCenterArrowToPath:bounds:arrowOffset:arrowHeight:arrowBase:arrowTipWidth:arrowTipHeight:](self, "_addCenterArrowToPath:bounds:arrowOffset:arrowHeight:arrowBase:arrowTipWidth:arrowTipHeight:", v15, x, y, height, v14, var3, var5, var6, 9.0, 0x4000CCCCCCCCCCCDLL);
  }
  v43.origin.x = x;
  v43.origin.y = y;
  v43.size.width = height;
  v43.size.height = v14;
  v19 = var4 + CGRectGetMinX(v43);
  v44.origin.x = x;
  v44.origin.y = y;
  v44.size.width = height;
  v44.size.height = v14;
  v20 = CGRectGetMaxY(v44);
  v45.origin.x = x;
  v45.origin.y = y;
  v45.size.width = height;
  v45.size.height = v14;
  MinX = CGRectGetMinX(v45);
  v46.origin.x = x;
  v46.origin.y = y;
  v46.size.width = height;
  v46.size.height = v14;
  v21 = CGRectGetMaxY(v46) - var4;
  objc_msgSend(v15, "addLineToPoint:", v19, v20);
  -[_UIPopoverShapePathProviderTV _addCorner:startPoint:endPoint:cornerRadius:toPath:](self, "_addCorner:startPoint:endPoint:cornerRadius:toPath:", 4, v15, v19, v20, MinX, v21, var4);
  v47.origin.x = x;
  v47.origin.y = y;
  v47.size.width = height;
  v47.size.height = v14;
  v22 = CGRectGetMinX(v47);
  v48.origin.x = x;
  v48.origin.y = y;
  v48.size.width = height;
  v48.size.height = v14;
  v23 = var4 + CGRectGetMinY(v48);
  v49.origin.x = x;
  v49.origin.y = y;
  v49.size.width = height;
  v49.size.height = v14;
  v38 = var4 + CGRectGetMinX(v49);
  v50.origin.x = x;
  v50.origin.y = y;
  v50.size.width = height;
  v50.size.height = v14;
  MinY = CGRectGetMinY(v50);
  objc_msgSend(v15, "addLineToPoint:", v22, v23);
  -[_UIPopoverShapePathProviderTV _addCorner:startPoint:endPoint:cornerRadius:toPath:](self, "_addCorner:startPoint:endPoint:cornerRadius:toPath:", 1, v15, v22, v23, v38, MinY, var4);
  v51.origin.x = x;
  v51.origin.y = y;
  v51.size.width = height;
  v51.size.height = v14;
  v25 = CGRectGetMaxX(v51) - var4;
  v52.origin.x = x;
  v52.origin.y = y;
  v52.size.width = height;
  v52.size.height = v14;
  v26 = CGRectGetMinY(v52);
  v53.origin.x = x;
  v53.origin.y = y;
  v53.size.width = height;
  v53.size.height = v14;
  v27 = CGRectGetMaxX(v53);
  v54.origin.x = x;
  v54.origin.y = y;
  v54.size.width = height;
  v54.size.height = v14;
  v28 = var4 + CGRectGetMinY(v54);
  objc_msgSend(v15, "addLineToPoint:", v25, v26);
  -[_UIPopoverShapePathProviderTV _addCorner:startPoint:endPoint:cornerRadius:toPath:](self, "_addCorner:startPoint:endPoint:cornerRadius:toPath:", 2, v15, v25, v26, v27, v28, var4);
  objc_msgSend(v15, "closePath");
  if (var0)
  {
    v29 = 90.0;
    if (!v8)
      v29 = 0.0;
    if (var0 != 4 && var0 != 8)
      v7 = var1 == 4;
    if (var0 != 4 && var0 != 8)
      var1 = var0;
    -[_UIPopoverShapePathProviderTV _transformPath:rotation:flipX:flipY:roundToScale:](self, "_transformPath:rotation:flipX:flipY:roundToScale:", v15, v7, var1 == 1, v29, var8);
  }
  return v15;
}

- (void)_addCorner:(unint64_t)a3 startPoint:(CGPoint)a4 endPoint:(CGPoint)a5 cornerRadius:(double)a6 toPath:(id)a7
{
  double y;
  double x;
  char v10;
  id v15;
  double (**v16)(double, double);
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
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  _QWORD aBlock[4];
  __int128 v43;
  char v44;

  y = a5.y;
  x = a5.x;
  if (a3 == 1)
  {
    v10 = 0;
    __asm { FMOV            V0.2D, #-1.0 }
  }
  else
  {
    if (a3 == 2)
    {
      _Q0 = xmmword_1866798D0;
    }
    else
    {
      if (a3 != 4)
      {
        v10 = 0;
        __asm { FMOV            V0.2D, #1.0 }
        goto LABEL_9;
      }
      _Q0 = xmmword_1866798C0;
    }
    v10 = 1;
  }
LABEL_9:
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __84___UIPopoverShapePathProviderTV__addCorner_startPoint_endPoint_cornerRadius_toPath___block_invoke;
  aBlock[3] = &__block_descriptor_49_e30__CGPoint_dd_24__0_CGPoint_dd_8l;
  v44 = v10;
  v43 = _Q0;
  v15 = a7;
  v16 = (double (**)(double, double))_Block_copy(aBlock);
  v17 = v16[2](-4.01, 22.65);
  v19 = v18;
  v20 = ((double (*)(double (**)(double, double), double))v16[2])(v16, 0.0);
  v22 = v21;
  v23 = ((double (*)(double (**)(double, double)))v16[2])(v16);
  objc_msgSend(v15, "addCurveToPoint:controlPoint1:controlPoint2:", a4.x + v17, a4.y + v19, a4.x + v20, a4.y + v22, a4.x + v23, a4.y + v24);
  v25 = ((double (*)(double (**)(double, double), double, double))v16[2])(v16, 22.65, -4.01);
  v27 = v26;
  v28 = ((double (*)(double (**)(double, double), double, double))v16[2])(v16, 31.38, -10.46);
  v30 = v29;
  v31 = ((double (*)(double (**)(double, double), double, double))v16[2])(v16, 27.54, -6.62);
  objc_msgSend(v15, "addCurveToPoint:controlPoint1:controlPoint2:", x + v25, y + v27, x + v28, y + v30, x + v31, y + v32);
  v33 = ((double (*)(double (**)(double, double), double, double))v16[2])(v16, 0.0, 0.0);
  v35 = v34;
  v36 = ((double (*)(double (**)(double, double), double, double))v16[2])(v16, 17.76, -1.39);
  v38 = v37;
  v39 = ((double (*)(double (**)(double, double), double, double))v16[2])(v16, 12.91, 0.0);
  objc_msgSend(v15, "addCurveToPoint:controlPoint1:controlPoint2:", x + v33, y + v35, x + v36, y + v38, x + v39, y + v40);

}

- (void)_addCenterArrowToPath:(id)a3 bounds:(CGRect)a4 arrowOffset:(double)a5 arrowHeight:(double)a6 arrowBase:(double)a7 arrowTipWidth:(double)a8 arrowTipHeight:(double)a9
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v15;
  double v16;
  double v17;
  double MaxY;
  CGFloat v19;
  double v22;
  CGFloat v23;
  id v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v24 = a3;
  v25.origin.x = x;
  v25.origin.y = y;
  v25.size.width = width;
  v25.size.height = height;
  v15 = CGRectGetMidX(v25) + a5;
  v16 = a7 * 0.5;
  v17 = a7 * 0.5 + v15;
  v26.origin.x = x;
  v26.origin.y = y;
  v26.size.width = width;
  v26.size.height = height;
  MaxY = CGRectGetMaxY(v26);
  v23 = v15 - v16;
  v27.origin.x = x;
  v27.origin.y = y;
  v27.size.width = width;
  v27.size.height = height;
  v22 = CGRectGetMaxY(v27);
  v28.origin.x = x;
  v28.origin.y = y;
  v28.size.width = width;
  v28.size.height = height;
  v19 = CGRectGetMaxY(v28) + a6;
  objc_msgSend(v24, "addLineToPoint:", v17, MaxY);
  objc_msgSend(v24, "addCurveToPoint:controlPoint1:controlPoint2:", v17 + -12.7, MaxY + 4.64, v17, MaxY, v17 + -7.92, MaxY + -0.16);
  objc_msgSend(v24, "addLineToPoint:", a8 * 0.5 + v15, v19 - a9);
  objc_msgSend(v24, "addCurveToPoint:controlPoint1:controlPoint2:", v15, v19, v15 + 3.35, v19 + -1.02, v15 + 1.92, v19);
  objc_msgSend(v24, "addCurveToPoint:controlPoint1:controlPoint2:", v15 - a8 * 0.5, v19 - a9, v15 + -1.92, v19, v15 + -3.35, v19 + -1.02);
  objc_msgSend(v24, "addLineToPoint:", v23 + 12.7, v22 + 4.64);
  objc_msgSend(v24, "addCurveToPoint:controlPoint1:controlPoint2:", v23, v22, v23 + 7.92, v22 + -0.16, v23, v22);

}

- (void)_addBottomRightPinnedEdgeArrowToPath:(id)a3 bounds:(CGRect)a4 pinnedEdgeArrowStartPoint:(CGPoint)a5 arrowHeight:(double)a6 pinnedArrowBase:(double)a7 arrowTipWidth:(double)a8 arrowTipHeight:(double)a9
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v15;
  double MaxY;
  CGFloat v17;
  CGFloat v18;
  id v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v20 = a3;
  v21.origin.x = x;
  v21.origin.y = y;
  v21.size.width = width;
  v21.size.height = height;
  v15 = CGRectGetMaxX(v21) - a7;
  v22.origin.x = x;
  v22.origin.y = y;
  v22.size.width = width;
  v22.size.height = height;
  MaxY = CGRectGetMaxY(v22);
  v23.origin.x = x;
  v23.origin.y = y;
  v23.size.width = width;
  v23.size.height = height;
  v17 = CGRectGetMaxX(v23) - a7 * 0.5 + 1.0;
  v24.origin.x = x;
  v24.origin.y = y;
  v24.size.width = width;
  v24.size.height = height;
  v18 = CGRectGetMaxY(v24) + a6;
  objc_msgSend(v20, "addCurveToPoint:controlPoint1:controlPoint2:", a5.x + -12.05, a5.y + 42.56, a5.x + -12.05 + 12.05, a5.y + 42.56 + -18.73, a5.x + -12.05 + 8.19, a5.y + 42.56 + -10.98);
  objc_msgSend(v20, "addLineToPoint:", a8 * 0.5 + v17, v18 - a9);
  objc_msgSend(v20, "addCurveToPoint:controlPoint1:controlPoint2:", v17, v18, v17 + 3.55, v18 + -0.86, v17 + 1.93, v18);
  objc_msgSend(v20, "addCurveToPoint:controlPoint1:controlPoint2:", v17 - a8 * 0.5, v18 - a9, v17 - a8 * 0.5 + 2.62, v18 - a9 + 2.12, v17 - a8 * 0.5 + 1.18, v18 - a9 + 1.09);
  objc_msgSend(v20, "addLineToPoint:", v15 + 12.72, MaxY + 4.56);
  objc_msgSend(v20, "addCurveToPoint:controlPoint1:controlPoint2:", v15, MaxY, v15 + 8.66, MaxY + 0.48, v15 + 2.37, MaxY + 0.04);

}

- (void)_transformPath:(id)a3 rotation:(double)a4 flipX:(BOOL)a5 flipY:(BOOL)a6 roundToScale:(double)a7
{
  _BOOL4 v8;
  _BOOL4 v9;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  unint64_t v17;
  int v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGFloat v25;
  CGFloat v26;
  double v27;
  double v28;
  CGAffineTransform v29;
  CGAffineTransform v30;
  CGAffineTransform v31;
  CGAffineTransform v32;

  v8 = a6;
  v9 = a5;
  v11 = a3;
  objc_msgSend(v11, "bounds");
  UIRectRoundToScale(v12, v13, v14, v15, a7);
  v16 = a4 * 3.14159265 / 180.0;
  v17 = (unsigned __int128)((uint64_t)a4 * (__int128)0x2D82D82D82D82D83) >> 64;
  v18 = (v17 >> 63) + (v17 >> 4);
  v20 = v19 * -0.5;
  v22 = v21 * -0.5;
  v23 = -(v21 * -0.5);
  v24 = -(v19 * -0.5);
  if ((v18 & 1) != 0)
    v25 = v23;
  else
    v25 = v24;
  if ((v18 & 1) != 0)
    v26 = v24;
  else
    v26 = v23;
  CGAffineTransformMakeTranslation(&v32, v20, v22);
  objc_msgSend(v11, "applyTransform:", &v32);
  CGAffineTransformMakeRotation(&v31, v16);
  objc_msgSend(v11, "applyTransform:", &v31);
  v27 = 1.0;
  if (v9)
    v28 = -1.0;
  else
    v28 = 1.0;
  if (v8)
    v27 = -1.0;
  CGAffineTransformMakeScale(&v30, v28, v27);
  objc_msgSend(v11, "applyTransform:", &v30);
  CGAffineTransformMakeTranslation(&v29, v25, v26);
  objc_msgSend(v11, "applyTransform:", &v29);

}

@end
