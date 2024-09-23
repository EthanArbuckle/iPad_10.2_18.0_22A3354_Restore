@implementation TUILinkEntityModel

- (TUILinkEntityModel)initWithType:(id)a3 identifier:(id)a4 title:(id)a5 actionsMap:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  TUILinkEntityModel *v14;
  NSString *v15;
  NSString *type;
  NSString *v17;
  NSString *identifier;
  NSString *v19;
  NSString *title;
  NSDictionary *v21;
  NSDictionary *actionsMap;
  objc_super v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)TUILinkEntityModel;
  v14 = -[TUILinkEntityModel init](&v24, "init");
  if (v14)
  {
    v15 = (NSString *)objc_msgSend(v10, "copy");
    type = v14->_type;
    v14->_type = v15;

    v17 = (NSString *)objc_msgSend(v11, "copy");
    identifier = v14->_identifier;
    v14->_identifier = v17;

    v19 = (NSString *)objc_msgSend(v12, "copy");
    title = v14->_title;
    v14->_title = v19;

    v21 = (NSDictionary *)objc_msgSend(v13, "copy");
    actionsMap = v14->_actionsMap;
    v14->_actionsMap = v21;

  }
  return v14;
}

- (NSSet)actions
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary allKeys](self->_actionsMap, "allKeys"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v2));

  return (NSSet *)v3;
}

- (NSString)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  NSString *title;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v12;

  v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v12 = *(_OWORD *)&self->_type;
  title = self->_title;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary allKeys](self->_actionsMap, "allKeys"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "sortedArrayUsingSelector:", "compare:"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "componentsJoinedByString:", CFSTR(",")));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ type=%@ identifier='%@' title='%@' actions=%@>"), v5, v12, title, v9));

  return (NSString *)v10;
}

- (NSString)type
{
  return self->_type;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)title
{
  return self->_title;
}

- (NSDictionary)actionsMap
{
  return self->_actionsMap;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionsMap, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

@end
