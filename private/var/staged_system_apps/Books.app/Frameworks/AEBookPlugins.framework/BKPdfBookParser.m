@implementation BKPdfBookParser

- (int)parse:(BOOL)a3
{
  void *v5;
  unsigned __int8 v6;
  int v7;
  void *v8;
  void *v9;
  AEPdfCacheObject *v10;
  AEPdfCacheObject *pdfObject;
  void *v12;
  void *v13;
  BKPdfTocParser *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
  v6 = objc_msgSend(v5, "wasParsed");

  if ((v6 & 1) != 0)
    return 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[AEPdfCache sharedInstance](AEPdfCache, "sharedInstance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
  v10 = (AEPdfCacheObject *)objc_msgSend(v8, "copyCacheObjectForBook:", v9);
  pdfObject = self->_pdfObject;
  self->_pdfObject = v10;

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKPdfBookParser pdfObject](self, "pdfObject"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "document"));

  if (v13)
  {
    if ((objc_msgSend(v13, "isLocked") & 1) != 0)
    {
      v14 = (BKPdfTocParser *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
      v15 = AEBundle();
      v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("Untitled"), &stru_1C3088, 0));
      -[BKPdfTocParser setBookTitle:](v14, "setBookTitle:", v17);

      v18 = AEBundle();
      v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("Untitled"), &stru_1C3088, 0));
      -[BKPdfTocParser setSortTitle:](v14, "setSortTitle:", v20);

    }
    else
    {
      v7 = -[BKPdfBookParser loadMetadata](self, "loadMetadata");
      if (v7 || a3)
        goto LABEL_11;
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
      objc_msgSend(v21, "resetAsNewlyDownloaded");

      v14 = -[BKPdfTocParser initWithDocument:]([BKPdfTocParser alloc], "initWithDocument:", objc_msgSend(v13, "documentRef"));
      -[BKPdfBookParser constructBKNavigationInfoWithPdfTocParser:](self, "constructBKNavigationInfoWithPdfTocParser:", v14);
      -[BKPdfBookParser constructBKDocumentWithPdfTocParser:](self, "constructBKDocumentWithPdfTocParser:", v14);
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
      objc_msgSend(v19, "setParserVersion:", BKPdfBookParser_CurrentVersion[0]);
    }

    v7 = 0;
  }
  else
  {
    v7 = -1;
  }
LABEL_11:
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "fileSize"));
  v24 = objc_msgSend(v23, "longLongValue");

  if (!v24)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "url"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "path"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "attributesOfItemAtPath:error:", v28, 0));

    v30 = objc_msgSend(v29, "fileSize");
    if (v30)
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", v30));
      objc_msgSend(v31, "setFileSize:", v32);

    }
  }

  return v7;
}

- (id)hrefForPageNumber:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  __CFString *v5;

  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
    v5 = &stru_1C3088;
  else
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%d"), BKPdfBookParserFakeBaseHref[0], a3, v3, v4));
  return v5;
}

- (int)loadMetadata
{
  void *v3;
  void *v4;
  CGPDFDictionary *Info;
  void *v6;
  __CFString *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  __CFString *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  __CFString *v20;
  void *v21;
  CGPDFStringRef value;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKPdfBookParser pdfObject](self, "pdfObject"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "document"));
  Info = CGPDFDocumentGetInfo((CGPDFDocumentRef)objc_msgSend(v4, "documentRef"));

  if (!Info)
    return 0;
  value = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
  if (CGPDFDictionaryGetString(Info, "Title", &value))
  {
    v7 = (__CFString *)CGPDFStringCopyTextString(value);
    if (-[__CFString length](v7, "length"))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bookTitle"));
      v9 = objc_msgSend(v8, "length");

      if (!v9)
      {
        objc_msgSend(v6, "setBookTitle:", v7);
        objc_msgSend(v6, "setSortTitle:", v7);
      }
    }

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bookAuthor"));
  if (!objc_msgSend(v10, "length"))
  {

    goto LABEL_11;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sortAuthor"));
  v12 = objc_msgSend(v11, "length");

  if (!v12)
  {
LABEL_11:
    if (CGPDFDictionaryGetString(Info, "Author", &value))
    {
      v13 = (__CFString *)CGPDFStringCopyTextString(value);
      if (-[__CFString length](v13, "length"))
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bookAuthor"));
        v15 = objc_msgSend(v14, "length");

        if (!v15)
          objc_msgSend(v6, "setBookAuthor:", v13);
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sortAuthor"));
        v17 = objc_msgSend(v16, "length");

        if (!v17)
          objc_msgSend(v6, "setSortAuthor:", v13);
      }

    }
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "genre"));
  v19 = objc_msgSend(v18, "length");

  if (!v19 && CGPDFDictionaryGetString(Info, "Subject", &value))
  {
    v20 = (__CFString *)CGPDFStringCopyTextString(value);
    if (-[__CFString length](v20, "length"))
      objc_msgSend(v6, "setGenre:", v20);

  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[BKPdfBookParser hrefForPageNumber:](self, "hrefForPageNumber:", 1));
  objc_msgSend(v6, "setEmbeddedArtHref:", v21);

  return 0;
}

+ (unint64_t)pdfHrefToPageNumber:(id)a3
{
  id v3;
  id v4;
  unint64_t v5;
  void *v6;

  v3 = a3;
  v4 = -[__CFString length](BKPdfBookParserFakeBaseHref[0], "length");
  if (objc_msgSend(v3, "length") >= v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "substringFromIndex:", v4));
    if (objc_msgSend(v6, "length"))
      v5 = +[BKPdfBookParser pdfAnchorToPageNumber:](BKPdfBookParser, "pdfAnchorToPageNumber:", v6);
    else
      v5 = 1;

  }
  else
  {
    v5 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v5;
}

+ (unint64_t)pdfAnchorToPageNumber:(id)a3
{
  return (int)objc_msgSend(a3, "intValue");
}

- (int)constructBKNavigationInfoWithPdfTocEntry:(id)a3 absoluteOrder:(int)a4 indentationLevel:(int)a5
{
  uint64_t v5;
  uint64_t v6;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *i;
  void *v21;

  v5 = *(_QWORD *)&a5;
  v6 = *(_QWORD *)&a4;
  v8 = a3;
  if ((v6 & 0x80000000) != 0)
  {
    v17 = 0;
    v18 = 0;
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "managedObjectContext"));

    v11 = +[BKNavigationInfo newEmptyNavigationInfo:](BKNavigationInfo, "newEmptyNavigationInfo:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKPdfBookParser hrefForPageNumber:](self, "hrefForPageNumber:", objc_msgSend(v8, "pageNumber")));
    objc_msgSend(v11, "setHref:", v12);

    objc_msgSend(v11, "setBaseHref:", BKPdfBookParserFakeBaseHref[0]);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "title"));
    objc_msgSend(v11, "setName:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v5));
    objc_msgSend(v11, "setIndentationLevel:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v6));
    objc_msgSend(v11, "setAbsoluteOrder:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
    objc_msgSend(v16, "addChaptersObject:", v11);

    v17 = (v5 + 1);
    v18 = (v6 + 1);
  }
  v19 = (char *)objc_msgSend(v8, "numberOfChildren");
  if (v19)
  {
    for (i = 0; i != v19; ++i)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "childAtIndex:", i));
      if (v21)
        v18 = -[BKPdfBookParser constructBKNavigationInfoWithPdfTocEntry:absoluteOrder:indentationLevel:](self, "constructBKNavigationInfoWithPdfTocEntry:absoluteOrder:indentationLevel:", v21, v18, v17);

    }
  }

  return v18;
}

- (void)constructBKNavigationInfoWithPdfTocParser:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  if (v4)
  {
    v6 = v4;
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "tocRoot"));
    if (v5)
      -[BKPdfBookParser constructBKNavigationInfoWithPdfTocEntry:absoluteOrder:indentationLevel:](self, "constructBKNavigationInfoWithPdfTocEntry:absoluteOrder:indentationLevel:", v5, 0xFFFFFFFFLL, 0xFFFFFFFFLL);

    v4 = v6;
  }

}

- (void)constructBKDocumentWithPdfTocParser:(id)a3
{
  void *v4;
  ITFileUtil *v5;
  const __CFString *v6;
  uint64_t Size;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;

  v18 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
  v5 = (ITFileUtil *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bookBundlePath"));
  Size = ITFileUtil::GetSize(v5, v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "managedObjectContext"));

  v10 = +[BKDocument newEmptyDocument:](BKDocument, "newEmptyDocument:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "databaseKey"));
  objc_msgSend(v10, "setBookDatabaseKey:", v12);

  objc_msgSend(v10, "setHref:", BKPdfBookParserFakeBaseHref[0]);
  objc_msgSend(v10, "setMime:", CFSTR("application/pdf"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0));
  objc_msgSend(v10, "setDocumentOrdinal:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", Size));
  objc_msgSend(v10, "setFileSize:", v14);

  objc_msgSend(v10, "setManifestId:", &stru_1C3088);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "tocRoot"));
  v16 = objc_msgSend(v15, "numberOfChildren");

  if (v16)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1));
    objc_msgSend(v10, "setHasTocElements:", v17);

  }
}

- (AEPdfCacheObject)pdfObject
{
  return self->_pdfObject;
}

- (void)setPdfObject:(id)a3
{
  objc_storeStrong((id *)&self->_pdfObject, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pdfObject, 0);
}

@end
