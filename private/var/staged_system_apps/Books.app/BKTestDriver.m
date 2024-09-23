@implementation BKTestDriver

+ (void)prewarm
{
  if (qword_1009F51F0 != -1)
    dispatch_once(&qword_1009F51F0, &stru_1008EE8B8);
}

+ (id)shared
{
  return (id)qword_1009F51E8;
}

- (void)setEventDispatcher:(id)a3
{
  objc_storeStrong((id *)&self->_eventDispatcher, a3);
}

- (BKTestDriver)init
{
  BKTestDriver *v2;
  BKTestDriver *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *queue;
  uint64_t v12;
  NSMutableDictionary *bookMap;
  void *v14;
  void *v15;
  BKBookReader *v16;
  uint64_t v17;
  NSString *booksTestRoot;
  BKBookReader *v19;
  BKBookReader *machine;
  void *v21;
  OS_dispatch_queue *v22;
  NSMutableDictionary *v23;
  NSString *v24;
  void *v25;
  void *v26;
  void *v27;
  objc_super v29;

  v29.receiver = self;
  v29.super_class = (Class)BKTestDriver;
  v2 = -[BKTestDriver init](&v29, "init");
  v3 = v2;
  if (v2)
  {
    v2->_idSeq = 0;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v5 = objc_msgSend(v4, "BOOLForKey:", CFSTR("BKTestEPubLayout"));

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v7 = objc_msgSend(v6, "BOOLForKey:", CFSTR("BKTestEPubPowerConsumption"));

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v3->_loop = objc_msgSend(v8, "BOOLForKey:", CFSTR("BKTestEPubLoopFirstBook"));

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v3->_firstPage = (int64_t)objc_msgSend(v9, "integerForKey:", CFSTR("BKTestEPubFirstPage"));

    if (v3->_firstPage <= 0)
      v3->_firstPage = 1;
    -[BKTestDriver clear](v3, "clear");
    if ((v5 | v7) == 1)
    {
      v10 = dispatch_queue_create("com.apple.iBooks.TestDriver", 0);
      queue = v3->_queue;
      v3->_queue = (OS_dispatch_queue *)v10;

      v12 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
      bookMap = v3->_bookMap;
      v3->_bookMap = (NSMutableDictionary *)v12;

      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL bu_booksRepositoryURL](NSURL, "bu_booksRepositoryURL"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "URLByAppendingPathComponent:", CFSTR("Tests")));
      v16 = (BKBookReader *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "path"));

      v17 = objc_claimAutoreleasedReturnValue(-[BKBookReader stringByAppendingPathComponent:](v16, "stringByAppendingPathComponent:", CFSTR("Books")));
      booksTestRoot = v3->_booksTestRoot;
      v3->_booksTestRoot = (NSString *)v17;

      v19 = -[BKBookReader initWithDelegate:]([BKBookReader alloc], "initWithDelegate:", v3);
      machine = v3->_machine;
      v3->_machine = v19;

      v21 = (void *)objc_claimAutoreleasedReturnValue(+[AETestDriver shared](AETestDriver, "shared"));
      objc_msgSend(v21, "setDelegate:", v3);

    }
    else
    {
      v22 = v3->_queue;
      v3->_queue = 0;

      v23 = v3->_bookMap;
      v3->_bookMap = 0;

      v24 = v3->_booksTestRoot;
      v3->_booksTestRoot = 0;

      v16 = v3->_machine;
      v3->_machine = 0;
    }

    if (v5)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[AETestDriver shared](AETestDriver, "shared"));
      objc_msgSend(v25, "setLayoutDelegate:", v3);

    }
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[BKTestDriver machine](v3, "machine"));

    if (v26)
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[BKTestDriver machine](v3, "machine"));
      objc_msgSend(v27, "start");

    }
  }
  return v3;
}

- (void)clear
{
  -[BKTestDriver setCurrentBook:](self, "setCurrentBook:", -1);
  -[BKTestDriver setBookList:](self, "setBookList:", 0);
  -[BKTestDriver setLibraryController:](self, "setLibraryController:", 0);
  -[BKTestDriver setBookController:](self, "setBookController:", 0);
  -[BKTestDriver setPaginationEnded:](self, "setPaginationEnded:", 0);
}

+ (BOOL)createPath:(id)a3 errorLabel:(id)a4
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  uint64_t v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v8 = 0;
  v6 = objc_msgSend(v5, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v4, 1, 0, &v8);

  return v6;
}

- (BOOL)createFile:(id)a3 content:(id)a4 errorLabel:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  uint64_t v15;

  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKTestDriver booksTestRoot](self, "booksTestRoot"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/%@"), v9, v8));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringByDeletingLastPathComponent"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v15 = 0;
  LODWORD(v8) = objc_msgSend(v12, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v11, 1, 0, &v15);

  if ((_DWORD)v8)
    v13 = objc_msgSend(v7, "writeToFile:atomically:", v10, 1);
  else
    v13 = 0;

  return v13;
}

- (void)deleteFile:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKTestDriver booksTestRoot](self, "booksTestRoot"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/%@"), v5, v4));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v8 = 0;
  objc_msgSend(v7, "removeItemAtPath:error:", v6, &v8);

}

- (id)getJsonFrom:(id)a3 errorLabel:(id)a4
{
  uint64_t v5;

  v5 = 0;
  return (id)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", a3, 1, &v5));
}

- (BOOL)createJsonFile:(id)a3 content:(id)a4 errorLabel:(id)a5
{
  id v8;
  id v9;
  void *v10;
  BOOL v11;

  v8 = a3;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKTestDriver getJsonFrom:errorLabel:](self, "getJsonFrom:errorLabel:", a4, v9));
  if (v10)
    v11 = -[BKTestDriver createFile:content:errorLabel:](self, "createFile:content:errorLabel:", v8, v10, v9);
  else
    v11 = 0;

  return v11;
}

- (id)createBookDirectory:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKTestDriver booksTestRoot](self, "booksTestRoot"));
  v6 = +[BKTestDriver createPath:errorLabel:](BKTestDriver, "createPath:errorLabel:", v5, v4);

  if (v6)
  {
    do
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKTestDriver booksTestRoot](self, "booksTestRoot"));
      v8 = -[BKTestDriver idSeq](self, "idSeq") + 1;
      -[BKTestDriver setIdSeq:](self, "setIdSeq:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/%d"), v7, v8));

      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
      LODWORD(v8) = objc_msgSend(v10, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v9, 0, 0, 0);

      v11 = 0;
      if ((_DWORD)v8)
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d"), -[BKTestDriver idSeq](self, "idSeq")));

    }
    while (!v11);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)getBookInfo:(id)a3 errorLabel:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  void *v20;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKTestDriver bookMap](self, "bookMap"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", v6));

  if (!v9)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKTestDriver createBookDirectory:](self, "createBookDirectory:", v7));
    objc_msgSend(v9, "setObject:forKey:", v10, CFSTR("path"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/info.json"), v10));
    objc_msgSend(v9, "setObject:forKey:", v20, CFSTR("info-path"));
    -[BKTestDriver createJsonFile:content:errorLabel:](self, "createJsonFile:content:errorLabel:", v20, v6, v7);
    objc_msgSend(v9, "setObject:forKey:", v6, CFSTR("info"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/pages"), v10));
    objc_msgSend(v9, "setObject:forKey:", v19, CFSTR("pages-path"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/pagination"), v10));
    objc_msgSend(v9, "setObject:forKey:", v11, CFSTR("pagination-path"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/result.json"), v11));
    objc_msgSend(v9, "setObject:forKey:", v12, CFSTR("pagination-result-path"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/presentation"), v10));
    objc_msgSend(v9, "setObject:forKey:", v13, CFSTR("presentation-path"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    objc_msgSend(v9, "setObject:forKey:", v14, CFSTR("pagination-items"));

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    objc_msgSend(v9, "setObject:forKey:", v15, CFSTR("presentation-items"));

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    objc_msgSend(v9, "setObject:forKey:", v16, CFSTR("pages"));

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKTestDriver bookMap](self, "bookMap"));
    objc_msgSend(v17, "setObject:forKey:", v9, v6);

  }
  return v9;
}

- (id)getValueForKey:(id)a3 from:(id)a4 errorLabel:(id)a5
{
  return objc_msgSend(a4, "valueForKeyPath:", a3);
}

- (void)recordPaginationInfo:(id)a3 info:(id)a4 renderTree:(id)a5 pageCount:(unint64_t)a6 errorLabel:(id)a7
{
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  NSString *v26;
  void *v27;
  unsigned int v28;
  uint64_t v29;
  void *v30;
  void *v31;
  unsigned int v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  id v42;
  id v43;

  v42 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKTestDriver getValueForKey:from:errorLabel:](self, "getValueForKey:from:errorLabel:", CFSTR("fail"), v13, v15));
  v17 = v16;
  if (v16 && (objc_msgSend(v16, "BOOLValue") & 1) == 0)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKTestDriver getValueForKey:from:errorLabel:](self, "getValueForKey:from:errorLabel:", CFSTR("book"), v13, v15));
    if (v18)
    {
      v41 = (void *)objc_claimAutoreleasedReturnValue(-[BKTestDriver getValueForKey:from:errorLabel:](self, "getValueForKey:from:errorLabel:", CFSTR("job.documentOrdinal"), v13, v15));
      if (v41)
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[BKTestDriver getBookInfo:errorLabel:](self, "getBookInfo:errorLabel:", v18, v15));
        if (v19)
        {
          v20 = v19;
          v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-path"), v42));
          v40 = v20;
          v22 = (void *)objc_claimAutoreleasedReturnValue(-[BKTestDriver getValueForKey:from:errorLabel:](self, "getValueForKey:from:errorLabel:", v21, v20, v15));

          v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/result.json"), v22));
          if (v23)
          {
            v38 = v23;
            -[BKTestDriver deleteFile:](self, "deleteFile:", v23);
            v39 = v22;
            v24 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/rt_%d.txt"), v22, objc_msgSend(v41, "intValue")));
            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "dataUsingEncoding:", 4));
            v26 = NSStringFromSelector(a2);
            v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
            v28 = -[BKTestDriver createFile:content:errorLabel:](self, "createFile:content:errorLabel:", v24, v25, v27);

            if (v28)
            {
              v29 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-items"), v42));

              v37 = (void *)v29;
              v43 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "objectForKey:", v29));
              if ((int)objc_msgSend(v43, "count") >= 1
                && (v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "lastObject")),
                    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("path"))),
                    v32 = objc_msgSend(v31, "isEqualToString:", v24),
                    v31,
                    v30,
                    v32))
              {
                v33 = (void *)v24;
                v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:", a6));
                v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "lastObject"));
                objc_msgSend(v35, "setObject:forKeyedSubscript:", v34, CFSTR("page-count"));

              }
              else
              {
                v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
                v33 = (void *)v24;
                objc_msgSend(v34, "setObject:forKeyedSubscript:", v24, CFSTR("path"));
                v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:", a6));
                objc_msgSend(v34, "setObject:forKeyedSubscript:", v36, CFSTR("page-count"));

                objc_msgSend(v43, "addObject:", v34);
              }
              v23 = v38;
              v22 = v39;

              v42 = v37;
            }
            else
            {
              v33 = (void *)v24;
              v23 = v38;
              v22 = v39;
            }

          }
          v19 = v40;
        }

      }
    }

  }
}

- (void)presentationControllerFinishedWebkitRendering:(id)a3 renderTree:(id)a4 pageCount:(unint64_t)a5
{
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  unint64_t v17;
  SEL v18;

  v9 = a3;
  v10 = a4;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKTestDriver queue](self, "queue"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1001BEC5C;
  v14[3] = &unk_1008EE8E0;
  v14[4] = self;
  v15 = v9;
  v16 = v10;
  v17 = a5;
  v18 = a2;
  v12 = v10;
  v13 = v9;
  -[BKTestDriver dispatchInQueue:async:](self, "dispatchInQueue:async:", v11, v14);

}

- (void)paginationControllerFinishedWebkitRendering:(id)a3 renderTree:(id)a4 pageCount:(unint64_t)a5
{
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  unint64_t v17;
  SEL v18;

  v9 = a3;
  v10 = a4;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKTestDriver queue](self, "queue"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1001BED94;
  v14[3] = &unk_1008EE8E0;
  v14[4] = self;
  v15 = v9;
  v16 = v10;
  v17 = a5;
  v18 = a2;
  v12 = v10;
  v13 = v9;
  -[BKTestDriver dispatchInQueue:async:](self, "dispatchInQueue:async:", v11, v14);

}

- (void)paginationControllerFinishedBookPagination:(id)a3
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  SEL v10;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKTestDriver queue](self, "queue"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001BEE9C;
  v8[3] = &unk_1008E8BE8;
  v8[4] = self;
  v9 = v5;
  v10 = a2;
  v7 = v5;
  -[BKTestDriver dispatchInQueue:async:](self, "dispatchInQueue:async:", v6, v8);

}

- (void)bookViewDidAppear:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void **v8;
  uint64_t v9;
  id (*v10)(uint64_t);
  void *v11;
  BKTestDriver *v12;
  id v13;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKTestDriver queue](self, "queue"));
  v8 = _NSConcreteStackBlock;
  v9 = 3221225472;
  v10 = sub_1001BF0C4;
  v11 = &unk_1008E7338;
  v12 = self;
  v13 = v4;
  v6 = v4;
  -[BKTestDriver dispatchInQueue:async:](self, "dispatchInQueue:async:", v5, &v8);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKTestDriver machine](self, "machine", v8, v9, v10, v11, v12));
  objc_msgSend(v7, "bookDidAppear");

}

- (void)bookViewWillDisappear:(id)a3
{
  void *v4;
  _QWORD v5[5];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKTestDriver queue](self, "queue", a3));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1001BF140;
  v5[3] = &unk_1008E72C0;
  v5[4] = self;
  -[BKTestDriver dispatchInQueue:async:](self, "dispatchInQueue:async:", v4, v5);

}

- (void)setLibraryViewController:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKTestDriver queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001BF1E8;
  v7[3] = &unk_1008E7338;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[BKTestDriver dispatchInQueue:async:](self, "dispatchInQueue:async:", v5, v7);

}

- (void)libraryViewWillDisappear:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKTestDriver machine](self, "machine", a3));

  if (v4)
    -[BKTestDriver setLibraryViewController:](self, "setLibraryViewController:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKTestDriver eventDispatcher](self, "eventDispatcher"));

  if (v5)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[BKTestDriver eventDispatcher](self, "eventDispatcher"));
    objc_msgSend(v6, "notifyLibraryController:", 0);

  }
}

- (void)libraryViewDidAppear:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKTestDriver eventDispatcher](self, "eventDispatcher"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKTestDriver eventDispatcher](self, "eventDispatcher"));
    objc_msgSend(v5, "notifyLibraryController:", v8);

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKTestDriver machine](self, "machine"));

  if (v6)
  {
    -[BKTestDriver setLibraryViewController:](self, "setLibraryViewController:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKTestDriver machine](self, "machine"));
    objc_msgSend(v7, "libraryDidAppear");

  }
}

- (void)dispatchInQueue:(id)a3 async:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id location;

  v6 = a4;
  v7 = a3;
  objc_initWeak(&location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001BF4E0;
  block[3] = &unk_1008E7F50;
  objc_copyWeak(&v11, &location);
  v10 = v6;
  v8 = v6;
  dispatch_async(v7, block);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)goToLibrary
{
  -[BKTestDriver dispatchInQueue:async:](self, "dispatchInQueue:async:", &_dispatch_main_q, &stru_1008EE900);
}

- (void)openNextBook
{
  _QWORD v3[5];

  -[BKTestDriver setCurrentBook:](self, "setCurrentBook:", (char *)-[BKTestDriver currentBook](self, "currentBook") + 1);
  -[BKTestDriver setPaginationEnded:](self, "setPaginationEnded:", 0);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1001BF664;
  v3[3] = &unk_1008E72C0;
  v3[4] = self;
  -[BKTestDriver dispatchInQueue:async:](self, "dispatchInQueue:async:", &_dispatch_main_q, v3);
}

- (void)processPageTurnResult:(BOOL)a3
{
  void *v5;
  _QWORD v6[5];
  BOOL v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKTestDriver queue](self, "queue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1001BF7F8;
  v6[3] = &unk_1008E83C0;
  v7 = a3;
  v6[4] = self;
  -[BKTestDriver dispatchInQueue:async:](self, "dispatchInQueue:async:", v5, v6);

}

- (void)goToNextPage
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1001BF898;
  v2[3] = &unk_1008E72C0;
  v2[4] = self;
  -[BKTestDriver dispatchInQueue:async:](self, "dispatchInQueue:async:", &_dispatch_main_q, v2);
}

- (void)goToFirstPage
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1001BF96C;
  v2[3] = &unk_1008E72C0;
  v2[4] = self;
  -[BKTestDriver dispatchInQueue:async:](self, "dispatchInQueue:async:", &_dispatch_main_q, v2);
}

- (void)takeSnapshot
{
  void *v4;
  unsigned int v5;
  _QWORD v6[6];

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[AETestDriver shared](AETestDriver, "shared"));
  v5 = objc_msgSend(v4, "testingLayout");

  if (v5)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1001BFAE0;
    v6[3] = &unk_1008E8CC8;
    v6[4] = self;
    v6[5] = a2;
    -[BKTestDriver dispatchInQueue:async:](self, "dispatchInQueue:async:", &_dispatch_main_q, v6);
  }
}

- (id)createResultsJsonFile
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKTestDriver bookMap](self, "bookMap"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allValues"));

  if (objc_msgSend(v6, "count"))
  {
    v7 = 0;
    do
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", v7));
      objc_msgSend(v4, "addObject:", v8);

      ++v7;
    }
    while ((unint64_t)objc_msgSend(v6, "count") > v7);
  }
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("info"));

  return v3;
}

- (void)terminateBookTest
{
  void *v4;
  void *v5;
  void *v6;
  NSString *v7;
  void *v8;
  void *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  NSString *v14;
  void *v15;
  id v16;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKTestDriver bookController](self, "bookController"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKTestDriver bookController](self, "bookController"));
    v16 = (id)objc_claimAutoreleasedReturnValue(+[AETestDriver getBookKeyWithBookController:](AETestDriver, "getBookKeyWithBookController:", v5));

    v6 = v16;
    if (v16)
    {
      v7 = NSStringFromSelector(a2);
      v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKTestDriver getBookInfo:errorLabel:](self, "getBookInfo:errorLabel:", v16, v8));

      if (v9)
      {
        v10 = NSStringFromSelector(a2);
        v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKTestDriver getValueForKey:from:errorLabel:](self, "getValueForKey:from:errorLabel:", CFSTR("path"), v9, v11));

        if (v12)
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/read-info.json"), v12));
          v14 = NSStringFromSelector(a2);
          v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
          -[BKTestDriver createJsonFile:content:errorLabel:](self, "createJsonFile:content:errorLabel:", v13, v9, v15);

        }
      }

      v6 = v16;
    }

  }
}

- (void)terminateTest
{
  void *v4;
  NSString *v5;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKTestDriver createResultsJsonFile](self, "createResultsJsonFile"));
  v5 = NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  -[BKTestDriver createJsonFile:content:errorLabel:](self, "createJsonFile:content:errorLabel:", CFSTR("result.json"), v4, v6);

  -[BKTestDriver clear](self, "clear");
}

- (BOOL)isInLibrary
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKTestDriver libraryController](self, "libraryController"));
  v3 = v2 != 0;

  return v3;
}

- (BOOL)hasPendingBook
{
  NSArray *bookList;
  int64_t currentBook;

  bookList = self->_bookList;
  if (bookList)
  {
    currentBook = self->_currentBook;
    LOBYTE(bookList) = currentBook < (int)(-[NSArray count](bookList, "count") - 1);
  }
  return (char)bookList;
}

- (BOOL)paginationDidEnd
{
  void *v3;
  BOOL v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[AETestDriver shared](AETestDriver, "shared"));
  if (objc_msgSend(v3, "testingLayout"))
    v4 = -[BKTestDriver paginationEnded](self, "paginationEnded");
  else
    v4 = 1;

  return v4;
}

- (BOOL)bookDidAppear
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKTestDriver bookController](self, "bookController"));
  v3 = v2 != 0;

  return v3;
}

- (BOOL)isLooping
{
  return -[BKTestDriver loop](self, "loop");
}

- (NSMutableDictionary)bookMap
{
  return self->_bookMap;
}

- (void)setBookMap:(id)a3
{
  objc_storeStrong((id *)&self->_bookMap, a3);
}

- (NSString)booksTestRoot
{
  return self->_booksTestRoot;
}

- (void)setBooksTestRoot:(id)a3
{
  objc_storeStrong((id *)&self->_booksTestRoot, a3);
}

- (BKBookReader)machine
{
  return self->_machine;
}

- (void)setMachine:(id)a3
{
  objc_storeStrong((id *)&self->_machine, a3);
}

- (UIViewController)libraryController
{
  return self->_libraryController;
}

- (void)setLibraryController:(id)a3
{
  objc_storeStrong((id *)&self->_libraryController, a3);
}

- (BKBookViewController)bookController
{
  return self->_bookController;
}

- (void)setBookController:(id)a3
{
  objc_storeStrong((id *)&self->_bookController, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (NSArray)bookList
{
  return self->_bookList;
}

- (void)setBookList:(id)a3
{
  objc_storeStrong((id *)&self->_bookList, a3);
}

- (int)idSeq
{
  return self->_idSeq;
}

- (void)setIdSeq:(int)a3
{
  self->_idSeq = a3;
}

- (int64_t)currentBook
{
  return self->_currentBook;
}

- (void)setCurrentBook:(int64_t)a3
{
  self->_currentBook = a3;
}

- (BOOL)paginationEnded
{
  return self->_paginationEnded;
}

- (void)setPaginationEnded:(BOOL)a3
{
  self->_paginationEnded = a3;
}

- (BOOL)loop
{
  return self->_loop;
}

- (void)setLoop:(BOOL)a3
{
  self->_loop = a3;
}

- (int64_t)firstPage
{
  return self->_firstPage;
}

- (void)setFirstPage:(int64_t)a3
{
  self->_firstPage = a3;
}

- (BKTestDriverEventDispatcher)eventDispatcher
{
  return self->_eventDispatcher;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventDispatcher, 0);
  objc_storeStrong((id *)&self->_bookList, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_bookController, 0);
  objc_storeStrong((id *)&self->_libraryController, 0);
  objc_storeStrong((id *)&self->_machine, 0);
  objc_storeStrong((id *)&self->_booksTestRoot, 0);
  objc_storeStrong((id *)&self->_bookMap, 0);
}

@end
