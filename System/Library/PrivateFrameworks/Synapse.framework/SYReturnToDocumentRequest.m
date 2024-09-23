@implementation SYReturnToDocumentRequest

- (BOOL)verifyParameters
{
  void *v2;
  NSObject *v3;

  -[SYReturnToDocumentRequest documentAttributes](self, "documentAttributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    v3 = os_log_create("com.apple.synapse", "DocumentWorkflows");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      -[SYReturnToDocumentRequest verifyParameters].cold.1(v3);

  }
  return v2 != 0;
}

- (NSString)documentIndexKey
{
  void *v2;
  void *v3;

  -[SYReturnToDocumentRequest documentAttributes](self, "documentAttributes");
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
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v7 = a3;
  -[SYReturnToDocumentRequest documentAttributes](self, "documentAttributes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __64__SYReturnToDocumentRequest_performWithServiceProxy_completion___block_invoke;
  v10[3] = &unk_1E757B5D0;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v7, "returnToSenderDocument:withAttributes:shouldCreateNewMessage:completion:", 0, v8, 0, v10);

}

uint64_t __64__SYReturnToDocumentRequest_performWithServiceProxy_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (SYDocumentAttributes)documentAttributes
{
  return self->_documentAttributes;
}

- (void)setDocumentAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_documentAttributes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_documentAttributes, 0);
}

- (void)verifyParameters
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1BCC38000, log, OS_LOG_TYPE_ERROR, "documentAttributes can't be nil.", v1, 2u);
}

@end
