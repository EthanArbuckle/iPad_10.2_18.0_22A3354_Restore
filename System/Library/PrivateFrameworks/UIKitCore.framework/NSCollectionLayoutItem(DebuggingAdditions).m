@implementation NSCollectionLayoutItem(DebuggingAdditions)

- (id)_visualDescription
{
  double *v2;
  id *v3;
  id *v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _UIASCIIArtFramesRenderer *v13;
  void *v14;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v2 = -[_UICollectionLayoutContainer initWithContentSize:contentInsets:]([_UICollectionLayoutContainer alloc], 1000.0, 1000.0, 0.0, 0.0, 0.0, 0.0);
  v3 = -[_UICollectionLayoutItemSolver initWithItem:]([_UICollectionLayoutItemSolver alloc], a1);
  v4 = v3;
  if (v3)
  {
    -[_UICollectionLayoutItemSolver _solveForContainer:layoutAxis:traitCollection:maxFrameCount:layoutRTL:preferredSizes:largestKnownItemSize:solutionRecursionDepth:]((uint64_t)v3, v2, 2, 0, 0x7FFFFFFFFFFFFFFFLL, 0, 0, 0, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
    objc_msgSend(v4[3], "contentSize");
    v6 = v5;
    objc_msgSend(v4[3], "contentSize");
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", 0.0, 0.0, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UICollectionLayoutItemSolver queryFramesApplyingFrameOffset:]((uint64_t)v4, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "valueForKey:", CFSTR("frame"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "arrayByAddingObjectsFromArray:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = -[_UIASCIIArtFramesRenderer initWithFrames:]([_UIASCIIArtFramesRenderer alloc], "initWithFrames:", v12);
    -[_UIASCIIArtFramesRenderer description](v13, "description");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

@end
