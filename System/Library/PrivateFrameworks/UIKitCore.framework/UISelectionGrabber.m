@implementation UISelectionGrabber

- (UISelectionGrabber)initWithFrame:(CGRect)a3
{
  UISelectionGrabber *v3;
  UISelectionGrabber *v4;
  UISelectionGrabber *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UISelectionGrabber;
  v3 = -[UIView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->m_screenScale = 1.0;
    -[UISelectionGrabber setIsDotted:](v3, "setIsDotted:", 1);
    -[UIView setOpaque:](v4, "setOpaque:", 0);
    -[UIView setUserInteractionEnabled:](v4, "setUserInteractionEnabled:", 1);
    v5 = v4;
  }

  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[UIView removeFromSuperview](self->m_dotView, "removeFromSuperview");
  v3.receiver = self;
  v3.super_class = (Class)UISelectionGrabber;
  -[UIView dealloc](&v3, sel_dealloc);
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isScrolling
{
  void *v2;
  char v3;

  -[UISelectionGrabber hostView](self, "hostView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isScrolling");

  return v3;
}

- (BOOL)isScaling
{
  void *v2;
  char v3;

  -[UISelectionGrabber hostView](self, "hostView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "scaling");

  return v3;
}

- (BOOL)isRotating
{
  void *v2;
  char v3;

  -[UISelectionGrabber hostView](self, "hostView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "rotating");

  return v3;
}

- (BOOL)inputViewIsChanging
{
  void *v2;
  char v3;

  -[UISelectionGrabber hostView](self, "hostView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "inputViewIsChanging");

  return v3;
}

- (BOOL)autoscrolled
{
  void *v2;
  char v3;

  -[UISelectionGrabber hostView](self, "hostView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "autoscrolled");

  return v3;
}

- (void)setHidden:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[UIImageView setHidden:](self->m_dotView, "setHidden:");
  v5.receiver = self;
  v5.super_class = (Class)UISelectionGrabber;
  -[UIView setHidden:](&v5, sel_setHidden_, v3);
}

- (void)setCustomPath:(id)a3
{
  UISelectionGrabberCustomPath **p_customPath;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  p_customPath = &self->_customPath;
  v10 = a3;
  if ((-[UISelectionGrabberCustomPath isEqual:](*p_customPath, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_customPath, a3);
    -[UISelectionGrabber shapeLayer](self, "shapeLayer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (*p_customPath)
    {
      -[UISelectionGrabber bezierPathFromCustomPath:](self, "bezierPathFromCustomPath:");
      v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v7, "setPath:", objc_msgSend(v8, "CGPath"));

      -[UISelectionGrabberCustomPath lineWidth](*p_customPath, "lineWidth");
      objc_msgSend(v7, "setLineWidth:");
      -[UISelectionGrabber fillColor](self, "fillColor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setStrokeColor:", objc_msgSend(v9, "cgColor"));

    }
    else
    {
      objc_msgSend(v6, "setPath:");
    }
    -[UIView setNeedsDisplay](self, "setNeedsDisplay");

  }
}

- (id)bezierPathFromCustomPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[UISelectionGrabber hostView](self, "hostView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bezierPathForHostView:targetView:", v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)removeFromSuperview
{
  objc_super v3;

  -[UIView removeFromSuperview](self->m_dotView, "removeFromSuperview");
  v3.receiver = self;
  v3.super_class = (Class)UISelectionGrabber;
  -[UIView removeFromSuperview](&v3, sel_removeFromSuperview);
}

- (BOOL)clipDot:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  void *v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  BOOL v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  void *v39;
  double v40;
  CGFloat v41;
  double v42;
  CGFloat v43;
  double v44;
  CGFloat v45;
  double v46;
  CGFloat v47;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UISelectionGrabber hostView](self, "hostView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "selectionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "selection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "document");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v11, "_usesAsynchronousProtocol") && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v49.origin.x = x;
    v49.origin.y = y;
    v49.size.width = width;
    v49.size.height = height;
    v12 = v11;
    objc_msgSend(v12, "unobscuredContentRect");
    -[UIView convertRect:fromView:](self, "convertRect:fromView:", v12);
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;
    -[UIView superview](self, "superview");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView frame](self, "frame");
    objc_msgSend(v21, "convertRect:toView:", 0);
    v23 = v22;
    v25 = v24;
    v27 = v26;
    v29 = v28;

    v51.origin.x = v14;
    v51.origin.y = v16;
    v51.size.width = v18;
    v51.size.height = v20;
    v55.origin.x = v23;
    v55.origin.y = v25;
    v55.size.width = v27;
    v55.size.height = v29;
    if (CGRectIntersectsRect(v51, v55))
    {
      v52.origin.x = v14;
      v52.origin.y = v16;
      v52.size.width = v18;
      v52.size.height = v20;
      v30 = CGRectContainsRect(v52, v49);
    }
    else
    {
      v30 = 1;
    }

  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
      goto LABEL_8;
    v50.origin.x = x;
    v50.origin.y = y;
    v50.size.width = width;
    v50.size.height = height;
    objc_msgSend(v11, "visibleRect");
    objc_msgSend(v11, "convertRect:toView:", 0);
    v32 = v31;
    v34 = v33;
    v36 = v35;
    v38 = v37;
    -[UIView superview](self, "superview");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView frame](self, "frame");
    objc_msgSend(v39, "convertRect:toView:", 0);
    v41 = v40;
    v43 = v42;
    v45 = v44;
    v47 = v46;

    v53.origin.x = v32;
    v53.origin.y = v34;
    v53.size.width = v36;
    v53.size.height = v38;
    v56.origin.x = v41;
    v56.origin.y = v43;
    v56.size.width = v45;
    v56.size.height = v47;
    if (CGRectIntersectsRect(v53, v56))
    {
      v54.origin.x = v32;
      v54.origin.y = v34;
      v54.size.width = v36;
      v54.size.height = v38;
      v30 = CGRectContainsRect(v54, v50);
    }
    else
    {
LABEL_8:
      v30 = 1;
    }
  }

  return v30;
}

- (BOOL)dotIsVisibleInDocument:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  double v21;
  double v22;
  double v23;
  BOOL v24;
  CGRect v26;
  CGRect v27;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UISelectionGrabber hostView](self, "hostView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "selectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "selection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "document");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "_usesAsynchronousProtocol") && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v11 = v10;
    objc_msgSend(v11, "unobscuredContentRect");
    objc_msgSend(v11, "convertRect:toView:", 0);
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;

  }
  else
  {
    if (!objc_msgSend(v10, "conformsToProtocol:", &unk_1EDE24D00)
      || (objc_opt_respondsToSelector() & 1) == 0)
    {
      v24 = 0;
      goto LABEL_9;
    }
    objc_msgSend(v10, "visibleRect");
    objc_msgSend(v10, "convertRect:toView:", 0);
    v13 = v20;
    v15 = v21;
    v17 = v22;
    v19 = v23;
  }
  v26.origin.x = v13;
  v26.origin.y = v15;
  v26.size.width = v17;
  v26.size.height = v19;
  v27.origin.x = x;
  v27.origin.y = y;
  v27.size.width = width;
  v27.size.height = height;
  v24 = CGRectContainsRect(v26, v27);
LABEL_9:

  return v24;
}

- (BOOL)scroller:(id)a3 fullyContainSelectionRect:(CGRect)a4
{
  double height;
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
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
  CGFloat rect2;
  CGFloat v28;
  CGFloat x;
  CGFloat width;
  CGRect v31;
  CGRect v32;

  height = a4.size.height;
  x = a4.origin.x;
  width = a4.size.width;
  v28 = a4.origin.y + 1.0;
  v6 = a3;
  -[UISelectionGrabber hostView](self, "hostView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "selectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  UIRoundToViewScale(v8);
  rect2 = height - (v9 + 1.0);

  objc_msgSend(v6, "bounds");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  objc_msgSend(v6, "contentInset");
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;

  v31.origin.x = v11 + v21;
  v31.origin.y = v13 + v19;
  v31.size.width = v15 - (v21 + v25);
  v31.size.height = v17 - (v19 + v23);
  v32.origin.y = v28;
  v32.origin.x = x;
  v32.size.width = width;
  v32.size.height = rect2;
  return CGRectContainsRect(v31, v32);
}

- (double)_defaultDotWidth
{
  double result;

  result = 11.0;
  if (self->m_screenScale == 1.0)
    return 13.0;
  return result;
}

- (void)updateDot
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  UISelectionGrabberDot *v14;
  void *v15;
  void *v16;
  UISelectionGrabberDot *v17;
  UISelectionGrabberDot *m_dotView;
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
  UISelectionGrabber *v34;
  UISelectionGrabber *v35;
  UISelectionGrabber *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  UISelectionGrabber *v55;
  void *v56;
  void *v57;
  double v58;
  CGFloat v59;
  double v60;
  CGFloat v61;
  double v62;
  double v63;
  CGFloat v64;
  double v65;
  CGFloat v66;
  CGFloat v67;
  CGFloat v68;
  CGFloat v69;
  CGFloat v70;
  void *v71;
  UISelectionGrabber *v72;
  double v73;
  CGFloat v74;
  double v75;
  double v76;
  CGFloat v77;
  double v78;
  CGFloat v79;
  double v80;
  CGFloat v81;
  CGFloat v82;
  CGFloat v83;
  CGFloat v84;
  CGFloat v85;
  BOOL v86;
  UISelectionGrabber *v87;
  UISelectionGrabber *v88;
  char v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  double v105;
  double v106;
  double v107;
  double v108;
  double v109;
  double v110;
  double v111;
  double v112;
  double v113;
  double v114;
  double v115;
  double v116;
  double v117;
  double v118;
  double v119;
  double v120;
  double v121;
  UISelectionGrabber *v122;
  uint64_t v123;
  UISelectionGrabber *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  double v130;
  double v131;
  double v132;
  double v133;
  double v134;
  double v135;
  double v136;
  double v137;
  UISelectionGrabber *v138;
  double v139;
  double v140;
  double v141;
  double v142;
  UISelectionGrabber *v143;
  double v144;
  double v145;
  double v146;
  double v147;
  void *v148;
  void *v149;
  void *v150;
  int v151;
  double v152;
  UISelectionGrabber *v153;
  void *v154;
  void *v155;
  UISelectionGrabberDot *v156;
  uint64_t v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  char v165;
  void *v166;
  int v167;
  BOOL v168;
  void *v169;
  void *v170;
  double v171;
  double v172;
  void *v173;
  double v174;
  double v175;
  void *v176;
  double v177;
  double v178;
  void *v179;
  double v180;
  double v181;
  double v182;
  double v183;
  double v184;
  UISelectionGrabber *v185;
  id v186;
  UISelectionGrabber *v187;
  UISelectionGrabber *v188;
  UISelectionGrabber *v189;
  UISelectionGrabber *v190;
  UISelectionGrabber *v191;
  UISelectionGrabber *v192;
  UISelectionGrabber *v193;
  _QWORD v194[10];
  CGRect v195;
  CGRect v196;
  CGRect v197;
  CGRect v198;

  if (!-[UISelectionGrabber isDotted](self, "isDotted")
    || (-[UISelectionGrabber hostView](self, "hostView"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v3, "superview"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        v3,
        !v4))
  {
    -[UIView removeFromSuperview](self->m_dotView, "removeFromSuperview");
    return;
  }
  -[UIView window](self, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[UIView window](self, "window");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "convertRect:toView:", self, 0.0, 0.0, 1.0, 1.0);
    v8 = v7;
    v10 = v9;

  }
  else
  {
    v8 = 1.0;
    v10 = 1.0;
  }
  -[UISelectionGrabber _defaultDotWidth](self, "_defaultDotWidth");
  v12 = v11 * v8;
  v183 = v10;
  v13 = v11 * v10;
  if (!self->m_dotView)
  {
    v14 = [UISelectionGrabberDot alloc];
    -[UISelectionGrabber hostView](self, "hostView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "container");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[UISelectionGrabberDot initWithFrame:container:](v14, "initWithFrame:container:", v16, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    m_dotView = self->m_dotView;
    self->m_dotView = v17;

    -[UISelectionGrabberDot setGrabber:](self->m_dotView, "setGrabber:", self);
    -[UIView setOpaque:](self->m_dotView, "setOpaque:", 0);
    -[UIView setUserInteractionEnabled:](self->m_dotView, "setUserInteractionEnabled:", 1);
  }
  v19 = v12 - v8;
  -[UIView bounds](self, "bounds");
  v22 = v21 + (v20 - v12) * 0.5;
  v25 = v24 + (v23 - v13) * 0.5;
  v26 = round(v22);
  v27 = round(v25);
  if (v8 == 1.0)
    v28 = v26;
  else
    v28 = v22;
  if (v8 == 1.0)
    v29 = v27;
  else
    v29 = v25;
  if (-[UISelectionGrabber isVertical](self, "isVertical"))
  {
    if (-[UISelectionGrabber isPointedDown](self, "isPointedDown"))
    {
      v29 = -v19;
LABEL_20:
      -[UIView bounds](self, "bounds");
      goto LABEL_23;
    }
    -[UIView bounds](self, "bounds");
    v29 = v30 + v31 - v8;
  }
  else
  {
    if (-[UISelectionGrabber isPointedRight](self, "isPointedRight"))
    {
      v28 = -v19;
      goto LABEL_20;
    }
    -[UIView bounds](self, "bounds");
    v28 = v32 + v33 - v8;
  }
LABEL_23:
  -[UIView _enclosingScrollableScrollerIncludingSelf](self, "_enclosingScrollableScrollerIncludingSelf");
  v34 = (UISelectionGrabber *)objc_claimAutoreleasedReturnValue();
  if (v34)
  {
    -[UIView _enclosingScrollerIncludingSelf](self, "_enclosingScrollerIncludingSelf");
    v35 = (UISelectionGrabber *)(id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v35 = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v36 = v34;
  else
    v36 = v35;
  v185 = v36;
  -[UIView convertRect:toView:](self, "convertRect:toView:", 0, v28, v29, v12, v13);
  v38 = v37;
  v40 = v39;
  v42 = v41;
  v184 = v43;
  if (-[UISelectionGrabber animating](self, "animating"))
    goto LABEL_41;
  -[UISelectionGrabber hostView](self, "hostView");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "selectionView");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v45, "alertFlattened") & 1) != 0)
    goto LABEL_40;
  -[UISelectionGrabber hostView](self, "hostView");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "selectionView");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v47, "activeFlattened") & 1) != 0)
  {
LABEL_39:

LABEL_40:
LABEL_41:
    v187 = self;
    goto LABEL_42;
  }
  -[UISelectionGrabber hostView](self, "hostView");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "selectionView");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v49, "sheetFlattened") & 1) != 0)
  {
LABEL_38:

    goto LABEL_39;
  }
  v179 = v49;
  v186 = v48;
  -[UISelectionGrabber hostView](self, "hostView");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "selectionView");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v51, "popoverFlattened") & 1) != 0)
  {
LABEL_37:

    v48 = v186;
    v49 = v179;
    goto LABEL_38;
  }
  v173 = v51;
  v176 = v50;
  -[UISelectionGrabber hostView](self, "hostView");
  v170 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v170, "selectionView");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v52, "navigationTransitionFlattened") & 1) != 0
    || -[UISelectionGrabber dotIsVisibleInDocument:](self, "dotIsVisibleInDocument:", v38, v40, v42, v184))
  {

    v50 = v176;
    goto LABEL_37;
  }
  -[UIView window](self, "window");
  v169 = (void *)objc_claimAutoreleasedReturnValue();
  v167 = objc_msgSend(v169, "_isTextEffectsWindow");
  if (v167)
  {
    -[UIView window](self, "window");
    v157 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v162 = (void *)v157;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v168 = 1;
LABEL_132:

      goto LABEL_133;
    }
  }
  -[UISelectionGrabber hostView](self, "hostView");
  v166 = (void *)objc_claimAutoreleasedReturnValue();
  v165 = objc_msgSend(v166, "inGesture");
  if ((v165 & 1) == 0)
  {
    -[UISelectionGrabber hostView](self, "hostView");
    v161 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v161, "selectionView");
    v160 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v160, "interactionAssistant");
    v159 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v159, "inGesture"))
    {
      v168 = 0;
      goto LABEL_131;
    }
  }
  -[UISelectionGrabber hostView](self, "hostView");
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v164, "selectionView");
  v163 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v163, "interactionAssistant");
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v158, "containerIsTextField") & 1) != 0)
  {

    v168 = 0;
  }
  else
  {
    v168 = -[UISelectionGrabber clipDot:](self, "clipDot:", v38, v40, v42, v184);

  }
  if ((v165 & 1) == 0)
  {
LABEL_131:

    if ((v167 & 1) == 0)
      goto LABEL_133;
    goto LABEL_132;
  }

  if (v167)
    goto LABEL_132;
LABEL_133:

  if (v168)
    goto LABEL_41;
  v187 = 0;
LABEL_42:
  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = objc_msgSend(v53, "currentState");
  v55 = v187;
  if (v187)
    goto LABEL_43;
  if ((v54 & 0xFFFFFFFFFFFFFFFDLL) == 0)
  {
    objc_msgSend(v53, "inputViews");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "inputAccessoryView");
    v57 = (void *)objc_claimAutoreleasedReturnValue();

    if (!-[UIView isDescendantOfView:](self, "isDescendantOfView:", v57))
      goto LABEL_50;
    objc_msgSend(v57, "bounds");
    v174 = v40;
    v177 = v38;
    v59 = v58;
    v171 = v42;
    v61 = v60;
    v62 = v13;
    v64 = v63;
    v180 = v8;
    v66 = v65;
    -[UIView convertRect:toView:](self, "convertRect:toView:", v57, v28, v29, v12, v62);
    v197.origin.x = v67;
    v197.origin.y = v68;
    v197.size.width = v69;
    v197.size.height = v70;
    v195.origin.x = v59;
    v195.origin.y = v61;
    v42 = v171;
    v195.size.width = v64;
    v13 = v62;
    v40 = v174;
    v38 = v177;
    v195.size.height = v66;
    v8 = v180;
    if (CGRectIntersectsRect(v195, v197))
    {
      v188 = v57;

      v55 = v188;
      if (v188)
        goto LABEL_43;
    }
    else
    {
LABEL_50:

    }
  }
  if (-[UISelectionGrabber isRotating](self, "isRotating")
    || -[UISelectionGrabber inputViewIsChanging](self, "inputViewIsChanging"))
  {
    objc_msgSend(v53, "inputViews");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "inputAccessoryView");
    v72 = (UISelectionGrabber *)objc_claimAutoreleasedReturnValue();

    if (!-[UIView isDescendantOfView:](self, "isDescendantOfView:", v72))
      goto LABEL_55;
    -[UIView bounds](v72, "bounds");
    v175 = v40;
    v178 = v38;
    v74 = v73;
    v75 = v13;
    v77 = v76;
    v181 = v8;
    v79 = v78;
    v172 = v42;
    v81 = v80;
    -[UIView convertRect:toView:](self, "convertRect:toView:", v72, v28, v29, v12, v75);
    v198.origin.x = v82;
    v198.origin.y = v83;
    v198.size.width = v84;
    v198.size.height = v85;
    v196.origin.x = v74;
    v196.origin.y = v77;
    v13 = v75;
    v40 = v175;
    v38 = v178;
    v196.size.width = v79;
    v8 = v181;
    v196.size.height = v81;
    v42 = v172;
    v86 = CGRectIntersectsRect(v196, v198);
    v87 = v72;
    if (!v86)
    {
LABEL_55:
      if (v35)
        v87 = v35;
      else
        v87 = self;
    }
    v189 = v87;

    v55 = v189;
    if (v189)
      goto LABEL_76;
  }
  else
  {
    v55 = 0;
  }
  if (!v35)
    goto LABEL_76;
  if (!-[UISelectionGrabber isScrolling](self, "isScrolling") && !-[UISelectionGrabber isScaling](self, "isScaling"))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_77;
    -[UIView convertRect:fromView:](v185, "convertRect:fromView:", 0, v38, v40, v42, v184);
    if (!-[UISelectionGrabber scroller:fullyContainSelectionRect:](self, "scroller:fullyContainSelectionRect:", v185))
    {
      -[UIView bounds](self, "bounds");
      -[UIView convertRect:fromView:](v185, "convertRect:fromView:", self);
      if (-[UISelectionGrabber scroller:fullyContainSelectionRect:](self, "scroller:fullyContainSelectionRect:", v185))
        goto LABEL_77;
    }
    v55 = v185;
LABEL_76:
    if (!v55)
      goto LABEL_77;
LABEL_43:
    if (v55 != v35)
      goto LABEL_80;
    goto LABEL_65;
  }
  v88 = v35;
LABEL_65:
  v89 = objc_opt_respondsToSelector();
  v55 = v35;
  if ((v89 & 1) != 0)
  {
    -[UISelectionGrabber _getDelegateZoomView](v35, "_getDelegateZoomView");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v90, "_usesAsynchronousProtocol") & 1) != 0
      || -[UIView isDescendantOfView:](self, "isDescendantOfView:", v90)
      && (objc_msgSend(v90, "isDescendantOfView:", v35) & 1) != 0)
    {
      v190 = v90;

      v55 = v190;
      if (!v190)
      {
LABEL_77:
        -[UISelectionGrabber hostView](self, "hostView");
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v91, "selectionView");
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v92, "interactionAssistant");
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v93, "externalInteractions");
        v94 = (void *)objc_claimAutoreleasedReturnValue();

        if (v94)
        {
          -[UIView _enclosingScrollerIncludingSelf](self, "_enclosingScrollerIncludingSelf");
          v55 = (UISelectionGrabber *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v55 = 0;
        }
      }
    }
    else
    {

      v55 = v35;
    }
  }
LABEL_80:
  v191 = v55;
  -[UISelectionGrabber customPath](self, "customPath");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  if (v95)
  {
    v182 = v12;
    v96 = v8;
    -[UIView frame](self, "frame");
    v98 = v97;
    v100 = v99;
    if (-[UISelectionGrabber isPointedDown](self, "isPointedDown"))
      objc_msgSend(v95, "topPoint");
    else
      objc_msgSend(v95, "bottomPoint");
    v103 = v101;
    v104 = v102;
    if (-[UISelectionGrabber isPointedDown](self, "isPointedDown"))
      objc_msgSend(v95, "bottomPoint");
    else
      objc_msgSend(v95, "topPoint");
    v107 = v105;
    v108 = v106;
    objc_msgSend(v95, "lineWidth");
    v110 = v103 - v107;
    v111 = v104 - v108;
    v112 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    if (v103 - v107 != *MEMORY[0x1E0C9D538]
      || (v113 = *MEMORY[0x1E0C9D538], v114 = *(double *)(MEMORY[0x1E0C9D538] + 8), v111 != v112))
    {
      v115 = 1.0 / sqrt(v110 * v110 + v111 * v111);
      v113 = v110 * v115;
      v114 = v111 * v115;
    }
    if (v113 != *MEMORY[0x1E0C9D538] || v114 != v112)
    {
      v116 = v13 * 0.5 + sqrt((v107 - v103) * (v107 - v103) + (v108 - v104) * (v108 - v104)) - v109;
      v107 = v107 + v116 * v113;
      v108 = v108 + v116 * v114;
    }
    v8 = v96;
    v117 = v108 - v100;
    v12 = v182;
    v28 = v107 - v98 - v182 * 0.5;
    v29 = v117 - v182 * 0.5;
    -[UIView convertRect:toView:](self, "convertRect:toView:", 0, v28, v29, v182, v13);
    v38 = v118;
    v40 = v119;
    v42 = v120;
    v184 = v121;
  }
  v122 = v191;
  if (!v191)
  {
    objc_msgSend(v53, "containerView");
    v122 = (UISelectionGrabber *)objc_claimAutoreleasedReturnValue();
  }
  v192 = v122;
  if (-[UIResponder _usesAsynchronousProtocol](v122, "_usesAsynchronousProtocol")
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    -[UISelectionGrabber unscaledView](v192, "unscaledView");
    v123 = objc_claimAutoreleasedReturnValue();

    v124 = (UISelectionGrabber *)v123;
  }
  else
  {
    v124 = v192;
  }
  v193 = v124;
  if (v124 != self)
  {
    -[UIView window](self, "window");
    v125 = (void *)objc_claimAutoreleasedReturnValue();

    if (v125)
    {
      -[UIView window](v193, "window");
      v126 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView window](self, "window");
      v127 = (void *)objc_claimAutoreleasedReturnValue();

      if (v126 == v127)
      {
        v138 = v193;
        v139 = v28;
        v140 = v29;
        v141 = v12;
        v142 = v13;
        v143 = self;
      }
      else
      {
        -[UIView window](v193, "window");
        v128 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView window](self, "window");
        v129 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v128, "convertRect:fromWindow:", v129, v38, v40, v42, v184);
        v131 = v130;
        v133 = v132;
        v135 = v134;
        v137 = v136;

        v138 = v193;
        v139 = v131;
        v140 = v133;
        v141 = v135;
        v142 = v137;
        v143 = 0;
      }
      -[UIView convertRect:fromView:](v138, "convertRect:fromView:", v143, v139, v140, v141, v142);
      v28 = v144;
      v29 = v145;
      v12 = v146;
      v13 = v147;
    }
  }
  -[UISelectionGrabber hostView](self, "hostView");
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v148, "selectionView");
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v149, "interactionAssistant");
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  v151 = objc_msgSend(v150, "cursorVisible");

  if (v151)
    v152 = 1.0;
  else
    v152 = 0.0;
  -[UIView setAlpha:](self->m_dotView, "setAlpha:", v152);
  -[UIView setAlpha:](self, "setAlpha:", v152);
  if (!v95)
  {
    if (-[UISelectionGrabber isVertical](self, "isVertical"))
      v28 = v8 * 0.5 + v28;
    else
      v29 = v183 * 0.5 + v29;
  }
  -[UIView superview](self->m_dotView, "superview");
  v153 = (UISelectionGrabber *)objc_claimAutoreleasedReturnValue();

  if (v153 == v193)
  {
    -[UISelectionGrabberDot setFrame:](self->m_dotView, "setFrame:", v28, v29, v12, v13);
  }
  else
  {
    -[UIView addSubview:](v193, "addSubview:", self->m_dotView);
    v194[0] = MEMORY[0x1E0C809B0];
    v194[1] = 3221225472;
    v194[2] = __31__UISelectionGrabber_updateDot__block_invoke;
    v194[3] = &unk_1E16B20D8;
    v194[4] = self;
    *(double *)&v194[5] = v28;
    *(double *)&v194[6] = v29;
    *(double *)&v194[7] = v12;
    *(double *)&v194[8] = v13;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v194);
  }
  -[UIView layer](self, "layer");
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v154, "contents");
  v155 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v155)
    -[UIView setNeedsDisplay](self, "setNeedsDisplay");
  v156 = self->m_dotView;
  -[UIView _convertVisualAltitude:toView:](self, "_convertVisualAltitude:toView:", v156, 0.0);
  -[UIView _setVisualAltitude:](v156, "_setVisualAltitude:");

}

uint64_t __31__UISelectionGrabber_updateDot__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (void)redrawDotForScale:(double)a3
{
  UISelectionGrabberDot *m_dotView;
  double v5;

  m_dotView = self->m_dotView;
  -[UIView _currentScreenScale](self, "_currentScreenScale");
  -[UISelectionGrabberDot redrawRasterizedImageForScale:](m_dotView, "redrawRasterizedImageForScale:", v5 * a3);
}

- (void)animateGrabberInWithCompletion:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  _QWORD v45[4];
  id v46;

  v4 = a3;
  LODWORD(v5) = 1053609165;
  LODWORD(v6) = 1058642330;
  LODWORD(v7) = 1.0;
  LODWORD(v8) = 1.0;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v5, v7, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView layer](self, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bounds");
  v43 = v12;
  v44 = v11;
  v14 = v13;
  v16 = v15;

  v41 = v14 * 0.8;
  v42 = v14;
  v40 = (v14 - v14 * 0.8) * 0.5;
  -[UIView layer](self->m_dotView, "layer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "bounds");
  v19 = v18;
  v39 = v20;
  v22 = v21;
  v24 = v23;

  v25 = (v24 - v24 * 0.8) * 0.5;
  if (-[UISelectionGrabber isPointedUp](self, "isPointedUp"))
  {
    v25 = v25 + (v16 - v24) * -0.2;
  }
  else if (-[UISelectionGrabber isPointedDown](self, "isPointedDown"))
  {
    v25 = (v16 - v24) * 0.2 + v25;
  }
  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("bounds"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", (v22 - v22 * 0.8) * 0.5, v25, v22 * 0.8, v24 * 0.8);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setFromValue:", v27);

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", v19, v39, v22, v24);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setToValue:", v28);

  objc_msgSend(v26, "setFrameInterval:", 0.0166666667);
  objc_msgSend(v26, "setDuration:", 0.25);
  objc_msgSend(v26, "setTimingFunction:", v9);
  -[UIView layer](self->m_dotView, "layer");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "addAnimation:forKey:", v26, CFSTR("dotView transition in"));

  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("opacity"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setFromValue:", &unk_1E1A9A710);
  objc_msgSend(v30, "setToValue:", &unk_1E1A96140);
  objc_msgSend(v30, "setFrameInterval:", 0.0166666667);
  objc_msgSend(v30, "setDuration:", 0.25);
  objc_msgSend(v30, "setTimingFunction:", v9);
  -[UIView layer](self->m_dotView, "layer");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "addAnimation:forKey:", v30, CFSTR("dotView opacity transition in"));

  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("bounds"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", v40, (v16 - v16 * 0.8) * 0.5, v41, v16 * 0.8);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setFromValue:", v33);

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", v44, v43, v42, v16);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setToValue:", v34);

  objc_msgSend(v32, "setFrameInterval:", 0.0166666667);
  objc_msgSend(v32, "setDuration:", 0.25);
  objc_msgSend(v32, "setTimingFunction:", v9);
  if (v4)
  {
    v45[0] = MEMORY[0x1E0C809B0];
    v45[1] = 3221225472;
    v45[2] = __53__UISelectionGrabber_animateGrabberInWithCompletion___block_invoke;
    v45[3] = &unk_1E16B1BA0;
    v46 = v4;
    +[_UISelectionGrabberAnimationDelegate delegateWithCompletionBlock:](_UISelectionGrabberAnimationDelegate, "delegateWithCompletionBlock:", v45);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setDelegate:", v35);

  }
  -[UIView layer](self, "layer");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "addAnimation:forKey:", v32, CFSTR("stemView transition in"));

  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("opacity"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setFromValue:", &unk_1E1A9A710);
  objc_msgSend(v37, "setToValue:", &unk_1E1A96140);
  objc_msgSend(v37, "setFrameInterval:", 0.0166666667);
  objc_msgSend(v37, "setDuration:", 0.25);
  objc_msgSend(v37, "setTimingFunction:", v9);
  -[UIView layer](self, "layer");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "addAnimation:forKey:", v37, CFSTR("stemView opacity transition in"));

}

uint64_t __53__UISelectionGrabber_animateGrabberInWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)animateGrabberOutWithCompletion:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  id v51;
  _QWORD v52[5];
  _QWORD v53[5];
  id v54;
  double v55;
  double v56;
  double v57;
  double v58;
  _QWORD v59[5];
  _QWORD v60[10];

  v51 = a3;
  LODWORD(v4) = 1053609165;
  LODWORD(v5) = 1058642330;
  LODWORD(v6) = 1.0;
  LODWORD(v7) = 1.0;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v4, v6, v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView layer](self, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bounds");
  v49 = v11;
  v50 = v10;
  v13 = v12;
  v15 = v14;

  -[UIView layer](self->m_dotView, "layer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "bounds");
  v48 = v17;
  v47 = v18;
  v20 = v19;
  v22 = v21;

  v23 = (v22 - v22 * 0.8) * 0.5;
  if (-[UISelectionGrabber isPointedUp](self, "isPointedUp"))
  {
    v23 = v23 + (v15 - v22) * -0.2;
  }
  else if (-[UISelectionGrabber isPointedDown](self, "isPointedDown"))
  {
    v23 = (v15 - v22) * 0.2 + v23;
  }
  v46 = (v15 - v15 * 0.8) * 0.5;
  -[UIView layer](self->m_dotView, "layer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setBounds:", (v20 - v20 * 0.8) * 0.5, v23, v20 * 0.8, v22 * 0.8);

  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("bounds"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", v48, v47, v20, v22);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setFromValue:", v26);

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", (v20 - v20 * 0.8) * 0.5, v23, v20 * 0.8, v22 * 0.8);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setToValue:", v27);

  objc_msgSend(v25, "setFrameInterval:", 0.0166666667);
  objc_msgSend(v25, "setDuration:", 0.2);
  objc_msgSend(v25, "setTimingFunction:", v8);
  v28 = *MEMORY[0x1E0CD2B58];
  objc_msgSend(v25, "setFillMode:", *MEMORY[0x1E0CD2B58]);
  objc_msgSend(v25, "setRemovedOnCompletion:", 0);
  v29 = MEMORY[0x1E0C809B0];
  v60[0] = MEMORY[0x1E0C809B0];
  v60[1] = 3221225472;
  v60[2] = __54__UISelectionGrabber_animateGrabberOutWithCompletion___block_invoke;
  v60[3] = &unk_1E16E5BB0;
  v60[4] = self;
  *(double *)&v60[5] = v48;
  *(double *)&v60[6] = v47;
  *(double *)&v60[7] = v20;
  *(double *)&v60[8] = v22;
  +[_UISelectionGrabberAnimationDelegate delegateWithCompletionBlock:](_UISelectionGrabberAnimationDelegate, "delegateWithCompletionBlock:", v60);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setDelegate:", v30);

  -[UIView layer](self->m_dotView, "layer");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "addAnimation:forKey:", v25, CFSTR("dotView transition out"));

  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("opacity"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setFromValue:", &unk_1E1A96140);
  objc_msgSend(v32, "setToValue:", &unk_1E1A9A710);
  objc_msgSend(v32, "setFrameInterval:", 0.0166666667);
  objc_msgSend(v32, "setDuration:", 0.2);
  objc_msgSend(v32, "setTimingFunction:", v8);
  objc_msgSend(v32, "setFillMode:", v28);
  objc_msgSend(v32, "setRemovedOnCompletion:", 0);
  v59[0] = v29;
  v59[1] = 3221225472;
  v59[2] = __54__UISelectionGrabber_animateGrabberOutWithCompletion___block_invoke_2;
  v59[3] = &unk_1E16B3FD8;
  v59[4] = self;
  +[_UISelectionGrabberAnimationDelegate delegateWithCompletionBlock:](_UISelectionGrabberAnimationDelegate, "delegateWithCompletionBlock:", v59);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setDelegate:", v33);

  -[UIView layer](self->m_dotView, "layer");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "addAnimation:forKey:", v32, CFSTR("dotView opacity transition out"));

  -[UIView layer](self, "layer");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (v13 - v13 * 0.8) * 0.5;
  objc_msgSend(v35, "setBounds:", v36, v46, v13 * 0.8, v15 * 0.8);

  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("bounds"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", v50, v49, v13, v15);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setFromValue:", v38);

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", v36, v46, v13 * 0.8, v15 * 0.8);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setToValue:", v39);

  objc_msgSend(v37, "setFrameInterval:", 0.0166666667);
  objc_msgSend(v37, "setDuration:", 0.2);
  objc_msgSend(v37, "setTimingFunction:", v8);
  objc_msgSend(v37, "setFillMode:", v28);
  objc_msgSend(v37, "setRemovedOnCompletion:", 0);
  v53[0] = v29;
  v53[1] = 3221225472;
  v53[2] = __54__UISelectionGrabber_animateGrabberOutWithCompletion___block_invoke_3;
  v53[3] = &unk_1E16E5BD8;
  v55 = v50;
  v56 = v49;
  v57 = v13;
  v58 = v15;
  v53[4] = self;
  v54 = v51;
  v40 = v51;
  +[_UISelectionGrabberAnimationDelegate delegateWithCompletionBlock:](_UISelectionGrabberAnimationDelegate, "delegateWithCompletionBlock:", v53);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setDelegate:", v41);

  -[UIView layer](self, "layer");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "addAnimation:forKey:", v37, CFSTR("stemView transition out"));

  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("opacity"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setFromValue:", &unk_1E1A96140);
  objc_msgSend(v43, "setToValue:", &unk_1E1A9A710);
  objc_msgSend(v43, "setFrameInterval:", 0.0166666667);
  objc_msgSend(v43, "setDuration:", 0.2);
  objc_msgSend(v43, "setTimingFunction:", v8);
  objc_msgSend(v43, "setFillMode:", v28);
  objc_msgSend(v43, "setRemovedOnCompletion:", 0);
  v52[0] = v29;
  v52[1] = 3221225472;
  v52[2] = __54__UISelectionGrabber_animateGrabberOutWithCompletion___block_invoke_4;
  v52[3] = &unk_1E16B3FD8;
  v52[4] = self;
  +[_UISelectionGrabberAnimationDelegate delegateWithCompletionBlock:](_UISelectionGrabberAnimationDelegate, "delegateWithCompletionBlock:", v52);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setDelegate:", v44);

  -[UIView layer](self, "layer");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "addAnimation:forKey:", v43, CFSTR("stemView opacity transition out"));

}

void __54__UISelectionGrabber_animateGrabberOutWithCompletion___block_invoke(double *a1, char a2)
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  id v8;

  if ((a2 & 1) != 0)
  {
    v3 = a1[5];
    v4 = a1[6];
    v5 = a1[7];
    v6 = a1[8];
    objc_msgSend(*(id *)(*((_QWORD *)a1 + 4) + 424), "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBounds:", v3, v4, v5, v6);

  }
  objc_msgSend(*(id *)(*((_QWORD *)a1 + 4) + 424), "layer");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeAnimationForKey:", CFSTR("dotView transition out"));

}

void __54__UISelectionGrabber_animateGrabberOutWithCompletion___block_invoke_2(uint64_t a1, char a2)
{
  void *v3;
  double v4;
  id v5;

  if ((a2 & 1) != 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "layer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v4) = 1.0;
    objc_msgSend(v3, "setOpacity:", v4);

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "layer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAnimationForKey:", CFSTR("dotView opacity transition out"));

}

uint64_t __54__UISelectionGrabber_animateGrabberOutWithCompletion___block_invoke_3(uint64_t a1, int a2)
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  uint64_t result;

  if (a2)
  {
    v3 = *(double *)(a1 + 48);
    v4 = *(double *)(a1 + 56);
    v5 = *(double *)(a1 + 64);
    v6 = *(double *)(a1 + 72);
    objc_msgSend(*(id *)(a1 + 32), "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBounds:", v3, v4, v5, v6);

  }
  objc_msgSend(*(id *)(a1 + 32), "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeAnimationForKey:", CFSTR("stemView transition out"));

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __54__UISelectionGrabber_animateGrabberOutWithCompletion___block_invoke_4(uint64_t a1, int a2)
{
  void *v3;
  double v4;
  id v5;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "layer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v4) = 1.0;
    objc_msgSend(v3, "setOpacity:", v4);

  }
  objc_msgSend(*(id *)(a1 + 32), "layer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAnimationForKey:", CFSTR("stemView opacity transition out"));

}

- (void)transitionDot:(int64_t)a3 completion:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  v7 = v6;
  if (a3 == 2)
  {
    v8 = v6;
    -[UISelectionGrabber animateGrabberOutWithCompletion:](self, "animateGrabberOutWithCompletion:", v6);
    goto LABEL_7;
  }
  if (a3 == 1)
  {
    v8 = v6;
    -[UISelectionGrabber animateGrabberInWithCompletion:](self, "animateGrabberInWithCompletion:", v6);
LABEL_7:
    v7 = v8;
    goto LABEL_8;
  }
  if (v6)
  {
    v8 = v6;
    (*((void (**)(id))v6 + 2))(v6);
    goto LABEL_7;
  }
LABEL_8:

}

- (BOOL)isVertical
{
  return self->m_orientation < 2uLL;
}

- (BOOL)isPointedDown
{
  return self->m_orientation == 0;
}

- (BOOL)isPointedUp
{
  return self->m_orientation == 1;
}

- (BOOL)isPointedRight
{
  return self->m_orientation == 2;
}

- (BOOL)isPointedLeft
{
  return self->m_orientation == 3;
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UISelectionGrabber;
  -[UIView _dynamicUserInterfaceTraitDidChange](&v7, sel__dynamicUserInterfaceTraitDidChange);
  -[UISelectionGrabber customPath](self, "customPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[UISelectionGrabber fillColor](self, "fillColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "cgColor");
    -[UISelectionGrabber shapeLayer](self, "shapeLayer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setStrokeColor:", v5);

  }
}

- (void)willMoveToWindow:(id)a3
{
  id v4;
  void *v5;
  double v6;
  void *v7;
  double v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UISelectionGrabber;
  -[UIView willMoveToWindow:](&v9, sel_willMoveToWindow_, v4);
  if (v4)
  {
    objc_msgSend(v4, "screen");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "scale");
    self->m_screenScale = v6;

    -[UISelectionGrabber updatePathForBoundsChangeIfNecessary](self, "updatePathForBoundsChangeIfNecessary");
  }
  else
  {
    +[UIScreen mainScreen](UIScreen, "mainScreen");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "scale");
    self->m_screenScale = v8;

  }
}

- (void)didMoveToSuperview
{
  -[UISelectionGrabber updateDot](self, "updateDot");
  -[UISelectionGrabber updatePathForBoundsChangeIfNecessary](self, "updatePathForBoundsChangeIfNecessary");
}

- (void)setIsDotted:(BOOL)a3
{
  self->m_isDotted = a3;
  -[UISelectionGrabber updateDot](self, "updateDot");
}

- (void)setOrientation:(int64_t)a3
{
  self->m_orientation = a3;
  -[UISelectionGrabber updateDot](self, "updateDot");
}

- (void)setAnimating:(BOOL)a3
{
  self->m_animating = a3;
  -[UISelectionGrabber updateDot](self, "updateDot");
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  objc_super v15;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UIView window](self, "window");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "convertRect:toView:", self, 0.0, 0.0, 1.0, 1.0);
  v10 = v9;

  if (v10 == 1.0)
  {
    -[UIView window](self, "window");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    x = pixelAlignedRectForRect(v11);
    y = v12;
    width = v13;
    height = v14;

  }
  v15.receiver = self;
  v15.super_class = (Class)UISelectionGrabber;
  -[UIView setFrame:](&v15, sel_setFrame_, x, y, width, height);
  -[UISelectionGrabber updateDot](self, "updateDot");
}

- (void)setBounds:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UISelectionGrabber;
  -[UIView setBounds:](&v4, sel_setBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[UISelectionGrabber updatePathForBoundsChangeIfNecessary](self, "updatePathForBoundsChangeIfNecessary");
}

- (void)setCenter:(CGPoint)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UISelectionGrabber;
  -[UIView setCenter:](&v4, sel_setCenter_, a3.x, a3.y);
  -[UISelectionGrabber updatePathForBoundsChangeIfNecessary](self, "updatePathForBoundsChangeIfNecessary");
}

- (void)updatePathForBoundsChangeIfNecessary
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;

  -[UISelectionGrabber customPath](self, "customPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[UISelectionGrabber customPath](self, "customPath");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[UISelectionGrabber bezierPathFromCustomPath:](self, "bezierPathFromCustomPath:", v7);
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v5 = objc_msgSend(v4, "CGPath");
    -[UISelectionGrabber shapeLayer](self, "shapeLayer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPath:", v5);

  }
}

- (void)drawRect:(CGRect)a3
{
  void *v4;
  double v5;
  CGFloat x;
  double v7;
  CGFloat y;
  double v9;
  CGFloat width;
  double v11;
  CGFloat height;
  void *v13;
  double v14;
  double v15;
  void *v16;
  id v17;
  CGRect v18;
  CGRect v19;

  -[UISelectionGrabber customPath](self, "customPath", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[UISelectionGrabber fillColor](self, "fillColor");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    -[UIView bounds](self, "bounds");
    x = v5;
    y = v7;
    width = v9;
    height = v11;
    -[UIView _screen](self, "_screen");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "scale");
    v15 = v14;

    if (v15 <= 1.0)
    {
      objc_msgSend(v17, "colorWithAlphaComponent:", 0.5);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "set");

      UIRectFillUsingOperation(1, x, y, width, height);
      objc_msgSend(v17, "set");
      v18.origin.x = x;
      v18.origin.y = y;
      v18.size.width = width;
      v18.size.height = height;
      v19 = CGRectInset(v18, 1.0, 0.0);
      x = v19.origin.x;
      y = v19.origin.y;
      width = v19.size.width;
      height = v19.size.height;
    }
    else
    {
      objc_msgSend(v17, "set");
    }
    UIRectFillUsingOperation(1, x, y, width, height);

  }
}

- (id)fillColor
{
  void *v2;
  void *v3;
  void *v4;

  -[UISelectionGrabber hostView](self, "hostView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "container");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "selectionBarColor");
  else
    +[UIColor selectionGrabberColor](UIColor, "selectionGrabberColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isDotted
{
  return self->m_isDotted;
}

- (BOOL)animating
{
  return self->m_animating;
}

- (int64_t)orientation
{
  return self->m_orientation;
}

- (UISelectionGrabberCustomPath)customPath
{
  return self->_customPath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customPath, 0);
  objc_storeStrong((id *)&self->m_dotView, 0);
}

+ (id)_grabberDot
{
  return -[UIImageView initWithFrame:]([UISelectionGrabberDot alloc], "initWithFrame:", 0.0, 0.0, 100.0, 100.0);
}

- (id)_dotView
{
  return self->m_dotView;
}

@end
