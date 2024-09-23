@implementation NSCoder(UIIBDependencyInjectionInternal)

- (void)_initializeClassSwapperWithCurrentDecodingViewControllerIfNeeded:()UIIBDependencyInjectionInternal
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;

  v14 = a3;
  objc_msgSend(a1, "_storyboardDecodingContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "classSwapperTemplate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(a1, "_storyboardDecodingContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "classSwapperTemplate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "replaceObject:withObject:", v7, v14);

    objc_msgSend(a1, "_storyboardDecodingContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setClassSwapperTemplate:", 0);

  }
  objc_msgSend(a1, "_storyboardDecodingContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "parentViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(a1, "_storyboardDecodingContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "childViewControllerIndex") + 1;
    objc_msgSend(a1, "_storyboardDecodingContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setChildViewControllerIndex:", v12);

  }
}

- (id)_decodeObjectsAndTrackChildViewControllerIndexWithParent:()UIIBDependencyInjectionInternal forKey:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "_storyboardDecodingContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "parentViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_storyboardDecodingContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "childViewControllerIndex");

  objc_msgSend(a1, "_createStoryboardDecodingContextIfNeeded");
  objc_msgSend(a1, "_storyboardDecodingContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setParentViewController:", v7);

  objc_msgSend(a1, "_storyboardDecodingContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setChildViewControllerIndex:", 0);

  objc_msgSend(a1, "decodeObjectForKey:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_storyboardDecodingContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setParentViewController:", v9);

  objc_msgSend(a1, "_storyboardDecodingContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setChildViewControllerIndex:", v11);

  return v14;
}

- (void)_createStoryboardDecodingContextIfNeeded
{
  void *v2;
  UIStoryboardDecodingContext *v3;

  objc_msgSend(a1, "_storyboardDecodingContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    v3 = objc_alloc_init(UIStoryboardDecodingContext);
    objc_setAssociatedObject(a1, &UIStoryboardDecodingContextKey, v3, (void *)1);

  }
}

- (id)_decodeObjectsWithSourceSegueTemplate:()UIIBDependencyInjectionInternal creator:sender:forKey:
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  objc_msgSend(a1, "_storyboardDecodingContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "sourceSegueTemplate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_storyboardDecodingContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "sender");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_storyboardDecodingContext");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "creator");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_createStoryboardDecodingContextIfNeeded");
  objc_msgSend(a1, "_storyboardDecodingContext");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setSourceSegueTemplate:", v13);

  objc_msgSend(a1, "_storyboardDecodingContext");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setSender:", v11);

  objc_msgSend(a1, "_storyboardDecodingContext");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setCreator:", v12);

  objc_msgSend(a1, "decodeObjectForKey:", v10);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_storyboardDecodingContext");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setSourceSegueTemplate:", v15);

  objc_msgSend(a1, "_storyboardDecodingContext");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setSender:", v17);

  objc_msgSend(a1, "_storyboardDecodingContext");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setCreator:", v19);

  return v23;
}

- (id)_storyboardDecodingContext
{
  return objc_getAssociatedObject(a1, &UIStoryboardDecodingContextKey);
}

@end
