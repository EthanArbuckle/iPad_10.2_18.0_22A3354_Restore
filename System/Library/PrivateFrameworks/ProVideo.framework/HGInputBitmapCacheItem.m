@implementation HGInputBitmapCacheItem

- (HGInputBitmapCacheItem)initWithHGBitmap:(void *)a3 fullSize:(CGSize)a4 colorSpace:(id)a5 gainMap:(HGRef<HGBitmap>)a6
{
  CGFloat height;
  CGFloat width;
  id v12;
  HGInputBitmapCacheItem *v13;
  HGInputBitmapCacheItem *v14;
  HGInputBitmapCacheItem *v15;
  uint64_t p_bitmaps;
  HGBitmap *m_Obj;
  HGBitmap *v18;
  objc_super v20;

  height = a4.height;
  width = a4.width;
  v12 = a5;
  v20.receiver = self;
  v20.super_class = (Class)HGInputBitmapCacheItem;
  v13 = -[HGInputBitmapCacheItem init](&v20, sel_init);
  v14 = v13;
  v15 = v13;
  if (v13)
  {
    p_bitmaps = (uint64_t)&v13->_bitmaps;
    if (&v14->_bitmaps != a3)
      std::vector<HGRef<HGBitmap>>::__assign_with_size[abi:ne180100]<HGRef<HGBitmap>*,HGRef<HGBitmap>*>(p_bitmaps, *(uint64_t **)a3, *((uint64_t **)a3 + 1), (uint64_t)(*((_QWORD *)a3 + 1) - *(_QWORD *)a3) >> 3);
    v15->_fullSize.width = width;
    v15->_fullSize.height = height;
    objc_storeStrong((id *)&v14->_colorSpace, a5);
    m_Obj = v15->_gainMap.m_Obj;
    v18 = *(HGBitmap **)a6.m_Obj;
    if (m_Obj != *(HGBitmap **)a6.m_Obj)
    {
      if (m_Obj)
      {
        (*(void (**)(HGBitmap *))(*(_QWORD *)m_Obj + 24))(v15->_gainMap.m_Obj);
        v18 = *(HGBitmap **)a6.m_Obj;
      }
      v15->_gainMap.m_Obj = v18;
      if (v18)
        (*(void (**)(HGBitmap *))(*(_QWORD *)v18 + 16))(v18);
    }
    -[HGInputBitmapCacheItem updateLastUsedTime](v15, "updateLastUsedTime");
  }

  return v15;
}

- (void)updateLastUsedTime
{
  NSDate *v3;
  NSDate *lastUsedTime;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (NSDate *)objc_claimAutoreleasedReturnValue();
  lastUsedTime = self->_lastUsedTime;
  self->_lastUsedTime = v3;

}

- (vector<HGRef<HGBitmap>,)bitmaps
{
  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  return (vector<HGRef<HGBitmap>, std::allocator<HGRef<HGBitmap>>> *)std::vector<HGRef<HGBitmap>>::__init_with_size[abi:ne180100]<HGRef<HGBitmap>*,HGRef<HGBitmap>*>((uint64_t *)retstr, (uint64_t *)self->_bitmaps.__begin_, (uint64_t *)self->_bitmaps.__end_, ((char *)self->_bitmaps.__end_- (char *)self->_bitmaps.__begin_) >> 3);
}

- (NSDate)lastUsedTime
{
  return self->_lastUsedTime;
}

- (CGSize)fullSize
{
  double width;
  double height;
  CGSize result;

  width = self->_fullSize.width;
  height = self->_fullSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (PVColorSpace)colorSpace
{
  return self->_colorSpace;
}

- (HGRef<HGBitmap>)gainMap
{
  HGBitmap **v2;
  HGBitmap *m_Obj;

  m_Obj = self->_gainMap.m_Obj;
  *v2 = m_Obj;
  if (m_Obj)
    return (HGRef<HGBitmap>)(*(uint64_t (**)(HGBitmap *))(*(_QWORD *)m_Obj + 16))(m_Obj);
  return (HGRef<HGBitmap>)m_Obj;
}

- (void).cxx_destruct
{
  HGBitmap *m_Obj;
  vector<HGRef<HGBitmap>, std::allocator<HGRef<HGBitmap>>> *p_bitmaps;

  p_bitmaps = &self->_bitmaps;
  std::vector<HGRef<HGBitmap>>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_bitmaps);
  m_Obj = self->_gainMap.m_Obj;
  if (m_Obj)
    (*(void (**)(HGBitmap *))(*(_QWORD *)m_Obj + 24))(m_Obj);
  objc_storeStrong((id *)&self->_colorSpace, 0);
  objc_storeStrong((id *)&self->_lastUsedTime, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 7) = 0;
  *((_QWORD *)self + 8) = 0;
  *((_QWORD *)self + 6) = 0;
  return self;
}

@end
