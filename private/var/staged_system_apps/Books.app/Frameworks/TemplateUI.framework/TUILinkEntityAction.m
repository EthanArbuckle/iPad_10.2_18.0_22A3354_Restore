@implementation TUILinkEntityAction

- (TUILinkEntityAction)initWithName:(id)a3 trigger:(id)a4 refId:(id)a5
{
  id v8;
  id v9;
  id v10;
  TUILinkEntityAction *v11;
  NSString *v12;
  NSString *name;
  NSString *v14;
  NSString *trigger;
  NSString *v16;
  NSString *refId;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)TUILinkEntityAction;
  v11 = -[TUILinkEntityAction init](&v19, "init");
  if (v11)
  {
    v12 = (NSString *)objc_msgSend(v8, "copy");
    name = v11->_name;
    v11->_name = v12;

    v14 = (NSString *)objc_msgSend(v9, "copy");
    trigger = v11->_trigger;
    v11->_trigger = v14;

    v16 = (NSString *)objc_msgSend(v10, "copy");
    refId = v11->_refId;
    v11->_refId = v16;

  }
  return v11;
}

- (id)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;

  v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ name=%@ trigger=%@ refId=%@>"), v5, self->_name, self->_trigger, self->_refId));

  return v6;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)trigger
{
  return self->_trigger;
}

- (NSString)refId
{
  return self->_refId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_refId, 0);
  objc_storeStrong((id *)&self->_trigger, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
