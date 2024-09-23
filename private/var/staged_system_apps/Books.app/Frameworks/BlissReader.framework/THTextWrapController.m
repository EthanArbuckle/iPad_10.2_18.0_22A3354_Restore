@implementation THTextWrapController

- (BOOL)p_shouldTextFlowAroundWrappable:(id)a3 inTarget:(id)a4 inColumn:(id)a5
{
  return 1;
}

- (id)floatingDrawableLayoutsForTarget:(id)a3
{
  objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", a3), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THTextWrapController floatingDrawableLayoutsForTarget:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THTextWrapController.mm"), 120, CFSTR("Abstract method."));
  return 0;
}

- (unint64_t)zOrderOfDrawable:(id)a3 forTarget:(id)a4
{
  objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", a3, a4), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THTextWrapController zOrderOfDrawable:forTarget:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THTextWrapController.mm"), 126, CFSTR("Abstract method."));
  return 0;
}

- (id)beginWrappingToColumn:(id)a3 target:(id)a4 hasWrapables:(BOOL *)a5
{
  THTextWrapCookie *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  void *j;
  id obj;
  unint64_t v25;
  THTextWrapController *v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];

  v9 = objc_alloc_init(THTextWrapCookie);
  -[THTextWrapCookie setColumn:](v9, "setColumn:", a3);
  -[THTextWrapCookie setTarget:](v9, "setTarget:", a4);
  v25 = -[THTextWrapController zOrderOfDrawable:forTarget:](self, "zOrderOfDrawable:forTarget:", objc_msgSend(a4, "info"), a4);
  v26 = self;
  v27 = a4;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = -[THTextWrapController floatingDrawableLayoutsForTarget:](self, "floatingDrawableLayoutsForTarget:", a4);
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v33 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)i);
        if (v25 < -[THTextWrapController zOrderOfDrawable:forTarget:](v26, "zOrderOfDrawable:forTarget:", objc_msgSend(v14, "info"), v27))
        {
          v15 = (void *)TSUProtocolCast(&OBJC_PROTOCOL___TSDWrappableParent, v14);
          if (v15 && (v16 = v15, !objc_msgSend(v15, "wrapContainerMode")))
          {
            v30 = 0u;
            v31 = 0u;
            v28 = 0u;
            v29 = 0u;
            v18 = objc_msgSend(v16, "descendentWrappables");
            v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
            if (v19)
            {
              v20 = v19;
              v21 = *(_QWORD *)v29;
              do
              {
                for (j = 0; j != v20; j = (char *)j + 1)
                {
                  if (*(_QWORD *)v29 != v21)
                    objc_enumerationMutation(v18);
                  -[THTextWrapCookie addFloatingWrappable:](v9, "addFloatingWrappable:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)j));
                  *a5 = 1;
                }
                v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
              }
              while (v20);
            }
          }
          else
          {
            v17 = TSUProtocolCast(&OBJC_PROTOCOL___TSDWrappable, v14);
            if (v17)
            {
              -[THTextWrapCookie addFloatingWrappable:](v9, "addFloatingWrappable:", v17);
              *a5 = 1;
            }
          }
        }
      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v11);
  }
  return v9;
}

- (unsigned)splitLine:(CGRect)a3 lineSegmentRects:(CGRect)a4[128] wrappableAttachments:(id)a5 ignoreFloatingGraphics:(BOOL)a6 floatingCausedWrap:(BOOL *)a7 skipHint:(double *)a8 userInfo:(id)a9
{
  double height;
  double width;
  double y;
  double x;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  CGFloat v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  double v37;
  id v38;
  id v39;
  id v40;
  uint64_t v41;
  id v42;
  void *i;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  uint64_t v48;
  id v49;
  id v50;
  id v51;
  uint64_t v52;
  void *j;
  uint64_t v54;
  id v55;
  uint64_t v56;
  void *v57;
  unsigned int v58;
  unsigned int v59;
  unsigned int v60;
  int v61;
  unsigned int v62;
  CGFloat v63;
  CGFloat v64;
  CGFloat v65;
  CGFloat v66;
  double v67;
  double MaxY;
  unsigned int v69;
  float v70;
  double v71;
  double MaxX;
  double v73;
  uint64_t v74;
  unint64_t v75;
  uint64_t v76;
  CGSize *p_size;
  unint64_t v78;
  CGFloat v79;
  CGFloat v80;
  double v81;
  CGFloat v82;
  CGFloat *v83;
  double v84;
  double v85;
  CGFloat v86;
  CGFloat v87;
  double v88;
  CGFloat v89;
  double v90;
  CGFloat v91;
  int v92;
  double v93;
  BOOL v94;
  CGRect *v95;
  double v96;
  double v97;
  CGSize size;
  double v99;
  BOOL v100;
  CGRect *v101;
  double v102;
  id v103;
  CGSize *v104;
  uint64_t v105;
  CGFloat v106;
  CGFloat v107;
  CGFloat v108;
  CGFloat v109;
  double v111;
  CGPoint v112;
  CGFloat v113;
  double v114;
  CGFloat MinY;
  double MinX;
  double v117;
  double v118;
  CGFloat v119;
  CGFloat v120;
  double v121;
  double *v122;
  void *v123;
  CGFloat v124;
  void *v125;
  id v126;
  double v129;
  CGFloat rect;
  double recta;
  CGFloat rectb;
  uint64_t v133;
  id v134;
  uint64_t v135;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  CGRect v149[128];
  _BYTE v150[128];
  _BYTE v151[128];
  _BYTE v152[128];
  _OWORD v153[256];
  CGRect v154;
  CGRect v155;
  CGRect v156;
  CGRect v157;
  CGRect v158;
  CGRect v159;
  CGRect v160;
  CGRect v161;
  CGRect v162;
  CGRect v163;
  CGRect v164;
  CGRect v165;
  CGRect v166;
  CGRect v167;
  CGRect v168;
  CGRect v169;
  CGRect v170;
  CGRect v171;
  CGRect v172;
  CGRect v173;
  CGRect v174;
  CGRect v175;
  CGRect v176;
  CGRect v177;
  CGRect v178;
  CGRect v179;
  CGRect v180;
  CGRect v181;
  CGRect v182;
  CGRect v183;
  CGRect v184;
  CGRect v185;
  CGRect v186;
  CGRect v187;
  CGRect v188;
  CGRect v189;
  CGRect v190;
  CGRect v191;
  CGRect v192;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v16 = objc_opt_class(THTextWrapCookie, a2);
  v17 = (void *)TSUDynamicCast(v16, a9);
  v18 = objc_msgSend(v17, "column");
  v19 = objc_msgSend(v17, "target");
  v20 = v19;
  v122 = a8;
  v126 = v18;
  if (v18)
  {
    if (v19)
      goto LABEL_3;
LABEL_30:
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THTextWrapController splitLine:lineSegmentRects:wrappableAttachments:ignoreFloatingGraphics:floatingCausedWrap:skipHint:userInfo:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THTextWrapController.mm"), 187, CFSTR("invalid nil value for '%s'"), "target");
    if (!a8)
      goto LABEL_5;
    goto LABEL_4;
  }
  objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THTextWrapController splitLine:lineSegmentRects:wrappableAttachments:ignoreFloatingGraphics:floatingCausedWrap:skipHint:userInfo:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THTextWrapController.mm"), 186, CFSTR("invalid nil value for '%s'"), "column");
  if (!v20)
    goto LABEL_30;
LABEL_3:
  if (a8)
LABEL_4:
    *a8 = 1.0;
LABEL_5:
  objc_msgSend(v20, "rectInRoot:", x, y, width, height);
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v28 = v27;
  objc_msgSend(v18, "frameBounds");
  objc_msgSend(v20, "rectInRoot:");
  v30 = v29;
  v32 = v31;
  v34 = v33;
  v36 = v35;
  if ((objc_msgSend(v20, "autosizeFlags") & 3) != 0)
  {
    objc_msgSend(v20, "maxSize");
    v36 = v37;
  }
  v154.origin.x = v22;
  v154.origin.y = v24;
  v154.size.width = v26;
  v154.size.height = v28;
  v190.origin.x = v30;
  v190.origin.y = v32;
  v190.size.width = v34;
  v190.size.height = v36;
  if (!CGRectIntersectsRect(v154, v190))
  {
    LODWORD(v54) = 0;
    return v54;
  }
  v125 = v20;
  a4->origin.x = v22;
  a4->origin.y = v24;
  a4->size.width = v26;
  a4->size.height = v28;
  v38 = objc_msgSend(a9, "floatingWrappables");
  v123 = v38;
  if (objc_msgSend(a5, "count"))
  {
    v38 = objc_msgSend(v38, "mutableCopy");
    v145 = 0u;
    v146 = 0u;
    v147 = 0u;
    v148 = 0u;
    v39 = objc_msgSend(a5, "countByEnumeratingWithState:objects:count:", &v145, v152, 16);
    if (v39)
    {
      v40 = v39;
      v41 = *(_QWORD *)v146;
      do
      {
        v42 = a5;
        for (i = 0; i != v40; i = (char *)i + 1)
        {
          if (*(_QWORD *)v146 != v41)
            objc_enumerationMutation(v42);
          v44 = v17;
          v45 = objc_msgSend(objc_msgSend(v17, "target"), "validatedLayoutForAnchoredDrawable:", *(_QWORD *)(*((_QWORD *)&v145 + 1) + 8 * (_QWORD)i));
          v46 = (void *)TSUProtocolCast(&OBJC_PROTOCOL___TSDWrappableParent, v45);
          if (v46 && (v47 = v46, !objc_msgSend(v46, "wrapContainerMode")))
          {
            v143 = 0u;
            v144 = 0u;
            v141 = 0u;
            v142 = 0u;
            v49 = objc_msgSend(v47, "descendentWrappables");
            v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v141, v151, 16);
            if (v50)
            {
              v51 = v50;
              v52 = *(_QWORD *)v142;
              do
              {
                for (j = 0; j != v51; j = (char *)j + 1)
                {
                  if (*(_QWORD *)v142 != v52)
                    objc_enumerationMutation(v49);
                  objc_msgSend(v38, "addObject:", *(_QWORD *)(*((_QWORD *)&v141 + 1) + 8 * (_QWORD)j));
                }
                v51 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v141, v151, 16);
              }
              while (v51);
            }
          }
          else
          {
            v48 = TSUProtocolCast(&OBJC_PROTOCOL___TSDWrappable, v45);
            if (v48)
              objc_msgSend(v38, "addObject:", v48);
          }
          v17 = v44;
        }
        a5 = v42;
        v40 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v145, v152, 16);
      }
      while (v40);
    }
  }
  else
  {
    v55 = v38;
  }
  v139 = 0u;
  v140 = 0u;
  v137 = 0u;
  v138 = 0u;
  v134 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v137, v150, 16);
  if (!v134)
  {
    v75 = 1;
LABEL_119:

    v54 = v75;
    goto LABEL_120;
  }
  v133 = *(_QWORD *)v138;
  v54 = 1;
  v124 = v22;
  v129 = v24;
  v121 = v26;
  do
  {
    v56 = 0;
    do
    {
      if (*(_QWORD *)v138 != v133)
        objc_enumerationMutation(v38);
      v135 = v56;
      v57 = *(void **)(*((_QWORD *)&v137 + 1) + 8 * v56);
      v58 = objc_msgSend(v57, "wrapDirection");
      v59 = objc_msgSend(v57, "wrapFitType");
      v60 = objc_msgSend(v57, "wrapType");
      if (!v60)
        goto LABEL_78;
      v61 = v60;
      if (v60 == 4)
      {
        v62 = -[THTextWrapController p_shouldTextFlowAroundWrappable:inTarget:inColumn:](self, "p_shouldTextFlowAroundWrappable:inTarget:inColumn:", v57, v125, v126);
        v61 = v62 ? 1 : 2;
        if (v62)
          v58 = 2;
      }
      objc_msgSend(v57, "boundsInfluencingExteriorWrap");
      v63 = v155.origin.x;
      rect = v155.origin.y;
      v64 = v155.size.width;
      v65 = v155.size.height;
      v191.origin.x = v22;
      v191.origin.y = v24;
      v191.size.width = v26;
      v66 = v22;
      v191.size.height = v28;
      if (CGRectIntersectsRect(v155, v191))
      {
        if (a7 && objc_msgSend(v123, "indexOfObject:", v57) != (id)0x7FFFFFFFFFFFFFFFLL)
          *a7 = 1;
        if (v61 == 2)
        {
          if (!v122)
            goto LABEL_61;
          v67 = *v122;
          v156.origin.x = v63;
          v156.origin.y = rect;
          v156.size.width = v64;
          v156.size.height = v65;
          MaxY = CGRectGetMaxY(v156);
          v157.origin.x = v124;
          v24 = v129;
          v157.origin.y = v129;
          v157.size.width = v26;
          v157.size.height = v28;
          v69 = 0;
          v70 = MaxY - CGRectGetMinY(v157);
          v71 = (double)vcvtps_u32_f32(v70);
          if (v67 >= v71)
            v71 = v67;
          v22 = v124;
          *v122 = v71;
        }
        else if (v59)
        {
          if (v59 != 1)
          {
LABEL_61:
            v69 = 0;
LABEL_62:
            v24 = v129;
            goto LABEL_63;
          }
          v69 = -[THTextWrapController p_splitLine:lineSegmentRects:wrappable:](self, "p_splitLine:lineSegmentRects:wrappable:", v149, v57, v22, v129, v26, v28);
          if (!v69)
            goto LABEL_62;
          if (v61 == 3)
          {
            v158.origin.x = v63;
            v158.origin.y = rect;
            v158.size.width = v64;
            v158.size.height = v65;
            MinX = CGRectGetMinX(v158);
            v159.origin.x = v22;
            v159.origin.y = v129;
            v159.size.width = v26;
            v159.size.height = v28;
            v117 = MinX - CGRectGetMinX(v159);
            v160.origin.x = v124;
            v160.origin.y = v129;
            v160.size.width = v26;
            v160.size.height = v28;
            MaxX = CGRectGetMaxX(v160);
            v161.origin.x = v63;
            v161.origin.y = rect;
            v161.size.width = v64;
            v161.size.height = v65;
            v73 = MaxX - CGRectGetMaxX(v161);
            v22 = v124;
            if (v117 < v73)
              goto LABEL_97;
          }
          else
          {
            if (v58 == 1)
            {
LABEL_97:
              v95 = &v149[v69 - 1];
              v96 = CGRectGetMaxX(*v95);
              v184.origin.x = v63;
              v184.origin.y = rect;
              v184.size.width = v64;
              v184.size.height = v65;
              v97 = CGRectGetMaxX(v184);
              v24 = v129;
              if (v69 < 2 || v96 < v97)
                goto LABEL_63;
              size = v95->size;
              v149[0].origin = v95->origin;
              v149[0].size = size;
LABEL_100:
              v69 = 1;
              goto LABEL_63;
            }
            if (v58)
              goto LABEL_62;
          }
          v93 = CGRectGetMinX(v149[0]);
          v183.origin.x = v63;
          v183.origin.y = rect;
          v183.size.width = v64;
          v183.size.height = v65;
          v94 = v93 > CGRectGetMinX(v183);
          v24 = v129;
          if (!v94)
            goto LABEL_100;
        }
        else
        {
          v163.origin.x = v22;
          v163.origin.y = v129;
          v163.size.width = v26;
          v163.size.height = v28;
          v84 = CGRectGetMaxX(v163);
          v164.origin.x = v63;
          v164.origin.y = rect;
          v164.size.width = v64;
          v164.size.height = v65;
          if (v84 <= CGRectGetMaxX(v164))
            goto LABEL_84;
          v165.origin.x = v66;
          v165.origin.y = v129;
          v165.size.width = v121;
          v165.size.height = v28;
          v85 = CGRectGetMinX(v165);
          v166.origin.x = v63;
          v166.origin.y = rect;
          v166.size.width = v64;
          v166.size.height = v65;
          if (v85 >= CGRectGetMinX(v166))
          {
LABEL_84:
            v178.origin.x = v63;
            v178.origin.y = rect;
            v178.size.width = v64;
            v178.size.height = v65;
            v192.origin.x = v66;
            v192.origin.y = v129;
            v192.size.width = v121;
            v192.size.height = v28;
            v179 = CGRectIntersection(v178, v192);
            v88 = v179.size.width;
            v89 = v179.size.height;
            rectb = v179.origin.x;
            v120 = v179.origin.y;
            v90 = CGRectGetMaxX(v179);
            v180.origin.x = v66;
            v180.origin.y = v129;
            v180.size.width = v121;
            v180.size.height = v28;
            if (v90 >= CGRectGetMaxX(v180))
            {
              v92 = 0;
              v91 = v66;
            }
            else
            {
              v181.origin.x = rectb;
              v181.origin.y = v120;
              v181.size.width = v88;
              v181.size.height = v89;
              v91 = CGRectGetMaxX(v181);
              v92 = 1;
            }
            v22 = v66;
            v26 = v121;
            v182.origin.x = v91;
            v24 = v129;
            v182.origin.y = v129;
            v182.size.width = v121 - v88;
            v182.size.height = v28;
            if (CGRectGetWidth(v182) >= 20.0 && (v58 == 2 || v61 == 3 || v92 != (v58 == 0)))
            {
              v149[0].origin.x = v91;
              v149[0].origin.y = v129;
              v69 = 1;
              v149[0].size.width = v121 - v88;
              v149[0].size.height = v28;
            }
            else
            {
              v69 = 0;
            }
          }
          else
          {
            v167.origin.x = v66;
            v167.origin.y = v129;
            v167.size.width = v121;
            v167.size.height = v28;
            v112.x = CGRectGetMinX(v167);
            v168.origin.x = v66;
            v168.origin.y = v129;
            v168.size.width = v121;
            v168.size.height = v28;
            v112.y = CGRectGetMinY(v168);
            v169.origin.x = v63;
            v169.origin.y = rect;
            v169.size.width = v64;
            v169.size.height = v65;
            v118 = CGRectGetMinX(v169);
            v170.origin.x = v66;
            v170.origin.y = v129;
            v170.size.width = v121;
            v170.size.height = v28;
            v114 = v118 - CGRectGetMinX(v170);
            v171.origin.x = v66;
            v171.origin.y = v129;
            v171.size.width = v121;
            v171.size.height = v28;
            v113 = CGRectGetHeight(v171);
            v172.origin.x = v63;
            v172.origin.y = rect;
            v172.size.width = v64;
            v172.size.height = v65;
            v119 = CGRectGetMaxX(v172);
            v173.origin.x = v124;
            v173.origin.y = v129;
            v173.size.width = v121;
            v173.size.height = v28;
            MinY = CGRectGetMinY(v173);
            v174.origin.x = v124;
            v174.origin.y = v129;
            v174.size.width = v121;
            v174.size.height = v28;
            v111 = CGRectGetMaxX(v174);
            v175.origin.x = v63;
            v175.origin.y = rect;
            v175.size.width = v64;
            v175.size.height = v65;
            recta = v111 - CGRectGetMaxX(v175);
            v176.origin.x = v124;
            v176.origin.y = v129;
            v176.size.width = v121;
            v176.size.height = v28;
            v86 = CGRectGetHeight(v176);
            v177.origin = v112;
            v177.size.height = v113;
            v177.size.width = v114;
            v22 = v124;
            if (CGRectGetWidth(v177) >= 20.0)
            {
              v24 = v129;
              v87 = recta;
              v26 = v121;
              if ((v58 & 0xFFFFFFFD) == 0)
                goto LABEL_106;
              if (v61 != 3)
                goto LABEL_105;
              v185.origin = v112;
              v185.size.height = v113;
              v185.size.width = v114;
              v99 = CGRectGetWidth(v185);
              v186.origin.y = MinY;
              v186.origin.x = v119;
              v186.size.width = recta;
              v186.size.height = v86;
              v100 = v99 < CGRectGetWidth(v186);
              v22 = v124;
              if (v100)
              {
LABEL_105:
                v69 = 0;
              }
              else
              {
LABEL_106:
                v149[0].origin = v112;
                v69 = 1;
                v149[0].size.width = v114;
                v149[0].size.height = v113;
              }
            }
            else
            {
              v69 = 0;
              v24 = v129;
              v87 = recta;
              v26 = v121;
            }
            v187.origin.y = MinY;
            v187.origin.x = v119;
            v187.size.width = v87;
            v187.size.height = v86;
            if (CGRectGetWidth(v187) >= 20.0)
            {
              if (v58 - 1 < 2)
                goto LABEL_109;
              if (v61 == 3)
              {
                v188.origin = v112;
                v188.size.height = v113;
                v188.size.width = v114;
                v102 = CGRectGetWidth(v188);
                v189.origin.y = MinY;
                v189.origin.x = v119;
                v189.size.width = v87;
                v189.size.height = v86;
                v100 = v102 < CGRectGetWidth(v189);
                v22 = v124;
                if (v100)
                {
LABEL_109:
                  v101 = &v149[v69];
                  v101->origin.x = v119;
                  v101->origin.y = MinY;
                  ++v69;
                  v101->size.width = v87;
                  v101->size.height = v86;
                }
              }
            }
          }
        }
      }
      else
      {
        v149[0].origin.x = v22;
        v149[0].origin.y = v24;
        v69 = 1;
        v149[0].size.width = v26;
        v149[0].size.height = v28;
      }
      if (!v54)
        goto LABEL_64;
LABEL_63:
      v74 = 0;
      v75 = 0;
      v76 = v54;
      do
      {
        if (v69 && v75 <= 0x80)
        {
          p_size = &v149[0].size;
          v78 = 1;
          do
          {
            v162 = CGRectIntersection(a4[v74], *(CGRect *)&p_size[-1].width);
            v79 = v162.origin.x;
            v80 = v162.origin.y;
            v81 = v162.size.width;
            v82 = v162.size.height;
            if (!CGRectIsEmpty(v162) && v81 >= 20.0)
            {
              v83 = (CGFloat *)&v153[2 * v75];
              *v83 = v79;
              v83[1] = v80;
              ++v75;
              v83[2] = v81;
              v83[3] = v82;
            }
            if (v78 >= v69)
              break;
            ++v78;
            p_size += 2;
          }
          while (v75 < 0x81);
        }
        ++v74;
      }
      while (v74 != v76);
      if (v75)
      {
        memcpy(a4, v153, 32 * v75);
        if (v75 > 0x7F)
          goto LABEL_119;
        v54 = v75;
      }
      else
      {
LABEL_64:
        v54 = 0;
      }
LABEL_78:
      v56 = v135 + 1;
    }
    while ((id)(v135 + 1) != v134);
    v103 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v137, v150, 16);
    v134 = v103;
  }
  while (v103);

  if (!v54)
    return v54;
LABEL_120:
  v104 = &a4->size;
  v105 = v54;
  do
  {
    objc_msgSend(objc_msgSend(v17, "target"), "targetRectForCanvasRect:", v104[-1].width, v104[-1].height, v104->width, v104->height);
    v104[-1].width = v106;
    v104[-1].height = v107;
    v104->width = v108;
    v104->height = v109;
    v104 += 2;
    --v105;
  }
  while (v105);
  return v54;
}

- (double)nextUnobstructedSpanStartingAt:(CGRect)a3 wrappableAttachments:(id)a4 userInfo:(id)a5
{
  return 0.0;
}

- (unsigned)p_pageIndexForTarget:(id)a3
{
  uint64_t v4;

  v4 = objc_opt_class(TSDLayout, a2);
  return objc_msgSend((id)TSUDynamicCast(v4, a3), "pageIndex");
}

- (unsigned)p_splitLine:(CGRect)a3 lineSegmentRects:(CGRect)a4[128] wrappable:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  CGFloat v20;
  double v21;
  double v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  CGFloat *p_height;
  double v28;
  CGFloat v29;
  unsigned int result;
  CGFloat v31;
  double MaxX;
  double MinX;
  double v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat rect;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11 = objc_msgSend(a5, "wrapPolygon");
  if (v11)
    return +[TSWPTextWrapper splitLine:lineSegmentRects:polygon:type:skipHint:](TSWPTextWrapper, "splitLine:lineSegmentRects:polygon:type:skipHint:", a4, v11, 1, 0, x, y, width, height);
  objc_msgSend(a5, "frameInRoot");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v38.origin.x = x;
  v38.origin.y = y;
  v38.size.width = width;
  v38.size.height = height;
  v52.origin.x = v13;
  v52.origin.y = v15;
  v52.size.width = v17;
  v52.size.height = v19;
  if (!CGRectIntersectsRect(v38, v52))
  {
    a4->origin.x = x;
    a4->origin.y = y;
    p_height = &a4->size.height;
    result = 1;
    a4->size.width = width;
    goto LABEL_8;
  }
  v39.origin.x = v13;
  v39.origin.y = v15;
  v39.size.width = v17;
  v39.size.height = v19;
  MinX = CGRectGetMinX(v39);
  v40.origin.x = x;
  v40.origin.y = y;
  v40.size.width = width;
  v40.size.height = height;
  v20 = CGRectGetMinX(v40);
  v41.size.height = v19;
  v21 = v20;
  v41.origin.x = v13;
  v41.origin.y = v15;
  v41.size.width = v17;
  rect = v41.size.height;
  MaxX = CGRectGetMaxX(v41);
  v42.origin.x = x;
  v42.origin.y = y;
  v42.size.width = width;
  v42.size.height = height;
  v22 = CGRectGetMaxX(v42);
  if (MinX <= v21)
  {
    if (MaxX <= v22)
    {
      v49.origin.x = v13;
      v49.origin.y = v15;
      v49.size.width = v17;
      v49.size.height = rect;
      v36 = CGRectGetMaxX(v49);
      v50.origin.x = x;
      v50.origin.y = y;
      v50.size.width = width;
      v50.size.height = height;
      v28 = CGRectGetMaxX(v50);
      v51.origin.x = v13;
      v51.origin.y = v15;
      v51.size.width = v17;
      v51.size.height = rect;
      v29 = CGRectGetMaxX(v51);
      a4->origin.x = v36;
      a4->origin.y = y;
      a4->size.width = v28 - v29;
      p_height = &a4->size.height;
      result = 1;
      goto LABEL_8;
    }
    return 0;
  }
  else
  {
    v43.origin.x = x;
    v34 = v22;
    v43.origin.y = y;
    v43.size.width = width;
    v43.size.height = height;
    v31 = CGRectGetMinX(v43);
    v44.origin.x = v13;
    v44.origin.y = v15;
    v44.size.width = v17;
    v44.size.height = rect;
    v23 = CGRectGetMinX(v44);
    v45.origin.x = x;
    v45.origin.y = y;
    v45.size.width = width;
    v45.size.height = height;
    v24 = CGRectGetMinX(v45);
    a4->origin.x = v31;
    a4->origin.y = y;
    a4->size.width = v23 - v24;
    a4->size.height = height;
    if (MaxX < v34)
    {
      v46.origin.x = v13;
      v46.origin.y = v15;
      v46.size.width = v17;
      v46.size.height = rect;
      v35 = CGRectGetMaxX(v46);
      v47.origin.x = x;
      v47.origin.y = y;
      v47.size.width = width;
      v47.size.height = height;
      v25 = CGRectGetMaxX(v47);
      v48.origin.x = v13;
      v48.origin.y = v15;
      v48.size.width = v17;
      v48.size.height = rect;
      v26 = CGRectGetMaxX(v48);
      a4[1].origin.x = v35;
      a4[1].origin.y = y;
      a4[1].size.width = v25 - v26;
      p_height = &a4[1].size.height;
      result = 2;
LABEL_8:
      *p_height = height;
      return result;
    }
    return 1;
  }
}

@end
