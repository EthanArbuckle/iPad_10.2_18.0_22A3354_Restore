@implementation VKCMockTextProvider

- (VKCMockTextProvider)initWithDictionary:(id)a3
{
  id v4;
  VKCMockTextProvider *v5;
  NSMutableArray *v6;
  NSMutableArray *lines;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VKCMockTextProvider;
  v5 = -[VKCMockTextProvider init](&v9, sel_init);
  if (v5)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    lines = v5->_lines;
    v5->_lines = v6;

    -[VKCMockTextProvider loadInfoFromDictionary:](v5, "loadInfoFromDictionary:", v4);
  }

  return v5;
}

- (void)loadInfoFromDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *, uint64_t);
  void *v14;
  id v15;
  id v16;
  id v17;
  _QWORD *v18;
  _QWORD v19[4];

  v4 = a3;
  -[VKCMockTextProvider lines](self, "lines");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", VKCMockResultLinesKey);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  v19[3] = 0;
  v7 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __46__VKCMockTextProvider_loadInfoFromDictionary___block_invoke;
  v14 = &unk_1E9465A80;
  v18 = v19;
  v8 = v5;
  v15 = v8;
  v9 = v7;
  v16 = v9;
  v10 = v6;
  v17 = v10;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", &v11);
  -[VKCMockTextProvider setText:](self, "setText:", v9, v11, v12, v13, v14);

  _Block_object_dispose(v19, 8);
}

void __46__VKCMockTextProvider_loadInfoFromDictionary___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  VKCMockTextLine *v10;

  v5 = a2;
  v10 = -[VKCMockTextLine initWithWordsArray:startingIndex:]([VKCMockTextLine alloc], "initWithWordsArray:startingIndex:", v5, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v10);
  v6 = -[VKCMockTextLine range](v10, "range");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v6 + v7;
  v8 = *(void **)(a1 + 40);
  -[VKCMockTextLine text](v10, "text");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendString:", v9);

  if (objc_msgSend(*(id *)(a1 + 48), "count") - 1 != a3)
  {
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    objc_msgSend(*(id *)(a1 + 40), "appendString:", CFSTR("\n"));
  }

}

- (id)allLineQuads
{
  void *v2;
  void *v3;

  -[VKCMockTextProvider lines](self, "lines");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "vk_compactMap:", &__block_literal_global_39);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __35__VKCMockTextProvider_allLineQuads__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "quad");
}

- (id)lineForIndex:(unint64_t)a3
{
  void *v5;
  unint64_t v6;
  void *v7;
  id v8;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__20;
  v15 = __Block_byref_object_dispose__20;
  v16 = 0;
  -[VKCMockTextProvider text](self, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (v6 > a3)
  {
    -[VKCMockTextProvider lines](self, "lines");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __36__VKCMockTextProvider_lineForIndex___block_invoke;
    v10[3] = &unk_1E9465AC8;
    v10[4] = &v11;
    v10[5] = a3;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v10);

  }
  v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v8;
}

void __36__VKCMockTextProvider_lineForIndex___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  unint64_t v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  v7 = objc_msgSend(v9, "range");
  if (VKMRangeContainsIndex(v7, v8, *(_QWORD *)(a1 + 40)))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (id)wordForIndex:(unint64_t)a3
{
  void *v4;
  void *v5;
  id v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__20;
  v13 = __Block_byref_object_dispose__20;
  v14 = 0;
  -[VKCMockTextProvider lineForIndex:](self, "lineForIndex:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "words");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __36__VKCMockTextProvider_wordForIndex___block_invoke;
  v8[3] = &unk_1E9465AF0;
  v8[4] = &v9;
  v8[5] = a3;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v8);

  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __36__VKCMockTextProvider_wordForIndex___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  unint64_t v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  v7 = objc_msgSend(v9, "range");
  if (VKMRangeContainsIndex(v7, v8, *(_QWORD *)(a1 + 40)))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (CGRect)caretRectForPosition:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  v3 = *MEMORY[0x1E0C9D648];
  v4 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (id)characterRangeAtPoint:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD v11[7];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  y = a3.y;
  x = a3.x;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__20;
  v16 = __Block_byref_object_dispose__20;
  v17 = 0;
  -[VKCMockTextProvider lines](self, "lines");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __45__VKCMockTextProvider_characterRangeAtPoint___block_invoke;
  v11[3] = &unk_1E9465B40;
  *(CGFloat *)&v11[5] = x;
  *(CGFloat *)&v11[6] = y;
  v11[4] = &v12;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v11);

  v6 = (void *)v13[5];
  if (v6)
  {
    v7 = objc_msgSend(v6, "range");
    +[VKTextRange rangeWithNSRange:](VKTextRange, "rangeWithNSRange:", v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  _Block_object_dispose(&v12, 8);

  return v9;
}

void __45__VKCMockTextProvider_characterRangeAtPoint___block_invoke(uint64_t a1, void *a2, uint64_t a3, BOOL *a4)
{
  void *v6;
  int v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  __int128 v11;

  v9 = a2;
  objc_msgSend(v9, "quad");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsPoint:", *(double *)(a1 + 40), *(double *)(a1 + 48));

  if (v7)
  {
    objc_msgSend(v9, "words");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __45__VKCMockTextProvider_characterRangeAtPoint___block_invoke_2;
    v10[3] = &unk_1E9465B18;
    v11 = *(_OWORD *)(a1 + 40);
    v10[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v10);

  }
  *a4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) != 0;

}

void __45__VKCMockTextProvider_characterRangeAtPoint___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, BOOL *a4)
{
  void *v7;
  int v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "quad");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "containsPoint:", *(double *)(a1 + 40), *(double *)(a1 + 48));

  if (v8)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  *a4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) != 0;

}

- (id)closestPositionToPoint:(CGPoint)a3 withinRange:(id)a4
{
  CGFloat y;
  CGFloat x;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *);
  void *v18;
  id v19;
  uint64_t *v20;
  uint64_t *v21;
  CGFloat v22;
  CGFloat v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  _QWORD v30[4];
  id v31;
  uint64_t *v32;
  uint64_t *v33;
  CGFloat v34;
  CGFloat v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v40 = 0;
  v41 = &v40;
  v42 = 0x3032000000;
  v43 = __Block_byref_object_copy__20;
  v44 = __Block_byref_object_dispose__20;
  v45 = 0;
  v36 = 0;
  v37 = &v36;
  v38 = 0x2020000000;
  v39 = 0x7FF0000000000000;
  -[VKCMockTextProvider lines](self, "lines");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __58__VKCMockTextProvider_closestPositionToPoint_withinRange___block_invoke;
  v30[3] = &unk_1E9465B68;
  v10 = v7;
  v34 = x;
  v35 = y;
  v31 = v10;
  v32 = &v36;
  v33 = &v40;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v30);

  v11 = v41;
  if (v41[5])
  {
    v24 = 0;
    v25 = &v24;
    v26 = 0x3032000000;
    v27 = __Block_byref_object_copy__20;
    v28 = __Block_byref_object_dispose__20;
    v29 = 0;
    v37[3] = 0x7FF0000000000000;
    objc_msgSend((id)v11[5], "words");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v9;
    v16 = 3221225472;
    v17 = __58__VKCMockTextProvider_closestPositionToPoint_withinRange___block_invoke_2;
    v18 = &unk_1E9465B90;
    v22 = x;
    v23 = y;
    v19 = v10;
    v20 = &v36;
    v21 = &v24;
    objc_msgSend(v12, "enumerateObjectsUsingBlock:", &v15);

    +[VKTextPosition positionWithOffset:](VKTextPosition, "positionWithOffset:", objc_msgSend((id)v25[5], "range", v15, v16, v17, v18));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    _Block_object_dispose(&v24, 8);
  }
  else
  {
    v13 = 0;
  }

  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v40, 8);

  return v13;
}

void __58__VKCMockTextProvider_closestPositionToPoint_withinRange___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  double v11;
  double v12;
  uint64_t v13;
  id v14;

  v14 = a2;
  v4 = objc_msgSend(v14, "range");
  v6 = v5;
  v7 = objc_msgSend(*(id *)(a1 + 32), "nsRange");
  VKMClampRange(v4, v6, v7, v8);
  if (v9)
  {
    objc_msgSend(v14, "quad");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "mininumDistanceToPoint:", *(double *)(a1 + 56), *(double *)(a1 + 64));
    v12 = v11;

    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (v12 < *(double *)(v13 + 24))
    {
      *(double *)(v13 + 24) = v12;
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
    }
  }

}

void __58__VKCMockTextProvider_closestPositionToPoint_withinRange___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  double v11;
  double v12;
  uint64_t v13;
  id v14;

  v14 = a2;
  v4 = objc_msgSend(v14, "range");
  v6 = v5;
  v7 = objc_msgSend(*(id *)(a1 + 32), "nsRange");
  VKMClampRange(v4, v6, v7, v8);
  if (v9)
  {
    objc_msgSend(v14, "quad");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "mininumDistanceToPoint:", *(double *)(a1 + 56), *(double *)(a1 + 64));
    v12 = v11;

    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (v12 < *(double *)(v13 + 24))
    {
      *(double *)(v13 + 24) = v12;
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
    }
  }

}

- (CGRect)firstRectForRange:(id)a3 documentView:(id)a4 contentRect:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGRect result;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v11 = a4;
  -[VKCMockTextProvider wordForIndex:](self, "wordForIndex:", objc_msgSend(a3, "startOffset"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "quad");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "quadByConvertingFromNormalizedRectToView:contentsRect:", v11, x, y, width, height);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "boundingBox");
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;

  v23 = v16;
  v24 = v18;
  v25 = v20;
  v26 = v22;
  result.size.height = v26;
  result.size.width = v25;
  result.origin.y = v24;
  result.origin.x = v23;
  return result;
}

- (id)selectionRectsForRange:(id)a3 documentView:(id)a4 contentRect:(CGRect)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *);
  void *v21;
  VKCMockTextProvider *v22;
  id v23;
  id v24;
  id v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v11 = a3;
  v12 = a4;
  if ((objc_msgSend(v11, "isEmpty") & 1) != 0)
  {
    v13 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[VKCMockTextProvider lines](self, "lines");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = MEMORY[0x1E0C809B0];
    v19 = 3221225472;
    v20 = __71__VKCMockTextProvider_selectionRectsForRange_documentView_contentRect___block_invoke;
    v21 = &unk_1E9465C08;
    v22 = self;
    v23 = v11;
    v26 = x;
    v27 = y;
    v28 = width;
    v29 = height;
    v24 = v12;
    v25 = v14;
    v16 = v14;
    objc_msgSend(v15, "enumerateObjectsUsingBlock:", &v18);

    objc_msgSend(v16, "vk_compactMap:", &__block_literal_global_34, v18, v19, v20, v21, v22);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v13;
}

void __71__VKCMockTextProvider_selectionRectsForRange_documentView_contentRect___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  __int128 v5;
  void *v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *);
  void *v19;
  id v20;
  id v21;
  uint64_t *v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  void *v30;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  __int128 v35;
  __int128 v36;
  NSRange v37;
  NSRange v38;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "isRunningTest"))
  {
    objc_msgSend(v3, "words");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __71__VKCMockTextProvider_selectionRectsForRange_documentView_contentRect___block_invoke_2;
    v31[3] = &unk_1E9465BB8;
    v32 = *(id *)(a1 + 40);
    v33 = *(id *)(a1 + 48);
    v5 = *(_OWORD *)(a1 + 80);
    v35 = *(_OWORD *)(a1 + 64);
    v36 = v5;
    v34 = *(id *)(a1 + 56);
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v31);

    v6 = v32;
LABEL_6:

    goto LABEL_7;
  }
  v7 = objc_msgSend(*(id *)(a1 + 40), "nsRange");
  v9 = v8;
  v38.location = objc_msgSend(v3, "range");
  v38.length = v10;
  v37.location = v7;
  v37.length = v9;
  if (!VKMRangeEnclosesRange(v37, v38))
  {
    v25 = 0;
    v26 = &v25;
    v27 = 0x3032000000;
    v28 = __Block_byref_object_copy__20;
    v29 = __Block_byref_object_dispose__20;
    v30 = 0;
    objc_msgSend(v3, "words");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __71__VKCMockTextProvider_selectionRectsForRange_documentView_contentRect___block_invoke_3;
    v19 = &unk_1E9465BE0;
    v20 = *(id *)(a1 + 40);
    v14 = *(id *)(a1 + 48);
    v15 = *(_OWORD *)(a1 + 80);
    v23 = *(_OWORD *)(a1 + 64);
    v24 = v15;
    v21 = v14;
    v22 = &v25;
    objc_msgSend(v13, "enumerateObjectsUsingBlock:", &v16);

    objc_msgSend(*(id *)(a1 + 56), "vk_addNonNilObject:", v26[5], v16, v17, v18, v19);
    _Block_object_dispose(&v25, 8);
    v6 = v30;
    goto LABEL_6;
  }
  objc_msgSend(v3, "quad");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "quadByConvertingFromNormalizedRectToView:contentsRect:", *(_QWORD *)(a1 + 48), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 56), "addObject:", v12);
LABEL_7:

}

void __71__VKCMockTextProvider_selectionRectsForRange_documentView_contentRect___block_invoke_2(uint64_t a1, void *a2)
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  void *v7;
  void *v8;
  id v9;
  NSRange v10;
  NSRange v11;

  v9 = a2;
  v3 = objc_msgSend(*(id *)(a1 + 32), "nsRange");
  v5 = v4;
  v11.location = objc_msgSend(v9, "range");
  v11.length = v6;
  v10.location = v3;
  v10.length = v5;
  if (NSIntersectionRange(v10, v11).length)
  {
    objc_msgSend(v9, "quad");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "quadByConvertingFromNormalizedRectToView:contentsRect:", *(_QWORD *)(a1 + 40), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 48), "vk_addNonNilObject:", v8);
  }

}

void __71__VKCMockTextProvider_selectionRectsForRange_documentView_contentRect___block_invoke_3(uint64_t a1, void *a2)
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger length;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  NSRange v18;
  NSRange v19;

  v17 = a2;
  v3 = objc_msgSend(*(id *)(a1 + 32), "nsRange");
  v5 = v4;
  v19.location = objc_msgSend(v17, "range");
  v19.length = v6;
  v18.location = v3;
  v18.length = v5;
  length = NSIntersectionRange(v18, v19).length;
  v8 = v17;
  if (length)
  {
    objc_msgSend(v17, "quad");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "quadByConvertingFromNormalizedRectToView:contentsRect:", *(_QWORD *)(a1 + 40), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v12 = *(void **)(v11 + 40);
    if (v12)
    {
      objc_msgSend(v12, "quadFromUnionWithQuad:", v10);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v15 = *(void **)(v14 + 40);
      *(_QWORD *)(v14 + 40) = v13;
    }
    else
    {
      v16 = v10;
      v15 = *(void **)(v11 + 40);
      *(_QWORD *)(v11 + 40) = v16;
    }

    v8 = v17;
  }

}

VKTextSelectionRect *__71__VKCMockTextProvider_selectionRectsForRange_documentView_contentRect___block_invoke_4(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  _BOOL8 v4;
  _BOOL8 v5;
  id v6;
  void *v7;
  VKTextSelectionRect *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  VKTextSelectionRect *v17;

  v4 = a3 == 0;
  v5 = a3 == a4;
  v6 = a2;
  objc_msgSend(v6, "boundingBox");
  objc_msgSend(v6, "quadFromSubtractingPoint:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = [VKTextSelectionRect alloc];
  objc_msgSend(v6, "boundingBox");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  v17 = -[VKTextSelectionRect initWithRect:containsStart:containsEnd:layoutDirection:quad:](v8, "initWithRect:containsStart:containsEnd:layoutDirection:quad:", v4, v5, 1, v7, v10, v12, v14, v16);
  return v17;
}

- (id)rangeOfLineForPosition:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  -[VKCMockTextProvider lineForIndex:](self, "lineForIndex:", objc_msgSend(a3, "offset"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "range");
  +[VKTextRange rangeWithNSRange:](VKTextRange, "rangeWithNSRange:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)rangeOfWordForPosition:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  -[VKCMockTextProvider wordForIndex:](self, "wordForIndex:", objc_msgSend(a3, "offset"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "range");
  +[VKTextRange rangeWithNSRange:](VKTextRange, "rangeWithNSRange:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)smallestSelectableRangeForPosition:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v4 = a3;
  -[VKCMockTextProvider wordForIndex:](self, "wordForIndex:", objc_msgSend(v4, "offset"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && (v6 = objc_msgSend(v4, "offset"), v7 = objc_msgSend(v5, "range"), v6 != v7 + v8))
  {
    v9 = objc_msgSend(v5, "range");
    v10 = v11;
  }
  else
  {
    v9 = 0x7FFFFFFFFFFFFFFFLL;
    v10 = 0;
  }
  +[VKTextRange rangeWithNSRange:](VKTextRange, "rangeWithNSRange:", v9, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)adjustTextRangeToSelectableRange:(id)a3
{
  return a3;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
  objc_storeStrong((id *)&self->_text, a3);
}

- (BOOL)isRunningTest
{
  return self->_isRunningTest;
}

- (void)setIsRunningTest:(BOOL)a3
{
  self->_isRunningTest = a3;
}

- (NSMutableArray)lines
{
  return self->_lines;
}

- (void)setLines:(id)a3
{
  objc_storeStrong((id *)&self->_lines, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lines, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end
