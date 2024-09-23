@implementation BKPdfSearchOperation

- (BKPdfSearchOperation)init
{
  BKPdfSearchOperation *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BKPdfSearchOperation;
  v2 = -[BKSearchOperation init](&v5, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, "didReceiveMemoryWarning:", UIApplicationDidReceiveMemoryWarningNotification, 0);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)BKPdfSearchOperation;
  -[BKSearchOperation dealloc](&v4, "dealloc");
}

- (void)didReceiveMemoryWarning:(id)a3
{
  BKPdfSearchOperation *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_dropDocument = 1;
  objc_sync_exit(obj);

}

- (PDFDocument)pdfDocument
{
  BKPdfSearchOperation *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  PDFDocument *pdfDocument;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_pdfDocument)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[AEPdfCache sharedInstance](AEPdfCache, "sharedInstance"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchOperation bookURL](v2, "bookURL"));
    v5 = objc_msgSend(v3, "copyCacheObjectForURL:", v4);

    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "document"));
    pdfDocument = v2->_pdfDocument;
    v2->_pdfDocument = (PDFDocument *)v6;

    v2->_numberOfDocumentPages = -[PDFDocument pageCount](v2->_pdfDocument, "pageCount");
  }
  objc_sync_exit(v2);

  return v2->_pdfDocument;
}

- (void)cancel
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKPdfSearchOperation pdfDocument](self, "pdfDocument"));
  objc_msgSend(v3, "cancelFindString");

  v4.receiver = self;
  v4.super_class = (Class)BKPdfSearchOperation;
  -[BKSearchOperation cancel](&v4, "cancel");
}

- (void)_clearDocumentIfNeeded
{
  PDFDocument *pdfDocument;
  BKPdfSearchOperation *obj;

  if (self->_dropDocument)
  {
    obj = self;
    objc_sync_enter(obj);
    if (self->_dropDocument)
    {
      pdfDocument = obj->_pdfDocument;
      obj->_pdfDocument = 0;

      self->_dropDocument = 0;
    }
    objc_sync_exit(obj);

  }
}

- (BOOL)requiresMainThread
{
  return 0;
}

- (BOOL)isPastLimit
{
  return self->_foundResults > 0x63;
}

- (unint64_t)remainingPages
{
  return self->_numberOfDocumentPages - self->_currentPageIndex;
}

- (BOOL)_hasSearchableCharacters:(id)a3
{
  id v3;
  char *v4;
  unsigned int v5;
  unsigned int v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  BOOL v15;

  v3 = a3;
  v4 = (char *)objc_msgSend(v3, "length");
  v5 = objc_msgSend(CFSTR("\uFFFD"), "characterAtIndex:", 0);
  if (v4)
  {
    v6 = v5;
    v7 = 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    do
    {
      v11 = objc_msgSend(v3, "characterAtIndex:", v7);
      if (v11)
        v12 = v8;
      else
        v12 = v8 + 1;
      if (v11 == 32)
        v13 = v10 + 1;
      else
        v13 = v10;
      if (v11 == 32)
        v12 = v8;
      if (v11 == v6)
        ++v9;
      else
        v10 = v13;
      if (v11 != v6)
        v8 = v12;
      ++v7;
    }
    while (v4 != v7);
  }
  else
  {
    v10 = 0;
    v9 = 0;
    v8 = 0;
  }
  if (v9 + v8)
    v14 = v9 + v10 + v8 >= (unint64_t)v4;
  else
    v14 = 0;
  v15 = !v14;

  return v15;
}

- (BOOL)_doSearchWithString:(id)a3
{
  id v4;
  void *v5;
  _UNKNOWN **v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  BOOL v15;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  NSObject *v32;
  BKPDFSearchResult *v33;
  void *v34;
  id v35;
  BKPDFSearchResult *v36;
  void *v37;
  void *v38;
  id v39;
  uint64_t v40;
  void *v41;
  id v42;
  NSObject *v43;
  id v44;
  NSObject *v45;
  BKPDFSearchResult *v46;
  const char *v47;
  id v48;
  id v49;
  NSObject *v50;
  uint8_t buf[4];
  BKPDFSearchResult *v52;

  v4 = a3;
  if (objc_msgSend(v4, "length")
    && (v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKPdfSearchOperation pdfDocument](self, "pdfDocument")),
        v5,
        v5)
    && self->_currentPageIndex < self->_numberOfDocumentPages)
  {
    v6 = &IMAccessibilityIsFKAEnabledWithKeyboardAttached_ptr;
    +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
    v8 = v7;
    if (self->_currentPageIndex)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchOperation lastSavedSearchResult](self, "lastSavedSearchResult"));

      if (v9)
      {
        *(_QWORD *)&v10 = objc_opt_class(PDFSelection).n128_u64[0];
        v12 = v11;
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchOperation lastSavedSearchResult](self, "lastSavedSearchResult", v10));
        v14 = BUDynamicCast(v12, v13);
        v9 = (void *)objc_claimAutoreleasedReturnValue(v14);

      }
    }
    else
    {
      v9 = 0;
    }
    if ((-[BKPdfSearchOperation isCancelled](self, "isCancelled") & 1) != 0)
    {
      v15 = 0;
    }
    else
    {
      v17 = 0;
      while (1)
      {
        if (self->super._isDone)
          goto LABEL_34;
        -[BKSearchOperation timeOut](self, "timeOut");
        if (v18 != 0.0)
        {
          objc_msgSend(v6[197], "timeIntervalSinceReferenceDate");
          v20 = v19 - v8;
          -[BKSearchOperation timeOut](self, "timeOut");
          if (v20 > v21)
            break;
        }
        if (self->_foundResults >= 0x64)
        {
          self->super._isDone = 1;
          -[BKSearchOperation setStartSearchFromIndex:](self, "setStartSearchFromIndex:", self->_currentPageIndex);
          -[BKSearchOperation setLastSavedSearchResult:](self, "setLastSavedSearchResult:", v9);
          v44 = _AESearchLog();
          v45 = objc_claimAutoreleasedReturnValue(v44);
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
          {
            v46 = (BKPDFSearchResult *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->_currentPageIndex));
            *(_DWORD *)buf = 138412290;
            v52 = v46;
            v47 = "Search: Max results hit %@";
            goto LABEL_29;
          }
LABEL_30:

LABEL_34:
          v15 = 0;
          goto LABEL_35;
        }
        objc_msgSend(v6[197], "timeIntervalSinceReferenceDate");
        if (v22 - v8 > 0.4)
        {
          -[BKSearchOperation setStartSearchFromIndex:](self, "setStartSearchFromIndex:", self->_currentPageIndex);
          -[BKSearchOperation setLastSavedSearchResult:](self, "setLastSavedSearchResult:", v9);
          v48 = _AESearchLog();
          v45 = objc_claimAutoreleasedReturnValue(v48);
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
          {
            v46 = (BKPDFSearchResult *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->_currentPageIndex));
            *(_DWORD *)buf = 138412290;
            v52 = v46;
            v47 = "Search: update partial results %@";
LABEL_29:
            _os_log_impl(&dword_0, v45, OS_LOG_TYPE_DEFAULT, v47, buf, 0xCu);

          }
          goto LABEL_30;
        }
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[BKPdfSearchOperation pdfDocument](self, "pdfDocument"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "findString:fromSelection:withOptions:", v4, v9, 1));

        if (!v24)
        {
          v49 = _AESearchLog();
          v50 = objc_claimAutoreleasedReturnValue(v49);
          if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_0, v50, OS_LOG_TYPE_DEFAULT, "Search: end of document reached", buf, 2u);
          }

          self->super._isDone = 1;
          -[BKSearchOperation setHavePartialResults:](self, "setHavePartialResults:", 0);
          v9 = 0;
          goto LABEL_34;
        }
        v25 = v4;
        v26 = v17;
        v9 = v24;
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "pages"));
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "lastObject"));
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[BKPdfSearchOperation pdfDocument](self, "pdfDocument"));
        v30 = objc_msgSend(v29, "indexForPage:", v28);

        self->_currentPageIndex = (unint64_t)v30;
        v31 = _AESearchLog();
        v32 = objc_claimAutoreleasedReturnValue(v31);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          v33 = (BKPDFSearchResult *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", +[BKPDFModernBookViewController pageNumberForPageIndex:](BKPDFModernBookViewController, "pageNumberForPageIndex:", v30)));
          *(_DWORD *)buf = 138412290;
          v52 = v33;
          _os_log_impl(&dword_0, v32, OS_LOG_TYPE_DEFAULT, "Search: found result on page %@", buf, 0xCu);

        }
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "string"));
        v35 = objc_msgSend(v9, "copy");

        objc_msgSend(v35, "extendSelectionForLineBoundaries");
        v36 = objc_alloc_init(BKPDFSearchResult);
        v4 = v25;
        -[BKSearchResult setSearchString:](v36, "setSearchString:", v25);
        -[BKSearchResult setOrdinal:](v36, "setOrdinal:", self->super._ordinal);
        -[BKPDFSearchResult setSelection:](v36, "setSelection:", v9);
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "string"));
        -[BKSearchResult setText:](v36, "setText:", v37);

        v38 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchResult text](v36, "text"));
        v39 = objc_msgSend(v38, "rangeOfString:", v34);
        -[BKSearchResult setSearchStringRange:](v36, "setSearchStringRange:", v39, v40);

        -[BKSearchResult setPageOffset:](v36, "setPageOffset:", self->_currentPageIndex);
        v41 = (void *)objc_claimAutoreleasedReturnValue(+[BKPDFLocation locationForSelection:offset:](BKPDFLocation, "locationForSelection:offset:", v35, -[BKSearchResult pageOffset](v36, "pageOffset")));
        -[BKSearchResult setLocation:](v36, "setLocation:", v41);

        -[NSMutableArray addObject:](self->super._results, "addObject:", v36);
        ++self->_foundResults;
        v42 = _AESearchLog();
        v43 = objc_claimAutoreleasedReturnValue(v42);
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v52 = v36;
          _os_log_impl(&dword_0, v43, OS_LOG_TYPE_DEFAULT, "Search: result %@", buf, 0xCu);
        }

        -[BKSearchOperation setHavePartialResults:](self, "setHavePartialResults:", 1);
        v17 = v35;
        v6 = &IMAccessibilityIsFKAEnabledWithKeyboardAttached_ptr;
        if (-[BKPdfSearchOperation isCancelled](self, "isCancelled"))
        {
          v15 = 0;
          v17 = v35;
          goto LABEL_35;
        }
      }
      -[BKPdfSearchOperation cancel](self, "cancel");
      v15 = 1;
LABEL_35:

    }
  }
  else
  {
    v15 = 0;
    self->super._isDone = 1;
  }

  return v15;
}

- (BOOL)_doSearch
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  BOOL v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchOperation searchString](self, "searchString"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithString:](NSMutableString, "stringWithString:", v3));

  if (-[BKPdfSearchOperation _hasSearchableCharacters:](self, "_hasSearchableCharacters:", v4))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet characterSetWithCharactersInString:](NSCharacterSet, "characterSetWithCharactersInString:", CFSTR("\uFFFD")));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchOperation searchString](self, "searchString"));
    v7 = objc_msgSend(v6, "rangeOfCharacterFromSet:options:", v5, 4);
    v9 = v8;

    while (v7 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v4, "deleteCharactersInRange:", v7, v9);
      if (!v7)
        break;
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchOperation searchString](self, "searchString"));
      v7 = objc_msgSend(v10, "rangeOfCharacterFromSet:options:range:", v5, 4, 0, v7);
      v9 = v11;

    }
    v12 = -[BKPdfSearchOperation _doSearchWithString:](self, "_doSearchWithString:", v4);
    -[BKPdfSearchOperation _clearDocumentIfNeeded](self, "_clearDocumentIfNeeded");

  }
  else
  {
    v12 = 0;
    self->super._isDone = 1;
  }

  return v12;
}

- (unint64_t)currentPageIndex
{
  return self->_currentPageIndex;
}

- (void)setCurrentPageIndex:(unint64_t)a3
{
  self->_currentPageIndex = a3;
}

- (unint64_t)numberOfDocumentPages
{
  return self->_numberOfDocumentPages;
}

- (void)setNumberOfDocumentPages:(unint64_t)a3
{
  self->_numberOfDocumentPages = a3;
}

- (void)setPdfDocument:(id)a3
{
  objc_storeStrong((id *)&self->_pdfDocument, a3);
}

- (unint64_t)foundResults
{
  return self->_foundResults;
}

- (void)setFoundResults:(unint64_t)a3
{
  self->_foundResults = a3;
}

- (unint64_t)resultIndex
{
  return self->_resultIndex;
}

- (void)setResultIndex:(unint64_t)a3
{
  self->_resultIndex = a3;
}

- (BOOL)dropDocument
{
  return self->_dropDocument;
}

- (void)setDropDocument:(BOOL)a3
{
  self->_dropDocument = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pdfDocument, 0);
}

@end
