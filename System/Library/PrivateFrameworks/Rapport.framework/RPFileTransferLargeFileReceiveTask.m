@implementation RPFileTransferLargeFileReceiveTask

- (int)fileFD
{
  return self->_fileFD;
}

- (void)setFileFD:(int)a3
{
  self->_fileFD = a3;
}

- (RPFileTransferItem)fileItem
{
  return self->_fileItem;
}

- (void)setFileItem:(id)a3
{
  objc_storeStrong((id *)&self->_fileItem, a3);
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
  objc_storeStrong((id *)&self->_fileItem, 0);
}

@end
