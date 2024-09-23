@implementation VKSceneConfiguration

- (void)_updateStyleManager
{
  void *ptr;
  unsigned int v4;
  int v5;
  unint64_t currentGroupedManeuverCount;

  ptr = self->_sceneClientStyleState.__ptr_;
  if (ptr)
  {
    gss::ClientStyleState<gss::ScenePropertyID>::setClientStyleAttribute((uint64_t)ptr, 0x1001Du, self->_navState);
    gss::ClientStyleState<gss::ScenePropertyID>::setClientStyleAttribute((uint64_t)self->_sceneClientStyleState.__ptr_, 0x1001Eu, self->_distanceToCurrentManeuver);
    v4 = self->_currentManeuverType - 1;
    if (v4 > 0x57)
      v5 = 0;
    else
      v5 = byte_19FFB8542[v4];
    gss::ClientStyleState<gss::ScenePropertyID>::setClientStyleAttribute((uint64_t)self->_sceneClientStyleState.__ptr_, 0x10026u, v5);
    gss::ClientStyleState<gss::ScenePropertyID>::setClientStyleAttribute((uint64_t)self->_sceneClientStyleState.__ptr_, 0x1003Eu, self->_currentStepLength);
    gss::ClientStyleState<gss::ScenePropertyID>::setClientStyleAttribute((uint64_t)self->_sceneClientStyleState.__ptr_, 0x10027u, self->_nextStepLength);
    gss::ClientStyleState<gss::ScenePropertyID>::setClientStyleAttribute((uint64_t)self->_sceneClientStyleState.__ptr_, 0x10028u, self->_currentIncidentType);
    gss::ClientStyleState<gss::ScenePropertyID>::setClientStyleAttribute((uint64_t)self->_sceneClientStyleState.__ptr_, 0x10029u, self->_currentManeuverComplexity);
    gss::ClientStyleState<gss::ScenePropertyID>::setClientStyleAttribute((uint64_t)self->_sceneClientStyleState.__ptr_, 1u, LOWORD(self->_lineType));
    gss::ClientStyleState<gss::ScenePropertyID>::setClientStyleAttribute((uint64_t)self->_sceneClientStyleState.__ptr_, 0x15u, LOWORD(self->_rampType));
    gss::ClientStyleState<gss::ScenePropertyID>::setClientStyleAttribute((uint64_t)self->_sceneClientStyleState.__ptr_, 0x1003Bu, LOWORD(self->_nextManeuverRampType));
    gss::ClientStyleState<gss::ScenePropertyID>::setClientStyleAttribute((uint64_t)self->_sceneClientStyleState.__ptr_, 0x10010u, self->_transportType);
    gss::ClientStyleState<gss::ScenePropertyID>::setClientStyleAttribute((uint64_t)self->_sceneClientStyleState.__ptr_, 0x10031u, self->_searchAlongTheRoute);
    gss::ClientStyleState<gss::ScenePropertyID>::setClientStyleAttribute((uint64_t)self->_sceneClientStyleState.__ptr_, 0x10032u, self->_vehicleSpeed);
    gss::ClientStyleState<gss::ScenePropertyID>::setClientStyleAttribute((uint64_t)self->_sceneClientStyleState.__ptr_, 0x10039u, self->_roadSpeed);
    gss::ClientStyleState<gss::ScenePropertyID>::setClientStyleAttribute((uint64_t)self->_sceneClientStyleState.__ptr_, 0x10034u, self->_cameraMode);
    gss::ClientStyleState<gss::ScenePropertyID>::setClientStyleAttribute((uint64_t)self->_sceneClientStyleState.__ptr_, 0x10040u, self->_navigationDestination);
    gss::ClientStyleState<gss::ScenePropertyID>::setClientStyleAttribute((uint64_t)self->_sceneClientStyleState.__ptr_, 0x10055u, LOWORD(self->_roadComplexity));
    gss::ClientStyleState<gss::ScenePropertyID>::setClientStyleAttribute((uint64_t)self->_sceneClientStyleState.__ptr_, 0x10061u, LOWORD(self->_nextRoadComplexity));
    gss::ClientStyleState<gss::ScenePropertyID>::setClientStyleAttribute((uint64_t)self->_sceneClientStyleState.__ptr_, 0x1005Du, self->_distanceToCurrentTrafficSection);
    gss::ClientStyleState<gss::ScenePropertyID>::setClientStyleAttribute((uint64_t)self->_sceneClientStyleState.__ptr_, 0x1005Eu, self->_currentTrafficState);
    gss::ClientStyleState<gss::ScenePropertyID>::setClientStyleAttribute((uint64_t)self->_sceneClientStyleState.__ptr_, 0x10062u, self->_currentTransitManeuver);
    gss::ClientStyleState<gss::ScenePropertyID>::setClientStyleAttribute((uint64_t)self->_sceneClientStyleState.__ptr_, 0x10063u, self->_routeSinuosity);
    if (self->_currentGroupedManeuverCount >= 5)
      LODWORD(currentGroupedManeuverCount) = 5;
    else
      currentGroupedManeuverCount = self->_currentGroupedManeuverCount;
    gss::ClientStyleState<gss::ScenePropertyID>::setClientStyleAttribute((uint64_t)self->_sceneClientStyleState.__ptr_, 0x1002Au, currentGroupedManeuverCount);
  }
}

- (void)setStyleManager:
{

  operator delete(a1);
}

- (void)setStyleManager:(shared_ptr<gss::StylesheetManager<gss::PropertyID>>)a3
{
  void *ptr;
  __shared_weak_count *v5;
  unint64_t *v6;
  unint64_t v7;
  __shared_weak_count *cntrl;
  unint64_t *v9;
  unint64_t v10;
  VKSceneConfiguration *v11;
  uint64_t *v12;
  VKSceneConfiguration *v13;
  _QWORD *v14;
  uint64_t v15;
  _QWORD v16[3];
  _QWORD *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  ptr = *(void **)a3.__ptr_;
  v5 = (__shared_weak_count *)*((_QWORD *)a3.__ptr_ + 1);
  if (v5)
  {
    v6 = (unint64_t *)((char *)v5 + 8);
    do
      v7 = __ldxr(v6);
    while (__stxr(v7 + 1, v6));
  }
  cntrl = self->_styleManager.__cntrl_;
  self->_styleManager.__ptr_ = ptr;
  self->_styleManager.__cntrl_ = v5;
  if (cntrl)
  {
    v9 = (unint64_t *)((char *)cntrl + 8);
    do
      v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (!v10)
    {
      (*(void (**)(__shared_weak_count *, SEL))(*(_QWORD *)cntrl + 16))(cntrl, a2);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
    }
    ptr = self->_styleManager.__ptr_;
  }
  if (ptr)
  {
    v11 = self;
    v12 = (uint64_t *)self->_styleManager.__ptr_;
    v13 = v11;
    v16[0] = &off_1E42C7A18;
    v16[1] = v13;
    v17 = v16;
    gss::StylesheetManager<gss::PropertyID>::addFinishedDecodingGlobalPropertiesCallback(v12, v16);
    v14 = v17;
    if (v17 == v16)
    {
      v15 = 4;
      v14 = v16;
    }
    else
    {
      if (!v17)
      {
LABEL_16:

        return;
      }
      v15 = 5;
    }
    (*(void (**)(void))(*v14 + 8 * v15))();
    goto LABEL_16;
  }
}

- (void)setSceneClientStyleState:(shared_ptr<gss::ClientStyleState<gss::ScenePropertyID>>)a3
{
  __shared_weak_count *v4;
  void *v5;
  unint64_t *v6;
  unint64_t v7;
  __shared_weak_count *cntrl;
  unint64_t *v9;
  unint64_t v10;

  v5 = *(void **)a3.__ptr_;
  v4 = (__shared_weak_count *)*((_QWORD *)a3.__ptr_ + 1);
  if (v4)
  {
    v6 = (unint64_t *)((char *)v4 + 8);
    do
      v7 = __ldxr(v6);
    while (__stxr(v7 + 1, v6));
  }
  cntrl = self->_sceneClientStyleState.__cntrl_;
  self->_sceneClientStyleState.__ptr_ = v5;
  self->_sceneClientStyleState.__cntrl_ = v4;
  if (cntrl)
  {
    v9 = (unint64_t *)((char *)cntrl + 8);
    do
      v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (!v10)
    {
      (*(void (**)(__shared_weak_count *, SEL))(*(_QWORD *)cntrl + 16))(cntrl, a2);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
    }
  }
  -[VKSceneConfiguration _updateStyleManager](self, "_updateStyleManager");
}

- (id)setStyleManager:
{
  void *v3;
  id result;

  v3 = *(void **)(a1 + 8);
  *a2 = &off_1E42C7A18;
  result = v3;
  a2[1] = result;
  return result;
}

- (id).cxx_construct
{
  *((_OWORD *)self + 15) = 0u;
  *((_OWORD *)self + 16) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *((_QWORD *)self + 7) = 0;
  *((_DWORD *)self + 68) = 1065353216;
  *((_QWORD *)self + 35) = 0;
  *((_QWORD *)self + 36) = 0;
  return self;
}

- (VKSceneConfiguration)initWithTaskContext:(const void *)a3
{
  VKSceneConfiguration *v4;
  VKSceneConfiguration *v5;
  uint64_t v6;
  TaskContext *v7;
  unint64_t *v8;
  unint64_t v9;
  std::__shared_weak_count *cntrl;
  unint64_t *p_shared_owners;
  unint64_t v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)VKSceneConfiguration;
  v4 = -[VKSceneConfiguration init](&v14, sel_init);
  v5 = v4;
  if (v4)
  {
    v7 = *(TaskContext **)a3;
    v6 = *((_QWORD *)a3 + 1);
    if (v6)
    {
      v8 = (unint64_t *)(v6 + 8);
      do
        v9 = __ldxr(v8);
      while (__stxr(v9 + 1, v8));
    }
    cntrl = (std::__shared_weak_count *)v4->_taskContext.__cntrl_;
    v4->_taskContext.__ptr_ = v7;
    v4->_taskContext.__cntrl_ = (__shared_weak_count *)v6;
    if (cntrl)
    {
      p_shared_owners = (unint64_t *)&cntrl->__shared_owners_;
      do
        v12 = __ldaxr(p_shared_owners);
      while (__stlxr(v12 - 1, p_shared_owners));
      if (!v12)
      {
        ((void (*)(std::__shared_weak_count *))cntrl->__on_zero_shared)(cntrl);
        std::__shared_weak_count::__release_weak(cntrl);
      }
    }
    -[VKSceneConfiguration resetState](v5, "resetState");
    *(_OWORD *)&v5->_distanceRanges._immediate = xmmword_19FFB3260;
    *(_OWORD *)&v5->_distanceRanges._veryNear = xmmword_19FFB3270;
    *(_OWORD *)&v5->_distanceRanges._medium = xmmword_19FFB3280;
    *(_OWORD *)&v5->_distanceRanges._veryFar = xmmword_19FFB3290;
    *(_OWORD *)&v5->_sinuosityLevels._low = xmmword_19FFB32A0;
    v5->_sinuosityLevels._high = 2.0;
  }
  return v5;
}

- (void)resetState
{
  _DWORD *i;
  _QWORD *next;
  _QWORD *v5;
  unint64_t value;
  uint64_t j;

  *(_WORD *)&self->_navState = 0;
  *(_QWORD *)&self->_rampType = 0;
  self->_lineType = 0;
  *(_QWORD *)&self->_currentManeuverType = 0;
  self->_currentGroupedManeuverCount = 0;
  self->_distanceToDestination = 0.0;
  *(_DWORD *)&self->_transportType = 4;
  *(_WORD *)&self->_cameraMode = 0;
  self->_roadComplexity = 0;
  self->_nextRoadComplexity = 0;
  self->_roadSpeedZeroes = 0;
  *(_WORD *)&self->_distanceToCurrentTrafficSection = 1032;
  *(_WORD *)&self->_currentTransitManeuver = 0;
  self->_laneCount = 0;
  if (self->_sceneClientStyleState.__ptr_)
  {
    for (i = self->_styleAttributeCoordinateRanges.__table_.__p1_.__value_.__next_; i; i = *(_DWORD **)i)
      gss::ClientStyleState<gss::ScenePropertyID>::removeClientStyleAttribute((uint64_t)self->_sceneClientStyleState.__ptr_, i[4]);
    if (self->_styleAttributeCoordinateRanges.__table_.__p2_.__value_)
    {
      next = self->_styleAttributeCoordinateRanges.__table_.__p1_.__value_.__next_;
      if (next)
      {
        do
        {
          v5 = (_QWORD *)*next;
          operator delete(next);
          next = v5;
        }
        while (v5);
      }
      self->_styleAttributeCoordinateRanges.__table_.__p1_.__value_.__next_ = 0;
      value = self->_styleAttributeCoordinateRanges.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
      if (value)
      {
        for (j = 0; j != value; ++j)
          self->_styleAttributeCoordinateRanges.__table_.__bucket_list_.__ptr_.__value_[j] = 0;
      }
      self->_styleAttributeCoordinateRanges.__table_.__p2_.__value_ = 0;
    }
  }
  -[VKSceneConfiguration _updateStyleManager](self, "_updateStyleManager");
}

- (shared_ptr<gss::ClientStyleState<gss::ScenePropertyID>>)sceneClientStyleState
{
  void **v2;
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  shared_ptr<gss::ClientStyleState<gss::ScenePropertyID>> result;

  cntrl = self->_sceneClientStyleState.__cntrl_;
  *v2 = self->_sceneClientStyleState.__ptr_;
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

- (void)setNavigationState:(int)a3
{
  unsigned __int8 v3;
  void *ptr;

  if ((a3 - 1) >= 8)
    v3 = 0;
  else
    v3 = 0x107060504030201uLL >> (8 * (a3 - 1));
  self->_navState = v3;
  ptr = self->_sceneClientStyleState.__ptr_;
  if (ptr)
    gss::ClientStyleState<gss::ScenePropertyID>::setClientStyleAttribute((uint64_t)ptr, 0x1001Du, v3);
}

- (void)setDistanceToCurrentManeuver:(double)a3
{
  int distanceToCurrentManeuver;
  double v6;
  double extremlyNear;
  double veryNear;
  double near;
  double medium;
  double far;
  double veryFar;
  unsigned __int8 v14;
  void *ptr;

  distanceToCurrentManeuver = self->_distanceToCurrentManeuver;
  GEOConfigGetDouble();
  if (self->_distanceRanges._immediate >= a3)
  {
    v14 = 1;
    goto LABEL_18;
  }
  extremlyNear = self->_distanceRanges._extremlyNear;
  if (extremlyNear >= a3)
    goto LABEL_17;
  veryNear = self->_distanceRanges._veryNear;
  if (veryNear >= a3)
  {
    v14 = 3;
    if (distanceToCurrentManeuver != 2 || extremlyNear + v6 >= a3)
      goto LABEL_18;
LABEL_17:
    v14 = 2;
    goto LABEL_18;
  }
  near = self->_distanceRanges._near;
  if (near >= a3)
  {
    v14 = 4;
    if (distanceToCurrentManeuver == 3 && veryNear + v6 < a3)
      v14 = 3;
  }
  else
  {
    medium = self->_distanceRanges._medium;
    if (medium >= a3)
    {
      v14 = 5;
      if (distanceToCurrentManeuver == 4 && near + v6 < a3)
        v14 = 4;
    }
    else
    {
      far = self->_distanceRanges._far;
      if (far >= a3)
      {
        v14 = 6;
        if (distanceToCurrentManeuver == 5 && medium + v6 < a3)
          v14 = 5;
      }
      else
      {
        veryFar = self->_distanceRanges._veryFar;
        if (veryFar >= a3)
        {
          v14 = 7;
          if (distanceToCurrentManeuver == 6 && far + v6 < a3)
            v14 = 6;
        }
        else if (veryFar + v6 < a3 && distanceToCurrentManeuver == 7)
        {
          v14 = 7;
        }
        else
        {
          v14 = 8;
        }
      }
    }
  }
LABEL_18:
  self->_distanceToCurrentManeuver = v14;
  ptr = self->_sceneClientStyleState.__ptr_;
  if (ptr)
    gss::ClientStyleState<gss::ScenePropertyID>::setClientStyleAttribute((uint64_t)ptr, 0x1001Eu, v14);
}

- (void)setDistanceToDestination:(double)a3
{
  self->_distanceToDestination = a3;
}

- (void)setCurrentManeuverType:(int)a3
{
  void *ptr;
  int v4;

  self->_currentManeuverType = a3;
  ptr = self->_sceneClientStyleState.__ptr_;
  if (ptr)
  {
    if ((a3 - 1) > 0x57)
      v4 = 0;
    else
      v4 = byte_19FFB8542[a3 - 1];
    gss::ClientStyleState<gss::ScenePropertyID>::setClientStyleAttribute((uint64_t)ptr, 0x10026u, v4);
  }
}

- (void)setCurrentStepLength:(double)a3
{
  int v3;
  void *ptr;

  if (self->_distanceRanges._immediate >= a3)
  {
    v3 = 1;
  }
  else if (self->_distanceRanges._extremlyNear >= a3)
  {
    v3 = 2;
  }
  else if (self->_distanceRanges._veryNear >= a3)
  {
    v3 = 3;
  }
  else if (self->_distanceRanges._near >= a3)
  {
    v3 = 4;
  }
  else if (self->_distanceRanges._medium >= a3)
  {
    v3 = 5;
  }
  else if (self->_distanceRanges._far >= a3)
  {
    v3 = 6;
  }
  else if (self->_distanceRanges._veryFar >= a3)
  {
    v3 = 7;
  }
  else
  {
    v3 = 8;
  }
  self->_currentStepLength = v3;
  ptr = self->_sceneClientStyleState.__ptr_;
  if (ptr)
    gss::ClientStyleState<gss::ScenePropertyID>::setClientStyleAttribute((uint64_t)ptr, 0x1003Eu, v3);
}

- (void)setNextStepLength:(double)a3
{
  int v3;
  void *ptr;

  if (self->_distanceRanges._immediate >= a3)
  {
    v3 = 1;
  }
  else if (self->_distanceRanges._extremlyNear >= a3)
  {
    v3 = 2;
  }
  else if (self->_distanceRanges._veryNear >= a3)
  {
    v3 = 3;
  }
  else if (self->_distanceRanges._near >= a3)
  {
    v3 = 4;
  }
  else if (self->_distanceRanges._medium >= a3)
  {
    v3 = 5;
  }
  else if (self->_distanceRanges._far >= a3)
  {
    v3 = 6;
  }
  else if (self->_distanceRanges._veryFar >= a3)
  {
    v3 = 7;
  }
  else
  {
    v3 = 8;
  }
  self->_nextStepLength = v3;
  ptr = self->_sceneClientStyleState.__ptr_;
  if (ptr)
    gss::ClientStyleState<gss::ScenePropertyID>::setClientStyleAttribute((uint64_t)ptr, 0x10027u, v3);
}

- (void)setCurrentIncidentType:(unint64_t)a3
{
  unsigned __int8 v3;
  void *ptr;

  if (a3 >= 5)
    v3 = 0;
  else
    v3 = a3;
  self->_currentIncidentType = v3;
  ptr = self->_sceneClientStyleState.__ptr_;
  if (ptr)
    gss::ClientStyleState<gss::ScenePropertyID>::setClientStyleAttribute((uint64_t)ptr, 0x10028u, v3);
}

- (void)setCurrentManeuverJunctionsCount:(unint64_t)a3
{
  uint64_t Integer;

  Integer = GEOConfigGetInteger();
  self->_currentManeuverComplexity = Integer <= (uint64_t)a3;
  if (self->_sceneClientStyleState.__ptr_)
    gss::ClientStyleState<gss::ScenePropertyID>::setClientStyleAttribute((uint64_t)self->_sceneClientStyleState.__ptr_, 0x10029u, Integer <= (uint64_t)a3);
}

- (void)setCurrentGroupedManeuverCount:(unint64_t)a3
{
  void *ptr;

  self->_currentGroupedManeuverCount = a3;
  ptr = self->_sceneClientStyleState.__ptr_;
  if (ptr)
  {
    if (a3 >= 5)
      LODWORD(a3) = 5;
    gss::ClientStyleState<gss::ScenePropertyID>::setClientStyleAttribute((uint64_t)ptr, 0x1002Au, a3);
  }
}

- (void)setLineType:(unsigned int)a3
{
  void *ptr;

  if (a3)
  {
    self->_lineType = a3;
    ptr = self->_sceneClientStyleState.__ptr_;
    if (ptr)
      gss::ClientStyleState<gss::ScenePropertyID>::setClientStyleAttribute((uint64_t)ptr, 1u, (unsigned __int16)a3);
  }
}

- (void)setRampType:(int)a3
{
  void *ptr;

  self->_rampType = a3;
  ptr = self->_sceneClientStyleState.__ptr_;
  if (ptr)
    gss::ClientStyleState<gss::ScenePropertyID>::setClientStyleAttribute((uint64_t)ptr, 0x15u, (unsigned __int16)a3);
}

- (void)setNextManeuverRampType:(int)a3
{
  void *ptr;

  self->_nextManeuverRampType = a3;
  ptr = self->_sceneClientStyleState.__ptr_;
  if (ptr)
    gss::ClientStyleState<gss::ScenePropertyID>::setClientStyleAttribute((uint64_t)ptr, 0x1003Bu, (unsigned __int16)a3);
}

- (void)setCurrentTransportationType:(int)a3
{
  unint64_t v3;
  void *ptr;

  v3 = 0x50403020100uLL >> (8 * a3);
  if (a3 >= 7)
    LOBYTE(v3) = 4;
  self->_transportType = v3;
  ptr = self->_sceneClientStyleState.__ptr_;
  if (ptr)
    gss::ClientStyleState<gss::ScenePropertyID>::setClientStyleAttribute((uint64_t)ptr, 0x10010u, v3);
}

- (void)setSearchAlongTheRoute:(BOOL)a3
{
  void *ptr;

  self->_searchAlongTheRoute = a3;
  ptr = self->_sceneClientStyleState.__ptr_;
  if (ptr)
    gss::ClientStyleState<gss::ScenePropertyID>::setClientStyleAttribute((uint64_t)ptr, 0x10031u, a3);
}

- (void)setVehicleSpeed:(double)a3
{
  int v3;
  void *ptr;

  if (a3 >= 0.0)
  {
    if (a3 < 20.0)
    {
      v3 = 1;
    }
    else if (a3 < 40.0)
    {
      v3 = 2;
    }
    else if (a3 >= 60.0)
    {
      if (a3 >= 80.0)
      {
        if (a3 >= 100.0)
        {
          if (a3 >= 120.0)
          {
            if (a3 >= 140.0)
            {
              if (a3 >= 160.0)
                v3 = 9;
              else
                v3 = 8;
            }
            else
            {
              v3 = 7;
            }
          }
          else
          {
            v3 = 6;
          }
        }
        else
        {
          v3 = 5;
        }
      }
      else
      {
        v3 = 4;
      }
    }
    else
    {
      v3 = 3;
    }
  }
  else
  {
    v3 = 0;
  }
  self->_vehicleSpeed = v3;
  ptr = self->_sceneClientStyleState.__ptr_;
  if (ptr)
    gss::ClientStyleState<gss::ScenePropertyID>::setClientStyleAttribute((uint64_t)ptr, 0x10032u, v3);
}

- (void)setRoadSpeed:(double)a3
{
  unint64_t roadSpeedZeroes;
  int v4;
  void *ptr;

  if (self->_roadSpeed && a3 == 0.0)
  {
    roadSpeedZeroes = self->_roadSpeedZeroes;
    if (roadSpeedZeroes <= 9)
    {
      self->_roadSpeedZeroes = roadSpeedZeroes + 1;
      return;
    }
    self->_roadSpeedZeroes = 0;
  }
  if (a3 > 0.0 && self->_roadSpeedZeroes)
    self->_roadSpeedZeroes = 0;
  if (a3 >= 10.0)
  {
    if (a3 < 20.0)
    {
      v4 = 1;
    }
    else if (a3 < 30.0)
    {
      v4 = 2;
    }
    else if (a3 >= 40.0)
    {
      if (a3 >= 50.0)
      {
        if (a3 >= 60.0)
        {
          if (a3 >= 70.0)
          {
            if (a3 >= 80.0)
            {
              if (a3 >= 90.0)
              {
                if (a3 >= 100.0)
                {
                  if (a3 >= 110.0)
                  {
                    if (a3 >= 120.0)
                    {
                      if (a3 >= 130.0)
                      {
                        if (a3 >= 140.0)
                        {
                          if (a3 >= 150.0)
                          {
                            if (a3 >= 160.0)
                              v4 = 16 * (a3 >= 160.0);
                            else
                              v4 = 15;
                          }
                          else
                          {
                            v4 = 14;
                          }
                        }
                        else
                        {
                          v4 = 13;
                        }
                      }
                      else
                      {
                        v4 = 12;
                      }
                    }
                    else
                    {
                      v4 = 11;
                    }
                  }
                  else
                  {
                    v4 = 10;
                  }
                }
                else
                {
                  v4 = 9;
                }
              }
              else
              {
                v4 = 8;
              }
            }
            else
            {
              v4 = 7;
            }
          }
          else
          {
            v4 = 6;
          }
        }
        else
        {
          v4 = 5;
        }
      }
      else
      {
        v4 = 4;
      }
    }
    else
    {
      v4 = 3;
    }
  }
  else
  {
    v4 = 0;
  }
  self->_roadSpeed = v4;
  ptr = self->_sceneClientStyleState.__ptr_;
  if (ptr)
    gss::ClientStyleState<gss::ScenePropertyID>::setClientStyleAttribute((uint64_t)ptr, 0x10039u, v4);
}

- (void)setNavCameraMode:(unint64_t)a3
{
  unsigned __int8 v3;
  void *ptr;

  if (a3 >= 4)
    v3 = 0;
  else
    v3 = a3;
  self->_cameraMode = v3;
  ptr = self->_sceneClientStyleState.__ptr_;
  if (ptr)
    gss::ClientStyleState<gss::ScenePropertyID>::setClientStyleAttribute((uint64_t)ptr, 0x10034u, v3);
}

- (unint64_t)navCameraMode
{
  if (self->_cameraMode - 1 < 3)
    return (self->_cameraMode - 1) + 1;
  else
    return 0;
}

- (unsigned)navCameraModeStyleAttribute
{
  return self->_cameraMode;
}

- (const)styleAttributeCoordinateRanges
{
  return &self->_styleAttributeCoordinateRanges;
}

- (void)setNavigationDestination:(unint64_t)a3
{
  int v3;
  void *ptr;

  if (a3 == 2)
    v3 = 2;
  else
    v3 = a3 == 1;
  self->_navigationDestination = v3;
  ptr = self->_sceneClientStyleState.__ptr_;
  if (ptr)
    gss::ClientStyleState<gss::ScenePropertyID>::setClientStyleAttribute((uint64_t)ptr, 0x10040u, v3);
}

- (unint64_t)navigationDestination
{
  int navigationDestination;

  navigationDestination = self->_navigationDestination;
  if (navigationDestination == 2)
    return 2;
  else
    return navigationDestination == 1;
}

- (unsigned)navigationState
{
  return self->_navState;
}

- (void)setCurrentRoadComplexity:(unsigned int)a3
{
  void *ptr;

  if (self->_roadComplexity != a3)
  {
    self->_roadComplexity = a3;
    ptr = self->_sceneClientStyleState.__ptr_;
    if (ptr)
      gss::ClientStyleState<gss::ScenePropertyID>::setClientStyleAttribute((uint64_t)ptr, 0x10055u, (unsigned __int16)a3);
  }
}

- (void)setNextRoadComplexity:(unsigned int)a3
{
  void *ptr;

  if (self->_nextRoadComplexity != a3)
  {
    self->_nextRoadComplexity = a3;
    ptr = self->_sceneClientStyleState.__ptr_;
    if (ptr)
      gss::ClientStyleState<gss::ScenePropertyID>::setClientStyleAttribute((uint64_t)ptr, 0x10061u, (unsigned __int16)a3);
  }
}

- (void)setDistanceToCurrentTrafficSection:(double)a3
{
  int v3;
  void *ptr;

  if (self->_distanceRanges._immediate >= a3)
  {
    v3 = 1;
  }
  else if (self->_distanceRanges._extremlyNear >= a3)
  {
    v3 = 2;
  }
  else if (self->_distanceRanges._veryNear >= a3)
  {
    v3 = 3;
  }
  else if (self->_distanceRanges._near >= a3)
  {
    v3 = 4;
  }
  else if (self->_distanceRanges._medium >= a3)
  {
    v3 = 5;
  }
  else if (self->_distanceRanges._far >= a3)
  {
    v3 = 6;
  }
  else if (self->_distanceRanges._veryFar >= a3)
  {
    v3 = 7;
  }
  else
  {
    v3 = 8;
  }
  if (self->_distanceToCurrentTrafficSection != v3)
  {
    self->_distanceToCurrentTrafficSection = v3;
    ptr = self->_sceneClientStyleState.__ptr_;
    if (ptr)
      gss::ClientStyleState<gss::ScenePropertyID>::setClientStyleAttribute((uint64_t)ptr, 0x1005Du, v3);
  }
}

- (void)setTrafficColor:(unint64_t)a3
{
  unsigned __int8 v3;
  void *ptr;

  if (a3 >= 5)
    v3 = 0;
  else
    v3 = a3;
  if (self->_currentTrafficState != v3)
  {
    self->_currentTrafficState = v3;
    ptr = self->_sceneClientStyleState.__ptr_;
    if (ptr)
      gss::ClientStyleState<gss::ScenePropertyID>::setClientStyleAttribute((uint64_t)ptr, 0x1005Eu, v3);
  }
}

- (void)setCurrentTransitManeuverType:(int)a3
{
  unsigned __int8 v3;
  void *ptr;

  if ((a3 - 1) > 9)
    v3 = 0;
  else
    v3 = byte_19FFB859A[a3 - 1];
  self->_currentTransitManeuver = v3;
  ptr = self->_sceneClientStyleState.__ptr_;
  if (ptr)
    gss::ClientStyleState<gss::ScenePropertyID>::setClientStyleAttribute((uint64_t)ptr, 0x10062u, (unsigned __int16)a3);
}

- (void)setSinuosity:(double)a3
{
  int v3;
  void *ptr;

  if (self->_sinuosityLevels._straight >= a3)
  {
    v3 = 0;
  }
  else if (self->_sinuosityLevels._low >= a3)
  {
    v3 = 1;
  }
  else if (self->_sinuosityLevels._medium >= a3)
  {
    v3 = 2;
  }
  else if (self->_sinuosityLevels._high >= a3)
  {
    v3 = 3;
  }
  else
  {
    v3 = 4;
  }
  if (v3 != self->_routeSinuosity)
  {
    self->_routeSinuosity = v3;
    ptr = self->_sceneClientStyleState.__ptr_;
    if (ptr)
      gss::ClientStyleState<gss::ScenePropertyID>::setClientStyleAttribute((uint64_t)ptr, 0x10063u, v3);
  }
}

- (void)setLaneCount:(unsigned int)a3
{
  void *ptr;

  if (self->_laneCount != a3)
  {
    self->_laneCount = a3;
    ptr = self->_sceneClientStyleState.__ptr_;
    if (ptr)
      gss::ClientStyleState<gss::ScenePropertyID>::setClientStyleAttribute((uint64_t)ptr, 0x1006Bu, (unsigned __int16)a3);
  }
}

- (void)applyStyleAttributeKeyValue:(unsigned int)a3 withValue:(unsigned int)a4 withCoordinateRange:(GEOPolylineCoordinateRange)a5
{
  unint64_t v5;
  PolylineCoordinate end;
  PolylineCoordinate start;
  void *ptr;
  unint64_t v11;
  unint64_t value;
  uint8x8_t v13;
  void **v14;
  _QWORD *v15;
  unint64_t v16;
  uint64_t v17;
  float v18;
  float v19;
  _BOOL8 v20;
  unint64_t v21;
  unint64_t v22;
  size_t prime;
  void **v24;
  void **v25;
  uint64_t v26;
  _QWORD *next;
  __compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<gss::StyleAttribute, GEOPolylineCoordinateRange>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<gss::StyleAttribute, GEOPolylineCoordinateRange>, void *>>> *p_p1;
  size_t v29;
  size_t v30;
  size_t v31;
  _QWORD *i;
  size_t v33;
  void **v34;
  size_t v35;
  unint64_t v36;
  uint8x8_t v37;
  uint64_t v38;
  _QWORD *v39;
  size_t v40;
  size_t v41;
  void **v42;
  void **v43;
  void **v44;
  unint64_t v45;
  void **v46;

  end = a5.end;
  start = a5.start;
  ptr = self->_sceneClientStyleState.__ptr_;
  if (ptr)
    gss::ClientStyleState<gss::ScenePropertyID>::setClientStyleAttribute((uint64_t)ptr, a3, (unsigned __int16)a4);
  v11 = a3;
  value = self->_styleAttributeCoordinateRanges.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
  if (value)
  {
    v13 = (uint8x8_t)vcnt_s8((int8x8_t)value);
    v13.i16[0] = vaddlv_u8(v13);
    if (v13.u32[0] > 1uLL)
    {
      v5 = a3;
      if (value <= a3)
        v5 = a3 % value;
    }
    else
    {
      v5 = ((_DWORD)value - 1) & a3;
    }
    v14 = (void **)self->_styleAttributeCoordinateRanges.__table_.__bucket_list_.__ptr_.__value_[v5];
    if (v14)
    {
      v15 = *v14;
      if (*v14)
      {
        if (v13.u32[0] < 2uLL)
        {
          while (1)
          {
            v17 = v15[1];
            if (v17 == a3)
            {
              if (*((_DWORD *)v15 + 4) == a3)
                goto LABEL_84;
            }
            else if ((v17 & (value - 1)) != v5)
            {
              goto LABEL_24;
            }
            v15 = (_QWORD *)*v15;
            if (!v15)
              goto LABEL_24;
          }
        }
        do
        {
          v16 = v15[1];
          if (v16 == a3)
          {
            if (*((_DWORD *)v15 + 4) == a3)
              goto LABEL_84;
          }
          else
          {
            if (v16 >= value)
              v16 %= value;
            if (v16 != v5)
              break;
          }
          v15 = (_QWORD *)*v15;
        }
        while (v15);
      }
    }
  }
LABEL_24:
  v15 = operator new(0x28uLL);
  *v15 = 0;
  v15[1] = a3;
  *((_DWORD *)v15 + 4) = a3;
  *(_QWORD *)((char *)v15 + 20) = 0xBF80000000000000;
  *(_QWORD *)((char *)v15 + 28) = 0xBF80000000000000;
  v18 = (float)(self->_styleAttributeCoordinateRanges.__table_.__p2_.__value_ + 1);
  v19 = self->_styleAttributeCoordinateRanges.__table_.__p3_.__value_;
  if (value && (float)(v19 * (float)value) >= v18)
  {
    v11 = v5;
    goto LABEL_74;
  }
  v20 = 1;
  if (value >= 3)
    v20 = (value & (value - 1)) != 0;
  v21 = v20 | (2 * value);
  v22 = vcvtps_u32_f32(v18 / v19);
  if (v21 <= v22)
    prime = v22;
  else
    prime = v21;
  if (prime == 1)
  {
    prime = 2;
  }
  else if ((prime & (prime - 1)) != 0)
  {
    prime = std::__next_prime(prime);
    value = self->_styleAttributeCoordinateRanges.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
  }
  if (prime > value)
  {
LABEL_37:
    if (prime >> 61)
      std::__throw_bad_array_new_length[abi:nn180100]();
    v24 = (void **)operator new(8 * prime);
    v25 = self->_styleAttributeCoordinateRanges.__table_.__bucket_list_.__ptr_.__value_;
    self->_styleAttributeCoordinateRanges.__table_.__bucket_list_.__ptr_.__value_ = v24;
    if (v25)
      operator delete(v25);
    v26 = 0;
    self->_styleAttributeCoordinateRanges.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_ = prime;
    do
      self->_styleAttributeCoordinateRanges.__table_.__bucket_list_.__ptr_.__value_[v26++] = 0;
    while (prime != v26);
    next = self->_styleAttributeCoordinateRanges.__table_.__p1_.__value_.__next_;
    if (!next)
      goto LABEL_61;
    p_p1 = &self->_styleAttributeCoordinateRanges.__table_.__p1_;
    v29 = next[1];
    v30 = prime - 1;
    if ((prime & (prime - 1)) == 0)
    {
      v31 = v29 & v30;
      self->_styleAttributeCoordinateRanges.__table_.__bucket_list_.__ptr_.__value_[v31] = p_p1;
      for (i = (_QWORD *)*next; *next; i = (_QWORD *)*next)
      {
        v33 = i[1] & v30;
        if (v33 == v31)
        {
          next = i;
        }
        else
        {
          v34 = self->_styleAttributeCoordinateRanges.__table_.__bucket_list_.__ptr_.__value_;
          if (v34[v33])
          {
            *next = *i;
            v35 = v33;
            *i = *(_QWORD *)self->_styleAttributeCoordinateRanges.__table_.__bucket_list_.__ptr_.__value_[v35];
            *(_QWORD *)self->_styleAttributeCoordinateRanges.__table_.__bucket_list_.__ptr_.__value_[v35] = i;
          }
          else
          {
            v34[v33] = next;
            next = i;
            v31 = v33;
          }
        }
      }
LABEL_61:
      value = prime;
      goto LABEL_62;
    }
    if (v29 >= prime)
      v29 %= prime;
    self->_styleAttributeCoordinateRanges.__table_.__bucket_list_.__ptr_.__value_[v29] = p_p1;
    v39 = (_QWORD *)*next;
    if (!*next)
      goto LABEL_61;
    while (1)
    {
      v41 = v39[1];
      if (v41 >= prime)
        v41 %= prime;
      if (v41 != v29)
      {
        v42 = self->_styleAttributeCoordinateRanges.__table_.__bucket_list_.__ptr_.__value_;
        if (!v42[v41])
        {
          v42[v41] = next;
          goto LABEL_66;
        }
        *next = *v39;
        v40 = v41;
        *v39 = *(_QWORD *)self->_styleAttributeCoordinateRanges.__table_.__bucket_list_.__ptr_.__value_[v40];
        *(_QWORD *)self->_styleAttributeCoordinateRanges.__table_.__bucket_list_.__ptr_.__value_[v40] = v39;
        v39 = next;
      }
      v41 = v29;
LABEL_66:
      next = v39;
      v39 = (_QWORD *)*v39;
      v29 = v41;
      if (!v39)
        goto LABEL_61;
    }
  }
  if (prime >= value)
    goto LABEL_62;
  v36 = vcvtps_u32_f32((float)self->_styleAttributeCoordinateRanges.__table_.__p2_.__value_/ self->_styleAttributeCoordinateRanges.__table_.__p3_.__value_);
  if (value < 3 || (v37 = (uint8x8_t)vcnt_s8((int8x8_t)value), v37.i16[0] = vaddlv_u8(v37), v37.u32[0] > 1uLL))
  {
    v36 = std::__next_prime(v36);
  }
  else
  {
    v38 = 1 << -(char)__clz(v36 - 1);
    if (v36 >= 2)
      v36 = v38;
  }
  if (prime <= v36)
    prime = v36;
  if (prime < value)
  {
    if (!prime)
    {
      v46 = self->_styleAttributeCoordinateRanges.__table_.__bucket_list_.__ptr_.__value_;
      self->_styleAttributeCoordinateRanges.__table_.__bucket_list_.__ptr_.__value_ = 0;
      if (v46)
        operator delete(v46);
      value = 0;
      self->_styleAttributeCoordinateRanges.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_ = 0;
      goto LABEL_62;
    }
    goto LABEL_37;
  }
  value = self->_styleAttributeCoordinateRanges.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
LABEL_62:
  if ((value & (value - 1)) != 0)
  {
    if (value <= v11)
      v11 %= value;
  }
  else
  {
    v11 = ((_DWORD)value - 1) & v11;
  }
LABEL_74:
  v43 = self->_styleAttributeCoordinateRanges.__table_.__bucket_list_.__ptr_.__value_;
  v44 = (void **)v43[v11];
  if (v44)
  {
    *v15 = *v44;
LABEL_82:
    *v44 = v15;
    goto LABEL_83;
  }
  *v15 = self->_styleAttributeCoordinateRanges.__table_.__p1_.__value_.__next_;
  self->_styleAttributeCoordinateRanges.__table_.__p1_.__value_.__next_ = v15;
  v43[v11] = &self->_styleAttributeCoordinateRanges.__table_.__p1_;
  if (*v15)
  {
    v45 = *(_QWORD *)(*v15 + 8);
    if ((value & (value - 1)) != 0)
    {
      if (v45 >= value)
        v45 %= value;
    }
    else
    {
      v45 &= value - 1;
    }
    v44 = &self->_styleAttributeCoordinateRanges.__table_.__bucket_list_.__ptr_.__value_[v45];
    goto LABEL_82;
  }
LABEL_83:
  ++self->_styleAttributeCoordinateRanges.__table_.__p2_.__value_;
LABEL_84:
  *(PolylineCoordinate *)((char *)v15 + 20) = start;
  *(PolylineCoordinate *)((char *)v15 + 28) = end;
}

- (void)removeStyleAttributeKey:(unsigned int)a3
{
  void *ptr;
  unint64_t value;
  unint64_t v7;
  uint8x8_t v8;
  unint64_t v9;
  void **v10;
  VKSceneConfiguration **v11;
  VKSceneConfiguration *isa;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  VKSceneConfiguration *v16;
  VKSceneConfiguration *v17;
  unint64_t v18;
  unint64_t v19;
  objc_class *v20;
  unint64_t v21;

  ptr = self->_sceneClientStyleState.__ptr_;
  if (ptr)
    gss::ClientStyleState<gss::ScenePropertyID>::removeClientStyleAttribute((uint64_t)ptr, a3);
  value = self->_styleAttributeCoordinateRanges.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
  if (value)
  {
    v7 = a3;
    v8 = (uint8x8_t)vcnt_s8((int8x8_t)value);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      v9 = a3;
      if (value <= a3)
        v9 = a3 % value;
    }
    else
    {
      v9 = ((_DWORD)value - 1) & a3;
    }
    v10 = self->_styleAttributeCoordinateRanges.__table_.__bucket_list_.__ptr_.__value_;
    v11 = (VKSceneConfiguration **)v10[v9];
    if (v11)
    {
      isa = *v11;
      if (*v11)
      {
        v13 = value - 1;
        if (v8.u32[0] < 2uLL)
        {
          while (1)
          {
            v14 = (unint64_t)isa->_sceneClientStyleState.__ptr_;
            if (v14 == a3)
            {
              if (LODWORD(isa->_sceneClientStyleState.__cntrl_) == a3)
                goto LABEL_24;
            }
            else if ((v14 & v13) != v9)
            {
              return;
            }
            isa = (VKSceneConfiguration *)isa->super.isa;
            if (!isa)
              return;
          }
        }
        do
        {
          v15 = (unint64_t)isa->_sceneClientStyleState.__ptr_;
          if (v15 == a3)
          {
            if (LODWORD(isa->_sceneClientStyleState.__cntrl_) == a3)
            {
LABEL_24:
              if (v8.u32[0] > 1uLL)
              {
                if (value <= a3)
                  v7 = a3 % value;
              }
              else
              {
                v7 = v13 & a3;
              }
              v16 = (VKSceneConfiguration *)v10[v7];
              do
              {
                v17 = v16;
                v16 = (VKSceneConfiguration *)v16->super.isa;
              }
              while (v16 != isa);
              if (v17 == (VKSceneConfiguration *)&self->_styleAttributeCoordinateRanges.__table_.__p1_)
                goto LABEL_41;
              v18 = (unint64_t)v17->_sceneClientStyleState.__ptr_;
              if (v8.u32[0] > 1uLL)
              {
                if (v18 >= value)
                  v18 %= value;
              }
              else
              {
                v18 &= v13;
              }
              if (v18 != v7)
              {
LABEL_41:
                if (!isa->super.isa)
                  goto LABEL_42;
                v19 = *((_QWORD *)isa->super.isa + 1);
                if (v8.u32[0] > 1uLL)
                {
                  if (v19 >= value)
                    v19 %= value;
                }
                else
                {
                  v19 &= v13;
                }
                if (v19 != v7)
LABEL_42:
                  v10[v7] = 0;
              }
              v20 = isa->super.isa;
              if (isa->super.isa)
              {
                v21 = *((_QWORD *)v20 + 1);
                if (v8.u32[0] > 1uLL)
                {
                  if (v21 >= value)
                    v21 %= value;
                }
                else
                {
                  v21 &= v13;
                }
                if (v21 != v7)
                {
                  self->_styleAttributeCoordinateRanges.__table_.__bucket_list_.__ptr_.__value_[v21] = v17;
                  v20 = isa->super.isa;
                }
              }
              v17->super.isa = v20;
              isa->super.isa = 0;
              --self->_styleAttributeCoordinateRanges.__table_.__p2_.__value_;
              operator delete(isa);
              return;
            }
          }
          else
          {
            if (v15 >= value)
              v15 %= value;
            if (v15 != v9)
              return;
          }
          isa = (VKSceneConfiguration *)isa->super.isa;
        }
        while (isa);
      }
    }
  }
}

- (void).cxx_destruct
{
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  _QWORD *next;
  _QWORD *v7;
  void **value;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;
  __shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  __shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;

  cntrl = self->_taskContext.__cntrl_;
  if (!cntrl)
    goto LABEL_5;
  v4 = (unint64_t *)((char *)cntrl + 8);
  do
    v5 = __ldaxr(v4);
  while (__stlxr(v5 - 1, v4));
  if (!v5)
  {
    (*(void (**)(__shared_weak_count *, SEL))(*(_QWORD *)cntrl + 16))(cntrl, a2);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
    next = self->_styleAttributeCoordinateRanges.__table_.__p1_.__value_.__next_;
    if (!next)
      goto LABEL_7;
  }
  else
  {
LABEL_5:
    next = self->_styleAttributeCoordinateRanges.__table_.__p1_.__value_.__next_;
    if (!next)
      goto LABEL_7;
  }
  do
  {
    v7 = (_QWORD *)*next;
    operator delete(next);
    next = v7;
  }
  while (v7);
LABEL_7:
  value = self->_styleAttributeCoordinateRanges.__table_.__bucket_list_.__ptr_.__value_;
  self->_styleAttributeCoordinateRanges.__table_.__bucket_list_.__ptr_.__value_ = 0;
  if (value)
    operator delete(value);
  begin = self->_pointsOfInterest.__begin_;
  if (begin)
  {
    self->_pointsOfInterest.__end_ = begin;
    operator delete(begin);
  }
  v10 = self->_styleManager.__cntrl_;
  if (!v10)
    goto LABEL_15;
  v11 = (unint64_t *)((char *)v10 + 8);
  do
    v12 = __ldaxr(v11);
  while (__stlxr(v12 - 1, v11));
  if (!v12)
  {
    (*(void (**)(__shared_weak_count *, SEL))(*(_QWORD *)v10 + 16))(v10, a2);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v10);
    v13 = self->_sceneClientStyleState.__cntrl_;
    if (!v13)
      return;
  }
  else
  {
LABEL_15:
    v13 = self->_sceneClientStyleState.__cntrl_;
    if (!v13)
      return;
  }
  v14 = (unint64_t *)((char *)v13 + 8);
  do
    v15 = __ldaxr(v14);
  while (__stlxr(v15 - 1, v14));
  if (!v15)
  {
    (*(void (**)(__shared_weak_count *, SEL))(*(_QWORD *)v13 + 16))(v13, a2);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v13);
  }
}

- (uint64_t)setStyleManager:
{

  return a1;
}

- (_QWORD)setStyleManager:
{
  _QWORD *v2;
  void *v3;

  v2 = operator new(0x10uLL);
  v3 = *(void **)(a1 + 8);
  *v2 = &off_1E42C7A18;
  v2[1] = v3;
  return v2;
}

@end
