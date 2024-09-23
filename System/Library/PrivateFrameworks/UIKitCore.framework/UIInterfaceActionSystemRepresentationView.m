@implementation UIInterfaceActionSystemRepresentationView

uint64_t __70___UIInterfaceActionSystemRepresentationView__removeAllDisplayedViews__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeFromSuperview");
}

uint64_t __99___UIInterfaceActionSystemRepresentationView__reloadHierarchyWithViewsToDisplayWhenContentsVisible__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeFromSuperview");
}

void __99___UIInterfaceActionSystemRepresentationView__reloadHierarchyWithViewsToDisplayWhenContentsVisible__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(*(id *)(a1 + 32), "insertSubview:atIndex:", v3, 0);

}

void __82___UIInterfaceActionSystemRepresentationView__loadConstraintsForLabelsOnlyDisplay__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "_constraintForVerticallyCenteringLabelsView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v5);

  v6 = *(_QWORD **)(a1 + 32);
  v10[0] = v6[65];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_constraintsToEnsureContainerHeightTallEnoughForViews:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v8);

  objc_msgSend(*(id *)(a1 + 32), "_constraintsForInsettingLabelsViewLeadingAndTrailing");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v9);

}

void __87___UIInterfaceActionSystemRepresentationView__loadConstraintsForLabelsAndImagesDisplay__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL8 v11;
  void *v12;
  id v13;

  v13 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_constraintForVerticallyCenteringLabelsView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObject:", v3);

  if (objc_msgSend(*(id *)(a1 + 32), "_isDisplayingLeadingImageView"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_constraintForBaselineAligningOrVerticallyCenteringImageViewToLabelsView:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 504));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v4);

  }
  if (objc_msgSend(*(id *)(a1 + 32), "_isDisplayingTrailingImageView"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_constraintForBaselineAligningOrVerticallyCenteringImageViewToLabelsView:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 512));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v5);

  }
  v6 = *(id **)(a1 + 32);
  objc_msgSend(v6[67], "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_constraintsToEnsureContainerHeightTallEnoughForViews:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObjectsFromArray:", v8);

  objc_msgSend(*(id *)(a1 + 32), "_constraintsForInsettingImageViewsLeadingAndTrailingEdge");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObjectsFromArray:", v9);

  if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "_constraintsForHorizontallyCenteringLabelsView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObjectsFromArray:", v10);

    v11 = *(_BYTE *)(a1 + 40) == 0;
  }
  else
  {
    v11 = 1;
  }
  objc_msgSend(*(id *)(a1 + 32), "_constraintsForInsettingLabelsViewLeadingAndTrailingHorizontalEdgeReferenceExact:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObjectsFromArray:", v12);

}

void __87___UIInterfaceActionSystemRepresentationView__loadConstraintsForLabelsAndImagesDisplay__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;
  id v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = *(_BYTE *)(a1 + 40) == 0;
  v4 = a2;
  objc_msgSend(v2, "_constraintsForInsettingLabelsViewLeadingAndTrailingToImageViewsExact:", v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v5);

}

void __100___UIInterfaceActionSystemRepresentationView__constraintsToEnsureContainerHeightTallEnoughForViews___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _QWORD v21[2];
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = *(id *)(a1 + 32);
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v18;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v7);
        objc_msgSend(*(id *)(a1 + 40), "topAnchor");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "topAnchor");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "constraintLessThanOrEqualToAnchor:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(a1 + 40), "bottomAnchor");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "bottomAnchor");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "constraintGreaterThanOrEqualToAnchor:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        v21[0] = v11;
        v21[1] = v14;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObjectsFromArray:", v15);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    }
    while (v5);
  }

}

void __98___UIInterfaceActionSystemRepresentationView__constraintsForInsettingLabelsViewLeadingAndTrailing__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  char v5;
  id *v6;
  void *v7;
  char v8;
  id *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  v5 = objc_msgSend(v3, "_isDisplayingLeadingImageView");
  v6 = *(id **)(a1 + 32);
  if ((v5 & 1) != 0)
  {
    objc_msgSend(v6[63], "trailingAnchor");
    v16 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v6, "_horizontalEdgeReference");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "leadingAnchor");
    v16 = (id)objc_claimAutoreleasedReturnValue();

  }
  v8 = objc_msgSend(*(id *)(a1 + 32), "_isDisplayingTrailingImageView");
  v9 = *(id **)(a1 + 32);
  if ((v8 & 1) != 0)
  {
    objc_msgSend(v9[64], "leadingAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v9, "_horizontalEdgeReference");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "trailingAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 520), "leadingAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  constraintWithAnchorRelatedToAnchor(v12, 0, v16);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v13);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 520), "trailingAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  constraintWithAnchorRelatedToAnchor(v10, 0, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v15);

}

void __116___UIInterfaceActionSystemRepresentationView__constraintsForInsettingLabelsViewLeadingAndTrailingToImageViewsExact___block_invoke(uint64_t a1, void *a2)
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v3 = *(_BYTE *)(a1 + 40) == 0;
  if (objc_msgSend(*(id *)(a1 + 32), "_isDisplayingLeadingImageView"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 520), "leadingAnchor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 504), "trailingAnchor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    constraintWithAnchorRelatedToAnchor(v4, v3, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v6);

  }
  if (objc_msgSend(*(id *)(a1 + 32), "_isDisplayingTrailingImageView"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 512), "leadingAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 520), "trailingAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    constraintWithAnchorRelatedToAnchor(v7, v3, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v9);

  }
}

void __127___UIInterfaceActionSystemRepresentationView__constraintsForInsettingLabelsViewLeadingAndTrailingHorizontalEdgeReferenceExact___block_invoke(uint64_t a1, void *a2)
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  v3 = *(_BYTE *)(a1 + 40) == 0;
  if ((objc_msgSend(*(id *)(a1 + 32), "_isDisplayingLeadingImageView") & 1) == 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 520), "leadingAnchor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_horizontalEdgeReference");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "leadingAnchor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    constraintWithAnchorRelatedToAnchor(v4, v3, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v7);

  }
  if ((objc_msgSend(*(id *)(a1 + 32), "_isDisplayingTrailingImageView") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_horizontalEdgeReference");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "trailingAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 520), "trailingAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    constraintWithAnchorRelatedToAnchor(v9, v3, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v11);

  }
}

void __102___UIInterfaceActionSystemRepresentationView__constraintsForInsettingImageViewsLeadingAndTrailingEdge__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "_isDisplayingLeadingImageView"))
  {
    objc_msgSend(*(id *)(a1 + 32), "action");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 504), "imageProperty");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_layoutSizeForImageProperty:", v4);
    v6 = v5;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 504), "centerXAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_horizontalEdgeReference");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "leadingAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "constraintEqualToAnchor:constant:", v9, v6 * 0.5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObject:", v10);

  }
  if (objc_msgSend(*(id *)(a1 + 32), "_isDisplayingTrailingImageView"))
  {
    objc_msgSend(*(id *)(a1 + 32), "action");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 512), "imageProperty");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_layoutSizeForImageProperty:", v12);
    v14 = v13;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 512), "centerXAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_horizontalEdgeReference");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "trailingAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintEqualToAnchor:constant:", v17, v14 * -0.5);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObject:", v18);

  }
}

uint64_t __98___UIInterfaceActionSystemRepresentationView__updateDisplayedViewsConstraintsVisualStyleConstants__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setConstant:", *(double *)(a1 + 32));
}

void __80___UIInterfaceActionSystemRepresentationView__activateDisplayedViewsConstraints__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 544), "count"))
    objc_msgSend(v3, "addObjectsFromArray:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 544));
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 552), "count"))
    objc_msgSend(v3, "addObjectsFromArray:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 552));

}

@end
