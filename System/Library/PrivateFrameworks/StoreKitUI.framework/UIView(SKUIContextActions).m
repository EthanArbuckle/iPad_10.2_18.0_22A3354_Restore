@implementation UIView(SKUIContextActions)

- (double)defaultPresentationPosition
{
  void *v2;
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  double v9;
  CGRect v11;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_5;
  objc_msgSend(a1, "_collectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSSelectorFromString(CFSTR("_currentTouch"));
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

LABEL_5:
    objc_msgSend(a1, "bounds");
    return v9;
  }
  objc_msgSend(v2, "_currentTouch");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "locationInView:", a1);
  v5 = v4;
  v7 = v6;

  v11.size.width = *(CGFloat *)MEMORY[0x1E0C9D820];
  v11.size.height = *(CGFloat *)(MEMORY[0x1E0C9D820] + 8);
  v11.origin.x = v5;
  v11.origin.y = v7;
  *(_QWORD *)&v8 = (unint64_t)CGRectInset(v11, -20.0, -20.0);

  return v8;
}

@end
