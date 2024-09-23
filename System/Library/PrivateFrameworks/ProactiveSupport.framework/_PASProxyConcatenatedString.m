@implementation _PASProxyConcatenatedString

- (void)dealloc
{
  objc_super v3;

  free(self->_startIndices);
  v3.receiver = self;
  v3.super_class = (Class)_PASProxyConcatenatedString;
  -[_PASProxyConcatenatedString dealloc](&v3, sel_dealloc);
}

- (unint64_t)length
{
  return self->_length;
}

- (unsigned)characterAtIndex:(unint64_t)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  -[_PASProxyConcatenatedString _validateRange:]((uint64_t)self, a3, 1);
  v5 = -[_PASProxyConcatenatedString _locationOfStringIndex:]((uint64_t)self, a3);
  v7 = v6;
  -[NSArray objectAtIndexedSubscript:](self->_components, "objectAtIndexedSubscript:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOWORD(v7) = objc_msgSend(v8, "characterAtIndex:", v7);

  return v7;
}

- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  NSUInteger v12;
  NSUInteger v13;
  BOOL v14;
  id v15;

  length = a4.length;
  location = a4.location;
  -[_PASProxyConcatenatedString _validateRange:]((uint64_t)self, a4.location, a4.length);
  if (length)
  {
    v8 = -[_PASProxyConcatenatedString _locationOfStringIndex:]((uint64_t)self, location);
    for (i = v9; ; i = 0)
    {
      -[NSArray objectAtIndexedSubscript:](self->_components, "objectAtIndexedSubscript:", v8);
      v15 = (id)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v15, "length");
      v12 = v11 - i;
      v13 = length >= v11 - i ? v11 - i : length;
      objc_msgSend(v15, "getCharacters:range:", a3, i, v13);
      v14 = length > v12;
      length -= v12;
      if (!v14)
        break;
      a3 += v12;
      ++v8;

    }
  }
}

- (id)_createSubstringWithRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  void *v6;
  void *v7;

  length = a3.length;
  location = a3.location;
  v6 = (void *)MEMORY[0x1A1AFDC98](self, a2);
  -[_PASProxyConcatenatedString _substringWithRange:]((uint64_t)self, location, length);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v6);
  return v7;
}

- (id)substringWithRange:(_NSRange)a3
{
  return -[_PASProxyConcatenatedString _substringWithRange:]((uint64_t)self, a3.location, a3.length);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_components, 0);
}

- (__CFString)_substringWithRange:(unint64_t)a3
{
  unint64_t v6;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  size_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  void *v17;
  void *v18;
  unint64_t v19;
  void *v20;
  uint64_t v21;
  unint64_t v22;
  void *v23;
  void *v24;
  _PASProxyConcatenatedString *v25;
  void *v26;
  id v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  const void *v33;
  uint64_t v34;
  size_t v35;
  char *v36;
  size_t v37;
  uint64_t v38;
  void *v39;
  int v40;
  id v41;
  void *v42;
  size_t v43;
  id v44;
  objc_super v45;
  void *memptr;
  uint64_t v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return (__CFString *)0;
  v6 = a3;
  -[_PASProxyConcatenatedString _validateRange:](a1, a2, a3);
  if (!a3)
    return &stru_1E4431528;
  if (!a2 && a3 == *(_QWORD *)(a1 + 24))
    return (__CFString *)(id)a1;
  v8 = -[_PASProxyConcatenatedString _locationOfStringIndex:](a1, a2);
  v10 = v9;
  objc_msgSend(*(id *)(a1 + 8), "objectAtIndexedSubscript:", v8);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "length");
  v13 = v12 - v10;
  v14 = a3 - (v12 - v10);
  if (a3 <= v12 - v10)
  {
    if (v10 || a3 != v12)
    {
      v28 = (void *)MEMORY[0x1A1AFDC98]();
      objc_msgSend(v11, "substringWithRange:", v10, v6);
      v27 = (id)objc_claimAutoreleasedReturnValue();
      objc_autoreleasePoolPop(v28);
    }
    else
    {
      v27 = v11;
    }
  }
  else
  {
    v44 = v11;
    v15 = objc_msgSend(*(id *)(a1 + 8), "count");
    v16 = v15;
    if (v10 && v8 < v15 - 1)
    {
      v43 = v14;
      objc_msgSend(*(id *)(a1 + 8), "objectAtIndexedSubscript:", v8 + 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v17, "length") + v13 > a3)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v11 = v44;
            v29 = objc_msgSend(objc_retainAutorelease(v44), "_fastCStringContents:", 0);
            v30 = v17;
            if (v29
              && (v31 = v29, (v32 = objc_msgSend(objc_retainAutorelease(v17), "_fastCStringContents:", 0)) != 0))
            {
              v33 = (const void *)v32;
              v34 = MEMORY[0x1A1AFDC98]();
              v42 = (void *)v34;
              v35 = a3 + 1;
              memptr = 0;
              v47 = 0;
              if (a3 > 0x7F)
              {
                v40 = malloc_type_posix_memalign(&memptr, 8uLL, a3 + 1, 0xE296A5D2uLL);
                LOBYTE(v47) = 0;
                if (v40)
                {
                  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99850], CFSTR("malloc failed"), 0);
                  v41 = (id)objc_claimAutoreleasedReturnValue();
                  objc_exception_throw(v41);
                }
                v36 = (char *)memptr;
              }
              else
              {
                MEMORY[0x1E0C80A78](v34);
                v36 = (char *)&v42 - ((a3 + 16) & 0xFFFFFFFFFFFFFFF0);
                bzero((char *)&v42 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0), v35);
                memptr = v36;
                LOBYTE(v47) = 1;
              }
              v37 = v43;
              v38 = v47;
              memcpy(v36, (const void *)(v31 + v10), v13);
              memcpy(&v36[v13], v33, v37);
              v36[v6] = 0;
              objc_msgSend(MEMORY[0x1E0CB3940], "_pas_stringWithConsumedAllocaDescrNoCopy:bufferSize:encoding:nullTerminated:isExternalRepresentation:", v36, v38, v35, 1, 1, 0);
              v27 = (id)objc_claimAutoreleasedReturnValue();
              v11 = v44;
              v39 = v42;
            }
            else
            {
              v39 = (void *)MEMORY[0x1A1AFDC98]();
              v45.receiver = (id)a1;
              v45.super_class = (Class)_PASProxyConcatenatedString;
              objc_msgSendSuper2(&v45, sel_substringWithRange_, a2, a3);
              v27 = (id)objc_claimAutoreleasedReturnValue();
            }
            objc_autoreleasePoolPop(v39);

            goto LABEL_32;
          }
        }
      }

    }
    v43 = a3;
    v18 = (void *)objc_opt_new();
    if (v8 <= v16)
      v19 = v16;
    else
      v19 = v8;
    do
    {
      if (v19 == v8)
        __assert_rtn("-[_PASProxyConcatenatedString _substringWithRange:]", "NSString+_PASAdditions.m", 763, "loopLocation.index < componentsCount");
      objc_msgSend(*(id *)(a1 + 8), "objectAtIndexedSubscript:", v8);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "length");
      if (v21 - v10 >= v6)
        v22 = v6;
      else
        v22 = v21 - v10;
      if (v21 == v22)
      {
        objc_msgSend(v18, "addObject:", v20);
      }
      else
      {
        v23 = (void *)MEMORY[0x1A1AFDC98]();
        objc_msgSend(v20, "substringWithRange:", v10, v22);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addObject:", v24);

        objc_autoreleasePoolPop(v23);
      }
      v6 -= v22;

      v10 = 0;
      ++v8;
    }
    while (v6);
    v11 = v44;
    if ((unint64_t)objc_msgSend(v18, "count") < 2)
      __assert_rtn("-[_PASProxyConcatenatedString _substringWithRange:]", "NSString+_PASAdditions.m", 774, "substringComponents.count >= 2");
    v25 = [_PASProxyConcatenatedString alloc];
    v26 = (void *)objc_msgSend(v18, "copy");
    v27 = -[_PASProxyConcatenatedString _initWithComponents:](v25, v26);

    if (objc_msgSend(v27, "length") != v43)
      __assert_rtn("-[_PASProxyConcatenatedString _substringWithRange:]", "NSString+_PASAdditions.m", 776, "result.length == range.length");

  }
LABEL_32:

  return (__CFString *)v27;
}

- (uint64_t)_validateRange:(uint64_t)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  if (result)
  {
    if ((unint64_t)(a2 + a3) > *(_QWORD *)(result + 24))
    {
      v3 = (void *)MEMORY[0x1E0C99DA0];
      v4 = *MEMORY[0x1E0C99858];
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Range {%tu, %tu} out of bounds; string length %tu"),
                     a2,
                     a3,
                     *(_QWORD *)(result + 24));
      objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
      v6 = (id)objc_claimAutoreleasedReturnValue();

      objc_exception_throw(v6);
    }
  }
  return result;
}

- (uint64_t)_locationOfStringIndex:(uint64_t)a1
{
  unint64_t v4;
  uint64_t v5;
  void *v6;
  unint64_t *v7;
  void *v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  const void *v17;
  void *v18;
  uint64_t v19;
  unint64_t v20;
  _QWORD v21[5];
  unint64_t __key;

  __key = a2;
  if (!a1)
    return 0;
  v4 = *(_QWORD *)(a1 + 24);
  if (v4 < a2)
    __assert_rtn("-[_PASProxyConcatenatedString _locationOfStringIndex:]", "NSString+_PASAdditions.m", 795, "stringIndex <= _length");
  if (!a2)
    return 0;
  if (v4 == a2)
  {
    v5 = objc_msgSend(*(id *)(a1 + 8), "count") - 1;
    objc_msgSend(*(id *)(a1 + 8), "lastObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "length");

    return v5;
  }
  v7 = *(unint64_t **)(a1 + 16);
  if (v7)
  {
    if (*v7 > a2)
      return 0;
    v16 = objc_msgSend(*(id *)(a1 + 8), "count");
    v5 = v16 - 1;
    if (v16 == 1)
      __assert_rtn("-[_PASProxyConcatenatedString _locationOfStringIndex:]", "NSString+_PASAdditions.m", 823, "startIndicesCArrayCount != 0");
    v17 = *(const void **)(a1 + 16);
    if (a2 < *((_QWORD *)v17 + v16 - 2))
    {
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __54___PASProxyConcatenatedString__locationOfStringIndex___block_invoke;
      v21[3] = &__block_descriptor_40_e15_i24__0r_v8r_v16l;
      v21[4] = a2;
      v18 = bsearch_b(&__key, v17, v16 - 2, 8uLL, v21);
      v19 = *(_QWORD *)(a1 + 16);
      v20 = ((unint64_t)v18 - v19) >> 3;
      if ((void *)(v19 + 8 * v20) != v18)
        __assert_rtn("-[_PASProxyConcatenatedString _locationOfStringIndex:]", "NSString+_PASAdditions.m", 851, "&(_startIndices[startIndicesIndex]) == matchingCandidate");
      return v20 + 1;
    }
  }
  else
  {
    v5 = objc_msgSend(*(id *)(a1 + 8), "count");
    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 8), "objectAtIndexedSubscript:", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "length");

      v11 = 0;
      if (v10 > a2)
      {
        return v11;
      }
      else
      {
        v12 = 1;
        while (v5 != v12)
        {
          v13 = v10;
          v11 = v12;
          objc_msgSend(*(id *)(a1 + 8), "objectAtIndexedSubscript:", v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "length");

          v10 = v15 + v13;
          v12 = v11 + 1;
          if (v15 + v13 > a2)
            return v11;
        }
      }
    }
  }
  return v5;
}

- (_QWORD)_initWithComponents:(_QWORD *)a1
{
  id v4;
  void *v5;
  id v6;
  unint64_t v7;
  void *v8;
  void *v9;
  char v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v17;
  id v18;
  objc_super v19;

  v4 = a2;
  v5 = v4;
  if (a1)
  {
    if ((unint64_t)objc_msgSend(v4, "count") <= 1)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", sel__initWithComponents_, a1, CFSTR("NSString+_PASAdditions.m"), 628, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("components.count >= 2"));

    }
    v19.receiver = a1;
    v19.super_class = (Class)_PASProxyConcatenatedString;
    v6 = objc_msgSendSuper2(&v19, sel_init);
    a1 = v6;
    if (v6)
    {
      objc_storeStrong((id *)v6 + 1, a2);
      v7 = objc_msgSend(v5, "count");
      objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 < 3)
      {
        a1[2] = 0;
        if (!v7)
        {
          a1[3] = 0;
          goto LABEL_24;
        }
        v14 = 0;
        v11 = 0;
        v10 = 0;
        do
        {
          while (1)
          {
            objc_msgSend(v5, "objectAtIndexedSubscript:", v14);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v11 += objc_msgSend(v15, "length");
            if ((v10 & 1) != 0)
              break;
            v10 = objc_msgSend(v15, "_pas_retainsConmingledBackingStore");

            if (++v14 == v7)
              goto LABEL_19;
          }

          ++v14;
          v10 = 1;
        }
        while (v14 != v7);
LABEL_21:
        a1[3] = v11;
      }
      else
      {
        v9 = malloc_type_malloc(8 * v7 - 8, 0x100004000313F17uLL);
        if (!v9)
        {
          objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99850], CFSTR("malloc failed"), 0);
          v18 = (id)objc_claimAutoreleasedReturnValue();
          objc_exception_throw(v18);
        }
        a1[2] = v9;
        v10 = objc_msgSend(v8, "_pas_retainsConmingledBackingStore");
        v11 = objc_msgSend(v8, "length");
        for (i = 1; i != v7; ++i)
        {
          while (1)
          {
            *(_QWORD *)(a1[2] + 8 * i - 8) = v11;
            objc_msgSend(v5, "objectAtIndexedSubscript:", i);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v11 += objc_msgSend(v13, "length");
            if ((v10 & 1) == 0)
              break;

            ++i;
            v10 = 1;
            if (i == v7)
              goto LABEL_21;
          }
          v10 = objc_msgSend(v13, "_pas_retainsConmingledBackingStore");

        }
LABEL_19:
        a1[3] = v11;
        if ((v10 & 1) == 0)
          goto LABEL_24;
      }
      objc_msgSend(a1, "_pas_setRetainsConmingledBackingStore:", 1);
LABEL_24:

    }
  }

  return a1;
}

@end
