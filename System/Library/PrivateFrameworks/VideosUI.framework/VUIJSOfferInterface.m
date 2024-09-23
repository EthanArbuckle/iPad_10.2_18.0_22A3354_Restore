@implementation VUIJSOfferInterface

void __36__VUIJSOfferInterface_fetchOffers::__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "jsValueForProperty:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (*(_QWORD *)(a1 + 40))
  {
    v8[0] = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v4, "callWithArguments:", v5);

  }
  else
  {
    v7 = (id)objc_msgSend(v3, "callWithArguments:", 0);
  }
  objc_msgSend(WeakRetained, "setJSValue:forProperty:", 0, *(_QWORD *)(a1 + 32));

}

void __36__VUIJSOfferInterface_fetchOffers::__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __36__VUIJSOfferInterface_fetchOffers::__block_invoke_2;
  v9[3] = &unk_1E9F9DB28;
  objc_copyWeak(&v12, (id *)(a1 + 48));
  v10 = *(id *)(a1 + 40);
  v8 = v5;
  v11 = v8;
  objc_msgSend(v7, "evaluate:", v9);

  objc_destroyWeak(&v12);
}

void __35__VUIJSOfferInterface_clearOffers___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "jsValueForProperty:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v2, "callWithArguments:", 0);
  objc_msgSend(WeakRetained, "setJSValue:forProperty:", 0, *(_QWORD *)(a1 + 32));

}

void __35__VUIJSOfferInterface_clearOffers___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __35__VUIJSOfferInterface_clearOffers___block_invoke_2;
  v5[3] = &unk_1E9F9CBA8;
  objc_copyWeak(&v7, (id *)(a1 + 48));
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v4, "evaluate:", v5);

  objc_destroyWeak(&v7);
}

- (void)fetchOffers:(BOOL)a3 :(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id location;

  v4 = a3;
  v6 = a4;
  -[VUIJSObject appContext](self, "appContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[VUIJSObject setJSValue:forProperty:](self, "setJSValue:forProperty:", v6, v9);
  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0DC87F0], "defaultOfferManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __36__VUIJSOfferInterface_fetchOffers::__block_invoke;
  v13[3] = &unk_1E9F9DB50;
  v11 = v7;
  v14 = v11;
  objc_copyWeak(&v16, &location);
  v12 = v9;
  v15 = v12;
  objc_msgSend(v10, "fetchOffers:completion:", v4, v13);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

- (void)clearOffers:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v4 = a3;
  -[VUIJSObject appContext](self, "appContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[VUIJSObject setJSValue:forProperty:](self, "setJSValue:forProperty:", v4, v7);
  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0DC87F0], "defaultOfferManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __35__VUIJSOfferInterface_clearOffers___block_invoke;
  v11[3] = &unk_1E9F9DB00;
  v9 = v5;
  v12 = v9;
  objc_copyWeak(&v14, &location);
  v10 = v7;
  v13 = v10;
  objc_msgSend(v8, "clearOffers:", v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

- (void)saveOffer:(id)a3 :(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id location;

  v6 = a3;
  v7 = a4;
  -[VUIJSObject appContext](self, "appContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "UUIDString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[VUIJSObject setJSValue:forProperty:](self, "setJSValue:forProperty:", v7, v10);
  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0DC87F0], "defaultOfferManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __34__VUIJSOfferInterface_saveOffer::__block_invoke;
  v14[3] = &unk_1E9F9DB00;
  v12 = v8;
  v15 = v12;
  objc_copyWeak(&v17, &location);
  v13 = v10;
  v16 = v13;
  objc_msgSend(v11, "saveOffer:completionHandler:", v6, v14);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

void __34__VUIJSOfferInterface_saveOffer::__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __34__VUIJSOfferInterface_saveOffer::__block_invoke_2;
  v5[3] = &unk_1E9F9CBA8;
  objc_copyWeak(&v7, (id *)(a1 + 48));
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v4, "evaluate:", v5);

  objc_destroyWeak(&v7);
}

void __34__VUIJSOfferInterface_saveOffer::__block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "jsValueForProperty:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v2, "callWithArguments:", 0);
  objc_msgSend(WeakRetained, "setJSValue:forProperty:", 0, *(_QWORD *)(a1 + 32));

}

@end
