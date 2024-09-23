@implementation UIInputViewContent

void __47___UIInputViewContent__sizeFittingContentViews__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  double Width;
  uint64_t v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double Height;
  uint64_t v15;
  CGRect v16;
  CGRect v17;

  v3 = a2;
  objc_msgSend(v3, "frame");
  Width = CGRectGetWidth(v16);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (Width > *(double *)(v5 + 24))
    *(double *)(v5 + 24) = Width;
  objc_msgSend(v3, "frame");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v17.origin.x = v7;
  v17.origin.y = v9;
  v17.size.width = v11;
  v17.size.height = v13;
  Height = CGRectGetHeight(v17);
  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (Height > *(double *)(v15 + 24))
    *(double *)(v15 + 24) = Height;
}

@end
