@implementation _NSTextLayoutFragmentStorage

- (void)setTextLayoutFragments:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __55___NSTextLayoutFragmentStorage_setTextLayoutFragments___block_invoke;
  v3[3] = &unk_1E2604878;
  v3[4] = self;
  objc_msgSend(a3, "enumerateObjectsUsingBlock:", v3);
}

- (BOOL)revalidateLayoutFragmentRangeForLocation:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  _QWORD v8[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v4 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__5;
  v25 = __Block_byref_object_dispose__5;
  v26 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__5;
  v19 = __Block_byref_object_dispose__5;
  v20 = 0;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__5;
  v13 = __Block_byref_object_dispose__5;
  v14 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __73___NSTextLayoutFragmentStorage_revalidateLayoutFragmentRangeForLocation___block_invoke;
  v8[3] = &unk_1E26048C8;
  v8[4] = &v21;
  v8[5] = &v15;
  v8[6] = &v9;
  v5 = -[_NSTextRunStorage enumerateObjectsFromLocation:options:usingBlock:](self, "enumerateObjectsFromLocation:options:usingBlock:", v4, 0, v8);
  v6 = v22[5];
  if (v6)
  {
    -[_NSTextRunStorage invalidateElementsInRange:delta:](self, "invalidateElementsInRange:delta:", v10[5], 0);
    -[_NSTextRunStorage setObject:forRange:](self, "setObject:forRange:", v22[5], v16[5]);
  }
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  return v6 != 0;
}

- (id)enumerateTextLayoutFragmentFromLocation:(id)a3 options:(int64_t)a4 usingBlock:(id)a5
{
  id v8;
  id v9;
  int64_t v10;
  int64_t v11;
  BOOL v12;
  id v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  BOOL v18;
  BOOL v19;

  v8 = a5;
  v9 = a3;
  v10 = -[_NSTextLayoutFragmentStorage offsetDeltaForLastTextLayoutFragment](self, "offsetDeltaForLastTextLayoutFragment");
  v16[0] = MEMORY[0x1E0C809B0];
  v11 = a4 | 2;
  if (v10)
    v11 = a4;
  v16[1] = 3221225472;
  v16[2] = __91___NSTextLayoutFragmentStorage_enumerateTextLayoutFragmentFromLocation_options_usingBlock___block_invoke;
  v16[3] = &unk_1E2604800;
  v12 = (a4 & 2) == 0;
  v17 = v8;
  if ((a4 & 2) == 0)
    a4 = v11;
  v18 = v12;
  v19 = v10 != 0;
  v13 = v8;
  -[_NSTextRunStorage enumerateObjectsFromLocation:options:usingBlock:](self, "enumerateObjectsFromLocation:options:usingBlock:", v9, a4, v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (int64_t)offsetDeltaForLastTextLayoutFragment
{
  id v2;
  int64_t v3;
  objc_super v5;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v6[1] = 3221225472;
  v6[2] = __68___NSTextLayoutFragmentStorage_offsetDeltaForLastTextLayoutFragment__block_invoke;
  v6[3] = &unk_1E26048A0;
  v6[4] = self;
  v6[5] = &v7;
  v5.receiver = self;
  v5.super_class = (Class)_NSTextLayoutFragmentStorage;
  v6[0] = MEMORY[0x1E0C809B0];
  v2 = -[_NSTextRunStorage enumerateObjectsFromLocation:options:usingBlock:](&v5, sel_enumerateObjectsFromLocation_options_usingBlock_, 0, 1, v6);
  v3 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v3;
}

- (id)enumerateTextLayoutFragmentInTextRange:(id)a3 options:(int64_t)a4 usingBlock:(id)a5
{
  id v8;
  id v9;
  int64_t v10;
  void *v11;
  void *v12;
  int64_t v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v19[4];
  id v20;
  id v21;
  uint64_t *v22;
  char v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v8 = a3;
  v9 = a5;
  v10 = -[_NSTextLayoutFragmentStorage offsetDeltaForLastTextLayoutFragment](self, "offsetDeltaForLastTextLayoutFragment");
  if ((a4 & 1) != 0)
  {
    objc_msgSend(v8, "endLocation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "location");
  }
  else
  {
    objc_msgSend(v8, "location");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "endLocation");
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__5;
  v28 = __Block_byref_object_dispose__5;
  v29 = 0;
  if (v10)
    v13 = a4;
  else
    v13 = a4 | 2;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __90___NSTextLayoutFragmentStorage_enumerateTextLayoutFragmentInTextRange_options_usingBlock___block_invoke;
  v19[3] = &unk_1E26047D8;
  v22 = &v24;
  v23 = a4 & 1;
  v14 = v12;
  v20 = v14;
  v15 = v9;
  v21 = v15;
  v16 = -[_NSTextRunStorage enumerateObjectsFromLocation:options:usingBlock:](self, "enumerateObjectsFromLocation:options:usingBlock:", v11, v13, v19);
  v17 = (id)v25[5];

  _Block_object_dispose(&v24, 8);
  return v17;
}

- (void)invalidateTextLayoutFragmentsInTextRange:(id)a3 adjustTextRange:(BOOL)a4
{
  _BOOL4 v4;
  int64_t v6;
  id v7;

  v4 = a4;
  v7 = a3;
  if (v4)
    v6 = -[_NSTextLayoutFragmentStorage offsetDeltaForLastTextLayoutFragment](self, "offsetDeltaForLastTextLayoutFragment");
  else
    v6 = 0;
  -[_NSTextLayoutFragmentStorage invalidateTextLayoutFragmentsInTextRange:delta:](self, "invalidateTextLayoutFragmentsInTextRange:delta:", v7, v6);

}

- (void)invalidateTextLayoutFragmentsInTextRange:(id)a3 delta:(int64_t)a4
{
  void *v6;
  void *v7;

  -[_NSTextLayoutFragmentStorage adjustedTextRangeWithTextRange:adjustment:](self, "adjustedTextRangeWithTextRange:adjustment:", a3, 6);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = v6;
    -[_NSTextRunStorage invalidateElementsInRange:delta:](self, "invalidateElementsInRange:delta:", v6, a4);
    v6 = v7;
  }

}

- (id)adjustedTextRangeWithTextRange:(id)a3 adjustment:(unint64_t)a4
{
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  id location;

  v6 = a3;
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __74___NSTextLayoutFragmentStorage_adjustedTextRangeWithTextRange_adjustment___block_invoke;
  v9[3] = &unk_1E26047B0;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v6, "textRangeWithAdjustment:rangeProvider:", a4, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

  return v7;
}

- (id)textLayoutFragmentForTextLocation:(id)a3 allowsTrailingEdge:(BOOL)a4
{
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v14[4];
  id v15;
  uint64_t *v16;
  BOOL v17;
  _QWORD v18[4];
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v6 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__5;
  v25 = __Block_byref_object_dispose__5;
  v26 = 0;
  v7 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __85___NSTextLayoutFragmentStorage_textLayoutFragmentForTextLocation_allowsTrailingEdge___block_invoke;
  v18[3] = &unk_1E2604828;
  v8 = v6;
  v19 = v8;
  v20 = &v21;
  v9 = -[_NSTextLayoutFragmentStorage enumerateTextLayoutFragmentFromLocation:options:usingBlock:](self, "enumerateTextLayoutFragmentFromLocation:options:usingBlock:", v8, 0, v18);
  v10 = (void *)v22[5];
  if (!v10)
  {
    v14[0] = v7;
    v14[1] = 3221225472;
    v14[2] = __85___NSTextLayoutFragmentStorage_textLayoutFragmentForTextLocation_allowsTrailingEdge___block_invoke_2;
    v14[3] = &unk_1E2604850;
    v17 = a4;
    v15 = v8;
    v16 = &v21;
    v11 = -[_NSTextLayoutFragmentStorage enumerateTextLayoutFragmentFromLocation:options:usingBlock:](self, "enumerateTextLayoutFragmentFromLocation:options:usingBlock:", v15, 1, v14);

    v10 = (void *)v22[5];
  }
  v12 = v10;

  _Block_object_dispose(&v21, 8);
  return v12;
}

@end
