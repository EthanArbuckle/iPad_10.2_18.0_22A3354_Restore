@implementation BKPdfTocParser

- (BKPdfTocParser)initWithDocument:(CGPDFDocument *)a3
{
  BKPdfTocParser *v4;

  v4 = -[BKPdfTocParser init](self, "init");
  if (v4)
  {
    v4->_document = CGPDFDocumentRetain(a3);
    -[BKPdfTocParser parse](v4, "parse");
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  CGPDFDocumentRelease(self->_document);
  v3.receiver = self;
  v3.super_class = (Class)BKPdfTocParser;
  -[BKPdfTocParser dealloc](&v3, "dealloc");
}

- (id)tocRoot
{
  return self->_tocRoot;
}

- (void)parse
{
  CGPDFDictionary *Catalog;
  BKPdfTocEntry *v4;
  BKPdfTocEntry *v5;
  BKPdfTocEntry *tocRoot;
  BKPdfTocEntry *v7;
  CGPDFInteger v8;
  CGPDFDictionaryRef value;

  Catalog = CGPDFDocumentGetCatalog(self->_document);
  if (Catalog)
  {
    value = 0;
    if (CGPDFDictionaryGetDictionary(Catalog, "Outlines", &value))
    {
      v8 = 0;
      if (!CGPDFDictionaryGetInteger(value, "Count", &v8) || v8 >= 1)
      {
        v4 = [BKPdfTocEntry alloc];
        v5 = -[BKPdfTocEntry initWithTocParser:pdfDictionary:forDocument:parent:](v4, "initWithTocParser:pdfDictionary:forDocument:parent:", self, value, self->_document, 0);
        tocRoot = self->_tocRoot;
        self->_tocRoot = v5;

        if (!-[BKPdfTocEntry numberOfChildren](self->_tocRoot, "numberOfChildren"))
        {
          v7 = self->_tocRoot;
          self->_tocRoot = 0;

        }
      }
    }
  }
}

- (id)pageDictionaryToPageNumber
{
  NSDictionary *pageDictionaryToPageNumber;
  size_t NumberOfPages;
  id v5;
  id v6;
  uint64_t v7;
  CGPDFPage *Page;
  id v9;
  id v10;
  NSDictionary *v11;
  NSDictionary *v12;
  CGPDFDictionaryRef Dictionary;

  pageDictionaryToPageNumber = self->_pageDictionaryToPageNumber;
  if (!pageDictionaryToPageNumber)
  {
    NumberOfPages = CGPDFDocumentGetNumberOfPages(self->_document);
    v5 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", NumberOfPages);
    v6 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", NumberOfPages);
    if (NumberOfPages)
    {
      v7 = 0;
      do
      {
        Page = CGPDFDocumentGetPage(self->_document, ++v7);
        if (Page)
        {
          Dictionary = 0;
          Dictionary = CGPDFPageGetDictionary(Page);
          if (Dictionary)
          {
            v9 = objc_msgSend(objc_alloc((Class)NSValue), "initWithBytes:objCType:", &Dictionary, "^v");
            v10 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithInteger:", v7);
            objc_msgSend(v5, "addObject:", v9);
            objc_msgSend(v6, "addObject:", v10);

          }
        }
      }
      while (NumberOfPages != v7);
    }
    v11 = (NSDictionary *)objc_msgSend(objc_alloc((Class)NSDictionary), "initWithObjects:forKeys:", v6, v5);
    v12 = self->_pageDictionaryToPageNumber;
    self->_pageDictionaryToPageNumber = v11;

    pageDictionaryToPageNumber = self->_pageDictionaryToPageNumber;
  }
  return pageDictionaryToPageNumber;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pageDictionaryToPageNumber, 0);
  objc_storeStrong((id *)&self->_tocRoot, 0);
}

@end
