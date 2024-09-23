@implementation PU

void __103__PU_VKCImageSubjectGlowLayer_configureAnimationWithViewScale_screenScale_path_index_count_identifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  id v9;
  id v10;

  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(double *)(a1 + 56);
  v6 = *(double *)(a1 + 64);
  v7 = (void *)MEMORY[0x1E0CB37E8];
  v8 = *(double *)(a1 + 72);
  v9 = a2;
  objc_msgSend(v7, "numberWithDouble:", v8);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "renderGlowParameters:path:pathLength:duration:maxStrokeLengthFraction:beginDelay:identifier:", v9, v4, v10, *(_QWORD *)(a1 + 40), v5, v6, *(double *)(a1 + 80));

}

uint64_t __67__PU_VKCImageSubjectGlowLayer_stopAnimationForIdentifier_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "makeObjectsPerformSelector:", sel_removeFromSuperlayer);
}

uint64_t __40__PU_VKCImageSubjectGlowLayer_hideGlow___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "makeObjectsPerformSelector:", sel_removeFromSuperlayer);
}

@end
