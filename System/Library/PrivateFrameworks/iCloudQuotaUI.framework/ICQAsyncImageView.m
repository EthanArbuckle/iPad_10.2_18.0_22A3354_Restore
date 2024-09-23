@implementation ICQAsyncImageView

- (ICQAsyncImageView)initWithURL:(id)a3
{
  id v4;
  ICQAsyncImageView *v5;
  ICQAsyncImageView *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ICQAsyncImageView;
  v5 = -[ICQAsyncImageView init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[ICQAsyncImageView updateToImageFromURL:](v5, "updateToImageFromURL:", v4);

  return v6;
}

- (void)updateToImageFromURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  id v9;

  v4 = a3;
  if (v4)
  {
    v9 = v4;
    objc_msgSend(v4, "absoluteString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQAsyncImageView currentImageURL](self, "currentImageURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "absoluteString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v5, "isEqualToString:", v7);

    v4 = v9;
    if ((v8 & 1) == 0)
    {
      -[ICQAsyncImageView loadImageFromURL:](self, "loadImageFromURL:", v9);
      -[ICQAsyncImageView setCurrentImageURL:](self, "setCurrentImageURL:", v9);
      v4 = v9;
    }
  }

}

- (void)loadImageFromURL:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _ICQGetLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "absoluteString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v12 = v6;
    _os_log_impl(&dword_21F2CC000, v5, OS_LOG_TYPE_DEFAULT, "Retrieving image at url: %@", buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x24BDD1840], "requestWithURL:cachePolicy:timeoutInterval:", v4, 1, 30.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1850], "sharedSession");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __38__ICQAsyncImageView_loadImageFromURL___block_invoke;
  v10[3] = &unk_24E3F3590;
  v10[4] = self;
  objc_msgSend(v8, "dataTaskWithRequest:completionHandler:", v7, v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "resume");
}

void __38__ICQAsyncImageView_loadImageFromURL___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  _QWORD v13[5];
  id v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v9)
  {
    _ICQGetLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v9, "localizedDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v16 = v11;
      _os_log_impl(&dword_21F2CC000, v10, OS_LOG_TYPE_DEFAULT, "Error retrieving image from url: %@", buf, 0xCu);

    }
  }
  if (v7)
  {
    _ICQGetLogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21F2CC000, v12, OS_LOG_TYPE_DEFAULT, "Successfully retrieved image for async image view", buf, 2u);
    }

    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __38__ICQAsyncImageView_loadImageFromURL___block_invoke_2;
    v13[3] = &unk_24E3F34D8;
    v13[4] = *(_QWORD *)(a1 + 32);
    v14 = v7;
    dispatch_async(MEMORY[0x24BDAC9B8], v13);

  }
}

void __38__ICQAsyncImageView_loadImageFromURL___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BEBD640], "imageWithData:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setImage:", v2);

}

- (NSURL)currentImageURL
{
  return self->_currentImageURL;
}

- (void)setCurrentImageURL:(id)a3
{
  objc_storeStrong((id *)&self->_currentImageURL, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentImageURL, 0);
}

@end
