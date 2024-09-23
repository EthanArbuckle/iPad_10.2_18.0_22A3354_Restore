@implementation _UITreeDataSourceSnapshotter

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  return self;
}

- (id)visibleIndexes
{
  void *v3;
  uint64_t v4;
  unint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_nodes.__end_ != self->_nodes.__begin_)
  {
    v4 = 0;
    v5 = 0;
    do
    {
      if (-[_UITreeDataSourceSnapshotter _isNodeIndexVisible:](self, "_isNodeIndexVisible:", v5))
        objc_msgSend(v3, "addIndexesInRange:", self->_nodes.__begin_[v4].var0.location, self->_nodes.__begin_[v4].var0.length);
      ++v5;
      ++v4;
    }
    while (v5 < 0xAAAAAAAAAAAAAAABLL * (((char *)self->_nodes.__end_ - (char *)self->_nodes.__begin_) >> 3));
  }
  return v3;
}

- (BOOL)_isNodeIndexVisible:(int64_t)a3
{
  int64_t v5;
  int v6;
  int64_t i;
  void *v10;

  if (0xAAAAAAAAAAAAAAABLL * (((char *)self->_nodes.__end_ - (char *)self->_nodes.__begin_) >> 3) <= a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITreeDataSourceSnapshotter.mm"), 678, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("nodeIndex < _nodes.size()"));

  }
  v5 = -[_UITreeDataSourceSnapshotter _parentNodeIndexForNodeIndex:](self, "_parentNodeIndexForNodeIndex:", a3);
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    LOBYTE(v6) = 1;
  }
  else
  {
    for (i = v5;
          i != 0x7FFFFFFFFFFFFFFFLL;
          i = -[_UITreeDataSourceSnapshotter _parentNodeIndexForNodeIndex:](self, "_parentNodeIndexForNodeIndex:", i))
    {
      v6 = -[NSMutableIndexSet containsIndex:](self->_expandedIndexes, "containsIndex:", self->_nodes.__begin_[i].var0.location + self->_nodes.__begin_[i].var0.length - 1);
      if (!v6)
        break;
    }
  }
  return v6;
}

- (int64_t)_parentNodeIndexForNodeIndex:(int64_t)a3
{
  uint64_t v3;
  _UIOutlineNode *begin;
  _UIOutlineNode *v5;
  int64_t var1;
  int64_t *i;
  int64_t v9;
  void *v13;

  v3 = a3;
  begin = self->_nodes.__begin_;
  if (0xAAAAAAAAAAAAAAABLL * (((char *)self->_nodes.__end_ - (char *)begin) >> 3) <= a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITreeDataSourceSnapshotter.mm"), 693, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("childNodeIndex < _nodes.size()"));

    begin = self->_nodes.__begin_;
  }
  v5 = &begin[v3];
  var1 = v5->var1;
  for (i = &v5[-1].var1; v3-- >= 1; i -= 3)
  {
    v9 = *i;
    if (var1 == v9 + 1)
      return v3;
  }
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (_UITreeDataSourceSnapshotter)init
{
  id v3;
  _UITreeDataSourceSnapshotter *v4;
  void *__p;
  void *v7;
  uint64_t v8;

  __p = 0;
  v7 = 0;
  v8 = 0;
  v3 = objc_alloc_init(MEMORY[0x1E0CB36B8]);
  v4 = -[_UITreeDataSourceSnapshotter initWithNodes:count:expandedIndexes:](self, "initWithNodes:count:expandedIndexes:", &__p, 0, v3);

  if (__p)
  {
    v7 = __p;
    operator delete(__p);
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  _UIOutlineNode *end;
  _UIOutlineNode *begin;
  int64_t v7;
  uint64_t v8;
  void *v9;
  void *__p;
  char *v12;
  char *v13;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v12 = 0;
  v13 = 0;
  __p = 0;
  begin = self->_nodes.__begin_;
  end = self->_nodes.__end_;
  v7 = (char *)end - (char *)begin;
  if (end != begin)
  {
    if (0xAAAAAAAAAAAAAAABLL * (v7 >> 3) >= 0xAAAAAAAAAAAAAABLL)
      abort();
    __p = std::__allocate_at_least[abi:nn180100]<std::allocator<_UIOutlineNode>>(0xAAAAAAAAAAAAAAABLL * (v7 >> 3));
    v13 = (char *)__p + 24 * v8;
    memmove(__p, begin, v7);
    v12 = (char *)__p + 8 * (v7 >> 3);
  }
  v9 = (void *)objc_msgSend(v4, "initWithNodes:count:expandedIndexes:", &__p, self->_count, self->_expandedIndexes);
  if (__p)
  {
    v12 = (char *)__p;
    operator delete(__p);
  }
  return v9;
}

- (_UITreeDataSourceSnapshotter)initWithNodes:()vector<_UIOutlineNode count:(std:(int64_t)a4 :(id)a5 allocator<_UIOutlineNode>> *)a3 expandedIndexes:
{
  id v8;
  _UITreeDataSourceSnapshotter *v9;
  _UITreeDataSourceSnapshotter *v10;
  vector<_UIOutlineNode, std::allocator<_UIOutlineNode>> *p_nodes;
  _UIOutlineNode *begin;
  _UIOutlineNode *end;
  int64_t v14;
  unint64_t v15;
  uint64_t value;
  _UIOutlineNode *v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  void **p_end;
  uint64_t v22;
  _UIOutlineNode *v23;
  _UIOutlineNode *v24;
  _UIOutlineNode *v25;
  _UIOutlineNode *v26;
  uint64_t v27;
  NSMutableIndexSet *expandedIndexes;
  objc_super v30;

  v8 = a5;
  v30.receiver = self;
  v30.super_class = (Class)_UITreeDataSourceSnapshotter;
  v9 = -[_UITreeDataSourceSnapshotter init](&v30, sel_init);
  v10 = v9;
  if (v9)
  {
    p_nodes = &v9->_nodes;
    if (&v9->_nodes == a3)
    {
LABEL_23:
      v10->_count = a4;
      v27 = objc_msgSend(v8, "mutableCopy");
      expandedIndexes = v10->_expandedIndexes;
      v10->_expandedIndexes = (NSMutableIndexSet *)v27;

      goto LABEL_24;
    }
    begin = a3->__begin_;
    end = a3->__end_;
    v14 = (char *)end - (char *)a3->__begin_;
    v15 = 0xAAAAAAAAAAAAAAABLL * (v14 >> 3);
    value = (uint64_t)v9->_nodes.__end_cap_.__value_;
    v17 = v9->_nodes.__begin_;
    if (0xAAAAAAAAAAAAAAABLL * ((value - (uint64_t)v17) >> 3) >= v15)
    {
      p_end = (void **)&v9->_nodes.__end_;
      v23 = v9->_nodes.__end_;
      if (0xAAAAAAAAAAAAAAABLL * (((char *)v23 - (char *)v17) >> 3) < v15)
      {
        v24 = (_UIOutlineNode *)((char *)begin + 8 * (((char *)v23 - (char *)v17) >> 3));
        if (v23 != v17)
        {
          memmove(v9->_nodes.__begin_, begin, (char *)v23 - (char *)v17);
          v17 = (_UIOutlineNode *)*p_end;
        }
        v14 = (char *)end - (char *)v24;
        if (end == v24)
          goto LABEL_22;
        v25 = v17;
        v26 = v24;
        goto LABEL_21;
      }
    }
    else
    {
      if (v17)
      {
        v9->_nodes.__end_ = v17;
        operator delete(v17);
        value = 0;
        p_nodes->__begin_ = 0;
        p_nodes->__end_ = 0;
        p_nodes->__end_cap_.__value_ = 0;
      }
      if (v15 > 0xAAAAAAAAAAAAAAALL)
        goto LABEL_25;
      v18 = 0xAAAAAAAAAAAAAAABLL * (value >> 3);
      v19 = 2 * v18;
      if (2 * v18 <= v15)
        v19 = 0xAAAAAAAAAAAAAAABLL * (v14 >> 3);
      v20 = v18 >= 0x555555555555555 ? 0xAAAAAAAAAAAAAAALL : v19;
      if (v20 > 0xAAAAAAAAAAAAAAALL)
LABEL_25:
        abort();
      v17 = (_UIOutlineNode *)std::__allocate_at_least[abi:nn180100]<std::allocator<_UIOutlineNode>>(v20);
      v10->_nodes.__end_ = v17;
      p_end = (void **)&v10->_nodes.__end_;
      v10->_nodes.__begin_ = v17;
      v10->_nodes.__end_cap_.__value_ = &v17[v22];
    }
    if (end == begin)
    {
LABEL_22:
      *p_end = (char *)v17 + v14;
      goto LABEL_23;
    }
    v25 = v17;
    v26 = begin;
LABEL_21:
    memmove(v25, v26, v14);
    goto LABEL_22;
  }
LABEL_24:

  return v10;
}

- (_NSRange)appendChildItemsWithCount:(int64_t)a3
{
  int64_t v5;
  NSUInteger v6;
  _UIOutlineNode *end;
  _UIOutlineNode *value;
  _UIOutlineNode *v9;
  unint64_t v10;
  _UIOutlineNode *begin;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  _UIOutlineNode *v16;
  _UIOutlineNode *v17;
  _NSRange var0;
  NSUInteger v19;
  NSUInteger v20;
  void *v22;
  _NSRange result;

  if (a3 <= 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITreeDataSourceSnapshotter.mm"), 78, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("count > 0"));

  }
  v5 = -[_UITreeDataSourceSnapshotter count](self, "count");
  v6 = v5;
  end = self->_nodes.__end_;
  value = self->_nodes.__end_cap_.__value_;
  if (end >= value)
  {
    v10 = 0xAAAAAAAAAAAAAAALL;
    begin = self->_nodes.__begin_;
    v12 = 0xAAAAAAAAAAAAAAABLL * (((char *)end - (char *)begin) >> 3);
    v13 = v12 + 1;
    if (v12 + 1 > 0xAAAAAAAAAAAAAAALL)
      abort();
    v14 = 0xAAAAAAAAAAAAAAABLL * (((char *)value - (char *)begin) >> 3);
    if (2 * v14 > v13)
      v13 = 2 * v14;
    if (v14 < 0x555555555555555)
      v10 = v13;
    if (v10)
    {
      v10 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<_UIOutlineNode>>(v10);
      begin = self->_nodes.__begin_;
      end = self->_nodes.__end_;
    }
    else
    {
      v15 = 0;
    }
    v16 = (_UIOutlineNode *)(v10 + 24 * v12);
    v17 = (_UIOutlineNode *)(v10 + 24 * v15);
    v16->var0.location = v6;
    v16->var0.length = a3;
    v16->var1 = 0;
    v9 = v16 + 1;
    if (end != begin)
    {
      do
      {
        var0 = end[-1].var0;
        v16[-1].var1 = end[-1].var1;
        v16[-1].var0 = var0;
        --v16;
        --end;
      }
      while (end != begin);
      begin = self->_nodes.__begin_;
    }
    self->_nodes.__begin_ = v16;
    self->_nodes.__end_ = v9;
    self->_nodes.__end_cap_.__value_ = v17;
    if (begin)
      operator delete(begin);
  }
  else
  {
    end->var0.location = v5;
    end->var0.length = a3;
    v9 = end + 1;
    end->var1 = 0;
  }
  self->_nodes.__end_ = v9;
  -[_UITreeDataSourceSnapshotter setCount:](self, "setCount:", -[_UITreeDataSourceSnapshotter count](self, "count") + a3);
  v19 = v6;
  v20 = a3;
  result.length = v20;
  result.location = v19;
  return result;
}

- (void)setCount:(int64_t)a3
{
  self->_count = a3;
}

- (_UIOutlineNode)_nodeForGlobalIndex:(int64_t)a3
{
  int64_t v5;
  void *v7;

  v5 = -[_UITreeDataSourceSnapshotter _nodeIndexForGlobalIndex:](self, "_nodeIndexForGlobalIndex:", a3);
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITreeDataSourceSnapshotter.mm"), 669, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("nodeIndex != NSNotFound"));

  }
  return &self->_nodes.__begin_[v5];
}

- (int64_t)parentForChildAtIndex:(int64_t)a3
{
  int64_t v6;
  int64_t v7;
  _UIOutlineNode *v8;
  int64_t *p_var1;
  int64_t v10;
  _UIOutlineNode *v11;
  int64_t var1;
  void *v14;

  if (-[_UITreeDataSourceSnapshotter count](self, "count") <= a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITreeDataSourceSnapshotter.mm"), 272, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("childGlobalIndex < self.count"));

  }
  v6 = -[_UITreeDataSourceSnapshotter _nodeIndexForGlobalIndex:](self, "_nodeIndexForGlobalIndex:", a3);
  v7 = 0x7FFFFFFFFFFFFFFFLL;
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = &self->_nodes.__begin_[v6];
    p_var1 = &v8->var1;
    v10 = v6 + 1;
    while (--v10 >= 1)
    {
      v11 = v8 - 1;
      var1 = v8[-1].var1;
      --v8;
      if (var1 == *p_var1 - 1)
        return v11->var0.location + v11->var0.length - 1;
    }
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  return v7;
}

- (int64_t)_binarySearchForGlobalIndex:(int64_t)a3 startIndex:(int64_t)a4 endIndex:(int64_t)a5
{
  int64_t v6;
  int64_t result;
  _UIOutlineNode *v8;
  unint64_t location;
  unint64_t length;

  if (a4 > a5)
    return 0x7FFFFFFFFFFFFFFFLL;
  v6 = a5 + a4;
  if (a5 + a4 < 0 != __OFADD__(a5, a4))
    ++v6;
  result = v6 >> 1;
  v8 = &self->_nodes.__begin_[v6 >> 1];
  location = v8->var0.location;
  length = v8->var0.length;
  if (a3 < location || a3 - location >= length)
  {
    if (a4 != a5)
      return -[_UITreeDataSourceSnapshotter _binarySearchForGlobalIndex:startIndex:endIndex:](self, "_binarySearchForGlobalIndex:startIndex:endIndex:");
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  return result;
}

- (int64_t)_nodeIndexForGlobalIndex:(int64_t)a3
{
  void *v7;

  if (-[_UITreeDataSourceSnapshotter count](self, "count") <= a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITreeDataSourceSnapshotter.mm"), 642, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("globalIndex < self.count"));

  }
  return -[_UITreeDataSourceSnapshotter _binarySearchForGlobalIndex:startIndex:endIndex:](self, "_binarySearchForGlobalIndex:startIndex:endIndex:", a3, 0, 0xAAAAAAAAAAAAAAABLL * (((char *)self->_nodes.__end_ - (char *)self->_nodes.__begin_) >> 3));
}

- (int64_t)count
{
  return self->_count;
}

- (int64_t)levelForIndex:(int64_t)a3
{
  return (uint64_t)-[_UITreeDataSourceSnapshotter _nodeForGlobalIndex:](self, "_nodeForGlobalIndex:", a3)[16];
}

- (BOOL)indexIsExpanded:(int64_t)a3
{
  void *v7;

  if (-[_UITreeDataSourceSnapshotter count](self, "count") <= a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITreeDataSourceSnapshotter.mm"), 289, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("globalIndex < self.count"));

  }
  return -[NSMutableIndexSet containsIndex:](self->_expandedIndexes, "containsIndex:", a3);
}

- (id)childrenForParentAtIndex:(int64_t)a3 recursive:(BOOL)a4
{
  _BOOL4 v4;
  void *v8;
  id v9;
  void *v11;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a4;
  if (-[_UITreeDataSourceSnapshotter count](self, "count") <= a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITreeDataSourceSnapshotter.mm"), 255, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("globalIndex < self.count"));

  }
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__247;
  v17 = __Block_byref_object_dispose__247;
  v18 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  -[_UITreeDataSourceSnapshotter _childrenForParent:](self, "_childrenForParent:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v14[5], "addIndexes:", v8);
  if (v4)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __67___UITreeDataSourceSnapshotter_childrenForParentAtIndex_recursive___block_invoke;
    v12[3] = &unk_1E16ED978;
    v12[4] = self;
    v12[5] = &v13;
    objc_msgSend(v8, "enumerateIndexesUsingBlock:", v12);
  }
  v9 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v9;
}

- (id)_childrenForParent:(int64_t)a3
{
  void *v6;
  _UIOutlineNode *end;
  _UIOutlineNode *begin;
  int64_t v9;
  _UIOutlineNode *v10;
  unint64_t v11;
  _UIOutlineNode *v12;
  int64_t *p_var1;
  uint64_t v14;
  int64_t var1;
  void *v17;

  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    begin = self->_nodes.__begin_;
    end = self->_nodes.__end_;
    while (begin != end)
    {
      if (!begin->var1)
        objc_msgSend(v6, "addIndexesInRange:", begin->var0.location, begin->var0.length);
      ++begin;
    }
  }
  else
  {
    if (-[_UITreeDataSourceSnapshotter count](self, "count") <= a3)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITreeDataSourceSnapshotter.mm"), 623, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("globalIndex < self.count"));

    }
    v9 = -[_UITreeDataSourceSnapshotter _nodeIndexForGlobalIndex:](self, "_nodeIndexForGlobalIndex:", a3);
    v10 = self->_nodes.__begin_;
    if (v10[v9].var0.location + v10[v9].var0.length - 1 == a3)
    {
      v11 = v9 + 1;
      v12 = self->_nodes.__end_;
      if (v9 + 1 < 0xAAAAAAAAAAAAAAABLL * (((char *)v12 - (char *)v10) >> 3))
      {
        p_var1 = &v10[v9].var1;
        v14 = v9;
        do
        {
          var1 = v10[v14 + 1].var1;
          if (var1 == *p_var1 + 1)
          {
            objc_msgSend(v6, "addIndexesInRange:", v10[v14 + 1].var0.location, v10[v14 + 1].var0.length);
            v10 = self->_nodes.__begin_;
            v12 = self->_nodes.__end_;
          }
          else if (var1 <= *p_var1)
          {
            return v6;
          }
          ++v11;
          ++v14;
        }
        while (v11 < 0xAAAAAAAAAAAAAAABLL * (((char *)v12 - (char *)v10) >> 3));
      }
    }
  }
  return v6;
}

- (void).cxx_destruct
{
  _UIOutlineNode *begin;

  objc_storeStrong((id *)&self->_expandedIndexes, 0);
  begin = self->_nodes.__begin_;
  if (begin)
  {
    self->_nodes.__end_ = begin;
    operator delete(begin);
  }
}

- (void)expandIndexes:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    if (objc_msgSend(v6, "lastIndex") >= self->_count)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITreeDataSourceSnapshotter.mm"), 307, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("lastIndex < _count"));

    }
    -[NSMutableIndexSet addIndexes:](self->_expandedIndexes, "addIndexes:", v6);
  }

}

- (void)replaceChildItemsFromSnapshotter:(id)a3 forParentIndex:(int64_t)a4
{
  _QWORD *v7;
  int64_t v8;
  int64_t var1;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  int64_t v13;
  uint64_t v14;
  int64_t v15;
  uint64_t v16;
  int64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[6];
  _QWORD v24[3];

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITreeDataSourceSnapshotter.mm"), 406, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("snapshotter"));

  }
  if (-[_UITreeDataSourceSnapshotter count](self, "count") <= a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITreeDataSourceSnapshotter.mm"), 407, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("parentIndex < self.count"));

  }
  -[_UITreeDataSourceSnapshotter childrenForParentAtIndex:recursive:](self, "childrenForParentAtIndex:recursive:", a4, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UITreeDataSourceSnapshotter deleteIndexes:](self, "deleteIndexes:", v22);
  v8 = -[_UITreeDataSourceSnapshotter _nodeIndexForGlobalIndex:](self, "_nodeIndexForGlobalIndex:", a4);
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITreeDataSourceSnapshotter.mm"), 416, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("parentNodeIndex != NSNotFound"));

  }
  var1 = self->_nodes.__begin_[v8].var1;
  if (-[_UITreeDataSourceSnapshotter _shouldSplitNodeAtInsertionIndex:](self, "_shouldSplitNodeAtInsertionIndex:", a4))
    -[_UITreeDataSourceSnapshotter _splitNodeAtInsertionIndex:](self, "_splitNodeAtInsertionIndex:", a4);
  v10 = a4 + 1;
  v11 = v7[1];
  v12 = v7[2];
  if (v11 != v12)
  {
    v13 = var1 + 1;
    v14 = 24 * v8 + 24;
    v15 = v10;
    do
    {
      v16 = *(_QWORD *)(v11 + 8);
      v17 = v13 + *(_QWORD *)(v11 + 16);
      v24[0] = v15;
      v24[1] = v16;
      v24[2] = v17;
      std::vector<_UIOutlineNode>::insert((char **)&self->_nodes, (char *)self->_nodes.__begin_ + v14, (unint64_t)v24);
      v15 += v16;
      v11 += 24;
      v14 += 24;
    }
    while (v11 != v12);
  }
  self->_count += objc_msgSend(v7, "count");
  -[_UITreeDataSourceSnapshotter _recomputeRangeOffsetForGlobalIndex:](self, "_recomputeRangeOffsetForGlobalIndex:", 0x7FFFFFFFFFFFFFFFLL);
  -[_UITreeDataSourceSnapshotter _recomputeExpandedIndexesForInsertedRange:](self, "_recomputeExpandedIndexesForInsertedRange:", v10, objc_msgSend(v7, "count"));
  objc_msgSend(v7, "expandedIndexes");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __80___UITreeDataSourceSnapshotter_replaceChildItemsFromSnapshotter_forParentIndex___block_invoke;
  v23[3] = &unk_1E16CD398;
  v23[4] = self;
  v23[5] = v10;
  objc_msgSend(v18, "enumerateIndexesUsingBlock:", v23);

}

- (_NSRange)appendChildItemsWithCount:(int64_t)a3 toParentIndex:(int64_t)a4
{
  int64_t v8;
  int64_t v9;
  _UIOutlineNode *begin;
  int64_t v11;
  NSUInteger v12;
  NSUInteger v13;
  void *v14;
  void *v15;
  void *v16;
  int64_t v17;
  int64_t v18;
  int64_t v19;
  _NSRange result;

  if (a3 <= 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITreeDataSourceSnapshotter.mm"), 87, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("count > 0"));

  }
  if (-[_UITreeDataSourceSnapshotter count](self, "count") <= a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITreeDataSourceSnapshotter.mm"), 88, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("parentIndex < self.count"));

  }
  v8 = -[_UITreeDataSourceSnapshotter _nodeIndexForGlobalIndex:](self, "_nodeIndexForGlobalIndex:", a4);
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITreeDataSourceSnapshotter.mm"), 94, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("parentNodeIndex != NSNotFound"));

  }
  v9 = self->_nodes.__begin_[v8].var1 + 1;
  v17 = a4 + 1;
  v18 = a3;
  v19 = v9;
  if (-[_UITreeDataSourceSnapshotter _shouldSplitNodeAtInsertionIndex:](self, "_shouldSplitNodeAtInsertionIndex:", a4))
  {
    -[_UITreeDataSourceSnapshotter _splitNodeAtInsertionIndex:](self, "_splitNodeAtInsertionIndex:", a4);
    begin = self->_nodes.__begin_;
  }
  else
  {
    v11 = -[_UITreeDataSourceSnapshotter _childNodeIndexForGloalIndex:](self, "_childNodeIndexForGloalIndex:", a4);
    begin = self->_nodes.__begin_;
    if (v11 != 0x7FFFFFFFFFFFFFFFLL)
    {
      begin[v11].var0.length += a3;
      goto LABEL_12;
    }
  }
  std::vector<_UIOutlineNode>::insert((char **)&self->_nodes, (char *)&begin[v8 + 1], (unint64_t)&v17);
LABEL_12:
  -[_UITreeDataSourceSnapshotter setCount:](self, "setCount:", -[_UITreeDataSourceSnapshotter count](self, "count") + a3);
  -[_UITreeDataSourceSnapshotter _recomputeRangeOffsetForGlobalIndex:](self, "_recomputeRangeOffsetForGlobalIndex:", a4);
  -[_UITreeDataSourceSnapshotter _recomputeExpandedIndexesForInsertedRange:](self, "_recomputeExpandedIndexesForInsertedRange:", v17, v18);
  v12 = v17;
  v13 = v18;
  result.length = v13;
  result.location = v12;
  return result;
}

- (BOOL)_shouldSplitNodeAtInsertionIndex:(int64_t)a3
{
  int64_t v6;
  _UIOutlineNode *v7;
  unint64_t length;
  unint64_t location;
  BOOL v12;
  char v14;
  void *v16;

  if (-[_UITreeDataSourceSnapshotter count](self, "count") == a3 || self->_nodes.__end_ == self->_nodes.__begin_)
    return 0;
  v6 = -[_UITreeDataSourceSnapshotter _nodeIndexForGlobalIndex:](self, "_nodeIndexForGlobalIndex:", a3);
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITreeDataSourceSnapshotter.mm"), 779, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("destinationNodeIndex != NSNotFound"));

  }
  v7 = &self->_nodes.__begin_[v6];
  location = v7->var0.location;
  length = v7->var0.length;
  v12 = a3 < location || a3 - location >= length || length < 2;
  v14 = location == 0x7FFFFFFFFFFFFFFFLL || length == 0 || v12;
  if (a3 + 1 < length + location)
    return v14 ^ 1;
  else
    return 0;
}

- (void)_recomputeRangeOffsetForGlobalIndex:(int64_t)a3
{
  unint64_t v6;
  unint64_t v7;
  NSUInteger v8;
  _UIOutlineNode *begin;
  unint64_t v10;
  BOOL v11;
  unint64_t v12;
  NSUInteger *p_length;
  NSUInteger v14;
  void *v15;
  void *v16;

  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
    v6 = 0;
  else
    v6 = -[_UITreeDataSourceSnapshotter _nodeIndexForGlobalIndex:](self, "_nodeIndexForGlobalIndex:", a3);
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
    v7 = 0;
  else
    v7 = v6 + 1;
  if (v6 == 0x7FFFFFFFFFFFFFFFLL || v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITreeDataSourceSnapshotter.mm"), 713, CFSTR("_UITreeDataSourceSnapshotter internal error: invalid initial or starting node index. Global index: %ld; Initial: %ld; Starting: %ld; Node count: %ld"),
      a3,
      v6,
      v7,
      0xAAAAAAAAAAAAAAABLL * (((char *)self->_nodes.__end_ - (char *)self->_nodes.__begin_) >> 3));

  }
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = 0;
    begin = self->_nodes.__begin_;
  }
  else
  {
    begin = self->_nodes.__begin_;
    if (v6 >= 0xAAAAAAAAAAAAAAABLL * (((char *)self->_nodes.__end_ - (char *)begin) >> 3))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITreeDataSourceSnapshotter.mm"), 717, CFSTR("_UITreeDataSourceSnapshotter internal error: initial node index is out of bounds. initialNodeIndex: %ld; node count: %ld"),
        v6,
        0xAAAAAAAAAAAAAAABLL * (((char *)self->_nodes.__end_ - (char *)self->_nodes.__begin_) >> 3));

      begin = self->_nodes.__begin_;
    }
    v8 = begin[v6].var0.length + begin[v6].var0.location;
  }
  v10 = 0xAAAAAAAAAAAAAAABLL * (((char *)self->_nodes.__end_ - (char *)begin) >> 3);
  v11 = v10 > v7;
  v12 = v10 - v7;
  if (v11)
  {
    p_length = &begin[v7].var0.length;
    do
    {
      v14 = *p_length;
      *(p_length - 1) = v8;
      v8 += v14;
      p_length += 3;
      --v12;
    }
    while (v12);
  }
}

- (void)_recomputeExpandedIndexesForInsertedRange:(_NSRange)a3
{
  NSUInteger location;
  NSUInteger length;

  if (a3.length)
  {
    location = a3.location;
    if (a3.location != 0x7FFFFFFFFFFFFFFFLL)
    {
      length = a3.length;
      if (-[NSMutableIndexSet count](self->_expandedIndexes, "count"))
        -[NSMutableIndexSet shiftIndexesStartingAtIndex:by:](self->_expandedIndexes, "shiftIndexesStartingAtIndex:by:", location, length);
    }
  }
}

- (int64_t)_childNodeIndexForGloalIndex:(int64_t)a3
{
  int64_t v6;
  _UIOutlineNode *begin;
  int64_t result;
  void *v9;
  void *v10;

  if (-[_UITreeDataSourceSnapshotter count](self, "count") <= a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITreeDataSourceSnapshotter.mm"), 791, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("globalIndex < self.count"));

  }
  v6 = -[_UITreeDataSourceSnapshotter _nodeIndexForGlobalIndex:](self, "_nodeIndexForGlobalIndex:", a3);
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITreeDataSourceSnapshotter.mm"), 794, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("nodeIndex != NSNotFound"));

  }
  begin = self->_nodes.__begin_;
  result = 0x7FFFFFFFFFFFFFFFLL;
  if (v6 + 1 < 0xAAAAAAAAAAAAAAABLL * (((char *)self->_nodes.__end_ - (char *)begin) >> 3)
    && begin[v6].var1 + 1 == begin[v6 + 1].var1)
  {
    return v6 + 1;
  }
  return result;
}

- (id)expandedIndexes
{
  return self->_expandedIndexes;
}

- (void)deleteIndexes:(id)a3 orphanDisposition:(int64_t)a4
{
  BOOL v7;
  BOOL v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  SEL v16;
  BOOL v17;
  BOOL v18;

  v13 = a3;
  if (objc_msgSend(v13, "count"))
  {
    v7 = a4 == 0;
    v8 = a4 == 1;
    if ((unint64_t)a4 >= 2)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITreeDataSourceSnapshotter.mm"), 179, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("deleteOrphans || reparentOrphans"));

    }
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3788]), "initWithIndexSet:", v13);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __64___UITreeDataSourceSnapshotter_deleteIndexes_orphanDisposition___block_invoke;
    v14[3] = &unk_1E16ED950;
    v14[4] = self;
    v16 = a2;
    v17 = v7;
    v10 = v9;
    v15 = v10;
    v18 = v8;
    objc_msgSend(v13, "enumerateIndexesWithOptions:usingBlock:", 2, v14);
    if (self->_count < 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITreeDataSourceSnapshotter.mm"), 229, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_count >= 0"));

    }
    -[_UITreeDataSourceSnapshotter _recomputeRangeOffsetForGlobalIndex:](self, "_recomputeRangeOffsetForGlobalIndex:", 0x7FFFFFFFFFFFFFFFLL);
    -[_UITreeDataSourceSnapshotter _recomputeExpandedIndexesForDeletedIndexes:](self, "_recomputeExpandedIndexesForDeletedIndexes:", v10);

  }
}

- (void)deleteIndexes:(id)a3
{
  -[_UITreeDataSourceSnapshotter deleteIndexes:orphanDisposition:](self, "deleteIndexes:orphanDisposition:", a3, 0);
}

- (int64_t)insertCount:(int64_t)a3 afterIndex:(int64_t)a4
{
  return -[_UITreeDataSourceSnapshotter insertCount:afterIndex:insertionMode:](self, "insertCount:afterIndex:insertionMode:", a3, a4, 0);
}

- (int64_t)insertCount:(int64_t)a3 afterIndex:(int64_t)a4 insertionMode:(int64_t)a5
{
  int64_t v9;
  void *v12;

  if ((unint64_t)a5 >= 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITreeDataSourceSnapshotter.mm"), 134, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("insertAfterChildren || insertAbsolute"));

  }
  if (a5 == 1)
  {
    if (-[_UITreeDataSourceSnapshotter hasChildrenForParentAtIndex:](self, "hasChildrenForParentAtIndex:", a4))
    {
      v9 = a4 + 1;
      if (a4 + 1 != -[_UITreeDataSourceSnapshotter count](self, "count"))
      {
        -[_UITreeDataSourceSnapshotter insertCount:beforeIndex:](self, "insertCount:beforeIndex:", a3, a4 + 1);
        return v9;
      }
    }
    return -[_UITreeDataSourceSnapshotter _insertCount:afterIndex:](self, "_insertCount:afterIndex:", a3, a4);
  }
  if (!a5)
    return -[_UITreeDataSourceSnapshotter _insertCount:afterIndex:](self, "_insertCount:afterIndex:", a3, a4);
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (id)rootIndexes
{
  return -[_UITreeDataSourceSnapshotter _childrenForParent:](self, "_childrenForParent:", 0x7FFFFFFFFFFFFFFFLL);
}

- (id)childrenForParentAtIndex:(int64_t)a3
{
  return -[_UITreeDataSourceSnapshotter childrenForParentAtIndex:recursive:](self, "childrenForParentAtIndex:recursive:", a3, 0);
}

- (BOOL)indexIsVisible:(int64_t)a3
{
  int64_t v6;
  void *v8;
  void *v9;

  if (-[_UITreeDataSourceSnapshotter count](self, "count") <= a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITreeDataSourceSnapshotter.mm"), 295, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("globalIndex < self.count"));

  }
  v6 = -[_UITreeDataSourceSnapshotter _nodeIndexForGlobalIndex:](self, "_nodeIndexForGlobalIndex:", a3);
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITreeDataSourceSnapshotter.mm"), 297, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("nodeIndex != NSNotFound"));

  }
  return -[_UITreeDataSourceSnapshotter _isNodeIndexVisible:](self, "_isNodeIndexVisible:", v6);
}

- (void)collapseIndexes:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    if (objc_msgSend(v6, "lastIndex") >= self->_count)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITreeDataSourceSnapshotter.mm"), 316, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("lastIndex < _count"));

    }
    -[NSMutableIndexSet removeIndexes:](self->_expandedIndexes, "removeIndexes:", v6);
  }

}

- (id)snapshotterRepresentingSubtreeForIndex:(int64_t)a3
{
  return -[_UITreeDataSourceSnapshotter snapshotterRepresentingSubtreeForIndex:includingParent:](self, "snapshotterRepresentingSubtreeForIndex:includingParent:", a3, 0);
}

- (id)snapshotterRepresentingSubtreeForIndex:(int64_t)a3 includingParent:(BOOL)a4
{
  _BOOL4 v4;
  _UITreeDataSourceSnapshotter *v8;
  void *v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  _UIOutlineNode *end;
  _UIOutlineNode *begin;
  int64_t v16;
  uint64_t v17;
  int64_t v18;
  _UIOutlineNode *v19;
  unint64_t *p_location;
  unint64_t v21;
  unint64_t v22;
  int64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t *v28;
  unint64_t v29;
  __int128 v30;
  char *v31;
  void *v32;
  _UITreeDataSourceSnapshotter *v33;
  uint64_t v34;
  uint64_t v35;
  void *v37;
  void *v38;
  uint64_t v39;
  id v40;
  void *v41;
  unint64_t v42;
  _UITreeDataSourceSnapshotter *v43;
  char *v44;
  void *__p;
  char *v46;
  char *v47;

  v4 = a4;
  if (self->_count <= a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITreeDataSourceSnapshotter.mm"), 328, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("globalIndex < _count"));

  }
  -[_UITreeDataSourceSnapshotter childrenForParentAtIndex:recursive:](self, "childrenForParentAtIndex:recursive:", a3, 1);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v41, "count") || v4)
  {
    v40 = objc_alloc_init(MEMORY[0x1E0CB3788]);
    if (v4)
    {
      v10 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<_UIOutlineNode>>(1uLL);
      *(_QWORD *)v10 = a3;
      *(_OWORD *)(v10 + 8) = xmmword_18666AB00;
      v44 = &v10[24 * v11];
      v12 = v10 + 24;
      if (-[_UITreeDataSourceSnapshotter indexIsExpanded:](self, "indexIsExpanded:", a3))
        objc_msgSend(v40, "addIndex:", a3);
      v13 = 1;
    }
    else
    {
      v10 = 0;
      v12 = 0;
      v44 = 0;
      v13 = 0;
    }
    if (objc_msgSend(v41, "count"))
    {
      begin = self->_nodes.__begin_;
      end = self->_nodes.__end_;
      v39 = objc_msgSend(v41, "firstIndex");
      v42 = objc_msgSend(v41, "lastIndex");
      v43 = self;
      v16 = -[_UITreeDataSourceSnapshotter _nodeIndexForGlobalIndex:](self, "_nodeIndexForGlobalIndex:", v39);
      if (v16 == 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, v43, CFSTR("_UITreeDataSourceSnapshotter.mm"), 363, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("firstChildNodeIndex != NSNotFound"));

      }
      v17 = end - begin;
      if (v16 < v17)
      {
        v18 = v4 - v43->_nodes.__begin_[v16].var1;
        do
        {
          v19 = v43->_nodes.__begin_;
          p_location = &v19[v16].var0.location;
          v21 = *p_location;
          if (*p_location > v42)
            break;
          v22 = p_location[1];
          v23 = v19[v16].var1 + v18;
          if (v12 >= v44)
          {
            v24 = 0xAAAAAAAAAAAAAAABLL * ((v12 - v10) >> 3) + 1;
            if (v24 > 0xAAAAAAAAAAAAAAALL)
              abort();
            v25 = v17;
            if (0x5555555555555556 * ((v44 - v10) >> 3) > v24)
              v24 = 0x5555555555555556 * ((v44 - v10) >> 3);
            if (0xAAAAAAAAAAAAAAABLL * ((v44 - v10) >> 3) >= 0x555555555555555)
              v26 = 0xAAAAAAAAAAAAAAALL;
            else
              v26 = v24;
            if (v26)
              v26 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<_UIOutlineNode>>(v26);
            else
              v27 = 0;
            v28 = (unint64_t *)(v26 + 8 * ((v12 - v10) >> 3));
            *v28 = v21;
            v28[1] = v22;
            v28[2] = v23;
            if (v12 == v10)
            {
              v31 = (char *)(v26 + 8 * ((v12 - v10) >> 3));
            }
            else
            {
              v29 = v26 + 8 * ((v12 - v10) >> 3);
              do
              {
                v30 = *(_OWORD *)(v12 - 24);
                v31 = (char *)(v29 - 24);
                *(_QWORD *)(v29 - 8) = *((_QWORD *)v12 - 1);
                *(_OWORD *)(v29 - 24) = v30;
                v12 -= 24;
                v29 -= 24;
              }
              while (v12 != v10);
            }
            v44 = (char *)(v26 + 24 * v27);
            v12 = (char *)(v28 + 3);
            if (v10)
              operator delete(v10);
            v10 = v31;
            v17 = v25;
          }
          else
          {
            *(_QWORD *)v12 = v21;
            *((_QWORD *)v12 + 1) = v22;
            *((_QWORD *)v12 + 2) = v23;
            v12 += 24;
          }
          v13 += v22;
          ++v16;
        }
        while (v16 != v17);
      }
      if (-[NSMutableIndexSet count](v43->_expandedIndexes, "count"))
      {
        -[NSMutableIndexSet indexesInRange:options:passingTest:](v43->_expandedIndexes, "indexesInRange:options:passingTest:");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "addIndexes:", v32);

      }
    }
    v33 = [_UITreeDataSourceSnapshotter alloc];
    __p = 0;
    v46 = 0;
    v47 = 0;
    v34 = v12 - v10;
    if (v12 != v10)
    {
      if (0xAAAAAAAAAAAAAAABLL * (v34 >> 3) > 0xAAAAAAAAAAAAAAALL)
        abort();
      __p = std::__allocate_at_least[abi:nn180100]<std::allocator<_UIOutlineNode>>(0xAAAAAAAAAAAAAAABLL * (v34 >> 3));
      v47 = (char *)__p + 24 * v35;
      memmove(__p, v10, v12 - v10);
      v46 = (char *)__p + 8 * (v34 >> 3);
    }
    v8 = -[_UITreeDataSourceSnapshotter initWithNodes:count:expandedIndexes:](v33, "initWithNodes:count:expandedIndexes:", &__p, v13, v40);
    v9 = v41;
    if (__p)
    {
      v46 = (char *)__p;
      operator delete(__p);
    }

    if (v10)
      operator delete(v10);
  }
  else
  {
    v8 = objc_alloc_init(_UITreeDataSourceSnapshotter);
    v9 = v41;
  }

  return v8;
}

- (void)insertSubtreeFromSnapshotter:(id)a3 beforeIndex:(int64_t)a4
{
  void *v7;
  id v8;

  v8 = a3;
  if (-[_UITreeDataSourceSnapshotter count](self, "count") <= a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITreeDataSourceSnapshotter.mm"), 458, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("destinationIndex < self.count"));

  }
  if (objc_msgSend(v8, "count"))
    -[_UITreeDataSourceSnapshotter _insertSubtreeFromSnapshotter:atIndex:adjustedIndex:](self, "_insertSubtreeFromSnapshotter:atIndex:adjustedIndex:", v8, a4, a4);

}

- (int64_t)insertSubtreeFromSnapshotter:(id)a3 afterIndex:(int64_t)a4
{
  id v7;
  int64_t v8;
  void *v10;
  void *v11;

  v7 = a3;
  if (-[_UITreeDataSourceSnapshotter count](self, "count") <= a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITreeDataSourceSnapshotter.mm"), 466, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("destinationIndex < self.count"));

  }
  if (objc_msgSend(v7, "count"))
  {
    v8 = -[_UITreeDataSourceSnapshotter _indexForInsertingAfterIndex:](self, "_indexForInsertingAfterIndex:", a4);
    if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITreeDataSourceSnapshotter.mm"), 472, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("adjustedDestinationIndex != NSNotFound"));

    }
    -[_UITreeDataSourceSnapshotter _insertSubtreeFromSnapshotter:atIndex:adjustedIndex:](self, "_insertSubtreeFromSnapshotter:atIndex:adjustedIndex:", v7, a4, v8);
  }
  else
  {
    v8 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v8;
}

- (id)indexesForLevel:(int64_t)a3
{
  void *v5;
  _UIOutlineNode *end;
  _UIOutlineNode *begin;
  uint64_t v8;
  unint64_t v9;

  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  begin = self->_nodes.__begin_;
  end = self->_nodes.__end_;
  if (end != begin)
  {
    v8 = 0;
    v9 = 0;
    do
    {
      if (begin[v8].var1 == a3)
      {
        objc_msgSend(v5, "addIndexesInRange:", begin[v8].var0.location, begin[v8].var0.length);
        begin = self->_nodes.__begin_;
        end = self->_nodes.__end_;
      }
      ++v9;
      ++v8;
    }
    while (v9 < 0xAAAAAAAAAAAAAAABLL * (((char *)end - (char *)begin) >> 3));
  }
  return v5;
}

- (BOOL)isFlat
{
  return (_UIOutlineNode *)((char *)self->_nodes.__end_ - (char *)self->_nodes.__begin_) == (_UIOutlineNode *)24;
}

- (BOOL)hasChildrenForParentAtIndex:(int64_t)a3
{
  int64_t v6;
  _UIOutlineNode *begin;
  void *v9;
  void *v10;

  if (-[_UITreeDataSourceSnapshotter count](self, "count") <= a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITreeDataSourceSnapshotter.mm"), 513, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("globalIndex < self.count"));

  }
  if (-[_UITreeDataSourceSnapshotter isFlat](self, "isFlat"))
    return 0;
  v6 = -[_UITreeDataSourceSnapshotter _nodeIndexForGlobalIndex:](self, "_nodeIndexForGlobalIndex:", a3);
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITreeDataSourceSnapshotter.mm"), 521, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("nodeIndex != NSNotFound"));

  }
  begin = self->_nodes.__begin_;
  return v6 + 1 < 0xAAAAAAAAAAAAAAABLL * (((char *)self->_nodes.__end_ - (char *)begin) >> 3)
      && begin[v6].var0.location + begin[v6].var0.length - 1 == a3
      && begin[v6 + 1].var1 > begin[v6].var1;
}

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[_UITreeDataSourceSnapshotter count](self, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@ %p: count=%@; expandedIndexes=%@>"),
                 v5,
                 self,
                 v6,
                 self->_expandedIndexes);

  return v7;
}

- (id)visualDescription
{
  _UITreeDataSourceSnapshotter *v2;
  void *v3;
  void *v4;
  _UIOutlineNode *begin;
  uint64_t v6;
  unint64_t v7;
  _UIOutlineNode *v8;
  NSUInteger location;
  uint64_t v10;
  NSUInteger length;
  NSUInteger *p_length;
  int v13;
  _UITreeDataSourceSnapshotter *v14;
  __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v23;
  void *v24;
  __CFString *v25;

  v2 = self;
  v3 = (void *)MEMORY[0x1E0CB37A0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[_UITreeDataSourceSnapshotter count](self, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("count=%@\n"), v4);
  v23 = (id)objc_claimAutoreleasedReturnValue();

  begin = v2->_nodes.__begin_;
  if (v2->_nodes.__end_ != begin)
  {
    v6 = 0;
    v7 = 0;
    do
    {
      v8 = &begin[v6];
      objc_msgSend(&stru_1E16EDF20, "stringByPaddingToLength:withString:startingAtIndex:", 2 * begin[v6].var1, CFSTR(" "), 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      location = v8->var0.location;
      p_length = &v8->var0.length;
      length = v8->var0.length;
      v10 = p_length[1];
      v13 = -[NSMutableIndexSet containsIndex:](v2->_expandedIndexes, "containsIndex:", location);
      v14 = v2;
      v15 = CFSTR("-");
      if (v13)
        v15 = CFSTR("+");
      v25 = v15;
      v16 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v10);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v7);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", location);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", length);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringWithFormat:", CFSTR("%@%@[%@]%@: {%@,%@}\n"), v24, v25, v17, v18, v19, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v23, "appendString:", v21);
      ++v7;
      v2 = v14;
      begin = v14->_nodes.__begin_;
      ++v6;
    }
    while (v7 < 0xAAAAAAAAAAAAAAABLL * (((char *)v14->_nodes.__end_ - (char *)begin) >> 3));
  }
  return v23;
}

- (BOOL)isEqual:(id)a3
{
  _UITreeDataSourceSnapshotter *v4;
  _UITreeDataSourceSnapshotter *v5;
  _UITreeDataSourceSnapshotter *v6;
  int64_t count;
  BOOL v8;
  BOOL v9;
  BOOL v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v4 = (_UITreeDataSourceSnapshotter *)a3;
  v5 = v4;
  if (v4)
  {
    if (self == v4)
    {
      v9 = 1;
    }
    else
    {
      v6 = v4;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && (count = self->_count, count == -[_UITreeDataSourceSnapshotter count](v6, "count"))
        && -[NSMutableIndexSet isEqualToIndexSet:](self->_expandedIndexes, "isEqualToIndexSet:", v6->_expandedIndexes))
      {
        v18 = 0;
        v19 = 0;
        do
        {
          v8 = v19 == 0x7FFFFFFFFFFFFFFFLL || v18 == 0x7FFFFFFFFFFFFFFFLL;
          v9 = v8;
          if (v8)
            break;
          -[_UITreeDataSourceSnapshotter _nextNodeForNodeIndex:](self, "_nextNodeForNodeIndex:", &v19);
          -[_UITreeDataSourceSnapshotter _nextNodeForNodeIndex:](v6, "_nextNodeForNodeIndex:", &v18);
          v10 = v15 == v12 && v16 == v13;
        }
        while (v10 && v17 == v14);
      }
      else
      {
        v9 = 0;
      }

    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)_splitNodeAtInsertionIndex:(int64_t)a3
{
  int64_t v6;
  _UIOutlineNode *begin;
  _UIOutlineNode *v8;
  unint64_t length;
  NSUInteger location;
  unint64_t v11;
  unint64_t v13;
  uint64_t v14;
  BOOL v15;
  unint64_t v16;
  int64_t v17;
  int64_t var1;
  int64_t v19;
  _UIOutlineNode *v20;
  _UIOutlineNode *end;
  _UIOutlineNode *value;
  _NSRange v23;
  _UIOutlineNode *v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  _UIOutlineNode *v29;
  _UIOutlineNode *v30;
  _NSRange v31;
  _UIOutlineNode *v32;
  _UIOutlineNode *v33;
  _NSRange var0;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  _NSRange v44;
  int64_t v45;

  if (-[_UITreeDataSourceSnapshotter count](self, "count") <= a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITreeDataSourceSnapshotter.mm"), 807, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("insertionGlobalIndex < self.count"));

  }
  v6 = -[_UITreeDataSourceSnapshotter _nodeIndexForGlobalIndex:](self, "_nodeIndexForGlobalIndex:", a3);
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITreeDataSourceSnapshotter.mm"), 810, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("destinationNodeIndex != NSNotFound"));

  }
  begin = self->_nodes.__begin_;
  v8 = &begin[v6];
  location = v8->var0.location;
  length = v8->var0.length;
  v11 = a3 - v8->var0.location;
  if (a3 < v8->var0.location || v11 >= length)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v37 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_NSRangeSplitResult _NSRangeSplit(NSRange, NSInteger)");
    v38 = objc_claimAutoreleasedReturnValue();
    v43 = (void *)v37;
    v39 = (void *)v37;
    v40 = (void *)v38;
    objc_msgSend(v39, "handleFailureInFunction:file:lineNumber:description:", v38, CFSTR("_UITreeDataSourceSnapshotter.mm"), 1171, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("NSLocationInRange(splitIndex, range)"));

  }
  if (length <= 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_NSRangeSplitResult _NSRangeSplit(NSRange, NSInteger)");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "handleFailureInFunction:file:lineNumber:description:", v41, CFSTR("_UITreeDataSourceSnapshotter.mm"), 1172, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("range.length > 1"));

  }
  v13 = location - a3 + length;
  v14 = length - (v11 + 1);
  v15 = v13 == 1;
  if (v13 == 1)
    v16 = length - 1;
  else
    v16 = v11 + 1;
  if (v15)
    v17 = a3;
  else
    v17 = a3 + 1;
  if (v15)
    v14 = 1;
  v8->var0.location = location;
  v8->var0.length = v16;
  var1 = begin[v6].var1;
  v44.location = v17;
  v44.length = v14;
  v45 = var1;
  v19 = v6 + 1;
  v20 = self->_nodes.__begin_;
  end = self->_nodes.__end_;
  if (v6 + 1 == 0xAAAAAAAAAAAAAAABLL * (((char *)end - (char *)v20) >> 3))
  {
    value = self->_nodes.__end_cap_.__value_;
    if (end >= value)
    {
      if ((unint64_t)(v6 + 2) > 0xAAAAAAAAAAAAAAALL)
        abort();
      v25 = 0xAAAAAAAAAAAAAAABLL * (((char *)value - (char *)v20) >> 3);
      v26 = 2 * v25;
      if (2 * v25 <= v6 + 2)
        v26 = v6 + 2;
      if (v25 >= 0x555555555555555)
        v27 = 0xAAAAAAAAAAAAAAALL;
      else
        v27 = v26;
      if (v27)
        v27 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<_UIOutlineNode>>(v27);
      else
        v28 = 0;
      v29 = (_UIOutlineNode *)(v27 + 24 * v19);
      v30 = (_UIOutlineNode *)(v27 + 24 * v28);
      v31 = v44;
      v29->var1 = v45;
      v29->var0 = v31;
      v24 = v29 + 1;
      v33 = self->_nodes.__begin_;
      v32 = self->_nodes.__end_;
      if (v32 != v33)
      {
        do
        {
          var0 = v32[-1].var0;
          v29[-1].var1 = v32[-1].var1;
          v29[-1].var0 = var0;
          --v29;
          --v32;
        }
        while (v32 != v33);
        v32 = self->_nodes.__begin_;
      }
      self->_nodes.__begin_ = v29;
      self->_nodes.__end_ = v24;
      self->_nodes.__end_cap_.__value_ = v30;
      if (v32)
        operator delete(v32);
    }
    else
    {
      v23 = v44;
      end->var1 = v45;
      end->var0 = v23;
      v24 = end + 1;
    }
    self->_nodes.__end_ = v24;
  }
  else
  {
    std::vector<_UIOutlineNode>::insert((char **)&self->_nodes, (char *)&v20[v19], (unint64_t)&v44);
  }
}

- (id)_deleteChildNodesForParentNodeIndex:(int64_t)a3
{
  _UIOutlineNode *begin;
  int64_t var1;
  id v7;
  id v8;
  int64_t v9;
  unint64_t i;
  _UIOutlineNode *v11;
  NSUInteger location;
  NSUInteger length;
  void *v16;
  _QWORD v17[6];
  _QWORD v18[4];

  begin = self->_nodes.__begin_;
  if (0xAAAAAAAAAAAAAAABLL * (((char *)self->_nodes.__end_ - (char *)begin) >> 3) <= a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITreeDataSourceSnapshotter.mm"), 831, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("parentNodeIndex < _nodes.size()"));

    begin = self->_nodes.__begin_;
  }
  var1 = begin[a3].var1;
  v7 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  v8 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  v9 = a3;
  for (i = a3 + 1; ; ++i)
  {
    v11 = self->_nodes.__begin_;
    if (i >= 0xAAAAAAAAAAAAAAABLL * (((char *)self->_nodes.__end_ - (char *)v11) >> 3) || v11[v9 + 1].var1 <= var1)
      break;
    objc_msgSend(v8, "addIndex:", i);
    location = v11[v9 + 1].var0.location;
    length = v11[++v9].var0.length;
    objc_msgSend(v7, "addIndexesInRange:", location, length);
  }
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  v18[3] = 0;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __68___UITreeDataSourceSnapshotter__deleteChildNodesForParentNodeIndex___block_invoke;
  v17[3] = &unk_1E16ED978;
  v17[4] = self;
  v17[5] = v18;
  objc_msgSend(v8, "enumerateIndexesWithOptions:usingBlock:", 2, v17);
  _Block_object_dispose(v18, 8);

  return v7;
}

- (void)_insertCount:(int64_t)a3 beforeIndex:(int64_t)a4
{
  _UIOutlineNode *v8;
  void *v9;

  if (-[_UITreeDataSourceSnapshotter count](self, "count") > a4)
  {
    if (!a3)
      return;
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITreeDataSourceSnapshotter.mm"), 858, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("destinationIndex < self.count"));

  if (a3)
  {
LABEL_3:
    v8 = -[_UITreeDataSourceSnapshotter _nodeForGlobalIndex:](self, "_nodeForGlobalIndex:", a4);
    v8->var0.length += a3;
    -[_UITreeDataSourceSnapshotter setCount:](self, "setCount:", -[_UITreeDataSourceSnapshotter count](self, "count") + a3);
    -[_UITreeDataSourceSnapshotter _recomputeRangeOffsetForGlobalIndex:](self, "_recomputeRangeOffsetForGlobalIndex:", 0x7FFFFFFFFFFFFFFFLL);
    -[_UITreeDataSourceSnapshotter _recomputeExpandedIndexesForInsertedRange:](self, "_recomputeExpandedIndexesForInsertedRange:", a4, a3);
  }
}

- (int64_t)_insertCount:(int64_t)a3 afterIndex:(int64_t)a4
{
  void *v8;
  uint64_t v9;
  int64_t v10;
  int64_t v11;
  int64_t v12;
  _UIOutlineNode *end;
  _UIOutlineNode *value;
  _UIOutlineNode *v15;
  unint64_t v16;
  _UIOutlineNode *begin;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  _UIOutlineNode *v22;
  _UIOutlineNode *v23;
  _UIOutlineNode *v24;
  _NSRange var0;
  void *v26;
  void *v28;
  _QWORD v29[3];

  if (-[_UITreeDataSourceSnapshotter count](self, "count") <= a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITreeDataSourceSnapshotter.mm"), 876, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("destinationIndex < self.count"));

    if (a3)
      goto LABEL_3;
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  if (!a3)
    return 0x7FFFFFFFFFFFFFFFLL;
LABEL_3:
  -[_UITreeDataSourceSnapshotter childrenForParentAtIndex:recursive:](self, "childrenForParentAtIndex:recursive:", a4, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");
  v10 = a4;
  if (objc_msgSend(v8, "count"))
    v10 = objc_msgSend(v8, "lastIndex");
  v11 = v10 + 1;
  if (v11 > -[_UITreeDataSourceSnapshotter count](self, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITreeDataSourceSnapshotter.mm"), 892, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("adjustedDestinationIndex <= self.count"));

  }
  v12 = -[_UITreeDataSourceSnapshotter levelForIndex:](self, "levelForIndex:", a4);
  if (v11 == -[_UITreeDataSourceSnapshotter count](self, "count"))
  {
    end = self->_nodes.__end_;
    value = self->_nodes.__end_cap_.__value_;
    if (end >= value)
    {
      v16 = 0xAAAAAAAAAAAAAAALL;
      begin = self->_nodes.__begin_;
      v18 = 0xAAAAAAAAAAAAAAABLL * (((char *)end - (char *)begin) >> 3);
      v19 = v18 + 1;
      if (v18 + 1 > 0xAAAAAAAAAAAAAAALL)
        abort();
      v20 = 0xAAAAAAAAAAAAAAABLL * (((char *)value - (char *)begin) >> 3);
      if (2 * v20 > v19)
        v19 = 2 * v20;
      if (v20 < 0x555555555555555)
        v16 = v19;
      if (v16)
      {
        v16 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<_UIOutlineNode>>(v16);
        begin = self->_nodes.__begin_;
        end = self->_nodes.__end_;
      }
      else
      {
        v21 = 0;
      }
      v23 = (_UIOutlineNode *)(v16 + 24 * v18);
      v24 = (_UIOutlineNode *)(v16 + 24 * v21);
      v23->var0.location = v11;
      v23->var0.length = a3;
      v23->var1 = v12;
      v15 = v23 + 1;
      if (end != begin)
      {
        do
        {
          var0 = end[-1].var0;
          v23[-1].var1 = end[-1].var1;
          v23[-1].var0 = var0;
          --v23;
          --end;
        }
        while (end != begin);
        begin = self->_nodes.__begin_;
      }
      self->_nodes.__begin_ = v23;
      self->_nodes.__end_ = v15;
      self->_nodes.__end_cap_.__value_ = v24;
      if (begin)
        operator delete(begin);
    }
    else
    {
      end->var0.location = v11;
      end->var0.length = a3;
      v15 = end + 1;
      end->var1 = v12;
    }
    self->_nodes.__end_ = v15;
    -[_UITreeDataSourceSnapshotter setCount:](self, "setCount:", -[_UITreeDataSourceSnapshotter count](self, "count") + a3);
  }
  else
  {
    if (v9)
    {
      v29[0] = v11;
      v29[1] = a3;
      v29[2] = v12;
      std::vector<_UIOutlineNode>::insert((char **)&self->_nodes, (char *)&self->_nodes.__begin_[-[_UITreeDataSourceSnapshotter _nodeIndexForGlobalIndex:](self, "_nodeIndexForGlobalIndex:", v11)], (unint64_t)v29);
    }
    else
    {
      v22 = -[_UITreeDataSourceSnapshotter _nodeForGlobalIndex:](self, "_nodeForGlobalIndex:", a4);
      v22->var0.length += a3;
    }
    -[_UITreeDataSourceSnapshotter setCount:](self, "setCount:", -[_UITreeDataSourceSnapshotter count](self, "count") + a3);
    -[_UITreeDataSourceSnapshotter _recomputeRangeOffsetForGlobalIndex:](self, "_recomputeRangeOffsetForGlobalIndex:", 0x7FFFFFFFFFFFFFFFLL);
    -[_UITreeDataSourceSnapshotter _recomputeExpandedIndexesForInsertedRange:](self, "_recomputeExpandedIndexesForInsertedRange:", v11, a3);
  }

  return v11;
}

- (void)_recomputeExpandedIndexesForDeletedIndexes:(id)a3
{
  id v4;
  void *v5;
  NSMutableIndexSet *v6;
  NSMutableIndexSet *expandedIndexes;
  NSMutableIndexSet *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  NSMutableIndexSet *v12;

  v9 = a3;
  if (objc_msgSend(v9, "count") && -[NSMutableIndexSet count](self->_expandedIndexes, "count"))
  {
    v4 = objc_alloc_init(MEMORY[0x1E0CB3788]);
    v5 = (void *)-[NSMutableIndexSet mutableCopy](self->_expandedIndexes, "mutableCopy");
    objc_msgSend(v5, "removeIndexes:", v9);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __75___UITreeDataSourceSnapshotter__recomputeExpandedIndexesForDeletedIndexes___block_invoke;
    v10[3] = &unk_1E16ED9C0;
    v11 = v9;
    v6 = (NSMutableIndexSet *)v4;
    v12 = v6;
    objc_msgSend(v5, "enumerateRangesUsingBlock:", v10);
    expandedIndexes = self->_expandedIndexes;
    self->_expandedIndexes = v6;
    v8 = v6;

  }
}

- (id)_snapshotterByShiftingIndexesByCount:(int64_t)a3
{
  _UIOutlineNode *begin;
  _UIOutlineNode *end;
  int64_t *v6;
  int64_t *v7;
  unint64_t v8;
  NSUInteger length;
  int64_t v10;
  int64_t var1;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  int64_t *v15;
  unint64_t v16;
  __int128 v17;
  int64_t *v18;
  void *v19;
  _UITreeDataSourceSnapshotter *v20;
  int64_t v21;
  uint64_t v22;
  _UITreeDataSourceSnapshotter *v23;
  uint64_t v26;
  void *__p;
  char *v28;
  char *v29;

  begin = self->_nodes.__begin_;
  end = self->_nodes.__end_;
  if (begin == end)
  {
    v6 = 0;
    v7 = 0;
  }
  else
  {
    v6 = 0;
    v7 = 0;
    v8 = 0;
    do
    {
      length = begin->var0.length;
      v10 = begin->var0.location + a3;
      var1 = begin->var1;
      if ((unint64_t)v7 >= v8)
      {
        v12 = 0xAAAAAAAAAAAAAAABLL * (v7 - v6) + 1;
        if (v12 > 0xAAAAAAAAAAAAAAALL)
          abort();
        if (0x5555555555555556 * ((uint64_t)(v8 - (_QWORD)v6) >> 3) > v12)
          v12 = 0x5555555555555556 * ((uint64_t)(v8 - (_QWORD)v6) >> 3);
        if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v8 - (_QWORD)v6) >> 3) >= 0x555555555555555)
          v13 = 0xAAAAAAAAAAAAAAALL;
        else
          v13 = v12;
        if (v13)
          v13 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<_UIOutlineNode>>(v13);
        else
          v14 = 0;
        v15 = (int64_t *)(v13 + 8 * (v7 - v6));
        *v15 = v10;
        v15[1] = length;
        v15[2] = var1;
        if (v7 == v6)
        {
          v18 = (int64_t *)(v13 + 8 * (v7 - v6));
        }
        else
        {
          v16 = v13 + 8 * (v7 - v6);
          do
          {
            v17 = *(_OWORD *)(v7 - 3);
            v18 = (int64_t *)(v16 - 24);
            *(_QWORD *)(v16 - 8) = *(v7 - 1);
            *(_OWORD *)(v16 - 24) = v17;
            v7 -= 3;
            v16 -= 24;
          }
          while (v7 != v6);
        }
        v8 = v13 + 24 * v14;
        v7 = v15 + 3;
        if (v6)
          operator delete(v6);
        v6 = v18;
      }
      else
      {
        *v7 = v10;
        v7[1] = length;
        v7[2] = var1;
        v7 += 3;
      }
      ++begin;
    }
    while (begin != end);
  }
  v19 = (void *)-[NSMutableIndexSet mutableCopy](self->_expandedIndexes, "mutableCopy", self);
  objc_msgSend(v19, "shiftIndexesStartingAtIndex:by:", 0, a3);
  v20 = [_UITreeDataSourceSnapshotter alloc];
  __p = 0;
  v28 = 0;
  v29 = 0;
  v21 = (char *)v7 - (char *)v6;
  if (v21)
  {
    if (0xAAAAAAAAAAAAAAABLL * (v21 >> 3) > 0xAAAAAAAAAAAAAAALL)
      abort();
    __p = std::__allocate_at_least[abi:nn180100]<std::allocator<_UIOutlineNode>>(0xAAAAAAAAAAAAAAABLL * (v21 >> 3));
    v29 = (char *)__p + 24 * v22;
    memmove(__p, v6, v21);
    v28 = (char *)__p + 8 * (v21 >> 3);
  }
  v23 = -[_UITreeDataSourceSnapshotter initWithNodes:count:expandedIndexes:](v20, "initWithNodes:count:expandedIndexes:", &__p, *(_QWORD *)(v26 + 32), v19);
  if (__p)
  {
    v28 = (char *)__p;
    operator delete(__p);
  }

  if (v6)
    operator delete(v6);
  return v23;
}

- (id)_snapshotterByNormalizingRangeOffsets
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  -[_UITreeDataSourceSnapshotter _allIndexes](self, "_allIndexes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "firstIndex");
  if (v4)
  {
    -[_UITreeDataSourceSnapshotter _snapshotterByShiftingIndexesByCount:](self, "_snapshotterByShiftingIndexesByCount:", -v4);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = -[_UITreeDataSourceSnapshotter copy](self, "copy");
  }
  v6 = (void *)v5;

  return v6;
}

- (int64_t)_indexForInsertingAfterIndex:(int64_t)a3
{
  int64_t v3;
  void *v6;
  void *v8;

  v3 = a3;
  if (-[_UITreeDataSourceSnapshotter count](self, "count") <= a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITreeDataSourceSnapshotter.mm"), 1032, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("destinationIndex < self.count"));

  }
  -[_UITreeDataSourceSnapshotter childrenForParentAtIndex:recursive:](self, "childrenForParentAtIndex:recursive:", v3, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
    v3 = objc_msgSend(v6, "lastIndex");

  return v3 + 1;
}

- (id)_allIndexes
{
  NSUInteger location;
  int64_t v4;

  if (-[_UITreeDataSourceSnapshotter count](self, "count"))
  {
    location = self->_nodes.__begin_->var0.location;
    v4 = -[_UITreeDataSourceSnapshotter count](self, "count");
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", location, v4);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSet");
  }
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_insertSubtreeFromSnapshotter:(id)a3 atIndex:(int64_t)a4 adjustedIndex:(int64_t)a5
{
  _QWORD *v9;
  int64_t v10;
  uint64_t v11;
  int64_t v12;
  uint64_t v13;
  uint64_t v14;
  _UIOutlineNode *end;
  NSUInteger v16;
  NSUInteger v17;
  int64_t v18;
  _UIOutlineNode *value;
  _UIOutlineNode *begin;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  _UIOutlineNode *v26;
  _UIOutlineNode *v27;
  _NSRange var0;
  int64_t v29;
  uint64_t v30;
  uint64_t v31;
  int64_t v32;
  int64_t v33;
  uint64_t v34;
  int64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  _QWORD *v41;
  int64_t v42;
  uint64_t v43;
  _QWORD v44[3];

  v9 = a3;
  v10 = -[_UITreeDataSourceSnapshotter count](self, "count");
  if (v10 <= a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITreeDataSourceSnapshotter.mm"), 1061, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("destinationIndex < count"));

  }
  if (v10 < a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITreeDataSourceSnapshotter.mm"), 1062, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("adjustedDestinationIndex <= count"));

  }
  v11 = objc_msgSend(v9, "count");
  v12 = -[_UITreeDataSourceSnapshotter levelForIndex:](self, "levelForIndex:", a4);
  v43 = v11;
  if (v10 == a5)
  {
    v41 = v9;
    v42 = a5;
    v13 = v9[1];
    v14 = v9[2];
    if (v13 != v14)
    {
      end = self->_nodes.__end_;
      v16 = v42;
      do
      {
        v17 = *(_QWORD *)(v13 + 8);
        v18 = *(_QWORD *)(v13 + 16) + v12;
        value = self->_nodes.__end_cap_.__value_;
        if (end >= value)
        {
          begin = self->_nodes.__begin_;
          v21 = 0xAAAAAAAAAAAAAAABLL * (((char *)end - (char *)begin) >> 3);
          v22 = v21 + 1;
          if (v21 + 1 > 0xAAAAAAAAAAAAAAALL)
            abort();
          v23 = 0xAAAAAAAAAAAAAAABLL * (((char *)value - (char *)begin) >> 3);
          if (2 * v23 > v22)
            v22 = 2 * v23;
          if (v23 >= 0x555555555555555)
            v24 = 0xAAAAAAAAAAAAAAALL;
          else
            v24 = v22;
          if (v24)
          {
            v24 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<_UIOutlineNode>>(v24);
            begin = self->_nodes.__begin_;
            end = self->_nodes.__end_;
          }
          else
          {
            v25 = 0;
          }
          v26 = (_UIOutlineNode *)(v24 + 24 * v21);
          v26->var0.location = v16;
          v26->var0.length = v17;
          v26->var1 = v18;
          v27 = v26;
          if (end != begin)
          {
            do
            {
              var0 = end[-1].var0;
              v27[-1].var1 = end[-1].var1;
              v27[-1].var0 = var0;
              --v27;
              --end;
            }
            while (end != begin);
            begin = self->_nodes.__begin_;
          }
          end = v26 + 1;
          self->_nodes.__begin_ = v27;
          self->_nodes.__end_ = v26 + 1;
          self->_nodes.__end_cap_.__value_ = (_UIOutlineNode *)(v24 + 24 * v25);
          if (begin)
            operator delete(begin);
        }
        else
        {
          end->var0.location = v16;
          end->var0.length = v17;
          end->var1 = v18;
          ++end;
        }
        self->_nodes.__end_ = end;
        v16 += v17;
        v13 += 24;
      }
      while (v13 != v14);
    }
    v9 = v41;
    a5 = v42;
    -[_UITreeDataSourceSnapshotter setCount:](self, "setCount:", -[_UITreeDataSourceSnapshotter count](self, "count") + v43);
  }
  else
  {
    if (a5 - a4 != 1)
      a4 = a5;
    if (-[_UITreeDataSourceSnapshotter _shouldSplitNodeAtInsertionIndex:](self, "_shouldSplitNodeAtInsertionIndex:", a4))
    {
      -[_UITreeDataSourceSnapshotter _splitNodeAtInsertionIndex:](self, "_splitNodeAtInsertionIndex:", a4);
    }
    v29 = -[_UITreeDataSourceSnapshotter _nodeIndexForGlobalIndex:](self, "_nodeIndexForGlobalIndex:", a5);
    if (v29 == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITreeDataSourceSnapshotter.mm"), 1097, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("nodeInsertionIndex != NSNotFound"));

    }
    v30 = v9[1];
    v31 = v9[2];
    if (v30 != v31)
    {
      v32 = v29;
      v33 = a5;
      do
      {
        v34 = *(_QWORD *)(v30 + 8);
        v35 = *(_QWORD *)(v30 + 16) + v12;
        v44[0] = v33;
        v44[1] = v34;
        v44[2] = v35;
        std::vector<_UIOutlineNode>::insert((char **)&self->_nodes, (char *)&self->_nodes.__begin_[v32], (unint64_t)v44);
        v33 += v34;
        v30 += 24;
        ++v32;
      }
      while (v30 != v31);
    }
    -[_UITreeDataSourceSnapshotter setCount:](self, "setCount:", -[_UITreeDataSourceSnapshotter count](self, "count") + v43);
    -[_UITreeDataSourceSnapshotter _recomputeRangeOffsetForGlobalIndex:](self, "_recomputeRangeOffsetForGlobalIndex:", 0x7FFFFFFFFFFFFFFFLL);
    -[_UITreeDataSourceSnapshotter _recomputeExpandedIndexesForInsertedRange:](self, "_recomputeExpandedIndexesForInsertedRange:", a5, v43);
  }
  objc_msgSend(v9, "expandedIndexes");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = (void *)objc_msgSend(v36, "mutableCopy");

  objc_msgSend(v37, "shiftIndexesStartingAtIndex:by:", 0, a5);
  -[NSMutableIndexSet addIndexes:](self->_expandedIndexes, "addIndexes:", v37);

}

- (_UIOutlineNode)_nextNodeForNodeIndex:(SEL)a3
{
  NSUInteger length;
  int64_t v5;
  int64_t v6;
  NSUInteger *v7;
  NSUInteger v8;
  NSUInteger v9;
  int64_t v10;
  int64_t v11;
  _QWORD *v12;
  int64_t v13;
  BOOL v14;

  length = self->var0.length;
  v5 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(self->var1 - length) >> 3);
  v6 = *a4;
  if (*a4 >= v5)
  {
    v8 = 0;
    v13 = 0x7FFFFFFFFFFFFFFFLL;
    v9 = 0x7FFFFFFFFFFFFFFFLL;
    v10 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    v7 = (NSUInteger *)(length + 24 * v6);
    v9 = *v7;
    v8 = v7[1];
    v10 = v7[2];
    if (v6 + 1 >= v5)
    {
      v11 = 0;
    }
    else
    {
      v11 = 0;
      self = (_UIOutlineNode *)24;
      v12 = (_QWORD *)(length + 24 * v6 + 40);
      while (*v12 == v10)
      {
        v8 += *(v12 - 1);
        ++v11;
        v12 += 3;
        if (v5 + ~v6 == v11)
        {
          v11 = v5 + ~v6;
          break;
        }
      }
    }
    v14 = v11 + v6 + 1 < v5;
    v13 = 0x7FFFFFFFFFFFFFFFLL;
    if (v14)
      v13 = v11 + v6 + 1;
  }
  *a4 = v13;
  retstr->var0.location = v9;
  retstr->var0.length = v8;
  retstr->var1 = v10;
  return self;
}

@end
