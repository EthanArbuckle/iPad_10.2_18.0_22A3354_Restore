@implementation SUCoreEventReporterDelegate

- (SUCoreEventReporterDelegate)initWithReporter:(id)a3
{
  id v4;
  SUCoreEventReporterDelegate *v5;
  SUCoreEventReporterDelegate *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SUCoreEventReporterDelegate;
  v5 = -[SUCoreEventReporterDelegate init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_reporter, v4);

  return v6;
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char isKindOfClass;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  _BOOL8 v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  id v26;

  v26 = a3;
  v8 = a4;
  v9 = a5;
  if (!v8 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    -[SUCoreEventReporterDelegate reporter](self, "reporter");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v23;
    v24 = CFSTR("task nil or not NSURLSessionTask");
LABEL_18:
    objc_msgSend(v23, "handleSendFinishedInvalidFileUUID:withError:", v24, v9);
    goto LABEL_19;
  }
  objc_msgSend(v8, "taskDescription");
  v10 = objc_claimAutoreleasedReturnValue();
  if (!v10
    || (v11 = (void *)v10,
        objc_msgSend(v8, "taskDescription"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        isKindOfClass = objc_opt_isKindOfClass(),
        v12,
        v11,
        (isKindOfClass & 1) == 0))
  {
    -[SUCoreEventReporterDelegate reporter](self, "reporter");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v23;
    v24 = CFSTR("task description nil or not NSString");
    goto LABEL_18;
  }
  objc_msgSend(v8, "taskDescription");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v8, "response");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v8, "response");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v17 = objc_opt_isKindOfClass();

      if ((v17 & 1) != 0)
      {
        objc_msgSend(v8, "response");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "statusCode");
        v20 = v19;
        v22 = v19 == 200 || v19 == 206;

      }
      else
      {
        v22 = 0;
        v20 = 8206;
      }
    }
    else
    {
      v22 = 0;
      v20 = 8205;
    }
    -[SUCoreEventReporterDelegate reporter](self, "reporter");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleSendFinishedWithFileUUID:sendSucceeded:withStatusCode:withError:", v14, v22, v20, v9);
  }
  else
  {
    -[SUCoreEventReporterDelegate reporter](self, "reporter");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleSendFinishedInvalidFileUUID:withError:", CFSTR("task descriptor nil or not NSString (after get)"), v9);
  }

LABEL_19:
}

- (SUCoreEventReporter)reporter
{
  return (SUCoreEventReporter *)objc_loadWeakRetained((id *)&self->_reporter);
}

- (void)setReporter:(id)a3
{
  objc_storeWeak((id *)&self->_reporter, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_reporter);
}

@end
