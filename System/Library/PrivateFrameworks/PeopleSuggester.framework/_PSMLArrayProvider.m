@implementation _PSMLArrayProvider

- (_PSMLArrayProvider)initWithProvider:(id)a3 clusteringCount:(int)a4 recencyCount:(int)a5
{
  uint64_t v5;
  uint64_t v6;
  id v9;
  _PSMLArrayProvider *v10;
  _PSMLArrayProvider *v11;
  objc_super v13;

  v5 = *(_QWORD *)&a5;
  v6 = *(_QWORD *)&a4;
  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_PSMLArrayProvider;
  v10 = -[_PSMLArrayProvider init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_MLArrayProvider, a3);
    -[_PSMLArrayProvider setClusteringCount:](v11, "setClusteringCount:", v6);
    -[_PSMLArrayProvider setRecencyCount:](v11, "setRecencyCount:", v5);
  }

  return v11;
}

- (MLArrayBatchProvider)MLArrayProvider
{
  return self->_MLArrayProvider;
}

- (void)setMLArrayProvider:(id)a3
{
  objc_storeStrong((id *)&self->_MLArrayProvider, a3);
}

- (int)clusteringCount
{
  return self->_clusteringCount;
}

- (void)setClusteringCount:(int)a3
{
  self->_clusteringCount = a3;
}

- (int)recencyCount
{
  return self->_recencyCount;
}

- (void)setRecencyCount:(int)a3
{
  self->_recencyCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_MLArrayProvider, 0);
}

@end
