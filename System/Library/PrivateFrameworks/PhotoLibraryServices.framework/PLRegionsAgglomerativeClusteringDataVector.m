@implementation PLRegionsAgglomerativeClusteringDataVector

- (PLRegionsAgglomerativeClusteringDataVector)initWithDataLength:(unint64_t)a3
{
  PLRegionsAgglomerativeClusteringDataVector *v4;
  PLRegionsAgglomerativeClusteringDataVector *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PLRegionsAgglomerativeClusteringDataVector;
  v4 = -[PLRegionsAgglomerativeClusteringDataVector init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_length = a3;
    v4->_data = (double *)malloc_type_calloc(8 * a3, 1uLL, 0xAFC71C67uLL);
  }
  return v5;
}

- (void)dealloc
{
  double *data;
  objc_super v4;

  data = self->_data;
  if (data)
  {
    free(data);
    self->_data = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)PLRegionsAgglomerativeClusteringDataVector;
  -[PLRegionsAgglomerativeClusteringDataVector dealloc](&v4, sel_dealloc);
}

- (double)data
{
  return self->_data;
}

- (unint64_t)length
{
  return self->_length;
}

- (id)userInfo
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setUserInfo:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_userInfo, 0);
}

@end
