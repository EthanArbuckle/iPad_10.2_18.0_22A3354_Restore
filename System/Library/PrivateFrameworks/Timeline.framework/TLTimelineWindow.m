@implementation TLTimelineWindow

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TLTimelineWindow)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  TLTimelineWindow *v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("focalNode"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("maxNodes"));
  v7 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("leftCount"));
  v8 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("rightCount"));

  v9 = -[TLTimelineWindow initWithFocalNode:maxNodes:leftSegmentCount:rightSegmentCount:](self, "initWithFocalNode:maxNodes:leftSegmentCount:rightSegmentCount:", v5, v6, v7, v8);
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  TLTimelineWindow *v4;
  id v5;

  v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  objc_msgSend(v5, "encodeObject:forKey:", v4->_focalNode, CFSTR("focalNode"));
  objc_msgSend(v5, "encodeInteger:forKey:", -[TLTimelineSegment count](v4->_leftSegment, "count"), CFSTR("leftCount"));
  objc_msgSend(v5, "encodeInteger:forKey:", -[TLTimelineSegment count](v4->_rightSegment, "count"), CFSTR("rightCount"));
  objc_sync_exit(v4);

  objc_msgSend(v5, "encodeInteger:forKey:", v4->_maxNodes, CFSTR("maxNodes"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  TLTimelineWindow *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v4 = self;
  objc_sync_enter(v4);
  v5 = -[TLTimelineEntryNode copyWithZone:](v4->_focalNode, "copyWithZone:", a3);
  v6 = -[TLTimelineSegment count](v4->_leftSegment, "count");
  v7 = -[TLTimelineSegment count](v4->_rightSegment, "count");
  objc_sync_exit(v4);

  v8 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithFocalNode:maxNodes:leftSegmentCount:rightSegmentCount:", v5, v4->_maxNodes, v6, v7);
  return v8;
}

- (unint64_t)hash
{
  TLTimelineWindow *v2;
  uint64_t v3;
  unint64_t maxNodes;
  uint64_t v5;
  unint64_t v6;

  v2 = self;
  objc_sync_enter(v2);
  v3 = -[TLTimelineEntryNode hash](v2->_focalNode, "hash");
  maxNodes = v2->_maxNodes;
  v5 = -[TLTimelineSegment hash](v2->_leftSegment, "hash");
  v6 = maxNodes ^ v3 ^ v5 ^ -[TLTimelineSegment hash](v2->_rightSegment, "hash");
  objc_sync_exit(v2);

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  TLTimelineWindow *v4;
  TLTimelineWindow *v5;
  unint64_t maxNodes;
  TLTimelineSegment *leftSegment;
  void *v8;
  _BOOL4 v9;
  TLTimelineSegment *rightSegment;
  void *v11;
  _BOOL4 v12;
  TLTimelineEntryNode *focalNode;
  void *v14;
  BOOL v15;

  v4 = (TLTimelineWindow *)a3;
  if (v4 == self)
  {
    v15 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = self;
      objc_sync_enter(v5);
      maxNodes = v5->_maxNodes;
      if (maxNodes != -[TLTimelineWindow maxNodes](v4, "maxNodes"))
        goto LABEL_9;
      leftSegment = v5->_leftSegment;
      -[TLTimelineWindow leftSegment](v4, "leftSegment");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = +[TLTimelineUtilities object:isEqualToObject:](TLTimelineUtilities, "object:isEqualToObject:", leftSegment, v8);

      if (!v9)
        goto LABEL_9;
      rightSegment = v5->_rightSegment;
      -[TLTimelineWindow rightSegment](v4, "rightSegment");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = +[TLTimelineUtilities object:isEqualToObject:](TLTimelineUtilities, "object:isEqualToObject:", rightSegment, v11);

      if (v12)
      {
        focalNode = v5->_focalNode;
        -[TLTimelineWindow focalNode](v4, "focalNode");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = +[TLTimelineUtilities object:isEqualToObject:](TLTimelineUtilities, "object:isEqualToObject:", focalNode, v14);

      }
      else
      {
LABEL_9:
        v15 = 0;
      }
      objc_sync_exit(v5);

    }
    else
    {
      v15 = 0;
    }
  }

  return v15;
}

- (TLTimelineWindow)initWithFocalNode:(id)a3 maxNodes:(unint64_t)a4 leftSegmentCount:(unint64_t)a5 rightSegmentCount:(unint64_t)a6
{
  id v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  TLTimelineSegment *v15;
  id v16;
  void *v17;
  void *v18;
  unint64_t v19;
  void *v20;
  TLTimelineSegment *v21;
  TLTimelineWindow *v22;

  v10 = a3;
  v11 = v10;
  v12 = v10;
  if (a5 >= 2)
  {
    v13 = a5;
    v14 = v10;
    do
    {
      objc_msgSend(v14, "leftEntryNode");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      --v13;
      v14 = v12;
    }
    while (v13 > 1);
  }
  v15 = -[TLTimelineSegment initWithLeftmostNode:rightmostNode:count:]([TLTimelineSegment alloc], "initWithLeftmostNode:rightmostNode:count:", v12, v11, a5);
  v16 = v11;
  v17 = v16;
  v18 = v16;
  if (a6 >= 2)
  {
    v19 = a6 - 1;
    v20 = v16;
    do
    {
      objc_msgSend(v20, "rightEntryNode");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = v18;
      --v19;
    }
    while (v19);
  }
  v21 = -[TLTimelineSegment initWithLeftmostNode:rightmostNode:count:]([TLTimelineSegment alloc], "initWithLeftmostNode:rightmostNode:count:", v17, v18, a6);
  v22 = -[TLTimelineWindow initWithFocalNode:leftSegment:rightSegment:maxNodes:](self, "initWithFocalNode:leftSegment:rightSegment:maxNodes:", v17, v15, v21, a4);

  return v22;
}

- (TLTimelineWindow)initWithFocalNode:(id)a3 maxNodes:(unint64_t)a4
{
  id v7;
  TLTimelineWindow *v8;
  TLTimelineSegment *v9;
  TLTimelineSegment *v10;
  TLTimelineSegment *leftSegment;
  TLTimelineSegment *v12;
  TLTimelineSegment *rightSegment;
  objc_super v15;

  v7 = a3;
  v15.receiver = self;
  v15.super_class = (Class)TLTimelineWindow;
  v8 = -[TLTimelineWindow init](&v15, sel_init);
  if (v8)
  {
    v9 = -[TLTimelineSegment initWithLeftmostNode:rightmostNode:count:]([TLTimelineSegment alloc], "initWithLeftmostNode:rightmostNode:count:", v7, v7, 1);
    v10 = -[TLTimelineSegment initWithLeftmostNode:rightmostNode:count:]([TLTimelineSegment alloc], "initWithLeftmostNode:rightmostNode:count:", v7, v7, 1);
    objc_storeStrong((id *)&v8->_focalNode, a3);
    v8->_maxNodes = a4;
    leftSegment = v8->_leftSegment;
    v8->_leftSegment = v9;
    v12 = v9;

    rightSegment = v8->_rightSegment;
    v8->_rightSegment = v10;

  }
  return v8;
}

- (TLTimelineWindow)initWithFocalNode:(id)a3 leftSegment:(id)a4 rightSegment:(id)a5 maxNodes:(unint64_t)a6
{
  id v11;
  id v12;
  id v13;
  TLTimelineWindow *v14;
  TLTimelineWindow *v15;
  objc_super v17;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)TLTimelineWindow;
  v14 = -[TLTimelineWindow init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_focalNode, a3);
    v15->_maxNodes = a6;
    objc_storeStrong((id *)&v15->_leftSegment, a4);
    objc_storeStrong((id *)&v15->_rightSegment, a5);
  }

  return v15;
}

- (void)updateFocalNodeWithDate:(id)a3
{
  TLTimelineWindow *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  BOOL v9;
  uint64_t v10;
  TLTimelineEntryNode *focalNode;
  void *v12;
  _BOOL4 v13;
  uint64_t v14;
  TLTimelineEntryNode *v15;
  void *v16;
  id v17;

  v17 = a3;
  v4 = self;
  objc_sync_enter(v4);
  while (1)
  {
    -[TLTimelineEntryNode rightEntryNode](v4->_focalNode, "rightEntryNode");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
      break;
    -[TLTimelineEntryNode rightEntryNode](v4->_focalNode, "rightEntryNode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "date");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v8 = v17;
    if (+[TLTimelineUtilities date:isOrderedAscendingToDate:](TLTimelineUtilities, "date:isOrderedAscendingToDate:", v7, v8))
    {

    }
    else
    {
      v9 = +[TLTimelineUtilities object:isEqualToObject:](TLTimelineUtilities, "object:isEqualToObject:", v7, v8);

      if (!v9)
        break;
    }
    -[TLTimelineEntryNode rightEntryNode](v4->_focalNode, "rightEntryNode");
    v10 = objc_claimAutoreleasedReturnValue();
    focalNode = v4->_focalNode;
    v4->_focalNode = (TLTimelineEntryNode *)v10;

    -[TLTimelineSegment shiftRight](v4->_leftSegment, "shiftRight");
    -[TLTimelineSegment shiftRight](v4->_rightSegment, "shiftRight");
  }
  while (1)
  {
    -[TLTimelineEntryNode leftEntryNode](v4->_focalNode, "leftEntryNode");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16)
      break;
    -[TLTimelineEntryNode date](v4->_focalNode, "date");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = +[TLTimelineUtilities date:isOrderedAscendingToDate:](TLTimelineUtilities, "date:isOrderedAscendingToDate:", v17, v12);

    if (!v13)
      break;
    -[TLTimelineEntryNode leftEntryNode](v4->_focalNode, "leftEntryNode");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v4->_focalNode;
    v4->_focalNode = (TLTimelineEntryNode *)v14;

    -[TLTimelineSegment shiftLeft](v4->_leftSegment, "shiftLeft");
    -[TLTimelineSegment shiftLeft](v4->_rightSegment, "shiftLeft");
  }
  objc_sync_exit(v4);

}

- (void)rebalance
{
  unint64_t maxNodes;
  int v3;
  int v4;
  uint64_t v5;
  unint64_t v6;
  TLTimelineWindow *v7;
  BOOL v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  _BOOL4 v15;
  double v16;
  double v17;
  double v18;
  _BOOL4 v19;
  TLTimelineWindow *obj;

  obj = self;
  objc_sync_enter(obj);
  maxNodes = obj->_maxNodes;
  v3 = 1;
  v4 = 1;
  while (1)
  {
    v5 = -[TLTimelineSegment count](obj->_leftSegment, "count");
    v6 = -[TLTimelineSegment count](obj->_rightSegment, "count") + v5;
    v7 = obj;
    v8 = maxNodes && v6 > obj->_maxNodes;
    if (v8 || ((v4 | v3) & 1) == 0)
      break;
    if ((v4 & 1) != 0)
    {
      if ((v3 & 1) != 0)
      {
        -[TLTimelineSegment duration](obj->_rightSegment, "duration");
        v10 = v9;
        -[TLTimelineSegment duration](obj->_leftSegment, "duration");
        if (v10 >= v11)
        {
          v3 = 1;
          v4 = -[TLTimelineSegment expandToLeft](obj->_leftSegment, "expandToLeft");
        }
        else
        {
          v4 = 1;
          v3 = -[TLTimelineSegment expandToRight](obj->_rightSegment, "expandToRight");
        }
      }
      else
      {
        v4 = -[TLTimelineSegment expandToLeft](obj->_leftSegment, "expandToLeft");
        v3 = 0;
      }
    }
    else
    {
      v3 = -[TLTimelineSegment expandToRight](obj->_rightSegment, "expandToRight");
      v4 = 0;
    }
  }
  if ((v4 & 1) != 0)
  {
    while (1)
    {
      -[TLTimelineSegment duration](obj->_leftSegment, "duration");
      v13 = v12;
      -[TLTimelineSegment duration](obj->_rightSegment, "duration");
      v7 = obj;
      if (v13 >= v14)
        break;
      v15 = -[TLTimelineSegment expandToLeft](obj->_leftSegment, "expandToLeft");
      v7 = obj;
      if (!v15)
        break;
      -[TLTimelineSegment contractFromRight](obj->_rightSegment, "contractFromRight");
    }
  }
  if ((v3 & 1) != 0)
  {
    while (1)
    {
      -[TLTimelineSegment duration](obj->_rightSegment, "duration");
      v17 = v16;
      -[TLTimelineSegment duration](obj->_leftSegment, "duration");
      v7 = obj;
      if (v17 >= v18)
        break;
      v19 = -[TLTimelineSegment expandToRight](obj->_rightSegment, "expandToRight");
      v7 = obj;
      if (!v19)
        break;
      -[TLTimelineSegment contractFromLeft](obj->_leftSegment, "contractFromLeft");
    }
  }
  objc_sync_exit(v7);

}

- (BOOL)containsNode:(id)a3
{
  id v4;
  TLTimelineWindow *v5;
  char v6;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (-[TLTimelineSegment containsNode:](v5->_leftSegment, "containsNode:", v4))
    v6 = 1;
  else
    v6 = -[TLTimelineSegment containsNode:](v5->_rightSegment, "containsNode:", v4);
  objc_sync_exit(v5);

  return v6;
}

- (id)leftmostNode
{
  TLTimelineWindow *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  -[TLTimelineSegment leftmostNode](v2->_leftSegment, "leftmostNode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v2);

  return v3;
}

- (id)rightmostNode
{
  TLTimelineWindow *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  -[TLTimelineSegment rightmostNode](v2->_rightSegment, "rightmostNode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v2);

  return v3;
}

- (NSDate)leftmostContiguousEntryDate
{
  void *v2;
  void *v3;

  -[TLTimelineWindow leftmostNode](self, "leftmostNode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (NSDate)rightmostContiguousEntryDate
{
  void *v2;
  void *v3;

  -[TLTimelineWindow rightmostNode](self, "rightmostNode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (unint64_t)leftEntryCount
{
  TLTimelineWindow *v2;
  unint64_t v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = -[TLTimelineSegment count](v2->_leftSegment, "count") - 1;
  objc_sync_exit(v2);

  return v3;
}

- (unint64_t)rightEntryCount
{
  TLTimelineWindow *v2;
  unint64_t v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = -[TLTimelineSegment count](v2->_rightSegment, "count") - 1;
  objc_sync_exit(v2);

  return v3;
}

- (TLTimelineEntryNode)focalNode
{
  return self->_focalNode;
}

- (TLTimelineSegment)leftSegment
{
  return self->_leftSegment;
}

- (TLTimelineSegment)rightSegment
{
  return self->_rightSegment;
}

- (unint64_t)maxNodes
{
  return self->_maxNodes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightSegment, 0);
  objc_storeStrong((id *)&self->_leftSegment, 0);
  objc_storeStrong((id *)&self->_focalNode, 0);
}

@end
