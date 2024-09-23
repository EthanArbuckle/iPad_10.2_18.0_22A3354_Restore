@implementation MBDatabaseIndexEntry

- (MBDatabaseIndexEntry)initWithOffset:(int64_t)a3 flags:(unint64_t)a4
{
  MBDatabaseIndexEntry *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MBDatabaseIndexEntry;
  result = -[MBDatabaseIndexEntry init](&v7, "init");
  if (result)
  {
    result->_offset = a3;
    result->_flags = a4;
  }
  return result;
}

- (id)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: offset=%d, flags=0%06o>"), objc_opt_class(self), self->_offset, self->_flags);
}

- (int64_t)offset
{
  return self->_offset;
}

- (void)setOffset:(int64_t)a3
{
  self->_offset = a3;
}

- (unint64_t)flags
{
  return self->_flags;
}

- (void)setFlags:(unint64_t)a3
{
  self->_flags = a3;
}

@end
