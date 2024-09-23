@implementation TSTTileIDKeyDict

- (TSTTileIDKeyDict)initWithOwner:(id)a3
{
  TSTTileIDKeyDict *v3;
  uint64_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TSTTileIDKeyDict;
  v3 = -[TSPContainedObject initWithOwner:](&v6, sel_initWithOwner_, a3);
  if (v3)
  {
    v4 = operator new();
    *(_OWORD *)v4 = 0u;
    *(_OWORD *)(v4 + 16) = 0u;
    *(_DWORD *)(v4 + 32) = 1065353216;
    v3->mMap = (void *)v4;
  }
  return v3;
}

- (void)dealloc
{
  void *mMap;
  uint64_t v4;
  objc_super v5;

  mMap = self->mMap;
  if (mMap)
  {
    v4 = std::__hash_table<std::__hash_value_type<long long const,NSMutableArray * {__strong}>,std::__unordered_map_hasher<long long const,std::__hash_value_type<long long const,NSMutableArray * {__strong}>,TSP::IdentifierHash,std::equal_to<long long const>,true>,std::__unordered_map_equal<long long const,std::__hash_value_type<long long const,NSMutableArray * {__strong}>,std::equal_to<long long const>,TSP::IdentifierHash,true>,std::allocator<std::__hash_value_type<long long const,NSMutableArray * {__strong}>>>::~__hash_table((uint64_t)mMap);
    MEMORY[0x219A153B8](v4, 0x10A0C408EF24B1CLL);
  }
  v5.receiver = self;
  v5.super_class = (Class)TSTTileIDKeyDict;
  -[TSTTileIDKeyDict dealloc](&v5, sel_dealloc);
}

- (id)tileForID:(id)a3
{
  _QWORD *mMap;
  id result;
  $201E9A47BE70A2B12CCA2F48B75AA2F7 v5;

  mMap = self->mMap;
  v5 = a3;
  result = std::__hash_table<std::__hash_value_type<unsigned int,std::pair<EQKit::Font::STIXCollection::StretchInfo,unsigned long>>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,std::pair<EQKit::Font::STIXCollection::StretchInfo,unsigned long>>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,std::pair<EQKit::Font::STIXCollection::StretchInfo,unsigned long>>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,std::pair<EQKit::Font::STIXCollection::StretchInfo,unsigned long>>>>::find<unsigned int>(mMap, (unsigned int *)&v5.var0);
  if (result)
    return (id)objc_msgSend(*((id *)result + 3), "object");
  return result;
}

- (void)setTile:(id)a3 forID:(id)a4
{
  void *mMap;
  id v6;
  id v7;
  id v8;
  $201E9A47BE70A2B12CCA2F48B75AA2F7 v9;
  id v10;

  mMap = self->mMap;
  v6 = +[TSPLazyReference referenceForObject:](TSPLazyReference, "referenceForObject:", a3);
  v7 = v6;
  v9 = a4;
  v10 = v6;
  v8 = v6;
  std::__hash_table<std::__hash_value_type<unsigned int,SFUtility::ObjcSharedPtr<NSObject>>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,SFUtility::ObjcSharedPtr<NSObject>>,TSTIntHasher,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,SFUtility::ObjcSharedPtr<NSObject>>,std::equal_to<unsigned int>,TSTIntHasher,true>,std::allocator<std::__hash_value_type<unsigned int,SFUtility::ObjcSharedPtr<NSObject>>>>::__emplace_unique_key_args<unsigned int,std::pair<unsigned int const,SFUtility::ObjcSharedPtr<NSObject>>>((uint64_t)mMap, (unsigned int *)&v9.var0, (uint64_t)&v9);

}

- (void)removeTileForID:(id)a3
{
  _QWORD *mMap;
  $201E9A47BE70A2B12CCA2F48B75AA2F7 v4;

  mMap = self->mMap;
  v4 = a3;
  std::__hash_table<std::__hash_value_type<unsigned int,SFUtility::ObjcSharedPtr<NSObject>>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,SFUtility::ObjcSharedPtr<NSObject>>,TSTIntHasher,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,SFUtility::ObjcSharedPtr<NSObject>>,std::equal_to<unsigned int>,TSTIntHasher,true>,std::allocator<std::__hash_value_type<unsigned int,SFUtility::ObjcSharedPtr<NSObject>>>>::__erase_unique<unsigned int>(mMap, (unsigned int *)&v4.var0);
}

- (void)removeAllTiles
{
  std::__hash_table<std::__hash_value_type<unsigned int,SFUtility::ObjcSharedPtr<NSObject>>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,SFUtility::ObjcSharedPtr<NSObject>>,TSTIntHasher,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,SFUtility::ObjcSharedPtr<NSObject>>,std::equal_to<unsigned int>,TSTIntHasher,true>,std::allocator<std::__hash_value_type<unsigned int,SFUtility::ObjcSharedPtr<NSObject>>>>::clear((uint64_t)self->mMap);
}

- (void)makeTilesPerformSelector:(SEL)a3
{
  uint64_t **i;

  for (i = (uint64_t **)*((_QWORD *)self->mMap + 2); i; i = (uint64_t **)*i)
    objc_msgSend(i[3], "performSelector:", a3);
}

- (void)applyFunction:(void *)a3 withState:(void *)a4
{
  unint64_t v4;
  uint64_t **i;

  for (i = (uint64_t **)*((_QWORD *)self->mMap + 2); i; i = (uint64_t **)*i)
  {
    v4 = v4 & 0xFFFFFFFF00000000 | *((unsigned int *)i + 4);
    ((void (*)(unint64_t, uint64_t, void *))a3)(v4, objc_msgSend(i[3], "object"), a4);
  }
}

- (int64_t)count
{
  return *((_QWORD *)self->mMap + 3);
}

@end
