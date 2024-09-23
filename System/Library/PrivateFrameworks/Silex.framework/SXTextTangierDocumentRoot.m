@implementation SXTextTangierDocumentRoot

- (SXTextTangierDocumentRoot)init
{
  void *v3;
  SXTextTangierDocumentRoot *v4;

  +[SXTemporaryObjectContext temporaryObjectContext](SXTemporaryObjectContext, "temporaryObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SXTextTangierDocumentRoot initWithContext:](self, "initWithContext:", v3);

  return v4;
}

- (SXTextTangierDocumentRoot)initWithContext:(id)a3
{
  id v4;
  SXTextTangierDocumentRoot *v5;
  uint64_t v6;
  TSSStylesheet *aStylesheet;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SXTextTangierDocumentRoot;
  v5 = -[TSKDocumentRoot initWithContext:](&v9, sel_initWithContext_, v4);
  if (v5)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x24BEB3AF0]), "initWithContext:", v4);
    aStylesheet = v5->_aStylesheet;
    v5->_aStylesheet = (TSSStylesheet *)v6;

    -[TSKDocumentRoot documentDidLoad](v5, "documentDidLoad");
  }

  return v5;
}

- (UIViewController)viewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_viewController);
}

- (void)setViewController:(id)a3
{
  objc_storeWeak((id *)&self->_viewController, a3);
}

- (TSSStylesheet)aStylesheet
{
  return self->_aStylesheet;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aStylesheet, 0);
  objc_destroyWeak((id *)&self->_viewController);
}

@end
