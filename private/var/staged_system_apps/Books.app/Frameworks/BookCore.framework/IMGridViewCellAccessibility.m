@implementation IMGridViewCellAccessibility

+ (id)imaxTargetClassName
{
  return CFSTR("IMGridViewCell");
}

+ (Class)imaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(IMAccessibilitySafeCategory, a2);
}

- (void)accessibilityScrollToVisible
{
  Class v3;
  void *v4;
  id v5;
  double v6;
  CGFloat v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  CGFloat v28;
  double MaxX;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  double MinX;
  CGFloat v35;
  CGFloat v36;
  double MaxY;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double MinY;
  double v44;
  double v45;
  double v46;
  CGFloat v47;
  CGFloat v48;
  CGFloat rect;
  double v50;
  double v51;
  id v52;
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
  CGRect v66;
  CGRect v67;

  v52 = (id)objc_claimAutoreleasedReturnValue(-[IMGridViewCellAccessibility imaxValueForKey:](self, "imaxValueForKey:", CFSTR("gridView")));
  v3 = NSClassFromString(CFSTR("IMGridView"));
  if ((objc_opt_isKindOfClass(v52, v3) & 1) == 0 && IMAccessibilityShouldPerformValidationChecks())
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("AX: expected superview of %@ to be IMGridView. was: %@"), self, v52));
    v5 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("AX Error"), v4, 0);

  }
  -[IMGridViewCellAccessibility frame](self, "frame");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  objc_msgSend(v52, "bounds");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  rect = v20;
  v21 = v13 * 0.5;
  if (v9 < v13)
    v21 = 10.0;
  v46 = v21;
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "window"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "windowScene"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "statusBarManager"));

  objc_msgSend(v52, "contentInset");
  v45 = v25;
  objc_msgSend(v24, "statusBarHeight");
  v44 = v26;
  objc_msgSend(v52, "contentOffset");
  v50 = v27;
  v53.origin.x = v7;
  v53.origin.y = v9;
  v53.size.width = v11;
  v53.size.height = v13;
  MinY = CGRectGetMinY(v53);
  v28 = v7;
  v54.origin.x = v7;
  v48 = v9;
  v54.origin.y = v9;
  v54.size.width = v11;
  v54.size.height = v13;
  MaxX = CGRectGetMaxX(v54);
  v30 = v15;
  v55.origin.x = v15;
  v31 = v17;
  v55.origin.y = v17;
  v32 = v19;
  v55.size.width = v19;
  v55.size.height = rect;
  v33 = rect;
  if (MaxX >= CGRectGetMaxX(v55))
  {
    v59.origin.x = v28;
    v35 = v48;
    v59.origin.y = v48;
    v59.size.width = v11;
    v59.size.height = v13;
    v51 = CGRectGetMaxX(v59);
    v60.origin.x = v30;
    v60.origin.y = v31;
    v60.size.width = v32;
    v60.size.height = rect;
    v50 = v51 - CGRectGetWidth(v60) + 10.0;
  }
  else
  {
    v56.origin.x = v28;
    v56.origin.y = v48;
    v56.size.width = v11;
    v56.size.height = v13;
    MinX = CGRectGetMinX(v56);
    v57.origin.x = v30;
    v57.origin.y = v31;
    v57.size.width = v32;
    v57.size.height = rect;
    if (MinX >= CGRectGetMinX(v57))
    {
      v35 = v48;
    }
    else
    {
      v58.origin.x = v28;
      v35 = v48;
      v58.origin.y = v48;
      v58.size.width = v11;
      v58.size.height = v13;
      v50 = CGRectGetMinX(v58) + -10.0;
    }
    v33 = rect;
  }
  v47 = v11;
  v61.origin.x = v28;
  v61.origin.y = v35;
  v61.size.width = v11;
  v61.size.height = v13;
  v36 = v35;
  MaxY = CGRectGetMaxY(v61);
  v62.origin.x = v30;
  v62.origin.y = v31;
  v62.size.width = v32;
  v62.size.height = v33;
  if (MaxY >= CGRectGetMaxY(v62))
  {
    v66.origin.x = v28;
    v66.origin.y = v36;
    v66.size.width = v47;
    v66.size.height = v13;
    v41 = CGRectGetMaxY(v66);
    v67.origin.x = v30;
    v67.origin.y = v31;
    v67.size.width = v32;
    v67.size.height = v33;
    v39 = v41 - CGRectGetHeight(v67);
    v40 = 10.0;
  }
  else
  {
    v63.origin.x = v28;
    v63.origin.y = v36;
    v63.size.width = v47;
    v63.size.height = v13;
    v38 = CGRectGetMinY(v63);
    v64.origin.x = v30;
    v64.origin.y = v31;
    v64.size.width = v32;
    v64.size.height = v33;
    if (v38 >= CGRectGetMinY(v64))
    {
      v42 = MinY - v46 - (v45 + v44);
      goto LABEL_18;
    }
    v65.origin.x = v28;
    v65.origin.y = v36;
    v65.size.width = v47;
    v65.size.height = v13;
    v39 = CGRectGetMinY(v65);
    v40 = -10.0;
  }
  v42 = v39 + v40;
LABEL_18:
  objc_msgSend(v52, "setContentOffset:animated:", 0, v50, v42);
  UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  void *v4;
  unsigned int v5;
  UIAccessibilityTraits v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)IMGridViewCellAccessibility;
  v3 = -[IMGridViewCellAccessibility accessibilityTraits](&v8, "accessibilityTraits");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[IMGridViewCellAccessibility imaxValueForKey:](self, "imaxValueForKey:", CFSTR("isSelected")));
  v5 = objc_msgSend(v4, "BOOLValue");

  v6 = UIAccessibilityTraitSelected;
  if (!v5)
    v6 = 0;
  return v6 | v3;
}

@end
