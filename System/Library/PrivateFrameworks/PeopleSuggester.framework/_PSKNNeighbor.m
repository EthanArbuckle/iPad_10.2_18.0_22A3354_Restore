@implementation _PSKNNeighbor

- (_PSKNNeighbor)initWithNodeData:(id)a3 distance:(double)a4
{
  id v7;
  _PSKNNeighbor *v8;
  _PSKNNeighbor *v9;

  v7 = a3;
  v8 = -[_PSKNNeighbor init](self, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_nodeData, a3);
    v9->_distance = a4;
  }

  return v9;
}

- (double)distance
{
  return self->_distance;
}

- (void)setDistance:(double)a3
{
  self->_distance = a3;
}

- (NSArray)nodeData
{
  return self->_nodeData;
}

- (void)setNodeData:(id)a3
{
  objc_storeStrong((id *)&self->_nodeData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nodeData, 0);
}

@end
