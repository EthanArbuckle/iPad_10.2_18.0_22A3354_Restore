@implementation WFChooseFromListDialogRequest

- (WFChooseFromListDialogRequest)initWithItems:(id)a3 allowsMultipleSelection:(BOOL)a4 message:(id)a5 attribution:(id)a6 prompt:(id)a7 parameterKey:(id)a8
{
  _BOOL4 v12;
  id v14;
  id v15;
  id v16;
  WFChooseFromListDialogRequest *v17;
  uint64_t v18;
  NSArray *items;
  uint64_t v20;
  NSString *message;
  void *v22;
  int v23;
  void *v24;
  uint64_t v25;
  NSString *parameterKey;
  WFChooseFromListDialogRequest *v27;
  objc_super v29;

  v12 = a4;
  v14 = a3;
  v15 = a5;
  v16 = a8;
  v29.receiver = self;
  v29.super_class = (Class)WFChooseFromListDialogRequest;
  v17 = -[WFDialogRequest initWithAttribution:prompt:](&v29, sel_initWithAttribution_prompt_, a6, a7);
  if (!v17)
    goto LABEL_13;
  v18 = objc_msgSend(v14, "copy");
  items = v17->_items;
  v17->_items = (NSArray *)v18;

  v17->_allowsMultipleSelection = v12;
  v20 = objc_msgSend(v15, "copy");
  message = v17->_message;
  v17->_message = (NSString *)v20;

  if (v12)
  {
    +[WFDialogButton doneButton](WFDialogButton, "doneButton");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22 = 0;
  }
  objc_storeStrong((id *)&v17->_doneButton, v22);
  if (v12)
  {

LABEL_9:
    +[WFDialogButton cancelButton](WFDialogButton, "cancelButton");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 1;
    goto LABEL_10;
  }
  if (!-[NSArray count](v17->_items, "count"))
    goto LABEL_9;
  v23 = 0;
  v24 = 0;
LABEL_10:
  objc_storeStrong((id *)&v17->_cancelButton, v24);
  if (v23)

  v25 = objc_msgSend(v16, "copy");
  parameterKey = v17->_parameterKey;
  v17->_parameterKey = (NSString *)v25;

  v27 = v17;
LABEL_13:

  return v17;
}

- (WFDialogListItemStore)dataStore
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  -[WFChooseFromListDialogRequest xpcConnection](self, "xpcConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0CB3B38]);
    -[WFChooseFromListDialogRequest dataStoreEndpoint](self, "dataStoreEndpoint");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v4, "initWithListenerEndpoint:", v5);
    -[WFChooseFromListDialogRequest setXpcConnection:](self, "setXpcConnection:", v6);

    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEE82EB8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFChooseFromListDialogRequest xpcConnection](self, "xpcConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setRemoteObjectInterface:", v7);

    -[WFChooseFromListDialogRequest xpcConnection](self, "xpcConnection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "resume");

  }
  -[WFChooseFromListDialogRequest xpcConnection](self, "xpcConnection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "remoteObjectProxy");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (WFDialogListItemStore *)v11;
}

- (NSString)emptyStateMessage
{
  return (NSString *)WFLocalizedString(CFSTR("No options available."));
}

- (id)requestByCompactingRequest
{
  void *v3;
  unint64_t v4;
  WFChooseFromListDialogRequest *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL8 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  -[WFChooseFromListDialogRequest items](self, "items");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4 > 0x64)
  {
    v6 = objc_alloc((Class)objc_opt_class());
    -[WFChooseFromListDialogRequest items](self, "items");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", 0, 100);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectsAtIndexes:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[WFChooseFromListDialogRequest allowsMultipleSelection](self, "allowsMultipleSelection");
    -[WFChooseFromListDialogRequest message](self, "message");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFDialogRequest attribution](self, "attribution");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFDialogRequest prompt](self, "prompt");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFChooseFromListDialogRequest parameterKey](self, "parameterKey");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (WFChooseFromListDialogRequest *)objc_msgSend(v6, "initWithItems:allowsMultipleSelection:message:attribution:prompt:parameterKey:", v9, v10, v11, v12, v13, v14);

  }
  else
  {
    v5 = self;
  }
  return v5;
}

- (WFChooseFromListDialogRequest)initWithCoder:(id)a3
{
  id v4;
  WFChooseFromListDialogRequest *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *items;
  uint64_t v11;
  NSString *message;
  uint64_t v13;
  WFDialogButton *doneButton;
  uint64_t v15;
  WFDialogButton *cancelButton;
  uint64_t v17;
  NSXPCListenerEndpoint *dataStoreEndpoint;
  uint64_t v19;
  WFListDisplayConfiguration *displayConfiguration;
  uint64_t v21;
  NSString *parameterKey;
  WFChooseFromListDialogRequest *v23;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)WFChooseFromListDialogRequest;
  v5 = -[WFDialogRequest initWithCoder:](&v25, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("items"));
    v9 = objc_claimAutoreleasedReturnValue();
    items = v5->_items;
    v5->_items = (NSArray *)v9;

    v5->_allowsMultipleSelection = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("allowsMultipleSelection"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("message"));
    v11 = objc_claimAutoreleasedReturnValue();
    message = v5->_message;
    v5->_message = (NSString *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("doneButton"));
    v13 = objc_claimAutoreleasedReturnValue();
    doneButton = v5->_doneButton;
    v5->_doneButton = (WFDialogButton *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cancelButton"));
    v15 = objc_claimAutoreleasedReturnValue();
    cancelButton = v5->_cancelButton;
    v5->_cancelButton = (WFDialogButton *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dataStoreEndpoint"));
    v17 = objc_claimAutoreleasedReturnValue();
    dataStoreEndpoint = v5->_dataStoreEndpoint;
    v5->_dataStoreEndpoint = (NSXPCListenerEndpoint *)v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayConfiguration"));
    v19 = objc_claimAutoreleasedReturnValue();
    displayConfiguration = v5->_displayConfiguration;
    v5->_displayConfiguration = (WFListDisplayConfiguration *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("parameterKey"));
    v21 = objc_claimAutoreleasedReturnValue();
    parameterKey = v5->_parameterKey;
    v5->_parameterKey = (NSString *)v21;

    v23 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)WFChooseFromListDialogRequest;
  v4 = a3;
  -[WFDialogRequest encodeWithCoder:](&v12, sel_encodeWithCoder_, v4);
  -[WFChooseFromListDialogRequest items](self, "items", v12.receiver, v12.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("items"));

  objc_msgSend(v4, "encodeBool:forKey:", -[WFChooseFromListDialogRequest allowsMultipleSelection](self, "allowsMultipleSelection"), CFSTR("allowsMultipleSelection"));
  -[WFChooseFromListDialogRequest message](self, "message");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("message"));

  -[WFChooseFromListDialogRequest doneButton](self, "doneButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("doneButton"));

  -[WFChooseFromListDialogRequest cancelButton](self, "cancelButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("cancelButton"));

  -[WFChooseFromListDialogRequest dataStoreEndpoint](self, "dataStoreEndpoint");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("dataStoreEndpoint"));

  -[WFChooseFromListDialogRequest displayConfiguration](self, "displayConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("displayConfiguration"));

  -[WFChooseFromListDialogRequest parameterKey](self, "parameterKey");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("parameterKey"));

}

- (NSArray)items
{
  return self->_items;
}

- (BOOL)allowsMultipleSelection
{
  return self->_allowsMultipleSelection;
}

- (NSString)message
{
  return self->_message;
}

- (WFListDisplayConfiguration)displayConfiguration
{
  return self->_displayConfiguration;
}

- (void)setDisplayConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_displayConfiguration, a3);
}

- (WFDialogButton)doneButton
{
  return self->_doneButton;
}

- (WFDialogButton)cancelButton
{
  return self->_cancelButton;
}

- (NSXPCListenerEndpoint)dataStoreEndpoint
{
  return self->_dataStoreEndpoint;
}

- (void)setDataStoreEndpoint:(id)a3
{
  objc_storeStrong((id *)&self->_dataStoreEndpoint, a3);
}

- (NSString)parameterKey
{
  return self->_parameterKey;
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setXpcConnection:(id)a3
{
  objc_storeStrong((id *)&self->_xpcConnection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_parameterKey, 0);
  objc_storeStrong((id *)&self->_dataStoreEndpoint, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_doneButton, 0);
  objc_storeStrong((id *)&self->_displayConfiguration, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_items, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
