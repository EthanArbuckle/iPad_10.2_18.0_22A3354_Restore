@implementation FRSubscribedTagRanker

- (void)prepareForUseWithCompletionHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[FRSubscribedTagRanker tagRanker](self, "tagRanker"));
  objc_msgSend(v5, "prepareForUseWithCompletionHandler:", v4);

}

- (id)rankTagIDsDescending:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FRSubscribedTagRanker tagRanker](self, "tagRanker"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "rankTagIDsDescending:", v4));

  return v6;
}

- (FRSubscribedTagRanker)initWithTagRanker:(id)a3
{
  id v5;
  FRSubscribedTagRanker *v6;
  FRSubscribedTagRanker *v7;
  objc_super v9;

  v5 = a3;
  if (!v5 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_10007C604();
  v9.receiver = self;
  v9.super_class = (Class)FRSubscribedTagRanker;
  v6 = -[FRSubscribedTagRanker init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_tagRanker, a3);

  return v7;
}

- (FCTagRanking)tagRanker
{
  return self->_tagRanker;
}

- (FRSubscribedTagRanker)init
{
  id v2;
  void *v3;
  id v4;
  uint8_t buf[4];
  const char *v6;
  __int16 v7;
  char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  id v12;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    v2 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v6 = "-[FRSubscribedTagRanker init]";
    v7 = 2080;
    v8 = "FRSubscribedTagRanker.m";
    v9 = 1024;
    v10 = 21;
    v11 = 2114;
    v12 = v2;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FRSubscribedTagRanker init]"));
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v3, 0));

  objc_exception_throw(v4);
}

- (id)scoresForTagIDs:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FRSubscribedTagRanker tagRanker](self, "tagRanker"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "scoresForTagIDs:", v4));

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tagRanker, 0);
}

@end
