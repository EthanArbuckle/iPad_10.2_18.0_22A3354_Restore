@implementation SKUICollectionViewUpdatePerspectiveCells

uint64_t __SKUICollectionViewUpdatePerspectiveCells_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  double v5;
  double v6;
  double v7;

  v4 = a3;
  objc_msgSend(a2, "center");
  objc_msgSend(v4, "center");

  UIDistanceBetweenPoints();
  v6 = v5;
  UIDistanceBetweenPoints();
  if (v6 < v7)
    return -1;
  else
    return v6 > v7;
}

@end
