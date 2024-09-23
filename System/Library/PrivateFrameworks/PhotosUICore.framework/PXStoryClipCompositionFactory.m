@implementation PXStoryClipCompositionFactory

+ (PXStoryClipComposition)oneUpComposition
{
  if (oneUpComposition_onceToken != -1)
    dispatch_once(&oneUpComposition_onceToken, &__block_literal_global_57112);
  return (PXStoryClipComposition *)(id)oneUpComposition_oneUpComposition;
}

+ (PXStoryClipComposition)aspectFitOneUpComposition
{
  return (PXStoryClipComposition *)objc_alloc_init(_PXStoryConcreteAspectFitOneUpClipComposition);
}

+ (id)oneUpCompositionWithAspectRatioNumerator:(int64_t)a3 denominator:(int64_t)a4
{
  return -[_PXStoryConcreteFixedAspectOneUpClipComposition initWithAspectRatioNumerator:denominator:]([_PXStoryConcreteFixedAspectOneUpClipComposition alloc], "initWithAspectRatioNumerator:denominator:", a3, a4);
}

+ (NSArray)defaultOneUpCompositions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[10];

  v14[9] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "oneUpComposition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "aspectFitOneUpComposition", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v4;
  objc_msgSend(a1, "oneUpCompositionWithAspectRatioNumerator:denominator:", 16, 9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v5;
  objc_msgSend(a1, "oneUpCompositionWithAspectRatioNumerator:denominator:", 3, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[3] = v6;
  objc_msgSend(a1, "oneUpCompositionWithAspectRatioNumerator:denominator:", 4, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[4] = v7;
  objc_msgSend(a1, "oneUpCompositionWithAspectRatioNumerator:denominator:", 1, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[5] = v8;
  objc_msgSend(a1, "oneUpCompositionWithAspectRatioNumerator:denominator:", 3, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[6] = v9;
  objc_msgSend(a1, "oneUpCompositionWithAspectRatioNumerator:denominator:", 2, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[7] = v10;
  objc_msgSend(a1, "oneUpCompositionWithAspectRatioNumerator:denominator:", 9, 16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[8] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v12;
}

+ (id)oneUpCompositionsWithAspectRatioPassingTest:(id)a3
{
  unsigned int (**v4)(_QWORD);
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = (unsigned int (**)(_QWORD))a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(a1, "defaultOneUpCompositions", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v10);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v11, "aspectRatio");
          if (v4[2](v4))
            objc_msgSend(v5, "addObject:", v11);
        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  v12 = (void *)objc_msgSend(v5, "copy");
  return v12;
}

+ (PXStoryClipComposition)twoUpHalfLeadingHalfTrailingComposition
{
  return (PXStoryClipComposition *)-[_PXStoryConcreteClipComposition initWithTwoUpEdge:splitRatio:label:]([_PXStoryConcreteClipComposition alloc], "initWithTwoUpEdge:splitRatio:label:", 0, CFSTR("2-Up [ | ]"), 0.5);
}

+ (PXStoryClipComposition)twoUpHalfTopHalfBottomComposition
{
  return (PXStoryClipComposition *)-[_PXStoryConcreteClipComposition initWithTwoUpEdge:splitRatio:label:]([_PXStoryConcreteClipComposition alloc], "initWithTwoUpEdge:splitRatio:label:", 1, CFSTR("2-Up [ / ]"), 0.5);
}

+ (PXStoryClipComposition)twoUpOneThirdLeadingTwoThirdsTrailingComposition
{
  return (PXStoryClipComposition *)-[_PXStoryConcreteClipComposition initWithTwoUpEdge:splitRatio:label:]([_PXStoryConcreteClipComposition alloc], "initWithTwoUpEdge:splitRatio:label:", 0, CFSTR("2-Up [| ]"), 0.333333333);
}

+ (PXStoryClipComposition)twoUpTwoThirdsLeadingOneThirdTrailingComposition
{
  return (PXStoryClipComposition *)-[_PXStoryConcreteClipComposition initWithTwoUpEdge:splitRatio:label:]([_PXStoryConcreteClipComposition alloc], "initWithTwoUpEdge:splitRatio:label:", 0, CFSTR("2-Up [ |]"), 0.666666667);
}

+ (PXStoryClipComposition)twoUpOneThirdTopTwoThirdsBottomComposition
{
  return (PXStoryClipComposition *)-[_PXStoryConcreteClipComposition initWithTwoUpEdge:splitRatio:label:]([_PXStoryConcreteClipComposition alloc], "initWithTwoUpEdge:splitRatio:label:", 1, CFSTR("2-Up [/ ]"), 0.333333333);
}

+ (PXStoryClipComposition)twoUpTwoThirdsTopOneThirdBottomComposition
{
  return (PXStoryClipComposition *)-[_PXStoryConcreteClipComposition initWithTwoUpEdge:splitRatio:label:]([_PXStoryConcreteClipComposition alloc], "initWithTwoUpEdge:splitRatio:label:", 1, CFSTR("2-Up [ /]"), 0.666666667);
}

+ (NSArray)defaultTwoUpCompositions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[7];

  v11[6] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "twoUpHalfLeadingHalfTrailingComposition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v3;
  objc_msgSend(a1, "twoUpHalfTopHalfBottomComposition");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v4;
  objc_msgSend(a1, "twoUpOneThirdLeadingTwoThirdsTrailingComposition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v5;
  objc_msgSend(a1, "twoUpTwoThirdsLeadingOneThirdTrailingComposition");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = v6;
  objc_msgSend(a1, "twoUpOneThirdTopTwoThirdsBottomComposition");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[4] = v7;
  objc_msgSend(a1, "twoUpTwoThirdsTopOneThirdBottomComposition");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[5] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v9;
}

+ (PXStoryClipComposition)twoUpOneThirdLeadingTwoThirdsTrailingAssetSplitComposition
{
  return (PXStoryClipComposition *)-[_PXStoryConcreteClipComposition initWithSingleAssetSplitAxis:splitRatio:label:]([_PXStoryConcreteClipComposition alloc], "initWithSingleAssetSplitAxis:splitRatio:label:", 1, CFSTR("Single Asset Split [| ]"), 0.333333333);
}

+ (PXStoryClipComposition)twoUpTwoThirdsLeadingOneThirdTrailingAssetSplitComposition
{
  return (PXStoryClipComposition *)-[_PXStoryConcreteClipComposition initWithSingleAssetSplitAxis:splitRatio:label:]([_PXStoryConcreteClipComposition alloc], "initWithSingleAssetSplitAxis:splitRatio:label:", 1, CFSTR("Single Asset Split [ |]"), 0.666666667);
}

+ (PXStoryClipComposition)twoUpOneThirdTopTwoThirdsBottomAssetSplitComposition
{
  return (PXStoryClipComposition *)-[_PXStoryConcreteClipComposition initWithSingleAssetSplitAxis:splitRatio:label:]([_PXStoryConcreteClipComposition alloc], "initWithSingleAssetSplitAxis:splitRatio:label:", 2, CFSTR("Single Asset Split [/ ]"), 0.333333333);
}

+ (PXStoryClipComposition)twoUpTwoThirdsTopOneThirdBottomAssetSplitComposition
{
  return (PXStoryClipComposition *)-[_PXStoryConcreteClipComposition initWithSingleAssetSplitAxis:splitRatio:label:]([_PXStoryConcreteClipComposition alloc], "initWithSingleAssetSplitAxis:splitRatio:label:", 2, CFSTR("Single Asset Split [ /]"), 0.666666667);
}

+ (NSArray)supportedTwoUpAssetSplitCompositions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];

  v9[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "twoUpOneThirdLeadingTwoThirdsTrailingAssetSplitComposition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  objc_msgSend(a1, "twoUpTwoThirdsLeadingOneThirdTrailingAssetSplitComposition");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  objc_msgSend(a1, "twoUpOneThirdTopTwoThirdsBottomAssetSplitComposition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v5;
  objc_msgSend(a1, "twoUpTwoThirdsTopOneThirdBottomAssetSplitComposition");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[3] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v7;
}

+ (NSArray)supportedTwoUpCompositions
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "defaultTwoUpCompositions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "supportedTwoUpAssetSplitCompositions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

+ (PXStoryClipComposition)threeUpVerticalThirdsComposition
{
  return (PXStoryClipComposition *)-[_PXStoryConcreteClipComposition initWithNumberOfClips:primaryEdge:splitRatio:secondaryEdge:splitRatio:label:]([_PXStoryConcreteClipComposition alloc], "initWithNumberOfClips:primaryEdge:splitRatio:secondaryEdge:splitRatio:label:", 3, 0, 0, CFSTR("3-Up [||]"), 0.333333333, 0.5);
}

+ (PXStoryClipComposition)threeUpHorizontalThirdsComposition
{
  return (PXStoryClipComposition *)-[_PXStoryConcreteClipComposition initWithNumberOfClips:primaryEdge:splitRatio:secondaryEdge:splitRatio:label:]([_PXStoryConcreteClipComposition alloc], "initWithNumberOfClips:primaryEdge:splitRatio:secondaryEdge:splitRatio:label:", 3, 1, 1, CFSTR("3-Up [//]"), 0.333333333, 0.5);
}

+ (NSArray)defaultThreeUpCompositions
{
  void *v3;
  void *v4;
  _PXStoryConcreteClipComposition *v5;
  _PXStoryConcreteClipComposition *v6;
  _PXStoryConcreteClipComposition *v7;
  _PXStoryConcreteClipComposition *v8;
  void *v9;
  _QWORD v11[7];

  v11[6] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "threeUpVerticalThirdsComposition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v3;
  objc_msgSend(a1, "threeUpHorizontalThirdsComposition");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v4;
  v5 = -[_PXStoryConcreteClipComposition initWithNumberOfClips:primaryEdge:splitRatio:secondaryEdge:splitRatio:label:]([_PXStoryConcreteClipComposition alloc], "initWithNumberOfClips:primaryEdge:splitRatio:secondaryEdge:splitRatio:label:", 3, 0, 1, CFSTR("3-Up [|-]"), 0.5, 0.5);
  v11[2] = v5;
  v6 = -[_PXStoryConcreteClipComposition initWithNumberOfClips:primaryEdge:splitRatio:secondaryEdge:splitRatio:label:]([_PXStoryConcreteClipComposition alloc], "initWithNumberOfClips:primaryEdge:splitRatio:secondaryEdge:splitRatio:label:", 3, 2, 1, CFSTR("3-Up [-|]"), 0.5, 0.5);
  v11[3] = v6;
  v7 = -[_PXStoryConcreteClipComposition initWithNumberOfClips:primaryEdge:splitRatio:secondaryEdge:splitRatio:label:]([_PXStoryConcreteClipComposition alloc], "initWithNumberOfClips:primaryEdge:splitRatio:secondaryEdge:splitRatio:label:", 3, 1, 0, CFSTR("3-Up [/-]"), 0.5, 0.5);
  v11[4] = v7;
  v8 = -[_PXStoryConcreteClipComposition initWithNumberOfClips:primaryEdge:splitRatio:secondaryEdge:splitRatio:label:]([_PXStoryConcreteClipComposition alloc], "initWithNumberOfClips:primaryEdge:splitRatio:secondaryEdge:splitRatio:label:", 3, 3, 0, CFSTR("3-Up [-/]"), 0.5, 0.5);
  v11[5] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v9;
}

+ (NSArray)defaultNUpCompositions
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "defaultTwoUpCompositions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "defaultThreeUpCompositions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

+ (NSArray)supportedNUpCompositions
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "supportedTwoUpCompositions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "supportedThreeUpCompositions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

+ (NSArray)allDefaultCompositions
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "defaultOneUpCompositions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "defaultNUpCompositions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

+ (NSArray)allSupportedCompositions
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "supportedOneUpCompositions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "supportedNUpCompositions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

void __49__PXStoryClipCompositionFactory_oneUpComposition__block_invoke()
{
  _PXStoryConcreteClipComposition *v0;
  void *v1;

  v0 = -[_PXStoryConcreteClipComposition initWithOneUp]([_PXStoryConcreteClipComposition alloc], "initWithOneUp");
  v1 = (void *)oneUpComposition_oneUpComposition;
  oneUpComposition_oneUpComposition = (uint64_t)v0;

}

@end
