@implementation TSTTableDataObjectKeyDict

- (TSTTableDataObjectKeyDict)init
{
  TSTTableDataObjectKeyDict *v2;
  uint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TSTTableDataObjectKeyDict;
  v2 = -[TSTTableDataObjectKeyDict init](&v5, sel_init);
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
    v4 = std::__hash_table<std::__hash_value_type<SFUtility::ObjcSharedPtr<TSTTableDataObject>,unsigned int>,std::__unordered_map_hasher<SFUtility::ObjcSharedPtr<TSTTableDataObject>,std::__hash_value_type<SFUtility::ObjcSharedPtr<TSTTableDataObject>,unsigned int>,TSTTableDataObjectHasher,TSTTableDataObjectEqual,true>,std::__unordered_map_equal<SFUtility::ObjcSharedPtr<TSTTableDataObject>,std::__hash_value_type<SFUtility::ObjcSharedPtr<TSTTableDataObject>,unsigned int>,TSTTableDataObjectEqual,TSTTableDataObjectHasher,true>,std::allocator<std::__hash_value_type<SFUtility::ObjcSharedPtr<TSTTableDataObject>,unsigned int>>>::~__hash_table((uint64_t)mMap);
    MEMORY[0x219A153B8](v4, 0x10A0C408EF24B1CLL);
  }
  v5.receiver = self;
  v5.super_class = (Class)TSTTableDataObjectKeyDict;
  -[TSTTableDataObjectKeyDict dealloc](&v5, sel_dealloc);
}

- (unsigned)keyForObject:(id)a3
{
  _QWORD *mMap;
  id v4;
  uint64_t **v5;
  id v7;

  mMap = self->mMap;
  v7 = a3;
  v4 = a3;
  v5 = std::__hash_table<std::__hash_value_type<SFUtility::ObjcSharedPtr<TSTTableDataObject>,unsigned int>,std::__unordered_map_hasher<SFUtility::ObjcSharedPtr<TSTTableDataObject>,std::__hash_value_type<SFUtility::ObjcSharedPtr<TSTTableDataObject>,unsigned int>,TSTTableDataObjectHasher,TSTTableDataObjectEqual,true>,std::__unordered_map_equal<SFUtility::ObjcSharedPtr<TSTTableDataObject>,std::__hash_value_type<SFUtility::ObjcSharedPtr<TSTTableDataObject>,unsigned int>,TSTTableDataObjectEqual,TSTTableDataObjectHasher,true>,std::allocator<std::__hash_value_type<SFUtility::ObjcSharedPtr<TSTTableDataObject>,unsigned int>>>::find<SFUtility::ObjcSharedPtr<TSTTableDataObject>>(mMap, &v7);

  if (v5)
    return *((_DWORD *)v5 + 6);
  else
    return 0;
}

- (void)setKey:(unsigned int)a3 forObject:(id)a4
{
  void *v7;
  uint64_t v8;
  void *mMap;
  id v10;
  id v11;
  id v12;
  unsigned int v13;

  if (!a3)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSTTableDataObjectKeyDict setKey:forObject:]");
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTTableDataObjectKeyDict.mm"), 68, CFSTR("Can't set invalid keys in this map!"));
  }
  mMap = self->mMap;
  v10 = a4;
  v12 = a4;
  v11 = a4;
  v13 = a3;
  std::__hash_table<std::__hash_value_type<SFUtility::ObjcSharedPtr<TSTTableDataObject>,unsigned int>,std::__unordered_map_hasher<SFUtility::ObjcSharedPtr<TSTTableDataObject>,std::__hash_value_type<SFUtility::ObjcSharedPtr<TSTTableDataObject>,unsigned int>,TSTTableDataObjectHasher,TSTTableDataObjectEqual,true>,std::__unordered_map_equal<SFUtility::ObjcSharedPtr<TSTTableDataObject>,std::__hash_value_type<SFUtility::ObjcSharedPtr<TSTTableDataObject>,unsigned int>,TSTTableDataObjectEqual,TSTTableDataObjectHasher,true>,std::allocator<std::__hash_value_type<SFUtility::ObjcSharedPtr<TSTTableDataObject>,unsigned int>>>::__emplace_unique_key_args<SFUtility::ObjcSharedPtr<TSTTableDataObject>,std::pair<SFUtility::ObjcSharedPtr<TSTTableDataObject> const,unsigned int>>((uint64_t)mMap, &v12, (uint64_t)&v12);

}

- (void)removeKeyForObject:(id)a3
{
  _QWORD *mMap;
  id v4;
  id v5;

  mMap = self->mMap;
  v5 = a3;
  v4 = a3;
  std::__hash_table<std::__hash_value_type<SFUtility::ObjcSharedPtr<TSTTableDataObject>,unsigned int>,std::__unordered_map_hasher<SFUtility::ObjcSharedPtr<TSTTableDataObject>,std::__hash_value_type<SFUtility::ObjcSharedPtr<TSTTableDataObject>,unsigned int>,TSTTableDataObjectHasher,TSTTableDataObjectEqual,true>,std::__unordered_map_equal<SFUtility::ObjcSharedPtr<TSTTableDataObject>,std::__hash_value_type<SFUtility::ObjcSharedPtr<TSTTableDataObject>,unsigned int>,TSTTableDataObjectEqual,TSTTableDataObjectHasher,true>,std::allocator<std::__hash_value_type<SFUtility::ObjcSharedPtr<TSTTableDataObject>,unsigned int>>>::__erase_unique<SFUtility::ObjcSharedPtr<TSTTableDataObject>>(mMap, &v5);

}

- (void)removeAllKeys
{
  std::__hash_table<std::__hash_value_type<SFUtility::ObjcSharedPtr<TSTTableDataObject>,unsigned int>,std::__unordered_map_hasher<SFUtility::ObjcSharedPtr<TSTTableDataObject>,std::__hash_value_type<SFUtility::ObjcSharedPtr<TSTTableDataObject>,unsigned int>,TSTTableDataObjectHasher,TSTTableDataObjectEqual,true>,std::__unordered_map_equal<SFUtility::ObjcSharedPtr<TSTTableDataObject>,std::__hash_value_type<SFUtility::ObjcSharedPtr<TSTTableDataObject>,unsigned int>,TSTTableDataObjectEqual,TSTTableDataObjectHasher,true>,std::allocator<std::__hash_value_type<SFUtility::ObjcSharedPtr<TSTTableDataObject>,unsigned int>>>::clear((uint64_t)self->mMap);
}

- (unint64_t)count
{
  return *((_QWORD *)self->mMap + 3);
}

@end
