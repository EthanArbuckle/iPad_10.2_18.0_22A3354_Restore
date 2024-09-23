@implementation SiriUISnippetExtensionCardSnippetViewController

+ (void)initialize
{
  +[CRKCardSectionViewController registerCardSectionViewController](SiriUISnippetExtensionCardSectionViewController, "registerCardSectionViewController");
}

- (SiriUISnippetExtensionCardSnippetViewController)initWithSnippet:(id)a3 extension:(id)a4
{
  id v6;
  id v7;
  SiriUISnippetExtensionCardSnippetViewController *v8;
  SiriUISnippetExtensionCardSnippetViewController *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SiriUISnippetExtensionCardSnippetViewController;
  v8 = -[SiriUICardSnippetViewController initWithNibName:bundle:](&v11, sel_initWithNibName_bundle_, 0, 0);
  v9 = v8;
  if (v8)
  {
    -[SiriUISnippetExtensionCardSnippetViewController setExtension:](v8, "setExtension:", v7);
    -[SiriUISnippetExtensionCardSnippetViewController setSnippet:](v9, "setSnippet:", v6);
  }

  return v9;
}

- (void)setSnippet:(id)a3
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  SAUISnippet *v11;

  v11 = (SAUISnippet *)a3;
  if (self->_snippet != v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_storeStrong((id *)&self->_snippet, a3);
      v5 = objc_alloc(MEMORY[0x24BDD9DF0]);
      v6 = objc_alloc_init(MEMORY[0x24BDD9DC0]);
      v7 = (void *)objc_msgSend(v5, "initWithIntent:response:", v6, 0);

      objc_msgSend(v7, "_setSnippet:", v11);
      v8 = objc_alloc_init(MEMORY[0x24BE154B0]);
      objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setInteractions:", v9);

      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15460]), "initWithCard:delegate:", v8, self);
      -[SiriUICardSnippetViewController _setCardViewController:](self, "_setCardViewController:", v10);

    }
  }

}

- (id)sashItem
{
  SiriUISashItem *sashItem;
  void *v4;
  void *v5;
  SiriUISashItem *v6;
  SiriUISashItem *v7;
  objc_super v9;

  sashItem = self->_sashItem;
  if (!sashItem)
  {
    v9.receiver = self;
    v9.super_class = (Class)SiriUISnippetExtensionCardSnippetViewController;
    -[SiriUIBaseSnippetViewController sashItem](&v9, sel_sashItem);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
      v6 = v4;
    else
      v6 = -[SiriUISashItem initWithExtension:]([SiriUISashItem alloc], "initWithExtension:", self->_extension);
    v7 = self->_sashItem;
    self->_sashItem = v6;

    sashItem = self->_sashItem;
  }
  return sashItem;
}

- (id)snippet
{
  return self->_snippet;
}

- (NSExtension)extension
{
  return self->_extension;
}

- (void)setExtension:(id)a3
{
  objc_storeStrong((id *)&self->_extension, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extension, 0);
  objc_storeStrong((id *)&self->_sashItem, 0);
  objc_storeStrong((id *)&self->_snippet, 0);
}

@end
