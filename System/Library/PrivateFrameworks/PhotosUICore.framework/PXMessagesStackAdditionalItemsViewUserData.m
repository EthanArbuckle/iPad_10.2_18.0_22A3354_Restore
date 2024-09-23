@implementation PXMessagesStackAdditionalItemsViewUserData

- (PXMessagesStackAdditionalItemsViewUserData)initWithAdditionalItemsCount:(id)a3
{
  int64_t var1;
  unint64_t var0;
  PXMessagesStackAdditionalItemsViewUserData *result;
  objc_super v6;

  var1 = a3.var1;
  var0 = a3.var0;
  v6.receiver = self;
  v6.super_class = (Class)PXMessagesStackAdditionalItemsViewUserData;
  result = -[PXMessagesStackAdditionalItemsViewUserData init](&v6, sel_init);
  if (result)
  {
    result->_additionalItemsCount.count = var0;
    result->_additionalItemsCount.type = var1;
  }
  return result;
}

- (PXMessagesStackAdditionalItemsViewUserData)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXMessagesStackAdditionalItemsView.m"), 114, CFSTR("%s is not available as initializer"), "-[PXMessagesStackAdditionalItemsViewUserData init]");

  abort();
}

- ($DE30A600513D762F9B6AB73D2AED4B95)additionalItemsCount
{
  int64_t type;
  unint64_t count;
  $DE30A600513D762F9B6AB73D2AED4B95 result;

  type = self->_additionalItemsCount.type;
  count = self->_additionalItemsCount.count;
  result.var1 = type;
  result.var0 = count;
  return result;
}

@end
