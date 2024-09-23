@implementation BEURLHandlerAssetInfo

- (BOOL)requestedRangeIsWholeAsset
{
  unint64_t endOffset;

  if (self->_requestedRange.beginOffset)
    return 0;
  endOffset = self->_requestedRange.endOffset;
  if (!endOffset)
    return 1;
  return endOffset == -1 || endOffset == self->_fileSize;
}

- (NSString)compressionAlgorithm
{
  return self->_compressionAlgorithm;
}

- (void)setCompressionAlgorithm:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)encryptionAlgorithm
{
  return self->_encryptionAlgorithm;
}

- (void)setEncryptionAlgorithm:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)mimeType
{
  return self->_mimeType;
}

- (void)setMimeType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)bookID
{
  return self->_bookID;
}

- (void)setBookID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)bookEpubId
{
  return self->_bookEpubId;
}

- (void)setBookEpubId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)bookEpubIdWithUUIDScheme
{
  return self->_bookEpubIdWithUUIDScheme;
}

- (void)setBookEpubIdWithUUIDScheme:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (unint64_t)fileSize
{
  return self->_fileSize;
}

- (void)setFileSize:(unint64_t)a3
{
  self->_fileSize = a3;
}

- (NSData)sinfData
{
  return self->_sinfData;
}

- (void)setSinfData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (BOOL)assetIsInsideBookRootPath
{
  return self->_assetIsInsideBookRootPath;
}

- (void)setAssetIsInsideBookRootPath:(BOOL)a3
{
  self->_assetIsInsideBookRootPath = a3;
}

- (NSURL)requestedURL
{
  return self->_requestedURL;
}

- (void)setRequestedURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (_BERequestedRange)requestedRange
{
  unint64_t endOffset;
  unint64_t beginOffset;
  _BERequestedRange result;

  endOffset = self->_requestedRange.endOffset;
  beginOffset = self->_requestedRange.beginOffset;
  result.endOffset = endOffset;
  result.beginOffset = beginOffset;
  return result;
}

- (void)setRequestedRange:(_BERequestedRange)a3
{
  self->_requestedRange = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestedURL, 0);
  objc_storeStrong((id *)&self->_sinfData, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_bookEpubIdWithUUIDScheme, 0);
  objc_storeStrong((id *)&self->_bookEpubId, 0);
  objc_storeStrong((id *)&self->_bookID, 0);
  objc_storeStrong((id *)&self->_mimeType, 0);
  objc_storeStrong((id *)&self->_encryptionAlgorithm, 0);
  objc_storeStrong((id *)&self->_compressionAlgorithm, 0);
}

@end
