@implementation THReadingStatisticsCollector

- (THReadingStatisticsCollector)init
{
  THReadingStatisticsCollector *v2;
  NSOperationQueue *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)THReadingStatisticsCollector;
  v2 = -[THReadingStatisticsCollector init](&v5, "init");
  if (v2)
  {
    v3 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    v2->_chapterDataQueue = v3;
    -[NSOperationQueue setMaxConcurrentOperationCount:](v3, "setMaxConcurrentOperationCount:", 1);
    -[NSOperationQueue setQualityOfService:](v2->_chapterDataQueue, "setQualityOfService:", 17);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[NSOperationQueue cancelAllOperations](self->_chapterDataQueue, "cancelAllOperations");
  self->_delegate = 0;
  v3.receiver = self;
  v3.super_class = (Class)THReadingStatisticsCollector;
  -[THReadingStatisticsCollector dealloc](&v3, "dealloc");
}

- (void)bodyReps:(id)a3 visibleRectIs:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  id v11;
  __int128 v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  id v23;
  NSObject *v24;
  id v25;
  id v26;
  id v27;
  NSObject *v28;
  id v29;
  NSObject *v30;
  __int128 v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  id v38;
  _BYTE v39[128];

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  objc_msgSend(objc_msgSend(objc_msgSend(a3, "firstObject"), "interactiveCanvasController"), "layoutIfNeeded");
  v10 = +[BCMutableCFISet cfiSet](BCMutableCFISet, "cfiSet");
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v11 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
  if (v11)
  {
    v13 = v11;
    v14 = *(_QWORD *)v34;
    *(_QWORD *)&v12 = 138412290;
    v31 = v12;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v34 != v14)
          objc_enumerationMutation(a3);
        v16 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)i);
        v17 = -[THReadingStatisticsCollector _rangeForBodyRep:visibleUnscaledRect:](self, "_rangeForBodyRep:visibleUnscaledRect:", v16, x, y, width, height, v31);
        v19 = v18;
        v20 = objc_msgSend(v16, "storageContentNode");
        v21 = objc_msgSend(v20, "cfiForRange:storageUID:includeFilename:pedantic:", v17, v19, objc_msgSend(v20, "nodeUniqueIDForInfo:", objc_msgSend(v16, "storage")), 0, 1);
        if (v21)
        {
          v22 = v21;
          v32 = 0;
          v23 = objc_msgSend(v10, "addCFIString:error:", v21, &v32);
          if (v32)
          {
            v24 = BCReadingStatisticsLog(v23);
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v31;
              v38 = v22;
              _os_log_error_impl(&dword_0, v24, OS_LOG_TYPE_ERROR, "Error forming CFI from string %@", buf, 0xCu);
            }
          }
        }
      }
      v13 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
    }
    while (v13);
  }
  if ((objc_msgSend(v10, "isEqual:", -[THReadingStatisticsCollector visibleContent](self, "visibleContent")) & 1) == 0)
  {
    v25 = -[BCCFISet mutableCopy](-[THReadingStatisticsCollector visibleContent](self, "visibleContent"), "mutableCopy");
    objc_msgSend(v25, "subtractCFISet:", v10);
    v26 = objc_msgSend(v10, "mutableCopy");
    objc_msgSend(v26, "subtractCFISet:", -[THReadingStatisticsCollector visibleContent](self, "visibleContent"));
    v27 = objc_msgSend(v25, "cfiCount");
    if ((uint64_t)v27 >= 1)
    {
      v28 = BCReadingStatisticsLog(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        sub_2717A8(v25);
      -[THReadingStatisticsCollectorDelegate readingStatisticsCollector:willHideContentWithCFIs:](-[THReadingStatisticsCollector delegate](self, "delegate"), "readingStatisticsCollector:willHideContentWithCFIs:", self, v25);
    }
    v29 = objc_msgSend(v26, "cfiCount");
    if ((uint64_t)v29 >= 1)
    {
      v30 = BCReadingStatisticsLog(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
        sub_271738(v26);
      -[THReadingStatisticsCollectorDelegate readingStatisticsCollector:didShowContentWithCFIs:](-[THReadingStatisticsCollector delegate](self, "delegate"), "readingStatisticsCollector:didShowContentWithCFIs:", self, v26);
    }

    -[THReadingStatisticsCollector setVisibleContent:](self, "setVisibleContent:", v10);
  }
}

- (void)scanReadingStatisticsWithDocumentRoot:(id)a3
{
  uint64_t v3;

  v3 = 0;
  -[THReadingStatisticsCollector _scanReadingStatisticsWithNode:root:ordinal:level:childIndex:](self, "_scanReadingStatisticsWithNode:root:ordinal:level:childIndex:", objc_msgSend(a3, "rootNode"), a3, &v3, 0, 0);
}

- (void)readingStatisticsScanOperation:(id)a3 addTextNodeCharacterCounts:(id)a4
{
  -[THReadingStatisticsCollectorDelegate readingStatisticsCollector:addTextNodeCharacterCounts:ordinal:completion:](-[THReadingStatisticsCollector delegate](self, "delegate"), "readingStatisticsCollector:addTextNodeCharacterCounts:ordinal:completion:", self, a4, objc_msgSend(a3, "ordinal"), 0);
}

- (_NSRange)_rangeForBodyRep:(id)a3 visibleUnscaledRect:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  double y;
  double x;
  _BYTE *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double MaxX;
  double v15;
  double v16;
  double v17;
  double v18;
  _BYTE *v19;
  _BYTE *v20;
  BOOL v21;
  NSUInteger v22;
  _NSRange result;
  CGRect v24;
  CGRect v25;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = objc_msgSend(objc_msgSend(a3, "storage"), "length");
  if (v9)
  {
    objc_msgSend(a3, "convertNaturalPointFromUnscaledCanvas:", x, y);
    objc_msgSend(a3, "pinToNaturalBounds:andLastLineFragment:", 1);
    v11 = v10;
    v13 = v12;
    v24.origin.x = x;
    v24.origin.y = y;
    v24.size.width = width;
    v24.size.height = height;
    MaxX = CGRectGetMaxX(v24);
    v25.origin.x = x;
    v25.origin.y = y;
    v25.size.width = width;
    v25.size.height = height;
    objc_msgSend(a3, "convertNaturalPointFromUnscaledCanvas:", MaxX, CGRectGetMaxY(v25));
    objc_msgSend(a3, "pinToNaturalBounds:andLastLineFragment:", 1);
    v16 = v15;
    v18 = v17;
    v19 = objc_msgSend(a3, "charIndexFromPoint:allowPastBreak:isAtEndOfLine:", 1, 0, v11, v13);
    v9 = objc_msgSend(a3, "charIndexFromPoint:allowPastBreak:isAtEndOfLine:", 1, 0, v16, v18);
    v20 = v9;
    v21 = v19 > v9;
    if (v19 < v9)
      v9 = v19;
    if (v21)
      v20 = v19;
    v22 = v20 - v9;
  }
  else
  {
    v22 = 0;
  }
  result.length = v22;
  result.location = (NSUInteger)v9;
  return result;
}

- (void)_scanReadingStatisticsWithNode:(id)a3 root:(id)a4 ordinal:(unint64_t *)a5 level:(int64_t)a6 childIndex:(int64_t)a7
{
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  double v18;
  id v19;
  uint64_t v20;
  void *v21;
  double v22;
  NSString *v23;
  NSString *v24;
  id v25;
  void *v26;
  char *v27;
  char *v28;
  char *v29;
  int64_t v30;
  _QWORD v31[3];
  _QWORD v32[3];
  NSDictionary *v33;

  if (a3)
  {
    if (a5)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THReadingStatisticsCollector _scanReadingStatisticsWithNode:root:ordinal:level:childIndex:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/THReadingStatisticsCollector.m"), 144, CFSTR("invalid nil value for '%s'"), "node");
    if (a5)
      goto LABEL_3;
  }
  objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THReadingStatisticsCollector _scanReadingStatisticsWithNode:root:ordinal:level:childIndex:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/THReadingStatisticsCollector.m"), 145, CFSTR("invalid nil value for '%s'"), "ordinal");
LABEL_3:
  v13 = objc_opt_class(THModelContentNode);
  TSUDynamicCast(v13, a3);
  v15 = v14;
  v16 = objc_opt_class(THModelContainerNode);
  *(_QWORD *)&v18 = TSUDynamicCast(v16, a3).n128_u64[0];
  if (v15)
  {
    if (a6 == 2
      && !a7
      && -[THReadingStatisticsCollectorDelegate readingStatisticsCollector:needTextNodeCharacterCountsForOrdinal:](-[THReadingStatisticsCollector delegate](self, "delegate", v18), "readingStatisticsCollector:needTextNodeCharacterCountsForOrdinal:", self, *a5))
    {
      v19 = objc_msgSend(objc_msgSend(a3, "parent"), "nodeGUID");
      v20 = objc_opt_class(THModelContainerNode);
      *(_QWORD *)&v22 = TSUDynamicCast(v20, objc_msgSend(a3, "parent")).n128_u64[0];
      if (v21)
        v19 = objc_msgSend(objc_msgSend(objc_msgSend(v21, "childNodes", v22), "firstObject"), "nodeGUID");
      v23 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("#chapterguid(%@)"), v22, v19);
      v24 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("epubcfi(/6/%ld!/2/1:0)"), 2 * *a5 + 2);
      v32[0] = v23;
      v31[0] = kBCReadingStatisticsHrefKey;
      v31[1] = kBCReadingStatisticsNameKey;
      v25 = objc_msgSend(a3, "title");
      v31[2] = kBCReadingStatisticsStartCFIKey;
      v32[1] = v25;
      v32[2] = v24;
      v33 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v32, v31, 3);
      -[THReadingStatisticsCollectorDelegate readingStatisticsCollector:addTOCEntries:ordinal:completion:](-[THReadingStatisticsCollector delegate](self, "delegate"), "readingStatisticsCollector:addTOCEntries:ordinal:completion:", self, +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v33, 1), *a5, 0);
    }
    if (-[THReadingStatisticsCollectorDelegate readingStatisticsCollector:needTextNodeCharacterCountsForOrdinal:](-[THReadingStatisticsCollector delegate](self, "delegate", v18), "readingStatisticsCollector:needTextNodeCharacterCountsForOrdinal:", self, *a5))-[NSOperationQueue addOperation:](-[THReadingStatisticsCollector chapterDataQueue](self, "chapterDataQueue"), "addOperation:", -[THReadingStatisticsScanOperation initWithDelegate:ordinal:applePubURL:documentEntryURI:]([THReadingStatisticsScanOperation alloc], "initWithDelegate:ordinal:applePubURL:documentEntryURI:", self, *a5, objc_msgSend(a4, "zipPackage"), objc_msgSend(v15, "applePubRelativePath")));
    ++*a5;
  }
  else
  {
    v26 = v17;
    if (v17)
    {
      v27 = (char *)objc_msgSend(v17, "count", v18);
      if (v27)
      {
        v28 = v27;
        v29 = 0;
        v30 = a6 + 1;
        do
        {
          -[THReadingStatisticsCollector _scanReadingStatisticsWithNode:root:ordinal:level:childIndex:](self, "_scanReadingStatisticsWithNode:root:ordinal:level:childIndex:", objc_msgSend(v26, "nodeAtIndex:", v29), a4, a5, v30, v29);
          ++v29;
        }
        while (v28 != v29);
      }
    }
  }
}

- (THReadingStatisticsCollectorDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (THReadingStatisticsCollectorDelegate *)a3;
}

- (BCCFISet)visibleContent
{
  return self->_visibleContent;
}

- (void)setVisibleContent:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (NSOperationQueue)chapterDataQueue
{
  return self->_chapterDataQueue;
}

- (void)setChapterDataQueue:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

@end
