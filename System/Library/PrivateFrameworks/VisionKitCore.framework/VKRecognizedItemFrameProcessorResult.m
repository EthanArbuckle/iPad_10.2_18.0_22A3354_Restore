@implementation VKRecognizedItemFrameProcessorResult

- (VKRecognizedItemFrameProcessorResult)init
{
  VKRecognizedItemFrameProcessorResult *v2;
  VKRecognizedItemFrameProcessorResult *v3;
  NSArray *allItems;
  NSArray *v5;
  NSArray *addedItems;
  NSArray *updatedItems;
  NSArray *removedItems;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)VKRecognizedItemFrameProcessorResult;
  v2 = -[VKRecognizedItemFrameProcessorResult init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    allItems = v2->_allItems;
    v5 = (NSArray *)MEMORY[0x1E0C9AA60];
    v2->_allItems = (NSArray *)MEMORY[0x1E0C9AA60];

    addedItems = v3->_addedItems;
    v3->_addedItems = v5;

    updatedItems = v3->_updatedItems;
    v3->_updatedItems = v5;

    removedItems = v3->_removedItems;
    v3->_removedItems = v5;

  }
  return v3;
}

- (NSArray)allItems
{
  return self->_allItems;
}

- (void)setAllItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)addedItems
{
  return self->_addedItems;
}

- (void)setAddedItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)updatedItems
{
  return self->_updatedItems;
}

- (void)setUpdatedItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)removedItems
{
  return self->_removedItems;
}

- (void)setRemovedItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_removedItems, 0);
  objc_storeStrong((id *)&self->_updatedItems, 0);
  objc_storeStrong((id *)&self->_addedItems, 0);
  objc_storeStrong((id *)&self->_allItems, 0);
}

@end
