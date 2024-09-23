@implementation MSDKVStoreResponse

- (NSString)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_storeStrong((id *)&self->_value, a3);
}

- (NSString)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(id)a3
{
  objc_storeStrong((id *)&self->_creationDate, a3);
}

- (NSString)modificationDate
{
  return self->_modificationDate;
}

- (void)setModificationDate:(id)a3
{
  objc_storeStrong((id *)&self->_modificationDate, a3);
}

- (NSString)creatorSN
{
  return self->_creatorSN;
}

- (void)setCreatorSN:(id)a3
{
  objc_storeStrong((id *)&self->_creatorSN, a3);
}

- (NSString)creatorUDID
{
  return self->_creatorUDID;
}

- (void)setCreatorUDID:(id)a3
{
  objc_storeStrong((id *)&self->_creatorUDID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_creatorUDID, 0);
  objc_storeStrong((id *)&self->_creatorSN, 0);
  objc_storeStrong((id *)&self->_modificationDate, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_value, 0);
}

@end
