@implementation VKLabelNavRoadLabel

- (VKLabelNavRoadLabel)initWithNavFeature:(id)a3 label:(const void *)a4 navLabelType:(int)a5
{
  id v8;
  VKLabelNavRoadLabel *v9;
  VKLabelNavRoadLabel *v10;
  uint64_t v11;
  NavLabel *v12;
  unint64_t *v13;
  unint64_t v14;
  std::__shared_weak_count *cntrl;
  unint64_t *p_shared_owners;
  unint64_t v17;
  VKLabelNavRoadLabel *v18;
  objc_super v20;

  v8 = a3;
  v20.receiver = self;
  v20.super_class = (Class)VKLabelNavRoadLabel;
  v9 = -[VKLabelNavRoadLabel init](&v20, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_navFeature, v8);
    v10->_navLabelType = a5;
    v12 = *(NavLabel **)a4;
    v11 = *((_QWORD *)a4 + 1);
    if (v11)
    {
      v13 = (unint64_t *)(v11 + 8);
      do
        v14 = __ldxr(v13);
      while (__stxr(v14 + 1, v13));
    }
    cntrl = (std::__shared_weak_count *)v10->_label.__cntrl_;
    v10->_label.__ptr_ = v12;
    v10->_label.__cntrl_ = (__shared_weak_count *)v11;
    if (cntrl)
    {
      p_shared_owners = (unint64_t *)&cntrl->__shared_owners_;
      do
        v17 = __ldaxr(p_shared_owners);
      while (__stlxr(v17 - 1, p_shared_owners));
      if (!v17)
      {
        ((void (*)(std::__shared_weak_count *))cntrl->__on_zero_shared)(cntrl);
        std::__shared_weak_count::__release_weak(cntrl);
      }
    }
    v18 = v10;
  }

  return v10;
}

- (void)setRenderOrder:(unsigned __int16)a3
{
  NavLabel *ptr;

  ptr = self->_label.__ptr_;
  if (ptr)
    (*(void (**)(_QWORD, _QWORD))(**((_QWORD **)ptr + 36) + 824))(*((_QWORD *)ptr + 36), a3);
}

- (unsigned)renderOrder
{
  NavLabel *ptr;

  ptr = self->_label.__ptr_;
  if (ptr)
    return *(_WORD *)(*((_QWORD *)ptr + 36) + 558);
  else
    return 0;
}

- (BOOL)isShieldLabel
{
  return self->_navLabelType == 2;
}

- (BOOL)isRoadLabel
{
  return self->_navLabelType == 1;
}

- (BOOL)isJunctionLabel
{
  return self->_navLabelType == 3;
}

- (BOOL)isManeuverLabel
{
  return self->_navLabelType == 4;
}

- (BOOL)isEtaLabel
{
  return self->_navLabelType == 5;
}

- (BOOL)isTrafficCameraLabel
{
  return self->_navLabelType == 6;
}

- (void)layoutWithNavContext:(NavContext *)a3
{
  NavLabel *ptr;
  uint64_t v6;

  md::NavLabel::layoutForStagingWithNavContext((md::NavLabel *)self->_label.__ptr_, (md::NavContext *)a3);
  ptr = self->_label.__ptr_;
  *((_DWORD *)ptr + 81) = *((_DWORD *)ptr + 74);
  *((_QWORD *)ptr + 41) = *(_QWORD *)((char *)ptr + 300);
  if (*((_BYTE *)ptr + 280))
  {
    *((_DWORD *)ptr + 67) = *((_DWORD *)ptr + 69);
    *((_BYTE *)ptr + 280) = 0;
  }
  v6 = *((_QWORD *)ptr + 36);
  if (v6)
  {
    (*(void (**)(_QWORD))(*(_QWORD *)v6 + 968))(*((_QWORD *)ptr + 36));
    ptr = self->_label.__ptr_;
  }
  md::NavLabel::layoutForDisplayWithNavContext((float32x2_t *)ptr, (float64x2_t **)a3);
}

- (void)layoutForStagingWithNavContext:(NavContext *)a3
{
  md::NavLabel::layoutForStagingWithNavContext((md::NavLabel *)self->_label.__ptr_, (md::NavContext *)a3);
}

- (id)displayGroup
{
  NSString *displayGroup;
  NSString *v4;
  void *WeakRetained;
  id v6;
  void *v7;
  NSString *v8;
  id v9;
  NSString *v10;
  NSString *v11;
  NSString *v12;

  displayGroup = self->_displayGroup;
  if (!displayGroup)
  {
    if (self->_displayID)
    {
      v4 = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("DI$_%X"), self->_displayID);
      WeakRetained = self->_displayGroup;
      self->_displayGroup = v4;
    }
    else
    {
      if (-[VKLabelNavRoadLabel isShieldLabel](self, "isShieldLabel"))
      {
        v6 = objc_alloc(MEMORY[0x1E0CB3940]);
        WeakRetained = objc_loadWeakRetained((id *)&self->_navFeature);
        objc_msgSend(WeakRetained, "shieldDisplayGroup");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = (NSString *)objc_msgSend(v6, "initWithFormat:", CFSTR("SH$_%@"), v7);
      }
      else
      {
        if (!-[VKLabelNavRoadLabel isJunctionLabel](self, "isJunctionLabel"))
        {
          WeakRetained = objc_loadWeakRetained((id *)&self->_navFeature);
          objc_msgSend(WeakRetained, "name");
          v11 = (NSString *)objc_claimAutoreleasedReturnValue();
          v12 = self->_displayGroup;
          self->_displayGroup = v11;

          goto LABEL_10;
        }
        v9 = objc_alloc(MEMORY[0x1E0CB3940]);
        WeakRetained = objc_loadWeakRetained((id *)&self->_navFeature);
        objc_msgSend(WeakRetained, "name");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = (NSString *)objc_msgSend(v9, "initWithFormat:", CFSTR("JC$_%@"), v7);
      }
      v10 = self->_displayGroup;
      self->_displayGroup = v8;

    }
LABEL_10:

    displayGroup = self->_displayGroup;
  }
  return displayGroup;
}

- (id)description
{
  void *v3;
  void *v4;
  id WeakRetained;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[VKLabelNavRoadLabel displayGroup](self, "displayGroup");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_navFeature);
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@, (%@)"), v4, WeakRetained);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (VKLabelNavFeature)navFeature
{
  return (VKLabelNavFeature *)objc_loadWeakRetained((id *)&self->_navFeature);
}

- (void)setNavFeature:(id)a3
{
  objc_storeWeak((id *)&self->_navFeature, a3);
}

- (const)label
{
  return &self->_label;
}

- (unsigned)displayID
{
  return self->_displayID;
}

- (void)setDisplayID:(unsigned int)a3
{
  self->_displayID = a3;
}

- (unsigned)alignment
{
  return self->_alignment;
}

- (void)setAlignment:(unsigned __int8)a3
{
  self->_alignment = a3;
}

- (float)desiredOffsetDistance
{
  return self->_desiredOffsetDistance;
}

- (void)setDesiredOffsetDistance:(float)a3
{
  self->_desiredOffsetDistance = a3;
}

- (Mercator2<double>)mercatorPoint
{
  Mercator2<double> *v2;
  Mercator2<double> mercatorPoint;
  Mercator2<double> result;

  mercatorPoint = self->_mercatorPoint;
  *v2 = mercatorPoint;
  result._e[0] = mercatorPoint._e[0];
  return result;
}

- (void)setMercatorPoint:(Mercator2<double>)a3
{
  Mercator2<double> *v3;

  self->_mercatorPoint = *v3;
}

- (void).cxx_destruct
{
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;

  objc_storeStrong((id *)&self->_displayGroup, 0);
  objc_destroyWeak((id *)&self->_navFeature);
  cntrl = self->_label.__cntrl_;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldaxr(v4);
    while (__stlxr(v5 - 1, v4));
    if (!v5)
    {
      (*(void (**)(__shared_weak_count *))(*(_QWORD *)cntrl + 16))(cntrl);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
    }
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 8) = 0;
  *((_QWORD *)self + 9) = 0;
  return self;
}

@end
