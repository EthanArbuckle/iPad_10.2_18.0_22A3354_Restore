@implementation UIScrollView(PhotosUI)

- (double)pu_displayFrameForRect:()PhotosUI
{
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double result;
  CGRect v14;

  objc_msgSend(a1, "contentOffset");
  v10 = -v9;
  v12 = -v11;
  v14.origin.x = a2;
  v14.origin.y = a3;
  v14.size.width = a4;
  v14.size.height = a5;
  *(_QWORD *)&result = (unint64_t)CGRectOffset(v14, v10, v12);
  return result;
}

- (uint64_t)pu_isPerformingScrollTest
{
  void *v2;
  _BOOL8 v3;
  void *v4;

  objc_msgSend(a1, "scrollTestParameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
    return 1;
  objc_msgSend(a1, "_pu_pptScrollHelper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v4 != 0;

  return v3;
}

- (id)_pu_pptScrollHelper
{
  return objc_getAssociatedObject(a1, (const void *)PUScrollViewPPTScrollHelperAssociationKey);
}

- (void)_pu_setPPTScrollHelper:()PhotosUI
{
  objc_setAssociatedObject(a1, (const void *)PUScrollViewPPTScrollHelperAssociationKey, a3, (void *)1);
}

- (void)pu_ppt_scrollToContentOffset:()PhotosUI withCompletionHandler:
{
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  _PUScrollViewPPTScrollHelper *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[5];
  id v18;
  double v19;
  double v20;
  double v21;
  double v22;
  uint64_t v23;

  v8 = a5;
  objc_msgSend(a1, "contentOffset");
  PXPointSubtract();
  PXFloatSign();
  v10 = v9 * 1000.0;
  PXFloatSign();
  v12 = v11 * 1000.0;
  v13 = -[_PUScrollViewPPTScrollHelper initWithScrollView:]([_PUScrollViewPPTScrollHelper alloc], "initWithScrollView:", a1);
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "scale");
  v16 = v15;

  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __77__UIScrollView_PhotosUI__pu_ppt_scrollToContentOffset_withCompletionHandler___block_invoke_2;
  v17[3] = &unk_1E58ABA78;
  v17[4] = a1;
  v18 = &__block_literal_global_105988;
  v19 = v10;
  v20 = v12;
  v21 = a2;
  v22 = a3;
  v23 = v16;
  -[_PUScrollViewPPTScrollHelper scrollWithStartHandler:incrementHandler:completionHandler:](v13, "scrollWithStartHandler:incrementHandler:completionHandler:", 0, v17, v8);

}

- (void)pu_ppt_performPageSwipeTest:()PhotosUI iterations:numberOfPages:scrollAxis:
{
  id v11;
  _PUScrollViewPageSwipeTestContext *v12;
  _PUScrollViewPPTScrollHelper *v13;
  uint64_t v14;
  _PUScrollViewPageSwipeTestContext *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  _PUScrollViewPageSwipeTestContext *v19;
  _QWORD v20[5];
  _PUScrollViewPageSwipeTestContext *v21;
  _QWORD v22[5];
  _PUScrollViewPageSwipeTestContext *v23;

  v11 = a3;
  if ((unint64_t)(a6 - 3) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UIScrollView+PhotosUI.m"), 136, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("scrollAxis == UIAxisHorizontal || scrollAxis == UIAxisVertical"));

  }
  if (a5 <= 0)
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "failedTest:", v11);

  }
  else
  {
    v12 = objc_alloc_init(_PUScrollViewPageSwipeTestContext);
    -[_PUScrollViewPageSwipeTestContext setTestName:](v12, "setTestName:", v11);
    -[_PUScrollViewPageSwipeTestContext setNumberOfPages:](v12, "setNumberOfPages:", a5);
    -[_PUScrollViewPageSwipeTestContext setNumberOfIterations:](v12, "setNumberOfIterations:", a4);
    -[_PUScrollViewPageSwipeTestContext setScrollAxis:](v12, "setScrollAxis:", a6);
    v13 = -[_PUScrollViewPPTScrollHelper initWithScrollView:]([_PUScrollViewPPTScrollHelper alloc], "initWithScrollView:", a1);
    v14 = MEMORY[0x1E0C809B0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __90__UIScrollView_PhotosUI__pu_ppt_performPageSwipeTest_iterations_numberOfPages_scrollAxis___block_invoke;
    v22[3] = &unk_1E58ABCA8;
    v22[4] = a1;
    v23 = v12;
    v20[0] = v14;
    v20[1] = 3221225472;
    v20[2] = __90__UIScrollView_PhotosUI__pu_ppt_performPageSwipeTest_iterations_numberOfPages_scrollAxis___block_invoke_2;
    v20[3] = &unk_1E58ABAA0;
    v20[4] = a1;
    v21 = v23;
    v18[0] = v14;
    v18[1] = 3221225472;
    v18[2] = __90__UIScrollView_PhotosUI__pu_ppt_performPageSwipeTest_iterations_numberOfPages_scrollAxis___block_invoke_3;
    v18[3] = &unk_1E58ABCA8;
    v18[4] = a1;
    v19 = v21;
    v15 = v21;
    -[_PUScrollViewPPTScrollHelper scrollWithStartHandler:incrementHandler:completionHandler:](v13, "scrollWithStartHandler:incrementHandler:completionHandler:", v22, v20, v18);

  }
}

- (void)_pu_beginPageSwipeTest:()PhotosUI
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(a1, "contentOffset");
  objc_msgSend(v4, "setOriginContentOffset:");
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "testName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "startedTest:", v5);
}

- (void)_pu_incrementForPageSwipeTest:()PhotosUI dt:stop:
{
  id v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  _BOOL4 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  uint64_t v27;
  uint64_t v28;
  double Width;
  double v33;
  double Height;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  __int128 v39;

  v9 = a3;
  v10 = objc_msgSend(v9, "currentPage");
  v11 = objc_msgSend(v9, "currentDirection");
  objc_msgSend(v9, "currentPageSwipeProgress");
  v13 = fmin(a5 / 0.75, 0.05) + v12;
  if (v13 >= 1.0)
  {
    v10 += v11;
    if (v11 < 1)
    {
      v14 = 0;
      v13 = 0.0;
      if (v11 && !v10)
      {
        v15 = objc_msgSend(v9, "currentIteration") + 1;
        objc_msgSend(v9, "setCurrentIteration:", v15);
        v14 = v15 >= objc_msgSend(v9, "numberOfIterations");
        v11 = 1;
      }
    }
    else
    {
      v14 = 0;
      if (v10 == objc_msgSend(v9, "numberOfPages"))
        v11 = -1;
      v13 = 0.0;
    }
  }
  else
  {
    v14 = 0;
  }
  objc_msgSend(v9, "setCurrentPageSwipeProgress:", v13);
  objc_msgSend(v9, "setCurrentDirection:", v11);
  objc_msgSend(v9, "setCurrentPage:", v10);
  v16 = objc_msgSend(v9, "currentState");
  v17 = v16;
  if (v13 < 0.1)
    goto LABEL_15;
  if (v13 < 0.3)
  {
    v18 = 1;
    goto LABEL_16;
  }
  if (v13 >= 0.9)
LABEL_15:
    v18 = 0;
  else
    v18 = 2;
LABEL_16:
  if (v18 != v16)
  {
    objc_msgSend(v9, "setCurrentState:", v18);
    objc_msgSend(a1, "delegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      if (v18 == 2)
      {
        if (v17 != 1)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UIScrollView+PhotosUI.m"), 229, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("oldState == PUScrollViewPageSwipeStateDragging"));

        }
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v39 = *MEMORY[0x1E0C9D538];
          objc_msgSend(v19, "scrollViewWillEndDragging:withVelocity:targetContentOffset:", a1, &v39, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
        }
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v19, "scrollViewDidEndDragging:willDecelerate:", a1, 1);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v19, "scrollViewWillBeginDecelerating:", a1);
      }
      else
      {
        if (v17)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UIScrollView+PhotosUI.m"), 223, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("oldState == PUScrollViewPageSwipeStateIdle"));

        }
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v19, "scrollViewWillBeginDragging:", a1);
      }
    }
    else
    {
      if (v17 != 2)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UIScrollView+PhotosUI.m"), 242, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("oldState == PUScrollViewPageSwipeStateDecelerating"));

      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v19, "scrollViewDidEndDecelerating:", a1);
    }

  }
  objc_msgSend(v9, "originContentOffset");
  v21 = v20;
  v23 = v22;
  v24 = (v13 + -0.2) / 0.6;
  if (v24 < 0.0)
    v24 = 0.0;
  if (v24 >= 1.0)
    v25 = 1.57079633;
  else
    v25 = v24 * 1.57079633;
  v26 = (double)v10 + sin(v25) * (double)v11;
  v27 = objc_msgSend(v9, "scrollAxis");
  objc_msgSend(a1, "bounds");
  if (v27 == 1)
  {
    Width = CGRectGetWidth(*(CGRect *)&v28);
    objc_msgSend(a1, "_interpageSpacing");
    v21 = v21 + v26 * (Width + v33);
  }
  else
  {
    Height = CGRectGetHeight(*(CGRect *)&v28);
    objc_msgSend(a1, "_interpageSpacing");
    v23 = v23 + v26 * (Height + v35);
  }
  objc_msgSend(a1, "setContentOffset:animated:", 0, v21, v23);
  if (v14)
    *a4 = 1;

}

- (void)_pu_endPageSwipeTest:()PhotosUI
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = (void *)MEMORY[0x1E0DC3470];
  v4 = a3;
  objc_msgSend(v3, "sharedApplication");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "testName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "finishedTest:", v5);
}

@end
