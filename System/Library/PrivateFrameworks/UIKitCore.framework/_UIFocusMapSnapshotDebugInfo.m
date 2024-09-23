@implementation _UIFocusMapSnapshotDebugInfo

- (_UIFocusMapSnapshotDebugInfo)initWithSnapshot:(id)a3 focusMapSearchInfo:(id)a4
{
  id v8;
  id v9;
  _UIFocusMapSnapshotDebugInfo *v10;
  _UIFocusMapSnapshotDebugInfo *v11;
  void *v13;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIFocusMapSnapshotDebugInfo.m"), 35, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("snapshot"));

  }
  v14.receiver = self;
  v14.super_class = (Class)_UIFocusMapSnapshotDebugInfo;
  v10 = -[_UIFocusMapSnapshotDebugInfo init](&v14, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_snapshot, a3);
    objc_storeWeak((id *)&v11->_focusMapSearchInfo, v9);
  }

  return v11;
}

- (UIImage)image
{
  UIImage *image;
  UIImage *v4;
  UIImage *v5;

  image = self->_image;
  if (!image)
  {
    -[_UIFocusMapSnapshotDebugInfo _drawImage](self, "_drawImage");
    v4 = (UIImage *)objc_claimAutoreleasedReturnValue();
    v5 = self->_image;
    self->_image = v4;

    image = self->_image;
  }
  return image;
}

- (CGPoint)imageAnchorPoint
{
  id v3;
  double x;
  double y;
  CGPoint result;

  v3 = -[_UIFocusMapSnapshotDebugInfo image](self, "image");
  x = self->_imageAnchorPoint.x;
  y = self->_imageAnchorPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (CGRect)_rectContainingAllFocusRegions
{
  void *v2;
  CGFloat y;
  CGFloat x;
  CGFloat height;
  CGFloat width;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  double v16;
  double v17;
  double v18;
  double v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;
  CGRect v26;
  CGRect v27;
  CGRect result;
  CGRect v29;

  v25 = *MEMORY[0x1E0C80C00];
  -[_UIFocusMapSnapshotDebugInfo snapshot](self, "snapshot");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  x = *MEMORY[0x1E0C9D628];
  y = *(double *)(MEMORY[0x1E0C9D628] + 8);
  width = *(double *)(MEMORY[0x1E0C9D628] + 16);
  height = *(double *)(MEMORY[0x1E0C9D628] + 24);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  objc_msgSend(v2, "regions", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v21;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(v2, "snapshotFrameForRegion:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v11));
        v29.origin.x = v12;
        v29.origin.y = v13;
        v29.size.width = v14;
        v29.size.height = v15;
        v26.origin.x = x;
        v26.origin.y = y;
        v26.size.width = width;
        v26.size.height = height;
        v27 = CGRectUnion(v26, v29);
        x = v27.origin.x;
        y = v27.origin.y;
        width = v27.size.width;
        height = v27.size.height;
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v9);
  }

  v16 = x;
  v17 = y;
  v18 = width;
  v19 = height;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (id)_drawImage
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  void *v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  BOOL v23;
  CGFloat v24;
  double v25;
  double v26;
  double v27;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v32;
  void *v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  void *v38;
  CGFloat v39;
  CGFloat v40;
  CGFloat v41;
  CGFloat v42;
  double v43;
  double v44;
  CGFloat v45;
  CGFloat v46;
  _QWORD *ContextStack;
  CGContext *v48;
  id v49;
  void *v50;
  void *v51;
  CGFloat v52;
  CGFloat v53;
  void *v54;
  CGFloat v55;
  CGFloat MidY;
  id v57;
  void *v58;
  void *v59;
  double v60;
  CGFloat v61;
  double v62;
  CGFloat v63;
  double v64;
  CGFloat v65;
  double v66;
  CGFloat v67;
  void *v68;
  id v69;
  id v70;
  void *v71;
  id v72;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t i;
  uint64_t v78;
  void *v79;
  id v80;
  void *v81;
  void *v83;
  CGFloat v84;
  CGFloat v85;
  CGFloat v86;
  CGFloat v87;
  void *v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  _BYTE v93[128];
  uint64_t v94;
  CGRect v95;
  CGRect v96;
  CGRect v97;
  CGRect v98;
  CGRect v99;
  CGRect v100;
  CGRect v101;
  CGRect v102;
  CGRect v103;
  CGRect v104;
  CGRect v105;
  CGRect v106;
  CGRect v107;
  CGRect v108;
  CGRect v109;
  CGRect v110;
  CGRect v111;
  CGRect v112;
  CGRect v113;
  CGRect v114;

  v94 = *MEMORY[0x1E0C80C00];
  -[_UIFocusMapSnapshotDebugInfo snapshot](self, "snapshot");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mapArea");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "coordinateSpace");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  objc_msgSend(v3, "_searchArea");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "frame");
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;

  v86 = v18;
  v87 = v16;
  v95.origin.x = v16;
  v95.origin.y = v18;
  v84 = v22;
  v85 = v20;
  v95.size.width = v20;
  v95.size.height = v22;
  v111.origin.x = v7;
  v111.origin.y = v9;
  v111.size.width = v11;
  v111.size.height = v13;
  v23 = CGRectEqualToRect(v95, v111);
  -[_UIFocusMapSnapshotDebugInfo _rectContainingAllFocusRegions](self, "_rectContainingAllFocusRegions");
  x = v24;
  y = v25;
  width = v26;
  height = v27;
  if (v5)
  {
    v112.origin.x = v7;
    v112.origin.y = v9;
    v112.size.width = v11;
    v112.size.height = v13;
    v96 = CGRectUnion(*(CGRect *)&v24, v112);
    x = v96.origin.x;
    y = v96.origin.y;
    width = v96.size.width;
    height = v96.size.height;
  }
  objc_msgSend(v3, "focusedRegion");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    objc_msgSend(v3, "focusedRegion");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "snapshotFrameForRegion:", v33);
    v113.origin.x = v34;
    v113.origin.y = v35;
    v113.size.width = v36;
    v113.size.height = v37;
    v97.origin.x = x;
    v97.origin.y = y;
    v97.size.width = width;
    v97.size.height = height;
    v98 = CGRectUnion(v97, v113);
    x = v98.origin.x;
    y = v98.origin.y;
    width = v98.size.width;
    height = v98.size.height;

  }
  if (!v23)
  {
    objc_msgSend(v3, "_searchArea");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "frame");
    v114.origin.x = v39;
    v114.origin.y = v40;
    v114.size.width = v41;
    v114.size.height = v42;
    v99.origin.x = x;
    v99.origin.y = y;
    v99.size.width = width;
    v99.size.height = height;
    v100 = CGRectUnion(v99, v114);
    x = v100.origin.x;
    y = v100.origin.y;
    width = v100.size.width;
    height = v100.size.height;

  }
  v101.origin.x = x;
  v101.origin.y = y;
  v101.size.width = width;
  v101.size.height = height;
  v102 = CGRectInset(v101, -90.0, -60.0);
  v43 = v102.origin.x;
  v44 = v102.origin.y;
  v45 = v102.size.width;
  v46 = v102.size.height;
  _UIGraphicsBeginImageContextWithOptions(0, 0, v102.size.width, v102.size.height, 0.0);
  ContextStack = GetContextStack(0);
  if (*(int *)ContextStack < 1)
    v48 = 0;
  else
    v48 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
  +[UIColor whiteColor](UIColor, "whiteColor");
  v49 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CGContextSetFillColorWithColor(v48, (CGColorRef)objc_msgSend(v49, "CGColor"));

  v103.origin.x = *(CGFloat *)MEMORY[0x1E0C9D538];
  v103.origin.y = *(CGFloat *)(MEMORY[0x1E0C9D538] + 8);
  v103.size.width = v45;
  v103.size.height = v46;
  CGContextFillRect(v48, v103);
  CGContextTranslateCTM(v48, -v43, -v44);
  +[UIScreen mainScreen](UIScreen, "mainScreen");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "_preferredFocusedWindow");
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  if (v51)
  {
    objc_msgSend(v51, "frame");
    _UIGraphicsBeginImageContextWithOptions(0, 0, v52, v53, 0.0);
    objc_msgSend(v51, "bounds");
    objc_msgSend(v51, "drawViewHierarchyInRect:afterScreenUpdates:", 1);
    _UIGraphicsGetImageFromCurrentImageContext(0);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();
    if (v54)
    {
      objc_msgSend(v51, "frame");
      objc_msgSend(v54, "drawInRect:blendMode:alpha:", 0);
    }

  }
  if (v5)
  {
    v104.origin.x = v7;
    v104.origin.y = v9;
    v104.size.width = v11;
    v104.size.height = v13;
    v55 = CGRectGetMidX(v104) - v43;
    v105.origin.x = v7;
    v105.origin.y = v9;
    v105.size.width = v11;
    v105.size.height = v13;
    MidY = CGRectGetMidY(v105);
    self->_imageAnchorPoint.x = v55;
    self->_imageAnchorPoint.y = MidY - v43;
    CGContextSaveGState(v48);
    +[UIColor blackColor](UIColor, "blackColor");
    v57 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    CGContextSetStrokeColorWithColor(v48, (CGColorRef)objc_msgSend(v57, "CGColor"));

    v106.origin.x = v7;
    v106.origin.y = v9;
    v106.size.width = v11;
    v106.size.height = v13;
    CGContextStrokeRect(v48, v106);
    CGContextRestoreGState(v48);
  }
  objc_msgSend(v3, "focusedRegion", v51);
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  if (v58)
  {
    objc_msgSend(v3, "focusedRegion");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "snapshotFrameForRegion:", v59);
    v61 = v60;
    v63 = v62;
    v65 = v64;
    v67 = v66;

    CGContextSaveGState(v48);
    +[UIColor redColor](UIColor, "redColor");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "colorWithAlphaComponent:", 0.5);
    v69 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    CGContextSetFillColorWithColor(v48, (CGColorRef)objc_msgSend(v69, "CGColor"));

    v107.origin.x = v61;
    v107.origin.y = v63;
    v107.size.width = v65;
    v107.size.height = v67;
    CGContextFillRect(v48, v107);
    +[UIColor redColor](UIColor, "redColor");
    v70 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    CGContextSetStrokeColorWithColor(v48, (CGColorRef)objc_msgSend(v70, "CGColor"));

    CGContextSetLineWidth(v48, 4.0);
    v108.origin.x = v61;
    v108.origin.y = v63;
    v108.size.width = v65;
    v108.size.height = v67;
    CGContextStrokeRect(v48, v108);
    CGContextRestoreGState(v48);
  }
  v88 = v5;
  if (!v23)
  {
    CGContextSaveGState(v48);
    +[UIColor redColor](UIColor, "redColor");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "colorWithAlphaComponent:", 0.1);
    v72 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    CGContextSetFillColorWithColor(v48, (CGColorRef)objc_msgSend(v72, "CGColor"));

    v109.origin.y = v86;
    v109.origin.x = v87;
    v109.size.height = v84;
    v109.size.width = v85;
    CGContextFillRect(v48, v109);
    CGContextRestoreGState(v48);
  }
  v91 = 0u;
  v92 = 0u;
  v89 = 0u;
  v90 = 0u;
  objc_msgSend(v3, "regions");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v89, v93, 16);
  if (v74)
  {
    v75 = v74;
    v76 = *(_QWORD *)v90;
    do
    {
      for (i = 0; i != v75; ++i)
      {
        if (*(_QWORD *)v90 != v76)
          objc_enumerationMutation(v73);
        v78 = *(_QWORD *)(*((_QWORD *)&v89 + 1) + 8 * i);
        CGContextSaveGState(v48);
        +[_UIFocusRegionDebugQuickLook drawDebugQuickLookImageForRegion:withInfo:inContext:](_UIFocusRegionDebugQuickLook, "drawDebugQuickLookImageForRegion:withInfo:inContext:", v78, self, v48);
        CGContextRestoreGState(v48);
      }
      v75 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v89, v93, 16);
    }
    while (v75);
  }

  if (!v23)
  {
    CGContextSaveGState(v48);
    +[UIColor redColor](UIColor, "redColor");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "colorWithAlphaComponent:", 0.5);
    v80 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    CGContextSetStrokeColorWithColor(v48, (CGColorRef)objc_msgSend(v80, "CGColor"));

    CGContextSetLineDash(v48, 0.0, &_drawImage_dashedLineLength, 1uLL);
    CGContextSetLineWidth(v48, 4.0);
    v110.origin.y = v86;
    v110.origin.x = v87;
    v110.size.height = v84;
    v110.size.width = v85;
    CGContextStrokeRect(v48, v110);
    CGContextRestoreGState(v48);
  }
  _UIGraphicsGetImageFromCurrentImageContext(0);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();

  return v81;
}

+ (id)_summaryImageForDebugInfoArray:(id)a3 forFocusMovementWithInfo:(id)a4 scaleFactor:(double)a5
{
  id v7;
  id v8;
  unint64_t v9;
  void *v10;
  double v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  BOOL v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  double v21;
  double v22;
  uint64_t v23;
  int v24;
  uint64_t i;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  uint64_t v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  _QWORD *ContextStack;
  CGContext *v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  double v56;
  uint64_t v57;
  double v58;
  double v59;
  uint64_t v60;
  double v61;
  uint64_t j;
  void *v63;
  void *v64;
  double v65;
  double v66;
  double v67;
  double v68;
  void *v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  id v83;
  uint64_t v84;
  double y;
  double v87;
  void *v88;
  double v89;
  id v90;
  id v91;
  double v92;
  double v93;
  void *v94;
  double v95;
  double v96;
  BOOL v97;
  double v98;
  id obj;
  id obja;
  unint64_t v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  _BYTE v110[128];
  _QWORD v111[2];
  _QWORD v112[2];
  _BYTE v113[128];
  uint64_t v114;
  CGRect v115;

  v114 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!objc_msgSend(v7, "count"))
  {
    v10 = 0;
    goto LABEL_74;
  }
  if (v8)
    v9 = objc_msgSend(v8, "heading");
  else
    v9 = 0;
  v89 = a5;
  v90 = v8;
  v101 = objc_msgSend(v7, "count");
  objc_msgSend(off_1E167A828, "preferredFontForTextStyle:", CFSTR("UICTFontTextStyleHeadline"));
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *MEMORY[0x1E0C9D820];
  v12 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  v106 = 0u;
  v107 = 0u;
  v108 = 0u;
  v109 = 0u;
  v91 = v7;
  obj = v7;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v106, v113, 16);
  if (!v13)
  {
    LOBYTE(v23) = 1;
    v21 = 0.0;
    v22 = 0.0;
    v24 = 1;
    goto LABEL_32;
  }
  v14 = v13;
  v15 = *(_QWORD *)v107;
  v17 = (v9 & 3) != 0 || v9 == 0;
  v97 = v17;
  v18 = (v9 >> 3) & 1;
  v19 = (v9 >> 1) & 1;
  v20 = 1;
  v21 = 0.0;
  v22 = 0.0;
  v23 = 1;
  LOBYTE(v24) = 1;
  do
  {
    for (i = 0; i != v14; ++i)
    {
      if (*(_QWORD *)v107 != v15)
        objc_enumerationMutation(obj);
      v26 = *(void **)(*((_QWORD *)&v106 + 1) + 8 * i);
      objc_msgSend(v26, "image");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "imageAnchorPoint");
      v29 = v28;
      v31 = v30;
      if ((v20 & 1) != 0)
      {
        v23 = v19;
        v32 = v18;
        if (!v97)
          goto LABEL_19;
      }
      else
      {
        v32 = v23;
        if ((v24 & 1) == 0)
        {
LABEL_19:
          objc_msgSend(v27, "size");
          v12 = v12 + v33 + 0.0;
          if (v22 < v29)
            v22 = v29;
          objc_msgSend(v27, "size");
          v24 = 0;
          v35 = v34 - v22;
          v23 = v32;
          goto LABEL_26;
        }
      }
      objc_msgSend(v27, "size");
      v11 = v11 + v36 + 0.0;
      if (v22 < v31)
        v22 = v31;
      objc_msgSend(v27, "size");
      v35 = v37 - v22;
      v24 = 1;
LABEL_26:
      if (v21 < v35)
        v21 = v35;

      v20 = 0;
    }
    v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v106, v113, 16);
    v20 = 0;
  }
  while (v14);
LABEL_32:

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), objc_msgSend(obj, "count"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = *(_QWORD *)off_1E1678D98;
  v111[0] = *(_QWORD *)off_1E1678D90;
  v111[1] = v39;
  v112[0] = v94;
  +[UIColor blackColor](UIColor, "blackColor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v112[1] = v40;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v112, v111, 2);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  v88 = v38;
  objc_msgSend(v38, "sizeWithAttributes:", v41);
  if (v42 < v43)
    v42 = v43;
  v44 = v42 * 0.6;
  v98 = v42 * 0.6;
  if (v24)
  {
    v45 = v44 * 5.0;
    v46 = v44 * 5.0 + -60.0;
    if (v45 < 60.0)
      v46 = 0.0;
    if (v101 <= 1)
      v47 = 0.0;
    else
      v47 = v46;
    v12 = v21 + v22 + v47;
  }
  else
  {
    v48 = v44 * 6.0;
    v49 = v44 * 6.0 + -90.0;
    if (v48 < 90.0)
      v49 = 0.0;
    if (v101 <= 1)
      v47 = 0.0;
    else
      v47 = v49;
    v11 = v21 + v22 + v47;
  }
  if ((v23 & 1) != 0)
    v50 = v47;
  else
    v50 = 0.0;
  _UIGraphicsBeginImageContextWithOptions(0, 0, v11, v12, 0.0);
  ContextStack = GetContextStack(0);
  if (*(int *)ContextStack < 1)
    v52 = 0;
  else
    v52 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
  +[UIColor whiteColor](UIColor, "whiteColor");
  v53 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CGContextSetFillColorWithColor(v52, (CGColorRef)objc_msgSend(v53, "CGColor"));

  v115.origin.x = *(CGFloat *)MEMORY[0x1E0C9D538];
  v115.origin.y = *(CGFloat *)(MEMORY[0x1E0C9D538] + 8);
  y = v115.origin.y;
  v87 = *MEMORY[0x1E0C9D538];
  v92 = v12;
  v93 = v11;
  v115.size.width = v11;
  v115.size.height = v12;
  CGContextFillRect(v52, v115);
  v104 = 0u;
  v105 = 0u;
  v102 = 0u;
  v103 = 0u;
  obja = obj;
  v54 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v102, v110, 16);
  if (v54)
  {
    v55 = v54;
    v56 = v22 + v50;
    v57 = *(_QWORD *)v103;
    if ((v23 & 1) != 0)
      v58 = (v47 + 90.0) * 0.5;
    else
      v58 = v11 - (v47 + 90.0) * 0.5;
    v59 = (v47 + 60.0) * 0.5;
    if ((v23 & 1) == 0)
      v59 = v12 - v59;
    v95 = v59;
    v96 = v58;
    v60 = 1;
    v61 = 0.0;
    do
    {
      for (j = 0; j != v55; ++j)
      {
        if (*(_QWORD *)v103 != v57)
          objc_enumerationMutation(obja);
        v63 = *(void **)(*((_QWORD *)&v102 + 1) + 8 * j);
        objc_msgSend(v63, "image");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "imageAnchorPoint");
        v66 = v65;
        v68 = v67;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), v60 + j);
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "sizeWithAttributes:", v41);
        v71 = v70;
        v73 = v72;
        if (v24)
        {
          objc_msgSend(v64, "drawAtPoint:", v61, v56 - v68);
          objc_msgSend(v64, "size");
          v61 = v61 + v74 + 0.0;
          if (v101 < 2)
            goto LABEL_69;
          objc_msgSend(v64, "size");
          v76 = v71 * 0.5;
          v77 = v61 - v75 * 0.5 - v71 * 0.5;
          v78 = v73 * 0.5;
          v79 = v95;
        }
        else
        {
          objc_msgSend(v64, "drawAtPoint:", v56 - v66, v61);
          objc_msgSend(v64, "size");
          v61 = v61 + v80 + 0.0;
          if (v101 < 2)
            goto LABEL_69;
          v76 = v71 * 0.5;
          v77 = v96 - v71 * 0.5;
          objc_msgSend(v64, "size");
          v79 = v61 - v81 * 0.5;
          v78 = v73 * 0.5;
        }
        v82 = v79 - v78;
        objc_msgSend(v69, "drawInRect:withAttributes:", v41, v77, v79 - v78, v71, v73);
        CGContextSetLineWidth(v52, 2.0);
        +[UIColor blackColor](UIColor, "blackColor");
        v83 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        CGContextSetStrokeColorWithColor(v52, (CGColorRef)objc_msgSend(v83, "CGColor"));

        CGContextAddArc(v52, v77 + v76, v82 + v78, v98, 0.0, 6.28318531, 1);
        CGContextStrokePath(v52);
LABEL_69:

      }
      v55 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v102, v110, 16);
      v60 += j;
    }
    while (v55);
  }

  _UIGraphicsGetImageFromCurrentImageContext(0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  if (v89 + -1.0 > 2.22044605e-16)
  {
    _UIGraphicsBeginImageContextWithOptions(0, 0, v93 * v89, v92 * v89, 0.0);
    objc_msgSend(v10, "drawInRect:", v87, y, v93 * v89, v92 * v89);
    _UIGraphicsGetImageFromCurrentImageContext(0);
    v84 = objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();

    v10 = (void *)v84;
  }
  v8 = v90;
  v7 = v91;

LABEL_74:
  return v10;
}

- (_UIFocusMapSnapshot)snapshot
{
  return self->_snapshot;
}

- (_UIFocusMapSearchInfo)focusMapSearchInfo
{
  return (_UIFocusMapSearchInfo *)objc_loadWeakRetained((id *)&self->_focusMapSearchInfo);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_focusMapSearchInfo);
  objc_storeStrong((id *)&self->_snapshot, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end
