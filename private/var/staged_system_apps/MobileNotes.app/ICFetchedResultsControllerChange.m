@implementation ICFetchedResultsControllerChange

- (id)object
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setObject:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (NSIndexPath)indexPath
{
  return (NSIndexPath *)objc_getProperty(self, a2, 24, 1);
}

- (void)setIndexPath:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSIndexPath)theNewIndexPath
{
  return (NSIndexPath *)objc_getProperty(self, a2, 32, 1);
}

- (void)setTheNewIndexPath:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_theNewIndexPath, 0);
  objc_storeStrong((id *)&self->_indexPath, 0);
  objc_storeStrong(&self->_object, 0);
}

@end
