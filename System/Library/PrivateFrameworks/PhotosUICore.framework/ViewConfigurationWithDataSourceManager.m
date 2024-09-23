@implementation ViewConfigurationWithDataSourceManager

void ___ViewConfigurationWithDataSourceManager_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  void (**v6)(void *, uint64_t, _QWORD, void *);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD aBlock[4];
  id v19;

  v2 = a2;
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", 0, 0, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", CFSTR("Content Syndication Badges:\n\n"));
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = ___PXContentSyndicationReviewInfoAlertController_block_invoke;
  aBlock[3] = &unk_1E5134138;
  v19 = v4;
  v5 = v4;
  v6 = (void (**)(void *, uint64_t, _QWORD, void *))_Block_copy(aBlock);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemDarkGrayColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, -6, 0, v7);

  objc_msgSend(MEMORY[0x1E0DC3658], "systemDarkGrayColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, -5, 1, v8);

  objc_msgSend(MEMORY[0x1E0DC3658], "systemDarkGrayColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, -4, 2, v9);

  objc_msgSend(MEMORY[0x1E0DC3658], "systemDarkGrayColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, -3, 2, v10);

  objc_msgSend(MEMORY[0x1E0DC3658], "systemDarkGrayColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, -2, 3, v11);

  objc_msgSend(MEMORY[0x1E0DC3658], "systemDarkGrayColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, -1, 4, v12);

  objc_msgSend(MEMORY[0x1E0DC3658], "systemDarkRedColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, 0, 5, v13);

  objc_msgSend(MEMORY[0x1E0DC3658], "systemDarkTealColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, 1, 6, v14);

  objc_msgSend(MEMORY[0x1E0DC3658], "systemDarkGreenColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, 2, 7, v15);

  objc_msgSend(v3, "_setAttributedMessage:", v5);
  objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", CFSTR("OK"), 0, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addAction:", v16);

  v17 = v2;
  objc_msgSend(v17, "presentViewController:animated:completion:", v3, 1, 0);

}

@end
