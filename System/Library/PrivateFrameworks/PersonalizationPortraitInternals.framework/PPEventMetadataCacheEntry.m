@implementation PPEventMetadataCacheEntry

- (unint64_t)chunkIndex
{
  return self->_chunkIndex;
}

- (void)setChunkIndex:(unint64_t)a3
{
  self->_chunkIndex = a3;
}

- (NSDate)expiration
{
  return self->_expiration;
}

- (void)setExpiration:(id)a3
{
  objc_storeStrong((id *)&self->_expiration, a3);
}

- (PPEventMetadata)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_metadata, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_expiration, 0);
}

@end
