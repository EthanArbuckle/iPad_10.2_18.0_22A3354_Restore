@implementation VKRoadSignArtwork

- (VKRoadSignArtwork)initWithFramesetter:(__CTFramesetter *)a3 signMetrics:(RoadSignMetrics *)a4 textMetrics:(RoadSignTextMetrics *)a5 signColoring:glyph:cgGlyph:resourceStore:
{
  _QWORD *v5;
  uint64_t *v6;
  CGImage *v7;
  CGImage *v8;
  uint64_t *v9;
  _QWORD *v10;
  char *v14;
  char *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  void **v26;
  char v27;
  __int128 v28;
  basic_string<char, std::char_traits<char>, geo::StdAllocator<char, mdm::Allocator>> *p_fontFamily;
  size_t size;
  void **v31;
  char contentScale_high;
  __int128 v33;
  void *p_var0;
  double scale;
  __int128 v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t *v39;
  unint64_t v40;
  std::__shared_weak_count *v41;
  unint64_t *p_shared_owners;
  unint64_t v43;
  CFTypeRef v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t *v47;
  unint64_t v48;
  std::__shared_weak_count *v49;
  char *v50;
  _BYTE v52[1040];
  objc_super v53;
  uint64_t *v54;

  v8 = v7;
  v9 = v6;
  v10 = v5;
  v53.receiver = self;
  v53.super_class = (Class)VKRoadSignArtwork;
  v14 = -[VKRoadSignArtwork init](&v53, sel_init);
  v15 = v14;
  if (v14)
  {
    v16 = *(_OWORD *)&a4->_contentScale;
    *((_OWORD *)v14 + 2) = *(_OWORD *)&a4->_orientation;
    *((_OWORD *)v14 + 3) = v16;
    v17 = *(_OWORD *)&a4->_arrowLength;
    v18 = *(_OWORD *)&a4->_arrowJoinCornerRadius;
    v19 = *(_OWORD *)&a4->_strokeWeight;
    *((_OWORD *)v14 + 6) = *(_OWORD *)&a4->_shadowOffset.height;
    *((_OWORD *)v14 + 7) = v19;
    *((_OWORD *)v14 + 4) = v17;
    *((_OWORD *)v14 + 5) = v18;
    v20 = *(_OWORD *)&a4->_signHeight;
    v21 = *(_OWORD *)&a4->_horizontalMargin;
    v22 = *(_OWORD *)&a4->_glyphSize.height;
    *((_OWORD *)v14 + 10) = *(_OWORD *)&a4->_cornerRadius;
    *((_OWORD *)v14 + 11) = v22;
    *((_OWORD *)v14 + 8) = v20;
    *((_OWORD *)v14 + 9) = v21;
    v23 = *(_OWORD *)&a5->_scale;
    v24 = *(_OWORD *)&a5->_horizontalMargin;
    v25 = *(_OWORD *)&a5->_verticalOffset;
    *((_QWORD *)v14 + 30) = *(_QWORD *)&a5->_secondaryTextSize;
    *((_OWORD *)v14 + 13) = v24;
    *((_OWORD *)v14 + 14) = v25;
    *((_OWORD *)v14 + 12) = v23;
    if (v14 + 192 != (char *)a5)
    {
      v26 = (void **)(v14 + 248);
      v27 = *((_BYTE *)&a5->_fontFamily.__r_.__value_.var0.__l + 23);
      if (v15[271] < 0)
      {
        if (v27 >= 0)
          p_fontFamily = &a5->_fontFamily;
        else
          p_fontFamily = (basic_string<char, std::char_traits<char>, geo::StdAllocator<char, mdm::Allocator>> *)a5->_fontFamily.__r_.__value_.var0.__l.__data_;
        if (v27 >= 0)
          size = *((unsigned __int8 *)&a5->_fontFamily.__r_.__value_.var0.__l + 23);
        else
          size = a5->_fontFamily.__r_.__value_.var0.__l.__size_;
        std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>::__assign_no_alias<false>(v26, p_fontFamily, size);
      }
      else if ((*((_BYTE *)&a5->_fontFamily.__r_.__value_.var0.__l + 23) & 0x80) != 0)
      {
        std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>::__assign_no_alias<true>((_QWORD **)v26, a5->_fontFamily.__r_.__value_.var0.__l.__data_, a5->_fontFamily.__r_.__value_.var0.__l.__size_);
      }
      else
      {
        v28 = *(_OWORD *)a5->_fontFamily.__r_.__value_.var0.__s.__data_;
        *((_QWORD *)v15 + 33) = *((_QWORD *)&a5->_fontFamily.__r_.__value_.var0.__l + 2);
        *(_OWORD *)v26 = v28;
      }
      v31 = (void **)(v15 + 280);
      contentScale_high = HIBYTE(a5[1]._contentScale);
      if (v15[303] < 0)
      {
        if (contentScale_high >= 0)
          p_var0 = &a5->_fontFamily.var0;
        else
          p_var0 = (void *)a5->_fontFamily.var0;
        if (contentScale_high >= 0)
          *(_QWORD *)&scale = HIBYTE(a5[1]._contentScale);
        else
          scale = a5[1]._scale;
        std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>::__assign_no_alias<false>(v31, p_var0, *(size_t *)&scale);
      }
      else if ((HIBYTE(a5[1]._contentScale) & 0x80) != 0)
      {
        std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>::__assign_no_alias<true>((_QWORD **)v31, (void *)a5->_fontFamily.var0, *(_QWORD *)&a5[1]._scale);
      }
      else
      {
        v33 = *(_OWORD *)&a5->_fontFamily.var0;
        *((_QWORD *)v15 + 37) = *(_QWORD *)&a5[1]._contentScale;
        *(_OWORD *)v31 = v33;
      }
    }
    v36 = *(_OWORD *)&a5[1]._verticalMargin;
    *((_WORD *)v15 + 164) = LOWORD(a5[1]._textSize);
    *(_OWORD *)(v15 + 312) = v36;
    *((_QWORD *)v15 + 172) = *v10;
    *((_QWORD *)v15 + 173) = v10[1];
    *((_QWORD *)v15 + 174) = v10[2];
    *((_QWORD *)v15 + 175) = v10[3];
    *((_QWORD *)v15 + 176) = v10[4];
    *((_QWORD *)v15 + 177) = v10[5];
    *((_QWORD *)v15 + 178) = v10[6];
    *((_QWORD *)v15 + 179) = v10[7];
    *((_QWORD *)v15 + 180) = v10[8];
    *((_QWORD *)v15 + 181) = v10[9];
    *((_QWORD *)v15 + 182) = v10[10];
    *((_QWORD *)v15 + 183) = v10[11];
    *((_QWORD *)v15 + 184) = v10[12];
    *((_QWORD *)v15 + 185) = v10[13];
    *((_QWORD *)v15 + 186) = v10[14];
    *((_QWORD *)v15 + 187) = v10[15];
    *((_QWORD *)v15 + 188) = v10[16];
    *((_QWORD *)v15 + 189) = v10[17];
    *((_QWORD *)v15 + 190) = v10[18];
    *((_QWORD *)v15 + 191) = v10[19];
    *((_QWORD *)v15 + 192) = v10[20];
    *((_QWORD *)v15 + 193) = v10[21];
    *((_QWORD *)v15 + 194) = v10[22];
    *((_QWORD *)v15 + 195) = v10[23];
    *((_QWORD *)v15 + 196) = v10[24];
    *((_QWORD *)v15 + 197) = v10[25];
    *((_QWORD *)v15 + 198) = v10[26];
    *((_QWORD *)v15 + 199) = v10[27];
    *((_QWORD *)v15 + 200) = v10[28];
    *((_QWORD *)v15 + 201) = v10[29];
    *((_QWORD *)v15 + 202) = v10[30];
    *((_QWORD *)v15 + 203) = v10[31];
    *((_QWORD *)v15 + 204) = v10[32];
    *((_QWORD *)v15 + 205) = v10[33];
    v38 = *v9;
    v37 = v9[1];
    if (v37)
    {
      v39 = (unint64_t *)(v37 + 8);
      do
        v40 = __ldxr(v39);
      while (__stxr(v40 + 1, v39));
    }
    *((_QWORD *)v15 + 206) = v38;
    v41 = (std::__shared_weak_count *)*((_QWORD *)v15 + 207);
    *((_QWORD *)v15 + 207) = v37;
    if (v41)
    {
      p_shared_owners = (unint64_t *)&v41->__shared_owners_;
      do
        v43 = __ldaxr(p_shared_owners);
      while (__stlxr(v43 - 1, p_shared_owners));
      if (!v43)
      {
        ((void (*)(std::__shared_weak_count *))v41->__on_zero_shared)(v41);
        std::__shared_weak_count::__release_weak(v41);
      }
    }
    *((_QWORD *)v15 + 208) = v8;
    *((_QWORD *)v15 + 1) = 0;
    *((_QWORD *)v15 + 2) = 0;
    if (a3)
      v44 = CFRetain(a3);
    else
      v44 = 0;
    *((_QWORD *)v15 + 3) = v44;
    v46 = *v54;
    v45 = v54[1];
    if (v45)
    {
      v47 = (unint64_t *)(v45 + 16);
      do
        v48 = __ldxr(v47);
      while (__stxr(v48 + 1, v47));
    }
    *((_QWORD *)v15 + 215) = v46;
    v49 = (std::__shared_weak_count *)*((_QWORD *)v15 + 216);
    *((_QWORD *)v15 + 216) = v45;
    if (v49)
      std::__shared_weak_count::__release_weak(v49);
    if (*((_QWORD *)v15 + 208))
      CGImageRetain(v8);
    md::RoadSignGeneratedMetrics::RoadSignGeneratedMetrics((md::RoadSignGeneratedMetrics *)v52, (const RoadSignMetrics *)(v15 + 32), (const RoadSignTextMetrics *)v15 + 2);
    memcpy(v15 + 336, v52, 0x410uLL);
    v50 = v15;
  }

  return (VKRoadSignArtwork *)v15;
}

- (VKRoadSignArtwork)initWithLine:(__CTLine *)a3 signMetrics:(RoadSignMetrics *)a4 textMetrics:(RoadSignTextMetrics *)a5 signColoring:glyph:cgGlyph:resourceStore:
{
  _QWORD *v5;
  uint64_t *v6;
  CGImage *v7;
  CGImage *v8;
  uint64_t *v9;
  _QWORD *v10;
  char *v14;
  char *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  void **v26;
  char v27;
  __int128 v28;
  basic_string<char, std::char_traits<char>, geo::StdAllocator<char, mdm::Allocator>> *p_fontFamily;
  size_t size;
  void **v31;
  char contentScale_high;
  __int128 v33;
  void *p_var0;
  double scale;
  __int128 v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t *v39;
  unint64_t v40;
  std::__shared_weak_count *v41;
  unint64_t *p_shared_owners;
  unint64_t v43;
  CFTypeRef v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t *v47;
  unint64_t v48;
  std::__shared_weak_count *v49;
  char *v50;
  _BYTE v52[1040];
  objc_super v53;
  uint64_t *v54;

  v8 = v7;
  v9 = v6;
  v10 = v5;
  v53.receiver = self;
  v53.super_class = (Class)VKRoadSignArtwork;
  v14 = -[VKRoadSignArtwork init](&v53, sel_init);
  v15 = v14;
  if (!v14)
    goto LABEL_44;
  v16 = *(_OWORD *)&a4->_contentScale;
  *((_OWORD *)v14 + 2) = *(_OWORD *)&a4->_orientation;
  *((_OWORD *)v14 + 3) = v16;
  v17 = *(_OWORD *)&a4->_arrowLength;
  v18 = *(_OWORD *)&a4->_arrowJoinCornerRadius;
  v19 = *(_OWORD *)&a4->_strokeWeight;
  *((_OWORD *)v14 + 6) = *(_OWORD *)&a4->_shadowOffset.height;
  *((_OWORD *)v14 + 7) = v19;
  *((_OWORD *)v14 + 4) = v17;
  *((_OWORD *)v14 + 5) = v18;
  v20 = *(_OWORD *)&a4->_signHeight;
  v21 = *(_OWORD *)&a4->_horizontalMargin;
  v22 = *(_OWORD *)&a4->_glyphSize.height;
  *((_OWORD *)v14 + 10) = *(_OWORD *)&a4->_cornerRadius;
  *((_OWORD *)v14 + 11) = v22;
  *((_OWORD *)v14 + 8) = v20;
  *((_OWORD *)v14 + 9) = v21;
  v23 = *(_OWORD *)&a5->_scale;
  v24 = *(_OWORD *)&a5->_horizontalMargin;
  v25 = *(_OWORD *)&a5->_verticalOffset;
  *((_QWORD *)v14 + 30) = *(_QWORD *)&a5->_secondaryTextSize;
  *((_OWORD *)v14 + 13) = v24;
  *((_OWORD *)v14 + 14) = v25;
  *((_OWORD *)v14 + 12) = v23;
  if (v14 + 192 != (char *)a5)
  {
    v26 = (void **)(v14 + 248);
    v27 = *((_BYTE *)&a5->_fontFamily.__r_.__value_.var0.__l + 23);
    if (v15[271] < 0)
    {
      if (v27 >= 0)
        p_fontFamily = &a5->_fontFamily;
      else
        p_fontFamily = (basic_string<char, std::char_traits<char>, geo::StdAllocator<char, mdm::Allocator>> *)a5->_fontFamily.__r_.__value_.var0.__l.__data_;
      if (v27 >= 0)
        size = *((unsigned __int8 *)&a5->_fontFamily.__r_.__value_.var0.__l + 23);
      else
        size = a5->_fontFamily.__r_.__value_.var0.__l.__size_;
      std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>::__assign_no_alias<false>(v26, p_fontFamily, size);
    }
    else if ((*((_BYTE *)&a5->_fontFamily.__r_.__value_.var0.__l + 23) & 0x80) != 0)
    {
      std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>::__assign_no_alias<true>((_QWORD **)v26, a5->_fontFamily.__r_.__value_.var0.__l.__data_, a5->_fontFamily.__r_.__value_.var0.__l.__size_);
    }
    else
    {
      v28 = *(_OWORD *)a5->_fontFamily.__r_.__value_.var0.__s.__data_;
      *((_QWORD *)v15 + 33) = *((_QWORD *)&a5->_fontFamily.__r_.__value_.var0.__l + 2);
      *(_OWORD *)v26 = v28;
    }
    v31 = (void **)(v15 + 280);
    contentScale_high = HIBYTE(a5[1]._contentScale);
    if (v15[303] < 0)
    {
      if (contentScale_high >= 0)
        p_var0 = &a5->_fontFamily.var0;
      else
        p_var0 = (void *)a5->_fontFamily.var0;
      if (contentScale_high >= 0)
        *(_QWORD *)&scale = HIBYTE(a5[1]._contentScale);
      else
        scale = a5[1]._scale;
      std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>::__assign_no_alias<false>(v31, p_var0, *(size_t *)&scale);
    }
    else if ((HIBYTE(a5[1]._contentScale) & 0x80) != 0)
    {
      std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>::__assign_no_alias<true>((_QWORD **)v31, (void *)a5->_fontFamily.var0, *(_QWORD *)&a5[1]._scale);
    }
    else
    {
      v33 = *(_OWORD *)&a5->_fontFamily.var0;
      *((_QWORD *)v15 + 37) = *(_QWORD *)&a5[1]._contentScale;
      *(_OWORD *)v31 = v33;
    }
  }
  v36 = *(_OWORD *)&a5[1]._verticalMargin;
  *((_WORD *)v15 + 164) = LOWORD(a5[1]._textSize);
  *(_OWORD *)(v15 + 312) = v36;
  *((_QWORD *)v15 + 172) = *v10;
  *((_QWORD *)v15 + 173) = v10[1];
  *((_QWORD *)v15 + 174) = v10[2];
  *((_QWORD *)v15 + 175) = v10[3];
  *((_QWORD *)v15 + 176) = v10[4];
  *((_QWORD *)v15 + 177) = v10[5];
  *((_QWORD *)v15 + 178) = v10[6];
  *((_QWORD *)v15 + 179) = v10[7];
  *((_QWORD *)v15 + 180) = v10[8];
  *((_QWORD *)v15 + 181) = v10[9];
  *((_QWORD *)v15 + 182) = v10[10];
  *((_QWORD *)v15 + 183) = v10[11];
  *((_QWORD *)v15 + 184) = v10[12];
  *((_QWORD *)v15 + 185) = v10[13];
  *((_QWORD *)v15 + 186) = v10[14];
  *((_QWORD *)v15 + 187) = v10[15];
  *((_QWORD *)v15 + 188) = v10[16];
  *((_QWORD *)v15 + 189) = v10[17];
  *((_QWORD *)v15 + 190) = v10[18];
  *((_QWORD *)v15 + 191) = v10[19];
  *((_QWORD *)v15 + 192) = v10[20];
  *((_QWORD *)v15 + 193) = v10[21];
  *((_QWORD *)v15 + 194) = v10[22];
  *((_QWORD *)v15 + 195) = v10[23];
  *((_QWORD *)v15 + 196) = v10[24];
  *((_QWORD *)v15 + 197) = v10[25];
  *((_QWORD *)v15 + 198) = v10[26];
  *((_QWORD *)v15 + 199) = v10[27];
  *((_QWORD *)v15 + 200) = v10[28];
  *((_QWORD *)v15 + 201) = v10[29];
  *((_QWORD *)v15 + 202) = v10[30];
  *((_QWORD *)v15 + 203) = v10[31];
  *((_QWORD *)v15 + 204) = v10[32];
  *((_QWORD *)v15 + 205) = v10[33];
  v38 = *v9;
  v37 = v9[1];
  if (v37)
  {
    v39 = (unint64_t *)(v37 + 8);
    do
      v40 = __ldxr(v39);
    while (__stxr(v40 + 1, v39));
  }
  *((_QWORD *)v15 + 206) = v38;
  v41 = (std::__shared_weak_count *)*((_QWORD *)v15 + 207);
  *((_QWORD *)v15 + 207) = v37;
  if (v41)
  {
    p_shared_owners = (unint64_t *)&v41->__shared_owners_;
    do
      v43 = __ldaxr(p_shared_owners);
    while (__stlxr(v43 - 1, p_shared_owners));
    if (!v43)
    {
      ((void (*)(std::__shared_weak_count *))v41->__on_zero_shared)(v41);
      std::__shared_weak_count::__release_weak(v41);
      *((_QWORD *)v15 + 208) = v8;
      if (a3)
        goto LABEL_33;
LABEL_35:
      v44 = 0;
      goto LABEL_36;
    }
  }
  *((_QWORD *)v15 + 208) = v8;
  if (!a3)
    goto LABEL_35;
LABEL_33:
  v44 = CFRetain(a3);
LABEL_36:
  *((_QWORD *)v15 + 2) = 0;
  *((_QWORD *)v15 + 3) = 0;
  *((_QWORD *)v15 + 1) = v44;
  v46 = *v54;
  v45 = v54[1];
  if (v45)
  {
    v47 = (unint64_t *)(v45 + 16);
    do
      v48 = __ldxr(v47);
    while (__stxr(v48 + 1, v47));
  }
  *((_QWORD *)v15 + 215) = v46;
  v49 = (std::__shared_weak_count *)*((_QWORD *)v15 + 216);
  *((_QWORD *)v15 + 216) = v45;
  if (v49)
    std::__shared_weak_count::__release_weak(v49);
  md::RoadSignGeneratedMetrics::RoadSignGeneratedMetrics((md::RoadSignGeneratedMetrics *)v52, (const RoadSignMetrics *)(v15 + 32), (const RoadSignTextMetrics *)v15 + 2);
  memcpy(v15 + 336, v52, 0x410uLL);
  if (*((_QWORD *)v15 + 208))
    CGImageRetain(v8);
  v50 = v15;
LABEL_44:

  return (VKRoadSignArtwork *)v15;
}

- (void)dealloc
{
  const void *v3;
  const void *v4;
  const void *v5;
  const void *v6;
  objc_super v7;

  v3 = (const void *)*((_QWORD *)self + 208);
  if (v3)
    CFRelease(v3);
  v4 = (const void *)*((_QWORD *)self + 3);
  if (v4)
    CFRelease(v4);
  v5 = (const void *)*((_QWORD *)self + 2);
  if (v5)
    CFRelease(v5);
  v6 = (const void *)*((_QWORD *)self + 1);
  if (v6)
    CFRelease(v6);
  v7.receiver = self;
  v7.super_class = (Class)VKRoadSignArtwork;
  -[VKRoadSignArtwork dealloc](&v7, sel_dealloc);
}

- (id)image
{
  std::mutex *v3;
  void *v4;
  double v5;
  double v6;
  size_t AlignedBytesPerRow;
  CGContext *v8;
  CGContext *v9;
  uint64_t v10;
  std::__shared_weak_count *v11;
  unint64_t *p_shared_weak_owners;
  unint64_t v13;
  unint64_t v14;
  id v15;
  void *v16;
  unint64_t *v17;
  unint64_t v18;
  void *v19;
  unint64_t *v20;
  unint64_t v21;
  void *v22;
  unsigned int v23;
  int v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGImage *v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  CGImage *v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  CGImage *v39;
  uint64_t v40;
  uint64_t i;
  uint64_t v42;
  uint64_t j;
  const __CTFrame *v44;
  uint64_t v45;
  unsigned __int8 v46;
  id v47;
  CGImage *v48;
  CGImage *Image;
  VKImage *v50;
  double v51;
  std::__shared_weak_count *v52;
  unint64_t *v53;
  unint64_t v54;
  uint64_t v55;
  void *v56;
  unint64_t *v58;
  unint64_t v59;
  void *v60;
  CGFloat v61;
  CGFloat v62;
  CGFloat v63;
  CGFloat v64;
  CGImage *v65;
  CGFloat v66;
  CGFloat v67;
  CGFloat v68;
  CGFloat v69;
  CGImage *v70;
  CGFloat v71;
  CGFloat v72;
  CGFloat v73;
  CGFloat v74;
  CGImage *v75;
  CGFloat v76;
  CGFloat v77;
  CGFloat v78;
  CGFloat v79;
  CGImage *v80;
  CGFloat v81;
  CGFloat v82;
  CGFloat v83;
  CGFloat v84;
  CGImage *v85;
  CGPath *Mutable;
  uint64_t v87;
  std::__shared_weak_count *v88;
  uint64_t v89;
  std::__shared_weak_count *v90;
  uint64_t v91;
  std::__shared_weak_count *v92;
  uint64_t v93;
  std::__shared_weak_count *v94;
  uint64_t v95;
  std::__shared_weak_count *v96;
  CFRange v97;
  CGRect v98;
  CGRect v99;
  CGRect v100;
  CGRect v101;
  CGRect v102;
  CGRect v103;
  CGRect v104;
  CGRect v105;
  CGRect v106;
  CGRect v107;

  v3 = (std::mutex *)((char *)self + 1736);
  std::mutex::lock((std::mutex *)((char *)self + 1736));
  v4 = (void *)*((_QWORD *)self + 226);
  if (v4)
  {
LABEL_52:
    v15 = v4;
    goto LABEL_53;
  }
  v5 = *((double *)self + 127);
  v6 = *((double *)self + 128);
  AlignedBytesPerRow = CGBitmapGetAlignedBytesPerRow();
  if (_colorSpace(void)::once != -1)
    dispatch_once(&_colorSpace(void)::once, &__block_literal_global_14370);
  v8 = CGBitmapContextCreate(0, (unint64_t)v5, (unint64_t)v6, 8uLL, AlignedBytesPerRow, (CGColorSpaceRef)_colorSpace(void)::colorspace, 0x2002u);
  v9 = v8;
  if (v8)
  {
    v98.origin.x = 0.0;
    v98.origin.y = 0.0;
    v98.size.width = v5;
    v98.size.height = v6;
    CGContextClearRect(v8, v98);
    v10 = *((_QWORD *)self + 215);
    v11 = (std::__shared_weak_count *)*((_QWORD *)self + 216);
    if (v11)
    {
      p_shared_weak_owners = (unint64_t *)&v11->__shared_weak_owners_;
      do
        v13 = __ldxr(p_shared_weak_owners);
      while (__stxr(v13 + 1, p_shared_weak_owners));
      v95 = v10;
      v96 = v11;
      do
        v14 = __ldxr(p_shared_weak_owners);
      while (__stxr(v14 + 1, p_shared_weak_owners));
    }
    else
    {
      v95 = *((_QWORD *)self + 215);
      v96 = 0;
    }
    VKCreateRoadSignImageWithSignType((const RoadSignMetrics *)((char *)self + 32), (const RoadSignPartMetrics *)self + 4, (uint64_t)self + 1376, &v95);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v96)
      std::__shared_weak_count::__release_weak(v96);
    v93 = v10;
    v94 = v11;
    if (v11)
    {
      v17 = (unint64_t *)&v11->__shared_weak_owners_;
      do
        v18 = __ldxr(v17);
      while (__stxr(v18 + 1, v17));
    }
    VKCreateRoadSignImageWithSignType((const RoadSignMetrics *)((char *)self + 32), (const RoadSignPartMetrics *)self + 2, (uint64_t)self + 1376, &v93);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v94)
      std::__shared_weak_count::__release_weak(v94);
    v91 = v10;
    v92 = v11;
    if (v11)
    {
      v20 = (unint64_t *)&v11->__shared_weak_owners_;
      do
        v21 = __ldxr(v20);
      while (__stxr(v21 + 1, v20));
    }
    VKCreateRoadSignImageWithSignType((const RoadSignMetrics *)((char *)self + 32), (const RoadSignPartMetrics *)self + 3, (uint64_t)self + 1376, &v91);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v92)
      std::__shared_weak_count::__release_weak(v92);
    v23 = *((unsigned __int8 *)self + 32);
    if (v23 <= 0xD)
    {
      v24 = 1 << v23;
      if ((v24 & 0x3BF6) != 0)
      {
        v25 = *((double *)self + 148);
        v26 = *((double *)self + 149);
        v27 = *((double *)self + 150);
        v28 = *((double *)self + 151);
        v29 = (CGImage *)objc_msgSend(v19, "image");
        v99.origin.x = v25;
        v99.origin.y = v26;
        v99.size.width = v27;
        v99.size.height = v28;
        CGContextDrawImage(v9, v99, v29);
        v30 = *((double *)self + 156);
        v31 = *((double *)self + 157);
        v32 = *((double *)self + 158);
        v33 = *((double *)self + 159);
        v34 = (CGImage *)objc_msgSend(v16, "image");
        v100.origin.x = v30;
        v100.origin.y = v31;
        v100.size.width = v32;
        v100.size.height = v33;
        CGContextDrawImage(v9, v100, v34);
        v35 = *((double *)self + 152);
        v36 = *((double *)self + 153);
        v37 = *((double *)self + 154);
        v38 = *((double *)self + 155);
        v39 = (CGImage *)objc_msgSend(v22, "image");
        v101.origin.x = v35;
        v101.origin.y = v36;
        v101.size.width = v37;
        v101.size.height = v38;
        CGContextDrawImage(v9, v101, v39);
      }
      else if ((v24 & 0x408) != 0)
      {
        v89 = v10;
        v90 = v11;
        if (v11)
        {
          v58 = (unint64_t *)&v11->__shared_weak_owners_;
          do
            v59 = __ldxr(v58);
          while (__stxr(v59 + 1, v58));
        }
        VKCreateRoadSignImageWithSignType((const RoadSignMetrics *)((char *)self + 32), (const RoadSignPartMetrics *)self + 5, (uint64_t)self + 1376, &v89);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        if (v90)
          std::__shared_weak_count::__release_weak(v90);
        v61 = *((double *)self + 148);
        v62 = *((double *)self + 149);
        v63 = *((double *)self + 150);
        v64 = *((double *)self + 151);
        v65 = (CGImage *)objc_msgSend(v19, "image");
        v103.origin.x = v61;
        v103.origin.y = v62;
        v103.size.width = v63;
        v103.size.height = v64;
        CGContextDrawImage(v9, v103, v65);
        if (*((double *)self + 137) > 0.0)
        {
          v66 = *((double *)self + 164);
          v67 = *((double *)self + 165);
          v68 = *((double *)self + 166);
          v69 = *((double *)self + 167);
          v70 = (CGImage *)objc_msgSend(v16, "image");
          v104.origin.x = v66;
          v104.origin.y = v67;
          v104.size.width = v68;
          v104.size.height = v69;
          CGContextDrawImage(v9, v104, v70);
        }
        v71 = *((double *)self + 160);
        v72 = *((double *)self + 161);
        v73 = *((double *)self + 162);
        v74 = *((double *)self + 163);
        v75 = (CGImage *)objc_msgSend(v60, "image");
        v105.origin.x = v71;
        v105.origin.y = v72;
        v105.size.width = v73;
        v105.size.height = v74;
        CGContextDrawImage(v9, v105, v75);
        if (*((double *)self + 137) > 0.0)
        {
          v76 = *((double *)self + 168);
          v77 = *((double *)self + 169);
          v78 = *((double *)self + 170);
          v79 = *((double *)self + 171);
          v80 = (CGImage *)objc_msgSend(v16, "image");
          v106.origin.x = v76;
          v106.origin.y = v77;
          v106.size.width = v78;
          v106.size.height = v79;
          CGContextDrawImage(v9, v106, v80);
        }
        v81 = *((double *)self + 152);
        v82 = *((double *)self + 153);
        v83 = *((double *)self + 154);
        v84 = *((double *)self + 155);
        v85 = (CGImage *)objc_msgSend(v22, "image");
        v107.origin.x = v81;
        v107.origin.y = v82;
        v107.size.width = v83;
        v107.size.height = v84;
        CGContextDrawImage(v9, v107, v85);

      }
    }
    v40 = *((_QWORD *)self + 209);
    for (i = *((_QWORD *)self + 210); v40 != i; v40 += 32)
    {
      CGContextSetRGBFillColor(v9, *(float *)(v40 + 16), *(float *)(v40 + 20), *(float *)(v40 + 24), *(float *)(v40 + 28));
      v102.origin.x = *(double *)v40 + -2.0;
      v102.origin.y = *(double *)(v40 + 8) + -2.0;
      v102.size.width = 4.0;
      v102.size.height = 4.0;
      CGContextFillRect(v9, v102);
    }
    v42 = *((_QWORD *)self + 212);
    for (j = *((_QWORD *)self + 213); v42 != j; v42 += 48)
    {
      CGContextSetRGBStrokeColor(v9, *(float *)(v42 + 32), *(float *)(v42 + 36), *(float *)(v42 + 40), *(float *)(v42 + 44));
      CGContextStrokeRect(v9, *(CGRect *)v42);
    }

    if (v11)
      std::__shared_weak_count::__release_weak(v11);
    if (*((_QWORD *)self + 1))
    {
      CGContextSetTextPosition(v9, *((CGFloat *)self + 142), *((CGFloat *)self + 143));
      CTLineDraw(*((CTLineRef *)self + 1), v9);
    }
    else
    {
      v44 = (const __CTFrame *)*((_QWORD *)self + 2);
      if (v44)
        goto LABEL_37;
      if (*((_QWORD *)self + 3))
      {
        Mutable = CGPathCreateMutable();
        CGPathAddRect(Mutable, 0, *((CGRect *)self + 36));
        v97.location = 0;
        v97.length = 0;
        *((_QWORD *)self + 2) = CTFramesetterCreateFrame(*((CTFramesetterRef *)self + 3), v97, Mutable, 0);
        CFRelease(*((CFTypeRef *)self + 3));
        *((_QWORD *)self + 3) = 0;
        CFRelease(Mutable);
        v44 = (const __CTFrame *)*((_QWORD *)self + 2);
        if (v44)
LABEL_37:
          CTFrameDraw(v44, v9);
      }
    }
    v45 = *((_QWORD *)self + 206);
    if (v45)
    {
      v46 = atomic_load((unsigned __int8 *)(v45 + 143));
      if ((v46 & 1) != 0)
        v47 = *(id *)(v45 + 16);
      else
        v47 = 0;
      v48 = (CGImage *)objc_msgSend(v47, "image");

    }
    else
    {
      v48 = (CGImage *)*((_QWORD *)self + 208);
      if (!v48)
        goto LABEL_46;
    }
    CGContextDrawImage(v9, *(CGRect *)((char *)self + 1064), v48);
LABEL_46:
    Image = CGBitmapContextCreateImage(v9);
    CGContextRelease(v9);
    v50 = [VKImage alloc];
    v51 = *((double *)self + 6);
    v52 = (std::__shared_weak_count *)*((_QWORD *)self + 216);
    v87 = *((_QWORD *)self + 215);
    v88 = v52;
    if (v52)
    {
      v53 = (unint64_t *)&v52->__shared_weak_owners_;
      do
        v54 = __ldxr(v53);
      while (__stxr(v54 + 1, v53));
    }
    v55 = -[VKImage initWithCGImage:scale:resourceStore:](v50, "initWithCGImage:scale:resourceStore:", Image, &v87, v51);
    v56 = (void *)*((_QWORD *)self + 226);
    *((_QWORD *)self + 226) = v55;

    if (v88)
      std::__shared_weak_count::__release_weak(v88);
    CGImageRelease(Image);
    v4 = (void *)*((_QWORD *)self + 226);
    goto LABEL_52;
  }
  v15 = 0;
LABEL_53:
  std::mutex::unlock(v3);
  return v15;
}

- (const)glyph
{
  return (char *)self + 1648;
}

- (Matrix<float,)offsetPixelForPixel:()Matrix<float
{
  float64x2_t v3;
  float32x2_t v9;
  float v10;
  Matrix<float, 2, 1> result;

  if (*((_BYTE *)self + 432)
    || *((_BYTE *)self + 600)
    || (v3 = *(float64x2_t *)MEMORY[0x1E0C9D538], *((_BYTE *)self + 1008)) && *((_BYTE *)self + 936))
  {
    v3 = *((float64x2_t *)self + 70);
  }
  __asm { FMOV            V2.2D, #-0.5 }
  v9 = vcvt_f32_f64(vnegq_f64(vmlaq_f64(v3, _Q2, *(float64x2_t *)((char *)self + 1016))));
  v10 = v9.f32[1];
  result._e[0] = v9.f32[0];
  result._e[1] = v10;
  return result;
}

- (Box<float,)localRenderBounds
{
  double v2;
  double v3;
  float v4;
  float v5;
  float v6;
  float v7;
  Box<float, 2> result;

  v2 = *((double *)self + 127);
  v3 = *((double *)self + 128);
  v4 = v2 * -0.5;
  v5 = v3 * -0.5;
  v6 = v2 * 0.5;
  v7 = v3 * 0.5;
  result._maximum._e[1] = v7;
  result._maximum._e[0] = v6;
  result._minimum._e[1] = v5;
  result._minimum._e[0] = v4;
  return result;
}

- (Box<float,)localSignBounds
{
  float v2;
  float v3;
  float v4;
  float v5;
  float v6;
  float v7;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  Box<float, 2> result;

  v2 = *((double *)self + 129);
  v3 = *((double *)self + 130);
  v4 = *((double *)self + 131);
  v5 = *((double *)self + 132);
  v6 = v4 + v2;
  v7 = v5 + v3;
  if (v6 < v2 || v7 < v3)
  {
    v12 = 3.4028e38;
    v14 = -3.4028e38;
    v13 = -3.4028e38;
    v11 = 3.4028e38;
  }
  else
  {
    v9 = *((double *)self + 128) * 0.5;
    v10 = *((double *)self + 127) * 0.5;
    v11 = v2 - v10;
    v12 = v3 - v9;
    v13 = v6 - v10;
    v14 = v7 - v9;
  }
  result._maximum._e[1] = v14;
  result._maximum._e[0] = v13;
  result._minimum._e[1] = v12;
  result._minimum._e[0] = v11;
  return result;
}

- (Box<float,)localCollisionBounds
{
  float v2;
  float v3;
  float v4;
  float v5;
  Box<float, 2> result;

  -[VKRoadSignArtwork localRenderBounds](self, "localRenderBounds");
  if (v4 < v2 || v5 < v3)
  {
    v4 = -3.4028e38;
    v2 = 3.4028e38;
    v3 = 3.4028e38;
    v5 = -3.4028e38;
  }
  result._maximum._e[1] = v5;
  result._maximum._e[0] = v4;
  result._minimum._e[1] = v3;
  result._minimum._e[0] = v2;
  return result;
}

- (const)generatedMetrics
{
  return (const RoadSignGeneratedMetrics *)((char *)self + 336);
}

- (const)textMetrics
{
  return (char *)self + 192;
}

- (void)addDebugPoint:(CGPoint)a3 color:()Color<float
{
  CGPoint *v4;
  CGPoint *v5;
  CGFloat y;
  CGFloat x;
  CGPoint *v9;
  unint64_t v10;
  CGPoint *v11;
  CGPoint *v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  char *v17;
  CGPoint *v18;

  v5 = v4;
  y = a3.y;
  x = a3.x;
  v9 = (CGPoint *)*((_QWORD *)self + 210);
  v10 = *((_QWORD *)self + 211);
  if ((unint64_t)v9 >= v10)
  {
    v12 = (CGPoint *)*((_QWORD *)self + 209);
    v13 = ((char *)v9 - (char *)v12) >> 5;
    v14 = v13 + 1;
    if ((unint64_t)(v13 + 1) >> 59)
      abort();
    v15 = v10 - (_QWORD)v12;
    if (v15 >> 4 > v14)
      v14 = v15 >> 4;
    if ((unint64_t)v15 >= 0x7FFFFFFFFFFFFFE0)
      v16 = 0x7FFFFFFFFFFFFFFLL;
    else
      v16 = v14;
    if (v16)
    {
      if (v16 >> 59)
        std::__throw_bad_array_new_length[abi:nn180100]();
      v17 = (char *)operator new(32 * v16);
    }
    else
    {
      v17 = 0;
    }
    v18 = (CGPoint *)&v17[32 * v13];
    v18->x = x;
    v18->y = y;
    v18[1] = *v5;
    v11 = v18 + 2;
    if (v9 != v12)
    {
      do
      {
        v18[-2] = v9[-2];
        v18[-1] = v9[-1];
        v18 -= 2;
        v9 -= 2;
      }
      while (v9 != v12);
      v9 = (CGPoint *)*((_QWORD *)self + 209);
    }
    *((_QWORD *)self + 209) = v18;
    *((_QWORD *)self + 210) = v11;
    *((_QWORD *)self + 211) = &v17[32 * v16];
    if (v9)
      operator delete(v9);
  }
  else
  {
    *v9 = a3;
    v9[1] = *v4;
    v11 = v9 + 2;
  }
  *((_QWORD *)self + 210) = v11;
}

- (void)addDebugRect:(CGRect)a3 color:()Color<float
{
  _OWORD *v4;
  _OWORD *v5;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGRect *v11;
  unint64_t v12;
  CGSize *p_size;
  CGRect *v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  char *v18;
  char *v19;
  CGPoint origin;

  v5 = v4;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11 = (CGRect *)*((_QWORD *)self + 213);
  v12 = *((_QWORD *)self + 214);
  if ((unint64_t)v11 >= v12)
  {
    v14 = (CGRect *)*((_QWORD *)self + 212);
    v15 = 0xAAAAAAAAAAAAAAABLL * (((char *)v11 - (char *)v14) >> 4) + 1;
    if (v15 > 0x555555555555555)
      abort();
    v16 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v12 - (_QWORD)v14) >> 4);
    if (2 * v16 > v15)
      v15 = 2 * v16;
    if (v16 >= 0x2AAAAAAAAAAAAAALL)
      v17 = 0x555555555555555;
    else
      v17 = v15;
    if (v17)
    {
      if (v17 > 0x555555555555555)
        std::__throw_bad_array_new_length[abi:nn180100]();
      v18 = (char *)operator new(48 * v17);
    }
    else
    {
      v18 = 0;
    }
    v19 = &v18[16 * (((char *)v11 - (char *)v14) >> 4)];
    *(CGFloat *)v19 = x;
    *((CGFloat *)v19 + 1) = y;
    *((CGFloat *)v19 + 2) = width;
    *((CGFloat *)v19 + 3) = height;
    *((_OWORD *)v19 + 2) = *v5;
    p_size = (CGSize *)(v19 + 48);
    if (v11 != v14)
    {
      do
      {
        origin = v11[-1].origin;
        *((_OWORD *)v19 - 3) = v11[-2].size;
        *((CGPoint *)v19 - 2) = origin;
        *((_OWORD *)v19 - 1) = v11[-1].size;
        v19 -= 48;
        v11 = (CGRect *)((char *)v11 - 48);
      }
      while (v11 != v14);
      v11 = (CGRect *)*((_QWORD *)self + 212);
    }
    *((_QWORD *)self + 212) = v19;
    *((_QWORD *)self + 213) = p_size;
    *((_QWORD *)self + 214) = &v18[48 * v17];
    if (v11)
      operator delete(v11);
  }
  else
  {
    *v11 = a3;
    v11[1].origin = (CGPoint)*v4;
    p_size = &v11[1].size;
  }
  *((_QWORD *)self + 213) = p_size;
}

- (void).cxx_destruct
{
  std::__shared_weak_count *v3;
  void *v4;
  void *v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;

  *((_QWORD *)self + 225) = &off_1E42B5430;

  std::mutex::~mutex((std::mutex *)((char *)self + 1736));
  v3 = (std::__shared_weak_count *)*((_QWORD *)self + 216);
  if (v3)
    std::__shared_weak_count::__release_weak(v3);
  v4 = (void *)*((_QWORD *)self + 212);
  if (v4)
  {
    *((_QWORD *)self + 213) = v4;
    operator delete(v4);
  }
  v5 = (void *)*((_QWORD *)self + 209);
  if (v5)
  {
    *((_QWORD *)self + 210) = v5;
    operator delete(v5);
  }
  v6 = (std::__shared_weak_count *)*((_QWORD *)self + 207);
  if (!v6)
    goto LABEL_11;
  p_shared_owners = (unint64_t *)&v6->__shared_owners_;
  do
    v8 = __ldaxr(p_shared_owners);
  while (__stlxr(v8 - 1, p_shared_owners));
  if (!v8)
  {
    ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
    std::__shared_weak_count::__release_weak(v6);
    if ((*((char *)self + 303) & 0x80000000) == 0)
    {
LABEL_12:
      if ((*((char *)self + 271) & 0x80000000) == 0)
        return;
LABEL_16:
      (*(void (**)(_QWORD, _QWORD, uint64_t))(**((_QWORD **)self + 34) + 40))(*((_QWORD *)self + 34), *((_QWORD *)self + 31), *((_QWORD *)self + 33) & 0x7FFFFFFFFFFFFFFFLL);
      return;
    }
  }
  else
  {
LABEL_11:
    if ((*((char *)self + 303) & 0x80000000) == 0)
      goto LABEL_12;
  }
  (*(void (**)(_QWORD, _QWORD, uint64_t))(**((_QWORD **)self + 38) + 40))(*((_QWORD *)self + 38), *((_QWORD *)self + 35), *((_QWORD *)self + 37) & 0x7FFFFFFFFFFFFFFFLL);
  if (*((char *)self + 271) < 0)
    goto LABEL_16;
}

- (id).cxx_construct
{
  _OWORD *v7;
  __int128 v8;
  float *v11;
  unsigned __int8 v12;
  _OWORD *v13;
  unsigned __int8 v14;
  __int128 *v15;
  __int128 v16;
  __int128 v17;
  __int128 *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  int v36;
  int v37;
  uint64_t v38;
  geo::read_write_lock *v39;
  const char *v40;
  malloc_zone_t *zone;
  int v42;
  int v43;
  uint64_t v44;
  geo::read_write_lock *v45;
  const char *v46;
  malloc_zone_t *v47;
  char *v48;
  __int128 v49;
  __int128 v50;
  id v51;
  id v52;

  *((_BYTE *)self + 32) = 0;
  __asm { FMOV            V5.2D, #1.0 }
  *(_OWORD *)((char *)self + 40) = _Q5;
  *(_OWORD *)((char *)self + 56) = xmmword_19FFB4FB0;
  *((_QWORD *)self + 9) = 0;
  *((_QWORD *)self + 10) = 0;
  v7 = (_OWORD *)MEMORY[0x1E0C9D820];
  v8 = *MEMORY[0x1E0C9D820];
  *(_OWORD *)((char *)self + 88) = *MEMORY[0x1E0C9D820];
  *((_QWORD *)self + 14) = 0;
  *((_QWORD *)self + 15) = 0;
  *((_QWORD *)self + 13) = 0x4034000000000000;
  *((_OWORD *)self + 8) = xmmword_19FFB4FC0;
  *((_QWORD *)self + 18) = 0;
  *((_QWORD *)self + 19) = 0;
  *((_QWORD *)self + 20) = 0x401A000000000000;
  *(_OWORD *)((char *)self + 168) = v8;
  *(_OWORD *)((char *)self + 184) = xmmword_19FFB33A0;
  *(_OWORD *)((char *)self + 200) = xmmword_19FFB4FD0;
  __asm { FMOV            V0.2D, #6.0 }
  *(_OWORD *)((char *)self + 216) = _Q0;
  __asm { FMOV            V0.2D, #17.0 }
  *(_OWORD *)((char *)self + 232) = _Q0;
  *((_QWORD *)self + 31) = 0;
  *((_QWORD *)self + 32) = 0;
  *((_QWORD *)self + 33) = 0;
  v11 = &md::SignedDistanceFieldGenerator::_hypotCache[32438];
  if ((v12 & 1) == 0)
  {
    v51 = self;
    v49 = _Q5;
    _Q5 = v49;
    v11 = md::SignedDistanceFieldGenerator::_hypotCache + 129752;
    v37 = v36;
    self = v51;
    if (v37)
    {
      v38 = operator new();
      *(_QWORD *)(v38 + 16) = 0x5ED09DD50000000FLL;
      *(_QWORD *)(v38 + 24) = "VectorKitLabels";
      *(_OWORD *)(v38 + 32) = xmmword_19FFB2E80;
      *(_QWORD *)v38 = &off_1E42B5668;
      *(_QWORD *)(v38 + 8) = "VectorKitLabels";
      *(_OWORD *)(v38 + 72) = 0u;
      *(_OWORD *)(v38 + 88) = 0u;
      *(_OWORD *)(v38 + 104) = 0u;
      *(_OWORD *)(v38 + 120) = 0u;
      *(_OWORD *)(v38 + 136) = 0u;
      *(_OWORD *)(v38 + 152) = 0u;
      *(_OWORD *)(v38 + 168) = 0u;
      *(_OWORD *)(v38 + 184) = 0u;
      *(_OWORD *)(v38 + 200) = 0u;
      *(_OWORD *)(v38 + 216) = 0u;
      *(_OWORD *)(v38 + 232) = 0u;
      *(_QWORD *)(v38 + 248) = 0;
      *(_OWORD *)(v38 + 56) = 0u;
      v39 = (geo::read_write_lock *)pthread_rwlock_init((pthread_rwlock_t *)(v38 + 56), 0);
      if ((_DWORD)v39)
        geo::read_write_lock::logFailure(v39, (uint64_t)"initialization", v40);
      zone = malloc_create_zone(0, 0);
      *(_QWORD *)(v38 + 48) = zone;
      malloc_set_zone_name(zone, "VectorKitLabels");
      *(_QWORD *)(v38 + 256) = os_log_create("com.apple.VectorKit", "Memory");
      mdm::Allocator::instance(void)::alloc = v38;
      v11 = &md::SignedDistanceFieldGenerator::_hypotCache[32438];
      self = v51;
      v7 = (_OWORD *)MEMORY[0x1E0C9D820];
      _Q5 = v49;
    }
  }
  v13 = (char *)self + 1384;
  *((_QWORD *)self + 34) = *((_QWORD *)v11 + 299);
  *((_QWORD *)self + 35) = 0;
  *((_QWORD *)self + 36) = 0;
  *((_QWORD *)self + 37) = 0;
  if ((v14 & 1) == 0)
  {
    v52 = self;
    v48 = (char *)self + 1384;
    v50 = _Q5;
    _Q5 = v50;
    v11 = md::SignedDistanceFieldGenerator::_hypotCache + 129752;
    v13 = v48;
    v43 = v42;
    self = v52;
    if (v43)
    {
      v44 = operator new();
      *(_QWORD *)(v44 + 16) = 0x5ED09DD50000000FLL;
      *(_QWORD *)(v44 + 24) = "VectorKitLabels";
      *(_OWORD *)(v44 + 32) = xmmword_19FFB2E80;
      *(_QWORD *)v44 = &off_1E42B5668;
      *(_QWORD *)(v44 + 8) = "VectorKitLabels";
      *(_OWORD *)(v44 + 72) = 0u;
      *(_OWORD *)(v44 + 88) = 0u;
      *(_OWORD *)(v44 + 104) = 0u;
      *(_OWORD *)(v44 + 120) = 0u;
      *(_OWORD *)(v44 + 136) = 0u;
      *(_OWORD *)(v44 + 152) = 0u;
      *(_OWORD *)(v44 + 168) = 0u;
      *(_OWORD *)(v44 + 184) = 0u;
      *(_OWORD *)(v44 + 200) = 0u;
      *(_OWORD *)(v44 + 216) = 0u;
      *(_OWORD *)(v44 + 232) = 0u;
      *(_QWORD *)(v44 + 248) = 0;
      *(_OWORD *)(v44 + 56) = 0u;
      v45 = (geo::read_write_lock *)pthread_rwlock_init((pthread_rwlock_t *)(v44 + 56), 0);
      if ((_DWORD)v45)
        geo::read_write_lock::logFailure(v45, (uint64_t)"initialization", v46);
      v47 = malloc_create_zone(0, 0);
      *(_QWORD *)(v44 + 48) = v47;
      malloc_set_zone_name(v47, "VectorKitLabels");
      *(_QWORD *)(v44 + 256) = os_log_create("com.apple.VectorKit", "Memory");
      mdm::Allocator::instance(void)::alloc = v44;
      v11 = &md::SignedDistanceFieldGenerator::_hypotCache[32438];
      self = v52;
      v7 = (_OWORD *)MEMORY[0x1E0C9D820];
      v13 = v48;
      _Q5 = v50;
    }
  }
  *((_QWORD *)self + 38) = *((_QWORD *)v11 + 299);
  *(_OWORD *)((char *)self + 312) = 0u;
  *((_WORD *)self + 164) = 1;
  *((_BYTE *)self + 336) = 0;
  *(_OWORD *)((char *)self + 344) = *v7;
  v15 = (__int128 *)MEMORY[0x1E0C9D648];
  v16 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
  v17 = *MEMORY[0x1E0C9D648];
  *(_OWORD *)((char *)self + 360) = *MEMORY[0x1E0C9D648];
  *(_OWORD *)((char *)self + 376) = v16;
  *(_OWORD *)((char *)self + 392) = 0u;
  *(_OWORD *)((char *)self + 408) = 0u;
  *(_OWORD *)((char *)self + 417) = 0u;
  v18 = (__int128 *)MEMORY[0x1E0C9D538];
  v19 = *MEMORY[0x1E0C9D538];
  *(_OWORD *)((char *)self + 440) = *MEMORY[0x1E0C9D538];
  *(_OWORD *)((char *)self + 456) = v19;
  v20 = *v18;
  *(_OWORD *)((char *)self + 472) = *v18;
  *(_OWORD *)((char *)self + 488) = v20;
  *((_BYTE *)self + 504) = 0;
  v21 = *v15;
  *((_OWORD *)self + 32) = *v7;
  *((_OWORD *)self + 33) = v21;
  *((_OWORD *)self + 34) = v15[1];
  *((_OWORD *)self + 35) = 0u;
  *((_OWORD *)self + 36) = 0u;
  *(_OWORD *)((char *)self + 585) = 0u;
  *((_OWORD *)self + 38) = v20;
  *((_OWORD *)self + 39) = v20;
  *((_OWORD *)self + 40) = v20;
  *((_OWORD *)self + 41) = v20;
  *((_BYTE *)self + 672) = 0;
  v22 = *v7;
  *(_OWORD *)((char *)self + 680) = *v7;
  v23 = *v18;
  *(_OWORD *)((char *)self + 776) = *v18;
  *(_OWORD *)((char *)self + 792) = v23;
  *(_OWORD *)((char *)self + 808) = v23;
  *(_OWORD *)((char *)self + 824) = v23;
  v25 = *v15;
  v24 = v15[1];
  *(_OWORD *)((char *)self + 696) = *v15;
  *(_OWORD *)((char *)self + 712) = v24;
  *(_OWORD *)((char *)self + 728) = 0u;
  *(_OWORD *)((char *)self + 744) = 0u;
  *(_OWORD *)((char *)self + 753) = 0u;
  *((_BYTE *)self + 840) = 0;
  *((_OWORD *)self + 53) = v22;
  *((_OWORD *)self + 54) = v25;
  *(_OWORD *)((char *)self + 921) = 0u;
  *((_OWORD *)self + 56) = 0u;
  *((_OWORD *)self + 57) = 0u;
  *((_OWORD *)self + 55) = v24;
  v26 = *v18;
  *((_OWORD *)self + 59) = *v18;
  *((_OWORD *)self + 60) = v26;
  v27 = *v18;
  *((_OWORD *)self + 61) = *v18;
  *((_OWORD *)self + 62) = v27;
  *((_BYTE *)self + 1008) = 0;
  *(_OWORD *)((char *)self + 1016) = *v7;
  v28 = v15[1];
  *(_OWORD *)((char *)self + 1032) = *v15;
  *(_OWORD *)((char *)self + 1048) = v28;
  v29 = v15[1];
  *(_OWORD *)((char *)self + 1064) = *v15;
  *(_OWORD *)((char *)self + 1080) = v29;
  *((_QWORD *)self + 137) = 0;
  *((_OWORD *)self + 69) = *v18;
  *((_OWORD *)self + 70) = *v18;
  *((_OWORD *)self + 71) = *v18;
  v30 = *v15;
  *((_OWORD *)self + 73) = v15[1];
  *((_OWORD *)self + 72) = v30;
  v31 = *v15;
  *((_OWORD *)self + 75) = v15[1];
  *((_OWORD *)self + 74) = v31;
  v32 = *v15;
  *((_OWORD *)self + 77) = v15[1];
  *((_OWORD *)self + 76) = v32;
  v33 = *v15;
  *((_OWORD *)self + 79) = v15[1];
  *((_OWORD *)self + 78) = v33;
  v34 = *v15;
  *((_OWORD *)self + 81) = v15[1];
  *((_OWORD *)self + 80) = v34;
  v35 = *v15;
  *((_OWORD *)self + 83) = v15[1];
  *((_OWORD *)self + 82) = v35;
  *((_OWORD *)self + 85) = v15[1];
  *((_OWORD *)self + 84) = v17;
  *((_QWORD *)self + 205) = 0;
  *((_QWORD *)self + 172) = 0x1010000000001;
  *v13 = _Q5;
  v13[1] = _Q5;
  *((_QWORD *)self + 195) = 0;
  *(_OWORD *)((char *)self + 1544) = 0u;
  *((_QWORD *)self + 196) = 0x3FC99999A0000000;
  *((_QWORD *)self + 199) = 0;
  *(_OWORD *)((char *)self + 1576) = 0u;
  *((_QWORD *)self + 200) = 0x3FF0000000000000;
  *((_OWORD *)self + 103) = 0u;
  *(_OWORD *)((char *)self + 1704) = 0u;
  *(_OWORD *)((char *)self + 1720) = 0u;
  *(_OWORD *)((char *)self + 1672) = 0u;
  *(_OWORD *)((char *)self + 1688) = 0u;
  *((_QWORD *)self + 217) = 850045863;
  *((_QWORD *)self + 224) = 0;
  *((_OWORD *)self + 111) = 0u;
  *((_OWORD *)self + 110) = 0u;
  *((_OWORD *)self + 109) = 0u;
  *((_QWORD *)self + 225) = &off_1E42B5430;
  *((_QWORD *)self + 226) = 0;
  return self;
}

@end
