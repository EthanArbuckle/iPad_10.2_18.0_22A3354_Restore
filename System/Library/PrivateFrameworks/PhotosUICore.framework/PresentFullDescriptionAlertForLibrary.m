@implementation PresentFullDescriptionAlertForLibrary

void ___PresentFullDescriptionAlertForLibrary_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = ___PresentFullDescriptionAlertForLibrary_block_invoke_2;
  v5[3] = &unk_1E5148D08;
  v6 = v3;
  v7 = *(id *)(a1 + 32);
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

void ___PresentFullDescriptionAlertForLibrary_block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  +[PXGenerativeStoryFeatureEligibilityDataSource fullDescriptionWithFeatureEligibilityState:](PXGenerativeStoryFeatureEligibilityDataSource, "fullDescriptionWithFeatureEligibilityState:", *(_QWORD *)(a1 + 32));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", CFSTR("Library State"), 0, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setAttributedMessage:", v4);
  objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", CFSTR("OK"), 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addAction:", v3);

  objc_msgSend(*(id *)(a1 + 40), "presentViewController:animated:completion:", v2, 1, 0);
}

void ___PresentFullDescriptionAlertForLibrary_block_invoke_260222(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = ___PresentFullDescriptionAlertForLibrary_block_invoke_2_260223;
  v5[3] = &unk_1E5148D08;
  v6 = v3;
  v7 = *(id *)(a1 + 32);
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

void ___PresentFullDescriptionAlertForLibrary_block_invoke_2_260223(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", CFSTR("Library State"), 0, 1);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_setAttributedMessage:", *(_QWORD *)(a1 + 32));
  objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", CFSTR("OK"), 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addAction:", v2);

  objc_msgSend(*(id *)(a1 + 40), "presentViewController:animated:completion:", v3, 1, 0);
}

@end
