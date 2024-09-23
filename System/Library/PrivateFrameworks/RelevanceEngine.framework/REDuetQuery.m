@implementation REDuetQuery

- (void)setOffset:(int64_t)a3
{
  -[_DKQuery setOffset:](self->_query, "setOffset:", a3);
}

- (int64_t)offset
{
  return -[_DKQuery offset](self->_query, "offset");
}

- (id)transformBlock
{
  return self->_transformBlock;
}

- (void)setTransformBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (_DKQuery)query
{
  return self->_query;
}

- (void)setQuery:(id)a3
{
  objc_storeStrong((id *)&self->_query, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong(&self->_transformBlock, 0);
}

@end
