@implementation TSWPTextWrapper

+ (unsigned)splitLine:(CGRect)a3 lineSegmentRects:(CGRect)a4[128] polygon:(id)a5 type:(int)a6 skipHint:(double *)a7
{
  uint64_t v8;
  double height;
  double width;
  double y;
  double x;

  v8 = *(_QWORD *)&a6;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if ((objc_msgSend(a5, "intersectsSelf") & 1) != 0)
    return objc_msgSend(a1, "p_wrappedSubrectsForRectGPC:lineSegmentRects:polygon:type:skipHint:", a4, a5, v8, a7, x, y, width, height);
  else
    return objc_msgSend(a1, "p_wrappedSubrectsForRectOptimized:lineSegmentRects:polygon:type:skipHint:", a4, a5, v8, a7, x, y, width, height);
}

+ (unsigned)p_wrappedSubrectsForRectGPC:(CGRect)a3 lineSegmentRects:(CGRect)a4[128] polygon:(id)a5 type:(int)a6 skipHint:(double *)a7
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  int *v15;
  int *v16;
  unsigned int v17;
  unsigned int v18;
  double MaxY;
  double v20;
  int *v21;
  int *v22;
  id v23;
  double MinY;
  double v25;
  double v26;
  double v27;
  int v29[6];
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v15 = (int *)objc_msgSend(a5, "polygon");
  v30.origin.x = x;
  v30.origin.y = y;
  v30.size.width = width;
  v30.size.height = height;
  v16 = polygonFromRect(v30);
  if (a7)
    *a7 = 1.0;
  TSDgpc_polygon_clip(a6 != 0, (unsigned int *)v16, v15, (unsigned int *)v29);
  TSDgpc_free_polygon((uint64_t)v16);
  free(v16);
  v17 = wrappedSubrectsFromPolygon(v29, &a4->origin.x, x, y, width, height);
  v18 = v17;
  if (a7)
  {
    if (!v17)
    {
      objc_msgSend(a5, "bounds");
      MaxY = CGRectGetMaxY(v31);
      v32.origin.x = x;
      v32.origin.y = y;
      v32.size.width = width;
      v32.size.height = height;
      v20 = MaxY - CGRectGetMinY(v32);
      v33.origin.x = x;
      v33.origin.y = y;
      v33.size.width = width;
      v33.size.height = v20;
      if (CGRectGetHeight(v33) > 0.0)
      {
        TSDgpc_free_polygon((uint64_t)v29);
        v34.origin.x = x;
        v34.origin.y = y;
        v34.size.width = width;
        v34.size.height = v20;
        v21 = polygonFromRect(v34);
        TSDgpc_polygon_clip(3u, (unsigned int *)v21, v15, (unsigned int *)v29);
        TSDgpc_polygon_clip(0, (unsigned int *)v29, v15, (unsigned int *)v29);
        v35.origin.x = x;
        v35.origin.y = y;
        v35.size.width = width;
        v35.size.height = height;
        v22 = polygonFromRect(v35);
        TSDgpc_polygon_clip(0, (unsigned int *)v29, v22, (unsigned int *)v29);
        TSDgpc_free_polygon((uint64_t)v22);
        free(v22);
        if (v29[0])
        {
          v23 = bezierFromPolygon(v29);
          if (objc_msgSend(v23, "isEmpty"))
          {
            v36.origin.x = x;
            v36.origin.y = y;
            v36.size.width = width;
            v36.size.height = v20;
            MinY = CGRectGetMaxY(v36);
          }
          else
          {
            objc_msgSend(v23, "bounds");
            MinY = CGRectGetMinY(v39);
          }
          v27 = MinY;
          v40.origin.x = x;
          v40.origin.y = y;
          v40.size.width = width;
          v40.size.height = height;
          v26 = v27 - CGRectGetMaxY(v40);
          if (floor(v26) <= 0.0)
            v26 = 1.0;
        }
        else
        {
          v37.origin.x = x;
          v37.origin.y = y;
          v37.size.width = width;
          v37.size.height = v20;
          v25 = CGRectGetMaxY(v37);
          v38.origin.x = x;
          v38.origin.y = y;
          v38.size.width = width;
          v38.size.height = height;
          v26 = fmax(floor(v25 - CGRectGetMaxY(v38)), 1.0);
        }
        *a7 = v26;
        TSDgpc_free_polygon((uint64_t)v21);
        free(v21);
      }
    }
  }
  TSDgpc_free_polygon((uint64_t)v29);
  return v18;
}

+ (double)unobstructedSpanForPath:(id)a3 startingSpan:(CGRect)a4 columnBounds:(CGRect)a5
{
  CGFloat height;
  CGFloat width;
  double y;
  CGFloat x;
  double MaxY;
  int *v11;
  int *v12;
  int *v13;
  double v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  double MinY;
  double v27;
  CGFloat v30;
  unsigned int v31[4];
  uint64_t v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  MaxY = CGRectGetMaxY(a5);
  v33.origin.x = x;
  v33.origin.y = y;
  v33.size.width = width;
  v33.size.height = height;
  v34.size.height = MaxY - CGRectGetMinY(v33);
  v34.origin.x = x;
  v34.origin.y = y;
  v34.size.width = width;
  v11 = polygonFromRect(v34);
  v12 = polygonFromBezier(a3);
  TSDgpc_polygon_clip(1u, (unsigned int *)v11, v12, (unsigned int *)v12);
  TSDgpc_free_polygon((uint64_t)v11);
  free(v11);
  v30 = height;
  while (1)
  {
    v35.origin.x = x;
    v35.origin.y = y;
    v35.size.width = width;
    v35.size.height = height;
    v13 = polygonFromRect(v35);
    TSDgpc_polygon_clip(1u, (unsigned int *)v13, v12, v31);
    TSDgpc_free_polygon((uint64_t)v13);
    free(v13);
    if (!v31[0])
      break;
    v14 = boundsForVertexList(v32);
    v16 = v15;
    v18 = v17;
    v20 = v19;
    if ((int)v31[0] >= 2)
    {
      v21 = 16;
      v22 = 1;
      do
      {
        v41.origin.x = boundsForVertexList(v32 + v21);
        v41.origin.y = v23;
        v41.size.width = v24;
        v41.size.height = v25;
        v36.origin.x = v14;
        v36.origin.y = v16;
        v36.size.width = v18;
        v36.size.height = v20;
        v37 = CGRectUnion(v36, v41);
        v14 = v37.origin.x;
        v16 = v37.origin.y;
        v18 = v37.size.width;
        v20 = v37.size.height;
        ++v22;
        v21 += 16;
      }
      while (v22 < (int)v31[0]);
    }
    TSDgpc_free_polygon((uint64_t)v31);
    if (v20 < 1.0)
      goto LABEL_10;
    v38.origin.x = v14;
    v38.origin.y = v16;
    v38.size.width = v18;
    v38.size.height = v20;
    y = CGRectGetMaxY(v38) + 1.0;
    v39.origin.x = x;
    v39.origin.y = y;
    v39.size.width = width;
    height = v30;
    v39.size.height = v30;
    MinY = CGRectGetMinY(v39);
    if (MinY > CGRectGetMaxY(a5))
      goto LABEL_11;
  }
  TSDgpc_free_polygon((uint64_t)v31);
LABEL_10:
  height = v30;
LABEL_11:
  v40.origin.x = x;
  v40.origin.y = y;
  v40.size.width = width;
  v40.size.height = height;
  v27 = CGRectGetMinY(v40);
  TSDgpc_free_polygon((uint64_t)v12);
  free(v12);
  return v27;
}

+ (unsigned)p_wrappedSubrectsForRectOptimized:(CGRect)a3 lineSegmentRects:(CGRect)a4[128] polygon:(id)a5 type:(int)a6 skipHint:(double *)a7
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double MaxY;
  double MinY;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  uint64_t v22;
  int *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  unint64_t v28;
  CGFloat v29;
  uint64_t v30;
  int v31;
  unsigned int v32;
  int v33;
  double v34;
  size_t v35;
  double v36;
  double v37;
  double v38;
  uint64_t *v39;
  uint64_t v40;
  unint64_t v41;
  double *v42;
  uint64_t v43;
  unint64_t v44;
  double v45;
  double v46;
  int v47;
  int v48;
  void *v49;
  uint64_t v50;
  unsigned int v51;
  int v52;
  unsigned int v53;
  double v54;
  double v55;
  double *v56;
  int v57;
  int v58;
  double v59;
  double v60;
  double v61;
  double v62;
  uint64_t v63;
  unsigned int v64;
  uint64_t v65;
  double v67;
  uint64_t v68;
  double v69;
  double v71;
  uint64_t v72;
  double v73;
  double v74;
  uint64_t v75;
  double v76;
  double MinX;
  int v78;
  uint64_t v79;
  uint64_t v80;
  unint64_t v81;
  CGFloat MaxX;
  double v83;
  CGFloat v84;
  CGFloat v85;
  CGRect *v86;
  _BOOL4 v87;
  double v89;
  CGRect *__attribute__((__org_arrdim(0,128))) v90;
  CGFloat rect;
  CGFloat v92;
  CGFloat v93;
  CGFloat v94;
  double v96;
  CGFloat v97;
  CGFloat v98;
  int v99;
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

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (a7)
    *a7 = 1.0;
  MaxY = CGRectGetMaxY(a3);
  v100.origin.x = x;
  v100.origin.y = y;
  v94 = width;
  v100.size.width = width;
  v100.size.height = height;
  MinY = CGRectGetMinY(v100);
  objc_msgSend(a5, "bounds");
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v98 = v21;
  v22 = objc_msgSend(a5, "polygon");
  if (!v22)
  {
    a4->origin.x = x;
LABEL_15:
    LODWORD(v28) = 1;
    v27 = v94;
    goto LABEL_16;
  }
  v23 = (int *)v22;
  v92 = v20;
  v93 = x;
  if (!+[TSWPTextWrapper p_wrappedSubrectsForRectOptimized:lineSegmentRects:polygon:type:skipHint:]::markers)
    +[TSWPTextWrapper p_wrappedSubrectsForRectOptimized:lineSegmentRects:polygon:type:skipHint:]::markers = (uint64_t)malloc_type_calloc(0x10uLL, 0x800uLL, 0xC6A803DuLL);
  v101.origin.x = x;
  v101.origin.y = y;
  v101.size.width = v94;
  v101.size.height = height;
  v122.origin.x = v16;
  v122.origin.y = v18;
  v122.size.width = v20;
  v122.size.height = v98;
  if (!CGRectIntersectsRect(v101, v122))
  {
    if (a6 != 1)
      goto LABEL_105;
    a4->origin.x = x;
    goto LABEL_15;
  }
  v102.origin.x = x;
  v102.origin.y = y;
  v102.size.width = v94;
  v102.size.height = height;
  rect = height;
  v24 = CGRectGetMinY(v102);
  v103.origin.y = v18;
  v103.origin.x = v16;
  v103.size.width = v20;
  v103.size.height = v98;
  if (v24 >= CGRectGetMinY(v103))
    goto LABEL_17;
  v104.origin.x = x;
  v104.origin.y = y;
  v104.size.width = v94;
  v104.size.height = rect;
  v25 = CGRectGetMaxY(v104);
  v105.origin.y = v18;
  v105.origin.x = v16;
  v105.size.width = v20;
  v105.size.height = v98;
  if (v25 <= CGRectGetMaxY(v105))
  {
LABEL_17:
    v29 = y;
    v90 = a4;
    if (*v23 >= 1)
    {
      v30 = 0;
      v31 = 0;
      v99 = 0;
      v32 = 0;
      if (a6 == 1)
        v33 = 1;
      else
        v33 = -1;
      v34 = 0.0;
      v35 = 2048;
      v36 = 0.0;
      v37 = 0.0;
      v38 = 0.0;
      v39 = &p_thumbnailImageDataForImageData__sOnce;
      while (1)
      {
        v40 = *((_QWORD *)v23 + 2);
        v41 = *(unsigned int *)(v40 + 16 * v30);
        if ((_DWORD)v41)
        {
          v42 = (double *)(*(_QWORD *)(v40 + 16 * v30 + 8) + 8);
          v43 = 1;
          do
          {
            v44 = v43;
            v45 = *v42;
            v42 += 2;
            v46 = v45;
            if (v45 < MaxY)
              v47 = 1;
            else
              v47 = 2;
            if (v46 <= MinY)
              v31 = 0;
            else
              v31 = v47;
            v43 = v44 + 1;
          }
          while (v44 < v41 && v31 == 1);
          v48 = v44 - 1;
        }
        else
        {
          v49 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
          v50 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSWPTextWrapper p_wrappedSubrectsForRectOptimized:lineSegmentRects:polygon:type:skipHint:]");
          objc_msgSend(v49, "handleFailureInFunction:file:lineNumber:description:", v50, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPTextWrapper.mm"), 484, CFSTR("Invalid number of vertices in polygon."));
          v39 = &p_thumbnailImageDataForImageData__sOnce;
          v48 = 0;
        }
        v51 = 0;
        if (a6 == 1)
          v52 = 0;
        else
          v52 = v41;
        v53 = v48 + v52;
        do
        {
          v54 = v36;
          v55 = v34;
          v56 = (double *)(*(_QWORD *)(*((_QWORD *)v23 + 2) + 16 * v30 + 8) + 16 * (v53 % v41));
          v36 = *v56;
          v34 = v56[1];
          if (v34 < MaxY)
            v57 = 1;
          else
            v57 = 2;
          if (v34 <= MinY)
            v58 = 0;
          else
            v58 = v57;
          if (!v51)
            goto LABEL_102;
          if (v58 == v31)
          {
            if (v37 >= v36)
              v59 = v36;
            else
              v59 = v37;
            if (v38 <= v36)
              v60 = v36;
            else
              v60 = v38;
            if (v31 == 1)
            {
              v38 = v60;
              v37 = v59;
              v58 = 1;
            }
            else
            {
              v58 = v31;
            }
          }
          else
          {
            v61 = v34 - v55;
            v62 = v36 - v54;
            if (v31)
            {
              if (v31 != 1)
              {
                if (v58 == 1)
                {
                  v73 = v54 + (MaxY - v55) / v61 * v62;
                  if (v73 <= v36)
                    v38 = v36;
                  else
                    v38 = v73;
                  if (v73 >= v36)
                    v37 = v36;
                  else
                    v37 = v73;
LABEL_88:
                  v99 = 2;
                  goto LABEL_100;
                }
                v76 = v54 + (MinY - v55) / v61 * v62;
                v71 = v54 + (MaxY - v55) / v61 * v62;
                if (v76 > v71)
                  v71 = v76;
                v72 = v39[102] + 16 * v32++;
                *(_QWORD *)v72 = 1;
                goto LABEL_99;
              }
              v63 = v39[102];
              v64 = v32 + 1;
              v65 = v63 + 16 * v32;
              if (v34 <= MinY || v34 < MaxY)
              {
                v67 = v54 + (MinY - v55) / v61 * v62;
                if (v38 <= v67)
                  v38 = v67;
                *(_QWORD *)v65 = 1;
                *(double *)(v65 + 8) = v38;
                if (!v99)
                {
                  v99 = 0;
                  if (v37 >= v67)
                    v37 = v67;
                  v32 += 2;
                  v68 = v63 + 16 * v64;
                  *(_QWORD *)v68 = 0;
                  *(double *)(v68 + 8) = v37;
                  goto LABEL_100;
                }
              }
              else
              {
                v74 = v54 + (MaxY - v55) / v61 * v62;
                if (v37 >= v74)
                  v37 = v74;
                *(_QWORD *)v65 = 0;
                *(double *)(v65 + 8) = v37;
                if (v99 == 2)
                {
                  if (v38 <= v74)
                    v38 = v74;
                  v32 += 2;
                  v75 = v63 + 16 * v64;
                  *(_QWORD *)v75 = 1;
                  *(double *)(v75 + 8) = v38;
                  goto LABEL_88;
                }
              }
              ++v32;
            }
            else
            {
              v69 = v54 + (MinY - v55) / v61 * v62;
              if (v34 <= MinY || v34 >= MaxY)
              {
                v71 = v54 + (MaxY - v55) / v61 * v62;
                if (v69 < v71)
                  v71 = v69;
                v72 = v39[102] + 16 * v32++;
                *(_QWORD *)v72 = 0;
LABEL_99:
                *(double *)(v72 + 8) = v71;
                goto LABEL_100;
              }
              v99 = 0;
              if (v69 <= v36)
                v38 = v36;
              else
                v38 = v54 + (MinY - v55) / v61 * v62;
              if (v69 >= v36)
                v37 = v36;
              else
                v37 = v54 + (MinY - v55) / v61 * v62;
            }
          }
LABEL_100:
          if (v35 - 2 <= v32)
          {
            v35 *= 2;
            +[TSWPTextWrapper p_wrappedSubrectsForRectOptimized:lineSegmentRects:polygon:type:skipHint:]::markers = (uint64_t)malloc_type_realloc((void *)v39[102], v35, 0x515CE8FBuLL);
            bzero((void *)(+[TSWPTextWrapper p_wrappedSubrectsForRectOptimized:lineSegmentRects:polygon:type:skipHint:]::markers+ 16 * v32), 16 * (v35 - v32));
            v39 = &p_thumbnailImageDataForImageData__sOnce;
          }
LABEL_102:
          v31 = v58;
          ++v51;
          v53 += v33;
        }
        while (v51 <= v41);
        if (++v30 >= *v23)
          goto LABEL_107;
      }
    }
    v32 = 0;
    v39 = &p_thumbnailImageDataForImageData__sOnce;
LABEL_107:
    qsort((void *)v39[102], v32, 0x10uLL, (int (__cdecl *)(const void *, const void *))TSWPTextWrapMarkerCompare);
    v112.origin.x = v93;
    v112.origin.y = y;
    v112.size.width = v94;
    v112.size.height = rect;
    MinX = CGRectGetMinX(v112);
    v78 = !a6
       || *(_DWORD *)+[TSWPTextWrapper p_wrappedSubrectsForRectOptimized:lineSegmentRects:polygon:type:skipHint:]::markers == 1;
    if (v32)
    {
      v79 = 0;
      v28 = 0;
      v80 = +[TSWPTextWrapper p_wrappedSubrectsForRectOptimized:lineSegmentRects:polygon:type:skipHint:]::markers;
      v81 = 1;
      do
      {
        if (*(_DWORD *)(v80 + v79))
        {
          if (!--v78)
          {
            v78 = 0;
            if (*(double *)(v80 + v79 + 8) > MinX)
              MinX = *(double *)(v80 + v79 + 8);
          }
        }
        else
        {
          if (!v78)
          {
            v113.origin.x = v93;
            v113.origin.y = y;
            v113.size.width = v94;
            v113.size.height = rect;
            MaxX = CGRectGetMaxX(v113);
            v83 = *(double *)(+[TSWPTextWrapper p_wrappedSubrectsForRectOptimized:lineSegmentRects:polygon:type:skipHint:]::markers
                            + v79
                            + 8);
            if (MaxX < v83)
            {
              v114.origin.x = v93;
              v114.origin.y = y;
              v114.size.width = v94;
              v114.size.height = rect;
              v83 = CGRectGetMaxX(v114);
            }
            v115.origin.x = v93;
            v115.origin.y = y;
            v115.size.width = v94;
            v115.size.height = rect;
            v84 = CGRectGetMinY(v115);
            v116.origin.x = v93;
            v116.origin.y = y;
            v116.size.width = v94;
            v116.size.height = rect;
            v85 = CGRectGetHeight(v116);
            v86 = &v90[v28++];
            v86->origin.x = MinX;
            v86->origin.y = v84;
            v86->size.width = v83 - MinX;
            v86->size.height = v85;
            v80 = +[TSWPTextWrapper p_wrappedSubrectsForRectOptimized:lineSegmentRects:polygon:type:skipHint:]::markers;
          }
          ++v78;
        }
        v87 = v28 < 0x80;
        if (v81 >= v32)
          break;
        ++v81;
        v79 += 16;
      }
      while (v28 < 0x80);
    }
    else
    {
      v28 = 0;
      v87 = 1;
    }
    if (v78)
      return v28;
    if (!v87)
      return v28;
    v117.origin.x = v93;
    v117.origin.y = y;
    v117.size.width = v94;
    v117.size.height = rect;
    if (MinX >= CGRectGetMaxX(v117))
      return v28;
    v118.origin.x = v93;
    v118.origin.y = y;
    v118.size.width = v94;
    v118.size.height = rect;
    y = CGRectGetMinY(v118);
    v119.origin.x = v93;
    v119.origin.y = v29;
    v119.size.width = v94;
    v119.size.height = rect;
    v27 = CGRectGetMaxX(v119) - MinX;
    v120.origin.x = v93;
    v120.origin.y = v29;
    v120.size.width = v94;
    v120.size.height = rect;
    height = CGRectGetHeight(v120);
    a4 = &v90[v28];
    LODWORD(v28) = v28 + 1;
    a4->origin.x = MinX;
LABEL_16:
    a4->origin.y = y;
    a4->size.width = v27;
    a4->size.height = height;
    return v28;
  }
  if (a6 != 1)
  {
LABEL_105:
    LODWORD(v28) = 0;
    return v28;
  }
  v106.origin.x = v16;
  v106.origin.y = v18;
  v106.size.width = v20;
  v106.size.height = v98;
  v96 = CGRectGetMinX(v106);
  v107.origin.x = x;
  v107.origin.y = y;
  v107.size.width = v94;
  v107.size.height = rect;
  v89 = v96 - CGRectGetMinX(v107);
  v108.origin.x = v16;
  v108.origin.y = v18;
  v108.size.width = v20;
  v108.size.height = v98;
  v97 = CGRectGetMaxX(v108);
  v109.origin.x = x;
  v109.origin.y = y;
  v109.size.width = v94;
  v109.size.height = rect;
  v26 = CGRectGetMaxX(v109);
  v110.origin.x = v16;
  v110.origin.y = v18;
  v110.size.width = v92;
  v110.size.height = v98;
  v27 = v26 - CGRectGetMaxX(v110);
  height = rect;
  v111.origin.x = v93;
  v111.origin.y = y;
  v111.size.width = v89;
  v111.size.height = rect;
  if (CGRectGetWidth(v111) <= 0.0)
  {
    v28 = 0;
  }
  else
  {
    a4->origin.x = v93;
    a4->origin.y = y;
    v28 = 1;
    a4->size.width = v89;
    a4->size.height = rect;
  }
  v121.origin.x = v97;
  v121.origin.y = y;
  v121.size.width = v27;
  v121.size.height = rect;
  if (CGRectGetWidth(v121) > 0.0)
  {
    a4 += v28;
    LODWORD(v28) = v28 + 1;
    a4->origin.x = v97;
    goto LABEL_16;
  }
  return v28;
}

@end
