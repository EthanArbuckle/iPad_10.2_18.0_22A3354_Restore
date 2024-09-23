@implementation THReadingStatisticsScanOperation

- (THReadingStatisticsScanOperation)initWithDelegate:(id)a3 ordinal:(unint64_t)a4 applePubURL:(id)a5 documentEntryURI:(id)a6
{
  THReadingStatisticsScanOperation *v10;
  THReadingStatisticsScanOperation *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)THReadingStatisticsScanOperation;
  v10 = -[THReadingStatisticsScanOperation init](&v13, "init");
  v11 = v10;
  if (v10)
  {
    v10->_delegate = (THReadingStatisticsScanOperationDelegate *)a3;
    v10->_ordinal = a4;
    v10->_applePubURL = (NSURL *)a5;
    v11->_documentEntryURI = (NSString *)a6;
  }
  return v11;
}

- (void)dealloc
{
  _xmlTextReader *streamAPI;
  objc_super v4;

  self->_applePubURL = 0;
  self->_documentEntryURI = 0;

  self->_counts = 0;
  streamAPI = self->_streamAPI;
  if (streamAPI)
  {
    xmlFreeTextReader(streamAPI);
    self->_streamAPI = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)THReadingStatisticsScanOperation;
  -[THReadingStatisticsScanOperation dealloc](&v4, "dealloc");
}

- (id)_ignoredElements
{
  if (qword_543418 != -1)
    dispatch_once(&qword_543418, &stru_42C108);
  return (id)qword_543410;
}

- (void)_parseBodyWithPrefix:(id)a3 index:(int64_t)a4
{
  THReadingStatisticsScanOperation *v6;
  _xmlTextReader **p_streamAPI;
  int v8;
  char v9;
  void **v10;
  xmlTextReader *v11;
  int v12;
  int v13;
  int v14;
  int v16;
  int v17;
  NSObject *v18;
  xmlChar *v19;
  THReadingStatisticsScanOperation *v20;
  xmlChar *String;
  xmlChar *v22;
  void **v23;
  id v24;
  void *v25;
  id v26;
  NSObject *v27;
  id v28;
  NSObject *v29;
  void **v30;
  xmlChar *v31;
  unsigned int v32;
  NSObject *v33;
  _BOOL4 v34;
  id v35;
  NSObject *v36;
  id v38;
  uint8_t buf[4];
  _BYTE v40[14];
  __int16 v41;
  xmlChar *v42;
  __int16 v43;
  int64_t v44;

  v6 = self;
  p_streamAPI = &self->_streamAPI;
  v8 = xmlTextReaderDepth(self->_streamAPI);
  v9 = 0;
  v10 = (void **)&AEAnnotationPopoverShouldHideNotification_ptr;
  while (1)
  {
    v11 = *p_streamAPI;
    v12 = (v9 & 1) != 0 ? xmlTextReaderNext(v11) : xmlTextReaderRead(v11);
    v13 = v12;
    v14 = xmlTextReaderDepth(*p_streamAPI);
    if (v13 != 1 || v14 < v8)
      break;
    v16 = v14;
    v17 = xmlTextReaderNodeType(*p_streamAPI);
    if ((v17 - 3) <= 1)
    {
      v20 = v6;
      String = xmlTextReaderReadString(*p_streamAPI);
      if (String)
      {
        v22 = String;
        v23 = v10;
        v24 = objc_msgSend(objc_alloc((Class)v10[457]), "initWithUTF8String:", String);
        if (v24)
        {
          v25 = v24;
          v38 = a3;
          v26 = objc_msgSend(v24, "length");
          if ((a4 & 1) != 0)
          {
            v27 = THImportLog();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134217984;
              *(_QWORD *)v40 = a4;
              _os_log_error_impl(&dword_0, v27, OS_LOG_TYPE_ERROR, "Text node with index %ld not expected.  Should be even (resulting in odd CFI index with +1 adjustment)", buf, 0xCu);
            }
          }
          v28 = objc_msgSend(v23[457], "stringWithFormat:", CFSTR("epubcfi(%@/%ld,:0,:%lu)"), v38, a4 + 1, v26);
          v29 = THImportLog();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 67109890;
            *(_DWORD *)v40 = 2 * v8;
            *(_WORD *)&v40[4] = 2080;
            *(_QWORD *)&v40[6] = "";
            v41 = 2080;
            v42 = v22;
            v43 = 2112;
            v44 = (int64_t)v28;
            _os_log_debug_impl(&dword_0, v29, OS_LOG_TYPE_DEBUG, "%*scounting text \"%s\" cfi=%@", buf, 0x26u);
          }
          v6 = v20;
          -[NSMutableDictionary setObject:forKeyedSubscript:](-[THReadingStatisticsScanOperation counts](v20, "counts"), "setObject:forKeyedSubscript:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v26), v28);

          v9 = 0;
          a3 = v38;
          v10 = v23;
        }
        else
        {
          v9 = 0;
          v6 = v20;
        }
      }
      else
      {
        v9 = 0;
      }
      goto LABEL_35;
    }
    if (v17 == 15)
    {
      v9 = 0;
      if (v16 == v8)
      {
        v36 = THImportLog();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
          sub_1CFC60(2 * v8, p_streamAPI, v36);
        return;
      }
    }
    else
    {
      v9 = 0;
      if (v17 == 1)
      {
        a4 |= 1uLL;
        if (xmlTextReaderIsEmptyElement(*p_streamAPI))
        {
          v18 = THImportLog();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          {
            v19 = xmlTextReaderName(*p_streamAPI);
            *(_DWORD *)buf = 67109890;
            *(_DWORD *)v40 = 2 * v8;
            *(_WORD *)&v40[4] = 2080;
            *(_QWORD *)&v40[6] = "";
            v41 = 2080;
            v42 = v19;
            v43 = 2048;
            v44 = a4;
            _os_log_debug_impl(&dword_0, v18, OS_LOG_TYPE_DEBUG, "%*sparsing empty element %s index=%ld", buf, 0x26u);
          }
LABEL_34:
          v9 = 0;
          goto LABEL_35;
        }
        v30 = v10;
        v31 = (xmlChar *)objc_msgSend(v10[457], "stringWithUTF8String:", xmlTextReaderConstLocalName(*p_streamAPI));
        v32 = objc_msgSend(-[THReadingStatisticsScanOperation _ignoredElements](v6, "_ignoredElements"), "containsObject:", v31);
        v33 = THImportLog();
        v34 = os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG);
        if (!v32)
        {
          if (v34)
          {
            *(_DWORD *)buf = 67109890;
            *(_DWORD *)v40 = 2 * v8;
            *(_WORD *)&v40[4] = 2080;
            *(_QWORD *)&v40[6] = "";
            v41 = 2112;
            v42 = v31;
            v43 = 2048;
            v44 = a4;
            _os_log_debug_impl(&dword_0, v33, OS_LOG_TYPE_DEBUG, "%*sparsing element %@ index=%ld", buf, 0x26u);
          }
          v10 = v30;
          v35 = objc_msgSend(objc_alloc((Class)v30[457]), "initWithFormat:", CFSTR("%@/%ld"), a3, a4 + 1);
          -[THReadingStatisticsScanOperation _parseBodyWithPrefix:index:](v6, "_parseBodyWithPrefix:index:", v35, 0);

          goto LABEL_34;
        }
        if (v34)
        {
          *(_DWORD *)buf = 67109890;
          *(_DWORD *)v40 = 2 * v8;
          *(_WORD *)&v40[4] = 2080;
          *(_QWORD *)&v40[6] = "";
          v41 = 2112;
          v42 = v31;
          v43 = 2048;
          v44 = a4;
          _os_log_debug_impl(&dword_0, v33, OS_LOG_TYPE_DEBUG, "%*signoring non-body-text element %@ index=%ld", buf, 0x26u);
        }
        v9 = 1;
        v10 = v30;
LABEL_35:
        ++a4;
      }
    }
  }
}

- (void)main
{
  void *v3;
  PFXArchive *v4;
  id v5;
  xmlTextReader *v6;
  xmlTextReader *v7;
  int i;
  const xmlChar *v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  NSString *v13;
  uint8_t buf[4];
  NSURL *v15;

  if ((-[THReadingStatisticsScanOperation isCancelled](self, "isCancelled") & 1) == 0)
  {
    v3 = objc_autoreleasePoolPush();
    v4 = -[PFXArchive initWithPath:]([PFXArchive alloc], "initWithPath:", -[NSURL path](-[THReadingStatisticsScanOperation applePubURL](self, "applePubURL"), "path"));
    if (!-[PFXArchive isValid](v4, "isValid"))
      objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THReadingStatisticsScanOperation main]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/ApplePub/THImporter/THReadingStatisticsScanOperation.m"), 176, CFSTR("Failed to load valid archive"));
    if (-[PFXArchive isValid](v4, "isValid"))
    {
      v5 = -[PFXArchive decryptEntryWithName:error:](v4, "decryptEntryWithName:error:", -[THReadingStatisticsScanOperation documentEntryURI](self, "documentEntryURI"), 0);
      if (v5)
      {
        v6 = (xmlTextReader *)objc_msgSend(v5, "xmlReader");
        v7 = v6;
        if (v6)
        {
          for (i = xmlTextReaderRead(v6); i == 1; i = xmlTextReaderRead(v7))
          {
            if (xmlTextReaderNodeType(v7) == 1)
            {
              v9 = xmlTextReaderConstLocalName(v7);
              if (!xmlStrcmp(v9, (const xmlChar *)"html"))
              {
                -[THReadingStatisticsScanOperation setCounts:](self, "setCounts:", +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
                v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("/6/%ld!"), 2 * -[THReadingStatisticsScanOperation ordinal](self, "ordinal") + 2);
                -[THReadingStatisticsScanOperation setStreamAPI:](self, "setStreamAPI:", v7);
                -[THReadingStatisticsScanOperation _parseBodyWithPrefix:index:](self, "_parseBodyWithPrefix:index:", v13, 0);
                if ((-[THReadingStatisticsScanOperation isCancelled](self, "isCancelled") & 1) == 0)
                  -[THReadingStatisticsScanOperationDelegate readingStatisticsScanOperation:addTextNodeCharacterCounts:](-[THReadingStatisticsScanOperation delegate](self, "delegate"), "readingStatisticsScanOperation:addTextNodeCharacterCounts:", self, -[THReadingStatisticsScanOperation counts](self, "counts"));
                -[THReadingStatisticsScanOperation setCounts:](self, "setCounts:", 0);
                goto LABEL_27;
              }
            }
          }
          if (i < 0)
          {
            v12 = THImportLog();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v15 = -[THReadingStatisticsScanOperation documentEntryURI](self, "documentEntryURI");
              _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "Unable to parse XML file %@", buf, 0xCu);
            }
          }
LABEL_27:
          if (v7)
          {
            xmlFreeTextReader(v7);
            self->_streamAPI = 0;
          }
          goto LABEL_22;
        }
        objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THReadingStatisticsScanOperation main]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/ApplePub/THImporter/THReadingStatisticsScanOperation.m"), 184, CFSTR("invalid nil value for '%s'"), "streamAPI");
        v10 = THImportLog();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v15 = -[THReadingStatisticsScanOperation documentEntryURI](self, "documentEntryURI");
          v11 = "Unable to open XML file %@";
          goto LABEL_21;
        }
LABEL_22:

        objc_autoreleasePoolPop(v3);
        return;
      }
      v10 = THImportLog();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        goto LABEL_22;
      *(_DWORD *)buf = 138412290;
      v15 = -[THReadingStatisticsScanOperation documentEntryURI](self, "documentEntryURI");
      v11 = "Unable to decrypt %@";
    }
    else
    {
      v10 = THImportLog();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        goto LABEL_22;
      *(_DWORD *)buf = 138412290;
      v15 = -[THReadingStatisticsScanOperation applePubURL](self, "applePubURL");
      v11 = "Failed to load valid archive %@";
    }
LABEL_21:
    _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, v11, buf, 0xCu);
    goto LABEL_22;
  }
}

- (unint64_t)ordinal
{
  return self->_ordinal;
}

- (void)setOrdinal:(unint64_t)a3
{
  self->_ordinal = a3;
}

- (THReadingStatisticsScanOperationDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (THReadingStatisticsScanOperationDelegate *)a3;
}

- (NSURL)applePubURL
{
  return self->_applePubURL;
}

- (void)setApplePubURL:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (NSString)documentEntryURI
{
  return self->_documentEntryURI;
}

- (void)setDocumentEntryURI:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (_xmlTextReader)streamAPI
{
  return self->_streamAPI;
}

- (void)setStreamAPI:(_xmlTextReader *)a3
{
  self->_streamAPI = a3;
}

- (NSMutableDictionary)counts
{
  return self->_counts;
}

- (void)setCounts:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

@end
