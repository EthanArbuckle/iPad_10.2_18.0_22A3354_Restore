@implementation RouteRenderLayerObserverProxy

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 7) = 0;
  *((_QWORD *)self + 6) = 0;
  *((_QWORD *)self + 4) = 0;
  *((_QWORD *)self + 5) = (char *)self + 48;
  return self;
}

- (RouteRenderLayerObserverProxy)initWithPolylineGroupObserver:(PolylineGroupChangeObserver *)a3
{
  RouteRenderLayerObserverProxy *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RouteRenderLayerObserverProxy;
  result = -[RouteRenderLayerObserverProxy init](&v5, sel_init);
  if (result)
    result->_polylineGroupObserver = a3;
  return result;
}

- (void)dealloc
{
  RouteRenderLayerObserverProxy *begin_node;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<VKPolylineGroupOverlay *, void *>>> *p_pair1;
  char *end;
  char *v6;
  char *v7;
  void (***v8)(char *);
  void (**v9)(char *);
  BOOL v10;
  id v11;
  PolylineGroupChangeObserver *polylineGroupObserver;
  RouteRenderLayerObserverProxy *begin;
  objc_super v14;

  begin_node = (RouteRenderLayerObserverProxy *)self->_observedGroupsSet.__tree_.__begin_node_;
  p_pair1 = &self->_observedGroupsSet.__tree_.__pair1_;
  if (begin_node != (RouteRenderLayerObserverProxy *)&self->_observedGroupsSet.__tree_.__pair1_)
  {
    do
    {
      v11 = begin_node->_retainedGroups.__end_cap_.__value_;
      objc_msgSend(v11, "removeObserver:", self);

      polylineGroupObserver = begin_node->_polylineGroupObserver;
      if (polylineGroupObserver)
      {
        do
        {
          begin = (RouteRenderLayerObserverProxy *)polylineGroupObserver;
          polylineGroupObserver = (PolylineGroupChangeObserver *)polylineGroupObserver->var0;
        }
        while (polylineGroupObserver);
      }
      else
      {
        do
        {
          begin = (RouteRenderLayerObserverProxy *)begin_node->_retainedGroups.__begin_;
          v10 = begin->super.isa == (Class)begin_node;
          begin_node = begin;
        }
        while (!v10);
      }
      begin_node = begin;
    }
    while (begin != (RouteRenderLayerObserverProxy *)p_pair1);
  }
  std::__tree<VKPolylineGroupOverlay * {__strong}>::destroy((_QWORD *)self->_observedGroupsSet.__tree_.__pair1_.__value_.__left_);
  self->_observedGroupsSet.__tree_.__pair1_.__value_.__left_ = 0;
  self->_observedGroupsSet.__tree_.__pair3_.__value_ = 0;
  self->_observedGroupsSet.__tree_.__begin_node_ = p_pair1;
  v6 = (char *)self->_retainedGroups.__begin_;
  end = (char *)self->_retainedGroups.__end_;
  if (end != v6)
  {
    v7 = end - 24;
    v8 = (void (***)(char *))(end - 24);
    do
    {
      v9 = *v8;
      v8 -= 3;
      (*v9)(v7);
      v10 = v7 == v6;
      v7 = (char *)v8;
    }
    while (!v10);
  }
  self->_retainedGroups.__end_ = v6;
  v14.receiver = self;
  v14.super_class = (Class)RouteRenderLayerObserverProxy;
  -[RouteRenderLayerObserverProxy dealloc](&v14, sel_dealloc);
}

- (void).cxx_destruct
{
  char *begin;
  char *end;
  void *v5;
  char *v6;
  void (***v7)(char *);
  void (**v8)(char *);
  BOOL v9;

  std::__tree<VKPolylineGroupOverlay * {__strong}>::destroy((_QWORD *)self->_observedGroupsSet.__tree_.__pair1_.__value_.__left_);
  begin = (char *)self->_retainedGroups.__begin_;
  if (begin)
  {
    end = (char *)self->_retainedGroups.__end_;
    v5 = self->_retainedGroups.__begin_;
    if (end != begin)
    {
      v6 = end - 24;
      v7 = (void (***)(char *))(end - 24);
      do
      {
        v8 = *v7;
        v7 -= 3;
        (*v8)(v6);
        v9 = v6 == begin;
        v6 = (char *)v7;
      }
      while (!v9);
      v5 = self->_retainedGroups.__begin_;
    }
    self->_retainedGroups.__end_ = begin;
    operator delete(v5);
  }
}

- (void)polylineGroup:(id)a3 didAddPolyline:(id)a4
{
  ((void (*)(PolylineGroupChangeObserver *, id, id))*self->_polylineGroupObserver->var0)(self->_polylineGroupObserver, a3, a4);
}

- (void)polylineGroup:(id)a3 didRemovePolyline:(id)a4
{
  (*((void (**)(PolylineGroupChangeObserver *, id, id))self->_polylineGroupObserver->var0 + 1))(self->_polylineGroupObserver, a3, a4);
}

- (void)polylineGroup:(id)a3 didSelectPolyline:(id)a4
{
  (*((void (**)(PolylineGroupChangeObserver *, id, id))self->_polylineGroupObserver->var0 + 2))(self->_polylineGroupObserver, a3, a4);
}

- (void)polylineGroup:(id)a3 didFocusPolyline:(id)a4
{
  (*((void (**)(PolylineGroupChangeObserver *, id, id))self->_polylineGroupObserver->var0 + 3))(self->_polylineGroupObserver, a3, a4);
}

- (void)polylineGroup:(id)a3 didSkipPolyline:(id)a4
{
  (*((void (**)(PolylineGroupChangeObserver *, id, id))self->_polylineGroupObserver->var0 + 4))(self->_polylineGroupObserver, a3, a4);
}

- (void)startObserving:(id)a3
{
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<VKPolylineGroupOverlay *, void *>>> *left;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<VKPolylineGroupOverlay *, void *>>> *p_pair1;
  _QWORD *v6;
  unint64_t v7;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<VKPolylineGroupOverlay *, void *>>> *v8;
  unint64_t v9;
  uint64_t *v10;
  void *v11;
  char *value;
  char *end;
  id v14;
  void *v15;
  _BYTE *begin;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  char *v21;
  id *v22;
  char *v23;
  id v24;
  char *v25;
  char *v26;
  void *v27;
  char *v28;
  char *v29;
  void (***v30)(char *);
  void (**v31)(char *);
  BOOL v32;
  id v33;

  v33 = a3;
  if (!v33)
    return;
  p_pair1 = &self->_observedGroupsSet.__tree_.__pair1_;
  left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<VKPolylineGroupOverlay *, void *>>> *)self->_observedGroupsSet.__tree_.__pair1_.__value_.__left_;
  if (left)
  {
    v6 = self->_observedGroupsSet.__tree_.__pair1_.__value_.__left_;
    do
    {
      v7 = v6[4];
      if (v7 <= (unint64_t)v33)
      {
        if (v7 >= (unint64_t)v33)
          goto LABEL_40;
        ++v6;
      }
      v6 = (_QWORD *)*v6;
    }
    while (v6);
    while (1)
    {
      while (1)
      {
        v8 = left;
        v9 = (unint64_t)left[4].__value_.__left_;
        if (v9 <= (unint64_t)v33)
          break;
        left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<VKPolylineGroupOverlay *, void *>>> *)v8->__value_.__left_;
        p_pair1 = v8;
        if (!v8->__value_.__left_)
          goto LABEL_16;
      }
      if (v9 >= (unint64_t)v33)
        break;
      left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<VKPolylineGroupOverlay *, void *>>> *)v8[1].__value_.__left_;
      if (!left)
      {
        p_pair1 = v8 + 1;
        goto LABEL_16;
      }
    }
  }
  else
  {
    v8 = &self->_observedGroupsSet.__tree_.__pair1_;
LABEL_16:
    v10 = (uint64_t *)operator new(0x28uLL);
    v10[4] = (uint64_t)v33;
    *v10 = 0;
    v10[1] = 0;
    v10[2] = (uint64_t)v8;
    p_pair1->__value_.__left_ = v10;
    v11 = *(void **)self->_observedGroupsSet.__tree_.__begin_node_;
    if (v11)
    {
      self->_observedGroupsSet.__tree_.__begin_node_ = v11;
      v10 = (uint64_t *)p_pair1->__value_.__left_;
    }
    std::__tree_balance_after_insert[abi:nn180100]<std::__tree_node_base<void *> *>((uint64_t *)self->_observedGroupsSet.__tree_.__pair1_.__value_.__left_, v10);
    ++self->_observedGroupsSet.__tree_.__pair3_.__value_;
  }
  objc_msgSend(v33, "addObserver:", self);
  end = (char *)self->_retainedGroups.__end_;
  value = (char *)self->_retainedGroups.__end_cap_.__value_;
  if (end < value)
  {
    v14 = v33;
    *(_QWORD *)end = &off_1E42B4FD0;
    *((_QWORD *)end + 1) = v14;
    v15 = end + 24;
    goto LABEL_39;
  }
  begin = self->_retainedGroups.__begin_;
  v17 = 0xAAAAAAAAAAAAAAABLL * ((end - begin) >> 3);
  if (v17 + 1 > 0xAAAAAAAAAAAAAAALL)
    abort();
  v18 = 0xAAAAAAAAAAAAAAABLL * ((value - begin) >> 3);
  v19 = 2 * v18;
  if (2 * v18 <= v17 + 1)
    v19 = v17 + 1;
  if (v18 >= 0x555555555555555)
    v20 = 0xAAAAAAAAAAAAAAALL;
  else
    v20 = v19;
  if (v20)
  {
    if (v20 > 0xAAAAAAAAAAAAAAALL)
      std::__throw_bad_array_new_length[abi:nn180100]();
    v21 = (char *)operator new(24 * v20);
  }
  else
  {
    v21 = 0;
  }
  v22 = (id *)&v21[24 * v17];
  v23 = &v21[24 * v20];
  v24 = v33;
  *v22 = &off_1E42B4FD0;
  v22[1] = v24;
  v15 = v22 + 3;
  v26 = (char *)self->_retainedGroups.__begin_;
  v25 = (char *)self->_retainedGroups.__end_;
  if (v25 == v26)
  {
    self->_retainedGroups.__begin_ = v22;
    self->_retainedGroups.__end_ = v15;
    self->_retainedGroups.__end_cap_.__value_ = v23;
    if (v25)
LABEL_38:
      operator delete(v25);
  }
  else
  {
    do
    {
      *(v22 - 3) = &off_1E42B4FD0;
      v22 -= 3;
      v22[1] = 0;
      objc_storeStrong(v22 + 1, *((id *)v25 - 2));
      v27 = (void *)*((_QWORD *)v25 - 2);
      *((_QWORD *)v25 - 2) = 0;

      v25 -= 24;
    }
    while (v25 != v26);
    v25 = (char *)self->_retainedGroups.__begin_;
    v28 = (char *)self->_retainedGroups.__end_;
    self->_retainedGroups.__begin_ = v22;
    self->_retainedGroups.__end_ = v15;
    self->_retainedGroups.__end_cap_.__value_ = v23;
    if (v28 != v25)
    {
      v29 = v28 - 24;
      v30 = (void (***)(char *))(v28 - 24);
      do
      {
        v31 = *v30;
        v30 -= 3;
        (*v31)(v29);
        v32 = v29 == v25;
        v29 = (char *)v30;
      }
      while (!v32);
    }
    if (v25)
      goto LABEL_38;
  }
LABEL_39:
  self->_retainedGroups.__end_ = v15;
LABEL_40:

}

- (void)stopObserving:(id)a3
{
  id v4;
  uint64_t *left;
  _QWORD *v6;
  unint64_t v7;
  RouteRenderLayerObserverProxy *p_pair1;
  RouteRenderLayerObserverProxy *v9;
  unint64_t value;
  BOOL v11;
  RouteRenderLayerObserverProxy **p_polylineGroupObserver;
  PolylineGroupChangeObserver *polylineGroupObserver;
  RouteRenderLayerObserverProxy **begin;
  RouteRenderLayerObserverProxy *v15;
  BOOL v16;
  id *v17;
  id *end;
  id v19;
  id v20;
  void *v21;
  char v22;
  id *v23;
  id *v24;
  id v25;
  id *v26;
  id *v27;
  void (**v28)(id *);
  id v29;

  v4 = a3;
  if (!v4)
    goto LABEL_44;
  left = (uint64_t *)self->_observedGroupsSet.__tree_.__pair1_.__value_.__left_;
  if (!left)
    goto LABEL_44;
  v6 = self->_observedGroupsSet.__tree_.__pair1_.__value_.__left_;
  while (1)
  {
    v7 = v6[4];
    if (v7 <= (unint64_t)v4)
      break;
LABEL_4:
    v6 = (_QWORD *)*v6;
    if (!v6)
      goto LABEL_44;
  }
  if (v7 < (unint64_t)v4)
  {
    ++v6;
    goto LABEL_4;
  }
  p_pair1 = (RouteRenderLayerObserverProxy *)&self->_observedGroupsSet.__tree_.__pair1_;
  v9 = (RouteRenderLayerObserverProxy *)self->_observedGroupsSet.__tree_.__pair1_.__value_.__left_;
  do
  {
    value = (unint64_t)v9->_retainedGroups.__end_cap_.__value_;
    v11 = value >= (unint64_t)v4;
    if (value >= (unint64_t)v4)
      p_polylineGroupObserver = (RouteRenderLayerObserverProxy **)v9;
    else
      p_polylineGroupObserver = (RouteRenderLayerObserverProxy **)&v9->_polylineGroupObserver;
    if (v11)
      p_pair1 = v9;
    v9 = *p_polylineGroupObserver;
  }
  while (*p_polylineGroupObserver);
  v29 = v4;
  if (p_pair1 != (RouteRenderLayerObserverProxy *)&self->_observedGroupsSet.__tree_.__pair1_
    && p_pair1->_retainedGroups.__end_cap_.__value_ <= v4)
  {
    polylineGroupObserver = p_pair1->_polylineGroupObserver;
    if (polylineGroupObserver)
    {
      do
      {
        begin = (RouteRenderLayerObserverProxy **)polylineGroupObserver;
        polylineGroupObserver = (PolylineGroupChangeObserver *)polylineGroupObserver->var0;
      }
      while (polylineGroupObserver);
    }
    else
    {
      v15 = p_pair1;
      do
      {
        begin = (RouteRenderLayerObserverProxy **)v15->_retainedGroups.__begin_;
        v16 = *begin == v15;
        v15 = (RouteRenderLayerObserverProxy *)begin;
      }
      while (!v16);
    }
    if (self->_observedGroupsSet.__tree_.__begin_node_ == p_pair1)
      self->_observedGroupsSet.__tree_.__begin_node_ = begin;
    --self->_observedGroupsSet.__tree_.__pair3_.__value_;
    std::__tree_remove[abi:nn180100]<std::__tree_node_base<void *> *>(left, (uint64_t *)p_pair1);

    operator delete(p_pair1);
    v4 = v29;
  }
  objc_msgSend(v4, "removeObserver:", self);
  v17 = (id *)self->_retainedGroups.__begin_;
  end = (id *)self->_retainedGroups.__end_;
  if (v17 == end)
  {
    v23 = (id *)self->_retainedGroups.__begin_;
  }
  else
  {
    while (1)
    {
      v19 = v17[1];
      v20 = v29;
      v21 = v20;
      if (v19 == v20)
        break;
      v22 = objc_msgSend(v19, "isEqual:", v20);

      if ((v22 & 1) != 0)
        goto LABEL_34;
      v17 += 3;
      if (v17 == end)
      {
        v17 = end;
        goto LABEL_34;
      }
    }

LABEL_34:
    v23 = v17;
    v17 = (id *)self->_retainedGroups.__end_;
  }
  v4 = v29;
  if (v23 != v17)
  {
    v24 = v23 + 3;
    if (v23 + 3 != v17)
    {
      do
      {
        v23 = v24;
        objc_storeStrong(v24 - 2, v24[1]);
        v25 = v23[1];
        v23[1] = 0;

        v24 = v23 + 3;
      }
      while (v23 + 3 != v17);
      v17 = (id *)self->_retainedGroups.__end_;
    }
    if (v17 != v23)
    {
      v26 = v17 - 3;
      v27 = v17 - 3;
      do
      {
        v28 = (void (**)(id *))*v27;
        v27 -= 3;
        (*v28)(v26);
        v16 = v26 == v23;
        v26 = v27;
      }
      while (!v16);
    }
    self->_retainedGroups.__end_ = v23;
    v4 = v29;
  }
LABEL_44:

}

@end
