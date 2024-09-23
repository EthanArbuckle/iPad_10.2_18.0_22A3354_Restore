@implementation UINSItemProviderImageLoader

void __50___UINSItemProviderImageLoader__really_loadImage___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  v11 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "_setProgress:", 0);
  if (v11)
  {
    +[UIImage imageWithData:](UIImage, "imageWithData:", v11);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 16);
    *(_QWORD *)(v7 + 16) = v6;
  }
  else
  {
    v9 = objc_msgSend(v5, "copy");
    v10 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v10 + 24);
    *(_QWORD *)(v10 + 24) = v9;
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

@end
