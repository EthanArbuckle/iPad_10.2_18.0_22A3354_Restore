@implementation UITextLayoutPreviewRenderer

uint64_t __51___UITextLayoutPreviewRenderer__updateDataIfNeeded__block_invoke(_QWORD *a1, double x, double y, double width, double height)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double *v14;
  CGRect v16;
  CGRect v17;

  v10 = (void *)a1[4];
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v11);

  v12 = (void *)a1[5];
  +[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:", x, y, width, height);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "appendPath:", v13);

  if (!CGRectIsEmpty(*(CGRect *)(*(_QWORD *)(a1[6] + 8) + 32)))
  {
    v16.origin.x = x;
    v16.origin.y = y;
    v16.size.width = width;
    v16.size.height = height;
    v17 = CGRectUnion(v16, *(CGRect *)(*(_QWORD *)(a1[6] + 8) + 32));
    x = v17.origin.x;
    y = v17.origin.y;
    width = v17.size.width;
    height = v17.size.height;
  }
  v14 = *(double **)(a1[6] + 8);
  v14[4] = x;
  v14[5] = y;
  v14[6] = width;
  v14[7] = height;
  return 1;
}

void __51___UITextLayoutPreviewRenderer__updateDataIfNeeded__block_invoke_2(uint64_t a1, void *a2)
{
  CGContext *v3;
  __int128 v4;
  CGAffineTransform v5;

  v3 = (CGContext *)objc_msgSend(a2, "CGContext");
  CGContextSaveGState(v3);
  v4 = *(_OWORD *)(a1 + 72);
  *(_OWORD *)&v5.a = *(_OWORD *)(a1 + 56);
  *(_OWORD *)&v5.c = v4;
  *(_OWORD *)&v5.tx = *(_OWORD *)(a1 + 88);
  CGContextConcatCTM(v3, &v5);
  objc_msgSend(*(id *)(a1 + 32), "addClip");
  _UITextLayoutDrawRangeInContext(*(void **)(a1 + 40), *(void **)(a1 + 48), (uint64_t)v3);
  CGContextRestoreGState(v3);
}

uint64_t __55___UITextLayoutPreviewRenderer_addRenderingAttributes___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "addRenderingAttribute:value:forTextRange:", a2, a3, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128));
}

@end
