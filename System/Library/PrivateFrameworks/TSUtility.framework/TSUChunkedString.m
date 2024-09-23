@implementation TSUChunkedString

- (TSUChunkedString)initWithChunkLength:(unint64_t)a3
{
  TSUChunkedString *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TSUChunkedString;
  result = -[TSUChunkedString init](&v5, sel_init);
  if (result)
    result->_chunkLength = a3;
  return result;
}

- (TSUChunkedString)init
{
  return -[TSUChunkedString initWithChunkLength:](self, "initWithChunkLength:", 0x4000);
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
  v6.super_class = (Class)TSUChunkedString;
  -[TSUChunkedString dealloc](&v6, sel_dealloc);
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
  NSUInteger v8;
  vector<std::shared_ptr<TSUStringChunk>, std::allocator<std::shared_ptr<TSUStringChunk>>> *p_chunks;
  uint64_t v10;
  NSUInteger v11;
  _QWORD *begin;
  NSUInteger *v13;
  NSUInteger v14;
  NSRange v15;
  NSUInteger v16;
  uint64_t v17;
  NSUInteger v18;
  NSUInteger v19;
  NSRange v20;
  NSRange v21;

  length = a3.length;
  location = a3.location;
  if (a3.location + a3.length > self->_length)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCB78], CFSTR("range out of bounds"));
  v17 = objc_msgSend(a4, "length");
  v8 = length;
  if (objc_msgSend(a4, "length") < length)
    v8 = objc_msgSend(a4, "length");
  v19 = length;
  p_chunks = &self->_chunks;
  v10 = p_chunkIndexForCharacterIndex(location, &self->_chunks.__begin_);
  v18 = v8;
  if (v8)
  {
    v11 = location;
    while (1)
    {
      begin = p_chunks->__begin_;
      v13 = (NSUInteger *)*((_QWORD *)p_chunks->__begin_ + 2 * v10);
      v14 = *v13;
      v20.length = v13[2];
      v20.location = *v13;
      v21.location = v11;
      v21.length = v8;
      v15 = NSIntersectionRange(v20, v21);
      objc_msgSend(a4, "getCharacters:range:", begin[2 * v10] + 2 * (v15.location - v14) + 24, v11 - location, v15.length);
      v11 += v15.length;
      v8 -= v15.length;
      if (!v8)
        break;
      ++v10;
    }
  }
  if ((uint64_t)(v17 - v19) < 1)
  {
    if (((v17 - v19) & 0x8000000000000000) != 0)
      -[TSUChunkedString p_deleteCharactersInRange:chunkIndex:](self, "p_deleteCharactersInRange:chunkIndex:", v18 + location, v19 - v18, v10);
  }
  else
  {
    v16 = v17 - v18;
    if (v18 + location == self->_length)
      -[TSUChunkedString p_appendRange:fromString:](self, "p_appendRange:fromString:", v18, v16, a4);
    else
      -[TSUChunkedString p_insertCharactersInRange:fromString:atIndex:chunkIndex:](self, "p_insertCharactersInRange:fromString:atIndex:chunkIndex:", v18, v16, a4, v18 + location, v10);
  }
}

- (void)insertString:(id)a3 atIndex:(unint64_t)a4
{
  if (self->_length < a4)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCB78], CFSTR("range out of bounds"));
  if (objc_msgSend(a3, "length"))
  {
    if (self->_length == a4)
      -[TSUChunkedString appendString:](self, "appendString:", a3);
    else
      -[TSUChunkedString p_insertCharactersInRange:fromString:atIndex:chunkIndex:](self, "p_insertCharactersInRange:fromString:atIndex:chunkIndex:", 0, objc_msgSend(a3, "length"), a3, a4, p_chunkIndexForCharacterIndex(a4, &self->_chunks.__begin_));
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
    -[TSUChunkedString p_deleteCharactersInRange:chunkIndex:](self, "p_deleteCharactersInRange:chunkIndex:", location, length, p_chunkIndexForCharacterIndex(location, &self->_chunks.__begin_));
}

- (void)appendString:(id)a3
{
  -[TSUChunkedString p_appendRange:fromString:](self, "p_appendRange:fromString:", 0, objc_msgSend(a3, "length"), a3);
}

- (void)compact
{
  -[TSUChunkedString p_compactChunksInRange:](self, "p_compactChunksInRange:", 0, ((char *)self->_chunks.__end_ - (char *)self->_chunks.__begin_) >> 4);
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
  id v23;
  uint64_t v24;
  NSUInteger v25;
  std::__shared_weak_count *v26;
  unint64_t *v27;
  unint64_t v28;
  __int128 v29;
  __int128 v30;

  if (a3.length)
  {
    length = a3.length;
    location = a3.location;
    p_chunks = &self->_chunks;
    do
    {
      v30 = 0uLL;
      end = (uint64_t *)p_chunks->__end_;
      if (end == p_chunks->__begin_
        || (std::shared_ptr<TSUStringChunk>::operator=[abi:ne180100](&v30, end - 2),
            v10 = v30,
            v11 = *(_QWORD *)(v30 + 8),
            v12 = *(_QWORD *)(v30 + 16),
            v13 = v11 - v12,
            v11 == v12))
      {
        v14 = (_QWORD *)operator new();
        chunkLength = self->_chunkLength;
        *v14 = self->_length;
        v14[1] = chunkLength;
        v14[2] = 0;
        std::shared_ptr<TSUStringChunk>::shared_ptr[abi:ne180100]<TSUStringChunk,void>(&v29, (uint64_t)v14);
        v16 = v29;
        v29 = 0uLL;
        v17 = (std::__shared_weak_count *)*((_QWORD *)&v30 + 1);
        v30 = v16;
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
        v20 = (std::__shared_weak_count *)*((_QWORD *)&v29 + 1);
        if (*((_QWORD *)&v29 + 1))
        {
          v21 = (unint64_t *)(*((_QWORD *)&v29 + 1) + 8);
          do
            v22 = __ldaxr(v21);
          while (__stlxr(v22 - 1, v21));
          if (!v22)
          {
            ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
            std::__shared_weak_count::__release_weak(v20);
          }
        }
        std::vector<std::shared_ptr<TSUStringChunk>>::push_back[abi:ne180100]((char **)p_chunks, &v30);
        v10 = v30;
        v13 = *(_QWORD *)(v30 + 8);
      }
      if (v13 <= 0)
      {
        v23 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
        v24 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUChunkedString(Private) p_appendRange:fromString:]");
        objc_msgSend(v23, "handleFailureInFunction:file:lineNumber:description:", v24, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUChunkedString.mm"), 374, CFSTR("should have allocated a chunk with available space at this point"));
        v10 = v30;
      }
      if (length >= v13)
        v25 = v13;
      else
        v25 = length;
      objc_msgSend(a4, "getCharacters:range:", v10 + 2 * *(_QWORD *)(v10 + 16) + 24, location, v25, (_QWORD)v29);
      v26 = (std::__shared_weak_count *)*((_QWORD *)&v30 + 1);
      *(_QWORD *)(v30 + 16) += v25;
      self->_length += v25;
      if (v26)
      {
        v27 = (unint64_t *)&v26->__shared_owners_;
        do
          v28 = __ldaxr(v27);
        while (__stlxr(v28 - 1, v27));
        if (!v28)
        {
          ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
          std::__shared_weak_count::__release_weak(v26);
        }
      }
      location += v25;
      length -= v25;
    }
    while (length);
  }
}

- (void)p_insertCharactersInRange:(_NSRange)a3 fromString:(id)a4 atIndex:(unint64_t)a5 chunkIndex:(unint64_t)a6
{
  unint64_t v6;
  NSUInteger length;
  NSUInteger location;
  vector<std::shared_ptr<TSUStringChunk>, std::allocator<std::shared_ptr<TSUStringChunk>>> *p_chunks;
  uint64_t *begin;
  TSUChunkedString *v13;
  _QWORD *v14;
  unint64_t chunkLength;
  __int128 v16;
  std::__shared_weak_count *v17;
  unint64_t *p_shared_owners;
  unint64_t v19;
  std::__shared_weak_count *v20;
  unint64_t *v21;
  unint64_t v22;
  _QWORD *v23;
  id v24;
  uint64_t v25;
  unint64_t v26;
  float v27;
  unint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  unint64_t v31;
  std::__shared_weak_count *v32;
  unint64_t *v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t *v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  _QWORD *v41;
  std::__shared_weak_count *v42;
  unint64_t *v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  int v47;
  unint64_t *v48;
  unint64_t v49;
  unint64_t v50;
  BOOL v51;
  unint64_t v52;
  unint64_t v54;
  unint64_t v55;
  uint64_t v56;
  _QWORD *v57;
  std::__shared_weak_count *v58;
  unint64_t *v59;
  unint64_t v60;
  unint64_t v61;
  uint64_t v62;
  unint64_t v63;
  NSUInteger v64;
  unint64_t v65;
  unint64_t v66;
  unint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  unint64_t v73;
  unint64_t v74;
  uint64_t v75;
  unint64_t v76;
  unint64_t v77;
  _QWORD **v78;
  _QWORD *v79;
  std::__shared_weak_count *v80;
  unint64_t *v81;
  unint64_t v82;
  char *v83;
  TSUChunkedString *v84;
  NSUInteger v85;
  NSUInteger v86;
  __int128 v88;
  __int128 v89;

  v6 = a6;
  length = a3.length;
  location = a3.location;
  v89 = 0uLL;
  p_chunks = &self->_chunks;
  begin = (uint64_t *)self->_chunks.__begin_;
  if (self->_chunks.__end_ == begin)
  {
    v14 = (_QWORD *)operator new();
    chunkLength = self->_chunkLength;
    *v14 = 0;
    v14[1] = chunkLength;
    v14[2] = 0;
    std::shared_ptr<TSUStringChunk>::shared_ptr[abi:ne180100]<TSUStringChunk,void>(&v88, (uint64_t)v14);
    v16 = v88;
    v88 = 0uLL;
    v17 = (std::__shared_weak_count *)*((_QWORD *)&v89 + 1);
    v89 = v16;
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
    v13 = self;
    v20 = (std::__shared_weak_count *)*((_QWORD *)&v88 + 1);
    if (*((_QWORD *)&v88 + 1))
    {
      v21 = (unint64_t *)(*((_QWORD *)&v88 + 1) + 8);
      do
        v22 = __ldaxr(v21);
      while (__stlxr(v22 - 1, v21));
      if (!v22)
      {
        ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
        std::__shared_weak_count::__release_weak(v20);
      }
    }
    std::vector<std::shared_ptr<TSUStringChunk>>::push_back[abi:ne180100]((char **)p_chunks, &v89);
  }
  else
  {
    v13 = self;
    std::shared_ptr<TSUStringChunk>::operator=[abi:ne180100](&v89, &begin[2 * a6]);
  }
  v23 = (_QWORD *)v89;
  if (!(_QWORD)v89)
  {
    v24 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v25 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUChunkedString(Private) p_insertCharactersInRange:fromString:atIndex:chunkIndex:]");
    objc_msgSend(v24, "handleFailureInFunction:file:lineNumber:description:", v25, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUChunkedString.mm"), 405, CFSTR("invalid nil value for '%s'"), "chunk.get()");
    v23 = (_QWORD *)v89;
  }
  v26 = v23[2];
  if (v23[1] - v26 >= length)
  {
    v50 = a5 - *v23;
    v51 = v26 > v50;
    v52 = v26 - v50;
    if (v51 && length != 0)
    {
      memmove((char *)v23 + 2 * v50 + 2 * length + 24, (char *)v23 + 2 * v50 + 24, 2 * v52);
      v23 = (_QWORD *)v89;
    }
    objc_msgSend(a4, "getCharacters:range:", (char *)v23 + 2 * v50 + 24, location, length);
    *(_QWORD *)(v89 + 16) += length;
  }
  else
  {
    v85 = location;
    v86 = length;
    v27 = (float)(v26 + length);
    v28 = vcvtps_u32_f32(v27 / (float)v13->_chunkLength);
    if (v28 != 1)
    {
      v29 = 0;
      do
      {
        v30 = (_QWORD *)operator new();
        v31 = v13->_chunkLength;
        *v30 = 0x7FFFFFFFFFFFFFFFLL;
        v30[1] = v31;
        v30[2] = 0;
        std::shared_ptr<TSUStringChunk>::shared_ptr[abi:ne180100]<TSUStringChunk,void>(&v88, (uint64_t)v30);
        std::vector<std::shared_ptr<TSUStringChunk>>::insert(p_chunks, (uint64_t)p_chunks->__begin_ + 16 * v6 + 16 * v29 + 16, (uint64_t *)&v88);
        v32 = (std::__shared_weak_count *)*((_QWORD *)&v88 + 1);
        if (*((_QWORD *)&v88 + 1))
        {
          v33 = (unint64_t *)(*((_QWORD *)&v88 + 1) + 8);
          do
            v34 = __ldaxr(v33);
          while (__stlxr(v34 - 1, v33));
          if (!v34)
          {
            ((void (*)(std::__shared_weak_count *))v32->__on_zero_shared)(v32);
            std::__shared_weak_count::__release_weak(v32);
          }
        }
        ++v29;
      }
      while (v29 != v28 - 1);
    }
    v84 = v13;
    v35 = vcvtps_u32_f32(v27 / (float)v28);
    std::shared_ptr<TSUStringChunk>::operator=[abi:ne180100](&v89, (uint64_t *)p_chunks->__begin_ + 2 * v6);
    v36 = (uint64_t *)v89;
    v37 = a5 - *(_QWORD *)v89;
    v38 = v37 - v35;
    if (v37 <= v35)
    {
      v47 = 0;
      v38 = a5 - *(_QWORD *)v89;
      v39 = v6;
    }
    else
    {
      v39 = v6 + 1;
      v40 = (uint64_t)p_chunks->__begin_ + 16 * v6 + 16;
      v41 = *(_QWORD **)v40;
      v42 = *(std::__shared_weak_count **)(v40 + 8);
      if (v42)
      {
        v43 = (unint64_t *)&v42->__shared_owners_;
        do
          v44 = __ldxr(v43);
        while (__stxr(v44 + 1, v43));
      }
      memmove(v41 + 3, (char *)v36 + 2 * v35 + 24, 2 * v38);
      v41[2] += v38;
      v45 = *v36;
      v46 = v36[2];
      v47 = v35 - v37;
      *v41 = v45 + (int)v35 - (int)v37 + v46;
      if (v42)
      {
        v48 = (unint64_t *)&v42->__shared_owners_;
        do
          v49 = __ldaxr(v48);
        while (__stlxr(v49 - 1, v48));
        if (!v49)
        {
          ((void (*)(std::__shared_weak_count *))v42->__on_zero_shared)(v42);
          std::__shared_weak_count::__release_weak(v42);
        }
      }
    }
    v54 = *(_QWORD *)(v89 + 16);
    v55 = v54 - v37;
    if (v54 <= v37)
    {
      v55 = 0;
      v83 = 0;
    }
    else
    {
      v83 = (char *)malloc_type_malloc(2 * v55, 0x1000040BDFB0063uLL);
      memmove(v83, (const void *)(v89 + 2 * v37 + 24), 2 * v55);
      v47 -= v55;
      v56 = (uint64_t)p_chunks->__begin_ + 16 * v6;
      v57 = *(_QWORD **)(v56 + 16);
      v58 = *(std::__shared_weak_count **)(v56 + 24);
      if (v58)
      {
        v59 = (unint64_t *)&v58->__shared_owners_;
        do
          v60 = __ldxr(v59);
        while (__stxr(v60 + 1, v59));
        *v57 -= v55;
        do
          v61 = __ldaxr(v59);
        while (__stlxr(v61 - 1, v59));
        if (!v61)
        {
          ((void (*)(std::__shared_weak_count *))v58->__on_zero_shared)(v58);
          std::__shared_weak_count::__release_weak(v58);
        }
      }
      else
      {
        *v57 -= v55;
      }
    }
    *(_QWORD *)(v89 + 16) += v47;
    std::shared_ptr<TSUStringChunk>::operator=[abi:ne180100](&v89, (uint64_t *)p_chunks->__begin_ + 2 * v39);
    v62 = *(_QWORD *)v89;
    v63 = v86;
    v64 = v85 - a5;
    while (1)
    {
      std::shared_ptr<TSUStringChunk>::operator=[abi:ne180100](&v89, (uint64_t *)p_chunks->__begin_ + 2 * v39);
      v65 = v35 - *(_QWORD *)(v89 + 16);
      if (v65)
      {
        v67 = v63 >= v65 ? v35 - *(_QWORD *)(v89 + 16) : v63;
        objc_msgSend(a4, "getCharacters:range:", (_QWORD)v89 + 2 * v38 + 24, v64 + a5, v67);
        v68 = v89;
        *(_QWORD *)v89 = v62;
        v66 = *(_QWORD *)(v68 + 16) + v67;
        *(_QWORD *)(v68 + 16) = v66;
        a5 += v67;
        v63 -= v67;
      }
      else
      {
        v66 = v35;
      }
      v38 = 0;
      v62 += v66;
      if (!v63)
        break;
      ++v39;
    }
    if (v83)
    {
      std::shared_ptr<TSUStringChunk>::operator=[abi:ne180100](&v89, (uint64_t *)p_chunks->__begin_ + 2 * v39);
      if (v55)
      {
        v69 = *(_QWORD *)v89;
        v70 = *(_QWORD *)(v89 + 16) + *(_QWORD *)v89;
        v71 = v70;
        while (1)
        {
          std::shared_ptr<TSUStringChunk>::operator=[abi:ne180100](&v89, (uint64_t *)p_chunks->__begin_ + 2 * v39);
          v72 = *(_QWORD *)(v89 + 16);
          if (v35 == v72)
          {
            v73 = v35;
          }
          else
          {
            v74 = v55 >= v35 - v72 ? v35 - v72 : v55;
            memcpy((void *)(v89 + 2 * v72 + 24), &v83[2 * (v71 - v70)], 2 * v74);
            v75 = v89;
            *(_QWORD *)v89 = v69;
            v73 = *(_QWORD *)(v75 + 16) + v74;
            *(_QWORD *)(v75 + 16) = v73;
            v71 += v74;
            v55 -= v74;
          }
          v69 += v73;
          if (!v55)
            break;
          ++v39;
        }
      }
      free(v83);
    }
    v6 = v39;
    length = v86;
    v13 = v84;
  }
  v76 = ((char *)p_chunks->__end_ - (char *)p_chunks->__begin_) >> 4;
  if (v76 > v6 + 1)
  {
    v77 = ~v6 + v76;
    v78 = (_QWORD **)((char *)p_chunks->__begin_ + 16 * v6 + 16);
    do
    {
      v79 = *v78;
      v78 += 2;
      *v79 += length;
      --v77;
    }
    while (v77);
  }
  v13->_length += length;
  v80 = (std::__shared_weak_count *)*((_QWORD *)&v89 + 1);
  if (*((_QWORD *)&v89 + 1))
  {
    v81 = (unint64_t *)(*((_QWORD *)&v89 + 1) + 8);
    do
      v82 = __ldaxr(v81);
    while (__stlxr(v82 - 1, v81));
    if (!v82)
    {
      ((void (*)(std::__shared_weak_count *))v80->__on_zero_shared)(v80);
      std::__shared_weak_count::__release_weak(v80);
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
  TSUChunkedString *v27;
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
    -[TSUChunkedString p_compactChunksInRange:](self, "p_compactChunksInRange:");
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
