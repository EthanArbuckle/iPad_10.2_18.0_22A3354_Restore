@implementation SUStockLinkPresentationSource

- (SUStockLinkPresentationSource)initWithStockSymbol:(id)a3 name:(id)a4 url:(id)a5
{
  id v9;
  id v10;
  id v11;
  SUStockLinkPresentationSource *v12;
  SUStockLinkPresentationSource *v13;
  void *v14;
  void *v15;
  UIImage *v16;
  id v17;
  void *v18;
  uint64_t v19;
  LPImage *linkPresentationImage;
  objc_super v22;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v22.receiver = self;
  v22.super_class = (Class)SUStockLinkPresentationSource;
  v12 = -[SUStockLinkPresentationSource init](&v22, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_stockSymbol, a3);
    objc_storeStrong((id *)&v13->_stockName, a4);
    objc_storeStrong((id *)&v13->_stockURL, a5);
    v14 = (void *)MEMORY[0x1E0DC3870];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "imageNamed:inBundle:withConfiguration:", CFSTR("app-icon"), v15, 0);
    v16 = (UIImage *)objc_claimAutoreleasedReturnValue();

    v17 = objc_alloc(MEMORY[0x1E0CC1178]);
    UIImagePNGRepresentation(v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v17, "initWithData:MIMEType:", v18, CFSTR("image/png"));
    linkPresentationImage = v13->_linkPresentationImage;
    v13->_linkPresentationImage = (LPImage *)v19;

  }
  return v13;
}

- (id)activityViewControllerLinkPresentationMetadata:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = objc_alloc_init(MEMORY[0x1E0CC11A8]);
  -[SUStockLinkPresentationSource stockURL](self, "stockURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOriginalURL:", v5);

  -[SUStockLinkPresentationSource stockURL](self, "stockURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setURL:", v6);

  v7 = objc_alloc_init(MEMORY[0x1E0CC1220]);
  v8 = (void *)MEMORY[0x1E0CB3940];
  -[SUStockLinkPresentationSource stockSymbol](self, "stockSymbol");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUStockLinkPresentationSource stockName](self, "stockName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%@ · %@"), v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCombinedTitle:", v11);

  -[SUStockLinkPresentationSource stockSymbol](self, "stockSymbol");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTitle:", v12);

  -[SUStockLinkPresentationSource stockName](self, "stockName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSubtitle:", v13);

  objc_msgSend(v7, "setFootnote:", CFSTR("Stocks"));
  -[SUStockLinkPresentationSource linkPresentationImage](self, "linkPresentationImage");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setIcon:", v14);

  objc_msgSend(v4, "setSpecialization:", v7);
  return v4;
}

- (NSString)stockSymbol
{
  return self->_stockSymbol;
}

- (NSString)stockName
{
  return self->_stockName;
}

- (NSURL)stockURL
{
  return self->_stockURL;
}

- (LPImage)linkPresentationImage
{
  return self->_linkPresentationImage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkPresentationImage, 0);
  objc_storeStrong((id *)&self->_stockURL, 0);
  objc_storeStrong((id *)&self->_stockName, 0);
  objc_storeStrong((id *)&self->_stockSymbol, 0);
}

@end
