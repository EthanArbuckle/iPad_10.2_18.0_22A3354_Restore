@implementation VGSkeletonDefinition

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeInt64:forKey:", -[VGSkeletonDefinition jointCount](self, "jointCount"), CFSTR("jointCount"));
  objc_msgSend(v5, "encodeInteger:forKey:", -[VGSkeletonDefinition rootJointIndex](self, "rootJointIndex"), CFSTR("rootJointIndex"));
  -[VGSkeletonDefinition parentChildOrder](self, "parentChildOrder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("parentChildOrder"));

  objc_msgSend(v5, "encodeInt:forKey:", -[VGSkeletonDefinition skeletonType](self, "skeletonType"), CFSTR("skeletonType"));
}

- (VGSkeletonDefinition)initWithCoder:(id)a3
{
  id v4;
  VGSkeletonDefinition *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  VGSkeletonDefinition *v10;
  objc_super v12;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)VGSkeletonDefinition;
  v5 = -[VGSkeletonDefinition init](&v12, sel_init);
  if (v5)
  {
    -[VGSkeletonDefinition setJointCount:](v5, "setJointCount:", objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("jointCount")));
    -[VGSkeletonDefinition setRootJointIndex:](v5, "setRootJointIndex:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("rootJointIndex")));
    v6 = (void *)MEMORY[0x24BDBCF20];
    v13[0] = objc_opt_class();
    v13[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("parentChildOrder"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[VGSkeletonDefinition setParentChildOrder:](v5, "setParentChildOrder:", v9);

    -[VGSkeletonDefinition setSkeletonType:](v5, "setSkeletonType:", objc_msgSend(v4, "decodeIntForKey:", CFSTR("skeletonType")));
    v10 = v5;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _DWORD *v5;
  void *v6;
  void *v7;
  BOOL v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if (-[VGSkeletonDefinition jointCount](self, "jointCount") == *((_QWORD *)v5 + 2)
      && -[VGSkeletonDefinition rootJointIndex](self, "rootJointIndex") == *((_QWORD *)v5 + 3))
    {
      -[VGSkeletonDefinition parentChildOrder](self, "parentChildOrder");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 || *((_QWORD *)v5 + 4))
      {
        -[VGSkeletonDefinition parentChildOrder](self, "parentChildOrder");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v7, "isEqual:", *((_QWORD *)v5 + 4)))
          v8 = -[VGSkeletonDefinition skeletonType](self, "skeletonType") == v5[2];
        else
          v8 = 0;

      }
      else
      {
        v8 = -[VGSkeletonDefinition skeletonType](self, "skeletonType") == v5[2];
      }

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)jointCount
{
  return self->_jointCount;
}

- (void)setJointCount:(unint64_t)a3
{
  self->_jointCount = a3;
}

- (int64_t)rootJointIndex
{
  return self->_rootJointIndex;
}

- (void)setRootJointIndex:(int64_t)a3
{
  self->_rootJointIndex = a3;
}

- (NSArray)parentChildOrder
{
  return self->_parentChildOrder;
}

- (void)setParentChildOrder:(id)a3
{
  objc_storeStrong((id *)&self->_parentChildOrder, a3);
}

- (int)skeletonType
{
  return self->_skeletonType;
}

- (void)setSkeletonType:(int)a3
{
  self->_skeletonType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentChildOrder, 0);
}

@end
