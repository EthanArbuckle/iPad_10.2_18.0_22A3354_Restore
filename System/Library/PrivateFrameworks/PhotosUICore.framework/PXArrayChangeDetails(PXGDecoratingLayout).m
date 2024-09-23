@implementation PXArrayChangeDetails(PXGDecoratingLayout)

- (id)changeDetailsShiftedBy:()PXGDecoratingLayout scaledBy:
{
  id v7;
  id v8;
  void (**v9)(void *, void *);
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  const __CFArray *v20;
  __CFArray *v21;
  CFIndex i;
  const void *ValueAtIndex;
  uint64_t v24;
  uint64_t v25;
  id v26;
  void *v28;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  _QWORD aBlock[4];
  id v36;
  uint64_t v37;
  uint64_t v38;

  if (a4 < 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXGDecoratingLayout.m"), 1109, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("scale >= 0"));

  }
  else if (!a4)
  {
    objc_msgSend((id)objc_opt_class(), "changeDetailsWithNoChanges");
    v26 = (id)objc_claimAutoreleasedReturnValue();
    return v26;
  }
  if ((objc_msgSend(a1, "hasIncrementalChanges") & 1) == 0)
  {
    v26 = a1;
    return v26;
  }
  v7 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __77__PXArrayChangeDetails_PXGDecoratingLayout__changeDetailsShiftedBy_scaledBy___block_invoke;
  aBlock[3] = &unk_1E51365C0;
  v8 = v7;
  v36 = v8;
  v37 = a4;
  v38 = a3;
  v9 = (void (**)(void *, void *))_Block_copy(aBlock);
  objc_msgSend(a1, "removedIndexes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2](v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "insertedIndexes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2](v9, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "movesToIndexes");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2](v9, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "changedIndexes");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2](v9, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(a1, "hasMoves"))
  {
    v34 = v15;
    objc_msgSend(a1, "movesToIndexes");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "count");

    v20 = (const __CFArray *)objc_msgSend(a1, "movesFromIndexes");
    v21 = (__CFArray *)PXCreateMutableIntegerArrayRef();
    if (v19 >= 1)
    {
      v31 = v13;
      v32 = v11;
      v33 = v8;
      for (i = 0; i != v19; ++i)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v20, i);
        if (a4 >= 1)
        {
          v24 = ((_QWORD)ValueAtIndex + a3) * a4;
          v25 = a4;
          do
          {
            CFArrayAppendValue(v21, (const void *)v24++);
            --v25;
          }
          while (v25);
        }
      }
      v11 = v32;
      v8 = v33;
      v13 = v31;
    }
    v15 = v34;
  }
  else
  {
    v21 = 0;
  }
  v28 = (void *)objc_msgSend(objc_alloc((Class)off_1E50B1608), "initWithIncrementalChangeDetailsRemovedIndexes:insertedIndexes:movesToIndexes:movesFromIndexes:changedIndexes:", v11, v13, v15, v21, v17);
  if (v21)
    CFRelease(v21);

  return v28;
}

@end
