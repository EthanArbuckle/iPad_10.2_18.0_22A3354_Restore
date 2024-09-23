@implementation SVXDialogTransformer

- (SVXDialogTransformer)initWithModeProvider:(id)a3
{
  id v5;
  SVXDialogTransformer *v6;
  SVXDialogTransformer *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SVXDialogTransformer;
  v6 = -[SVXDialogTransformer init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_modeProvider, a3);

  return v7;
}

- (id)transformAddViews:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  void *v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[MDModeProviding currentMode](self->_modeProvider, "currentMode");
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(v4, "views", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v6);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "svx_isResponseViewIdPresent") & 1) != 0)
        {
          LOBYTE(v7) = 1;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  objc_msgSend(v4, "patternId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if ((v7 & 1) != 0 || v10)
  {
    v14 = v4;
  }
  else
  {
    v11 = (void *)*MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
    {
      v12 = v11;
      objc_msgSend(v4, "responseMode");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v22 = "-[SVXDialogTransformer transformAddViews:]";
      v23 = 2112;
      v24 = v13;
      _os_log_impl(&dword_214934000, v12, OS_LOG_TYPE_INFO, "%s patternId is nil and responseViewIdPresent is false. Calling on MDDialogTransformer for mode: %@", buf, 0x16u);

    }
    -[SVXDialogTransformer transformAddViews:forMode:](self, "transformAddViews:forMode:", v4, v5);
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  v15 = v14;

  return v15;
}

- (id)transformAddDialogs:(id)a3
{
  MDModeProviding *modeProvider;
  id v5;
  void *v6;

  modeProvider = self->_modeProvider;
  v5 = a3;
  -[SVXDialogTransformer transformAddDialogs:forMode:](self, "transformAddDialogs:forMode:", v5, -[MDModeProviding currentMode](modeProvider, "currentMode"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)transformAddDialogs:(id)a3 forMode:(unint64_t)a4
{
  return (id)objc_msgSend(MEMORY[0x24BE9C030], "transformAddDialogs:forMode:", a3, a4);
}

- (id)transformAddViews:(id)a3 forMode:(unint64_t)a4
{
  return (id)objc_msgSend(MEMORY[0x24BE9C030], "transformAddViews:forMode:", a3, a4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modeProvider, 0);
}

@end
