@implementation DBGViewDebuggerSupport_iOS

+ (id)displayNameForView:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  char isKindOfClass;
  void *v7;
  uint64_t v8;
  char v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "accessibilityLabel"));
  v5 = objc_opt_class(NSString);
  isKindOfClass = objc_opt_isKindOfClass(v4, v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "accessibilityLabel"));
  if ((isKindOfClass & 1) == 0)
  {
    v8 = objc_opt_class(NSAttributedString);
    v9 = objc_opt_isKindOfClass(v7, v8);

    if ((v9 & 1) == 0)
      goto LABEL_5;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "accessibilityLabel"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "string"));

  }
  if (!v7)
  {
LABEL_5:
    v11 = objc_opt_class(UIButton);
    if ((objc_opt_isKindOfClass(v3, v11) & 1) != 0)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentTitle"));
      goto LABEL_18;
    }
    if ((objc_opt_respondsToSelector(v3, "text") & 1) != 0)
    {
      v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "text"));
    }
    else
    {
      v13 = objc_opt_class(UIDatePicker);
      if ((objc_opt_isKindOfClass(v3, v13) & 1) != 0)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "date"));
        v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "description"));
LABEL_17:
        v7 = v15;

        goto LABEL_18;
      }
      if ((objc_opt_respondsToSelector(v3, "title") & 1) == 0)
      {
        v7 = 0;
        goto LABEL_18;
      }
      v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "title"));
    }
    v14 = (void *)v12;
    v16 = objc_opt_class(NSString);
    if ((objc_opt_isKindOfClass(v14, v16) & 1) != 0)
      v17 = v14;
    else
      v17 = 0;
    v15 = v17;
    goto LABEL_17;
  }
LABEL_18:

  return v7;
}

+ (id)primaryWindowFromWindows:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "keyWindow"));

  if (v5)
  {
    v6 = v5;
  }
  else
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v7 = v3;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v16;
LABEL_5:
      v11 = 0;
      while (1)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v11);
        if (!objc_msgSend(v12, "isHidden", (_QWORD)v15))
          break;
        if (v9 == (id)++v11)
        {
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
          if (v9)
            goto LABEL_5;
          goto LABEL_11;
        }
      }
      v13 = v12;

      if (v13)
        goto LABEL_15;
    }
    else
    {
LABEL_11:

    }
    v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject", (_QWORD)v15));
  }
  v13 = v6;
LABEL_15:

  return v13;
}

+ (id)snapshotMethodForView:(id)a3
{
  id v3;
  Class v4;
  Class v5;
  Class v6;
  Class v7;
  const __CFString *v8;

  v3 = a3;
  v4 = NSClassFromString(CFSTR("SKView"));
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0
    || (v5 = NSClassFromString(CFSTR("SCNView")), (objc_opt_isKindOfClass(v3, v5) & 1) != 0)
    || (v6 = NSClassFromString(CFSTR("GLKView")), (objc_opt_isKindOfClass(v3, v6) & 1) != 0)
    || (v7 = NSClassFromString(CFSTR("RealityKit.ARView")), (objc_opt_isKindOfClass(v3, v7) & 1) != 0))
  {
    v8 = CFSTR("snapshot");
  }
  else
  {
    v8 = 0;
  }

  return (id)v8;
}

+ (id)appWindows
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "windows"));

  return v3;
}

+ (id)windowContentViewForWindow:(id)a3
{
  return a3;
}

+ (BOOL)isHiddenForWindow:(id)a3
{
  return objc_msgSend(a3, "isHidden");
}

+ (double)screenBackingScaleForWindow:(id)a3
{
  void *v3;
  double v4;
  double v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "screen"));
  objc_msgSend(v3, "scale");
  v5 = v4;

  return v5;
}

+ (double)screenBackingScaleForView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "window"));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "window"));
    objc_msgSend(a1, "screenBackingScaleForWindow:", v6);
    v8 = v7;

  }
  else
  {
    v8 = 1.0;
  }

  return v8;
}

+ (id)_messagesUIExtensionViews
{
  Class v2;
  Class v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v13;

  v2 = NSClassFromString(CFSTR("_MSExtensionGlobalState"));
  if (!v2)
    return 0;
  v3 = v2;
  if ((objc_opt_respondsToSelector(v2, "sharedInstance") & 1) == 0)
    return 0;
  v4 = objc_claimAutoreleasedReturnValue(-[objc_class sharedInstance](v3, "sharedInstance"));
  v5 = (void *)v4;
  if (v4 && (objc_opt_respondsToSelector(v4, "activeExtensionContext") & 1) != 0)
  {
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "activeExtensionContext"));
    v7 = (void *)v6;
    if (v6 && (objc_opt_respondsToSelector(v6, "viewController") & 1) != 0)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "viewController"));
      v9 = objc_opt_class(UIViewController);
      if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "view"));
        v13 = v10;
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v13, 1));

      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)layerForView:(id)a3
{
  return objc_msgSend(a3, "layer");
}

+ (id)subviewsForView:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;

  v3 = a3;
  v4 = objc_opt_class(UICollectionViewCell);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "contentView"));

    if (v5)
    {
      v9 = v5;
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));
    }
    else
    {
      v6 = 0;
    }

    return v6;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "subviews"));

    return v7;
  }
}

+ (BOOL)isWindowSubclass:(id)a3
{
  id v3;
  uint64_t v4;
  char isKindOfClass;

  v3 = a3;
  v4 = objc_opt_class(UIWindow);
  isKindOfClass = objc_opt_isKindOfClass(v3, v4);

  return isKindOfClass & 1;
}

+ (BOOL)isViewSubclass:(id)a3
{
  id v3;
  uint64_t v4;
  char isKindOfClass;

  v3 = a3;
  v4 = objc_opt_class(UIView);
  isKindOfClass = objc_opt_isKindOfClass(v3, v4);

  return isKindOfClass & 1;
}

+ (id)snapshotView:(id)a3 errorString:(id *)a4
{
  id v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  Class v11;
  Class v12;
  Class v13;
  Class v14;
  uint64_t v15;
  UIImage *CurrentContext;
  NSData *v17;
  void *v19;
  id v20;
  char *v21;
  void *i;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  double v27;
  CGFloat v28;
  CGFloat v29;
  void *v30;
  UIImage *ImageFromCurrentImageContext;
  void *j;
  void *v33;
  int v34;
  void *v35;
  double v36;
  uint64_t v37;
  CGSize v38;

  v6 = a3;
  objc_msgSend(v6, "bounds");
  v8 = v7;
  objc_msgSend(v6, "bounds");
  v10 = 0;
  if (v8 > 0.0 && v9 > 0.0 && v8 * v9 < 16000000.0)
  {
    v11 = NSClassFromString(CFSTR("GLKView"));
    if ((objc_opt_isKindOfClass(v6, v11) & 1) != 0
      || (v12 = NSClassFromString(CFSTR("SKView")), (objc_opt_isKindOfClass(v6, v12) & 1) != 0)
      || (v13 = NSClassFromString(CFSTR("SCNView")), (objc_opt_isKindOfClass(v6, v13) & 1) != 0)
      || (v14 = NSClassFromString(CFSTR("RealityKit.ARView")), (objc_opt_isKindOfClass(v6, v14) & 1) != 0))
    {
      v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "snapshot"));
    }
    else
    {
      if (!objc_msgSend(a1, "_isEffectView:", v6))
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "subviews"));
        v20 = objc_msgSend(v19, "count");
        v21 = (char *)&v37 - ((4 * (_QWORD)v20 + 15) & 0xFFFFFFFFFFFFFFF0);
        if (v20)
        {
          for (i = 0; i != v20; i = (char *)i + 1)
          {
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectAtIndex:", i));
            v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "layer"));
            objc_msgSend(v24, "opacity");
            *(_DWORD *)&v21[4 * (_QWORD)i] = v25;

            v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "layer"));
            LODWORD(v27) = 0;
            objc_msgSend(v26, "setOpacity:", v27);

          }
        }
        objc_msgSend(v6, "bounds");
        v38.width = v28;
        v38.height = v29;
        UIGraphicsBeginImageContextWithOptions(v38, 0, 0.0);
        CurrentContext = (UIImage *)UIGraphicsGetCurrentContext();
        if (CurrentContext)
        {
          v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "layer"));
          objc_msgSend(v30, "renderInContext:", CurrentContext);

          ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
          CurrentContext = (UIImage *)objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);
        }
        UIGraphicsEndImageContext();
        if (v20)
        {
          for (j = 0; j != v20; j = (char *)j + 1)
          {
            v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectAtIndex:", j));
            v34 = *(_DWORD *)&v21[4 * (_QWORD)j];
            v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "layer"));
            LODWORD(v36) = v34;
            objc_msgSend(v35, "setOpacity:", v36);

          }
        }

        if (!CurrentContext)
          goto LABEL_12;
LABEL_10:
        v17 = UIImagePNGRepresentation(CurrentContext);
        v10 = (void *)objc_claimAutoreleasedReturnValue(v17);
        if (v10)
        {
LABEL_13:

          goto LABEL_14;
        }
        if (!*a4)
        {
          v10 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Problem getting view snapshot for %@"), v6));
          goto LABEL_13;
        }
LABEL_12:
        v10 = 0;
        goto LABEL_13;
      }
      v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_renderEffectViewUsingDrawHierarchyInRect:", v6));
    }
    CurrentContext = (UIImage *)v15;
    if (!v15)
      goto LABEL_12;
    goto LABEL_10;
  }
LABEL_14:

  return v10;
}

+ (BOOL)_isEffectView:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  objc_class *v10;
  NSString *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "viewDebuggerEffectViewsToSnapshotAsImage", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        v10 = (objc_class *)objc_opt_class(v4);
        v11 = NSStringFromClass(v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
        LOBYTE(v9) = objc_msgSend(v9, "isEqualToString:", v12);

        if ((v9 & 1) != 0)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return (char)v6;
}

+ (id)_renderEffectViewUsingDrawHierarchyInRect:(id)a3
{
  id v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  double x;
  double v10;
  double y;
  double v12;
  double width;
  double v14;
  double height;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  char *v22;
  void *v23;
  char *v24;
  char *v25;
  void *v26;
  char *v27;
  void *v28;
  void *v29;
  void *v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  void *v35;
  id v36;
  id v37;
  uint64_t v38;
  void *i;
  void *v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  UIImage *ImageFromCurrentImageContext;
  void *v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  CGFloat v58;
  CGFloat v59;
  UIImage *v60;
  uint64_t v61;
  void *v62;
  id v63;
  id v64;
  uint64_t v65;
  void *j;
  void *v67;
  void *v68;
  double v69;
  double v70;
  void *v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  _BYTE v81[128];
  _BYTE v82[128];
  CGSize v83;
  CGSize v84;
  CGRect v85;
  CGRect v86;
  CGRect v87;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "window"));
  if (!v4)
  {
    v5 = v3;
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "superview"));

    if (v6)
    {
      do
      {
        v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "superview"));

        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "superview"));
        v5 = v4;
      }
      while (v7);
    }
    else
    {
      v4 = v5;
    }
  }
  objc_msgSend(v3, "bounds");
  objc_msgSend(v4, "convertRect:fromView:", v3);
  x = v8;
  y = v10;
  width = v12;
  height = v14;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMapTable mapTableWithKeyOptions:valueOptions:](NSMapTable, "mapTableWithKeyOptions:valueOptions:", 0, 0));
  v17 = v3;
  v18 = v17;
  if (v4 == v17)
  {
    v72 = v17;
  }
  else
  {
    v19 = v17;
    do
    {
      v20 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "superview"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "subviews"));
      v22 = (char *)objc_msgSend(v21, "indexOfObject:", v19);

      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "subviews"));
      v24 = (char *)objc_msgSend(v23, "count");
      v25 = v22 + 1;

      if (v24 > v22 + 1)
      {
        while (1)
        {
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "subviews"));
          v27 = (char *)objc_msgSend(v26, "count");

          if (v25 >= v27)
            break;
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "subviews"));
          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectAtIndexedSubscript:", v25));

          objc_msgSend(v29, "alpha");
          v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
          objc_msgSend(v16, "setObject:forKey:", v30, v29);

          objc_msgSend(v29, "setAlpha:", 0.0);
          ++v25;
        }
      }
      if (objc_msgSend(v20, "clipsToBounds"))
      {
        objc_msgSend(v20, "bounds");
        objc_msgSend(v4, "convertRect:fromView:", v20);
        v87.origin.x = v31;
        v87.origin.y = v32;
        v87.size.width = v33;
        v87.size.height = v34;
        v85.origin.x = x;
        v85.origin.y = y;
        v85.size.width = width;
        v85.size.height = height;
        v86 = CGRectIntersection(v85, v87);
        x = v86.origin.x;
        y = v86.origin.y;
        width = v86.size.width;
        height = v86.size.height;
      }

      v19 = v20;
    }
    while (v20 != v4);
    v72 = v4;
  }
  v79 = 0u;
  v80 = 0u;
  v77 = 0u;
  v78 = 0u;
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "subviews"));
  v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v77, v82, 16);
  if (v36)
  {
    v37 = v36;
    v38 = *(_QWORD *)v78;
    do
    {
      for (i = 0; i != v37; i = (char *)i + 1)
      {
        if (*(_QWORD *)v78 != v38)
          objc_enumerationMutation(v35);
        v40 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v40, "alpha");
        v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
        objc_msgSend(v16, "setObject:forKey:", v41, v40);

        objc_msgSend(v40, "setAlpha:", 0.0);
      }
      v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v77, v82, 16);
    }
    while (v37);
  }

  objc_msgSend(v4, "bounds");
  v43 = v42;
  v45 = v44;
  v83.width = width;
  v83.height = height;
  UIGraphicsBeginImageContextWithOptions(v83, 0, 0.0);
  objc_msgSend(v4, "drawViewHierarchyInRect:afterScreenUpdates:", 1, -x, -y, v43, v45);
  ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
  v47 = (void *)objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);
  UIGraphicsEndImageContext();
  objc_msgSend(v18, "bounds");
  if (v49 != width || v48 != height)
  {
    objc_msgSend(v18, "convertRect:fromView:", v4, x, y, width, height);
    v51 = v50;
    v53 = v52;
    v55 = v54;
    v57 = v56;
    objc_msgSend(v18, "bounds");
    v84.width = v58;
    v84.height = v59;
    UIGraphicsBeginImageContextWithOptions(v84, 0, 0.0);
    objc_msgSend(v47, "drawInRect:blendMode:alpha:", 0, v51, v53, v55, v57, 1.0);
    v60 = UIGraphicsGetImageFromCurrentImageContext();
    v61 = objc_claimAutoreleasedReturnValue(v60);

    UIGraphicsEndImageContext();
    v47 = (void *)v61;
  }
  v75 = 0u;
  v76 = 0u;
  v73 = 0u;
  v74 = 0u;
  v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "keyEnumerator"));
  v63 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v73, v81, 16);
  if (v63)
  {
    v64 = v63;
    v65 = *(_QWORD *)v74;
    do
    {
      for (j = 0; j != v64; j = (char *)j + 1)
      {
        if (*(_QWORD *)v74 != v65)
          objc_enumerationMutation(v62);
        v67 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * (_QWORD)j);
        v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKey:", v67));
        objc_msgSend(v68, "doubleValue");
        v70 = v69;

        objc_msgSend(v67, "setAlpha:", v70);
      }
      v64 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v73, v81, 16);
    }
    while (v64);
  }

  return v47;
}

+ (void)addFrameBasics:(id)a3 toDict:(id)a4
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;
  id v11;

  v5 = a4;
  objc_msgSend(a3, "frame");
  v10 = __52__DBGViewDebuggerSupport_iOS_addFrameBasics_toDict___block_invoke(v6, v7, v8, v9);
  v11 = (id)objc_claimAutoreleasedReturnValue(v10);
  objc_msgSend(v5, "setObject:forKey:", v11, CFSTR("frame"));

}

+ (void)addViewBasics:(id)a3 toDict:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  v25 = a3;
  v6 = a4;
  if (objc_msgSend(a1, "isViewSubclass:", v25))
  {
    v7 = v25;
    objc_msgSend(v7, "frame");
    v12 = __52__DBGViewDebuggerSupport_iOS_addFrameBasics_toDict___block_invoke(v8, v9, v10, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    objc_msgSend(v6, "setObject:forKey:", v13, CFSTR("frame"));

    objc_msgSend(v7, "bounds");
    v18 = __52__DBGViewDebuggerSupport_iOS_addFrameBasics_toDict___block_invoke(v14, v15, v16, v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    objc_msgSend(v6, "setObject:forKey:", v19, CFSTR("bounds"));

    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "superview"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%p"), v20));

    objc_msgSend(v6, "setObject:forKey:", v21, CFSTR("superview"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v7, "isHidden")));
    objc_msgSend(v6, "setObject:forKey:", v22, CFSTR("hidden"));

    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "displayNameForView:", v7));
    if (v23)
      objc_msgSend(v6, "setObject:forKey:", v23, CFSTR("displayName"));
    objc_msgSend(v7, "contentScaleFactor");
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    objc_msgSend(v6, "setObject:forKey:", v24, CFSTR("contentsScale"));

  }
}

+ (void)addLayoutInfoForView:(id)a3 toDict:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  id v23;
  void *v24;
  id v25;

  v25 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintsAffectingLayoutForAxis:", 0));
  v8 = arrayOfObjectPointers(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  objc_msgSend(v6, "setObject:forKey:", v9, CFSTR("horizontalAffectingConstraints"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintsAffectingLayoutForAxis:", 1));
  v11 = arrayOfObjectPointers(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  objc_msgSend(v6, "setObject:forKey:", v12, CFSTR("verticalAffectingConstraints"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(a1, "_viewHasAmbiguousLayout:", v25)));
  objc_msgSend(v6, "setObject:forKey:", v13, CFSTR("hasAmbiguousLayout"));

  if (objc_msgSend(a1, "_viewHasAmbiguousLayout:", v25))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a1, "ambiguityStatusMaskForView:", v25)));
    objc_msgSend(v6, "setObject:forKey:", v14, CFSTR("ambiguityStatusMask"));

  }
  objc_msgSend(a1, "firstBaselineOffsetFromTopForView:", v25);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  objc_msgSend(v6, "setObject:forKey:", v15, CFSTR("firstBaselineOffsetFromTop"));

  objc_msgSend(a1, "lastBaselineOffsetFromBottomForView:", v25);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  objc_msgSend(v6, "setObject:forKey:", v16, CFSTR("lastBaselineOffsetFromBottom"));

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "viewForFirstBaselineLayoutPointerForView:", v25));
  if (v17)
    objc_msgSend(v6, "setObject:forKey:", v17, CFSTR("viewForFirstBaselineLayout"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "viewForLastBaselineLayoutPointerForView:", v25));
  if (v18)
    objc_msgSend(v6, "setObject:forKey:", v18, CFSTR("viewForLastBaselineLayout"));
  objc_msgSend(v25, "layoutMargins");
  v23 = __52__DBGViewDebuggerSupport_iOS_addFrameBasics_toDict___block_invoke(v19, v20, v21, v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  objc_msgSend(v6, "setObject:forKey:", v24, CFSTR("layoutMargins"));

}

+ (BOOL)_viewHasAmbiguousLayout:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;

  v3 = a3;
  if (viewWantsAutoLayout(v3))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_layoutVariablesWithAmbiguousValue"));
    v5 = objc_msgSend(v4, "count") != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (unint64_t)ambiguityStatusMaskForView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v20;
  void *v21;
  void *v22;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_layoutVariablesWithAmbiguousValue"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v5));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "superview"));
  if (!v7)
    goto LABEL_7;
  while ((objc_msgSend(v7, "_uiib_hostsLayoutEngine") & 1) == 0)
  {
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "superview"));

    v7 = (void *)v8;
    if (!v8)
      goto LABEL_7;
  }
  if (objc_msgSend(v7, "_uiib_hostsLayoutEngine"))
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_uiib_layoutEngineCreatingIfNecessary"));
  else
LABEL_7:
    v9 = 0;
  v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_minXVariable"));
  if (v10)
  {
    if (objc_msgSend(v6, "containsObject:", v10))
      v11 = 2;
    else
      v11 = 0;
    if (v9 && !objc_msgSend(v9, "hasValue:forVariable:", 0, v10))
      v11 |= 0x400uLL;
  }
  else
  {
    v11 = 0;
  }
  v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_minYVariable"));
  if (v12)
  {
    if (objc_msgSend(v6, "containsObject:", v12))
      v11 |= 4uLL;
    if (v9 && !objc_msgSend(v9, "hasValue:forVariable:", 0, v12))
      v11 |= 0x800uLL;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_boundsWidthVariable"));
  if (v13)
  {
    if (objc_msgSend(v6, "containsObject:", v13))
      v11 |= 8uLL;
    if (v9 && !objc_msgSend(v9, "hasValue:forVariable:", 0, v13))
      v11 |= 0x1000uLL;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_boundsHeightVariable"));
  v20 = v12;
  if (v14)
  {
    if (objc_msgSend(v6, "containsObject:", v14, v12))
      v11 |= 0x10uLL;
    if (v9 && !objc_msgSend(v9, "hasValue:forVariable:", 0, v14))
      v11 |= 0x2000uLL;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_contentWidthVariable", v20));
  v22 = (void *)v10;
  if (!v15)
    goto LABEL_41;
  if ((objc_msgSend(a1, "ibShouldIgnoreScrollableContentWidthAmbiguityForRepresentationOfItem:", v4) & 1) == 0
    && objc_msgSend(v6, "containsObject:", v15))
  {
    v11 |= 0x20uLL;
  }
  if (v9
    && (objc_msgSend(a1, "ibShouldIgnoreScrollableContentWidthAmbiguityForRepresentationOfItem:", v4) & 1) == 0)
  {
    v16 = v6;
    v17 = a1;
    if (!objc_msgSend(v9, "hasValue:forVariable:", 0, v15))
      v11 |= 0x4000uLL;
  }
  else
  {
LABEL_41:
    v16 = v6;
    v17 = a1;
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_contentHeightVariable"));
  if (v18)
  {
    if ((objc_msgSend(v17, "ibShouldIgnoreScrollableContentHeightAmbiguityForRepresentationOfItem:", v4) & 1) == 0
      && objc_msgSend(v16, "containsObject:", v18))
    {
      v11 |= 0x40uLL;
    }
    if (v9
      && (objc_msgSend(v17, "ibShouldIgnoreScrollableContentHeightAmbiguityForRepresentationOfItem:", v4) & 1) == 0
      && !objc_msgSend(v9, "hasValue:forVariable:", 0, v18))
    {
      v11 |= 0x8000uLL;
    }
  }

  return v11;
}

+ (BOOL)ibShouldIgnoreScrollableContentWidthAmbiguityForRepresentationOfItem:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  BOOL v6;

  v3 = a3;
  v4 = objc_opt_class(UIScrollView);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "subviews"));
    v6 = objc_msgSend(v5, "count") == 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (BOOL)ibShouldIgnoreScrollableContentHeightAmbiguityForRepresentationOfItem:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  BOOL v6;

  v3 = a3;
  v4 = objc_opt_class(UIScrollView);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "subviews"));
    v6 = objc_msgSend(v5, "count") == 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (double)firstBaselineOffsetFromTopForView:(id)a3
{
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  v3 = a3;
  v4 = v3;
  if (viewWantsAutoLayout(v3))
  {
    v4 = v3;
    if ((objc_opt_respondsToSelector(v3, "viewForFirstBaselineLayout") & 1) != 0)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "viewForFirstBaselineLayout"));

    }
  }
  v5 = 0.0;
  if (viewWantsAutoLayout(v4)
    && (objc_opt_respondsToSelector(v4, "_firstBaselineOffsetFromTop") & 1) != 0)
  {
    objc_msgSend(v4, "_firstBaselineOffsetFromTop");
    v5 = v6;
  }
  objc_msgSend(v4, "bounds");
  objc_msgSend(v4, "alignmentRectForFrame:");
  objc_msgSend(v4, "convertRect:toView:", v3);
  v8 = v7;
  objc_msgSend(v3, "bounds");
  objc_msgSend(v3, "alignmentRectForFrame:");
  v10 = v5 + v8 + v9;

  return v10;
}

+ (double)lastBaselineOffsetFromBottomForView:(id)a3
{
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;

  v3 = a3;
  v4 = v3;
  if (viewWantsAutoLayout(v3))
  {
    v4 = v3;
    if ((objc_opt_respondsToSelector(v3, "viewForLastBaselineLayout") & 1) != 0)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "viewForLastBaselineLayout"));

    }
  }
  v5 = 0.0;
  if (viewWantsAutoLayout(v4) && (objc_opt_respondsToSelector(v4, "_baselineOffsetFromBottom") & 1) != 0)
  {
    objc_msgSend(v4, "_baselineOffsetFromBottom");
    v5 = v6;
  }
  objc_msgSend(v4, "bounds");
  objc_msgSend(v4, "alignmentRectForFrame:");
  objc_msgSend(v4, "convertRect:toView:", v3);
  v8 = v7;
  v10 = v9;
  objc_msgSend(v3, "bounds");
  objc_msgSend(v3, "alignmentRectForFrame:");
  v13 = v5 + v11 + v12 - (v8 + v10);

  return v13;
}

+ (id)viewForFirstBaselineLayoutPointerForView:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  if (!viewWantsAutoLayout(v3)
    || (objc_opt_respondsToSelector(v3, "viewForFirstBaselineLayout") & 1) == 0)
  {
    v4 = 0;
    goto LABEL_6;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "viewForFirstBaselineLayout"));
  if (!v4)
  {
LABEL_6:
    v5 = 0;
    goto LABEL_7;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%p"), v4));
LABEL_7:

  return v5;
}

+ (id)viewForLastBaselineLayoutPointerForView:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  if (!viewWantsAutoLayout(v3) || (objc_opt_respondsToSelector(v3, "viewForLastBaselineLayout") & 1) == 0)
  {
    v4 = 0;
    goto LABEL_6;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "viewForLastBaselineLayout"));
  if (!v4)
  {
LABEL_6:
    v5 = 0;
    goto LABEL_7;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%p"), v4));
LABEL_7:

  return v5;
}

@end
