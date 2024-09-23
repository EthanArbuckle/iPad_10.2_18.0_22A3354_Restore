@implementation _UICollectionSectionSolutionBookmark

- (double)contentInsetsOffset
{
  double v1;
  uint64_t v3;
  uint64_t v4;
  double v5;

  v1 = 0.0;
  if (a1)
  {
    v3 = -[_UICollectionSectionSolutionBookmark _containerAxis](a1);
    if (v3 == 1)
      v4 = 2;
    else
      v4 = v3 == 2;
    objc_msgSend(*(id *)(a1 + 88), "effectiveInsets");
    if (v4 == 1)
      return v5;
  }
  return v1;
}

- (uint64_t)_containerAxis
{
  uint64_t v2;
  int v3;
  uint64_t v4;

  v2 = objc_msgSend(*(id *)(a1 + 8), "layoutAxis");
  v3 = objc_msgSend(*(id *)(a1 + 16), "scrollsOrthogonally");
  v4 = v2 == 2;
  if (v2 == 1)
    v4 = 2;
  if (v3)
    return v4;
  else
    return v2;
}

- (double)sectionAuxiliaryContentInsetsOffset
{
  double v1;
  uint64_t v3;
  uint64_t v4;
  double v5;

  v1 = 0.0;
  if (a1)
  {
    v3 = -[_UICollectionSectionSolutionBookmark _containerAxis](a1);
    if (v3 == 1)
      v4 = 2;
    else
      v4 = v3 == 2;
    objc_msgSend(*(id *)(a1 + 96), "effectiveInsets");
    if (v4 == 1)
      return v5;
  }
  return v1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_memoizedDescriptor, 0);
  objc_storeStrong((id *)&self->_preferredSizes, 0);
  objc_storeStrong((id *)&self->_supplementaryInsetEnvironment, 0);
  objc_storeStrong((id *)&self->_insetEnvironment, 0);
  objc_storeStrong((id *)&self->_section, 0);
  objc_storeStrong((id *)&self->_solution, 0);
}

- (id)initWithSolution:(void *)a3 globalFrame:(void *)a4 globalPinningFrame:(void *)a5 insetEnvironment:(void *)a6 supplementaryInsetEnvironment:(double)a7 section:(double)a8 preferredSizes:(double)a9
{
  id *v14;
  id *v28;
  _UICollectionPreferredSizes *v29;
  id v30;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  objc_super v36;

  v14 = a1;
  if (!a1)
    return v14;
  if (a2)
  {
    if (a3)
      goto LABEL_4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", sel_initWithSolution_globalFrame_globalPinningFrame_insetEnvironment_supplementaryInsetEnvironment_section_preferredSizes_, v14, CFSTR("_UICollectionCompositionalLayoutSolver.m"), 3668, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("solution != nil"));

    if (a3)
    {
LABEL_4:
      if (a4)
        goto LABEL_5;
LABEL_14:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", sel_initWithSolution_globalFrame_globalPinningFrame_insetEnvironment_supplementaryInsetEnvironment_section_preferredSizes_, v14, CFSTR("_UICollectionCompositionalLayoutSolver.m"), 3670, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("supplementaryInsetEnvironment != nil"));

      if (a5)
        goto LABEL_6;
      goto LABEL_15;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", sel_initWithSolution_globalFrame_globalPinningFrame_insetEnvironment_supplementaryInsetEnvironment_section_preferredSizes_, v14, CFSTR("_UICollectionCompositionalLayoutSolver.m"), 3669, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("insetEnvironment != nil"));

  if (!a4)
    goto LABEL_14;
LABEL_5:
  if (a5)
    goto LABEL_6;
LABEL_15:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", sel_initWithSolution_globalFrame_globalPinningFrame_insetEnvironment_supplementaryInsetEnvironment_section_preferredSizes_, v14, CFSTR("_UICollectionCompositionalLayoutSolver.m"), 3671, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("section != nil"));

LABEL_6:
  v36.receiver = v14;
  v36.super_class = (Class)_UICollectionSectionSolutionBookmark;
  v28 = (id *)objc_msgSendSuper2(&v36, sel_init);
  v14 = v28;
  if (v28)
  {
    objc_storeStrong(v28 + 1, a2);
    *((double *)v14 + 3) = a7;
    *((double *)v14 + 4) = a8;
    *((double *)v14 + 5) = a9;
    *((double *)v14 + 6) = a10;
    *((double *)v14 + 7) = a11;
    *((double *)v14 + 8) = a12;
    *((double *)v14 + 9) = a13;
    *((double *)v14 + 10) = a14;
    objc_storeStrong(v14 + 11, a3);
    objc_storeStrong(v14 + 12, a4);
    objc_storeStrong(v14 + 2, a5);
    if (a6)
      v29 = a6;
    else
      v29 = objc_alloc_init(_UICollectionPreferredSizes);
    v30 = v14[13];
    v14[13] = v29;

  }
  return v14;
}

- (_QWORD)memoizedDescriptor
{
  void *v2;
  id *v3;
  _QWORD *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  _BOOL4 v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  double v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v46;
  CGFloat v47;
  CGFloat v48;
  double v49;
  CGFloat v50;
  double v51;
  CGFloat v52;
  double v53;
  double v54;
  double v55;
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
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  double v79;
  double MinY;
  double MinX;
  double v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  double v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  double v90;
  char v91;
  uint64_t v92;
  double v93;
  double v94;
  uint64_t v95;
  uint64_t v96;
  double v97;
  CGRect v98;
  CGRect v99;
  CGRect v100;
  CGRect v101;
  CGRect v102;
  CGRect v103;
  CGRect v104;
  CGRect v105;

  if (a1)
  {
    v3 = (id *)(a1 + 112);
    v2 = *(void **)(a1 + 112);
    if (v2)
    {
      v4 = v2;
    }
    else
    {
      v5 = *(id *)(a1 + 16);
      v6 = *(id *)(a1 + 8);
      v4 = (_QWORD *)objc_opt_new();
      v7 = objc_msgSend(v6, "layoutAxis");
      v8 = objc_msgSend(v5, "orthogonalScrollingBehavior");
      v9 = v8 & 0xFFFFFFFFFFFFFFFELL;
      objc_msgSend(v5, "_orthogonalScrollingProperties");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v10)
      {
        objc_msgSend(v10, "decelerationRate");
        v78 = v12;
        v76 = objc_msgSend(v11, "bounce");
      }
      else
      {
        v76 = 0;
        v78 = *(_QWORD *)off_1E167DBC0;
      }
      v13 = 0.0;
      v14 = 0;
      if (v9 == 4)
      {
        objc_msgSend(v5, "interGroupSpacing");
        v14 = v15;
      }
      if (objc_msgSend(v5, "scrollsOrthogonally", v76))
      {
        objc_msgSend(v6, "_dimensionForRootGroupAlongAxis:", v7);
        v17 = v16;
        objc_msgSend(v5, "interGroupSpacing");
        v13 = v17 + v18;
      }
      v96 = v7;
      if (v9 == 4)
        v19 = v13;
      else
        v19 = 0.0;
      objc_msgSend(v5, "_cornerRadius");
      v21 = v20;
      v91 = objc_msgSend(v5, "_clipsContentToBounds");
      v22 = objc_msgSend(v5, "_excludesBoundarySupplementariesFromClipping");
      v94 = v13;
      v95 = v14;
      v92 = v21;
      v93 = v19;
      if ((v22 & 1) != 0)
      {
        v23 = 0;
      }
      else
      {
        objc_msgSend(v5, "boundarySupplementaryItems");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v24, "count") != 0;

      }
      objc_msgSend(v5, "_clippingInsets");
      v26 = v25;
      v28 = v27;
      v97 = v29;
      v31 = v30;
      objc_msgSend(v6, "traitCollection");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "displayScale");
      v82 = v33;

      v34 = -[_UICollectionSectionSolutionBookmark _layoutFrameIncludingContentInsets:supplementaries:clampingToContainer:](a1, 1, 1, 1);
      v89 = v35;
      v90 = v34;
      v87 = v37;
      v88 = v36;
      v38 = -[_UICollectionSectionSolutionBookmark _layoutFrameIncludingContentInsets:supplementaries:clampingToContainer:](a1, 0, 0, 0);
      v85 = v39;
      v86 = v38;
      v83 = v41;
      v84 = v40;
      v98.origin.x = -[_UICollectionSectionSolutionBookmark _layoutFrameIncludingContentInsets:supplementaries:clampingToContainer:](a1, 0, 0, 1);
      x = v98.origin.x;
      y = v98.origin.y;
      width = v98.size.width;
      height = v98.size.height;
      MinX = CGRectGetMinX(v98);
      v99.origin.x = x;
      v99.origin.y = y;
      v99.size.width = width;
      v99.size.height = height;
      MinY = CGRectGetMinY(v99);
      v100.origin.x = x;
      v100.origin.y = y;
      v100.size.width = width;
      v100.size.height = height;
      v79 = CGRectGetWidth(v100);
      v101.origin.x = x;
      v101.origin.y = y;
      v101.size.width = width;
      v101.size.height = height;
      v46 = CGRectGetHeight(v101);
      v47 = v28
          + -[_UICollectionSectionSolutionBookmark _layoutFrameIncludingContentInsets:supplementaries:clampingToContainer:](a1, 1, v23, 1);
      v50 = v26 + v49;
      v52 = v51 - (v26 + v97);
      v102.origin.x = v47;
      v102.origin.y = v50;
      v102.size.width = v53 - (v31 + v28);
      v48 = v102.size.width;
      v102.size.height = v52;
      v54 = CGRectGetMinX(v102);
      v103.origin.x = v47;
      v103.origin.y = v50;
      v103.size.width = v48;
      v103.size.height = v52;
      v55 = CGRectGetMinY(v103);
      v104.origin.x = v47;
      v104.origin.y = v50;
      v104.size.width = v48;
      v104.size.height = v52;
      v56 = CGRectGetWidth(v104);
      v105.origin.x = v47;
      v105.origin.y = v50;
      v105.size.width = v48;
      v105.size.height = v52;
      v57 = CGRectGetHeight(v105);
      if (v4)
      {
        v58 = 1.0;
        if (fabs(v82) >= 2.22044605e-16)
          v58 = v82;
        v59 = round(v58 * v57) / v58;
        v60 = round(v58 * v56) / v58;
        v61 = round(v58 * v55) / v58;
        v62 = round(v58 * v54) / v58;
        v63 = round(v58 * v46) / v58;
        v64 = round(v58 * v79) / v58;
        v65 = round(v58 * MinY) / v58;
        v4[2] = v96;
        v4[3] = v8;
        v4[4] = v78;
        v4[5] = v77;
        *((_BYTE *)v4 + 8) = v91;
        *((_BYTE *)v4 + 9) = v22;
        v4[6] = v92;
        v66 = round(v58 * MinX) / v58;
        objc_msgSend(v6, "orthogonalScrollingPrefetchingUnitVector");
        v4[10] = v67;
        v4[11] = v68;
        *((double *)v4 + 7) = v93;
        *((double *)v4 + 8) = v94;
        v4[9] = v95;
        objc_msgSend(v6, "orthogonalOffset");
        v4[12] = v69;
        v4[13] = v70;
        *((double *)v4 + 14) = v90;
        v4[15] = v89;
        v4[16] = v88;
        v4[17] = v87;
        *((double *)v4 + 18) = v86;
        v4[19] = v85;
        v4[20] = v84;
        v4[21] = v83;
        *((double *)v4 + 26) = v66;
        *((double *)v4 + 27) = v65;
        *((double *)v4 + 28) = v64;
        *((double *)v4 + 29) = v63;
        objc_msgSend(v5, "contentInsets");
        v4[22] = v71;
        v4[23] = v72;
        v4[24] = v73;
        v4[25] = v74;
        *((double *)v4 + 30) = v62;
        *((double *)v4 + 31) = v61;
        *((double *)v4 + 32) = v60;
        *((double *)v4 + 33) = v59;
      }
      else
      {
        objc_msgSend(v6, "orthogonalScrollingPrefetchingUnitVector", v57);
        objc_msgSend(v6, "orthogonalOffset");
        objc_msgSend(v5, "contentInsets");
      }
      objc_storeStrong(v3, v4);

    }
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (double)_layoutFrameIncludingContentInsets:(int)a3 supplementaries:(char)a4 clampingToContainer:
{
  id v8;
  double v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
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
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
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
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
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

  v8 = *(id *)(a1 + 8);
  v9 = *(double *)(a1 + 24);
  v10 = *(double *)(a1 + 32);
  v11 = -[_UICollectionSectionSolutionBookmark _containerAxis](a1);
  v12 = v11;
  if (v11 == 1)
    v13 = 2;
  else
    v13 = v11 == 2;
  objc_msgSend(v8, "layoutSection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "contentInsets");
  v66 = v16;
  v67 = v15;
  v64 = v18;
  v65 = v17;

  if (a3)
  {
    v62 = v10;
    v63 = v9;
    objc_msgSend(*(id *)(a1 + 88), "effectiveInsets");
    v20 = v19;
    v22 = v21;
    objc_msgSend(*(id *)(a1 + 96), "effectiveInsets");
    v58 = v24;
    v59 = v23;
    v25 = _UILeadingOffsetForInsetsAlongAxis(v13, v23, v24);
    v26 = _UILeadingOffsetForInsetsAlongAxis(v13, v20, v22);
    objc_msgSend(v8, "contentFrameIncludingAuxiliaries");
    v60 = v28;
    v61 = v27;
    v68 = v30;
    v69 = v29;
    if (v25 < v26)
    {
      objc_msgSend(v8, "supplementaryContainer");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v58;
      v20 = v59;
    }
    else
    {
      objc_msgSend(v8, "container");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v10 = v62;
    v9 = v63;
    v35 = v60;
    v33 = v61;
  }
  else
  {
    objc_msgSend(v8, "primaryContentFrame");
    v33 = v32;
    v35 = v34;
    v68 = v37;
    v69 = v36;
    objc_msgSend(*(id *)(a1 + 88), "effectiveInsets");
    v20 = v38;
    v22 = v39;
    objc_msgSend(v8, "container");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v40 = _UIAddPointValueForAxisFromPoint(v12, v33, v35, v9, v10);
  v41 = _UILeadingOffsetForInsetsAlongAxis(v13, v20, v22);
  v42 = v40 + _UISetPointValueForAxis(v13, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), v41);
  if ((a3 & 1) != 0)
  {
    if ((a4 & 1) != 0)
    {
      if (a2)
      {
        v44 = v68;
        v43 = v69;
LABEL_16:
        objc_msgSend(v31, "contentSize", *(_QWORD *)&v58, *(_QWORD *)&v59);
        v47 = _UISizeValueForAxis(v13, v45, v46);
        v48 = v43;
        v49 = v44;
LABEL_19:
        _UISetSizeValueForAxis(v13, v48, v49, v47);
        goto LABEL_20;
      }
LABEL_18:
      v50 = _UITotalEdgeDimensionsForLayoutAxis(v13, v67, v65, v64, v66);
      objc_msgSend(v31, "contentSize");
      v52 = v51;
      v54 = v53;
      v55 = _UISetSizeValueForAxis(v13, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8), -v50);
      v47 = _UISizeValueForAxis(v13, v52 + v55, v54 + v56);
      v49 = v68;
      v48 = v69;
      goto LABEL_19;
    }
  }
  else if ((a2 & 1) != 0)
  {
    v42 = v42 - v65;
    v43 = v69 - (-v65 - v66);
    v44 = v68 - (-v64 - v67);
    if ((a4 & 1) != 0)
      goto LABEL_16;
  }
  else if ((a4 & 1) != 0)
  {
    goto LABEL_18;
  }
LABEL_20:

  return v42;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  _UIContentInsetsEnvironment *insetEnvironment;
  NSCollectionLayoutSection *section;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromRect(self->_globalFrame);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  insetEnvironment = self->_insetEnvironment;
  section = self->_section;
  -[_UICollectionPreferredSizes indexes]((uint64_t)self->_preferredSizes);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p: frame=%@; insetEnvironment=%@; section=%p; preferredSizes:%@>"),
    v5,
    self,
    v6,
    insetEnvironment,
    section,
    v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
