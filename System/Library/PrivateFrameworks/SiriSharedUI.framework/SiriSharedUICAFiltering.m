@implementation SiriSharedUICAFiltering

+ (void)applyGaussianBlurFilterToView:(id)a3
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CD2780];
  v4 = *MEMORY[0x1E0CD2C88];
  v5 = a3;
  objc_msgSend(v3, "filterWithType:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:forKeyPath:", &unk_1EA8AD9F8, *MEMORY[0x1E0CD2D90]);
  objc_msgSend(v5, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFilters:", v8);

}

@end
