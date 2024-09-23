@implementation CRTableStructureRecognizerResult

- (vector<CRTableStructureRow,)rows
{
  CRTableStructureRow *end;
  CRTableStructureRow *begin;
  int64_t v6;
  CRTableStructureRow *v7;

  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  begin = self[1].__begin_;
  end = self[1].__end_;
  v6 = end - begin;
  if (end != begin)
  {
    std::vector<CRTableStructureRow>::__vallocate[abi:ne180100](retstr, v6 >> 5);
    v7 = retstr->__end_;
    self = (vector<CRTableStructureRow, std::allocator<CRTableStructureRow>> *)memmove(v7, begin, v6);
    retstr->__end_ = (CRTableStructureRow *)((char *)v7 + 32 * (v6 >> 5));
  }
  return self;
}

- (void)setRows:()vector<CRTableStructureRow
{
  vector<CRTableStructureRow, std::allocator<CRTableStructureRow>> *p_rows;
  CRTableStructureRow *begin;
  CRTableStructureRow *end;
  int64_t v7;
  unint64_t v8;
  uint64_t value;
  CRTableStructureRow *v10;
  uint64_t v11;
  unint64_t v12;
  CRTableStructureRow **p_end;
  CRTableStructureRow *v14;
  CRTableStructureRow *v15;
  unint64_t v16;
  CRTableStructureRow *v17;
  CRTableStructureRow *v18;
  CRTableStructureRow *v19;

  p_rows = &self->_rows;
  if (&self->_rows != a3)
  {
    begin = a3->__begin_;
    end = a3->__end_;
    v7 = end - a3->__begin_;
    v8 = v7 >> 5;
    value = (uint64_t)self->_rows.__end_cap_.__value_;
    v10 = self->_rows.__begin_;
    if (v7 >> 5 <= (unint64_t)((value - (uint64_t)v10) >> 5))
    {
      p_end = &self->_rows.__end_;
      v15 = self->_rows.__end_;
      v16 = (v15 - v10) >> 5;
      if (v16 < v8)
      {
        v17 = (CRTableStructureRow *)((char *)begin + 32 * v16);
        if (v15 != v10)
        {
          memmove(self->_rows.__begin_, begin, v15 - v10);
          v10 = *p_end;
        }
        v7 = end - v17;
        if (end == v17)
          goto LABEL_20;
        v18 = v10;
        v19 = v17;
        goto LABEL_19;
      }
    }
    else
    {
      if (v10)
      {
        self->_rows.__end_ = v10;
        operator delete(v10);
        value = 0;
        p_rows->__begin_ = 0;
        p_rows->__end_ = 0;
        p_rows->__end_cap_.__value_ = 0;
      }
      if (v7 < 0)
        std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
      v11 = value >> 4;
      if (value >> 4 <= v8)
        v11 = v7 >> 5;
      if ((unint64_t)value >= 0x7FFFFFFFFFFFFFE0)
        v12 = 0x7FFFFFFFFFFFFFFLL;
      else
        v12 = v11;
      std::vector<CRTableStructureRow>::__vallocate[abi:ne180100](p_rows, v12);
      v14 = self->_rows.__end_;
      p_end = &self->_rows.__end_;
      v10 = v14;
    }
    if (end == begin)
    {
LABEL_20:
      *p_end = (CRTableStructureRow *)((char *)v10 + v7);
      return;
    }
    v18 = v10;
    v19 = begin;
LABEL_19:
    memmove(v18, v19, v7);
    goto LABEL_20;
  }
}

- (vector<CRTableStructureColumn,)columns
{
  CRTableStructureColumn *end;
  CRTableStructureColumn *begin;
  int64_t v6;
  CRTableStructureColumn *v7;

  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  begin = self[2].__begin_;
  end = self[2].__end_;
  v6 = end - begin;
  if (end != begin)
  {
    std::vector<CRTableStructureRow>::__vallocate[abi:ne180100](retstr, v6 >> 5);
    v7 = retstr->__end_;
    self = (vector<CRTableStructureColumn, std::allocator<CRTableStructureColumn>> *)memmove(v7, begin, v6);
    retstr->__end_ = (CRTableStructureColumn *)((char *)v7 + 32 * (v6 >> 5));
  }
  return self;
}

- (void)setColumns:()vector<CRTableStructureColumn
{
  vector<CRTableStructureColumn, std::allocator<CRTableStructureColumn>> *p_columns;
  CRTableStructureColumn *begin;
  CRTableStructureColumn *end;
  int64_t v7;
  unint64_t v8;
  uint64_t value;
  CRTableStructureColumn *v10;
  uint64_t v11;
  unint64_t v12;
  CRTableStructureColumn **p_end;
  CRTableStructureColumn *v14;
  CRTableStructureColumn *v15;
  unint64_t v16;
  CRTableStructureColumn *v17;
  CRTableStructureColumn *v18;
  CRTableStructureColumn *v19;

  p_columns = &self->_columns;
  if (&self->_columns != a3)
  {
    begin = a3->__begin_;
    end = a3->__end_;
    v7 = end - a3->__begin_;
    v8 = v7 >> 5;
    value = (uint64_t)self->_columns.__end_cap_.__value_;
    v10 = self->_columns.__begin_;
    if (v7 >> 5 <= (unint64_t)((value - (uint64_t)v10) >> 5))
    {
      p_end = &self->_columns.__end_;
      v15 = self->_columns.__end_;
      v16 = (v15 - v10) >> 5;
      if (v16 < v8)
      {
        v17 = (CRTableStructureColumn *)((char *)begin + 32 * v16);
        if (v15 != v10)
        {
          memmove(self->_columns.__begin_, begin, v15 - v10);
          v10 = *p_end;
        }
        v7 = end - v17;
        if (end == v17)
          goto LABEL_20;
        v18 = v10;
        v19 = v17;
        goto LABEL_19;
      }
    }
    else
    {
      if (v10)
      {
        self->_columns.__end_ = v10;
        operator delete(v10);
        value = 0;
        p_columns->__begin_ = 0;
        p_columns->__end_ = 0;
        p_columns->__end_cap_.__value_ = 0;
      }
      if (v7 < 0)
        std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
      v11 = value >> 4;
      if (value >> 4 <= v8)
        v11 = v7 >> 5;
      if ((unint64_t)value >= 0x7FFFFFFFFFFFFFE0)
        v12 = 0x7FFFFFFFFFFFFFFLL;
      else
        v12 = v11;
      std::vector<CRTableStructureRow>::__vallocate[abi:ne180100](p_columns, v12);
      v14 = self->_columns.__end_;
      p_end = &self->_columns.__end_;
      v10 = v14;
    }
    if (end == begin)
    {
LABEL_20:
      *p_end = (CRTableStructureColumn *)((char *)v10 + v7);
      return;
    }
    v18 = v10;
    v19 = begin;
LABEL_19:
    memmove(v18, v19, v7);
    goto LABEL_20;
  }
}

- (vector<CRTableStructureMerge,)merges
{
  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  return (vector<CRTableStructureMerge, std::allocator<CRTableStructureMerge>> *)std::vector<CRTableStructureMerge>::__init_with_size[abi:ne180100]<CRTableStructureMerge*,CRTableStructureMerge*>(retstr, self->_merges.__begin_, (uint64_t)self->_merges.__end_, (self->_merges.__end_- self->_merges.__begin_) >> 5);
}

- (void)setMerges:()vector<CRTableStructureMerge
{
  char *p_merges;

  p_merges = (char *)&self->_merges;
  if (p_merges != (char *)a3)
    std::vector<CRTableStructureMerge>::__assign_with_size[abi:ne180100]<CRTableStructureMerge*,CRTableStructureMerge*>(p_merges, (char *)a3->__begin_, (uint64_t)a3->__end_, (a3->__end_ - a3->__begin_) >> 5);
}

- (vector<std::vector<unsigned)textLineIndexesForCells
{
  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  return (vector<std::vector<unsigned long>, std::allocator<std::vector<unsigned long>>> *)std::vector<std::vector<unsigned long>>::__init_with_size[abi:ne180100]<std::vector<unsigned long>*,std::vector<unsigned long>*>(retstr, (uint64_t)self->_textLineIndexesForCells.__begin_, (uint64_t)self->_textLineIndexesForCells.__end_, 0xAAAAAAAAAAAAAAABLL* (((char *)self->_textLineIndexesForCells.__end_- (char *)self->_textLineIndexesForCells.__begin_) >> 3));
}

- (void)setTextLineIndexesForCells:(vector<std:(std::allocator<std::vector<unsigned long>>> *)a3 :vector<unsigned)long>
{
  vector<std::vector<unsigned long>, std::allocator<std::vector<unsigned long>>> *p_textLineIndexesForCells;
  void *end;
  void *begin;
  uint64_t value;
  __compressed_pair<std::vector<unsigned long> *, std::allocator<std::vector<unsigned long>>> *p_end_cap;
  unint64_t v9;
  char *v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  char *v16;
  char *v17;
  char *v18;
  void *v19;
  void *v20;

  p_textLineIndexesForCells = &self->_textLineIndexesForCells;
  if (&self->_textLineIndexesForCells != a3)
  {
    begin = a3->__begin_;
    end = a3->__end_;
    p_end_cap = &self->_textLineIndexesForCells.__end_cap_;
    value = (uint64_t)self->_textLineIndexesForCells.__end_cap_.__value_;
    v9 = 0xAAAAAAAAAAAAAAABLL * ((int64_t)((uint64_t)end - (unint64_t)a3->__begin_) >> 3);
    v10 = (char *)self->_textLineIndexesForCells.__begin_;
    if (0xAAAAAAAAAAAAAAABLL * ((value - (uint64_t)v10) >> 3) < v9)
    {
      if (v10)
      {
        std::vector<std::vector<float>>::__clear[abi:ne180100]((uint64_t *)&self->_textLineIndexesForCells);
        operator delete(p_textLineIndexesForCells->__begin_);
        value = 0;
        p_textLineIndexesForCells->__begin_ = 0;
        p_textLineIndexesForCells->__end_ = 0;
        p_textLineIndexesForCells->__end_cap_.__value_ = 0;
      }
      if (v9 > 0xAAAAAAAAAAAAAAALL)
        std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
      v11 = 0xAAAAAAAAAAAAAAABLL * (value >> 3);
      v12 = 2 * v11;
      if (2 * v11 <= v9)
        v12 = v9;
      if (v11 >= 0x555555555555555)
        v13 = 0xAAAAAAAAAAAAAAALL;
      else
        v13 = v12;
      std::vector<std::vector<unsigned long>>::__vallocate[abi:ne180100](p_textLineIndexesForCells, v13);
      v14 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::vector<unsigned long>>,std::vector<unsigned long>*,std::vector<unsigned long>*,std::vector<unsigned long>*>((uint64_t)p_end_cap, (uint64_t)begin, (uint64_t)end, (_QWORD *)self->_textLineIndexesForCells.__end_);
      goto LABEL_14;
    }
    if (0xAAAAAAAAAAAAAAABLL * (((char *)self->_textLineIndexesForCells.__end_ - (char *)v10) >> 3) < v9)
    {
      v15 = (uint64_t)begin + 8 * (((char *)self->_textLineIndexesForCells.__end_ - (char *)v10) >> 3);
      std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<std::vector<unsigned long> *,std::vector<unsigned long> *,std::vector<unsigned long> *>((uint64_t)begin, v15, v10);
      v14 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::vector<unsigned long>>,std::vector<unsigned long>*,std::vector<unsigned long>*,std::vector<unsigned long>*>((uint64_t)p_end_cap, v15, (uint64_t)end, (_QWORD *)self->_textLineIndexesForCells.__end_);
LABEL_14:
      self->_textLineIndexesForCells.__end_ = v14;
      return;
    }
    v16 = std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<std::vector<unsigned long> *,std::vector<unsigned long> *,std::vector<unsigned long> *>((uint64_t)begin, (uint64_t)end, v10);
    v17 = (char *)self->_textLineIndexesForCells.__end_;
    if (v17 != v16)
    {
      v18 = (char *)self->_textLineIndexesForCells.__end_;
      do
      {
        v20 = (void *)*((_QWORD *)v18 - 3);
        v18 -= 24;
        v19 = v20;
        if (v20)
        {
          *((_QWORD *)v17 - 2) = v19;
          operator delete(v19);
        }
        v17 = v18;
      }
      while (v18 != v16);
    }
    self->_textLineIndexesForCells.__end_ = v16;
  }
}

- (vector<CGRect,)rectForCells
{
  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  return (vector<CGRect, std::allocator<CGRect>> *)std::vector<CGRect>::__init_with_size[abi:ne180100]<CGRect*,CGRect*>(retstr, self->_rectForCells.__begin_, (uint64_t)self->_rectForCells.__end_, self->_rectForCells.__end_ - self->_rectForCells.__begin_);
}

- (void)setRectForCells:()vector<CGRect
{
  vector<CGRect, std::allocator<CGRect>> *p_rectForCells;
  CGRect *begin;
  CGRect *end;
  int64_t v7;
  unint64_t v8;
  uint64_t value;
  CGRect *v10;
  uint64_t v11;
  unint64_t v12;
  CGRect **p_end;
  CGRect *v14;
  CGRect *v15;
  unint64_t v16;
  CGRect *v17;
  CGRect *v18;
  CGRect *v19;

  p_rectForCells = &self->_rectForCells;
  if (&self->_rectForCells != a3)
  {
    begin = a3->__begin_;
    end = a3->__end_;
    v7 = (char *)end - (char *)a3->__begin_;
    v8 = v7 >> 5;
    value = (uint64_t)self->_rectForCells.__end_cap_.__value_;
    v10 = self->_rectForCells.__begin_;
    if (v7 >> 5 <= (unint64_t)((value - (uint64_t)v10) >> 5))
    {
      p_end = &self->_rectForCells.__end_;
      v15 = self->_rectForCells.__end_;
      v16 = v15 - v10;
      if (v16 < v8)
      {
        v17 = &begin[v16];
        if (v15 != v10)
        {
          memmove(self->_rectForCells.__begin_, begin, (char *)v15 - (char *)v10);
          v10 = *p_end;
        }
        v7 = (char *)end - (char *)v17;
        if (end == v17)
          goto LABEL_20;
        v18 = v10;
        v19 = v17;
        goto LABEL_19;
      }
    }
    else
    {
      if (v10)
      {
        self->_rectForCells.__end_ = v10;
        operator delete(v10);
        value = 0;
        p_rectForCells->__begin_ = 0;
        p_rectForCells->__end_ = 0;
        p_rectForCells->__end_cap_.__value_ = 0;
      }
      if (v7 < 0)
        std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
      v11 = value >> 4;
      if (value >> 4 <= v8)
        v11 = v7 >> 5;
      if ((unint64_t)value >= 0x7FFFFFFFFFFFFFE0)
        v12 = 0x7FFFFFFFFFFFFFFLL;
      else
        v12 = v11;
      std::vector<CGRect>::__vallocate[abi:ne180100](p_rectForCells, v12);
      v14 = self->_rectForCells.__end_;
      p_end = &self->_rectForCells.__end_;
      v10 = v14;
    }
    if (end == begin)
    {
LABEL_20:
      *p_end = (CGRect *)((char *)v10 + v7);
      return;
    }
    v18 = v10;
    v19 = begin;
LABEL_19:
    memmove(v18, v19, v7);
    goto LABEL_20;
  }
}

- (vector<_NSRange,)rowsForCells
{
  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  return (vector<_NSRange, std::allocator<_NSRange>> *)std::vector<_NSRange>::__init_with_size[abi:ne180100]<_NSRange*,_NSRange*>(retstr, self->_rowsForCells.__begin_, (uint64_t)self->_rowsForCells.__end_, self->_rowsForCells.__end_ - self->_rowsForCells.__begin_);
}

- (void)setRowsForCells:()vector<_NSRange
{
  char *p_rowsForCells;

  p_rowsForCells = (char *)&self->_rowsForCells;
  if (p_rowsForCells != (char *)a3)
    std::vector<_NSRange>::__assign_with_size[abi:ne180100]<_NSRange*,_NSRange*>(p_rowsForCells, (char *)a3->__begin_, (uint64_t)a3->__end_, a3->__end_ - a3->__begin_);
}

- (vector<_NSRange,)columnsForCells
{
  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  return (vector<_NSRange, std::allocator<_NSRange>> *)std::vector<_NSRange>::__init_with_size[abi:ne180100]<_NSRange*,_NSRange*>(retstr, self->_columnsForCells.__begin_, (uint64_t)self->_columnsForCells.__end_, self->_columnsForCells.__end_ - self->_columnsForCells.__begin_);
}

- (void)setColumnsForCells:()vector<_NSRange
{
  char *p_columnsForCells;

  p_columnsForCells = (char *)&self->_columnsForCells;
  if (p_columnsForCells != (char *)a3)
    std::vector<_NSRange>::__assign_with_size[abi:ne180100]<_NSRange*,_NSRange*>(p_columnsForCells, (char *)a3->__begin_, (uint64_t)a3->__end_, a3->__end_ - a3->__begin_);
}

- (CRNormalizedQuad)tableQuad
{
  return self->_tableQuad;
}

- (void)setTableQuad:(id)a3
{
  objc_storeStrong((id *)&self->_tableQuad, a3);
}

- (CRTableStructureRecognizerResultProgram)program
{
  return (CRTableStructureRecognizerResultProgram *)objc_getProperty(self, a2, 16, 1);
}

- (void)setProgram:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (CRTableStructureRecognizerResultParsed)parsedProgram
{
  *(_OWORD *)&retstr->numRows = *(_OWORD *)&self->_parsedProgram.numRows;
  retstr->valid = self->_parsedProgram.valid;
  retstr->rowHeights.__begin_ = 0;
  retstr->rowHeights.__end_ = 0;
  retstr->rowHeights.__end_cap_.__value_ = 0;
  std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(&retstr->rowHeights.__begin_, self->_parsedProgram.rowHeights.__begin_, (uint64_t)self->_parsedProgram.rowHeights.__end_, self->_parsedProgram.rowHeights.__end_ - self->_parsedProgram.rowHeights.__begin_);
  retstr->columnWidths.__begin_ = 0;
  retstr->columnWidths.__end_ = 0;
  retstr->columnWidths.__end_cap_.__value_ = 0;
  std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(&retstr->columnWidths.__begin_, self->_parsedProgram.columnWidths.__begin_, (uint64_t)self->_parsedProgram.columnWidths.__end_, self->_parsedProgram.columnWidths.__end_ - self->_parsedProgram.columnWidths.__begin_);
  retstr->merges.__begin_ = 0;
  retstr->merges.__end_ = 0;
  retstr->merges.__end_cap_.__value_ = 0;
  return (CRTableStructureRecognizerResultParsed *)std::vector<CRTableStructureMerge>::__init_with_size[abi:ne180100]<CRTableStructureMerge*,CRTableStructureMerge*>(&retstr->merges.__begin_, self->_parsedProgram.merges.__begin_, (uint64_t)self->_parsedProgram.merges.__end_, (self->_parsedProgram.merges.__end_- self->_parsedProgram.merges.__begin_) >> 5);
}

- (void)setParsedProgram:(CRTableStructureRecognizerResultParsed *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->numRows;
  self->_parsedProgram.valid = a3->valid;
  *(_OWORD *)&self->_parsedProgram.numRows = v3;
  if (&self->_parsedProgram != a3)
  {
    std::vector<PixelPosition>::__assign_with_size[abi:ne180100]<PixelPosition*,PixelPosition*>((char *)&self->_parsedProgram.rowHeights, (char *)a3->rowHeights.__begin_, (uint64_t)a3->rowHeights.__end_, a3->rowHeights.__end_ - a3->rowHeights.__begin_);
    std::vector<PixelPosition>::__assign_with_size[abi:ne180100]<PixelPosition*,PixelPosition*>((char *)&self->_parsedProgram.columnWidths, (char *)a3->columnWidths.__begin_, (uint64_t)a3->columnWidths.__end_, a3->columnWidths.__end_ - a3->columnWidths.__begin_);
    std::vector<CRTableStructureMerge>::__assign_with_size[abi:ne180100]<CRTableStructureMerge*,CRTableStructureMerge*>((char *)&self->_parsedProgram.merges, (char *)a3->merges.__begin_, (uint64_t)a3->merges.__end_, (a3->merges.__end_ - a3->merges.__begin_) >> 5);
  }
}

- (void).cxx_destruct
{
  CRTableStructureMerge *begin;
  double *v4;
  double *v5;
  _NSRange *v6;
  _NSRange *v7;
  CGRect *v8;
  CRTableStructureMerge *v9;
  CRTableStructureColumn *v10;
  CRTableStructureRow *v11;
  vector<std::vector<unsigned long>, std::allocator<std::vector<unsigned long>>> *p_textLineIndexesForCells;

  begin = self->_parsedProgram.merges.__begin_;
  if (begin)
  {
    self->_parsedProgram.merges.__end_ = begin;
    operator delete(begin);
  }
  v4 = self->_parsedProgram.columnWidths.__begin_;
  if (v4)
  {
    self->_parsedProgram.columnWidths.__end_ = v4;
    operator delete(v4);
  }
  v5 = self->_parsedProgram.rowHeights.__begin_;
  if (v5)
  {
    self->_parsedProgram.rowHeights.__end_ = v5;
    operator delete(v5);
  }
  v6 = self->_columnsForCells.__begin_;
  if (v6)
  {
    self->_columnsForCells.__end_ = v6;
    operator delete(v6);
  }
  v7 = self->_rowsForCells.__begin_;
  if (v7)
  {
    self->_rowsForCells.__end_ = v7;
    operator delete(v7);
  }
  v8 = self->_rectForCells.__begin_;
  if (v8)
  {
    self->_rectForCells.__end_ = v8;
    operator delete(v8);
  }
  p_textLineIndexesForCells = &self->_textLineIndexesForCells;
  std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_textLineIndexesForCells);
  v9 = self->_merges.__begin_;
  if (v9)
  {
    self->_merges.__end_ = v9;
    operator delete(v9);
  }
  v10 = self->_columns.__begin_;
  if (v10)
  {
    self->_columns.__end_ = v10;
    operator delete(v10);
  }
  v11 = self->_rows.__begin_;
  if (v11)
  {
    self->_rows.__end_ = v11;
    operator delete(v11);
  }
  objc_storeStrong((id *)&self->_program, 0);
  objc_storeStrong((id *)&self->_tableQuad, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 35) = 0;
  *(_OWORD *)((char *)self + 248) = 0u;
  *(_OWORD *)((char *)self + 232) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 72) = 0u;
  *(_OWORD *)((char *)self + 88) = 0u;
  *(_OWORD *)((char *)self + 104) = 0u;
  *(_OWORD *)((char *)self + 120) = 0u;
  *(_OWORD *)((char *)self + 136) = 0u;
  *(_OWORD *)((char *)self + 152) = 0u;
  *(_OWORD *)((char *)self + 168) = 0u;
  *(_OWORD *)((char *)self + 184) = 0u;
  *(_OWORD *)((char *)self + 193) = 0u;
  *(_OWORD *)((char *)self + 216) = 0u;
  *(_OWORD *)((char *)self + 264) = 0u;
  return self;
}

@end
