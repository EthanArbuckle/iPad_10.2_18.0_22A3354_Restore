@implementation CRLPathKnob

- (id)initBendKnobOnRep:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CRLPathKnob;
  return -[CRLCanvasKnob initWithType:position:radius:tag:onRep:](&v4, "initWithType:position:radius:tag:onRep:", 0, 23, a3, CGPointZero.x, CGPointZero.y, 10.0);
}

- (CRLPathKnob)initWithNode:(id)a3 onRep:(id)a4
{
  id v7;
  id v8;
  CRLPathKnob *v9;
  void *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "nodePoint");
  v12.receiver = self;
  v12.super_class = (Class)CRLPathKnob;
  v9 = -[CRLCanvasKnob initWithType:position:radius:tag:onRep:](&v12, "initWithType:position:radius:tag:onRep:", 0, 17, v8);

  if (v9)
  {
    objc_storeStrong((id *)&v9->_node, a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPathKnob p_knobHitPath](v9, "p_knobHitPath"));
    -[CRLCanvasKnob setHitRegionPath:](v9, "setHitRegionPath:", v10);

  }
  return v9;
}

- (CRLPathKnob)initWithInControlForNode:(id)a3 onRep:(id)a4
{
  id v7;
  id v8;
  CRLPathKnob *v9;
  void *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "inControlPoint");
  v12.receiver = self;
  v12.super_class = (Class)CRLPathKnob;
  v9 = -[CRLCanvasKnob initWithType:position:radius:tag:onRep:](&v12, "initWithType:position:radius:tag:onRep:", 0, 18, v8);

  if (v9)
  {
    objc_storeStrong((id *)&v9->_node, a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPathKnob p_knobHitPath](v9, "p_knobHitPath"));
    -[CRLCanvasKnob setHitRegionPath:](v9, "setHitRegionPath:", v10);

  }
  return v9;
}

- (CRLPathKnob)initWithOutControlForNode:(id)a3 onRep:(id)a4
{
  id v7;
  id v8;
  CRLPathKnob *v9;
  void *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "outControlPoint");
  v12.receiver = self;
  v12.super_class = (Class)CRLPathKnob;
  v9 = -[CRLCanvasKnob initWithType:position:radius:tag:onRep:](&v12, "initWithType:position:radius:tag:onRep:", 0, 19, v8);

  if (v9)
  {
    objc_storeStrong((id *)&v9->_node, a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPathKnob p_knobHitPath](v9, "p_knobHitPath"));
    -[CRLCanvasKnob setHitRegionPath:](v9, "setHitRegionPath:", v10);

  }
  return v9;
}

- (id)p_knobHitPath
{
  return +[CRLBezierPath bezierPathWithOvalInRect:](CRLBezierPath, "bezierPathWithOvalInRect:", sub_10005FD98(CGPointZero.x, CGPointZero.y, 20.0));
}

- (BOOL)hovering
{
  return self->_hovering;
}

- (void)setHovering:(BOOL)a3
{
  if (self->_hovering != a3)
  {
    self->_hovering = a3;
    -[CRLPathKnob updateImage](self, "updateImage");
  }
}

- (BOOL)hoveringSharp
{
  return self->_hoveringSharp;
}

- (void)setHoveringSharp:(BOOL)a3
{
  if (self->_hoveringSharp != a3)
  {
    self->_hoveringSharp = a3;
    -[CRLPathKnob updateImage](self, "updateImage");
  }
}

- (BOOL)obscuresKnob:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  if (objc_msgSend(v4, "tag") == (id)23)
  {
    v5 = 1;
  }
  else if ((id)-[CRLCanvasKnob tag](self, "tag") == (id)23)
  {
    v5 = 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)CRLPathKnob;
    v5 = -[CRLCanvasKnob obscuresKnob:](&v7, "obscuresKnob:", v4);
  }

  return v5;
}

- (BOOL)overlapsWithKnob:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  if (objc_msgSend(v4, "tag") == (id)23 || (id)-[CRLCanvasKnob tag](self, "tag") == (id)23)
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)CRLPathKnob;
    v5 = -[CRLCanvasKnob overlapsWithKnob:](&v7, "overlapsWithKnob:", v4);
  }

  return v5;
}

- (BOOL)isHitByUnscaledPoint:(CGPoint)a3 inputType:(int64_t)a4 returningDistance:(double *)a5
{
  double y;
  double x;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  double v16;
  double v17;
  uint64_t v18;
  BOOL v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  unint64_t v24;
  unint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  unint64_t v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  float64_t v35;
  double v36;
  float64_t v37;
  double v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  void *v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  float64x2_t v58;
  float64x2_t v59;
  float64x2_t v60;
  double v61;
  float64x2_t v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  void *v76;
  double v77;
  double v78;
  double v79;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  float64x2_t v86;
  float64x2_t v87;
  float64x2_t v88;
  double v89;
  uint64_t v90;
  unint64_t v91;
  CGAffineTransform v92;
  CGAffineTransform v93;
  objc_super v94;
  float64x2_t v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;

  y = a3.y;
  x = a3.x;
  if ((id)-[CRLCanvasKnob tag](self, "tag") == (id)23 || (id)-[CRLCanvasKnob tag](self, "tag") == (id)24)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnob rep](self, "rep"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "editablePathSource"));
    v12 = v11;
    if (!v11
      || (v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "nodes")),
          v14 = objc_msgSend(v13, "count"),
          v13,
          !v14))
    {
      v19 = 0;
LABEL_29:

      return v19;
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnob rep](self, "rep"));
    objc_msgSend(v15, "convertNaturalPointFromUnscaledCanvas:", x, y);
    v81 = v17;
    v84 = v16;
    if (v10)
      objc_msgSend(v10, "naturalToEditablePathSpaceTransform", *(_QWORD *)&v17, v18, *(_QWORD *)&v16);
    else
      memset(&v92, 0, sizeof(v92));
    CGAffineTransformInvert(&v93, &v92);
    v90 = 0;
    v91 = 0;
    v89 = 0.0;
    objc_msgSend(v12, "distanceToPoint:subpathIndex:elementIndex:tValue:threshold:", &v90, &v91, &v89, vaddq_f64(*(float64x2_t *)&v93.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v93.c, v81), *(float64x2_t *)&v93.a, v84)), 0.0);
    *(_QWORD *)a5 = v20;
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "subpaths"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectAtIndexedSubscript:", v90));

    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "nodes"));
    v24 = (unint64_t)objc_msgSend(v23, "count");

    v25 = (v91 + 1) % v24;
    -[CRLPathKnob setSubpathIndex:](self, "setSubpathIndex:", v90);
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "nodes"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectAtIndexedSubscript:", v25));
    -[CRLPathKnob setNode:](self, "setNode:", v27);

    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "nodes"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectAtIndexedSubscript:", v91));
    -[CRLPathKnob setPrevNode:](self, "setPrevNode:", v29);

    if ((id)-[CRLCanvasKnob tag](self, "tag") == (id)24)
      v30 = v91;
    else
      v30 = v25;
    -[CRLPathKnob setNodeIndex:](self, "setNodeIndex:", v30, *(_QWORD *)&v81);
    if ((id)-[CRLCanvasKnob tag](self, "tag") != (id)24)
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPathKnob prevNode](self, "prevNode"));
      if (objc_msgSend(v31, "type") == (id)1)
      {
        v32 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPathKnob node](self, "node"));
        v33 = objc_msgSend(v32, "type");

        if (v33 == (id)1)
        {
          v19 = 0;
LABEL_28:

          goto LABEL_29;
        }
      }
      else
      {

      }
    }
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPathKnob prevNode](self, "prevNode"));
    objc_msgSend(v34, "nodePoint");
    v36 = v35;
    v38 = v37;
    v95.f64[0] = v35;
    v95.f64[1] = v37;
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPathKnob prevNode](self, "prevNode"));
    objc_msgSend(v39, "outControlPoint");
    v41 = v40;
    v43 = v42;
    v96 = v40;
    v97 = v42;
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPathKnob node](self, "node"));
    objc_msgSend(v44, "inControlPoint");
    v46 = v45;
    v48 = v47;
    v98 = v45;
    v99 = v47;
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPathKnob node](self, "node"));
    objc_msgSend(v49, "nodePoint");
    v51 = v50;
    v53 = v52;
    v100 = v50;
    v101 = v52;

    if (sub_10005FDF0(v36, v38, v41, v43) && sub_10005FDF0(v46, v48, v51, v53))
    {
      v96 = sub_100061A8C(v36, v38, v51, v53, 0.333333333);
      v97 = v54;
      v98 = sub_100061A8C(v36, v38, v51, v53, 0.666666667);
      v99 = v55;
    }
    v56 = sub_1000602A8(&v95, v89);
    v82 = v56;
    v85 = v57;
    if (v10)
    {
      objc_msgSend(v10, "naturalToEditablePathSpaceTransform");
      v56 = v82;
      v57 = v85;
      v59 = v86;
      v58 = v87;
      v60 = v88;
    }
    else
    {
      v60 = 0uLL;
      v59 = 0uLL;
      v58 = 0uLL;
    }
    -[CRLCanvasKnob setPosition:](self, "setPosition:", vaddq_f64(v60, vmlaq_n_f64(vmulq_n_f64(v58, v57), v59, v56)), *(_QWORD *)&v82);
    -[CRLPathKnob setTValue:](self, "setTValue:", v89);
    v61 = v89;
    if (v89 >= 0.5)
    {
      v69 = v100;
      v70 = v101;
      v71 = sub_10006108C(v83, v85, v100, v101);
      v72 = v96;
      v73 = v97;
      v74 = sub_10006108C(v95.f64[0], v95.f64[1], v96, v97);
      v67 = v71 / (v74 + sub_10006108C(v72, v73, v69, v70));
      v68 = (1.0 - v61) * (1.0 - v61);
    }
    else
    {
      v62 = v95;
      v63 = sub_10006108C(v83, v85, v95.f64[0], v95.f64[1]);
      v64 = v98;
      v65 = v99;
      v66 = sub_10006108C(v62.f64[0], v62.f64[1], v98, v99);
      v67 = v63 / (v66 + sub_10006108C(v64, v65, v100, v101));
      v68 = v61 * v61;
    }
    -[CRLPathKnob setBendParameter:](self, "setBendParameter:", v67 / v68);
    v75 = *a5;
    v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "interactiveCanvasController"));
    objc_msgSend(v76, "viewScale");
    v78 = v75 * v77;
    -[CRLCanvasKnob radius](self, "radius");
    v19 = v78 < v79;

    goto LABEL_28;
  }
  v94.receiver = self;
  v94.super_class = (Class)CRLPathKnob;
  return -[CRLCanvasKnob isHitByUnscaledPoint:inputType:returningDistance:](&v94, "isHitByUnscaledPoint:inputType:returningDistance:", a4, a5, x, y);
}

- (id)underlayRenderableForRep:(id)a3
{
  id v4;
  CRLCanvasShapeRenderable *v5;
  CRLCanvasShapeRenderable *handleLine;
  void *v7;
  CGPath *Mutable;
  double v9;
  CGFloat v10;
  CGFloat v11;
  unint64_t v12;
  CRLBezierNode *node;
  double v14;
  CGFloat v15;
  CGFloat v16;
  double v17;
  CRLCanvasShapeRenderable *v18;
  CGAffineTransform v20;

  v4 = a3;
  if ((id)-[CRLCanvasKnob tag](self, "tag") == (id)18 || (id)-[CRLCanvasKnob tag](self, "tag") == (id)19)
  {
    if (!self->_handleLine)
    {
      v5 = (CRLCanvasShapeRenderable *)objc_claimAutoreleasedReturnValue(+[CRLCanvasShapeRenderable renderable](CRLCanvasShapeRenderable, "renderable"));
      handleLine = self->_handleLine;
      self->_handleLine = v5;

      -[CRLCanvasShapeRenderable setFillColor:](self->_handleLine, "setFillColor:", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[CRLColor colorWithWhite:alpha:](CRLColor, "colorWithWhite:alpha:", 0.5, 1.0));
      -[CRLCanvasShapeRenderable setStrokeColor:](self->_handleLine, "setStrokeColor:", objc_msgSend(v7, "CGColor"));

      -[CRLCanvasShapeRenderable setLineWidth:](self->_handleLine, "setLineWidth:", 1.0);
    }
    -[CRLPathKnob p_underlayRenderableTransformForRep:](self, "p_underlayRenderableTransformForRep:", v4, 0, 0, 0, 0, 0, 0);
    Mutable = CGPathCreateMutable();
    -[CRLBezierNode nodePoint](self->_node, "nodePoint");
    v10 = v9;
    -[CRLBezierNode nodePoint](self->_node, "nodePoint");
    CGPathMoveToPoint(Mutable, &v20, v10, v11);
    v12 = -[CRLCanvasKnob tag](self, "tag");
    node = self->_node;
    if (v12 == 18)
    {
      -[CRLBezierNode inControlPoint](node, "inControlPoint");
      v15 = v14;
      -[CRLBezierNode inControlPoint](self->_node, "inControlPoint");
    }
    else
    {
      -[CRLBezierNode outControlPoint](node, "outControlPoint");
      v15 = v17;
      -[CRLBezierNode outControlPoint](self->_node, "outControlPoint");
    }
    CGPathAddLineToPoint(Mutable, &v20, v15, v16);
    -[CRLCanvasShapeRenderable setPath:](self->_handleLine, "setPath:", Mutable);
    CGPathRelease(Mutable);
    v18 = self->_handleLine;
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (CGAffineTransform)p_underlayRenderableTransformForRep:(SEL)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  CGFloat v10;
  CGFloat v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  CGAffineTransform *result;
  _OWORD v25[6];
  CGAffineTransform t2;
  CGAffineTransform t1;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "interactiveCanvasController"));
  *(_OWORD *)&retstr->a = 0u;
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "layout"));
  v8 = v7;
  if (v7)
    objc_msgSend(v7, "pureTransformInRoot");
  else
    memset(&t1, 0, sizeof(t1));
  objc_msgSend(v6, "viewScale");
  v10 = v9;
  objc_msgSend(v6, "viewScale");
  CGAffineTransformMakeScale(&t2, v10, v11);
  CGAffineTransformConcat(retstr, &t1, &t2);

  v13 = objc_opt_class(CRLCanvasRep, v12);
  v19 = sub_10022209C(v5, v13, 1, v14, v15, v16, v17, v18, (uint64_t)&OBJC_PROTOCOL___CRLPathKnobUnderlayRenderableTransformProvider);
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  v21 = v20;
  if (v20)
  {
    v22 = *(_OWORD *)&retstr->c;
    v25[0] = *(_OWORD *)&retstr->a;
    v25[1] = v22;
    v25[2] = *(_OWORD *)&retstr->tx;
    objc_msgSend(v20, "pathKnobUnderlayRenderableTransform:", v25);
    v23 = v25[4];
    *(_OWORD *)&retstr->a = v25[3];
    *(_OWORD *)&retstr->c = v23;
    *(_OWORD *)&retstr->tx = v25[5];
  }

  return result;
}

- (id)knobImage
{
  __CFString *v3;
  void *v4;
  int64_t v6;
  CRLBezierNode *node;
  unsigned int v8;
  __CFString *v9;
  const __CFString *v10;
  id v11;

  if ((id)-[CRLCanvasKnob tag](self, "tag") == (id)18 || (id)-[CRLCanvasKnob tag](self, "tag") == (id)19)
  {
    v3 = CFSTR("CRLCanvasKnobPathControl");
    goto LABEL_4;
  }
  if ((id)-[CRLCanvasKnob tag](self, "tag") == (id)20)
  {
LABEL_6:
    v3 = CFSTR("CRLCanvasKnobPathControlSmooth");
    goto LABEL_4;
  }
  if ((id)-[CRLCanvasKnob tag](self, "tag") == (id)22 || (id)-[CRLCanvasKnob tag](self, "tag") == (id)24)
  {
    if (-[CRLPathKnob hovering](self, "hovering"))
    {
      if (-[CRLPathKnob hoveringSharp](self, "hoveringSharp"))
        v3 = CFSTR("CRLCanvasKnobPathLine");
      else
        v3 = CFSTR("CRLCanvasKnobPathSmooth");
    }
    else
    {
      v3 = CFSTR("CRLCanvasKnobPathControlNew");
    }
  }
  else
  {
    if ((id)-[CRLCanvasKnob tag](self, "tag") == (id)21)
      goto LABEL_6;
    v6 = -[CRLBezierNode type](self->_node, "type");
    node = self->_node;
    if (v6 == 1)
    {
      v8 = -[CRLBezierNode isSelected](node, "isSelected");
      v9 = CFSTR("CRLCanvasKnobPathLine");
      v10 = CFSTR("CRLCanvasKnobPathLineSelected");
    }
    else
    {
      v11 = -[CRLBezierNode type](node, "type");
      v8 = -[CRLBezierNode isSelected](self->_node, "isSelected");
      if (v11 == (id)3)
      {
        v9 = CFSTR("CRLCanvasKnobPathSmooth");
        v10 = CFSTR("CRLCanvasKnobPathSmoothSelected");
      }
      else
      {
        v9 = CFSTR("CRLCanvasKnobPathBezier");
        v10 = CFSTR("CRLCanvasKnobPathBezierSelected");
      }
    }
    if (v8)
      v9 = (__CFString *)v10;
    v3 = v9;
  }
LABEL_4:
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CRLImage imageNamed:](CRLImage, "imageNamed:", v3));

  return v4;
}

- (void)updateImage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnob rep](self, "rep"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPathKnob knobImage](self, "knobImage"));
    if (v4)
    {
      v8 = v4;
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnob renderable](self, "renderable"));
      objc_msgSend(v8, "size");
      objc_msgSend(v5, "setBounds:", sub_10005FDDC());
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnob rep](self, "rep"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "canvas"));
      objc_msgSend(v7, "contentsScale");
      objc_msgSend(v5, "setContents:", objc_msgSend(v8, "CGImageForContentsScale:"));

      v4 = v8;
    }

  }
}

- (void)updatePositionWithTransform:(CGAffineTransform *)a3
{
  double v5;
  double v6;
  float64_t v7;
  float64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  float64_t v14;
  float64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  float64_t v21;
  float64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  double v29;
  double v30;
  float64x2_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;

  switch(-[CRLCanvasKnob tag](self, "tag"))
  {
    case 0x11uLL:
      -[CRLBezierNode nodePoint](self->_node, "nodePoint");
      goto LABEL_5;
    case 0x12uLL:
      -[CRLBezierNode inControlPoint](self->_node, "inControlPoint");
      goto LABEL_5;
    case 0x13uLL:
      -[CRLBezierNode outControlPoint](self->_node, "outControlPoint");
LABEL_5:
      -[CRLCanvasKnob setPosition:](self, "setPosition:", vaddq_f64(*(float64x2_t *)&a3->tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&a3->c, v6), *(float64x2_t *)&a3->a, v5)));
      return;
    case 0x14uLL:
      -[CRLBezierNode nodePoint](self->_node, "nodePoint");
      v31.f64[0] = v7;
      v31.f64[1] = v8;
      -[CRLBezierNode inControlPoint](self->_node, "inControlPoint");
      v32 = v9;
      v33 = v10;
      v11 = 136;
      -[CRLBezierNode outControlPoint](self->_prevNode, "outControlPoint");
      goto LABEL_8;
    case 0x15uLL:
      -[CRLBezierNode nodePoint](self->_node, "nodePoint");
      v31.f64[0] = v14;
      v31.f64[1] = v15;
      -[CRLBezierNode outControlPoint](self->_node, "outControlPoint");
      v32 = v16;
      v33 = v17;
      v11 = 128;
      -[CRLBezierNode inControlPoint](self->_nextNode, "inControlPoint");
LABEL_8:
      v34 = v12;
      v35 = v13;
      objc_msgSend(*(id *)((char *)&self->super.super.isa + v11), "nodePoint");
      v36 = v18;
      v37 = v19;
      v20 = sub_100127164(&v31);
      goto LABEL_10;
    case 0x16uLL:
      -[CRLBezierNode nodePoint](self->_node, "nodePoint");
      v31.f64[0] = v21;
      v31.f64[1] = v22;
      -[CRLBezierNode outControlPoint](self->_node, "outControlPoint");
      v32 = v23;
      v33 = v24;
      -[CRLBezierNode inControlPoint](self->_nextNode, "inControlPoint");
      v34 = v25;
      v35 = v26;
      -[CRLBezierNode nodePoint](self->_nextNode, "nodePoint");
      v36 = v27;
      v37 = v28;
      v20 = 0.5;
LABEL_10:
      v29 = sub_1000602A8(&v31, v20);
      -[CRLCanvasKnob setPosition:](self, "setPosition:", vaddq_f64(*(float64x2_t *)&a3->tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&a3->c, v30), *(float64x2_t *)&a3->a, v29)));
      break;
    default:
      return;
  }
}

- (CRLBezierNode)node
{
  return self->_node;
}

- (void)setNode:(id)a3
{
  objc_storeStrong((id *)&self->_node, a3);
}

- (CRLBezierNode)nextNode
{
  return self->_nextNode;
}

- (void)setNextNode:(id)a3
{
  objc_storeStrong((id *)&self->_nextNode, a3);
}

- (CRLBezierNode)prevNode
{
  return self->_prevNode;
}

- (void)setPrevNode:(id)a3
{
  objc_storeStrong((id *)&self->_prevNode, a3);
}

- (unint64_t)nodeIndex
{
  return self->_nodeIndex;
}

- (void)setNodeIndex:(unint64_t)a3
{
  self->_nodeIndex = a3;
}

- (double)tValue
{
  return self->_parametricT;
}

- (void)setTValue:(double)a3
{
  self->_parametricT = a3;
}

- (unint64_t)subpathIndex
{
  return self->_subpathIndex;
}

- (void)setSubpathIndex:(unint64_t)a3
{
  self->_subpathIndex = a3;
}

- (double)bendParameter
{
  return self->_bendParameter;
}

- (void)setBendParameter:(double)a3
{
  self->_bendParameter = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prevNode, 0);
  objc_storeStrong((id *)&self->_nextNode, 0);
  objc_storeStrong((id *)&self->_node, 0);
  objc_storeStrong((id *)&self->_handleLine, 0);
}

@end
