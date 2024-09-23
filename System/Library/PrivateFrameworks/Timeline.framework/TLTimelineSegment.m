@implementation TLTimelineSegment

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TLTimelineSegment)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  TLTimelineSegment *v12;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("leftmostNode"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("count"));
  v7 = v5;
  v8 = v7;
  v9 = v7;
  if (v6 >= 2)
  {
    v10 = v6 - 1;
    v11 = v7;
    do
    {
      objc_msgSend(v8, "rightEntryNode");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = v9;
      --v10;
    }
    while (v10);
  }
  v12 = -[TLTimelineSegment initWithLeftmostNode:rightmostNode:count:](self, "initWithLeftmostNode:rightmostNode:count:", v8, v9, v6);

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  TLTimelineSegment *v4;
  id v5;

  v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  objc_msgSend(v5, "encodeObject:forKey:", v4->_leftmostNode, CFSTR("leftmostNode"));
  objc_msgSend(v5, "encodeInteger:forKey:", v4->_count, CFSTR("count"));
  objc_sync_exit(v4);

}

- (id)copyWithZone:(_NSZone *)a3
{
  TLTimelineSegment *v4;
  id v5;
  unint64_t count;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;

  v4 = self;
  objc_sync_enter(v4);
  v5 = -[TLTimelineEntryNode copyWithZone:](v4->_leftmostNode, "copyWithZone:", a3);
  count = v4->_count;
  v7 = v5;
  v8 = v7;
  v9 = v7;
  if (count >= 2)
  {
    v10 = count - 1;
    v11 = v7;
    do
    {
      objc_msgSend(v8, "rightEntryNode");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = v9;
      --v10;
    }
    while (v10);
  }
  objc_sync_exit(v4);

  v12 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithLeftmostNode:rightmostNode:count:", v8, v9, count);
  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  TLTimelineSegment *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = self;
    objc_sync_enter(v5);
    v6 = -[TLTimelineSegment count](v5, "count");
    if (v6 == objc_msgSend(v4, "count"))
    {
      -[TLTimelineSegment leftmostNode](v5, "leftmostNode");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "leftmostNode");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "isEqual:", v8);

    }
    else
    {
      v9 = 0;
    }
    objc_sync_exit(v5);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  TLTimelineSegment *v2;
  unint64_t count;
  uint64_t v4;

  v2 = self;
  objc_sync_enter(v2);
  count = v2->_count;
  v4 = -[TLTimelineEntryNode hash](v2->_leftmostNode, "hash") ^ count;
  objc_sync_exit(v2);

  return v4 ^ +[TLTimelineSegment hash](TLTimelineSegment, "hash");
}

- (TLTimelineSegment)initWithLeftmostNode:(id)a3 rightmostNode:(id)a4 count:(unint64_t)a5
{
  id v9;
  id v10;
  TLTimelineSegment *v11;
  TLTimelineSegment *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)TLTimelineSegment;
  v11 = -[TLTimelineSegment init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_leftmostNode, a3);
    objc_storeStrong((id *)&v12->_rightmostNode, a4);
    v12->_count = a5;
  }

  return v12;
}

- (BOOL)containsNode:(id)a3
{
  TLTimelineEntryNode *v4;
  TLTimelineSegment *v5;
  TLTimelineEntryNode *leftmostNode;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;

  v4 = (TLTimelineEntryNode *)a3;
  v5 = self;
  objc_sync_enter(v5);
  leftmostNode = v5->_leftmostNode;
  if (leftmostNode == v4 || v5->_rightmostNode == v4)
  {
    v11 = 1;
  }
  else
  {
    -[TLTimelineEntryNode date](leftmostNode, "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TLTimelineEntryNode date](v4, "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (+[TLTimelineUtilities date:isOrderedAscendingToDate:](TLTimelineUtilities, "date:isOrderedAscendingToDate:", v7, v8))
    {
      -[TLTimelineEntryNode date](v4, "date");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[TLTimelineEntryNode date](v5->_rightmostNode, "date");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = +[TLTimelineUtilities date:isOrderedAscendingToDate:](TLTimelineUtilities, "date:isOrderedAscendingToDate:", v9, v10);

    }
    else
    {
      v11 = 0;
    }

  }
  objc_sync_exit(v5);

  return v11;
}

- (BOOL)expandToRight
{
  TLTimelineSegment *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  -[TLTimelineEntryNode rightEntryNode](v2->_rightmostNode, "rightEntryNode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_storeStrong((id *)&v2->_rightmostNode, v3);
    ++v2->_count;
  }

  objc_sync_exit(v2);
  return v3 != 0;
}

- (BOOL)expandToLeft
{
  TLTimelineSegment *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  -[TLTimelineEntryNode leftEntryNode](v2->_leftmostNode, "leftEntryNode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_storeStrong((id *)&v2->_leftmostNode, v3);
    ++v2->_count;
  }

  objc_sync_exit(v2);
  return v3 != 0;
}

- (BOOL)contractFromRight
{
  TLTimelineSegment *v2;
  unint64_t count;
  uint64_t v4;
  TLTimelineEntryNode *rightmostNode;

  v2 = self;
  objc_sync_enter(v2);
  count = v2->_count;
  if (count >= 2)
  {
    -[TLTimelineEntryNode leftEntryNode](v2->_rightmostNode, "leftEntryNode");
    v4 = objc_claimAutoreleasedReturnValue();
    rightmostNode = v2->_rightmostNode;
    v2->_rightmostNode = (TLTimelineEntryNode *)v4;

    --v2->_count;
  }
  objc_sync_exit(v2);

  return count > 1;
}

- (BOOL)contractFromLeft
{
  TLTimelineSegment *v2;
  unint64_t count;
  uint64_t v4;
  TLTimelineEntryNode *leftmostNode;

  v2 = self;
  objc_sync_enter(v2);
  count = v2->_count;
  if (count >= 2)
  {
    -[TLTimelineEntryNode rightEntryNode](v2->_leftmostNode, "rightEntryNode");
    v4 = objc_claimAutoreleasedReturnValue();
    leftmostNode = v2->_leftmostNode;
    v2->_leftmostNode = (TLTimelineEntryNode *)v4;

    --v2->_count;
  }
  objc_sync_exit(v2);

  return count > 1;
}

- (BOOL)shiftRight
{
  TLTimelineSegment *v2;
  BOOL v3;

  v2 = self;
  objc_sync_enter(v2);
  if (-[TLTimelineSegment expandToRight](v2, "expandToRight"))
    v3 = -[TLTimelineSegment contractFromLeft](v2, "contractFromLeft");
  else
    v3 = 0;
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)shiftLeft
{
  TLTimelineSegment *v2;
  BOOL v3;

  v2 = self;
  objc_sync_enter(v2);
  if (-[TLTimelineSegment expandToLeft](v2, "expandToLeft"))
    v3 = -[TLTimelineSegment contractFromRight](v2, "contractFromRight");
  else
    v3 = 0;
  objc_sync_exit(v2);

  return v3;
}

- (double)duration
{
  TLTimelineSegment *v2;
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;

  v2 = self;
  objc_sync_enter(v2);
  -[TLTimelineEntryNode date](v2->_leftmostNode, "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[TLTimelineEntryNode date](v2->_rightmostNode, "date");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[TLTimelineEntryNode date](v2->_leftmostNode, "date");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeIntervalSinceDate:", v5);
    v7 = v6;

  }
  else
  {
    v7 = 0.0;
  }
  objc_sync_exit(v2);

  return v7;
}

- (TLTimelineEntryNode)leftmostNode
{
  return self->_leftmostNode;
}

- (TLTimelineEntryNode)rightmostNode
{
  return self->_rightmostNode;
}

- (unint64_t)count
{
  return self->_count;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightmostNode, 0);
  objc_storeStrong((id *)&self->_leftmostNode, 0);
}

@end
