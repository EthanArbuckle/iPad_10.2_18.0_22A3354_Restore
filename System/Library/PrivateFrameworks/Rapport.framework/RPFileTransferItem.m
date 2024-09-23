@implementation RPFileTransferItem

- (RPFileTransferItem)init
{
  RPFileTransferItem *v2;
  RPFileTransferItem *v3;
  RPFileTransferItem *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RPFileTransferItem;
  v2 = -[RPFileTransferItem init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_fileSize = -1;
    v4 = v2;
  }

  return v3;
}

- (id)description
{
  return -[RPFileTransferItem descriptionWithLevel:](self, "descriptionWithLevel:", 50);
}

- (id)descriptionWithLevel:(int)a3
{
  -[NSDictionary count](self->_metadata, "count");
  NSAppendPrintF();
  return 0;
}

- (int64_t)fileSize
{
  return self->_fileSize;
}

- (void)setFileSize:(int64_t)a3
{
  self->_fileSize = a3;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)filename
{
  return self->_filename;
}

- (void)setFilename:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSURL)itemURL
{
  return self->_itemURL;
}

- (void)setItemURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSData)sha256HashData
{
  return self->_sha256HashData;
}

- (void)setSha256HashData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (BOOL)completed
{
  return self->_completed;
}

- (void)setCompleted:(BOOL)a3
{
  self->_completed = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (unint64_t)estimatedSize
{
  return self->_estimatedSize;
}

- (void)setEstimatedSize:(unint64_t)a3
{
  self->_estimatedSize = a3;
}

- (NSData)fileData
{
  return self->_fileData;
}

- (void)setFileData:(id)a3
{
  objc_storeStrong((id *)&self->_fileData, a3);
}

- (unint64_t)fileID
{
  return self->_fileID;
}

- (void)setFileID:(unint64_t)a3
{
  self->_fileID = a3;
}

- (unint64_t)metadataSize
{
  return self->_metadataSize;
}

- (void)setMetadataSize:(unint64_t)a3
{
  self->_metadataSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileData, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_sha256HashData, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_itemURL, 0);
  objc_storeStrong((id *)&self->_filename, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

@end
