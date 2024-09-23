@implementation TIRecipientModel

- (TIRecipientModel)initWithCompositeName:(id)a3 andTrainer:(id)a4
{
  id v6;
  id v7;
  TIRecipientModel *v8;
  void *v9;
  uint64_t v10;
  NSString *identifier;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)TIRecipientModel;
  v8 = -[TIRecipientModel init](&v13, sel_init);
  if (v8)
  {
    +[TICryptographer sharedCryptographer](TICryptographer, "sharedCryptographer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringDigestForName:", v6);
    v10 = objc_claimAutoreleasedReturnValue();
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v10;

    objc_storeStrong((id *)&v8->_trainer, a4);
  }

  return v8;
}

- (id)languageGuessForString:(id)a3
{
  __CFString *v3;
  __CFString *v4;
  CFRange v6;

  if (a3)
  {
    v3 = (__CFString *)a3;
    v6.length = -[__CFString length](v3, "length");
    v6.location = 0;
    v4 = (__CFString *)CFStringTokenizerCopyBestStringLanguage(v3, v6);

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)handleMessages:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  void *v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v31;
    v27 = *(_QWORD *)v31;
    v28 = v4;
    do
    {
      v8 = 0;
      v29 = v6;
      do
      {
        if (*(_QWORD *)v31 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v8);
        -[TIRecipientModel lastMessage](self, "lastMessage");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v10, "fromMe") & 1) == 0)
        {
          v11 = objc_msgSend(v9, "fromMe");

          if (!v11)
            goto LABEL_19;
          -[TIRecipientModel lastMessage](self, "lastMessage");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "body");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[TIRecipientModel languageGuessForString:](self, "languageGuessForString:", v13);
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v9, "body");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[TIRecipientModel languageGuessForString:](self, "languageGuessForString:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15 && objc_msgSend(v15, "isEqualToString:", v10))
          {
            if (TICanLogMessageAtLevel_onceToken != -1)
              dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
            if (TICanLogMessageAtLevel_logLevel)
            {
              TIOSLogFacility();
              v16 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
              {
                v22 = (void *)MEMORY[0x1E0CB3940];
                -[TIRecipientModel lastMessage](self, "lastMessage");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "body");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v9, "body");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "stringWithFormat:", CFSTR("%s ResponseKitTrainer: training with message pair (%@), (%@) (language = %@)"), "-[TIRecipientModel handleMessages:]", v24, v25, v15);
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                v35 = v26;
                _os_log_debug_impl(&dword_1DA6F2000, v16, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

              }
            }
            -[TIRecipientModel trainer](self, "trainer");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "body");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            -[TIRecipientModel lastMessage](self, "lastMessage");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "body");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            -[TIRecipientModel identifier](self, "identifier");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "registerResponse:forMessage:forContext:withLanguage:", v18, v20, v21, v15);

            v7 = v27;
            v4 = v28;
            v6 = v29;
          }

        }
LABEL_19:
        -[TIRecipientModel setLastMessage:](self, "setLastMessage:", v9);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
    }
    while (v6);
  }

}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (RKMessageResponseManager)trainer
{
  return self->_trainer;
}

- (void)setTrainer:(id)a3
{
  objc_storeStrong((id *)&self->_trainer, a3);
}

- (TILinguisticDataSourceMessage)lastMessage
{
  return self->_lastMessage;
}

- (void)setLastMessage:(id)a3
{
  objc_storeStrong((id *)&self->_lastMessage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastMessage, 0);
  objc_storeStrong((id *)&self->_trainer, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
