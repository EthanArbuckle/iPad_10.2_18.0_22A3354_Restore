@implementation BCAppIntentsAssetViewControllerInfo

- (BCAppIntentsAssetViewControllerInfo)init
{
  return -[BCAppIntentsAssetViewControllerInfo initWithAssetID:title:author:supportsTheming:](self, "initWithAssetID:title:author:supportsTheming:", 0, 0, 0, 0);
}

- (BCAppIntentsAssetViewControllerInfo)initWithAssetID:(id)a3 title:(id)a4 author:(id)a5 supportsTheming:(BOOL)a6
{
  id v10;
  id v11;
  id v12;
  BCAppIntentsAssetViewControllerInfo *v13;
  BCAppIntentsAssetViewControllerInfo *v14;
  NSString *v15;
  NSString *assetID;
  NSString *v17;
  NSString *title;
  NSString *v19;
  NSString *author;
  objc_super v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v22.receiver = self;
  v22.super_class = (Class)BCAppIntentsAssetViewControllerInfo;
  v13 = -[BCAppIntentsAssetViewControllerInfo init](&v22, "init");
  v14 = v13;
  if (v13)
  {
    v13->_supportsTheming = a6;
    v15 = (NSString *)objc_msgSend(v10, "copy");
    assetID = v14->_assetID;
    v14->_assetID = v15;

    v17 = (NSString *)objc_msgSend(v11, "copy");
    title = v14->_title;
    v14->_title = v17;

    v19 = (NSString *)objc_msgSend(v12, "copy");
    author = v14->_author;
    v14->_author = v19;

  }
  return v14;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  unsigned int v10;
  unsigned __int8 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  void *v28;
  void *v29;
  void *v30;

  v6 = a3;
  v7 = objc_opt_class(BCAppIntentsAssetViewControllerInfo);
  v8 = BUDynamicCast(v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  if (v9)
  {
    v10 = -[BCAppIntentsAssetViewControllerInfo supportsTheming](self, "supportsTheming");
    if (v10 == objc_msgSend(v9, "supportsTheming"))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[BCAppIntentsAssetViewControllerInfo assetID](self, "assetID"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "assetID"));
      if (v12 != v13)
      {
        v3 = (void *)objc_claimAutoreleasedReturnValue(-[BCAppIntentsAssetViewControllerInfo assetID](self, "assetID"));
        v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "assetID"));
        if (!objc_msgSend(v3, "isEqualToString:", v4))
        {
          v11 = 0;
          goto LABEL_17;
        }
      }
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[BCAppIntentsAssetViewControllerInfo title](self, "title"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "title"));
      if (v14 != v15)
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[BCAppIntentsAssetViewControllerInfo title](self, "title"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "title"));
        if (!objc_msgSend(v16, "isEqualToString:", v17))
        {
          v11 = 0;
          goto LABEL_15;
        }
        v29 = v17;
        v30 = v16;
      }
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[BCAppIntentsAssetViewControllerInfo author](self, "author"));
      v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "author"));
      if (v18 == (void *)v19)
      {

        v11 = 1;
      }
      else
      {
        v20 = (void *)v19;
        v28 = v3;
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[BCAppIntentsAssetViewControllerInfo author](self, "author"));
        v27 = v14;
        v22 = v13;
        v23 = v12;
        v24 = v4;
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "author"));
        v11 = objc_msgSend(v21, "isEqualToString:", v25);

        v4 = v24;
        v12 = v23;
        v13 = v22;
        v14 = v27;

        v3 = v28;
      }
      v17 = v29;
      v16 = v30;
      if (v14 == v15)
      {
LABEL_16:

        if (v12 == v13)
        {
LABEL_18:

          goto LABEL_19;
        }
LABEL_17:

        goto LABEL_18;
      }
LABEL_15:

      goto LABEL_16;
    }
  }
  v11 = 0;
LABEL_19:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  _QWORD *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v6 = v5;
  if (v5)
  {
    *((_BYTE *)v5 + 8) = self->_supportsTheming;
    v7 = -[NSString copyWithZone:](self->_assetID, "copyWithZone:", a3);
    v8 = (void *)v6[2];
    v6[2] = v7;

    v9 = -[NSString copyWithZone:](self->_title, "copyWithZone:", a3);
    v10 = (void *)v6[3];
    v6[3] = v9;

    v11 = -[NSString copyWithZone:](self->_author, "copyWithZone:", a3);
    v12 = (void *)v6[4];
    v6[4] = v11;

  }
  return v6;
}

- (BOOL)supportsTheming
{
  return self->_supportsTheming;
}

- (void)setSupportsTheming:(BOOL)a3
{
  self->_supportsTheming = a3;
}

- (NSString)assetID
{
  return self->_assetID;
}

- (void)setAssetID:(id)a3
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_author, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_assetID, 0);
}

@end
