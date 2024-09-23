@implementation UIScenePresentationView

void __62___UIScenePresentationView_scene_didPrepareUpdateWithContext___block_invoke(uint64_t a1, _BYTE *a2)
{
  *a2 = 1;
}

void __62___UIScenePresentationView_scene_didPrepareUpdateWithContext___block_invoke_2(uint64_t a1, _BYTE *a2)
{
  *a2 = 1;
}

void __62___UIScenePresentationView_scene_didPrepareUpdateWithContext___block_invoke_3(uint64_t a1, _BYTE *a2)
{
  *a2 = 1;
}

void __66___UIScenePresentationView_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 456))
  {
    v1 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 456), "hostedLayers");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "allObjects");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "appendArraySection:withName:skipIfEmpty:", v2, CFSTR("hostedLayers"), 1);

  }
}

uint64_t __68___UIScenePresentationView__geometryDidUpdateWithTransitionContext___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateFrameAndTransform");
}

@end
