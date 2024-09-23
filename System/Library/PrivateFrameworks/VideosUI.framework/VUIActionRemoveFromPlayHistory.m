@implementation VUIActionRemoveFromPlayHistory

- (VUIActionRemoveFromPlayHistory)initWithContextData:(id)a3 isContinueWatching:(BOOL)a4
{
  id v6;
  VUIActionRemoveFromPlayHistory *v7;
  uint64_t v8;
  NSString *deleteID;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)VUIActionRemoveFromPlayHistory;
  v7 = -[VUIActionRemoveFromPlayHistory init](&v11, sel_init);
  if (v7)
  {
    objc_msgSend(v6, "vui_stringForKey:", CFSTR("deleteId"));
    v8 = objc_claimAutoreleasedReturnValue();
    deleteID = v7->_deleteID;
    v7->_deleteID = (NSString *)v8;

    v7->_isContinueWatching = a4;
  }

  return v7;
}

- (void)performWithTargetResponder:(id)a3 completionHandler:(id)a4
{
  void (**v5)(id, uint64_t);
  uint64_t *p_deleteID;
  void *v7;
  NSObject *v8;

  v5 = (void (**)(id, uint64_t))a4;
  p_deleteID = (uint64_t *)&self->_deleteID;
  if (-[NSString length](self->_deleteID, "length"))
  {
    +[VUIRemoveFromPlayHistoryRequestManager sharedInstance](VUIRemoveFromPlayHistoryRequestManager, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sendRequestForDeleteID:isContinueWatching:", *p_deleteID, self->_isContinueWatching);

    if (v5)
LABEL_3:
      v5[2](v5, 1);
  }
  else
  {
    VUIDefaultLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[VUIActionRemoveFromPlayHistory performWithTargetResponder:completionHandler:].cold.1(p_deleteID, v8);

    if (v5)
      goto LABEL_3;
  }

}

- (NSString)deleteID
{
  return self->_deleteID;
}

- (void)setDeleteID:(id)a3
{
  objc_storeStrong((id *)&self->_deleteID, a3);
}

- (BOOL)isContinueWatching
{
  return self->_isContinueWatching;
}

- (void)setIsContinueWatching:(BOOL)a3
{
  self->_isContinueWatching = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deleteID, 0);
}

- (void)performWithTargetResponder:(uint64_t *)a1 completionHandler:(NSObject *)a2 .cold.1(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3 = 138412290;
  v4 = v2;
  _os_log_error_impl(&dword_1D96EE000, a2, OS_LOG_TYPE_ERROR, "VUIActionRemoveFromPlayHistory failed for itemID [%@]", (uint8_t *)&v3, 0xCu);
}

@end
