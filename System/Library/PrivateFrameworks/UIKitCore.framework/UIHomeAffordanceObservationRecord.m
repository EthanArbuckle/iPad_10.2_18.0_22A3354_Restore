@implementation UIHomeAffordanceObservationRecord

void __64___UIHomeAffordanceObservationRecord_appendDescriptionToStream___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  objc_class *v8;
  void *v9;
  __CFString *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  objc_class *v16;
  void *v17;
  __CFString *v18;
  id v19;
  id WeakRetained;

  v2 = objc_msgSend(*(id *)(a1 + 32), "hasSuccinctStyle");
  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 16));
    v4 = (id)objc_msgSend(v3, "appendObject:withName:");
  }
  else
  {
    if ((objc_msgSend(*(id *)(a1 + 32), "hasDebugStyle") & 1) != 0)
      return;
    v5 = *(void **)(a1 + 32);
    v6 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 16));
    if (v6)
    {
      v7 = (void *)MEMORY[0x1E0CB3940];
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", CFSTR("<%@: %p>"), v9, v6);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v10 = CFSTR("(nil)");
    }

    v11 = (id)objc_msgSend(v5, "appendObject:withName:", v10, CFSTR("observer"));
    v12 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 8), CFSTR("forLegacyViewService"));
    v13 = *(void **)(a1 + 32);
    v14 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 24));
    WeakRetained = v14;
    if (v14)
    {
      v15 = (void *)MEMORY[0x1E0CB3940];
      v16 = (objc_class *)objc_opt_class();
      NSStringFromClass(v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stringWithFormat:", CFSTR("<%@: %p>"), v17, WeakRetained);
      v18 = (__CFString *)objc_claimAutoreleasedReturnValue();

      v14 = WeakRetained;
    }
    else
    {
      v18 = CFSTR("(nil)");
    }

    v19 = (id)objc_msgSend(v13, "appendObject:withName:", v18, CFSTR("scopedWindow"));
  }

}

void __64___UIHomeAffordanceObservationRecord_appendDescriptionToStream___block_invoke_2(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  __CFString *v11;
  id v12;
  id v13;

  v2 = *(void **)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 16));
  objc_msgSend(WeakRetained, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v2, "appendObject:withName:", v4, CFSTR("observer"));

  v6 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 8), CFSTR("forLegacyViewService"));
  v7 = *(void **)(a1 + 32);
  v13 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 24));
  if (v13)
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("<%@: %p>"), v10, v13);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = CFSTR("(nil)");
  }

  v12 = (id)objc_msgSend(v7, "appendObject:withName:", v11, CFSTR("scopedWindow"));
}

@end
