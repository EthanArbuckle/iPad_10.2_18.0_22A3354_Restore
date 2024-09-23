@implementation AEPdfCacheObject

- (AEPdfCacheObject)initWithPdfDocument:(id)a3
{
  id v5;
  AEPdfCacheObject *v6;
  AEPdfCacheObject *v7;

  v5 = a3;
  v6 = -[AEPdfCacheObject init](self, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_document, a3);

  return v7;
}

- (NSUndoManager)pdfUndoManager
{
  NSUndoManager *pdfUndoManager;
  NSUndoManager *v4;
  NSUndoManager *v5;

  pdfUndoManager = self->_pdfUndoManager;
  if (!pdfUndoManager)
  {
    v4 = objc_opt_new(NSUndoManager);
    v5 = self->_pdfUndoManager;
    self->_pdfUndoManager = v4;

    pdfUndoManager = self->_pdfUndoManager;
  }
  return pdfUndoManager;
}

- (PDFDocument)document
{
  return self->_document;
}

- (void)setDocument:(id)a3
{
  objc_storeStrong((id *)&self->_document, a3);
}

- (void)setPdfUndoManager:(id)a3
{
  objc_storeStrong((id *)&self->_pdfUndoManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pdfUndoManager, 0);
  objc_storeStrong((id *)&self->_document, 0);
}

@end
