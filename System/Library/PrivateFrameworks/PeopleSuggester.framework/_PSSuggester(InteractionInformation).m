@implementation _PSSuggester(InteractionInformation)

- (void)interactionCountForHandle:()InteractionInformation fetchLimit:interactionStoreDB:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A07F4000, log, OS_LOG_TYPE_ERROR, "_PSSuggester: Empty handle encountered while retrieving interactions for a handle", v1, 2u);
}

@end
