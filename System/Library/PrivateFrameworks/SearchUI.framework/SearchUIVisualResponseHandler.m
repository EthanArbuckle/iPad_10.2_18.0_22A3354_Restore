@implementation SearchUIVisualResponseHandler

- (SearchUIVisualResponseHandler)init
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x1E0DA8760]);
  -[SearchUIVisualResponseHandler setProvider:](self, "setProvider:", v3);

  return self;
}

- (id)buildResponseView:(id)a3 delegate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;

  v6 = a4;
  v7 = a3;
  -[SearchUIVisualResponseHandler provider](self, "provider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "viewForModel:mode:", v7, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v9, "setInteractionDelegate:", v6);
    v10 = v9;
  }
  else
  {
    SearchUIGeneralLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[SearchUIVisualResponseHandler buildResponseView:delegate:].cold.1(v11);

  }
  return v9;
}

- (VRXVisualResponseProvider)provider
{
  return self->_provider;
}

- (void)setProvider:(id)a3
{
  objc_storeStrong((id *)&self->_provider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_provider, 0);
}

- (void)buildResponseView:(os_log_t)log delegate:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DAD39000, log, OS_LOG_TYPE_ERROR, "Failed to get View from data using SnippetUI", v1, 2u);
}

@end
