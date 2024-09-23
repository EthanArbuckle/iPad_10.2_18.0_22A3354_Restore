@implementation SXDocumentControllerContainer

- (void)registerDocumentController:(id)a3
{
  objc_storeStrong((id *)&self->_documentController, a3);
}

- (SXDocumentController)documentController
{
  return self->_documentController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_documentController, 0);
}

@end
