@implementation UITextLayoutFragmentViewBase

uint64_t __48___UITextLayoutFragmentViewBase__updateGeometry__block_invoke(uint64_t a1)
{
  uint64_t result;
  CGRect v3;
  CGRect v4;

  objc_msgSend(*(id *)(a1 + 32), "frame");
  if (!CGRectEqualToRect(v3, *(CGRect *)(a1 + 40)))
    objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  objc_msgSend(*(id *)(a1 + 32), "bounds");
  result = CGRectEqualToRect(v4, *(CGRect *)(a1 + 72));
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 32), "setBounds:", *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96));
  return result;
}

void __62___UITextLayoutFragmentViewBase__updateTextAttachmentGeometry__block_invoke(uint64_t a1, void *a2, double a3, double a4, double a5, double a6)
{
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  objc_msgSend(v13, "setFrame:", a3, a4, a5, a6);
  objc_msgSend(v13, "superview");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *(void **)(a1 + 32);

  if (v11 != v12)
    objc_msgSend(*(id *)(a1 + 32), "addSubview:", v13);

}

void __72___UITextLayoutFragmentViewBase_enumerateTextAttachmentViewsUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;

  v14 = a2;
  objc_msgSend(v14, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = *(void **)(*(_QWORD *)(a1 + 32) + 424);
    objc_msgSend(v14, "location");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "frameForTextAttachmentAtLocation:", v5);
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;

    (*(void (**)(double, double, double, double))(*(_QWORD *)(a1 + 40) + 16))(v7, v9, v11, v13);
  }

}

@end
