@implementation VKPolylineOverlayRenderRegion

- (id)initForVisibleRect:(const void *)a3 snappingRegion:(const void *)a4 routeLineDatas:(const void *)a5
{
  char *v8;
  uint64_t **v9;
  _QWORD **v10;
  char *v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t **v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t *v23;
  unint64_t v24;
  std::__shared_weak_count *v25;
  unint64_t *p_shared_owners;
  unint64_t v27;
  uint64_t *v28;
  uint64_t **v29;
  uint64_t **v30;
  _QWORD *v31;
  char *v32;
  char *v33;
  BOOL v34;
  uint64_t *v35;
  uint64_t *v36;
  uint64_t *i;
  uint64_t **v38;
  uint64_t *v39;
  uint64_t *v40;
  unint64_t v41;
  uint64_t v42;
  unint64_t *v43;
  unint64_t v44;
  uint64_t *v45;
  uint64_t **v46;
  uint64_t **v47;
  _QWORD *v48;
  char *v49;
  char *v50;
  uint64_t *v52;
  objc_super v53;

  v53.receiver = self;
  v53.super_class = (Class)VKPolylineOverlayRenderRegion;
  v8 = -[VKPolylineOverlayRenderRegion init](&v53, sel_init);
  v9 = (uint64_t **)v8;
  if (v8)
  {
    *((_QWORD *)v8 + 4) = *(_QWORD *)a3;
    *((_QWORD *)v8 + 5) = *((_QWORD *)a3 + 1);
    *((_QWORD *)v8 + 6) = *((_QWORD *)a3 + 2);
    *((_QWORD *)v8 + 7) = *((_QWORD *)a3 + 3);
    v10 = (_QWORD **)(v8 + 8);
    if (v8 + 8 != a5)
    {
      v13 = *(char **)a5;
      v11 = (char *)a5 + 8;
      v12 = v13;
      if (!*((_QWORD *)v8 + 3))
        goto LABEL_51;
      v15 = (uint64_t **)(v8 + 16);
      v14 = *((_QWORD *)v8 + 2);
      v16 = *((_QWORD *)v8 + 1);
      *((_QWORD *)v8 + 1) = v8 + 16;
      *(_QWORD *)(v14 + 16) = 0;
      *((_QWORD *)v8 + 2) = 0;
      *((_QWORD *)v8 + 3) = 0;
      v17 = *(_QWORD *)(v16 + 8) ? *(uint64_t **)(v16 + 8) : (uint64_t *)v16;
      if (v17)
      {
        v18 = (uint64_t *)v17[2];
        if (v18)
        {
          v19 = (uint64_t *)*v18;
          if ((uint64_t *)*v18 == v17)
          {
            *v18 = 0;
            while (1)
            {
              v52 = (uint64_t *)v18[1];
              if (!v52)
                break;
              do
              {
                v18 = v52;
                v52 = (uint64_t *)*v52;
              }
              while (v52);
            }
          }
          else
          {
            for (v18[1] = 0; v19; v19 = (uint64_t *)v18[1])
            {
              do
              {
                v18 = v19;
                v19 = (uint64_t *)*v19;
              }
              while (v19);
            }
          }
        }
        if (v12 == v11)
        {
          v33 = v12;
          v20 = v17;
        }
        else
        {
          do
          {
            v20 = v18;
            v22 = *((_QWORD *)v12 + 4);
            v21 = *((_QWORD *)v12 + 5);
            if (v21)
            {
              v23 = (unint64_t *)(v21 + 8);
              do
                v24 = __ldxr(v23);
              while (__stxr(v24 + 1, v23));
            }
            v25 = (std::__shared_weak_count *)v17[5];
            v17[4] = v22;
            v17[5] = v21;
            if (v25)
            {
              p_shared_owners = (unint64_t *)&v25->__shared_owners_;
              do
                v27 = __ldaxr(p_shared_owners);
              while (__stlxr(v27 - 1, p_shared_owners));
              if (!v27)
              {
                ((void (*)(std::__shared_weak_count *))v25->__on_zero_shared)(v25);
                std::__shared_weak_count::__release_weak(v25);
              }
            }
            v28 = *v15;
            v29 = v9 + 2;
            v30 = v9 + 2;
            if (*v15)
            {
              do
              {
                while (1)
                {
                  v29 = (uint64_t **)v28;
                  if (v17[4] >= (unint64_t)v28[4])
                    break;
                  v28 = (uint64_t *)*v28;
                  v30 = v29;
                  if (!*v29)
                    goto LABEL_29;
                }
                v28 = (uint64_t *)v28[1];
              }
              while (v28);
              v30 = v29 + 1;
            }
LABEL_29:
            *v17 = 0;
            v17[1] = 0;
            v17[2] = (uint64_t)v29;
            *v30 = v17;
            v31 = (_QWORD *)**v10;
            if (v31)
            {
              *v10 = v31;
              v17 = *v30;
            }
            std::__tree_balance_after_insert[abi:nn180100]<std::__tree_node_base<void *> *>(v9[2], v17);
            v9[3] = (uint64_t *)((char *)v9[3] + 1);
            if (v20)
            {
              v18 = (uint64_t *)v20[2];
              if (v18)
              {
                v35 = (uint64_t *)*v18;
                if ((uint64_t *)*v18 == v20)
                {
                  *v18 = 0;
                  while (1)
                  {
                    v36 = (uint64_t *)v18[1];
                    if (!v36)
                      break;
                    do
                    {
                      v18 = v36;
                      v36 = (uint64_t *)*v36;
                    }
                    while (v36);
                  }
                }
                else
                {
                  for (v18[1] = 0; v35; v35 = (uint64_t *)v18[1])
                  {
                    do
                    {
                      v18 = v35;
                      v35 = (uint64_t *)*v35;
                    }
                    while (v35);
                  }
                }
              }
            }
            else
            {
              v18 = 0;
            }
            v32 = (char *)*((_QWORD *)v12 + 1);
            if (v32)
            {
              do
              {
                v33 = v32;
                v32 = *(char **)v32;
              }
              while (v32);
            }
            else
            {
              do
              {
                v33 = (char *)*((_QWORD *)v12 + 2);
                v34 = *(_QWORD *)v33 == (_QWORD)v12;
                v12 = v33;
              }
              while (!v34);
            }
            if (!v20)
              break;
            v17 = v20;
            v12 = v33;
          }
          while (v33 != v11);
        }
        std::__tree<gdc::LayerDataWithWorld>::destroy(v20);
        if (v18)
        {
          for (i = (uint64_t *)v18[2]; i; i = (uint64_t *)i[2])
            v18 = i;
          std::__tree<gdc::LayerDataWithWorld>::destroy(v18);
        }
      }
      else
      {
LABEL_51:
        v33 = v12;
      }
      if (v33 != v11)
      {
        v38 = v9 + 2;
        do
        {
          v39 = (uint64_t *)operator new(0x30uLL);
          v40 = v39;
          v41 = *((_QWORD *)v33 + 4);
          v42 = *((_QWORD *)v33 + 5);
          v39[4] = v41;
          v39[5] = v42;
          if (v42)
          {
            v43 = (unint64_t *)(v42 + 8);
            do
              v44 = __ldxr(v43);
            while (__stxr(v44 + 1, v43));
          }
          v45 = *v38;
          v46 = v9 + 2;
          v47 = v9 + 2;
          if (*v38)
          {
            do
            {
              while (1)
              {
                v46 = (uint64_t **)v45;
                if (v41 >= v45[4])
                  break;
                v45 = (uint64_t *)*v45;
                v47 = v46;
                if (!*v46)
                  goto LABEL_70;
              }
              v45 = (uint64_t *)v45[1];
            }
            while (v45);
            v47 = v46 + 1;
          }
LABEL_70:
          *v39 = 0;
          v39[1] = 0;
          v39[2] = (uint64_t)v46;
          *v47 = v39;
          v48 = (_QWORD *)**v10;
          if (v48)
          {
            *v10 = v48;
            v40 = *v47;
          }
          std::__tree_balance_after_insert[abi:nn180100]<std::__tree_node_base<void *> *>(v9[2], v40);
          v9[3] = (uint64_t *)((char *)v9[3] + 1);
          v49 = (char *)*((_QWORD *)v33 + 1);
          if (v49)
          {
            do
            {
              v50 = v49;
              v49 = *(char **)v49;
            }
            while (v49);
          }
          else
          {
            do
            {
              v50 = (char *)*((_QWORD *)v33 + 2);
              v34 = *(_QWORD *)v50 == (_QWORD)v33;
              v33 = v50;
            }
            while (!v34);
          }
          v33 = v50;
        }
        while (v50 != v11);
      }
    }
    if (v9 + 8 != a4)
      std::__tree<gm::Box<double,2>,md::MultiRectSetCompare,std::allocator<gm::Box<double,2>>>::__assign_multi<std::__tree_const_iterator<gm::Box<double,2>,std::__tree_node<gm::Box<double,2>,void *> *,long>>(v9 + 8, *(double **)a4, (double *)a4 + 1);
    v9[11] = (uint64_t *)*((_QWORD *)a4 + 3);
    v9[12] = (uint64_t *)*((_QWORD *)a4 + 4);
    v9[13] = (uint64_t *)*((_QWORD *)a4 + 5);
    v9[14] = (uint64_t *)*((_QWORD *)a4 + 6);
  }
  return v9;
}

- (const)snappingRegion
{
  return &self->_snappingRegion;
}

- (BOOL)isEquivalentToNewRegion:(id)a3
{
  double *v4;
  VKPolylineOverlayRenderRegion *begin_node;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<gm::Box<double, 2>, void *>>> *p_pair1;
  BOOL v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double *v15;
  double *v16;
  BOOL v17;
  double v19;
  double v20;
  double v21;
  double v22;
  BOOL v23;
  double v24;
  BOOL v25;
  double v26;
  BOOL v27;
  BOOL v28;
  double v29;
  double v30;
  double v31;
  double v32;
  BOOL v33;
  double v34;
  BOOL v35;
  double v36;
  VKPolylineOverlayRenderRegion *isa;
  VKPolylineOverlayRenderRegion *left;

  v4 = (double *)a3;
  if (v4[4] < self->_visibleRect._minimum._e[0]
    || v4[6] > self->_visibleRect._maximum._e[0]
    || v4[5] < self->_visibleRect._minimum._e[1]
    || v4[7] > self->_visibleRect._maximum._e[1]
    || self->_snappingRegion._rects.__tree_.__pair3_.__value_ != *((_QWORD *)v4 + 10))
  {
    goto LABEL_57;
  }
  begin_node = (VKPolylineOverlayRenderRegion *)self->_snappingRegion._rects.__tree_.__begin_node_;
  p_pair1 = &self->_snappingRegion._rects.__tree_.__pair1_;
  if (begin_node == (VKPolylineOverlayRenderRegion *)&self->_snappingRegion._rects.__tree_.__pair1_)
  {
    v7 = 1;
    goto LABEL_58;
  }
  v7 = 1;
  do
  {
    if (!*((_QWORD *)v4 + 9))
      goto LABEL_57;
    v8 = begin_node->_visibleRect._minimum._e[0];
    v9 = begin_node->_visibleRect._minimum._e[1];
    v10 = begin_node->_visibleRect._maximum._e[0] - v8;
    v11 = begin_node->_visibleRect._maximum._e[1] - v9;
    v12 = v11 * v10;
    v13 = v8 + v10 * 0.5;
    v14 = v9 + v11 * 0.5;
    v15 = v4 + 9;
    v16 = (double *)*((_QWORD *)v4 + 9);
    do
    {
      while (1)
      {
        v17 = *((_QWORD *)v16 + 4) == *(_QWORD *)&begin_node->_visibleRect._minimum._e[0]
           && *((_QWORD *)v16 + 5) == *(_QWORD *)&begin_node->_visibleRect._minimum._e[1];
        if (v17
          && *((_QWORD *)v16 + 6) == *(_QWORD *)&begin_node->_visibleRect._maximum._e[0]
          && *((_QWORD *)v16 + 7) == *(_QWORD *)&begin_node->_visibleRect._maximum._e[1])
        {
          goto LABEL_11;
        }
        v20 = v16[4];
        v19 = v16[5];
        v21 = v16[6] - v20;
        v22 = v16[7] - v19;
        v23 = v22 * v21 <= v12;
        if (v22 * v21 != v12)
          break;
        v24 = v20 + v21 * 0.5;
        v25 = v24 < v13;
        if (v24 == v13)
        {
          v26 = v19 + v22 * 0.5;
          v25 = v26 < v14;
          if (v26 == v14)
          {
            v23 = v21 <= v10;
            if (v21 == v10)
              v23 = v22 <= v11;
            break;
          }
        }
        if (v25)
          goto LABEL_13;
LABEL_11:
        v15 = v16;
        v16 = *(double **)v16;
        if (!v16)
          goto LABEL_33;
      }
      if (v23)
        goto LABEL_11;
LABEL_13:
      v16 = (double *)*((_QWORD *)v16 + 1);
    }
    while (v16);
LABEL_33:
    if (v4 + 9 == v15)
      goto LABEL_57;
    v27 = *(_QWORD *)&begin_node->_visibleRect._minimum._e[0] == *((_QWORD *)v15 + 4)
       && *(_QWORD *)&begin_node->_visibleRect._minimum._e[1] == *((_QWORD *)v15 + 5);
    if (!v27
      || (*(_QWORD *)&begin_node->_visibleRect._maximum._e[0] == *((_QWORD *)v15 + 6)
        ? (v28 = *(_QWORD *)&begin_node->_visibleRect._maximum._e[1] == *((_QWORD *)v15 + 7))
        : (v28 = 0),
          !v28))
    {
      v30 = v15[4];
      v29 = v15[5];
      v31 = v15[6] - v30;
      v32 = v15[7] - v29;
      v33 = v12 <= v32 * v31;
      if (v12 != v32 * v31)
        goto LABEL_48;
      v34 = v30 + v31 * 0.5;
      v35 = v13 < v34;
      if (v13 == v34 && (v36 = v29 + v32 * 0.5, v35 = v14 < v36, v14 == v36))
      {
        v33 = v10 <= v31;
        if (v10 == v31)
          v33 = v11 <= v32;
LABEL_48:
        if (!v33)
        {
LABEL_57:
          v7 = 0;
          break;
        }
      }
      else if (v35)
      {
        goto LABEL_57;
      }
    }
    isa = (VKPolylineOverlayRenderRegion *)begin_node->_routeLineDatas.__tree_.__begin_node_;
    if (isa)
    {
      do
      {
        left = isa;
        isa = (VKPolylineOverlayRenderRegion *)isa->super.isa;
      }
      while (isa);
    }
    else
    {
      do
      {
        left = (VKPolylineOverlayRenderRegion *)begin_node->_routeLineDatas.__tree_.__pair1_.__value_.__left_;
        v17 = left->super.isa == (Class)begin_node;
        begin_node = left;
      }
      while (!v17);
    }
    begin_node = left;
  }
  while (left != (VKPolylineOverlayRenderRegion *)p_pair1);
LABEL_58:

  return v7;
}

- (const)routeLineDatas
{
  return &self->_routeLineDatas;
}

- (Box<double,)visibleRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  Box<double, 2> result;

  v2 = self->_visibleRect._minimum._e[0];
  v3 = self->_visibleRect._minimum._e[1];
  v4 = self->_visibleRect._maximum._e[0];
  v5 = self->_visibleRect._maximum._e[1];
  result._maximum._e[1] = v5;
  result._maximum._e[0] = v4;
  result._minimum._e[1] = v3;
  result._minimum._e[0] = v2;
  return result;
}

- (void).cxx_destruct
{
  std::__tree<std::pair<md::MapTileData *,BOOL>>::destroy((_QWORD *)self->_snappingRegion._rects.__tree_.__pair1_.__value_.__left_);
  std::__tree<gdc::LayerDataWithWorld>::destroy((_QWORD *)self->_routeLineDatas.__tree_.__pair1_.__value_.__left_);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 1) = (char *)self + 16;
  *((_QWORD *)self + 10) = 0;
  *((_QWORD *)self + 9) = 0;
  *((_QWORD *)self + 8) = (char *)self + 72;
  *(int64x2_t *)((char *)self + 88) = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
  *(int64x2_t *)((char *)self + 104) = vdupq_n_s64(0xFFEFFFFFFFFFFFFFLL);
  return self;
}

@end
