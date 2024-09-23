@implementation TVCollectionViewLockupCell

void __80___TVCollectionViewLockupCell_didUpdateFocusInContext_withAnimationCoordinator___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained && objc_msgSend(WeakRetained, "isFocused"))
  {
    objc_msgSend(v2, "_selectingView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "_focusableContentMargins");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    objc_msgSend(v2, "frame");
    v11 = v10;
    if (v3)
    {
      objc_msgSend(v3, "cellMetrics");
      v12 = *((double *)&v13 + 1);
    }
    else
    {
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
      v14 = 0u;
      v15 = 0u;
      v12 = 0.0;
      v13 = 0u;
    }
    objc_msgSend(v2, "_setFocusableContentMargins:", v5, v7, v11 - v12, v9, v13, v14, v15, v16, v17, v18, v19, v20, v21);

  }
}

@end
