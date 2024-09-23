@implementation SXDocumentProvider

- (SXDocument)document
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
