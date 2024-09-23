@implementation NSItemProviderForUIActivityItemImageRep

void ___NSItemProviderForUIActivityItemImageRep_block_invoke(uint64_t a1, void (**a2)(_QWORD, _QWORD, _QWORD))
{
  void *v3;
  void (**v4)(_QWORD, _QWORD, _QWORD);
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "data");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id, _QWORD))a2)[2](v4, v5, 0);

}

void ___NSItemProviderForUIActivityItemImageRep_block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v3 = (void *)MEMORY[0x1E0CB35D8];
  objc_msgSend(*(id *)(a1 + 32), "extensionIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "extensionWithIdentifier:error:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "_isPhotoServiceAccessGranted"))
  {
    (*((void (**)(id, _QWORD, _QWORD))v9 + 2))(v9, *(_QWORD *)(a1 + 40), 0);
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0CB35C8];
    getALAssetsLibraryErrorDomain();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "errorWithDomain:code:userInfo:", v7, -3311, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    (*((void (**)(id, _QWORD, void *))v9 + 2))(v9, 0, v8);
  }

}

void ___NSItemProviderForUIActivityItemImageRep_block_invoke_3(uint64_t a1, void (**a2)(_QWORD, _QWORD, _QWORD))
{
  void *v3;
  void (**v4)(_QWORD, _QWORD, _QWORD);
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "thumbnail");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id, _QWORD))a2)[2](v4, v5, 0);

}

@end
