@implementation UIDragSessionImpl

void __42___UIDragSessionImpl_initWithInteraction___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)__activeDragSessionsTable;
  __activeDragSessionsTable = v0;

}

@end
