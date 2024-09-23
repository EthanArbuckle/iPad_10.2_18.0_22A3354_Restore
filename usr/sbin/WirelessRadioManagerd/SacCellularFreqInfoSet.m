@implementation SacCellularFreqInfoSet

- (NSMutableArray)mCellularSccFreqList
{
  return self->_mCellularSccFreqList;
}

- (NSMutableArray)mCellularPccFreq
{
  return self->_mCellularPccFreq;
}

- (NSMutableArray)mCellularHoppingFreq
{
  return self->_mCellularHoppingFreq;
}

- (NSMutableArray)mCellularSearchFreqList
{
  return self->_mCellularSearchFreqList;
}

- (NSMutableArray)mCellularRPLMNFreqList
{
  return self->_mCellularRPLMNFreqList;
}

- (NSMutableArray)mCellularNeighborFreqList
{
  return self->_mCellularNeighborFreqList;
}

- (SacCellularFreqInfoSet)init
{
  SacCellularFreqInfoSet *v2;
  NSMutableArray *v3;
  NSMutableArray *mCellularPccFreq;
  NSMutableArray *v5;
  NSMutableArray *mCellularSccFreqList;
  NSMutableArray *v7;
  NSMutableArray *mCellularHoppingFreq;
  NSMutableArray *v9;
  NSMutableArray *mCellularNeighborFreqList;
  NSMutableArray *v11;
  NSMutableArray *mCellularSearchFreqList;
  NSMutableArray *v13;
  NSMutableArray *mCellularRPLMNFreqList;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)SacCellularFreqInfoSet;
  v2 = -[SacCellularFreqInfoSet init](&v16, "init");
  v3 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  mCellularPccFreq = v2->_mCellularPccFreq;
  v2->_mCellularPccFreq = v3;

  v5 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  mCellularSccFreqList = v2->_mCellularSccFreqList;
  v2->_mCellularSccFreqList = v5;

  v7 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  mCellularHoppingFreq = v2->_mCellularHoppingFreq;
  v2->_mCellularHoppingFreq = v7;

  v9 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  mCellularNeighborFreqList = v2->_mCellularNeighborFreqList;
  v2->_mCellularNeighborFreqList = v9;

  v11 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  mCellularSearchFreqList = v2->_mCellularSearchFreqList;
  v2->_mCellularSearchFreqList = v11;

  v13 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  mCellularRPLMNFreqList = v2->_mCellularRPLMNFreqList;
  v2->_mCellularRPLMNFreqList = v13;

  return v2;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)SacCellularFreqInfoSet;
  -[SacCellularFreqInfoSet dealloc](&v2, "dealloc");
}

- (void)removeAllFreq
{
  -[NSMutableArray removeAllObjects](self->_mCellularPccFreq, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_mCellularSccFreqList, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_mCellularNeighborFreqList, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_mCellularSearchFreqList, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_mCellularRPLMNFreqList, "removeAllObjects");
}

- (void)setMCellularPccFreq:(id)a3
{
  objc_storeStrong((id *)&self->_mCellularPccFreq, a3);
}

- (void)setMCellularSccFreqList:(id)a3
{
  objc_storeStrong((id *)&self->_mCellularSccFreqList, a3);
}

- (void)setMCellularHoppingFreq:(id)a3
{
  objc_storeStrong((id *)&self->_mCellularHoppingFreq, a3);
}

- (void)setMCellularNeighborFreqList:(id)a3
{
  objc_storeStrong((id *)&self->_mCellularNeighborFreqList, a3);
}

- (void)setMCellularSearchFreqList:(id)a3
{
  objc_storeStrong((id *)&self->_mCellularSearchFreqList, a3);
}

- (void)setMCellularRPLMNFreqList:(id)a3
{
  objc_storeStrong((id *)&self->_mCellularRPLMNFreqList, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mCellularRPLMNFreqList, 0);
  objc_storeStrong((id *)&self->_mCellularSearchFreqList, 0);
  objc_storeStrong((id *)&self->_mCellularNeighborFreqList, 0);
  objc_storeStrong((id *)&self->_mCellularHoppingFreq, 0);
  objc_storeStrong((id *)&self->_mCellularSccFreqList, 0);
  objc_storeStrong((id *)&self->_mCellularPccFreq, 0);
}

@end
