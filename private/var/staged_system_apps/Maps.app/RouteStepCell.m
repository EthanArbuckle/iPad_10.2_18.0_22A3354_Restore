@implementation RouteStepCell

+ (id)cellWithRoute:(id)a3 stepIndex:(unint64_t)a4 mapType:(unint64_t)a5
{
  id v8;
  id v9;

  v8 = a3;
  v9 = objc_msgSend(objc_alloc((Class)a1), "initWithRoute:stepIndex:mapType:", v8, a4, a5);

  return v9;
}

- (RouteStepCell)initWithRoute:(id)a3 stepIndex:(unint64_t)a4 mapType:(unint64_t)a5
{
  id v8;
  RouteStepCell *v9;
  RouteStepCell *v10;
  UIColor *v11;
  UIColor *routeCenterPrintColor;
  UIColor *v13;
  UIColor *routeOutlinePrintColor;
  UIColor *v15;
  UIColor *blueTextColor;
  objc_super v18;

  v8 = a3;
  v18.receiver = self;
  v18.super_class = (Class)RouteStepCell;
  v9 = -[RouteStepCell init](&v18, "init");
  v10 = v9;
  if (v9)
  {
    -[RouteStepCell setRoute:](v9, "setRoute:", v8);
    -[RouteStepCell setStepIndex:](v10, "setStepIndex:", a4);
    v11 = (UIColor *)objc_msgSend(objc_alloc((Class)UIColor), "initWithRed:green:blue:alpha:", 0.254901961, 0.447058824, 0.811764706, 0.800000012);
    routeCenterPrintColor = v10->_routeCenterPrintColor;
    v10->_routeCenterPrintColor = v11;

    v13 = (UIColor *)objc_msgSend(objc_alloc((Class)UIColor), "initWithRed:green:blue:alpha:", 0.223529412, 0.380392157, 0.694117647, 1.0);
    routeOutlinePrintColor = v10->_routeOutlinePrintColor;
    v10->_routeOutlinePrintColor = v13;

    v15 = (UIColor *)objc_msgSend(objc_alloc((Class)UIColor), "initWithRed:green:blue:alpha:", 0.254901961, 0.435294118, 0.658823529, 1.0);
    blueTextColor = v10->_blueTextColor;
    v10->_blueTextColor = v15;

    v10->_mapType = a5;
  }

  return v10;
}

- (void)setFrame:(CGRect)a3
{
  self->_frame = a3;
}

- (void)setY:(double)a3
{
  self->_frame.origin.y = a3;
}

- (double)y
{
  return self->_frame.origin.y;
}

- (GEOComposedRouteStep)routeStep
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute steps](self->_route, "steps"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", self->_stepIndex));

  return (GEOComposedRouteStep *)v4;
}

- (void)drawPinInRect:(CGRect)a3 zoomLevel:(double)a4
{
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v9;
  id v10;
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
  CGFloat ty;
  CGFloat tx;
  CGFloat v24;
  CGFloat MinY;
  double b;
  double a;
  double d;
  double c;
  double v30;
  double v31;
  uint64_t v32;
  double v33;
  double v34;
  __int128 v35;
  __int128 v36;
  double v37;
  CGFloat height;
  CGFloat sx;
  CGAffineTransform v40;
  CGAffineTransform v41;
  CGRect v42;
  CGRect v43;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  sx = MKZoomScaleForZoomLevelF(self, a2, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepCell routeStep](self, "routeStep"));
  v10 = objc_msgSend(v9, "startCoordinate");
  v13 = MKTilePointForCoordinate(v10, v11, v12, a4);
  v15 = v14;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepCell snapshotImage](self, "snapshotImage"));
  objc_msgSend(v16, "size");
  v18 = v17;
  v20 = v19;

  v21 = v13 - v18 * 0.25;
  v37 = v15 - v20 * 0.25;
  v35 = *(_OWORD *)&CGAffineTransformIdentity.c;
  v36 = *(_OWORD *)&CGAffineTransformIdentity.a;
  tx = CGAffineTransformIdentity.tx;
  ty = CGAffineTransformIdentity.ty;
  v42.origin.x = x;
  v42.origin.y = y;
  v42.size.width = width;
  v42.size.height = height;
  v24 = CGRectGetMinX(v42) - v21;
  v43.origin.x = x;
  v43.origin.y = y;
  v43.size.width = width;
  v43.size.height = height;
  MinY = CGRectGetMinY(v43);
  *(_OWORD *)&v40.a = v36;
  *(_OWORD *)&v40.c = v35;
  v40.tx = tx;
  v40.ty = ty;
  CGAffineTransformTranslate(&v41, &v40, v24, MinY - v37);
  v40 = v41;
  CGAffineTransformScale(&v41, &v40, sx, sx);
  a = v41.a;
  b = v41.b;
  c = v41.c;
  d = v41.d;
  v31 = v41.tx;
  v30 = v41.ty;
  v41.a = 0.0;
  v40.a = 0.0;
  -[GEOComposedRoute _maps_getMapPoints:count:forStep:](self->_route, "_maps_getMapPoints:count:forStep:", &v41, &v40, v9);
  if (*(_QWORD *)&v40.a)
  {
    if (self->_stepIndex)
      v32 = 5;
    else
      v32 = 4;
    v33 = **(double **)&v41.a;
    v34 = *(double *)(*(_QWORD *)&v41.a + 8);
    free(*(void **)&v41.a);
    +[PDFUtilities renderDocumentForType:inRect:](PDFUtilities, "renderDocumentForType:inRect:", v32, v31 + c * v34 + a * v33 + -6.0, v30 + d * v34 + b * v33 + -28.0, 12.0, 28.0);
  }

}

- (BOOL)_lineSegmentsIntersectLineAPoint1:(id)a3 lineAPoint2:(id)a4 lineBPoint1:(id)a5 lineBPoint2:(id)a6 outIntersectionPoint:(id *)a7
{
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  BOOL result;
  double v13;
  double v14;
  double v15;
  double v17;

  v7 = a6.var0 - a5.var0;
  v8 = a6.var1 - a5.var1;
  v9 = a4.var0 - a3.var0;
  v10 = a4.var1 - a3.var1;
  v11 = (a6.var1 - a5.var1) * v9 - v7 * (a4.var1 - a3.var1);
  result = 0;
  if (v11 != 0.0)
  {
    v13 = a3.var1 - a5.var1;
    v14 = a3.var0 - a5.var0;
    v15 = (v7 * v13 - v8 * v14) / v11;
    if (v15 >= 0.0 && v15 <= 1.0)
    {
      v17 = (v9 * v13 - v10 * v14) / v11;
      if (v17 >= 0.0 && v17 <= 1.0)
      {
        a7->var0 = a3.var0 + v15 * v9;
        a7->var1 = a3.var1 + v15 * v10;
        return 1;
      }
    }
  }
  return result;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)_intersectLineWithPoint1:(id)a3 point2:(id)a4 withRect:(id)a5
{
  double var1;
  double v6;
  double var0;
  double v8;
  double v9;
  double v10;
  double v11;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  var1 = a5.var1.var1;
  v6 = a5.var0.var1;
  var0 = a5.var0.var0;
  v8 = a4.var1;
  v9 = a4.var0;
  v10 = a3.var1;
  v11 = a3.var0;
  v13 = a5.var0.var0 + a5.var1.var0;
  v17 = 0.0;
  v18 = 0.0;
  if (!-[RouteStepCell _lineSegmentsIntersectLineAPoint1:lineAPoint2:lineBPoint1:lineBPoint2:outIntersectionPoint:](self, "_lineSegmentsIntersectLineAPoint1:lineAPoint2:lineBPoint1:lineBPoint2:outIntersectionPoint:", &v17))
  {
    v14 = v6 + var1;
    if (!-[RouteStepCell _lineSegmentsIntersectLineAPoint1:lineAPoint2:lineBPoint1:lineBPoint2:outIntersectionPoint:](self, "_lineSegmentsIntersectLineAPoint1:lineAPoint2:lineBPoint1:lineBPoint2:outIntersectionPoint:", &v17, v11, v10, v9, v8, v13, v6, v13, v14)&& !-[RouteStepCell _lineSegmentsIntersectLineAPoint1:lineAPoint2:lineBPoint1:lineBPoint2:outIntersectionPoint:](self, "_lineSegmentsIntersectLineAPoint1:lineAPoint2:lineBPoint1:lineBPoint2:outIntersectionPoint:", &v17, v11, v10, v9, v8,
            var0,
            v14,
            v13,
            v14))
    {
      -[RouteStepCell _lineSegmentsIntersectLineAPoint1:lineAPoint2:lineBPoint1:lineBPoint2:outIntersectionPoint:](self, "_lineSegmentsIntersectLineAPoint1:lineAPoint2:lineBPoint1:lineBPoint2:outIntersectionPoint:", &v17, v11, v10, v9, v8, var0, v6, var0, v14);
    }
  }
  v15 = v17;
  v16 = v18;
  result.var1 = v16;
  result.var0 = v15;
  return result;
}

- (CGPoint)_cgPointApplyAffineTransform:(CGPoint)a3 :(CGAffineTransform *)a4 :(CGAffineTransform *)a5 :(CGAffineTransform *)a6
{
  CGFloat v6;
  CGFloat v7;
  float64x2_t v8;
  double v9;
  CGPoint result;

  v6 = a4->tx + a3.y * a4->c + a4->a * a3.x;
  v7 = a4->ty + a3.y * a4->d + a4->b * a3.x;
  v8 = vaddq_f64(*(float64x2_t *)&a6->tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&a6->c, a5->ty + v7 * a5->d + a5->b * v6), *(float64x2_t *)&a6->a, a5->tx + v7 * a5->c + a5->a * v6));
  v9 = v8.f64[1];
  result.x = v8.f64[0];
  result.y = v9;
  return result;
}

- (void)drawRouteLineInRect:(CGRect)a3 zoomLevel:(double)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v10;
  uint64_t v11;
  CGContext *CurrentContext;
  CGPath *Mutable;
  void *v14;
  id v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  MKMapPoint v28;
  MKMapPoint v29;
  uint64_t v30;
  uint64_t v31;
  double v32;
  CGFloat b;
  CGFloat c;
  CGFloat d;
  CGFloat v36;
  CGFloat MinY;
  CGFloat a;
  CGFloat v39;
  CGFloat v40;
  CGFloat v41;
  CGFloat v42;
  CGFloat v43;
  CGFloat v44;
  unsigned int v45;
  double *v46;
  double v47;
  double v48;
  unint64_t v49;
  double v50;
  CGFloat v51;
  CGFloat v52;
  double v53;
  double v54;
  double *v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  BOOL v62;
  char v63;
  uint64_t v64;
  unint64_t v65;
  CGFloat v66;
  CGFloat v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  CGFloat v74;
  CGFloat v75;
  double v76;
  double v77;
  double v78;
  double v79;
  float v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  CGFloat v87;
  id v88;
  NSObject *v89;
  id v90;
  NSObject *v91;
  void *v92;
  double v93;
  double v94;
  double v95;
  double v96;
  CGFloat v97;
  CGFloat v98;
  CGFloat v99;
  CGFloat v100;
  CGFloat ty;
  double sx;
  CGFloat txa;
  CGFloat tx;
  CGFloat v105;
  double v106;
  CGFloat v107;
  CGFloat v108;
  __int128 v109;
  CGFloat v110;
  double v111;
  CGFloat v112;
  double v113;
  __int128 v114;
  double v115;
  double v116;
  __int128 v117;
  double v118;
  CGAffineTransform v119;
  CGAffineTransform v120;
  CGAffineTransform v121;
  CGAffineTransform v122;
  unint64_t v123;
  char *v124;
  CGAffineTransform v125;
  CLLocationCoordinate2D v126;
  CLLocationCoordinate2D v127;
  MKMapPoint v128;
  MKMapPoint v129;
  CGRect v130;
  MKMapRect v131;
  MKMapRect v132;
  CGRect v133;
  MKMapRect v134;
  MKMapRect v135;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v123 = 0;
  v124 = 0;
  v10 = -[GEOComposedRoute _maps_getMapPoints:count:](self->_route, "_maps_getMapPoints:count:", &v124, &v123);
  if (v123)
    goto LABEL_2;
  v88 = sub_1004318FC();
  v89 = objc_claimAutoreleasedReturnValue(v88);
  if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR))
  {
    LODWORD(v125.a) = 136315906;
    *(_QWORD *)((char *)&v125.a + 4) = "-[RouteStepCell drawRouteLineInRect:zoomLevel:]";
    WORD2(v125.b) = 2080;
    *(_QWORD *)((char *)&v125.b + 6) = "RouteStepCell.m";
    HIWORD(v125.c) = 1024;
    LODWORD(v125.d) = 239;
    WORD2(v125.d) = 2080;
    *(_QWORD *)((char *)&v125.d + 6) = "count > 0";
    _os_log_impl((void *)&_mh_execute_header, v89, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v125, 0x26u);
  }

  v10 = sub_100A70734();
  if ((_DWORD)v10)
  {
    v90 = sub_1004318FC();
    v91 = objc_claimAutoreleasedReturnValue(v90);
    if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR))
    {
      v92 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
      LODWORD(v125.a) = 138412290;
      *(_QWORD *)((char *)&v125.a + 4) = v92;
      _os_log_impl((void *)&_mh_execute_header, v91, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v125, 0xCu);

    }
  }
  if (v123)
  {
LABEL_2:
    sx = MKZoomScaleForZoomLevelF(v10, v11, a4);
    CurrentContext = UIGraphicsGetCurrentContext();
    CGContextSaveGState(CurrentContext);
    CGContextSetLineCap(CurrentContext, kCGLineCapRound);
    CGContextSetLineJoin(CurrentContext, kCGLineJoinRound);
    v130.origin.x = x;
    v130.origin.y = y;
    v130.size.width = width;
    v130.size.height = height;
    CGContextClipToRect(CurrentContext, v130);
    Mutable = CGPathCreateMutable();
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepCell routeStep](self, "routeStep"));
    v15 = objc_msgSend(v14, "startCoordinate");
    v116 = height;
    v18 = MKTilePointForCoordinate(v15, v16, v17, a4);
    v113 = width;
    v20 = v19;
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepCell snapshotImage](self, "snapshotImage"));
    objc_msgSend(v21, "size");
    v111 = y;
    v23 = v22;
    v106 = x;
    v25 = v24;

    v26 = v18 - v23 * 0.5;
    v27 = v20 - v25 * 0.5;
    objc_msgSend(v14, "startCoordinate");
    v28 = MKMapPointForCoordinate(v126);
    v127.latitude = MKCoordinateForTilePoint(v26, v27, a4);
    v29 = MKMapPointForCoordinate(v127);
    v32 = 10.0 / MKZoomScaleForZoomLevelF(v30, v31, a4);
    v131.origin.x = v29.x;
    v131.origin.y = v29.y;
    v131.size.width = v28.x - v29.x + v28.x - v29.x;
    v131.size.height = v28.y - v131.origin.y + v28.y - v131.origin.y;
    v132 = MKMapRectInset(v131, v32, v32);
    v95 = v132.origin.y;
    v96 = v132.origin.x;
    v93 = v132.size.height;
    v94 = v132.size.width;
    b = CGAffineTransformIdentity.b;
    c = CGAffineTransformIdentity.c;
    d = CGAffineTransformIdentity.d;
    v36 = CGAffineTransformIdentity.tx;
    ty = CGAffineTransformIdentity.ty;
    v132.origin.x = v106;
    v132.origin.y = v111;
    v132.size.width = v113;
    v132.size.height = v116;
    txa = CGRectGetMinX((CGRect)v132) - v26;
    v133.origin.x = v106;
    v133.origin.y = v111;
    v133.size.width = v113;
    v133.size.height = v116;
    MinY = CGRectGetMinY(v133);
    v122.a = CGAffineTransformIdentity.a;
    v122.b = b;
    v99 = c;
    v100 = b;
    v122.c = c;
    v122.d = d;
    v97 = v36;
    v98 = d;
    v122.tx = v36;
    v122.ty = ty;
    CGAffineTransformTranslate(&v125, &v122, txa, MinY - v27);
    v122 = v125;
    CGAffineTransformScale(&v125, &v122, sx, sx);
    a = v125.a;
    v39 = v125.b;
    v41 = v125.c;
    v40 = v125.d;
    v42 = v125.tx;
    v112 = v125.ty;
    v43 = v125.tx + v29.y * v125.c + v125.a * v29.x;
    v44 = v125.ty + v29.y * v125.d + v125.b * v29.x;
    v114 = *(_OWORD *)&CGAffineTransformIdentity.c;
    v117 = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&v125.a = v117;
    *(_OWORD *)&v125.c = v114;
    v109 = *(_OWORD *)&CGAffineTransformIdentity.tx;
    *(_OWORD *)&v125.tx = v109;
    *(_OWORD *)&v122.a = v117;
    *(_OWORD *)&v122.c = v114;
    *(_OWORD *)&v122.tx = v109;
    CGAffineTransformTranslate(&v125, &v122, -v43, -v44);
    *(_OWORD *)&v122.a = v117;
    *(_OWORD *)&v122.c = v114;
    *(_OWORD *)&v122.tx = v109;
    *(_OWORD *)&v121.a = v117;
    *(_OWORD *)&v121.c = v114;
    *(_OWORD *)&v121.tx = v109;
    CGAffineTransformTranslate(&v122, &v121, v43, v44);
    v120 = v122;
    CGAffineTransformScale(&v121, &v120, 0.5, 0.5);
    v122 = v121;
    v45 = objc_msgSend(v14, "startPointIndex");
    v46 = (double *)&v124[16 * v45];
    v47 = *v46;
    v48 = v46[1];
    v49 = v45;
    v105 = a;
    v107 = v39;
    v121.a = a;
    v121.b = v39;
    v108 = v40;
    v110 = v41;
    v121.c = v41;
    v121.d = v40;
    tx = v42;
    v121.tx = v42;
    v121.ty = v112;
    v120 = v125;
    v119 = v122;
    -[RouteStepCell _cgPointApplyAffineTransform::::](self, "_cgPointApplyAffineTransform::::", &v121, &v120, &v119, v47, v48);
    v50 = 0.0;
    CGPathAddArc(Mutable, 0, v51, v52, 1.0, 0.0, 6.28318548, 1);
    if (v49 + 1 >= v123)
    {
      v56 = v47;
      v71 = v48;
      v73 = 10.0 / sx;
    }
    else
    {
      v53 = v48;
      v54 = v47;
      v55 = (double *)&v124[16 * v49 + 16];
      v56 = *v55;
      v57 = v55[1];
      v59 = v95;
      v58 = v96;
      v134.origin.x = v96;
      v134.origin.y = v95;
      v61 = v93;
      v60 = v94;
      v134.size.width = v94;
      v134.size.height = v93;
      v128.x = *v55;
      v128.y = v57;
      v62 = MKMapRectContainsPoint(v134, v128);
      v63 = 0;
      v64 = 16 * v49;
      v118 = 0.0;
      do
      {
        v65 = v49++;
        v121.a = v105;
        v121.b = v107;
        v121.c = v110;
        v121.d = v108;
        v121.tx = tx;
        v121.ty = v112;
        v115 = sqrt((v56 - v54) * (v56 - v54) + (v57 - v53) * (v57 - v53));
        v120 = v125;
        v119 = v122;
        -[RouteStepCell _cgPointApplyAffineTransform::::](self, "_cgPointApplyAffineTransform::::", &v121, &v120, &v119, v56, v57, *(_QWORD *)&v93, *(_QWORD *)&v94, *(_QWORD *)&v95, *(_QWORD *)&v96);
        CGPathAddLineToPoint(Mutable, 0, v66, v67);
        if (v49 < v123 - 1)
        {
          v54 = v56;
          v53 = v57;
        }
        v118 = v118 + v115;
        if (v65 + 2 >= v123)
        {
          v71 = v57;
          v73 = 10.0 / sx;
          v47 = v54;
          v48 = v53;
          v50 = v118;
          goto LABEL_16;
        }
        v63 |= v62;
        v56 = *(double *)&v124[v64 + 32];
        v57 = *(double *)&v124[v64 + 40];
        v135.origin.x = v58;
        v135.origin.y = v59;
        v135.size.width = v60;
        v135.size.height = v61;
        v129.x = v56;
        v129.y = v57;
        v62 = MKMapRectContainsPoint(v135, v129);
        v64 += 16;
      }
      while (v62 || (v63 & 1) == 0);
      v68 = v54;
      v48 = v53;
      v47 = v68;
      -[RouteStepCell _intersectLineWithPoint1:point2:withRect:](self, "_intersectLineWithPoint1:point2:withRect:");
      v56 = v69;
      v71 = v70;
      v72 = sqrt((v69 - v47) * (v69 - v47) + (v70 - v53) * (v70 - v53));
      v73 = 10.0 / sx;
      if (v49 < 2 || v72 >= 10.0 / sx)
      {
        v121.a = v105;
        v121.b = v107;
        v121.c = v110;
        v121.d = v108;
        v121.tx = tx;
        v121.ty = v112;
        v120 = v125;
        v119 = v122;
        -[RouteStepCell _cgPointApplyAffineTransform::::](self, "_cgPointApplyAffineTransform::::", &v121, &v120, &v119, v69, v70);
        CGPathAddLineToPoint(Mutable, 0, v74, v75);
      }
      else
      {
        v56 = v47;
        v71 = v53;
        v47 = *(double *)&v124[v64 - 16];
        v48 = *(double *)&v124[v64 - 8];
      }
      v50 = v118 + v72;
    }
LABEL_16:
    free(v124);
    if (v50 > v73)
    {
      v121.a = v105;
      v121.b = v107;
      v121.c = v110;
      v121.d = v108;
      v121.tx = tx;
      v121.ty = v112;
      v120 = v125;
      v119 = v122;
      -[RouteStepCell _cgPointApplyAffineTransform::::](self, "_cgPointApplyAffineTransform::::", &v121, &v120, &v119, v56, v71);
      v77 = v76;
      v79 = v78;
      v80 = atan2(v71 - v48, v56 - v47);
      v120.a = CGAffineTransformIdentity.a;
      v120.b = v100;
      v120.c = v99;
      v120.d = v98;
      v120.tx = v97;
      v120.ty = ty;
      CGAffineTransformRotate(&v121, &v120, v80);
      v81 = v121.a;
      v82 = v121.b;
      v83 = v121.c;
      v84 = v121.d;
      v85 = v121.tx;
      v86 = v121.ty;
      CGPathAddLineToPoint(Mutable, 0, v77 + v121.tx + v121.c * -3.0 + v121.a * -5.0, v79 + v121.ty + v121.d * -3.0 + v121.b * -5.0);
      CGPathMoveToPoint(Mutable, 0, v77, v79);
      CGPathAddLineToPoint(Mutable, 0, v77 + v85 + v83 * 3.0 + v81 * -5.0, v79 + v86 + v84 * 3.0 + v82 * -5.0);
    }
    v87 = sx * MKRoadWidthAtZoomScale(sx) * 0.25;
    CGContextSaveGState(CurrentContext);
    CGContextBeginPath(CurrentContext);
    CGContextAddPath(CurrentContext, Mutable);
    CGContextSetLineWidth(CurrentContext, v87);
    CGContextSetStrokeColorWithColor(CurrentContext, -[UIColor CGColor](self->_routeOutlinePrintColor, "CGColor"));
    CGContextStrokePath(CurrentContext);
    CGContextRestoreGState(CurrentContext);
    CGContextSaveGState(CurrentContext);
    CGContextBeginPath(CurrentContext);
    CGContextAddPath(CurrentContext, Mutable);
    CGContextSetLineWidth(CurrentContext, v87 + -1.0);
    CGContextSetStrokeColorWithColor(CurrentContext, -[UIColor CGColor](self->_routeCenterPrintColor, "CGColor"));
    CGContextSetCompositeOperation(CurrentContext, 14);
    CGContextStrokePath(CurrentContext);
    CGContextRestoreGState(CurrentContext);
    CGContextRestoreGState(CurrentContext);
    CGPathRelease(Mutable);

  }
}

- (double)_textLayoutHeightForLines:(id)a3
{
  id v4;
  double MinX;
  double MaxX;
  double Height;
  id v8;
  id v9;
  id v10;
  double v11;
  uint64_t v12;
  double v13;
  void *i;
  void *v15;
  uint64_t v16;
  void *v17;
  double v18;
  double v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v4 = a3;
  MinX = CGRectGetMinX(self->_frame);
  MaxX = CGRectGetMaxX(self->_frame);
  Height = CGRectGetHeight(self->_frame);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v8 = v4;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v9)
  {
    v10 = v9;
    v11 = MaxX - (MinX + 135.0);
    v12 = *(_QWORD *)v22;
    v13 = 0.0;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v12)
          objc_enumerationMutation(v8);
        v15 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        v16 = objc_opt_class(NSString);
        if ((objc_opt_isKindOfClass(v15, v16) & 1) != 0)
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 13.5, (_QWORD)v21));
          objc_msgSend(v15, "_maps_sizeWithFont:constrainedToSize:options:", v17, 1, v11, Height);
          v19 = v18;

          v13 = v13 + v19;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v10);
  }
  else
  {
    v13 = 0.0;
  }

  return v13;
}

- (unint64_t)numberOfSteps
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute steps](self->_route, "steps"));
  v3 = objc_msgSend(v2, "count");

  return (unint64_t)v3;
}

- (id)instructionStringsArray
{
  GEOComposedRoute *route;
  void *v3;
  void *v4;

  route = self->_route;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepCell routeStep](self, "routeStep"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[RouteMiddleStepLabelListView stringsForRoute:step:tableMode:isPrinting:](RouteMiddleStepLabelListView, "stringsForRoute:step:tableMode:isPrinting:", route, v3, 0, 1));

  return v4;
}

- (void)drawInRect:(CGRect)a3
{
  double MinX;
  double v5;
  char *stepIndex;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  BOOL v13;
  double v14;
  double v15;
  double MinY;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  double v25;
  double Width;
  double v27;
  uint64_t v28;
  id v29;
  id v30;
  id v31;
  double v32;
  uint64_t v33;
  void *i;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  void *v52;
  char *v53;
  void *v54;
  void *v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];

  MinX = CGRectGetMinX(self->_frame);
  v5 = CGRectGetMinX(self->_frame) + 35.0;
  stepIndex = (char *)self->_stepIndex;
  if (!stepIndex)
  {
    v20 = 4;
LABEL_10:
    +[PDFUtilities renderDocumentForType:inRect:](PDFUtilities, "renderDocumentForType:inRect:", v20, MinX + 4.0, CGRectGetMinY(self->_frame), 14.0, 31.0);
    goto LABEL_11;
  }
  if (stepIndex >= (char *)-[RouteStepCell numberOfSteps](self, "numberOfSteps") - 1)
  {
    if (self->_stepIndex)
      v20 = 5;
    else
      v20 = 4;
    goto LABEL_10;
  }
  -[UIColor set](self->_blueTextColor, "set");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lu"), self->_stepIndex));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 37.0));
  objc_msgSend(v7, "_maps_sizeWithFont:", v8);
  v10 = MinX + 10.0 + v9 * -0.5;
  v11 = v9 + v10;
  v12 = v5 + -5.0 - v11;
  v13 = v11 <= v5 + -5.0;
  v14 = -0.0;
  if (!v13)
    v14 = v12;
  v15 = v10 + v14;
  MinY = CGRectGetMinY(self->_frame);
  objc_msgSend(v8, "ascender");
  v18 = v17;
  objc_msgSend(v8, "capHeight");
  objc_msgSend(v7, "_maps_drawAtPoint:withFont:", v8, v15, MinY - (v18 - v19));

LABEL_11:
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepCell instructionStringsArray](self, "instructionStringsArray"));
  v22 = CGRectGetMinY(self->_frame);
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor darkGrayColor](UIColor, "darkGrayColor"));
  objc_msgSend(v23, "set");

  v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 13.5));
  v25 = CGRectGetHeight(self->_frame) + 5.0;
  Width = CGRectGetWidth(self->_frame);
  -[RouteStepCell _textLayoutHeightForLines:](self, "_textLayoutHeightForLines:", v21);
  if (v27 > v25)
  {
    v28 = objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 11.0));

    v24 = (void *)v28;
  }
  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  v29 = v21;
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
  if (v30)
  {
    v31 = v30;
    v32 = Width + -135.0;
    v33 = *(_QWORD *)v57;
    do
    {
      for (i = 0; i != v31; i = (char *)i + 1)
      {
        if (*(_QWORD *)v57 != v33)
          objc_enumerationMutation(v29);
        v35 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * (_QWORD)i);
        v36 = objc_opt_class(UIColor);
        if ((objc_opt_isKindOfClass(v35, v36) & 1) != 0)
        {
          objc_msgSend(v35, "set");
        }
        else
        {
          v37 = objc_opt_class(NSString);
          if ((objc_opt_isKindOfClass(v35, v37) & 1) != 0)
          {
            if (v22 == CGRectGetMinY(self->_frame))
            {
              objc_msgSend(v24, "ascender");
              v39 = v38;
              objc_msgSend(v24, "capHeight");
              v22 = v22 - (v39 - v40);
            }
            objc_msgSend(v35, "_maps_sizeWithFont:constrainedToSize:options:", v24, 1, v32, v25);
            v42 = v41;
            objc_msgSend(v35, "_maps_drawInRect:withFont:", v24, CGRectGetMinX(self->_frame) + 135.0, v22, v32, v25);
            v22 = v22 + v42;
          }
        }
      }
      v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
    }
    while (v31);
  }

  v43 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepCell snapshotImage](self, "snapshotImage"));
  if (v43)
  {
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepCell snapshotImage](self, "snapshotImage"));
    objc_msgSend(v44, "size");
    v46 = v45;
    v48 = v47;

    v49 = CGRectGetMinY(self->_frame);
    v50 = v46 * 0.5;
    v51 = v48 * 0.5;
    v52 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepCell snapshotImage](self, "snapshotImage"));
    objc_msgSend(v52, "drawInRect:", v5, v49, v50, v51);

    v53 = (char *)self->_stepIndex;
    if (v53 && v53 < (char *)-[RouteStepCell numberOfSteps](self, "numberOfSteps") - 1)
      -[RouteStepCell drawRouteLineInRect:zoomLevel:](self, "drawRouteLineInRect:zoomLevel:", v5, v49, v50, v51, 16.0);
    else
      -[RouteStepCell drawPinInRect:zoomLevel:](self, "drawPinInRect:zoomLevel:", v5, v49, v50, v51, 16.0);
    v54 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor lightGrayColor](UIColor, "lightGrayColor"));
    objc_msgSend(v54, "set");

    v55 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:", v5, v49, v50, v51));
    objc_msgSend(v55, "stroke");

  }
}

- (id)snapshotBlock
{
  id v3;
  _QWORD v5[5];
  id v6;
  id location;

  objc_initWeak(&location, self);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100401F34;
  v5[3] = &unk_1011AD1E8;
  objc_copyWeak(&v6, &location);
  v5[4] = self;
  v3 = objc_msgSend(v5, "copy");
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  return v3;
}

- (UIImage)snapshotImage
{
  return -[MKMapSnapshot image](self->_snapshot, "image");
}

- (void)releaseSnapshotCreator
{
  MKMapSnapshotter *snapshotter;

  snapshotter = self->_snapshotter;
  self->_snapshotter = 0;

}

- (void)dealloc
{
  objc_super v3;

  -[RouteStepCell releaseSnapshotCreator](self, "releaseSnapshotCreator");
  v3.receiver = self;
  v3.super_class = (Class)RouteStepCell;
  -[RouteStepCell dealloc](&v3, "dealloc");
}

- (GEOComposedRoute)route
{
  return self->_route;
}

- (void)setRoute:(id)a3
{
  objc_storeStrong((id *)&self->_route, a3);
}

- (unint64_t)stepIndex
{
  return self->_stepIndex;
}

- (void)setStepIndex:(unint64_t)a3
{
  self->_stepIndex = a3;
}

- (CGRect)frame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_frame.origin.x;
  y = self->_frame.origin.y;
  width = self->_frame.size.width;
  height = self->_frame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (int64_t)page
{
  return self->_page;
}

- (void)setPage:(int64_t)a3
{
  self->_page = a3;
}

- (BOOL)hasSnapshot
{
  return self->_hasSnapshot;
}

- (unint64_t)mapType
{
  return self->_mapType;
}

- (void)setMapType:(unint64_t)a3
{
  self->_mapType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blueTextColor, 0);
  objc_storeStrong((id *)&self->_routeOutlinePrintColor, 0);
  objc_storeStrong((id *)&self->_routeCenterPrintColor, 0);
  objc_storeStrong((id *)&self->_snapshotter, 0);
  objc_storeStrong((id *)&self->_snapshot, 0);
  objc_storeStrong((id *)&self->_route, 0);
}

@end
