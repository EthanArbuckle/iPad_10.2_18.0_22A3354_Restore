@implementation _UIComplexBoundingPath

- (CGRect)_inscribedRectInBoundingPathAndRect:(CGRect)a3 byInsettingRect:(CGRect)a4 onEdges:(unint64_t)a5 withOptions:(unint64_t)a6
{
  char v6;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  void *v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double scale;
  int64_t orientation;
  _UIBoundingPathBitmap *bitmap;
  _UIBoundingPathBitmap *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  double v36;
  CGFloat v37;
  unint64_t v38;
  CGFloat v40;
  CGFloat v41;
  CGFloat v42;
  CGFloat v43;
  double v44;
  double v45;
  double v46;
  double v47;
  CGFloat v48;
  CGFloat v49;
  CGFloat v50;
  CGFloat v51;
  CGFloat v52;
  CGFloat v53;
  CGFloat v54;
  void *v55;
  double v56;
  double v57;
  CGFloat r1;
  double width;
  double height;
  double x;
  double y;
  CGAffineTransform v63;
  __int128 v64;
  uint64_t v65;
  uint64_t v66;
  __int128 v67;
  uint64_t v68;
  uint64_t v69;
  CGAffineTransform v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  uint64_t v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  uint64_t v78;
  CGRect v79;
  CGRect v80;
  CGRect v81;
  CGRect v82;
  CGRect v83;
  CGRect v84;
  CGRect v85;
  CGRect v86;
  CGRect v87;
  CGRect v88;
  CGRect result;
  CGRect v90;
  CGRect v91;

  v6 = a6;
  width = a4.size.width;
  height = a4.size.height;
  x = a4.origin.x;
  y = a4.origin.y;
  r1 = a3.size.height;
  v8 = a3.size.width;
  v9 = a3.origin.y;
  v10 = a3.origin.x;
  -[_UIBoundingPath coordinateSpace](self, "coordinateSpace");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIComplexBoundingPath.m"), 418, CFSTR("The bounding path's coordinate space cannot be nil"));

  }
  objc_msgSend(v13, "bounds");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  scale = self->_scale;
  orientation = self->_orientation;
  bitmap = self->_bitmap;
  v57 = scale;
  if (bitmap)
  {
    -[_UIBoundingPathBitmap bitmapData](bitmap, "bitmapData");
    v25 = self->_bitmap;
    v56 = (double)(unint64_t)v75 / scale;
    if (v25)
    {
      -[_UIBoundingPathBitmap bitmapData](v25, "bitmapData");
      v26 = (double)*((unint64_t *)&v71 + 1);
      goto LABEL_8;
    }
  }
  else
  {
    v78 = 0;
    v76 = 0u;
    v77 = 0u;
    v75 = 0u;
    v56 = 0.0 / scale;
  }
  v74 = 0;
  v72 = 0u;
  v73 = 0u;
  v71 = 0u;
  v26 = 0.0;
LABEL_8:
  v79.size.height = r1;
  v79.size.width = v8;
  v79.origin.y = v9;
  v79.origin.x = v10;
  v90.origin.x = v15;
  v90.origin.y = v17;
  v90.size.width = v19;
  v90.size.height = v21;
  v80 = CGRectIntersection(v79, v90);
  -[_UIBoundingPath _inscribedRectInBoundingRect:byInsettingRect:onEdges:](self, "_inscribedRectInBoundingRect:byInsettingRect:onEdges:", a5, v80.origin.x, v80.origin.y, v80.size.width, v80.size.height, x, y, width, height);
  v27 = v81.origin.x;
  v28 = v81.origin.y;
  v29 = v81.size.width;
  v30 = v81.size.height;
  if (CGRectIsNull(v81) || v29 <= 0.0 || v30 <= 0.0)
    goto LABEL_16;
  v31 = _UIWindowConvertRectFromOrientationToOrientation(orientation, 1, v27, v28, v29, v30, v56, v26 / v57);
  v33 = v32;
  v35 = v34;
  v37 = v36;
  v38 = _UIRectEdgeConvertedFromOrientationToPortrait(a5, orientation);
  CGAffineTransformMakeScale(&v70, v57, v57);
  v82.origin.x = v31;
  v82.origin.y = v33;
  v82.size.width = v35;
  v82.size.height = v37;
  v83 = CGRectApplyAffineTransform(v82, &v70);
  v84 = CGRectIntegral(v83);
  if ((uint64_t)v84.size.width < 1 || (uint64_t)v84.size.height <= 0)
    goto LABEL_16;
  *(_QWORD *)&v64 = (uint64_t)v84.origin.x;
  *((_QWORD *)&v64 + 1) = (uint64_t)v84.origin.y;
  v65 = (uint64_t)v84.size.width;
  v66 = (uint64_t)v84.size.height;
  -[_UIComplexBoundingPath _rectByHorizontallyInsettingPortraitPixelRect:onPortraitEdges:performCompleteTest:](self, "_rectByHorizontallyInsettingPortraitPixelRect:onPortraitEdges:performCompleteTest:", &v64, v38, (v6 & 1) == 0, v84.origin.x, v84.origin.y);
  if (v68 < 1
    || v69 <= 0
    || (v64 = v67,
        v65 = v68,
        v66 = v69,
        -[_UIComplexBoundingPath _rectByVerticallyInsettingPortraitPixelRect:onPortraitEdges:performCompleteTest:](self, "_rectByVerticallyInsettingPortraitPixelRect:onPortraitEdges:performCompleteTest:", &v64, v38, (v6 & 1) == 0), v68 < 1)|| v69 <= 0)
  {
LABEL_16:
    v40 = *MEMORY[0x1E0C9D628];
    v41 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v42 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v43 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }
  else
  {
    v48 = (double)(uint64_t)v67;
    v49 = (double)*((uint64_t *)&v67 + 1);
    v50 = (double)v68;
    v51 = (double)v69;
    CGAffineTransformMakeScale(&v63, 1.0 / v57, 1.0 / v57);
    v85.origin.x = v48;
    v85.origin.y = v49;
    v85.size.width = v50;
    v85.size.height = v51;
    v86 = CGRectApplyAffineTransform(v85, &v63);
    v91.origin.x = _UIWindowConvertRectFromOrientationToOrientation(1, orientation, v86.origin.x, v86.origin.y, v86.size.width, v86.size.height, v56, v26 / v57);
    v91.origin.y = v52;
    v91.size.width = v53;
    v91.size.height = v54;
    v87.origin.x = x;
    v87.origin.y = y;
    v87.size.width = width;
    v87.size.height = height;
    v88 = CGRectIntersection(v87, v91);
    v40 = v88.origin.x;
    v41 = v88.origin.y;
    v42 = v88.size.width;
    v43 = v88.size.height;
  }

  v44 = v40;
  v45 = v41;
  v46 = v42;
  v47 = v43;
  result.size.height = v47;
  result.size.width = v46;
  result.origin.y = v45;
  result.origin.x = v44;
  return result;
}

- (_UIIntegralRect)_rectByVerticallyInsettingPortraitPixelRect:(SEL)a3 onPortraitEdges:(_UIIntegralRect *)a4 performCompleteTest:(unint64_t)a5
{
  _UIIntegralSize var1;
  _UIIntegralRect *result;
  unint64_t var0;
  BOOL v11;
  BOOL v12;
  unint64_t v13;
  unint64_t v14;
  int64_t v15;
  int v16;
  unsigned __int8 v17;
  unint64_t v18;
  unsigned __int8 v19;
  int v20;
  unint64_t v21;
  uint64_t v22;
  int64_t v23;
  int64_t v24;
  int64_t v25;
  int64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int64_t v30;
  _BOOL4 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;

  v31 = a6;
  var1 = a4->var1;
  retstr->var0 = a4->var0;
  retstr->var1 = var1;
  result = (_UIIntegralRect *)self->_bitmap;
  if (result)
    result = (_UIIntegralRect *)-[_UIIntegralRect bitmapData](result, "bitmapData");
  var0 = retstr->var0.var0;
  if ((a5 & 5) != 5)
  {
LABEL_20:
    if ((a5 & 5) == 0)
      return result;
    LOBYTE(v20) = a5 & 1;
    v21 = (a5 >> 2) & 1;
    v22 = retstr->var1.var1;
    v23 = retstr->var0.var1;
    v24 = v23 + v22;
    v25 = var0 + 1;
    v30 = retstr->var1.var0 + var0;
    v26 = v23;
    v27 = var0 + 1;
    while (1)
    {
      if (v22 < 1 || v26 > v22 + v23 || v24 < v23)
        return result;
      if ((v20 & 1) != 0)
      {
        v32 = 0u;
        v33 = 0u;
        v34 = 0u;
        v35 = 0;
        result = (_UIIntegralRect *)_UIBoundingPathBitmapDataRowHitTest((unint64_t *)&v32, v27, v26);
        if ((result & 1) != 0)
        {
          v20 = (uint64_t)(v28 + v27) <= v30 || v31;
          if ((uint64_t)(v28 + v27) <= v30)
          {
            v27 += v28;
          }
          else
          {
            ++v26;
            v27 = var0;
          }
          if ((v21 & 1) == 0)
            goto LABEL_40;
        }
        else
        {
          retstr->var0.var1 = ++v26;
          v22 += v23 - v26;
          retstr->var1.var1 = v22;
          if (v22 < 1)
            return result;
          v20 = 1;
          v23 = v26;
          v27 = var0;
          if ((v21 & 1) == 0)
          {
LABEL_40:
            LODWORD(v21) = 0;
            goto LABEL_47;
          }
        }
      }
      else
      {
        v20 = 0;
        if ((v21 & 1) == 0)
          goto LABEL_40;
      }
      v32 = 0u;
      v33 = 0u;
      v34 = 0u;
      v35 = 0;
      result = (_UIIntegralRect *)_UIBoundingPathBitmapDataRowHitTest((unint64_t *)&v32, v25, v24);
      if ((result & 1) == 0)
      {
        v22 += v24 + ~(v22 + v23);
        retstr->var1.var1 = v22;
LABEL_42:
        --v24;
        LODWORD(v21) = (result & 1) == 0 || v31;
        v25 = var0;
        goto LABEL_47;
      }
      v25 += v29;
      if (v25 > v30)
        goto LABEL_42;
      LODWORD(v21) = 1;
LABEL_47:
      if (((v20 | v21) & 1) == 0)
        return result;
    }
  }
  v11 = (a5 & 1) == 0;
  v12 = (a5 & 4) == 0;
  v13 = retstr->var0.var1;
  v14 = retstr->var1.var0 + var0;
  v15 = retstr->var1.var1;
  while (v15 >= 1)
  {
    if (v11)
    {
      v16 = 1;
      if (v12)
        goto LABEL_20;
    }
    else
    {
      v32 = 0u;
      v33 = 0u;
      v34 = 0u;
      v35 = 0;
      v17 = _UIBoundingPathBitmapDataRowHitTest((unint64_t *)&v32, var0, v13);
      if ((v17 & 1) == 0)
      {
        retstr->var0.var1 = ++v13;
        retstr->var1.var1 = --v15;
      }
      v32 = 0u;
      v33 = 0u;
      v34 = 0u;
      v35 = 0;
      result = (_UIIntegralRect *)_UIBoundingPathBitmapDataRowHitTest((unint64_t *)&v32, v14, v13);
      if ((result & 1) == 0)
      {
        retstr->var0.var1 = ++v13;
        retstr->var1.var1 = --v15;
      }
      if (v15 < 1)
        return result;
      v16 = result & 1 & v17;
      if (v12)
        goto LABEL_20;
    }
    v18 = v15 + v13;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0;
    v19 = _UIBoundingPathBitmapDataRowHitTest((unint64_t *)&v32, var0, v15 + v13);
    if ((v19 & 1) == 0)
    {
      retstr->var1.var1 = --v15;
      v18 = v15 + v13;
    }
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0;
    result = (_UIIntegralRect *)_UIBoundingPathBitmapDataRowHitTest((unint64_t *)&v32, v14, v18);
    if ((result & 1) == 0)
      retstr->var1.var1 = --v15;
    v11 = 0;
    v12 = 0;
    if ((((result & 1 & v19) == 0) & ~v16) == 0)
      goto LABEL_20;
  }
  return result;
}

- (_UIIntegralRect)_rectByHorizontallyInsettingPortraitPixelRect:(SEL)a3 onPortraitEdges:(_UIIntegralRect *)a4 performCompleteTest:(unint64_t)a5
{
  _UIIntegralSize var1;
  _UIIntegralRect *result;
  BOOL v10;
  BOOL v11;
  int64_t v12;
  uint64_t v13;
  unint64_t v14;
  int v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  unint64_t v19;
  char v20;
  unint64_t v21;
  unint64_t v22;
  int64_t var0;
  int64_t v24;
  int64_t v25;
  unint64_t v26;
  unint64_t v27;
  int64_t v28;
  int64_t v29;
  BOOL v30;
  int64_t v31;
  _BOOL4 v32;
  unint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;

  v32 = a6;
  var1 = a4->var1;
  retstr->var0 = a4->var0;
  retstr->var1 = var1;
  result = (_UIIntegralRect *)self->_bitmap;
  if (result)
    result = (_UIIntegralRect *)-[_UIIntegralRect bitmapData](result, "bitmapData");
  if ((a5 & 0xA) != 0xA)
  {
    v33 = retstr->var0.var1;
LABEL_22:
    if ((a5 & 0xA) == 0)
      return result;
    v21 = (a5 >> 1) & 1;
    v22 = (a5 >> 3) & 1;
    var0 = retstr->var0.var0;
    v24 = retstr->var1.var0;
    v25 = retstr->var0.var0 + v24;
    v26 = v33 + 1;
    v31 = retstr->var1.var1 + v33;
    v27 = v33 + 1;
    v28 = retstr->var0.var0;
    while (1)
    {
      if (v24 < 1)
        return result;
      v29 = v24 + v28;
      if (var0 > v24 + v28 || v25 < v28)
        return result;
      if ((v21 & 1) != 0)
      {
        v34 = 0u;
        v35 = 0u;
        v36 = 0u;
        v37 = 0;
        result = (_UIIntegralRect *)_UIBoundingPathBitmapDataRowHitTest((unint64_t *)&v34, var0, v27);
        if ((result & 1) != 0)
        {
          v30 = (uint64_t)(v27 + 1) <= v31;
          LODWORD(v21) = (uint64_t)(v27 + 1) <= v31 || v32;
          if ((uint64_t)(v27 + 1) <= v31)
            ++v27;
          else
            v27 = v33;
          if (!v30)
            ++var0;
          if ((v22 & 1) == 0)
            goto LABEL_44;
        }
        else
        {
          v28 = var0 + 1;
          retstr->var0.var0 = var0 + 1;
          v24 = v29 + ~var0;
          retstr->var1.var0 = v24;
          if (v24 < 1)
            return result;
          LODWORD(v21) = 1;
          v27 = v33;
          ++var0;
          if ((v22 & 1) == 0)
          {
LABEL_44:
            LODWORD(v22) = 0;
            goto LABEL_51;
          }
        }
      }
      else
      {
        LODWORD(v21) = 0;
        if ((v22 & 1) == 0)
          goto LABEL_44;
      }
      v34 = 0u;
      v35 = 0u;
      v36 = 0u;
      v37 = 0;
      result = (_UIIntegralRect *)_UIBoundingPathBitmapDataRowHitTest((unint64_t *)&v34, v25, v26);
      if ((result & 1) == 0)
      {
        v24 += v25 + ~(v28 + v24);
        retstr->var1.var0 = v24;
LABEL_46:
        --v25;
        LODWORD(v22) = (result & 1) == 0 || v32;
        v26 = v33;
        goto LABEL_51;
      }
      if ((uint64_t)++v26 > v31)
        goto LABEL_46;
      LODWORD(v22) = 1;
LABEL_51:
      if (((v21 | v22) & 1) == 0)
        return result;
    }
  }
  v10 = (a5 & 2) == 0;
  v11 = (a5 & 8) == 0;
  v12 = retstr->var0.var0;
  v13 = retstr->var1.var0;
  v33 = retstr->var0.var1;
  v14 = retstr->var1.var1 + v33;
  while (v13 >= 1)
  {
    if (v10)
    {
      v15 = 1;
      if (v11)
        goto LABEL_22;
    }
    else
    {
      v34 = 0u;
      v35 = 0u;
      v36 = 0u;
      v37 = 0;
      v17 = _UIBoundingPathBitmapDataRowHitTest((unint64_t *)&v34, v12, v33);
      if ((v17 & 1) == 0)
      {
        v12 += v16;
        retstr->var0.var0 = v12;
        v13 -= v16;
        retstr->var1.var0 = v13;
      }
      v34 = 0u;
      v35 = 0u;
      v36 = 0u;
      v37 = 0;
      result = (_UIIntegralRect *)_UIBoundingPathBitmapDataRowHitTest((unint64_t *)&v34, v12, v14);
      if ((result & 1) == 0)
      {
        v12 += v18;
        retstr->var0.var0 = v12;
        v13 -= v18;
        retstr->var1.var0 = v13;
      }
      if (v13 < 1)
        return result;
      v15 = result & v17 & 1;
      if (v11)
        goto LABEL_22;
    }
    v19 = v12 + v13;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0;
    v20 = _UIBoundingPathBitmapDataRowHitTest((unint64_t *)&v34, v12 + v13, v33);
    if ((v20 & 1) == 0)
    {
      retstr->var1.var0 = --v13;
      v19 = v13 + v12;
    }
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0;
    result = (_UIIntegralRect *)_UIBoundingPathBitmapDataRowHitTest((unint64_t *)&v34, v19, v14);
    if ((result & 1) == 0)
      retstr->var1.var0 = --v13;
    v10 = 0;
    v11 = 0;
    if ((((result & v20 & 1) == 0) & ~v15) == 0)
      goto LABEL_22;
  }
  return result;
}

- (CGRect)_portaitPixelRectWithPixelMinimumPaddingFromBoundingPath:(double)a3 againstPortraitEdge:(unint64_t)a4 fromPortraitPixelRect:(CGRect)a5 withPortraitPixelCornerRadii:(_UIIntegralCornerRadii *)a6
{
  double height;
  double width;
  CGFloat y;
  CGFloat x;
  _UIBoundingPathBitmap *bitmap;
  CGFloat v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int64_t v19;
  int64_t v20;
  double v21;
  unint64_t v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  double v27;
  double v28;
  CGFloat v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int64_t v34;
  int64_t v35;
  double v36;
  unint64_t v37;
  uint64_t v38;
  char v39;
  uint64_t v40;
  double v41;
  double v42;
  double v43;
  double v44;
  unint64_t v45;
  double v46;
  BOOL v47;
  double v48;
  unint64_t v49;
  double v50;
  unint64_t v52;
  unint64_t v53;
  double v54;
  double v55;
  double v56;
  double v57;
  char v58;
  char v59;
  __double2 v60;
  char v61;
  _BOOL4 v62;
  __double2 v63;
  double v64;
  double v65;
  double v66;
  double v67;
  __double2 v68;
  double v69;
  double v70;
  __double2 v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  int64_t v79;
  unint64_t v80;
  int64_t v81;
  char v82;
  uint64_t v83;
  double v84;
  double v85;
  double v86;
  double v87;
  unint64_t v88;
  int64_t v89;
  int64_t v90;
  char v91;
  double v92;
  double v93;
  int64_t v94;
  unint64_t v95;
  int64_t v96;
  char v97;
  uint64_t v98;
  double v99;
  double v100;
  double v101;
  unint64_t v102;
  int64_t v103;
  int64_t v104;
  char v105;
  double v106;
  double v107;
  double v108;
  double v109;
  double v110;
  double v111;
  double v112;
  double v113;
  double v114;
  double var3;
  double var0;
  double v117;
  double var2;
  double var1;
  double v120;
  double v121;
  double v122;
  double v123;
  double v124;
  double v125;
  double v126;
  double v127;
  double v128;
  double v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  uint64_t v133;
  CGRect v134;
  CGRect v135;
  CGRect v136;
  CGRect v137;
  CGRect v138;
  CGRect v139;
  CGRect v140;
  CGRect v141;
  CGRect result;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  bitmap = self->_bitmap;
  if (bitmap)
    -[_UIBoundingPathBitmap bitmapData](bitmap, "bitmapData");
  if (a4 == 8 || a4 == 2)
  {
    v134.origin.x = x;
    v134.origin.y = y;
    v134.size.width = width;
    v134.size.height = height;
    v14 = CGRectGetHeight(v134) * 0.333333333;
    v135.origin.x = x;
    v135.origin.y = y;
    v135.size.width = width;
    v135.size.height = height;
    v136 = CGRectInset(v135, 0.0, v14);
    v137 = CGRectIntegral(v136);
    v15 = (uint64_t)v137.origin.x;
    v16 = (uint64_t)v137.origin.y;
    v17 = (uint64_t)v137.size.width;
    v18 = (uint64_t)v137.size.height + (uint64_t)v137.origin.y;
    v19 = v18;
    v20 = (uint64_t)v137.origin.y;
    while (v20 <= v19)
    {
      v21 = (double)(v15 + v17) + a3;
      if (a4 == 2)
        v21 = (double)v15 - a3;
      v22 = (uint64_t)v21;
      v130 = 0u;
      v131 = 0u;
      v132 = 0u;
      v133 = 0;
      if ((_UIBoundingPathBitmapDataRowHitTest((unint64_t *)&v130, (uint64_t)v21, v20) & 1) != 0)
      {
        ++v20;
      }
      else if (a4 == 2)
      {
        v130 = 0u;
        v131 = 0u;
        v132 = 0u;
        v133 = 0;
        _UIBoundingPathBitmapDataRowHitTest((unint64_t *)&v130, v22, v20);
        v15 += v23;
      }
      else
      {
        v15 = (uint64_t)((double)v15 + -1.0);
      }
      v130 = 0u;
      v131 = 0u;
      v132 = 0u;
      v133 = 0;
      v24 = _UIBoundingPathBitmapDataRowHitTest((unint64_t *)&v130, v22, v19);
      v26 = (uint64_t)((double)v15 + -1.0);
      if (a4 == 2)
        v26 = v25 + v15;
      if ((v24 & 1) != 0)
        v19 = (uint64_t)((double)v19 + -1.0);
      else
        v15 = v26;
      if (v15 < 0 || v16 < 0 || v15 + v17 || v18)
        goto LABEL_174;
    }
    v27 = (double)v15;
    v28 = y;
  }
  else
  {
    v138.origin.x = x;
    v138.origin.y = y;
    v138.size.width = width;
    v138.size.height = height;
    v29 = CGRectGetWidth(v138) * 0.333333333;
    v139.origin.x = x;
    v139.origin.y = y;
    v139.size.width = width;
    v139.size.height = height;
    v140 = CGRectInset(v139, v29, 0.0);
    v141 = CGRectIntegral(v140);
    v30 = (uint64_t)v141.origin.x;
    v31 = (uint64_t)v141.origin.y;
    v32 = (uint64_t)v141.size.height;
    v33 = (uint64_t)v141.size.width + (uint64_t)v141.origin.x;
    v34 = (uint64_t)v141.origin.x;
    v35 = v33;
    while (1)
    {
      v28 = (double)v31;
      if (v34 > v35)
        break;
      v36 = (double)(v31 + v32) + a3;
      if (a4 == 1)
        v36 = v28 - a3;
      v37 = (uint64_t)v36;
      v130 = 0u;
      v131 = 0u;
      v132 = 0u;
      v133 = 0;
      if ((_UIBoundingPathBitmapDataRowHitTest((unint64_t *)&v130, v34, (uint64_t)v36) & 1) != 0)
      {
        v34 += v38;
      }
      else if (a4 == 1)
      {
        v130 = 0u;
        v131 = 0u;
        v132 = 0u;
        v133 = 0;
        _UIBoundingPathBitmapDataRowHitTest((unint64_t *)&v130, v34, v37);
        ++v31;
      }
      else
      {
        v31 = (uint64_t)((double)v31 + -1.0);
      }
      v130 = 0u;
      v131 = 0u;
      v132 = 0u;
      v133 = 0;
      v39 = _UIBoundingPathBitmapDataRowHitTest((unint64_t *)&v130, v35, v37);
      v40 = (uint64_t)((double)v31 + -1.0);
      if (a4 == 1)
        v40 = v31 + 1;
      if ((v39 & 1) != 0)
        v35 = (uint64_t)((double)v35 + -1.0);
      else
        v31 = v40;
      if (v30 < 0 || v31 < 0 || v33 || v31 + v32)
        goto LABEL_174;
    }
    v27 = x;
  }
  v41 = width;
  v42 = height;
  v43 = 1.0;
  v44 = fmin(a3 * 0.2 + 1.0, 5.0);
  v45 = a4 - 1;
  switch(a4)
  {
    case 1uLL:
      v28 = v44 + v28;
      if (height > v44 + v44)
        v42 = height - (v44 + v44);
      else
        v42 = height;
      break;
    case 2uLL:
      v27 = v44 + v27;
      if (width > v44 + v44)
        v41 = width - (v44 + v44);
      else
        v41 = width;
      break;
    case 4uLL:
      if (height > v44 + v44)
        v42 = height - (v44 + v44);
      else
        v42 = height;
      if (height > v44 + v44)
        v28 = v44 + v28;
      else
        v28 = v28 - v44;
      break;
    case 8uLL:
      if (width > v44 + v44)
        v41 = width - (v44 + v44);
      else
        v41 = width;
      if (width > v44 + v44)
        v27 = v44 + v27;
      else
        v27 = v27 - v44;
      break;
    default:
      break;
  }
  v112 = v44;
  v113 = height;
  v114 = width;
  var0 = (double)a6->var0;
  var1 = (double)a6->var1;
  var2 = (double)a6->var2;
  var3 = (double)a6->var3;
  v46 = ceil(((var0 + a3) * 1.57079633 + (var1 + a3) * 1.57079633 + (var2 + a3) * 1.57079633 + (var3 + a3) * 1.57079633)* 0.5);
  if (v46 < 8.0)
    v46 = 8.0;
  v47 = a4 == 8 || a4 == 2;
  v48 = (double)(unint64_t)v46 * 0.125;
  v49 = vcvtpd_u64_f64(v48);
  if (v47)
    v50 = 1.0;
  else
    v50 = 0.0;
  if (a4 != 4 && a4 != 1)
    v43 = 0.0;
  v121 = v43;
  v122 = v50;
  if (v49)
  {
    v52 = 0;
    v117 = 0.785398163 / (double)(unint64_t)ceil(v48);
    while (v41 > 0.0 && v42 > 0.0)
    {
      v53 = 0;
      v128 = v42;
      v129 = v41;
      v123 = v28;
      v54 = v28 + v42;
      v55 = v117 * (double)v52;
      v120 = v27 + v41;
      v56 = v27 + v41 - var2;
      v124 = v54;
      v126 = v27;
      v57 = v54 - var2;
      v58 = 1;
      while (1)
      {
        v59 = v58;
        v60 = __sincos_stret(v55 + (double)v53 * 0.785398163);
        v130 = 0u;
        v131 = 0u;
        v132 = 0u;
        v133 = 0;
        v61 = _UIBoundingPathBitmapDataRowHitTest((unint64_t *)&v130, llround(v56 + (var2 + a3) * v60.__cosval), llround(v57 + (var2 + a3) * v60.__sinval));
        v62 = (v61 & 1) == 0;
        if ((v61 & 1) == 0)
          break;
        v58 = 0;
        v53 = 1;
        if ((v59 & 1) == 0)
        {
          v53 = 2;
          goto LABEL_86;
        }
      }
      v128 = v128 - v122;
      v129 = v129 - v121;
LABEL_86:
      while (1)
      {
        v63 = __sincos_stret(v55 + (double)v53 * 0.785398163);
        v130 = 0u;
        v131 = 0u;
        v132 = 0u;
        v133 = 0;
        if ((_UIBoundingPathBitmapDataRowHitTest((unint64_t *)&v130, llround(v126 + var1 + (var1 + a3) * v63.__cosval), llround(v124 - var1 + (var1 + a3) * v63.__sinval)) & 1) == 0)break;
        if (++v53 == 4)
        {
          v64 = v126;
          v125 = v126;
          v65 = v123;
          goto LABEL_91;
        }
      }
      v64 = v126;
      v125 = v121 + v126;
      v41 = v129 - v121;
      v42 = v128 - v122;
      v65 = v123;
      if (v53 > 5)
      {
        v69 = v123;
        goto LABEL_97;
      }
      v128 = v128 - v122;
      v129 = v129 - v121;
      v62 = 1;
LABEL_91:
      v66 = v64 + var0;
      v67 = v65 + var0;
      while (1)
      {
        v68 = __sincos_stret(v55 + (double)v53 * 0.785398163);
        v130 = 0u;
        v131 = 0u;
        v132 = 0u;
        v133 = 0;
        if ((_UIBoundingPathBitmapDataRowHitTest((unint64_t *)&v130, llround(v66 + (var0 + a3) * v68.__cosval), llround(v67 + (var0 + a3) * v68.__sinval)) & 1) == 0)break;
        if (++v53 == 6)
        {
          v65 = v123;
          v127 = v123;
          goto LABEL_99;
        }
      }
      v125 = v121 + v125;
      v41 = v129 - v121;
      v65 = v123;
      v69 = v122 + v123;
      v42 = v128 - v122;
LABEL_97:
      if (v53 > 7)
      {
LABEL_105:
        v72 = v125;
LABEL_106:
        v52 = 0;
      }
      else
      {
        v127 = v69;
        v128 = v42;
        v129 = v41;
        v62 = 1;
LABEL_99:
        v70 = v65 + var3;
        do
        {
          v71 = __sincos_stret(v55 + (double)v53 * 0.785398163);
          v130 = 0u;
          v131 = 0u;
          v132 = 0u;
          v133 = 0;
          if ((_UIBoundingPathBitmapDataRowHitTest((unint64_t *)&v130, llround(v120 - var3 + (var3 + a3) * v71.__cosval), llround(v70 + (var3 + a3) * v71.__sinval)) & 1) == 0)
          {
            v41 = v129 - v121;
            v69 = v122 + v127;
            v42 = v128 - v122;
            goto LABEL_105;
          }
          ++v53;
        }
        while (v53 != 8);
        if (v62)
        {
          v42 = v128;
          v41 = v129;
          v72 = v125;
          v69 = v127;
          goto LABEL_106;
        }
        ++v52;
        v42 = v128;
        v41 = v129;
        v72 = v125;
        v69 = v127;
      }
      v27 = v72;
      v28 = v69;
      if (v52 >= v49)
        goto LABEL_112;
    }
    v72 = *MEMORY[0x1E0C9D628];
    v69 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v41 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v42 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }
  else
  {
    v72 = v27;
    v69 = v28;
  }
LABEL_112:
  if (a4 == 8 || a4 == 2)
  {
    if (v42 <= 0.0)
    {
      v73 = v72;
      v76 = v42;
      v78 = v69;
    }
    else
    {
      v73 = v72;
      v74 = v72 + v41;
      v75 = v42;
      v76 = v42;
      v77 = v69;
      v78 = v69;
LABEL_116:
      if (v41 <= 0.0)
      {
        v78 = v77;
        v76 = v75;
      }
      else
      {
        v79 = llround(v73 + (double)a6->var0);
        v80 = llround(v78 - a3);
        v81 = llround(v74 - (double)a6->var3);
        while (v79 <= v81)
        {
          v130 = 0u;
          v131 = 0u;
          v132 = 0u;
          v133 = 0;
          v82 = _UIBoundingPathBitmapDataRowHitTest((unint64_t *)&v130, v79, v80);
          v79 += v83;
          if ((v82 & 1) == 0)
          {
            v78 = v78 + 1.0;
            v76 = v76 + -1.0;
            if (v76 > 0.0)
              goto LABEL_116;
            break;
          }
        }
      }
    }
    if (v76 <= 0.0)
    {
      v92 = v76;
      v99 = v113;
      v93 = v114;
    }
    else
    {
      v92 = v76;
      v93 = v114;
LABEL_133:
      if (v41 <= 0.0)
      {
        v92 = v76;
      }
      else
      {
        v94 = llround(v73 + (double)a6->var1);
        v95 = llround(v78 + v92 + a3);
        v96 = llround(v73 + v41 - (double)a6->var2);
        while (v94 <= v96)
        {
          v130 = 0u;
          v131 = 0u;
          v132 = 0u;
          v133 = 0;
          v97 = _UIBoundingPathBitmapDataRowHitTest((unint64_t *)&v130, v94, v95);
          v94 += v98;
          if ((v97 & 1) == 0)
          {
            v92 = v92 + -1.0;
            if (v92 > 0.0)
              goto LABEL_133;
            break;
          }
        }
      }
      v99 = v113;
    }
    v100 = v112;
    v72 = v73;
    goto LABEL_159;
  }
  v84 = v69 + v42;
  if (v41 <= 0.0)
  {
    v85 = v41;
  }
  else
  {
    v85 = v41;
    v86 = v72;
LABEL_124:
    v87 = v69;
    if (v42 <= 0.0)
    {
      v72 = v86;
      v85 = v41;
    }
    else
    {
      v88 = llround(v72 - a3);
      v89 = llround(v69 + (double)a6->var0);
      v90 = llround(v84 - (double)a6->var1);
      while (v89 <= v90)
      {
        v130 = 0u;
        v131 = 0u;
        v132 = 0u;
        v133 = 0;
        v91 = _UIBoundingPathBitmapDataRowHitTest((unint64_t *)&v130, v88, v89++);
        if ((v91 & 1) == 0)
        {
          v72 = v72 + 1.0;
          v85 = v85 + -1.0;
          v69 = v87;
          if (v85 > 0.0)
            goto LABEL_124;
          goto LABEL_147;
        }
      }
    }
    v69 = v87;
  }
LABEL_147:
  if (v85 <= 0.0)
  {
    v92 = v42;
    v78 = v69;
    v41 = v85;
LABEL_156:
    v99 = v113;
    v93 = v114;
    v100 = v112;
    goto LABEL_159;
  }
  v101 = v69;
  v41 = v85;
  while (2)
  {
    if (v42 > 0.0)
    {
      v102 = llround(v72 + v41 + a3);
      v103 = llround(v101 + (double)a6->var3);
      v104 = llround(v84 - (double)a6->var2);
      do
      {
        if (v103 > v104)
        {
          v92 = v42;
          goto LABEL_158;
        }
        v130 = 0u;
        v131 = 0u;
        v132 = 0u;
        v133 = 0;
        v105 = _UIBoundingPathBitmapDataRowHitTest((unint64_t *)&v130, v102, v103++);
      }
      while ((v105 & 1) != 0);
      v41 = v41 + -1.0;
      if (v41 > 0.0)
        continue;
      v92 = v42;
      v78 = v101;
      goto LABEL_156;
    }
    break;
  }
  v92 = v42;
  v41 = v85;
LABEL_158:
  v99 = v113;
  v93 = v114;
  v100 = v112;
  v78 = v101;
LABEL_159:
  switch(v45)
  {
    case 0uLL:
      v78 = v78 - v100;
      v106 = v100 + v100;
      if (v99 > v100 + v100)
        goto LABEL_166;
      break;
    case 1uLL:
      v72 = v72 - v100;
      v107 = v100 + v100;
      if (v93 > v100 + v100)
        goto LABEL_169;
      break;
    case 3uLL:
      v106 = v100 + v100;
      if (v99 <= v100 + v100)
      {
        v78 = v100 + v78;
      }
      else
      {
        v78 = v78 - v100;
LABEL_166:
        v92 = v106 + v92;
      }
      break;
    case 7uLL:
      v107 = v100 + v100;
      if (v93 <= v100 + v100)
      {
        v72 = v100 + v72;
      }
      else
      {
        v72 = v72 - v100;
LABEL_169:
        v41 = v107 + v41;
      }
      break;
    default:
      break;
  }
  if (v41 <= 0.0 || (v108 = v92, v92 <= 0.0))
  {
LABEL_174:
    v72 = *MEMORY[0x1E0C9D628];
    v78 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v41 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v108 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }
  v109 = v72;
  v110 = v78;
  v111 = v41;
  result.size.height = v108;
  result.size.width = v111;
  result.origin.y = v110;
  result.origin.x = v109;
  return result;
}

- (BOOL)validateForCoordinateSpace
{
  _UIComplexBoundingPath *v2;
  _UIBoundingPathBitmap *bitmap;
  int64_t orientation;
  double scale;
  void *v6;

  v2 = self;
  bitmap = self->_bitmap;
  orientation = self->_orientation;
  scale = self->_scale;
  -[_UIBoundingPath coordinateSpace](self, "coordinateSpace");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = -[_UIComplexBoundingPath _validateBitmap:withOrientation:scale:forCoordinateSpace:](v2, "_validateBitmap:withOrientation:scale:forCoordinateSpace:", bitmap, orientation, v6, scale);

  return (char)v2;
}

- (CGRect)_rectTuckedAgainstEdge:(unint64_t)a3 ofBoundingPathAndRect:(CGRect)a4 withSize:(double)a5 cornerRadii:(UIRectCornerRadii)a6 minimumPadding:(double)a7
{
  void *v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double scale;
  int64_t orientation;
  _UIBoundingPathBitmap *bitmap;
  _UIBoundingPathBitmap *v23;
  double v24;
  double x;
  double y;
  double width;
  double height;
  double v29;
  double v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  CGFloat v44;
  CGFloat v45;
  CGFloat v46;
  CGFloat v47;
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
  double v60;
  CGAffineTransform v62;
  _QWORD v63[4];
  CGAffineTransform v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  uint64_t v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  uint64_t v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;
  CGRect result;
  CGRect v81;

  -[_UIBoundingPath coordinateSpace](self, "coordinateSpace");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIComplexBoundingPath.m"), 1325, CFSTR("The bounding path's coordinate space cannot be nil"));

  }
  objc_msgSend(v11, "bounds");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  scale = self->_scale;
  orientation = self->_orientation;
  bitmap = self->_bitmap;
  if (bitmap)
  {
    -[_UIBoundingPathBitmap bitmapData](bitmap, "bitmapData");
    v23 = self->_bitmap;
    v60 = (double)(unint64_t)v69 / scale;
    if (v23)
    {
      -[_UIBoundingPathBitmap bitmapData](v23, "bitmapData");
      v24 = (double)*((unint64_t *)&v65 + 1);
      goto LABEL_8;
    }
  }
  else
  {
    v72 = 0;
    v70 = 0u;
    v71 = 0u;
    v69 = 0u;
    v60 = 0.0 / scale;
  }
  v68 = 0;
  v66 = 0u;
  v67 = 0u;
  v65 = 0u;
  v24 = 0.0;
LABEL_8:
  v81.origin.x = v13;
  v81.origin.y = v15;
  v81.size.width = v17;
  v81.size.height = v19;
  v73 = CGRectIntersection(a4, v81);
  -[_UIBoundingPath _rectTuckedAgainstEdge:ofBoundingRect:withSize:minimumPadding:](self, "_rectTuckedAgainstEdge:ofBoundingRect:withSize:minimumPadding:", a3, v73.origin.x, v73.origin.y, v73.size.width, v73.size.height, a5, a7);
  x = v74.origin.x;
  y = v74.origin.y;
  width = v74.size.width;
  height = v74.size.height;
  if (CGRectIsNull(v74))
    goto LABEL_17;
  v29 = v24 / scale;
  v30 = _UIWindowConvertRectFromOrientationToOrientation(orientation, 1, x, y, width, height, v60, v29);
  v32 = v31;
  v34 = v33;
  v36 = v35;
  v37 = _UIRectEdgeConvertedFromOrientationToPortrait(a3, orientation);
  CGAffineTransformMakeScale(&v64, scale, scale);
  v75.origin.x = v30;
  v75.origin.y = v32;
  v75.size.width = v34;
  v75.size.height = v36;
  v76 = CGRectApplyAffineTransform(v75, &v64);
  v38 = (uint64_t)(a6.topLeft * scale);
  v39 = (uint64_t)(a6.bottomLeft * scale);
  v40 = (uint64_t)(a6.bottomRight * scale);
  v41 = (uint64_t)(a6.topRight * scale);
  if (orientation == 2)
  {
    v42 = (uint64_t)(a6.topLeft * scale);
    v43 = (uint64_t)(a6.topRight * scale);
    v41 = (uint64_t)(a6.bottomRight * scale);
    v40 = (uint64_t)(a6.bottomLeft * scale);
    goto LABEL_15;
  }
  if (orientation == 3)
  {
    v42 = (uint64_t)(a6.topRight * scale);
    v43 = (uint64_t)(a6.bottomRight * scale);
    v41 = (uint64_t)(a6.bottomLeft * scale);
    v40 = (uint64_t)(a6.topLeft * scale);
    goto LABEL_15;
  }
  v42 = (uint64_t)(a6.bottomLeft * scale);
  v43 = (uint64_t)(a6.topLeft * scale);
  if (orientation == 4)
  {
LABEL_15:
    v38 = v41;
    v41 = v40;
    v40 = v42;
    v39 = v43;
  }
  v63[0] = v38;
  v63[1] = v39;
  v63[2] = v40;
  v63[3] = v41;
  -[_UIComplexBoundingPath _portaitPixelRectWithPixelMinimumPaddingFromBoundingPath:againstPortraitEdge:fromPortraitPixelRect:withPortraitPixelCornerRadii:](self, "_portaitPixelRectWithPixelMinimumPaddingFromBoundingPath:againstPortraitEdge:fromPortraitPixelRect:withPortraitPixelCornerRadii:", v37, v63, scale * a7, v76.origin.x, v76.origin.y, v76.size.width, v76.size.height);
  v44 = v77.origin.x;
  v45 = v77.origin.y;
  v46 = v77.size.width;
  v47 = v77.size.height;
  if (!CGRectIsNull(v77))
  {
    CGAffineTransformMakeScale(&v62, 1.0 / scale, 1.0 / scale);
    v78.origin.x = v44;
    v78.origin.y = v45;
    v78.size.width = v46;
    v78.size.height = v47;
    v79 = CGRectApplyAffineTransform(v78, &v62);
    v48 = _UIWindowConvertRectFromOrientationToOrientation(1, orientation, v79.origin.x, v79.origin.y, v79.size.width, v79.size.height, v60, v29);
    v49 = v52;
    v50 = v53;
    v51 = v54;
    goto LABEL_19;
  }
LABEL_17:
  v48 = *MEMORY[0x1E0C9D628];
  v49 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v50 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v51 = *(double *)(MEMORY[0x1E0C9D628] + 24);
LABEL_19:

  v55 = v48;
  v56 = v49;
  v57 = v50;
  v58 = v51;
  result.size.height = v58;
  result.size.width = v57;
  result.origin.y = v56;
  result.origin.x = v55;
  return result;
}

- (BOOL)_validateBitmap:(id)a3 withOrientation:(int64_t)a4 scale:(double)a5 forCoordinateSpace:(id)a6
{
  id v11;
  id v12;
  unint64_t v13;
  unint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  BOOL v21;
  NSObject *v22;
  BOOL v23;
  void *v24;
  void *v25;
  unint64_t v27;
  NSObject *v28;
  unint64_t v29;
  NSObject *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  CGAffineTransform v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint64_t v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint64_t v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint64_t v50;
  uint8_t buf[4];
  unint64_t v52;
  __int16 v53;
  unint64_t v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  double v58;
  __int16 v59;
  id v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a6;
  if ((unint64_t)(a4 - 3) > 1)
  {
    if (v11)
    {
      objc_msgSend(v11, "bitmapData");
      v13 = v43;
      objc_msgSend(v11, "bitmapData");
      v14 = *((_QWORD *)&v35 + 1);
    }
    else
    {
      v13 = 0;
      v14 = 0;
      v46 = 0;
      v44 = 0u;
      v45 = 0u;
      v43 = 0u;
      v35 = 0u;
      v36 = 0u;
      v37 = 0u;
      v38 = 0;
    }
  }
  else if (v11)
  {
    objc_msgSend(v11, "bitmapData");
    v13 = *((_QWORD *)&v47 + 1);
    objc_msgSend(v11, "bitmapData");
    v14 = v39;
  }
  else
  {
    v13 = 0;
    v14 = 0;
    v50 = 0;
    v48 = 0u;
    v49 = 0u;
    v47 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0;
  }
  objc_msgSend(v12, "bounds");
  v16 = v15;
  v18 = v17;
  CGAffineTransformMakeScale(&v34, a5, a5);
  v19 = v16 * v34.a + v18 * v34.c;
  v20 = v16 * v34.b + v18 * v34.d;
  v21 = v19 <= (double)v13;
  if (v20 > (double)v14)
    v21 = 0;
  if (_UIBoundingPathValidationAssertsEnabled)
  {
    if (!v21)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v22 = objc_claimAutoreleasedReturnValue();
      +[UIApplication stringForInterfaceOrientation:](UIApplication, "stringForInterfaceOrientation:", a4);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject handleFailureInMethod:object:file:lineNumber:description:](v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIComplexBoundingPath.m"), 134, CFSTR("Bounding path likely out of sync with its coordinate space: The bitmap cannot be smaller than the coordinate space's bounds (in pixels), adjusted for orientation. Bitmap orientation-adjusted size: {width=%lu, height=%lu}; Orientation: %@; Scale: %.1f; Coordinate space: %@"),
        v13,
        v14,
        v33,
        *(_QWORD *)&a5,
        v12);
LABEL_13:

LABEL_16:
      v23 = 0;
      goto LABEL_18;
    }
  }
  else if (!v21)
  {
    if (!os_variant_has_internal_diagnostics())
      goto LABEL_16;
    v27 = _MergedGlobals_21_6;
    if (!_MergedGlobals_21_6)
    {
      v27 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v27, (unint64_t *)&_MergedGlobals_21_6);
    }
    v28 = *(NSObject **)(v27 + 8);
    if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      goto LABEL_16;
    v22 = v28;
    +[UIApplication stringForInterfaceOrientation:](UIApplication, "stringForInterfaceOrientation:", a4);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134219010;
    v52 = v13;
    v53 = 2048;
    v54 = v14;
    v55 = 2112;
    v56 = v33;
    v57 = 2048;
    v58 = a5;
    v59 = 2112;
    v60 = v12;
    _os_log_impl(&dword_185066000, v22, OS_LOG_TYPE_ERROR, "Bounding path likely out of sync with its coordinate space: The bitmap cannot be smaller than the coordinate space's bounds (in pixels), adjusted for orientation. Bitmap orientation-adjusted size: {width=%lu, height=%lu}; Orient"
      "ation: %@; Scale: %.1f; Coordinate space: %@",
      buf,
      0x34u);
    goto LABEL_13;
  }
  if (v19 + a5 < (double)v13)
    goto LABEL_16;
  v23 = v20 + a5 >= (double)v14;
LABEL_18:
  if (_UIBoundingPathValidationAssertsEnabled)
  {
    if (!v23)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIApplication stringForInterfaceOrientation:](UIApplication, "stringForInterfaceOrientation:", a4);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
        v13,
        v14,
        v25,
        *(_QWORD *)&a5,
        v12);

    }
  }
  else if (!v23 && os_variant_has_internal_diagnostics())
  {
    v29 = qword_1ECD7C510;
    if (!qword_1ECD7C510)
    {
      v29 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v29, (unint64_t *)&qword_1ECD7C510);
    }
    v30 = *(NSObject **)(v29 + 8);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      v31 = v30;
      +[UIApplication stringForInterfaceOrientation:](UIApplication, "stringForInterfaceOrientation:", a4);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134219010;
      v52 = v13;
      v53 = 2048;
      v54 = v14;
      v55 = 2112;
      v56 = v32;
      v57 = 2048;
      v58 = a5;
      v59 = 2112;
      v60 = v12;
        buf,
        0x34u);

    }
  }

  return v23;
}

- (_UIComplexBoundingPath)initWithCoordinateSpace:(id)a3 orientation:(int64_t)a4 scale:(double)a5 boundingPathBitmap:(id)a6
{
  id v11;
  id v12;
  _UIComplexBoundingPath *v13;
  void *v15;
  void *v16;
  void *v17;
  objc_super v18;

  v11 = a3;
  v12 = a6;
  v18.receiver = self;
  v18.super_class = (Class)_UIComplexBoundingPath;
  v13 = -[_UIBoundingPath initWithCoordinateSpace:](&v18, sel_initWithCoordinateSpace_, v11);
  if (v13)
  {
    if (!a4)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, v13, CFSTR("_UIComplexBoundingPath.m"), 62, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("orientation != UIInterfaceOrientationUnknown"));

    }
    if (a5 <= 0.0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, v13, CFSTR("_UIComplexBoundingPath.m"), 63, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("scale > 0"));

      if (v12)
        goto LABEL_6;
    }
    else if (v12)
    {
LABEL_6:
      -[_UIComplexBoundingPath _validateBitmap:withOrientation:scale:forCoordinateSpace:](v13, "_validateBitmap:withOrientation:scale:forCoordinateSpace:", v12, a4, v11, a5);
      v13->_scale = a5;
      v13->_orientation = a4;
      objc_storeStrong((id *)&v13->_bitmap, a6);
      goto LABEL_7;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, v13, CFSTR("_UIComplexBoundingPath.m"), 64, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bitmap != nil"));

    goto LABEL_6;
  }
LABEL_7:

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bitmap, 0);
}

- (UIEdgeInsets)_centerEdgeInsetsOfBoundingPathAndRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double MinY;
  double MinX;
  double MaxX;
  double v22;
  double v23;
  double v24;
  double MaxY;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
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
  UIEdgeInsets result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = 1.0 / self->_scale;
  -[_UIComplexBoundingPath _inscribedRectInBoundingPathAndRect:byInsettingRect:onEdges:withOptions:](self, "_inscribedRectInBoundingPathAndRect:byInsettingRect:onEdges:withOptions:", 10, 1, x, a3.origin.y, width, a3.size.height, x, CGRectGetMidY(a3), width, v8);
  v9 = v32.origin.x;
  v10 = v32.origin.y;
  v11 = v32.size.width;
  rect = v32.size.height;
  if (CGRectIsNull(v32))
    goto LABEL_3;
  v29 = v11;
  v30 = v10;
  v33.origin.x = x;
  v33.origin.y = y;
  v33.size.width = width;
  v33.size.height = height;
  -[_UIComplexBoundingPath _inscribedRectInBoundingPathAndRect:byInsettingRect:onEdges:withOptions:](self, "_inscribedRectInBoundingPathAndRect:byInsettingRect:onEdges:withOptions:", 5, 1, x, y, width, height, CGRectGetMidX(v33), y, v8, height);
  v12 = v34.origin.x;
  v13 = v34.origin.y;
  v28 = v34.size.width;
  v14 = v34.size.height;
  if (CGRectIsNull(v34))
  {
LABEL_3:
    v15 = INFINITY;
    v16 = INFINITY;
    v17 = INFINITY;
    v18 = INFINITY;
  }
  else
  {
    v35.origin.x = v12;
    v35.origin.y = v13;
    v35.size.width = v28;
    v35.size.height = v14;
    v26 = v12;
    MinY = CGRectGetMinY(v35);
    v36.origin.x = x;
    v36.origin.y = y;
    v36.size.width = width;
    v36.size.height = height;
    v15 = MinY - CGRectGetMinY(v36);
    v37.origin.x = v9;
    v37.size.width = v29;
    v37.origin.y = v30;
    v37.size.height = rect;
    v27 = v9;
    MinX = CGRectGetMinX(v37);
    v38.origin.x = x;
    v38.origin.y = y;
    v38.size.width = width;
    v38.size.height = height;
    v16 = MinX - CGRectGetMinX(v38);
    v39.origin.x = x;
    v39.origin.y = y;
    v39.size.width = width;
    v39.size.height = height;
    MaxY = CGRectGetMaxY(v39);
    v40.origin.x = v26;
    v40.origin.y = v13;
    v40.size.width = v28;
    v40.size.height = v14;
    v17 = MaxY - CGRectGetMaxY(v40);
    v41.origin.x = x;
    v41.origin.y = y;
    v41.size.width = width;
    v41.size.height = height;
    MaxX = CGRectGetMaxX(v41);
    v42.origin.x = v27;
    v42.size.width = v29;
    v42.origin.y = v30;
    v42.size.height = rect;
    v18 = MaxX - CGRectGetMaxX(v42);
  }
  v22 = v15;
  v23 = v16;
  v24 = v17;
  result.right = v18;
  result.bottom = v24;
  result.left = v23;
  result.top = v22;
  return result;
}

- (CGRect)_largestInscribedRectInBoundingPathAndRect:(CGRect)a3 withCenter:(CGPoint)a4 aspectRatio:(double)a5
{
  double y;
  double x;
  CGFloat v7;
  void *v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double scale;
  int64_t orientation;
  _UIBoundingPathBitmap *bitmap;
  _UIBoundingPathBitmap *v22;
  double v23;
  double v24;
  double v25;
  double width;
  double v27;
  double v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  CGFloat v41;
  CGFloat v42;
  CGFloat v43;
  CGFloat v44;
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
  void *v56;
  double v57;
  double v58;
  CGFloat r1;
  CGFloat v60;
  CGFloat height;
  CGAffineTransform v63;
  CGAffineTransform v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  uint64_t v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  uint64_t v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;
  CGRect result;
  CGRect v81;

  height = a3.size.height;
  y = a4.y;
  x = a4.x;
  r1 = a3.size.width;
  v60 = a3.origin.y;
  v7 = a3.origin.x;
  -[_UIBoundingPath coordinateSpace](self, "coordinateSpace");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIComplexBoundingPath.m"), 580, CFSTR("The bounding path's coordinate space cannot be nil"));

  }
  objc_msgSend(v10, "bounds");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  scale = self->_scale;
  orientation = self->_orientation;
  bitmap = self->_bitmap;
  if (!bitmap)
  {
    v72 = 0;
    v70 = 0u;
    v71 = 0u;
    v69 = 0u;
    v58 = 0.0 / scale;
    goto LABEL_7;
  }
  -[_UIBoundingPathBitmap bitmapData](bitmap, "bitmapData");
  v22 = self->_bitmap;
  v58 = (double)(unint64_t)v69 / scale;
  if (!v22)
  {
LABEL_7:
    v68 = 0;
    v66 = 0u;
    v67 = 0u;
    v65 = 0u;
    v23 = 0.0;
    goto LABEL_8;
  }
  -[_UIBoundingPathBitmap bitmapData](v22, "bitmapData");
  v23 = (double)*((unint64_t *)&v65 + 1);
LABEL_8:
  v57 = v23;
  v73.origin.y = v60;
  v73.size.height = height;
  v73.size.width = r1;
  v73.origin.x = v7;
  v81.origin.x = v12;
  v81.origin.y = v14;
  v81.size.width = v16;
  v81.size.height = v18;
  v74 = CGRectIntersection(v73, v81);
  -[_UIBoundingPath _largestInscribedRectInBoundingRect:withCenter:aspectRatio:](self, "_largestInscribedRectInBoundingRect:withCenter:aspectRatio:", v74.origin.x, v74.origin.y, v74.size.width, v74.size.height, x, y, a5);
  v24 = v75.origin.x;
  v25 = v75.origin.y;
  width = v75.size.width;
  v27 = v75.size.height;
  if (CGRectIsNull(v75))
    goto LABEL_14;
  if (width <= 0.0)
    goto LABEL_14;
  if (v27 <= 0.0)
    goto LABEL_14;
  v28 = _UIWindowConvertRectFromOrientationToOrientation(orientation, 1, v24, v25, width, v27, v58, v57 / scale);
  v30 = v29;
  v32 = v31;
  v34 = v33;
  _UIAspectRatioConvertedFromOrientationToPortrait(a5);
  v36 = v35;
  CGAffineTransformMakeScale(&v64, scale, scale);
  v76.origin.x = v28;
  v76.origin.y = v30;
  v76.size.width = v32;
  v76.size.height = v34;
  v77 = CGRectApplyAffineTransform(v76, &v64);
  -[_UIComplexBoundingPath _largestInscribedPortraitPixelRectInBoundingPathWithPortraitPixelRect:portraitAspectRatio:](self, "_largestInscribedPortraitPixelRectInBoundingPathWithPortraitPixelRect:portraitAspectRatio:", v77.origin.x, v77.origin.y, v77.size.width, v77.size.height, v36);
  if (v39 <= 0.0 || (v41 = v40, v40 <= 0.0))
  {
LABEL_14:
    v45 = *MEMORY[0x1E0C9D628];
    v47 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v49 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v51 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }
  else
  {
    v42 = v37;
    v43 = v38;
    v44 = v39;
    CGAffineTransformMakeScale(&v63, 1.0 / scale, 1.0 / scale);
    v78.origin.x = v42;
    v78.origin.y = v43;
    v78.size.width = v44;
    v78.size.height = v41;
    v79 = CGRectApplyAffineTransform(v78, &v63);
    v45 = _UIWindowConvertRectFromOrientationToOrientation(1, orientation, v79.origin.x, v79.origin.y, v79.size.width, v79.size.height, v58, v57 / scale);
    v47 = v46;
    v49 = v48;
    v51 = v50;
  }

  v52 = v45;
  v53 = v47;
  v54 = v49;
  v55 = v51;
  result.size.height = v55;
  result.size.width = v54;
  result.origin.y = v53;
  result.origin.x = v52;
  return result;
}

- (CGRect)_largestInscribedPortraitPixelRectInBoundingPathWithPortraitPixelRect:(CGRect)a3 portraitAspectRatio:(double)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  _UIBoundingPathBitmap *bitmap;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  _QWORD v23[5];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  _QWORD v28[5];
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  _QWORD v33[5];
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;
  _QWORD v38[5];
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint64_t v42;
  _QWORD v43[5];
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint64_t v47;
  _QWORD v48[2];
  void (*v49)(uint64_t, void *);
  void *v50;
  uint64_t *v51;
  _QWORD *v52;
  double v53;
  double v54;
  _QWORD v55[4];
  __int128 v56;
  __int128 v57;
  uint64_t v58;
  double *v59;
  uint64_t v60;
  void *v61;
  CGFloat v62;
  CGFloat v63;
  CGFloat v64;
  CGFloat v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  uint64_t v69;
  CGRect v70;
  CGRect v71;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v69 = 0;
  v67 = 0u;
  v68 = 0u;
  v66 = 0u;
  bitmap = self->_bitmap;
  if (bitmap)
    -[_UIBoundingPathBitmap bitmapData](bitmap, "bitmapData");
  if (a4 <= 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIComplexBoundingPath.m"), 532, CFSTR("Invalid aspect ratio."));

  }
  v58 = 0;
  v59 = (double *)&v58;
  v60 = 0x4010000000;
  v61 = &unk_18685B0AF;
  v62 = x;
  v63 = y;
  v64 = width;
  v65 = height;
  v55[0] = 0;
  v55[1] = v55;
  v55[2] = 0x4010000000;
  v55[3] = &unk_18685B0AF;
  v56 = 0u;
  v57 = 0u;
  v70.origin.x = x;
  v70.origin.y = y;
  v70.size.width = width;
  v70.size.height = height;
  v71 = CGRectIntegral(v70);
  *(_QWORD *)&v56 = (uint64_t)v71.origin.x;
  *((_QWORD *)&v56 + 1) = (uint64_t)v71.origin.y;
  *(_QWORD *)&v57 = (uint64_t)v71.size.width;
  *((_QWORD *)&v57 + 1) = (uint64_t)v71.size.height;
  v12 = MEMORY[0x1E0C809B0];
  v48[0] = MEMORY[0x1E0C809B0];
  v48[1] = 3221225472;
  v49 = __116___UIComplexBoundingPath__largestInscribedPortraitPixelRectInBoundingPathWithPortraitPixelRect_portraitAspectRatio___block_invoke;
  v50 = &unk_1E16CB410;
  v13 = 1.0 / a4;
  if (a4 < 1.0)
    v13 = 1.0;
  v53 = fmin(a4, 1.0);
  v54 = v13;
  v51 = &v58;
  v52 = v55;
  v43[0] = MEMORY[0x1E0C809B0];
  v43[1] = 3221225472;
  v43[2] = __116___UIComplexBoundingPath__largestInscribedPortraitPixelRectInBoundingPathWithPortraitPixelRect_portraitAspectRatio___block_invoke_2;
  v43[3] = &unk_1E16CB438;
  v46 = v68;
  v45 = v67;
  v44 = v66;
  v47 = v69;
  v43[4] = v55;
  __116___UIComplexBoundingPath__largestInscribedPortraitPixelRectInBoundingPathWithPortraitPixelRect_portraitAspectRatio___block_invoke((uint64_t)v48, v43);
  v39 = v66;
  v38[0] = v12;
  v38[1] = 3221225472;
  v38[2] = __116___UIComplexBoundingPath__largestInscribedPortraitPixelRectInBoundingPathWithPortraitPixelRect_portraitAspectRatio___block_invoke_3;
  v38[3] = &unk_1E16CB438;
  v40 = v67;
  v41 = v68;
  v42 = v69;
  v38[4] = v55;
  __116___UIComplexBoundingPath__largestInscribedPortraitPixelRectInBoundingPathWithPortraitPixelRect_portraitAspectRatio___block_invoke((uint64_t)v48, v38);
  v34 = v66;
  v33[0] = v12;
  v33[1] = 3221225472;
  v33[2] = __116___UIComplexBoundingPath__largestInscribedPortraitPixelRectInBoundingPathWithPortraitPixelRect_portraitAspectRatio___block_invoke_4;
  v33[3] = &unk_1E16CB438;
  v35 = v67;
  v36 = v68;
  v37 = v69;
  v33[4] = v55;
  v49((uint64_t)v48, v33);
  v29 = v66;
  v28[0] = v12;
  v28[1] = 3221225472;
  v28[2] = __116___UIComplexBoundingPath__largestInscribedPortraitPixelRectInBoundingPathWithPortraitPixelRect_portraitAspectRatio___block_invoke_5;
  v28[3] = &unk_1E16CB438;
  v30 = v67;
  v31 = v68;
  v32 = v69;
  v28[4] = v55;
  v49((uint64_t)v48, v28);
  v23[1] = 3221225472;
  v24 = v66;
  v23[0] = v12;
  v23[2] = __116___UIComplexBoundingPath__largestInscribedPortraitPixelRectInBoundingPathWithPortraitPixelRect_portraitAspectRatio___block_invoke_6;
  v23[3] = &unk_1E16CB438;
  v25 = v67;
  v26 = v68;
  v27 = v69;
  v23[4] = v55;
  v49((uint64_t)v48, v23);
  v14 = v59[4];
  v15 = v59[5];
  v16 = v59[6];
  v17 = v59[7];
  _Block_object_dispose(v55, 8);
  _Block_object_dispose(&v58, 8);
  v18 = v14;
  v19 = v15;
  v20 = v16;
  v21 = v17;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIComplexBoundingPath;
  v4 = a3;
  -[_UIBoundingPath encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("scale"), self->_scale, v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_orientation, CFSTR("orientation"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_bitmap, CFSTR("bitmap"));

}

- (_UIComplexBoundingPath)initWithCoder:(id)a3
{
  id v5;
  _UIComplexBoundingPath *v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  _UIBoundingPathBitmap *bitmap;
  void *v12;
  void *v13;
  void *v14;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_UIComplexBoundingPath;
  v6 = -[_UIBoundingPath initWithCoder:](&v15, sel_initWithCoder_, v5);
  if (v6)
  {
    objc_msgSend(v5, "decodeDoubleForKey:", CFSTR("scale"));
    v6->_scale = v7;
    if (v7 <= 0.0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("_UIComplexBoundingPath.m"), 49, CFSTR("Invalid scale decoded: %f"), *(_QWORD *)&v6->_scale);

    }
    v8 = objc_msgSend(v5, "decodeIntegerForKey:", CFSTR("orientation"));
    v6->_orientation = v8;
    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("_UIComplexBoundingPath.m"), 51, CFSTR("Orientation cannot be unknown"));

    }
    objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bitmap"));
    v9 = objc_claimAutoreleasedReturnValue();
    bitmap = v6->_bitmap;
    v6->_bitmap = (_UIBoundingPathBitmap *)v9;

    if (!v6->_bitmap)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("_UIComplexBoundingPath.m"), 53, CFSTR("Failed to decode bitmap"));

    }
  }

  return v6;
}

- (_UIComplexBoundingPath)initWithRectangularCoordinateSpace:(id)a3 orientation:(int64_t)a4 scale:(double)a5
{
  id v8;
  double v9;
  unint64_t v10;
  double v11;
  unint64_t v12;
  unint64_t v13;
  _UIBoundingPathBitmap *v14;
  _UIComplexBoundingPath *v15;
  _QWORD v17[7];

  v8 = a3;
  objc_msgSend(v8, "bounds");
  v10 = vcvtpd_u64_f64(v9 * a5);
  objc_msgSend(v8, "bounds");
  v12 = vcvtpd_u64_f64(v11 * a5);
  if ((unint64_t)(a4 - 3) >= 2)
    v13 = v12;
  else
    v13 = v10;
  if ((unint64_t)(a4 - 3) < 2)
    v10 = v12;
  memset(&v17[4], 0, 24);
  v17[0] = v10;
  v17[1] = v13;
  v17[2] = 0;
  v17[3] = v13;
  v14 = -[_UIBoundingPathBitmap initWithBitmapData:]([_UIBoundingPathBitmap alloc], "initWithBitmapData:", v17);
  v15 = -[_UIComplexBoundingPath initWithCoordinateSpace:orientation:scale:boundingPathBitmap:]([_UIComplexBoundingPath alloc], "initWithCoordinateSpace:orientation:scale:boundingPathBitmap:", v8, a4, v14, a5);

  return v15;
}

- (id)boundingPathForCoordinateSpace:(id)a3
{
  return -[_UIComplexBoundingPath boundingPathForCoordinateSpace:withCornerRadii:orientation:scale:](self, "boundingPathForCoordinateSpace:withCornerRadii:orientation:scale:", a3, self->_orientation, 0.0, 0.0, 0.0, 0.0, self->_scale);
}

- (id)boundingPathForCoordinateSpace:(id)a3 withCornerRadii:(UIRectCornerRadii)a4 orientation:(int64_t)a5 scale:(double)a6
{
  double topRight;
  id v11;
  void *v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  _UIRectangularBoundingPath *v29;
  _UIComplexBoundingPath *v30;
  _UIBoundingPathBitmap *bitmap;
  _UIBoundingPathBitmap *v32;
  double v33;
  CGFloat v34;
  double v35;
  double v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  _UIBoundingPathBitmap *v43;
  void *v44;
  void *v46;
  void *v47;
  double v48;
  double v49;
  double topLeft;
  double bottomLeft;
  double bottomRight;
  _QWORD v53[4];
  _QWORD v54[4];
  CGAffineTransform v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  uint64_t v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  uint64_t v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;

  topRight = a4.topRight;
  bottomLeft = a4.bottomLeft;
  bottomRight = a4.bottomRight;
  topLeft = a4.topLeft;
  v11 = a3;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIComplexBoundingPath.m"), 91, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("coordinateSpace != nil"));

  }
  v48 = topRight;
  v49 = a6;
  -[_UIBoundingPath coordinateSpace](self, "coordinateSpace");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIComplexBoundingPath.m"), 93, CFSTR("The bounding path's coordinate space cannot be nil"));

  }
  objc_msgSend(v11, "bounds");
  objc_msgSend(v12, "convertRect:fromCoordinateSpace:", v11);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  objc_msgSend(v12, "bounds");
  v71.origin.x = v21;
  v71.origin.y = v22;
  v71.size.width = v23;
  v71.size.height = v24;
  v64.origin.x = v14;
  v64.origin.y = v16;
  v64.size.width = v18;
  v64.size.height = v20;
  v65 = CGRectIntersection(v64, v71);
  x = v65.origin.x;
  y = v65.origin.y;
  width = v65.size.width;
  height = v65.size.height;
  if (!CGRectIsNull(v65))
  {
    v66.origin.x = x;
    v66.origin.y = y;
    v66.size.width = width;
    v66.size.height = height;
    if (!CGRectIsEmpty(v66))
    {
      bitmap = self->_bitmap;
      if (bitmap)
      {
        -[_UIBoundingPathBitmap bitmapData](bitmap, "bitmapData");
        v32 = self->_bitmap;
        v33 = (double)(unint64_t)v60;
        v35 = v48;
        v34 = v49;
        if (v32)
        {
          -[_UIBoundingPathBitmap bitmapData](v32, "bitmapData");
          v36 = (double)*((unint64_t *)&v56 + 1);
          goto LABEL_13;
        }
      }
      else
      {
        v63 = 0;
        v61 = 0u;
        v62 = 0u;
        v60 = 0u;
        v33 = 0.0;
        v35 = v48;
        v34 = v49;
      }
      v59 = 0;
      v57 = 0u;
      v58 = 0u;
      v56 = 0u;
      v36 = 0.0;
LABEL_13:
      CGAffineTransformMakeScale(&v55, v34, v34);
      v67.origin.x = v14;
      v67.origin.y = v16;
      v67.size.width = v18;
      v67.size.height = v20;
      v68 = CGRectApplyAffineTransform(v67, &v55);
      v69.origin.x = _UIWindowConvertRectFromOrientationToOrientation(a5, 1, v68.origin.x, v68.origin.y, v68.size.width, v68.size.height, v33, v36);
      v70 = CGRectIntegral(v69);
      v37 = (uint64_t)(topLeft * v34);
      v38 = (uint64_t)(bottomLeft * v34);
      v39 = (uint64_t)(bottomRight * v34);
      v40 = (uint64_t)(v35 * v34);
      if (a5 == 2)
      {
        v41 = (uint64_t)(topLeft * v34);
        v42 = (uint64_t)(v35 * v34);
        v40 = (uint64_t)(bottomRight * v34);
        v39 = (uint64_t)(bottomLeft * v34);
      }
      else if (a5 == 3)
      {
        v41 = (uint64_t)(v35 * v34);
        v42 = (uint64_t)(bottomRight * v34);
        v40 = (uint64_t)(bottomLeft * v34);
        v39 = (uint64_t)(topLeft * v34);
      }
      else
      {
        v41 = (uint64_t)(bottomLeft * v34);
        v42 = (uint64_t)(topLeft * v34);
        if (a5 != 4)
          goto LABEL_20;
      }
      v37 = v40;
      v40 = v39;
      v39 = v41;
      v38 = v42;
LABEL_20:
      v43 = self->_bitmap;
      v54[0] = (uint64_t)v70.origin.x;
      v54[1] = (uint64_t)v70.origin.y;
      v54[2] = (uint64_t)v70.size.width;
      v54[3] = (uint64_t)v70.size.height;
      v53[0] = v37;
      v53[1] = v38;
      v53[2] = v39;
      v53[3] = v40;
      -[_UIBoundingPathBitmap boundingPathBitmapWithRect:cornerRadii:](v43, "boundingPathBitmapWithRect:cornerRadii:", v54, v53);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = -[_UIComplexBoundingPath initWithCoordinateSpace:orientation:scale:boundingPathBitmap:]([_UIComplexBoundingPath alloc], "initWithCoordinateSpace:orientation:scale:boundingPathBitmap:", v11, a5, v44, v34);

      goto LABEL_21;
    }
  }
  v29 = [_UIRectangularBoundingPath alloc];
  v30 = -[_UIRectangularBoundingPath initWithCoordinateSpace:boundingRect:](v29, "initWithCoordinateSpace:boundingRect:", v11, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
LABEL_21:

  return v30;
}

- (void)setCoordinateSpace:(id)a3
{
  _UIBoundingPathBitmap *bitmap;
  int64_t orientation;
  double scale;
  id v7;
  objc_super v8;

  bitmap = self->_bitmap;
  orientation = self->_orientation;
  scale = self->_scale;
  v7 = a3;
  -[_UIComplexBoundingPath _validateBitmap:withOrientation:scale:forCoordinateSpace:](self, "_validateBitmap:withOrientation:scale:forCoordinateSpace:", bitmap, orientation, v7, scale);
  v8.receiver = self;
  v8.super_class = (Class)_UIComplexBoundingPath;
  -[_UIBoundingPath setCoordinateSpace:](&v8, sel_setCoordinateSpace_, v7);

}

- (BOOL)isNonRectangular
{
  return 1;
}

- (CGRect)_portaitPixelRectWithPixelMinimumPaddingFromBoundingPath:(double)a3 inPortaitCorner:(unint64_t)a4 fromPortraitPixelRect:(CGRect)a5 withPortraitPixelCornerRadii:(_UIIntegralCornerRadii *)a6
{
  double height;
  double width;
  double y;
  CGFloat x;
  _UIBoundingPathBitmap *bitmap;
  double v13;
  double v14;
  double v15;
  double v16;
  __int128 v17;
  unint64_t v18;
  void *v19;
  void *v20;
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
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  BOOL v39;
  BOOL v40;
  double v41;
  double v42;
  __double2 v43;
  double v44;
  double v45;
  double v46;
  double v47;
  __int128 v48;
  __double2 v49;
  double v50;
  double v51;
  double v52;
  __int128 v53;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  CGFloat v71;
  double v72;
  int64x2_t v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  uint64_t v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  uint64_t v83;
  CGRect v84;
  CGRect v85;
  CGRect result;
  CGRect v87;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v83 = 0;
  v81 = 0u;
  v82 = 0u;
  v80 = 0u;
  bitmap = self->_bitmap;
  if (bitmap)
    -[_UIBoundingPathBitmap bitmapData](bitmap, "bitmapData");
  v13 = _UIDirectionVectorForCorner(a4);
  v15 = v14;
  v71 = y;
  v16 = x;
  while (1)
  {
    v76 = v80;
    v77 = v81;
    v78 = v82;
    v79 = v83;
    v17 = *(_OWORD *)&a6->var2;
    v74 = *(int64x2_t *)&a6->var0;
    v75 = v17;
    if ((isRectInBoundingPathCornerWithMinimumPadding(&v76, &v74, a4, v16, y, width, height, a3) & 1) != 0)
      break;
    v84.size.width = (double)(unint64_t)v80;
    v84.size.height = (double)*((unint64_t *)&v80 + 1);
    v84.origin.x = 0.0;
    v84.origin.y = 0.0;
    v85 = CGRectInset(v84, -0.01, -0.01);
    v87.origin.x = v16;
    v87.origin.y = y;
    v87.size.width = width;
    v87.size.height = height;
    if (!CGRectContainsRect(v85, v87))
    {
      v22 = *MEMORY[0x1E0C9D628];
      y = *(double *)(MEMORY[0x1E0C9D628] + 8);
      width = *(double *)(MEMORY[0x1E0C9D628] + 16);
      v65 = *(double *)(MEMORY[0x1E0C9D628] + 24);
      goto LABEL_44;
    }
    v16 = v13 + v16;
    y = v15 + y;
  }
  v18 = a4 - 1;
  if (a4 - 1 < 8 && ((0x8Bu >> v18) & 1) != 0)
  {
    v21 = dbl_18667DF08[v18];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CGFloat cornerAngleForCorner(UIRectCorner)");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, CFSTR("_UIComplexBoundingPath.m"), 819, CFSTR("Invalid UIRectCorner value (%ld)"), a4);

    v21 = 0.0;
  }
  v22 = v16;
  v23 = pointOnRectClosestToCorner(a4, x, v71, width, height);
  v25 = v24;
  v26 = pointOnRectClosestToCorner(a4, v16, y, width, height);
  v28 = sqrt((v26 - v23) * (v26 - v23) + (v27 - v25) * (v27 - v25));
  v65 = height;
  if (v28 > 1.41421356)
  {
    v69 = v23;
    v29 = v21;
    v30 = v21 + -0.785398163;
    v31 = v21 + 0.785398163;
    v32 = 0.5;
    v68 = v25;
    v61 = v21 + -0.785398163;
    v60 = v21 + 0.785398163;
    while (1)
    {
      v66 = y;
      v67 = width;
      v33 = v28 + -1.41421356;
      v34 = ceil((v28 + -1.41421356) * 1.57079633 * v32);
      v35 = 1.57079633 / v34;
      if (v30 >= v29 + -0.785398163)
        v36 = v30;
      else
        v36 = v29 + -0.785398163;
      if (v31 >= v29 + 0.785398163)
        v37 = v29 + 0.785398163;
      else
        v37 = v31;
      v70 = 1.57079633 / v34;
      v72 = v36;
      v38 = v29 + v35;
      v39 = v29 + v35 <= v37;
      v40 = v29 >= v36;
      if (v29 < v36 && v38 > v37)
      {
        y = v66;
        width = v67;
        goto LABEL_40;
      }
      v62 = v28;
      v63 = v29;
      v41 = v66;
      v42 = v67;
      v64 = v22;
      while (1)
      {
        if (v40)
        {
          v43 = __sincos_stret(v29);
          v22 = testRectForPointOnArcInCorner(llround(v69 + v33 * v43.__cosval), v22, v41, v42, llround(v68 + v33 * v43.__sinval), a4);
          v41 = v44;
          v42 = v45;
          v47 = v46;
          v76 = v80;
          v77 = v81;
          v78 = v82;
          v79 = v83;
          v48 = *(_OWORD *)&a6->var2;
          v74 = *(int64x2_t *)&a6->var0;
          v75 = v48;
          if ((isRectInBoundingPathCornerWithMinimumPadding(&v76, &v74, a4, v22, v41, v45, v46, a3) & 1) != 0)
            goto LABEL_38;
          v29 = v29 - v70;
        }
        if (v39)
          break;
LABEL_30:
        v39 = v38 <= v37;
        v40 = v29 >= v72;
        if (v29 < v72 && v38 > v37)
        {
          y = v66;
          width = v67;
          v29 = v63;
          v22 = v64;
          v28 = v62;
          goto LABEL_39;
        }
      }
      v49 = __sincos_stret(v38);
      v22 = testRectForPointOnArcInCorner(llround(v69 + v33 * v49.__cosval), v22, v41, v42, llround(v68 + v33 * v49.__sinval), a4);
      v41 = v50;
      v42 = v51;
      v47 = v52;
      v76 = v80;
      v77 = v81;
      v78 = v82;
      v79 = v83;
      v53 = *(_OWORD *)&a6->var2;
      v74 = *(int64x2_t *)&a6->var0;
      v75 = v53;
      if ((isRectInBoundingPathCornerWithMinimumPadding(&v76, &v74, a4, v22, v41, v51, v52, a3) & 1) == 0)
        break;
      v29 = v38;
LABEL_38:
      v65 = v47;
      width = v42;
      y = v41;
      v28 = v33;
LABEL_39:
      v30 = v61;
      v31 = v60;
      v32 = 0.5;
LABEL_40:
      if (v28 <= 1.41421356 || v28 != v33)
        goto LABEL_44;
    }
    v38 = v70 + v38;
    goto LABEL_30;
  }
LABEL_44:
  v56 = v22;
  v57 = y;
  v58 = width;
  v59 = v65;
  result.size.height = v59;
  result.size.width = v58;
  result.origin.y = v57;
  result.origin.x = v56;
  return result;
}

- (CGRect)_rectTuckedInCorner:(unint64_t)a3 ofBoundingPathAndRect:(CGRect)a4 withSize:(CGSize)a5 cornerRadii:(UIRectCornerRadii)a6 minimumPadding:(double)a7
{
  double height;
  double width;
  void *v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double scale;
  int64_t orientation;
  _UIBoundingPathBitmap *bitmap;
  _UIBoundingPathBitmap *v24;
  double v25;
  double x;
  double y;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  double v36;
  CGFloat v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  CGFloat v45;
  CGFloat v46;
  CGFloat v47;
  CGFloat v48;
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
  double v59;
  void *v60;
  double v61;
  double v62;
  CGAffineTransform v64;
  _QWORD v65[4];
  CGAffineTransform v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  uint64_t v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  uint64_t v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;
  CGRect v81;
  CGRect result;
  CGRect v83;

  height = a5.height;
  width = a5.width;
  -[_UIBoundingPath coordinateSpace](self, "coordinateSpace");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIComplexBoundingPath.m"), 953, CFSTR("The bounding path's coordinate space cannot be nil"));

  }
  objc_msgSend(v12, "bounds");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  scale = self->_scale;
  orientation = self->_orientation;
  bitmap = self->_bitmap;
  if (bitmap)
  {
    -[_UIBoundingPathBitmap bitmapData](bitmap, "bitmapData");
    v24 = self->_bitmap;
    v62 = (double)(unint64_t)v71 / scale;
    if (v24)
    {
      -[_UIBoundingPathBitmap bitmapData](v24, "bitmapData");
      v25 = (double)*((unint64_t *)&v67 + 1);
      goto LABEL_8;
    }
  }
  else
  {
    v74 = 0;
    v72 = 0u;
    v73 = 0u;
    v71 = 0u;
    v62 = 0.0 / scale;
  }
  v70 = 0;
  v68 = 0u;
  v69 = 0u;
  v67 = 0u;
  v25 = 0.0;
LABEL_8:
  v61 = v25;
  v83.origin.x = v14;
  v83.origin.y = v16;
  v83.size.width = v18;
  v83.size.height = v20;
  v75 = CGRectIntersection(a4, v83);
  -[_UIBoundingPath _rectTuckedInCorner:ofBoundingRect:withSize:minimumPadding:](self, "_rectTuckedInCorner:ofBoundingRect:withSize:minimumPadding:", a3, v75.origin.x, v75.origin.y, v75.size.width, v75.size.height, width, height, a7);
  x = v76.origin.x;
  y = v76.origin.y;
  v28 = v76.size.width;
  v29 = v76.size.height;
  if (CGRectIsNull(v76))
    goto LABEL_17;
  v30 = v61 / scale;
  v31 = _UIWindowConvertRectFromOrientationToOrientation(orientation, 1, x, y, v28, v29, v62, v61 / scale);
  v33 = v32;
  v35 = v34;
  v37 = v36;
  v38 = _UIRectCornerConvertedFromOrientationToPortrait(a3, orientation);
  CGAffineTransformMakeScale(&v66, scale, scale);
  v77.origin.x = v31;
  v77.origin.y = v33;
  v77.size.width = v35;
  v77.size.height = v37;
  v78 = CGRectApplyAffineTransform(v77, &v66);
  v39 = (uint64_t)(a6.topLeft * scale);
  v40 = (uint64_t)(a6.bottomLeft * scale);
  v41 = (uint64_t)(a6.bottomRight * scale);
  v42 = (uint64_t)(a6.topRight * scale);
  if (orientation == 2)
  {
    v43 = (uint64_t)(a6.topLeft * scale);
    v44 = (uint64_t)(a6.topRight * scale);
    v42 = (uint64_t)(a6.bottomRight * scale);
    v41 = (uint64_t)(a6.bottomLeft * scale);
    goto LABEL_15;
  }
  if (orientation == 3)
  {
    v43 = (uint64_t)(a6.topRight * scale);
    v44 = (uint64_t)(a6.bottomRight * scale);
    v42 = (uint64_t)(a6.bottomLeft * scale);
    v41 = (uint64_t)(a6.topLeft * scale);
    goto LABEL_15;
  }
  v43 = (uint64_t)(a6.bottomLeft * scale);
  v44 = (uint64_t)(a6.topLeft * scale);
  if (orientation == 4)
  {
LABEL_15:
    v39 = v42;
    v42 = v41;
    v41 = v43;
    v40 = v44;
  }
  v65[0] = v39;
  v65[1] = v40;
  v65[2] = v41;
  v65[3] = v42;
  -[_UIComplexBoundingPath _portaitPixelRectWithPixelMinimumPaddingFromBoundingPath:inPortaitCorner:fromPortraitPixelRect:withPortraitPixelCornerRadii:](self, "_portaitPixelRectWithPixelMinimumPaddingFromBoundingPath:inPortaitCorner:fromPortraitPixelRect:withPortraitPixelCornerRadii:", v38, v65, scale * a7, v78.origin.x, v78.origin.y, v78.size.width, v78.size.height, *(_QWORD *)&v61);
  v45 = v79.origin.x;
  v46 = v79.origin.y;
  v47 = v79.size.width;
  v48 = v79.size.height;
  if (!CGRectIsNull(v79))
  {
    CGAffineTransformMakeScale(&v64, 1.0 / scale, 1.0 / scale);
    v80.origin.x = v45;
    v80.origin.y = v46;
    v80.size.width = v47;
    v80.size.height = v48;
    v81 = CGRectApplyAffineTransform(v80, &v64);
    v49 = _UIWindowConvertRectFromOrientationToOrientation(1, orientation, v81.origin.x, v81.origin.y, v81.size.width, v81.size.height, v62, v30);
    v50 = v53;
    v51 = v54;
    v52 = v55;
    goto LABEL_19;
  }
LABEL_17:
  v49 = *MEMORY[0x1E0C9D628];
  v50 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v51 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v52 = *(double *)(MEMORY[0x1E0C9D628] + 24);
LABEL_19:

  v56 = v49;
  v57 = v50;
  v58 = v51;
  v59 = v52;
  result.size.height = v59;
  result.size.width = v58;
  result.origin.y = v57;
  result.origin.x = v56;
  return result;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[_UIBoundingPath coordinateSpace](self, "coordinateSpace");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIApplication stringForInterfaceOrientation:](UIApplication, "stringForInterfaceOrientation:", self->_orientation);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p coordinateSpace=%@; orientation=%@; scale=%.1f; bitmap=%@>"),
    v4,
    self,
    v5,
    v6,
    *(_QWORD *)&self->_scale,
    self->_bitmap);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_imageRepresentation
{
  void *v3;
  double scale;
  _UIBoundingPathBitmap *bitmap;
  _UIBoundingPathBitmap *v6;
  double v7;
  double v8;
  double v9;
  unint64_t v10;
  double v11;
  double v12;
  UIGraphicsImageRendererFormat *v13;
  UIGraphicsImageRenderer *v14;
  id v15;
  void *v16;
  _QWORD v18[5];
  id v19;
  double v20;
  double v21;
  double v22;
  double v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;

  -[_UIBoundingPathBitmap _imageRepresentation](self->_bitmap, "_imageRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  scale = self->_scale;
  bitmap = self->_bitmap;
  if (bitmap)
  {
    -[_UIBoundingPathBitmap bitmapData](bitmap, "bitmapData");
    v6 = self->_bitmap;
    v7 = (double)(unint64_t)v28 / scale;
    if (v6)
    {
      -[_UIBoundingPathBitmap bitmapData](v6, "bitmapData");
      v8 = (double)*((unint64_t *)&v24 + 1);
      goto LABEL_6;
    }
  }
  else
  {
    v31 = 0;
    v29 = 0u;
    v30 = 0u;
    v28 = 0u;
    v7 = 0.0 / scale;
  }
  v27 = 0;
  v25 = 0u;
  v26 = 0u;
  v24 = 0u;
  v8 = 0.0;
LABEL_6:
  v9 = v8 / scale;
  v10 = self->_orientation - 3;
  if (v10 >= 2)
    v11 = v7;
  else
    v11 = v8 / scale;
  if (v10 >= 2)
    v12 = v8 / scale;
  else
    v12 = v7;
  v13 = objc_alloc_init(UIGraphicsImageRendererFormat);
  -[UIGraphicsImageRendererFormat setScale:](v13, "setScale:", scale);
  -[UIGraphicsImageRendererFormat setOpaque:](v13, "setOpaque:", 1);
  -[UIGraphicsImageRendererFormat setPreferredRange:](v13, "setPreferredRange:", 2);
  v14 = -[UIGraphicsImageRenderer initWithSize:format:]([UIGraphicsImageRenderer alloc], "initWithSize:format:", v13, v11, v12);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __46___UIComplexBoundingPath__imageRepresentation__block_invoke;
  v18[3] = &unk_1E16CB460;
  v20 = v11;
  v21 = v12;
  v22 = v7;
  v23 = v9;
  v18[4] = self;
  v19 = v3;
  v15 = v3;
  -[UIGraphicsImageRenderer imageWithActions:](v14, "imageWithActions:", v18);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

@end
