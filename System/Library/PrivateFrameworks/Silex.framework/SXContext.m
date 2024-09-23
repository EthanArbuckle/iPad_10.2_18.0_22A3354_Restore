@implementation SXContext

- (SXDocumentController)documentController
{
  return self->_documentController;
}

- (SXContext)initWithIdentifier:(id)a3 shareURL:(id)a4 JSONData:(id)a5 resourceDataSource:(id)a6 host:(id)a7 error:(id *)a8
{
  id v14;
  id v15;
  id v16;
  SXContext *v17;
  void *v18;
  id v19;
  SXDocument *v20;
  void *v21;
  SXDocument *v22;
  SXDocumentController *v23;
  SXDocumentController *documentController;
  SXDocumentTextContentProvider *v25;
  SXTextContentProvider *textContentProvider;
  SXContext *v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  id v33;
  id v34;
  id v35;
  objc_super v36;
  uint64_t v37;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v34 = a4;
  v15 = a5;
  v16 = a6;
  v33 = a7;
  v36.receiver = self;
  v36.super_class = (Class)SXContext;
  v17 = -[SXContext init](&v36, sel_init);
  if (v17)
  {
    if (!v15)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SXContextErrorDomain"), 1, 0);
      objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", CFSTR("InvalidJSON"), CFSTR("No JSON to parse"), 0);
      v28 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v28);
    }
    v35 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v15, 0, &v35);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v35;
    if (v19)
    {
      v29 = (void *)MEMORY[0x24BDD1540];
      v37 = *MEMORY[0x24BDD1398];
      v38[0] = v19;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v38, &v37, 1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "errorWithDomain:code:userInfo:", CFSTR("SXContextErrorDomain"), 2, v30);
      objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", CFSTR("InvalidJSON"), CFSTR("Error while parsing JSON"), 0);
      v31 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v31);
    }
    v20 = [SXDocument alloc];
    objc_msgSend(v18, "objectForKey:", CFSTR("specVersion"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[SXDocument initWithIdentifier:JSONObject:andVersion:](v20, "initWithIdentifier:JSONObject:andVersion:", v14, v18, v21);

    if (!v22)
    {
      v27 = 0;
      goto LABEL_10;
    }
    v23 = -[SXDocumentController initWithDocument:shareURL:]([SXDocumentController alloc], "initWithDocument:shareURL:", v22, v34);
    documentController = v17->_documentController;
    v17->_documentController = v23;

    v25 = -[SXDocumentTextContentProvider initWithDocument:]([SXDocumentTextContentProvider alloc], "initWithDocument:", v22);
    textContentProvider = v17->_textContentProvider;
    v17->_textContentProvider = (SXTextContentProvider *)v25;

    objc_storeStrong((id *)&v17->_identifier, a3);
    objc_storeWeak((id *)&v17->_resourceDataSource, v16);
    objc_storeStrong((id *)&v17->_host, a7);

  }
  v27 = v17;
LABEL_10:

  return v27;
}

+ (void)prewarm
{

}

- (NSString)identifier
{
  return self->_identifier;
}

- (SXHost)host
{
  return self->_host;
}

- (SXTextContentProvider)textContentProvider
{
  return self->_textContentProvider;
}

- (SXResourceDataSource)resourceDataSource
{
  return (SXResourceDataSource *)objc_loadWeakRetained((id *)&self->_resourceDataSource);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_resourceDataSource);
  objc_storeStrong((id *)&self->_textContentProvider, 0);
  objc_storeStrong((id *)&self->_documentController, 0);
  objc_storeStrong((id *)&self->_host, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)initWithIdentifier:(os_log_t)log shareURL:JSONData:resourceDataSource:host:error:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_error_impl(&dword_217023000, log, OS_LOG_TYPE_ERROR, "An error occurred while parsing document: %{public}@ error: %{public}@", (uint8_t *)&v3, 0x16u);
}

@end
