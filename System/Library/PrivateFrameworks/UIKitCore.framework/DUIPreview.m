@implementation DUIPreview

double __26___DUIPreview_scaleFactor__block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  objc_msgSend(*(id *)(a1 + 32), "boundingSize");
  v2 = *(double *)(a1 + 40);
  v3 = *(double *)(a1 + 48);
  v5 = v4 / v2;
  v7 = v6 / v3;
  if (v5 >= v7)
    v5 = v7;
  v8 = *(double *)(a1 + 64);
  v9 = *(double *)(a1 + 56) / v2;
  if (v9 < v8 / v3)
    v9 = v8 / v3;
  return fmax(v9, fmin(v5, 1.0));
}

@end
