@implementation TGIE5KVCacheEntryObjC

- (TGIE5KVCacheEntryObjC)initWithKVCacheEntry:(void *)a3
{
  TGIE5KVCacheEntryObjC *v4;
  TGIE5KVCacheEntryObjC *v5;
  TGIE5KVCacheEntry *v6;
  uint64_t p_kvCacheEntry;
  uint64_t *value;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)TGIE5KVCacheEntryObjC;
  v4 = -[TGIE5KVCacheEntryObjC init](&v10, sel_init);
  v5 = v4;
  if (v4)
  {
    v6 = *(TGIE5KVCacheEntry **)a3;
    *(_QWORD *)a3 = 0;
    p_kvCacheEntry = (uint64_t)&v4->_kvCacheEntry;
    value = (uint64_t *)v5->_kvCacheEntry.__ptr_.__value_;
    v5->_kvCacheEntry.__ptr_.__value_ = v6;
    if (value)
      std::default_delete<TGIE5KVCacheEntry>::operator()[abi:ne180100](p_kvCacheEntry, value);
  }
  return v5;
}

- (int64_t)tokenCount
{
  return *(_QWORD *)(*(_QWORD *)-[TGIE5KVCacheEntryObjC kvCacheEntry](self, "kvCacheEntry") + 24);
}

- (const)kvCacheEntry
{
  return &self->_kvCacheEntry;
}

- (int64_t)bufferSize
{
  return *(_QWORD *)(*(_QWORD *)-[TGIE5KVCacheEntryObjC kvCacheEntry](self, "kvCacheEntry") + 16);
}

- (void).cxx_destruct
{
  unique_ptr<TGIE5KVCacheEntry, std::default_delete<TGIE5KVCacheEntry>> *p_kvCacheEntry;
  uint64_t *v3;
  TGIE5KVCacheEntry *value;

  value = self->_kvCacheEntry.__ptr_.__value_;
  p_kvCacheEntry = &self->_kvCacheEntry;
  v3 = (uint64_t *)value;
  p_kvCacheEntry->__ptr_.__value_ = 0;
  if (value)
    std::default_delete<TGIE5KVCacheEntry>::operator()[abi:ne180100]((uint64_t)p_kvCacheEntry, v3);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

@end
