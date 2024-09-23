@implementation TUIWPDocument

- (TUIWPDocument)init
{
  void *v3;
  TUIWPDocument *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[TUIWPTemporaryObjectContext temporaryObjectContext](TUIWPTemporaryObjectContext, "temporaryObjectContext"));
  v4 = -[TUIWPDocument initWithContext:](self, "initWithContext:", v3);

  return v4;
}

- (TUIWPDocument)initWithContext:(id)a3
{
  id v4;
  TUIWPDocument *v5;
  TSSStylesheet *v6;
  TSSStylesheet *stylesheet;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TUIWPDocument;
  v5 = -[TUIWPDocument initWithContext:](&v9, "initWithContext:", v4);
  if (v5)
  {
    v6 = (TSSStylesheet *)objc_msgSend(objc_alloc((Class)TSSStylesheet), "initWithContext:", v4);
    stylesheet = v5->_stylesheet;
    v5->_stylesheet = v6;

    -[TUIWPDocument documentDidLoad](v5, "documentDidLoad");
  }

  return v5;
}

- (TSSStylesheet)stylesheet
{
  return self->_stylesheet;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stylesheet, 0);
}

@end
