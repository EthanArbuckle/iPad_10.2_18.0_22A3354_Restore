@implementation AVAssetTrack(PhotosUICore)

- (double)px_transformedNaturalSize
{
  double v2;
  double v3;
  double result;
  double v5;
  double v6;

  objc_msgSend(a1, "naturalSize");
  v5 = v3;
  v6 = v2;
  objc_msgSend(a1, "px_preferredTransformBasedOnNaturalSize");
  *(_QWORD *)&result = *(_OWORD *)&vabsq_f64(vmlaq_n_f64(vmulq_n_f64((float64x2_t)0, v5), (float64x2_t)0, v6));
  return result;
}

- (double)px_preferredTransformBasedOnNaturalSize
{
  void *v4;
  double result;
  uint64_t v6;

  v4 = (void *)objc_opt_class();
  objc_msgSend(a1, "preferredTransform");
  objc_msgSend(a1, "naturalSize");
  if (v4)
  {
    objc_msgSend(v4, "px_changeTranslationOfTransform:forAssetSize:", &v6);
  }
  else
  {
    result = 0.0;
    a2[1] = 0u;
    a2[2] = 0u;
    *a2 = 0u;
  }
  return result;
}

+ (__n128)px_changeTranslationOfTransform:()PhotosUICore forAssetSize:
{
  double v4;
  __int128 v8;
  uint64_t v9;
  __n128 result;
  CGAffineTransform v11;
  CGRect v12;

  v4 = a3;
  v8 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)&v11.a = *(_OWORD *)a1;
  *(_OWORD *)&v11.c = v8;
  *(_OWORD *)&v11.tx = *(_OWORD *)(a1 + 32);
  v9 = 0;
  *(_QWORD *)&v8 = 0;
  v12 = CGRectApplyAffineTransform(*(CGRect *)(&v4 - 3), &v11);
  v12.size.height = *(CGFloat *)(a1 + 40);
  *(double *)(a1 + 32) = *(double *)(a1 + 32) - v12.origin.x;
  *(double *)(a1 + 40) = v12.size.height - v12.origin.y;
  *(_OWORD *)&v12.origin.y = *(_OWORD *)(a1 + 16);
  *(_OWORD *)a2 = *(_OWORD *)a1;
  *(_OWORD *)(a2 + 16) = *(_OWORD *)&v12.origin.y;
  result = *(__n128 *)(a1 + 32);
  *(__n128 *)(a2 + 32) = result;
  return result;
}

@end
