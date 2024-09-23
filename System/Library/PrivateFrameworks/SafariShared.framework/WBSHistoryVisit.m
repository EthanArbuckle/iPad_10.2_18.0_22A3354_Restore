@implementation WBSHistoryVisit

+ (float)weightedVisitCountFromScore:(int)a3
{
  return WBSHistoryVisitWeightedVisitCountFromScore(a3);
}

- (WBSHistoryVisit)initWithHistoryItem:(id)a3 visitTime:(double)a4 loadWasSuccesful:(BOOL)a5 wasHTTPNonGet:(BOOL)a6 origin:(int64_t)a7 attributes:(unint64_t)a8
{
  WBSHistoryVisit *v14;
  WBSHistoryVisit *v15;
  WBSHistoryVisit *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)WBSHistoryVisit;
  v14 = -[WBSHistoryVisit init](&v18, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_item, a3);
    v15->_visitTime = a4;
    v15->_loadSuccessful = a5;
    v15->_httpNonGet = a6;
    v15->_origin = a7;
    v15->_attributes = a8;
    v16 = v15;
  }

  return v15;
}

- (WBSHistoryVisit)initWithHistoryItem:(id)a3 visitTime:(double)a4
{
  return -[WBSHistoryVisit initWithHistoryItem:visitTime:loadWasSuccesful:wasHTTPNonGet:origin:attributes:](self, "initWithHistoryItem:visitTime:loadWasSuccesful:wasHTTPNonGet:origin:attributes:", a3, 1, 0, 0, 0, a4);
}

+ (id)synthesizedVisitWithHistoryItem:(id)a3 visitTime:(double)a4
{
  _BYTE *v4;

  v4 = (_BYTE *)objc_msgSend(objc_alloc((Class)a1), "initWithHistoryItem:visitTime:", a3, a4);
  v4[10] = 1;
  return v4;
}

- (WBSHistoryVisit)initWithHistoryItem:(id)a3 sqliteRow:(id)a4 baseColumnIndex:(unint64_t)a5
{
  WBSHistoryVisit *v8;
  WBSHistoryVisit *v9;
  double v10;
  uint64_t v11;
  NSString *title;
  unint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  WBSHistoryVisit *v21;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)WBSHistoryVisit;
  v8 = -[WBSHistoryVisit init](&v23, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_item, a3);
    v9->_databaseID = objc_msgSend(a4, "int64AtIndex:", a5);
    objc_msgSend(a4, "doubleAtIndex:", a5 + 2);
    v9->_visitTime = v10;
    objc_msgSend(a4, "stringAtIndex:", a5 + 3);
    v11 = objc_claimAutoreleasedReturnValue();
    title = v9->_title;
    v9->_title = (NSString *)v11;

    v9->_loadSuccessful = objc_msgSend(a4, "intAtIndex:", a5 + 4) != 0;
    v9->_httpNonGet = objc_msgSend(a4, "intAtIndex:", a5 + 5) != 0;
    v9->_synthesized = objc_msgSend(a4, "intAtIndex:", a5 + 6) != 0;
    v9->_attributes = objc_msgSend(a4, "int64AtIndex:", a5 + 11);
    v9->_redirectSourceDatabaseID = objc_msgSend(a4, "int64AtIndex:", a5 + 7);
    v9->_redirectDestinationDatabaseID = objc_msgSend(a4, "int64AtIndex:", a5 + 8);
    v13 = objc_msgSend(a4, "int64AtIndex:", a5 + 9);
    if (v13 >= 4)
    {
      v14 = WBS_LOG_CHANNEL_PREFIXHistory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[WBSHistoryVisit initWithHistoryItem:sqliteRow:baseColumnIndex:].cold.1(v13, v14, v15, v16, v17, v18, v19, v20);
      v13 = 0;
    }
    v9->_origin = v13;
    v21 = v9;
  }

  return v9;
}

- (WBSHistoryVisit)initWithHistoryItem:(id)a3 serviceVisit:(id)a4
{
  id v6;
  id v7;
  WBSHistoryVisit *v8;
  WBSHistoryVisit *v9;
  double v10;
  void *v11;
  uint64_t v12;
  NSString *title;
  WBSHistoryVisit *v14;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)WBSHistoryVisit;
  v8 = -[WBSHistoryVisit init](&v16, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_item, v6);
    v9->_databaseID = objc_msgSend(v7, "databaseID");
    objc_msgSend(v7, "visitTime");
    v9->_visitTime = v10;
    objc_msgSend(v7, "title");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "copy");
    title = v9->_title;
    v9->_title = (NSString *)v12;

    v9->_loadSuccessful = objc_msgSend(v7, "loadSuccessful");
    v9->_httpNonGet = objc_msgSend(v7, "httpNonGet");
    v9->_synthesized = objc_msgSend(v7, "synthesized");
    v9->_attributes = objc_msgSend(v7, "attributes");
    v9->_redirectSourceDatabaseID = objc_msgSend(v7, "redirectSource");
    v9->_redirectDestinationDatabaseID = objc_msgSend(v7, "redirectDestination");
    v9->_origin = objc_msgSend(v7, "origin");
    v14 = v9;
  }

  return v9;
}

- (void)setRedirectSource:(id)a3
{
  WBSHistoryVisit *v5;
  WBSHistoryVisit *v6;

  v5 = (WBSHistoryVisit *)a3;
  if (self->_redirectSource != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_redirectSource, a3);
    self->_redirectSourceDatabaseID = -[WBSHistoryVisit databaseID](v6, "databaseID");
    v5 = v6;
  }

}

- (void)setRedirectDestination:(id)a3
{
  WBSHistoryVisit *v5;
  WBSHistoryVisit *v6;

  v5 = (WBSHistoryVisit *)a3;
  if (self->_redirectDestination != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_redirectDestination, a3);
    self->_redirectDestinationDatabaseID = -[WBSHistoryVisit databaseID](v6, "databaseID");
    v5 = v6;
  }

}

- (void)setDatabaseID:(int64_t)a3
{
  if (self->_databaseID != a3)
  {
    self->_databaseID = a3;
    -[WBSHistoryVisit setRedirectDestinationDatabaseID:](self->_redirectSource, "setRedirectDestinationDatabaseID:");
    -[WBSHistoryVisit setRedirectSourceDatabaseID:](self->_redirectDestination, "setRedirectSourceDatabaseID:", a3);
  }
}

- (void)setRedirectSourceDatabaseID:(int64_t)a3
{
  self->_redirectSourceDatabaseID = a3;
}

- (void)setRedirectDestinationDatabaseID:(int64_t)a3
{
  self->_redirectDestinationDatabaseID = a3;
}

- (WBSHistoryVisit)endOfRedirectChain
{
  WBSHistoryVisit *i;
  void *v3;
  uint64_t v4;

  for (i = self; ; i = (WBSHistoryVisit *)v4)
  {
    -[WBSHistoryVisit redirectDestination](i, "redirectDestination");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
      break;
    -[WBSHistoryVisit redirectDestination](i, "redirectDestination");
    v4 = objc_claimAutoreleasedReturnValue();

  }
  return i;
}

- (unint64_t)redirectSourceChainLength
{
  return -[WBSHistoryVisit redirectSourceChainLength](self->_redirectSource, "redirectSourceChainLength") + 1;
}

- (WBSHistoryItem)item
{
  return (WBSHistoryItem *)objc_loadWeakRetained((id *)&self->_item);
}

- (void)setAttributes:(unint64_t)a3
{
  if (self->_attributes != a3)
    self->_attributes = a3;
}

- (BOOL)hasAttributes:(unint64_t)a3
{
  return (a3 & ~self->_attributes) == 0;
}

- (double)_weight
{
  return WBHistoryVisitWeightForAttributesAndOrigin(self->_attributes, self->_origin);
}

- (int64_t)databaseID
{
  return self->_databaseID;
}

- (int64_t)redirectSourceDatabaseID
{
  return self->_redirectSourceDatabaseID;
}

- (int64_t)redirectDestinationDatabaseID
{
  return self->_redirectDestinationDatabaseID;
}

- (void)setItem:(id)a3
{
  objc_storeWeak((id *)&self->_item, a3);
}

- (int64_t)origin
{
  return self->_origin;
}

- (void)setOrigin:(int64_t)a3
{
  self->_origin = a3;
}

- (double)visitTime
{
  return self->_visitTime;
}

- (NSString)title
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setTitle:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 64);
}

- (unint64_t)attributes
{
  return self->_attributes;
}

- (BOOL)loadWasSuccessful
{
  return self->_loadSuccessful;
}

- (void)setLoadSuccessful:(BOOL)a3
{
  self->_loadSuccessful = a3;
}

- (BOOL)wasHTTPNonGet
{
  return self->_httpNonGet;
}

- (BOOL)isSynthesized
{
  return self->_synthesized;
}

- (WBSHistoryVisit)redirectSource
{
  return self->_redirectSource;
}

- (WBSHistoryVisit)redirectDestination
{
  return self->_redirectDestination;
}

- (BOOL)didUserInteractWithPage
{
  return self->_didUserInteractWithPage;
}

- (void)setDidUserInteractWithPage:(BOOL)a3
{
  self->_didUserInteractWithPage = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_redirectDestination, 0);
  objc_storeStrong((id *)&self->_redirectSource, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_destroyWeak((id *)&self->_item);
}

- (WBSHistoryVisit)initWithHistoryItem:(id)a3 streamedVisit:(const _HistoryStreamedVisit *)a4
{
  id v6;
  WBSHistoryVisit *v7;
  WBSHistoryVisit *v8;
  uint64_t v9;
  NSString *title;
  unint64_t var10;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  WBSHistoryVisit *v19;
  objc_super v21;

  v6 = a3;
  v21.receiver = self;
  v21.super_class = (Class)WBSHistoryVisit;
  v7 = -[WBSHistoryVisit init](&v21, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_item, v6);
    v8->_databaseID = a4->var1;
    v8->_visitTime = a4->var3;
    if (a4->var13)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:");
      v9 = objc_claimAutoreleasedReturnValue();
      title = v8->_title;
      v8->_title = (NSString *)v9;
    }
    else
    {
      title = v8->_title;
      v8->_title = 0;
    }

    v8->_loadSuccessful = a4->var4 != 0;
    v8->_httpNonGet = a4->var5 != 0;
    v8->_synthesized = a4->var6 != 0;
    v8->_attributes = a4->var12;
    *(_OWORD *)&v8->_redirectSourceDatabaseID = *(_OWORD *)&a4->var8;
    var10 = a4->var10;
    if (var10 >= 4)
    {
      v12 = WBS_LOG_CHANNEL_PREFIXHistory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[WBSHistoryVisit initWithHistoryItem:sqliteRow:baseColumnIndex:].cold.1(var10, v12, v13, v14, v15, v16, v17, v18);
      var10 = 0;
    }
    v8->_origin = var10;
    v19 = v8;
  }

  return v8;
}

- (void)initWithHistoryItem:(uint64_t)a3 sqliteRow:(uint64_t)a4 baseColumnIndex:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_1A3D90000, a2, a3, "Encountered unexpected visit of origin %ld, treating as WBSHistoryVisitOriginNormal", a5, a6, a7, a8, 0);
}

@end
