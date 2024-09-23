@implementation TSDBrushStroke

+ (Class)mutableClass
{
  return (Class)objc_opt_class();
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  TSDMutableBrushStroke *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  double v12;
  TSDMutableBrushStroke *v13;

  v4 = [TSDMutableBrushStroke alloc];
  -[TSDSmartStroke strokeName](self, "strokeName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSDStroke color](self, "color");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSDStroke width](self, "width");
  v8 = v7;
  v9 = -[TSDBrushStroke cap](self, "cap");
  v10 = -[TSDStroke join](self, "join");
  -[TSDStroke pattern](self, "pattern");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSDStroke miterLimit](self, "miterLimit");
  v13 = -[TSDBrushStroke initWithName:color:width:cap:join:pattern:miterLimit:](v4, "initWithName:color:width:cap:join:pattern:miterLimit:", v5, v6, v9, v10, v11, v8, v12);

  return v13;
}

- (TSDBrushStroke)initWithName:(id)a3 color:(id)a4 width:(double)a5 cap:(int)a6 join:(int)a7 pattern:(id)a8 miterLimit:(double)a9
{
  uint64_t v11;
  uint64_t v12;
  id v16;
  id v17;
  id v18;
  TSDBrushStroke *v19;
  TSDBrushStroke *v20;
  objc_super v22;

  v11 = *(_QWORD *)&a7;
  v12 = *(_QWORD *)&a6;
  v16 = a3;
  v17 = a4;
  v18 = a8;
  v22.receiver = self;
  v22.super_class = (Class)TSDBrushStroke;
  v19 = -[TSDSmartStroke initWithName:color:width:cap:join:pattern:miterLimit:](&v22, sel_initWithName_color_width_cap_join_pattern_miterLimit_, v16, v17, v12, v11, v18, a5, a9);
  v20 = v19;
  if (v19)
    -[TSDBrushStroke i_setCap:](v19, "i_setCap:", 1);

  return v20;
}

- (TSDBrushStroke)initWithArchive:(const StrokeArchive *)a3 unarchiver:(id)a4
{
  id v6;
  TSDBrushStroke *v7;
  TSDBrushStroke *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)TSDBrushStroke;
  v7 = -[TSDBrushStroke initWithArchive:unarchiver:](&v10, sel_initWithArchive_unarchiver_, a3, v6);
  v8 = v7;
  if (v7)
    -[TSDBrushStroke i_setCap:](v7, "i_setCap:", 1);

  return v8;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSDSmartStroke strokeName](self, "strokeName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSDStroke width](self, "width");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p strokeName='%@' width=%f>"), v5, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (double)lineEndInsetAdjustment
{
  return 0.0;
}

- (double)suggestedMinimumLineWidth
{
  return 8.0;
}

- (BOOL)canApplyToShapeRenderable
{
  return 1;
}

- (BOOL)prefersToApplyToShapeRenderableDuringManipulation
{
  return 0;
}

- (BOOL)drawsInOneStep
{
  return 0;
}

+ (BOOL)brushStrokeUsesMetal
{
  void *v2;
  char v3;

  +[TSDCapabilities currentCapabilities](TSDCapabilities, "currentCapabilities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isMetalCapable");

  return v3;
}

- (BOOL)supportsPattern
{
  return 0;
}

- (int)cap
{
  int v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = -[TSDStroke i_cap](self, "i_cap");
  if (v2 != 1)
  {
    objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDBrushStroke cap]");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDBrushStroke.mm");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, v5, 295, CFSTR("TSDBrushStroke should only ever have a round cap."));

  }
  return v2;
}

- (void)i_setCap:(int)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSDBrushStroke;
  -[TSDStroke i_setCap:](&v3, sel_i_setCap_, 1);
}

- (double)horizontalMarginForSwatch
{
  double v3;
  double v4;
  void *v5;
  int v6;
  double result;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TSDBrushStroke;
  -[TSDStroke horizontalMarginForSwatch](&v8, sel_horizontalMarginForSwatch);
  v4 = v3;
  -[TSDSmartStroke strokeName](self, "strokeName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("Pen"));

  result = 7.0;
  if (!v6)
    return v4;
  return result;
}

- (BOOL)needsToExtendJoinsForBoundsCalculation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  +[TSDBrushStrokeLoader brushStrokeLoaderForCurrentThread](TSDBrushStrokeLoader, "brushStrokeLoaderForCurrentThread");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSDSmartStroke strokeName](self, "strokeName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "optionsForStroke:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("split-at-sharp-angles"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  return v7;
}

- (id)strokeLineEnd:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v4 = a3;
  if (objc_msgSend(v4, "isNone"))
  {
    v5 = v4;
  }
  else
  {
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "rangeOfString:", CFSTR(":"));
    if (v7 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v6, "substringFromIndex:", v7 + v8);
      v9 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v9;
    }
    +[TSDBrushStrokeLoader brushStrokeLoaderForCurrentThread](TSDBrushStrokeLoader, "brushStrokeLoaderForCurrentThread");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[TSDSmartStroke strokeName](self, "strokeName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "lineEnd:forStroke:", v6, v11);
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (void)paintLineEnd:(id)a3 atPoint:(CGPoint)a4 atAngle:(double)a5 withScale:(double)a6 inContext:(CGContext *)a7 useFastDrawing:(BOOL)a8
{
  _BOOL4 v8;
  double y;
  double x;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  objc_super v23;
  objc_super v24;

  v8 = a8;
  y = a4.y;
  x = a4.x;
  v15 = a3;
  v16 = v15;
  if (v8)
  {
    objc_msgSend(v15, "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "rangeOfString:", CFSTR(":"));
    if (v18 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v17, "substringFromIndex:", v18 + v19);
      v20 = objc_claimAutoreleasedReturnValue();

      +[TSDLineEnd lineEndWithIdentifier:](TSDLineEnd, "lineEndWithIdentifier:", v20);
      v21 = objc_claimAutoreleasedReturnValue();

      v17 = (void *)v20;
      v16 = (void *)v21;
    }
    v24.receiver = self;
    v24.super_class = (Class)TSDBrushStroke;
    -[TSDStroke paintLineEnd:atPoint:atAngle:withScale:inContext:useFastDrawing:](&v24, sel_paintLineEnd_atPoint_atAngle_withScale_inContext_useFastDrawing_, v16, a7, 1, x, y, a5, a6);

  }
  else
  {
    -[TSDBrushStroke strokeLineEnd:](self, "strokeLineEnd:", v15);
    v22 = objc_claimAutoreleasedReturnValue();

    v23.receiver = self;
    v23.super_class = (Class)TSDBrushStroke;
    v16 = (void *)v22;
    -[TSDStroke paintLineEnd:atPoint:atAngle:withScale:inContext:useFastDrawing:](&v23, sel_paintLineEnd_atPoint_atAngle_withScale_inContext_useFastDrawing_, v22, a7, 0, x, y, a5, a6);
  }

}

- (void)paintPath:(CGPath *)a3 directlyUsingContext:(id)a4 withLayoutOptions:(id)a5
{
  -[TSDBrushStroke p_rasterBrushPath:inContext:orDirectly:parameterized:shouldReverseDrawOrder:withLayoutOptions:](self, "p_rasterBrushPath:inContext:orDirectly:parameterized:shouldReverseDrawOrder:withLayoutOptions:", a3, 0, a4, 0, 0, a5);
}

- (void)paintPath:(CGPath *)a3 wantsInteriorStroke:(BOOL)a4 inContext:(CGContext *)a5 useFastDrawing:(BOOL)a6 parameterized:(BOOL)a7 shouldReverseDrawOrder:(BOOL)a8
{
  _BOOL8 v8;
  _BOOL8 v9;
  _BOOL8 v10;
  _BOOL8 v12;
  TSDBrushStrokeLayoutOptions *v15;

  v8 = a8;
  v9 = a7;
  v10 = a6;
  v12 = a4;
  v15 = objc_alloc_init(TSDBrushStrokeLayoutOptions);
  -[TSDBrushStroke paintPath:wantsInteriorStroke:inContext:useFastDrawing:parameterized:shouldReverseDrawOrder:withLayoutOptions:](self, "paintPath:wantsInteriorStroke:inContext:useFastDrawing:parameterized:shouldReverseDrawOrder:withLayoutOptions:", a3, v12, a5, v10, v9, v8, v15);

}

- (void)paintPath:(CGPath *)a3 wantsInteriorStroke:(BOOL)a4 inContext:(CGContext *)a5 useFastDrawing:(BOOL)a6 parameterized:(BOOL)a7 shouldReverseDrawOrder:(BOOL)a8 withLayoutOptions:(id)a9
{
  _BOOL8 v9;
  _BOOL8 v10;
  _BOOL4 v11;
  _BOOL8 v13;
  id v16;
  objc_super v17;

  v9 = a8;
  v10 = a7;
  v11 = a6;
  v13 = a4;
  v16 = a9;
  if (v11)
  {
    v17.receiver = self;
    v17.super_class = (Class)TSDBrushStroke;
    -[TSDStroke paintPath:wantsInteriorStroke:inContext:useFastDrawing:parameterized:shouldReverseDrawOrder:](&v17, sel_paintPath_wantsInteriorStroke_inContext_useFastDrawing_parameterized_shouldReverseDrawOrder_, a3, v13, a5, 1, v10, v9);
  }
  else if (-[TSDStroke shouldRender](self, "shouldRender"))
  {
    if (-[TSDBrushStroke p_shouldDrawAsVectorInContext:](self, "p_shouldDrawAsVectorInContext:", a5))
      -[TSDBrushStroke p_brushPath:inContext:orDirectly:parameterized:drawRasterized:shouldReverseDrawOrder:withLayoutOptions:](self, "p_brushPath:inContext:orDirectly:parameterized:drawRasterized:shouldReverseDrawOrder:withLayoutOptions:", a3, a5, 0, v10, 0, 0, v16);
    else
      -[TSDBrushStroke p_rasterBrushPath:inContext:orDirectly:parameterized:shouldReverseDrawOrder:withLayoutOptions:](self, "p_rasterBrushPath:inContext:orDirectly:parameterized:shouldReverseDrawOrder:withLayoutOptions:", a3, a5, 0, v10, v9, v16);
  }

}

- (void)p_brushPath:(CGPath *)a3 inContext:(CGContext *)a4 orDirectly:(id)a5 parameterized:(BOOL)a6 drawRasterized:(BOOL)a7 shouldReverseDrawOrder:(BOOL)a8 withLayoutOptions:(id)a9
{
  _BOOL4 v9;
  _BOOL4 v10;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;
  double v16;
  void *v17;
  double v18;
  void *v19;
  uint64_t v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  double v36;
  unint64_t v37;
  double v38;
  unint64_t v39;
  double v40;
  uint64_t v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
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
  double v58;
  void *v59;
  BOOL v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  int v66;
  _OWORD *v67;
  unint64_t v68;
  _OWORD *v69;
  double v70;
  double v71;
  double v72;
  char *v73;
  uint64_t v74;
  unint64_t v75;
  uint64_t v76;
  unint64_t v77;
  char *v78;
  void **v79;
  char *v80;
  char *v81;
  char *v82;
  __int128 v83;
  char *v84;
  unint64_t v85;
  uint64_t v86;
  void *v87;
  BOOL v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  int v94;
  unint64_t v95;
  _OWORD *v96;
  _OWORD *v97;
  char *v98;
  uint64_t v99;
  unint64_t v100;
  uint64_t v101;
  unint64_t v102;
  char *v103;
  void **v104;
  char *v105;
  char *v106;
  char *v107;
  __int128 v108;
  char *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  _BOOL4 v118;
  _BOOL4 v119;
  double v120;
  double v121;
  double v122;
  double v123;
  void *v125;
  _BOOL4 v126;
  id v127;
  void **v128;
  uint64_t v129;
  int v130;
  id v132;
  id v133[3];
  __int128 v134;
  uint64_t v135;
  CGAffineTransform v136;
  double v137[6];
  __int128 v138;
  __int128 v139;
  double v140;
  double v141;
  __int128 v142;
  uint64_t v143;

  v118 = a8;
  v9 = a7;
  v10 = a6;
  v143 = *MEMORY[0x24BDAC8D0];
  v127 = a5;
  v132 = a9;
  v119 = v10;
  v126 = v9;
  if (v10 && !v9)
  {
    objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDBrushStroke p_brushPath:inContext:orDirectly:parameterized:drawRasterized:shouldReverseDrawOrder:withLayoutOptions:]");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDBrushStroke.mm");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, v14, 394, CFSTR("Parameterized strokes must draw rasterized."));

    v9 = v126;
  }
  if (v132)
    v15 = !v9;
  else
    v15 = 1;
  if (v15 || (objc_msgSend(v132, "strokeEnd"), v16 > 0.0))
  {
    +[TSDBezierPath bezierPathWithCGPath:](TSDBezierPath, "bezierPathWithCGPath:", a3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "length");
    if (v18 == 0.0)
    {
LABEL_122:

      goto LABEL_123;
    }
    if (v119)
    {
      objc_msgSend(v17, "bezierPathByFlatteningPathWithFlatness:", 0.1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v19, "isEffectivelyClosed") && (objc_msgSend(v19, "isClockwise") & 1) == 0)
      {
        objc_msgSend(v19, "bezierPathByReversingPath");
        v20 = objc_claimAutoreleasedReturnValue();

        v17 = (void *)v20;
      }
      else
      {
        v17 = v19;
      }
    }
    -[TSDStroke width](self, "width");
    objc_msgSend(v17, "setLineWidth:");
    -[TSDStroke miterLimit](self, "miterLimit");
    objc_msgSend(v17, "setMiterLimit:");
    if (v127)
    {
      objc_msgSend(v127, "transform");
      v21 = TSDTransformScale(v137);
      objc_msgSend(v127, "contentsScale");
    }
    else
    {
      if (!a4)
      {
        v23 = 0.0;
        goto LABEL_18;
      }
      v123 = 3.0;
      if (-[TSDBrushStroke p_isDrawingRasterizedIntoPDFWithContext:](self, "p_isDrawingRasterizedIntoPDFWithContext:"))
        goto LABEL_19;
      CGContextGetCTM(&v136, a4);
      v21 = TSDTransformScale(&v136.a);
      v22 = TSDCGContextAssociatedScreenScale((uint64_t)a4);
    }
    v23 = v21 / v22;
LABEL_18:
    v123 = v23;
LABEL_19:
    if (v126)
    {
      v128 = (void **)operator new();
      v24 = 0;
      *v128 = 0;
      v128[1] = 0;
      v128[2] = 0;
    }
    else
    {
      +[TSDBezierPath bezierPath](TSDBezierPath, "bezierPath");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "lineWidth");
      objc_msgSend(v24, "setLineWidth:");
      objc_msgSend(v24, "setWindingRule:", 0);
      v128 = 0;
    }
    v125 = v24;
    v135 = 0;
    objc_msgSend(v17, "length");
    v26 = v25;
    +[TSDBrushStrokeLoader brushStrokeLoaderForCurrentThread](TSDBrushStrokeLoader, "brushStrokeLoaderForCurrentThread");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[TSDSmartStroke strokeName](self, "strokeName");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "optionsForStroke:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("split-at-sharp-angles"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v130 = objc_msgSend(v30, "BOOLValue");

    v31 = *MEMORY[0x24BDBEFB0];
    v32 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
    v134 = *MEMORY[0x24BDBEFB0];
    v33 = objc_msgSend(v17, "elementCount");
    v133[0] = 0;
    v133[1] = (id)1;
    v133[2] = 0;
    if (v33 >= 1)
    {
      v129 = 0;
      v34 = 0;
      v35 = 0;
      v36 = 0.0;
      v37 = 0x24BDD1000uLL;
      v38 = 0.0;
      while (1)
      {
        v39 = v37;
        v40 = v38;
        v41 = objc_msgSend(v17, "elementAtIndex:associatedPoints:", v35, &v139);
        objc_msgSend(v17, "lengthOfElement:", v35);
        v43 = v42 / v26;
        v38 = v38 + v43;
        switch(v41)
        {
          case 3:
            v139 = v134;
            break;
          case 2:
            if (v130)
            {
              v120 = v40 + v43;
              v121 = v31;
              v44 = v32;
              v122 = v36;
              v45 = *(double *)&v138;
              v46 = TSDSubtractPoints(*(double *)&v139, *((double *)&v139 + 1), *(double *)&v138);
              v48 = v47;
              v49 = TSDPointLength(v46, v47);
              if (v49 >= 1.0)
              {
                v52 = TSDMultiplyPointScalar(v46, v48, 1.0 / v49);
              }
              else
              {
                v50 = TSDSubtractPoints(v140, v141, v45);
                v52 = TSDNormalizePoint(v50, v51);
              }
              if (v35 < 2)
              {
                v40 = v122;
LABEL_57:
                v38 = v120;
              }
              else
              {
                if (TSDDotPoints(v121, v44, v52, v53) >= 0.99)
                {
                  v40 = v122;
                  goto LABEL_57;
                }
                v38 = v120;
                if ((uint64_t)(v35 - 1 - v34) < 1 || v40 - v122 <= 0.0)
                {
                  v40 = v122;
                }
                else
                {
                  -[TSDBrushStroke p_brushPath:withScaling:inElementRange:intoPath:orIntoVector:sectionIndex:viewScale:withLayoutOptions:currentSubpathIndex:cachedCurrentElementPercentage:](self, "p_brushPath:withScaling:inElementRange:intoPath:orIntoVector:sectionIndex:viewScale:withLayoutOptions:currentSubpathIndex:cachedCurrentElementPercentage:", v17, v34, v35 - v34, v125, v128, &v135, v122, v40 - v122, v123, v132, v129, v133);
                  v34 = v35 - 1;
                }
              }
              v70 = TSDSubtractPoints(*(double *)&v142, *((double *)&v142 + 1), v140);
              v31 = TSDNormalizePoint(v70, v71);
              v32 = v72;
              v36 = v40;
            }
            v138 = v142;
            goto LABEL_80;
          case 0:
            if ((uint64_t)(v35 - v34) >= 1)
            {
              if (-[TSDBrushStroke p_isFreehandDrawingStrokeWithFixedTileWidth](self, "p_isFreehandDrawingStrokeWithFixedTileWidth"))
              {
                v135 = 0;
              }
              else
              {
                objc_msgSend(v132, "patternOffsetsBySubpath");
                v59 = (void *)objc_claimAutoreleasedReturnValue();
                v60 = v59 == 0;

                if (!v60)
                {
                  objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
                  v61 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(*(id *)(v39 + 1992), "stringWithUTF8String:", "-[TSDBrushStroke p_brushPath:inContext:orDirectly:parameterized:drawRasterized:shouldReverseDrawOrder:withLayoutOptions:]");
                  v62 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(*(id *)(v39 + 1992), "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDBrushStroke.mm");
                  v63 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v61, "handleFailureInFunction:file:lineNumber:description:", v62, v63, 475, CFSTR("If there is a patternOffsetsBySubpath array, this should be a freehand drawing stroke."));

                }
              }
              if (v128)
              {
                objc_msgSend(v132, "transparencyLayersBySubpath");
                v64 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v64, "objectAtIndexedSubscript:", v129);
                v65 = (void *)objc_claimAutoreleasedReturnValue();
                v66 = objc_msgSend(v65, "isEqual:", MEMORY[0x24BDBD1C8]);

                if (v66)
                {
                  v67 = v128[1];
                  v68 = (unint64_t)v128[2];
                  if ((unint64_t)v67 >= v68)
                  {
                    v73 = (char *)*v128;
                    v74 = ((char *)v67 - (_BYTE *)*v128) >> 5;
                    v75 = v74 + 1;
                    if ((unint64_t)(v74 + 1) >> 59)
                      abort();
                    v76 = v68 - (_QWORD)v73;
                    if (v76 >> 4 > v75)
                      v75 = v76 >> 4;
                    if ((unint64_t)v76 >= 0x7FFFFFFFFFFFFFE0)
                      v77 = 0x7FFFFFFFFFFFFFFLL;
                    else
                      v77 = v75;
                    if (v77)
                    {
                      v78 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<EQKit::OpticalKern::Edge::CGPointVector>>((uint64_t)(v128 + 2), v77);
                      v79 = v128;
                      v73 = (char *)*v128;
                    }
                    else
                    {
                      v78 = 0;
                      v79 = v128;
                    }
                    v80 = &v78[32 * v74];
                    *(_OWORD *)v80 = xmmword_217C2A428;
                    *((_OWORD *)v80 + 1) = unk_217C2A438;
                    v81 = (char *)v79[1];
                    if (v81 == v73)
                    {
                      v84 = &v78[32 * v74];
                    }
                    else
                    {
                      v82 = &v78[32 * v74];
                      do
                      {
                        v83 = *((_OWORD *)v81 - 1);
                        v84 = v82 - 32;
                        *((_OWORD *)v82 - 2) = *((_OWORD *)v81 - 2);
                        *((_OWORD *)v82 - 1) = v83;
                        v81 -= 32;
                        v82 -= 32;
                      }
                      while (v81 != v73);
                    }
                    v69 = v80 + 32;
                    *v128 = v84;
                    v128[1] = v80 + 32;
                    v128[2] = &v78[32 * v77];
                    if (v73)
                      operator delete(v73);
                  }
                  else
                  {
                    *v67 = xmmword_217C2A428;
                    v67[1] = unk_217C2A438;
                    v69 = v67 + 2;
                  }
                  v128[1] = v69;
                }
              }
              -[TSDBrushStroke p_brushPath:withScaling:inElementRange:intoPath:orIntoVector:sectionIndex:viewScale:withLayoutOptions:currentSubpathIndex:cachedCurrentElementPercentage:](self, "p_brushPath:withScaling:inElementRange:intoPath:orIntoVector:sectionIndex:viewScale:withLayoutOptions:currentSubpathIndex:cachedCurrentElementPercentage:", v17, v34, v35 - v34, v125, v36, v38 - v36, v123, v132, v129++, v133);
              v36 = v38;
              v34 = v35;
              v37 = v39;
            }
            v138 = v139;
            v134 = v139;
            goto LABEL_80;
        }
        if (!v130)
          break;
        TSUSubtractPoints();
        v57 = TSDNormalizePoint(v54, v55);
        v58 = v56;
        if (v35 < 2 || TSDDotPoints(v31, v32, v57, v56) >= 0.99 || (uint64_t)(v35 - 1 - v34) < 1 || v40 - v36 <= 0.0)
          goto LABEL_41;
        -[TSDBrushStroke p_brushPath:withScaling:inElementRange:intoPath:orIntoVector:sectionIndex:viewScale:withLayoutOptions:currentSubpathIndex:cachedCurrentElementPercentage:](self, "p_brushPath:withScaling:inElementRange:intoPath:orIntoVector:sectionIndex:viewScale:withLayoutOptions:currentSubpathIndex:cachedCurrentElementPercentage:", v17, v34, v35 - v34, v125, v128, &v135, v36, v40 - v36, v123, v132, v129, v133);
        v34 = v35 - 1;
LABEL_42:
        v138 = v139;
        v31 = v57;
        v32 = v58;
        v36 = v40;
LABEL_80:
        if (++v35 == v33)
          goto LABEL_86;
      }
      v57 = v31;
      v58 = v32;
LABEL_41:
      v40 = v36;
      goto LABEL_42;
    }
    v33 = 0;
    v34 = 0;
    v129 = 0;
    v38 = 0.0;
    v36 = 0.0;
LABEL_86:
    v85 = v34;
    v86 = v33 + ~v34;
    if (v86 >= 1)
    {
      if (-[TSDBrushStroke p_isFreehandDrawingStrokeWithFixedTileWidth](self, "p_isFreehandDrawingStrokeWithFixedTileWidth"))
      {
        v135 = 0;
      }
      else
      {
        objc_msgSend(v132, "patternOffsetsBySubpath");
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        v88 = v87 == 0;

        if (!v88)
        {
          objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDBrushStroke p_brushPath:inContext:orDirectly:parameterized:drawRasterized:shouldReverseDrawOrder:withLayoutOptions:]");
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDBrushStroke.mm");
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v89, "handleFailureInFunction:file:lineNumber:description:", v90, v91, 549, CFSTR("If there is a patternOffsetsBySubpath array, this should be a freehand drawing stroke."));

        }
      }
      if (v128)
      {
        objc_msgSend(v132, "transparencyLayersBySubpath");
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v92, "objectAtIndexedSubscript:", v129);
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        v94 = objc_msgSend(v93, "isEqual:", MEMORY[0x24BDBD1C8]);

        if (v94)
        {
          v95 = (unint64_t)v128[2];
          v96 = v128[1];
          if ((unint64_t)v96 >= v95)
          {
            v98 = (char *)*v128;
            v99 = ((char *)v96 - (_BYTE *)*v128) >> 5;
            v100 = v99 + 1;
            if ((unint64_t)(v99 + 1) >> 59)
              abort();
            v101 = v95 - (_QWORD)v98;
            if (v101 >> 4 > v100)
              v100 = v101 >> 4;
            if ((unint64_t)v101 >= 0x7FFFFFFFFFFFFFE0)
              v102 = 0x7FFFFFFFFFFFFFFLL;
            else
              v102 = v100;
            if (v102)
            {
              v103 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<EQKit::OpticalKern::Edge::CGPointVector>>((uint64_t)(v128 + 2), v102);
              v104 = v128;
              v98 = (char *)*v128;
            }
            else
            {
              v103 = 0;
              v104 = v128;
            }
            v105 = &v103[32 * v99];
            v106 = &v103[32 * v102];
            *(_OWORD *)v105 = xmmword_217C2A428;
            *((_OWORD *)v105 + 1) = unk_217C2A438;
            v97 = v105 + 32;
            v107 = (char *)v104[1];
            if (v107 == v98)
            {
              v109 = v105;
            }
            else
            {
              do
              {
                v108 = *((_OWORD *)v107 - 1);
                v109 = v105 - 32;
                *((_OWORD *)v105 - 2) = *((_OWORD *)v107 - 2);
                *((_OWORD *)v105 - 1) = v108;
                v107 -= 32;
                v105 -= 32;
              }
              while (v107 != v98);
            }
            *v128 = v109;
            v128[1] = v97;
            v128[2] = v106;
            if (v98)
              operator delete(v98);
          }
          else
          {
            *v96 = xmmword_217C2A428;
            v96[1] = unk_217C2A438;
            v97 = v96 + 2;
          }
          v128[1] = v97;
        }
      }
      -[TSDBrushStroke p_brushPath:withScaling:inElementRange:intoPath:orIntoVector:sectionIndex:viewScale:withLayoutOptions:currentSubpathIndex:cachedCurrentElementPercentage:](self, "p_brushPath:withScaling:inElementRange:intoPath:orIntoVector:sectionIndex:viewScale:withLayoutOptions:currentSubpathIndex:cachedCurrentElementPercentage:", v17, v85, v86, v125, v36, v38 - v36, v123, v132, v129, v133);
    }
    if (v126)
    {
      if (!v128)
      {
        objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
        v110 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDBrushStroke p_brushPath:inContext:orDirectly:parameterized:drawRasterized:shouldReverseDrawOrder:withLayoutOptions:]");
        v111 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDBrushStroke.mm");
        v112 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v110, "handleFailureInFunction:file:lineNumber:description:", v111, v112, 561, CFSTR("invalid nil value for '%s'"), "resultVector");

      }
      if (objc_msgSend((id)objc_opt_class(), "brushStrokeUsesMetal"))
        -[TSDBrushStroke p_finishMetalRenderInContext:orDirectly:pathVertexData:parameterized:shouldReverseDrawOrder:withLayoutOptions:](self, "p_finishMetalRenderInContext:orDirectly:pathVertexData:parameterized:shouldReverseDrawOrder:withLayoutOptions:", a4, v127, v128, v119, v118, v132);
    }
    else
    {
      v113 = v125;
      if (!v125)
      {
        objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
        v114 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDBrushStroke p_brushPath:inContext:orDirectly:parameterized:drawRasterized:shouldReverseDrawOrder:withLayoutOptions:]");
        v115 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDBrushStroke.mm");
        v116 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v114, "handleFailureInFunction:file:lineNumber:description:", v115, v116, 567, CFSTR("invalid nil value for '%s'"), "resultPath");

        v113 = 0;
      }
      CGContextAddPath(a4, (CGPathRef)objc_msgSend(v113, "CGPath"));
      -[TSDStroke color](self, "color");
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      CGContextSetFillColorWithColor(a4, (CGColorRef)objc_msgSend(v117, "CGColor"));

      CGContextFillPath(a4);
    }

    goto LABEL_122;
  }
LABEL_123:

}

- (void)p_brushPath:(id)a3 withScaling:(id)a4 inElementRange:(_NSRange)a5 intoPath:(id)a6 orIntoVector:(void *)a7 sectionIndex:(unint64_t *)a8 viewScale:(double)a9 withLayoutOptions:(id)a10 currentSubpathIndex:(unint64_t)a11 cachedCurrentElementPercentage:(id *)a12
{
  NSUInteger length;
  NSUInteger location;
  double var1;
  double var0;
  id v21;
  void *v22;
  BOOL v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _BOOL4 v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  id v39;
  const __CFString *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  void *v46;
  double v47;
  double v48;
  double v49;
  double v50;
  void *v51;
  void *v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  unint64_t v62;
  void *v63;
  void *v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  unint64_t v73;
  void *v74;
  void *v75;
  unint64_t v76;
  void *v77;
  void *v78;
  double v79;
  double v80;
  void *v81;
  uint64_t v82;
  double v83;
  unint64_t v84;
  unint64_t v85;
  _BOOL4 v86;
  double v87;
  double v88;
  double v89;
  double v90;
  $145A83A48CF0BF471F1CA047A9C11F89 *v91;
  unint64_t v92;
  unint64_t v93;
  void *v94;
  void *v95;
  double v96;
  void *v97;
  double v98;
  unint64_t v99;
  void *v100;
  void *v101;
  void *v102;
  id v103;
  double v104;
  id v105;

  length = a5.length;
  location = a5.location;
  var1 = a4.var1;
  var0 = a4.var0;
  v105 = a3;
  v21 = a6;
  v103 = a10;
  if (objc_msgSend(v105, "elementCount") >= 2)
  {
    objc_msgSend(v103, "patternOffsetsBySubpath");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      v23 = -[TSDBrushStroke p_isFreehandDrawingStrokeWithFixedTileWidth](self, "p_isFreehandDrawingStrokeWithFixedTileWidth");

      if (!v23)
      {
        objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDBrushStroke p_brushPath:withScaling:inElementRange:intoPath:orIntoVector:sectionIndex:viewScale:withLayoutOptions:currentSubpathIndex:cachedCurrentElementPercentage:]");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDBrushStroke.mm");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "handleFailureInFunction:file:lineNumber:description:", v25, v26, 579, CFSTR("We only know how to adjust the pattern of constant width layout brush strokes."));

      }
    }
    objc_msgSend(v105, "lineWidth");
    v98 = v27;
    +[TSDBrushStrokeLoader brushStrokeLoaderForCurrentThread](TSDBrushStrokeLoader, "brushStrokeLoaderForCurrentThread");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[TSDSmartStroke strokeName](self, "strokeName");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "pathsForStroke:", v29);
    v102 = (void *)objc_claimAutoreleasedReturnValue();

    +[TSDBrushStrokeLoader brushStrokeLoaderForCurrentThread](TSDBrushStrokeLoader, "brushStrokeLoaderForCurrentThread");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[TSDSmartStroke strokeName](self, "strokeName");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "boundsForStroke:", v31);
    v100 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v102, "objectForKey:", CFSTR("middle"));
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "objectForKey:", CFSTR("start"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (v32)
    {
      objc_msgSend(v102, "objectForKey:", CFSTR("end"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v33 != 0;

    }
    else
    {
      v34 = 0;
    }

    v35 = 5.0;
    v36 = v98;
    if (v98 >= 5.0)
    {
      v40 = CFSTR("middle");
    }
    else
    {
      objc_msgSend(v102, "objectForKey:", CFSTR("small"), 5.0, v98);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = v37;
      if (v37)
      {
        v39 = v37;

        v34 = 0;
        v40 = CFSTR("small");
        v101 = v39;
      }
      else
      {
        v40 = CFSTR("middle");
      }

    }
    objc_msgSend(v105, "length", v35, v36);
    v42 = v41;
    v43 = var1;
    v44 = var0 + var1;
    v104 = a9;
    if (v34)
    {
      objc_msgSend(v100, "objectForKeyedSubscript:", CFSTR("start"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "lastObject");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "CGRectValue");
      v48 = v47;
      v50 = v49;

      objc_msgSend(v100, "objectForKeyedSubscript:", CFSTR("end"));
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "lastObject");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "CGRectValue");
      v96 = v53;
      v55 = v54;
      v56 = v42;
      v57 = v98 * (v48 / v50);
      v58 = v43 * v42 * 0.5;
      v59 = fmin(v57, v58);

      v60 = var0 + v59 / v42;
      -[TSDBrushStroke p_brushSection:sectionIndex:ontoPath:inElementRange:intoPath:orIntoVector:viewScale:strokeTileLayout:cachedCurrentElementPercentage:](self, "p_brushSection:sectionIndex:ontoPath:inElementRange:intoPath:orIntoVector:viewScale:strokeTileLayout:cachedCurrentElementPercentage:", CFSTR("start"), 0, v105, location, length, v21, v104, var0, v60, 0.0, 1.0, a7, a12);
      v61 = v44 - fmin(v98 * (v96 / v55), v58) / v42;
      -[TSDBrushStroke p_brushSection:sectionIndex:ontoPath:inElementRange:intoPath:orIntoVector:viewScale:strokeTileLayout:cachedCurrentElementPercentage:](self, "p_brushSection:sectionIndex:ontoPath:inElementRange:intoPath:orIntoVector:viewScale:strokeTileLayout:cachedCurrentElementPercentage:", CFSTR("end"), 0, v105, location, length, v21, v104, v61, v44, 0.0, 1.0, a7, a12);
      v44 = v61;
    }
    else
    {
      v60 = var0;
      v56 = v41;
    }
    v62 = objc_msgSend(v101, "count");
    if (!v62 || v44 <= v60)
      goto LABEL_54;
    objc_msgSend(v100, "objectForKeyedSubscript:", v40);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "lastObject");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "CGRectValue");
    v66 = v65;
    v68 = v67;

    v69 = v66 / v68;
    v70 = v44 - v60;
    v71 = v56 * (v44 - v60);
    v72 = v98 * v69;
    v73 = (unint64_t)(v71 / (v98 * v69) + 1.0);
    if (v62 <= 1)
      v73 = 1;
    v99 = v73;
    objc_msgSend(v103, "patternOffsetsBySubpath");
    v74 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v74)
    {
      v80 = 0.0;
LABEL_30:
      if (-[TSDBrushStroke p_isFreehandDrawingStrokeWithFixedTileWidth](self, "p_isFreehandDrawingStrokeWithFixedTileWidth"))
      {
        v83 = v70 * (v72 / v71);
        if (v80 > 0.0 && v80 > v83)
        {
          v84 = *a8;
          do
          {
            v80 = v80 - v83;
            v85 = (1664525 * v84 + 1013904223);
            if (v85 % v62 == v84 % v62)
              v84 = v85 + 1;
            else
              v84 = (1664525 * v84 + 1013904223);
          }
          while (v80 > 0.0 && v80 > v83);
          *a8 = v84;
        }
      }
      else
      {
        v83 = v70 / (double)v99;
      }
      if (vabdd_f64(v60, v44) > 0.00000999999975)
      {
        do
        {
          v86 = -[TSDBrushStroke p_isFreehandDrawingStrokeWithFixedTileWidth](self, "p_isFreehandDrawingStrokeWithFixedTileWidth");
          v87 = fmin(v44, v83 + v60);
          v88 = 0.0;
          if (v86)
          {
            if (v80 > 0.0)
            {
              v89 = v80 / v83;
              v80 = 0.0;
              v88 = v89 + 0.0;
            }
            v90 = v83 * (1.0 - v88);
            v91 = a12;
            if (v87 - v60 > v90)
              v87 = v87 - (v87 - v60 - v90);
          }
          else
          {
            v91 = a12;
          }
          -[TSDBrushStroke p_brushSection:sectionIndex:ontoPath:inElementRange:intoPath:orIntoVector:viewScale:strokeTileLayout:cachedCurrentElementPercentage:](self, "p_brushSection:sectionIndex:ontoPath:inElementRange:intoPath:orIntoVector:viewScale:strokeTileLayout:cachedCurrentElementPercentage:", v40, *a8 % v62, v105, location, length, v21, v104, v60, v87, a7, v91);
          v92 = 1664525 * *a8 + 1013904223;
          if (v92 % v62 == *a8 % v62)
            v93 = v92 + 1;
          else
            v93 = 1664525 * *a8 + 1013904223;
          *a8 = v93;
          v60 = v87;
        }
        while (vabdd_f64(v87, v44) > 0.00000999999975);
      }
LABEL_54:

      goto LABEL_55;
    }
    objc_msgSend(v103, "patternOffsetsBySubpath");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = objc_msgSend(v75, "count");

    if (v76 <= a11)
    {
      objc_msgSend(v103, "patternOffsetsBySubpath");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      v82 = objc_msgSend(v81, "count");

      if (v82 != 1)
      {
        objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDBrushStroke p_brushPath:withScaling:inElementRange:intoPath:orIntoVector:sectionIndex:viewScale:withLayoutOptions:currentSubpathIndex:cachedCurrentElementPercentage:]");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDBrushStroke.mm");
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        v77 = v95;
        objc_msgSend(v103, "patternOffsetsBySubpath");
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v95, "handleFailureInFunction:file:lineNumber:description:", v78, v97, 686, CFSTR("Not enough pattern offsets for each subpath. Got %zi for index %zi"), objc_msgSend(v94, "count"), a11);

        v80 = 0.0;
        goto LABEL_29;
      }
      objc_msgSend(v103, "patternOffsetsBySubpath");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "objectAtIndexedSubscript:", 0);
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "tsu_CGFloatValue");
    }
    else
    {
      objc_msgSend(v103, "patternOffsetsBySubpath");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "objectAtIndexedSubscript:", a11);
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "tsu_CGFloatValue");
    }
    v80 = v79 / v56;
LABEL_29:

    goto LABEL_30;
  }
LABEL_55:

}

- (void)p_brushSection:(id)a3 sectionIndex:(unint64_t)a4 ontoPath:(id)a5 inElementRange:(_NSRange)a6 intoPath:(id)a7 orIntoVector:(void *)a8 viewScale:(double)a9 strokeTileLayout:(id)a10 cachedCurrentElementPercentage:(id *)a11
{
  double var3;
  double var2;
  double var1;
  double var0;
  NSUInteger length;
  NSUInteger location;
  id v22;
  id v23;
  void *v24;
  NSUInteger v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  uint64_t v35;
  void *v36;
  id v37;
  id v38;

  var3 = a10.var3;
  var2 = a10.var2;
  var1 = a10.var1;
  var0 = a10.var0;
  length = a6.length;
  location = a6.location;
  v38 = a3;
  v22 = a5;
  v23 = a7;
  v24 = v23;
  if (a8)
  {
    if (v23)
    {
      v25 = length;
      objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = v22;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDBrushStroke p_brushSection:sectionIndex:ontoPath:inElementRange:intoPath:orIntoVector:viewScale:strokeTileLayout:cachedCurrentElementPercentage:]");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDBrushStroke.mm");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "handleFailureInFunction:file:lineNumber:description:", v27, v28, 743, CFSTR("expected nil value for '%s'"), "resultPath");

      length = v25;
      v22 = v37;
    }
    -[TSDBrushStroke p_rasterRenderSection:sectionIndex:ontoPath:inElementRange:into:viewScale:strokeTileLayout:cachedCurrentElementPercentage:](self, "p_rasterRenderSection:sectionIndex:ontoPath:inElementRange:into:viewScale:strokeTileLayout:cachedCurrentElementPercentage:", v38, a4, v22, location, length, a8, a9, var0, var1, var2, var3, a11);
  }
  else
  {
    if (v23)
    {
      +[TSDBrushStrokeLoader brushStrokeLoaderForCurrentThread](TSDBrushStrokeLoader, "brushStrokeLoaderForCurrentThread");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[TSDSmartStroke strokeName](self, "strokeName");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "pathsForStroke:", v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v31, "objectForKeyedSubscript:", v38);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "objectAtIndexedSubscript:", a4);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v22, "lineWidth");
        objc_msgSend(v33, "objectAtIndexedSubscript:", v34 < 15.0);
        v35 = objc_claimAutoreleasedReturnValue();

        v33 = (void *)v35;
      }
      objc_msgSend(v33, "recursiveSubdivideOntoPath:withScaling:inElementRange:into:", v22, location, length, v24, var0, var1 - var0);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDBrushStroke p_brushSection:sectionIndex:ontoPath:inElementRange:intoPath:orIntoVector:viewScale:strokeTileLayout:cachedCurrentElementPercentage:]");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDBrushStroke.mm");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "handleFailureInFunction:file:lineNumber:description:", v33, v36, 755, CFSTR("resultPath and resultVector are both nil!"));

    }
  }

}

- (void)p_rasterBrushPath:(CGPath *)a3 inContext:(CGContext *)a4 orDirectly:(id)a5 parameterized:(BOOL)a6 shouldReverseDrawOrder:(BOOL)a7 withLayoutOptions:(id)a8
{
  _BOOL8 v9;
  _BOOL8 v10;
  id v14;
  id v15;
  double v16;
  double v17;
  objc_super v18;
  CGAffineTransform v19;

  v9 = a7;
  v10 = a6;
  v14 = a5;
  v15 = a8;
  if (v14)
    objc_msgSend(v14, "transform");
  else
    CGContextGetCTM(&v19, a4);
  v16 = sqrt(v19.b * v19.b + v19.a * v19.a);
  if (a4
    && -[TSDBrushStroke p_isDrawingRasterizedIntoPDFWithContext:](self, "p_isDrawingRasterizedIntoPDFWithContext:", a4))
  {
    v16 = 3.0;
  }
  if (v14 || v10 || (-[TSDStroke width](self, "width"), v17 > 0.5 / v16))
  {
    -[TSDBrushStroke p_brushPath:inContext:orDirectly:parameterized:drawRasterized:shouldReverseDrawOrder:withLayoutOptions:](self, "p_brushPath:inContext:orDirectly:parameterized:drawRasterized:shouldReverseDrawOrder:withLayoutOptions:", a3, a4, v14, v10, 1, v9, v15);
  }
  else if (a4)
  {
    v18.receiver = self;
    v18.super_class = (Class)TSDBrushStroke;
    -[TSDStroke paintPath:wantsInteriorStroke:inContext:useFastDrawing:parameterized:shouldReverseDrawOrder:](&v18, sel_paintPath_wantsInteriorStroke_inContext_useFastDrawing_parameterized_shouldReverseDrawOrder_, a3, 0, a4, 0, 0, 0);
  }

}

- (void)p_rasterRenderSection:(id)a3 sectionIndex:(unint64_t)a4 ontoPath:(id)a5 inElementRange:(_NSRange)a6 into:(void *)a7 viewScale:(double)a8 strokeTileLayout:(id)a9 cachedCurrentElementPercentage:(id *)a10
{
  NSUInteger length;
  int64_t location;
  double var3;
  int64_t v17;
  double v18;
  double v19;
  int64_t v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  uint64_t v27;
  double v28;
  uint64_t v29;
  uint64_t v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  double *v36;
  double v37;
  char *v39;
  char *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  void *v52;
  void *v53;
  void *v54;
  double v55;
  uint64_t v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  uint64_t v63;
  double v64;
  double v65;
  uint64_t v66;
  double v67;
  uint64_t v68;
  double *v69;
  uint64_t v70;
  unint64_t v71;
  uint64_t v72;
  unint64_t v73;
  char *v74;
  char *v75;
  char *v76;
  uint64_t v77;
  double *v78;
  uint64_t v79;
  unint64_t v80;
  uint64_t v81;
  unint64_t v82;
  char *v83;
  double *v84;
  double *v85;
  double *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  double v96;
  double v97;
  unint64_t v98;
  float v99;
  uint64_t v100;
  _QWORD *v101;
  float v102;
  unint64_t v103;
  double v104;
  double v105;
  CGFloat v106;
  CGFloat v107;
  CGFloat v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  double v114;
  double v115;
  double v116;
  double v117;
  void *v118;
  double v119;
  double v120;
  double v121;
  double v122;
  void *v123;
  void *v124;
  void *v125;
  float v126;
  double v127;
  double v128;
  double v129;
  double v130;
  double v131;
  double v132;
  double v133;
  double v134;
  double v135;
  uint64_t v136;
  double *v137;
  double v138;
  double v139;
  double v140;
  double v141;
  double v142;
  double v143;
  double v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  float *v148;
  _QWORD *v149;
  float v150;
  double v151;
  _OWORD *v152;
  uint64_t v153;
  BOOL v154;
  _OWORD *v155;
  unint64_t v156;
  __int128 v157;
  _OWORD *v158;
  uint64_t v159;
  unint64_t v160;
  uint64_t v161;
  unint64_t v162;
  char *v163;
  char *v164;
  char *v165;
  __int128 v166;
  char *v167;
  char *v168;
  __int128 v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  char v174;
  double v175;
  void *v176;
  double v177;
  double v178;
  double v179;
  double v180;
  void *v181;
  char v182;
  int v183;
  double v184;
  double v185;
  double v186;
  double v187;
  uint64_t v188;
  double v189;
  float v190;
  float v191;
  float v192;
  float v193;
  double v194;
  double v195;
  double v196;
  double v197;
  float v198;
  double v199;
  double v200;
  double v201;
  float v202;
  double v203;
  double v204;
  _QWORD *v205;
  uint64_t v206;
  double v207;
  uint64_t v208;
  double *v209;
  double v210;
  double v211;
  double v212;
  double v213;
  double v214;
  double v215;
  double v216;
  double v217;
  double v218;
  double v219;
  double v220;
  double v221;
  double v222;
  double v223;
  double v224;
  long double v225;
  double v226;
  double v227;
  double v228;
  double v229;
  double v230;
  double v231;
  double v232;
  double v233;
  double v234;
  double v235;
  double v236;
  double v237;
  double v238;
  double v239;
  double v240;
  double v241;
  double v242;
  double v243;
  double v244;
  double v245;
  double v246;
  double v247;
  double v248;
  double v249;
  unint64_t v250;
  char *v251;
  float v252;
  float v253;
  float v254;
  double v255;
  float v256;
  uint64_t v257;
  uint64_t v258;
  uint64_t v259;
  unint64_t v260;
  char *v261;
  float *v262;
  char *v263;
  char *v264;
  float *v265;
  __int128 v266;
  __int16 v267;
  char *v268;
  uint64_t v269;
  uint64_t v270;
  uint64_t v271;
  unint64_t v272;
  char *v273;
  float *v274;
  char *v275;
  char *v276;
  float *v277;
  __int128 v278;
  double v279;
  float v280;
  double v281;
  float v282;
  unint64_t v283;
  char *v284;
  uint64_t v285;
  uint64_t v286;
  uint64_t v287;
  unint64_t v288;
  char *v289;
  float *v290;
  char *v291;
  char *v292;
  float *v293;
  __int128 v294;
  float v295;
  double v296;
  float v297;
  char *v298;
  uint64_t v299;
  uint64_t v300;
  uint64_t v301;
  unint64_t v302;
  char *v303;
  float *v304;
  char *v305;
  char *v306;
  float *v307;
  __int128 v308;
  double v309;
  float v310;
  double v311;
  float v312;
  unint64_t v313;
  char *v314;
  uint64_t v315;
  uint64_t v316;
  uint64_t v317;
  unint64_t v318;
  char *v319;
  float *v320;
  char *v321;
  char *v322;
  float *v323;
  __int128 v324;
  float v325;
  double v326;
  id v327;
  double v328;
  unint64_t v329;
  int64_t v330;
  double v331;
  double var2;
  double var0;
  double var1;
  double v335;
  int64_t v337;
  double v338;
  float v339;
  float v340;
  void *v341;
  double v342;
  double v343;
  double v344;
  unint64_t v345;
  float v346;
  uint64_t v347;
  unint64_t v348;
  int v349;
  double v350;
  uint64_t v351;
  int v352;
  id v353;
  double *__p;
  char *v355;
  char *v356;
  CGAffineTransform v357;
  CGAffineTransform v358;
  double v359;
  double v360;
  _OWORD v361[3];
  __int128 v362;
  __int128 v363;
  __int128 v364;
  uint64_t v365;
  CGRect v366;

  length = a6.length;
  location = a6.location;
  var3 = a9.var3;
  var2 = a9.var2;
  var0 = a9.var0;
  var1 = a9.var1;
  v365 = *MEMORY[0x24BDAC8D0];
  v327 = a3;
  v353 = a5;
  v17 = location + length;
  while (location < objc_msgSend(v353, "elementCount"))
  {
    objc_msgSend(v353, "lengthOfElement:", location);
    if (v18 != 0.0)
      break;
    ++location;
  }
  while (v17 > location)
  {
    objc_msgSend(v353, "lengthOfElement:", v17);
    if (v19 != 0.0)
      break;
    --v17;
  }
  if (v17 < location)
    goto LABEL_241;
  v359 = 0.0;
  v360 = 0.0;
  v337 = -[TSDBrushStroke p_fastElementPercentage:forOverallPercentage:onPath:withCachedCurrentElementPercentage:](self, "p_fastElementPercentage:forOverallPercentage:onPath:withCachedCurrentElementPercentage:", &v360, v353, a10, var0);
  v20 = -[TSDBrushStroke p_fastElementPercentage:forOverallPercentage:onPath:withCachedCurrentElementPercentage:](self, "p_fastElementPercentage:forOverallPercentage:onPath:withCachedCurrentElementPercentage:", &v359, v353, a10, var1);
  if (v337 < location)
  {
    v360 = 0.0;
    v337 = location;
  }
  if (v20 > v17)
  {
    v359 = 1.0;
    v20 = v17;
  }
  v329 = a4;
  v330 = v20;
  if (v20 > v337)
  {
    if (v360 == 1.0 || fabs(v360 + -1.0) < 0.000000999999997)
    {
      v360 = 0.0;
      ++v337;
    }
    v21 = v359;
    if (v359 == 0.0)
    {
      v359 = 1.0;
      v330 = v20 - 1;
    }
  }
  +[TSDBezierPath bezierPath](TSDBezierPath, "bezierPath", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "appendBezierPath:fromSegment:t:toSegment:t:withoutMove:", v353, v337, v330, 0, v360, v359);
  CGAffineTransformMakeScale(&v358, a8, a8);
  objc_msgSend(v22, "transformUsingAffineTransform:", &v358);
  objc_msgSend(v22, "bezierPathByFlatteningPathWithFlatness:", 0.1);
  v341 = (void *)objc_claimAutoreleasedReturnValue();

  v326 = 1.0 / a8;
  CGAffineTransformMakeScale(&v357, 1.0 / a8, 1.0 / a8);
  objc_msgSend(v341, "transformUsingAffineTransform:", &v357);
  -[TSDStroke width](self, "width");
  v23 = 0.5 / a8;
  if (v24 > 0.5 / a8)
  {
    -[TSDStroke width](self, "width");
    v23 = v25;
  }
  v328 = v23;
  __p = 0;
  v355 = 0;
  v356 = 0;
  v26 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  v350 = *MEMORY[0x24BDBEFB0];
  v342 = a8;
  v347 = objc_msgSend(v341, "elementCount");
  if (v347)
  {
    v27 = 0;
    *(_QWORD *)&v338 = v347 - 1;
    v28 = 1.0;
    v335 = var3;
    do
    {
      v362 = *MEMORY[0x24BEB3F28];
      v363 = v362;
      v364 = v362;
      v29 = objc_msgSend(v341, "elementAtIndex:associatedPoints:", v27, &v362);
      v30 = v29;
      v31 = *((double *)&v362 + 1);
      v32 = *(double *)&v362;
      if (!v29)
      {
LABEL_35:
        v39 = v355;
        if (v355 >= v356)
        {
          v78 = __p;
          v79 = (v355 - (char *)__p) >> 4;
          v80 = v79 + 1;
          if ((unint64_t)(v79 + 1) >> 60)
            abort();
          v81 = v356 - (char *)__p;
          if ((v356 - (char *)__p) >> 3 > v80)
            v80 = v81 >> 3;
          if ((unint64_t)v81 >= 0x7FFFFFFFFFFFFFF0)
            v82 = 0xFFFFFFFFFFFFFFFLL;
          else
            v82 = v80;
          if (v82)
          {
            v83 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<EQKitLength>>((uint64_t)&v356, v82);
            v78 = __p;
            v39 = v355;
          }
          else
          {
            v83 = 0;
          }
          v84 = (double *)&v83[16 * v79];
          *v84 = v32;
          v84[1] = v31;
          v85 = v84;
          if (v39 != (char *)v78)
          {
            do
            {
              *((_OWORD *)v85 - 1) = *((_OWORD *)v39 - 1);
              v85 -= 2;
              v39 -= 16;
            }
            while (v39 != (char *)v78);
            v78 = __p;
          }
          v40 = (char *)(v84 + 2);
          __p = v85;
          v356 = &v83[16 * v82];
          if (v78)
            operator delete(v78);
        }
        else
        {
          *(double *)v355 = v32;
          *((double *)v355 + 1) = v31;
          v40 = v355 + 16;
        }
        v355 = v40;
        goto LABEL_80;
      }
      if (v29 != 1)
      {
        if (v29 == 3)
          goto LABEL_28;
        objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDBrushStroke p_rasterRenderSection:sectionIndex:ontoPath:inElementRange:into:viewScale:strokeTileLayout:cachedCurrentElementPercentage:]");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDBrushStroke.mm");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "handleFailureInFunction:file:lineNumber:description:", v34, v35, 854, CFSTR("Path should be flat by now."));

        if (!v30)
          goto LABEL_35;
        if (v30 == 3)
        {
LABEL_28:
          v31 = v26;
          v32 = v350;
        }
      }
      v36 = (double *)v355;
      v37 = TSDDistanceSquared(v32, v31, *((double *)v355 - 2), *((double *)v355 - 1)) * a8 * a8;
      if (v37 > 0.000000999999997 && v37 <= v28)
      {
        if (v27 == *(_QWORD *)&v338)
          goto LABEL_40;
        v361[0] = *MEMORY[0x24BEB3F28];
        v361[1] = v361[0];
        v361[2] = v361[0];
        if (!objc_msgSend(v341, "elementAtIndex:associatedPoints:", v27 + 1, v361))
        {
          v31 = v26;
          v32 = v350;
          a8 = v342;
          goto LABEL_80;
        }
        v36 = (double *)v355;
        TSUSubtractPoints();
        v43 = TSDNormalizePoint(v41, v42);
        v45 = v44;
        TSUSubtractPoints();
        v48 = TSDNormalizePoint(v46, v47);
        v49 = v43;
        v28 = 1.0;
        v51 = TSDDotPoints(v49, v45, v48, v50);
        a8 = v342;
        if (v51 < 0.99)
        {
LABEL_40:
          if ((v30 | 2) != 3)
          {
            objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDBrushStroke p_rasterRenderSection:sectionIndex:ontoPath:inElementRange:into:viewScale:strokeTileLayout:cachedCurrentElementPercentage:]");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDBrushStroke.mm");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "handleFailureInFunction:file:lineNumber:description:", v53, v54, 897, CFSTR("Should only have line and close elements by now."));

            v36 = (double *)v355;
          }
          v55 = sqrt(v37) / 50.0;
          if (v55 < v28)
            v55 = v28;
          v56 = (uint64_t)v55;
          if ((uint64_t)v55 >= 1)
          {
            v57 = *(v36 - 2);
            v58 = *(v36 - 1);
            TSUSubtractPoints();
            v60 = v59;
            v62 = v61;
            v63 = 0;
            do
            {
              v64 = TSDMultiplyPointScalar(v60, v62, (double)++v63 / (double)v56);
              v65 = TSDAddPoints(v57, v58, v64);
              v67 = v65;
              v68 = v66;
              if (v36 >= (double *)v356)
              {
                v69 = __p;
                v70 = ((char *)v36 - (char *)__p) >> 4;
                v71 = v70 + 1;
                if ((unint64_t)(v70 + 1) >> 60)
                  abort();
                v72 = v356 - (char *)__p;
                if ((v356 - (char *)__p) >> 3 > v71)
                  v71 = v72 >> 3;
                if ((unint64_t)v72 >= 0x7FFFFFFFFFFFFFF0)
                  v73 = 0xFFFFFFFFFFFFFFFLL;
                else
                  v73 = v71;
                if (v73)
                {
                  v74 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<EQKitLength>>((uint64_t)&v356, v73);
                  v69 = __p;
                  v36 = (double *)v355;
                }
                else
                {
                  v74 = 0;
                }
                v75 = &v74[16 * v70];
                *(double *)v75 = v67;
                *((_QWORD *)v75 + 1) = v68;
                v76 = v75;
                if (v36 != v69)
                {
                  do
                  {
                    *((_OWORD *)v76 - 1) = *((_OWORD *)v36 - 1);
                    v76 -= 16;
                    v36 -= 2;
                  }
                  while (v36 != v69);
                  v69 = __p;
                }
                v36 = (double *)(v75 + 16);
                __p = (double *)v76;
                v356 = &v74[16 * v73];
                if (v69)
                  operator delete(v69);
              }
              else
              {
                *v36 = v65;
                *((_QWORD *)v36 + 1) = v66;
                v36 += 2;
              }
              v355 = (char *)v36;
            }
            while (v63 != v56);
            v31 = v26;
            v32 = v350;
            var3 = v335;
            a8 = v342;
            v77 = v347;
            v28 = 1.0;
            goto LABEL_81;
          }
        }
      }
      else if (v37 > v28)
      {
        goto LABEL_40;
      }
      v31 = v26;
      v32 = v350;
LABEL_80:
      v77 = v347;
LABEL_81:
      ++v27;
      v350 = v32;
      v26 = v31;
    }
    while (v27 != v77);
  }
  v86 = __p;
  v351 = v355 - (char *)__p;
  if ((unint64_t)(v355 - (char *)__p) >= 0x20)
  {
    +[TSDBrushStrokeLoader brushStrokeLoaderForCurrentThread](TSDBrushStrokeLoader, "brushStrokeLoaderForCurrentThread");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    -[TSDSmartStroke strokeName](self, "strokeName");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "textureIndexForStroke:", v88);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "objectForKeyedSubscript:", v327);
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "objectAtIndexedSubscript:", v329);
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    v348 = objc_msgSend(v91, "unsignedIntegerValue");

    +[TSDBrushStrokeLoader brushStrokeLoaderForCurrentThread](TSDBrushStrokeLoader, "brushStrokeLoaderForCurrentThread");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    -[TSDSmartStroke strokeName](self, "strokeName");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "textureIndexForStroke:", v93);
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "objectForKeyedSubscript:", CFSTR("section-count"));
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    v345 = objc_msgSend(v95, "unsignedIntegerValue");

    LODWORD(v95) = (int)log2(64.0) - 1;
    log2((v328 + v328) * a8);
    v96 = 1.0;
    TSUClamp();
    v98 = v351 >> 4;
    v99 = (float)((int)v95 - (int)v97);
    LODWORD(v338) = exp2f(-v99);
    v339 = v99;
    v325 = exp2f(-(float)(v99 + 1.0));
    v100 = (v351 >> 4) - 1;
    if (v351 >> 4 == 1)
    {
      v102 = 0.0;
    }
    else
    {
      v101 = __p + 3;
      v102 = 0.0;
      v103 = v98 - 1;
      do
      {
        TSUDistance();
        v102 = v104 + v102;
        v101 += 2;
        --v103;
      }
      while (v103);
    }
    v105 = *MEMORY[0x24BDBF090];
    v106 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v107 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v108 = *(double *)(MEMORY[0x24BDBF090] + 24);
    +[TSDBrushStrokeLoader brushStrokeLoaderForCurrentThread](TSDBrushStrokeLoader, "brushStrokeLoaderForCurrentThread");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    -[TSDSmartStroke strokeName](self, "strokeName");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v109, "pathsForStroke:", v110);
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v111, "objectForKeyedSubscript:", v327);
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v112, "objectAtIndexedSubscript:", v329);
    v113 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v113, "bounds");
      v105 = v114;
      v106 = v115;
      v107 = v116;
      v108 = v117;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v113, "firstObject");
        v118 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v118, "bounds");
        v105 = v119;
        v106 = v120;
        v107 = v121;
        v108 = v122;

      }
      else
      {
        objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
        v123 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDBrushStroke p_rasterRenderSection:sectionIndex:ontoPath:inElementRange:into:viewScale:strokeTileLayout:cachedCurrentElementPercentage:]");
        v124 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDBrushStroke.mm");
        v125 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
    v366.origin.x = v105;
    v366.origin.y = v106;
    v366.size.width = v107;
    v366.size.height = v108;
    v126 = v102 / (var3 - var2);
    v127 = fmin(v105, 0.0);
    v128 = fmax(CGRectGetMaxX(v366), 1.0) + -1.0;
    if (var2 < 0.001)
    {
      v129 = *__p;
      v130 = __p[1];
      TSUSubtractPoints();
      v133 = TSDNormalizePoint(v131, v132);
      v96 = 1.0;
      v135 = TSDMultiplyPointScalar(v133, v134, v126 * -v127);
      *__p = TSDAddPoints(v129, v130, v135);
      *((_QWORD *)__p + 1) = v136;
    }
    if (var3 > 0.999)
    {
      v137 = &__p[2 * v100];
      v138 = *v137;
      v139 = v137[1];
      TSUSubtractPoints();
      v142 = TSDNormalizePoint(v140, v141);
      v144 = TSDMultiplyPointScalar(v142, v143, v128 * v126);
      *v137 = TSDAddPoints(v138, v139, v144);
      *((_QWORD *)v137 + 1) = v145;
    }

    v362 = 0uLL;
    *(_QWORD *)&v363 = 0;
    std::vector<EQKitTypes::Notation::Enum>::__vallocate[abi:nn180100](&v362, v98);
    v146 = *((_QWORD *)&v362 + 1);
    bzero(*((void **)&v362 + 1), v351 >> 2);
    *((_QWORD *)&v362 + 1) = v146 + (v351 >> 2);
    v147 = v362;
    *(_DWORD *)v362 = 0;
    if (v98 != 1)
    {
      v148 = (float *)(v147 + 4);
      v149 = __p + 3;
      v150 = 0.0;
      do
      {
        TSUDistance();
        v150 = v151 + v150;
        *v148++ = v150;
        v149 += 2;
        --v100;
      }
      while (v100);
    }
    v152 = (_OWORD *)*((_QWORD *)a7 + 1);
    v153 = (uint64_t)v152 - *(_QWORD *)a7;
    v154 = v152 != *(_OWORD **)a7;
    if (v152 != *(_OWORD **)a7)
    {
      v155 = v152 - 2;
      v156 = *((_QWORD *)a7 + 2);
      if ((unint64_t)v152 >= v156)
      {
        v159 = v153 >> 5;
        v160 = (v153 >> 5) + 1;
        if (v160 >> 59)
          abort();
        v161 = v156 - *(_QWORD *)a7;
        if (v161 >> 4 > v160)
          v160 = v161 >> 4;
        if ((unint64_t)v161 >= 0x7FFFFFFFFFFFFFE0)
          v162 = 0x7FFFFFFFFFFFFFFLL;
        else
          v162 = v160;
        if (v162)
          v163 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<EQKit::OpticalKern::Edge::CGPointVector>>((uint64_t)a7 + 16, v162);
        else
          v163 = 0;
        v164 = &v163[32 * v159];
        v165 = &v163[32 * v162];
        v166 = v155[1];
        *(_OWORD *)v164 = *v155;
        *((_OWORD *)v164 + 1) = v166;
        v158 = v164 + 32;
        v168 = *(char **)a7;
        v167 = (char *)*((_QWORD *)a7 + 1);
        if (v167 != *(char **)a7)
        {
          do
          {
            v169 = *((_OWORD *)v167 - 1);
            *((_OWORD *)v164 - 2) = *((_OWORD *)v167 - 2);
            *((_OWORD *)v164 - 1) = v169;
            v164 -= 32;
            v167 -= 32;
          }
          while (v167 != v168);
          v167 = *(char **)a7;
        }
        *(_QWORD *)a7 = v164;
        *((_QWORD *)a7 + 1) = v158;
        *((_QWORD *)a7 + 2) = v165;
        if (v167)
          operator delete(v167);
      }
      else
      {
        v157 = *(v152 - 1);
        *v152 = *v155;
        v152[1] = v157;
        v158 = v152 + 2;
      }
      *((_QWORD *)a7 + 1) = v158;
    }
    +[TSDBrushStrokeLoader brushStrokeLoaderForCurrentThread](TSDBrushStrokeLoader, "brushStrokeLoaderForCurrentThread");
    v170 = (void *)objc_claimAutoreleasedReturnValue();
    -[TSDSmartStroke strokeName](self, "strokeName");
    v171 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v170, "optionsForStroke:", v171);
    v172 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v172, "objectForKeyedSubscript:", CFSTR("split-at-sharp-angles"));
    v173 = (void *)objc_claimAutoreleasedReturnValue();
    v174 = objc_msgSend(v173, "BOOLValue");

    v175 = v360;
    if ((v174 & 1) != 0)
    {
      if (v360 <= 0.99)
      {
        v176 = v353;
      }
      else
      {
        v176 = v353;
        if (v337 < v17)
        {
          ++v337;
          v360 = 0.0;
          v175 = 0.0;
        }
      }
      v177 = v359;
      if (v359 < 0.01 && v330 > location)
      {
        --v330;
        v359 = 1.0;
      }
    }
    else
    {
      if (v360 >= 0.01)
      {
        v176 = v353;
      }
      else
      {
        v176 = v353;
        if (v337 > location)
        {
          --v337;
          v360 = 1.0;
          v175 = 1.0;
        }
      }
      v177 = v359;
      if (v359 > 0.99 && v330 < v17)
      {
        ++v330;
        v359 = 0.0;
      }
    }
    objc_msgSend(v176, "gradientAt:fromElement:", v337, v175, v177);
    TSUSubtractPoints();
    v178 = *((double *)v355 - 2);
    v179 = *((double *)v355 - 1);
    objc_msgSend(v176, "gradientAt:fromElement:", v330, v359);
    TSDAddPoints(v178, v179, v180);
    -[TSDSmartStroke strokeName](self, "strokeName");
    v181 = (void *)objc_claimAutoreleasedReturnValue();
    v182 = objc_msgSend(v181, "isEqualToString:", CFSTR("Basic"));
    if ((v182 & 1) != 0
      || (-[TSDSmartStroke strokeName](self, "strokeName"),
          v171 = (void *)objc_claimAutoreleasedReturnValue(),
          (objc_msgSend(v171, "isEqualToString:", CFSTR("Basic Rounded")) & 1) != 0))
    {
      v183 = objc_msgSend(v176, "isEffectivelyClosed");
      if ((v182 & 1) != 0)
      {

        if (!v183)
        {
LABEL_143:
          v188 = 0;
          v189 = 4.0 * v339;
          v190 = 4.0 * 4.0 + 64.0;
          v191 = v189 + (v96 - *(float *)&v338) * 64.0;
          *(float *)&v189 = v189 + (v96 - v325) * 64.0;
          v192 = 1.0 - (float)(v191 / v190);
          *(float *)&v189 = 1.0 - (float)(*(float *)&v189 / v190);
          v193 = vabds_f32(*(float *)&v189, v192);
          v194 = v192;
          v195 = *(float *)&v189;
          v196 = v193 / (v328 * a8);
          v197 = v96 / (float)((float)v345 * v190);
          v198 = v196 + v194;
          *(float *)&v196 = v195 - v196;
          v199 = v197 + v194;
          v200 = v195 - v197;
          *(float *)&v195 = (float)(v345 - 1);
          v201 = (double)(v345 - 1);
          v202 = (float)(*(float *)&v195 + v198) - (float)v348;
          *(float *)&v195 = (float)((float)(*(float *)&v195 + *(float *)&v196) - (float)v348) / (float)v345;
          v203 = (v199 + v201 - (double)v348) / (double)v345;
          v204 = (v200 + v201 - (double)v348) / (double)v345;
          v346 = 1.0 - (float)(v202 / (float)v345);
          v340 = 1.0 - *(float *)&v195;
          v331 = v326 + v328 * 0.5;
          *(float *)&v203 = v96 - v203;
          v352 = LODWORD(v203);
          *(float *)&v204 = v96 - v204;
          v349 = LODWORD(v204);
          v205 = (char *)a7 + 16;
          if (v98 <= 1)
            v206 = 1;
          else
            v206 = v98;
          v207 = 1.0;
          do
          {
            v208 = v188 + 1;
            v209 = &__p[2 * v188];
            v210 = *v209;
            v211 = v209[1];
            TSUSubtractPoints();
            v214 = TSDNormalizePoint(v212, v213);
            v216 = v215;
            TSUSubtractPoints();
            v219 = TSDNormalizePoint(v217, v218);
            v221 = v220;
            v222 = TSDMultiplyPointScalar(v219, v220, -1.0);
            v224 = TSDDotPoints(v214, v216, v222, v223);
            v225 = acos(fmin(fmax(v224, -1.0), v207));
            v226 = sin(v225 * 0.5);
            -[TSDStroke miterLimit](self, "miterLimit");
            v343 = v227 * 0.995;
            v344 = v207 / v226;
            if (v207 / v226 <= v227 * 0.995)
            {
              v239 = TSDAveragePoints(v214, v216, v219);
              v241 = TSDRotatePoint90Degrees(0, v239, v240);
              v243 = TSDNormalizePoint(v241, v242);
              v236 = TSDMultiplyPointScalar(v243, v244, v331 / v226);
            }
            else
            {
              v228 = TSDRotatePoint90Degrees(0, v214, v216);
              v230 = v229;
              v231 = TSDRotatePoint90Degrees(0, v219, v221);
              v233 = v232;
              v234 = TSDNormalizePoint(v228, v230);
              v236 = TSDMultiplyPointScalar(v234, v235, v331);
              v237 = TSDNormalizePoint(v231, v233);
              v338 = TSDMultiplyPointScalar(v237, v238, v331);
            }
            TSUMix();
            v246 = v245;
            TSUMix();
            v248 = v247;
            v249 = TSDAddPoints(v210, v211, v236);
            v251 = (char *)*((_QWORD *)a7 + 1);
            v250 = *((_QWORD *)a7 + 2);
            v252 = v248;
            v253 = v246;
            v254 = v249;
            v256 = v255;
            if (v154)
            {
              if ((unint64_t)v251 >= v250)
              {
                v257 = (uint64_t)&v251[-*(_QWORD *)a7] >> 5;
                if ((unint64_t)(v257 + 1) >> 59)
                  abort();
                v258 = v250 - *(_QWORD *)a7;
                v259 = v258 >> 4;
                if (v258 >> 4 <= (unint64_t)(v257 + 1))
                  v259 = v257 + 1;
                if ((unint64_t)v258 >= 0x7FFFFFFFFFFFFFE0)
                  v260 = 0x7FFFFFFFFFFFFFFLL;
                else
                  v260 = v259;
                if (v260)
                  v261 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<EQKit::OpticalKern::Edge::CGPointVector>>((uint64_t)a7 + 16, v260);
                else
                  v261 = 0;
                v262 = (float *)&v261[32 * v257];
                *v262 = 0.0;
                v262[1] = v254;
                v262[2] = v256;
                v262[3] = v252;
                v262[4] = v346;
                *((_DWORD *)v262 + 5) = v352;
                *((_DWORD *)v262 + 6) = v349;
                v262[7] = v253;
                v264 = *(char **)a7;
                v263 = (char *)*((_QWORD *)a7 + 1);
                v265 = v262;
                if (v263 != *(char **)a7)
                {
                  do
                  {
                    v266 = *((_OWORD *)v263 - 1);
                    *((_OWORD *)v265 - 2) = *((_OWORD *)v263 - 2);
                    *((_OWORD *)v265 - 1) = v266;
                    v265 -= 8;
                    v263 -= 32;
                  }
                  while (v263 != v264);
                  v263 = *(char **)a7;
                }
                v251 = (char *)(v262 + 8);
                *(_QWORD *)a7 = v265;
                *((_QWORD *)a7 + 1) = v262 + 8;
                *((_QWORD *)a7 + 2) = &v261[32 * v260];
                if (v263)
                  operator delete(v263);
              }
              else
              {
                *(_DWORD *)v251 = 0;
                *((float *)v251 + 1) = v254;
                *((float *)v251 + 2) = v256;
                *((float *)v251 + 3) = v252;
                *((float *)v251 + 4) = v346;
                *((_DWORD *)v251 + 5) = v352;
                *((_DWORD *)v251 + 6) = v349;
                *((float *)v251 + 7) = v253;
                v251 += 32;
              }
              *((_QWORD *)a7 + 1) = v251;
              v250 = *((_QWORD *)a7 + 2);
            }
            BYTE2(v361[0]) = 0;
            LOWORD(v361[0]) = 0;
            if ((unint64_t)v251 >= v250)
            {
              v269 = (uint64_t)&v251[-*(_QWORD *)a7] >> 5;
              if ((unint64_t)(v269 + 1) >> 59)
                abort();
              v270 = v250 - *(_QWORD *)a7;
              v271 = v270 >> 4;
              if (v270 >> 4 <= (unint64_t)(v269 + 1))
                v271 = v269 + 1;
              if ((unint64_t)v270 >= 0x7FFFFFFFFFFFFFE0)
                v272 = 0x7FFFFFFFFFFFFFFLL;
              else
                v272 = v271;
              if (v272)
                v273 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<EQKit::OpticalKern::Edge::CGPointVector>>((uint64_t)a7 + 16, v272);
              else
                v273 = 0;
              v274 = (float *)&v273[32 * v269];
              *v274 = 0.0;
              v274[1] = v254;
              v274[2] = v256;
              v274[3] = v252;
              v274[4] = v346;
              *((_DWORD *)v274 + 5) = v352;
              *((_DWORD *)v274 + 6) = v349;
              v274[7] = v253;
              v276 = *(char **)a7;
              v275 = (char *)*((_QWORD *)a7 + 1);
              v277 = v274;
              if (v275 != *(char **)a7)
              {
                do
                {
                  v278 = *((_OWORD *)v275 - 1);
                  *((_OWORD *)v277 - 2) = *((_OWORD *)v275 - 2);
                  *((_OWORD *)v277 - 1) = v278;
                  v277 -= 8;
                  v275 -= 32;
                }
                while (v275 != v276);
                v275 = *(char **)a7;
              }
              v268 = (char *)(v274 + 8);
              *(_QWORD *)a7 = v277;
              *((_QWORD *)a7 + 1) = v274 + 8;
              *((_QWORD *)a7 + 2) = &v273[32 * v272];
              if (v275)
                operator delete(v275);
            }
            else
            {
              *v251 = 0;
              v267 = v361[0];
              v251[3] = BYTE2(v361[0]);
              *(_WORD *)(v251 + 1) = v267;
              *((float *)v251 + 1) = v254;
              *((float *)v251 + 2) = v256;
              *((float *)v251 + 3) = v252;
              *((float *)v251 + 4) = v346;
              *((_DWORD *)v251 + 5) = v352;
              *((_DWORD *)v251 + 6) = v349;
              *((float *)v251 + 7) = v253;
              v268 = v251 + 32;
            }
            *((_QWORD *)a7 + 1) = v268;
            TSUSubtractPoints();
            v280 = v279;
            v282 = v281;
            v283 = *((_QWORD *)a7 + 2);
            if ((unint64_t)v268 >= v283)
            {
              v285 = (uint64_t)&v268[-*(_QWORD *)a7] >> 5;
              if ((unint64_t)(v285 + 1) >> 59)
                abort();
              v286 = v283 - *(_QWORD *)a7;
              v287 = v286 >> 4;
              if (v286 >> 4 <= (unint64_t)(v285 + 1))
                v287 = v285 + 1;
              if ((unint64_t)v286 >= 0x7FFFFFFFFFFFFFE0)
                v288 = 0x7FFFFFFFFFFFFFFLL;
              else
                v288 = v287;
              if (v288)
                v289 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<EQKit::OpticalKern::Edge::CGPointVector>>((uint64_t)a7 + 16, v288);
              else
                v289 = 0;
              v290 = (float *)&v289[32 * v285];
              *v290 = 0.0;
              v290[1] = v280;
              v290[2] = v282;
              v290[3] = v252;
              v290[4] = v340;
              *((_DWORD *)v290 + 5) = v352;
              *((_DWORD *)v290 + 6) = v349;
              v290[7] = v253;
              v292 = *(char **)a7;
              v291 = (char *)*((_QWORD *)a7 + 1);
              v293 = v290;
              v207 = 1.0;
              if (v291 != *(char **)a7)
              {
                do
                {
                  v294 = *((_OWORD *)v291 - 1);
                  *((_OWORD *)v293 - 2) = *((_OWORD *)v291 - 2);
                  *((_OWORD *)v293 - 1) = v294;
                  v293 -= 8;
                  v291 -= 32;
                }
                while (v291 != v292);
                v291 = *(char **)a7;
              }
              v284 = (char *)(v290 + 8);
              *(_QWORD *)a7 = v293;
              *((_QWORD *)a7 + 1) = v290 + 8;
              *((_QWORD *)a7 + 2) = &v289[32 * v288];
              if (v291)
                operator delete(v291);
            }
            else
            {
              *(_DWORD *)v268 = 0;
              *((float *)v268 + 1) = v280;
              *((float *)v268 + 2) = v282;
              *((float *)v268 + 3) = v252;
              *((float *)v268 + 4) = v340;
              *((_DWORD *)v268 + 5) = v352;
              *((_DWORD *)v268 + 6) = v349;
              v284 = v268 + 32;
              *((float *)v268 + 7) = v253;
              v207 = 1.0;
            }
            *((_QWORD *)a7 + 1) = v284;
            if (v344 > v343)
            {
              v295 = TSDAddPoints(v210, v211, v338);
              v297 = v296;
              if ((unint64_t)v284 >= *v205)
              {
                v299 = (uint64_t)&v284[-*(_QWORD *)a7] >> 5;
                if ((unint64_t)(v299 + 1) >> 59)
                  abort();
                v300 = *v205 - *(_QWORD *)a7;
                v301 = v300 >> 4;
                if (v300 >> 4 <= (unint64_t)(v299 + 1))
                  v301 = v299 + 1;
                if ((unint64_t)v300 >= 0x7FFFFFFFFFFFFFE0)
                  v302 = 0x7FFFFFFFFFFFFFFLL;
                else
                  v302 = v301;
                if (v302)
                  v303 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<EQKit::OpticalKern::Edge::CGPointVector>>((uint64_t)a7 + 16, v302);
                else
                  v303 = 0;
                v304 = (float *)&v303[32 * v299];
                *v304 = 0.0;
                v304[1] = v295;
                v304[2] = v297;
                v304[3] = v252;
                v304[4] = v346;
                *((_DWORD *)v304 + 5) = v352;
                *((_DWORD *)v304 + 6) = v349;
                v304[7] = v253;
                v306 = *(char **)a7;
                v305 = (char *)*((_QWORD *)a7 + 1);
                v307 = v304;
                if (v305 != *(char **)a7)
                {
                  do
                  {
                    v308 = *((_OWORD *)v305 - 1);
                    *((_OWORD *)v307 - 2) = *((_OWORD *)v305 - 2);
                    *((_OWORD *)v307 - 1) = v308;
                    v307 -= 8;
                    v305 -= 32;
                  }
                  while (v305 != v306);
                  v305 = *(char **)a7;
                }
                v298 = (char *)(v304 + 8);
                *(_QWORD *)a7 = v307;
                *((_QWORD *)a7 + 1) = v304 + 8;
                *((_QWORD *)a7 + 2) = &v303[32 * v302];
                if (v305)
                  operator delete(v305);
              }
              else
              {
                *(_DWORD *)v284 = 0;
                *((float *)v284 + 1) = v295;
                *((float *)v284 + 2) = v297;
                *((float *)v284 + 3) = v252;
                *((float *)v284 + 4) = v346;
                *((_DWORD *)v284 + 5) = v352;
                *((_DWORD *)v284 + 6) = v349;
                v298 = v284 + 32;
                *((float *)v284 + 7) = v253;
              }
              *((_QWORD *)a7 + 1) = v298;
              TSUSubtractPoints();
              v310 = v309;
              v312 = v311;
              v313 = *((_QWORD *)a7 + 2);
              if ((unint64_t)v298 >= v313)
              {
                v315 = (uint64_t)&v298[-*(_QWORD *)a7] >> 5;
                if ((unint64_t)(v315 + 1) >> 59)
                  abort();
                v316 = v313 - *(_QWORD *)a7;
                v317 = v316 >> 4;
                if (v316 >> 4 <= (unint64_t)(v315 + 1))
                  v317 = v315 + 1;
                if ((unint64_t)v316 >= 0x7FFFFFFFFFFFFFE0)
                  v318 = 0x7FFFFFFFFFFFFFFLL;
                else
                  v318 = v317;
                if (v318)
                  v319 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<EQKit::OpticalKern::Edge::CGPointVector>>((uint64_t)a7 + 16, v318);
                else
                  v319 = 0;
                v320 = (float *)&v319[32 * v315];
                *v320 = 0.0;
                v320[1] = v310;
                v320[2] = v312;
                v320[3] = v252;
                v320[4] = v340;
                *((_DWORD *)v320 + 5) = v352;
                *((_DWORD *)v320 + 6) = v349;
                v320[7] = v253;
                v322 = *(char **)a7;
                v321 = (char *)*((_QWORD *)a7 + 1);
                v323 = v320;
                v207 = 1.0;
                if (v321 != *(char **)a7)
                {
                  do
                  {
                    v324 = *((_OWORD *)v321 - 1);
                    *((_OWORD *)v323 - 2) = *((_OWORD *)v321 - 2);
                    *((_OWORD *)v323 - 1) = v324;
                    v323 -= 8;
                    v321 -= 32;
                  }
                  while (v321 != v322);
                  v321 = *(char **)a7;
                }
                v314 = (char *)(v320 + 8);
                *(_QWORD *)a7 = v323;
                *((_QWORD *)a7 + 1) = v320 + 8;
                *((_QWORD *)a7 + 2) = &v319[32 * v318];
                if (v321)
                  operator delete(v321);
              }
              else
              {
                *(_DWORD *)v298 = 0;
                *((float *)v298 + 1) = v310;
                *((float *)v298 + 2) = v312;
                *((float *)v298 + 3) = v252;
                *((float *)v298 + 4) = v340;
                *((_DWORD *)v298 + 5) = v352;
                *((_DWORD *)v298 + 6) = v349;
                v314 = v298 + 32;
                *((float *)v298 + 7) = v253;
                v207 = 1.0;
              }
              *((_QWORD *)a7 + 1) = v314;
            }
            v154 = 0;
            v188 = v208;
          }
          while (v208 != v206);
          if ((_QWORD)v362)
          {
            *((_QWORD *)&v362 + 1) = v362;
            operator delete((void *)v362);
          }
          v86 = __p;
          goto LABEL_238;
        }
      }
      else
      {

        if ((v183 & 1) == 0)
          goto LABEL_143;
      }
      objc_msgSend(v353, "gradientAt:fromElement:", v330, v359);
      v184 = *__p;
      v185 = __p[1];
      objc_msgSend(v353, "gradientAt:fromElement:", v337, v360);
      v187 = v186;
      TSUSubtractPoints();
      TSDAddPoints(v184, v185, v187);
      a8 = v342;
      v96 = 1.0;
      goto LABEL_143;
    }

    goto LABEL_143;
  }
LABEL_238:
  if (v86)
    operator delete(v86);

LABEL_241:
}

- (void)p_finishMetalRenderInContext:(CGContext *)a3 orDirectly:(id)a4 pathVertexData:(void *)a5 parameterized:(BOOL)a6 shouldReverseDrawOrder:(BOOL)a7 withLayoutOptions:(id)a8
{
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double m11;
  double m12;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double width;
  double height;
  __int128 v34;
  void *v35;
  BOOL v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unsigned __int8 *v43;
  unint64_t v44;
  int v45;
  _BYTE *v46;
  CGFloat v47;
  uint64_t v48;
  unint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v56;
  CGFloat v57;
  int64_t v58;
  char *v59;
  void *v60;
  void *v61;
  _BOOL4 v62;
  void *v63;
  BOOL v64;
  int v65;
  uint64_t v66;
  unint64_t v67;
  unint64_t v68;
  void *v69;
  void *v70;
  void *v71;
  CGColorSpace *v72;
  CFStringRef *v73;
  CGColorSpaceRef v74;
  CGColorRef CopyByMatchingToColorSpace;
  uint64_t v76;
  void *v77;
  void *v78;
  void *v79;
  double v80;
  double v81;
  double v82;
  double v83;
  unint64_t v84;
  unint64_t v85;
  double v86;
  double v87;
  BOOL v88;
  void *v89;
  void *v90;
  void *v91;
  unint64_t v92;
  unint64_t v93;
  float64x2_t *Components;
  __int128 v95;
  unsigned int v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  double v106;
  double v107;
  double v108;
  CGFloat v109;
  CGFloat v110;
  CGFloat m13;
  CGFloat m14;
  CGFloat m21;
  CGFloat m22;
  CGFloat m23;
  CGFloat m24;
  void *v117;
  void *v118;
  id v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t i;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  float32_t v127;
  int v128;
  double v129;
  float v130;
  double v131;
  double v132;
  double v133;
  unint64_t v134;
  unint64_t v135;
  void *v136;
  unint64_t v137;
  void *v138;
  void *v139;
  char v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  unint64_t v148;
  CGImage *CGImageFromTexture;
  void *v150;
  double v151;
  int v152;
  int v153;
  double x;
  double rect;
  CGFloat m44;
  int v157;
  CGFloat m43;
  uint64_t v159;
  CGFloat m42;
  float64x2_t v161;
  double v162;
  CGFloat sxa;
  float64x2_t sxb;
  double sx;
  void *v166;
  double y;
  CGFloat m34;
  float64x2_t v169;
  uint64_t v170;
  CGFloat m33;
  float64x2_t v172;
  int v173;
  CGContext *c;
  CGFloat ca;
  CGContextRef cb[2];
  void *v177;
  void *context;
  id v179;
  TSDBrushStroke *v180;
  CGFloat m31;
  float64x2_t v182;
  _BOOL4 v183;
  double v184;
  void *v185;
  uint64_t v186;
  void *v187;
  void *v188;
  uint64_t *v189;
  id v190;
  unint64_t v191;
  void *v192;
  void *v193;
  void *v194;
  void *v196;
  unint64_t v197;
  CGFloat v198;
  float64x2_t v199;
  void *v200;
  void *v201;
  id v202;
  void *v203;
  void *v204;
  CGFloat v205;
  float64x2_t v206;
  void *v207;
  unint64_t v208;
  void *v209;
  void *v210;
  void *v211;
  float v212;
  float64x2_t v213[8];
  float32x4_t v214[4];
  double v215[4];
  __int128 v216;
  double v217[4];
  __int128 v218;
  CATransform3D v219;
  CGAffineTransform v220;
  CATransform3D v221;
  CATransform3D v222;
  CATransform3D v223;
  float64x2_t v224[8];
  double v225[4];
  __int128 v226;
  __int128 v227;
  __int128 v228;
  __int128 v229;
  __int128 v230;
  double v231[4];
  __int128 v232;
  CATransform3D b;
  CGAffineTransform m;
  CATransform3D a;
  CATransform3D v236;
  CATransform3D v237;
  CATransform3D v238;
  CATransform3D v239;
  _BYTE v240[16];
  __int128 v241;
  int v242;
  _QWORD v243[7];
  char *v244;
  char *v245;
  uint64_t v246;
  BOOL v247;
  CGAffineTransform v248;
  CGAffineTransform transform;
  __int128 v250;
  __int128 v251;
  CGAffineTransform v252;
  __int128 v253;
  __int128 v254;
  _BYTE v255[128];
  _QWORD v256[7];
  CGRect v257;
  CGRect ClipBoundingBox;
  CGRect v259;
  CGRect v260;

  v183 = a6;
  v256[4] = *MEMORY[0x24BDAC8D0];
  v12 = a4;
  v179 = a8;
  context = (void *)MEMORY[0x219A15874]();
  v189 = (uint64_t *)a5;
  v185 = v12;
  if (*((_QWORD *)a5 + 1) == *(_QWORD *)a5)
    goto LABEL_84;
  v180 = self;
  c = a3;
  if (v12)
  {
    objc_msgSend(v12, "frame");
    TSURectWithSize();
    v14 = v13;
    v16 = v15;
    objc_msgSend(v12, "transform");
    m11 = v239.m11;
    m12 = v239.m12;
    v253 = *(_OWORD *)&v239.m13;
    v254 = *(_OWORD *)&v239.m21;
    v250 = *(_OWORD *)&v239.m13;
    v251 = *(_OWORD *)&v239.m21;
    if (v14 <= 0.0 || v16 <= 0.0)
      goto LABEL_84;
    -[TSDStroke color](self, "color");
    v177 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:
    -[TSDStroke width](self, "width");
    v25 = v24;
    objc_msgSend(v177, "alphaComponent");
    v27 = sqrt(m12 * m12 + m11 * m11);
    v28 = 1.0 / v27;
    v29 = v25 * v27;
    if (v25 >= v28)
      v29 = 1.0;
    v30 = v29 * v26;
    if (v183)
      v31 = 1.0;
    else
      v31 = v30;
    if (v12)
    {
      v170 = 0;
      v159 = 0;
      x = *MEMORY[0x24BDBF090];
      width = *(double *)(MEMORY[0x24BDBF090] + 16);
      y = *(double *)(MEMORY[0x24BDBF090] + 8);
      height = *(double *)(MEMORY[0x24BDBF090] + 24);
    }
    else
    {
      CGContextSaveGState(c);
      v248.a = m11;
      v248.b = m12;
      *(_OWORD *)&v248.c = v250;
      *(_OWORD *)&v248.tx = v251;
      CGAffineTransformInvert(&transform, &v248);
      CGContextConcatCTM(c, &transform);
      v34 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
      v250 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
      v251 = v34;
      ClipBoundingBox = CGContextGetClipBoundingBox(c);
      v259 = CGRectIntegral(ClipBoundingBox);
      x = v259.origin.x;
      y = v259.origin.y;
      width = v259.size.width;
      height = v259.size.height;
      v159 = (uint64_t)fmin(v259.size.width, 1024.0);
      v170 = (uint64_t)fmin(v259.size.height, 1024.0);
    }
    TSDMetalDevicePreferringLowPower();
    v188 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(v12, "metalDeviceOverride");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = v35 == 0;

      if (!v36)
      {
        objc_msgSend(v185, "metalDeviceOverride");
        v37 = objc_claimAutoreleasedReturnValue();

        v188 = (void *)v37;
      }
    }
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v211 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v210 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = *((_QWORD *)a5 + 1) - *(_QWORD *)a5;
    if (v38)
    {
      v39 = 0;
      v40 = v38 >> 5;
      v186 = v38 >> 5;
      do
      {
        v41 = 0;
        v42 = *v189;
        v43 = (unsigned __int8 *)(*v189 + 32 * v39);
        v44 = v39;
        do
        {
          v45 = *v43;
          v43 += 32;
          if (v45)
          {
            if (v41)
              break;
            ++v39;
          }
          else
          {
            ++v41;
          }
          ++v44;
        }
        while (v44 < v40);
        v46 = (_BYTE *)(v42 + 32 * v39);
        v39 += v41;
        std::vector<TSDBrushVertexData>::vector<std::__wrap_iter<TSDBrushVertexData*>,0>((uint64_t)&v239, v46, (_BYTE *)(v42 + 32 * v39));
        v47 = v239.m12;
        v48 = *(_QWORD *)&v239.m12 - *(_QWORD *)&v239.m11;
        if (*(_QWORD *)&v239.m12 != *(_QWORD *)&v239.m11)
        {
          v191 = v39;
          v49 = 0;
          v208 = v48 >> 5;
          v197 = (v48 >> 5) - 3;
          do
          {
            +[TSDGPUDataBufferAttribute attributeWithName:bufferUsage:dataType:normalized:componentCount:](TSDGPUDataBufferAttribute, "attributeWithName:bufferUsage:dataType:normalized:componentCount:", CFSTR("position"), 35044, 5, 0, 2);
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            +[TSDGPUDataBufferAttribute attributeWithName:bufferUsage:dataType:normalized:componentCount:](TSDGPUDataBufferAttribute, "attributeWithName:bufferUsage:dataType:normalized:componentCount:", CFSTR("textureCoordinate"), 35044, 5, 0, 2);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            +[TSDGPUDataBufferAttribute attributeWithName:bufferUsage:dataType:normalized:componentCount:](TSDGPUDataBufferAttribute, "attributeWithName:bufferUsage:dataType:normalized:componentCount:", CFSTR("clampedTextureCoordinate"), 35044, 5, 0, 2);
            v204 = (void *)objc_claimAutoreleasedReturnValue();
            +[TSDGPUDataBufferAttribute attributeWithName:bufferUsage:dataType:normalized:componentCount:](TSDGPUDataBufferAttribute, "attributeWithName:bufferUsage:dataType:normalized:componentCount:", CFSTR("percentAlongPath"), 35044, 5, 1, 1);
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            v256[0] = v50;
            v256[1] = v51;
            v256[2] = v204;
            v256[3] = v52;
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v256, 4);
            v53 = objc_claimAutoreleasedReturnValue();
            v54 = 65534;
            if (v208 - v49 <= 0xFFFE)
              v54 = v208 - v49;
            if (v54 + v49 <= v197 || v54 + v49 >= v208)
              v56 = v54;
            else
              v56 = v208 - v49 - 3;
            v200 = (void *)v53;
            v202 = +[TSDGPUDataBuffer newDataBufferWithVertexAttributes:vertexCount:indexElementCount:device:](TSDGPUDataBuffer, "newDataBufferWithVertexAttributes:vertexCount:indexElementCount:device:");
            objc_msgSend(v202, "setMetalDrawMode:", 4);
            v243[0] = MEMORY[0x24BDAC760];
            v243[1] = 3321888768;
            v243[2] = __128__TSDBrushStroke_p_finishMetalRenderInContext_orDirectly_pathVertexData_parameterized_shouldReverseDrawOrder_withLayoutOptions___block_invoke;
            v243[3] = &__block_descriptor_81_ea8_56c60_ZTSNSt3__16vectorI18TSDBrushVertexDataNS_9allocatorIS1_EEEE_e37_v24__0____qQB_QQQB__NSRange_QQ_Q_8Q16l;
            v243[4] = v56;
            v243[5] = v49;
            v247 = a7;
            v243[6] = v208;
            v245 = 0;
            v246 = 0;
            v244 = 0;
            v57 = v239.m11;
            v58 = *(_QWORD *)&v239.m12 - *(_QWORD *)&v239.m11;
            if (*(_QWORD *)&v239.m12 != *(_QWORD *)&v239.m11)
            {
              std::vector<TSDBrushVertexData>::__vallocate[abi:nn180100](&v244, v58 >> 5);
              v59 = v245;
              memmove(v245, *(const void **)&v57, v58);
              v245 = &v59[32 * (v58 >> 5)];
            }
            objc_msgSend(v202, "updateMetalDataBufferAttributes:withBlock:", v200, v243);
            objc_msgSend(v211, "addObject:", v202);
            v49 += v56;
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v49 >= v208);
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v210, "addObject:", v60);

            if (v244)
            {
              v245 = v244;
              operator delete(v244);
            }

          }
          while (v49 < v208);
          v47 = v239.m11;
          v39 = v191;
          v40 = v186;
        }
        if (v47 != 0.0)
        {
          v239.m12 = v47;
          operator delete(*(void **)&v47);
        }
      }
      while (v39 < v40);
    }
    if (!v185)
    {
      v66 = 70;
      v67 = v170;
      v68 = v159;
LABEL_65:
      +[TSDCapabilities currentCapabilities](TSDCapabilities, "currentCapabilities");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "maximumMetalTextureSizeForDevice:", v188);
      v81 = v80;
      v83 = v82;

      v84 = v67;
      v85 = v68;
      if (!v183)
      {
        v86 = (double)v68 + (double)v68;
        v87 = (double)v67 + (double)v67;
        v88 = v86 > v81 || v87 > v83;
        v84 = v67;
        v85 = v68;
        if (!v88)
        {
          v85 = (unint64_t)v86;
          v84 = (unint64_t)v87;
        }
      }
      objc_msgSend(MEMORY[0x24BDDD740], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", v66, v85, v84, 0);
      v203 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v203, "setUsage:", 5);
      objc_msgSend(v203, "setStorageMode:", 2);
      v194 = (void *)objc_msgSend(v188, "newTextureWithDescriptor:", v203);
      objc_msgSend(MEMORY[0x24BDDD740], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", v66, v68, v67, 0);
      v209 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v209, "setUsage:", 5);
      objc_msgSend(v209, "setStorageMode:", 0);
      if (v185)
      {
        objc_msgSend(v185, "surface");
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        v196 = (void *)objc_msgSend(v188, "newTextureWithDescriptor:iosurface:plane:", v209, v89, 0);

      }
      else
      {
        v196 = (void *)objc_msgSend(v188, "newTextureWithDescriptor:", v209);
      }
      objc_msgSend(MEMORY[0x24BDDD690], "renderPassDescriptor");
      v192 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v192, "colorAttachments");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v90, "objectAtIndexedSubscript:", 0);
      v166 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v166, "setTexture:", v194);
      objc_msgSend(v166, "setStoreAction:", 1);
      objc_msgSend(v166, "setLoadAction:", 2);
      objc_msgSend(v166, "setClearColor:", 0.0, 0.0, 0.0, 0.0);
      -[TSDBrushStroke p_metalBrushShaderForPixelFormat:andDevice:](v180, "p_metalBrushShaderForPixelFormat:andDevice:", v66, v188);
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      -[TSDBrushStroke p_metalOpacityShaderForPixelFormat:andDevice:](v180, "p_metalOpacityShaderForPixelFormat:andDevice:", v66, v188);
      v201 = (void *)objc_claimAutoreleasedReturnValue();
      v92 = objc_msgSend(v196, "width");
      v93 = objc_msgSend(v196, "height");
      v190 = +[TSDGPUDataBuffer newDataBufferWithVertexRect:textureRect:device:](TSDGPUDataBuffer, "newDataBufferWithVertexRect:textureRect:device:", v188, 0.0, 0.0, (double)v92, (double)v93, *MEMORY[0x24BEB3F48], *(double *)(MEMORY[0x24BEB3F48] + 8), *(double *)(MEMORY[0x24BEB3F48] + 16), *(double *)(MEMORY[0x24BEB3F48] + 24));
      v240[0] = v183;
      Components = (float64x2_t *)CGColorGetComponents((CGColorRef)objc_msgSend(v177, "CGColor"));
      *(float32x2_t *)&v95 = vcvt_f32_f64(*Components);
      *(float *)&v96 = Components[1].f64[0];
      *((_QWORD *)&v95 + 1) = __PAIR64__(1.0, v96);
      v241 = v95;
      objc_msgSend(v179, "strokeEnd");
      *(float *)&v97 = v97;
      v242 = LODWORD(v97);
      -[TSDBrushStroke p_metalTextureForCurrentStrokeAndDevice:](v180, "p_metalTextureForCurrentStrokeAndDevice:", v188);
      v193 = (void *)objc_claimAutoreleasedReturnValue();
      TSDMetalCommandQueueForRenderingDrawables(v188);
      v187 = (void *)objc_claimAutoreleasedReturnValue();
      if (v185)
      {
        objc_msgSend(v185, "frame");
        v99 = v98;
        v101 = v100;
        v102 = *(_OWORD *)(MEMORY[0x24BDE5598] + 16);
        *(_OWORD *)&v238.m11 = *MEMORY[0x24BDE5598];
        *(_OWORD *)&v238.m13 = v102;
        v103 = *(_OWORD *)(MEMORY[0x24BDE5598] + 48);
        *(_OWORD *)&v238.m21 = *(_OWORD *)(MEMORY[0x24BDE5598] + 32);
        *(_OWORD *)&v238.m23 = v103;
        v104 = *(_OWORD *)(MEMORY[0x24BDE5598] + 80);
        *(_OWORD *)&v238.m31 = *(_OWORD *)(MEMORY[0x24BDE5598] + 64);
        *(_OWORD *)&v238.m33 = v104;
        v105 = *(_OWORD *)(MEMORY[0x24BDE5598] + 112);
        *(_OWORD *)&v238.m41 = *(_OWORD *)(MEMORY[0x24BDE5598] + 96);
        *(_OWORD *)&v238.m43 = v105;
        CATransform3DScale(&v239, &v238, 2.0 / v98, -2.0 / v100, 1.0);
        v237 = v239;
        CATransform3DTranslate(&v239, &v237, v99 * -0.5, v101 * -0.5, 0.0);
        v184 = v31;
        v198 = m12;
        v205 = m11;
        v236 = v239;
        objc_msgSend(v185, "contentsScale");
        v107 = v106;
        objc_msgSend(v185, "contentsScale");
        CATransform3DScale(&v239, &v236, 1.0 / v107, 1.0 / v108, 1.0);
        v109 = v239.m11;
        v110 = v239.m12;
        m13 = v239.m13;
        m14 = v239.m14;
        m21 = v239.m21;
        m22 = v239.m22;
        m23 = v239.m23;
        m24 = v239.m24;
        m31 = v239.m31;
        ca = v239.m32;
        m33 = v239.m33;
        m34 = v239.m34;
        sxa = v239.m41;
        m42 = v239.m42;
        m44 = v239.m44;
        m43 = v239.m43;
        m.a = v205;
        m.b = v198;
        *(_OWORD *)&m.tx = v254;
        *(_OWORD *)&m.c = v253;
        CATransform3DMakeAffineTransform(&a, &m);
        b.m11 = v109;
        b.m12 = v110;
        b.m13 = m13;
        b.m14 = m14;
        b.m21 = m21;
        b.m22 = m22;
        b.m23 = m23;
        b.m24 = m24;
        b.m31 = m31;
        b.m32 = ca;
        b.m33 = m33;
        b.m34 = m34;
        b.m41 = sxa;
        b.m42 = m42;
        b.m43 = m43;
        b.m44 = m44;
        CATransform3DConcat(&v239, &a, &b);
        v182 = *(float64x2_t *)&v239.m23;
        v161 = *(float64x2_t *)&v239.m11;
        sxb = *(float64x2_t *)&v239.m21;
        v199 = *(float64x2_t *)&v239.m33;
        v169 = *(float64x2_t *)&v239.m31;
        v172 = *(float64x2_t *)&v239.m13;
        v206 = *(float64x2_t *)&v239.m43;
        *(_OWORD *)cb = *(_OWORD *)&v239.m41;
        objc_msgSend(v187, "commandBuffer");
        v117 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v117, "renderCommandEncoderWithDescriptor:", v192);
        v118 = (void *)objc_claimAutoreleasedReturnValue();
        v231[1] = 0.0;
        v231[0] = 0.0;
        v231[2] = (double)(unint64_t)objc_msgSend(v203, "width");
        v231[3] = (double)(unint64_t)objc_msgSend(v203, "height");
        v232 = xmmword_217C2A2A0;
        objc_msgSend(v118, "setViewport:", v231);
        objc_msgSend(v118, "setFragmentTexture:atIndex:", v193, 0);
        *(float32x4_t *)&v239.m11 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v161), v172);
        *(float32x4_t *)&v239.m13 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(sxb), v182);
        *(float32x4_t *)&v239.m21 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v169), v199);
        *(float32x4_t *)&v239.m23 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)cb), v206);
        objc_msgSend(v91, "setPipelineStateWithEncoder:vertexBytes:fragmentBytes:", v118, &v239, v240);
        v229 = 0u;
        v230 = 0u;
        v227 = 0u;
        v228 = 0u;
        v119 = v211;
        v120 = objc_msgSend(v119, "countByEnumeratingWithState:objects:count:", &v227, v255, 16);
        if (v120)
        {
          v121 = *(_QWORD *)v228;
          do
          {
            for (i = 0; i != v120; ++i)
            {
              if (*(_QWORD *)v228 != v121)
                objc_enumerationMutation(v119);
              objc_msgSend(*(id *)(*((_QWORD *)&v227 + 1) + 8 * i), "drawWithEncoder:atIndex:", v118, objc_msgSend(v91, "bufferIndex"));
            }
            v120 = objc_msgSend(v119, "countByEnumeratingWithState:objects:count:", &v227, v255, 16);
          }
          while (v120);
        }

        objc_msgSend(v118, "endEncoding");
        objc_msgSend(MEMORY[0x24BDDD690], "renderPassDescriptor");
        v123 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v123, "colorAttachments");
        v124 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v124, "objectAtIndexedSubscript:", 0);
        v125 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v125, "setTexture:", v196);
        objc_msgSend(v125, "setStoreAction:", 1);
        objc_msgSend(v125, "setLoadAction:", 2);
        objc_msgSend(v125, "setClearColor:", 0.0, 0.0, 0.0, 0.0);
        objc_msgSend(v117, "renderCommandEncoderWithDescriptor:", v123);
        v126 = (void *)objc_claimAutoreleasedReturnValue();
        v225[1] = 0.0;
        v225[0] = 0.0;
        v225[2] = (double)(unint64_t)objc_msgSend(v209, "width");
        v225[3] = (double)(unint64_t)objc_msgSend(v209, "height");
        v226 = xmmword_217C2A2A0;
        objc_msgSend(v126, "setViewport:", v225);
        objc_msgSend(v126, "setFragmentTexture:atIndex:", v194, 0);
        TSDTransform3DMakeOrtho((uint64_t)v224, 0.0, (double)(unint64_t)objc_msgSend(v209, "width"), 0.0, (double)(unint64_t)objc_msgSend(v209, "height"), -1.0, 1.0);
        *(float32x4_t *)&v223.m11 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v224[0]), v224[1]);
        *(float32x4_t *)&v223.m13 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v224[2]), v224[3]);
        *(float32x4_t *)&v223.m21 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v224[4]), v224[5]);
        *(float32x4_t *)&v223.m23 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v224[6]), v224[7]);
        v127 = v184;
        v214[0].f32[0] = v127;
        objc_msgSend(v201, "setPipelineStateWithEncoder:vertexBytes:fragmentBytes:", v126, &v223, v214);
        objc_msgSend(v190, "drawWithEncoder:atIndex:", v126, objc_msgSend(v201, "bufferIndex"));
        objc_msgSend(v126, "endEncoding");
        objc_msgSend(v117, "enqueue");
        objc_msgSend(v117, "commit");
        objc_msgSend(v117, "waitUntilCompleted");

      }
      else
      {
        v152 = vcvtpd_s64_f64(width * 0.0009765625);
        if (v152 >= 1)
        {
          v153 = 0;
          v128 = vcvtpd_s64_f64(height * 0.0009765625);
          rect = (double)v159;
          sx = 2.0 / (double)v159;
          v129 = (double)v170;
          v151 = (double)-v159 * 0.5;
          v162 = (double)-v170 * 0.5;
          v130 = v31;
          v131 = 2.0 / (double)v170;
          v157 = v128;
          do
          {
            if (v128 >= 1)
            {
              v173 = 0;
              v132 = (double)(int)(x + (double)(v153 << 10));
              do
              {
                memset(&v239, 0, sizeof(v239));
                CATransform3DMakeScale(&v239, sx, v131, 1.0);
                v222 = v239;
                v133 = (double)(int)(y + (double)(v173 << 10));
                CATransform3DTranslate(&v223, &v222, v151 - v132, v162 - v133, 0.0);
                v239 = v223;
                v220.a = m11;
                v220.b = m12;
                *(_OWORD *)&v220.c = v253;
                *(_OWORD *)&v220.tx = v254;
                CATransform3DMakeAffineTransform(&v221, &v220);
                v219 = v239;
                CATransform3DConcat(&v223, &v221, &v219);
                v134 = 0;
                v239 = v223;
                while (v134 < objc_msgSend(v211, "count"))
                {
                  objc_msgSend(v187, "commandBuffer");
                  v207 = (void *)objc_claimAutoreleasedReturnValue();
                  v135 = 0;
                  while (v134 < objc_msgSend(v211, "count") && v135 <= 8)
                  {
                    objc_msgSend(v207, "renderCommandEncoderWithDescriptor:", v192);
                    v136 = (void *)objc_claimAutoreleasedReturnValue();
                    v217[0] = 0.0;
                    v217[1] = 0.0;
                    v217[2] = (double)(unint64_t)objc_msgSend(v203, "width");
                    v217[3] = (double)(unint64_t)objc_msgSend(v203, "height");
                    v218 = xmmword_217C2A2A0;
                    objc_msgSend(v136, "setViewport:", v217);
                    objc_msgSend(v136, "setFragmentTexture:atIndex:", v193, 0);
                    *(float32x4_t *)&v223.m11 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&v239.m11), *(float64x2_t *)&v239.m13);
                    *(float32x4_t *)&v223.m13 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&v239.m21), *(float64x2_t *)&v239.m23);
                    *(float32x4_t *)&v223.m21 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&v239.m31), *(float64x2_t *)&v239.m33);
                    *(float32x4_t *)&v223.m23 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&v239.m41), *(float64x2_t *)&v239.m43);
                    objc_msgSend(v91, "setPipelineStateWithEncoder:vertexBytes:fragmentBytes:", v136, &v223, v240);
                    v135 += 2;
                    v137 = v134;
                    do
                    {
                      if (v137 >= objc_msgSend(v211, "count"))
                        break;
                      objc_msgSend(v211, "objectAtIndexedSubscript:", v137);
                      v138 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v138, "drawWithEncoder:atIndex:", v136, objc_msgSend(v91, "bufferIndex"));
                      objc_msgSend(v210, "objectAtIndexedSubscript:", v137);
                      v139 = (void *)objc_claimAutoreleasedReturnValue();
                      v140 = objc_msgSend(v139, "BOOLValue");

                      ++v137;
                    }
                    while ((v140 & 1) == 0);
                    objc_msgSend(v136, "endEncoding");
                    objc_msgSend(MEMORY[0x24BDDD690], "renderPassDescriptor");
                    v141 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v141, "colorAttachments");
                    v142 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v142, "objectAtIndexedSubscript:", 0);
                    v143 = (void *)objc_claimAutoreleasedReturnValue();

                    objc_msgSend(v143, "setTexture:", v196);
                    objc_msgSend(v143, "setStoreAction:", 1);
                    if (v134)
                    {
                      objc_msgSend(v143, "setLoadAction:", 1);
                    }
                    else
                    {
                      objc_msgSend(v143, "setLoadAction:", 2);
                      objc_msgSend(v143, "setClearColor:", 0.0, 0.0, 0.0, 0.0);
                    }
                    objc_msgSend(v207, "renderCommandEncoderWithDescriptor:", v141);
                    v144 = (void *)objc_claimAutoreleasedReturnValue();
                    v215[0] = 0.0;
                    v215[1] = 0.0;
                    v215[2] = (double)(unint64_t)objc_msgSend(v209, "width");
                    v215[3] = (double)(unint64_t)objc_msgSend(v209, "height");
                    v216 = xmmword_217C2A2A0;
                    objc_msgSend(v144, "setViewport:", v215);
                    objc_msgSend(v144, "setFragmentTexture:atIndex:", v194, 0);
                    TSDTransform3DMakeOrtho((uint64_t)v213, 0.0, (double)(unint64_t)objc_msgSend(v209, "width"), 0.0, (double)(unint64_t)objc_msgSend(v209, "height"), -1.0, 1.0);
                    v214[0] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v213[0]), v213[1]);
                    v214[1] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v213[2]), v213[3]);
                    v214[2] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v213[4]), v213[5]);
                    v214[3] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v213[6]), v213[7]);
                    v212 = v130;
                    objc_msgSend(v201, "setPipelineStateWithEncoder:vertexBytes:fragmentBytes:", v144, v214, &v212);
                    objc_msgSend(v190, "drawWithEncoder:atIndex:", v144, objc_msgSend(v201, "bufferIndex"));
                    objc_msgSend(v144, "endEncoding");

                    v134 = v137;
                  }
                  if (v134 > objc_msgSend(v211, "count"))
                  {
                    objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
                    v145 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDBrushStroke p_finishMetalRenderInContext:orDirectly:pathVertexData:parameterized:shouldReverseDrawOrder:withLayoutOptions:]");
                    v146 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDBrushStroke.mm");
                    v147 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v145, "handleFailureInFunction:file:lineNumber:description:", v146, v147, 1524, CFSTR("The buffer index should not be greater than the number of buffers."));

                  }
                  v148 = objc_msgSend(v211, "count");
                  objc_msgSend(v207, "enqueue");
                  objc_msgSend(v207, "commit");
                  if (v134 >= v148)
                    objc_msgSend(v207, "waitUntilCompleted");

                }
                CGImageFromTexture = TSDMetalCreateCGImageFromTexture(v196);
                if (v183)
                {
                  v260.origin.x = (double)(int)(x + (double)(v153 << 10));
                  v260.origin.y = (double)(int)(y + (double)(v173 << 10));
                  v260.size.width = rect;
                  v260.size.height = v129;
                  CGContextDrawImage(c, v260, CGImageFromTexture);
                }
                else
                {
                  objc_msgSend(v177, "colorWithAlphaComponent:", 1.0);
                  v150 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend((id)objc_opt_class(), "p_drawColor:intoContext:usingImageAsMask:withRect:", v150, c, CGImageFromTexture, v132, v133, rect, v129);

                }
                CGImageRelease(CGImageFromTexture);
                ++v173;
              }
              while (v173 != v157);
            }
            ++v153;
            v128 = v157;
          }
          while (v153 != v152);
        }
        CGContextRestoreGState(c);
      }

      goto LABEL_84;
    }
    objc_msgSend(v185, "surface");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = objc_msgSend(v61, "pixelFormat") == 1380411457;

    if (v62)
    {
      objc_msgSend(v185, "surface");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = objc_msgSend(v63, "bytesPerElement") == 8;

      if (v64)
      {
        v65 = 1;
        v66 = 115;
LABEL_58:
        if (objc_msgSend(v185, "destinationColorSpaceOverride"))
        {
          v72 = (CGColorSpace *)objc_msgSend(v185, "destinationColorSpaceOverride");
          if (!v72)
          {
            v73 = (CFStringRef *)MEMORY[0x24BDBF278];
            if (!v65)
              v73 = (CFStringRef *)MEMORY[0x24BDBF318];
            v74 = CGColorSpaceCreateWithName(*v73);
            v72 = (CGColorSpace *)CFAutorelease(v74);
          }
          CopyByMatchingToColorSpace = CGColorCreateCopyByMatchingToColorSpace(v72, kCGRenderingIntentDefault, (CGColorRef)objc_msgSend(v177, "CGColor"), 0);
          objc_msgSend(MEMORY[0x24BEB3C40], "colorWithCGColor:", CFAutorelease(CopyByMatchingToColorSpace));
          v76 = objc_claimAutoreleasedReturnValue();

          v177 = (void *)v76;
        }
        objc_msgSend(v185, "surface");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        v68 = objc_msgSend(v77, "width");

        objc_msgSend(v185, "surface");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        v67 = objc_msgSend(v78, "height");

        goto LABEL_65;
      }
      objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDBrushStroke p_finishMetalRenderInContext:orDirectly:pathVertexData:parameterized:shouldReverseDrawOrder:withLayoutOptions:]");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDBrushStroke.mm");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "handleFailureInFunction:file:lineNumber:description:", v70, v71, 1298, CFSTR("Half float precision requires 8 bytes per element."));

    }
    v65 = 0;
    v66 = 70;
    goto LABEL_58;
  }
  v257 = CGContextGetClipBoundingBox(a3);
  v19 = v257.size.width;
  v20 = v257.size.height;
  CGContextGetCTM((CGAffineTransform *)&v239, a3);
  m11 = v239.m11;
  m12 = v239.m12;
  v253 = *(_OWORD *)&v239.m13;
  v254 = *(_OWORD *)&v239.m21;
  if (-[TSDBrushStroke p_isDrawingRasterizedIntoPDFWithContext:](self, "p_isDrawingRasterizedIntoPDFWithContext:", a3))
  {
    v252.a = m11;
    v252.b = m12;
    *(_OWORD *)&v252.c = v253;
    *(_OWORD *)&v252.tx = v254;
    CGAffineTransformScale((CGAffineTransform *)&v239, &v252, 3.0, 3.0);
    m11 = v239.m11;
    m12 = v239.m12;
    v253 = *(_OWORD *)&v239.m13;
    v254 = *(_OWORD *)&v239.m21;
  }
  v250 = v253;
  v251 = v254;
  if (v19 > 0.0 && v20 > 0.0)
  {
    if (a3)
    {
      -[TSDStroke colorForCGContext:](self, "colorForCGContext:");
      v177 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDBrushStroke p_finishMetalRenderInContext:orDirectly:pathVertexData:parameterized:shouldReverseDrawOrder:withLayoutOptions:]");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDBrushStroke.mm");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v22, v23, 1162, CFSTR("Should have either a direct context or a CGContext."));

      v177 = 0;
      v12 = v185;
    }
    goto LABEL_13;
  }
LABEL_84:
  objc_autoreleasePoolPop(context);

}

void __128__TSDBrushStroke_p_finishMetalRenderInContext_orDirectly_pathVertexData_parameterized_shouldReverseDrawOrder_withLayoutOptions___block_invoke(uint64_t a1, __int128 *a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  unint64_t v11;
  unint64_t v12;
  float *v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  _OWORD v21[5];
  uint64_t v22;
  _OWORD v23[5];
  uint64_t v24;
  _OWORD v25[5];
  uint64_t v26;
  _OWORD v27[5];
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint64_t v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint64_t v52;

  v2 = a2[3];
  v49 = a2[2];
  v50 = v2;
  v51 = a2[4];
  v52 = *((_QWORD *)a2 + 10);
  v3 = a2[1];
  v47 = *a2;
  v48 = v3;
  v4 = *(__int128 *)((char *)a2 + 136);
  v43 = *(__int128 *)((char *)a2 + 120);
  v44 = v4;
  v45 = *(__int128 *)((char *)a2 + 152);
  v46 = *((_QWORD *)a2 + 21);
  v5 = *(__int128 *)((char *)a2 + 104);
  v41 = *(__int128 *)((char *)a2 + 88);
  v42 = v5;
  v6 = a2[14];
  v37 = a2[13];
  v38 = v6;
  v39 = a2[15];
  v40 = *((_QWORD *)a2 + 32);
  v7 = a2[12];
  v35 = a2[11];
  v36 = v7;
  v8 = *(__int128 *)((char *)a2 + 312);
  v31 = *(__int128 *)((char *)a2 + 296);
  v32 = v8;
  v33 = *(__int128 *)((char *)a2 + 328);
  v34 = *((_QWORD *)a2 + 43);
  v9 = *(__int128 *)((char *)a2 + 280);
  v29 = *(__int128 *)((char *)a2 + 264);
  v30 = v9;
  if (*(_QWORD *)(a1 + 32))
  {
    v11 = 0;
    do
    {
      v12 = *(_QWORD *)(a1 + 40) + v11;
      if (!*(_BYTE *)(a1 + 80))
        v12 = *(_QWORD *)(a1 + 48) + ~v12;
      v13 = (float *)(*(_QWORD *)(a1 + 56) + 32 * v12);
      v14 = v13[1];
      v15 = v13[2];
      v16 = v13[3];
      v17 = v13[4];
      v18 = v13[5];
      v19 = v13[6];
      v20 = v13[7];
      v27[2] = v49;
      v27[3] = v50;
      v27[4] = v51;
      v28 = v52;
      v27[0] = v47;
      v27[1] = v48;
      TSDGPUUpdateDataSetMetalPoint2DAtIndex((uint64_t)v27, v11, v14, v15);
      v25[2] = v43;
      v25[3] = v44;
      v25[4] = v45;
      v26 = v46;
      v25[0] = v41;
      v25[1] = v42;
      TSDGPUUpdateDataSetMetalPoint2DAtIndex((uint64_t)v25, v11, v16, v17);
      v23[2] = v37;
      v23[3] = v38;
      v23[4] = v39;
      v24 = v40;
      v23[0] = v35;
      v23[1] = v36;
      TSDGPUUpdateDataSetMetalPoint2DAtIndex((uint64_t)v23, v11, v18, v19);
      v21[2] = v31;
      v21[3] = v32;
      v21[4] = v33;
      v22 = v34;
      v21[0] = v29;
      v21[1] = v30;
      TSDGPUUpdateDataSetMetalFloatAtIndex((uint64_t)v21, v11++, v20);
    }
    while (v11 < *(_QWORD *)(a1 + 32));
  }
}

+ (void)p_drawColor:(id)a3 intoContext:(CGContext *)a4 usingImageAsMask:(CGImage *)a5 withRect:(CGRect)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v12;
  size_t v13;
  CGContext *v14;
  size_t v15;
  size_t v16;
  CGImage *Image;
  size_t v18;
  size_t v19;
  size_t BitsPerComponent;
  size_t BitsPerPixel;
  size_t BytesPerRow;
  CGDataProvider *DataProvider;
  BOOL ShouldInterpolate;
  CGImage *v25;
  int IsPDFContext;
  size_t v27;
  CGContext *v28;
  double v29;
  double v30;
  CGFloat v31;
  CGFloat v32;
  CGImage *v33;
  __int128 v34;
  uint64_t v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v35 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  CGContextSaveGState(a4);
  v13 = CGImageGetWidth(a5);
  CGImageGetHeight(a5);
  v14 = TSDBitmapContextCreate(2, (double)v13);
  v15 = CGImageGetWidth(a5);
  v16 = CGImageGetHeight(a5);
  v36.size.width = (double)v15;
  v36.size.height = (double)v16;
  v36.origin.x = 0.0;
  v36.origin.y = 0.0;
  CGContextDrawImage(v14, v36, a5);
  Image = CGBitmapContextCreateImage(v14);
  CGContextRelease(v14);
  v34 = xmmword_217C28F40;
  v18 = CGImageGetWidth(Image);
  v19 = CGImageGetHeight(Image);
  BitsPerComponent = CGImageGetBitsPerComponent(Image);
  BitsPerPixel = CGImageGetBitsPerPixel(Image);
  BytesPerRow = CGImageGetBytesPerRow(Image);
  DataProvider = CGImageGetDataProvider(Image);
  ShouldInterpolate = CGImageGetShouldInterpolate(Image);
  v25 = CGImageMaskCreate(v18, v19, BitsPerComponent, BitsPerPixel, BytesPerRow, DataProvider, (const CGFloat *)&v34, ShouldInterpolate);
  CGImageRelease(Image);
  IsPDFContext = TSDCGContextIsPDFContext((uint64_t)a4);
  if (IsPDFContext)
  {
    v27 = CGImageGetWidth(a5);
    CGImageGetHeight(a5);
    v28 = TSDBitmapContextCreate(3, (double)v27);
    v29 = (double)CGImageGetWidth(a5);
    v30 = (double)CGImageGetHeight(a5);
    v31 = 0.0;
    v32 = 0.0;
  }
  else
  {
    v31 = x;
    v32 = y;
    v29 = width;
    v30 = height;
    v28 = a4;
  }
  v37.origin.x = v31;
  v37.origin.y = v32;
  v37.size.width = v29;
  v37.size.height = v30;
  CGContextClipToMask(v28, v37, v25);
  CGImageRelease(v25);
  CGContextSetFillColorWithColor(v28, (CGColorRef)objc_msgSend(v12, "CGColor", v34));
  v38.origin.x = v31;
  v38.origin.y = v32;
  v38.size.width = v29;
  v38.size.height = v30;
  CGContextFillRect(v28, v38);
  if (IsPDFContext)
  {
    v33 = CGBitmapContextCreateImage(v28);
    CGContextRelease(v28);
    v39.origin.x = x;
    v39.origin.y = y;
    v39.size.width = width;
    v39.size.height = height;
    CGContextDrawImage(a4, v39, v33);
    CGImageRelease(v33);
  }
  CGContextRestoreGState(a4);

}

- (BOOL)p_shouldDrawAsVectorInContext:(CGContext *)a3
{
  int IsPDFContext;
  void *v6;
  void *v7;
  void *v8;

  if (a3)
  {
    IsPDFContext = TSDCGContextIsPDFContext((uint64_t)a3);
    if (IsPDFContext)
      LOBYTE(IsPDFContext) = !-[TSDBrushStroke p_prefersRasterRenderingInContext:](self, "p_prefersRasterRenderingInContext:", a3);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDBrushStroke p_shouldDrawAsVectorInContext:]");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDBrushStroke.mm");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, v8, 1638, CFSTR("invalid nil value for '%s'"), "ctx");

    LOBYTE(IsPDFContext) = 0;
  }
  return IsPDFContext;
}

- (BOOL)p_prefersRasterRenderingInContext:(CGContext *)a3
{
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;

  if (!a3)
  {
    objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDBrushStroke p_prefersRasterRenderingInContext:]");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDBrushStroke.mm");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, v7, 1647, CFSTR("invalid nil value for '%s'"), "ctx");

  }
  if ((TSDCGContextPrefersRasterRendering((uint64_t)a3) & 1) != 0)
    return 1;
  -[TSDSmartStroke strokeName](self, "strokeName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "isEqualToString:", CFSTR("Pencil")) & 1) != 0)
  {
    v8 = 1;
  }
  else
  {
    -[TSDSmartStroke strokeName](self, "strokeName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v10, "isEqualToString:", CFSTR("Crayon"));

  }
  return v8;
}

- (BOOL)p_isDrawingRasterizedIntoPDFWithContext:(CGContext *)a3
{
  void *v5;
  void *v6;
  void *v7;
  int IsPDFContext;

  if (!a3)
  {
    objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDBrushStroke p_isDrawingRasterizedIntoPDFWithContext:]");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDBrushStroke.mm");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, v7, 1652, CFSTR("invalid nil value for '%s'"), "ctx");

  }
  IsPDFContext = TSDCGContextIsPDFContext((uint64_t)a3);
  if (IsPDFContext)
    LOBYTE(IsPDFContext) = !-[TSDBrushStroke p_shouldDrawAsVectorInContext:](self, "p_shouldDrawAsVectorInContext:", a3);
  return IsPDFContext;
}

- (BOOL)p_isFreehandDrawingStrokeWithFixedTileWidth
{
  void *v3;
  char v4;
  void *v5;

  -[TSDSmartStroke strokeName](self, "strokeName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Pencil")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    -[TSDSmartStroke strokeName](self, "strokeName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "isEqualToString:", CFSTR("Crayon"));

  }
  return v4;
}

- (int64_t)p_fastElementPercentage:(double *)a3 forOverallPercentage:(double)a4 onPath:(id)a5 withCachedCurrentElementPercentage:(id *)a6
{
  id v10;
  double v11;
  double var2;
  int64_t v13;
  uint64_t v14;
  double v15;
  unint64_t var1;

  v10 = a5;
  objc_msgSend(v10, "length");
  var2 = 0.0;
  if (a6->var0 == v10 && a6->var2 <= v11 * a4)
  {
    var1 = a6->var1;
    if (var1 <= 1)
      v13 = 1;
    else
      v13 = a6->var1;
    if (var1 <= 1)
      var2 = 0.0;
    else
      var2 = a6->var2;
  }
  else
  {
    v13 = 1;
  }
  v14 = objc_msgSend(v10, "elementPercentage:forOverallPercentage:startingElementIndex:lengthToStartingElement:", a3, v13, a4, var2);
  if (v14 > v13)
  {
    do
    {
      objc_msgSend(v10, "lengthOfElement:", v13);
      var2 = var2 + v15;
      ++v13;
    }
    while (v14 != v13);
    objc_storeStrong(&a6->var0, a5);
    a6->var1 = v14;
    a6->var2 = var2;
  }

  return v14;
}

+ (id)p_metalTextureQueue
{
  if (+[TSDBrushStroke p_metalTextureQueue]::onceToken != -1)
    dispatch_once(&+[TSDBrushStroke p_metalTextureQueue]::onceToken, &__block_literal_global_47);
  return (id)+[TSDBrushStroke p_metalTextureQueue]::sMetalTextureQueue;
}

void __37__TSDBrushStroke_p_metalTextureQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.iwork.TSDBrushStrokeMetalTextureQueue", 0);
  v1 = (void *)+[TSDBrushStroke p_metalTextureQueue]::sMetalTextureQueue;
  +[TSDBrushStroke p_metalTextureQueue]::sMetalTextureQueue = (uint64_t)v0;

}

+ (id)p_metalShaderQueue
{
  if (+[TSDBrushStroke p_metalShaderQueue]::onceToken != -1)
    dispatch_once(&+[TSDBrushStroke p_metalShaderQueue]::onceToken, &__block_literal_global_150);
  return (id)+[TSDBrushStroke p_metalShaderQueue]::sMetalShaderQueue;
}

void __36__TSDBrushStroke_p_metalShaderQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.iwork.TSDBrushStrokeMetalShaderQueue", 0);
  v1 = (void *)+[TSDBrushStroke p_metalShaderQueue]::sMetalShaderQueue;
  +[TSDBrushStroke p_metalShaderQueue]::sMetalShaderQueue = (uint64_t)v0;

}

- (id)p_metalTextureForCurrentStrokeAndDevice:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[4];
  id v10;
  TSDBrushStroke *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__15;
  v17 = __Block_byref_object_dispose__15;
  v18 = 0;
  if (-[TSDBrushStroke p_metalTextureForCurrentStrokeAndDevice:]::onceToken != -1)
    dispatch_once(&-[TSDBrushStroke p_metalTextureForCurrentStrokeAndDevice:]::onceToken, &__block_literal_global_152);
  +[TSDBrushStroke p_metalTextureQueue](TSDBrushStroke, "p_metalTextureQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__TSDBrushStroke_p_metalTextureForCurrentStrokeAndDevice___block_invoke_2;
  block[3] = &unk_24D82C710;
  v11 = self;
  v12 = &v13;
  v10 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v7;
}

void __58__TSDBrushStroke_p_metalTextureForCurrentStrokeAndDevice___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1650]), "initWithKeyOptions:valueOptions:capacity:", 512, 0, 16);
  v1 = (void *)-[TSDBrushStroke p_metalTextureForCurrentStrokeAndDevice:]::sTexturesForDevicesAndStrokes;
  -[TSDBrushStroke p_metalTextureForCurrentStrokeAndDevice:]::sTexturesForDevicesAndStrokes = v0;

}

void __58__TSDBrushStroke_p_metalTextureForCurrentStrokeAndDevice___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  _QWORD v24[2];
  _QWORD v25[3];

  v25[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend((id)-[TSDBrushStroke p_metalTextureForCurrentStrokeAndDevice:]::sTexturesForDevicesAndStrokes, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)-[TSDBrushStroke p_metalTextureForCurrentStrokeAndDevice:]::sTexturesForDevicesAndStrokes, "setObject:forKeyedSubscript:");
  }
  objc_msgSend(*(id *)(a1 + 40), "strokeName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    +[TSDBrushStrokeLoader brushStrokeLoaderForCurrentThread](TSDBrushStrokeLoader, "brushStrokeLoaderForCurrentThread");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "strokeName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "imageForStroke:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDDB48]), "initWithDevice:", *(_QWORD *)(a1 + 32));
    v11 = objc_msgSend(v9, "CGImage");
    v12 = *MEMORY[0x24BDDDB30];
    v13 = *MEMORY[0x24BDDDB10];
    v24[0] = *MEMORY[0x24BDDDB08];
    v24[1] = v13;
    v25[0] = v12;
    v25[1] = MEMORY[0x24BDBD1C0];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0;
    v15 = objc_msgSend(v10, "newTextureWithCGImage:options:error:", v11, v14, &v23);
    v16 = v23;
    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v18 = *(void **)(v17 + 40);
    *(_QWORD *)(v17 + 40) = v15;

    v19 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    if (v19)
    {
      objc_msgSend(*(id *)(a1 + 40), "strokeName");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setObject:forKeyedSubscript:", v19, v20);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDBrushStroke p_metalTextureForCurrentStrokeAndDevice:]_block_invoke_2");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDBrushStroke.mm");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v21, v22, 1735, CFSTR("Unable to load brush texture with error %@"), v16);

    }
  }

}

- (id)p_metalBrushShaderForPixelFormat:(unint64_t)a3 andDevice:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v11;
  uint64_t *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v5 = a4;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__15;
  v18 = __Block_byref_object_dispose__15;
  v19 = 0;
  if (-[TSDBrushStroke p_metalBrushShaderForPixelFormat:andDevice:]::onceToken != -1)
    dispatch_once(&-[TSDBrushStroke p_metalBrushShaderForPixelFormat:andDevice:]::onceToken, &__block_literal_global_160);
  +[TSDBrushStroke p_metalShaderQueue](TSDBrushStroke, "p_metalShaderQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __61__TSDBrushStroke_p_metalBrushShaderForPixelFormat_andDevice___block_invoke_2;
  block[3] = &unk_24D82C758;
  v11 = v5;
  v12 = &v14;
  v13 = a3;
  v7 = v5;
  dispatch_sync(v6, block);

  v8 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v8;
}

void __61__TSDBrushStroke_p_metalBrushShaderForPixelFormat_andDevice___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1650]), "initWithKeyOptions:valueOptions:capacity:", 512, 0, 16);
  v1 = (void *)-[TSDBrushStroke p_metalBrushShaderForPixelFormat:andDevice:]::sTexturesForDevicesAndPixelFormats;
  -[TSDBrushStroke p_metalBrushShaderForPixelFormat:andDevice:]::sTexturesForDevicesAndPixelFormats = v0;

}

void __61__TSDBrushStroke_p_metalBrushShaderForPixelFormat_andDevice___block_invoke_2(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  objc_msgSend((id)-[TSDBrushStroke p_metalBrushShaderForPixelFormat:andDevice:]::sTexturesForDevicesAndPixelFormats, "objectForKeyedSubscript:", a1[4]);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)-[TSDBrushStroke p_metalBrushShaderForPixelFormat:andDevice:]::sTexturesForDevicesAndPixelFormats, "setObject:forKeyedSubscript:");
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a1[6]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1[5] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  if (!*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40))
  {
    v6 = objc_alloc_init(MEMORY[0x24BDDD6A8]);
    objc_msgSend(v6, "setPixelFormat:", a1[6]);
    objc_msgSend(v6, "setBlendingEnabled:", 1);
    objc_msgSend(v6, "setDestinationAlphaBlendFactor:", 5);
    objc_msgSend(v6, "setDestinationRGBBlendFactor:", 5);
    v7 = -[TSDMetalShader initDefaultShaderWithVertexShader:fragmentShader:device:colorAttachment:]([TSDMetalShader alloc], "initDefaultShaderWithVertexShader:fragmentShader:device:colorAttachment:", CFSTR("brushStrokeVertexShader"), CFSTR("brushStrokeFragmentShader"), a1[4], v6);
    v8 = *(_QWORD *)(a1[5] + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    v10 = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a1[6]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v10, v11);

  }
}

- (id)p_metalOpacityShaderForPixelFormat:(unint64_t)a3 andDevice:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v11;
  uint64_t *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v5 = a4;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__15;
  v18 = __Block_byref_object_dispose__15;
  v19 = 0;
  if (-[TSDBrushStroke p_metalOpacityShaderForPixelFormat:andDevice:]::onceToken != -1)
    dispatch_once(&-[TSDBrushStroke p_metalOpacityShaderForPixelFormat:andDevice:]::onceToken, &__block_literal_global_167);
  +[TSDBrushStroke p_metalShaderQueue](TSDBrushStroke, "p_metalShaderQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __63__TSDBrushStroke_p_metalOpacityShaderForPixelFormat_andDevice___block_invoke_2;
  block[3] = &unk_24D82C758;
  v11 = v5;
  v12 = &v14;
  v13 = a3;
  v7 = v5;
  dispatch_sync(v6, block);

  v8 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v8;
}

void __63__TSDBrushStroke_p_metalOpacityShaderForPixelFormat_andDevice___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1650]), "initWithKeyOptions:valueOptions:capacity:", 512, 0, 16);
  v1 = (void *)-[TSDBrushStroke p_metalOpacityShaderForPixelFormat:andDevice:]::sTexturesForDevicesAndPixelFormats;
  -[TSDBrushStroke p_metalOpacityShaderForPixelFormat:andDevice:]::sTexturesForDevicesAndPixelFormats = v0;

}

void __63__TSDBrushStroke_p_metalOpacityShaderForPixelFormat_andDevice___block_invoke_2(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  objc_msgSend((id)-[TSDBrushStroke p_metalOpacityShaderForPixelFormat:andDevice:]::sTexturesForDevicesAndPixelFormats, "objectForKeyedSubscript:", a1[4]);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)-[TSDBrushStroke p_metalOpacityShaderForPixelFormat:andDevice:]::sTexturesForDevicesAndPixelFormats, "setObject:forKeyedSubscript:");
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a1[6]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1[5] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  if (!*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40))
  {
    v6 = objc_alloc_init(MEMORY[0x24BDDD6A8]);
    objc_msgSend(v6, "setPixelFormat:", a1[6]);
    objc_msgSend(v6, "setBlendingEnabled:", 1);
    objc_msgSend(v6, "setDestinationAlphaBlendFactor:", 5);
    objc_msgSend(v6, "setDestinationRGBBlendFactor:", 5);
    v7 = -[TSDMetalShader initDefaultTextureAndOpacityShaderWithDevice:colorAttachment:]([TSDMetalShader alloc], "initDefaultTextureAndOpacityShaderWithDevice:colorAttachment:", a1[4], v6);
    v8 = *(_QWORD *)(a1[5] + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    v10 = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a1[6]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v10, v11);

  }
}

@end
