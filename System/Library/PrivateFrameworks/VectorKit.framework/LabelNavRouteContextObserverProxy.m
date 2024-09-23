@implementation LabelNavRouteContextObserverProxy

- (id).cxx_construct
{
  unsigned __int8 v2;
  int v3;
  uint64_t v4;
  geo::read_write_lock *v5;
  const char *v6;
  malloc_zone_t *zone;
  id v8;

  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 4) = 0;
  if ((v2 & 1) == 0)
  {
    v8 = self;
    self = v8;
    if (v3)
    {
      v4 = operator new();
      *(_QWORD *)(v4 + 16) = 0x5ED09DD50000000FLL;
      *(_QWORD *)(v4 + 24) = "VectorKitLabels";
      *(_OWORD *)(v4 + 32) = xmmword_19FFB2E80;
      *(_QWORD *)v4 = &off_1E42B5668;
      *(_QWORD *)(v4 + 8) = "VectorKitLabels";
      *(_OWORD *)(v4 + 72) = 0u;
      *(_OWORD *)(v4 + 88) = 0u;
      *(_OWORD *)(v4 + 104) = 0u;
      *(_OWORD *)(v4 + 120) = 0u;
      *(_OWORD *)(v4 + 136) = 0u;
      *(_OWORD *)(v4 + 152) = 0u;
      *(_OWORD *)(v4 + 168) = 0u;
      *(_OWORD *)(v4 + 184) = 0u;
      *(_OWORD *)(v4 + 200) = 0u;
      *(_OWORD *)(v4 + 216) = 0u;
      *(_OWORD *)(v4 + 232) = 0u;
      *(_QWORD *)(v4 + 248) = 0;
      *(_OWORD *)(v4 + 56) = 0u;
      v5 = (geo::read_write_lock *)pthread_rwlock_init((pthread_rwlock_t *)(v4 + 56), 0);
      if ((_DWORD)v5)
        geo::read_write_lock::logFailure(v5, (uint64_t)"initialization", v6);
      zone = malloc_create_zone(0, 0);
      *(_QWORD *)(v4 + 48) = zone;
      malloc_set_zone_name(zone, "VectorKitLabels");
      *(_QWORD *)(v4 + 256) = os_log_create("com.apple.VectorKit", "Memory");
      mdm::Allocator::instance(void)::alloc = v4;
      self = v8;
    }
  }
  *((_QWORD *)self + 5) = mdm::Allocator::instance(void)::alloc;
  return self;
}

- (LabelNavRouteContextObserverProxy)initWithRouteContextChangeObserver:(RouteContextChangeObserver *)a3
{
  LabelNavRouteContextObserverProxy *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)LabelNavRouteContextObserverProxy;
  result = -[LabelNavRouteContextObserverProxy init](&v5, sel_init);
  if (result)
    result->_observer = a3;
  return result;
}

- (void)dealloc
{
  id *begin;
  id *i;
  id v5;
  objc_super v6;

  begin = (id *)self->_observedContexts.__begin_;
  for (i = (id *)self->_observedContexts.__end_; begin != i; begin += 3)
  {
    v5 = begin[1];
    objc_msgSend(v5, "removeObserver:withType:", self, 2);

  }
  v6.receiver = self;
  v6.super_class = (Class)LabelNavRouteContextObserverProxy;
  -[LabelNavRouteContextObserverProxy dealloc](&v6, sel_dealloc);
}

- (void)startObserving:(id)a3
{
  id v4;
  id *begin;
  id *end;
  char *value;
  char *v8;
  id v9;
  void *v10;
  _BYTE *v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id *v17;
  id v18;
  id *v19;
  id *v20;
  void *v21;
  id *v22;
  _BYTE *v23;
  id *v24;
  id *v25;
  void (**v26)(id *);
  BOOL v27;
  id v28;

  v4 = a3;
  if (v4)
  {
    begin = (id *)self->_observedContexts.__begin_;
    end = (id *)self->_observedContexts.__end_;
    if (begin != end)
    {
      while (begin[1] != v4)
      {
        begin += 3;
        if (begin == end)
          goto LABEL_7;
      }
    }
    if (begin == end)
    {
LABEL_7:
      v28 = v4;
      objc_msgSend(v4, "addObserver:withType:", self, 2);
      v8 = (char *)self->_observedContexts.__end_;
      value = (char *)self->_observedContexts.__end_cap_.__value_;
      if (v8 < value)
      {
        if (v8)
        {
          v9 = v28;
          *(_QWORD *)v8 = &off_1E42B4B90;
          *((_QWORD *)v8 + 1) = v9;
        }
        v10 = v8 + 24;
        goto LABEL_29;
      }
      v11 = self->_observedContexts.__begin_;
      v12 = 0xAAAAAAAAAAAAAAABLL * ((v8 - v11) >> 3);
      if (v12 + 1 > 0xAAAAAAAAAAAAAAALL)
        abort();
      v13 = 0xAAAAAAAAAAAAAAABLL * ((value - v11) >> 3);
      v14 = 2 * v13;
      if (2 * v13 <= v12 + 1)
        v14 = v12 + 1;
      if (v13 >= 0x555555555555555)
        v15 = 0xAAAAAAAAAAAAAAALL;
      else
        v15 = v14;
      if (v15)
      {
        v16 = (*(uint64_t (**)(Allocator *, uint64_t, uint64_t))(*(_QWORD *)self->_observedContexts.__end_cap_.__value__2._allocator
                                                                       + 16))(self->_observedContexts.__end_cap_.__value__2._allocator, 24 * v15, 8);
        v17 = (id *)(v16 + 24 * v12);
        v15 = v16 + 24 * v15;
        if (v16)
        {
          v18 = v28;
          *v17 = &off_1E42B4B90;
          *(_QWORD *)(v16 + 24 * v12 + 8) = v18;
        }
      }
      else
      {
        v17 = (id *)(24 * v12);
      }
      v10 = v17 + 3;
      v20 = (id *)self->_observedContexts.__begin_;
      v19 = (id *)self->_observedContexts.__end_;
      if (v19 == v20)
      {
        self->_observedContexts.__begin_ = v17;
        self->_observedContexts.__end_ = v10;
        v23 = self->_observedContexts.__end_cap_.__value_;
        self->_observedContexts.__end_cap_.__value_ = (void *)v15;
        if (!v19)
          goto LABEL_29;
      }
      else
      {
        do
        {
          *(v17 - 3) = &off_1E42B4B90;
          v17 -= 3;
          v17[1] = 0;
          objc_storeStrong(v17 + 1, *(v19 - 2));
          v21 = *(v19 - 2);
          *(v19 - 2) = 0;

          v19 -= 3;
        }
        while (v19 != v20);
        v19 = (id *)self->_observedContexts.__begin_;
        v22 = (id *)self->_observedContexts.__end_;
        self->_observedContexts.__begin_ = v17;
        self->_observedContexts.__end_ = v10;
        v23 = self->_observedContexts.__end_cap_.__value_;
        self->_observedContexts.__end_cap_.__value_ = (void *)v15;
        if (v22 != v19)
        {
          v24 = v22 - 3;
          v25 = v22 - 3;
          do
          {
            v26 = (void (**)(id *))*v25;
            v25 -= 3;
            (*v26)(v24);
            v27 = v24 == v19;
            v24 = v25;
          }
          while (!v27);
        }
        if (!v19)
          goto LABEL_29;
      }
      (*(void (**)(Allocator *, id *, int64_t))(*(_QWORD *)self->_observedContexts.__end_cap_.__value__2._allocator
                                                                + 40))(self->_observedContexts.__end_cap_.__value__2._allocator, v19, v23 - (_BYTE *)v19);
LABEL_29:
      v4 = v28;
      self->_observedContexts.__end_ = v10;
    }
  }

}

- (void)stopObserving:(id)a3
{
  id v4;
  char *end;
  char *begin;
  char *v7;
  char *v8;
  void *v9;
  char *v10;
  char *v11;
  void (**v12)(char *);
  BOOL v13;
  id v14;

  v4 = a3;
  if (v4)
  {
    begin = (char *)self->_observedContexts.__begin_;
    end = (char *)self->_observedContexts.__end_;
    if (begin != end)
    {
      while (*((id *)begin + 1) != v4)
      {
        begin += 24;
        if (begin == end)
          goto LABEL_15;
      }
    }
    if (begin != end)
    {
      v14 = v4;
      objc_msgSend(v4, "removeObserver:withType:", self, 2);
      v7 = begin + 24;
      v8 = (char *)self->_observedContexts.__end_;
      if (begin + 24 != v8)
      {
        do
        {
          begin = v7;
          objc_storeStrong((id *)v7 - 2, *((id *)v7 + 1));
          v9 = (void *)*((_QWORD *)begin + 1);
          *((_QWORD *)begin + 1) = 0;

          v7 = begin + 24;
        }
        while (begin + 24 != v8);
        v7 = (char *)self->_observedContexts.__end_;
      }
      if (v7 != begin)
      {
        v10 = v7 - 24;
        v11 = v7 - 24;
        do
        {
          v12 = *(void (***)(char *))v11;
          v11 -= 24;
          (*v12)(v10);
          v13 = v10 == begin;
          v10 = v11;
        }
        while (!v13);
      }
      self->_observedContexts.__end_ = begin;
      v4 = v14;
    }
  }
LABEL_15:

}

- (void)routeContextStateDidChange:(id)a3
{
  RouteContextChangeObserver *observer;
  id v5;

  v5 = a3;
  observer = self->_observer;
  if (observer)
    (*(void (**)(RouteContextChangeObserver *, id))observer->var0)(observer, v5);

}

- (void).cxx_destruct
{
  char *begin;
  char *end;
  void *v5;
  char *v6;
  void (***v7)(char *, void *);
  void (**v8)(char *, void *);
  BOOL v9;

  begin = (char *)self->_observedContexts.__begin_;
  if (begin)
  {
    end = (char *)self->_observedContexts.__end_;
    v5 = self->_observedContexts.__begin_;
    if (end != begin)
    {
      v6 = end - 24;
      v7 = (void (***)(char *, void *))(end - 24);
      do
      {
        v8 = *v7;
        v7 -= 3;
        (*v8)(v6, v5);
        v9 = v6 == begin;
        v6 = (char *)v7;
      }
      while (!v9);
      v5 = self->_observedContexts.__begin_;
    }
    self->_observedContexts.__end_ = begin;
    (*(void (**)(Allocator *, void *, int64_t))(*(_QWORD *)self->_observedContexts.__end_cap_.__value__2._allocator
                                                                + 40))(self->_observedContexts.__end_cap_.__value__2._allocator, v5, (char *)self->_observedContexts.__end_cap_.__value_ - (char *)v5);
  }
}

@end
