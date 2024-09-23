@implementation ICThumbnailGeneratorNoteAttachments

- (void)generateThumbnailWithConfiguration:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  ICThumbnailDescription *v8;
  void *v9;
  uint64_t v10;
  id v11;
  ICThumbnailGeneratorAttachment *v12;
  void *v13;
  ICThumbnailGeneratorAttachment *v14;
  uint64_t v15;
  _QWORD v16[4];
  ICThumbnailDescription *v17;
  ICThumbnailGeneratorNoteAttachments *v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  ICThumbnailGeneratorNoteAttachments *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v6 = a3;
  v7 = a4;
  v8 = -[ICThumbnailDescription initWithConfiguration:]([ICThumbnailDescription alloc], "initWithConfiguration:", v6);
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__11;
  v29 = __Block_byref_object_dispose__11;
  v30 = 0;
  -[ICThumbnailGenerator managedObjectContext](self, "managedObjectContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __85__ICThumbnailGeneratorNoteAttachments_generateThumbnailWithConfiguration_completion___block_invoke;
  v21[3] = &unk_1E5C1DC18;
  v11 = v6;
  v22 = v11;
  v23 = self;
  v24 = &v25;
  objc_msgSend(v9, "performBlockAndWait:", v21);

  if (v26[5])
  {
    v12 = [ICThumbnailGeneratorAttachment alloc];
    -[ICThumbnailGenerator managedObjectContext](self, "managedObjectContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[ICThumbnailGenerator initWithManagedObjectContext:](v12, "initWithManagedObjectContext:", v13);

    v15 = v26[5];
    v16[0] = v10;
    v16[1] = 3221225472;
    v16[2] = __85__ICThumbnailGeneratorNoteAttachments_generateThumbnailWithConfiguration_completion___block_invoke_2;
    v16[3] = &unk_1E5C1EA28;
    v17 = v8;
    v18 = self;
    v19 = v11;
    v20 = v7;
    -[ICThumbnailGeneratorAttachment generateThumbnailWithConfiguration:completion:](v14, "generateThumbnailWithConfiguration:completion:", v15, v16);

  }
  else
  {
    (*((void (**)(id, ICThumbnailDescription *))v7 + 2))(v7, v8);
  }

  _Block_object_dispose(&v25, 8);
}

void __85__ICThumbnailGeneratorNoteAttachments_generateThumbnailWithConfiguration_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  ICThumbnailConfiguration *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;

  if (objc_msgSend(*(id *)(a1 + 32), "thumbnailType") == 2)
  {
    v2 = (void *)MEMORY[0x1E0D63BB8];
    objc_msgSend(*(id *)(a1 + 32), "associatedObjectIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "noteWithIdentifier:context:", v3, v4);
    v5 = (id)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (objc_msgSend(v5, "updateThumbnailAttachmentIdentifier"))
      {
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = *MEMORY[0x1E0D637A0];
        objc_msgSend(v5, "objectID");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "postNotificationName:object:", v7, v8);

        objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "ic_save");

        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = *MEMORY[0x1E0D63798];
        objc_msgSend(v5, "objectID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "postNotificationName:object:", v11, v12);

      }
      objc_msgSend(v5, "thumbnailAttachmentIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        v14 = (void *)MEMORY[0x1E0D639F0];
        objc_msgSend(v5, "thumbnailAttachmentIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "attachmentWithIdentifier:context:", v15, v16);
        v33 = (id)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v33 = 0;
      }
      objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "ic_refreshObject:mergeChanges:", v5, 0);

      goto LABEL_13;
    }
  }
  else
  {
    if (objc_msgSend(*(id *)(a1 + 32), "thumbnailType") != 3)
      return;
    v17 = (void *)MEMORY[0x1E0D639F0];
    objc_msgSend(*(id *)(a1 + 32), "associatedObjectIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "attachmentWithIdentifier:context:", v18, v19);
    v5 = (id)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v5;
      v33 = v5;
      goto LABEL_13;
    }
  }
  v33 = 0;
LABEL_13:

  if (v33)
  {
    v21 = [ICThumbnailConfiguration alloc];
    objc_msgSend(*(id *)(a1 + 32), "preferredSize");
    v23 = v22;
    v25 = v24;
    objc_msgSend(*(id *)(a1 + 32), "scale");
    v27 = v26;
    objc_msgSend(*(id *)(a1 + 32), "appearanceInfo");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = -[ICThumbnailConfiguration initForAttachment:preferredSize:scale:appearanceInfo:](v21, "initForAttachment:preferredSize:scale:appearanceInfo:", v33, v28, v23, v25, v27);
    v30 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v31 = *(void **)(v30 + 40);
    *(_QWORD *)(v30 + 40) = v29;

    objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "ic_refreshObject:mergeChanges:", v33, 0);

  }
}

- (void)postProcessThumbnail:(id)a3 configuration:(id)a4
{
  id v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  double v22;
  double v23;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "image");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "preferredSize");
  v9 = v8;
  v11 = v10;
  objc_msgSend(MEMORY[0x1E0DC3830], "defaultFormat");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scale");
  objc_msgSend(v17, "setScale:");
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3828]), "initWithSize:format:", v17, v9, v11);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __74__ICThumbnailGeneratorNoteAttachments_postProcessThumbnail_configuration___block_invoke;
  v18[3] = &unk_1E5C1EA78;
  v22 = v9;
  v23 = v11;
  v19 = v6;
  v20 = v5;
  v21 = v7;
  v13 = v7;
  v14 = v5;
  v15 = v6;
  objc_msgSend(v12, "imageWithActions:", v18);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setImage:", v16);

}

void __85__ICThumbnailGeneratorNoteAttachments_generateThumbnailWithConfiguration_completion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setImageScaling:", objc_msgSend(v6, "imageScaling"));
  objc_msgSend(*(id *)(a1 + 32), "setThumbnailDecorationType:", objc_msgSend(v6, "thumbnailDecorationType"));
  objc_msgSend(v6, "associatedObjectIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setAssociatedObjectIdentifiers:", v3);

  objc_msgSend(v6, "image");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v6, "image");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setImage:", v5);

    objc_msgSend(*(id *)(a1 + 40), "postProcessThumbnail:configuration:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

void __74__ICThumbnailGeneratorNoteAttachments_postProcessThumbnail_configuration___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGFloat v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  id v33;

  objc_msgSend(MEMORY[0x1E0DC3658], "colorNamed:", CFSTR("list_thumbnail_background_color"));
  v33 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setFill");
  UIRectFill(*(CGRect *)(a1 + 48));
  v2 = objc_msgSend(*(id *)(a1 + 32), "thumbnailDecorationType");
  v3 = *(double *)(a1 + 80);
  if (v2 == 2)
  {
    if (v3 + -20.0 >= 0.0)
      v4 = v3 + -20.0;
    else
      v4 = 0.0;
    v5 = *(double *)(a1 + 88);
    if (v5 + -20.0 >= 0.0)
      v6 = v5 + -20.0;
    else
      v6 = 0.0;
    objc_msgSend(*(id *)(a1 + 40), "size");
    v8 = v4 / v7;
    objc_msgSend(*(id *)(a1 + 40), "size");
    if (v8 >= v6 / v9)
      v10 = v6 / v9;
    else
      v10 = v8;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "size");
    v11 = *(double *)(a1 + 88);
    v13 = v3 / v12;
    objc_msgSend(*(id *)(a1 + 40), "size");
    if (v13 >= v11 / v14)
      v10 = v13;
    else
      v10 = v11 / v14;
  }
  objc_msgSend(*(id *)(a1 + 40), "size");
  v16 = v10 * v15;
  objc_msgSend(*(id *)(a1 + 40), "size");
  v18 = v10 * v17;
  v19 = CGRectGetMidX(*(CGRect *)(a1 + 48)) - v16 * 0.5;
  objc_msgSend(*(id *)(a1 + 40), "drawInRect:", v19, CGRectGetMidY(*(CGRect *)(a1 + 48)) - v18 * 0.5, v16, v18);
  if (objc_msgSend(*(id *)(a1 + 32), "thumbnailDecorationType") == 1)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:", CFSTR("attachment_thumb_video_gradient"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = *(double *)(a1 + 88);
    objc_msgSend(v20, "size");
    v23 = v21 - v22;
    v24 = *(double *)(a1 + 80);
    objc_msgSend(v20, "size");
    objc_msgSend(v20, "drawInRect:", 0.0, v23, v24, v25);
    objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:", CFSTR("attachment_thumb_video_camera_icon"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = *(double *)(a1 + 88);
    objc_msgSend(v26, "size");
    v29 = v27 - v28;
    objc_msgSend(v26, "size");
    v31 = v30;
    objc_msgSend(v26, "size");
    objc_msgSend(v26, "drawInRect:", 6.0, v29, v31, v32);

  }
}

void __74__ICThumbnailGeneratorNoteAttachments_postProcessThumbnail_configuration___block_invoke(uint64_t a1)
{
  __int128 v2;
  void *v3;
  _QWORD v4[4];
  id v5;
  id v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;

  v2 = *(_OWORD *)(a1 + 56);
  v10 = *MEMORY[0x1E0C9D538];
  v11 = v2;
  objc_msgSend(*(id *)(a1 + 32), "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __74__ICThumbnailGeneratorNoteAttachments_postProcessThumbnail_configuration___block_invoke_2;
  v4[3] = &unk_1E5C1EA50;
  v7 = v10;
  v8 = v11;
  v5 = *(id *)(a1 + 40);
  v9 = *(_OWORD *)(a1 + 56);
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v3, "performAsCurrentTraitCollection:", v4);

}

@end
