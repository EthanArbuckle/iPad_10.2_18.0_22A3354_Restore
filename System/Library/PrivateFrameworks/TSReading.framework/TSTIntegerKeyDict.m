@implementation TSTIntegerKeyDict

- (TSTIntegerKeyDict)init
{
  TSTIntegerKeyDict *v2;
  uint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TSTIntegerKeyDict;
  v2 = -[TSTIntegerKeyDict init](&v5, sel_init);
  if (v2)
  {
    v3 = operator new();
    *(_OWORD *)v3 = 0u;
    *(_OWORD *)(v3 + 16) = 0u;
    *(_DWORD *)(v3 + 32) = 1065353216;
    v2->mMap = (void *)v3;
  }
  return v2;
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
  v5.super_class = (Class)TSTIntegerKeyDict;
  -[TSTIntegerKeyDict dealloc](&v5, sel_dealloc);
}

- (id)objectForKey:(unsigned int)a3
{
  id result;
  unsigned int v4;

  v4 = a3;
  result = std::__hash_table<std::__hash_value_type<unsigned int,std::pair<EQKit::Font::STIXCollection::StretchInfo,unsigned long>>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,std::pair<EQKit::Font::STIXCollection::StretchInfo,unsigned long>>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,std::pair<EQKit::Font::STIXCollection::StretchInfo,unsigned long>>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,std::pair<EQKit::Font::STIXCollection::StretchInfo,unsigned long>>>>::find<unsigned int>((_QWORD *)self->mMap, &v4);
  if (result)
    return (id)*((_QWORD *)result + 3);
  return result;
}

- (void)setObject:(id)a3 forKey:(unsigned int)a4
{
  void *v7;
  uint64_t v8;
  void *mMap;
  id v10;
  id v11;
  unsigned int v12;
  id v13;

  if (!a3)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSTIntegerKeyDict setObject:forKey:]");
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTIntegerKeyDict.mm"), 45, CFSTR("Can't set nil objects in this map!"));
  }
  mMap = self->mMap;
  v10 = a3;
  v12 = a4;
  v13 = a3;
  v11 = a3;
  std::__hash_table<std::__hash_value_type<unsigned int,SFUtility::ObjcSharedPtr<NSObject>>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,SFUtility::ObjcSharedPtr<NSObject>>,TSTIntHasher,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,SFUtility::ObjcSharedPtr<NSObject>>,std::equal_to<unsigned int>,TSTIntHasher,true>,std::allocator<std::__hash_value_type<unsigned int,SFUtility::ObjcSharedPtr<NSObject>>>>::__emplace_unique_key_args<unsigned int,std::pair<unsigned int const,SFUtility::ObjcSharedPtr<NSObject>>>((uint64_t)mMap, &v12, (uint64_t)&v12);

}

- (void)removeFirstObject
{
  std::__hash_table<std::__hash_value_type<unsigned int,SFUtility::ObjcSharedPtr<NSObject>>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,SFUtility::ObjcSharedPtr<NSObject>>,TSTIntHasher,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,SFUtility::ObjcSharedPtr<NSObject>>,std::equal_to<unsigned int>,TSTIntHasher,true>,std::allocator<std::__hash_value_type<unsigned int,SFUtility::ObjcSharedPtr<NSObject>>>>::__erase_unique<unsigned int>((_QWORD *)self->mMap, (unsigned int *)(*((_QWORD *)self->mMap + 2) + 16));
}

- (void)removeObjectForKey:(unsigned int)a3
{
  unsigned int v3;

  v3 = a3;
  std::__hash_table<std::__hash_value_type<unsigned int,SFUtility::ObjcSharedPtr<NSObject>>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,SFUtility::ObjcSharedPtr<NSObject>>,TSTIntHasher,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,SFUtility::ObjcSharedPtr<NSObject>>,std::equal_to<unsigned int>,TSTIntHasher,true>,std::allocator<std::__hash_value_type<unsigned int,SFUtility::ObjcSharedPtr<NSObject>>>>::__erase_unique<unsigned int>((_QWORD *)self->mMap, &v3);
}

- (void)removeAllObjects
{
  std::__hash_table<std::__hash_value_type<unsigned int,SFUtility::ObjcSharedPtr<NSObject>>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,SFUtility::ObjcSharedPtr<NSObject>>,TSTIntHasher,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,SFUtility::ObjcSharedPtr<NSObject>>,std::equal_to<unsigned int>,TSTIntHasher,true>,std::allocator<std::__hash_value_type<unsigned int,SFUtility::ObjcSharedPtr<NSObject>>>>::clear((uint64_t)self->mMap);
}

- (void)makeObjectsPerformSelector:(SEL)a3
{
  uint64_t **i;

  for (i = (uint64_t **)*((_QWORD *)self->mMap + 2); i; i = (uint64_t **)*i)
    objc_msgSend(i[3], "performSelector:", a3);
}

- (void)applyFunction:(void *)a3 withState:(void *)a4
{
  uint64_t **i;

  for (i = (uint64_t **)*((_QWORD *)self->mMap + 2); i; i = (uint64_t **)*i)
    ((void (*)(_QWORD, uint64_t *, void *))a3)(*((unsigned int *)i + 4), i[3], a4);
}

- (void)applyFunction:(void *)a3 withState:(void *)a4 andState:(void *)a5
{
  uint64_t **i;

  for (i = (uint64_t **)*((_QWORD *)self->mMap + 2); i; i = (uint64_t **)*i)
    ((void (*)(_QWORD, uint64_t *, void *, void *))a3)(*((unsigned int *)i + 4), i[3], a4, a5);
}

- (void)transformWithFunction:(void *)a3 withState:(void *)a4
{
  void **i;
  void *v7;
  void *v8;
  BOOL v9;

  for (i = (void **)*((_QWORD *)self->mMap + 2); i; i = (void **)*i)
  {
    v7 = i[3];
    v8 = (void *)((uint64_t (*)(_QWORD, void *, void *))a3)(*((unsigned int *)i + 4), v7, a4);
    if (v8)
      v9 = v8 == v7;
    else
      v9 = 1;
    if (!v9)
      SFUtility::ObjcSharedPtr<NSObject>::reset(i + 3, v8);
  }
}

- (int64_t)count
{
  return *((_QWORD *)self->mMap + 3);
}

- (id)allValues
{
  void *v3;
  _QWORD *i;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", -[TSTIntegerKeyDict count](self, "count"));
  for (i = (_QWORD *)*((_QWORD *)self->mMap + 2); i; i = (_QWORD *)*i)
    objc_msgSend(v3, "addObject:", i[3]);
  return v3;
}

@end
