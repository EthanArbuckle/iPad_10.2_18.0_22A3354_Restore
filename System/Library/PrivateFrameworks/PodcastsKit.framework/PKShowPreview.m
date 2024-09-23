@implementation PKShowPreview

- (PKShowPreview)initWithTitle:(id)a3 storeId:(id)a4 feedUrl:(id)a5 uuid:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  PKShowPreview *v14;
  PKShowPreview *v15;
  objc_super v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)PKShowPreview;
  v14 = -[PKShowPreview init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    -[PKShowPreview setTitle:](v14, "setTitle:", v10);
    -[PKShowPreview setStoreId:](v15, "setStoreId:", v11);
    -[PKShowPreview setFeedUrl:](v15, "setFeedUrl:", v12);
    -[PKShowPreview setUuid:](v15, "setUuid:", v13);
  }

  return v15;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)storeId
{
  return self->_storeId;
}

- (void)setStoreId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)feedUrl
{
  return self->_feedUrl;
}

- (void)setFeedUrl:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_feedUrl, 0);
  objc_storeStrong((id *)&self->_storeId, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
