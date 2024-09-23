@implementation SSTokenMatch

- (BOOL)exactMatchAtFirstPosition
{
  void *v3;
  char v4;

  if (-[SSTokenMatch type](self, "type") != 2)
    return 0;
  -[SSTokenMatch indexes](self, "indexes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", &unk_1E6E98118);

  return v4;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (NSMutableArray)indexes
{
  return self->_indexes;
}

- (void)setIndexes:(id)a3
{
  objc_storeStrong((id *)&self->_indexes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexes, 0);
}

@end
