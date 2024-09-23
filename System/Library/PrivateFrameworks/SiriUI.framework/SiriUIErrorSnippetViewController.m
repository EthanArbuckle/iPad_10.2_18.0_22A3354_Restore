@implementation SiriUIErrorSnippetViewController

- (SiriUIErrorSnippetViewController)initWithError:(id)a3
{
  id v5;
  SiriUIErrorSnippetViewController *v6;
  SiriUIErrorSnippetViewController *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SiriUIErrorSnippetViewController;
  v6 = -[SiriUISnippetViewController initWithNibName:bundle:](&v11, sel_initWithNibName_bundle_, 0, 0);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_error, a3);
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.SiriUI"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "siriUILocalizedStringForKey:", CFSTR("ERROR_SNIPPET_TITLE_GENERIC"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SiriUIErrorSnippetViewController setTitle:](v7, "setTitle:", v9);

  }
  return v7;
}

- (void)loadView
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x24BDF6F90]);
  -[SiriUIErrorSnippetViewController setView:](self, "setView:", v3);

}

- (id)snippet
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
}

@end
