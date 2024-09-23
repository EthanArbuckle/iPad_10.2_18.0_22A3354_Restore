@implementation UISmartReplyFeedbackManager

void __83___UISmartReplyFeedbackManager_getStringDescribingInputContextHistoryWithBundleID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  UIFeedbackServiceLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v3, "senderIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "text");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138740227;
    v8 = v5;
    v9 = 2117;
    v10 = v6;
    _os_log_debug_impl(&dword_185066000, v4, OS_LOG_TYPE_DEBUG, "TIInputContextHistory entry: %{sensitive}@: %{sensitive}@", (uint8_t *)&v7, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

@end
