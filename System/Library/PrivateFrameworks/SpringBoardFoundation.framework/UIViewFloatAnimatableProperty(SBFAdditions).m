@implementation UIViewFloatAnimatableProperty(SBFAdditions)

+ (id)sbf_animatablePropertyWithProgressMilestones:()SBFAdditions block:
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  id v20;
  id v21;
  id v22;
  id location;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "count");
  v9 = 0;
  if (v7 && v8)
  {
    v10 = (void *)objc_msgSend(v6, "mutableCopy");
    v9 = objc_alloc_init(a1);
    objc_msgSend(v9, "setValue:", 0.0);
    objc_initWeak(&location, v9);
    v11 = (void *)MEMORY[0x1E0CEABB0];
    v24[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __98__UIViewFloatAnimatableProperty_SBFAdditions__sbf_animatablePropertyWithProgressMilestones_block___block_invoke;
    v19 = &unk_1E200F518;
    objc_copyWeak(&v22, &location);
    v13 = v10;
    v20 = v13;
    v14 = v7;
    v21 = v14;
    objc_msgSend(v11, "_createTransformerWithInputAnimatableProperties:presentationValueChangedCallback:", v12, &v16);

    if (objc_msgSend(v13, "containsObject:", &unk_1E203B9F8, v16, v17, v18, v19))
    {
      (*((void (**)(id, id, double, double))v14 + 2))(v14, v9, 0.0, 0.0);
      objc_msgSend(v13, "removeObject:", &unk_1E203B9F8);
    }

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);

  }
  return v9;
}

@end
