@implementation BKWK2LoaderContentInfoRequest

+ (BKWK2LoaderContentInfoRequest)contentInfoRequestWithLocation:(id)a3 bookSnapshot:(id)a4 ordinal:(unint64_t)a5 configuration:(id)a6 stylesheetSet:(id)a7 completion:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  BKWK2LoaderContentInfoRequest *v18;

  v13 = a8;
  v14 = a7;
  v15 = a6;
  v16 = a4;
  v17 = a3;
  v18 = -[BKWK2LoaderContentInfoRequest initWithLocation:bookSnapshot:ordinal:configuration:stylesheetSet:completion:]([BKWK2LoaderContentInfoRequest alloc], "initWithLocation:bookSnapshot:ordinal:configuration:stylesheetSet:completion:", v17, v16, a5, v15, v14, v13);

  return v18;
}

- (BKWK2LoaderContentInfoRequest)initWithLocation:(id)a3 bookSnapshot:(id)a4 ordinal:(unint64_t)a5 configuration:(id)a6 stylesheetSet:(id)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  BKWK2LoaderContentInfoRequest *v23;
  id obj;
  id v27;

  v27 = a3;
  obj = a4;
  v14 = a4;
  v15 = a8;
  v16 = a7;
  v17 = a6;
  objc_msgSend(v17, "contentLayoutSize");
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[BEWebViewFactoryPaginationOptions paginationOptionsForBookInfoSnapshot:withConfiguration:contentLayoutSize:](BEWebViewFactoryPaginationOptions, "paginationOptionsForBookInfoSnapshot:withConfiguration:contentLayoutSize:", v14, v17));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[BEContentCleanupJSOptions cleanupJSOptionsForBookInfoSnapshot:withConfiguration:](BEContentCleanupJSOptions, "cleanupJSOptionsForBookInfoSnapshot:withConfiguration:", v14, v17));
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[BECFIUtilitiesJSOptions cfiUtilitiesJSOptionsForBookInfoSnapshot:ordinal:](BECFIUtilitiesJSOptions, "cfiUtilitiesJSOptionsForBookInfoSnapshot:ordinal:", v14, a5));
  objc_msgSend(v17, "fontSize");
  v22 = v21;

  v23 = -[BKWK2LoaderContentInfoRequest initWithPaginationOptions:cleanupOptions:cfiOptions:ordinal:stylesheetSet:fontSize:completion:](self, "initWithPaginationOptions:cleanupOptions:cfiOptions:ordinal:stylesheetSet:fontSize:completion:", v18, v19, v20, a5, v16, v15, v22);
  if (v23)
  {
    objc_storeStrong((id *)&v23->_location, a3);
    objc_storeStrong((id *)&v23->_bookSnapshot, obj);
  }

  return v23;
}

+ (BKWK2LoaderContentInfoRequest)contentInfoRequestWithPaginationOptions:(id)a3 cleanupOptions:(id)a4 cfiOptions:(id)a5 ordinal:(unint64_t)a6 stylesheetSet:(id)a7 completion:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  BKWK2LoaderContentInfoRequest *v18;
  BKWK2LoaderContentInfoRequest *v19;

  v13 = a8;
  v14 = a7;
  v15 = a5;
  v16 = a4;
  v17 = a3;
  v18 = [BKWK2LoaderContentInfoRequest alloc];
  objc_msgSend(v17, "fontSize");
  v19 = -[BKWK2LoaderContentInfoRequest initWithPaginationOptions:cleanupOptions:cfiOptions:ordinal:stylesheetSet:fontSize:completion:](v18, "initWithPaginationOptions:cleanupOptions:cfiOptions:ordinal:stylesheetSet:fontSize:completion:", v17, v16, v15, a6, v14, v13);

  return v19;
}

- (BKWK2LoaderContentInfoRequest)initWithPaginationOptions:(id)a3 cleanupOptions:(id)a4 cfiOptions:(id)a5 ordinal:(unint64_t)a6 stylesheetSet:(id)a7 fontSize:(double)a8 completion:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  BKWK2LoaderContentInfoRequest *v20;
  BKWK2LoaderContentInfoRequest *v21;
  id v22;
  id completion;
  id v26;
  objc_super v27;

  v26 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a7;
  v19 = a9;
  v27.receiver = self;
  v27.super_class = (Class)BKWK2LoaderContentInfoRequest;
  v20 = -[BKWK2LoaderContentInfoRequest init](&v27, "init");
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_paginationOptions, a3);
    objc_storeStrong((id *)&v21->_cleanupOptions, a4);
    objc_storeStrong((id *)&v21->_cfiOptions, a5);
    objc_storeStrong((id *)&v21->_stylesheetSet, a7);
    v21->_ordinal = a6;
    v21->_fontSize = a8;
    v21->_state = 0;
    v21->_restoreFrame = 1;
    v22 = objc_msgSend(v19, "copy");
    completion = v21->_completion;
    v21->_completion = v22;

  }
  return v21;
}

- (NSString)requestID
{
  NSString *requestID;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSString *v12;
  NSString *v13;

  requestID = self->_requestID;
  if (!requestID)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKWK2LoaderContentInfoRequest bookSnapshot](self, "bookSnapshot"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKWK2LoaderContentInfoRequest bookSnapshot](self, "bookSnapshot"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "assetID"));
    -[BKWK2LoaderContentInfoRequest fontSize](self, "fontSize");
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKWK2LoaderContentInfoRequest stylesheetSet](self, "stylesheetSet"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "unifedAllFrameStylesheet"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%@-%@-%@"), v4, v6, v7, v9));

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "dataUsingEncoding:", 4));
    v12 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bu_sha256"));
    v13 = self->_requestID;
    self->_requestID = v12;

    requestID = self->_requestID;
  }
  return requestID;
}

- (BOOL)isRequestValid
{
  return (char *)-[BKWK2LoaderContentInfoRequest state](self, "state") != (char *)&dword_4 + 3;
}

- (void)invalidateRequest
{
  -[BKWK2LoaderContentInfoRequest setState:](self, "setState:", 7);
}

- (void)setState:(unint64_t)a3
{
  id v5;
  NSObject *v6;
  unint64_t state;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;

  v5 = _AERePaginationLog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    state = self->_state;
    if (state > 7)
      v8 = 0;
    else
      v8 = (uint64_t)*(&off_1C1118 + state);
    if (a3 > 7)
      v9 = 0;
    else
      v9 = (uint64_t)*(&off_1C1118 + a3);
    v10 = 138412546;
    v11 = v8;
    v12 = 2112;
    v13 = v9;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Request transition from '%@' to '%@'", (uint8_t *)&v10, 0x16u);
  }

  self->_state = a3;
}

- (id)description
{
  id v3;
  NSString *v4;
  NSString *v5;
  void *v6;
  void *v7;
  NSString *v8;
  void *v9;
  NSString *v10;
  void *v11;
  void *v12;
  NSString *v13;
  void *v14;
  void *v15;
  NSString *v16;
  void *v17;
  unint64_t v18;
  uint64_t v19;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)BKWK2LoaderContentInfoRequest;
  v3 = -[BKWK2LoaderContentInfoRequest description](&v26, "description");
  v23 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v4 = NSStringFromSelector("requestID");
  v25 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[BKWK2LoaderContentInfoRequest requestID](self, "requestID"));
  v5 = NSStringFromSelector("location");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKWK2LoaderContentInfoRequest location](self, "location"));
  v8 = NSStringFromSelector("fontSize");
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  -[BKWK2LoaderContentInfoRequest fontSize](self, "fontSize");
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  v10 = NSStringFromSelector("bookSnapshot");
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKWK2LoaderContentInfoRequest bookSnapshot](self, "bookSnapshot"));
  v13 = NSStringFromSelector("stylesheetSet");
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKWK2LoaderContentInfoRequest stylesheetSet](self, "stylesheetSet"));
  v16 = NSStringFromSelector("state");
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  v18 = -[BKWK2LoaderContentInfoRequest state](self, "state");
  if (v18 > 7)
    v19 = 0;
  else
    v19 = (uint64_t)*(&off_1C1118 + v18);
  v22 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: %@, %@ %@: %@, %@: %@, %@: %@, %@: %@, %@: %@"), v23, v25, v24, v6, v7, v9, v21, v11, v12, v14, v15, v17, v19));

  return v22;
}

- (void)setRequestID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BKLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
  objc_storeStrong((id *)&self->_location, a3);
}

- (AEBookInfoSnapshot)bookSnapshot
{
  return self->_bookSnapshot;
}

- (void)setBookSnapshot:(id)a3
{
  objc_storeStrong((id *)&self->_bookSnapshot, a3);
}

- (unint64_t)ordinal
{
  return self->_ordinal;
}

- (double)fontSize
{
  return self->_fontSize;
}

- (void)setFontSize:(double)a3
{
  self->_fontSize = a3;
}

- (BEWebViewFactoryPaginationOptions)paginationOptions
{
  return self->_paginationOptions;
}

- (void)setPaginationOptions:(id)a3
{
  objc_storeStrong((id *)&self->_paginationOptions, a3);
}

- (BEWebViewFactoryStylesheetSet)stylesheetSet
{
  return self->_stylesheetSet;
}

- (void)setStylesheetSet:(id)a3
{
  objc_storeStrong((id *)&self->_stylesheetSet, a3);
}

- (BEContentCleanupJSOptions)cleanupOptions
{
  return self->_cleanupOptions;
}

- (BECFIUtilitiesJSOptions)cfiOptions
{
  return self->_cfiOptions;
}

- (unint64_t)state
{
  return self->_state;
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (BOOL)restoreFrame
{
  return self->_restoreFrame;
}

- (void)setRestoreFrame:(BOOL)a3
{
  self->_restoreFrame = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_cfiOptions, 0);
  objc_storeStrong((id *)&self->_cleanupOptions, 0);
  objc_storeStrong((id *)&self->_stylesheetSet, 0);
  objc_storeStrong((id *)&self->_paginationOptions, 0);
  objc_storeStrong((id *)&self->_bookSnapshot, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_requestID, 0);
}

@end
