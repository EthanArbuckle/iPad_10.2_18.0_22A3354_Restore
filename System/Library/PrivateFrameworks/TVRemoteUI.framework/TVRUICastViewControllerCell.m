@implementation TVRUICastViewControllerCell

void __50___TVRUICastViewControllerCell__updateUIWithRole___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  _QWORD v6[5];
  id v7;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __50___TVRUICastViewControllerCell__updateUIWithRole___block_invoke_2;
    v6[3] = &unk_24DE2C830;
    v6[4] = WeakRetained;
    v7 = v3;
    dispatch_async(MEMORY[0x24BDAC9B8], v6);

  }
}

void __50___TVRUICastViewControllerCell__updateUIWithRole___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "imageView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setImage:", v1);

}

void __73___TVRUICastViewControllerCell_requestImageForURL_identifier_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  if (a4)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    v7 = WeakRetained;
    if (WeakRetained)
    {
      objc_msgSend(WeakRetained, "role");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "imageURLTemplate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v9, "isEqualToString:", *(_QWORD *)(a1 + 32)))
      {
        objc_msgSend(MEMORY[0x24BEBD640], "imageWithData:", v11);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

      }
      else
      {
        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      }

    }
  }

}

@end
