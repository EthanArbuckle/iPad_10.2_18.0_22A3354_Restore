@implementation RPTCoordinateSpaceConverter

void __48__RPTCoordinateSpaceConverter_identityConverter__block_invoke()
{
  RPTNullCoordinateSpaceConverter *v0;
  void *v1;

  v0 = objc_alloc_init(RPTNullCoordinateSpaceConverter);
  v1 = (void *)identityConverter_identity;
  identityConverter_identity = (uint64_t)v0;

}

+ (RPTCoordinateSpaceConverter)identityConverter
{
  if (identityConverter_onceToken != -1)
    dispatch_once(&identityConverter_onceToken, &__block_literal_global_2);
  return (RPTCoordinateSpaceConverter *)(id)identityConverter_identity;
}

+ (id)converterFromView:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = -[RPTViewCoordinateSpaceConverter initFromView:]([RPTViewCoordinateSpaceConverter alloc], "initFromView:", v3);

  return v4;
}

+ (id)converterFromWindow:(id)a3
{
  id v3;
  RPTWindowCoordinateSpaceConverter *v4;
  void *v5;
  id v6;

  v3 = a3;
  v4 = [RPTWindowCoordinateSpaceConverter alloc];
  objc_msgSend(v3, "screen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[RPTWindowCoordinateSpaceConverter initFromWindow:toScreen:](v4, "initFromWindow:toScreen:", v3, v5);

  return v6;
}

+ (id)converterFromWindow:(id)a3 toScreen:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  v7 = -[RPTWindowCoordinateSpaceConverter initFromWindow:toScreen:]([RPTWindowCoordinateSpaceConverter alloc], "initFromWindow:toScreen:", v6, v5);

  return v7;
}

@end
