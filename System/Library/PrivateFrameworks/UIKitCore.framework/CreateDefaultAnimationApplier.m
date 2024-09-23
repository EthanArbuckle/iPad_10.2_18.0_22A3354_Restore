@implementation CreateDefaultAnimationApplier

uint64_t ___CreateDefaultAnimationApplier_block_invoke(uint64_t a1, double a2, double a3)
{
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGAffineTransform v20;
  CGAffineTransform v21;
  CGAffineTransform v22;

  objc_msgSend(*(id *)(a1 + 32), "convertPoint:toView:", objc_msgSend(*(id *)(a1 + 32), "superview"), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  v7 = v6;
  v9 = v8;
  memset(&v22, 0, sizeof(v22));
  v10 = *(void **)(a1 + 32);
  if (v10)
  {
    objc_msgSend(v10, "transform");
    v11 = *(void **)(a1 + 32);
  }
  else
  {
    v11 = 0;
    memset(&v21, 0, sizeof(v21));
  }
  CGAffineTransformRotate(&v22, &v21, a3 - a2);
  v20 = v22;
  objc_msgSend(v11, "setTransform:", &v20);
  v12 = *(void **)(a1 + 32);
  objc_msgSend(v12, "convertPoint:toView:", objc_msgSend(v12, "superview"), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  v14 = v13;
  v16 = v15;
  objc_msgSend(v12, "center");
  return objc_msgSend(v12, "setCenter:", v7 - v14 + v17, v9 - v16 + v18);
}

uint64_t ___CreateDefaultAnimationApplier_block_invoke_2(uint64_t a1, double a2, double a3)
{
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;

  objc_msgSend(*(id *)(a1 + 32), "convertPoint:toView:", objc_msgSend(*(id *)(a1 + 32), "superview"), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  v6 = v5;
  v8 = v7;
  objc_msgSend(*(id *)(a1 + 32), "bounds");
  objc_msgSend(*(id *)(a1 + 32), "setBounds:");
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a3;
  v9 = *(void **)(a1 + 32);
  objc_msgSend(v9, "convertPoint:toView:", objc_msgSend(v9, "superview"), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  v11 = v10;
  v13 = v12;
  objc_msgSend(v9, "center");
  return objc_msgSend(v9, "setCenter:", v6 - v11 + v14, v8 - v13 + v15);
}

uint64_t ___CreateDefaultAnimationApplier_block_invoke_3(uint64_t a1, double a2, double a3)
{
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;

  objc_msgSend(*(id *)(a1 + 32), "convertPoint:toView:", objc_msgSend(*(id *)(a1 + 32), "superview"), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  v6 = v5;
  v8 = v7;
  objc_msgSend(*(id *)(a1 + 32), "bounds");
  objc_msgSend(*(id *)(a1 + 32), "setBounds:");
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a3;
  v9 = *(void **)(a1 + 32);
  objc_msgSend(v9, "convertPoint:toView:", objc_msgSend(v9, "superview"), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  v11 = v10;
  v13 = v12;
  objc_msgSend(v9, "center");
  return objc_msgSend(v9, "setCenter:", v6 - v11 + v14, v8 - v13 + v15);
}

uint64_t ___CreateDefaultAnimationApplier_block_invoke_4(uint64_t a1, double a2, double a3)
{
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;

  objc_msgSend(*(id *)(a1 + 32), "convertPoint:toView:", objc_msgSend(*(id *)(a1 + 32), "superview"), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  v6 = v5;
  v8 = v7;
  objc_msgSend(*(id *)(a1 + 32), "bounds");
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a3;
  objc_msgSend(*(id *)(a1 + 32), "setBounds:");
  v9 = *(void **)(a1 + 32);
  objc_msgSend(v9, "convertPoint:toView:", objc_msgSend(v9, "superview"), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  v11 = v10;
  v13 = v12;
  objc_msgSend(v9, "center");
  return objc_msgSend(v9, "setCenter:", v6 - v11 + v14, v8 - v13 + v15);
}

uint64_t ___CreateDefaultAnimationApplier_block_invoke_5(uint64_t a1, double a2, CGFloat a3)
{
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGAffineTransform v19;
  CGAffineTransform v20;
  CGAffineTransform v21;
  CGAffineTransform v22;

  objc_msgSend(*(id *)(a1 + 32), "convertPoint:toView:", objc_msgSend(*(id *)(a1 + 32), "superview"), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  v6 = v5;
  v8 = v7;
  memset(&v22, 0, sizeof(v22));
  v9 = *(void **)(a1 + 32);
  if (v9)
  {
    objc_msgSend(v9, "transform");
    v10 = *(void **)(a1 + 32);
  }
  else
  {
    v10 = 0;
    memset(&v20, 0, sizeof(v20));
  }
  CGAffineTransformScale(&v21, &v20, 1.0 / *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24), 1.0);
  CGAffineTransformScale(&v22, &v21, a3, 1.0);
  v19 = v22;
  objc_msgSend(v10, "setTransform:", &v19);
  *(CGFloat *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a3;
  v11 = *(void **)(a1 + 32);
  objc_msgSend(v11, "convertPoint:toView:", objc_msgSend(v11, "superview"), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  v13 = v12;
  v15 = v14;
  objc_msgSend(v11, "center");
  return objc_msgSend(v11, "setCenter:", v6 - v13 + v16, v8 - v15 + v17);
}

uint64_t ___CreateDefaultAnimationApplier_block_invoke_6(uint64_t a1, double a2, CGFloat a3)
{
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGAffineTransform v19;
  CGAffineTransform v20;
  CGAffineTransform v21;
  CGAffineTransform v22;

  objc_msgSend(*(id *)(a1 + 32), "convertPoint:toView:", objc_msgSend(*(id *)(a1 + 32), "superview"), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  v6 = v5;
  v8 = v7;
  memset(&v22, 0, sizeof(v22));
  v9 = *(void **)(a1 + 32);
  if (v9)
  {
    objc_msgSend(v9, "transform");
    v10 = *(void **)(a1 + 32);
  }
  else
  {
    v10 = 0;
    memset(&v20, 0, sizeof(v20));
  }
  CGAffineTransformScale(&v21, &v20, 1.0, 1.0 / *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
  CGAffineTransformScale(&v22, &v21, 1.0, a3);
  v19 = v22;
  objc_msgSend(v10, "setTransform:", &v19);
  *(CGFloat *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a3;
  v11 = *(void **)(a1 + 32);
  objc_msgSend(v11, "convertPoint:toView:", objc_msgSend(v11, "superview"), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  v13 = v12;
  v15 = v14;
  objc_msgSend(v11, "center");
  return objc_msgSend(v11, "setCenter:", v6 - v13 + v16, v8 - v15 + v17);
}

uint64_t ___CreateDefaultAnimationApplier_block_invoke_7(uint64_t a1, double a2, CGFloat a3)
{
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGAffineTransform v19;
  CGAffineTransform v20;
  CGAffineTransform v21;
  CGAffineTransform v22;

  objc_msgSend(*(id *)(a1 + 32), "convertPoint:toView:", objc_msgSend(*(id *)(a1 + 32), "superview"), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  v6 = v5;
  v8 = v7;
  memset(&v22, 0, sizeof(v22));
  v9 = *(void **)(a1 + 32);
  if (v9)
  {
    objc_msgSend(v9, "transform");
    v10 = *(void **)(a1 + 32);
  }
  else
  {
    v10 = 0;
    memset(&v20, 0, sizeof(v20));
  }
  CGAffineTransformScale(&v21, &v20, 1.0 / *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24), 1.0 / *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
  CGAffineTransformScale(&v22, &v21, a3, a3);
  v19 = v22;
  objc_msgSend(v10, "setTransform:", &v19);
  *(CGFloat *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a3;
  v11 = *(void **)(a1 + 32);
  objc_msgSend(v11, "convertPoint:toView:", objc_msgSend(v11, "superview"), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  v13 = v12;
  v15 = v14;
  objc_msgSend(v11, "center");
  return objc_msgSend(v11, "setCenter:", v6 - v13 + v16, v8 - v15 + v17);
}

uint64_t ___CreateDefaultAnimationApplier_block_invoke_8(uint64_t a1, double a2, double a3)
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  uint64_t v15;

  objc_msgSend(*(id *)(a1 + 32), "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v14 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "layer"), "superlayer");
  v15 = objc_msgSend(v14, "needsLayoutOnGeometryChange");
  objc_msgSend(*(id *)(a1 + 32), "setBounds:", a3 - a2 + v7, v9, v11, v13);
  return objc_msgSend(v14, "setNeedsLayoutOnGeometryChange:", v15);
}

uint64_t ___CreateDefaultAnimationApplier_block_invoke_9(uint64_t a1, double a2, double a3)
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  uint64_t v15;

  objc_msgSend(*(id *)(a1 + 32), "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v14 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "layer"), "superlayer");
  v15 = objc_msgSend(v14, "needsLayoutOnGeometryChange");
  objc_msgSend(*(id *)(a1 + 32), "setBounds:", v7, a3 - a2 + v9, v11, v13);
  return objc_msgSend(v14, "setNeedsLayoutOnGeometryChange:", v15);
}

uint64_t ___CreateDefaultAnimationApplier_block_invoke_10(uint64_t a1, double a2, double a3)
{
  double v6;

  objc_msgSend(*(id *)(a1 + 32), "center");
  return objc_msgSend(*(id *)(a1 + 32), "setCenter:", a3 - a2 + v6);
}

uint64_t ___CreateDefaultAnimationApplier_block_invoke_11(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "center");
  return objc_msgSend(*(id *)(a1 + 32), "setCenter:");
}

uint64_t ___CreateDefaultAnimationApplier_block_invoke_12(uint64_t a1, double a2, double a3)
{
  void *v6;
  void *v7;
  CGAffineTransform v9;
  CGAffineTransform t2;
  CGAffineTransform v11;
  CGAffineTransform v12;

  memset(&v12, 0, sizeof(v12));
  v6 = *(void **)(a1 + 32);
  if (v6)
  {
    objc_msgSend(v6, "transform");
    v7 = *(void **)(a1 + 32);
  }
  else
  {
    v7 = 0;
  }
  CGAffineTransformMakeTranslation(&t2, a3 - a2, 0.0);
  v9 = v12;
  CGAffineTransformConcat(&v11, &v9, &t2);
  v12 = v11;
  return objc_msgSend(v7, "setTransform:", &v11);
}

uint64_t ___CreateDefaultAnimationApplier_block_invoke_13(uint64_t a1, double a2, double a3)
{
  void *v6;
  void *v7;
  CGAffineTransform v9;
  CGAffineTransform t2;
  CGAffineTransform v11;
  CGAffineTransform v12;

  memset(&v12, 0, sizeof(v12));
  v6 = *(void **)(a1 + 32);
  if (v6)
  {
    objc_msgSend(v6, "transform");
    v7 = *(void **)(a1 + 32);
  }
  else
  {
    v7 = 0;
  }
  CGAffineTransformMakeTranslation(&t2, 0.0, a3 - a2);
  v9 = v12;
  CGAffineTransformConcat(&v11, &v9, &t2);
  v12 = v11;
  return objc_msgSend(v7, "setTransform:", &v11);
}

@end
