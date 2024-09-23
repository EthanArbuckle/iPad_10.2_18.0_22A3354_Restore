@implementation ChromeComponentUpdateInfo

+ (BOOL)supportsCallstackSymbols
{
  id v2;
  NSObject *v3;
  BOOL v4;

  v2 = sub_100AB075C();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG);

  return v4;
}

- (ChromeComponentUpdateInfo)initWithCompletionHandler:(id)a3
{
  id v4;
  ChromeComponentUpdateInfo *v5;
  id v6;
  id completionHandler;
  uint64_t v8;
  NSArray *callStackSymbols;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ChromeComponentUpdateInfo;
  v5 = -[ChromeComponentUpdateInfo init](&v11, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    completionHandler = v5->_completionHandler;
    v5->_completionHandler = v6;

    if (+[ChromeComponentUpdateInfo supportsCallstackSymbols](ChromeComponentUpdateInfo, "supportsCallstackSymbols"))
    {
      v8 = objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
      callStackSymbols = v5->_callStackSymbols;
      v5->_callStackSymbols = (NSArray *)v8;

    }
  }

  return v5;
}

- (ChromeComponentUpdateInfo)init
{
  return -[ChromeComponentUpdateInfo initWithCompletionHandler:](self, "initWithCompletionHandler:", 0);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (NSArray)callStackSymbols
{
  return self->_callStackSymbols;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callStackSymbols, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

@end
