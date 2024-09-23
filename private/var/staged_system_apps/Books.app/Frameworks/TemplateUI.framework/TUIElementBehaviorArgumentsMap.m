@implementation TUIElementBehaviorArgumentsMap

- (TUIElementBehaviorArgumentsMap)initWithBehavior:(id)a3 arguments:(id)a4
{
  id v6;
  id v7;
  TUIElementBehaviorArgumentsMap *v8;
  NSString *v9;
  NSString *behavior;
  NSDictionary *v11;
  NSDictionary *arguments;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)TUIElementBehaviorArgumentsMap;
  v8 = -[TUIElementBehaviorArgumentsMap init](&v14, "init");
  if (v8)
  {
    v9 = (NSString *)objc_msgSend(v6, "copy");
    behavior = v8->_behavior;
    v8->_behavior = v9;

    v11 = (NSDictionary *)objc_msgSend(v7, "copy");
    arguments = v8->_arguments;
    v8->_arguments = v11;

  }
  return v8;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_behavior, "hash");
}

- (BOOL)isEqual:(id)a3
{
  TUIElementBehaviorArgumentsMap *v4;
  TUIElementBehaviorArgumentsMap *v5;
  uint64_t v6;
  TUIElementBehaviorArgumentsMap *v7;
  TUIElementBehaviorArgumentsMap *v8;
  TUIElementBehaviorArgumentsMap *v9;
  NSString *behavior;
  uint64_t v11;
  void *v12;
  NSString *v13;
  void *v14;
  unsigned __int8 v15;
  NSDictionary *arguments;
  uint64_t v17;
  NSDictionary *v18;
  NSDictionary *v19;
  void *v20;

  v4 = (TUIElementBehaviorArgumentsMap *)a3;
  v5 = v4;
  if (self != v4)
  {
    v6 = objc_opt_class(v4);
    if (v6 == objc_opt_class(self))
      v7 = v5;
    else
      v7 = 0;
    v8 = v7;
    v9 = v8;
    if (!v8)
      goto LABEL_8;
    behavior = self->_behavior;
    v11 = objc_claimAutoreleasedReturnValue(-[TUIElementBehaviorArgumentsMap behavior](v8, "behavior"));
    if (behavior == (NSString *)v11)
    {

    }
    else
    {
      v12 = (void *)v11;
      v13 = self->_behavior;
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[TUIElementBehaviorArgumentsMap behavior](v9, "behavior"));
      LODWORD(v13) = -[NSString isEqualToString:](v13, "isEqualToString:", v14);

      if (!(_DWORD)v13)
      {
LABEL_8:
        v15 = 0;
LABEL_15:

        goto LABEL_16;
      }
    }
    arguments = self->_arguments;
    v17 = objc_claimAutoreleasedReturnValue(-[TUIElementBehaviorArgumentsMap arguments](v9, "arguments"));
    if (arguments == (NSDictionary *)v17)
    {
      v15 = 1;
    }
    else
    {
      v18 = (NSDictionary *)v17;
      v19 = self->_arguments;
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[TUIElementBehaviorArgumentsMap arguments](v9, "arguments"));
      v15 = -[NSDictionary isEqualToDictionary:](v19, "isEqualToDictionary:", v20);

      arguments = v18;
    }

    goto LABEL_15;
  }
  v15 = 1;
LABEL_16:

  return v15;
}

- (NSString)behavior
{
  return self->_behavior;
}

- (NSDictionary)arguments
{
  return self->_arguments;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_arguments, 0);
  objc_storeStrong((id *)&self->_behavior, 0);
}

@end
