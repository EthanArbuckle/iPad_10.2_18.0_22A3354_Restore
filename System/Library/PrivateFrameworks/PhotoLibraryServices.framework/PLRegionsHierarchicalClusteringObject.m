@implementation PLRegionsHierarchicalClusteringObject

+ (id)clusterObjectWithObject:(id)a3 index:(unint64_t)a4
{
  id v5;
  _QWORD *v6;
  void *v7;

  v5 = a3;
  objc_opt_class();
  v6 = (_QWORD *)objc_opt_new();
  v7 = (void *)v6[1];
  v6[1] = v5;

  v6[2] = a4;
  return v6;
}

- (PLRegionsClusteringItem)object
{
  return self->_object;
}

- (unint64_t)index
{
  return self->_index;
}

- (void)setIndex:(unint64_t)a3
{
  self->_index = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_object, 0);
}

@end
