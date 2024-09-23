@implementation _TUIRenderModelIdentifierMap

- (_TUIRenderModelIdentifierMap)init
{
  _TUIRenderModelIdentifierMap *v2;
  NSMutableIndexSet *v3;
  NSMutableIndexSet *available;
  NSMutableDictionary *v5;
  NSMutableDictionary *identifierToIndex;
  NSMutableDictionary *v7;
  NSMutableDictionary *indexToIdentifier;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_TUIRenderModelIdentifierMap;
  v2 = -[_TUIRenderModelIdentifierMap init](&v10, "init");
  if (v2)
  {
    v3 = objc_opt_new(NSMutableIndexSet);
    available = v2->_available;
    v2->_available = v3;

    v2->_nextUnassigned = 0;
    v5 = objc_opt_new(NSMutableDictionary);
    identifierToIndex = v2->_identifierToIndex;
    v2->_identifierToIndex = v5;

    v7 = objc_opt_new(NSMutableDictionary);
    indexToIdentifier = v2->_indexToIdentifier;
    v2->_indexToIdentifier = v7;

  }
  return v2;
}

- (void)_collectIndex:(unint64_t)a3
{
  unint64_t v3;

  v3 = a3;
  sub_15B9C8((uint64_t **)&self->_collectedIndexes, &v3, (uint64_t *)&v3);
}

- (void)_retainIndexes:(const void *)a3
{
  char *v3;
  char *v4;
  uint64_t **p_indexToReferenceCount;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, unsigned long>, void *>>> *p_pair1;
  unint64_t v7;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, unsigned long>, void *>>> *left;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, unsigned long>, void *>>> *v9;
  unint64_t v10;
  BOOL v11;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, unsigned long>, void *>>> **v12;
  char *v13;
  char *v14;
  BOOL v15;
  unint64_t v16;
  unint64_t *v17;

  v3 = (char *)a3 + 8;
  v4 = *(char **)a3;
  if (*(const void **)a3 != (char *)a3 + 8)
  {
    p_indexToReferenceCount = (uint64_t **)&self->_indexToReferenceCount;
    p_pair1 = &self->_indexToReferenceCount.__tree_.__pair1_;
    do
    {
      v7 = *((_QWORD *)v4 + 4);
      v16 = v7;
      left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, unsigned long>, void *>>> *)p_pair1->__value_.__left_;
      if (!p_pair1->__value_.__left_)
        goto LABEL_14;
      v9 = p_pair1;
      do
      {
        v10 = (unint64_t)left[4].__value_.__left_;
        v11 = v10 >= v7;
        if (v10 >= v7)
          v12 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, unsigned long>, void *>>> **)left;
        else
          v12 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, unsigned long>, void *>>> **)&left[1];
        if (v11)
          v9 = left;
        left = *v12;
      }
      while (*v12);
      if (v9 != p_pair1 && (void *)v7 >= v9[4].__value_.__left_)
      {
        ++v9[5].__value_.__left_;
      }
      else
      {
LABEL_14:
        v17 = &v16;
        sub_D18A8(p_indexToReferenceCount, &v16, (uint64_t)&std::piecewise_construct, (uint64_t **)&v17)[5] = 1;
      }
      v13 = (char *)*((_QWORD *)v4 + 1);
      if (v13)
      {
        do
        {
          v14 = v13;
          v13 = *(char **)v13;
        }
        while (v13);
      }
      else
      {
        do
        {
          v14 = (char *)*((_QWORD *)v4 + 2);
          v15 = *(_QWORD *)v14 == (_QWORD)v4;
          v4 = v14;
        }
        while (!v15);
      }
      v4 = v14;
    }
    while (v14 != v3);
  }
}

- (void)_releaseIndexes:(const void *)a3
{
  char *v3;
  char *v4;
  uint64_t **p_indexToReferenceCount;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, unsigned long>, void *>>> *p_pair1;
  _QWORD *left;
  unint64_t v9;
  uint64_t *v10;
  unint64_t v11;
  BOOL v12;
  _QWORD *v13;
  uint64_t v14;
  NSMutableDictionary *indexToIdentifier;
  void *v16;
  void *v17;
  NSMutableDictionary *v18;
  void *v19;
  char *v20;
  char *v21;
  BOOL v22;

  v3 = (char *)a3 + 8;
  v4 = *(char **)a3;
  if (*(const void **)a3 != (char *)a3 + 8)
  {
    p_indexToReferenceCount = (uint64_t **)&self->_indexToReferenceCount;
    p_pair1 = &self->_indexToReferenceCount.__tree_.__pair1_;
    do
    {
      left = p_pair1->__value_.__left_;
      if (p_pair1->__value_.__left_)
      {
        v9 = *((_QWORD *)v4 + 4);
        v10 = (uint64_t *)p_pair1;
        do
        {
          v11 = left[4];
          v12 = v11 >= v9;
          if (v11 >= v9)
            v13 = left;
          else
            v13 = left + 1;
          if (v12)
            v10 = left;
          left = (_QWORD *)*v13;
        }
        while (*v13);
        if (v10 != (uint64_t *)p_pair1 && v9 >= v10[4])
        {
          v14 = v10[5] - 1;
          v10[5] = v14;
          if (!v14)
          {
            sub_9A1F8(p_indexToReferenceCount, v10);
            operator delete(v10);
            -[NSMutableIndexSet addIndex:](self->_available, "addIndex:", v9);
            indexToIdentifier = self->_indexToIdentifier;
            v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v9));
            v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](indexToIdentifier, "objectForKeyedSubscript:", v16));

            v18 = self->_indexToIdentifier;
            v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v9));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", 0, v19);

            if (v17)
              -[NSMutableDictionary setObject:forKeyedSubscript:](self->_identifierToIndex, "setObject:forKeyedSubscript:", 0, v17);

          }
        }
      }
      v20 = (char *)*((_QWORD *)v4 + 1);
      if (v20)
      {
        do
        {
          v21 = v20;
          v20 = *(char **)v20;
        }
        while (v20);
      }
      else
      {
        do
        {
          v21 = (char *)*((_QWORD *)v4 + 2);
          v22 = *(_QWORD *)v21 == (_QWORD)v4;
          v4 = v21;
        }
        while (!v22);
      }
      v4 = v21;
    }
    while (v21 != v3);
  }
}

- (void)_appendInterests:(id)a3
{
  _TUIRenderModelIdentifierInterest *v4;
  id v5;

  v5 = a3;
  if (self->_collectedIndexes.__tree_.__pair3_.__value_)
  {
    v4 = -[_TUIRenderModelIdentifierInterest initWithIndexes:map:]([_TUIRenderModelIdentifierInterest alloc], "initWithIndexes:map:", &self->_collectedIndexes, self);
    if (v4)
      objc_msgSend(v5, "addObject:", v4);
  }
  else
  {
    v4 = 0;
  }

}

- (unint64_t)largestIndexInUse
{
  unint64_t nextUnassigned;

  nextUnassigned = self->_nextUnassigned;
  if (nextUnassigned)
    return nextUnassigned - 1;
  else
    return 0x7FFFFFFFFFFFFFFFLL;
}

- (id)mapRenderModels:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  unint64_t v11;
  id v12;
  id v13;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v15 = a3;
  v4 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v15, "count"));
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v15;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));
        v11 = -[_TUIRenderModelIdentifierMap indexForIdentifier:](self, "indexForIdentifier:", v10);

        if (v11 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v12 = objc_msgSend(v9, "copyWithItemIndex:", v11);
          objc_msgSend(v4, "addObject:", v12);

        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }

  v13 = objc_msgSend(v4, "copy");
  return v13;
}

- (unint64_t)indexForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  unint64_t v8;
  void *v9;
  NSMutableDictionary *indexToIdentifier;
  void *v11;

  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_identifierToIndex, "objectForKeyedSubscript:", v4));
    v6 = v5;
    if (v5)
    {
      v7 = objc_msgSend(v5, "unsignedIntegerValue");

      v8 = 0x7FFFFFFFFFFFFFFFLL;
      if (v7 == (id)0x7FFFFFFFFFFFFFFFLL)
        goto LABEL_12;
    }
    else
    {
      v7 = -[NSMutableIndexSet firstIndex](self->_available, "firstIndex");
      if (v7 == (id)0x7FFFFFFFFFFFFFFFLL)
      {
        v7 = -[_TUIRenderModelIdentifierMap allocateNewIndex](self, "allocateNewIndex");
        v8 = 0x7FFFFFFFFFFFFFFFLL;
        if (v7 == (id)0x7FFFFFFFFFFFFFFFLL)
          goto LABEL_12;
      }
      else
      {
        -[NSMutableIndexSet removeIndex:](self->_available, "removeIndex:", v7);
      }
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v7));
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_identifierToIndex, "setObject:forKeyedSubscript:", v9, v4);

      indexToIdentifier = self->_indexToIdentifier;
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v7));
      -[NSMutableDictionary setObject:forKeyedSubscript:](indexToIdentifier, "setObject:forKeyedSubscript:", v4, v11);

    }
    -[_TUIRenderModelIdentifierMap _collectIndex:](self, "_collectIndex:", v7);
    v8 = (unint64_t)v7;
  }
  else
  {
    v8 = 0x7FFFFFFFFFFFFFFFLL;
  }
LABEL_12:

  return v8;
}

- (unint64_t)allocateNewIndex
{
  unint64_t result;

  result = self->_nextUnassigned;
  if (result > 0x7FFFFFFFFFFFFFFELL)
    return 0x7FFFFFFFFFFFFFFFLL;
  self->_nextUnassigned = result + 1;
  return result;
}

- (_NSRange)allocateNewRangeWithLength:(unint64_t)a3
{
  NSUInteger nextUnassigned;
  NSUInteger v5;
  _NSRange result;

  nextUnassigned = self->_nextUnassigned;
  if ((uint64_t)(nextUnassigned + a3) < 0)
  {
    v5 = 0;
    nextUnassigned = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    v5 = a3;
    self->_nextUnassigned = nextUnassigned + a3;
  }
  result.length = v5;
  result.location = nextUnassigned;
  return result;
}

- (NSMutableIndexSet)available
{
  return self->_available;
}

- (void)setAvailable:(id)a3
{
  objc_storeStrong((id *)&self->_available, a3);
}

- (unint64_t)nextUnassigned
{
  return self->_nextUnassigned;
}

- (void)setNextUnassigned:(unint64_t)a3
{
  self->_nextUnassigned = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_available, 0);
  sub_997B8((uint64_t)&self->_collectedIndexes, (_QWORD *)self->_collectedIndexes.__tree_.__pair1_.__value_.__left_);
  sub_997B8((uint64_t)&self->_indexToReferenceCount, (_QWORD *)self->_indexToReferenceCount.__tree_.__pair1_.__value_.__left_);
  objc_storeStrong((id *)&self->_indexToIdentifier, 0);
  objc_storeStrong((id *)&self->_identifierToIndex, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 4) = 0;
  *((_QWORD *)self + 3) = (char *)self + 32;
  *((_QWORD *)self + 8) = 0;
  *((_QWORD *)self + 7) = 0;
  *((_QWORD *)self + 5) = 0;
  *((_QWORD *)self + 6) = (char *)self + 56;
  return self;
}

@end
