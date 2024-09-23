@implementation SSRequestsSectionBuilder

+ (id)supportedBundleIds
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("com.apple.people.askToBuyRequest");
  v3[1] = CFSTR("com.apple.people.screenTimeRequest");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (unint64_t)buildMaxInitiallyVisibleResults
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  unint64_t v9;
  objc_super v11;
  objc_super v12;
  _QWORD v13[4];
  id v14;

  v3 = (void *)objc_opt_new();
  -[SSSectionBuilder section](self, "section");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "results");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __59__SSRequestsSectionBuilder_buildMaxInitiallyVisibleResults__block_invoke;
  v13[3] = &unk_1E6E43EA8;
  v6 = v3;
  v14 = v6;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v13);

  v7 = (id)objc_msgSend(v6, "count");
  if (!v7)
  {
    v12.receiver = self;
    v12.super_class = (Class)SSRequestsSectionBuilder;
    v7 = -[SSSectionBuilder buildMaxInitiallyVisibleResults](&v12, sel_buildMaxInitiallyVisibleResults);
  }
  v11.receiver = self;
  v11.super_class = (Class)SSRequestsSectionBuilder;
  v8 = -[SSSectionBuilder buildMaxInitiallyVisibleResults](&v11, sel_buildMaxInitiallyVisibleResults);
  if (v7 >= v8)
    v9 = (unint64_t)v8;
  else
    v9 = (unint64_t)v7;

  return v9;
}

void __59__SSRequestsSectionBuilder_buildMaxInitiallyVisibleResults__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  id v5;

  v5 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "valueForAttribute:withType:", *MEMORY[0x1E0CA5FC0], objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "unsignedIntValue");

    if (v4 == 1)
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
  }

}

@end
