@implementation PLOPTICSClusterDescriptor

- (PLOPTICSClusterDescriptor)initWithParameters:(_NSRange)a3 rootLevel:(int64_t)a4 minCoreDistanceIndex:(int64_t)a5 minCoreDistance:(double)a6
{
  NSUInteger length;
  NSUInteger location;
  PLOPTICSClusterDescriptor *v11;
  PLOPTICSClusterDescriptor *v12;
  NSNumber *startIndex;
  uint64_t v14;
  NSUInteger v15;
  uint64_t v16;
  NSNumber *clusterSize;
  uint64_t v18;
  NSNumber *endIndex;
  uint64_t v20;
  NSNumber *rootLevel;
  uint64_t v22;
  NSNumber *minCoreDistanceIndex;
  uint64_t v24;
  NSNumber *minCoreDistance;
  objc_super v27;

  length = a3.length;
  location = a3.location;
  v27.receiver = self;
  v27.super_class = (Class)PLOPTICSClusterDescriptor;
  v11 = -[PLOPTICSClusterDescriptor init](&v27, sel_init);
  v12 = v11;
  if (v11)
  {
    if (location == 0x7FFFFFFFFFFFFFFFLL)
    {
      startIndex = v11->_startIndex;
      v11->_startIndex = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", location);
      v14 = objc_claimAutoreleasedReturnValue();
      startIndex = v12->_startIndex;
      v12->_startIndex = (NSNumber *)v14;
    }

    if (length == 0x7FFFFFFFFFFFFFFFLL)
      v15 = 0;
    else
      v15 = length;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v15);
    v16 = objc_claimAutoreleasedReturnValue();
    clusterSize = v12->_clusterSize;
    v12->_clusterSize = (NSNumber *)v16;

    if (v12->_startIndex)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", location + -[NSNumber unsignedIntegerValue](v12->_clusterSize, "unsignedIntegerValue") - 1);
      v18 = objc_claimAutoreleasedReturnValue();
      endIndex = v12->_endIndex;
      v12->_endIndex = (NSNumber *)v18;
    }
    else
    {
      endIndex = v12->_endIndex;
      v12->_endIndex = 0;
    }

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v20 = objc_claimAutoreleasedReturnValue();
    rootLevel = v12->_rootLevel;
    v12->_rootLevel = (NSNumber *)v20;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
    v22 = objc_claimAutoreleasedReturnValue();
    minCoreDistanceIndex = v12->_minCoreDistanceIndex;
    v12->_minCoreDistanceIndex = (NSNumber *)v22;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a6);
    v24 = objc_claimAutoreleasedReturnValue();
    minCoreDistance = v12->_minCoreDistance;
    v12->_minCoreDistance = (NSNumber *)v24;

  }
  return v12;
}

- (_NSRange)indexRange
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  _NSRange result;

  v3 = -[NSNumber unsignedIntegerValue](self->_startIndex, "unsignedIntegerValue");
  v4 = -[NSNumber unsignedIntegerValue](self->_clusterSize, "unsignedIntegerValue");
  v5 = v3;
  result.length = v4;
  result.location = v5;
  return result;
}

- (NSNumber)startIndex
{
  return self->_startIndex;
}

- (NSNumber)endIndex
{
  return self->_endIndex;
}

- (NSNumber)clusterSize
{
  return self->_clusterSize;
}

- (NSNumber)rootLevel
{
  return self->_rootLevel;
}

- (NSNumber)minCoreDistanceIndex
{
  return self->_minCoreDistanceIndex;
}

- (NSNumber)minCoreDistance
{
  return self->_minCoreDistance;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_minCoreDistance, 0);
  objc_storeStrong((id *)&self->_minCoreDistanceIndex, 0);
  objc_storeStrong((id *)&self->_rootLevel, 0);
  objc_storeStrong((id *)&self->_clusterSize, 0);
  objc_storeStrong((id *)&self->_endIndex, 0);
  objc_storeStrong((id *)&self->_startIndex, 0);
}

+ (id)clusterDescriptor:(_NSRange)a3 rootLevel:(int64_t)a4 minCoreDistanceIndex:(int64_t)a5 minCoreDistance:(double)a6
{
  return -[PLOPTICSClusterDescriptor initWithParameters:rootLevel:minCoreDistanceIndex:minCoreDistance:]([PLOPTICSClusterDescriptor alloc], "initWithParameters:rootLevel:minCoreDistanceIndex:minCoreDistance:", a3.location, a3.length, a4, a5, a6);
}

@end
