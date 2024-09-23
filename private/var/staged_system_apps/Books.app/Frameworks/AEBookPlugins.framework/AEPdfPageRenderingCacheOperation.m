@implementation AEPdfPageRenderingCacheOperation

- (AEPdfPageRenderingCacheOperation)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AEPdfPageRenderingCacheOperation;
  return -[AEPdfPageRenderingCacheOperation initWithOptions:](&v3, "initWithOptions:", 0);
}

- (id)callbackInvocationWithImage:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AEPdfPageRenderingCacheOperation renderingCacheCallbackInvocationWithImage:pageNumber:](self, "renderingCacheCallbackInvocationWithImage:pageNumber:", v4, -[AEPdfPageRenderingCacheOperation pageNumber](self, "pageNumber")));

  return v5;
}

- (id)generateImage:(CGSize)a3
{
  unint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = +[BKPDFModernBookViewController pageIndexForPageNumber:](BKPDFModernBookViewController, "pageIndexForPageNumber:", -[AEPdfPageRenderingCacheOperation pageNumber](self, "pageNumber", a3.width, a3.height));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[AEPdfCache sharedInstance](AEPdfCache, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AEPdfPageRenderingCacheOperation url](self, "url"));
  v7 = objc_msgSend(v5, "copyCacheObjectForURL:", v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "document"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[AEPdfPageRenderingCacheOperation imageCache](self, "imageCache"));
  objc_msgSend(v9, "primaryImageSize");
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[AEPDFPlugin generateImageForDocument:pageIndex:size:](AEPDFPlugin, "generateImageForDocument:pageIndex:size:", v8, v4));

  if (v10 && objc_msgSend(v8, "isLocked"))
    -[AEPdfPageRenderingCacheOperation setSerializeFormat:](self, "setSerializeFormat:", 0xFFFFFFFFLL);

  return v10;
}

- (int64_t)pageNumber
{
  return self->_pageNumber;
}

- (void)setPageNumber:(int64_t)a3
{
  self->_pageNumber = a3;
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_storeStrong((id *)&self->_url, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
}

@end
