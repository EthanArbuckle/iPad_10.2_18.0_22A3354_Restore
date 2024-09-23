@implementation TUIWPService

- (TUIWPService)init
{
  TUIWPService *v2;
  TUIWPDocument *v3;
  TUIWPDocument *document;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TUIWPService;
  v2 = -[TUIWPService init](&v6, "init");
  if (v2)
  {
    v3 = objc_alloc_init(TUIWPDocument);
    document = v2->_document;
    v2->_document = v3;

  }
  return v2;
}

- (id)context
{
  return -[TUIWPDocument context](self->_document, "context");
}

- (id)stylesheet
{
  return -[TUIWPDocument stylesheet](self->_document, "stylesheet");
}

- (TUIWPDocument)document
{
  return self->_document;
}

- (void)setDocument:(id)a3
{
  objc_storeStrong((id *)&self->_document, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_document, 0);
}

@end
