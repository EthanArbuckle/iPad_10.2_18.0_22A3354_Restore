@implementation VisionCoreValueConfidenceCurve

- (float)minimumValue
{
  return *(float *)self->_increasingValuePoints.__begin_;
}

- (float)maximumValue
{
  VisionCoreValueConfidencePoint *begin;
  uint64_t v3;

  if (self)
  {
    begin = self->_increasingValuePoints.__begin_;
    v3 = ((self->_increasingValuePoints.__end_ - begin) >> 3) - 1;
  }
  else
  {
    v3 = 0;
    begin = (VisionCoreValueConfidencePoint *)MEMORY[8];
  }
  return *((float *)begin + 2 * v3);
}

- (float)minimumConfidence
{
  int64_t v2;

  if (self && !self->_confidencesAreIncreasing)
    v2 = ((self->_increasingValuePoints.__end_ - self->_increasingValuePoints.__begin_) >> 3) - 1;
  else
    v2 = 0;
  return *((float *)self->_increasingValuePoints.__begin_ + 2 * v2 + 1);
}

- (float)maximumConfidence
{
  int64_t v2;

  if (self && self->_confidencesAreIncreasing)
    v2 = ((self->_increasingValuePoints.__end_ - self->_increasingValuePoints.__begin_) >> 3) - 1;
  else
    v2 = 0;
  return *((float *)self->_increasingValuePoints.__begin_ + 2 * v2 + 1);
}

- (float)valueForConfidence:(float)a3
{
  VisionCoreValueConfidencePoint *begin;
  uint64_t v4;
  uint64_t v5;
  float v6;
  float *v7;
  uint64_t v8;
  float *v9;
  float v10;
  float *v12;
  float *v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;

  begin = self->_increasingValuePoints.__begin_;
  v4 = self->_increasingValuePoints.__end_ - begin;
  v5 = v4 >> 3;
  v6 = *((float *)begin + 1);
  if (!self->_confidencesAreIncreasing)
  {
    if (v6 > a3)
    {
      if ((unint64_t)v4 >= 9)
      {
        v9 = (float *)((char *)begin + 12);
        v8 = 1;
        while (1)
        {
          v10 = *v9;
          if (*v9 < a3)
            break;
          if (*v9 == a3)
            return *((float *)begin + 2 * v8);
          ++v8;
          v9 += 2;
          if (v5 == v8)
            return *((float *)begin + 2 * v5 - 2);
        }
        v12 = (float *)((char *)begin + 8 * v8);
        v13 = v12 - 2;
        v17 = *(v12 - 1) - v10;
        if (v17 == 0.0)
          v18 = 0.5;
        else
          v18 = (float)(a3 - v10) / v17;
        v16 = 1.0 - v18;
        return *v13 + (float)(v16 * (float)(*v12 - *v13));
      }
      return *((float *)begin + 2 * v5 - 2);
    }
    return *(float *)begin;
  }
  if (v6 >= a3)
    return *(float *)begin;
  if ((unint64_t)v4 < 9)
    return *((float *)begin + 2 * v5 - 2);
  v7 = (float *)((char *)begin + 12);
  v8 = 1;
  while (*v7 <= a3)
  {
    if (*v7 == a3)
      return *((float *)begin + 2 * v8);
    ++v8;
    v7 += 2;
    if (v5 == v8)
      return *((float *)begin + 2 * v5 - 2);
  }
  v12 = (float *)((char *)begin + 8 * v8);
  v13 = v12 - 2;
  v14 = *(v12 - 1);
  v15 = *v7 - v14;
  if (v15 == 0.0)
    v16 = 0.5;
  else
    v16 = (float)(a3 - v14) / v15;
  return *v13 + (float)(v16 * (float)(*v12 - *v13));
}

- (float)confidenceForValue:(float)a3
{
  VisionCoreValueConfidencePoint *begin;
  uint64_t v4;
  uint64_t v5;
  float *v6;
  uint64_t v7;
  float *v9;
  float v10;
  float v11;
  float v12;
  char *v13;
  float v14;
  char *v15;

  begin = self->_increasingValuePoints.__begin_;
  if (*(float *)begin >= a3)
    return *((float *)begin + 1);
  v4 = self->_increasingValuePoints.__end_ - begin;
  v5 = v4 >> 3;
  if ((unint64_t)v4 < 9)
    return *((float *)begin + 2 * v5 - 1);
  v6 = (float *)((char *)begin + 8);
  v7 = 1;
  while (*v6 <= a3)
  {
    if (*v6 == a3)
      return *((float *)begin + 2 * v7 + 1);
    ++v7;
    v6 += 2;
    if (v5 == v7)
      return *((float *)begin + 2 * v5 - 1);
  }
  v9 = (float *)((char *)begin + 8 * v7);
  v10 = *(v9 - 2);
  v11 = *v6 - v10;
  if (v11 == 0.0)
    v12 = 0.5;
  else
    v12 = (float)(a3 - v10) / v11;
  if (self->_confidencesAreIncreasing)
  {
    v13 = (char *)(v9 - 2);
  }
  else
  {
    v12 = 1.0 - v12;
    v13 = (char *)v9;
  }
  v14 = *((float *)v13 + 1);
  if (self->_confidencesAreIncreasing)
    v15 = (char *)v9;
  else
    v15 = (char *)(v9 - 2);
  return v14 + (float)(v12 * (float)(*((float *)v15 + 1) - v14));
}

- (id)description
{
  int64_t v3;
  void *v4;
  VisionCoreValueConfidencePoint *begin;
  VisionCoreValueConfidencePoint *end;
  char v7;

  v3 = self->_increasingValuePoints.__end_ - self->_increasingValuePoints.__begin_;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithCapacity:", 4 * ((v3 >> 1) + (v3 >> 3)));
  begin = self->_increasingValuePoints.__begin_;
  end = self->_increasingValuePoints.__end_;
  if (begin != end)
  {
    v7 = 0;
    do
    {
      if ((v7 & 1) != 0)
        objc_msgSend(v4, "appendString:", CFSTR(" "));
      objc_msgSend(v4, "appendFormat:", CFSTR("(%g, %g)"), *(float *)begin, *((float *)begin + 1));
      begin = (VisionCoreValueConfidencePoint *)((char *)begin + 8);
      v7 = 1;
    }
    while (begin != end);
  }
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  VisionCoreValueConfidenceCurve *v4;
  VisionCoreValueConfidenceCurve *v5;
  VisionCoreValueConfidencePoint *end;
  VisionCoreValueConfidencePoint *begin;
  float *v8;
  float v9;
  float v10;
  float v11;
  float v12;
  _BOOL4 v13;

  v4 = (VisionCoreValueConfidenceCurve *)a3;
  if (v4 == self)
  {
    LOBYTE(v13) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      if (self->_confidencesAreIncreasing == v5->_confidencesAreIncreasing
        && (begin = self->_increasingValuePoints.__begin_,
            end = self->_increasingValuePoints.__end_,
            v8 = (float *)v5->_increasingValuePoints.__begin_,
            end - begin == v5->_increasingValuePoints.__end_ - (VisionCoreValueConfidencePoint *)v8))
      {
        if (begin == end)
        {
          LOBYTE(v13) = 1;
        }
        else
        {
          do
          {
            v9 = *(float *)begin;
            v10 = *((float *)begin + 1);
            begin = (VisionCoreValueConfidencePoint *)((char *)begin + 8);
            v11 = *v8;
            v12 = v8[1];
            v8 += 2;
            v13 = v10 == v12 && v9 == v11;
          }
          while (v13 && begin != end);
        }
      }
      else
      {
        LOBYTE(v13) = 0;
      }

    }
    else
    {
      LOBYTE(v13) = 0;
    }
  }

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  int resolvedPointsDistribution_DO_NOT_DIRECTLY_ACCESS;
  float *begin;
  VisionCoreValueConfidencePoint *end;
  int v7;
  char v8;
  int v9;
  BOOL v10;
  int v11;
  BOOL v12;
  id v13;
  int64_t v14;
  id v15;
  uint64_t v16;
  const Bytef *v17;
  VisionCoreValueConfidencePoint *v18;
  VisionCoreValueConfidencePoint *v19;
  _DWORD *v20;
  float v21;
  uLong v22;
  id v23;
  int64_t v24;
  uint64_t v25;
  uint64_t v26;
  const Bytef *v27;
  _DWORD *v28;
  VisionCoreValueConfidencePoint *v29;
  VisionCoreValueConfidencePoint *v30;
  _DWORD *v31;
  uLong v32;
  id v33;
  VisionCoreValueConfidencePoint *v34;
  VisionCoreValueConfidencePoint *v35;
  uint64_t v36;
  uint64_t v37;
  const Bytef *v38;
  int8x8_t *v39;
  uint64_t v40;
  VisionCoreValueConfidencePoint *v41;
  int8x8_t v42;
  uLong v43;
  id v44;
  id v45;

  v45 = a3;
  if (self)
  {
    resolvedPointsDistribution_DO_NOT_DIRECTLY_ACCESS = self->_resolvedPointsDistribution_DO_NOT_DIRECTLY_ACCESS;
    if (!resolvedPointsDistribution_DO_NOT_DIRECTLY_ACCESS)
    {
      begin = (float *)self->_increasingValuePoints.__begin_;
      end = self->_increasingValuePoints.__end_;
      if (begin == (float *)end)
      {
LABEL_18:
        resolvedPointsDistribution_DO_NOT_DIRECTLY_ACCESS = 3;
      }
      else
      {
        v7 = 0;
        v8 = 1;
        do
        {
          v9 = _tenthsForValue(*begin);
          if (v9 == 0 || (v8 & 1) == 0)
          {
            if (!v9)
            {
              resolvedPointsDistribution_DO_NOT_DIRECTLY_ACCESS = 1;
              goto LABEL_21;
            }
          }
          else
          {
            v10 = v7 + 1 == v9;
            if (v7 + 1 == v9)
              v11 = v9;
            else
              v11 = v7;
            v12 = v7 == 0;
            if ((_BYTE)v7)
              v7 = v11;
            else
              v7 = v9;
            v8 = v12 || v10;
          }
          begin += 2;
        }
        while (begin != (float *)end);
        if ((v8 & 1) != 0)
          goto LABEL_18;
        resolvedPointsDistribution_DO_NOT_DIRECTLY_ACCESS = 2;
      }
LABEL_21:
      self->_resolvedPointsDistribution_DO_NOT_DIRECTLY_ACCESS = resolvedPointsDistribution_DO_NOT_DIRECTLY_ACCESS;
    }
    if (resolvedPointsDistribution_DO_NOT_DIRECTLY_ACCESS == 2)
    {
      v23 = v45;
      v24 = self->_increasingValuePoints.__end_ - self->_increasingValuePoints.__begin_;
      v25 = (v24 >> 1) + (v24 >> 3);
      v15 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithLength:", v25 + 4));
      v26 = objc_msgSend(v15, "mutableBytes");
      v27 = (const Bytef *)v26;
      v28 = (_DWORD *)(v26 + (v24 >> 1));
      v30 = self->_increasingValuePoints.__begin_;
      v29 = self->_increasingValuePoints.__end_;
      if (v30 != v29)
      {
        v31 = (_DWORD *)v26;
        do
        {
          *v31++ = bswap32(*((_DWORD *)v30 + 1));
          *(_BYTE *)v28 = _tenthsForValue(*(float *)v30);
          v28 = (_DWORD *)((char *)v28 + 1);
          v30 = (VisionCoreValueConfidencePoint *)((char *)v30 + 8);
        }
        while (v30 != v29);
      }
      v32 = adler32(0, 0, 0);
      *v28 = bswap32(adler32(v32, v27, v25));
      objc_msgSend(v23, "VisionCoreEncodeNSData:forKey:", v15, CFSTR("0.1"));
    }
    else if (resolvedPointsDistribution_DO_NOT_DIRECTLY_ACCESS == 3)
    {
      v13 = v45;
      v14 = self->_increasingValuePoints.__end_ - self->_increasingValuePoints.__begin_;
      v15 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithLength:", (v14 >> 1) + 5));
      v16 = objc_msgSend(v15, "mutableBytes");
      v17 = (const Bytef *)v16;
      v18 = self->_increasingValuePoints.__begin_;
      v19 = self->_increasingValuePoints.__end_;
      v20 = (_DWORD *)v16;
      if (v18 != v19)
      {
        v20 = (_DWORD *)v16;
        do
        {
          *v20++ = bswap32(*((_DWORD *)v18 + 1));
          v18 = (VisionCoreValueConfidencePoint *)((char *)v18 + 8);
        }
        while (v18 != v19);
      }
      -[VisionCoreValueConfidenceCurve minimumValue](self, "minimumValue");
      *(_BYTE *)v20 = _tenthsForValue(v21);
      v22 = adler32(0, 0, 0);
      *(_DWORD *)((char *)v20 + 1) = bswap32(adler32(v22, v17, ((unint64_t)v14 >> 1) | 1));
      objc_msgSend(v13, "VisionCoreEncodeNSData:forKey:", v15, CFSTR("v.v"));
    }
    else
    {
      v33 = v45;
      v35 = self->_increasingValuePoints.__begin_;
      v34 = self->_increasingValuePoints.__end_;
      v36 = v34 - v35;
      v15 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithLength:", (v34 - v35) | 4));
      v37 = objc_msgSend(v15, "mutableBytes");
      v38 = (const Bytef *)v37;
      v39 = (int8x8_t *)v37;
      if (v34 != v35)
      {
        v40 = v36 >> 3;
        v41 = self->_increasingValuePoints.__begin_;
        if ((unint64_t)(v36 >> 3) <= 1)
          v40 = 1;
        v39 = (int8x8_t *)v37;
        do
        {
          v42 = *(int8x8_t *)v41;
          v41 = (VisionCoreValueConfidencePoint *)((char *)v41 + 8);
          *v39++ = vrev32_s8(v42);
          --v40;
        }
        while (v40);
      }
      v43 = adler32(0, 0, 0);
      v39->i32[0] = bswap32(adler32(v43, v38, (int)v34 - (int)v35));
      objc_msgSend(v33, "VisionCoreEncodeNSData:forKey:", v15, CFSTR("pts"));
    }

  }
  else
  {
    v44 = v45;
  }

}

- (VisionCoreValueConfidenceCurve)initWithCoder:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  unint64_t v8;
  int v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  unint64_t v14;
  unint64_t v15;
  void *v16;
  void *v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  id v22;
  const Bytef *v23;
  uLong v24;
  int v25;
  vector<VisionCoreValueConfidencePoint, std::allocator<VisionCoreValueConfidencePoint>> *p_increasingValuePoints;
  unsigned int *v27;
  uint64_t v28;
  VisionCoreValueConfidencePoint *end;
  unsigned int v30;
  unsigned int v31;
  unsigned int v32;
  unsigned int v33;
  float v34;
  VisionCoreValueConfidencePoint *value;
  VisionCoreValueConfidencePoint *begin;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  BOOL v40;
  unint64_t v41;
  uint64_t v42;
  unint64_t v43;
  VisionCoreValueConfidencePoint *v44;
  uint64_t v45;
  int v46;
  const Bytef *v47;
  uLong v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  VisionCoreValueConfidencePoint *v52;
  float v53;
  unsigned int v54;
  unsigned int v55;
  VisionCoreValueConfidencePoint *v56;
  uint64_t v57;
  VisionCoreValueConfidencePoint *v58;
  uint64_t v59;
  unint64_t v60;
  uint64_t v61;
  unint64_t v62;
  uint64_t v63;
  unint64_t v64;
  VisionCoreValueConfidencePoint *v65;
  uint64_t v66;
  id v67;
  const Bytef *v68;
  uLong v69;
  int v70;
  vector<VisionCoreValueConfidencePoint, std::allocator<VisionCoreValueConfidencePoint>> *v71;
  uint64_t v72;
  uint64_t v73;
  VisionCoreValueConfidencePoint *v74;
  int8x8_t v75;
  int8x8_t v76;
  VisionCoreValueConfidencePoint *v77;
  VisionCoreValueConfidencePoint *v78;
  VisionCoreValueConfidencePoint *v79;
  uint64_t v80;
  unint64_t v81;
  uint64_t v82;
  unint64_t v83;
  uint64_t v84;
  VisionCoreValueConfidencePoint *v85;
  uint64_t v86;
  VisionCoreValueConfidenceCurve *v87;
  void *v89;
  void *v90;
  const Bytef *v91;
  void *v92;
  int v93;
  id v94;
  int v95;
  vector<VisionCoreValueConfidencePoint, std::allocator<VisionCoreValueConfidencePoint>> *v96;
  objc_super v97;

  v4 = a3;
  if (!self)
    goto LABEL_102;
  v97.receiver = self;
  v97.super_class = (Class)VisionCoreValueConfidenceCurve;
  self = -[VisionCoreValueConfidenceCurve init](&v97, sel_init);
  if (!self)
    goto LABEL_102;
  if (!objc_msgSend(v4, "containsValueForKey:", CFSTR("v.v")))
  {
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("0.1")))
    {
      v11 = v4;
      objc_msgSend(v11, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("0.1"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (v12)
      {
        v14 = objc_msgSend(v12, "length");
        v15 = v14 - 4;
        if (v14 <= 4)
        {
LABEL_10:
          objc_msgSend(MEMORY[0x24BDD1540], "VisionCoreErrorForCorruptedResourceWithLocalizedDescription:", CFSTR("missing value/confidence data"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "failWithError:", v16);
LABEL_99:

          goto LABEL_100;
        }
        v21 = v15 / 5;
        if (-5 * (v15 / 5) == 4 - v14)
        {
          v22 = objc_retainAutorelease(v13);
          v90 = v13;
          v92 = v11;
          v23 = (const Bytef *)objc_msgSend(v22, "bytes");
          v24 = adler32(0, 0, 0);
          v25 = adler32(v24, v23, v15);
          p_increasingValuePoints = &self->_increasingValuePoints;
          std::vector<VisionCoreValueConfidencePoint>::reserve((void **)&self->_increasingValuePoints.__begin_, v15 / 5);
          v94 = v22;
          v95 = v25;
          v27 = (unsigned int *)&v23[4 * v21];
          if (v15 >= 5)
          {
            v28 = 0;
            if (v21 <= 1)
              v21 = 1;
            end = self->_increasingValuePoints.__end_;
            do
            {
              v31 = *(_DWORD *)v23;
              v23 += 4;
              v30 = v31;
              v32 = *(unsigned __int8 *)v27;
              v27 = (unsigned int *)((char *)v27 + 1);
              v33 = bswap32(v30);
              v34 = (float)v32 / 10.0;
              value = self->_increasingValuePoints.__end_cap_.__value_;
              if (end >= value)
              {
                begin = p_increasingValuePoints->__begin_;
                v37 = (end - p_increasingValuePoints->__begin_) >> 3;
                v38 = v37 + 1;
                if ((unint64_t)(v37 + 1) >> 61)
                  std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
                v39 = value - begin;
                if (v39 >> 2 > v38)
                  v38 = v39 >> 2;
                v40 = (unint64_t)v39 >= 0x7FFFFFFFFFFFFFF8;
                v41 = 0x1FFFFFFFFFFFFFFFLL;
                if (!v40)
                  v41 = v38;
                if (v41)
                {
                  v41 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v41);
                  begin = self->_increasingValuePoints.__begin_;
                  end = self->_increasingValuePoints.__end_;
                }
                else
                {
                  v42 = 0;
                }
                v43 = v41 + 8 * v37;
                *(float *)v43 = v34;
                *(_DWORD *)(v43 + 4) = v33;
                v44 = (VisionCoreValueConfidencePoint *)v43;
                if (end != begin)
                {
                  do
                  {
                    v45 = *((_QWORD *)end - 1);
                    end = (VisionCoreValueConfidencePoint *)((char *)end - 8);
                    *((_QWORD *)v44 - 1) = v45;
                    v44 = (VisionCoreValueConfidencePoint *)((char *)v44 - 8);
                  }
                  while (end != begin);
                  begin = p_increasingValuePoints->__begin_;
                }
                end = (VisionCoreValueConfidencePoint *)(v43 + 8);
                self->_increasingValuePoints.__begin_ = v44;
                self->_increasingValuePoints.__end_ = (VisionCoreValueConfidencePoint *)(v43 + 8);
                self->_increasingValuePoints.__end_cap_.__value_ = (VisionCoreValueConfidencePoint *)(v41 + 8 * v42);
                if (begin)
                  operator delete(begin);
              }
              else
              {
                *(float *)end = v34;
                *((_DWORD *)end + 1) = v33;
                end = (VisionCoreValueConfidencePoint *)((char *)end + 8);
              }
              self->_increasingValuePoints.__end_ = end;
              ++v28;
            }
            while (v28 != v21);
          }
          if (bswap32(*v27) == v95)
          {
            v46 = 2;
            goto LABEL_94;
          }
          objc_msgSend(MEMORY[0x24BDD1540], "VisionCoreErrorForCorruptedResourceWithLocalizedDescription:", CFSTR("corrupted value/confidence data"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = v90;
          v11 = v92;
          objc_msgSend(v92, "failWithError:", v16);
          goto LABEL_99;
        }
LABEL_45:
        objc_msgSend(MEMORY[0x24BDD1540], "VisionCoreErrorForCorruptedResourceWithLocalizedDescription:", CFSTR("unbalanced value/confidence data"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "failWithError:", v16);
        goto LABEL_99;
      }
    }
    else
    {
      if (!objc_msgSend(v4, "containsValueForKey:", CFSTR("pts")))
      {
        objc_msgSend(MEMORY[0x24BDD1540], "VisionCoreErrorForCorruptedResourceWithLocalizedDescription:", CFSTR("missing curve data"));
        v11 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "failWithError:", v11);
LABEL_101:

        goto LABEL_102;
      }
      v11 = v4;
      objc_msgSend(v11, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pts"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v17;
      if (v17)
      {
        v18 = objc_msgSend(v17, "length");
        v19 = v18 - 4;
        if (v18 <= 4)
          goto LABEL_10;
        if ((v19 & 7) == 0)
        {
          v67 = objc_retainAutorelease(v13);
          v68 = (const Bytef *)objc_msgSend(v67, "bytes");
          v69 = adler32(0, 0, 0);
          v70 = adler32(v69, v68, v19);
          v71 = &self->_increasingValuePoints;
          std::vector<VisionCoreValueConfidencePoint>::reserve((void **)&self->_increasingValuePoints.__begin_, v19 >> 3);
          v94 = v67;
          if (v19 >= 8)
          {
            v72 = 0;
            if (v19 >> 3 <= 1)
              v73 = 1;
            else
              v73 = v19 >> 3;
            v74 = self->_increasingValuePoints.__end_;
            do
            {
              v75 = *(int8x8_t *)v68;
              v68 += 8;
              v76 = vrev32_s8(v75);
              v77 = self->_increasingValuePoints.__end_cap_.__value_;
              if (v74 >= v77)
              {
                v79 = v71->__begin_;
                v80 = (v74 - v71->__begin_) >> 3;
                v81 = v80 + 1;
                if ((unint64_t)(v80 + 1) >> 61)
                  std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
                v82 = v77 - v79;
                if (v82 >> 2 > v81)
                  v81 = v82 >> 2;
                if ((unint64_t)v82 >= 0x7FFFFFFFFFFFFFF8)
                  v83 = 0x1FFFFFFFFFFFFFFFLL;
                else
                  v83 = v81;
                if (v83)
                {
                  v83 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v83);
                  v79 = self->_increasingValuePoints.__begin_;
                  v74 = self->_increasingValuePoints.__end_;
                }
                else
                {
                  v84 = 0;
                }
                v85 = (VisionCoreValueConfidencePoint *)(v83 + 8 * v80);
                *(int8x8_t *)v85 = v76;
                v78 = (VisionCoreValueConfidencePoint *)((char *)v85 + 8);
                if (v74 != v79)
                {
                  do
                  {
                    v86 = *((_QWORD *)v74 - 1);
                    v74 = (VisionCoreValueConfidencePoint *)((char *)v74 - 8);
                    *((_QWORD *)v85 - 1) = v86;
                    v85 = (VisionCoreValueConfidencePoint *)((char *)v85 - 8);
                  }
                  while (v74 != v79);
                  v79 = v71->__begin_;
                }
                self->_increasingValuePoints.__begin_ = v85;
                self->_increasingValuePoints.__end_ = v78;
                self->_increasingValuePoints.__end_cap_.__value_ = (VisionCoreValueConfidencePoint *)(v83 + 8 * v84);
                if (v79)
                  operator delete(v79);
              }
              else
              {
                *(int8x8_t *)v74 = v76;
                v78 = (VisionCoreValueConfidencePoint *)((char *)v74 + 8);
              }
              self->_increasingValuePoints.__end_ = v78;
              ++v72;
              v74 = v78;
            }
            while (v72 != v73);
          }
          if (bswap32(*(_DWORD *)v68) == v70)
          {
            v46 = 1;
            goto LABEL_94;
          }
          objc_msgSend(MEMORY[0x24BDD1540], "VisionCoreErrorForCorruptedResourceWithLocalizedDescription:", CFSTR("corrupted value/confidence data"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "failWithError:", v16);
          goto LABEL_99;
        }
        goto LABEL_45;
      }
    }
LABEL_100:

    goto LABEL_101;
  }
  v5 = v4;
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("v.v"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
  {
LABEL_97:

LABEL_102:
    v87 = 0;
    goto LABEL_103;
  }
  v8 = objc_msgSend(v6, "length");
  v9 = v8;
  if (v8 <= 3 || (v8 & 0xFFFFFFFFFFFFFFFELL) == 4)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "VisionCoreErrorForCorruptedResourceWithLocalizedDescription:", CFSTR("missing value/confidence data"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "failWithError:", v10);
LABEL_96:

    goto LABEL_97;
  }
  v20 = v8 - 5;
  if (((v8 - 5) & 3) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "VisionCoreErrorForCorruptedResourceWithLocalizedDescription:", CFSTR("unbalanced value/confidence data"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "failWithError:", v10);
    goto LABEL_96;
  }
  v94 = objc_retainAutorelease(v7);
  v89 = v5;
  v47 = (const Bytef *)objc_msgSend(v94, "bytes");
  v48 = adler32(0, 0, 0);
  v91 = &v47[v20];
  v93 = adler32(v48, v47, v9 - 4);
  v49 = v47[v20];
  v96 = &self->_increasingValuePoints;
  std::vector<VisionCoreValueConfidencePoint>::reserve((void **)&self->_increasingValuePoints.__begin_, v20 >> 2);
  if (v20 >= 4)
  {
    v50 = 0;
    if (v20 >> 2 <= 1)
      v51 = 1;
    else
      v51 = v20 >> 2;
    v52 = self->_increasingValuePoints.__end_;
    do
    {
      v53 = (float)(unint64_t)(v50 + v49) / 10.0;
      v54 = *(_DWORD *)v47;
      v47 += 4;
      v55 = bswap32(v54);
      v56 = self->_increasingValuePoints.__end_cap_.__value_;
      if (v52 >= v56)
      {
        v57 = v49;
        v58 = v96->__begin_;
        v59 = (v52 - v96->__begin_) >> 3;
        v60 = v59 + 1;
        if ((unint64_t)(v59 + 1) >> 61)
          std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
        v61 = v56 - v58;
        if (v61 >> 2 > v60)
          v60 = v61 >> 2;
        v40 = (unint64_t)v61 >= 0x7FFFFFFFFFFFFFF8;
        v62 = 0x1FFFFFFFFFFFFFFFLL;
        if (!v40)
          v62 = v60;
        if (v62)
        {
          v62 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v62);
          v58 = self->_increasingValuePoints.__begin_;
          v52 = self->_increasingValuePoints.__end_;
        }
        else
        {
          v63 = 0;
        }
        v64 = v62 + 8 * v59;
        *(float *)v64 = v53;
        *(_DWORD *)(v64 + 4) = v55;
        v65 = (VisionCoreValueConfidencePoint *)v64;
        v49 = v57;
        if (v52 != v58)
        {
          do
          {
            v66 = *((_QWORD *)v52 - 1);
            v52 = (VisionCoreValueConfidencePoint *)((char *)v52 - 8);
            *((_QWORD *)v65 - 1) = v66;
            v65 = (VisionCoreValueConfidencePoint *)((char *)v65 - 8);
          }
          while (v52 != v58);
          v58 = v96->__begin_;
        }
        v52 = (VisionCoreValueConfidencePoint *)(v64 + 8);
        self->_increasingValuePoints.__begin_ = v65;
        self->_increasingValuePoints.__end_ = (VisionCoreValueConfidencePoint *)(v64 + 8);
        self->_increasingValuePoints.__end_cap_.__value_ = (VisionCoreValueConfidencePoint *)(v62 + 8 * v63);
        if (v58)
          operator delete(v58);
      }
      else
      {
        *(float *)v52 = v53;
        *((_DWORD *)v52 + 1) = v55;
        v52 = (VisionCoreValueConfidencePoint *)((char *)v52 + 8);
      }
      self->_increasingValuePoints.__end_ = v52;
      ++v50;
    }
    while (v50 != v51);
  }
  if (bswap32(*(_DWORD *)(v91 + 1)) != v93)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "VisionCoreErrorForCorruptedResourceWithLocalizedDescription:", CFSTR("corrupted value/confidence data"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v89;
    objc_msgSend(v89, "failWithError:", v10);
    goto LABEL_96;
  }
  v46 = 3;
LABEL_94:
  self->_resolvedPointsDistribution_DO_NOT_DIRECTLY_ACCESS = v46;

  self->_confidencesAreIncreasing = *((float *)self->_increasingValuePoints.__begin_ + 1) < *((float *)self->_increasingValuePoints.__end_
                                                                                            - 1);
  self = self;
  v87 = self;
LABEL_103:

  return v87;
}

- (void).cxx_destruct
{
  VisionCoreValueConfidencePoint *begin;

  begin = self->_increasingValuePoints.__begin_;
  if (begin)
  {
    self->_increasingValuePoints.__end_ = begin;
    operator delete(begin);
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  return self;
}

+ (VisionCoreValueConfidenceCurve)curveWithValues:(const float *)a3 confidences:(const float *)a4 count:(unint64_t)a5 error:(id *)a6
{
  id v10;
  float *v11;
  uint64_t v12;
  float *v13;
  objc_super v15;

  v10 = objc_alloc((Class)a1);
  if (v10)
  {
    v15.receiver = v10;
    v15.super_class = (Class)VisionCoreValueConfidenceCurve;
    v11 = objc_msgSendSuper2(&v15, sel_init);
  }
  else
  {
    v11 = 0;
  }
  if (!-[VisionCoreValueConfidenceCurve _prepareForCount:error:]((uint64_t)v11, a5, a6))
  {
LABEL_9:
    v13 = 0;
    goto LABEL_10;
  }
  if (a5)
  {
    v12 = 0;
    while ((-[VisionCoreValueConfidenceCurve _addValue:confidence:atIndex:error:]((uint64_t)v11, a3[v12], a4[v12]) & 1) != 0)
    {
      if (a5 == ++v12)
        goto LABEL_8;
    }
    goto LABEL_9;
  }
LABEL_8:
  -[VisionCoreValueConfidenceCurve _finalizeInitialization](v11);
  v13 = v11;
LABEL_10:

  return (VisionCoreValueConfidenceCurve *)v13;
}

+ (VisionCoreValueConfidenceCurve)curveWithValuesArray:(id)a3 confidencesArray:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  unint64_t v10;
  uint64_t v11;
  id v12;
  float *v13;
  uint64_t v14;
  void *v15;
  float v16;
  float v17;
  void *v18;
  float v19;
  char v20;
  void *v21;
  objc_super v23;

  v8 = a3;
  v9 = a4;
  v10 = objc_msgSend(v8, "count");
  v11 = objc_msgSend(v9, "count");
  if (v10 == v11)
  {
    v12 = objc_alloc((Class)a1);
    if (v12)
    {
      v23.receiver = v12;
      v23.super_class = (Class)VisionCoreValueConfidenceCurve;
      v13 = objc_msgSendSuper2(&v23, sel_init);
    }
    else
    {
      v13 = 0;
    }
    if (-[VisionCoreValueConfidenceCurve _prepareForCount:error:]((uint64_t)v13, v10, a5))
    {
      if (!v10)
      {
LABEL_9:
        -[VisionCoreValueConfidenceCurve _finalizeInitialization](v13);
        a5 = v13;
LABEL_13:

        goto LABEL_14;
      }
      v14 = 0;
      while (1)
      {
        objc_msgSend(v8, "objectAtIndexedSubscript:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "floatValue");
        v17 = v16;
        objc_msgSend(v9, "objectAtIndexedSubscript:", v14);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "floatValue");
        v20 = -[VisionCoreValueConfidenceCurve _addValue:confidence:atIndex:error:]((uint64_t)v13, v17, v19);

        if ((v20 & 1) == 0)
          break;
        if (v10 == ++v14)
          goto LABEL_9;
      }
    }
    a5 = 0;
    goto LABEL_13;
  }
  if (a5)
  {
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Cannot create a curve from %lu values and %lu confidences"), v10, v11);
    objc_msgSend(MEMORY[0x24BDD1540], "VisionCoreErrorForInvalidArgumentWithLocalizedDescription:", v21);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    a5 = 0;
  }
LABEL_14:

  return (VisionCoreValueConfidenceCurve *)a5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (uint64_t)_prepareForCount:(_QWORD *)a3 error:
{
  id v4;

  if (result)
  {
    if (a2)
    {
      std::vector<VisionCoreValueConfidencePoint>::reserve((void **)(result + 8), a2);
      return 1;
    }
    else if (a3)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "VisionCoreErrorForInvalidOperationWithLocalizedDescription:", CFSTR("value/confidence curve must have at least one data point"));
      v4 = (id)objc_claimAutoreleasedReturnValue();
      result = 0;
      *a3 = v4;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (uint64_t)_addValue:(float)a3 confidence:atIndex:error:
{
  _QWORD *v5;
  unint64_t v6;
  float *v7;
  float *v8;
  float *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  BOOL v13;
  unint64_t v14;
  uint64_t v15;
  float *v16;
  unint64_t v17;
  uint64_t v18;

  if (result)
  {
    v5 = (_QWORD *)result;
    v7 = *(float **)(result + 16);
    v6 = *(_QWORD *)(result + 24);
    if ((unint64_t)v7 >= v6)
    {
      v9 = *(float **)(result + 8);
      v10 = ((char *)v7 - (char *)v9) >> 3;
      v11 = v10 + 1;
      if ((unint64_t)(v10 + 1) >> 61)
        std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
      v12 = v6 - (_QWORD)v9;
      if (v12 >> 2 > v11)
        v11 = v12 >> 2;
      v13 = (unint64_t)v12 >= 0x7FFFFFFFFFFFFFF8;
      v14 = 0x1FFFFFFFFFFFFFFFLL;
      if (!v13)
        v14 = v11;
      if (v14)
      {
        v14 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v14);
        v9 = (float *)v5[1];
        v7 = (float *)v5[2];
      }
      else
      {
        v15 = 0;
      }
      v16 = (float *)(v14 + 8 * v10);
      v17 = v14 + 8 * v15;
      *v16 = a2;
      v16[1] = a3;
      v8 = v16 + 2;
      if (v7 != v9)
      {
        do
        {
          v18 = *((_QWORD *)v7 - 1);
          v7 -= 2;
          *((_QWORD *)v16 - 1) = v18;
          v16 -= 2;
        }
        while (v7 != v9);
        v9 = (float *)v5[1];
      }
      v5[1] = v16;
      v5[2] = v8;
      v5[3] = v17;
      if (v9)
        operator delete(v9);
    }
    else
    {
      *v7 = a2;
      v7[1] = a3;
      v8 = v7 + 2;
    }
    v5[2] = v8;
    return 1;
  }
  return result;
}

- (float)_finalizeInitialization
{
  uint64_t v7;
  float *v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  float *v13;
  uint64_t v14;
  float v15;
  int v16;
  unint64_t v17;
  unint64_t v18;
  float v19;
  float *v20;
  float v21;
  float v22;
  float *v23;
  uint64_t v24;
  float v25;
  float v26;
  BOOL v27;
  float v28;
  unint64_t v29;
  float *v30;
  float v31;
  int v32;
  uint64_t v33;
  float v34;
  float v35;
  uint64_t v36;
  float *v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  float *v44;
  BOOL v46;
  uint64_t v47;
  unint64_t v48;
  float *v49;
  float v50;
  int v51;
  uint64_t v52;
  float v53;
  uint64_t v54;
  int64_t v55;
  int64_t v56;
  int64_t v57;
  uint64_t v58;
  float *v59;
  float *v60;
  float v61;
  int v62;
  float *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  float *v69;
  float *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  unint64_t v74;
  float *v75;
  float v76;
  int v77;
  float *v78;
  uint64_t v80;
  float v81;
  int v82;
  float *v83;
  uint64_t v84;

  v7 = (uint64_t)result;
LABEL_2:
  v8 = a2 - 2;
  v9 = v7;
  while (2)
  {
    v7 = v9;
    v10 = (uint64_t)a2 - v9;
    v11 = (uint64_t)((uint64_t)a2 - v9) >> 3;
    switch(v11)
    {
      case 0uLL:
      case 1uLL:
        return result;
      case 2uLL:
        if (*v8 < *(float *)v9)
        {
          v36 = *(_QWORD *)v9;
          *(_QWORD *)v9 = *(_QWORD *)v8;
          *(_QWORD *)v8 = v36;
        }
        return result;
      case 3uLL:
        return std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[VisionCoreValueConfidenceCurve _finalizeInitialization]::$_0 &,VisionCoreValueConfidencePoint *>((float *)v9, (float *)(v9 + 8), a2 - 2);
      case 4uLL:
        return std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,-[VisionCoreValueConfidenceCurve _finalizeInitialization]::$_0 &,VisionCoreValueConfidencePoint *>((float *)v9, (float *)(v9 + 8), (float *)(v9 + 16), (_QWORD *)a2 - 1);
      case 5uLL:
        v37 = (float *)(v9 + 16);
        v38 = (uint64_t *)(v9 + 24);
        result = std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,-[VisionCoreValueConfidenceCurve _finalizeInitialization]::$_0 &,VisionCoreValueConfidencePoint *>((float *)v9, (float *)(v9 + 8), (float *)(v9 + 16), (_QWORD *)(v9 + 24));
        if (*v8 < *(float *)(v9 + 24))
        {
          v39 = *v38;
          *v38 = *(_QWORD *)v8;
          *(_QWORD *)v8 = v39;
          if (*(float *)v38 < *v37)
          {
            v40 = *(_QWORD *)v37;
            v41 = *v38;
            *(_QWORD *)v37 = *v38;
            *v38 = v40;
            if (*(float *)(v9 + 8) > *(float *)&v41)
            {
              v42 = *(_QWORD *)(v9 + 8);
              *(_QWORD *)(v9 + 8) = v41;
              *(_QWORD *)(v9 + 16) = v42;
              if (*(float *)v9 > *(float *)&v41)
              {
                v43 = *(_QWORD *)v9;
                *(_QWORD *)v9 = v41;
                *(_QWORD *)(v9 + 8) = v43;
              }
            }
          }
        }
        return result;
      default:
        if (v10 <= 191)
        {
          v44 = (float *)(v9 + 8);
          v46 = (float *)v9 == a2 || v44 == a2;
          if ((a4 & 1) != 0)
          {
            if (!v46)
            {
              v47 = 0;
              v48 = v9;
              do
              {
                v49 = v44;
                v50 = *(float *)(v48 + 8);
                if (v50 < *(float *)v48)
                {
                  v51 = *(_DWORD *)(v48 + 12);
                  v52 = v47;
                  while (1)
                  {
                    *(_QWORD *)(v9 + v52 + 8) = *(_QWORD *)(v9 + v52);
                    if (!v52)
                      break;
                    v53 = *(float *)(v9 + v52 - 8);
                    v52 -= 8;
                    if (v53 <= v50)
                    {
                      v54 = v9 + v52 + 8;
                      goto LABEL_78;
                    }
                  }
                  v54 = v9;
LABEL_78:
                  *(float *)v54 = v50;
                  *(_DWORD *)(v54 + 4) = v51;
                }
                v44 = v49 + 2;
                v47 += 8;
                v48 = (unint64_t)v49;
              }
              while (v49 + 2 != a2);
            }
          }
          else if (!v46)
          {
            do
            {
              v80 = (uint64_t)v44;
              v81 = *(float *)(v7 + 8);
              if (v81 < *(float *)v7)
              {
                v82 = *(_DWORD *)(v7 + 12);
                do
                {
                  v83 = v44;
                  v84 = *((_QWORD *)v44 - 1);
                  v44 -= 2;
                  *(_QWORD *)v83 = v84;
                }
                while (*(v83 - 4) > v81);
                *v44 = v81;
                *((_DWORD *)v44 + 1) = v82;
              }
              v44 = (float *)(v80 + 8);
              v7 = v80;
            }
            while ((float *)(v80 + 8) != a2);
          }
          return result;
        }
        if (!a3)
        {
          if ((float *)v9 != a2)
          {
            v55 = (v11 - 2) >> 1;
            v56 = v55;
            do
            {
              v57 = v56;
              if (v55 >= v56)
              {
                v58 = (2 * v56) | 1;
                v59 = (float *)(v9 + 8 * v58);
                if (2 * v57 + 2 < (uint64_t)v11 && *v59 < v59[2])
                {
                  v59 += 2;
                  v58 = 2 * v57 + 2;
                }
                v60 = (float *)(v9 + 8 * v57);
                v61 = *v60;
                if (*v59 >= *v60)
                {
                  v62 = *((_DWORD *)v60 + 1);
                  do
                  {
                    v63 = v60;
                    v60 = v59;
                    *(_QWORD *)v63 = *(_QWORD *)v59;
                    if (v55 < v58)
                      break;
                    v64 = 2 * v58;
                    v58 = (2 * v58) | 1;
                    v59 = (float *)(v9 + 8 * v58);
                    v65 = v64 + 2;
                    if (v65 < (uint64_t)v11 && *v59 < v59[2])
                    {
                      v59 += 2;
                      v58 = v65;
                    }
                  }
                  while (*v59 >= v61);
                  *v60 = v61;
                  *((_DWORD *)v60 + 1) = v62;
                }
              }
              v56 = v57 - 1;
            }
            while (v57);
            v66 = (unint64_t)v10 >> 3;
            do
            {
              v67 = 0;
              v68 = *(_QWORD *)v9;
              v69 = (float *)v9;
              do
              {
                v70 = v69;
                v69 += 2 * v67 + 2;
                v71 = 2 * v67;
                v67 = (2 * v67) | 1;
                v72 = v71 + 2;
                if (v72 < v66 && *v69 < v69[2])
                {
                  v69 += 2;
                  v67 = v72;
                }
                *(_QWORD *)v70 = *(_QWORD *)v69;
              }
              while (v67 <= (uint64_t)((unint64_t)(v66 - 2) >> 1));
              a2 -= 2;
              if (v69 == a2)
              {
                *(_QWORD *)v69 = v68;
              }
              else
              {
                *(_QWORD *)v69 = *(_QWORD *)a2;
                *(_QWORD *)a2 = v68;
                v73 = (uint64_t)v69 - v9 + 8;
                if (v73 >= 9)
                {
                  v74 = (((unint64_t)v73 >> 3) - 2) >> 1;
                  v75 = (float *)(v9 + 8 * v74);
                  v76 = *v69;
                  if (*v75 < *v69)
                  {
                    v77 = *((_DWORD *)v69 + 1);
                    do
                    {
                      v78 = v69;
                      v69 = v75;
                      *(_QWORD *)v78 = *(_QWORD *)v75;
                      if (!v74)
                        break;
                      v74 = (v74 - 1) >> 1;
                      v75 = (float *)(v9 + 8 * v74);
                    }
                    while (*v75 < v76);
                    *v69 = v76;
                    *((_DWORD *)v69 + 1) = v77;
                  }
                }
              }
            }
            while (v66-- > 2);
          }
          return result;
        }
        v12 = v11 >> 1;
        v13 = (float *)(v9 + 8 * (v11 >> 1));
        if ((unint64_t)v10 < 0x401)
        {
          result = std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[VisionCoreValueConfidenceCurve _finalizeInitialization]::$_0 &,VisionCoreValueConfidencePoint *>((float *)(v7 + 8 * (v11 >> 1)), (float *)v7, a2 - 2);
        }
        else
        {
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[VisionCoreValueConfidenceCurve _finalizeInitialization]::$_0 &,VisionCoreValueConfidencePoint *>((float *)v7, (float *)(v7 + 8 * (v11 >> 1)), a2 - 2);
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[VisionCoreValueConfidenceCurve _finalizeInitialization]::$_0 &,VisionCoreValueConfidencePoint *>((float *)(v7 + 8), v13 - 2, a2 - 4);
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[VisionCoreValueConfidenceCurve _finalizeInitialization]::$_0 &,VisionCoreValueConfidencePoint *>((float *)(v7 + 16), (float *)(v7 + 8 + 8 * v12), a2 - 6);
          result = std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[VisionCoreValueConfidenceCurve _finalizeInitialization]::$_0 &,VisionCoreValueConfidencePoint *>(v13 - 2, v13, (float *)(v7 + 8 + 8 * v12));
          v14 = *(_QWORD *)v7;
          *(_QWORD *)v7 = *(_QWORD *)v13;
          *(_QWORD *)v13 = v14;
        }
        --a3;
        if ((a4 & 1) == 0)
        {
          v15 = *(float *)v7;
          if (*(float *)(v7 - 8) < *(float *)v7)
            goto LABEL_12;
          if (*v8 <= v15)
          {
            v29 = v7 + 8;
            do
            {
              v9 = v29;
              if (v29 >= (unint64_t)a2)
                break;
              v29 += 8;
            }
            while (*(float *)v9 <= v15);
          }
          else
          {
            v9 = v7;
            do
            {
              v28 = *(float *)(v9 + 8);
              v9 += 8;
            }
            while (v28 <= v15);
          }
          v30 = a2;
          if (v9 < (unint64_t)a2)
          {
            v30 = a2;
            do
            {
              v31 = *(v30 - 2);
              v30 -= 2;
            }
            while (v31 > v15);
          }
          v32 = *(_DWORD *)(v7 + 4);
          while (v9 < (unint64_t)v30)
          {
            v33 = *(_QWORD *)v9;
            *(_QWORD *)v9 = *(_QWORD *)v30;
            *(_QWORD *)v30 = v33;
            do
            {
              v34 = *(float *)(v9 + 8);
              v9 += 8;
            }
            while (v34 <= v15);
            do
            {
              v35 = *(v30 - 2);
              v30 -= 2;
            }
            while (v35 > v15);
          }
          if (v9 - 8 != v7)
            *(_QWORD *)v7 = *(_QWORD *)(v9 - 8);
          a4 = 0;
          *(float *)(v9 - 8) = v15;
          *(_DWORD *)(v9 - 4) = v32;
          continue;
        }
        v15 = *(float *)v7;
LABEL_12:
        v16 = *(_DWORD *)(v7 + 4);
        v17 = v7;
        do
        {
          v18 = v17;
          v19 = *(float *)(v17 + 8);
          v17 += 8;
        }
        while (v19 < v15);
        v20 = a2;
        if (v18 == v7)
        {
          v20 = a2;
          do
          {
            if (v17 >= (unint64_t)v20)
              break;
            v22 = *(v20 - 2);
            v20 -= 2;
          }
          while (v22 >= v15);
        }
        else
        {
          do
          {
            v21 = *(v20 - 2);
            v20 -= 2;
          }
          while (v21 >= v15);
        }
        v9 = v17;
        if (v17 < (unint64_t)v20)
        {
          v23 = v20;
          do
          {
            v24 = *(_QWORD *)v9;
            *(_QWORD *)v9 = *(_QWORD *)v23;
            *(_QWORD *)v23 = v24;
            do
            {
              v25 = *(float *)(v9 + 8);
              v9 += 8;
            }
            while (v25 < v15);
            do
            {
              v26 = *(v23 - 2);
              v23 -= 2;
            }
            while (v26 >= v15);
          }
          while (v9 < (unint64_t)v23);
        }
        if (v9 - 8 != v7)
          *(_QWORD *)v7 = *(_QWORD *)(v9 - 8);
        *(float *)(v9 - 8) = v15;
        *(_DWORD *)(v9 - 4) = v16;
        if (v17 < (unint64_t)v20)
        {
LABEL_31:
          result = (float *)std::__introsort<std::_ClassicAlgPolicy,-[VisionCoreValueConfidenceCurve _finalizeInitialization]::$_0 &,VisionCoreValueConfidencePoint *,false>(v7, v9 - 8, a3, a4 & 1);
          a4 = 0;
          continue;
        }
        v27 = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,-[VisionCoreValueConfidenceCurve _finalizeInitialization]::$_0 &,VisionCoreValueConfidencePoint *>(v7, v9 - 8);
        result = (float *)std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,-[VisionCoreValueConfidenceCurve _finalizeInitialization]::$_0 &,VisionCoreValueConfidencePoint *>(v9, (uint64_t)a2);
        if (!(_DWORD)result)
        {
          if (v27)
            continue;
          goto LABEL_31;
        }
        a2 = (float *)(v9 - 8);
        if (!v27)
          goto LABEL_2;
        return result;
    }
  }
}

@end
