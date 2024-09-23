@implementation PXComposeRecipientDataSource

- (PXComposeRecipientDataSource)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXComposeRecipientDataSourceManager.m"), 47, CFSTR("%s is not available as initializer"), "-[PXComposeRecipientDataSource init]");

  abort();
}

- (PXComposeRecipientDataSource)initWithComposeRecipients:(id)a3 recipients:(id)a4
{
  id v6;
  id v7;
  PXComposeRecipientDataSource *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  NSArray *composeRecipients;
  uint64_t v13;
  NSSet *recipients;
  objc_super v16;
  uint8_t buf[4];
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PXComposeRecipientDataSource;
  v8 = -[PXComposeRecipientDataSource init](&v16, sel_init);
  if (v8)
  {
    PLSharingGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v10 = objc_msgSend(v6, "count");
      *(_DWORD *)buf = 134217984;
      v18 = v10;
      _os_log_impl(&dword_1A6789000, v9, OS_LOG_TYPE_DEBUG, "Initializing PXComposeRecipientDataSource with %lu compose recipients", buf, 0xCu);
    }

    v11 = objc_msgSend(v6, "copy");
    composeRecipients = v8->_composeRecipients;
    v8->_composeRecipients = (NSArray *)v11;

    v13 = objc_msgSend(v7, "copy");
    recipients = v8->_recipients;
    v8->_recipients = (NSSet *)v13;

  }
  return v8;
}

- (unint64_t)indexOfComposeRecipientForRecipient:(id)a3
{
  id v4;
  NSArray *composeRecipients;
  unint64_t v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0x7FFFFFFFFFFFFFFFLL;
  if (-[NSSet containsObject:](self->_recipients, "containsObject:", v4))
  {
    composeRecipients = self->_composeRecipients;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __68__PXComposeRecipientDataSource_indexOfComposeRecipientForRecipient___block_invoke;
    v8[3] = &unk_1E51232C8;
    v9 = v4;
    v10 = &v11;
    -[NSArray enumerateObjectsUsingBlock:](composeRecipients, "enumerateObjectsUsingBlock:", v8);

  }
  v6 = v12[3];
  _Block_object_dispose(&v11, 8);

  return v6;
}

- (NSArray)composeRecipients
{
  return self->_composeRecipients;
}

- (NSSet)recipients
{
  return self->_recipients;
}

- (void)setRecipients:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recipients, 0);
  objc_storeStrong((id *)&self->_composeRecipients, 0);
}

void __68__PXComposeRecipientDataSource_indexOfComposeRecipientForRecipient___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  int v8;

  objc_msgSend(a2, "recipient");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqual:", *(_QWORD *)(a1 + 32));

  if (v8)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
  }
}

@end
