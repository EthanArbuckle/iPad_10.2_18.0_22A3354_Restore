@implementation TSUUUIDSubsetCreator

- (TSUUUIDSubsetCreator)initWithUuidSetStore:(id)a3 baseUuidVector:(const void *)a4
{
  id v7;
  TSUUUIDSubsetCreator *v8;
  TSUUUIDSubsetCreator *v9;
  TSUUUIDSubsetCreator *v10;
  uint64_t v11;
  NSMutableDictionary *createdSubsetsByRange;
  objc_super v14;

  v7 = a3;
  v14.receiver = self;
  v14.super_class = (Class)TSUUUIDSubsetCreator;
  v8 = -[TSUUUIDSubsetCreator init](&v14, sel_init);
  v9 = v8;
  v10 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_uuidSetStore, a3);
    if (&v9->_baseUuidVector != a4)
      std::vector<TSU::UUIDData<TSP::UUIDData>>::__assign_with_size[abi:ne180100]<TSU::UUIDData<TSP::UUIDData>*,TSU::UUIDData<TSP::UUIDData>*>((char *)&v9->_baseUuidVector, *(char **)a4, *((_QWORD *)a4 + 1), (uint64_t)(*((_QWORD *)a4 + 1) - *(_QWORD *)a4) >> 4);
    v11 = objc_opt_new();
    createdSubsetsByRange = v10->_createdSubsetsByRange;
    v10->_createdSubsetsByRange = (NSMutableDictionary *)v11;

  }
  return v10;
}

- (unsigned)uuidSetStoreIndexForIndexesInRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  char *begin;
  __int128 v16;

  length = a3.length;
  if (a3.length)
  {
    location = a3.location;
    NSStringFromRange(a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](self->_createdSubsetsByRange, "objectForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      LODWORD(length) = objc_msgSend(v7, "unsignedIntegerValue");
    }
    else
    {
      v9 = length + location - 1;
      if (v9 >= ((char *)self->_baseUuidVector.__end_ - (char *)self->_baseUuidVector.__begin_) >> 4)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUUUIDSubsetCreator uuidSetStoreIndexForIndexesInRange:]");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUUUIDSetStore.mm");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 322, 0, "Range %@ too large for uuid vector", v6);

        +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
      }
      v12 = (void *)objc_opt_new();
      if (location <= v9)
      {
        v13 = 16 * location;
        do
        {
          begin = (char *)self->_baseUuidVector.__begin_;
          if (location >= ((char *)self->_baseUuidVector.__end_ - (char *)begin) >> 4)
            std::vector<TSU::UUIDData<TSP::UUIDData>>::__throw_out_of_range[abi:ne180100]();
          v16 = *(_OWORD *)&begin[v13];
          objc_msgSend(v12, "addUUID:", &v16);
          ++location;
          v13 += 16;
          --length;
        }
        while (length);
      }
      LODWORD(length) = -[TSUUUIDSetStore addSet:](self->_uuidSetStore, "addSet:", v12);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", length);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
        -[NSMutableDictionary setObject:forKey:](self->_createdSubsetsByRange, "setObject:forKey:", v8, v6);

    }
  }
  return length;
}

- (const)baseUuidVector
{
  return &self->_baseUuidVector;
}

- (TSUUUIDSetStore)uuidSetStore
{
  return (TSUUUIDSetStore *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  void *begin;

  objc_storeStrong((id *)&self->_createdSubsetsByRange, 0);
  begin = self->_baseUuidVector.__begin_;
  if (begin)
  {
    self->_baseUuidVector.__end_ = begin;
    operator delete(begin);
  }
  objc_storeStrong((id *)&self->_uuidSetStore, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 4) = 0;
  return self;
}

@end
