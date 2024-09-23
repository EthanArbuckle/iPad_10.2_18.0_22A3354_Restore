@implementation ICNoteLinkPresentationActivityItemSource

- (ICNoteLinkPresentationActivityItemSource)init
{
  -[ICNoteLinkPresentationActivityItemSource doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (ICNoteLinkPresentationActivityItemSource)initWithNote:(id)a3
{
  return -[ICNoteLinkPresentationActivityItemSource initWithNote:thumbnailImage:](self, "initWithNote:thumbnailImage:", a3, 0);
}

- (ICNoteLinkPresentationActivityItemSource)initWithNote:(id)a3 thumbnailImage:(id)a4
{
  id v7;
  id v8;
  ICNoteLinkPresentationActivityItemSource *v9;
  ICNoteLinkPresentationActivityItemSource *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICNoteLinkPresentationActivityItemSource;
  v9 = -[ICNoteLinkPresentationActivityItemSource init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_note, a3);
    objc_storeStrong((id *)&v10->_thumbnailImage, a4);
  }

  return v10;
}

- (void)setThumbnailImage:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_thumbnailImage, a3);
  v5 = a3;
  -[ICLinkPresentationActivityItemSource setIconImage:](self, "setIconImage:", v5);

}

- (id)title
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__19;
  v12 = __Block_byref_object_dispose__19;
  v13 = 0;
  -[ICNoteLinkPresentationActivityItemSource note](self, "note");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__ICNoteLinkPresentationActivityItemSource_title__block_invoke;
  v7[3] = &unk_1E5C1D9D0;
  v7[4] = self;
  v7[5] = &v8;
  objc_msgSend(v4, "performBlockAndWait:", v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __49__ICNoteLinkPresentationActivityItemSource_title__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "note");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "trimmedTitle");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)detail
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__19;
  v12 = __Block_byref_object_dispose__19;
  v13 = 0;
  -[ICNoteLinkPresentationActivityItemSource note](self, "note");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__ICNoteLinkPresentationActivityItemSource_detail__block_invoke;
  v7[3] = &unk_1E5C1D9D0;
  v7[4] = self;
  v7[5] = &v8;
  objc_msgSend(v4, "performBlockAndWait:", v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __50__ICNoteLinkPresentationActivityItemSource_detail__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "note");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentInfoText");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ic_whitespaceAndNewlineCoalescedString");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (UIImage)thumbnailImage
{
  return self->_thumbnailImage;
}

- (ICSearchIndexableNote)note
{
  return (ICSearchIndexableNote *)objc_getProperty(self, a2, 32, 1);
}

- (void)setNote:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_note, 0);
  objc_storeStrong((id *)&self->_thumbnailImage, 0);
}

@end
