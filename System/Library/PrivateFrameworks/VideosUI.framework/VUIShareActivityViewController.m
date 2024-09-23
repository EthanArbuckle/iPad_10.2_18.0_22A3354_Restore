@implementation VUIShareActivityViewController

uint64_t __159__VUIShareActivityViewController_iOS_shareMediaItem_previewURLString_title_subtitle_imageURLStr_groupActivityMetadata_sourceView_sourceRect_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

void __66__VUIShareActivityViewController_iOS__prepareActivity_completion___block_invoke(id *a1)
{
  _QWORD v2[4];
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __66__VUIShareActivityViewController_iOS__prepareActivity_completion___block_invoke_2;
  v2[3] = &unk_1E9F99C18;
  v3 = a1[4];
  v4 = a1[5];
  v5 = a1[6];
  v6 = a1[7];
  v7 = a1[8];
  v8 = a1[9];
  dispatch_async(MEMORY[0x1E0C80D38], v2);

}

void __66__VUIShareActivityViewController_iOS__prepareActivity_completion___block_invoke_2(uint64_t a1)
{
  id v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0CC1208]);
  if (*(_QWORD *)(a1 + 32))
  {
    v3 = objc_alloc_init(MEMORY[0x1E0CC1180]);
    objc_msgSend(v3, "setURL:", *(_QWORD *)(a1 + 32));
    v9[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setImages:", v4);

    objc_msgSend(v2, "setHasFetchedSubresources:", 0);
  }
  objc_msgSend(*(id *)(a1 + 40), "setSpecialization:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v2, "setMetadata:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v2, "dataRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 56), "messageComposeViewController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addRichLinkData:withWebpageURL:", v5, *(_QWORD *)(a1 + 64));

      objc_msgSend(*(id *)(a1 + 56), "messageComposeViewController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setBody:", 0);

    }
  }
  v8 = *(_QWORD *)(a1 + 72);
  if (v8)
    (*(void (**)(void))(v8 + 16))();

}

void __66__VUIShareActivityViewController_iOS__prepareActivity_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v3 = a2;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __66__VUIShareActivityViewController_iOS__prepareActivity_completion___block_invoke_4;
  v8[3] = &unk_1E9F99C18;
  v4 = *(id *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(void **)(a1 + 48);
  v9 = v4;
  v10 = v5;
  v11 = v3;
  v12 = v6;
  v13 = *(id *)(a1 + 56);
  v14 = *(id *)(a1 + 64);
  v7 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v8);

}

void __66__VUIShareActivityViewController_iOS__prepareActivity_completion___block_invoke_4(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  if (v1 == *(void **)(v2 + 1328))
  {
    *(_QWORD *)(v2 + 1328) = 0;

    v8 = objc_alloc_init(MEMORY[0x1E0CC1208]);
    objc_msgSend(v8, "setMetadata:", *(_QWORD *)(a1 + 48));
    objc_msgSend(v8, "setHasFetchedSubresources:", 0);
    objc_msgSend(v8, "dataRepresentation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(*(id *)(a1 + 56), "messageComposeViewController");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addRichLinkData:withWebpageURL:", v4, *(_QWORD *)(a1 + 64));

        objc_msgSend(*(id *)(a1 + 56), "messageComposeViewController");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setBody:", 0);

      }
    }
    v7 = *(_QWORD *)(a1 + 72);
    if (v7)
      (*(void (**)(void))(v7 + 16))();

  }
}

@end
