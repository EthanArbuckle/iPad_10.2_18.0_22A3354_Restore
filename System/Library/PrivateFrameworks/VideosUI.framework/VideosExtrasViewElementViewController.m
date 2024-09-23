@implementation VideosExtrasViewElementViewController

- (VideosExtrasViewElementViewController)initWithViewElement:(id)a3
{
  id v5;
  VideosExtrasViewElementViewController *v6;
  VideosExtrasViewElementViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VideosExtrasViewElementViewController;
  v6 = -[VideosExtrasElementViewController init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_viewElement, a3);

  return v7;
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VideosExtrasViewElementViewController;
  -[VideosExtrasViewElementViewController viewDidLoad](&v4, sel_viewDidLoad);
  -[VideosExtrasViewElementViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

}

- (BOOL)matchParentHeight
{
  return 0;
}

- (int64_t)preferredLayoutAttribute
{
  return 3;
}

- (IKViewElement)viewElement
{
  return self->_viewElement;
}

- (void)setViewElement:(id)a3
{
  objc_storeStrong((id *)&self->_viewElement, a3);
}

- (BOOL)embedded
{
  return self->_embedded;
}

- (void)setEmbedded:(BOOL)a3
{
  self->_embedded = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewElement, 0);
}

@end
