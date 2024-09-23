@implementation PVDocumentWrapper

- (PVDocumentWrapper)initWithOZXDocument:(void *)a3 forKey:(id)a4
{
  PVDocumentWrapper *result;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PVDocumentWrapper;
  result = -[PVDocumentWrapper init](&v6, sel_init, a3, a4);
  if (result)
    result->_ozxDocument = a3;
  return result;
}

- (void)dealloc
{
  HGRenderQueue **v3;
  objc_super v4;

  if (self->_ozxDocument)
  {
    v3 = (HGRenderQueue **)PVDocumentAccessController::INSTANCE((PVDocumentAccessController *)self);
    PVDocumentAccessController::ReleaseOZXDocument(v3, self->_ozxDocument);
    self->_ozxDocument = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)PVDocumentWrapper;
  -[PVDocumentWrapper dealloc](&v4, sel_dealloc);
}

- (void)ozxDocument
{
  return self->_ozxDocument;
}

@end
