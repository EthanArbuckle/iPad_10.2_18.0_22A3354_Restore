@implementation REMListChangeItem(AccountDataMoving)

- (void)copyListDataFrom:()AccountDataMoving .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "objectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  _os_log_error_impl(&dword_1B4A39000, a2, OS_LOG_TYPE_ERROR, "ListChangeItem (AccountDataMover): Copying from a source list which is a group, the case is not supported for now {sourceID: %@}.", v4, 0xCu);

  OUTLINED_FUNCTION_2_2();
}

@end
