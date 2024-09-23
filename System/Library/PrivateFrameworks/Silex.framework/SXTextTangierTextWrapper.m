@implementation SXTextTangierTextWrapper

- (void)setExclusionPaths:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_storeStrong((id *)&self->_exclusionPaths, a3);
  -[SXTextTangierTextWrapper tangierExclusionPaths](self, "tangierExclusionPaths");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeAllObjects");

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[SXTextTangierTextWrapper exclusionPaths](self, "exclusionPaths", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v7);
        -[SXTextExclusionPath path](*(double **)(*((_QWORD *)&v14 + 1) + 8 * v10));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "TSDBezierPath");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        -[SXTextTangierTextWrapper tangierExclusionPaths](self, "tangierExclusionPaths");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addObject:", v12);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

}

- (id)beginWrappingToColumn:(id)a3 target:(id)a4 hasWrapables:(BOOL *)a5
{
  id v8;
  id v9;
  SXTextTangierTextWrapContext *v10;
  __int128 v11;
  __int128 v12;
  CGAffineTransform *p_canvasSpaceToWrapSpace;
  __int128 v14;
  __int128 v15;
  void *v16;
  void *v17;
  CGAffineTransform v19;
  CGAffineTransform v20;

  v8 = a3;
  v9 = a4;
  v10 = -[SXTextTangierTextWrapContext initWithColumn:targetLayout:]([SXTextTangierTextWrapContext alloc], "initWithColumn:targetLayout:", v8, v9);
  v12 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  v11 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  *(_OWORD *)&self->_canvasSpaceToWrapSpace.a = *MEMORY[0x24BDBD8B8];
  *(_OWORD *)&self->_canvasSpaceToWrapSpace.c = v12;
  *(_OWORD *)&self->_canvasSpaceToWrapSpace.tx = v11;
  if (objc_msgSend(v9, "textIsVertical"))
  {
    p_canvasSpaceToWrapSpace = &self->_canvasSpaceToWrapSpace;
    v14 = *(_OWORD *)&p_canvasSpaceToWrapSpace->c;
    *(_OWORD *)&v19.a = *(_OWORD *)&p_canvasSpaceToWrapSpace->a;
    *(_OWORD *)&v19.c = v14;
    *(_OWORD *)&v19.tx = *(_OWORD *)&p_canvasSpaceToWrapSpace->tx;
    CGAffineTransformRotate(&v20, &v19, -1.57079633);
    v15 = *(_OWORD *)&v20.c;
    *(_OWORD *)&p_canvasSpaceToWrapSpace->a = *(_OWORD *)&v20.a;
    *(_OWORD *)&p_canvasSpaceToWrapSpace->c = v15;
    *(_OWORD *)&p_canvasSpaceToWrapSpace->tx = *(_OWORD *)&v20.tx;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    objc_msgSend(v9, "info");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    TSUDynamicCast();
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17 && objc_msgSend(v17, "attachmentCount"))
      *a5 = 1;

  }
  return v10;
}

- (unsigned)splitLine:(CGRect)a3 lineSegmentRects:(CGRect)a4[128] wrappableAttachments:(id)a5 ignoreFloatingGraphics:(BOOL)a6 floatingCausedWrap:(BOOL *)a7 skipHint:(double *)a8 userInfo:(id)a9
{
  uint64_t v9;
  void *v10;
  void *v11;
  double *v12;
  double *v13;
  double *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  id v21;
  void *v22;
  void *v23;
  __int128 v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  int v28;
  int v29;
  int v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  BOOL v35;
  double v36;
  CGFloat v37;
  double v38;
  CGFloat v39;
  double v40;
  CGFloat v41;
  double v42;
  CGFloat v43;
  __int128 v44;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v49;
  double MaxY;
  uint64_t v51;
  double v52;
  double v53;
  double MaxX;
  double v55;
  double v56;
  double v57;
  double v58;
  CGFloat v59;
  double v60;
  double v61;
  CGFloat v62;
  CGFloat v63;
  double v64;
  CGFloat v65;
  double v66;
  CGFloat v67;
  int v68;
  double v69;
  double v70;
  CGRect *v71;
  double v72;
  CGSize size;
  CGRect *v74;
  double v75;
  uint64_t v76;
  void *v78;
  double v79;
  double v80;
  CGFloat v81;
  CGFloat v82;
  CGFloat MinY;
  id v84;
  void *v85;
  CGFloat v86;
  double MinX;
  CGFloat v88;
  id v89;
  double *v90;
  void *v91;
  double *v92;
  void *v93;
  id obj;
  void *v95;
  unint64_t v96;
  uint64_t v97;
  double v98;
  double v99;
  uint64_t v100;
  CGAffineTransform v101;
  CGAffineTransform v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  _OWORD v107[3];
  _BYTE v108[128];
  CGRect rect[128];
  uint64_t v110;
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
  CGRect v147;
  CGRect v148;

  v9 = MEMORY[0x24BDAC7A8](self, a2, a4, a5, a6, a7, a8, a9, (__n128)a3.origin, *(__n128 *)&a3.origin.y, (__n128)a3.size, *(__n128 *)&a3.size.height);
  v11 = v10;
  v13 = v12;
  v92 = v14;
  v16 = v15;
  v98 = v17;
  v99 = v18;
  v20 = v19;
  v100 = v9;
  v110 = *MEMORY[0x24BDAC8D0];
  v89 = v21;
  v84 = v11;
  objc_opt_class();
  TSUDynamicCast();
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "column");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "target");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
    *v13 = 1.0;
  *v92 = v98;
  v92[1] = v20;
  v92[2] = v99;
  v92[3] = v16;
  objc_msgSend(v95, "interiorWrapPolygon");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v22, "copy");

  v85 = v23;
  if (v23)
  {
    v24 = *(_OWORD *)(v100 + 40);
    v107[0] = *(_OWORD *)(v100 + 24);
    v107[1] = v24;
    v107[2] = *(_OWORD *)(v100 + 56);
    objc_msgSend(v23, "transformUsingAffineTransform:", v107);
    v96 = objc_msgSend((id)v100, "intersectRects:rects1Count:rects2:rects2Count:minSize:", v92, 1, rect, objc_msgSend(MEMORY[0x24BEB3B78], "splitLine:lineSegmentRects:polygon:type:skipHint:", rect, v23, 0, 0, v98, v20, v99, v16), 0.01);
  }
  else
  {
    v96 = 1;
  }
  objc_msgSend((id)v100, "collectWrappables:target:", v89, v93);
  v105 = 0u;
  v106 = 0u;
  v103 = 0u;
  v104 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v103, v108, 16);
  if (v25)
  {
    v90 = v13;
    v97 = *(_QWORD *)v104;
    do
    {
      v26 = 0;
      do
      {
        if (*(_QWORD *)v104 != v97)
          objc_enumerationMutation(obj);
        v27 = *(void **)(*((_QWORD *)&v103 + 1) + 8 * v26);
        v28 = objc_msgSend(v27, "wrapDirection", v78);
        v29 = objc_msgSend(v27, "wrapFitType");
        v30 = objc_msgSend(v27, "wrapType");
        objc_opt_class();
        v78 = &unk_254EFB9B0;
        TSUClassAndProtocolCast();
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        if (v31)
        {
          objc_msgSend((id)v100, "groupInfoContainingWrappable:", v31, &unk_254EFB9B0);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = v32;
          if (v32)
          {
            objc_msgSend(v32, "exteriorTextWrap");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v34, "isHTMLWrap") & 1) != 0 || objc_msgSend(v33, "isInlineWithText"))
            {
              if (v34)
              {
                v28 = objc_msgSend(v34, "direction");
                v29 = objc_msgSend(v34, "fitType");
                v30 = objc_msgSend(v34, "type");
              }
              else
              {
                v30 = 0;
                v29 = 0;
                v28 = 2;
              }
            }

          }
        }
        if (v30)
          v35 = v30 == 5;
        else
          v35 = 1;
        if (v35)
          goto LABEL_65;
        if (v30 == 4)
        {
          if (objc_msgSend((id)v100, "textShouldFlowAroundWrappable:inTarget:inColumn:", v27, v93, v91))
          {
            v28 = 2;
            v30 = 1;
          }
          else
          {
            v30 = 2;
          }
        }
        objc_msgSend(v27, "boundsInfluencingExteriorWrap", v78);
        v37 = v36;
        v39 = v38;
        v41 = v40;
        v43 = v42;
        if (v95)
          objc_msgSend(v95, "targetInverseTransformInRoot");
        else
          memset(&v102, 0, sizeof(v102));
        v111.origin.x = v37;
        v111.origin.y = v39;
        v111.size.width = v41;
        v111.size.height = v43;
        v112 = CGRectApplyAffineTransform(v111, &v102);
        v44 = *(_OWORD *)(v100 + 40);
        *(_OWORD *)&v101.a = *(_OWORD *)(v100 + 24);
        *(_OWORD *)&v101.c = v44;
        *(_OWORD *)&v101.tx = *(_OWORD *)(v100 + 56);
        v113 = CGRectApplyAffineTransform(v112, &v101);
        x = v113.origin.x;
        y = v113.origin.y;
        width = v113.size.width;
        height = v113.size.height;
        v147.origin.x = v98;
        v147.size.width = v99;
        v147.origin.y = v20;
        v147.size.height = v16;
        if (!CGRectIntersectsRect(v113, v147))
        {
          rect[0].origin.x = v98;
          rect[0].origin.y = v20;
          rect[0].size.width = v99;
          rect[0].size.height = v16;
          goto LABEL_65;
        }
        if (v30 == 2)
        {
          if (!v90)
            goto LABEL_63;
          v49 = *v90;
          v114.origin.x = x;
          v114.origin.y = y;
          v114.size.width = width;
          v114.size.height = height;
          MaxY = CGRectGetMaxY(v114);
          v115.origin.x = v98;
          v115.size.width = v99;
          v115.origin.y = v20;
          v115.size.height = v16;
          v51 = 0;
          v52 = ceil(MaxY - CGRectGetMinY(v115));
          if (v49 >= v52)
            v52 = v49;
          *v90 = v52;
        }
        else if (v29)
        {
          if (v29 != 1)
            goto LABEL_63;
          v51 = objc_msgSend((id)v100, "splitLineRect:lineSegmentRects:wrappable:wrapContext:", rect, v27, v95, v98, v20, v99, v16);
          if (!v51)
            goto LABEL_64;
          if (v30 == 3)
          {
            v116.origin.x = x;
            v116.origin.y = y;
            v116.size.width = width;
            v116.size.height = height;
            MinX = CGRectGetMinX(v116);
            v117.origin.x = v98;
            v117.size.width = v99;
            v117.origin.y = v20;
            v117.size.height = v16;
            v53 = CGRectGetMinX(v117);
            v118.origin.x = v98;
            v118.size.width = v99;
            v118.origin.y = v20;
            v118.size.height = v16;
            MaxX = CGRectGetMaxX(v118);
            v119.origin.x = x;
            v119.origin.y = y;
            v119.size.width = width;
            v119.size.height = height;
            if (MinX - v53 >= MaxX - CGRectGetMaxX(v119))
              goto LABEL_61;
          }
          else if (v28 != 1)
          {
            if (v28)
              goto LABEL_64;
LABEL_61:
            v70 = CGRectGetMinX(rect[0]);
            v142.origin.x = x;
            v142.origin.y = y;
            v142.size.width = width;
            v142.size.height = height;
            v51 = v70 <= CGRectGetMinX(v142);
            goto LABEL_64;
          }
          v71 = &rect[v51 - 1];
          v72 = CGRectGetMaxX(*v71);
          v143.origin.x = x;
          v143.origin.y = y;
          v143.size.width = width;
          v143.size.height = height;
          if (v72 < CGRectGetMaxX(v143))
            goto LABEL_63;
          size = rect[v51 - 1].size;
          rect[0].origin = v71->origin;
          rect[0].size = size;
          v51 = 1;
        }
        else
        {
          v120.origin.x = v98;
          v120.size.width = v99;
          v120.origin.y = v20;
          v120.size.height = v16;
          v55 = CGRectGetMaxX(v120);
          v121.origin.x = x;
          v121.origin.y = y;
          v121.size.width = width;
          v121.size.height = height;
          if (v55 <= CGRectGetMaxX(v121))
            goto LABEL_51;
          v122.origin.x = v98;
          v122.size.width = v99;
          v122.origin.y = v20;
          v122.size.height = v16;
          v56 = CGRectGetMinX(v122);
          v123.origin.x = x;
          v123.origin.y = y;
          v123.size.width = width;
          v123.size.height = height;
          if (v56 >= CGRectGetMinX(v123))
          {
LABEL_51:
            v137.origin.x = x;
            v137.origin.y = y;
            v137.size.width = width;
            v137.size.height = height;
            v148.origin.x = v98;
            v148.size.width = v99;
            v148.origin.y = v20;
            v148.size.height = v16;
            v138 = CGRectIntersection(v137, v148);
            v62 = v138.origin.x;
            v63 = v138.origin.y;
            v64 = v138.size.width;
            v65 = v138.size.height;
            v66 = CGRectGetMaxX(v138);
            v139.origin.x = v98;
            v139.size.width = v99;
            v139.origin.y = v20;
            v139.size.height = v16;
            if (v66 >= CGRectGetMaxX(v139))
            {
              v68 = 0;
              v67 = v98;
            }
            else
            {
              v140.origin.x = v62;
              v140.origin.y = v63;
              v140.size.width = v64;
              v140.size.height = v65;
              v67 = CGRectGetMaxX(v140);
              v68 = 1;
            }
            v69 = v99 - v64;
            v141.origin.x = v67;
            v141.origin.y = v20;
            v141.size.width = v69;
            v141.size.height = v16;
            if (CGRectGetWidth(v141) >= 20.0 && (v28 == 2 || v30 == 3 || v68 != (v28 == 0)))
            {
              rect[0].origin.x = v67;
              rect[0].origin.y = v20;
              v51 = 1;
              rect[0].size.width = v69;
              rect[0].size.height = v16;
              goto LABEL_64;
            }
LABEL_63:
            v51 = 0;
            goto LABEL_64;
          }
          v124.origin.x = v98;
          v124.origin.y = v20;
          v124.size.width = v99;
          v124.size.height = v16;
          v81 = CGRectGetMinX(v124);
          v125.origin.x = v98;
          v125.origin.y = v20;
          v125.size.width = v99;
          v125.size.height = v16;
          MinY = CGRectGetMinY(v125);
          v126.origin.x = x;
          v126.origin.y = y;
          v126.size.width = width;
          v126.size.height = height;
          v80 = CGRectGetMinX(v126);
          v127.origin.x = v98;
          v127.origin.y = v20;
          v127.size.width = v99;
          v127.size.height = v16;
          v79 = CGRectGetMinX(v127);
          v128.origin.x = v98;
          v128.origin.y = v20;
          v128.size.width = v99;
          v128.size.height = v16;
          v82 = CGRectGetHeight(v128);
          v129.origin.x = x;
          v129.origin.y = y;
          v129.size.width = width;
          v129.size.height = height;
          v88 = CGRectGetMaxX(v129);
          v130.origin.x = v98;
          v130.size.width = v99;
          v130.origin.y = v20;
          v130.size.height = v16;
          v86 = CGRectGetMinY(v130);
          v131.origin.x = v98;
          v131.size.width = v99;
          v131.origin.y = v20;
          v131.size.height = v16;
          v57 = CGRectGetMaxX(v131);
          v132.origin.x = x;
          v132.origin.y = y;
          v132.size.width = width;
          v132.size.height = height;
          v58 = CGRectGetMaxX(v132);
          v133.origin.x = v98;
          v133.size.width = v99;
          v133.origin.y = v20;
          v133.size.height = v16;
          v59 = CGRectGetHeight(v133);
          v134.origin.x = v81;
          v134.size.height = v82;
          v134.origin.y = MinY;
          v134.size.width = v80 - v79;
          v60 = v57 - v58;
          if (CGRectGetWidth(v134) < 20.0)
            goto LABEL_50;
          if ((v28 & 0xFFFFFFFD) == 0)
            goto LABEL_68;
          if (v30 != 3)
            goto LABEL_50;
          v135.origin.x = v81;
          v135.size.height = v82;
          v135.origin.y = MinY;
          v135.size.width = v80 - v79;
          v61 = CGRectGetWidth(v135);
          v136.origin.y = v86;
          v136.origin.x = v88;
          v136.size.width = v60;
          v136.size.height = v59;
          if (v61 >= CGRectGetWidth(v136))
          {
LABEL_68:
            rect[0].origin.x = v88;
            rect[0].origin.y = v86;
            v51 = 1;
            rect[0].size.width = v60;
            rect[0].size.height = v59;
          }
          else
          {
LABEL_50:
            v51 = 0;
          }
          v144.origin.y = v86;
          v144.origin.x = v88;
          v144.size.width = v60;
          v144.size.height = v59;
          if (CGRectGetWidth(v144) >= 20.0)
          {
            if ((v28 - 1) < 2)
              goto LABEL_71;
            if (v30 == 3)
            {
              v145.origin.x = v81;
              v145.size.height = v82;
              v145.origin.y = MinY;
              v145.size.width = v80 - v79;
              v75 = CGRectGetWidth(v145);
              v146.origin.y = v86;
              v146.origin.x = v88;
              v146.size.width = v60;
              v146.size.height = v59;
              if (v75 < CGRectGetWidth(v146))
              {
LABEL_71:
                v74 = &rect[v51];
                v74->origin.x = v88;
                v74->origin.y = v86;
                ++v51;
                v74->size.width = v60;
                v74->size.height = v59;
              }
            }
          }
        }
LABEL_64:
        v96 = objc_msgSend((id)v100, "intersectRects:rects1Count:rects2:rects2Count:minSize:", v92, v96, rect, v51, 20.0);
        if (v96 >= 0x80)
        {

          goto LABEL_78;
        }
LABEL_65:

        ++v26;
      }
      while (v25 != v26);
      v76 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v103, v108, 16);
      v25 = v76;
    }
    while (v76);
  }
LABEL_78:

  return v96;
}

- (double)nextUnobstructedSpanStartingAt:(CGRect)a3 wrappableAttachments:(id)a4 userInfo:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  void *v11;
  __int128 v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  void *v17;
  CGAffineTransform *p_canvasSpaceToWrapSpace;
  __int128 v19;
  double v20;
  double v21;
  double v22;
  double v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  __int128 v29;
  double v30;
  double v31;
  double v32;
  double v33;
  int v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  double v45;
  double v46;
  double b;
  double d;
  double ty;
  float v50;
  void *v52;
  void *v53;
  void *v54;
  int v55;
  void *v56;
  void *v57;
  void *v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  float64x2_t v66;
  double rect;
  float64x2_t recta;
  SXTextTangierTextWrapper *v69;
  float64x2_t v70;
  id v71;
  void *v72;
  id v73;
  void *v74;
  void *v75;
  float64x2_t v76;
  float64x2_t v77;
  float64x2_t v78;
  CGAffineTransform v79;
  _OWORD v80[3];
  CGAffineTransform v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  CGAffineTransform v86;
  CGAffineTransform v87;
  _BYTE v88[128];
  uint64_t v89;
  CGRect v90;
  CGRect v91;
  CGRect v92;
  CGRect v93;
  CGRect v94;
  CGRect v95;
  CGRect v96;
  CGRect v97;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v89 = *MEMORY[0x24BDAC8D0];
  v73 = a4;
  v71 = a5;
  objc_opt_class();
  TSUDynamicCast();
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "target");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXTextTangierTextWrapper collectWrappables:target:](self, "collectWrappables:target:", v73);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v72, "count"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "rectInRoot:", x, y, width, height);
  v12 = *(_OWORD *)&self->_canvasSpaceToWrapSpace.c;
  *(_OWORD *)&v87.a = *(_OWORD *)&self->_canvasSpaceToWrapSpace.a;
  *(_OWORD *)&v87.c = v12;
  *(_OWORD *)&v87.tx = *(_OWORD *)&self->_canvasSpaceToWrapSpace.tx;
  v91 = CGRectApplyAffineTransform(v90, &v87);
  v13 = v91.origin.x;
  v14 = v91.origin.y;
  v15 = v91.size.width;
  v16 = v91.size.height;
  objc_msgSend(v74, "column");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = v16;
  v60 = v15;
  v61 = v14;
  v62 = v13;
  v63 = x;
  v64 = y;
  v65 = width;
  rect = height;
  objc_msgSend(v17, "frameBounds");
  objc_msgSend(v75, "rectInRoot:");
  v69 = self;
  p_canvasSpaceToWrapSpace = &self->_canvasSpaceToWrapSpace;
  v19 = *(_OWORD *)&self->_canvasSpaceToWrapSpace.c;
  *(_OWORD *)&v86.a = *(_OWORD *)&self->_canvasSpaceToWrapSpace.a;
  *(_OWORD *)&v86.c = v19;
  *(_OWORD *)&v86.tx = *(_OWORD *)&self->_canvasSpaceToWrapSpace.tx;
  v93 = CGRectApplyAffineTransform(v92, &v86);
  v20 = v93.origin.x;
  v21 = v93.origin.y;
  v22 = v93.size.width;
  v23 = v93.size.height;

  v84 = 0u;
  v85 = 0u;
  v82 = 0u;
  v83 = 0u;
  v24 = v72;
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v82, v88, 16);
  if (v25)
  {
    v26 = *(_QWORD *)v83;
    do
    {
      for (i = 0; i != v25; ++i)
      {
        if (*(_QWORD *)v83 != v26)
          objc_enumerationMutation(v24);
        v28 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * i);
        objc_msgSend(v28, "boundsInfluencingExteriorWrap");
        v29 = *(_OWORD *)&p_canvasSpaceToWrapSpace->c;
        *(_OWORD *)&v81.a = *(_OWORD *)&p_canvasSpaceToWrapSpace->a;
        *(_OWORD *)&v81.c = v29;
        *(_OWORD *)&v81.tx = *(_OWORD *)&p_canvasSpaceToWrapSpace->tx;
        v95 = CGRectApplyAffineTransform(v94, &v81);
        v30 = v95.origin.x;
        v31 = v95.origin.y;
        v32 = v95.size.width;
        v33 = v95.size.height;
        v97.origin.x = v20;
        v97.origin.y = v21;
        v97.size.width = v22;
        v97.size.height = v23;
        if (CGRectIntersectsRect(v95, v97))
        {
          v34 = objc_msgSend(v28, "wrapFitType");
          if (objc_msgSend(v28, "wrapType") == 2)
          {
            objc_msgSend(MEMORY[0x24BEB3A68], "bezierPathWithRect:", v20, v31, v22, v33);
            v35 = objc_claimAutoreleasedReturnValue();
            goto LABEL_14;
          }
          if (v34)
          {
            if (v34 == 1)
            {
              objc_msgSend(v28, "wrapPolygon");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "bezierPath");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              v38 = (void *)objc_msgSend(v37, "copy");

              v39 = *(_OWORD *)&p_canvasSpaceToWrapSpace->c;
              v80[0] = *(_OWORD *)&p_canvasSpaceToWrapSpace->a;
              v80[1] = v39;
              v80[2] = *(_OWORD *)&p_canvasSpaceToWrapSpace->tx;
              objc_msgSend(v38, "transformUsingAffineTransform:", v80);
              if (!v38)
                goto LABEL_17;
LABEL_15:
              objc_msgSend(v11, "addObject:", v38);
            }
            else
            {
              v38 = 0;
            }
          }
          else
          {
            objc_msgSend(MEMORY[0x24BEB3A68], "bezierPathWithRect:", v30, v31, v32, v33);
            v35 = objc_claimAutoreleasedReturnValue();
LABEL_14:
            v38 = (void *)v35;
            if (v35)
              goto LABEL_15;
          }
LABEL_17:

          continue;
        }
      }
      v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v82, v88, 16);
    }
    while (v25);
  }

  if (objc_msgSend(v11, "count"))
  {
    v40 = *(_OWORD *)&v69->_wrapSpaceToCanvasSpace.c;
    *(_OWORD *)&v79.a = *(_OWORD *)&v69->_wrapSpaceToCanvasSpace.a;
    *(_OWORD *)&v79.c = v40;
    *(_OWORD *)&v79.tx = *(_OWORD *)&v69->_wrapSpaceToCanvasSpace.tx;
    v41 = v63;
    *(double *)&v40 = v64;
    v42 = v65;
    v43 = rect;
    v96 = CGRectApplyAffineTransform(*(CGRect *)((char *)&v40 - 8), &v79);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEB3A68], "uniteBezierPaths:", v11);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEB3B78], "unobstructedSpanForPath:startingSpan:columnBounds:", v44, v62, v61, v60, v59, v20, v21, v22, v23);
    v46 = v45;
    b = v69->_wrapSpaceToCanvasSpace.b;
    d = v69->_wrapSpaceToCanvasSpace.d;
    ty = v69->_wrapSpaceToCanvasSpace.ty;
    if (v74)
    {
      objc_msgSend(v74, "targetInverseTransformInRoot");
      v66 = v77;
      recta = v76;
      v70 = v78;
    }
    else
    {
      recta = 0u;
      v70 = 0u;
      v66 = 0u;
    }

    v96.origin.y = vaddq_f64(v70, vmlaq_f64(vmulq_n_f64(v66, ty + v46 * d + b * 0.0), (float64x2_t)0, recta)).f64[1];
  }
  if ((*(_QWORD *)&v96.origin.y & 0x7FFFFFFFFFFFFFFFuLL) > 0x7FEFFFFFFFFFFFFFLL)
    goto LABEL_31;
  if (v96.origin.y > 0.0 && v96.origin.y > 3.40282347e38)
  {
    objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[SXTextTangierTextWrapper nextUnobstructedSpanStartingAt:wrappableAttachments:userInfo:]");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/FeldsparServicesUI/Modules/silex/Silex/Text/Tangier/SXTextTangierTextWrapper.mm");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "handleFailureInFunction:file:lineNumber:description:", v53, v54, 361, CFSTR("Out-of-bounds type assignment was clamped to max"));

    *(float *)&v55 = 3.4028e38;
LABEL_35:
    v50 = *(float *)&v55;
    goto LABEL_32;
  }
  if (v96.origin.y < 0.0 && v96.origin.y < -3.40282347e38)
  {
    objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[SXTextTangierTextWrapper nextUnobstructedSpanStartingAt:wrappableAttachments:userInfo:]");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/FeldsparServicesUI/Modules/silex/Silex/Text/Tangier/SXTextTangierTextWrapper.mm");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "handleFailureInFunction:file:lineNumber:description:", v57, v58, 361, CFSTR("Out-of-bounds type assignment was clamped to min"));

    *(float *)&v55 = -3.4028e38;
    goto LABEL_35;
  }
LABEL_31:
  v50 = v96.origin.y;
LABEL_32:

  return v50;
}

- (id)collectWrappables:(id)a3 target:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v25;
  id obj;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v27 = a4;
  v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v37;
    do
    {
      v9 = 0;
      v25 = v7;
      do
      {
        if (*(_QWORD *)v37 != v8)
          objc_enumerationMutation(obj);
        objc_msgSend(v27, "validatedLayoutForAnchoredDrawable:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * v9));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        TSUProtocolCast();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        TSUProtocolCast();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        if (v11)
        {
          objc_msgSend(v6, "addObject:", v11);
        }
        else if (v12)
        {
          v34 = 0u;
          v35 = 0u;
          v32 = 0u;
          v33 = 0u;
          objc_msgSend(v12, "descendentWrappables");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
          if (v15)
          {
            v16 = *(_QWORD *)v33;
            do
            {
              v17 = 0;
              do
              {
                if (*(_QWORD *)v33 != v16)
                  objc_enumerationMutation(v14);
                objc_msgSend(v6, "addObject:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v17++));
              }
              while (v15 != v17);
              v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
            }
            while (v15);
          }

          v7 = v25;
        }

        ++v9;
      }
      while (v9 != v7);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
    }
    while (v7);
  }

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  -[SXTextTangierTextWrapper exclusionPaths](self, "exclusionPaths");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
  if (v19)
  {
    v20 = *(_QWORD *)v29;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v29 != v20)
          objc_enumerationMutation(v18);
        -[SXTextExclusionPath wrappable](*(_QWORD **)(*((_QWORD *)&v28 + 1) + 8 * v21));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v22);

        ++v21;
      }
      while (v19 != v21);
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
    }
    while (v19);
  }

  return v6;
}

- (unint64_t)intersectRects:(CGRect *)a3 rects1Count:(unint64_t)a4 rects2:(const CGRect *)a5 rects2Count:(unint64_t)a6 minSize:(double)a7
{
  unint64_t v11;
  uint64_t v12;
  CGSize *p_size;
  CGSize *v14;
  unint64_t v15;
  CGFloat x;
  CGFloat y;
  double width;
  CGFloat height;
  CGFloat *v20;
  _OWORD v22[256];
  uint64_t v23;
  CGRect v24;

  v23 = *MEMORY[0x24BDAC8D0];
  if (!a4)
    return 0;
  v11 = 0;
  v12 = 0;
  p_size = &a5->size;
  do
  {
    if (a6 && v11 <= 0x7F)
    {
      v14 = p_size;
      v15 = 1;
      do
      {
        v24 = CGRectIntersection(a3[v12], *(CGRect *)&v14[-1].width);
        x = v24.origin.x;
        y = v24.origin.y;
        width = v24.size.width;
        height = v24.size.height;
        if (!CGRectIsEmpty(v24) && width >= a7)
        {
          v20 = (CGFloat *)&v22[2 * v11];
          *v20 = x;
          v20[1] = y;
          ++v11;
          v20[2] = width;
          v20[3] = height;
        }
        if (v15 >= a6)
          break;
        ++v15;
        v14 += 2;
      }
      while (v11 < 0x80);
    }
    ++v12;
  }
  while (v12 != a4);
  if (v11)
    memcpy(a3, v22, 32 * v11);
  return v11;
}

- (id)groupInfoContainingWrappable:(id)a3
{
  void *v3;
  id v4;
  uint64_t v5;

  objc_msgSend(a3, "info");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "parentInfo");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    while (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    {
      objc_msgSend(v4, "parentInfo");
      v5 = objc_claimAutoreleasedReturnValue();

      v4 = (id)v5;
      if (!v5)
        goto LABEL_6;
    }
    v4 = v4;
  }
LABEL_6:

  return v4;
}

- (BOOL)textShouldFlowAroundWrappable:(id)a3 inTarget:(id)a4 inColumn:(id)a5
{
  id v8;
  id v9;
  id v10;
  BOOL v11;
  __int128 v12;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  __int128 v16;
  CGFloat x;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  double MinX;
  double MaxX;
  double v24;
  double v25;
  _QWORD recta[7];
  CGAffineTransform v27;
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

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if ((objc_msgSend(v8, "hasAlpha") & 1) == 0)
  {
    objc_msgSend(v8, "boundsInRoot");
    v12 = *(_OWORD *)&self->_canvasSpaceToWrapSpace.c;
    *(_OWORD *)&v27.a = *(_OWORD *)&self->_canvasSpaceToWrapSpace.a;
    *(_OWORD *)&v27.c = v12;
    *(_OWORD *)&v27.tx = *(_OWORD *)&self->_canvasSpaceToWrapSpace.tx;
    v29 = CGRectApplyAffineTransform(v28, &v27);
    y = v29.origin.y;
    width = v29.size.width;
    height = v29.size.height;
    recta[0] = *(_QWORD *)&v29.origin.x;
    v24 = CGRectGetWidth(v29);
    objc_msgSend(v10, "frameBounds");
    objc_msgSend(v9, "rectInRoot:");
    v16 = *(_OWORD *)&self->_canvasSpaceToWrapSpace.c;
    *(_OWORD *)&recta[1] = *(_OWORD *)&self->_canvasSpaceToWrapSpace.a;
    *(_OWORD *)&recta[3] = v16;
    *(_OWORD *)&recta[5] = *(_OWORD *)&self->_canvasSpaceToWrapSpace.tx;
    v31 = CGRectApplyAffineTransform(v30, (CGAffineTransform *)&recta[1]);
    x = v31.origin.x;
    v18 = v31.origin.y;
    v19 = v31.size.width;
    v20 = v31.size.height;
    v25 = CGRectGetWidth(v31);
    *(_QWORD *)&v32.origin.x = recta[0];
    v32.origin.y = y;
    v32.size.width = width;
    v32.size.height = height;
    MinX = CGRectGetMinX(v32);
    v33.origin.x = x;
    v33.origin.y = v18;
    v33.size.width = v19;
    v33.size.height = v20;
    if (MinX - CGRectGetMinX(v33) < 1.0)
      goto LABEL_5;
    v34.origin.x = x;
    v34.origin.y = v18;
    v34.size.width = v19;
    v34.size.height = v20;
    MaxX = CGRectGetMaxX(v34);
    *(_QWORD *)&v35.origin.x = recta[0];
    v35.origin.y = y;
    v35.size.width = width;
    v35.size.height = height;
    if (MaxX - CGRectGetMaxX(v35) < 1.0)
    {
LABEL_5:
      v36.origin.x = x;
      v36.origin.y = v18;
      v36.size.width = v19;
      v36.size.height = v20;
      *(_QWORD *)&v38.origin.x = recta[0];
      v38.origin.y = y;
      v38.size.width = width;
      v38.size.height = height;
      v37 = CGRectIntersection(v36, v38);
      v11 = CGRectGetWidth(v37) < v25 * 0.800000012;
      goto LABEL_6;
    }
    if (v24 >= v25 * 0.333333343)
    {
      v11 = 0;
      goto LABEL_6;
    }
  }
  v11 = 1;
LABEL_6:

  return v11;
}

- (unint64_t)splitLineRect:(CGRect)a3 lineSegmentRects:(CGRect)a4[128] wrappableRect:(CGRect)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  CGFloat *p_height;
  unint64_t result;
  double v23;
  CGFloat v24;
  CGFloat v25;
  double MaxX;
  double MinX;
  double v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat rect;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v10 = a3.size.height;
  v11 = a3.size.width;
  v12 = a3.origin.y;
  v13 = a3.origin.x;
  if (CGRectIntersectsRect(a3, a5))
  {
    v32.origin.x = x;
    v32.origin.y = y;
    v32.size.width = width;
    v32.size.height = height;
    MinX = CGRectGetMinX(v32);
    v33.origin.x = v13;
    v33.origin.y = v12;
    v33.size.width = v11;
    v33.size.height = v10;
    v14 = CGRectGetMinX(v33);
    v34.size.height = height;
    v15 = v14;
    v34.origin.x = x;
    v34.origin.y = y;
    v34.size.width = width;
    rect = v34.size.height;
    MaxX = CGRectGetMaxX(v34);
    v35.origin.x = v13;
    v35.origin.y = v12;
    v35.size.width = v11;
    v35.size.height = v10;
    v16 = CGRectGetMaxX(v35);
    if (MinX <= v15)
    {
      if (MaxX > v16)
        return 0;
      v42.origin.x = x;
      v42.origin.y = y;
      v42.size.width = width;
      v42.size.height = rect;
      v30 = CGRectGetMaxX(v42);
      v43.origin.x = v13;
      v43.origin.y = v12;
      v43.size.width = v11;
      v43.size.height = v10;
      v23 = CGRectGetMaxX(v43);
      v44.origin.x = x;
      v44.origin.y = y;
      v44.size.width = width;
      v44.size.height = rect;
      v24 = CGRectGetMaxX(v44);
      a4->origin.x = v30;
      a4->origin.y = v12;
      a4->size.width = v23 - v24;
      p_height = &a4->size.height;
      result = 1;
    }
    else
    {
      v36.origin.x = v13;
      v28 = v16;
      v36.origin.y = v12;
      v36.size.width = v11;
      v36.size.height = v10;
      v25 = CGRectGetMinX(v36);
      v37.origin.x = x;
      v37.origin.y = y;
      v37.size.width = width;
      v37.size.height = rect;
      v17 = CGRectGetMinX(v37);
      v38.origin.x = v13;
      v38.origin.y = v12;
      v38.size.width = v11;
      v38.size.height = v10;
      v18 = CGRectGetMinX(v38);
      a4->origin.x = v25;
      a4->origin.y = v12;
      a4->size.width = v17 - v18;
      a4->size.height = v10;
      if (MaxX >= v28)
        return 1;
      v39.origin.x = x;
      v39.origin.y = y;
      v39.size.width = width;
      v39.size.height = rect;
      v29 = CGRectGetMaxX(v39);
      v40.origin.x = v13;
      v40.origin.y = v12;
      v40.size.width = v11;
      v40.size.height = v10;
      v19 = CGRectGetMaxX(v40);
      v41.origin.x = x;
      v41.origin.y = y;
      v41.size.width = width;
      v41.size.height = rect;
      v20 = CGRectGetMaxX(v41);
      a4[1].origin.x = v29;
      a4[1].origin.y = v12;
      a4[1].size.width = v19 - v20;
      p_height = &a4[1].size.height;
      result = 2;
    }
  }
  else
  {
    a4->origin.x = v13;
    a4->origin.y = v12;
    p_height = &a4->size.height;
    result = 1;
    a4->size.width = v11;
  }
  *p_height = v10;
  return result;
}

- (unint64_t)splitLineRect:(CGRect)a3 lineSegmentRects:(CGRect)a4[128] wrappable:(id)a5 wrapContext:(id)a6
{
  double height;
  double width;
  double y;
  double x;
  id v13;
  __int128 v14;
  void *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  __int128 v19;
  CGAffineTransform v21;
  _OWORD v22[3];
  CGRect v23;
  CGRect v24;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v13 = a5;
  v14 = *(_OWORD *)&self->_canvasSpaceToWrapSpace.c;
  v22[0] = *(_OWORD *)&self->_canvasSpaceToWrapSpace.a;
  v22[1] = v14;
  v22[2] = *(_OWORD *)&self->_canvasSpaceToWrapSpace.tx;
  objc_msgSend(a6, "transformedWrapPolygonForWrappable:canvasSpaceToWrapSpaceTransform:", v13, v22);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = objc_msgSend(MEMORY[0x24BEB3B78], "splitLine:lineSegmentRects:polygon:type:skipHint:", a4, v15, 1, 0, x, y, width, height);
  }
  else
  {
    objc_opt_class();
    TSUClassAndProtocolCast();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v17)
    {
      objc_msgSend(v17, "frameInRoot", &unk_254EFB9B0);
      v19 = *(_OWORD *)&self->_canvasSpaceToWrapSpace.c;
      *(_OWORD *)&v21.a = *(_OWORD *)&self->_canvasSpaceToWrapSpace.a;
      *(_OWORD *)&v21.c = v19;
      *(_OWORD *)&v21.tx = *(_OWORD *)&self->_canvasSpaceToWrapSpace.tx;
      v24 = CGRectApplyAffineTransform(v23, &v21);
      v16 = -[SXTextTangierTextWrapper splitLineRect:lineSegmentRects:wrappableRect:](self, "splitLineRect:lineSegmentRects:wrappableRect:", a4, x, y, width, height, v24.origin.x, v24.origin.y, v24.size.width, v24.size.height);
    }
    else
    {
      v16 = 0;
    }

  }
  return v16;
}

- (NSArray)exclusionPaths
{
  return self->_exclusionPaths;
}

- (CGAffineTransform)canvasSpaceToWrapSpace
{
  __int128 v3;

  v3 = *(_OWORD *)&self->ty;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self->d;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[1].b;
  return self;
}

- (void)setCanvasSpaceToWrapSpace:(CGAffineTransform *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->a;
  v4 = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_canvasSpaceToWrapSpace.tx = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_canvasSpaceToWrapSpace.c = v4;
  *(_OWORD *)&self->_canvasSpaceToWrapSpace.a = v3;
}

- (CGAffineTransform)wrapSpaceToCanvasSpace
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].ty;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[1].d;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[2].b;
  return self;
}

- (void)setWrapSpaceToCanvasSpace:(CGAffineTransform *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->a;
  v4 = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_wrapSpaceToCanvasSpace.tx = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_wrapSpaceToCanvasSpace.c = v4;
  *(_OWORD *)&self->_wrapSpaceToCanvasSpace.a = v3;
}

- (NSMutableArray)tangierExclusionPaths
{
  return self->_tangierExclusionPaths;
}

- (void)setTangierExclusionPaths:(id)a3
{
  objc_storeStrong((id *)&self->_tangierExclusionPaths, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tangierExclusionPaths, 0);
  objc_storeStrong((id *)&self->_exclusionPaths, 0);
}

@end
