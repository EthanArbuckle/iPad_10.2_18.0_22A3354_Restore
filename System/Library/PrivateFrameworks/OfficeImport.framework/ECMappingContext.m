@implementation ECMappingContext

- (ECMappingContext)init
{
  ECMappingContext *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *mSheetNameToMappedIndex;
  NSMutableArray *v5;
  NSMutableArray *mMappingInfos;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ECMappingContext;
  v2 = -[ECMappingContext init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    mSheetNameToMappedIndex = v2->mSheetNameToMappedIndex;
    v2->mSheetNameToMappedIndex = v3;

    v2->mObjectToMappingInfo = CFDictionaryCreateMutable(0, 64, 0, MEMORY[0x24BDBD6B0]);
    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    mMappingInfos = v2->mMappingInfos;
    v2->mMappingInfos = v5;

  }
  return v2;
}

+ (id)mappingContext
{
  return objc_alloc_init((Class)objc_opt_class());
}

- (void)dealloc
{
  __CFDictionary *mObjectToMappingInfo;
  objc_super v4;

  mObjectToMappingInfo = self->mObjectToMappingInfo;
  if (mObjectToMappingInfo)
    CFRelease(mObjectToMappingInfo);
  v4.receiver = self;
  v4.super_class = (Class)ECMappingContext;
  -[ECMappingContext dealloc](&v4, sel_dealloc);
}

- (void)mappedSheetNames
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  OcText v12;

  v3 = operator new();
  *(_QWORD *)(v3 + 8) = 0;
  *(_QWORD *)(v3 + 16) = 0;
  *(_QWORD *)v3 = 0;
  v4 = -[NSMutableArray count](self->mMappingInfos, "count");
  if (v4)
  {
    v5 = v4;
    for (i = 0; i != v5; ++i)
    {
      -[NSMutableArray objectAtIndex:](self->mMappingInfos, "objectAtIndex:", i);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "sheetName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        OcText::OcText(&v12);
        objc_msgSend(v8, "copyToOcText:", &v12);
        v9 = *(_QWORD *)(v3 + 8);
        if (v9 >= *(_QWORD *)(v3 + 16))
        {
          v10 = std::vector<OcText,ChAllocator<OcText>>::__push_back_slow_path<OcText const&>((uint64_t *)v3, &v12);
        }
        else
        {
          OcText::OcText(*(OcText **)(v3 + 8), &v12);
          v10 = v9 + 48;
          *(_QWORD *)(v3 + 8) = v9 + 48;
        }
        *(_QWORD *)(v3 + 8) = v10;
        OcText::~OcText(&v12);
      }

    }
  }
  return (void *)v3;
}

- (unint64_t)mappedSheetIndexForSheetIndex:(unint64_t)a3
{
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, unsigned long>, void *>>> *p_pair1;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, unsigned long>, void *>>> *v4;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, unsigned long>, void *>>> *left;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, unsigned long>, void *>>> *v6;
  unint64_t v7;
  BOOL v8;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, unsigned long>, void *>>> **v9;

  left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, unsigned long>, void *>>> *)self->mIndexToMappedIndex.__tree_.__pair1_.__value_.__left_;
  p_pair1 = &self->mIndexToMappedIndex.__tree_.__pair1_;
  v4 = left;
  if (!left)
    return -1;
  v6 = p_pair1;
  do
  {
    v7 = (unint64_t)v4[4].__value_.__left_;
    v8 = v7 >= a3;
    if (v7 >= a3)
      v9 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, unsigned long>, void *>>> **)v4;
    else
      v9 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, unsigned long>, void *>>> **)&v4[1];
    if (v8)
      v6 = v4;
    v4 = *v9;
  }
  while (*v9);
  if (v6 != p_pair1 && v6[4].__value_.__left_ <= (void *)a3)
    return (unint64_t)v6[5].__value_.__left_;
  else
    return -1;
}

- (unint64_t)mappedSheetIndexForSheetName:(id)a3
{
  void *v3;
  void *v4;
  unint64_t v5;

  -[NSMutableDictionary objectForKey:](self->mSheetNameToMappedIndex, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "unsignedIntegerValue");
  else
    v5 = -1;

  return v5;
}

- (id)mappingInfoForObject:(id)a3
{
  CFDictionaryGetValue(self->mObjectToMappingInfo, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (unint64_t)mappingInfoCount
{
  return -[NSMutableArray count](self->mMappingInfos, "count");
}

- (id)mappingInfoAtIndex:(unint64_t)a3
{
  void *v5;

  if (-[ECMappingContext mappingInfoCount](self, "mappingInfoCount") >= a3)
  {
    -[NSMutableArray objectAtIndex:](self->mMappingInfos, "objectAtIndex:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mMappingInfos, 0);
  objc_storeStrong((id *)&self->mSheetNameToMappedIndex, 0);
  std::__tree<TSUFlushableObjectInfo *,TSUFlushableObjectInfoPointerFlushingOrderLess,std::allocator<TSUFlushableObjectInfo *>>::destroy((uint64_t)&self->mIndexToMappedIndex, (_QWORD *)self->mIndexToMappedIndex.__tree_.__pair1_.__value_.__left_);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 1) = (char *)self + 16;
  return self;
}

- (void)associateMappingInfo:(id)a3 withSheetName:(id)a4 andSheetIndex:(unint64_t)a5 andObject:(id)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  NSMutableDictionary *mSheetNameToMappedIndex;
  void *v15;
  unint64_t v16;
  unint64_t *v17;

  v10 = a3;
  v11 = a4;
  v16 = a5;
  v12 = a6;
  v13 = -[NSMutableArray count](self->mMappingInfos, "count");
  -[NSMutableArray addObject:](self->mMappingInfos, "addObject:", v10);
  if (a5 != -1)
  {
    v17 = &v16;
    std::__tree<std::__value_type<unsigned long,unsigned long>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,unsigned long>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,unsigned long>>>::__emplace_unique_key_args<unsigned long,std::piecewise_construct_t const&,std::tuple<unsigned long const&>,std::tuple<>>((uint64_t **)&self->mIndexToMappedIndex, &v16, (uint64_t)&std::piecewise_construct, (uint64_t **)&v17)[5] = v13;
  }
  if (v11 && objc_msgSend(v11, "length"))
  {
    mSheetNameToMappedIndex = self->mSheetNameToMappedIndex;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setValue:forKey:](mSheetNameToMappedIndex, "setValue:forKey:", v15, v11);

  }
  if (v12)
    CFDictionarySetValue(self->mObjectToMappingInfo, v12, v10);

}

@end
