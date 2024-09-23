@implementation PXWidgetCompositionUIViewElementTileAnimator

- (void)prepareTile:(id)a3 withGeometry:(PXTileGeometry *)a4 userData:(id)a5
{
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  CGSize size;
  CGSize v13;
  id v14;
  id v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  CGSize v21;
  CGSize v22;
  objc_super v23;
  CGPoint origin;
  CGSize v25;
  CGPoint center;
  CGSize v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;

  v8 = *(_OWORD *)&a4->contentSize.height;
  v32 = *(_OWORD *)&a4->hidden;
  v33 = v8;
  v9 = *(_OWORD *)&a4->contentsRect.size.height;
  v34 = *(_OWORD *)&a4->contentsRect.origin.y;
  v35 = v9;
  v10 = *(_OWORD *)&a4->transform.c;
  v28 = *(_OWORD *)&a4->transform.a;
  v29 = v10;
  v11 = *(_OWORD *)&a4->alpha;
  v30 = *(_OWORD *)&a4->transform.tx;
  v31 = v11;
  size = a4->frame.size;
  origin = a4->frame.origin;
  v25 = size;
  v13 = a4->size;
  center = a4->center;
  v27 = v13;
  v14 = a5;
  v15 = a3;
  objc_msgSend(v15, "_willAnimateTileToGeometry:withOptions:", &origin, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v23.receiver = self;
  v23.super_class = (Class)PXWidgetCompositionUIViewElementTileAnimator;
  v17 = *(_OWORD *)&a4->contentSize.height;
  v32 = *(_OWORD *)&a4->hidden;
  v33 = v17;
  v18 = *(_OWORD *)&a4->contentsRect.size.height;
  v34 = *(_OWORD *)&a4->contentsRect.origin.y;
  v35 = v18;
  v19 = *(_OWORD *)&a4->transform.c;
  v28 = *(_OWORD *)&a4->transform.a;
  v29 = v19;
  v20 = *(_OWORD *)&a4->alpha;
  v30 = *(_OWORD *)&a4->transform.tx;
  v31 = v20;
  v21 = a4->frame.size;
  origin = a4->frame.origin;
  v25 = v21;
  v22 = a4->size;
  center = a4->center;
  v27 = v22;
  -[PXBasicUIViewTileAnimator prepareTile:withGeometry:userData:](&v23, sel_prepareTile_withGeometry_userData_, v15, &origin, v14);

  objc_msgSend(v15, "_didAnimateTileWithContext:", v16);
  objc_msgSend(v15, "_didCompleteTileAnimationWithContext:", v16);

}

- (void)animateTile:(id)a3 toGeometry:(PXTileGeometry *)a4 userData:(id)a5 withOptions:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  CGSize size;
  CGSize v19;
  id v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  CGSize v26;
  CGSize v27;
  id v28;
  id v29;
  id v30;
  objc_super v31;
  _QWORD v32[4];
  id v33;
  id v34;
  id v35;
  CGPoint origin;
  CGSize v37;
  CGPoint center;
  CGSize v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;

  v12 = a3;
  v13 = a7;
  v14 = *(_OWORD *)&a4->contentSize.height;
  v44 = *(_OWORD *)&a4->hidden;
  v45 = v14;
  v15 = *(_OWORD *)&a4->contentsRect.size.height;
  v46 = *(_OWORD *)&a4->contentsRect.origin.y;
  v47 = v15;
  v16 = *(_OWORD *)&a4->transform.c;
  v40 = *(_OWORD *)&a4->transform.a;
  v41 = v16;
  v17 = *(_OWORD *)&a4->alpha;
  v42 = *(_OWORD *)&a4->transform.tx;
  v43 = v17;
  size = a4->frame.size;
  origin = a4->frame.origin;
  v37 = size;
  v19 = a4->size;
  center = a4->center;
  v39 = v19;
  v20 = a6;
  v21 = a5;
  objc_msgSend(v12, "_willAnimateTileToGeometry:withOptions:", &origin, v20);
  v32[1] = 3221225472;
  v32[2] = __110__PXWidgetCompositionUIViewElementTileAnimator_animateTile_toGeometry_userData_withOptions_completionHandler___block_invoke;
  v32[3] = &unk_1E5145688;
  v33 = v12;
  v34 = (id)objc_claimAutoreleasedReturnValue();
  v35 = v13;
  v31.receiver = self;
  v31.super_class = (Class)PXWidgetCompositionUIViewElementTileAnimator;
  v32[0] = MEMORY[0x1E0C809B0];
  v22 = *(_OWORD *)&a4->contentSize.height;
  v44 = *(_OWORD *)&a4->hidden;
  v45 = v22;
  v23 = *(_OWORD *)&a4->contentsRect.size.height;
  v46 = *(_OWORD *)&a4->contentsRect.origin.y;
  v47 = v23;
  v24 = *(_OWORD *)&a4->transform.c;
  v40 = *(_OWORD *)&a4->transform.a;
  v41 = v24;
  v25 = *(_OWORD *)&a4->alpha;
  v42 = *(_OWORD *)&a4->transform.tx;
  v43 = v25;
  v26 = a4->frame.size;
  origin = a4->frame.origin;
  v37 = v26;
  v27 = a4->size;
  center = a4->center;
  v39 = v27;
  v28 = v13;
  v29 = v34;
  v30 = v12;
  -[PXBasicUIViewTileAnimator animateTile:toGeometry:userData:withOptions:completionHandler:](&v31, sel_animateTile_toGeometry_userData_withOptions_completionHandler_, v30, &origin, v21, v20, v32);

  objc_msgSend(v30, "_didAnimateTileWithContext:", v29);
}

uint64_t __110__PXWidgetCompositionUIViewElementTileAnimator_animateTile_toGeometry_userData_withOptions_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_didCompleteTileAnimationWithContext:", *(_QWORD *)(a1 + 40));
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

@end
