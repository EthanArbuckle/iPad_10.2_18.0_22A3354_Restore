@implementation PXStoryDisplayAssetSuggestedCrop

uint64_t __PXStoryDisplayAssetSuggestedCrop_block_invoke(uint64_t result, double a2, double a3, double a4, double a5, uint64_t a6, _BYTE *a7)
{
  double *v7;

  v7 = *(double **)(*(_QWORD *)(result + 32) + 8);
  v7[4] = a2;
  v7[5] = a3;
  v7[6] = a4;
  v7[7] = a5;
  *a7 = 1;
  return result;
}

uint64_t __PXStoryDisplayAssetSuggestedCrop_block_invoke_2(uint64_t result, double a2, double a3, double a4, double a5, uint64_t a6, _BYTE *a7)
{
  double *v7;

  v7 = *(double **)(*(_QWORD *)(result + 32) + 8);
  v7[4] = a2;
  v7[5] = a3;
  v7[6] = a4;
  v7[7] = a5;
  *a7 = 1;
  return result;
}

uint64_t __PXStoryDisplayAssetSuggestedCrop_block_invoke_3()
{
  PXRectFlippedVertically();
  return PXRectDenormalize();
}

uint64_t __PXStoryDisplayAssetSuggestedCrop_block_invoke_4(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  _QWORD *v8;
  unint64_t v9;
  uint64_t v10;
  double *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  if (a2 >= 1)
  {
    v7 = result;
    v8 = &v20[-4 * a2];
    v9 = 0;
    v10 = a2;
    do
    {
      v11 = (double *)&v8[v9 / 8];
      *v11 = (*(double (**)(double, double, double, double))(*(_QWORD *)(v7 + 32) + 16))(*(double *)(a3 + v9), *(double *)(a3 + v9 + 8), *(double *)(a3 + v9 + 16), *(double *)(a3 + v9 + 24));
      *((_QWORD *)v11 + 1) = v12;
      *((_QWORD *)v11 + 2) = v13;
      *((_QWORD *)v11 + 3) = v14;
      v9 += 32;
      --v10;
    }
    while (v10);
    PXSizeGetAspectRatio();
    result = +[PXStoryCropUtilities suggestedCropWithAspectRatio:forAssetWithSize:faceCount:faceRects:featuredFaceCount:](PXStoryCropUtilities, "suggestedCropWithAspectRatio:forAssetWithSize:faceCount:faceRects:featuredFaceCount:", a2, v8, a4);
    v15 = *(_QWORD **)(*(_QWORD *)(v7 + 40) + 8);
    v15[4] = v16;
    v15[5] = v17;
    v15[6] = v18;
    v15[7] = v19;
  }
  return result;
}

@end
