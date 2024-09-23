@implementation UIStatusBarDynamicSplitDefaultAnimation

void ___UIStatusBarDynamicSplitDefaultAnimation_block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  double v14;
  CGAffineTransform v15;
  CGAffineTransform v16;

  v7 = a3;
  v8 = a4;
  v9 = objc_msgSend(a2, "type");
  objc_msgSend(v7, "region");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "identifier");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v11;

  if (v9 == 2)
  {
    objc_msgSend(v7, "setAbsoluteFrame:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 56));
  }
  else
  {
    objc_msgSend(v7, "setAlpha:", 0.0);
    CGAffineTransformMakeScale(&v16, 0.85, 0.85);
    v15 = v16;
    objc_msgSend(v7, "setTransform:", &v15);
  }
  if (v9 == 1)
    v14 = 0.3;
  else
    v14 = 0.0;
  _UIStatusBarDynamicSplitPerformBaseAnimation(v7, v9 == 2, 0, 0, v8, 0.85, 0.25, v14);

}

uint64_t ___UIStatusBarDynamicSplitDefaultAnimation_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  int v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v5 = a3;
  if (objc_msgSend(a2, "type") == 2)
  {
    objc_msgSend(v5, "region");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEnabled");

    if (v7)
    {
      objc_msgSend(v5, "absoluteFrame");
      v8 = *(_QWORD **)(*(_QWORD *)(a1 + 32) + 8);
      v8[4] = v9;
      v8[5] = v10;
      v8[6] = v11;
      v8[7] = v12;
      v13 = 1;
      objc_msgSend(v5, "setFloating:", 1);
    }
    else
    {
      v13 = 0;
    }
  }
  else
  {
    v13 = 1;
  }

  return v13;
}

uint64_t ___UIStatusBarDynamicSplitDefaultAnimation_block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "region");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqual:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));

  return v5;
}

@end
