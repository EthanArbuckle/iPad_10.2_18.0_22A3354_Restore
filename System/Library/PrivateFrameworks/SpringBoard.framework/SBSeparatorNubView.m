@implementation SBSeparatorNubView

- (id)traitCollection
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)SBSeparatorNubView;
  -[SBSeparatorNubView traitCollection](&v8, sel_traitCollection);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CEAB40];
  v9[0] = v2;
  objc_msgSend(MEMORY[0x1E0CEAB40], "traitCollectionWithUserInterfaceStyle:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "traitCollectionWithTraitsFromCollections:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
