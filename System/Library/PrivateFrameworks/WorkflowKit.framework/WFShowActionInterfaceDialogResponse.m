@implementation WFShowActionInterfaceDialogResponse

- (WFShowActionInterfaceDialogResponse)initWithCancelled:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WFShowActionInterfaceDialogResponse;
  return -[WFDialogResponse initWithCancelled:](&v4, sel_initWithCancelled_, a3);
}

- (WFShowActionInterfaceDialogResponse)initWithUnsupported:(BOOL)a3
{
  WFShowActionInterfaceDialogResponse *v4;
  WFShowActionInterfaceDialogResponse *v5;
  WFShowActionInterfaceDialogResponse *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WFShowActionInterfaceDialogResponse;
  v4 = -[WFDialogResponse initWithCancelled:](&v8, sel_initWithCancelled_, 0);
  v5 = v4;
  if (v4)
  {
    v4->_unsupported = a3;
    v6 = v4;
  }

  return v5;
}

- (WFShowActionInterfaceDialogResponse)initWithListenerEndpoint:(id)a3 userInterfaceType:(id)a4
{
  id v7;
  id v8;
  WFShowActionInterfaceDialogResponse *v9;
  WFShowActionInterfaceDialogResponse *v10;
  uint64_t v11;
  NSString *userInterfaceType;
  WFShowActionInterfaceDialogResponse *v13;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)WFShowActionInterfaceDialogResponse;
  v9 = -[WFDialogResponse initWithCancelled:](&v15, sel_initWithCancelled_, 0);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_listenerEndpoint, a3);
    v11 = objc_msgSend(v8, "copy");
    userInterfaceType = v10->_userInterfaceType;
    v10->_userInterfaceType = (NSString *)v11;

    v13 = v10;
  }

  return v10;
}

- (WFShowActionInterfaceDialogResponse)initWithCoder:(id)a3
{
  id v4;
  WFShowActionInterfaceDialogResponse *v5;
  uint64_t v6;
  NSXPCListenerEndpoint *listenerEndpoint;
  uint64_t v8;
  NSString *userInterfaceType;
  WFShowActionInterfaceDialogResponse *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WFShowActionInterfaceDialogResponse;
  v5 = -[WFDialogResponse initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("listenerEndpoint"));
    v6 = objc_claimAutoreleasedReturnValue();
    listenerEndpoint = v5->_listenerEndpoint;
    v5->_listenerEndpoint = (NSXPCListenerEndpoint *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("userInterfaceType"));
    v8 = objc_claimAutoreleasedReturnValue();
    userInterfaceType = v5->_userInterfaceType;
    v5->_userInterfaceType = (NSString *)v8;

    v5->_unsupported = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("unsupported"));
    v10 = v5;
  }

  return v5;
}

- (BOOL)shouldDismissDialogInTransientMode
{
  return 0;
}

- (NSString)description
{
  _BOOL4 v3;
  void *v4;
  objc_class *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = -[WFShowActionInterfaceDialogResponse isUnsupported](self, "isUnsupported");
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v3)
  {
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p, unsupported: YES>"), v6, self);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[WFShowActionInterfaceDialogResponse listenerEndpoint](self, "listenerEndpoint");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFShowActionInterfaceDialogResponse userInterfaceType](self, "userInterfaceType");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p, listenerEndpoint: %@, userInterfaceType: %@>"), v7, self, v9, v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFShowActionInterfaceDialogResponse;
  v4 = a3;
  -[WFDialogResponse encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[WFShowActionInterfaceDialogResponse listenerEndpoint](self, "listenerEndpoint", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("listenerEndpoint"));

  -[WFShowActionInterfaceDialogResponse userInterfaceType](self, "userInterfaceType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("userInterfaceType"));

  objc_msgSend(v4, "encodeBool:forKey:", -[WFShowActionInterfaceDialogResponse isUnsupported](self, "isUnsupported"), CFSTR("unsupported"));
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WFShowActionInterfaceDialogResponse;
  v4 = a3;
  -[WFDialogResponse encodeWithBSXPCCoder:](&v8, sel_encodeWithBSXPCCoder_, v4);
  -[WFShowActionInterfaceDialogResponse listenerEndpoint](self, "listenerEndpoint", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_endpoint");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeXPCObject:forKey:", v6, CFSTR("listenerEndpoint"));

  -[WFShowActionInterfaceDialogResponse userInterfaceType](self, "userInterfaceType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("userInterfaceType"));

  objc_msgSend(v4, "encodeBool:forKey:", -[WFShowActionInterfaceDialogResponse isUnsupported](self, "isUnsupported"), CFSTR("unsupported"));
}

- (WFShowActionInterfaceDialogResponse)initWithBSXPCCoder:(id)a3
{
  id v4;
  WFShowActionInterfaceDialogResponse *v5;
  void *v6;
  NSXPCListenerEndpoint *v7;
  NSXPCListenerEndpoint *listenerEndpoint;
  NSXPCListenerEndpoint *v9;
  uint64_t v10;
  NSString *userInterfaceType;
  WFShowActionInterfaceDialogResponse *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)WFShowActionInterfaceDialogResponse;
  v5 = -[WFDialogResponse initWithBSXPCCoder:](&v14, sel_initWithBSXPCCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeXPCObjectOfType:forKey:", MEMORY[0x1E0C81308], CFSTR("listenerEndpoint"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (NSXPCListenerEndpoint *)objc_alloc_init(MEMORY[0x1E0CB3B60]);
    -[NSXPCListenerEndpoint _setEndpoint:](v7, "_setEndpoint:", v6);
    listenerEndpoint = v5->_listenerEndpoint;
    v5->_listenerEndpoint = v7;
    v9 = v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("userInterfaceType"));
    v10 = objc_claimAutoreleasedReturnValue();
    userInterfaceType = v5->_userInterfaceType;
    v5->_userInterfaceType = (NSString *)v10;

    v5->_unsupported = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("unsupported"));
    v12 = v5;

  }
  return v5;
}

- (NSXPCListenerEndpoint)listenerEndpoint
{
  return self->_listenerEndpoint;
}

- (NSString)userInterfaceType
{
  return self->_userInterfaceType;
}

- (BOOL)isUnsupported
{
  return self->_unsupported;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInterfaceType, 0);
  objc_storeStrong((id *)&self->_listenerEndpoint, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

@end
