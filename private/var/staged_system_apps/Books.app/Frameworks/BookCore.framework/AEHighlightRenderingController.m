@implementation AEHighlightRenderingController

- (AEHighlightRenderingController)init
{
  AEHighlightRenderingController *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AEHighlightRenderingController;
  v2 = -[AEHighlightRenderingController init](&v6, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMapTable strongToStrongObjectsMapTable](NSMapTable, "strongToStrongObjectsMapTable"));
    -[AEHighlightRenderingController setDataHighlights:](v2, "setDataHighlights:", v3);

    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMapTable strongToStrongObjectsMapTable](NSMapTable, "strongToStrongObjectsMapTable"));
    -[AEHighlightRenderingController setContainerLayers:](v2, "setContainerLayers:", v4);

    -[AEHighlightRenderingController setAnnotationBlendMode:](v2, "setAnnotationBlendMode:", 0);
  }
  return v2;
}

- (id)highlightWithData:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AEHighlightRenderingController dataHighlights](self, "dataHighlights"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v4));

  return v6;
}

+ (UIEdgeInsets)highlightInsets:(BOOL)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  UIEdgeInsets result;

  v3 = 0.0;
  v4 = 0.0;
  v5 = 0.0;
  v6 = 0.0;
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

+ (UIEdgeInsets)insetsForHighlight:(id)a3
{
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
  double v14;
  double v15;
  double v16;
  UIEdgeInsets result;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "annotation"));
  objc_msgSend(a1, "highlightInsets:", objc_msgSend(v4, "annotationIsUnderline"));
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = v6 + 0.0;
  v14 = v10 + 0.0;
  v15 = v8;
  v16 = v12;
  result.right = v16;
  result.bottom = v14;
  result.left = v15;
  result.top = v13;
  return result;
}

+ (UIEdgeInsets)insetsForHighlight:(id)a3 lineRect:(CGRect)a4 numberOfLines:(unint64_t)a5
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  unsigned int v14;
  double v15;
  double v16;
  double v17;
  double v18;
  UIEdgeInsets result;

  v5 = a3;
  +[AEHighlightRenderingController insetsForHighlight:](AEHighlightRenderingController, "insetsForHighlight:", v5);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v14 = objc_msgSend(v5, "vertical");

  if (v14)
    v15 = v7;
  else
    v15 = v13;
  if (v14)
    v16 = v9;
  else
    v16 = v11;
  if (v14)
    v17 = v11;
  else
    v17 = v9;
  if (v14)
    v18 = v13;
  else
    v18 = v7;
  result.right = v15;
  result.bottom = v16;
  result.left = v17;
  result.top = v18;
  return result;
}

+ (CGRect)p_currentLineRectForLine:(id)a3 ofHighlight:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  unsigned __int8 v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGRect result;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "currentLineRect");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v16 = objc_msgSend(v7, "includesCapSpace");

  if ((v16 & 1) == 0)
  {
    objc_msgSend(a1, "insetsForHighlight:", v6);
    v9 = v9 + v17;
    v11 = v11 + v18;
    v13 = v13 - (v17 + v19);
    v15 = v15 - (v18 + v20);
  }

  v21 = v9;
  v22 = v11;
  v23 = v13;
  v24 = v15;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

+ (CGRect)p_fullLineRectForLine:(id)a3 ofHighlight:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  unsigned __int8 v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGRect result;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "fullLineRect");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v16 = objc_msgSend(v7, "includesCapSpace");

  if ((v16 & 1) == 0)
  {
    objc_msgSend(a1, "insetsForHighlight:", v6);
    v9 = v9 + v17;
    v11 = v11 + v18;
    v13 = v13 - (v17 + v19);
    v15 = v15 - (v18 + v20);
  }

  v21 = v9;
  v22 = v11;
  v23 = v13;
  v24 = v15;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (id)p_lineRectsForHighlight:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lines"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v5, "count")));
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v11);
        v13 = (void *)objc_opt_class(self);
        objc_msgSend(v13, "p_currentLineRectForLine:ofHighlight:", v12, v4, (_QWORD)v16);
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:"));
        objc_msgSend(v6, "addObject:", v14);

        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

  return v6;
}

- (void)p_renderLinesForHighlight:(id)a3 intoContainerLayer:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  double x;
  double y;
  double width;
  double height;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *i;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGPath *Mutable;
  void *v26;
  id v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  void *j;
  void *v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  unsigned int v45;
  double v46;
  double v47;
  id v48;
  void *v49;
  id v50;
  id v51;
  id v52;
  uint64_t v53;
  void *k;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  id v61;
  void *v62;
  double v63;
  void *v64;
  void *v65;
  void *v66;
  AEHighlightRenderingController *v67;
  void *v68;
  void *v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  _BYTE v82[128];
  _BYTE v83[128];
  _BYTE v84[128];
  CGRect v85;
  CGRect v86;
  CGRect v87;
  CGRect v88;
  CGRect v89;
  CGRect v90;
  CGRect v91;
  CGRect v92;
  CGRect v93;

  v6 = a3;
  v7 = a4;
  +[CATransaction begin](CATransaction, "begin");
  +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[AEHighlightRenderingController p_lineRectsForHighlight:](self, "p_lineRectsForHighlight:", v6));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "annotation"));
  v10 = objc_msgSend(v9, "annotationIsUnderline");

  v67 = self;
  if (-[AEHighlightRenderingController canUseFilters](self, "canUseFilters"))
    v11 = -[AEHighlightRenderingController annotationBlendMode](self, "annotationBlendMode");
  else
    v11 = 0;
  objc_msgSend(v7, "setBlendMode:", v11);
  x = CGRectNull.origin.x;
  y = CGRectNull.origin.y;
  width = CGRectNull.size.width;
  height = CGRectNull.size.height;
  v80 = 0u;
  v81 = 0u;
  v78 = 0u;
  v79 = 0u;
  v16 = v8;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v78, v84, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v79;
    do
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(_QWORD *)v79 != v19)
          objc_enumerationMutation(v16);
        objc_msgSend(*(id *)(*((_QWORD *)&v78 + 1) + 8 * (_QWORD)i), "CGRectValue");
        v21 = v85.origin.x;
        v22 = v85.origin.y;
        v23 = v85.size.width;
        v24 = v85.size.height;
        if (!CGRectIsEmpty(v85))
        {
          v86.origin.x = x;
          v86.origin.y = y;
          v86.size.width = width;
          v86.size.height = height;
          v93.origin.x = v21;
          v93.origin.y = v22;
          v93.size.width = v23;
          v93.size.height = v24;
          v87 = CGRectUnion(v86, v93);
          x = v87.origin.x;
          y = v87.origin.y;
          width = v87.size.width;
          height = v87.size.height;
        }
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v78, v84, 16);
    }
    while (v18);
  }

  v88.origin.x = x;
  v88.origin.y = y;
  v88.size.width = width;
  v88.size.height = height;
  if (CGRectIsNull(v88))
  {
    x = CGRectZero.origin.x;
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
  }
  v68 = v7;
  objc_msgSend(v7, "setFrame:", x, y, width, height);
  Mutable = CGPathCreateMutable();
  CGPathMoveToPoint(Mutable, 0, 0.0, 0.0);
  v76 = 0u;
  v77 = 0u;
  v74 = 0u;
  v75 = 0u;
  v69 = v6;
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lines"));
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v74, v83, 16);
  if (v27)
  {
    v28 = v27;
    v29 = 0;
    v30 = *(_QWORD *)v75;
    do
    {
      for (j = 0; j != v28; j = (char *)j + 1)
      {
        if (*(_QWORD *)v75 != v30)
          objc_enumerationMutation(v26);
        v32 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * (_QWORD)j);
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectAtIndexedSubscript:", (char *)j + v29));
        objc_msgSend(v33, "CGRectValue");
        v35 = v34;
        v37 = v36;
        v39 = v38;
        v41 = v40;

        v89.origin.x = v35;
        v89.origin.y = v37;
        v89.size.width = v39;
        v89.size.height = v41;
        if (!CGRectIsEmpty(v89))
        {
          v42 = CGPointSubtract(v35, v37, x, y);
          v44 = v43;
          if ((_DWORD)v10)
          {
            v45 = objc_msgSend(v32, "underlineDirection");
            if (v45 == 2)
            {
              v91.origin.x = v42;
              v91.origin.y = v44;
              v91.size.width = v39;
              v91.size.height = v41;
              v42 = CGRectGetMaxX(v91) + -2.0;
            }
            else
            {
              if (v45 != 1)
              {
                if (!v45)
                {
                  v90.origin.x = v42;
                  v90.origin.y = v44;
                  v90.size.width = v39;
                  v90.size.height = v41;
                  v44 = CGRectGetMaxY(v90) + -2.0;
                  v41 = 2.0;
                }
                goto LABEL_29;
              }
              v42 = v42 + 0.0;
            }
            v39 = 2.0;
          }
LABEL_29:
          objc_msgSend(v69, "cornerRadius");
          if (v46 <= 0.0)
          {
            v92.origin.x = v42;
            v92.origin.y = v44;
            v92.size.width = v39;
            v92.size.height = v41;
            CGPathAddRect(Mutable, 0, v92);
          }
          else
          {
            objc_msgSend(v69, "cornerRadius");
            v48 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v42, v44, v39, v41, v47)));
            CGPathAddPath(Mutable, 0, (CGPathRef)objc_msgSend(v48, "CGPath"));

          }
          continue;
        }
      }
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v74, v83, 16);
      v29 += (uint64_t)j;
    }
    while (v28);
  }

  v72 = 0u;
  v73 = 0u;
  v70 = 0u;
  v71 = 0u;
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "sublayers"));
  v50 = objc_msgSend(v49, "copy");

  v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v70, v82, 16);
  if (v51)
  {
    v52 = v51;
    v53 = *(_QWORD *)v71;
    do
    {
      for (k = 0; k != v52; k = (char *)k + 1)
      {
        if (*(_QWORD *)v71 != v53)
          objc_enumerationMutation(v50);
        objc_msgSend(*(id *)(*((_QWORD *)&v70 + 1) + 8 * (_QWORD)k), "removeFromSuperlayer");
      }
      v52 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v70, v82, 16);
    }
    while (v52);
  }

  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "annotation"));
  v56 = (void *)objc_claimAutoreleasedReturnValue(+[AEAnnotationTheme themeForAnnotationStyle:pageTheme:isUnderline:](AEAnnotationTheme, "themeForAnnotationStyle:pageTheme:isUnderline:", objc_msgSend(v55, "annotationStyle"), -[AEHighlightRenderingController pageTheme](v67, "pageTheme"), v10));

  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "highlightColor"));
  if ((char *)-[AEHighlightRenderingController pageTheme](v67, "pageTheme") != (char *)&dword_0 + 3)
  {
    v58 = objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "bkaxAdjustedDarkerForIncreaseContrast"));

    v57 = (void *)v58;
  }
  +[AEAnnotationTheme highlightOpacityForPageTheme:](AEAnnotationTheme, "highlightOpacityForPageTheme:", -[AEHighlightRenderingController pageTheme](v67, "pageTheme"));
  v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "colorWithAlphaComponent:"));

  if (-[AEHighlightRenderingController drawSpecialGrayHighlights](v67, "drawSpecialGrayHighlights")
    && (char *)-[AEHighlightRenderingController pageTheme](v67, "pageTheme") == (char *)&dword_0 + 2)
  {
    v60 = (void *)objc_claimAutoreleasedReturnValue(+[CAShapeLayer layer](CAShapeLayer, "layer"));
    v61 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor")));
    objc_msgSend(v60, "setFillColor:", objc_msgSend(v61, "CGColor"));

    v62 = v68;
    objc_msgSend(v68, "bounds");
    objc_msgSend(v60, "setBounds:");
    v63 = CGPointZero.y;
    objc_msgSend(v60, "setAnchorPoint:", CGPointZero.x, v63);
    objc_msgSend(v60, "setPosition:", CGPointZero.x, v63);
    objc_msgSend(v60, "setPath:", Mutable);
    objc_msgSend(v68, "addSublayer:", v60);
    v64 = (void *)objc_claimAutoreleasedReturnValue(+[CAShapeLayer layer](CAShapeLayer, "layer"));
    objc_msgSend(v64, "setFillColor:", objc_msgSend(objc_retainAutorelease(v59), "CGColor"));
    objc_msgSend(v68, "bounds");
    objc_msgSend(v64, "setBounds:");
    objc_msgSend(v64, "setAnchorPoint:", CGPointZero.x, v63);
    objc_msgSend(v64, "setPosition:", CGPointZero.x, v63);
    objc_msgSend(v64, "setPath:", Mutable);
    objc_msgSend(v68, "addSublayer:", v64);

  }
  else
  {
    v62 = v68;
    objc_msgSend(v68, "setFillColor:", objc_msgSend(objc_retainAutorelease(v59), "CGColor"));
  }
  objc_msgSend(v62, "setPath:", Mutable);
  CGPathRelease(Mutable);
  objc_msgSend(v62, "setHidden:", 0);
  v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", x, y, width, height));
  objc_msgSend(v62, "setValue:forKey:", v65, CFSTR("kAEHighlightLayerCurrentRectKey"));

  v66 = (void *)objc_claimAutoreleasedReturnValue(-[AEHighlightRenderingController containerLayers](v67, "containerLayers"));
  objc_msgSend(v66, "setObject:forKey:", v62, v69);

  +[CATransaction commit](CATransaction, "commit");
}

- (void)addHighlight:(id)a3 forData:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[AEHighlightRenderingController dataHighlights](self, "dataHighlights"));
  objc_msgSend(v8, "setObject:forKey:", v7, v6);

  v9 = (id)objc_claimAutoreleasedReturnValue(+[AEHighlightContainerLayer layer](AEHighlightContainerLayer, "layer"));
  -[AEHighlightRenderingController p_renderLinesForHighlight:intoContainerLayer:](self, "p_renderLinesForHighlight:intoContainerLayer:", v7, v9);

}

- (void)removeHighlightForData:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AEHighlightRenderingController dataHighlights](self, "dataHighlights"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", v10));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[AEHighlightRenderingController containerLayers](self, "containerLayers"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", v5));

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[AEHighlightRenderingController containerLayers](self, "containerLayers"));
    objc_msgSend(v8, "removeObjectForKey:", v5);

    objc_msgSend(v7, "removeFromSuperlayer");
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[AEHighlightRenderingController dataHighlights](self, "dataHighlights"));
    objc_msgSend(v9, "removeObjectForKey:", v10);

  }
}

- (void)removeAll
{
  void *v3;
  id v4;
  NSMapTable *v5;
  NSArray *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AEHighlightRenderingController dataHighlights](self, "dataHighlights"));
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v5 = (NSMapTable *)objc_claimAutoreleasedReturnValue(-[AEHighlightRenderingController dataHighlights](self, "dataHighlights"));
    v6 = NSAllMapTableKeys(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = objc_msgSend(v7, "copy");

    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v9 = v8;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v15;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v15 != v12)
            objc_enumerationMutation(v9);
          -[AEHighlightRenderingController removeHighlightForData:](self, "removeHighlightForData:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v13), (_QWORD)v14);
          v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v11);
    }

  }
}

- (void)updatedHighlight:(id)a3 forceRerender:(BOOL)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a3;
  if (v5)
  {
    v8 = v5;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[AEHighlightRenderingController containerLayers](self, "containerLayers"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", v8));

    if (!v7)
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[AEHighlightContainerLayer layer](AEHighlightContainerLayer, "layer"));
    -[AEHighlightRenderingController p_renderLinesForHighlight:intoContainerLayer:](self, "p_renderLinesForHighlight:intoContainerLayer:", v8, v7);

    v5 = v8;
  }

}

- (void)updatedHighlight:(id)a3
{
  -[AEHighlightRenderingController updatedHighlight:forceRerender:](self, "updatedHighlight:forceRerender:", a3, 0);
}

- (id)p_orderHighlights:(id)a3
{
  return objc_msgSend(a3, "sortedArrayUsingComparator:", &stru_28FED8);
}

- (id)highlightLayers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AEHighlightRenderingController dataHighlights](self, "dataHighlights"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectEnumerator"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allObjects"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[AEHighlightRenderingController p_orderHighlights:](self, "p_orderHighlights:", v6));

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v22;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[AEHighlightRenderingController containerLayers](self, "containerLayers", (_QWORD)v21));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKey:", v13));

        if (v15)
          objc_msgSend(v3, "addObject:", v15);
        else
          BCReportAssertionFailureWithMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookCore/BookCore/AssetsEngine/AECore/Annotations/AEHighlightRenderingController.m", 393, (uint64_t)"-[AEHighlightRenderingController highlightLayers]", (uint64_t)"containerLayer", 0, v16, v17, v18, v21);

        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v19 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      v10 = v19;
    }
    while (v19);
  }

  return v3;
}

- (id)p_highlightForContainerLayer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v4 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AEHighlightRenderingController containerLayers](self, "containerLayers", 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "keyEnumerator"));

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    while (2)
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[AEHighlightRenderingController containerLayers](self, "containerLayers"));
        v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", v11));

        if (v13 == v4)
        {
          v14 = v11;

          goto LABEL_11;
        }

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v8)
        continue;
      break;
    }
  }
  v14 = 0;
LABEL_11:

  return v14;
}

- (id)annotationUuidForHighlightLayer:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AEHighlightRenderingController p_highlightForContainerLayer:](self, "p_highlightForContainerLayer:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "annotation"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "annotationUuid"));

  return v5;
}

- (BOOL)layer:(id)a3 containsHighlightAtPoint:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  unsigned int v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  id v25;
  id v26;
  uint64_t v27;
  void *i;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  double v33;
  double v34;
  const CGPath *v35;
  unsigned __int8 v36;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  CGPoint v43;
  CGPoint v44;
  CGRect v45;

  y = a4.y;
  x = a4.x;
  v7 = a3;
  v8 = objc_opt_class(CAShapeLayer);
  v9 = BUDynamicCast(v8, v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v9);
  if (!v13)
    BCReportAssertionFailureWithMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookCore/BookCore/AssetsEngine/AECore/Annotations/AEHighlightRenderingController.m", 432, (uint64_t)"-[AEHighlightRenderingController layer:containsHighlightAtPoint:]", (uint64_t)"shapeLayer", 0, v10, v11, v12, v38);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[AEHighlightRenderingController p_highlightForContainerLayer:](self, "p_highlightForContainerLayer:", v7));
  if (!v17)
  {
    BCReportAssertionFailureWithMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookCore/BookCore/AssetsEngine/AECore/Annotations/AEHighlightRenderingController.m", 434, (uint64_t)"-[AEHighlightRenderingController layer:containsHighlightAtPoint:]", (uint64_t)"highlight", 0, v14, v15, v16, v38);
    v36 = objc_msgSend(v7, "containsPoint:", x, y);
    goto LABEL_17;
  }
  if (!objc_msgSend(v7, "containsPoint:", x, y))
  {
    LOBYTE(v26) = 0;
    goto LABEL_20;
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "annotation"));
  v19 = objc_msgSend(v18, "annotationIsUnderline");

  if (!v19)
  {
    v35 = (const CGPath *)objc_msgSend(v13, "path");
    v43.x = x;
    v43.y = y;
    v36 = CGPathContainsPoint(v35, 0, v43, 0);
LABEL_17:
    LOBYTE(v26) = v36;
    goto LABEL_20;
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[AEHighlightRenderingController p_lineRectsForHighlight:](self, "p_lineRectsForHighlight:", v17));
  objc_msgSend(v13, "frame");
  v22 = v21;
  v24 = v23;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v25 = v20;
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
  if (v26)
  {
    v27 = *(_QWORD *)v39;
    while (2)
    {
      for (i = 0; i != v26; i = (char *)i + 1)
      {
        if (*(_QWORD *)v39 != v27)
          objc_enumerationMutation(v25);
        objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)i), "CGRectValue", (_QWORD)v38);
        v30 = v29;
        v32 = v31;
        v45.origin.x = CGPointSubtract(v33, v34, v22, v24);
        v45.size.width = v30;
        v45.size.height = v32;
        v44.x = x;
        v44.y = y;
        if (CGRectContainsPoint(v45, v44))
        {
          LOBYTE(v26) = 1;
          goto LABEL_19;
        }
      }
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
      if (v26)
        continue;
      break;
    }
  }
LABEL_19:

LABEL_20:
  return (char)v26;
}

- (BOOL)canUseFilters
{
  return self->_canUseFilters;
}

- (void)setCanUseFilters:(BOOL)a3
{
  self->_canUseFilters = a3;
}

- (int)annotationBlendMode
{
  return self->_annotationBlendMode;
}

- (void)setAnnotationBlendMode:(int)a3
{
  self->_annotationBlendMode = a3;
}

- (int64_t)pageTheme
{
  return self->_pageTheme;
}

- (void)setPageTheme:(int64_t)a3
{
  self->_pageTheme = a3;
}

- (BOOL)drawSpecialGrayHighlights
{
  return self->_drawSpecialGrayHighlights;
}

- (void)setDrawSpecialGrayHighlights:(BOOL)a3
{
  self->_drawSpecialGrayHighlights = a3;
}

- (BOOL)isAddingHighlights
{
  return self->_addingHighlights;
}

- (void)setAddingHighlights:(BOOL)a3
{
  self->_addingHighlights = a3;
}

- (NSMapTable)dataHighlights
{
  return self->_dataHighlights;
}

- (void)setDataHighlights:(id)a3
{
  objc_storeStrong((id *)&self->_dataHighlights, a3);
}

- (NSMapTable)containerLayers
{
  return self->_containerLayers;
}

- (void)setContainerLayers:(id)a3
{
  objc_storeStrong((id *)&self->_containerLayers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerLayers, 0);
  objc_storeStrong((id *)&self->_dataHighlights, 0);
}

@end
