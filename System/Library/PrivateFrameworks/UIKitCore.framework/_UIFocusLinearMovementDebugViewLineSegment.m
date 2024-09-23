@implementation _UIFocusLinearMovementDebugViewLineSegment

- (_UIFocusLinearMovementDebugViewLineSegment)initWithStartRect:(CGRect)a3 endRect:(CGRect)a4 previousSegment:(id)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  id v15;
  _UIFocusLinearMovementDebugViewLineSegment *v16;
  _UIFocusLinearMovementDebugViewLineSegment *v17;
  objc_super v19;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v10 = a3.size.height;
  v11 = a3.size.width;
  v12 = a3.origin.y;
  v13 = a3.origin.x;
  v15 = a5;
  v19.receiver = self;
  v19.super_class = (Class)_UIFocusLinearMovementDebugViewLineSegment;
  v16 = -[_UIFocusLinearMovementDebugViewLineSegment init](&v19, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_previousSegment, a5);
    v17->_startRect.origin.x = v13;
    v17->_startRect.origin.y = v12;
    v17->_startRect.size.width = v11;
    v17->_startRect.size.height = v10;
    v17->_endRect.origin.x = x;
    v17->_endRect.origin.y = y;
    v17->_endRect.size.width = width;
    v17->_endRect.size.height = height;
  }

  return v17;
}

- (int64_t)type
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double MidY;
  double v20;
  double v21;
  double v22;
  double MinY;
  double MinX;
  CGFloat rect;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;

  -[_UIFocusLinearMovementDebugViewLineSegment startRect](self, "startRect");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[_UIFocusLinearMovementDebugViewLineSegment endRect](self, "endRect");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  rect = v4;
  v27.origin.x = v4;
  v27.origin.y = v6;
  v27.size.width = v8;
  v27.size.height = v10;
  MidY = CGRectGetMidY(v27);
  v28.origin.x = v12;
  v28.origin.y = v14;
  v28.size.width = v16;
  v28.size.height = v18;
  if (MidY > CGRectGetMinY(v28))
  {
    v29.origin.x = rect;
    v29.origin.y = v6;
    v29.size.width = v8;
    v29.size.height = v10;
    v20 = CGRectGetMidY(v29);
    v30.origin.x = v12;
    v30.origin.y = v14;
    v30.size.width = v16;
    v30.size.height = v18;
    if (v20 < CGRectGetMaxY(v30))
      return 0;
  }
  v31.origin.x = v12;
  v31.origin.y = v14;
  v31.size.width = v16;
  v31.size.height = v18;
  v21 = CGRectGetMidY(v31);
  v32.origin.x = rect;
  v32.origin.y = v6;
  v32.size.width = v8;
  v32.size.height = v10;
  if (v21 > CGRectGetMinY(v32))
  {
    v33.origin.x = v12;
    v33.origin.y = v14;
    v33.size.width = v16;
    v33.size.height = v18;
    v22 = CGRectGetMidY(v33);
    v34.origin.x = rect;
    v34.origin.y = v6;
    v34.size.width = v8;
    v34.size.height = v10;
    if (v22 < CGRectGetMaxY(v34))
      return 0;
  }
  v35.origin.x = rect;
  v35.origin.y = v6;
  v35.size.width = v8;
  v35.size.height = v10;
  MinY = CGRectGetMinY(v35);
  v36.origin.x = v12;
  v36.origin.y = v14;
  v36.size.width = v16;
  v36.size.height = v18;
  if (MinY >= CGRectGetMinY(v36))
    return 1;
  v37.origin.x = rect;
  v37.origin.y = v6;
  v37.size.width = v8;
  v37.size.height = v10;
  MinX = CGRectGetMinX(v37);
  v38.origin.x = v12;
  v38.origin.y = v14;
  v38.size.width = v16;
  v38.size.height = v18;
  if (MinX <= CGRectGetMinX(v38))
    return 1;
  else
    return 2;
}

- (void)drawInRect:(CGRect)a3
{
  UIBezierPath *stemPath;

  if (!self->_arrowHeadPath || (stemPath = self->_stemPath) == 0)
  {
    -[_UIFocusLinearMovementDebugViewLineSegment _calculatePaths](self, "_calculatePaths", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
    stemPath = self->_stemPath;
  }
  -[UIBezierPath stroke](stemPath, "stroke", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[UIBezierPath fill](self->_arrowHeadPath, "fill");
}

- (id)_calculateStemPathFrom:(CGRect)a3 to:(CGRect)a4 startPoint:(CGPoint *)a5 endPoint:(CGPoint *)a6
{
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  int64_t v15;
  double MidY;
  double v17;
  double v18;
  double v19;
  double v20;
  CGFloat v21;
  double v22;
  double v23;
  CGFloat v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double MidX;
  CGFloat v32;
  CGFloat v33;
  double MinX;
  CGFloat v35;
  double v36;
  double v37;
  double v38;
  double v39;
  CGFloat v40;
  CGFloat v41;
  CGFloat v42;
  CGFloat v43;
  double MaxY;
  double v45;
  double v46;
  double v47;
  double v48;
  CGFloat v49;
  CGFloat v50;
  CGFloat v51;
  CGFloat v52;
  double v53;
  CGFloat v54;
  CGFloat v55;
  double MaxX;
  double v57;
  double v58;
  double v59;
  CGFloat v60;
  CGFloat v61;
  CGFloat v62;
  CGFloat v63;
  double v64;
  double v65;
  CGFloat v66;
  CGFloat v67;
  CGFloat v68;
  CGFloat v69;
  CGFloat v70;
  CGFloat v71;
  CGFloat v72;
  CGFloat v73;
  double v74;
  CGFloat v75;
  CGFloat v76;
  CGFloat v77;
  CGFloat v78;
  CGFloat v79;
  UIBezierPath *v80;
  CGFloat v82;
  CGFloat v83;
  double v84;
  double MinY;
  double v86;
  CGFloat v87;
  CGFloat height;
  CGRect v89;
  CGRect v90;
  CGRect v91;
  CGRect v92;
  CGRect v93;
  CGRect v94;
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
  CGRect v115;
  CGRect v116;
  CGRect v117;
  CGRect v118;
  CGRect v119;
  CGRect v120;
  CGRect v121;
  CGRect v122;
  CGRect v123;
  CGRect v124;
  CGRect v125;
  CGRect v126;
  CGRect v127;
  CGRect v128;
  CGRect v129;
  CGRect v130;
  CGRect v131;
  CGRect v132;
  CGRect v133;
  CGRect v134;
  CGRect v135;
  CGRect v136;
  CGRect v137;
  CGRect v138;
  CGRect v139;
  CGRect v140;
  CGRect v141;
  CGRect v142;
  CGRect v143;
  CGRect v144;
  CGRect v145;
  CGRect v146;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v11 = a3.size.height;
  v12 = a3.size.width;
  v13 = a3.origin.y;
  v14 = a3.origin.x;
  v15 = -[_UIFocusLinearMovementDebugViewLineSegment type](self->_previousSegment, "type");
  v89.origin.x = v14;
  v89.origin.y = v13;
  v89.size.width = v12;
  v89.size.height = v11;
  MidY = CGRectGetMidY(v89);
  v90.origin.x = x;
  v90.origin.y = y;
  v90.size.width = width;
  v90.size.height = height;
  if (MidY <= CGRectGetMinY(v90))
    goto LABEL_47;
  v91.origin.x = v14;
  v91.origin.y = v13;
  v91.size.width = v12;
  v91.size.height = v11;
  v17 = CGRectGetMidY(v91);
  v92.origin.x = x;
  v92.origin.y = y;
  v92.size.width = width;
  v92.size.height = height;
  if (v17 >= CGRectGetMaxY(v92))
  {
LABEL_47:
    v93.origin.x = x;
    v93.origin.y = y;
    v93.size.width = width;
    v93.size.height = height;
    v18 = CGRectGetMidY(v93);
    v94.origin.x = v14;
    v94.origin.y = v13;
    v94.size.width = v12;
    v94.size.height = v11;
    if (v18 <= CGRectGetMinY(v94))
      goto LABEL_7;
    v95.origin.x = x;
    v95.origin.y = y;
    v95.size.width = width;
    v95.size.height = height;
    v19 = CGRectGetMidY(v95);
    v96.origin.x = v14;
    v96.origin.y = v13;
    v96.size.width = v12;
    v96.size.height = v11;
    if (v19 >= CGRectGetMaxY(v96))
    {
LABEL_7:
      v103.origin.x = v14;
      v103.origin.y = v13;
      v103.size.width = v12;
      v103.size.height = v11;
      MinY = CGRectGetMinY(v103);
      v104.origin.x = x;
      v104.origin.y = y;
      v104.size.width = width;
      v104.size.height = height;
      v84 = CGRectGetMinY(v104);
      v82 = v14;
      v83 = v13;
      v105.origin.x = v14;
      v105.origin.y = v13;
      v87 = v12;
      v105.size.width = v12;
      v105.size.height = v11;
      MidX = CGRectGetMidX(v105);
      v106.origin.x = x;
      v32 = y;
      v106.origin.y = y;
      v33 = width;
      v106.size.width = width;
      v106.size.height = height;
      MinX = CGRectGetMinX(v106);
      if (MinY >= v84)
      {
        if (MidX <= MinX)
          goto LABEL_48;
        v116.origin.x = v82;
        v116.origin.y = v13;
        v116.size.width = v87;
        v116.size.height = v11;
        v46 = CGRectGetMidX(v116);
        v117.origin.x = x;
        v117.origin.y = y;
        v117.size.width = width;
        v117.size.height = height;
        if (v46 >= CGRectGetMaxX(v117))
        {
LABEL_48:
          v118.origin.x = x;
          v118.origin.y = y;
          v118.size.width = width;
          v118.size.height = height;
          v47 = CGRectGetMidX(v118);
          v119.origin.x = v82;
          v119.origin.y = v83;
          v119.size.width = v87;
          v119.size.height = v11;
          if (v47 <= CGRectGetMinX(v119))
            goto LABEL_25;
          v120.origin.x = x;
          v120.origin.y = y;
          v120.size.width = width;
          v120.size.height = height;
          v48 = CGRectGetMidX(v120);
          v121.origin.x = v82;
          v121.origin.y = v83;
          v121.size.width = v87;
          v121.size.height = v11;
          if (v48 >= CGRectGetMaxX(v121))
          {
LABEL_25:
            v130.origin.x = v82;
            v130.origin.y = v83;
            v130.size.width = v87;
            v130.size.height = v11;
            v65 = CGRectGetMinX(v130);
            v131.origin.x = x;
            v131.origin.y = y;
            v131.size.width = width;
            v131.size.height = height;
            if (v65 < CGRectGetMinX(v131))
            {
              v132.origin.x = v82;
              v132.origin.y = v83;
              v132.size.width = v87;
              v132.size.height = v11;
              MaxX = CGRectGetMaxX(v132);
              v133.origin.x = v82;
              v133.origin.y = v83;
              v133.size.width = v87;
              v133.size.height = v11;
              MaxY = CGRectGetMidY(v133);
              v134.origin.x = x;
              v134.origin.y = y;
              v134.size.width = width;
              v134.size.height = height;
              v29 = CGRectGetMinX(v134);
              v135.origin.x = x;
              v135.origin.y = y;
              v135.size.width = width;
              v135.size.height = height;
              v57 = CGRectGetMidY(v135);
              v27 = v57;
              v25 = v29;
              v23 = MaxY;
              v26 = MaxX;
              goto LABEL_37;
            }
            v139.origin.x = v82;
            v139.origin.y = v83;
            v139.size.width = v87;
            v139.size.height = v11;
            v72 = CGRectGetMinX(v139);
            v140.origin.x = v82;
            v140.origin.y = v83;
            v140.size.width = v87;
            v140.size.height = v11;
            MaxY = CGRectGetMaxY(v140);
            v141.origin.x = x;
            v141.origin.y = y;
            v141.size.width = width;
            v141.size.height = height;
            v73 = CGRectGetMinX(v141);
            v142.origin.y = y;
            v25 = v73;
            v142.origin.x = x;
            v142.size.width = width;
            v26 = v72;
            v142.size.height = height;
            v57 = CGRectGetMidY(v142);
            v74 = dbl_18667F510[vabdd_f64(v57, MaxY) > 20.0];
            v29 = v26 - v74;
            goto LABEL_35;
          }
        }
        v122.origin.x = v82;
        v122.origin.y = v83;
        v122.size.width = v87;
        v122.size.height = v11;
        v39 = CGRectGetMinX(v122);
        v49 = v82;
        v50 = v83;
        v51 = v87;
        v52 = v11;
        if (v15 == 1)
          v53 = CGRectGetMaxY(*(CGRect *)&v49);
        else
          v53 = CGRectGetMidY(*(CGRect *)&v49);
        MaxY = v53;
        v144.origin.x = x;
        v144.origin.y = y;
        v144.size.width = width;
        v144.size.height = height;
        v79 = CGRectGetMinX(v144);
        v76 = y;
        v25 = v79;
        v75 = x;
        v77 = width;
        v78 = height;
      }
      else
      {
        v35 = y;
        if (MidX <= MinX)
          goto LABEL_49;
        v107.origin.x = v82;
        v107.origin.y = v13;
        v107.size.width = v87;
        v107.size.height = v11;
        v36 = CGRectGetMidX(v107);
        v108.origin.x = x;
        v108.origin.y = y;
        v108.size.width = v33;
        v108.size.height = height;
        if (v36 >= CGRectGetMaxX(v108))
        {
LABEL_49:
          v109.origin.x = x;
          v109.origin.y = y;
          v109.size.width = v33;
          v109.size.height = height;
          v37 = CGRectGetMidX(v109);
          v110.origin.x = v82;
          v110.origin.y = v83;
          v110.size.width = v87;
          v110.size.height = v11;
          if (v37 <= CGRectGetMinX(v110))
            goto LABEL_22;
          v111.origin.x = x;
          v111.origin.y = y;
          v111.size.width = v33;
          v111.size.height = height;
          v38 = CGRectGetMidX(v111);
          v112.origin.x = v82;
          v112.origin.y = v83;
          v112.size.width = v87;
          v112.size.height = v11;
          if (v38 >= CGRectGetMaxX(v112))
          {
LABEL_22:
            v127.origin.x = v82;
            v127.origin.y = v83;
            v127.size.width = v87;
            v127.size.height = v11;
            v58 = CGRectGetMinX(v127);
            v128.origin.x = x;
            v128.origin.y = y;
            v128.size.width = v33;
            v128.size.height = height;
            v59 = CGRectGetMinX(v128);
            v129.origin.x = v82;
            v129.origin.y = v83;
            v129.size.width = v87;
            v129.size.height = v11;
            v86 = CGRectGetMinX(v129);
            if (v58 >= v59)
            {
              v136.origin.x = v82;
              v136.origin.y = v83;
              v136.size.width = v87;
              v136.size.height = v11;
              v23 = CGRectGetMaxY(v136);
              v137.origin.x = x;
              v137.origin.y = v32;
              v137.size.width = v33;
              v137.size.height = height;
              v66 = CGRectGetMinY(v137) + -10.0;
              v138.origin.x = x;
              v138.origin.y = v32;
              v138.size.width = v33;
              v138.size.height = height;
              v67 = CGRectGetMinX(v138);
              v68 = v32;
              v25 = v67;
              v69 = height;
              v70 = v33;
              v71 = x;
              if (v66 <= v23)
              {
                v57 = CGRectGetMidY(*(CGRect *)&v71);
                MaxX = v25 - dbl_18667F510[vabdd_f64(v57, v23) > 20.0];
                v29 = MaxX;
                MaxY = v23;
                v27 = v57;
                v26 = v86;
              }
              else
              {
                MaxY = CGRectGetMinY(*(CGRect *)&v71);
                v26 = v86;
                v29 = v86 + 20.0;
                v57 = MaxY + -10.0;
                MaxX = v25;
                v27 = MaxY;
              }
              goto LABEL_37;
            }
            v60 = v83;
            v61 = v82;
            v62 = v87;
            v63 = v11;
            if (v15 == 1)
              v64 = CGRectGetMaxY(*(CGRect *)&v61);
            else
              v64 = CGRectGetMidY(*(CGRect *)&v61);
            MaxY = v64;
            v145.origin.x = x;
            v145.origin.y = v35;
            v145.size.width = v33;
            v145.size.height = height;
            v25 = CGRectGetMinX(v145);
            v146.origin.x = x;
            v146.origin.y = v35;
            v146.size.width = v33;
            v146.size.height = height;
            v57 = CGRectGetMidY(v146);
            v26 = v86;
            MaxX = v86 - dbl_18667F510[vabdd_f64(v57, MaxY) > 20.0];
            v29 = MaxX;
LABEL_36:
            v27 = v57;
            v23 = MaxY;
            goto LABEL_37;
          }
        }
        v113.origin.x = v82;
        v113.origin.y = v83;
        v113.size.width = v87;
        v113.size.height = v11;
        v39 = CGRectGetMinX(v113);
        v40 = v82;
        v41 = v83;
        v42 = v87;
        v43 = v11;
        if (v15 == 1)
        {
          MaxY = CGRectGetMaxY(*(CGRect *)&v40);
          v114.origin.x = x;
          v114.origin.y = y;
          v114.size.width = v33;
          v114.size.height = height;
          v25 = CGRectGetMinX(v114);
          v115.origin.x = x;
          v115.origin.y = v35;
          v115.size.width = v33;
          v115.size.height = height;
          v45 = CGRectGetMinY(v115);
LABEL_34:
          v57 = v45;
          v74 = dbl_18667F510[vabdd_f64(v45, MaxY) > 20.0];
          v26 = v39;
          v29 = v39 - v74;
LABEL_35:
          MaxX = v25 - v74;
          goto LABEL_36;
        }
        MaxY = CGRectGetMidY(*(CGRect *)&v40);
        v143.origin.x = x;
        v143.origin.y = y;
        v143.size.width = v33;
        v143.size.height = height;
        v25 = CGRectGetMinX(v143);
        v75 = x;
        v76 = v35;
        v77 = v33;
        v78 = height;
      }
      v45 = CGRectGetMidY(*(CGRect *)&v75);
      goto LABEL_34;
    }
  }
  v97.origin.x = v14;
  v97.origin.y = v13;
  v97.size.width = v12;
  v97.size.height = v11;
  v20 = CGRectGetMinX(v97);
  v98.origin.x = x;
  v98.origin.y = y;
  v98.size.width = width;
  v98.size.height = height;
  if (v20 >= CGRectGetMinX(v98))
  {
    v123.origin.x = v14;
    v123.origin.y = v13;
    v123.size.width = v12;
    v123.size.height = v11;
    v54 = CGRectGetMinX(v123);
    v124.origin.y = v13;
    v22 = v54;
    v124.origin.x = v14;
    v124.size.width = v12;
    v124.size.height = v11;
    v23 = CGRectGetMaxY(v124);
    v125.origin.x = x;
    v125.origin.y = y;
    v125.size.width = width;
    v125.size.height = height;
    v55 = CGRectGetMaxX(v125);
    v126.origin.y = y;
    v25 = v55;
    v126.origin.x = x;
    v126.size.width = width;
    v26 = v22;
    v126.size.height = height;
    v27 = CGRectGetMaxY(v126);
    v28 = 3.0;
    v29 = v22 + (v25 - v22) / 3.0;
    v30 = 10.0;
  }
  else
  {
    v99.origin.x = v14;
    v99.origin.y = v13;
    v99.size.width = v12;
    v99.size.height = v11;
    v21 = CGRectGetMaxX(v99);
    v100.origin.y = v13;
    v22 = v21;
    v100.origin.x = v14;
    v100.size.width = v12;
    v100.size.height = v11;
    v23 = CGRectGetMinY(v100);
    v101.origin.x = x;
    v101.origin.y = y;
    v101.size.width = width;
    v101.size.height = height;
    v24 = CGRectGetMinX(v101);
    v102.origin.y = y;
    v25 = v24;
    v102.origin.x = x;
    v102.size.width = width;
    v26 = v22;
    v102.size.height = height;
    v27 = CGRectGetMinY(v102);
    v28 = 3.0;
    v29 = v22 + (v25 - v22) / 3.0;
    v30 = -10.0;
  }
  MaxY = v23 + v30;
  MaxX = v25 + (v22 - v25) / v28;
  v57 = v27 + v30;
LABEL_37:
  v80 = objc_alloc_init(UIBezierPath);
  -[UIBezierPath moveToPoint:](v80, "moveToPoint:", v26, v23);
  -[UIBezierPath addCurveToPoint:controlPoint1:controlPoint2:](v80, "addCurveToPoint:controlPoint1:controlPoint2:", v25, v27, v29, MaxY, MaxX, v57);
  if (a5)
  {
    a5->x = v26;
    a5->y = v23;
  }
  if (a6)
  {
    a6->x = v25;
    a6->y = v27;
  }
  return v80;
}

- (id)_calculateArrowHeadPath
{
  UIBezierPath *v2;

  v2 = objc_alloc_init(UIBezierPath);
  -[UIBezierPath setLineCapStyle:](v2, "setLineCapStyle:", 0);
  -[UIBezierPath moveToPoint:](v2, "moveToPoint:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
  -[UIBezierPath addLineToPoint:](v2, "addLineToPoint:", -10.0, 4.5);
  -[UIBezierPath addLineToPoint:](v2, "addLineToPoint:", -10.0, -4.5);
  -[UIBezierPath closePath](v2, "closePath");
  return v2;
}

- (void)_calculatePaths
{
  double x;
  double y;
  double width;
  double height;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  UIBezierPath *v18;
  UIBezierPath *v19;
  __int128 v20;
  double v21;
  double v22;
  double v23;
  UIBezierPath *stemPath;
  UIBezierPath *v25;
  UIBezierPath *arrowHeadPath;
  CGAffineTransform v27;
  CGAffineTransform v28;
  CGAffineTransform v29;
  _QWORD v30[4];
  UIBezierPath *v31;
  uint64_t *v32;
  uint64_t v33;
  __int128 v34;
  uint64_t v35;
  double *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  __int128 v41;
  _QWORD v42[2];
  CGRect v43;
  CGRect v44;

  x = self->_startRect.origin.x;
  y = self->_startRect.origin.y;
  width = self->_startRect.size.width;
  height = self->_startRect.size.height;
  v7 = self->_endRect.origin.x;
  v8 = self->_endRect.origin.y;
  v9 = self->_endRect.size.width;
  v10 = self->_endRect.size.height;
  v43.origin.x = x;
  v43.origin.y = y;
  v43.size.width = width;
  v43.size.height = height;
  if (!CGRectIsEmpty(v43))
  {
    v44.origin.x = v7;
    v44.origin.y = v8;
    v44.size.width = v9;
    v44.size.height = v10;
    if (!CGRectIsEmpty(v44))
    {
      v42[0] = 0;
      v42[1] = 0;
      v41 = 0uLL;
      -[_UIFocusLinearMovementDebugViewLineSegment _calculateStemPathFrom:to:startPoint:endPoint:](self, "_calculateStemPathFrom:to:startPoint:endPoint:", v42, &v41, x, y, width, height, v7, v8, v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIFocusLinearMovementDebugViewLineSegment _flattenedBezierPathFromBezierPath:](self, "_flattenedBezierPathFromBezierPath:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "removeAllPoints");
      objc_msgSend(v11, "setLineCapStyle:", 1);
      -[_UIFocusLinearMovementDebugViewLineSegment _pathElementsFromPath:](self, "_pathElementsFromPath:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "count");
      v35 = 0;
      v36 = (double *)&v35;
      v37 = 0x3010000000;
      v39 = 0;
      v40 = 0;
      v38 = &unk_18685B0AF;
      objc_msgSend(v13, "objectAtIndexedSubscript:", v14 - 2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "point");
      v39 = v16;
      v40 = v17;

      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __61___UIFocusLinearMovementDebugViewLineSegment__calculatePaths__block_invoke;
      v30[3] = &unk_1E16CCAA0;
      v18 = v11;
      v32 = &v35;
      v33 = v14;
      v34 = v41;
      v31 = v18;
      objc_msgSend(v13, "enumerateObjectsUsingBlock:", v30);
      -[_UIFocusLinearMovementDebugViewLineSegment _calculateArrowHeadPath](self, "_calculateArrowHeadPath");
      v19 = (UIBezierPath *)objc_claimAutoreleasedReturnValue();
      memset(&v29, 0, sizeof(v29));
      v20 = v41;
      CGAffineTransformMakeTranslation(&v29, *(CGFloat *)&v41, *((CGFloat *)&v41 + 1));
      v21 = v36[4];
      v22 = *(double *)&v20 - v21;
      if (*(double *)&v20 >= v21)
        v23 = atan((*((double *)&v20 + 1) - v36[5]) / v22);
      else
        v23 = atan((*((double *)&v20 + 1) - v36[5]) / v22) + 3.14159265;
      v27 = v29;
      CGAffineTransformRotate(&v28, &v27, v23);
      v29 = v28;
      -[UIBezierPath applyTransform:](v19, "applyTransform:", &v28);
      -[UIBezierPath setLineWidth:](v18, "setLineWidth:", 2.0);
      stemPath = self->_stemPath;
      self->_stemPath = v18;
      v25 = v18;

      arrowHeadPath = self->_arrowHeadPath;
      self->_arrowHeadPath = v19;

      _Block_object_dispose(&v35, 8);
    }
  }
}

- (id)_pathElementsFromPath:(id)a3
{
  id v3;
  void *v4;
  id v5;
  const CGPath *v6;
  id v7;
  _QWORD block[4];
  id v10;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  v5 = objc_retainAutorelease(v3);
  v6 = (const CGPath *)objc_msgSend(v5, "CGPath");

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68___UIFocusLinearMovementDebugViewLineSegment__pathElementsFromPath___block_invoke;
  block[3] = &unk_1E16CCAC8;
  v7 = v4;
  v10 = v7;
  CGPathApplyWithBlock(v6, block);

  return v7;
}

- (id)_flattenedBezierPathFromBezierPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  _UIFocusLinearMovementDebugViewLineSegment *v12;
  _QWORD *v13;
  _QWORD v14[4];
  __int128 v15;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x3010000000;
  v14[3] = &unk_18685B0AF;
  v15 = *MEMORY[0x1E0C9D538];
  -[_UIFocusLinearMovementDebugViewLineSegment _pathElementsFromPath:](self, "_pathElementsFromPath:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __81___UIFocusLinearMovementDebugViewLineSegment__flattenedBezierPathFromBezierPath___block_invoke;
  v10[3] = &unk_1E16CCAF0;
  v7 = v5;
  v11 = v7;
  v12 = self;
  v13 = v14;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v10);

  v8 = v7;
  _Block_object_dispose(v14, 8);

  return v8;
}

- (void)_subdivideBezier:(id)a3 startPoint:(CGPoint)a4 controlPoint1:(CGPoint)a5 controlPoint2:(CGPoint)a6 endPoint:(CGPoint)a7
{
  double y;
  double x;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;
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
  double v26;
  double v27;
  double v28;
  double v29;
  uint64_t v30;
  double v31;
  double v32;
  double v33;
  uint64_t v34;
  unint64_t v35;
  double v36;
  double v37;
  id v38;

  y = a7.y;
  x = a7.x;
  v9 = a6.y;
  v10 = a6.x;
  v11 = a5.y;
  v12 = a5.x;
  v13 = a4.y;
  v14 = a4.x;
  v15 = a3;
  v36 = x;
  v37 = y;
  v16 = v10 - v12 - (v12 - v14);
  v17 = x - v10 - (v10 - v12);
  v18 = v9 - v11 - (v11 - v13);
  v19 = y - v9 - (v9 - v11);
  v20 = v16 * v16 + v18 * v18;
  if (v20 <= v17 * v17 + v19 * v19)
    v20 = v17 * v17 + v19 * v19;
  v21 = v20 * 9.0 * 0.0625;
  v38 = v15;
  if (v21 > 0.36)
  {
    v22 = v19 - v18;
    v23 = (v11 - v13 + v18) * 3.0 + v22;
    v24 = (v18 + v22) * 6.0;
    v25 = v22 * 6.0;
    v26 = v17 - v16;
    v27 = (v12 - v14 + v16) * 3.0 + v26;
    v28 = (v16 + v26) * 6.0;
    v29 = v26 * 6.0;
    v30 = 1;
    v31 = 0.125;
    v32 = 0.25;
    v33 = 0.5;
    do
    {
      v34 = v30;
      v29 = v29 * 0.125;
      v28 = v28 * 0.25 - v29;
      v27 = v27 * 0.5 - v28 * 0.5;
      v25 = v25 * 0.125;
      v24 = v24 * 0.25 - v25;
      v23 = v23 * 0.5 - v24 * 0.5;
      v30 *= 2;
      v21 = v21 * 0.0625;
    }
    while (v21 > 0.36 && v30 <= 0x10000);
    if (v30 >= 2)
    {
      v35 = (2 * v34) | 1;
      do
      {
        v14 = v14 + v27;
        v27 = v28 + v27;
        v28 = v29 + v28;
        v13 = v23 + v13;
        v23 = v24 + v23;
        v24 = v25 + v24;
        objc_msgSend(v38, "addLineToPoint:", v14, v13, v31, v32, v33);
        v15 = v38;
        --v35;
      }
      while (v35 > 2);
    }
  }
  objc_msgSend(v15, "addLineToPoint:", v36, v37);

}

- (CGRect)startRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_startRect.origin.x;
  y = self->_startRect.origin.y;
  width = self->_startRect.size.width;
  height = self->_startRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)endRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_endRect.origin.x;
  y = self->_endRect.origin.y;
  width = self->_endRect.size.width;
  height = self->_endRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_arrowHeadPath, 0);
  objc_storeStrong((id *)&self->_stemPath, 0);
  objc_storeStrong((id *)&self->_previousSegment, 0);
}

@end
