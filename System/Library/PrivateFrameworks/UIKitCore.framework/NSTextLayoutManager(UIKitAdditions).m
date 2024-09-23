@implementation NSTextLayoutManager(UIKitAdditions)

- (double)ui_contentSizeForLastContainerView
{
  void *v2;
  void *v3;
  void *v4;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v9;
  uint64_t v10;
  id v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  _QWORD v19[5];
  _QWORD v20[6];
  _QWORD v21[4];
  uint64_t v22;
  double *v23;
  uint64_t v24;
  void *v25;
  __int128 v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;

  v22 = 0;
  v23 = (double *)&v22;
  v24 = 0x3010000000;
  v25 = &unk_18685B0AF;
  v26 = *MEMORY[0x1E0C9D820];
  objc_msgSend(a1, "textContentManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "documentRange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endLocation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "usageBoundsForTextContainer");
  x = v27.origin.x;
  y = v27.origin.y;
  width = v27.size.width;
  height = v27.size.height;
  v9 = CGRectGetWidth(v27);
  v10 = MEMORY[0x1E0C809B0];
  if (v9 < 0.00000011920929)
  {
    v21[0] = 0;
    v21[1] = v21;
    v21[2] = 0x2020000000;
    v21[3] = 0;
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __73__NSTextLayoutManager_UIKitAdditions__ui_contentSizeForLastContainerView__block_invoke;
    v20[3] = &unk_1E16DFB50;
    v20[4] = &v22;
    v20[5] = v21;
    v11 = (id)objc_msgSend(a1, "enumerateTextLayoutFragmentsFromLocation:options:usingBlock:", v4, 11, v20);
    _Block_object_dispose(v21, 8);
    if (!v4)
      goto LABEL_8;
    goto LABEL_7;
  }
  v12 = 0.0;
  if ((objc_msgSend(off_1E1679D50, "coordinateSystemCompatibilityFor2022AndEarlierSDKEnabled") & 1) == 0)
  {
    objc_msgSend(a1, "textContainer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "lineFragmentPadding");
    v15 = v14;

    v12 = v15 + v15;
  }
  v28.origin.x = x;
  v28.origin.y = y;
  v28.size.width = width;
  v28.size.height = height;
  v23[4] = v12 + CGRectGetWidth(v28);
  if (v4)
  {
LABEL_7:
    v16 = (void *)objc_msgSend(objc_alloc((Class)off_1E1679D70), "initWithLocation:", v4);
    objc_msgSend(a1, "ensureLayoutForRange:", v16);
    objc_msgSend(a1, "usageBoundsForTextContainer");
    v23[5] = CGRectGetHeight(v29);
    v19[0] = v10;
    v19[1] = 3221225472;
    v19[2] = __73__NSTextLayoutManager_UIKitAdditions__ui_contentSizeForLastContainerView__block_invoke_2;
    v19[3] = &unk_1E16C8880;
    v19[4] = &v22;
    objc_msgSend(a1, "enumerateTextSegmentsInRange:type:options:usingBlock:", v16, 1, 1, v19);

  }
LABEL_8:
  v17 = v23[4];

  _Block_object_dispose(&v22, 8);
  return v17;
}

- (void)ui_ensureLayoutForViewportBoundsAtRange:()UIKitAdditions
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  objc_msgSend(v13, "endLocation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "textContainerForLocation:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "textViewportLayoutController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "viewportRange");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "isNotEmpty")
    && ((objc_msgSend(v7, "containsRange:", v13) & 1) != 0
     || (objc_msgSend(v7, "endLocation"),
         v8 = (void *)objc_claimAutoreleasedReturnValue(),
         v9 = objc_msgSend(v8, "isEqual:", v4),
         v8,
         v9)))
  {
    v10 = objc_alloc((Class)off_1E1679D70);
    objc_msgSend(v7, "location");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v10, "initWithLocation:endLocation:", v11, v4);

    objc_msgSend(a1, "ensureLayoutForRange:", v12);
  }
  else
  {
    objc_msgSend(a1, "ensureLayoutForRange:", v13);
  }

}

- (id)viewportRangeForTextContainer:()UIKitAdditions
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "textViewportLayoutController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewportRange");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
