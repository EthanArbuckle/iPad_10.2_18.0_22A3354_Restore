@implementation ReferenceValueComparator

uint64_t ___ReferenceValueComparator_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v4 = a3;
  objc_msgSend(a2, "CGPointValue");
  v6 = v5;
  objc_msgSend(v4, "CGPointValue");
  v8 = v7;

  if (v6 >= v8)
    return v6 > v8;
  else
    return -1;
}

@end
