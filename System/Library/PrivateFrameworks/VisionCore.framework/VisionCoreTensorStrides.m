@implementation VisionCoreTensorStrides

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  return self;
}

- (VisionCoreTensorStrides)initWithShape:(id)a3 dataType:(unint64_t)a4
{
  unsigned __int16 v4;
  VisionCoreTensorStrides *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int64_t v11;
  uint64_t v12;
  int64_t *end;
  int64_t *begin;
  int64_t *value;
  int64_t *v16;
  int64_t *v17;
  int64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  int64_t *v22;
  uint64_t v23;
  int64_t *v24;
  int64_t *v25;
  int64_t *v26;
  uint64_t v27;
  char *v28;
  int64_t *v29;
  int64_t *v30;
  int64_t v31;
  int64_t *v32;
  int64_t v33;
  int64_t *v34;
  id v36;
  unint64_t v37;
  vector<long, std::allocator<long>> *p_byteOffsets;
  objc_super v39;

  v4 = a4;
  v36 = a3;
  v39.receiver = self;
  v39.super_class = (Class)VisionCoreTensorStrides;
  v6 = -[VisionCoreTensorStrides init](&v39, sel_init);
  if (v6)
  {
    v7 = objc_msgSend(v36, "rank");
    p_byteOffsets = &v6->_byteOffsets;
    std::vector<long>::reserve((void **)&v6->_byteOffsets.__begin_, v7);
    v8 = objc_msgSend(objc_retainAutorelease(v36), "sizes");
    if (v7)
    {
      v9 = v8;
      v10 = 0;
      v11 = v4 >> 3;
      v12 = 1;
      v37 = v7;
      while (1)
      {
        v11 *= v12;
        v12 = *(_QWORD *)(v9 + 8 * v10);
        begin = v6->_byteOffsets.__begin_;
        end = v6->_byteOffsets.__end_;
        value = v6->_byteOffsets.__end_cap_.__value_;
        if (end >= value)
          break;
        if (begin == end)
        {
          *begin = v11;
          v6->_byteOffsets.__end_ = begin + 1;
        }
        else
        {
          v16 = end - 1;
          v17 = v6->_byteOffsets.__end_;
          while (v16 < end)
          {
            v18 = *v16++;
            *v17++ = v18;
          }
          v6->_byteOffsets.__end_ = v17;
          if (end != begin + 1)
            memmove(&end[-(end - (begin + 1))], begin, (char *)end - (char *)(begin + 1));
          *begin = v11;
        }
LABEL_33:
        if (++v10 == v7)
          goto LABEL_34;
      }
      v19 = end - begin + 1;
      if (v19 >> 61)
        std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
      v20 = (char *)value - (char *)begin;
      if (v20 >> 2 > v19)
        v19 = v20 >> 2;
      if ((unint64_t)v20 >= 0x7FFFFFFFFFFFFFF8)
        v21 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v21 = v19;
      if (v21)
      {
        v22 = (int64_t *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v21);
        v24 = v22;
        if (v23)
        {
          v25 = &v22[v23];
LABEL_26:
          *v24 = v11;
          v28 = (char *)(v24 + 1);
          v29 = p_byteOffsets->__begin_;
          if (p_byteOffsets->__begin_ != begin)
          {
            v30 = begin;
            do
            {
              v31 = *--v30;
              *--v24 = v31;
            }
            while (v30 != v29);
          }
          v32 = v6->_byteOffsets.__end_;
          v33 = (char *)v32 - (char *)begin;
          if (v32 != begin)
            memmove(v28, begin, (char *)v32 - (char *)begin);
          v34 = v6->_byteOffsets.__begin_;
          v6->_byteOffsets.__begin_ = v24;
          v6->_byteOffsets.__end_ = (int64_t *)&v28[v33];
          v6->_byteOffsets.__end_cap_.__value_ = v25;
          v7 = v37;
          if (v34)
            operator delete(v34);
          goto LABEL_33;
        }
      }
      else
      {
        v24 = 0;
      }
      v26 = (int64_t *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(1uLL);
      v25 = &v26[v27];
      if (v24)
        operator delete(v24);
      v24 = v26;
      goto LABEL_26;
    }
  }
LABEL_34:

  return v6;
}

- (VisionCoreTensorStrides)initWithByteOffsets:(const int64_t *)a3 rank:(unint64_t)a4
{
  VisionCoreTensorStrides *v6;
  VisionCoreTensorStrides *v7;
  void **p_begin;
  uint64_t v9;
  int64_t *end;
  int64_t *value;
  int64_t *v12;
  int64_t *begin;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  int64_t *v19;
  int64_t v20;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)VisionCoreTensorStrides;
  v6 = -[VisionCoreTensorStrides init](&v22, sel_init);
  v7 = v6;
  if (v6)
  {
    p_begin = (void **)&v6->_byteOffsets.__begin_;
    std::vector<long>::reserve((void **)&v6->_byteOffsets.__begin_, a4);
    if (a4)
    {
      v9 = 0;
      end = v7->_byteOffsets.__end_;
      do
      {
        value = v7->_byteOffsets.__end_cap_.__value_;
        if (end >= value)
        {
          begin = (int64_t *)*p_begin;
          v14 = ((char *)end - (_BYTE *)*p_begin) >> 3;
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
            begin = v7->_byteOffsets.__begin_;
            end = v7->_byteOffsets.__end_;
          }
          else
          {
            v18 = 0;
          }
          v19 = (int64_t *)(v17 + 8 * v14);
          *v19 = a3[v9];
          v12 = v19 + 1;
          while (end != begin)
          {
            v20 = *--end;
            *--v19 = v20;
          }
          v7->_byteOffsets.__begin_ = v19;
          v7->_byteOffsets.__end_ = v12;
          v7->_byteOffsets.__end_cap_.__value_ = (int64_t *)(v17 + 8 * v18);
          if (begin)
            operator delete(begin);
        }
        else
        {
          *end = a3[v9];
          v12 = end + 1;
        }
        v7->_byteOffsets.__end_ = v12;
        ++v9;
        end = v12;
      }
      while (v9 != a4);
    }
  }
  return v7;
}

- (id)shapeForPackedElementsOfType:(unint64_t)a3 error:(id *)a4
{
  int64_t *begin;
  uint64_t v8;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  int64_t *v14;
  int64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  VisionCoreTensorShape *v30;
  id v32;
  void *v33;
  void *v34;
  id *v35;

  if (!((unsigned __int16)a3 >> 3))
  {
    if (a4)
    {
      v24 = objc_alloc(MEMORY[0x24BDD17C8]);
      NSStringFromVisionCoreTensorDataType(a3);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = (void *)objc_msgSend(v24, "initWithFormat:", CFSTR("unknown element type %@"), v25);

      objc_msgSend(MEMORY[0x24BDD1540], "VisionCoreErrorForInvalidArgumentWithLocalizedDescription:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_29:
      *a4 = v27;

    }
LABEL_30:
    v30 = 0;
    return v30;
  }
  begin = self->_byteOffsets.__begin_;
  v8 = self->_byteOffsets.__end_ - begin - 1;
  if (begin[v8] != (unsigned __int16)a3 >> 3)
  {
    if (a4)
    {
      v28 = objc_alloc(MEMORY[0x24BDD17C8]);
      NSStringFromVisionCoreTensorDataType(a3);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = (void *)objc_msgSend(v28, "initWithFormat:", CFSTR("%@ is not packed into %@ elements"), self, v29);

      objc_msgSend(MEMORY[0x24BDD1540], "VisionCoreErrorForFailedOperationWithLocalizedDescription:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_29;
    }
    goto LABEL_30;
  }
  v9 = (uint64_t *)operator new(8uLL);
  v10 = v9;
  *v9 = 1;
  v11 = v9 + 1;
  if (v8)
  {
    v35 = a4;
    v12 = 0;
    v13 = v9 + 1;
    while (1)
    {
      v14 = self->_byteOffsets.__begin_;
      v15 = v14[v12++];
      v16 = v15 / v14[v12];
      if (v16 <= 0)
        break;
      if (v11 >= v13)
      {
        v18 = v11 - v10;
        v19 = v18 + 1;
        if ((unint64_t)(v18 + 1) >> 61)
          std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
        if (((char *)v13 - (char *)v10) >> 2 > v19)
          v19 = ((char *)v13 - (char *)v10) >> 2;
        if ((unint64_t)((char *)v13 - (char *)v10) >= 0x7FFFFFFFFFFFFFF8)
          v20 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v20 = v19;
        if (v20)
          v20 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v20);
        else
          v21 = 0;
        v22 = (uint64_t *)(v20 + 8 * v18);
        *v22 = v16;
        v17 = v22 + 1;
        while (v11 != v10)
        {
          v23 = *--v11;
          *--v22 = v23;
        }
        v13 = (uint64_t *)(v20 + 8 * v21);
        if (v10)
          operator delete(v10);
        v10 = v22;
      }
      else
      {
        *v11 = v16;
        v17 = v11 + 1;
      }
      v11 = v17;
      if (v12 == v8)
        goto LABEL_32;
    }
    if (v35)
    {
      v32 = objc_alloc(MEMORY[0x24BDD17C8]);
      NSStringFromVisionCoreTensorDataType(a3);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = (void *)objc_msgSend(v32, "initWithFormat:", CFSTR("%@ is not packed into %@ elements"), self, v33);

      objc_msgSend(MEMORY[0x24BDD1540], "VisionCoreErrorForFailedOperationWithLocalizedDescription:", v34);
      *v35 = (id)objc_claimAutoreleasedReturnValue();

    }
    v30 = 0;
    if (!v10)
      return v30;
LABEL_33:
    operator delete(v10);
    return v30;
  }
  v17 = v9 + 1;
LABEL_32:
  v30 = -[VisionCoreTensorShape initWithSizes:rank:]([VisionCoreTensorShape alloc], "initWithSizes:rank:", v10, v17 - v10);
  if (v10)
    goto LABEL_33;
  return v30;
}

- (unint64_t)rank
{
  return self->_byteOffsets.__end_ - self->_byteOffsets.__begin_;
}

- (const)byteOffsets
{
  return self->_byteOffsets.__begin_;
}

- (unint64_t)hash
{
  int64_t *begin;
  int64_t *end;
  unint64_t result;
  uint64_t v5;

  begin = self->_byteOffsets.__begin_;
  end = self->_byteOffsets.__end_;
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
  VisionCoreTensorStrides *v4;
  int64_t *begin;
  char *v6;
  int64_t *v7;
  BOOL v8;

  v4 = (VisionCoreTensorStrides *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    v8 = (objc_opt_isKindOfClass() & 1) != 0
      && (begin = self->_byteOffsets.__begin_,
          v6 = (char *)((char *)self->_byteOffsets.__end_ - (char *)begin),
          v7 = v4->_byteOffsets.__begin_,
          v6 == (char *)((char *)v4->_byteOffsets.__end_ - (char *)v7))
      && memcmp(begin, v7, (size_t)v6) == 0;
  }

  return v8;
}

- (id)description
{
  id v3;
  unint64_t v4;
  const int64_t *v5;
  int64_t v6;

  v3 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  objc_msgSend(v3, "appendString:", CFSTR("["));
  v4 = -[VisionCoreTensorStrides rank](self, "rank");
  if (v4)
  {
    v5 = -[VisionCoreTensorStrides byteOffsets](objc_retainAutorelease(self), "byteOffsets");
    do
    {
      v6 = *v5++;
      objc_msgSend(v3, "appendFormat:", CFSTR(" %ld"), v6);
      --v4;
    }
    while (v4);
  }
  objc_msgSend(v3, "appendString:", CFSTR(" ]"));
  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t *end;
  int64_t *begin;
  uint64_t v6;
  id v7;
  _DWORD *v8;
  uint64_t v9;
  int64_t *v10;
  unsigned int v11;
  id v12;

  v12 = a3;
  begin = self->_byteOffsets.__begin_;
  end = self->_byteOffsets.__end_;
  v6 = (char *)end - (char *)begin;
  v7 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithLength:", ((char *)end - (char *)begin) >> 1));
  v8 = (_DWORD *)objc_msgSend(v7, "mutableBytes");
  if (end != begin)
  {
    v9 = v6 >> 3;
    v10 = self->_byteOffsets.__begin_;
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
  objc_msgSend(v12, "encodeObject:forKey:", v7, CFSTR("offsets"));

}

- (VisionCoreTensorStrides)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  BOOL v9;
  void *v10;
  void *v11;
  VisionCoreTensorStrides *v12;
  unint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  char *v20;
  signed int v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  char *v27;
  char *v28;
  uint64_t v29;
  unint64_t v31;
  id v32;
  VisionCoreTensorStrides *v33;
  void *__p;
  char *v35;
  unint64_t v36;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("offsets"));
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
    goto LABEL_35;
  }
  v13 = v7 >> 2;
  __p = 0;
  v35 = 0;
  v36 = 0;
  std::vector<long>::reserve(&__p, v7 >> 2);
  v14 = objc_msgSend(objc_retainAutorelease(v6), "bytes");
  v15 = (char *)__p;
  if (v8 >= 4)
  {
    v16 = v14;
    v32 = v4;
    v33 = self;
    v17 = 0;
    v31 = v13;
    if (v13 <= 1)
      v18 = 1;
    else
      v18 = v13;
    v20 = v35;
    v19 = v36;
    do
    {
      v21 = bswap32(*(_DWORD *)(v16 + 4 * v17));
      v22 = v21;
      if ((unint64_t)v20 >= v19)
      {
        v23 = (v20 - v15) >> 3;
        v24 = v23 + 1;
        if ((unint64_t)(v23 + 1) >> 61)
        {
          __p = v15;
          v35 = v20;
          std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
        }
        if ((uint64_t)(v19 - (_QWORD)v15) >> 2 > v24)
          v24 = (uint64_t)(v19 - (_QWORD)v15) >> 2;
        if (v19 - (unint64_t)v15 >= 0x7FFFFFFFFFFFFFF8)
          v25 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v25 = v24;
        if (v25)
          v25 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v25);
        else
          v26 = 0;
        v27 = (char *)(v25 + 8 * v23);
        *(_QWORD *)v27 = v22;
        v28 = v27 + 8;
        while (v20 != v15)
        {
          v29 = *((_QWORD *)v20 - 1);
          v20 -= 8;
          *((_QWORD *)v27 - 1) = v29;
          v27 -= 8;
        }
        v19 = v25 + 8 * v26;
        if (v15)
          operator delete(v15);
        v15 = v27;
        v20 = v28;
      }
      else
      {
        *(_QWORD *)v20 = v21;
        v20 += 8;
      }
      ++v17;
    }
    while (v17 != v18);
    v35 = v20;
    v36 = v19;
    __p = v15;
    v4 = v32;
    self = v33;
    v13 = v31;
  }
  self = -[VisionCoreTensorStrides initWithByteOffsets:rank:](self, "initWithByteOffsets:rank:", v15, v13);
  if (__p)
    operator delete(__p);
  v12 = self;
LABEL_35:

  return v12;
}

- (void).cxx_destruct
{
  int64_t *begin;

  begin = self->_byteOffsets.__begin_;
  if (begin)
  {
    self->_byteOffsets.__end_ = begin;
    operator delete(begin);
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
