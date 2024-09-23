@implementation UIASCIIArtFramesRenderer

void __46___UIASCIIArtFramesRenderer_visualDescription__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "length"))
    objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("\n"));
  objc_msgSend(*(id *)(a1 + 32), "appendString:", v3);

}

void __42___UIASCIIArtFramesRenderer_renderedLines__block_invoke(uint64_t a1, void *a2)
{
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGRect v7;

  objc_msgSend(a2, "CGRectValue");
  v7.origin.x = v3;
  v7.origin.y = v4;
  v7.size.width = v5;
  v7.size.height = v6;
  *(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32) = CGRectUnion(*(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)+ 32), v7);
}

void __42___UIASCIIArtFramesRenderer_renderedLines__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", a2, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v6);

}

id __42___UIASCIIArtFramesRenderer_renderedLines__block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  if (a2 < 3)
  {
    objc_msgSend(&stru_1E16EDF20, "stringByPaddingToLength:withString:startingAtIndex:", a2, CFSTR("+"), 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(&stru_1E16EDF20, "stringByPaddingToLength:withString:startingAtIndex:", a2 - 2, CFSTR("-"), 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("+%@+"), v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

void __42___UIASCIIArtFramesRenderer_renderedLines__block_invoke_19(uint64_t a1, void *a2)
{
  id v3;
  __int128 v4;
  _QWORD v5[4];
  id v6[2];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __42___UIASCIIArtFramesRenderer_renderedLines__block_invoke_2_20;
  v5[3] = &unk_1E16B86C8;
  v4 = *(_OWORD *)(a1 + 32);
  v3 = (id)v4;
  *(_OWORD *)v6 = v4;
  objc_msgSend(a2, "enumerateRangesUsingBlock:", v5);

}

void __42___UIASCIIArtFramesRenderer_renderedLines__block_invoke_2_20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;

  if (a3 == 1)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "stringByReplacingCharactersInRange:withString:", a2, 1, CFSTR("|"));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    v12 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "stringByReplacingCharactersInRange:withString:", a2, a3, v12);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

    v8 = (void *)v12;
  }

}

uint64_t __46___UIASCIIArtFramesRenderer__normalizeFrames___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;
  double v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  double v8;

  result = objc_msgSend(a2, "CGRectValue");
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (*(double *)(v6 + 32) < v4)
    v4 = *(double *)(v6 + 32);
  *(double *)(v6 + 32) = v4;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(double *)(v7 + 40);
  if (v8 >= v5)
    v8 = v5;
  *(double *)(v7 + 40) = v8;
  return result;
}

void __46___UIASCIIArtFramesRenderer__normalizeFrames___block_invoke_2(uint64_t a1, void *a2)
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v7;
  CGFloat v8;
  double v9;
  id v10;
  CGRect v11;
  CGRect v12;

  objc_msgSend(a2, "CGRectValue");
  x = v11.origin.x;
  y = v11.origin.y;
  width = v11.size.width;
  height = v11.size.height;
  v7 = v11.origin.x - *(double *)(a1 + 40);
  v8 = v11.origin.y - *(double *)(a1 + 48);
  v9 = CGRectGetWidth(v11);
  v12.origin.x = x;
  v12.origin.y = y;
  v12.size.width = width;
  v12.size.height = height;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", v7, v8, v9, CGRectGetHeight(v12));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v10);

}

@end
