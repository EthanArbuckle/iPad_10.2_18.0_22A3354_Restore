@implementation OISFUZipFreeSpaceEntry

- (int64_t)compareByOffset:(id)a3
{
  unint64_t offset;
  unint64_t v4;
  BOOL v5;
  int64_t v6;

  offset = self->offset;
  v4 = *((_QWORD *)a3 + 1);
  v5 = offset >= v4;
  v6 = offset > v4;
  if (v5)
    return v6;
  else
    return -1;
}

@end
