@implementation DOCPDFMetadataProvider

+ (id)pdfMetadataProviderWithNode:(id)a3 levelOfDetail:(int64_t)a4 URL:(id)a5
{
  id v7;
  const __CFURL *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  CGPDFDocument *v13;
  CGPDFDocument *v14;
  CGPDFDictionaryRef Info;
  CGPDFDictionary *v16;
  DOCPDFMetadataProvider *v17;

  v7 = a3;
  v8 = (const __CFURL *)a5;
  if (!v8)
    goto LABEL_7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "contentType"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypePDF, "identifier"));
  v12 = objc_msgSend(v10, "isEqualToString:", v11);

  if (!v12)
    goto LABEL_7;
  v13 = CGPDFDocumentCreateWithURL(v8);
  if (!v13)
    goto LABEL_7;
  v14 = v13;
  Info = CGPDFDocumentGetInfo(v13);
  if (!Info)
  {
    CGPDFDocumentRelease(v14);
LABEL_7:
    v17 = 0;
    goto LABEL_8;
  }
  v16 = Info;
  v17 = objc_opt_new(DOCPDFMetadataProvider);
  v17->_pdfInfo = v16;
  v17->_levelOfDetail = a4;
  v17->_pdfDocument = v14;
LABEL_8:

  return v17;
}

- (NSDictionary)metadataValues
{
  int64_t levelOfDetail;
  const char *v3;

  levelOfDetail = self->_levelOfDetail;
  if (!levelOfDetail)
  {
    v3 = (const char *)objc_claimAutoreleasedReturnValue(-[DOCPDFMetadataProvider compactMetadataValues](self, "compactMetadataValues"));
    goto LABEL_5;
  }
  if (levelOfDetail == 1)
  {
    v3 = (const char *)objc_claimAutoreleasedReturnValue(-[DOCPDFMetadataProvider fullMetadataValues](self, "fullMetadataValues"));
LABEL_5:
    a2 = v3;
  }
  return (NSDictionary *)(id)a2;
}

- (NSArray)displaySortOrder
{
  return (NSArray *)&off_1005F5068;
}

- (id)compactMetadataValues
{
  return +[NSDictionary dictionary](NSDictionary, "dictionary");
}

- (id)fullMetadataValues
{
  NSMutableDictionary *v3;
  id v4;
  CGPDFDictionary *pdfInfo;
  NSMutableDictionary *v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *v8;
  _QWORD v10[4];
  id v11;
  NSMutableDictionary *v12;

  v3 = objc_opt_new(NSMutableDictionary);
  v4 = objc_msgSend(&off_1005F5080, "mutableCopy");
  -[DOCPDFMetadataProvider addVersionToDictionary:](self, "addVersionToDictionary:", v3);
  -[DOCPDFMetadataProvider addPagesToDictionary:](self, "addPagesToDictionary:", v3);
  -[DOCPDFMetadataProvider addSizeToDictionary:](self, "addSizeToDictionary:", v3);
  -[DOCPDFMetadataProvider addSecureToDictionary:](self, "addSecureToDictionary:", v3);
  if (CGPDFDocumentIsUnlocked(self->_pdfDocument))
  {
    pdfInfo = self->_pdfInfo;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000C4F18;
    v10[3] = &unk_1005BEDA0;
    v11 = v4;
    v6 = v3;
    v12 = v6;
    CGPDFDictionaryApplyBlock(pdfInfo, v10, 0);
    v7 = v12;
    v8 = v6;

  }
  return v3;
}

- (void)addPagesToDictionary:(id)a3
{
  CGPDFDocument *pdfDocument;
  id v4;
  NSNumber *v5;
  void *v6;
  id v7;

  pdfDocument = self->_pdfDocument;
  v4 = a3;
  v5 = +[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:", CGPDFDocumentGetNumberOfPages(pdfDocument));
  v7 = (id)objc_claimAutoreleasedReturnValue(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumberFormatter localizedStringFromNumber:numberStyle:](NSNumberFormatter, "localizedStringFromNumber:numberStyle:", v7, 0));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("Pages"));

}

- (void)addSecureToDictionary:(id)a3
{
  CGPDFDocument *pdfDocument;
  id v4;
  _BOOL8 IsEncrypted;
  _BOOL4 v6;
  uint64_t v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  const __CFString *v11;
  id v12;

  pdfDocument = self->_pdfDocument;
  v4 = a3;
  IsEncrypted = CGPDFDocumentIsEncrypted(pdfDocument);
  v6 = IsEncrypted;
  v7 = _DocumentManagerBundle(IsEncrypted);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = v8;
  if (v6)
  {
    v10 = CFSTR("Metadata File Encryption Status [Encrypted With Password]");
    v11 = CFSTR("Password");
  }
  else
  {
    v10 = CFSTR("Metadata File Encryption Status [Not Encrypted]");
    v11 = CFSTR("None");
  }
  v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", v10, v11, CFSTR("Localizable")));

  objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("Security"));
}

- (void)addVersionToDictionary:(id)a3
{
  id v4;
  void *v5;
  int minorVersion;
  int majorVersion;

  v4 = a3;
  majorVersion = 0;
  minorVersion = 0;
  CGPDFDocumentGetVersion(self->_pdfDocument, &majorVersion, &minorVersion);
  if (majorVersion >= 1)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d.%d"), majorVersion, minorVersion));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("Version"));

  }
}

- (void)addSizeToDictionary:(id)a3
{
  CGPDFPage *Page;
  uint64_t v5;
  void *v6;
  id v7;
  CGRect BoxRect;

  v7 = a3;
  if (CGPDFDocumentGetNumberOfPages(self->_pdfDocument))
  {
    Page = CGPDFDocumentGetPage(self->_pdfDocument, 1uLL);
    if (Page)
    {
      BoxRect = CGPDFPageGetBoxRect(Page, kCGPDFCropBox);
      v5 = DOCLocalizedMetadataStringForWidthByHeight(BoxRect.size.width, BoxRect.size.height);
      v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, CFSTR("Resolution"));

    }
  }

}

- (void)dealloc
{
  objc_super v3;

  CGPDFDocumentRelease(self->_pdfDocument);
  v3.receiver = self;
  v3.super_class = (Class)DOCPDFMetadataProvider;
  -[DOCPDFMetadataProvider dealloc](&v3, "dealloc");
}

@end
