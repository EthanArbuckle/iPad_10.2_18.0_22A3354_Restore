@implementation _UIStatusBarRegionAxisFillingLayout

+ (id)fillingLayout
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52___UIStatusBarRegionAxisFillingLayout_fillingLayout__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_MergedGlobals_1212 != -1)
    dispatch_once(&_MergedGlobals_1212, block);
  return (id)qword_1ECD80270;
}

- (id)constraintsForDisplayItems:(id)a3 layoutGuides:(id)a4 inContainerItem:(id)a5 axis:(int64_t)a6
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v17[4];
  id v18;
  id v19;
  int64_t v20;

  v8 = a5;
  v9 = (void *)MEMORY[0x1E0C99DE8];
  v10 = a3;
  objc_msgSend(v9, "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __100___UIStatusBarRegionAxisFillingLayout_constraintsForDisplayItems_layoutGuides_inContainerItem_axis___block_invoke;
  v17[3] = &unk_1E16E0658;
  v12 = v11;
  v19 = v8;
  v20 = a6;
  v18 = v12;
  v13 = v8;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v17);

  v14 = v19;
  v15 = v12;

  return v15;
}

- (BOOL)canOverflowItems
{
  return 0;
}

@end
