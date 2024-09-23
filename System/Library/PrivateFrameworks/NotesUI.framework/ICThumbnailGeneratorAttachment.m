@implementation ICThumbnailGeneratorAttachment

void __80__ICThumbnailGeneratorAttachment_generateThumbnailWithConfiguration_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  id v35;

  v2 = (void *)MEMORY[0x1E0D639F0];
  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attachmentWithIdentifier:context:", v3, v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  v8 = (void *)MEMORY[0x1E0D639F0];
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "typeUTI");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = objc_msgSend(v8, "typeUTIIsPlayableMovie:", v9);

  if ((_DWORD)v8)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "media");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "mediaURL");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v11;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "note");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "identifier");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
  v17 = *(void **)(v16 + 40);
  *(_QWORD *)(v16 + 40) = v15;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "attachmentModel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "needToGeneratePreviews");

  if (v19)
  {
    +[ICAttachmentPreviewGenerator sharedGenerator](ICAttachmentPreviewGenerator, "sharedGenerator");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "generatePreviewIfNeededForAttachment:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));

  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "attachmentModel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "hasPreviews");

  if (v22)
  {
    v23 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    objc_msgSend(*(id *)(a1 + 48), "preferredSize");
    v25 = v24;
    v27 = v26;
    objc_msgSend(*(id *)(a1 + 48), "scale");
    v29 = v28;
    objc_msgSend(*(id *)(a1 + 48), "appearanceInfo");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "attachmentPreviewImageWithMinSize:scale:appearanceType:requireAppearance:", objc_msgSend(v30, "type"), 1, v25, v27, v29);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    v32 = objc_msgSend(v31, "newImageLoaderForUpdatingImageOnCompletion:", 1);
    v33 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
    v34 = *(void **)(v33 + 40);
    *(_QWORD *)(v33 + 40) = v32;

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) = objc_msgSend(v31, "scaleWhenDrawing");
  }
  objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
  v35 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "ic_refreshObject:mergeChanges:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), 0);

}

- (void)generateThumbnailWithConfiguration:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void (**v12)(_QWORD, _QWORD);
  ICThumbnailDescription *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  _QWORD v21[4];
  id v22;
  ICThumbnailDescription *v23;
  void (**v24)(_QWORD, _QWORD);
  uint64_t *v25;
  uint64_t *v26;
  _QWORD v27[4];
  id v28;
  ICThumbnailGeneratorAttachment *v29;
  id v30;
  _QWORD *v31;
  uint64_t *v32;
  uint64_t *v33;
  uint64_t *v34;
  uint64_t *v35;
  uint64_t *v36;
  _QWORD v37[5];
  id v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t);
  id v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t (*v62)(uint64_t, uint64_t);
  void (*v63)(uint64_t);
  id v64;
  _QWORD v65[4];

  v65[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "associatedObjectIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = 0;
  v60 = &v59;
  v61 = 0x3032000000;
  v62 = __Block_byref_object_copy__67;
  v63 = __Block_byref_object_dispose__67;
  v64 = 0;
  v55 = 0;
  v56 = &v55;
  v57 = 0x2020000000;
  v58 = 0;
  v49 = 0;
  v50 = &v49;
  v51 = 0x3032000000;
  v52 = __Block_byref_object_copy__67;
  v53 = __Block_byref_object_dispose__67;
  v54 = 0;
  v45 = 0;
  v46 = &v45;
  v47 = 0x2020000000;
  v48 = 0;
  v39 = 0;
  v40 = &v39;
  v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__67;
  v43 = __Block_byref_object_dispose__67;
  v44 = 0;
  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x3032000000;
  v37[3] = __Block_byref_object_copy__67;
  v37[4] = __Block_byref_object_dispose__67;
  v38 = 0;
  -[ICThumbnailGenerator managedObjectContext](self, "managedObjectContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __80__ICThumbnailGeneratorAttachment_generateThumbnailWithConfiguration_completion___block_invoke;
  v27[3] = &unk_1E5C23880;
  v31 = v37;
  v10 = v8;
  v28 = v10;
  v29 = self;
  v32 = &v45;
  v33 = &v59;
  v34 = &v39;
  v11 = v6;
  v30 = v11;
  v35 = &v49;
  v36 = &v55;
  objc_msgSend(v9, "performBlockAndWait:", v27);

  v12 = (void (**)(_QWORD, _QWORD))v7;
  v13 = -[ICThumbnailDescription initWithConfiguration:]([ICThumbnailDescription alloc], "initWithConfiguration:", v11);
  -[ICThumbnailDescription setThumbnailDecorationType:](v13, "setThumbnailDecorationType:", v46[3]);
  -[ICThumbnailDescription setImageScaling:](v13, "setImageScaling:", v56[3]);
  if (v10)
  {
    v14 = v40[5];
    if (v14)
    {
      v15 = (void *)MEMORY[0x1E0C99E60];
      v65[0] = v10;
      v65[1] = v14;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v65, 2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setWithArray:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICThumbnailDescription setAssociatedObjectIdentifiers:](v13, "setAssociatedObjectIdentifiers:", v17);

    }
  }
  v18 = (void *)v50[5];
  if (!v18 || !objc_msgSend(v18, "canLoadImage"))
  {
    v20 = v60[5];
    if (!v20)
    {
      ((void (**)(_QWORD, ICThumbnailDescription *))v12)[2](v12, v13);
      goto LABEL_12;
    }
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __80__ICThumbnailGeneratorAttachment_generateThumbnailWithConfiguration_completion___block_invoke_2;
    v21[3] = &unk_1E5C238A8;
    v25 = &v59;
    v22 = v11;
    v26 = &v45;
    v23 = v13;
    v24 = v12;
    -[ICThumbnailGeneratorAttachment generateThumbnailForMediaURL:configuration:completion:](self, "generateThumbnailForMediaURL:configuration:completion:", v20, v22, v21);

    v19 = v22;
    goto LABEL_10;
  }
  objc_msgSend((id)v50[5], "loadOrientedImage");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    -[ICThumbnailDescription setImage:](v13, "setImage:", v19);
    ((void (**)(_QWORD, ICThumbnailDescription *))v12)[2](v12, v13);
LABEL_10:

  }
LABEL_12:

  _Block_object_dispose(v37, 8);
  _Block_object_dispose(&v39, 8);

  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(&v49, 8);

  _Block_object_dispose(&v55, 8);
  _Block_object_dispose(&v59, 8);

}

void __80__ICThumbnailGeneratorAttachment_generateThumbnailWithConfiguration_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  uint8_t v7[16];

  v3 = a2;
  if (!v3)
  {
    v4 = (void *)MEMORY[0x1E0DC3870];
    v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    objc_msgSend(*(id *)(a1 + 32), "preferredSize");
    objc_msgSend(v4, "ic_fileIconForURL:withPreferredSize:", v5);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v6 = os_log_create("com.apple.notes", "Thumbnails");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_1AC7A1000, v6, OS_LOG_TYPE_INFO, "Recovered from thumbnail generation error using file icon", v7, 2u);
      }

      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 2;
    }
  }
  objc_msgSend(*(id *)(a1 + 40), "setImage:", v3);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (void)generateThumbnailForMediaURL:(id)a3 configuration:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  double v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD v21[4];
  id v22;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  objc_msgSend(v8, "scale");
  if (v10 <= 0.0)
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "configuration.scale > 0.", "-[ICThumbnailGeneratorAttachment generateThumbnailForMediaURL:configuration:completion:]", 1, 0, CFSTR("Passing invalid scale to QLThumbnailGenerationRequest"));
  v11 = objc_alloc(MEMORY[0x1E0CD32C8]);
  objc_msgSend(v8, "preferredSize");
  v13 = v12;
  v15 = v14;
  objc_msgSend(v8, "scale");
  v17 = v16;

  v18 = (void *)objc_msgSend(v11, "initWithFileAtURL:size:scale:representationTypes:", v9, -1, v13, v15, v17);
  objc_msgSend(MEMORY[0x1E0CD32D0], "sharedGenerator");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __88__ICThumbnailGeneratorAttachment_generateThumbnailForMediaURL_configuration_completion___block_invoke;
  v21[3] = &unk_1E5C238D0;
  v22 = v7;
  v20 = v7;
  objc_msgSend(v19, "generateBestRepresentationForRequest:completionHandler:", v18, v21);

}

void __88__ICThumbnailGeneratorAttachment_generateThumbnailForMediaURL_configuration_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = os_log_create("com.apple.notes", "Thumbnails");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __88__ICThumbnailGeneratorAttachment_generateThumbnailForMediaURL_configuration_completion___block_invoke_cold_1((uint64_t)v6, v7);

  }
  objc_msgSend(v5, "UIImage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __88__ICThumbnailGeneratorAttachment_generateThumbnailForMediaURL_configuration_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1AC7A1000, a2, OS_LOG_TYPE_ERROR, "Error generating thumbnail %@", (uint8_t *)&v2, 0xCu);
}

@end
