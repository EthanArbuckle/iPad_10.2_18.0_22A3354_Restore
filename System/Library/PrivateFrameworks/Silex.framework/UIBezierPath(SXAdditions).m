@implementation UIBezierPath(SXAdditions)

+ (id)sx_bezierPathWithRect:()SXAdditions byRoundingCorners:cornerRadius:continuousCorners:
{
  void *v9;

  if (a5 > 0.0)
  {
    if (a9)
      objc_msgSend(MEMORY[0x24BDF6870], "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", a1, a2, a3, a4, a5, a5);
    else
      objc_msgSend(MEMORY[0x24BDF6870], "sx_bezierPathWithNonContinuousRoundedRect:byRoundingCorners:cornerRadius:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF6870], "bezierPathWithRect:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v9;
}

+ (id)sx_bezierPathWithNonContinuousRoundedRect:()SXAdditions byRoundingCorners:cornerRadius:
{
  double v14;
  double v15;
  double Width;
  double Height;
  CGPath *Mutable;
  double v19;
  double v20;
  double v21;
  double v22;
  CGFloat v23;
  CGFloat MinY;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat MaxX;
  CGFloat MaxY;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat MinX;
  CGFloat v38;
  CGFloat v39;
  CGFloat v40;
  void *v41;
  double v43;
  double v44;
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
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;

  if ((~a8 & 5) == 0 || (a8 & 0xA) == 0xALL)
  {
    v14 = CGRectGetHeight(*(CGRect *)&a1) * 0.5;
    if (v14 <= a5)
      a5 = v14;
  }
  if ((~a8 & 3) == 0 || (a8 & 0xC) == 0xCLL)
  {
    v45.origin.x = a1;
    v45.origin.y = a2;
    v45.size.width = a3;
    v45.size.height = a4;
    v15 = CGRectGetWidth(v45) * 0.5;
    if (a5 >= v15)
      a5 = v15;
  }
  v46.origin.x = a1;
  v46.origin.y = a2;
  v46.size.width = a3;
  v46.size.height = a4;
  Width = CGRectGetWidth(v46);
  v47.origin.x = a1;
  v47.origin.y = a2;
  v47.size.width = a3;
  v47.size.height = a4;
  Height = CGRectGetHeight(v47);
  if (Width < Height)
    Height = Width;
  if (a5 >= Height)
    a5 = Height;
  Mutable = CGPathCreateMutable();
  v19 = 0.0;
  if ((a8 & 1) != 0)
    v20 = a5;
  else
    v20 = 0.0;
  if ((a8 & 2) != 0)
    v21 = a5;
  else
    v21 = 0.0;
  if ((a8 & 8) != 0)
    v22 = a5;
  else
    v22 = 0.0;
  if ((a8 & 4) != 0)
    v19 = a5;
  v43 = v19;
  v48.origin.x = a1;
  v48.origin.y = a2;
  v48.size.width = a3;
  v48.size.height = a4;
  v44 = v20;
  v23 = CGRectGetMinX(v48) + v20;
  v49.origin.x = a1;
  v49.origin.y = a2;
  v49.size.width = a3;
  v49.size.height = a4;
  MinY = CGRectGetMinY(v49);
  CGPathMoveToPoint(Mutable, 0, v23, MinY);
  v50.origin.x = a1;
  v50.origin.y = a2;
  v50.size.width = a3;
  v50.size.height = a4;
  v25 = CGRectGetMaxX(v50) - v21;
  v51.origin.x = a1;
  v51.origin.y = a2;
  v51.size.width = a3;
  v51.size.height = a4;
  v26 = CGRectGetMinY(v51);
  CGPathAddLineToPoint(Mutable, 0, v25, v26);
  if (v21 > 0.0)
  {
    v52.origin.x = a1;
    v52.origin.y = a2;
    v52.size.width = a3;
    v52.size.height = a4;
    v27 = CGRectGetMaxX(v52) - a5;
    v53.origin.x = a1;
    v53.origin.y = a2;
    v53.size.width = a3;
    v53.size.height = a4;
    v28 = CGRectGetMinY(v53);
    CGPathAddArc(Mutable, 0, v27, a5 + v28, a5, 4.71238898, 6.28318531, 0);
  }
  v54.origin.x = a1;
  v54.origin.y = a2;
  v54.size.width = a3;
  v54.size.height = a4;
  MaxX = CGRectGetMaxX(v54);
  v55.origin.x = a1;
  v55.origin.y = a2;
  v55.size.width = a3;
  v55.size.height = a4;
  MaxY = CGRectGetMaxY(v55);
  CGPathAddLineToPoint(Mutable, 0, MaxX, MaxY - v22);
  if (v22 > 0.0)
  {
    v56.origin.x = a1;
    v56.origin.y = a2;
    v56.size.width = a3;
    v56.size.height = a4;
    v31 = CGRectGetMaxX(v56) - a5;
    v57.origin.x = a1;
    v57.origin.y = a2;
    v57.size.width = a3;
    v57.size.height = a4;
    v32 = CGRectGetMaxY(v57);
    CGPathAddArc(Mutable, 0, v31, v32 - a5, a5, 0.0, 1.57079633, 0);
  }
  v58.origin.x = a1;
  v58.origin.y = a2;
  v58.size.width = a3;
  v58.size.height = a4;
  v33 = v43 + CGRectGetMinX(v58);
  v59.origin.x = a1;
  v59.origin.y = a2;
  v59.size.width = a3;
  v59.size.height = a4;
  v34 = CGRectGetMaxY(v59);
  CGPathAddLineToPoint(Mutable, 0, v33, v34);
  if (v43 > 0.0)
  {
    v60.origin.x = a1;
    v60.origin.y = a2;
    v60.size.width = a3;
    v60.size.height = a4;
    v35 = a5 + CGRectGetMinX(v60);
    v61.origin.x = a1;
    v61.origin.y = a2;
    v61.size.width = a3;
    v61.size.height = a4;
    v36 = CGRectGetMaxY(v61);
    CGPathAddArc(Mutable, 0, v35, v36 - a5, a5, 1.57079633, 3.14159265, 0);
  }
  v62.origin.x = a1;
  v62.origin.y = a2;
  v62.size.width = a3;
  v62.size.height = a4;
  MinX = CGRectGetMinX(v62);
  v63.origin.x = a1;
  v63.origin.y = a2;
  v63.size.width = a3;
  v63.size.height = a4;
  v38 = CGRectGetMinY(v63);
  CGPathAddLineToPoint(Mutable, 0, MinX, v44 + v38);
  if (v44 > 0.0)
  {
    v64.origin.x = a1;
    v64.origin.y = a2;
    v64.size.width = a3;
    v64.size.height = a4;
    v39 = a5 + CGRectGetMinX(v64);
    v65.origin.x = a1;
    v65.origin.y = a2;
    v65.size.width = a3;
    v65.size.height = a4;
    v40 = CGRectGetMinY(v65);
    CGPathAddArc(Mutable, 0, v39, a5 + v40, a5, 3.14159265, 4.71238898, 0);
  }
  objc_msgSend(MEMORY[0x24BDF6870], "bezierPathWithCGPath:", Mutable, *(_QWORD *)&v43);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  CFRelease(Mutable);
  return v41;
}

@end
