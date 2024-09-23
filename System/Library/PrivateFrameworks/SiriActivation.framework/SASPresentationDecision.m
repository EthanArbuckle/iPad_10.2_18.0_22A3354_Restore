@implementation SASPresentationDecision

+ (int64_t)activationPresentationForPresentationIdentifiers:(id)a3
{
  id v3;
  os_log_t *v4;
  NSObject *v5;
  void *v6;
  int64_t v7;
  void *v8;
  char v9;
  void *v10;
  char v11;
  os_log_t v13;
  int v14;
  const char *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (os_log_t *)MEMORY[0x1E0CFE6A0];
  v5 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v14 = 136315394;
    v15 = "+[SASPresentationDecision activationPresentationForPresentationIdentifiers:]";
    v16 = 2112;
    v17 = v3;
    _os_log_impl(&dword_1D132F000, v5, OS_LOG_TYPE_DEFAULT, "%s #activation SASPresentationDecision deciding between: %@", (uint8_t *)&v14, 0x16u);
  }
  if (objc_msgSend(v3, "count") == 1)
    goto LABEL_4;
  v7 = 3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithSiriPresentationIdentifier:", 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v3, "containsObject:", v8);

  if ((v9 & 1) == 0)
  {
    v7 = 2;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithSiriPresentationIdentifier:", 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v3, "containsObject:", v10);

    if ((v11 & 1) == 0)
    {
      v13 = *v4;
      if (os_log_type_enabled(*v4, OS_LOG_TYPE_ERROR))
        +[SASPresentationDecision activationPresentationForPresentationIdentifiers:].cold.1(v13, v3);
LABEL_4:
      objc_msgSend(v3, "firstObject");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "siriPresentationIdentifier");

    }
  }

  return v7;
}

+ (void)activationPresentationForPresentationIdentifiers:(void *)a1 .cold.1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  int v5;
  const char *v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(a2, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 136315394;
  v6 = "+[SASPresentationDecision activationPresentationForPresentationIdentifiers:]";
  v7 = 2112;
  v8 = v4;
  _os_log_error_impl(&dword_1D132F000, v3, OS_LOG_TYPE_ERROR, "%s ERROR: Multiple connected presentations, but none of them have precedence. Taking the first object, %@", (uint8_t *)&v5, 0x16u);

}

@end
