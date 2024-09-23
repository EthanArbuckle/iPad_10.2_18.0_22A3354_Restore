@implementation UITextLayoutCanvasView

void __50___UITextLayoutCanvasView__performViewportLayout___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("_UITextViewportLayoutControllerWillLayout"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 416));

}

void __103___UITextLayoutCanvasView_textViewportLayoutController_configureRenderingSurfaceForTextLayoutFragment___block_invoke(double *a1, void *a2)
{
  double v3;
  double v4;
  id v5;

  v3 = a1[4];
  v4 = a1[5];
  v5 = a2;
  objc_msgSend(v5, "setContainerOrigin:", v3, v4);
  objc_msgSend(v5, "setContainerSize:", a1[6], a1[7]);
  objc_msgSend(v5, "setClipRect:", a1[8], a1[9], a1[10], a1[11]);

}

void __61___UITextLayoutCanvasView_textRangeForBounds_layoutIfNeeded___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  objc_msgSend(a2, "representedRange");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  if (v3)
  {
    objc_msgSend(v4, "textRangeByFormingUnionWithTextRange:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    v7 = v5;
  }
  else
  {
    *(_QWORD *)(v6 + 40) = v4;
  }

}

void __103___UITextLayoutCanvasView_textViewportLayoutController_configureRenderingSurfaceForTextLayoutFragment___block_invoke_2(double *a1, void *a2)
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  id v8;

  v3 = (void *)*((_QWORD *)a1 + 4);
  v4 = a1[6];
  v5 = a1[7];
  v6 = a1[8];
  v7 = a1[9];
  v8 = a2;
  objc_msgSend(v3, "didLayoutTextAttachmentView:inFragmentRect:", v8, v4, v5, v6, v7);
  objc_msgSend(*(id *)(*((_QWORD *)a1 + 5) + 448), "addObject:", v8);

}

void __70___UITextLayoutCanvasView_setTextEmphasisBackgroundView_withTextView___block_invoke(uint64_t a1, double a2, double a3, double a4, double a5, uint64_t a6, void *a7)
{
  id *v12;
  id WeakRetained;
  id v14;
  id v15;
  id v16;

  v16 = a7;
  v12 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

  if (v16 && WeakRetained)
  {
    v14 = objc_loadWeakRetained((id *)(a1 + 40));
    v15 = objc_loadWeakRetained(v12);
    objc_msgSend(v14, "_updateTextEmphasisBackgroundViewForTextRange:inTextView:bounds:", v16, v15, a2, a3, a4, a5);

  }
}

uint64_t __91___UITextLayoutCanvasView__updateTextEmphasisBackgroundViewForTextRange_inTextView_bounds___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  if (a2)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
    *a5 = 1;
  }
  return result;
}

uint64_t __45___UITextLayoutCanvasView__viewportDidLayout__block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __45___UITextLayoutCanvasView__viewportDidLayout__block_invoke_2;
  v3[3] = &unk_1E16C79F0;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(v1, "endLayoutWithConsumer:", v3);
}

void __45___UITextLayoutCanvasView__viewportDidLayout__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v5 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "objectForKey:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __45___UITextLayoutCanvasView__viewportDidLayout__block_invoke_3;
  v9[3] = &unk_1E16C79C8;
  v10 = v6;
  v11 = v5;
  v7 = v5;
  v8 = v6;
  objc_msgSend(v8, "performChanges:", v9);

}

uint64_t __45___UITextLayoutCanvasView__viewportDidLayout__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateWithSurface:", *(_QWORD *)(a1 + 40));
}

uint64_t __45___UITextLayoutCanvasView__viewportDidLayout__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutManagedSubviews");
}

void __61___UITextLayoutCanvasView_textRangeForBounds_layoutIfNeeded___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  objc_msgSend(a2, "representedRange");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  if (v3)
  {
    objc_msgSend(v4, "textRangeByFormingUnionWithTextRange:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    v7 = v5;
  }
  else
  {
    *(_QWORD *)(v6 + 40) = v4;
  }

}

void __53___UITextLayoutCanvasView_isHidingViewsForTextRange___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "textRangeByIntersectingWithTextRange:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v6, "isNotEmpty");

  *a4 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
}

void __69___UITextLayoutCanvasView_setLayoutFragmentViewsHidden_forTextRange___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  v13 = a2;
  objc_msgSend(*(id *)(a1 + 32), "textRangeByIntersectingWithTextRange:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isNotEmpty");

  if (v8)
  {
    if ((objc_msgSend(v13, "containsRange:", *(_QWORD *)(a1 + 32)) & 1) != 0
      || objc_msgSend(v13, "isEqual:", *(_QWORD *)(a1 + 32)))
    {
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v10 = *(void **)(v9 + 40);
      *(_QWORD *)(v9 + 40) = 0;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "removeObjectAtIndex:", a3);
      objc_msgSend(*(id *)(a1 + 32), "textRangeByFormingUnionWithTextRange:", v13);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v10 = *(void **)(v12 + 40);
      *(_QWORD *)(v12 + 40) = v11;
    }

    *a4 = 1;
  }

}

void __69___UITextLayoutCanvasView_setLayoutFragmentViewsHidden_forTextRange___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a2;
  objc_msgSend(*(id *)(a1 + 32), "textRangeByIntersectingWithTextRange:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isNotEmpty"))
  {
    objc_msgSend(*(id *)(a1 + 40), "removeObjectAtIndex:", a3);
    objc_msgSend(v5, "location");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "location");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "compare:", v7);

    if (v8 == 1)
    {
      v9 = objc_alloc((Class)off_1E1679D70);
      objc_msgSend(v20, "location");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "location");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v9, "initWithLocation:endLocation:", v10, v11);

      objc_msgSend(*(id *)(a1 + 40), "addObject:", v12);
    }
    objc_msgSend(v5, "endLocation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "endLocation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "compare:", v14);

    if (v15 == -1)
    {
      v16 = objc_alloc((Class)off_1E1679D70);
      objc_msgSend(v5, "endLocation");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "endLocation");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v16, "initWithLocation:endLocation:", v17, v18);

      objc_msgSend(*(id *)(a1 + 40), "addObject:", v19);
    }
  }

}

void __57___UITextLayoutCanvasView_removeLayoutFragmentViewHiding__block_invoke(uint64_t a1)
{
  -[_UITextLayoutCanvasView updateHiding:forViewsRenderingTextRange:](*(_QWORD *)(a1 + 32));
}

uint64_t __50___UITextLayoutCanvasView__performViewportLayout___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "layoutViewport");
}

void __50___UITextLayoutCanvasView__performViewportLayout___block_invoke_3(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("_UITextViewportLayoutControllerDidLayout"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 416));

}

void __64___UITextLayoutCanvasView_invalidateTemporaryAttributesInRange___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "customRenderController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidateTemporaryAttributesInRange:", v3);

}

@end
