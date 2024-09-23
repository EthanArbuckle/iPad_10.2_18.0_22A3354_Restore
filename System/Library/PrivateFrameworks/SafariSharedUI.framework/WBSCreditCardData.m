@implementation WBSCreditCardData

void __88__WBSCreditCardData_SafariSharedUIExtras__virtualCardArtworkWithSize_completionHandler___block_invoke(id *a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id location;

  v3 = a2;
  objc_initWeak(&location, a1[4]);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __88__WBSCreditCardData_SafariSharedUIExtras__virtualCardArtworkWithSize_completionHandler___block_invoke_2;
  v5[3] = &unk_1E5442470;
  objc_copyWeak(&v10, &location);
  v6 = a1[5];
  v7 = v3;
  v8 = a1[6];
  v9 = a1[7];
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __88__WBSCreditCardData_SafariSharedUIExtras__virtualCardArtworkWithSize_completionHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

@end
