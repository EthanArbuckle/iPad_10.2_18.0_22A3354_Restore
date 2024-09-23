@implementation PXImportSessionInfo

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_startDate, a3);
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
  objc_storeStrong((id *)&self->_endDate, a3);
}

- (NSArray)itemsToImport
{
  return self->_itemsToImport;
}

- (void)setItemsToImport:(id)a3
{
  objc_storeStrong((id *)&self->_itemsToImport, a3);
}

- (BOOL)importComplete
{
  return self->_importComplete;
}

- (void)setImportComplete:(BOOL)a3
{
  self->_importComplete = a3;
}

- (BOOL)importStopped
{
  return self->_importStopped;
}

- (void)setImportStopped:(BOOL)a3
{
  self->_importStopped = a3;
}

- (NSMutableArray)importedItems
{
  return self->_importedItems;
}

- (void)setImportedItems:(id)a3
{
  objc_storeStrong((id *)&self->_importedItems, a3);
}

- (NSMutableArray)errorItems
{
  return self->_errorItems;
}

- (void)setErrorItems:(id)a3
{
  objc_storeStrong((id *)&self->_errorItems, a3);
}

- (int64_t)completedItemsCount
{
  return self->_completedItemsCount;
}

- (void)setCompletedItemsCount:(int64_t)a3
{
  self->_completedItemsCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorItems, 0);
  objc_storeStrong((id *)&self->_importedItems, 0);
  objc_storeStrong((id *)&self->_itemsToImport, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end
