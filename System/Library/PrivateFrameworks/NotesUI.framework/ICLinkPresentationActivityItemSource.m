@implementation ICLinkPresentationActivityItemSource

- (id)activityViewControllerLinkPresentationMetadata:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_class *v10;
  id v11;
  void *v12;
  void *v13;
  objc_class *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;

  v4 = a3;
  -[ICLinkPresentationActivityItemSource title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICLinkPresentationActivityItemSource detail](self, "detail");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICLinkPresentationActivityItemSource iconImage](self, "iconImage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((!v5 || !objc_msgSend(v5, "length")) && (!v6 || !objc_msgSend(v6, "length")) && !v7)
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "(title && title.length > 0) || (summary && summary.length > 0) || iconImage", "-[ICLinkPresentationActivityItemSource activityViewControllerLinkPresentationMetadata:]", 1, 0, CFSTR("No data passed to link presentation"));
  -[ICLinkPresentationActivityItemSource linkMetadata](self, "linkMetadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v26 = 0;
    v27 = &v26;
    v28 = 0x2050000000;
    v9 = (void *)getLPLinkMetadataClass_softClass;
    v29 = getLPLinkMetadataClass_softClass;
    if (!getLPLinkMetadataClass_softClass)
    {
      v21 = MEMORY[0x1E0C809B0];
      v22 = 3221225472;
      v23 = __getLPLinkMetadataClass_block_invoke;
      v24 = &unk_1E5C1DE18;
      v25 = &v26;
      __getLPLinkMetadataClass_block_invoke((uint64_t)&v21);
      v9 = (void *)v27[3];
    }
    v10 = objc_retainAutorelease(v9);
    _Block_object_dispose(&v26, 8);
    v11 = objc_alloc_init(v10);
    -[ICLinkPresentationActivityItemSource setLinkMetadata:](self, "setLinkMetadata:", v11);

  }
  -[ICLinkPresentationActivityItemSource fileMetadata](self, "fileMetadata");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    v26 = 0;
    v27 = &v26;
    v28 = 0x2050000000;
    v13 = (void *)getLPFileMetadataClass_softClass;
    v29 = getLPFileMetadataClass_softClass;
    if (!getLPFileMetadataClass_softClass)
    {
      v21 = MEMORY[0x1E0C809B0];
      v22 = 3221225472;
      v23 = __getLPFileMetadataClass_block_invoke;
      v24 = &unk_1E5C1DE18;
      v25 = &v26;
      __getLPFileMetadataClass_block_invoke((uint64_t)&v21);
      v13 = (void *)v27[3];
    }
    v14 = objc_retainAutorelease(v13);
    _Block_object_dispose(&v26, 8);
    v15 = objc_alloc_init(v14);
    -[ICLinkPresentationActivityItemSource setFileMetadata:](self, "setFileMetadata:", v15);

  }
  if (v5 && objc_msgSend(v5, "length"))
  {
    -[ICLinkPresentationActivityItemSource linkMetadata](self, "linkMetadata");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setTitle:", v5);

    -[ICLinkPresentationActivityItemSource fileMetadata](self, "fileMetadata");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setName:", v5);

  }
  if (v6 && objc_msgSend(v6, "length"))
  {
    -[ICLinkPresentationActivityItemSource linkMetadata](self, "linkMetadata");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setSummary:", v6);

  }
  -[ICLinkPresentationActivityItemSource setIconImage:](self, "setIconImage:", v7);
  -[ICLinkPresentationActivityItemSource linkMetadata](self, "linkMetadata");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)iconImage
{
  return 0;
}

- (void)setIconImage:(id)a3
{
  UIImage *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  if (a3)
  {
    v4 = (UIImage *)a3;
    v12 = (id)objc_msgSend(objc_alloc((Class)getLPImageClass()), "initWithPlatformImage:", v4);
    -[ICLinkPresentationActivityItemSource fileMetadata](self, "fileMetadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setThumbnail:", v12);

    -[ICLinkPresentationActivityItemSource fileMetadata](self, "fileMetadata");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICLinkPresentationActivityItemSource linkMetadata](self, "linkMetadata");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSpecialization:", v6);

    v8 = objc_alloc((Class)getLPImageClass());
    UIImagePNGRepresentation(v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void *)objc_msgSend(v8, "initWithData:MIMEType:", v9, CFSTR("image/png"));
    -[ICLinkPresentationActivityItemSource linkMetadata](self, "linkMetadata");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setIcon:", v10);

  }
}

- (id)title
{
  return 0;
}

- (id)detail
{
  return 0;
}

- (LPFileMetadata)fileMetadata
{
  return self->_fileMetadata;
}

- (void)setFileMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_fileMetadata, a3);
}

- (LPLinkMetadata)linkMetadata
{
  return self->_linkMetadata;
}

- (void)setLinkMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_linkMetadata, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkMetadata, 0);
  objc_storeStrong((id *)&self->_fileMetadata, 0);
}

@end
