@implementation SXURLPreviewActivity

- (SXURLPreviewActivity)initWithURLPreviewing:(id)a3 URL:(id)a4
{
  id v7;
  id v8;
  SXURLPreviewActivity *v9;
  SXURLPreviewActivity *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SXURLPreviewActivity;
  v9 = -[SXURLPreviewActivity init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_URLPreviewing, a3);
    objc_storeStrong((id *)&v10->_URL, a4);
  }

  return v10;
}

- (id)previewViewControllerForAction:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[SXURLPreviewActivity URLPreviewing](self, "URLPreviewing", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXURLPreviewActivity URL](self, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewControllerForURL:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)commitViewController:(id)a3 action:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  -[SXURLPreviewActivity URLPreviewing](self, "URLPreviewing");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[SXURLPreviewActivity URL](self, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commitViewController:URL:", v5, v6);

}

- (SXURLPreviewing)URLPreviewing
{
  return self->_URLPreviewing;
}

- (NSURL)URL
{
  return self->_URL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_URLPreviewing, 0);
}

@end
