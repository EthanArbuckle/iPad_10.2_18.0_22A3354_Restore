@implementation SHSheetClientToHostAction

- (void)performActionForSceneController:(id)a3
{
  id v4;
  void *v5;
  char isKindOfClass;
  NSObject *v7;

  v4 = a3;
  objc_msgSend(v4, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v4, "delegate");
    v7 = objc_claimAutoreleasedReturnValue();
    -[NSObject receivedAction:](v7, "receivedAction:", self);
  }
  else
  {
    share_sheet_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[SHSheetClientToHostAction performActionForSceneController:].cold.1((uint64_t)self, (uint64_t)v4, v7);
  }

}

- (void)performActionForSceneController:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_19E419000, log, OS_LOG_TYPE_ERROR, "received action %@ on hosting controller %@ but found no scene to handle it", (uint8_t *)&v3, 0x16u);
}

@end
