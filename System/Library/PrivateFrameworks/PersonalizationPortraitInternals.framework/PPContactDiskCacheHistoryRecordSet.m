@implementation PPContactDiskCacheHistoryRecordSet

- (unint64_t)hash
{
  return -[NSString hash](self->_filename, "hash");
}

- (NSString)filename
{
  return self->_filename;
}

- (NSMutableArray)adds
{
  return self->_adds;
}

- (NSMutableArray)updates
{
  return self->_updates;
}

- (NSMutableArray)deletes
{
  return self->_deletes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deletes, 0);
  objc_storeStrong((id *)&self->_updates, 0);
  objc_storeStrong((id *)&self->_adds, 0);
  objc_storeStrong((id *)&self->_filename, 0);
}

@end
