@implementation PLOPTICSClusteringObject

- (PLOPTICSClusteringObject)initWithObject:(id)a3 index:(unint64_t)a4 epsilon:(double)a5
{
  id v9;
  PLOPTICSClusteringObject *v10;
  PLOPTICSClusteringObject *v11;
  uint64_t v12;
  NSMutableArray *neighbors;
  objc_super v15;

  v9 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PLOPTICSClusteringObject;
  v10 = -[PLOPTICSClusteringObject init](&v15, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong(&v10->_object, a3);
    v11->_coreDistance = a5 + 1.0;
    v11->_reachabilityDistance = a5;
    v11->_index = a4;
    v11->_order = 0;
    v11->_processed = 0;
    v12 = objc_opt_new();
    neighbors = v11->_neighbors;
    v11->_neighbors = (NSMutableArray *)v12;

  }
  return v11;
}

- (void)registerNeighbors:(id)a3 deleteExisting:(BOOL)a4
{
  _BOOL4 v4;
  id v6;

  v4 = a4;
  v6 = a3;
  if (v4)
    -[NSMutableArray removeAllObjects](self->_neighbors, "removeAllObjects");
  -[NSMutableArray addObjectsFromArray:](self->_neighbors, "addObjectsFromArray:", v6);

}

- (void)sortNeighborsByDistance
{
  id v3;

  -[NSMutableArray sortedArrayUsingComparator:](self->_neighbors, "sortedArrayUsingComparator:", &__block_literal_global_22358);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PLOPTICSClusteringObject registerNeighbors:deleteExisting:](self, "registerNeighbors:deleteExisting:", v3, 1);

}

- (id)neighborAtIndex:(unint64_t)a3
{
  void *v7;

  if (-[NSMutableArray count](self->_neighbors, "count") <= a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLOPTICSClustering.m"), 141, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("index < _neighbors.count"));

  }
  return (id)-[NSMutableArray objectAtIndex:](self->_neighbors, "objectAtIndex:", a3);
}

- (void)updateCoreDistanceForNeighbor:(unint64_t)a3
{
  void *v4;
  id v5;

  -[PLOPTICSClusteringObject neighborAtIndex:](self, "neighborAtIndex:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("distance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  -[PLOPTICSClusteringObject setCoreDistance:](self, "setCoreDistance:");

}

- (id)object
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

- (unint64_t)order
{
  return self->_order;
}

- (void)setOrder:(unint64_t)a3
{
  self->_order = a3;
}

- (NSMutableArray)neighbors
{
  return self->_neighbors;
}

- (double)coreDistance
{
  return self->_coreDistance;
}

- (void)setCoreDistance:(double)a3
{
  self->_coreDistance = a3;
}

- (double)reachabilityDistance
{
  return self->_reachabilityDistance;
}

- (void)setReachabilityDistance:(double)a3
{
  self->_reachabilityDistance = a3;
}

- (BOOL)processed
{
  return self->_processed;
}

- (void)setProcessed:(BOOL)a3
{
  self->_processed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_neighbors, 0);
  objc_storeStrong(&self->_object, 0);
}

uint64_t __51__PLOPTICSClusteringObject_sortNeighborsByDistance__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;

  v4 = a3;
  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("distance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");
  v7 = v6;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("distance"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "doubleValue");
  v10 = v9;

  if (v7 > v10)
    return 1;
  else
    return -1;
}

+ (id)clusterObjectWithObject:(id)a3 index:(unint64_t)a4 epsilon:(double)a5
{
  id v7;
  PLOPTICSClusteringObject *v8;

  v7 = a3;
  v8 = -[PLOPTICSClusteringObject initWithObject:index:epsilon:]([PLOPTICSClusteringObject alloc], "initWithObject:index:epsilon:", v7, a4, a5);

  return v8;
}

@end
