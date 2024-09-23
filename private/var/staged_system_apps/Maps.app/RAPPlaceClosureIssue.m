@implementation RAPPlaceClosureIssue

- (id)_initWithKind:(int64_t)a3 localizedName:(id)a4
{
  id v6;
  RAPPlaceClosureIssue *v7;
  RAPPlaceClosureIssue *v8;
  NSString *v9;
  NSString *localizedName;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)RAPPlaceClosureIssue;
  v7 = -[RAPPlaceClosureIssue init](&v12, "init");
  v8 = v7;
  if (v7)
  {
    v7->_kind = a3;
    v9 = (NSString *)objc_msgSend(v6, "copy");
    localizedName = v8->_localizedName;
    v8->_localizedName = v9;

  }
  return v8;
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (int64_t)kind
{
  return self->_kind;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedName, 0);
}

@end
