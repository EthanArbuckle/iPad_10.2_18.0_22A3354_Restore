@implementation VUIActionUpdateUpNext

- (VUIActionUpdateUpNext)initWithContextData:(id)a3
{
  id v4;
  VUIActionUpdateUpNext *v5;
  uint64_t v6;
  NSString *itemID;
  uint64_t v8;
  NSString *state;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)VUIActionUpdateUpNext;
  v5 = -[VUIActionUpdateUpNext init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "vui_stringForKey:", CFSTR("itemID"));
    v6 = objc_claimAutoreleasedReturnValue();
    itemID = v5->_itemID;
    v5->_itemID = (NSString *)v6;

    objc_msgSend(v4, "vui_stringForKey:", CFSTR("state"));
    v8 = objc_claimAutoreleasedReturnValue();
    state = v5->_state;
    v5->_state = (NSString *)v8;

    v5->_confirmationShouldWaitCompletion = objc_msgSend(v4, "vui_BOOLForKey:defaultValue:", CFSTR("confirmationShouldWaitCompletion"), 0);
  }

  return v5;
}

- (void)performWithTargetResponder:(id)a3 completionHandler:(id)a4
{
  void (**v5)(id, uint64_t);
  uint64_t *p_state;
  uint64_t v7;
  uint64_t *p_itemID;
  void *v9;
  NSObject *v10;
  void *v11;
  _QWORD v12[5];

  v5 = (void (**)(id, uint64_t))a4;
  p_state = (uint64_t *)&self->_state;
  v7 = -[NSString isEqualToString:](self->_state, "isEqualToString:", CFSTR("added"));
  p_itemID = (uint64_t *)&self->_itemID;
  if (self->_itemID && *p_state)
  {
    +[VUIUpNextRequestManager sharedInstance](VUIUpNextRequestManager, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sendRequestForCanonicalID:action:confirmationShouldWaitCompletion:", *p_itemID, v7, self->_confirmationShouldWaitCompletion);

    if (!v5)
      goto LABEL_9;
    goto LABEL_8;
  }
  VUIDefaultLogObject();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    -[VUIActionUpdateUpNext performWithTargetResponder:completionHandler:].cold.1(p_itemID, p_state, v10);

  if (v5)
LABEL_8:
    v5[2](v5, 1);
LABEL_9:
  +[VUIAppReviewManager sharedInstance](VUIAppReviewManager, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __70__VUIActionUpdateUpNext_performWithTargetResponder_completionHandler___block_invoke;
  v12[3] = &__block_descriptor_40_e8_v12__0B8l;
  v12[4] = v7;
  objc_msgSend(v11, "isFeatureEnabled:", v12);

}

void __70__VUIActionUpdateUpNext_performWithTargetResponder_completionHandler___block_invoke(uint64_t a1, int a2)
{
  id v2;

  if (a2)
  {
    if (!*(_QWORD *)(a1 + 32))
    {
      +[VUIAppReviewManager sharedInstance](VUIAppReviewManager, "sharedInstance");
      v2 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "processAddToUpNext");

    }
  }
}

- (BOOL)isAccountRequired
{
  return 1;
}

- (NSString)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
  objc_storeStrong((id *)&self->_state, a3);
}

- (NSString)itemID
{
  return self->_itemID;
}

- (void)setItemID:(id)a3
{
  objc_storeStrong((id *)&self->_itemID, a3);
}

- (BOOL)confirmationShouldWaitCompletion
{
  return self->_confirmationShouldWaitCompletion;
}

- (void)setConfirmationShouldWaitCompletion:(BOOL)a3
{
  self->_confirmationShouldWaitCompletion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemID, 0);
  objc_storeStrong((id *)&self->_state, 0);
}

- (void)performWithTargetResponder:(os_log_t)log completionHandler:.cold.1(uint64_t *a1, uint64_t *a2, os_log_t log)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = *a2;
  v5 = 138412546;
  v6 = v3;
  v7 = 2112;
  v8 = v4;
  _os_log_error_impl(&dword_1D96EE000, log, OS_LOG_TYPE_ERROR, "VUIActionUpdateUpNext failed for itemID [%@] state [%@]", (uint8_t *)&v5, 0x16u);
}

@end
