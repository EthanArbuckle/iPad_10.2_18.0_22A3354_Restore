@implementation TSUUUIDSet

- (void)setIndex:(unsigned int)a3
{
  self->_index = a3;
}

- (TSUUUIDSet)initWithUUID:(const void *)a3
{
  TSUUUIDSet *v4;
  TSUUUIDSet *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TSUUUIDSet;
  v4 = -[TSUUUIDSet init](&v7, sel_init);
  v5 = v4;
  if (v4)
    std::__hash_table<TSU::UUIDData<TSP::UUIDData>,std::hash<TSU::UUIDData<TSP::UUIDData>>,std::equal_to<TSU::UUIDData<TSP::UUIDData>>,std::allocator<TSU::UUIDData<TSP::UUIDData>>>::__emplace_unique_key_args<TSU::UUIDData<TSP::UUIDData>,TSU::UUIDData<TSP::UUIDData> const&>((uint64_t)&v4->_uuidSet, a3, a3);
  return v5;
}

- (TSUUUIDSet)initWithUUIDSet:(id)a3
{
  TSUUUIDSet *v4;
  TSUUUIDSet *v5;
  TSUUUIDSet *v6;
  BOOL v7;
  objc_super v9;

  v4 = (TSUUUIDSet *)a3;
  v9.receiver = self;
  v9.super_class = (Class)TSUUUIDSet;
  v5 = -[TSUUUIDSet init](&v9, sel_init);
  v6 = v5;
  if (v4)
  {
    if (v5)
      v7 = v5 == v4;
    else
      v7 = 1;
    if (!v7)
    {
      v5->_uuidSet.__table_.__p3_.__value_ = v4->_uuidSet.__table_.__p3_.__value_;
      std::__hash_table<TSU::UUIDData<TSP::UUIDData>,std::hash<TSU::UUIDData<TSP::UUIDData>>,std::equal_to<TSU::UUIDData<TSP::UUIDData>>,std::allocator<TSU::UUIDData<TSP::UUIDData>>>::__assign_multi<std::__hash_const_iterator<std::__hash_node<TSU::UUIDData<TSP::UUIDData>,void *> *>>(&v5->_uuidSet.__table_.__bucket_list_.__ptr_.__value_, (uint64_t *)v4->_uuidSet.__table_.__p1_.__value_.__next_, 0);
    }
  }

  return v6;
}

- (TSUUUIDSet)initWithUUIDVector:(const void *)a3
{
  TSUUUIDSet *v4;
  __int128 *v5;
  __int128 *v6;
  __int128 v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TSUUUIDSet;
  v4 = -[TSUUUIDSet init](&v9, sel_init);
  if (v4)
  {
    v5 = *(__int128 **)a3;
    v6 = (__int128 *)*((_QWORD *)a3 + 1);
    if (*(__int128 **)a3 != v6)
    {
      do
      {
        v8 = *v5;
        std::__hash_table<TSU::UUIDData<TSP::UUIDData>,std::hash<TSU::UUIDData<TSP::UUIDData>>,std::equal_to<TSU::UUIDData<TSP::UUIDData>>,std::allocator<TSU::UUIDData<TSP::UUIDData>>>::__emplace_unique_key_args<TSU::UUIDData<TSP::UUIDData>,TSU::UUIDData<TSP::UUIDData> const&>((uint64_t)&v4->_uuidSet, &v8, &v8);
        ++v5;
      }
      while (v5 != v6);
    }
  }
  return v4;
}

- (vector<TSU::UUIDData<TSP::UUIDData>,)uuidsAsVector
{
  uint64_t *v4;
  vector<TSU::UUIDData<TSP::UUIDData>, std::allocator<TSU::UUIDData<TSP::UUIDData>>> *result;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  __n128 (*v10)(__n128 *, __n128 *);
  void (*v11)(uint64_t);
  void *v12;
  void *__p;
  void *v14;
  uint64_t v15;

  v7 = 0;
  v8 = &v7;
  v9 = 0x4812000000;
  v10 = __Block_byref_object_copy__11;
  v11 = __Block_byref_object_dispose__11;
  v12 = &unk_22A567D77;
  __p = 0;
  v14 = 0;
  v15 = 0;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __27__TSUUUIDSet_uuidsAsVector__block_invoke;
  v6[3] = &unk_24F39BA38;
  v6[4] = &v7;
  -[TSUUUIDSet foreachUuid:](self, "foreachUuid:", v6);
  v4 = v8;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  retstr->__begin_ = 0;
  std::vector<TSU::UUIDData<TSP::UUIDData>>::__init_with_size[abi:ne180100]<TSU::UUIDData<TSP::UUIDData>*,TSU::UUIDData<TSP::UUIDData>*>(retstr, (const void *)v4[6], v4[7], (v4[7] - v4[6]) >> 4);
  _Block_object_dispose(&v7, 8);
  result = (vector<TSU::UUIDData<TSP::UUIDData>, std::allocator<TSU::UUIDData<TSP::UUIDData>>> *)__p;
  if (__p)
  {
    v14 = __p;
    operator delete(__p);
  }
  return result;
}

void __27__TSUUUIDSet_uuidsAsVector__block_invoke(uint64_t a1, _OWORD *a2)
{
  _QWORD *v3;
  _OWORD *v4;
  unint64_t v5;
  _OWORD *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  char *v12;
  char *v13;
  char *v14;
  char *v15;
  char *v16;

  v3 = *(_QWORD **)(*(_QWORD *)(a1 + 32) + 8);
  v4 = (_OWORD *)v3[7];
  v5 = v3[8];
  if ((unint64_t)v4 >= v5)
  {
    v7 = v3[6];
    v8 = ((uint64_t)v4 - v7) >> 4;
    v9 = v8 + 1;
    if ((unint64_t)(v8 + 1) >> 60)
      std::vector<std::shared_ptr<TSUStringChunk>>::__throw_length_error[abi:ne180100]();
    v10 = v5 - v7;
    if (v10 >> 3 > v9)
      v9 = v10 >> 3;
    if ((unint64_t)v10 >= 0x7FFFFFFFFFFFFFF0)
      v11 = 0xFFFFFFFFFFFFFFFLL;
    else
      v11 = v9;
    if (v11)
      v12 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<TSUStringChunk>>>((uint64_t)(v3 + 8), v11);
    else
      v12 = 0;
    v13 = &v12[16 * v8];
    v14 = &v12[16 * v11];
    *(_OWORD *)v13 = *a2;
    v6 = v13 + 16;
    v16 = (char *)v3[6];
    v15 = (char *)v3[7];
    if (v15 != v16)
    {
      do
      {
        *((_OWORD *)v13 - 1) = *((_OWORD *)v15 - 1);
        v13 -= 16;
        v15 -= 16;
      }
      while (v15 != v16);
      v15 = (char *)v3[6];
    }
    v3[6] = v13;
    v3[7] = v6;
    v3[8] = v14;
    if (v15)
      operator delete(v15);
  }
  else
  {
    *v4 = *a2;
    v6 = v4 + 1;
  }
  v3[7] = v6;
}

- (id)description
{
  void *v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__1;
  v10 = __Block_byref_object_dispose__2;
  v11 = 0;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __25__TSUUUIDSet_description__block_invoke;
  v5[3] = &unk_24F39BA38;
  v5[4] = &v6;
  -[TSUUUIDSet foreachUuid:](self, "foreachUuid:", v5);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@<%p>: %@"), objc_opt_class(), self, v7[5]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __25__TSUUUIDSet_description__block_invoke(uint64_t a1, const unsigned __int8 *a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  TSU::UUIDData<TSP::UUIDData>::NSStringValue(a2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v8 = (id)v3;
  if (v4)
  {
    objc_msgSend(v4, "appendFormat:", CFSTR(", %@"), v3, v3);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", v3);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
}

- (BOOL)containsUuid:(const void *)a3
{
  return std::__hash_table<TSU::UUIDData<TSP::UUIDData>,std::hash<TSU::UUIDData<TSP::UUIDData>>,std::equal_to<TSU::UUIDData<TSP::UUIDData>>,std::allocator<TSU::UUIDData<TSP::UUIDData>>>::find<TSU::UUIDData<TSP::UUIDData>>(&self->_uuidSet.__table_.__bucket_list_.__ptr_.__value_, a3) != 0;
}

- (BOOL)intersectsSet:(id)a3
{
  _QWORD *v4;
  void *v5;
  char v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    if (self->_uuidSet.__table_.__p2_.__value_ <= v4[5])
    {
      v9 = 0;
      v10 = &v9;
      v11 = 0x2020000000;
      v12 = 0;
      v8[0] = MEMORY[0x24BDAC760];
      v8[1] = 3221225472;
      v8[2] = __28__TSUUUIDSet_intersectsSet___block_invoke;
      v8[3] = &unk_24F39BA60;
      v8[4] = self;
      v8[5] = &v9;
      -[TSUUUIDSet foreachUuid:](self, "foreachUuid:", v8);
      v6 = *((_BYTE *)v10 + 24) != 0;
      _Block_object_dispose(&v9, 8);
    }
    else
    {
      v6 = objc_msgSend(v4, "intersectsSet:", self);
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

_QWORD *__28__TSUUUIDSet_intersectsSet___block_invoke(uint64_t a1, _QWORD *a2, _BYTE *a3)
{
  _QWORD *result;

  result = std::__hash_table<TSU::UUIDData<TSP::UUIDData>,std::hash<TSU::UUIDData<TSP::UUIDData>>,std::equal_to<TSU::UUIDData<TSP::UUIDData>>,std::allocator<TSU::UUIDData<TSP::UUIDData>>>::find<TSU::UUIDData<TSP::UUIDData>>((_QWORD *)(*(_QWORD *)(a1 + 32) + 16), a2);
  if (result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  TSUUUIDSet *v4;
  TSUUUIDSet *v5;
  BOOL v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v4 = (TSUUUIDSet *)a3;
  v5 = v4;
  v6 = self == v4;
  if (v4 && self != v4)
  {
    if (self->_uuidSet.__table_.__p2_.__value_ == v4->_uuidSet.__table_.__p2_.__value_)
    {
      v9 = 0;
      v10 = &v9;
      v11 = 0x2020000000;
      v12 = 0;
      v8[0] = MEMORY[0x24BDAC760];
      v8[1] = 3221225472;
      v8[2] = __22__TSUUUIDSet_isEqual___block_invoke;
      v8[3] = &unk_24F39BA60;
      v8[4] = self;
      v8[5] = &v9;
      -[TSUUUIDSet foreachUuid:](self, "foreachUuid:", v8);
      v6 = *((_BYTE *)v10 + 24) == 0;
      _Block_object_dispose(&v9, 8);
    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

_QWORD *__22__TSUUUIDSet_isEqual___block_invoke(uint64_t a1, _QWORD *a2, _BYTE *a3)
{
  _QWORD *result;

  result = std::__hash_table<TSU::UUIDData<TSP::UUIDData>,std::hash<TSU::UUIDData<TSP::UUIDData>>,std::equal_to<TSU::UUIDData<TSP::UUIDData>>,std::allocator<TSU::UUIDData<TSP::UUIDData>>>::find<TSU::UUIDData<TSP::UUIDData>>((_QWORD *)(*(_QWORD *)(a1 + 32) + 16), a2);
  if (!result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

- (unint64_t)hash
{
  return self->_uuidSet.__table_.__p2_.__value_;
}

- (UUIDData<TSP::UUIDData>)anyUuid
{
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  __n128 (*v10)(__n128 *, __n128 *);
  uint64_t (*v11)();
  void *v12;
  uint64_t v13;
  uint64_t v14;
  UUIDData<TSP::UUIDData> result;

  v7 = 0;
  v8 = &v7;
  v9 = 0x4012000000;
  v10 = __Block_byref_object_copy__7;
  v11 = __Block_byref_object_dispose__8;
  v14 = 0;
  v12 = &unk_22A567D77;
  v13 = 0;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __21__TSUUUIDSet_anyUuid__block_invoke;
  v6[3] = &unk_24F39BA38;
  v6[4] = &v7;
  -[TSUUUIDSet foreachUuid:](self, "foreachUuid:", v6);
  v2 = v8[6];
  v3 = v8[7];
  _Block_object_dispose(&v7, 8);
  v4 = v2;
  v5 = v3;
  result.var0.var2.var1 = v5;
  result.var0.var2.var0 = v4;
  return result;
}

__n128 __21__TSUUUIDSet_anyUuid__block_invoke(uint64_t a1, __n128 *a2, _BYTE *a3)
{
  __n128 result;

  result = *a2;
  *(__n128 *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48) = *a2;
  *a3 = 1;
  return result;
}

- (BOOL)isAllInvalid
{
  uint64_t v3;
  uint64_t v4;

  if (-[TSUUUIDSet count](self, "count") != 1)
    return 0;
  v3 = -[TSUUUIDSet anyUuid](self, "anyUuid");
  return (v3 | v4) == 0;
}

- (id)expandedSetWithUuid:(const void *)a3
{
  TSUUUIDSet *v4;
  TSUUUIDSet *v5;

  v4 = self;
  if (!-[TSUUUIDSet containsUuid:](v4, "containsUuid:", a3))
  {
    v5 = (TSUUUIDSet *)-[TSUUUIDSet copy](v4, "copy");

    v4 = v5;
    -[TSUUUIDSet p_addUUID:](v5, "p_addUUID:", a3);
  }
  return v4;
}

- (id)reducedSetMinusUuid:(const void *)a3
{
  TSUUUIDSet *v4;
  TSUUUIDSet *v5;

  v4 = self;
  if (-[TSUUUIDSet containsUuid:](v4, "containsUuid:", a3))
  {
    v5 = (TSUUUIDSet *)-[TSUUUIDSet copy](v4, "copy");

    v4 = v5;
    -[TSUUUIDSet p_removeUUID:](v5, "p_removeUUID:", a3);
  }
  return v4;
}

- (id)expandedSetWithUuids:(const void *)a3
{
  TSUUUIDSet *v4;
  TSUUUIDSet *v5;
  TSUUUIDSet *v6;

  v4 = self;
  v5 = v4;
  if (*((_QWORD *)a3 + 3))
  {
    v6 = (TSUUUIDSet *)-[TSUUUIDSet copy](v4, "copy");

    v5 = v6;
    -[TSUUUIDSet p_addUUIDs:](v6, "p_addUUIDs:", a3);
  }
  return v5;
}

- (id)reducedSetMinusUuids:(const void *)a3
{
  TSUUUIDSet *v4;
  TSUUUIDSet *v5;
  TSUUUIDSet *v6;

  v4 = self;
  v5 = v4;
  if (*((_QWORD *)a3 + 3))
  {
    v6 = (TSUUUIDSet *)-[TSUUUIDSet copy](v4, "copy");

    v5 = v6;
    -[TSUUUIDSet p_addUUIDs:](v6, "p_addUUIDs:", a3);
  }
  return v5;
}

- (id)expandedSetWithUuidsFromVector:(const void *)a3
{
  TSUUUIDSet *v4;
  TSUUUIDSet *v5;
  TSUUUIDSet *v6;

  v4 = self;
  v5 = v4;
  if (*((_QWORD *)a3 + 1) != *(_QWORD *)a3)
  {
    v6 = (TSUUUIDSet *)-[TSUUUIDSet copy](v4, "copy");

    v5 = v6;
    -[TSUUUIDSet p_addUUIDsFromVector:](v6, "p_addUUIDsFromVector:", a3);
  }
  return v5;
}

- (id)reducedSetMinusUuidsFromVector:(const void *)a3
{
  TSUUUIDSet *v4;
  TSUUUIDSet *v5;
  TSUUUIDSet *v6;

  v4 = self;
  v5 = v4;
  if (*((_QWORD *)a3 + 1) != *(_QWORD *)a3)
  {
    v6 = (TSUUUIDSet *)-[TSUUUIDSet copy](v4, "copy");

    v5 = v6;
    -[TSUUUIDSet p_removeUUIDsFromVector:](v6, "p_removeUUIDsFromVector:", a3);
  }
  return v5;
}

- (void)foreachUuid:(id)a3
{
  void (**v4)(id, uint64_t, _BYTE *);
  _QWORD *next;
  BOOL v6;
  char v7;

  v4 = (void (**)(id, uint64_t, _BYTE *))a3;
  v7 = 0;
  next = self->_uuidSet.__table_.__p1_.__value_.__next_;
  if (next)
  {
    do
    {
      v4[2](v4, (uint64_t)(next + 2), &v7);
      next = (_QWORD *)*next;
      if (v7)
        v6 = 1;
      else
        v6 = next == 0;
    }
    while (!v6);
  }

}

- (unint64_t)count
{
  return self->_uuidSet.__table_.__p2_.__value_;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[TSUUUIDSet initWithUUIDSet:]([TSUUUIDSet alloc], "initWithUUIDSet:", self);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[TSUUUIDSet initWithUUIDSet:]([TSUMutableUUIDSet alloc], "initWithUUIDSet:", self);
}

- (BOOL)p_addUUID:(const void *)a3
{
  char v3;

  std::__hash_table<TSU::UUIDData<TSP::UUIDData>,std::hash<TSU::UUIDData<TSP::UUIDData>>,std::equal_to<TSU::UUIDData<TSP::UUIDData>>,std::allocator<TSU::UUIDData<TSP::UUIDData>>>::__emplace_unique_key_args<TSU::UUIDData<TSP::UUIDData>,TSU::UUIDData<TSP::UUIDData> const&>((uint64_t)&self->_uuidSet, a3, a3);
  return v3 & 1;
}

- (BOOL)p_removeUUID:(const void *)a3
{
  unordered_set<TSU::UUIDData<TSP::UUIDData>, std::hash<TSUUUID>, std::equal_to<TSU::UUIDData<TSP::UUIDData>>, std::allocator<TSU::UUIDData<TSP::UUIDData>>> *p_uuidSet;
  _QWORD *v5;

  p_uuidSet = &self->_uuidSet;
  v5 = std::__hash_table<TSU::UUIDData<TSP::UUIDData>,std::hash<TSU::UUIDData<TSP::UUIDData>>,std::equal_to<TSU::UUIDData<TSP::UUIDData>>,std::allocator<TSU::UUIDData<TSP::UUIDData>>>::find<TSU::UUIDData<TSP::UUIDData>>(&self->_uuidSet.__table_.__bucket_list_.__ptr_.__value_, a3);
  if (v5)
    std::__hash_table<TSU::UUIDData<TSP::UUIDData>,std::hash<TSU::UUIDData<TSP::UUIDData>>,std::equal_to<TSU::UUIDData<TSP::UUIDData>>,std::allocator<TSU::UUIDData<TSP::UUIDData>>>::__erase_unique<TSU::UUIDData<TSP::UUIDData>>(p_uuidSet, a3);
  return v5 != 0;
}

- (void)p_addUUIDs:(const void *)a3
{
  uint64_t *i;
  __int128 v5;

  for (i = (uint64_t *)*((_QWORD *)a3 + 2); i; i = (uint64_t *)*i)
  {
    v5 = *((_OWORD *)i + 1);
    -[TSUUUIDSet p_addUUID:](self, "p_addUUID:", &v5);
  }
}

- (void)p_removeUUIDs:(const void *)a3
{
  uint64_t *i;
  __int128 v5;

  for (i = (uint64_t *)*((_QWORD *)a3 + 2); i; i = (uint64_t *)*i)
  {
    v5 = *((_OWORD *)i + 1);
    -[TSUUUIDSet p_removeUUID:](self, "p_removeUUID:", &v5);
  }
}

- (void)p_addUUIDsFromVector:(const void *)a3
{
  __int128 *i;
  __int128 v6;
  __int128 v7;

  for (i = *(__int128 **)a3; i != *((__int128 **)a3 + 1); ++i)
  {
    v6 = *i;
    v7 = v6;
    -[TSUUUIDSet p_addUUID:](self, "p_addUUID:", &v7);
  }
}

- (void)p_removeUUIDsFromVector:(const void *)a3
{
  __int128 *i;
  __int128 v6;
  __int128 v7;

  for (i = *(__int128 **)a3; i != *((__int128 **)a3 + 1); ++i)
  {
    v6 = *i;
    v7 = v6;
    -[TSUUUIDSet p_removeUUID:](self, "p_removeUUID:", &v7);
  }
}

- (unsigned)index
{
  return self->_index;
}

- (void).cxx_destruct
{
  std::__hash_table<TSU::UUIDData<TSP::UUIDData>,std::hash<TSU::UUIDData<TSP::UUIDData>>,std::equal_to<TSU::UUIDData<TSP::UUIDData>>,std::allocator<TSU::UUIDData<TSP::UUIDData>>>::~__hash_table((uint64_t)&self->_uuidSet);
}

- (id).cxx_construct
{
  *((_OWORD *)self + 1) = 0u;
  *((_OWORD *)self + 2) = 0u;
  *((_DWORD *)self + 12) = 1065353216;
  return self;
}

@end
