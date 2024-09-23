@implementation UIHorizontalIndexTitleBar

id __40___UIHorizontalIndexTitleBar_commonInit__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(off_1E1679980, "estimatedDimension:", 200.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(off_1E1679980, "absoluteDimension:", 54.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(off_1E16799A8, "sizeWithWidthDimension:heightDimension:", v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(off_1E1679998, "itemWithLayoutSize:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(off_1E1679990, "horizontalGroupWithLayoutSize:subitems:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(off_1E16799A0, "sectionWithGroup:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_combinedSectionInset");
  objc_msgSend(v8, "setContentInsets:");
  objc_msgSend(v8, "setInterGroupSpacing:", 20.0);

  return v8;
}

@end
