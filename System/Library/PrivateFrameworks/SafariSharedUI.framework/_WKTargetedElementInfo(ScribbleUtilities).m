@implementation _WKTargetedElementInfo(ScribbleUtilities)

- (id)safari_selectorsForStyleSheetRules
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "selectorsIncludingShadowHosts");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "count") == 1)
  {
    objc_msgSend(v1, "lastObject");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "firstObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v3, "length"))
    {
      v6[0] = v3;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = (void *)MEMORY[0x1E0C9AA60];
    }

  }
  else
  {
    v4 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v4;
}

- (BOOL)safari_coversWebView:()ScribbleUtilities
{
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;

  objc_msgSend(a3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend(a1, "boundsInWebView");
  return targetedElementRectsAreSimilar(v5, v7, v9, v11, v12, v13, v14, v15);
}

- (uint64_t)safari_isProbablyFullPageModalOverlay:()ScribbleUtilities
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = a3;
  if (objc_msgSend(a1, "safari_isOutOfFlow")
    && (objc_msgSend(a1, "renderedText"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "length"),
        v5,
        !v6))
  {
    v7 = objc_msgSend(a1, "safari_coversWebView:", v4);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (uint64_t)safari_isOutOfFlow
{
  unint64_t v1;

  v1 = objc_msgSend(a1, "positionType");
  return (v1 < 5) & (0x1Cu >> v1);
}

- (uint64_t)safari_prefersImageAnalysisTextWhenCheckingSimilarity
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "renderedText");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "safari_isLongEnoughToCheckSimilarity"))
    v3 = objc_msgSend(a1, "hasLargeReplacedDescendant");
  else
    v3 = 1;

  return v3;
}

- (void)safari_renderedTextForCheckingSimilarityWithCompletion:()ScribbleUtilities
{
  void (**v4)(id, id);
  id v5;

  v4 = a3;
  objc_msgSend(a1, "renderedText");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(a1, "safari_prefersImageAnalysisTextWhenCheckingSimilarity") & 1) != 0)
    objc_msgSend(a1, "safari_imageAnalysisTextWithCompletion:", v4);
  else
    v4[2](v4, v5);

}

- (void)safari_imageAnalysisTextWithCompletion:()ScribbleUtilities
{
  void (**v4)(id, _QWORD);
  double v5;
  double v6;
  _QWORD v8[4];
  void (**v9)(id, _QWORD);

  v4 = a3;
  objc_msgSend(a1, "boundsInWebView");
  if (v6 < 30.0 || v5 < 30.0)
  {
    v4[2](v4, 0);
  }
  else
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __84___WKTargetedElementInfo_ScribbleUtilities__safari_imageAnalysisTextWithCompletion___block_invoke;
    v8[3] = &unk_1E5444CB0;
    v9 = v4;
    objc_msgSend(a1, "takeSnapshotWithCompletionHandler:", v8);

  }
}

@end
