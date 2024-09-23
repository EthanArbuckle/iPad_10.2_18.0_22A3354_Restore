@implementation OITSUChunkedString

- (OITSUChunkedString)initWithChunkLength:(unint64_t)a3
{
  OITSUChunkedString *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)OITSUChunkedString;
  result = -[OITSUChunkedString init](&v5, sel_init);
  if (result)
    result->_chunkLength = a3;
  return result;
}

- (OITSUChunkedString)init
{
  return -[OITSUChunkedString initWithChunkLength:](self, "initWithChunkLength:", 0x4000);
}

- (void)dealloc
{
  vector<std::shared_ptr<TSUStringChunk>, std::allocator<std::shared_ptr<TSUStringChunk>>> *p_chunks;
  uint64_t i;
  void *begin;
  objc_super v6;

  p_chunks = &self->_chunks;
  begin = self->_chunks.__begin_;
  for (i = (uint64_t)self->_chunks.__end_;
        (void *)i != begin;
  p_chunks->__end_ = begin;
  v6.receiver = self;
  v6.super_class = (Class)OITSUChunkedString;
  -[OITSUChunkedString dealloc](&v6, sel_dealloc);
}

- (unint64_t)length
{
  return self->_length;
}

- (unsigned)characterAtIndex:(unint64_t)a3
{
  vector<std::shared_ptr<TSUStringChunk>, std::allocator<std::shared_ptr<TSUStringChunk>>> *p_chunks;
  uint64_t v6;

  if (self->_length <= a3)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCB78], CFSTR("character index out of bounds"));
  p_chunks = &self->_chunks;
  v6 = p_chunkIndexForCharacterIndex(a3, p_chunks);
  return *(_WORD *)(*((_QWORD *)p_chunks->__begin_ + 2 * v6) + 2 * (a3 - **((_QWORD **)p_chunks->__begin_ + 2 * v6)) + 24);
}

- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  vector<std::shared_ptr<TSUStringChunk>, std::allocator<std::shared_ptr<TSUStringChunk>>> *p_chunks;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  NSUInteger v12;
  NSUInteger v13;

  length = a4.length;
  location = a4.location;
  if (a4.location + a4.length > self->_length)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCB78], CFSTR("range out of bounds"));
  p_chunks = &self->_chunks;
  v9 = p_chunkIndexForCharacterIndex(location, p_chunks);
  if (length)
  {
    v10 = 16 * v9;
    do
    {
      v11 = *(_QWORD **)((char *)p_chunks->__begin_ + v10);
      v12 = location - *v11;
      if (length >= v11[2] - v12)
        v13 = v11[2] - v12;
      else
        v13 = length;
      memmove(a3, (char *)v11 + 2 * v12 + 24, 2 * v13);
      a3 += v13;
      location += v13;
      v10 += 16;
      length -= v13;
    }
    while (length);
  }
}

- (void)replaceCharactersInRange:(_NSRange)a3 withString:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  unint64_t v8;
  NSUInteger v9;
  vector<std::shared_ptr<TSUStringChunk>, std::allocator<std::shared_ptr<TSUStringChunk>>> *p_chunks;
  uint64_t v11;
  NSUInteger v12;
  _QWORD *begin;
  NSUInteger *v14;
  NSUInteger v15;
  NSRange v16;
  NSUInteger v17;
  uint64_t v18;
  NSUInteger v19;
  NSUInteger v20;
  NSRange v21;
  NSRange v22;

  length = a3.length;
  location = a3.location;
  if (a3.location + a3.length > self->_length)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCB78], CFSTR("range out of bounds"));
  v18 = objc_msgSend(a4, "length");
  v8 = objc_msgSend(a4, "length");
  v20 = length;
  if (v8 >= length)
    v9 = length;
  else
    v9 = v8;
  p_chunks = &self->_chunks;
  v11 = p_chunkIndexForCharacterIndex(location, &self->_chunks.__begin_);
  v19 = v9;
  if (v9)
  {
    v12 = location;
    while (1)
    {
      begin = p_chunks->__begin_;
      v14 = (NSUInteger *)*((_QWORD *)p_chunks->__begin_ + 2 * v11);
      v15 = *v14;
      v21.length = v14[2];
      v21.location = *v14;
      v22.location = v12;
      v22.length = v9;
      v16 = NSIntersectionRange(v21, v22);
      objc_msgSend(a4, "getCharacters:range:", begin[2 * v11] + 2 * (v16.location - v15) + 24, v12 - location, v16.length);
      v12 += v16.length;
      v9 -= v16.length;
      if (!v9)
        break;
      ++v11;
    }
  }
  if ((uint64_t)(v18 - v20) < 1)
  {
    if (((v18 - v20) & 0x8000000000000000) != 0)
      -[OITSUChunkedString p_deleteCharactersInRange:chunkIndex:](self, "p_deleteCharactersInRange:chunkIndex:", v19 + location, v20 - v19, v11);
  }
  else
  {
    v17 = v18 - v19;
    if (v19 + location == self->_length)
      -[OITSUChunkedString p_appendRange:fromString:](self, "p_appendRange:fromString:", v19, v17, a4);
    else
      -[OITSUChunkedString p_insertCharactersInRange:fromString:atIndex:chunkIndex:](self, "p_insertCharactersInRange:fromString:atIndex:chunkIndex:", v19, v17, a4, v19 + location, v11);
  }
}

- (void)insertString:(id)a3 atIndex:(unint64_t)a4
{
  if (self->_length < a4)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCB78], CFSTR("range out of bounds"));
  if (objc_msgSend(a3, "length"))
  {
    if (self->_length == a4)
      -[OITSUChunkedString appendString:](self, "appendString:", a3);
    else
      -[OITSUChunkedString p_insertCharactersInRange:fromString:atIndex:chunkIndex:](self, "p_insertCharactersInRange:fromString:atIndex:chunkIndex:", 0, objc_msgSend(a3, "length"), a3, a4, p_chunkIndexForCharacterIndex(a4, &self->_chunks.__begin_));
  }
}

- (void)deleteCharactersInRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;

  length = a3.length;
  location = a3.location;
  if (a3.location + a3.length > self->_length)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCB78], CFSTR("range out of bounds"));
  if (length)
    -[OITSUChunkedString p_deleteCharactersInRange:chunkIndex:](self, "p_deleteCharactersInRange:chunkIndex:", location, length, p_chunkIndexForCharacterIndex(location, &self->_chunks.__begin_));
}

- (void)appendString:(id)a3
{
  -[OITSUChunkedString p_appendRange:fromString:](self, "p_appendRange:fromString:", 0, objc_msgSend(a3, "length"), a3);
}

- (void)compact
{
  -[OITSUChunkedString p_compactChunksInRange:](self, "p_compactChunksInRange:", 0, ((char *)self->_chunks.__end_ - (char *)self->_chunks.__begin_) >> 4);
}

- (void).cxx_destruct
{
  vector<std::shared_ptr<TSUStringChunk>, std::allocator<std::shared_ptr<TSUStringChunk>>> *p_chunks;

  p_chunks = &self->_chunks;
  std::vector<std::shared_ptr<TSUStringChunk>>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_chunks);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 4) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

- (void)p_appendRange:(_NSRange)a3 fromString:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  vector<std::shared_ptr<TSUStringChunk>, std::allocator<std::shared_ptr<TSUStringChunk>>> *p_chunks;
  uint64_t *end;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  unint64_t chunkLength;
  __int128 v16;
  std::__shared_weak_count *v17;
  unint64_t *p_shared_owners;
  unint64_t v19;
  std::__shared_weak_count *v20;
  unint64_t *v21;
  unint64_t v22;
  uint64_t v23;
  NSUInteger v24;
  std::__shared_weak_count *v25;
  unint64_t *v26;
  unint64_t v27;
  __int128 v28;
  __int128 v29;

  if (a3.length)
  {
    length = a3.length;
    location = a3.location;
    p_chunks = &self->_chunks;
    do
    {
      v29 = 0uLL;
      end = (uint64_t *)p_chunks->__end_;
      if (end == p_chunks->__begin_
        || (std::shared_ptr<TSUStringChunk>::operator=[abi:ne180100](&v29, end - 2),
            v10 = v29,
            v11 = *(_QWORD *)(v29 + 8),
            v12 = *(_QWORD *)(v29 + 16),
            v13 = v11 - v12,
            v11 == v12))
      {
        v14 = (_QWORD *)operator new();
        chunkLength = self->_chunkLength;
        *v14 = self->_length;
        v14[1] = chunkLength;
        v14[2] = 0;
        std::shared_ptr<TSUStringChunk>::shared_ptr[abi:ne180100]<TSUStringChunk,void>(&v28, (uint64_t)v14);
        v16 = v28;
        v28 = 0uLL;
        v17 = (std::__shared_weak_count *)*((_QWORD *)&v29 + 1);
        v29 = v16;
        if (v17)
        {
          p_shared_owners = (unint64_t *)&v17->__shared_owners_;
          do
            v19 = __ldaxr(p_shared_owners);
          while (__stlxr(v19 - 1, p_shared_owners));
          if (!v19)
          {
            ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
            std::__shared_weak_count::__release_weak(v17);
          }
        }
        v20 = (std::__shared_weak_count *)*((_QWORD *)&v28 + 1);
        if (*((_QWORD *)&v28 + 1))
        {
          v21 = (unint64_t *)(*((_QWORD *)&v28 + 1) + 8);
          do
            v22 = __ldaxr(v21);
          while (__stlxr(v22 - 1, v21));
          if (!v22)
          {
            ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
            std::__shared_weak_count::__release_weak(v20);
          }
        }
        std::vector<std::shared_ptr<TSUStringChunk>>::push_back[abi:ne180100]((char **)p_chunks, &v29);
        v10 = v29;
        v13 = *(_QWORD *)(v29 + 8);
      }
      if (v13 <= 0)
      {
        v23 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OITSUChunkedString(Private) p_appendRange:fromString:]");
        +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v23, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUChunkedString.mm"), 330, 0, "should have allocated a chunk with available space at this point");
        +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
        v10 = v29;
      }
      if (length >= v13)
        v24 = v13;
      else
        v24 = length;
      objc_msgSend(a4, "getCharacters:range:", v10 + 2 * *(_QWORD *)(v10 + 16) + 24, location, v24, (_QWORD)v28);
      v25 = (std::__shared_weak_count *)*((_QWORD *)&v29 + 1);
      *(_QWORD *)(v29 + 16) += v24;
      self->_length += v24;
      if (v25)
      {
        v26 = (unint64_t *)&v25->__shared_owners_;
        do
          v27 = __ldaxr(v26);
        while (__stlxr(v27 - 1, v26));
        if (!v27)
        {
          ((void (*)(std::__shared_weak_count *))v25->__on_zero_shared)(v25);
          std::__shared_weak_count::__release_weak(v25);
        }
      }
      location += v24;
      length -= v24;
    }
    while (length);
  }
}

- (void)p_insertCharactersInRange:(_NSRange)a3 fromString:(id)a4 atIndex:(unint64_t)a5 chunkIndex:(unint64_t)a6
{
  unint64_t v6;
  NSUInteger length;
  vector<std::shared_ptr<TSUStringChunk>, std::allocator<std::shared_ptr<TSUStringChunk>>> *p_chunks;
  uint64_t *begin;
  _QWORD *v12;
  unint64_t chunkLength;
  __int128 v14;
  std::__shared_weak_count *v15;
  unint64_t *p_shared_owners;
  unint64_t v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  unint64_t v23;
  float v24;
  unint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  unint64_t v28;
  std::__shared_weak_count *v29;
  unint64_t *v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t *v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  uint64_t v37;
  _QWORD *v38;
  std::__shared_weak_count *v39;
  unint64_t *v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  int v44;
  unint64_t *v45;
  unint64_t v46;
  unint64_t v47;
  BOOL v48;
  unint64_t v49;
  BOOL v50;
  OITSUChunkedString *v51;
  unint64_t v52;
  unint64_t v53;
  uint64_t v54;
  _QWORD *v55;
  std::__shared_weak_count *v56;
  unint64_t *v57;
  unint64_t v58;
  unint64_t v59;
  uint64_t v60;
  unint64_t v61;
  NSUInteger v62;
  unint64_t v63;
  unint64_t v64;
  unint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  unint64_t v71;
  unint64_t v72;
  uint64_t v73;
  unint64_t v74;
  unint64_t v75;
  _QWORD **v76;
  _QWORD *v77;
  std::__shared_weak_count *v78;
  unint64_t *v79;
  unint64_t v80;
  char *v81;
  NSUInteger v82;
  NSUInteger location;
  __int128 v86;
  __int128 v87;

  v6 = a6;
  length = a3.length;
  location = a3.location;
  v87 = 0uLL;
  p_chunks = &self->_chunks;
  begin = (uint64_t *)self->_chunks.__begin_;
  if (self->_chunks.__end_ == begin)
  {
    v12 = (_QWORD *)operator new();
    chunkLength = self->_chunkLength;
    *v12 = 0;
    v12[1] = chunkLength;
    v12[2] = 0;
    std::shared_ptr<TSUStringChunk>::shared_ptr[abi:ne180100]<TSUStringChunk,void>(&v86, (uint64_t)v12);
    v14 = v86;
    v86 = 0uLL;
    v15 = (std::__shared_weak_count *)*((_QWORD *)&v87 + 1);
    v87 = v14;
    if (v15)
    {
      p_shared_owners = (unint64_t *)&v15->__shared_owners_;
      do
        v17 = __ldaxr(p_shared_owners);
      while (__stlxr(v17 - 1, p_shared_owners));
      if (!v17)
      {
        ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
        std::__shared_weak_count::__release_weak(v15);
      }
    }
    v18 = (std::__shared_weak_count *)*((_QWORD *)&v86 + 1);
    if (*((_QWORD *)&v86 + 1))
    {
      v19 = (unint64_t *)(*((_QWORD *)&v86 + 1) + 8);
      do
        v20 = __ldaxr(v19);
      while (__stlxr(v20 - 1, v19));
      if (!v20)
      {
        ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
        std::__shared_weak_count::__release_weak(v18);
      }
    }
    std::vector<std::shared_ptr<TSUStringChunk>>::push_back[abi:ne180100]((char **)p_chunks, &v87);
  }
  else
  {
    std::shared_ptr<TSUStringChunk>::operator=[abi:ne180100](&v87, &begin[2 * a6]);
  }
  v21 = (_QWORD *)v87;
  if (!(_QWORD)v87)
  {
    v22 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OITSUChunkedString(Private) p_insertCharactersInRange:fromString:atIndex:chunkIndex:]");
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v22, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUChunkedString.mm"), 357, 0, "invalid nil value for '%{public}s'", "chunk");
    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
    v21 = (_QWORD *)v87;
  }
  v23 = v21[2];
  if (v21[1] - v23 >= length)
  {
    v47 = a5 - *v21;
    v48 = v23 > v47;
    v49 = v23 - v47;
    v50 = !v48 || length == 0;
    v51 = self;
    if (!v50)
    {
      memmove((char *)v21 + 2 * v47 + 2 * length + 24, (char *)v21 + 2 * v47 + 24, 2 * v49);
      v21 = (_QWORD *)v87;
    }
    objc_msgSend(a4, "getCharacters:range:", (char *)v21 + 2 * v47 + 24, location, length);
    *(_QWORD *)(v87 + 16) += length;
  }
  else
  {
    v82 = length;
    v24 = (float)(v23 + length);
    v25 = vcvtps_u32_f32(v24 / (float)self->_chunkLength);
    if (v25 != 1)
    {
      v26 = 0;
      do
      {
        v27 = (_QWORD *)operator new();
        v28 = self->_chunkLength;
        *v27 = 0x7FFFFFFFFFFFFFFFLL;
        v27[1] = v28;
        v27[2] = 0;
        std::shared_ptr<TSUStringChunk>::shared_ptr[abi:ne180100]<TSUStringChunk,void>(&v86, (uint64_t)v27);
        std::vector<std::shared_ptr<TSUStringChunk>>::insert(p_chunks, (uint64_t)p_chunks->__begin_ + 16 * v6 + 16 * v26 + 16, (uint64_t *)&v86);
        v29 = (std::__shared_weak_count *)*((_QWORD *)&v86 + 1);
        if (*((_QWORD *)&v86 + 1))
        {
          v30 = (unint64_t *)(*((_QWORD *)&v86 + 1) + 8);
          do
            v31 = __ldaxr(v30);
          while (__stlxr(v31 - 1, v30));
          if (!v31)
          {
            ((void (*)(std::__shared_weak_count *))v29->__on_zero_shared)(v29);
            std::__shared_weak_count::__release_weak(v29);
          }
        }
        ++v26;
      }
      while (v26 != v25 - 1);
    }
    v32 = vcvtps_u32_f32(v24 / (float)v25);
    std::shared_ptr<TSUStringChunk>::operator=[abi:ne180100](&v87, (uint64_t *)p_chunks->__begin_ + 2 * v6);
    v33 = (uint64_t *)v87;
    v34 = a5 - *(_QWORD *)v87;
    v35 = v34 - v32;
    if (v34 <= v32)
    {
      v44 = 0;
      v35 = a5 - *(_QWORD *)v87;
      v36 = v6;
    }
    else
    {
      v36 = v6 + 1;
      v37 = (uint64_t)p_chunks->__begin_ + 16 * v6 + 16;
      v38 = *(_QWORD **)v37;
      v39 = *(std::__shared_weak_count **)(v37 + 8);
      if (v39)
      {
        v40 = (unint64_t *)&v39->__shared_owners_;
        do
          v41 = __ldxr(v40);
        while (__stxr(v41 + 1, v40));
      }
      memmove(v38 + 3, (char *)v33 + 2 * v32 + 24, 2 * v35);
      v38[2] += v35;
      v42 = *v33;
      v43 = v33[2];
      v44 = v32 - v34;
      *v38 = v42 + (int)v32 - (int)v34 + v43;
      if (v39)
      {
        v45 = (unint64_t *)&v39->__shared_owners_;
        do
          v46 = __ldaxr(v45);
        while (__stlxr(v46 - 1, v45));
        if (!v46)
        {
          ((void (*)(std::__shared_weak_count *))v39->__on_zero_shared)(v39);
          std::__shared_weak_count::__release_weak(v39);
        }
      }
    }
    v52 = *(_QWORD *)(v87 + 16);
    v53 = v52 - v34;
    if (v52 <= v34)
    {
      v53 = 0;
      v81 = 0;
    }
    else
    {
      v81 = (char *)malloc_type_malloc(2 * v53, 0x1000040BDFB0063uLL);
      memmove(v81, (const void *)(v87 + 2 * v34 + 24), 2 * v53);
      v44 -= v53;
      v54 = (uint64_t)p_chunks->__begin_ + 16 * v6;
      v55 = *(_QWORD **)(v54 + 16);
      v56 = *(std::__shared_weak_count **)(v54 + 24);
      if (v56)
      {
        v57 = (unint64_t *)&v56->__shared_owners_;
        do
          v58 = __ldxr(v57);
        while (__stxr(v58 + 1, v57));
        *v55 -= v53;
        do
          v59 = __ldaxr(v57);
        while (__stlxr(v59 - 1, v57));
        if (!v59)
        {
          ((void (*)(std::__shared_weak_count *))v56->__on_zero_shared)(v56);
          std::__shared_weak_count::__release_weak(v56);
        }
      }
      else
      {
        *v55 -= v53;
      }
    }
    *(_QWORD *)(v87 + 16) += v44;
    std::shared_ptr<TSUStringChunk>::operator=[abi:ne180100](&v87, (uint64_t *)p_chunks->__begin_ + 2 * v36);
    v60 = *(_QWORD *)v87;
    v61 = v82;
    v62 = location - a5;
    while (1)
    {
      std::shared_ptr<TSUStringChunk>::operator=[abi:ne180100](&v87, (uint64_t *)p_chunks->__begin_ + 2 * v36);
      v63 = v32 - *(_QWORD *)(v87 + 16);
      if (v63)
      {
        v65 = v61 >= v63 ? v32 - *(_QWORD *)(v87 + 16) : v61;
        objc_msgSend(a4, "getCharacters:range:", (_QWORD)v87 + 2 * v35 + 24, v62 + a5, v65);
        v66 = v87;
        *(_QWORD *)v87 = v60;
        v64 = *(_QWORD *)(v66 + 16) + v65;
        *(_QWORD *)(v66 + 16) = v64;
        a5 += v65;
        v61 -= v65;
      }
      else
      {
        v64 = v32;
      }
      v35 = 0;
      v60 += v64;
      if (!v61)
        break;
      ++v36;
    }
    if (v81)
    {
      std::shared_ptr<TSUStringChunk>::operator=[abi:ne180100](&v87, (uint64_t *)p_chunks->__begin_ + 2 * v36);
      if (v53)
      {
        v67 = *(_QWORD *)v87;
        v68 = *(_QWORD *)(v87 + 16) + *(_QWORD *)v87;
        v69 = v68;
        while (1)
        {
          std::shared_ptr<TSUStringChunk>::operator=[abi:ne180100](&v87, (uint64_t *)p_chunks->__begin_ + 2 * v36);
          v70 = *(_QWORD *)(v87 + 16);
          if (v32 == v70)
          {
            v71 = v32;
          }
          else
          {
            v72 = v53 >= v32 - v70 ? v32 - v70 : v53;
            memcpy((void *)(v87 + 2 * v70 + 24), &v81[2 * (v69 - v68)], 2 * v72);
            v73 = v87;
            *(_QWORD *)v87 = v67;
            v71 = *(_QWORD *)(v73 + 16) + v72;
            *(_QWORD *)(v73 + 16) = v71;
            v69 += v72;
            v53 -= v72;
          }
          v67 += v71;
          if (!v53)
            break;
          ++v36;
        }
      }
      free(v81);
    }
    v6 = v36;
    length = v82;
    v51 = self;
  }
  v74 = ((char *)p_chunks->__end_ - (char *)p_chunks->__begin_) >> 4;
  if (v74 > v6 + 1)
  {
    v75 = ~v6 + v74;
    v76 = (_QWORD **)((char *)p_chunks->__begin_ + 16 * v6 + 16);
    do
    {
      v77 = *v76;
      v76 += 2;
      *v77 += length;
      --v75;
    }
    while (v75);
  }
  v51->_length += length;
  v78 = (std::__shared_weak_count *)*((_QWORD *)&v87 + 1);
  if (*((_QWORD *)&v87 + 1))
  {
    v79 = (unint64_t *)(*((_QWORD *)&v87 + 1) + 8);
    do
      v80 = __ldaxr(v79);
    while (__stlxr(v80 - 1, v79));
    if (!v80)
    {
      ((void (*)(std::__shared_weak_count *))v78->__on_zero_shared)(v78);
      std::__shared_weak_count::__release_weak(v78);
    }
  }
}

- (void)p_deleteCharactersInRange:(_NSRange)a3 chunkIndex:(unint64_t)a4
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v7;
  vector<std::shared_ptr<TSUStringChunk>, std::allocator<std::shared_ptr<TSUStringChunk>>> *p_chunks;
  unint64_t v9;
  NSUInteger **v10;
  NSRange v11;
  NSUInteger *v12;
  NSUInteger v13;
  NSUInteger v14;
  NSUInteger v15;
  BOOL v16;
  NSUInteger v17;
  void *end;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  _QWORD **v25;
  _QWORD *v26;
  OITSUChunkedString *v27;
  NSRange v28;
  NSRange v29;

  if (a3.length)
  {
    length = a3.length;
    location = a3.location;
    v7 = 0;
    v27 = self;
    p_chunks = &self->_chunks;
    v9 = 0x7FFFFFFFFFFFFFFFLL;
    do
    {
      v10 = (NSUInteger **)((char *)p_chunks->__begin_ + 16 * a4);
      v28.location = **v10;
      v28.length = (*v10)[2];
      v29.location = location;
      v29.length = length;
      v11 = NSIntersectionRange(v28, v29);
      v12 = *v10;
      v13 = **v10;
      v14 = (*v10)[2];
      v15 = v11.location - v13 + v11.length;
      if (v11.length)
        v16 = v14 > v15;
      else
        v16 = 0;
      if (v16)
      {
        memmove((char *)v12 + 2 * (v11.location - v13) + 24, (char *)v12 + 2 * v15 + 24, 2 * (v14 - v15));
        v12 = *v10;
        v13 = **v10;
        v14 = (*v10)[2];
      }
      *v12 = v13 - v7;
      v17 = v14 - v11.length;
      v12[2] = v17;
      if (v17)
      {
        if (v9 == 0x7FFFFFFFFFFFFFFFLL)
          v9 = a4;
        ++a4;
      }
      else
      {
        end = p_chunks->__end_;
        v19 = (unint64_t)p_chunks->__begin_ + 16 * a4;
        v20 = v19 + 16;
        if ((void *)(v19 + 16) != end)
        {
          v21 = (uint64_t)p_chunks->__begin_ + 16 * a4;
          do
          {
            std::shared_ptr<TSUStringChunk>::operator=[abi:ne180100](v21, (__int128 *)(v21 + 16));
            v19 += 16;
            v22 = v21 + 32;
            v21 += 16;
          }
          while ((void *)v22 != end);
          v20 = (uint64_t)p_chunks->__end_;
        }
        while (v20 != v19)
          v20 = std::shared_ptr<TSUStringChunk>::~shared_ptr[abi:ne180100](v20 - 16);
        p_chunks->__end_ = (void *)v19;
      }
      location += v11.length;
      v7 += v11.length;
      length -= v11.length;
    }
    while (length);
    self = v27;
  }
  else
  {
    v7 = 0;
    v9 = 0x7FFFFFFFFFFFFFFFLL;
  }
  v23 = ((char *)self->_chunks.__end_ - (char *)self->_chunks.__begin_) >> 4;
  v24 = v23 - a4;
  if (v23 > a4)
  {
    v25 = (_QWORD **)((char *)self->_chunks.__begin_ + 16 * a4);
    do
    {
      v26 = *v25;
      v25 += 2;
      *v26 -= v7;
      --v24;
    }
    while (v24);
  }
  self->_length -= v7;
  if (v9 != 0x7FFFFFFFFFFFFFFFLL)
    -[OITSUChunkedString p_compactChunksInRange:](self, "p_compactChunksInRange:");
}

- (void)p_compactChunksInRange:(_NSRange)a3
{
  unint64_t v3;
  uint64_t *v4;
  NSUInteger length;
  uint64_t v6;
  unint64_t chunkLength;
  float v8;
  vector<std::shared_ptr<TSUStringChunk>, std::allocator<std::shared_ptr<TSUStringChunk>>> *p_chunks;
  _OWORD *begin;
  __int128 v11;
  unint64_t *v12;
  unint64_t v13;
  uint64_t *v14;
  unint64_t v15;
  NSUInteger v16;
  __int128 v17;
  unint64_t *v18;
  unint64_t v19;
  unint64_t v20;
  char *v21;
  _QWORD *v22;
  char *v23;
  NSUInteger v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t v33;
  std::__shared_weak_count *v34;
  unint64_t *v35;
  unint64_t v36;
  std::__shared_weak_count *v37;
  unint64_t *v38;
  unint64_t v39;
  unint64_t v40;
  NSUInteger v41;
  NSUInteger location;
  uint64_t v43;
  __int128 v44;
  __int128 v45;

  if (a3.length)
  {
    if (a3.location >= a3.location + a3.length)
    {
      v3 = 0;
    }
    else
    {
      v3 = 0;
      v4 = (uint64_t *)((char *)self->_chunks.__begin_ + 16 * a3.location);
      length = a3.length;
      do
      {
        v6 = *v4;
        v4 += 2;
        v3 += *(_QWORD *)(v6 + 16);
        --length;
      }
      while (length);
    }
    chunkLength = self->_chunkLength;
    if (v3 + (chunkLength >> 2) - 1 < chunkLength * (a3.length - 1))
    {
      v8 = (float)chunkLength;
      p_chunks = &self->_chunks;
      begin = self->_chunks.__begin_;
      v11 = begin[a3.location];
      v45 = v11;
      if (*((_QWORD *)&v11 + 1))
      {
        v12 = (unint64_t *)(*((_QWORD *)&v11 + 1) + 8);
        do
          v13 = __ldxr(v12);
        while (__stxr(v13 + 1, v12));
        begin = p_chunks->__begin_;
      }
      v14 = (uint64_t *)v11;
      v15 = *(_QWORD *)(v11 + 16);
      v16 = a3.location + 1;
      v17 = begin[a3.location + 1];
      v44 = v17;
      location = a3.location;
      if (*((_QWORD *)&v17 + 1))
      {
        v18 = (unint64_t *)(*((_QWORD *)&v17 + 1) + 8);
        do
          v19 = __ldxr(v18);
        while (__stxr(v19 + 1, v18));
        v20 = v14[2];
      }
      else
      {
        v20 = v15;
      }
      v40 = vcvtps_u32_f32((float)v3 / v8);
      v41 = a3.location + a3.length;
      if (v20 < v3)
      {
        v21 = (char *)v14 + 2 * v15 + 24;
        v43 = *v14;
        v22 = (_QWORD *)v17;
        v23 = (char *)(v17 + 24);
        v24 = a3.location;
        do
        {
          v25 = (_QWORD *)v45;
          v26 = *(_QWORD *)(v45 + 8);
          v27 = *(_QWORD *)(v45 + 16);
          v28 = v26 - v27;
          v29 = v22[2];
          if (v29 >= v26 - v27)
            v30 = v26 - v27;
          else
            v30 = v22[2];
          if (v30)
          {
            memmove(v21, v23, 2 * v30);
            v21 += 2 * v30;
            v23 += 2 * v30;
            v25 = (_QWORD *)v45;
            *(_QWORD *)(v45 + 16) += v30;
            v22 = (_QWORD *)v44;
            *(_QWORD *)(v44 + 16) -= v30;
            v20 += v30;
          }
          if (v20 < v3)
          {
            if (v25[1] == v25[2])
            {
              ++v24;
              std::shared_ptr<TSUStringChunk>::operator=[abi:ne180100](&v45, (uint64_t *)p_chunks->__begin_ + 2 * v24);
              v25 = (_QWORD *)v45;
              v31 = v45;
              *(_QWORD *)v45 = v20 + v43;
              v21 = (char *)(v31 + 24);
            }
            if (v29 <= v28)
            {
              ++v16;
              std::shared_ptr<TSUStringChunk>::operator=[abi:ne180100](&v44, (uint64_t *)p_chunks->__begin_ + 2 * v16);
              v22 = (_QWORD *)v44;
              v23 = (char *)(v44 + 24);
              v25 = (_QWORD *)v45;
            }
            else
            {
              v22 = (_QWORD *)v44;
            }
            if (v22 == v25)
            {
              v32 = v25 + 3;
              v33 = v25[2];
              memmove(v25 + 3, v23, 2 * v33);
              v20 += v33;
              v21 = (char *)v32 + 2 * v33;
              ++v16;
              std::shared_ptr<TSUStringChunk>::operator=[abi:ne180100](&v44, (uint64_t *)p_chunks->__begin_ + 2 * v16);
              v22 = (_QWORD *)v44;
              v23 = (char *)(v44 + 24);
            }
          }
        }
        while (v20 < v3);
      }
      std::vector<std::shared_ptr<TSUStringChunk>>::erase((uint64_t)p_chunks, (uint64_t)p_chunks->__begin_ + 16 * location + 16 * v40, (uint64_t)p_chunks->__begin_ + 16 * v41);
      v34 = (std::__shared_weak_count *)*((_QWORD *)&v44 + 1);
      if (*((_QWORD *)&v44 + 1))
      {
        v35 = (unint64_t *)(*((_QWORD *)&v44 + 1) + 8);
        do
          v36 = __ldaxr(v35);
        while (__stlxr(v36 - 1, v35));
        if (!v36)
        {
          ((void (*)(std::__shared_weak_count *))v34->__on_zero_shared)(v34);
          std::__shared_weak_count::__release_weak(v34);
        }
      }
      v37 = (std::__shared_weak_count *)*((_QWORD *)&v45 + 1);
      if (*((_QWORD *)&v45 + 1))
      {
        v38 = (unint64_t *)(*((_QWORD *)&v45 + 1) + 8);
        do
          v39 = __ldaxr(v38);
        while (__stlxr(v39 - 1, v38));
        if (!v39)
        {
          ((void (*)(std::__shared_weak_count *))v37->__on_zero_shared)(v37);
          std::__shared_weak_count::__release_weak(v37);
        }
      }
    }
  }
}

@end
