@implementation UIBezierPath

__n128 __50__UIBezierPath_Utilities__vk_lengthIgnoringCurves__block_invoke(_QWORD *a1, int *a2)
{
  int v3;
  uint64_t v4;
  double v5;
  double v6;
  uint64_t v7;
  double v8;
  double v9;
  BOOL v10;
  BOOL v11;
  __n128 *v12;
  __n128 result;

  v3 = *a2;
  *(_OWORD *)(*(_QWORD *)(a1[4] + 8) + 48) = VKMPointInfinity;
  if ((v3 - 2) >= 2)
  {
    if (v3 != 1)
    {
      if (v3)
        goto LABEL_7;
      *(_OWORD *)(*(_QWORD *)(a1[5] + 8) + 48) = VKMPointInfinity;
    }
    *(_OWORD *)(*(_QWORD *)(a1[4] + 8) + 48) = *(_OWORD *)*((_QWORD *)a2 + 1);
  }
  *(_OWORD *)(*(_QWORD *)(a1[4] + 8) + 48) = *(_OWORD *)*((_QWORD *)a2 + 1);
LABEL_7:
  v4 = *(_QWORD *)(a1[5] + 8);
  v5 = *(double *)(v4 + 48);
  v6 = *(double *)(v4 + 56);
  v7 = *(_QWORD *)(a1[4] + 8);
  v8 = *(double *)(v7 + 48);
  v9 = *(double *)(v7 + 56);
  v10 = v9 == INFINITY && v8 == INFINITY;
  v11 = v6 == INFINITY && v5 == INFINITY;
  if (!v11 && !v10)
    *(double *)(*(_QWORD *)(a1[6] + 8) + 24) = VKMDistance(v5, v6, v8, v9)
                                                 + *(double *)(*(_QWORD *)(a1[6] + 8) + 24);
  if (v10)
    v12 = (__n128 *)&VKMPointInfinity;
  else
    v12 = (__n128 *)(*(_QWORD *)(a1[4] + 8) + 48);
  result = *v12;
  *(__n128 *)(*(_QWORD *)(a1[5] + 8) + 48) = *v12;
  return result;
}

void __50__UIBezierPath_Utilities__vk_allPointsFromCGPath___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  id v4;

  switch(*(_DWORD *)a2)
  {
    case 0:
    case 1:
      v3 = *(void **)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0CB3B18], "vk_valueWithPoint:", **(double **)(a2 + 8), *(double *)(*(_QWORD *)(a2 + 8) + 8));
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:");
      goto LABEL_4;
    case 2:
    case 3:
      v2 = *(void **)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0CB3B18], "vk_valueWithPoint:", *(double *)(*(_QWORD *)(a2 + 8) + 32), *(double *)(*(_QWORD *)(a2 + 8) + 40));
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "addObject:");
LABEL_4:

      break;
    default:
      return;
  }
}

uint64_t __53__UIBezierPath_Utilities__vk_pathFromFlippingInRect___block_invoke(uint64_t result, _DWORD *a2)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  v2 = result;
  switch(*a2)
  {
    case 0:
      v3 = *(void **)(result + 32);
      VKMFlipPoint();
      result = objc_msgSend(v3, "moveToPoint:");
      break;
    case 1:
      goto LABEL_4;
    case 2:
      +[VKAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](VKAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[UIBezierPath(Utilities) vk_pathFromFlippingInRect:]_block_invoke", 0, 0, CFSTR("kCGPathElementAddQuadCurveToPoint not supported."));
LABEL_4:
      v4 = *(void **)(v2 + 32);
      VKMFlipPoint();
      result = objc_msgSend(v4, "vk_addLineToPoint:");
      break;
    case 3:
      v5 = *(void **)(result + 32);
      VKMFlipPoint();
      v7 = v6;
      v9 = v8;
      VKMFlipPoint();
      result = objc_msgSend(v5, "vk_addCurveToPoint:controlPoint1:controlPoint2:", v7, v9, v10, v11, v10, v11);
      break;
    case 4:
      result = objc_msgSend(*(id *)(result + 32), "closePath");
      break;
    default:
      return result;
  }
  return result;
}

void __53__UIBezierPath_Utilities__vk_subpathArrayFromCGPath___block_invoke(uint64_t a1, uint64_t a2)
{
  double *v4;
  id v5;
  uint64_t v6;
  void *v7;

  switch(*(_DWORD *)a2)
  {
    case 0:
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "moveToPoint:", **(double **)(a2 + 8), *(double *)(*(_QWORD *)(a2 + 8) + 8));
      break;
    case 1:
      goto LABEL_4;
    case 2:
      +[VKAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](VKAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "+[UIBezierPath(Utilities) vk_subpathArrayFromCGPath:]_block_invoke", 0, 0, CFSTR("kCGPathElementAddQuadCurveToPoint not supported."));
LABEL_4:
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "vk_addLineToPoint:", **(double **)(a2 + 8), *(double *)(*(_QWORD *)(a2 + 8) + 8));
      break;
    case 3:
      v4 = *(double **)(a2 + 8);
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "vk_addCurveToPoint:controlPoint1:controlPoint2:", v4[4], v4[5], *v4, v4[1], v4[2], v4[3]);
      break;
    case 4:
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "closePath");
      objc_msgSend(*(id *)(a1 + 32), "addObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
      v5 = objc_alloc_init(MEMORY[0x1E0CEA390]);
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v7 = *(void **)(v6 + 40);
      *(_QWORD *)(v6 + 40) = v5;

      break;
    default:
      return;
  }
}

uint64_t __63__UIBezierPath_Utilities__vk_groupAndRoundPaths_radius_offset___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;

  v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "vk_cgPathcontainsAnyCurveToPoints:", objc_msgSend(v3, "vk_CGPath"));

  return v4;
}

void __63__UIBezierPath_Utilities__vk_groupAndRoundPaths_radius_offset___block_invoke_18(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t *v6;
  void **v7;

  v5 = a2;
  v6 = VKMClipperPathsFromCGPath((const CGPath *)objc_msgSend(v5, "vk_CGPath"), 1.0);
  ClipperLib::ClipperBase::AddPaths(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)+ 48+ *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48) - 24), v6, a3 != 0, 1);
  v7 = (void **)v6;
  std::vector<std::vector<ClipperLib::IntPoint>>::__destroy_vector::operator()[abi:ne180100](&v7);
  MEMORY[0x1D82499A0](v6, 0x20C40960023A9);

}

void __63__UIBezierPath_Utilities__vk_groupAndRoundPaths_radius_offset___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  const CGPath *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  objc_msgSend(*(id *)(a1 + 40), "vk_allPointsFromCGPath:", objc_msgSend(v10, "vk_CGPath"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  if (v6)
    objc_msgSend(v3, "removeLastObject");
  v7 = (const CGPath *)objc_msgSend(*(id *)(a1 + 40), "vk_newRoundedPathWithRadius:points:", v3, *(double *)(a1 + 48));
  v8 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CEA390], "vk_pathFromCGPath:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "vk_appendBezierPath:", v9);

  CGPathRelease(v7);
}

uint64_t __61__UIBezierPath_Utilities__vk_cgPathcontainsAnyCurveToPoints___block_invoke(uint64_t result, _DWORD *a2)
{
  if ((*a2 & 0xFFFFFFFE) == 2)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
  return result;
}

void __64__UIBezierPath_Utilities___processPointsForRounding_withRadius___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  double v12;
  double v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;

  v6 = a2;
  v18 = v6;
  if (!a3)
  {
    v11 = a1 + 32;
    goto LABEL_7;
  }
  objc_msgSend(v6, "vk_pointValue");
  v8 = v7;
  v10 = v9;
  v11 = a1 + 32;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "vk_pointValue");
  if (!VKMNearlyEqualPointsWithThreshold(v8, v10, v12, v13, *(double *)(a1 + 48)))
  {
LABEL_7:
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)v11 + 8) + 40), a2);
    goto LABEL_8;
  }
  v14 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v17 = *(void **)(v16 + 40);
    *(_QWORD *)(v16 + 40) = v15;

    v14 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  }
  objc_msgSend(v14, "addIndex:", a3);
LABEL_8:

}

void __121__UIBezierPath_Utilities__vk_roundAndGroupNormalizedQuadsForHighlight_aspectRatio_expansionScale_radiusToAvgHeightRatio___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "quadMultipliedBySize:", *(double *)(a1 + 40), *(double *)(a1 + 48));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:");

}

void __121__UIBezierPath_Utilities__vk_roundAndGroupNormalizedQuadsForHighlight_aspectRatio_expansionScale_radiusToAvgHeightRatio___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  uint64_t *v9;
  void **v10;

  v3 = a2;
  objc_msgSend(v3, "sideLength");
  if (v4 >= v5)
    v6 = v5;
  else
    v6 = v4;
  v7 = *(double *)(a1 + 56);
  objc_msgSend(v3, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = VKMClipperPathsFromCGPath((const CGPath *)objc_msgSend(v8, "vk_CGPath"), 1.0);

  ClipperLib::ClipperOffset::Clear((_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48));
  ClipperLib::ClipperOffset::AddPaths(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48, v9, 2, 0);
  ClipperLib::ClipperOffset::Execute((uint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48), *(uint64_t **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24), v6 * v7);
  ClipperLib::ClipperOffset::AddPaths(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 48, *(uint64_t **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24), 2, 0);
  v10 = (void **)v9;
  std::vector<std::vector<ClipperLib::IntPoint>>::__destroy_vector::operator()[abi:ne180100](&v10);
  MEMORY[0x1D82499A0](v9, 0x20C40960023A9);

}

void __121__UIBezierPath_Utilities__vk_roundAndGroupNormalizedQuadsForHighlight_aspectRatio_expansionScale_radiusToAvgHeightRatio___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  const CGPath *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  objc_msgSend(*(id *)(a1 + 48), "vk_allPointsFromCGPath:", objc_msgSend(v11, "vk_CGPath"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  if (v6)
    objc_msgSend(v3, "removeLastObject");
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "radiusForQuads:radiusRatio:", v7, *(double *)(a1 + 56));
  v8 = (const CGPath *)objc_msgSend(*(id *)(a1 + 48), "vk_newRoundedPathWithRadius:points:", v3);
  v9 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CEA390], "vk_pathFromCGPath:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "vk_appendBezierPath:", v10);

  CGPathRelease(v8);
}

void __44__UIBezierPath_Utilities__mapPaths_toQuads___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  id v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = (void *)objc_msgSend(*(id *)(a1 + 32), "copy", 0);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        objc_msgSend(v8, "vertexCentroid");
        if (objc_msgSend(v3, "containsPoint:"))
        {
          objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v3);
          v9 = (id)objc_claimAutoreleasedReturnValue();
          if (!v9)
          {
            v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:");
          }
          objc_msgSend(v9, "addObject:", v8);
          objc_msgSend(*(id *)(a1 + 32), "removeObject:", v8);

        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

}

@end
