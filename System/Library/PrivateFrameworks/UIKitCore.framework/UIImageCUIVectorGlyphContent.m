@implementation UIImageCUIVectorGlyphContent

uint64_t __100___UIImageCUIVectorGlyphContent__provideVectorGlyphCGImageWithSize_scale_hierarchicalColorResolver___block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v1 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v2 = objc_msgSend(v1, "CGColor");

  return v2;
}

uint64_t __93___UIImageCUIVectorGlyphContent__provideVectorGlyphCGImageWithSize_scale_namedColorResolver___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4;
  uint64_t v5;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = objc_msgSend(v4, "CGColor");
  if (v5)
    a3 = v5;

  return a3;
}

uint64_t __93___UIImageCUIVectorGlyphContent__drawVectorGlyphWithSize_scale_inContext_namedColorResolver___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4;
  uint64_t v5;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = objc_msgSend(v4, "CGColor");
  if (v5)
    a3 = v5;

  return a3;
}

uint64_t __100___UIImageCUIVectorGlyphContent__drawVectorGlyphWithSize_scale_inContext_hierarchicalColorResolver___block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v1 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v2 = objc_msgSend(v1, "CGColor");

  return v2;
}

@end
