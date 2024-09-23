@implementation UIContextMenuStackedHierarchyLayout

void __56___UIContextMenuStackedHierarchyLayout_encompassingSize__block_invoke(uint64_t a1, void *a2)
{
  CGRect *v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  id v8;
  CGRect v9;

  v3 = *(CGRect **)(*(_QWORD *)(a1 + 32) + 8);
  objc_msgSend(a2, "listView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frame");
  v9.origin.x = v4;
  v9.origin.y = v5;
  v9.size.width = v6;
  v9.size.height = v7;
  *(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32) = CGRectUnion(v3[1], v9);

}

void __107___UIContextMenuStackedHierarchyLayout_performLayoutForComputingPreferredContentSize_withMaxContainerSize___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  __int128 v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double y;
  BOOL IsNull;
  uint64_t v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  unint64_t v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  double v41;
  void *v42;
  CGAffineTransform v43;
  CGAffineTransform v44;
  CGRect v45;

  v3 = a2;
  objc_msgSend(v3, "listView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&v44.a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&v44.c = v5;
  *(_OWORD *)&v44.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v4, "nativeContentSize");
  if (*(_BYTE *)(a1 + 88))
  {
    objc_msgSend(v4, "preferredContentSizeWithinContainerSize:", *(double *)(a1 + 56), *(double *)(a1 + 64));
    v9 = v8;
    v11 = v10;
    objc_msgSend(v4, "setNativeContentSize:");
  }
  else
  {
    v9 = v6;
    v11 = v7;
  }
  objc_msgSend(*(id *)(a1 + 32), "_rectOfNodeParentElement:", v3);
  y = v45.origin.y;
  IsNull = CGRectIsNull(v45);
  v14 = objc_msgSend(*(id *)(a1 + 32), "attachmentEdge");
  v15 = 0.0;
  if (v14 == 4)
    v15 = *(double *)(a1 + 80);
  v16 = 1.0;
  if (objc_msgSend(*(id *)(a1 + 40), "applySubmenuScaling"))
    v16 = fmax(fmin(pow(0.97, (double)*(unint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24)), 1.0), 0.5);
  objc_msgSend(*(id *)(a1 + 32), "submenus");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "nodes");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "count");
  v20 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);

  if (IsNull)
  {
    if (*(_BYTE *)(a1 + 88))
      goto LABEL_32;
    if (v14 != 4)
    {
      v21 = *(double *)(a1 + 80);
LABEL_26:
      v29 = v15;
      v15 = v21 - v15;
      goto LABEL_27;
    }
  }
  else
  {
    v22 = v19 + ~v20;
    v23 = (double)v22 * 12.0;
    v24 = y + -12.0;
    if (*(_BYTE *)(a1 + 88))
    {
      if (v14 == 4)
      {
        v25 = v11 + v24;
        v26 = *(double *)(a1 + 80) - v23;
        if (v25 >= v26)
          v15 = v26;
        else
          v15 = v25;
      }
      else if (v24 >= v23)
      {
        v15 = y + -12.0;
      }
      else
      {
        v15 = (double)v22 * 12.0;
      }
      goto LABEL_32;
    }
    if (v14 != 4)
    {
      v21 = *(double *)(a1 + 80);
      v15 = fmax(v23, fmin(v24, v21 - v11));
      goto LABEL_26;
    }
    v27 = v11 + v24;
    v28 = *(double *)(a1 + 80) - v23;
    if (v27 >= v28)
      v15 = v28;
    else
      v15 = v27;
  }
  v29 = v15;
LABEL_27:
  if (v11 >= v15 / v16)
    v11 = v15 / v16;
  objc_msgSend(v4, "setVisibleContentSize:", v9, v11);
  if (v11 >= *(double *)(a1 + 80) / v16)
    v11 = *(double *)(a1 + 80) / v16;
  v15 = v29;
LABEL_32:
  CGAffineTransformMakeScale(&v44, v16, v16);
  objc_msgSend(*(id *)(a1 + 32), "layer");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "anchorPoint");
  UIRoundToScale(v31, 2.0);
  v33 = v32;
  if (v14 == 4)
    v34 = 1.0;
  else
    v34 = 0.0;

  v35 = v33 * *(double *)(a1 + 72);
  objc_msgSend(v4, "layer");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setAnchorPoint:", v33, v34);

  v43 = v44;
  objc_msgSend(v4, "setTransform:", &v43);
  objc_msgSend(v4, "setBounds:", 0.0, 0.0, v9, v11);
  objc_msgSend(v4, "setCenter:", v35, v15);
  objc_msgSend(*(id *)(a1 + 40), "stackedSubmenuOffset");
  v38 = v37;
  objc_msgSend(*(id *)(a1 + 32), "submenus");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "nodes");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v38
      * (double)(unint64_t)(objc_msgSend(v40, "count")
                                 - *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
  objc_msgSend(v4, "layer");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setZPosition:", v41);

  --*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
}

uint64_t __99___UIContextMenuStackedHierarchyLayout_navigateDownFromNode_toNode_alongsideAnimations_completion___block_invoke(uint64_t a1)
{
  uint64_t result;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  CGRect *v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  double *v13;
  double v14;
  CGFloat v15;
  double v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  void *v25;
  double v26;
  double v27;
  double MinY;
  _BOOL8 v29;
  double MaxY;
  uint64_t v31;
  CGFloat rect;
  CGFloat rect_8;
  CGFloat rect_16;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;

  objc_msgSend(*(id *)(a1 + 32), "addSubview:", *(_QWORD *)(a1 + 40));
  result = objc_msgSend(*(id *)(a1 + 40), "setShadowAlpha:", 0.0);
  if (*(_QWORD *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "_rectOfNodeParentElement:", *(_QWORD *)(a1 + 56));
    v3 = *(_QWORD **)(*(_QWORD *)(a1 + 72) + 8);
    v3[4] = v4;
    v3[5] = v5;
    v3[6] = v6;
    v3[7] = v7;
    v8 = *(CGRect **)(*(_QWORD *)(a1 + 72) + 8);
    objc_msgSend(*(id *)(a1 + 64), "frame");
    v39.origin.x = v9;
    v39.origin.y = v10;
    v39.size.width = v11;
    v39.size.height = v12;
    *(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 32) = CGRectIntersection(v8[1], v39);
    objc_msgSend(*(id *)(a1 + 40), "setFrame:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 48), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 56));
    v13 = *(double **)(*(_QWORD *)(a1 + 80) + 8);
    objc_msgSend(*(id *)(a1 + 64), "frame");
    v15 = v14;
    rect_8 = v14;
    rect_16 = v16;
    v18 = v17;
    v20 = v19;
    v21 = v13[4];
    v22 = v13[5];
    rect = v21;
    v23 = v13[6];
    v24 = v13[7];
    objc_msgSend(*(id *)(a1 + 32), "_screen");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "scale");
    v27 = 0.5 / v26;

    v35.origin.x = v21;
    v35.origin.y = v22;
    v35.size.width = v23;
    v35.size.height = v24;
    MinY = CGRectGetMinY(v35);
    v36.origin.x = v15;
    v36.origin.y = v18;
    v36.size.width = v20;
    v36.size.height = rect_16;
    v29 = vabdd_f64(MinY, CGRectGetMinY(v36)) <= v27;
    v37.origin.x = rect;
    v37.origin.y = v22;
    v37.size.width = v23;
    v37.size.height = v24;
    MaxY = CGRectGetMaxY(v37);
    v38.origin.x = rect_8;
    v38.origin.y = v18;
    v38.size.width = v20;
    v38.size.height = rect_16;
    if (vabdd_f64(MaxY, CGRectGetMaxY(v38)) <= v27)
      v31 = v29 | 4;
    else
      v31 = v29;
    objc_msgSend(*(id *)(a1 + 40), "setRoundedEdges:", v31);
    return objc_msgSend(*(id *)(a1 + 40), "layoutIfNeeded");
  }
  return result;
}

void __99___UIContextMenuStackedHierarchyLayout_navigateDownFromNode_toNode_alongsideAnimations_completion___block_invoke_2(uint64_t a1)
{
  float minimum;
  float maximum;
  float preferred;
  double v5;
  double v6;
  double v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  char v12;
  CAFrameRateRange v13;

  v13 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  minimum = v13.minimum;
  maximum = v13.maximum;
  preferred = v13.preferred;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __99___UIContextMenuStackedHierarchyLayout_navigateDownFromNode_toNode_alongsideAnimations_completion___block_invoke_3;
  v8[3] = &unk_1E16B4030;
  v12 = *(_BYTE *)(a1 + 56);
  v9 = *(id *)(a1 + 32);
  v10 = *(id *)(a1 + 40);
  v11 = *(id *)(a1 + 48);
  *(float *)&v5 = minimum;
  *(float *)&v6 = maximum;
  *(float *)&v7 = preferred;
  +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1048614, v8, v5, v6, v7);

}

void __99___UIContextMenuStackedHierarchyLayout_navigateDownFromNode_toNode_alongsideAnimations_completion___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  if (!*(_BYTE *)(a1 + 56))
    objc_msgSend(*(id *)(a1 + 32), "highlightItemAtIndexPath:", 0);
  objc_msgSend(*(id *)(a1 + 40), "setShadowAlpha:", 1.0);
  objc_msgSend(*(id *)(a1 + 40), "setRoundedEdges:", 5);
  objc_msgSend(*(id *)(a1 + 48), "contentView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "backgroundMaterialGroupName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSubmenuTitleViewExpanded:withMaterialGroupName:associatedCellContentView:highlighted:", 1, v3, v4, *(unsigned __int8 *)(a1 + 56));

}

void __99___UIContextMenuStackedHierarchyLayout_navigateDownFromNode_toNode_alongsideAnimations_completion___block_invoke_4(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "collectionView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "flashScrollIndicators");

}

void __99___UIContextMenuStackedHierarchyLayout_navigateDownFromNode_toNode_alongsideAnimations_completion___block_invoke_5(uint64_t a1)
{
  float minimum;
  float maximum;
  float preferred;
  double v5;
  double v6;
  double v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  id v12;
  __int128 v13;
  CAFrameRateRange v14;

  v14 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  minimum = v14.minimum;
  maximum = v14.maximum;
  preferred = v14.preferred;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __99___UIContextMenuStackedHierarchyLayout_navigateDownFromNode_toNode_alongsideAnimations_completion___block_invoke_6;
  v8[3] = &unk_1E16D6898;
  v9 = *(id *)(a1 + 32);
  v12 = *(id *)(a1 + 56);
  v10 = *(id *)(a1 + 40);
  v13 = *(_OWORD *)(a1 + 64);
  v11 = *(id *)(a1 + 48);
  *(float *)&v5 = minimum;
  *(float *)&v6 = maximum;
  *(float *)&v7 = preferred;
  +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1048614, v8, v5, v6, v7);

}

void __99___UIContextMenuStackedHierarchyLayout_navigateDownFromNode_toNode_alongsideAnimations_completion___block_invoke_6(uint64_t a1)
{
  uint64_t v2;
  double MinY;
  double v4;
  double v5;
  void *v6;
  __int128 v7;
  _OWORD v8[3];
  _QWORD v9[4];
  id v10;
  double v11;

  objc_msgSend(*(id *)(a1 + 32), "setEmphasized:", 0);
  v2 = *(_QWORD *)(a1 + 56);
  if (v2)
    (*(void (**)(uint64_t, uint64_t))(v2 + 16))(v2, 1);
  objc_msgSend(*(id *)(a1 + 40), "setNeedsLayout");
  objc_msgSend(*(id *)(a1 + 40), "layoutIfNeeded");
  if (!CGRectIsEmpty(*(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 32)))
  {
    MinY = CGRectGetMinY(*(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 32));
    v4 = CGRectGetMinY(*(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 32));
    if (vabdd_f64(MinY, v4) >= 2.22044605e-16)
    {
      v5 = MinY - v4;
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __99___UIContextMenuStackedHierarchyLayout_navigateDownFromNode_toNode_alongsideAnimations_completion___block_invoke_7;
      v9[3] = &unk_1E16B1888;
      v10 = *(id *)(a1 + 48);
      v11 = v5;
      +[UIView _performWithoutRetargetingAnimations:](UIView, "_performWithoutRetargetingAnimations:", v9);
      objc_msgSend(*(id *)(a1 + 48), "collectionView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
      v8[0] = *MEMORY[0x1E0C9BAA8];
      v8[1] = v7;
      v8[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
      objc_msgSend(v6, "setTransform:", v8);

    }
  }
}

void __99___UIContextMenuStackedHierarchyLayout_navigateDownFromNode_toNode_alongsideAnimations_completion___block_invoke_7(uint64_t a1)
{
  void *v2;
  CGAffineTransform v3;
  CGAffineTransform v4;

  CGAffineTransformMakeTranslation(&v4, 0.0, *(CGFloat *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "collectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v4;
  objc_msgSend(v2, "setTransform:", &v3);

}

void __97___UIContextMenuStackedHierarchyLayout_navigateUpFromNode_toNode_alongsideAnimations_completion___block_invoke(uint64_t a1)
{
  float minimum;
  float maximum;
  float preferred;
  double v5;
  double v6;
  double v7;
  _QWORD v8[4];
  id v9;
  id v10;
  char v11;
  CAFrameRateRange v12;

  v12 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  minimum = v12.minimum;
  maximum = v12.maximum;
  preferred = v12.preferred;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __97___UIContextMenuStackedHierarchyLayout_navigateUpFromNode_toNode_alongsideAnimations_completion___block_invoke_2;
  v8[3] = &unk_1E16B4008;
  v9 = *(id *)(a1 + 32);
  v11 = *(_BYTE *)(a1 + 48);
  v10 = *(id *)(a1 + 40);
  *(float *)&v5 = minimum;
  *(float *)&v6 = maximum;
  *(float *)&v7 = preferred;
  +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1048614, v8, v5, v6, v7);

}

void __97___UIContextMenuStackedHierarchyLayout_navigateUpFromNode_toNode_alongsideAnimations_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "setShadowAlpha:", 0.0);
  if (!*(_BYTE *)(a1 + 48))
    objc_msgSend(*(id *)(a1 + 32), "highlightItemAtIndexPath:", 0);
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "backgroundMaterialGroupName");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSubmenuTitleViewExpanded:withMaterialGroupName:associatedCellContentView:highlighted:", 0, v3, 0, *(unsigned __int8 *)(a1 + 48));

}

uint64_t __97___UIContextMenuStackedHierarchyLayout_navigateUpFromNode_toNode_alongsideAnimations_completion___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setUserInteractionEnabled:", 1);
}

void __97___UIContextMenuStackedHierarchyLayout_navigateUpFromNode_toNode_alongsideAnimations_completion___block_invoke_4(id *a1)
{
  float minimum;
  float maximum;
  float preferred;
  double v5;
  double v6;
  double v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  id v12;
  CAFrameRateRange v13;

  v13 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  minimum = v13.minimum;
  maximum = v13.maximum;
  preferred = v13.preferred;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __97___UIContextMenuStackedHierarchyLayout_navigateUpFromNode_toNode_alongsideAnimations_completion___block_invoke_5;
  v8[3] = &unk_1E16D68C0;
  v9 = a1[4];
  v12 = a1[7];
  v10 = a1[5];
  v11 = a1[6];
  *(float *)&v5 = minimum;
  *(float *)&v6 = maximum;
  *(float *)&v7 = preferred;
  +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1048614, v8, v5, v6, v7);

}

void __97___UIContextMenuStackedHierarchyLayout_navigateUpFromNode_toNode_alongsideAnimations_completion___block_invoke_5(uint64_t a1)
{
  void *v2;
  __int128 v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v30;
  CGFloat v31;
  double v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  void *v37;
  double v38;
  double v39;
  _BOOL8 v40;
  double MaxY;
  uint64_t v42;
  double v43;
  double v44;
  void *v45;
  void *v46;
  double MinY;
  CGFloat rect;
  CGFloat rect_8;
  CGFloat rect_16;
  CGFloat rect_24;
  CGFloat v52;
  CGFloat v53;
  CGFloat v54;
  CGAffineTransform v55;
  CGAffineTransform v56;
  CGAffineTransform v57;
  CGAffineTransform v58;
  _OWORD v59[3];
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;

  v2 = *(void **)(a1 + 32);
  v3 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v59[0] = *MEMORY[0x1E0C9BAA8];
  v59[1] = v3;
  v59[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v2, "setTransform:", v59);
  objc_msgSend(*(id *)(a1 + 32), "setEmphasized:", 1);
  v4 = *(_QWORD *)(a1 + 56);
  if (v4)
    (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, 2);
  objc_msgSend(*(id *)(a1 + 40), "setNeedsLayout");
  objc_msgSend(*(id *)(a1 + 40), "layoutIfNeeded");
  v5 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 48), "displayedMenu");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cellForElement:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = *(void **)(a1 + 48);
  if (v7)
  {
    -[UIView animationInfoCreateIfNecessary:](v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "animatablePropertyForKey:createIfNecessary:", CFSTR("position"), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      objc_msgSend(v10, "animationEntry");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v12)
        objc_msgSend(v9, "setAnimatableProperty:forKey:", 0, CFSTR("position"));
    }
    objc_msgSend(v7, "superview");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "frame");
    objc_msgSend(v13, "convertRect:toView:", *(_QWORD *)(a1 + 40));
    v15 = v14;
    v53 = v16;
    v54 = v14;
    v17 = v16;
    v19 = v18;
    rect_24 = v20;
    v52 = v18;
    v21 = v20;

    objc_msgSend(*(id *)(a1 + 32), "frame");
    v68.origin.x = v22;
    v68.origin.y = v23;
    v68.size.width = v24;
    v68.size.height = v25;
    v60.origin.x = v15;
    v60.origin.y = v17;
    v60.size.width = v19;
    v60.size.height = v21;
    v61 = CGRectIntersection(v60, v68);
    x = v61.origin.x;
    y = v61.origin.y;
    width = v61.size.width;
    height = v61.size.height;
    objc_msgSend(*(id *)(a1 + 48), "setFrame:");
    objc_msgSend(*(id *)(a1 + 32), "frame");
    v31 = v30;
    rect = v30;
    rect_8 = v32;
    v34 = v33;
    v36 = v35;
    objc_msgSend(*(id *)(a1 + 40), "_screen");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "scale");
    v39 = 0.5 / v38;

    v62.origin.x = x;
    rect_16 = x;
    v62.origin.y = y;
    v62.size.width = width;
    v62.size.height = height;
    MinY = CGRectGetMinY(v62);
    v63.origin.x = v31;
    v63.origin.y = v34;
    v63.size.width = v36;
    v63.size.height = rect_8;
    v40 = vabdd_f64(MinY, CGRectGetMinY(v63)) <= v39;
    v64.origin.x = x;
    v64.origin.y = y;
    v64.size.width = width;
    v64.size.height = height;
    MaxY = CGRectGetMaxY(v64);
    v65.origin.x = rect;
    v65.origin.y = v34;
    v65.size.width = v36;
    v65.size.height = rect_8;
    if (vabdd_f64(MaxY, CGRectGetMaxY(v65)) <= v39)
      v42 = v40 | 4;
    else
      v42 = v40;
    objc_msgSend(*(id *)(a1 + 48), "setRoundedEdges:", v42, *(_QWORD *)&MinY);
    objc_msgSend(*(id *)(a1 + 48), "layoutIfNeeded");
    v66.origin.y = v53;
    v66.origin.x = v54;
    v66.size.height = rect_24;
    v66.size.width = v52;
    v43 = CGRectGetMinY(v66);
    v67.origin.x = rect_16;
    v67.origin.y = y;
    v67.size.width = width;
    v67.size.height = height;
    v44 = CGRectGetMinY(v67);
    if (vabdd_f64(v43, v44) >= 2.22044605e-16)
    {
      CGAffineTransformMakeTranslation(&v58, 0.0, v43 - v44);
      objc_msgSend(*(id *)(a1 + 48), "collectionView");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = v58;
      objc_msgSend(v45, "setTransform:", &v57);

    }
  }
  else
  {
    objc_msgSend(v8, "setAlpha:", 0.0);
    CGAffineTransformMakeScale(&v56, 0.2, 0.2);
    v46 = *(void **)(a1 + 48);
    v55 = v56;
    objc_msgSend(v46, "setTransform:", &v55);
  }

}

@end
