@implementation VKMetrics

- (VKMetrics)initWithDescriptor:(id)a3
{
  id v4;
  VKMetrics *v5;
  uint64_t v6;
  LabelMetrics *value;
  void *v13;
  LabelMetrics *v14;
  LabelMetrics *v15;
  unint64_t v16;
  char v17;
  uint64_t v18;
  std::__shared_weak_count *v19;
  unint64_t *p_shared_owners;
  unint64_t v21;
  uint64_t v23;
  std::__shared_weak_count *v24;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)VKMetrics;
  v5 = -[VKMetrics init](&v25, sel_init);
  if (v5)
  {
    v6 = operator new();
    *(_QWORD *)v6 = 0;
    *(_QWORD *)(v6 + 8) = 0;
    *(_WORD *)(v6 + 24) = 1024;
    *(_QWORD *)(v6 + 16) = 0;
    *(_BYTE *)(v6 + 26) = 1;
    __asm { FMOV            V0.2S, #1.0 }
    *(_QWORD *)(v6 + 28) = _D0;
    value = v5->_labelMetrics.__ptr_.__value_;
    v5->_labelMetrics.__ptr_.__value_ = (LabelMetrics *)v6;
    if (value)
    {
      v13 = *(void **)value;
      if (*(_QWORD *)value)
      {
        *((_QWORD *)value + 1) = v13;
        operator delete(v13);
      }
      MEMORY[0x1A1AF4E00](value, 0x1020C4040A25C38);
      v6 = (uint64_t)v5->_labelMetrics.__ptr_.__value_;
    }
    *(_BYTE *)(v6 + 24) = objc_msgSend(v4, "carDisplayType") != 0;
    v14 = v5->_labelMetrics.__ptr_.__value_;
    *((_BYTE *)v14 + 25) = +[VKInternalIconManager convertSizeGroup:](VKInternalIconManager, "convertSizeGroup:", objc_msgSend(v4, "shieldSize"));
    v15 = v5->_labelMetrics.__ptr_.__value_;
    v16 = objc_msgSend(v4, "labelScaleFactor");
    if (v16 >= 6)
      v17 = 1;
    else
      v17 = v16;
    *((_BYTE *)v15 + 26) = v17;
    v18 = (uint64_t)v5->_labelMetrics.__ptr_.__value_;
    if (v4)
    {
      objc_msgSend(v4, "styleManager");
    }
    else
    {
      v23 = 0;
      v24 = 0;
    }
    md::LabelMetrics::initialize(v18, &v23);
    v19 = v24;
    if (v24)
    {
      p_shared_owners = (unint64_t *)&v24->__shared_owners_;
      do
        v21 = __ldaxr(p_shared_owners);
      while (__stlxr(v21 - 1, p_shared_owners));
      if (!v21)
      {
        ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
        std::__shared_weak_count::__release_weak(v19);
      }
    }
  }

  return v5;
}

- (CGRect)boundingRectForItem:(unsigned __int8)a3 text:(id)a4 locale:(id)a5
{
  int v6;
  id v8;
  id v9;
  id v10;
  const char *v11;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  float v21[3];
  float v22;
  char v23;
  __int128 v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  CGRect result;

  v6 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_retainAutorelease(v8);
  v11 = (const char *)objc_msgSend(v10, "UTF8String");
  v12 = objc_retainAutorelease(v9);
  md::StringWithLocaleImp<std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>>::StringWithLocaleImp((uint64_t)&v24, v11, (const char *)objc_msgSend(v12, "UTF8String"));
  md::LabelMetrics::boundingRectForItem((uint64_t)v21, (unsigned __int8 **)self->_labelMetrics.__ptr_.__value_, v6, &v24);
  if (v23)
  {
    v13 = v21[0];
    v14 = (float)-v22;
    v15 = (float)(v21[2] - v21[0]);
    v16 = (float)(v22 - v21[1]);
    if ((SHIBYTE(v28) & 0x80000000) == 0)
      goto LABEL_4;
    goto LABEL_3;
  }
  v13 = 0.0;
  v14 = 0.0;
  v15 = 0.0;
  v16 = 0.0;
  if (SHIBYTE(v28) < 0)
LABEL_3:
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v29 + 40))(v29, v27, v28 & 0x7FFFFFFFFFFFFFFFLL);
LABEL_4:
  if (SHIBYTE(v25) < 0)
    (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)v26 + 40))(v26, v24, v25 & 0x7FFFFFFFFFFFFFFFLL);

  v17 = v13;
  v18 = v14;
  v19 = v15;
  v20 = v16;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (void).cxx_destruct
{
  LabelMetrics *value;
  void *v3;

  value = self->_labelMetrics.__ptr_.__value_;
  self->_labelMetrics.__ptr_.__value_ = 0;
  if (value)
  {
    v3 = *(void **)value;
    if (*(_QWORD *)value)
    {
      *((_QWORD *)value + 1) = v3;
      operator delete(v3);
    }
    JUMPOUT(0x1A1AF4E00);
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

@end
