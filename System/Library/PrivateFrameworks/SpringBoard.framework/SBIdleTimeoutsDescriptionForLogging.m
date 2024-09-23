@implementation SBIdleTimeoutsDescriptionForLogging

id ___SBIdleTimeoutsDescriptionForLogging_block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  double v7;
  double v8;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  v5 = (id)objc_msgSend(v3, "appendUnsignedInteger:withName:", objc_msgSend(v4, "identifier"), 0);
  v6 = *(void **)(a1 + 32);
  objc_msgSend(v4, "duration");
  v8 = v7;

  return (id)objc_msgSend(v6, "appendDouble:withName:decimalPrecision:", 0, 2, v8);
}

@end
