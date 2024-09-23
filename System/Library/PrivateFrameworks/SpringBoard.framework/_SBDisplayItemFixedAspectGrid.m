@implementation _SBDisplayItemFixedAspectGrid

- (_SBDisplayItemFixedAspectGrid)initWithBounds:(CGRect)a3 fixedSize:(CGSize)a4 screenScale:(double)a5 supportsOrthogonalSizes:(BOOL)a6 chamoisLayoutAttributes:(id)a7
{
  CGFloat height;
  CGFloat width;
  _SBDisplayItemFixedAspectGrid *v11;
  _SBDisplayItemFixedAspectGrid *v12;
  objc_super v14;

  height = a4.height;
  width = a4.width;
  v14.receiver = self;
  v14.super_class = (Class)_SBDisplayItemFixedAspectGrid;
  v11 = -[_SBDisplayItemFlexibleGrid initWithBounds:screenScale:chamoisLayoutAttributes:](&v14, sel_initWithBounds_screenScale_chamoisLayoutAttributes_, a7, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a5);
  v12 = v11;
  if (v11)
  {
    v11->_fixedSize.width = width;
    v11->_fixedSize.height = height;
    v11->_supportsOrthogonalSizes = a6;
    -[_SBDisplayItemFixedAspectGrid _buildFixedGridWithScreenScale:](v11, "_buildFixedGridWithScreenScale:", a5);
  }
  return v12;
}

- (void)_buildFixedGridWithScreenScale:(double)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double width;
  double v9;
  double v10;
  double v11;
  double height;
  double v13;
  double v14;
  CGSize *p_height;
  void (**v16)(_QWORD, _QWORD, __n128, __n128);
  double v17;
  CGSize *v18;
  CGSize *p_fixedSize;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  __n128 v29;
  __n128 v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  void *v36;
  double v37;
  __n128 v38;
  __n128 v39;
  CGSize *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  void *v48;
  void *v49;
  __n128 v50;
  __n128 v51;
  void *v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t i;
  void *v57;
  __n128 v58;
  double v59;
  uint64_t v60;
  void *v61;
  void *v62;
  id v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t k;
  double v67;
  double v68;
  double v69;
  void *v70;
  void *v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  _QWORD v90[5];
  uint64_t v91;
  uint64_t *v92;
  uint64_t v93;
  uint64_t (*v94)(uint64_t, uint64_t);
  void (*v95)(uint64_t);
  id v96;
  _BYTE v97[128];
  _BYTE v98[128];
  _BYTE v99[128];
  uint64_t v100;

  v100 = *MEMORY[0x1E0C80C00];
  -[SBSwitcherChamoisLayoutAttributes screenEdgePadding](self->super._chamoisLayoutAttributes, "screenEdgePadding", a3);
  v5 = v4;
  -[SBSwitcherChamoisLayoutAttributes stripWidth](self->super._chamoisLayoutAttributes, "stripWidth");
  v7 = v6;
  CGRectGetWidth(self->super._bounds);
  CGRectGetHeight(self->super._bounds);
  width = self->super._bounds.size.width;
  -[SBSwitcherChamoisLayoutAttributes minimumDefaultWindowSize](self->super._chamoisLayoutAttributes, "minimumDefaultWindowSize");
  v10 = v9;
  if (BSFloatIsZero())
    v11 = v7;
  else
    v11 = width - v10;
  height = self->super._bounds.size.height;
  -[SBSwitcherChamoisLayoutAttributes maximumWindowHeightWithDock](self->super._chamoisLayoutAttributes, "maximumWindowHeightWithDock");
  v14 = v13;
  p_height = (CGSize *)&self->_fixedSize.height;
  v73 = self->_fixedSize.height;
  v74 = self->_fixedSize.width;
  v91 = 0;
  v92 = &v91;
  v93 = 0x3032000000;
  v94 = __Block_byref_object_copy__115;
  v95 = __Block_byref_object_dispose__115;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v96 = (id)objc_claimAutoreleasedReturnValue();
  v90[0] = MEMORY[0x1E0C809B0];
  v90[1] = 3221225472;
  v90[2] = __64___SBDisplayItemFixedAspectGrid__buildFixedGridWithScreenScale___block_invoke;
  v90[3] = &unk_1E8EBED00;
  v90[4] = &v91;
  v16 = (void (**)(_QWORD, _QWORD, __n128, __n128))MEMORY[0x1D17E5550](v90);
  v17 = width + v11 * -0.5 - v5;
  v76 = width - v5 * 2.0;
  v77 = height - v5 * 2.0;
  v18 = (CGSize *)&self->_fixedSize.height;
  p_fixedSize = &self->_fixedSize;
  if (v74 >= v73)
  {
    v18 = &self->_fixedSize;
    p_fixedSize = (CGSize *)&self->_fixedSize.height;
    if (!self->_supportsOrthogonalSizes)
    {
      v40 = &self->_fixedSize;
LABEL_43:
      v41 = p_height->width;
      v42 = v40->width;
      v43 = v40->width / p_height->width;
      if (v40->width <= v17)
        v44 = v40->width;
      else
        v44 = v17;
      v45 = v17 / v43;
      if (v41 <= v14)
        v46 = p_height->width;
      else
        v46 = v14;
      if (v46 > v45)
        v46 = v17 / v43;
      v75 = v46;
      if (v44 <= v14 * v43)
        v47 = v44;
      else
        v47 = v14 * v43;
      -[_SBDisplayItemFlexibleGrid _gridWidthsForSafeWidth:minimumWidth:](self, "_gridWidthsForSafeWidth:minimumWidth:", v17, v47);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "sortedArrayUsingSelector:", sel_compare_);
      v49 = (void *)objc_claimAutoreleasedReturnValue();

      v51.n128_f64[0] = v47 / v43;
      if (v47 == v42)
        v50.n128_f64[0] = v42;
      else
        v50.n128_f64[0] = v47;
      if (v47 == v42)
        v51.n128_f64[0] = v41;
      ((void (**)(_QWORD, BOOL, __n128, __n128))v16)[2](v16, v47 != v42, v50, v51);
      objc_msgSend(v49, "lastObject");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v84 = 0u;
      v85 = 0u;
      v82 = 0u;
      v83 = 0u;
      v53 = v49;
      v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v82, v98, 16);
      if (v54)
      {
        v55 = *(_QWORD *)v83;
        do
        {
          for (i = 0; i != v54; ++i)
          {
            if (*(_QWORD *)v83 != v55)
              objc_enumerationMutation(v53);
            v57 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * i);
            if (v57 != v52)
            {
              objc_msgSend(v57, "doubleValue");
              if (v42 + 44.0 <= v58.n128_f64[0])
                ((void (*)(void (**)(_QWORD, _QWORD, __n128, __n128), uint64_t, __n128, double))v16[2])(v16, 1, v58, v41 * (v58.n128_f64[0] / v42));
            }
          }
          v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v82, v98, 16);
        }
        while (v54);
      }

      v59 = v76;
      if (v17 > v47 && v45 <= v14 || v14 > v75 && (v17 = v14 * v43, v45 = v14, v14 * v43 <= v76))
        ((void (*)(void (**)(_QWORD, _QWORD, __n128, __n128), uint64_t, double, double))v16[2])(v16, 1, v17, v45);
      if (v76 / v43 <= v77)
      {
        v77 = v76 / v43;
      }
      else
      {
        v59 = v77 * v43;
        if (v77 * v43 > v76)
          goto LABEL_79;
      }
      ((void (*)(void (**)(_QWORD, _QWORD, __n128, __n128), uint64_t, double, double))v16[2])(v16, 1, v59, v77);
LABEL_79:

      goto LABEL_80;
    }
  }
  v20 = p_fixedSize->width;
  v21 = v18->width;
  v22 = p_fixedSize->width / v18->width;
  v23 = v14 * v22;
  if (p_fixedSize->width <= v17)
    v24 = p_fixedSize->width;
  else
    v24 = v17;
  if (v21 <= v14)
    v25 = v18->width;
  else
    v25 = v14;
  if (v25 <= v17 / v22)
    v26 = v25;
  else
    v26 = v17 / v22;
  if (v24 > v23)
    v24 = v14 * v22;
  v72 = v24;
  -[_SBDisplayItemFlexibleGrid _gridHeightsForSafeHeight:minimumHeight:](self, "_gridHeightsForSafeHeight:minimumHeight:", v14, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "sortedArrayUsingSelector:", sel_compare_);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v30.n128_f64[0] = v22 * v26;
  if (v26 == v21)
  {
    v30.n128_f64[0] = v20;
    v29.n128_f64[0] = v21;
  }
  else
  {
    v29.n128_f64[0] = v26;
  }
  ((void (**)(_QWORD, BOOL, __n128, __n128))v16)[2](v16, v26 != v21, v30, v29);
  objc_msgSend(v28, "lastObject");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v88 = 0u;
  v89 = 0u;
  v86 = 0u;
  v87 = 0u;
  v32 = v28;
  v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v86, v99, 16);
  if (v33)
  {
    v34 = *(_QWORD *)v87;
    do
    {
      for (j = 0; j != v33; ++j)
      {
        if (*(_QWORD *)v87 != v34)
          objc_enumerationMutation(v32);
        v36 = *(void **)(*((_QWORD *)&v86 + 1) + 8 * j);
        if (v36 != v31)
        {
          objc_msgSend(v36, "doubleValue");
          if (v21 + 44.0 <= v37)
            ((void (*)(void (**)(_QWORD, _QWORD, __n128, __n128), uint64_t, double))v16[2])(v16, 1, v20 * (v37 / v21));
        }
      }
      v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v86, v99, 16);
    }
    while (v33);
  }

  if (v14 > v26 && (v39.n128_f64[0] = v14, v23 <= v76)
    || v17 > v72 && (v39.n128_f64[0] = v17 / v22, v23 = v17, v17 / v22 <= v14))
  {
    ((void (*)(void (**)(_QWORD, _QWORD, __n128, __n128), uint64_t, double, __n128))v16[2])(v16, 1, v23, v39);
  }
  v38.n128_f64[0] = v77 * v22;
  if (v77 * v22 <= v76 || (v38.n128_f64[0] = v76, v76 / v22 <= v77))
    ((void (*)(void (**)(_QWORD, _QWORD, __n128, __n128), uint64_t, __n128))v16[2])(v16, 1, v38);

  if (v74 >= v73)
  {
    v40 = &self->_fixedSize;
    goto LABEL_43;
  }
  v40 = (CGSize *)&self->_fixedSize.height;
  p_height = &self->_fixedSize;
  if (self->_supportsOrthogonalSizes)
    goto LABEL_43;
LABEL_80:
  v60 = objc_msgSend((id)v92[5], "count");
  objc_msgSend((id)v92[5], "sortUsingComparator:", &__block_literal_global_369);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v60);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v60);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = 0u;
  v81 = 0u;
  v78 = 0u;
  v79 = 0u;
  v63 = (id)v92[5];
  v64 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v78, v97, 16);
  if (v64)
  {
    v65 = *(_QWORD *)v79;
    do
    {
      for (k = 0; k != v64; ++k)
      {
        if (*(_QWORD *)v79 != v65)
          objc_enumerationMutation(v63);
        objc_msgSend(*(id *)(*((_QWORD *)&v78 + 1) + 8 * k), "CGSizeValue");
        v68 = v67;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v69);
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "addObject:", v70);

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v68);
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "addObject:", v71);

      }
      v64 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v78, v97, 16);
    }
    while (v64);
  }

  objc_storeStrong((id *)&self->super._heights, v61);
  objc_storeStrong((id *)&self->super._widths, v62);
  self->_maximizeSupported = BSFloatApproximatelyEqualToFloat();

  _Block_object_dispose(&v91, 8);
}

- (CGSize)nearestGridSizeForSize:(CGSize)a3 countOnStage:(unint64_t)a4
{
  double height;
  double width;
  double v7;
  double v8;
  unint64_t v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v7 = *MEMORY[0x1E0C9D820];
  v8 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  if (-[NSArray count](self->super._widths, "count", a4))
  {
    v9 = 0;
    v10 = 1.79769313e308;
    do
    {
      -[NSArray objectAtIndex:](self->super._widths, "objectAtIndex:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "doubleValue");
      v13 = v12;

      -[NSArray objectAtIndex:](self->super._heights, "objectAtIndex:", v9);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "doubleValue");
      v16 = v15;

      v17 = vabdd_f64(v13, width) + vabdd_f64(v16, height);
      if (v17 < v10)
      {
        v8 = v16;
        v7 = v13;
        v10 = v17;
      }
      ++v9;
    }
    while (v9 < -[NSArray count](self->super._widths, "count"));
  }
  -[_SBDisplayItemFlexibleGrid maxSize](self, "maxSize");
  if (-[_SBDisplayItemFixedAspectGrid _allowFullScreen](self, "_allowFullScreen") && BSSizeEqualToSize())
  {
    v7 = self->super._bounds.size.width;
    v8 = self->super._bounds.size.height;
  }
  v18 = v7;
  v19 = v8;
  result.height = v19;
  result.width = v18;
  return result;
}

- (id)allWidths
{
  return (id)-[NSArray copy](self->super._widths, "copy");
}

- (id)allHeights
{
  return (id)-[NSArray copy](self->super._heights, "copy");
}

- (BOOL)_allowFullScreen
{
  void *v3;
  void *v4;
  char v5;

  if (self->_maximizeSupported)
    return 1;
  +[SBAppSwitcherDomain rootSettings](SBAppSwitcherDomain, "rootSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "chamoisSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "allowTrueMaximizeForAllApps");

  return v5;
}

@end
