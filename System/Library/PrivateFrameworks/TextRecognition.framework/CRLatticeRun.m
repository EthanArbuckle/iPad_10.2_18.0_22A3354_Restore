@implementation CRLatticeRun

- (CRLatticeRun)initWithRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CRLatticeRun *v7;
  uint64_t v8;
  NSMutableArray *mutablePaths;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11.receiver = self;
  v11.super_class = (Class)CRLatticeRun;
  v7 = -[CRLatticeRun init](&v11, sel_init);
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = objc_claimAutoreleasedReturnValue();
    mutablePaths = v7->_mutablePaths;
    v7->_mutablePaths = (NSMutableArray *)v8;

    v7->_rect.origin.x = x;
    v7->_rect.origin.y = y;
    v7->_rect.size.width = width;
    v7->_rect.size.height = height;
  }
  return v7;
}

- (void)appendPath:(id)a3
{
  -[NSMutableArray addObject:](self->_mutablePaths, "addObject:", a3);
}

- (void)setGraph:(id)a3
{
  objc_storeStrong((id *)&self->_graphEdges, a3);
}

- (NSArray)paths
{
  return (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", self->_mutablePaths);
}

- (CGRect)rect
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD v6[4];
  CGRect result;

  objc_copyStruct(v6, &self->_rect, 32, 1, 0);
  v2 = *(double *)v6;
  v3 = *(double *)&v6[1];
  v4 = *(double *)&v6[2];
  v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (NSArray)graphEdges
{
  return self->_graphEdges;
}

- (NSMutableArray)mutablePaths
{
  return self->_mutablePaths;
}

- (void)setMutablePaths:(id)a3
{
  objc_storeStrong((id *)&self->_mutablePaths, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutablePaths, 0);
  objc_storeStrong((id *)&self->_graphEdges, 0);
}

@end
