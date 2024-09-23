@implementation WBSPasswordWarningHideMarker

- (WBSPasswordWarningHideMarker)initWithIssueTypes:(unint64_t)a3
{
  WBSPasswordWarningHideMarker *v4;
  WBSPasswordWarningHideMarker *v5;
  WBSPasswordWarningHideMarker *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WBSPasswordWarningHideMarker;
  v4 = -[WBSPasswordWarningHideMarker init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_issueTypes = a3;
    v6 = v4;
  }

  return v5;
}

- (WBSPasswordWarningHideMarker)initWithDictionaryRepresentation:(id)a3
{
  void *v4;
  WBSPasswordWarningHideMarker *v5;
  NSObject *v6;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("issueTypes"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = -[WBSPasswordWarningHideMarker initWithIssueTypes:]([WBSPasswordWarningHideMarker alloc], "initWithIssueTypes:", objc_msgSend(v4, "unsignedIntegerValue"));
  }
  else
  {
    v6 = WBS_LOG_CHANNEL_PREFIXKeychain();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[WBSPasswordWarningHideMarker initWithDictionaryRepresentation:].cold.1(v6);
    v5 = 0;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  WBSPasswordWarningHideMarker *v4;
  unint64_t issueTypes;
  BOOL v6;

  v4 = (WBSPasswordWarningHideMarker *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      issueTypes = self->_issueTypes;
      v6 = issueTypes == -[WBSPasswordWarningHideMarker issueTypes](v4, "issueTypes");
    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  return self->_issueTypes;
}

- (NSDictionary)dictionaryRepresentation
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("issueTypes");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_issueTypes);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (unint64_t)issueTypes
{
  return self->_issueTypes;
}

- (void)initWithDictionaryRepresentation:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B2621000, log, OS_LOG_TYPE_ERROR, "hide warning marker initialized with invalid dictionary", v1, 2u);
}

@end
