@implementation ICThumbnailGeneratorNote

- (ICThumbnailGeneratorNote)initWithManagedObjectContext:(id)a3
{
  ICThumbnailGeneratorNote *v3;
  NSObject *v4;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *completionQueue;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ICThumbnailGeneratorNote;
  v3 = -[ICThumbnailGenerator initWithManagedObjectContext:](&v9, sel_initWithManagedObjectContext_, a3);
  if (v3)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_USER_INITIATED, 0);
    v5 = objc_claimAutoreleasedReturnValue();

    v6 = dispatch_queue_create("com.apple.notes.thumbnail-completion-queue", v5);
    completionQueue = v3->_completionQueue;
    v3->_completionQueue = (OS_dispatch_queue *)v6;

    v3->_maximumWidth = 400.0;
    v3->_margin = 20.0;

  }
  return v3;
}

- (void)generateThumbnailWithConfiguration:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  ICThumbnailGeneratorNote *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[ICThumbnailGenerator managedObjectContext](self, "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __74__ICThumbnailGeneratorNote_generateThumbnailWithConfiguration_completion___block_invoke;
  v11[3] = &unk_1E5C20C00;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "performBlock:", v11);

}

void __74__ICThumbnailGeneratorNote_generateThumbnailWithConfiguration_completion___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;

  v2 = (void *)MEMORY[0x1E0D63BB8];
  objc_msgSend(a1[4], "associatedObjectIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "noteWithIdentifier:context:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1[5], "generateThumbnailImageWithNote:configuration:", v5, a1[4]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "completionQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__ICThumbnailGeneratorNote_generateThumbnailWithConfiguration_completion___block_invoke_2;
  block[3] = &unk_1E5C20C00;
  v10 = a1[4];
  v11 = v6;
  v12 = a1[6];
  v8 = v6;
  dispatch_async(v7, block);

}

void __74__ICThumbnailGeneratorNote_generateThumbnailWithConfiguration_completion___block_invoke_2(_QWORD *a1)
{
  ICThumbnailDescription *v2;

  v2 = -[ICThumbnailDescription initWithConfiguration:]([ICThumbnailDescription alloc], "initWithConfiguration:", a1[4]);
  -[ICThumbnailDescription setImage:](v2, "setImage:", a1[5]);
  (*(void (**)(void))(a1[6] + 16))();

}

- (id)generateThumbnailImageWithNote:(id)a3 configuration:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  ICThumbnailGeneratorNote *v17;
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "textStorage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v20 = 0;
    v21 = &v20;
    v22 = 0x3032000000;
    v23 = __Block_byref_object_copy__66;
    v24 = __Block_byref_object_dispose__66;
    v25 = 0;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __73__ICThumbnailGeneratorNote_generateThumbnailImageWithNote_configuration___block_invoke;
    v15[3] = &unk_1E5C1F0C0;
    v16 = v7;
    v17 = self;
    v18 = v6;
    v19 = &v20;
    objc_msgSend(v16, "performAsCurrentAppearance:", v15);
    v9 = (id)v21[5];

    _Block_object_dispose(&v20, 8);
  }
  else
  {
    v10 = (void *)MEMORY[0x1E0D63BB8];
    -[ICThumbnailGenerator managedObjectContext](self, "managedObjectContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v10, "newEmptyNoteInContext:", v11);

    -[ICThumbnailGeneratorNote generateThumbnailImageWithNote:configuration:](self, "generateThumbnailImageWithNote:configuration:", v12, v7);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    -[ICThumbnailGenerator managedObjectContext](self, "managedObjectContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "deleteObject:", v12);

  }
  return v9;
}

void __73__ICThumbnailGeneratorNote_generateThumbnailImageWithNote_configuration___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  ICTextContainer *v11;
  ICTextController *v12;
  ICPreviewLayoutManager *v13;
  _BOOL8 v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  ICPreviewLayoutManager *v22;
  ICTextContainer *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  ICTextContainer *v34;
  _QWORD v35[4];
  ICPreviewLayoutManager *v36;
  ICTextContainer *v37;
  uint64_t v38;
  double v39;
  double v40;
  double v41;

  objc_msgSend(*(id *)(a1 + 32), "preferredSize");
  v3 = v2;
  objc_msgSend(*(id *)(a1 + 32), "preferredSize");
  v5 = v3 / v4;
  objc_msgSend(*(id *)(a1 + 40), "maximumWidth");
  v7 = v6;
  objc_msgSend(*(id *)(a1 + 32), "preferredSize");
  if (v7 < v8)
    v7 = v8;
  objc_msgSend(*(id *)(a1 + 40), "margin");
  v10 = v7 / v5 - v9;
  v11 = -[ICTextContainer initWithSize:]([ICTextContainer alloc], "initWithSize:", v7, 1.79769313e308);
  -[ICTextContainer setInPreviewMode:](v11, "setInPreviewMode:", 1);
  objc_msgSend(*(id *)(a1 + 40), "margin");
  -[ICTextContainer setLineFragmentPadding:](v11, "setLineFragmentPadding:");
  v12 = objc_alloc_init(ICTextController);
  -[ICTTTextController setInPreviewMode:](v12, "setInPreviewMode:", 1);
  v13 = -[ICPreviewLayoutManager initWithNote:maxCharacterCount:textContainer:textController:]([ICPreviewLayoutManager alloc], "initWithNote:maxCharacterCount:textContainer:textController:", *(_QWORD *)(a1 + 48), 1600, v11, v12);
  if (objc_msgSend(MEMORY[0x1E0DC3708], "ic_isiPad"))
    v14 = objc_msgSend(*(id *)(a1 + 32), "thumbnailType") == 7
       || objc_msgSend(*(id *)(a1 + 32), "thumbnailType") == 4
       || objc_msgSend(*(id *)(a1 + 32), "thumbnailType") == 10
       || objc_msgSend(*(id *)(a1 + 32), "thumbnailType") == 11;
  else
    v14 = 0;
  -[ICPreviewLayoutManager setInsideSystemPaper:](v13, "setInsideSystemPaper:", v14);
  objc_msgSend(*(id *)(a1 + 32), "preferredSize");
  v16 = v15 / v7;
  if (v16 >= 0.1)
    v17 = v16;
  else
    v17 = 0.1;
  v18 = (void *)MEMORY[0x1E0DC3830];
  objc_msgSend(*(id *)(a1 + 32), "traitCollection");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "formatForTraitCollection:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "scale");
  objc_msgSend(v20, "setScale:");
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3828]), "initWithBounds:format:", v20, 0.0, 0.0, v7 * v17, v7 / v5 * v17);
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __73__ICThumbnailGeneratorNote_generateThumbnailImageWithNote_configuration___block_invoke_2;
  v35[3] = &unk_1E5C237E0;
  v39 = v17;
  v22 = v13;
  v36 = v22;
  v40 = v7;
  v41 = v10;
  v23 = v11;
  v24 = *(_QWORD *)(a1 + 40);
  v34 = v23;
  v37 = v23;
  v38 = v24;
  objc_msgSend(v21, "imageWithActions:", v35);
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v27 = *(void **)(v26 + 40);
  *(_QWORD *)(v26 + 40) = v25;

  objc_msgSend(*(id *)(a1 + 32), "backgroundColor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    v29 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    objc_msgSend(*(id *)(a1 + 32), "backgroundColor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "ic_imageWithBackgroundColor:", v30);
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v33 = *(void **)(v32 + 40);
    *(_QWORD *)(v32 + 40) = v31;

  }
}

uint64_t __73__ICThumbnailGeneratorNote_generateThumbnailImageWithNote_configuration___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  double v7;

  CGContextScaleCTM((CGContextRef)objc_msgSend(a2, "CGContext"), *(CGFloat *)(a1 + 56), *(CGFloat *)(a1 + 56));
  v3 = objc_msgSend(*(id *)(a1 + 32), "glyphRangeForBoundingRect:inTextContainer:", *(_QWORD *)(a1 + 40), 0.0, 0.0, *(double *)(a1 + 64), *(double *)(a1 + 72));
  v5 = v4;
  v6 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 48), "margin");
  return objc_msgSend(v6, "drawGlyphsForGlyphRange:atPoint:", v3, v5, 0.0, v7);
}

- (double)maximumWidth
{
  return self->_maximumWidth;
}

- (void)setMaximumWidth:(double)a3
{
  self->_maximumWidth = a3;
}

- (double)margin
{
  return self->_margin;
}

- (void)setMargin:(double)a3
{
  self->_margin = a3;
}

- (OS_dispatch_queue)completionQueue
{
  return self->_completionQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionQueue, 0);
}

@end
