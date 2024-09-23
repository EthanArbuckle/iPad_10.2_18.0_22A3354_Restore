@implementation PXGradient

+ (NSArray)opacityValuesForSmoothDescendingGradient
{
  return (NSArray *)&unk_2514EB8F0;
}

+ (id)colorValuesForSmoothDescendingGradientWithBaseColor:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v3 = a3;
  +[PXGradient opacityValuesForSmoothDescendingGradient](PXGradient, "opacityValuesForSmoothDescendingGradient");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __66__PXGradient_colorValuesForSmoothDescendingGradientWithBaseColor___block_invoke;
  v8[3] = &unk_2514CF370;
  v9 = v3;
  v5 = v3;
  PXMap(v4, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (NSArray)stopLocationsForSmoothDescendingGradient
{
  return (NSArray *)&unk_2514EB908;
}

id __66__PXGradient_colorValuesForSmoothDescendingGradientWithBaseColor___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "doubleValue");
  objc_msgSend(v2, "colorWithAlphaComponent:");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v3, "CGColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
