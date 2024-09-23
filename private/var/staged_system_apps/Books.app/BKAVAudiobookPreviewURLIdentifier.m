@implementation BKAVAudiobookPreviewURLIdentifier

+ (id)audiobookIdentifierWithPreviewURL:(id)a3 storeID:(id)a4 title:(id)a5 author:(id)a6 duration:(double)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;

  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  v16 = objc_msgSend(objc_alloc((Class)a1), "initWithPreviewURL:storeID:title:author:duration:", v15, v14, v13, v12, a7);

  return v16;
}

- (BKAVAudiobookPreviewURLIdentifier)initWithPreviewURL:(id)a3 storeID:(id)a4 title:(id)a5 author:(id)a6 duration:(double)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  BKAVAudiobookPreviewURLIdentifier *v17;
  BKAVAudiobookPreviewURLIdentifier *v18;
  objc_super v20;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v20.receiver = self;
  v20.super_class = (Class)BKAVAudiobookPreviewURLIdentifier;
  v17 = -[BKAVAudiobookPreviewURLIdentifier init](&v20, "init");
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_previewURL, a3);
    objc_storeStrong((id *)&v18->_storeID, a4);
    objc_storeStrong((id *)&v18->_title, a5);
    objc_storeStrong((id *)&v18->_author, a6);
    v18->_duration = a7;
  }

  return v18;
}

- (BOOL)isEqualToIdentifier:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;

  v4 = a3;
  v5 = objc_opt_class(BKAVAudiobookPreviewURLIdentifier);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKAVAudiobookPreviewURLIdentifier previewURL](self, "previewURL"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "previewURL"));
    v8 = objc_msgSend(v6, "isEqual:", v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)copy
{
  BKAVAudiobookPreviewURLIdentifier *v3;
  void *v4;

  v3 = objc_opt_new(BKAVAudiobookPreviewURLIdentifier);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKAVAudiobookPreviewURLIdentifier previewURL](self, "previewURL"));
  -[BKAVAudiobookPreviewURLIdentifier setPreviewURL:](v3, "setPreviewURL:", v4);

  return v3;
}

- (NSURL)previewURL
{
  return self->_previewURL;
}

- (void)setPreviewURL:(id)a3
{
  objc_storeStrong((id *)&self->_previewURL, a3);
}

- (NSString)storeID
{
  return self->_storeID;
}

- (void)setStoreID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)author
{
  return self->_author;
}

- (void)setAuthor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_author, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_storeID, 0);
  objc_storeStrong((id *)&self->_previewURL, 0);
}

@end
