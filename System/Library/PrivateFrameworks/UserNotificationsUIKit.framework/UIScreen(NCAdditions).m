@implementation UIScreen(NCAdditions)

+ (CGAffineTransform)nc_transformForScreenOriginRotation:()NCAdditions
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGAffineTransform v10;
  CGAffineTransform v11;
  CGAffineTransform v12;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_referenceBounds");
  v6 = v5;
  v8 = v7;

  memset(&v12, 0, sizeof(v12));
  CGAffineTransformMakeTranslation(&v11, v6 * 0.5, v8 * 0.5);
  CGAffineTransformRotate(&v12, &v11, a2);
  v10 = v12;
  return CGAffineTransformTranslate(a1, &v10, v6 * -0.5, v8 * -0.5);
}

+ (uint64_t)nc_transformForInterfaceOrientation:()NCAdditions
{
  double v3;

  switch(a3)
  {
    case 1:
      v3 = 0.0;
      break;
    case 3:
      v3 = 1.57079633;
      break;
    case 4:
      v3 = -1.57079633;
      break;
    default:
      v3 = 3.14159265;
      if (a3 != 2)
        v3 = 0.0;
      break;
  }
  return objc_msgSend(a1, "nc_transformForScreenOriginRotation:", v3);
}

+ (uint64_t)nc_counterTransformForActiveInterfaceOrientation
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = objc_msgSend((id)*MEMORY[0x1E0DC4730], "activeInterfaceOrientation");
  v3 = 3;
  if (v2 != 4)
    v3 = 4;
  if ((unint64_t)(v2 - 3) >= 2)
    v4 = v2;
  else
    v4 = v3;
  return objc_msgSend(a1, "nc_transformForInterfaceOrientation:", v4);
}

- (void)nc_bounds
{
  double v1;
  CGFloat v2;
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  void *v9;
  uint64_t v10;
  CGAffineTransform v11;
  CGRect v12;

  objc_msgSend(a1, "_referenceBounds");
  v2 = v1;
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v9 = (void *)objc_opt_class();
  v10 = objc_msgSend((id)*MEMORY[0x1E0DC4730], "activeInterfaceOrientation");
  if (v9)
    objc_msgSend(v9, "nc_transformForInterfaceOrientation:", v10);
  else
    memset(&v11, 0, sizeof(v11));
  v12.origin.x = v2;
  v12.origin.y = v4;
  v12.size.width = v6;
  v12.size.height = v8;
  CGRectApplyAffineTransform(v12, &v11);
}

@end
