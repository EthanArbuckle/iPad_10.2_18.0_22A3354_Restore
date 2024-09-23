@implementation FRNewsReferralItemWidgetArticleListEncodableElement

- (FRNewsReferralItemWidgetArticleListEncodableElement)init
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
    v6 = "-[FRNewsReferralItemWidgetArticleListEncodableElement init]";
    v7 = 2080;
    v8 = "FRNewsReferralItemWidgetArticleList.m";
    v9 = 1024;
    v10 = 164;
    v11 = 2114;
    v12 = v2;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FRNewsReferralItemWidgetArticleListEncodableElement init]"));
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v3, 0));

  objc_exception_throw(v4);
}

- (FRNewsReferralItemWidgetArticleListEncodableElement)initWithJSONArray:(id)a3
{
  id v4;
  FRNewsReferralItemWidgetArticleListEncodableElement *v5;
  NSArray *v6;
  NSArray *JSONArray;
  objc_super v9;

  v4 = a3;
  if (!v4 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_100004AF8();
  v9.receiver = self;
  v9.super_class = (Class)FRNewsReferralItemWidgetArticleListEncodableElement;
  v5 = -[FRNewsReferralItemWidgetArticleListEncodableElement init](&v9, "init");
  if (v5)
  {
    v6 = (NSArray *)objc_msgSend(v4, "copy");
    JSONArray = v5->_JSONArray;
    v5->_JSONArray = v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[FRNewsReferralItemWidgetArticleListEncodableElement JSONArray](self, "JSONArray"));
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("b"));

}

- (FRNewsReferralItemWidgetArticleListEncodableElement)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSSet *v9;
  void *v10;
  void *v11;
  FRNewsReferralItemWidgetArticleListEncodableElement *v12;

  v4 = a3;
  v5 = objc_opt_class(NSString);
  v6 = objc_opt_class(NSNumber);
  v7 = objc_opt_class(NSArray);
  v8 = objc_opt_class(NSDictionary);
  v9 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v5, v6, v7, v8, objc_opt_class(NSNull), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("b")));

  v12 = -[FRNewsReferralItemWidgetArticleListEncodableElement initWithJSONArray:](self, "initWithJSONArray:", v11);
  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSArray)JSONArray
{
  return self->_JSONArray;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_JSONArray, 0);
}

@end
