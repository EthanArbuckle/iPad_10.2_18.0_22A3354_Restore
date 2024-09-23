@implementation RPFileTransferSmallFilesTask

- (NSMutableArray)fileItems
{
  return self->_fileItems;
}

- (void)setFileItems:(id)a3
{
  objc_storeStrong((id *)&self->_fileItems, a3);
}

- (BOOL)needsRetry
{
  return self->_needsRetry;
}

- (void)setNeedsRetry:(BOOL)a3
{
  self->_needsRetry = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (unint64_t)taskID
{
  return self->_taskID;
}

- (void)setTaskID:(unint64_t)a3
{
  self->_taskID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_fileItems, 0);
}

@end
