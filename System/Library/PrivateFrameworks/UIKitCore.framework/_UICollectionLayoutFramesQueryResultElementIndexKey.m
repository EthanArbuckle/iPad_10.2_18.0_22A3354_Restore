@implementation _UICollectionLayoutFramesQueryResultElementIndexKey

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_element, 0);
}

- (unint64_t)hash
{
  int64_t index;

  index = self->_index;
  return -[NSString hash](self->_element, "hash") ^ index;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
    return 1;
  if (a3 && self->_index == *((_QWORD *)a3 + 2))
    return -[NSString isEqualToString:](self->_element, "isEqualToString:", *((_QWORD *)a3 + 1));
  return 0;
}

@end
