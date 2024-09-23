@implementation vtVector

- (vtVector)init
{
  vtVector *v2;
  vtVector *v3;
  NSMutableArray *v4;
  NSMutableArray *vVectorData;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)vtVector;
  v2 = -[vtVector init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_vVectorElements = 0;
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    vVectorData = v3->_vVectorData;
    v3->_vVectorData = v4;

    if (!v3->_vVectorData)
    {

      return 0;
    }
  }
  return v3;
}

- (int)addElement:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[vtVector vVectorData](self, "vVectorData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

  ++self->_vVectorElements;
  return 0;
}

- (unsigned)vVectorElements
{
  return self->_vVectorElements;
}

- (void)setVVectorElements:(unsigned int)a3
{
  self->_vVectorElements = a3;
}

- (NSMutableArray)vVectorData
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setVVectorData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vVectorData, 0);
}

@end
