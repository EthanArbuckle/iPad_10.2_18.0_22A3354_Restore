@implementation VUIActionMarkedAsWatched

- (VUIActionMarkedAsWatched)initWithContextData:(id)a3
{
  id v4;
  VUIActionMarkedAsWatched *v5;
  uint64_t v6;
  NSString *itemID;
  uint64_t v8;
  NSString *itemType;
  uint64_t v10;
  NSString *adamID;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)VUIActionMarkedAsWatched;
  v5 = -[VUIActionMarkedAsWatched init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "vui_stringForKey:", CFSTR("itemID"));
    v6 = objc_claimAutoreleasedReturnValue();
    itemID = v5->_itemID;
    v5->_itemID = (NSString *)v6;

    objc_msgSend(v4, "vui_stringForKey:", CFSTR("type"));
    v8 = objc_claimAutoreleasedReturnValue();
    itemType = v5->_itemType;
    v5->_itemType = (NSString *)v8;

    objc_msgSend(v4, "vui_stringForKey:", CFSTR("adamID"));
    v10 = objc_claimAutoreleasedReturnValue();
    adamID = v5->_adamID;
    v5->_adamID = (NSString *)v10;

  }
  return v5;
}

- (void)performWithTargetResponder:(id)a3 completionHandler:(id)a4
{
  void (**v5)(id, uint64_t);
  void *v6;
  uint64_t *p_itemID;
  uint64_t *p_itemType;
  NSObject *v9;

  v5 = (void (**)(id, uint64_t))a4;
  +[VUIMarkAsWatchedRequestManager sharedInstance](VUIMarkAsWatchedRequestManager, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  p_itemID = (uint64_t *)&self->_itemID;
  p_itemType = (uint64_t *)&self->_itemType;
  objc_msgSend(v6, "sendRequestForItemID:itemType:channelID:adamID:", self->_itemID, self->_itemType, 0, self->_adamID);

  if (!self->_itemID || !*p_itemType)
  {
    VUIDefaultLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[VUIActionMarkedAsWatched performWithTargetResponder:completionHandler:].cold.1(p_itemID, p_itemType, v9);

  }
  if (v5)
    v5[2](v5, 1);

}

- (NSString)itemID
{
  return self->_itemID;
}

- (void)setItemID:(id)a3
{
  objc_storeStrong((id *)&self->_itemID, a3);
}

- (NSString)itemType
{
  return self->_itemType;
}

- (void)setItemType:(id)a3
{
  objc_storeStrong((id *)&self->_itemType, a3);
}

- (NSString)adamID
{
  return self->_adamID;
}

- (void)setAdamID:(id)a3
{
  objc_storeStrong((id *)&self->_adamID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adamID, 0);
  objc_storeStrong((id *)&self->_itemType, 0);
  objc_storeStrong((id *)&self->_itemID, 0);
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
  _os_log_error_impl(&dword_1D96EE000, log, OS_LOG_TYPE_ERROR, "VUIActionMarkedAsWatched failed for itemID [%@] type [%@]", (uint8_t *)&v5, 0x16u);
}

@end
