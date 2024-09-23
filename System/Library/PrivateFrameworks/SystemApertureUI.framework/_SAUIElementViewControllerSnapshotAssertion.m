@implementation _SAUIElementViewControllerSnapshotAssertion

- (_SAUIElementViewControllerSnapshotAssertion)initWithElement:(id)a3 snapshotReason:(id)a4
{
  id v6;
  id v7;
  _SAUIElementViewControllerSnapshotAssertion *v8;
  void *v9;
  uint64_t v10;
  NSString *clientIdentifier;
  void *v12;
  uint64_t v13;
  NSString *elementIdentifier;
  uint64_t v15;
  NSString *snapshotReason;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)_SAUIElementViewControllerSnapshotAssertion;
  v8 = -[SAAssertion init](&v18, sel_init);
  if (v8)
  {
    objc_msgSend(v6, "clientIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    clientIdentifier = v8->_clientIdentifier;
    v8->_clientIdentifier = (NSString *)v10;

    objc_msgSend(v6, "elementIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copy");
    elementIdentifier = v8->_elementIdentifier;
    v8->_elementIdentifier = (NSString *)v13;

    v15 = objc_msgSend(v7, "copy");
    snapshotReason = v8->_snapshotReason;
    v8->_snapshotReason = (NSString *)v15;

  }
  return v8;
}

- (id)_descriptionConstituents
{
  NSString *clientIdentifier;
  NSString *elementIdentifier;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x24BDAC8D0];
  clientIdentifier = self->_clientIdentifier;
  v10[0] = CFSTR("associatedClientID");
  v10[1] = CFSTR("associatedElementID");
  elementIdentifier = self->_elementIdentifier;
  v11[0] = clientIdentifier;
  v11[1] = elementIdentifier;
  v10[2] = CFSTR("snapshotReason");
  v11[2] = self->_snapshotReason;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9.receiver = self;
  v9.super_class = (Class)_SAUIElementViewControllerSnapshotAssertion;
  -[SAAssertion _descriptionConstituents](&v9, sel__descriptionConstituents);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "arrayByAddingObject:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (NSString)elementIdentifier
{
  return self->_elementIdentifier;
}

- (NSString)snapshotReason
{
  return self->_snapshotReason;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshotReason, 0);
  objc_storeStrong((id *)&self->_elementIdentifier, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
}

@end
