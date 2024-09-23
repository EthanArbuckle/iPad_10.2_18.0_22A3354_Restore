@implementation _PXCuratedLibraryLayoutSkimmingIndicatorsVisibilityChangeAnimationHelper

- (BOOL)wantsDoubleSidedAnimations
{
  return 1;
}

- (id)animation:(id)a3 doubleSidedAnimatedSpriteIndexesForModifiedSpriteIndexes:(id)a4 rootLayout:(id)a5 presentedGeometries:(id *)a6 styles:(id *)a7 infos:(id *)a8
{
  objc_class *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v14[4];
  id v15;
  const $786F7D2F4E5B3A0CBB66DF574B7D98CF *v16;

  v9 = (objc_class *)MEMORY[0x1E0CB3788];
  v10 = a4;
  v11 = objc_alloc_init(v9);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __187___PXCuratedLibraryLayoutSkimmingIndicatorsVisibilityChangeAnimationHelper_animation_doubleSidedAnimatedSpriteIndexesForModifiedSpriteIndexes_rootLayout_presentedGeometries_styles_infos___block_invoke;
  v14[3] = &unk_1E51479F0;
  v16 = a8;
  v12 = v11;
  v15 = v12;
  objc_msgSend(v10, "enumerateIndexesUsingBlock:", v14);

  return v12;
}

@end
