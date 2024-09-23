@implementation SYReturnToSenderRequest

- (SYReturnToSenderRequest)init
{
  SYReturnToSenderRequest *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SYReturnToSenderRequest;
  result = -[SYReturnToSenderRequest init](&v3, sel_init);
  if (result)
    result->_shouldCreateNewMessage = 0;
  return result;
}

- (BOOL)verifyParameters
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  BOOL v9;
  id v11;

  -[SYReturnToSenderRequest document](self, "document");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  objc_msgSend(v3, "documentAttributesWithError:", &v11);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v11;
  -[SYReturnToSenderRequest setStoredDocumentAttributes:](self, "setStoredDocumentAttributes:", v4);

  -[SYReturnToSenderRequest storedDocumentAttributes](self, "storedDocumentAttributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v7 = os_log_create("com.apple.synapse", "DocumentWorkflows");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[SYReturnToSenderRequest verifyParameters].cold.1(self, (uint64_t)v5, v7);

  }
  -[SYReturnToSenderRequest storedDocumentAttributes](self, "storedDocumentAttributes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8 != 0;

  return v9;
}

- (NSString)documentIndexKey
{
  void *v2;
  void *v3;

  -[SYReturnToSenderRequest storedDocumentAttributes](self, "storedDocumentAttributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "indexKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)performWithServiceProxy:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _BOOL8 v10;
  id v11;
  _QWORD v12[5];
  id v13;

  v6 = a4;
  v7 = a3;
  -[SYReturnToSenderRequest document](self, "document");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SYReturnToSenderRequest storedDocumentAttributes](self, "storedDocumentAttributes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[SYReturnToSenderRequest shouldCreateNewMessage](self, "shouldCreateNewMessage");
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __62__SYReturnToSenderRequest_performWithServiceProxy_completion___block_invoke;
  v12[3] = &unk_1E757BEC0;
  v12[4] = self;
  v13 = v6;
  v11 = v6;
  objc_msgSend(v7, "returnToSenderDocument:withAttributes:shouldCreateNewMessage:completion:", v8, v9, v10, v12);

}

void __62__SYReturnToSenderRequest_performWithServiceProxy_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    v6 = os_log_create("com.apple.synapse", "DocumentWorkflows");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 32), "document");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "fileURL");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "storedDocumentAttributes");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "sender");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "name");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412546;
      v14 = v8;
      v15 = 2112;
      v16 = v11;
      _os_log_impl(&dword_1BCC38000, v6, OS_LOG_TYPE_INFO, "Unable to return document at url: %@, to sender: %@", (uint8_t *)&v13, 0x16u);

    }
  }
  v12 = *(_QWORD *)(a1 + 40);
  if (v12)
    (*(void (**)(uint64_t, uint64_t, id))(v12 + 16))(v12, a2, v5);

}

- (SYDocument)document
{
  return self->_document;
}

- (void)setDocument:(id)a3
{
  objc_storeStrong((id *)&self->_document, a3);
}

- (BOOL)shouldCreateNewMessage
{
  return self->_shouldCreateNewMessage;
}

- (void)setShouldCreateNewMessage:(BOOL)a3
{
  self->_shouldCreateNewMessage = a3;
}

- (SYDocumentAttributes)storedDocumentAttributes
{
  return self->_storedDocumentAttributes;
}

- (void)setStoredDocumentAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_storedDocumentAttributes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storedDocumentAttributes, 0);
  objc_storeStrong((id *)&self->_document, 0);
}

- (void)verifyParameters
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "document");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fileURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v6;
  v9 = 2112;
  v10 = a2;
  _os_log_error_impl(&dword_1BCC38000, a3, OS_LOG_TYPE_ERROR, "Document doesn't have required attributes at url: %@, error: %@", (uint8_t *)&v7, 0x16u);

}

@end
