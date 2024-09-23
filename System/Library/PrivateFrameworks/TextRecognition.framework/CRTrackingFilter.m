@implementation CRTrackingFilter

+ (BOOL)shouldStartTrackingRegion:(id)a3
{
  double v3;

  objc_msgSend(a3, "activationProbability");
  return v3 >= 0.300000012;
}

+ (BOOL)shouldStartTrackingGroup:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  BOOL v7;

  v3 = a3;
  objc_msgSend(v3, "averageLineHeight");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "averageLineHeight");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "doubleValue");
    v7 = v6 >= 5.0;

  }
  else
  {
    v7 = 1;
  }

  return v7;
}

+ (void)filterLowQualityTranscriptRegions:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (qword_1ED0B4650 != -1)
    dispatch_once(&qword_1ED0B4650, &__block_literal_global_21);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v10, "text", (_QWORD)v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "length");

        if (v12 != 1)
        {
          objc_msgSend(v10, "text");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "rangeOfCharacterFromSet:options:", _MergedGlobals_21, 2);

          if (v14 != 0x7FFFFFFFFFFFFFFFLL)
            continue;
        }
        objc_msgSend(v4, "addObject:", v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  objc_msgSend(v5, "removeObjectsInArray:", v4);
}

void __54__CRTrackingFilter_filterLowQualityTranscriptRegions___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3780], "characterSetWithCharactersInString:", CFSTR("º"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "punctuationCharacterSet");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "formUnionWithCharacterSet:", v0);

  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "formUnionWithCharacterSet:", v1);

  objc_msgSend(MEMORY[0x1E0CB3500], "symbolCharacterSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "formUnionWithCharacterSet:", v2);

  objc_msgSend(v5, "invertedSet");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)_MergedGlobals_21;
  _MergedGlobals_21 = v3;

}

+ (BOOL)shouldFilterHomographyWithResultQuad:(id)a3 originalQuad:(id)a4 imageSize:(CGSize)a5
{
  double height;
  double width;
  id v8;
  double v9;
  double v10;
  double v11;
  BOOL v12;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;

  height = a5.height;
  width = a5.width;
  v8 = a3;
  objc_msgSend(v8, "squaredDistanceFromCorrespondingCornersOfQuad:", a4);
  if (v9 > 40000.0
    || (objc_msgSend(v8, "hasIntersectingEdges") & 1) != 0
    || (objc_msgSend(v8, "boundingBox"), v10 > width * 1.20000005)
    || (objc_msgSend(v8, "boundingBox"), v11 > height * 1.20000005))
  {
    v12 = 1;
  }
  else
  {
    objc_msgSend(v8, "cornerAngles");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "sortedArrayUsingSelector:", sel_compare_);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "doubleValue");
    v18 = v17;
    objc_msgSend(v15, "objectAtIndexedSubscript:", 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "doubleValue");
    v21 = v18 / v20;

    v12 = v21 < 0.600000024;
  }

  return v12;
}

+ (BOOL)shouldEdgeIntersectionFilterQuad:(id)a3 originalQuad:(id)a4 imageSize:(CGSize)a5
{
  double height;
  double width;
  id v8;
  double v9;
  BOOL v10;

  height = a5.height;
  width = a5.width;
  v8 = a3;
  v9 = fmin(width, height);
  v10 = objc_msgSend(a4, "intersectsImageMargin:imageSize:", v9 * 0.0399999991, width, height)
     && !objc_msgSend(v8, "intersectsImageMargin:imageSize:", v9 * 0.119999997, width, height);

  return v10;
}

@end
