@implementation VKMetricsDescriptor

- (VKMetricsDescriptor)init
{
  VKMetricsDescriptor *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VKMetricsDescriptor;
  result = -[VKMetricsDescriptor init](&v3, sel_init);
  if (result)
    result->_shieldSize = 4;
  return result;
}

- (int64_t)carDisplayType
{
  return self->_carDisplayType;
}

- (void)setCarDisplayType:(int64_t)a3
{
  self->_carDisplayType = a3;
}

- (int64_t)shieldSize
{
  return self->_shieldSize;
}

- (void)setShieldSize:(int64_t)a3
{
  self->_shieldSize = a3;
}

- (int64_t)labelScaleFactor
{
  return self->_labelScaleFactor;
}

- (void)setLabelScaleFactor:(int64_t)a3
{
  self->_labelScaleFactor = a3;
}

- (shared_ptr<gss::StylesheetManager<gss::PropertyID>>)styleManager
{
  void **v2;
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  shared_ptr<gss::StylesheetManager<gss::PropertyID>> result;

  cntrl = self->_styleManager.__cntrl_;
  *v2 = self->_styleManager.__ptr_;
  v2[1] = cntrl;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = self;
  return result;
}

- (void)setStyleManager:(shared_ptr<gss::StylesheetManager<gss::PropertyID>>)a3
{
  __shared_weak_count *v3;
  void *v4;
  unint64_t *v5;
  unint64_t v6;
  __shared_weak_count *cntrl;
  unint64_t *v8;
  unint64_t v9;

  v4 = *(void **)a3.__ptr_;
  v3 = (__shared_weak_count *)*((_QWORD *)a3.__ptr_ + 1);
  if (v3)
  {
    v5 = (unint64_t *)((char *)v3 + 8);
    do
      v6 = __ldxr(v5);
    while (__stxr(v6 + 1, v5));
  }
  cntrl = self->_styleManager.__cntrl_;
  self->_styleManager.__ptr_ = v4;
  self->_styleManager.__cntrl_ = v3;
  if (cntrl)
  {
    v8 = (unint64_t *)((char *)cntrl + 8);
    do
      v9 = __ldaxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (!v9)
    {
      (*(void (**)(__shared_weak_count *, SEL))(*(_QWORD *)cntrl + 16))(cntrl, a2);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
    }
  }
}

- (void).cxx_destruct
{
  __shared_weak_count *cntrl;
  unint64_t *v3;
  unint64_t v4;

  cntrl = self->_styleManager.__cntrl_;
  if (cntrl)
  {
    v3 = (unint64_t *)((char *)cntrl + 8);
    do
      v4 = __ldaxr(v3);
    while (__stlxr(v4 - 1, v3));
    if (!v4)
    {
      (*(void (**)(__shared_weak_count *, SEL))(*(_QWORD *)cntrl + 16))(cntrl, a2);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
    }
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 4) = 0;
  *((_QWORD *)self + 5) = 0;
  return self;
}

@end
