@implementation TVMonogramAppleAccountImageGenerator

void __126___TVMonogramAppleAccountImageGenerator_loadImageForURL_scaleToSize_cropToFit_imageDirection_requestLoader_completionHandler___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  __int128 v14;
  _QWORD v15[4];
  __int128 v16;

  if ((objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "isCancelled") & 1) == 0)
  {
    v2 = objc_alloc_init(MEMORY[0x24BE04D48]);
    v3 = v2;
    if (v2)
    {
      objc_msgSend(v2, "setMonogramType:", 1);
      objc_msgSend(v3, "setPictureDiameter:", *(double *)(a1 + 56));
      v4 = objc_alloc_init(MEMORY[0x24BE04998]);
      v5 = (void *)objc_msgSend(*(id *)(a1 + 32), "copyQueryStringDictionaryWithUnescapedValues:", 1);
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("firstName"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setFirstName:", v6);

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("lastName"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setLastName:", v7);

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("email"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setAppleID:", v8);

      v9 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("dsid"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "numberWithLongLong:", objc_msgSend(v10, "longLongValue"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setPersonID:", v11);

      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __126___TVMonogramAppleAccountImageGenerator_loadImageForURL_scaleToSize_cropToFit_imageDirection_requestLoader_completionHandler___block_invoke_2;
      v15[3] = &unk_24EB88158;
      v14 = *(_OWORD *)(a1 + 40);
      v12 = (id)v14;
      v16 = v14;
      objc_msgSend(v3, "fetchProfilePictureForFamilyMember:completion:", v4, v15);

    }
    else
    {
      v13 = *(_QWORD *)(a1 + 40);
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("TVMLKitErrorDomain"), 11, 0);
      v4 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, id))(v13 + 16))(v13, 0, 0, 0, 0, v4);
    }

  }
}

void __126___TVMonogramAppleAccountImageGenerator_loadImageForURL_scaleToSize_cropToFit_imageDirection_requestLoader_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  TVImage *v7;
  id v8;
  id v9;

  v9 = a2;
  v5 = a3;
  if ((objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "isCancelled") & 1) == 0)
  {
    v6 = objc_retainAutorelease(v9);
    if (objc_msgSend(v6, "CGImage"))
      v7 = -[TVImage initWithCGImageRef:preserveAlpha:]([TVImage alloc], "initWithCGImageRef:preserveAlpha:", objc_msgSend(objc_retainAutorelease(v6), "CGImage"), 1);
    else
      v7 = 0;
    if (v7)
      v8 = 0;
    else
      v8 = v5;
    (*(void (**)(_QWORD, TVImage *, _QWORD, _QWORD, uint64_t, id))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v7, 0, 0, 2, v8);

  }
}

@end
