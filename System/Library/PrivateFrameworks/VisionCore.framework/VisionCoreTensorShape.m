@implementation VisionCoreTensorShape

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  return self;
}

- (VisionCoreTensorShape)initWithImageChannels:(unint64_t)a3 width:(unint64_t)a4 height:(unint64_t)a5
{
  VisionCoreTensorShape *v8;
  VisionCoreTensorShape *v9;
  unint64_t *value;
  unint64_t *end;
  unint64_t *v12;
  unint64_t *begin;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  BOOL v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t *v20;
  unint64_t v21;
  unint64_t *v22;
  unint64_t *v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t *v29;
  unint64_t v30;
  unint64_t *v31;
  unint64_t *v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  unint64_t *v38;
  unint64_t v39;
  unint64_t *v40;
  unint64_t *v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  unint64_t *v47;
  unint64_t *v48;
  unint64_t v49;
  objc_super v51;

  v51.receiver = self;
  v51.super_class = (Class)VisionCoreTensorShape;
  v8 = -[VisionCoreTensorShape init](&v51, sel_init);
  v9 = v8;
  if (v8)
  {
    end = v8->_sizes.__end_;
    value = v8->_sizes.__end_cap_.__value_;
    if (end >= value)
    {
      begin = v8->_sizes.__begin_;
      v14 = end - begin;
      v15 = v14 + 1;
      if ((unint64_t)(v14 + 1) >> 61)
        std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
      v16 = (char *)value - (char *)begin;
      if (v16 >> 2 > v15)
        v15 = v16 >> 2;
      v17 = (unint64_t)v16 >= 0x7FFFFFFFFFFFFFF8;
      v18 = 0x1FFFFFFFFFFFFFFFLL;
      if (!v17)
        v18 = v15;
      if (v18)
      {
        v18 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v18);
        begin = v9->_sizes.__begin_;
        end = v9->_sizes.__end_;
      }
      else
      {
        v19 = 0;
      }
      v20 = (unint64_t *)(v18 + 8 * v14);
      value = (unint64_t *)(v18 + 8 * v19);
      *v20 = 1;
      v12 = v20 + 1;
      while (end != begin)
      {
        v21 = *--end;
        *--v20 = v21;
      }
      v9->_sizes.__begin_ = v20;
      v9->_sizes.__end_ = v12;
      v9->_sizes.__end_cap_.__value_ = value;
      if (begin)
      {
        operator delete(begin);
        value = v9->_sizes.__end_cap_.__value_;
      }
    }
    else
    {
      *end = 1;
      v12 = end + 1;
    }
    v9->_sizes.__end_ = v12;
    if (v12 >= value)
    {
      v23 = v9->_sizes.__begin_;
      v24 = v12 - v23;
      v25 = v24 + 1;
      if ((unint64_t)(v24 + 1) >> 61)
        goto LABEL_64;
      v26 = (char *)value - (char *)v23;
      if (v26 >> 2 > v25)
        v25 = v26 >> 2;
      v17 = (unint64_t)v26 >= 0x7FFFFFFFFFFFFFF8;
      v27 = 0x1FFFFFFFFFFFFFFFLL;
      if (!v17)
        v27 = v25;
      if (v27)
      {
        v27 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v27);
        v23 = v9->_sizes.__begin_;
        v12 = v9->_sizes.__end_;
      }
      else
      {
        v28 = 0;
      }
      v29 = (unint64_t *)(v27 + 8 * v24);
      value = (unint64_t *)(v27 + 8 * v28);
      *v29 = a3;
      v22 = v29 + 1;
      while (v12 != v23)
      {
        v30 = *--v12;
        *--v29 = v30;
      }
      v9->_sizes.__begin_ = v29;
      v9->_sizes.__end_ = v22;
      v9->_sizes.__end_cap_.__value_ = value;
      if (v23)
      {
        operator delete(v23);
        value = v9->_sizes.__end_cap_.__value_;
      }
    }
    else
    {
      *v12 = a3;
      v22 = v12 + 1;
    }
    v9->_sizes.__end_ = v22;
    if (v22 >= value)
    {
      v32 = v9->_sizes.__begin_;
      v33 = v22 - v32;
      v34 = v33 + 1;
      if ((unint64_t)(v33 + 1) >> 61)
        goto LABEL_64;
      v35 = (char *)value - (char *)v32;
      if (v35 >> 2 > v34)
        v34 = v35 >> 2;
      v17 = (unint64_t)v35 >= 0x7FFFFFFFFFFFFFF8;
      v36 = 0x1FFFFFFFFFFFFFFFLL;
      if (!v17)
        v36 = v34;
      if (v36)
      {
        v36 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v36);
        v32 = v9->_sizes.__begin_;
        v22 = v9->_sizes.__end_;
      }
      else
      {
        v37 = 0;
      }
      v38 = (unint64_t *)(v36 + 8 * v33);
      value = (unint64_t *)(v36 + 8 * v37);
      *v38 = a5;
      v31 = v38 + 1;
      while (v22 != v32)
      {
        v39 = *--v22;
        *--v38 = v39;
      }
      v9->_sizes.__begin_ = v38;
      v9->_sizes.__end_ = v31;
      v9->_sizes.__end_cap_.__value_ = value;
      if (v32)
      {
        operator delete(v32);
        value = v9->_sizes.__end_cap_.__value_;
      }
    }
    else
    {
      *v22 = a5;
      v31 = v22 + 1;
    }
    v9->_sizes.__end_ = v31;
    if (v31 < value)
    {
      *v31 = a4;
      v40 = v31 + 1;
LABEL_62:
      v9->_sizes.__end_ = v40;
      return v9;
    }
    v41 = v9->_sizes.__begin_;
    v42 = v31 - v41;
    v43 = v42 + 1;
    if (!((unint64_t)(v42 + 1) >> 61))
    {
      v44 = (char *)value - (char *)v41;
      if (v44 >> 2 > v43)
        v43 = v44 >> 2;
      v17 = (unint64_t)v44 >= 0x7FFFFFFFFFFFFFF8;
      v45 = 0x1FFFFFFFFFFFFFFFLL;
      if (!v17)
        v45 = v43;
      if (v45)
      {
        v45 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v45);
        v41 = v9->_sizes.__begin_;
        v31 = v9->_sizes.__end_;
      }
      else
      {
        v46 = 0;
      }
      v47 = (unint64_t *)(v45 + 8 * v42);
      v48 = (unint64_t *)(v45 + 8 * v46);
      *v47 = a4;
      v40 = v47 + 1;
      while (v31 != v41)
      {
        v49 = *--v31;
        *--v47 = v49;
      }
      v9->_sizes.__begin_ = v47;
      v9->_sizes.__end_ = v40;
      v9->_sizes.__end_cap_.__value_ = v48;
      if (v41)
        operator delete(v41);
      goto LABEL_62;
    }
LABEL_64:
    std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
  }
  return v9;
}

- (VisionCoreTensorShape)initWithBatchNumber:(unint64_t)a3 channels:(unint64_t)a4 height:(unint64_t)a5 width:(unint64_t)a6
{
  VisionCoreTensorShape *v10;
  VisionCoreTensorShape *v11;
  unint64_t *value;
  unint64_t *end;
  unint64_t *v14;
  unint64_t *begin;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  BOOL v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t *v22;
  unint64_t v23;
  unint64_t *v24;
  unint64_t *v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  unint64_t *v31;
  unint64_t v32;
  unint64_t *v33;
  unint64_t *v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  unint64_t *v40;
  unint64_t v41;
  unint64_t *v42;
  unint64_t *v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  unint64_t *v49;
  unint64_t *v50;
  unint64_t v51;
  objc_super v53;

  v53.receiver = self;
  v53.super_class = (Class)VisionCoreTensorShape;
  v10 = -[VisionCoreTensorShape init](&v53, sel_init);
  v11 = v10;
  if (v10)
  {
    end = v10->_sizes.__end_;
    value = v10->_sizes.__end_cap_.__value_;
    if (end >= value)
    {
      begin = v10->_sizes.__begin_;
      v16 = end - begin;
      v17 = v16 + 1;
      if ((unint64_t)(v16 + 1) >> 61)
        goto LABEL_64;
      v18 = (char *)value - (char *)begin;
      if (v18 >> 2 > v17)
        v17 = v18 >> 2;
      v19 = (unint64_t)v18 >= 0x7FFFFFFFFFFFFFF8;
      v20 = 0x1FFFFFFFFFFFFFFFLL;
      if (!v19)
        v20 = v17;
      if (v20)
      {
        v20 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v20);
        begin = v11->_sizes.__begin_;
        end = v11->_sizes.__end_;
      }
      else
      {
        v21 = 0;
      }
      v22 = (unint64_t *)(v20 + 8 * v16);
      value = (unint64_t *)(v20 + 8 * v21);
      *v22 = a3;
      v14 = v22 + 1;
      while (end != begin)
      {
        v23 = *--end;
        *--v22 = v23;
      }
      v11->_sizes.__begin_ = v22;
      v11->_sizes.__end_ = v14;
      v11->_sizes.__end_cap_.__value_ = value;
      if (begin)
      {
        operator delete(begin);
        value = v11->_sizes.__end_cap_.__value_;
      }
    }
    else
    {
      *end = a3;
      v14 = end + 1;
    }
    v11->_sizes.__end_ = v14;
    if (v14 >= value)
    {
      v25 = v11->_sizes.__begin_;
      v26 = v14 - v25;
      v27 = v26 + 1;
      if ((unint64_t)(v26 + 1) >> 61)
        goto LABEL_64;
      v28 = (char *)value - (char *)v25;
      if (v28 >> 2 > v27)
        v27 = v28 >> 2;
      v19 = (unint64_t)v28 >= 0x7FFFFFFFFFFFFFF8;
      v29 = 0x1FFFFFFFFFFFFFFFLL;
      if (!v19)
        v29 = v27;
      if (v29)
      {
        v29 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v29);
        v25 = v11->_sizes.__begin_;
        v14 = v11->_sizes.__end_;
      }
      else
      {
        v30 = 0;
      }
      v31 = (unint64_t *)(v29 + 8 * v26);
      value = (unint64_t *)(v29 + 8 * v30);
      *v31 = a4;
      v24 = v31 + 1;
      while (v14 != v25)
      {
        v32 = *--v14;
        *--v31 = v32;
      }
      v11->_sizes.__begin_ = v31;
      v11->_sizes.__end_ = v24;
      v11->_sizes.__end_cap_.__value_ = value;
      if (v25)
      {
        operator delete(v25);
        value = v11->_sizes.__end_cap_.__value_;
      }
    }
    else
    {
      *v14 = a4;
      v24 = v14 + 1;
    }
    v11->_sizes.__end_ = v24;
    if (v24 >= value)
    {
      v34 = v11->_sizes.__begin_;
      v35 = v24 - v34;
      v36 = v35 + 1;
      if ((unint64_t)(v35 + 1) >> 61)
        goto LABEL_64;
      v37 = (char *)value - (char *)v34;
      if (v37 >> 2 > v36)
        v36 = v37 >> 2;
      v19 = (unint64_t)v37 >= 0x7FFFFFFFFFFFFFF8;
      v38 = 0x1FFFFFFFFFFFFFFFLL;
      if (!v19)
        v38 = v36;
      if (v38)
      {
        v38 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v38);
        v34 = v11->_sizes.__begin_;
        v24 = v11->_sizes.__end_;
      }
      else
      {
        v39 = 0;
      }
      v40 = (unint64_t *)(v38 + 8 * v35);
      value = (unint64_t *)(v38 + 8 * v39);
      *v40 = a5;
      v33 = v40 + 1;
      while (v24 != v34)
      {
        v41 = *--v24;
        *--v40 = v41;
      }
      v11->_sizes.__begin_ = v40;
      v11->_sizes.__end_ = v33;
      v11->_sizes.__end_cap_.__value_ = value;
      if (v34)
      {
        operator delete(v34);
        value = v11->_sizes.__end_cap_.__value_;
      }
    }
    else
    {
      *v24 = a5;
      v33 = v24 + 1;
    }
    v11->_sizes.__end_ = v33;
    if (v33 < value)
    {
      *v33 = a6;
      v42 = v33 + 1;
LABEL_62:
      v11->_sizes.__end_ = v42;
      return v11;
    }
    v43 = v11->_sizes.__begin_;
    v44 = v33 - v43;
    v45 = v44 + 1;
    if (!((unint64_t)(v44 + 1) >> 61))
    {
      v46 = (char *)value - (char *)v43;
      if (v46 >> 2 > v45)
        v45 = v46 >> 2;
      v19 = (unint64_t)v46 >= 0x7FFFFFFFFFFFFFF8;
      v47 = 0x1FFFFFFFFFFFFFFFLL;
      if (!v19)
        v47 = v45;
      if (v47)
      {
        v47 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v47);
        v43 = v11->_sizes.__begin_;
        v33 = v11->_sizes.__end_;
      }
      else
      {
        v48 = 0;
      }
      v49 = (unint64_t *)(v47 + 8 * v44);
      v50 = (unint64_t *)(v47 + 8 * v48);
      *v49 = a6;
      v42 = v49 + 1;
      while (v33 != v43)
      {
        v51 = *--v33;
        *--v49 = v51;
      }
      v11->_sizes.__begin_ = v49;
      v11->_sizes.__end_ = v42;
      v11->_sizes.__end_cap_.__value_ = v50;
      if (v43)
        operator delete(v43);
      goto LABEL_62;
    }
LABEL_64:
    std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
  }
  return v11;
}

- (void).cxx_destruct
{
  unint64_t *begin;

  begin = self->_sizes.__begin_;
  if (begin)
  {
    self->_sizes.__end_ = begin;
    operator delete(begin);
  }
}

- (const)sizes
{
  return self->_sizes.__begin_;
}

- (unint64_t)rank
{
  return self->_sizes.__end_ - self->_sizes.__begin_;
}

- (VisionCoreTensorShape)initWithPixelFormatType:(unsigned int)a3 width:(unint64_t)a4 height:(unint64_t)a5
{
  return -[VisionCoreTensorShape initWithImageChannels:width:height:](self, "initWithImageChannels:width:height:", 1, a4, a5);
}

- (unint64_t)elementCount
{
  unint64_t *begin;
  unint64_t *end;
  int v4;
  int v5;

  begin = self->_sizes.__begin_;
  end = self->_sizes.__end_;
  if (begin == end)
    return 0;
  v4 = 1;
  do
  {
    v5 = *(_DWORD *)begin++;
    v4 *= v5;
  }
  while (begin != end);
  return v4;
}

- (VisionCoreTensorShape)initWithSizes:(const unint64_t *)a3 rank:(unint64_t)a4
{
  VisionCoreTensorShape *v6;
  VisionCoreTensorShape *v7;
  BOOL v8;
  uint64_t v9;
  unint64_t *end;
  unint64_t *value;
  unint64_t *v12;
  unint64_t *begin;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t *v19;
  unint64_t v20;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)VisionCoreTensorShape;
  v6 = -[VisionCoreTensorShape init](&v22, sel_init);
  v7 = v6;
  if (v6)
    v8 = a4 == 0;
  else
    v8 = 1;
  if (!v8)
  {
    v9 = 0;
    end = v6->_sizes.__end_;
    do
    {
      value = v7->_sizes.__end_cap_.__value_;
      if (end >= value)
      {
        begin = v7->_sizes.__begin_;
        v14 = end - begin;
        v15 = v14 + 1;
        if ((unint64_t)(v14 + 1) >> 61)
          std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
        v16 = (char *)value - (char *)begin;
        if (v16 >> 2 > v15)
          v15 = v16 >> 2;
        if ((unint64_t)v16 >= 0x7FFFFFFFFFFFFFF8)
          v17 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v17 = v15;
        if (v17)
        {
          v17 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v17);
          begin = v7->_sizes.__begin_;
          end = v7->_sizes.__end_;
        }
        else
        {
          v18 = 0;
        }
        v19 = (unint64_t *)(v17 + 8 * v14);
        *v19 = a3[v9];
        v12 = v19 + 1;
        while (end != begin)
        {
          v20 = *--end;
          *--v19 = v20;
        }
        v7->_sizes.__begin_ = v19;
        v7->_sizes.__end_ = v12;
        v7->_sizes.__end_cap_.__value_ = (unint64_t *)(v17 + 8 * v18);
        if (begin)
          operator delete(begin);
      }
      else
      {
        *end = a3[v9];
        v12 = end + 1;
      }
      v7->_sizes.__end_ = v12;
      ++v9;
      end = v12;
    }
    while (v9 != a4);
  }
  return v7;
}

- (NSArray)sizesAsNSNumberArray
{
  unint64_t v3;
  void *v4;
  const unint64_t *v5;
  const unint64_t *v6;
  uint64_t v7;
  void *v8;

  v3 = -[VisionCoreTensorShape rank](self, "rank");
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", v3);
  v5 = -[VisionCoreTensorShape sizes](objc_retainAutorelease(self), "sizes");
  if (v3)
  {
    v6 = v5;
    do
    {
      v7 = *v6++;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v8);

      --v3;
    }
    while (v3);
  }
  return (NSArray *)v4;
}

- (BOOL)getOneDimensionalArrayDimensionIndex:(unint64_t *)a3 error:(id *)a4
{
  unint64_t v7;
  VisionCoreTensorShape *v8;
  const unint64_t *v9;
  unint64_t v10;
  unint64_t v11;
  char v12;
  _QWORD *v13;
  unint64_t v14;
  BOOL v15;
  uint64_t v16;
  BOOL v17;
  BOOL v18;
  void *v19;

  v7 = -[VisionCoreTensorShape rank](self, "rank");
  v8 = objc_retainAutorelease(self);
  v9 = -[VisionCoreTensorShape sizes](v8, "sizes");
  if (v7)
  {
    v10 = 0;
    v11 = 0;
    v12 = 0;
    v14 = *v9;
    v13 = v9 + 1;
    v15 = v14 != 1;
    while (1)
    {
      if (v15)
        v11 = v10;
      if (v7 - 1 == v10)
        break;
      v12 |= v15;
      v16 = v13[v10++];
      v17 = v16 == 1;
      v15 = v16 != 1;
      if (!v17 && (v12 & 1) != 0)
      {
        v18 = v10 >= v7;
        if (a4)
        {
          v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%@ has multiple dimensions"), v8);
          objc_msgSend(MEMORY[0x24BDD1540], "VisionCoreErrorForInvalidOperationWithLocalizedDescription:", v19);
          *a4 = (id)objc_claimAutoreleasedReturnValue();

        }
        return v18;
      }
    }
  }
  else
  {
    v11 = 0;
  }
  if (a3)
    *a3 = v11;
  return 1;
}

- (unint64_t)hash
{
  unint64_t *begin;
  unint64_t *end;
  unint64_t result;
  uint64_t v5;

  begin = self->_sizes.__begin_;
  end = self->_sizes.__end_;
  if (begin == end)
    return 0;
  result = 0;
  do
  {
    v5 = *begin++;
    result ^= v5;
  }
  while (begin != end);
  return result;
}

- (BOOL)isEqual:(id)a3
{
  VisionCoreTensorShape *v4;
  unint64_t *begin;
  char *v6;
  unint64_t *v7;
  BOOL v8;

  v4 = (VisionCoreTensorShape *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    v8 = (objc_opt_isKindOfClass() & 1) != 0
      && (begin = self->_sizes.__begin_,
          v6 = (char *)((char *)self->_sizes.__end_ - (char *)begin),
          v7 = v4->_sizes.__begin_,
          v6 == (char *)((char *)v4->_sizes.__end_ - (char *)v7))
      && memcmp(begin, v7, (size_t)v6) == 0;
  }

  return v8;
}

- (id)description
{
  id v3;
  unint64_t v4;
  const unint64_t *v5;
  unint64_t v6;

  v3 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  objc_msgSend(v3, "appendString:", CFSTR("["));
  v4 = -[VisionCoreTensorShape rank](self, "rank");
  if (v4)
  {
    v5 = -[VisionCoreTensorShape sizes](objc_retainAutorelease(self), "sizes");
    do
    {
      v6 = *v5++;
      objc_msgSend(v3, "appendFormat:", CFSTR(" %lu"), v6);
      --v4;
    }
    while (v4);
  }
  objc_msgSend(v3, "appendString:", CFSTR(" ]"));
  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t *end;
  unint64_t *begin;
  uint64_t v6;
  id v7;
  _DWORD *v8;
  uint64_t v9;
  unint64_t *v10;
  unsigned int v11;
  id v12;

  v12 = a3;
  begin = self->_sizes.__begin_;
  end = self->_sizes.__end_;
  v6 = (char *)end - (char *)begin;
  v7 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithLength:", ((char *)end - (char *)begin) >> 1));
  v8 = (_DWORD *)objc_msgSend(v7, "mutableBytes");
  if (end != begin)
  {
    v9 = v6 >> 3;
    v10 = self->_sizes.__begin_;
    if ((unint64_t)(v6 >> 3) <= 1)
      v9 = 1;
    do
    {
      v11 = *(_DWORD *)v10++;
      *v8++ = bswap32(v11);
      --v9;
    }
    while (v9);
  }
  objc_msgSend(v12, "encodeObject:forKey:", v7, CFSTR("sizes"));

}

- (VisionCoreTensorShape)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  BOOL v9;
  void *v10;
  void *v11;
  VisionCoreTensorShape *v12;
  unint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  unint64_t v31;
  id v32;
  VisionCoreTensorShape *v33;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sizes"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
    goto LABEL_7;
  v7 = objc_msgSend(v5, "length");
  v8 = v7;
  if (v7)
    v9 = (v7 & 3) == 0;
  else
    v9 = 0;
  if (!v9)
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Illegal sizes data length of %lu"), v7);
    objc_msgSend(MEMORY[0x24BDD1540], "VisionCoreErrorForCorruptedResourceWithLocalizedDescription:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "failWithError:", v11);

LABEL_7:
    v12 = 0;
    goto LABEL_38;
  }
  v13 = v7 >> 2;
  v32 = v4;
  v33 = self;
  if (v7 >= 4)
  {
    if ((v7 & 0x8000000000000000) != 0)
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v7 >> 2);
    v15 = &v14[8 * v16];
  }
  else
  {
    v14 = 0;
    v15 = 0;
  }
  v17 = objc_msgSend(objc_retainAutorelease(v6), "bytes");
  v31 = v8 >> 2;
  if (v8 >= 4)
  {
    v18 = v17;
    v19 = 0;
    if (v13 <= 1)
      v20 = 1;
    else
      v20 = v13;
    v21 = v14;
    do
    {
      v22 = bswap32(*(_DWORD *)(v18 + 4 * v19));
      *(_DWORD *)(v18 + 4 * v19) = v22;
      if (v21 >= v15)
      {
        v24 = (v21 - v14) >> 3;
        v25 = v24 + 1;
        if ((unint64_t)(v24 + 1) >> 61)
          std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
        if ((v15 - v14) >> 2 > v25)
          v25 = (v15 - v14) >> 2;
        if ((unint64_t)(v15 - v14) >= 0x7FFFFFFFFFFFFFF8)
          v26 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v26 = v25;
        if (v26)
          v26 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v26);
        else
          v27 = 0;
        v28 = (char *)(v26 + 8 * v24);
        *(_QWORD *)v28 = v22;
        v23 = v28 + 8;
        while (v21 != v14)
        {
          v29 = *((_QWORD *)v21 - 1);
          v21 -= 8;
          *((_QWORD *)v28 - 1) = v29;
          v28 -= 8;
        }
        v15 = (char *)(v26 + 8 * v27);
        if (v14)
          operator delete(v14);
        v14 = v28;
      }
      else
      {
        *(_QWORD *)v21 = v22;
        v23 = v21 + 8;
      }
      ++v19;
      v21 = v23;
    }
    while (v19 != v20);
  }
  v4 = v32;
  self = -[VisionCoreTensorShape initWithSizes:rank:](v33, "initWithSizes:rank:", v14, v31);
  if (v14)
    operator delete(v14);
  v12 = self;
LABEL_38:

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
