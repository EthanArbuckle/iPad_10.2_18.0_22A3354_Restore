@implementation TSTCellRegionRowMajorIterator

- (TSTCellRegionRowMajorIterator)initWithCellRegion:(id)a3
{
  TSTCellRegionRowMajorIterator *v4;
  TSTCellRegionRowMajorIterator *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TSTCellRegionRowMajorIterator;
  v4 = -[TSTCellRegionRowMajorIterator init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    objc_msgSend(a3, "fillCellRangeRowMajorSet:leftToRight:", &v4->mCellRangeSet, 1);
    v5->mBoundingCellRange = ($6C2899CC353BE70625C5C4ACBB5C74E2)objc_msgSend(a3, "boundingCellRange");
    v5->mCellID = *($5CFCD363C99B2F51819B67AD7AD2E060 *)((char *)v5->mCellRangeSet.__tree_.__begin_node_ + 26);
  }
  return v5;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)TSTCellRegionRowMajorIterator;
  -[TSTCellRegionRowMajorIterator dealloc](&v2, sel_dealloc);
}

- ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)getNext
{
  $5CFCD363C99B2F51819B67AD7AD2E060 mCellID;
  uint64_t **p_mCellRangeSet;
  uint64_t *begin_node;
  uint64_t v6;
  uint64_t v8;

  mCellID = self->mCellID;
  if (self->mCellID.row != 0xFFFF && (*(_QWORD *)&mCellID.row & 0xFF0000) != 0xFF0000)
  {
    p_mCellRangeSet = (uint64_t **)&self->mCellRangeSet;
    begin_node = (uint64_t *)self->mCellRangeSet.__tree_.__begin_node_;
    self->mCellID.column = mCellID.column + 1;
    v6 = *(uint64_t *)((char *)begin_node + 26);
    if ((mCellID.column + 1) > (BYTE4(v6) + BYTE2(v6) - 1))
    {
      v8 = *(uint64_t *)((char *)begin_node + 26);
      std::__tree<std::__value_type<unsigned short,EQKit::Config::Operator::Form>,std::__map_value_compare<unsigned short,std::__value_type<unsigned short,EQKit::Config::Operator::Form>,std::less<unsigned short>,true>,std::allocator<std::__value_type<unsigned short,EQKit::Config::Operator::Form>>>::__remove_node_pointer((uint64_t **)&self->mCellRangeSet, begin_node);
      operator delete(begin_node);
      HIWORD(v8) = HIWORD(v6) - 1;
      LOWORD(v8) = v6 + 1;
      if (HIWORD(v6) != 1)
        std::__tree<TSUColumnRowRect,TSTCellRangeRowMajorLess,std::allocator<TSUColumnRowRect>>::__emplace_unique_key_args<TSUColumnRowRect,TSUColumnRowRect const&>(p_mCellRangeSet, (unsigned __int16 *)&v8, &v8);
      self->mCellID = *($5CFCD363C99B2F51819B67AD7AD2E060 *)((char *)self->mCellRangeSet.__tree_.__begin_node_ + 26);
    }
  }
  return *($2F2D2FE54C0B9D2AA4EBD8788136C7D0 *)&mCellID;
}

- (void)terminate
{
  uint64_t *begin_node;

  if (self->mCellRangeSet.__tree_.__pair3_.__value_ >= 2)
  {
    do
    {
      begin_node = (uint64_t *)self->mCellRangeSet.__tree_.__begin_node_;
      std::__tree<std::__value_type<unsigned short,EQKit::Config::Operator::Form>,std::__map_value_compare<unsigned short,std::__value_type<unsigned short,EQKit::Config::Operator::Form>,std::less<unsigned short>,true>,std::allocator<std::__value_type<unsigned short,EQKit::Config::Operator::Form>>>::__remove_node_pointer((uint64_t **)&self->mCellRangeSet, begin_node);
      operator delete(begin_node);
    }
    while (self->mCellRangeSet.__tree_.__pair3_.__value_ > 1);
  }
  self->mCellID = ($5CFCD363C99B2F51819B67AD7AD2E060)0xFFFFFF;
}

- (void).cxx_destruct
{
  std::__tree<std::__value_type<std::pair<unsigned short,EQKit::Config::Operator::Form>,EQKit::Config::Operator::Dictionary::Entry>,std::__map_value_compare<std::pair<unsigned short,EQKit::Config::Operator::Form>,std::__value_type<std::pair<unsigned short,EQKit::Config::Operator::Form>,EQKit::Config::Operator::Dictionary::Entry>,std::less<std::pair<unsigned short,EQKit::Config::Operator::Form>>,true>,std::allocator<std::__value_type<std::pair<unsigned short,EQKit::Config::Operator::Form>,EQKit::Config::Operator::Dictionary::Entry>>>::destroy((uint64_t)&self->mCellRangeSet, (_QWORD *)self->mCellRangeSet.__tree_.__pair1_.__value_.__left_);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 1) = (char *)self + 16;
  return self;
}

@end
