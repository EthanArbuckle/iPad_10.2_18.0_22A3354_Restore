@implementation ICMarkupUtilities

void __100__ICMarkupUtilities_UI__dataToEditForAttachment_includeMarkupModelData_embedMarkupModelDataInImage___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;

  objc_msgSend(*(id *)(a1 + 32), "media");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v20, "isPasswordProtected"))
    objc_msgSend(v20, "decryptedData");
  else
    objc_msgSend(v20, "data");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    v5 = (int)objc_msgSend(*(id *)(a1 + 32), "orientation");
    if ((objc_msgSend(*(id *)(a1 + 32), "shouldEmbedMarkupDataInMedia") & 1) != 0 || !*(_BYTE *)(a1 + 56))
    {
      v6 = 0;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "markupModelData");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(*(id *)(a1 + 32), "croppingQuad");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((_DWORD)v5 || objc_msgSend(*(id *)(a1 + 32), "imageFilterType") || v7)
    {
      v8 = (void *)MEMORY[0x1AF445E78]();
      objc_msgSend(MEMORY[0x1E0DC3870], "ic_imageWithData:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        objc_msgSend(MEMORY[0x1E0CEE5A0], "perspectiveCorrectedImageFromImage:normalizedImageQuad:", v9, v7);
        v10 = objc_claimAutoreleasedReturnValue();

        v9 = (void *)v10;
      }
      objc_msgSend(MEMORY[0x1E0CEE5A0], "filteredImage:orientation:imageFilterType:", v9, 0, objc_msgSend(*(id *)(a1 + 32), "imageFilterType"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CEE5A0], "imageWithRGBColorspaceFromImage:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if ((_DWORD)v5)
      {
        objc_msgSend(MEMORY[0x1E0DC3870], "ic_orientedImageFromImage:toOrientation:", v12, v5);
        v13 = objc_claimAutoreleasedReturnValue();

        v12 = (void *)v13;
      }
      objc_msgSend(v12, "ic_JPEGData");
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v16 = *(void **)(v15 + 40);
      *(_QWORD *)(v15 + 40) = v14;

      objc_autoreleasePoolPop(v8);
    }
    if (objc_msgSend(v6, "length"))
    {
      objc_msgSend(*(id *)(a1 + 48), "imageDataWithMarkupModelData:sourceImageData:embedData:", v6, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(unsigned __int8 *)(a1 + 57));
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v19 = *(void **)(v18 + 40);
      *(_QWORD *)(v18 + 40) = v17;

    }
  }

}

@end
