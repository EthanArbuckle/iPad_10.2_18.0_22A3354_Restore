@implementation EBReaderSheetState

- (id).cxx_construct
{
  *((_QWORD *)self + 5) = 0;
  *((_QWORD *)self + 4) = 0;
  *((_QWORD *)self + 3) = (char *)self + 32;
  return self;
}

- (EBReaderSheetState)initWithReaderState:(id)a3
{
  id v5;
  EBReaderSheetState *v6;
  EBReaderSheetState *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EBReaderSheetState;
  v6 = -[EBReaderSheetState init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->mReaderState, a3);
    v7->mChartIndex = 0;
  }

  return v7;
}

- (id)readerState
{
  return self->mReaderState;
}

- (void)setEDSheet:(id)a3
{
  objc_storeStrong((id *)&self->mEDSheet, a3);
}

- (void)xlReader
{
  return -[EBReaderState xlReader](self->mReaderState, "xlReader");
}

- (id)edSheet
{
  return self->mEDSheet;
}

- (id)resources
{
  return -[EBState resources](self->mReaderState, "resources");
}

- (void).cxx_destruct
{
  std::__tree<TSUFlushableObjectInfo *,TSUFlushableObjectInfoPointerFlushingOrderLess,std::allocator<TSUFlushableObjectInfo *>>::destroy((uint64_t)&self->mSharedFormulas, (_QWORD *)self->mSharedFormulas.__tree_.__pair1_.__value_.__left_);
  objc_storeStrong((id *)&self->mEDSheet, 0);
  objc_storeStrong((id *)&self->mReaderState, 0);
}

- (void)setSharedFormulaIndex:(unint64_t)a3 forRowCol:(int)a4
{
  int v4;
  int *v5;

  v4 = a4;
  v5 = &v4;
  std::__tree<std::__value_type<int,unsigned long>,std::__map_value_compare<int,std::__value_type<int,unsigned long>,std::less<int>,true>,std::allocator<std::__value_type<int,unsigned long>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>((uint64_t **)&self->mSharedFormulas, &v4, (uint64_t)&std::piecewise_construct, &v5)[5] = (uint64_t *)a3;
}

- (unint64_t)sharedFormulaIndexForRowCol:(int)a3
{
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<int, unsigned long>, void *>>> *p_pair1;
  char *v4;
  char *left;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<int, unsigned long>, void *>>> *v6;
  int v7;
  BOOL v8;
  void **v9;

  left = (char *)self->mSharedFormulas.__tree_.__pair1_.__value_.__left_;
  p_pair1 = &self->mSharedFormulas.__tree_.__pair1_;
  v4 = left;
  if (!left)
    return -1;
  v6 = p_pair1;
  do
  {
    v7 = *((_DWORD *)v4 + 8);
    v8 = v7 < a3;
    if (v7 >= a3)
      v9 = (void **)v4;
    else
      v9 = (void **)(v4 + 8);
    if (!v8)
      v6 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<int, unsigned long>, void *>>> *)v4;
    v4 = (char *)*v9;
  }
  while (*v9);
  if (v6 != p_pair1 && SLODWORD(v6[4].__value_.__left_) <= a3)
    return (unint64_t)v6[5].__value_.__left_;
  else
    return -1;
}

- (id)workbook
{
  return -[EBState workbook](self->mReaderState, "workbook");
}

- (unint64_t)nextChartIndex
{
  unint64_t mChartIndex;

  mChartIndex = self->mChartIndex;
  self->mChartIndex = mChartIndex + 1;
  return mChartIndex;
}

- (void)reportWorksheetWarning:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (self->mEDSheet)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[EDSheet worksheetWarnings](self->mEDSheet, "worksheetWarnings");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addWarning:", v5);

    }
  }

}

@end
