@implementation WBSHistoryObjectCache

- (void)reserveItemCapacity:(int64_t)a3
{
  std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::__rehash<true>((uint64_t)&self->_itemsByDatabaseID, vcvtps_u32_f32((float)(unint64_t)a3 / self->_itemsByDatabaseID.__table_.__p3_.__value_));
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  *((_DWORD *)self + 10) = 1065353216;
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 4) = 0u;
  *((_DWORD *)self + 20) = 1065353216;
  return self;
}

- (WBSHistoryObjectCache)init
{
  WBSHistoryObjectCache *v2;
  WBSHistoryObjectCache *v3;
  WBSHistoryObjectCache *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WBSHistoryObjectCache;
  v2 = -[WBSHistoryObjectCache init](&v6, sel_init);
  v3 = v2;
  if (v2)
    v4 = v2;

  return v3;
}

- (id)allItems
{
  void *v3;
  id *i;
  id v5;

  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", self->_itemsByDatabaseID.__table_.__p2_.__value_);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = (id *)self->_itemsByDatabaseID.__table_.__p1_.__value_.__next_; i; i = (id *)*i)
  {
    v5 = i[3];
    objc_msgSend(v3, "addObject:", v5);

  }
  return v3;
}

- (id)itemForID:(int64_t)a3
{
  id *v3;
  int64_t v5;

  v5 = a3;
  v3 = (id *)std::__hash_table<std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,WBSHistoryItem * {__strong}>>>::find<long long>(&self->_itemsByDatabaseID.__table_.__bucket_list_.__ptr_.__value_, (unint64_t *)&v5);
  if (v3)
    v3 = (id *)v3[3];
  return v3;
}

- (void)setItem:(id)a3 forID:(int64_t)a4
{
  id v6;
  _QWORD *v7;
  void *v8;
  unint64_t v9;
  int64_t *v10;

  v6 = a3;
  v9 = a4;
  v10 = (int64_t *)&v9;
  v7 = std::__hash_table<std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,WBSHistoryItem * {__strong}>>>::__emplace_unique_key_args<long long,std::piecewise_construct_t const&,std::tuple<long long const&>,std::tuple<>>((uint64_t)&self->_itemsByDatabaseID, &v9, (uint64_t)&std::piecewise_construct, &v10);
  v8 = (void *)v7[3];
  v7[3] = v6;

}

- (void)removeItemWithID:(int64_t)a3
{
  int64_t v3;

  v3 = a3;
  std::__hash_table<std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,WBSHistoryItem * {__strong}>>>::__erase_unique<long long>(&self->_itemsByDatabaseID.__table_.__bucket_list_.__ptr_.__value_, (unint64_t *)&v3);
}

- (void)changeItemIDs:(id)a3
{
  id v4;
  uint64_t *v5;
  unordered_map<long long, WBSHistoryItem *, std::hash<long long>, std::equal_to<long long>, std::allocator<std::pair<const long long, WBSHistoryItem *>>> *p_itemsByDatabaseID;
  uint64_t *v7;
  uint64_t *v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  __int128 v13;

  v4 = a3;
  v5 = *(uint64_t **)(objc_msgSend(v4, "map") + 16);
  if (v5)
  {
    p_itemsByDatabaseID = &self->_itemsByDatabaseID;
    do
    {
      v13 = *((_OWORD *)v5 + 1);
      v7 = std::__hash_table<std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,WBSHistoryItem * {__strong}>>>::find<long long>(p_itemsByDatabaseID, (unint64_t *)&v13);
      v8 = v7;
      if (v7)
      {
        v9 = (id)v7[3];
        objc_msgSend(v9, "setDatabaseID:", *((_QWORD *)&v13 + 1));
        v11 = *((_QWORD *)&v13 + 1);
        v10 = v9;
        v12 = v10;
        std::__hash_table<std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,WBSHistoryItem * {__strong}>>>::__emplace_unique_key_args<long long,std::pair<long long,WBSHistoryItem * {__strong}>>((uint64_t)p_itemsByDatabaseID, (unint64_t *)&v11, &v11);

        std::__hash_table<std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,WBSHistoryItem * {__strong}>>>::erase(p_itemsByDatabaseID, v8);
      }
      v5 = (uint64_t *)*v5;
    }
    while (v5);
  }

}

- (id)visitForID:(int64_t)a3
{
  id *WeakRetained;
  int64_t v5;

  v5 = a3;
  WeakRetained = (id *)std::__hash_table<std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,WBSHistoryItem * {__strong}>>>::find<long long>(&self->_weakVisitsByDatabaseID.__table_.__bucket_list_.__ptr_.__value_, (unint64_t *)&v5);
  if (WeakRetained)
    WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 3);
  return WeakRetained;
}

- (void)setVisit:(id)a3 forID:(int64_t)a4
{
  id v6;
  id *v7;
  unint64_t v8;
  int64_t *v9;

  v6 = a3;
  v8 = a4;
  v9 = (int64_t *)&v8;
  v7 = (id *)std::__hash_table<std::__hash_value_type<long long,WBSHistoryVisit * {__weak}>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,WBSHistoryVisit * {__weak}>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,WBSHistoryVisit * {__weak}>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,WBSHistoryVisit * {__weak}>>>::__emplace_unique_key_args<long long,std::piecewise_construct_t const&,std::tuple<long long const&>,std::tuple<>>((uint64_t)&self->_weakVisitsByDatabaseID, &v8, (uint64_t)&std::piecewise_construct, &v9);
  objc_storeWeak(v7 + 3, v6);

}

- (void)_clearNilReferences
{
  id *next;
  unordered_map<long long, WBSHistoryVisit *__weak, std::hash<long long>, std::equal_to<long long>, std::allocator<std::pair<const long long, WBSHistoryVisit *__weak>>> *p_weakVisitsByDatabaseID;
  id WeakRetained;

  next = (id *)self->_weakVisitsByDatabaseID.__table_.__p1_.__value_.__next_;
  if (next)
  {
    p_weakVisitsByDatabaseID = &self->_weakVisitsByDatabaseID;
    do
    {
      while (1)
      {
        WeakRetained = objc_loadWeakRetained(next + 3);

        if (!WeakRetained)
          break;
        next = (id *)*next;
        if (!next)
          return;
      }
      next = (id *)std::__hash_table<std::__hash_value_type<long long,WBSHistoryVisit * {__weak}>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,WBSHistoryVisit * {__weak}>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,WBSHistoryVisit * {__weak}>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,WBSHistoryVisit * {__weak}>>>::erase(p_weakVisitsByDatabaseID, (uint64_t *)next);
    }
    while (next);
  }
}

- (void)changeVisitIDs:(id)a3
{
  id v4;
  _QWORD *v5;
  unordered_map<long long, WBSHistoryVisit *__weak, std::hash<long long>, std::equal_to<long long>, std::allocator<std::pair<const long long, WBSHistoryVisit *__weak>>> *p_weakVisitsByDatabaseID;
  _QWORD *v7;
  uint64_t *v8;
  id WeakRetained;
  id v10;
  unint64_t v11;
  id v12;

  v4 = a3;
  -[WBSHistoryObjectCache _clearNilReferences](self, "_clearNilReferences");
  v5 = *(_QWORD **)(objc_msgSend(v4, "map") + 16);
  if (v5)
  {
    p_weakVisitsByDatabaseID = &self->_weakVisitsByDatabaseID;
    do
    {
      v7 = std::__hash_table<std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,WBSHistoryItem * {__strong}>>>::find<long long>(p_weakVisitsByDatabaseID, v5 + 2);
      v8 = v7;
      if (v7)
      {
        WeakRetained = objc_loadWeakRetained((id *)v7 + 3);
        std::__hash_table<std::__hash_value_type<long long,WBSHistoryVisit * {__weak}>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,WBSHistoryVisit * {__weak}>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,WBSHistoryVisit * {__weak}>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,WBSHistoryVisit * {__weak}>>>::erase(p_weakVisitsByDatabaseID, v8);
        if (!WeakRetained)
          break;
        objc_msgSend(WeakRetained, "setDatabaseID:", v5[3]);
        v11 = v5[3];
        v10 = WeakRetained;
        v12 = v10;
        std::__hash_table<std::__hash_value_type<long long,WBSHistoryVisit * {__weak}>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,WBSHistoryVisit * {__weak}>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,WBSHistoryVisit * {__weak}>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,WBSHistoryVisit * {__weak}>>>::__emplace_unique_key_args<long long,std::pair<long long,WBSHistoryVisit * {__strong}>>((uint64_t)p_weakVisitsByDatabaseID, &v11, &v11);

      }
      v5 = (_QWORD *)*v5;
    }
    while (v5);
  }

}

- (void)clear
{
  std::__hash_table<std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,WBSHistoryItem * {__strong}>>>::clear((uint64_t)&self->_itemsByDatabaseID);
  std::__hash_table<std::__hash_value_type<long long,WBSHistoryVisit * {__weak}>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,WBSHistoryVisit * {__weak}>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,WBSHistoryVisit * {__weak}>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,WBSHistoryVisit * {__weak}>>>::clear((uint64_t)&self->_weakVisitsByDatabaseID);
}

- (void).cxx_destruct
{
  std::__hash_table<std::__hash_value_type<long long,WBSHistoryVisit * {__weak}>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,WBSHistoryVisit * {__weak}>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,WBSHistoryVisit * {__weak}>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,WBSHistoryVisit * {__weak}>>>::~__hash_table((uint64_t)&self->_weakVisitsByDatabaseID);
  std::__hash_table<std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,WBSHistoryItem * {__strong}>>>::~__hash_table((uint64_t)&self->_itemsByDatabaseID);
}

@end
