@implementation PXContentSyndicationReviewInfoAlertController

void ___PXContentSyndicationReviewInfoAlertController_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v6 = (objc_class *)MEMORY[0x1E0CB3498];
  v7 = a4;
  v8 = [v6 alloc];
  v9 = (void *)MEMORY[0x1E0CB3940];
  PHAssetSyndicationEligibilityDescription();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("%lu: \t%@\n"), a3, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *MEMORY[0x1E0DC1140];
  v15[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v8, "initWithString:attributes:", v11, v12);

  objc_msgSend(*(id *)(a1 + 32), "appendAttributedString:", v13);
}

@end
