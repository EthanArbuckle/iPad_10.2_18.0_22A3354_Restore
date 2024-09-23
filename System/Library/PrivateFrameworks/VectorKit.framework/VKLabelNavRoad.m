@implementation VKLabelNavRoad

- (VKLabelNavRoad)initWithRoadEdge:(const GeoCodecsRoadEdge *)a3 navJunctionA:(id)a4 routeOffset:(PolylineCoordinate)a5 tile:(const void *)a6
{
  id v10;
  VKLabelNavRoad *v11;
  VKLabelNavRoad *v12;
  VKLabelNavRoad *v13;
  uint64_t v14;
  LabelTile *v15;
  unint64_t *v16;
  unint64_t v17;
  std::__shared_weak_count *cntrl;
  unint64_t *p_shared_owners;
  unint64_t v20;
  GeoCodecsRoadFeature *var0;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int *v25;
  int *v26;
  int v27;
  int v28;
  _BOOL4 hasValue;
  id v30;
  const char *v31;
  uint64_t v32;
  double length;
  BOOL v34;
  _BYTE *data;
  BOOL v36;
  _QWORD *v37;
  double type;
  unint64_t vertexIndexA;
  BOOL v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  float *v45;
  VKLabelNavRoad *v46;
  float v47;
  float v48;
  float v49;
  float v50;
  float v51;
  float v52;
  float v53;
  uint64_t v55;
  unint64_t v56;
  objc_super v57;

  v10 = a4;
  v57.receiver = self;
  v57.super_class = (Class)VKLabelNavRoad;
  v11 = -[VKLabelNavRoad init](&v57, sel_init);
  v12 = v11;
  v13 = v11;
  if (!v11)
  {
LABEL_44:
    v46 = v13;
    goto LABEL_45;
  }
  v15 = *(LabelTile **)a6;
  v14 = *((_QWORD *)a6 + 1);
  if (v14)
  {
    v16 = (unint64_t *)(v14 + 8);
    do
      v17 = __ldxr(v16);
    while (__stxr(v17 + 1, v16));
  }
  cntrl = (std::__shared_weak_count *)v11->_tile.__cntrl_;
  v11->_tile.__ptr_ = v15;
  v11->_tile.__cntrl_ = (__shared_weak_count *)v14;
  if (cntrl)
  {
    p_shared_owners = (unint64_t *)&cntrl->__shared_owners_;
    do
      v20 = __ldaxr(p_shared_owners);
    while (__stlxr(v20 - 1, p_shared_owners));
    if (!v20)
    {
      ((void (*)(std::__shared_weak_count *))cntrl->__on_zero_shared)(cntrl);
      std::__shared_weak_count::__release_weak(cntrl);
    }
  }
  *(_QWORD *)&v13->_lineType._value.type = a3->var1;
  v13->_vertexIndexA = a3->var2;
  v13->_vertexIndexB = a3->var1;
  v13->_labelVertexIndexA = a3->var2;
  objc_storeWeak((id *)&v12->_junctionB, v10);
  v13->_labelVertexIndexB = (unint64_t)a3->var5;
  v13->_junctionA = a3->var6;
  var0 = a3->var0;
  v13->_data = a3->var0;
  if (!var0)
    goto LABEL_19;
  v22 = *((_QWORD *)var0 + 3);
  v23 = *(unsigned __int8 *)(v22 + 33);
  if (!*(_BYTE *)(v22 + 33))
    goto LABEL_19;
  v24 = 0;
  v25 = *(int **)v22;
  v26 = v25;
  while (1)
  {
    v27 = *v26;
    v26 += 2;
    if (v27 == 1)
      break;
    if (v23 == ++v24)
      goto LABEL_19;
  }
  v28 = v25[2 * v24 + 1];
  if (v28 >= 1)
  {
    hasValue = v13->_lineType._hasValue;
    *(&v13->_lineType._hasValue + 1) = v28;
    if (!hasValue)
      v13->_lineType._hasValue = 1;
  }
  else
  {
LABEL_19:
    if (v13->_lineType._hasValue)
      v13->_lineType._hasValue = 0;
  }
  v30 = objc_alloc(MEMORY[0x1E0CB3940]);
  if (*((_QWORD *)v13->_data + 2))
    v31 = (const char *)*((_QWORD *)v13->_data + 2);
  else
    v31 = "";
  v32 = objc_msgSend(v30, "initWithUTF8String:", v31);
  length = v13->_length;
  *(_QWORD *)&v13->_length = v32;

  v34 = -[VKLabelNavRoad roadHasName](v13, "roadHasName");
  data = v13->_data;
  v36 = !v34 && data[72] == 0;
  BYTE1(v13->_direction3D._e[2]) = v36;
  *(PolylineCoordinate *)&v13->_isRoadLabelUnique = a5;
  *(int64x2_t *)&v13->_routeOffset.offset = vdupq_n_s64(1uLL);
  v55 = 0;
  v56 = 0;
  v37 = geo::codec::multiSectionFeaturePointsWithElevation(data, 0, &v55, &v56);
  if (v56 > 1)
  {
    type = v13->_lineType._value.type;
    vertexIndexA = v13->_vertexIndexA;
    v41 = *(_QWORD *)&type - vertexIndexA;
    v40 = *(_QWORD *)&type == vertexIndexA;
    if (*(_QWORD *)&type < vertexIndexA)
      v42 = 1;
    else
      v42 = -1;
    if (!v40)
    {
      v43 = 0;
      v44 = v37[*(_QWORD *)&type];
      v45 = (float *)&v37[v42 + *(_QWORD *)&type];
      if (v41 < 0)
        v41 = -v41;
      if ((unint64_t)v41 <= 1)
        v41 = 1;
      while (v37[*(_QWORD *)&type] == *(_QWORD *)v45)
      {
        ++v43;
        v45 += 2 * v42;
        if (v41 == v43)
          goto LABEL_44;
      }
      v47 = *v45 - *(float *)&v44;
      v48 = v45[1] - *((float *)&v44 + 1);
      v49 = 1.0 / sqrtf((float)(v47 * v47) + (float)(v48 * v48));
      *(float *)&v13->_simplifiedPointElevations.__end_cap_.__value__2._allocator = v49 * v47;
      *((float *)&v13->_simplifiedPointElevations.__end_cap_.__value__2._allocator + 1) = v49 * v48;
      if (v55)
        v50 = *(float *)(v55 + 4 * (*(_QWORD *)&type + v43 * v42 + v42))
            - *(float *)(v55 + 4 * (*(_QWORD *)&type + v43 * v42));
      else
        v50 = 0.0;
      v51 = *v45 - *(float *)&v44;
      v52 = v45[1] - *((float *)&v44 + 1);
      v53 = 1.0 / sqrtf((float)((float)(v51 * v51) + (float)(v52 * v52)) + (float)(v50 * v50));
      v13->_direction2D._e[0] = v53 * v51;
      v13->_direction2D._e[1] = v53 * v52;
      v13->_direction3D._e[0] = v53 * v50;
    }
    goto LABEL_44;
  }
  v46 = 0;
LABEL_45:

  return v46;
}

- (void)dealloc
{
  objc_super v3;

  -[NSString setNavFeature:](self->_shieldGroup, "setNavFeature:", 0);
  -[VKLabelNavRoadLabel setNavFeature:](self->_roadSign, "setNavFeature:", 0);
  v3.receiver = self;
  v3.super_class = (Class)VKLabelNavRoad;
  -[VKLabelNavRoad dealloc](&v3, sel_dealloc);
}

- (const)cstrName
{
  return (const char *)*((_QWORD *)self->_data + 2);
}

- (void)clearRoadSign
{
  NSString *shieldGroup;

  -[NSString setNavFeature:](self->_shieldGroup, "setNavFeature:", 0);
  shieldGroup = self->_shieldGroup;
  self->_shieldGroup = 0;

}

- (void)clearRoadShield
{
  VKLabelNavRoadLabel *roadSign;

  -[VKLabelNavRoadLabel setNavFeature:](self->_roadSign, "setNavFeature:", 0);
  roadSign = self->_roadSign;
  self->_roadSign = 0;

}

- (void)_updateWithNavContext:(NavContext *)a3 threshold:(double)a4
{
  VKLabelNavJunction *WeakRetained;
  BOOL v8;
  BOOL v9;
  NSString *shieldGroup;
  _BYTE *v11;
  BOOL v12;
  VKLabelNavRoadLabel *roadSign;
  _BYTE *v14;
  BOOL v15;

  WeakRetained = (VKLabelNavJunction *)objc_loadWeakRetained((id *)&self->_junctionB);
  v8 = DetermineJunctionVisibility(WeakRetained, (md::NavContext *)a3, a4);
  v9 = self->_cachedShieldVisibility[0] && v8;
  self->_cachedShieldVisibility[0] = v9;

  shieldGroup = self->_shieldGroup;
  if (shieldGroup)
  {
    if (*(_QWORD *)-[NSString label](shieldGroup, "label"))
    {
      v11 = *(_BYTE **)-[NSString label](self->_shieldGroup, "label");
      v12 = -[VKLabelNavRoad hasVisibleSigns](self, "hasVisibleSigns");
      v11[297] = v12;
      if (v11[296])
        v11[298] = v12;
    }
  }
  roadSign = self->_roadSign;
  if (roadSign && *(_QWORD *)-[VKLabelNavRoadLabel label](roadSign, "label"))
  {
    v14 = *(_BYTE **)-[VKLabelNavRoadLabel label](self->_roadSign, "label");
    v15 = -[VKLabelNavRoad hasVisibleShields](self, "hasVisibleShields");
    v14[297] = v15;
    if (v14[296])
      v14[298] = v15;
  }
}

- (void)_updateWithNavContext:(NavContext *)a3
{
  -[VKLabelNavRoad _updateWithNavContext:threshold:](self, "_updateWithNavContext:threshold:", a3, 0.0);
}

- (void)layoutWithNavContext:(NavContext *)a3
{
  NSString *shieldGroup;
  VKLabelNavRoadLabel *roadSign;

  -[VKLabelNavRoad _updateWithNavContext:threshold:](self, "_updateWithNavContext:threshold:", 20.0);
  shieldGroup = self->_shieldGroup;
  if (shieldGroup && *(_QWORD *)-[NSString label](shieldGroup, "label"))
    -[NSString layoutWithNavContext:](self->_shieldGroup, "layoutWithNavContext:", a3);
  roadSign = self->_roadSign;
  if (roadSign)
  {
    if (*(_QWORD *)-[VKLabelNavRoadLabel label](roadSign, "label"))
      -[VKLabelNavRoadLabel layoutWithNavContext:](self->_roadSign, "layoutWithNavContext:", a3);
  }
}

- (void)prepareStyleVarsWithContext:(NavContext *)a3
{
  BOOL *p_isRoadLabelUnique;
  uint64_t v6;
  uint64_t (***v7)(_QWORD);
  unsigned int v8;
  unint64_t v9;
  uint64_t v10;
  int v11;
  id WeakRetained;
  unsigned int v13;
  uint64_t v14;
  LabelManager *var1;
  std::__shared_weak_count *v16;
  unint64_t *p_shared_owners;
  unint64_t v18;
  uint64_t v19;
  unint64_t *v20;
  unint64_t v21;
  uint64_t v22;
  std::__shared_weak_count *v23;
  unint64_t *v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t *v27;
  unint64_t v28;
  unint64_t v29;
  float *v30;
  float v31;
  BOOL v32;
  unsigned int v33;
  unint64_t v34;
  unint64_t v35;
  char *v36;
  char v37;
  _BOOL4 v38;
  unint64_t v39;
  float *v40;
  float v41;
  BOOL v42;
  unsigned int v43;
  unint64_t v44;
  unint64_t v45;
  char *v46;
  char v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  int *v51;
  int *v52;
  int *v53;
  int v54;
  uint64_t v55;
  int *v56;
  int v57;
  uint64_t v58;
  int v59;
  BOOL *v60;
  _BYTE *data;
  id v62;
  void *v63;
  int v64;
  std::__shared_weak_count *v65;
  unint64_t *v66;
  unint64_t v67;
  std::__shared_weak_count *v68;
  unint64_t *v69;
  unint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  unsigned __int8 v76;
  uint64_t v77;
  std::__shared_weak_count *v78;
  _BYTE v79[2];
  _BYTE v80[2];
  uint64_t v81;
  std::__shared_weak_count *v82;
  char v83;
  unsigned __int8 v84;
  uint64_t v85;
  std::__shared_weak_count *v86;

  p_isRoadLabelUnique = &self->_isRoadLabelUnique;
  v6 = *(_QWORD *)(*((_QWORD *)a3->var1 + 21) + 32);
  (*(void (**)(char *__return_ptr, uint64_t, BOOL *))(*(_QWORD *)v6 + 88))(&v83, v6, p_isRoadLabelUnique);
  v7 = *(uint64_t (****)(_QWORD))(*((_QWORD *)a3->var1 + 21) + 32);
  v8 = (**v7)(v7);
  if (v83)
    v9 = v84 + 4 * v8;
  else
    v9 = (4 * v8) | 3;
  if (v9 >= 7)
    v10 = 7;
  else
    v10 = v9;
  if (*((_BYTE *)&self->_roadShield + v10))
  {
    self->_cachedShieldVisibility[0] = self->_isVisibilityCached[v10];
    self->_cachedShieldVisibility[1] = self->_cachedSignVisibility[v10];
  }
  else
  {
    *((_BYTE *)&self->_roadShield + v10) = 1;
    v11 = BYTE1(self->_direction3D._e[1]);
    WeakRetained = objc_loadWeakRetained((id *)&self->_junctionB);
    v13 = 2 * (objc_msgSend(WeakRetained, "depthFromRoute") == 0);
    if (v11)
      v14 = 1;
    else
      v14 = v13;
    v80[0] = 0;
    if (self->_lineType._hasValue)
    {
      v80[1] = *(&self->_lineType._hasValue + 1);
      v80[0] = 1;
    }
    v79[0] = 0;
    if (v83)
    {
      v79[1] = v84;
      v79[0] = 1;
    }
    GetLabelNavStyleAttributes(&v81, 0, v14, v80, v79);
    v79[0] = 0;
    v80[0] = 0;

    var1 = a3->var1;
    v16 = v82;
    v85 = v81;
    v86 = v82;
    if (v82)
    {
      p_shared_owners = (unint64_t *)&v82->__shared_owners_;
      do
        v18 = __ldxr(p_shared_owners);
      while (__stxr(v18 + 1, p_shared_owners));
    }
    v19 = *((_QWORD *)var1 + 42);
    md::createFeatureAttributeSet((gss::Allocator *)&v72, &v85);
    md::LabelStyleCache::styleQueryForFeatureAttributes((unint64_t *)&v77, (uint64_t *)(v19 + 184), &v72, 0);
    if (v72)
    {
      v73 = v72;
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v75 + 40))(v75, v72, v74 - v72);
    }
    if (v16)
    {
      v20 = (unint64_t *)&v16->__shared_owners_;
      do
        v21 = __ldaxr(v20);
      while (__stlxr(v21 - 1, v20));
      if (!v21)
      {
        ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
        std::__shared_weak_count::__release_weak(v16);
      }
    }
    v22 = v77;
    v23 = v78;
    v85 = v77;
    v86 = v78;
    if (v78)
    {
      v24 = (unint64_t *)&v78->__shared_owners_;
      do
        v25 = __ldxr(v24);
      while (__stxr(v25 + 1, v24));
      v73 = (uint64_t)v23;
      do
        v26 = __ldxr(v24);
      while (__stxr(v26 + 1, v24));
    }
    else
    {
      v73 = 0;
    }
    v74 = 0;
    v75 = 0;
    v72 = v22;
    v76 = 0;
    if (v22)
      LODWORD(v22) = (*(uint64_t (**)(uint64_t, uint64_t *))(*(_QWORD *)v22 + 48))(v22, &v74);
    v76 = v22;
    if (v23)
    {
      v27 = (unint64_t *)&v23->__shared_owners_;
      do
        v28 = __ldaxr(v27);
      while (__stlxr(v28 - 1, v27));
      if (!v28)
      {
        ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
        std::__shared_weak_count::__release_weak(v23);
      }
      LODWORD(v22) = v76;
    }
    if ((_DWORD)v22)
    {
      v29 = *(_QWORD *)(v72 + 24);
      v30 = *(float **)v29;
      if (*(_QWORD *)v29
        && (v31 = *v30, LODWORD(v30) = *v30 == 1.0, *(_BYTE *)(v29 + 10))
        && (v31 != 0.0 ? (v32 = v31 == 1.0) : (v32 = 1), !v32)
        || (v33 = *(unsigned __int8 *)(v29 + v30 + 11), v31 = 0.0, v33 == 2))
      {
        LOBYTE(v85) = 1;
        LOBYTE(v71) = 1;
        v34 = gss::RenderStyle<gss::PropertyID>::styleValueForKey<BOOL>(v29, 0xDDu, 0, &v85);
        v35 = gss::RenderStyle<gss::PropertyID>::styleValueForKey<BOOL>(v29, 0xDDu, 1u, &v71);
        if (v31 >= 1.0)
          v36 = (char *)v35;
        else
          v36 = (char *)v34;
        v37 = *v36;
      }
      else
      {
        v37 = *(_BYTE *)gss::RenderStyle<gss::PropertyID>::styleValueForKey<BOOL>(*(_QWORD *)(v72 + 24), 0xDDu, v33, 0);
      }
      self->_isVisibilityCached[v10] = v37 != 0;
      v38 = -[VKLabelNavRoad hasShield](self, "hasShield", v71);
      if (v38)
      {
        v39 = *(_QWORD *)(v72 + 24);
        v40 = *(float **)v39;
        if (*(_QWORD *)v39
          && (v41 = *v40, LODWORD(v40) = *v40 == 1.0, *(_BYTE *)(v39 + 10))
          && (v41 != 0.0 ? (v42 = v41 == 1.0) : (v42 = 1), !v42)
          || (v43 = *(unsigned __int8 *)(v39 + v40 + 11), v41 = 0.0, v43 == 2))
        {
          LOBYTE(v85) = 1;
          LOBYTE(v71) = 1;
          v44 = gss::RenderStyle<gss::PropertyID>::styleValueForKey<BOOL>(v39, 0xDCu, 0, &v85);
          v45 = gss::RenderStyle<gss::PropertyID>::styleValueForKey<BOOL>(v39, 0xDCu, 1u, &v71);
          if (v41 >= 1.0)
            v46 = (char *)v45;
          else
            v46 = (char *)v44;
          v47 = *v46;
        }
        else
        {
          v47 = *(_BYTE *)gss::RenderStyle<gss::PropertyID>::styleValueForKey<BOOL>(*(_QWORD *)(v72 + 24), 0xDCu, v43, 0);
        }
        LOBYTE(v38) = v47 != 0;
      }
      self->_cachedSignVisibility[v10] = v38;
    }
    else
    {
      self->_isVisibilityCached[v10] = 1;
      LOBYTE(v38) = -[VKLabelNavRoad hasShield](self, "hasShield");
      self->_cachedSignVisibility[v10] = v38;
    }
    self->_cachedShieldVisibility[0] = self->_isVisibilityCached[v10];
    self->_cachedShieldVisibility[1] = v38;
    -[VKLabelNavRoad _updateWithNavContext:](self, "_updateWithNavContext:", a3);
    v48 = *((_QWORD *)self->_data + 3);
    v49 = *(unsigned __int8 *)(v48 + 33);
    if (*(_BYTE *)(v48 + 33))
    {
      v50 = 0;
      v51 = *(int **)v48;
      v52 = v51;
      v53 = v51;
      while (1)
      {
        v54 = *v53;
        v53 += 2;
        if (v54 == 1)
          break;
        if (v49 == ++v50)
          goto LABEL_79;
      }
      if (v51[2 * v50 + 1] == 9)
        goto LABEL_84;
LABEL_79:
      v55 = 0;
      v56 = v51;
      while (1)
      {
        v57 = *v56;
        v56 += 2;
        if (v57 == 1)
          break;
        if (v49 == ++v55)
          goto LABEL_88;
      }
      if (v51[2 * v55 + 1] != 10)
        goto LABEL_88;
LABEL_84:
      v58 = 0;
      while (1)
      {
        v59 = *v52;
        v52 += 2;
        if (v59 == 21)
          break;
        if (v49 == ++v58)
        {
          self->_cachedShieldVisibility[2] = 1;
          goto LABEL_98;
        }
      }
      v64 = v51[2 * v58 + 1];
      self->_cachedShieldVisibility[2] = v64 < 1;
      if (v64 >= 1)
      {
        v60 = &self->_cachedShieldVisibility[2];
        goto LABEL_89;
      }
    }
    else
    {
LABEL_88:
      v60 = &self->_cachedShieldVisibility[2];
      self->_cachedShieldVisibility[2] = 0;
LABEL_89:
      if (!-[VKLabelNavRoad isRamp](self, "isRamp"))
      {
        if (-[VKLabelNavRoad roadHasName](self, "roadHasName"))
        {
          data = self->_data;
          if (data[72])
          {
            v71 = 0;
            v85 = 0;
            geo::codec::featureGetNativeShield((uint64_t)data, 0, &v85, &v71, 0);
            if (v85)
            {
              v62 = objc_alloc(MEMORY[0x1E0CB3940]);
              v63 = (void *)objc_msgSend(v62, "initWithUTF8String:", v85);
            }
            else
            {
              v63 = 0;
            }
            *v60 = objc_msgSend(*(id *)&self->_length, "isEqualToString:", v63);

          }
        }
      }
    }
LABEL_98:
    gss::QueryableLocker<gss::PropertyID>::~QueryableLocker((uint64_t)&v72);
    v65 = v78;
    if (v78)
    {
      v66 = (unint64_t *)&v78->__shared_owners_;
      do
        v67 = __ldaxr(v66);
      while (__stlxr(v67 - 1, v66));
      if (!v67)
      {
        ((void (*)(std::__shared_weak_count *))v65->__on_zero_shared)(v65);
        std::__shared_weak_count::__release_weak(v65);
      }
    }
    v68 = v82;
    if (v82)
    {
      v69 = (unint64_t *)&v82->__shared_owners_;
      do
        v70 = __ldaxr(v69);
      while (__stlxr(v70 - 1, v69));
      if (!v70)
      {
        ((void (*)(std::__shared_weak_count *))v68->__on_zero_shared)(v68);
        std::__shared_weak_count::__release_weak(v68);
      }
    }
  }
}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("VKLabelNavRoad (%@)"), *(_QWORD *)&self->_length);
}

- (unsigned)roadClass
{
  return *((_BYTE *)self->_data + 151);
}

- (BOOL)isAwayFromRoute
{
  id WeakRetained;
  char v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_junctionB);
  v3 = objc_msgSend(WeakRetained, "isAwayFromRoute");

  return v3;
}

- (BOOL)isRamp
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int *v5;
  int *v6;
  int v7;

  v2 = *((_QWORD *)self->_data + 3);
  v3 = *(unsigned __int8 *)(v2 + 33);
  if (!*(_BYTE *)(v2 + 33))
    return 0;
  v4 = 0;
  v5 = *(int **)v2;
  v6 = v5;
  while (1)
  {
    v7 = *v6;
    v6 += 2;
    if (v7 == 21)
      break;
    if (v3 == ++v4)
      return 0;
  }
  return v5[2 * v4 + 1] > 0;
}

- (BOOL)isOnewayToJunction
{
  int v2;

  v2 = *((unsigned __int8 *)self->_data + 153);
  if (v2 == 2)
    return *(_QWORD *)&self->_lineType._value.type < self->_vertexIndexA;
  if (v2 == 1)
    return *(_QWORD *)&self->_lineType._value.type > self->_vertexIndexA;
  return 0;
}

- (void)getRoadEdge:(GeoCodecsRoadEdge *)a3
{
  double type;
  GeoCodecsRoadFeature *data;

  a3->var6 = 0;
  *(_OWORD *)&a3->var2 = 0u;
  *(_OWORD *)&a3->var4 = 0u;
  *(_OWORD *)&a3->var0 = 0u;
  type = self->_lineType._value.type;
  a3->var5 = (GeoCodecsConnectivityJunction *)self->_labelVertexIndexB;
  a3->var6 = self->_junctionA;
  data = (GeoCodecsRoadFeature *)self->_data;
  *(double *)&a3->var1 = type;
  a3->var2 = self->_vertexIndexA;
  a3->var0 = data;
}

- (BOOL)matchesRoadEdge:(const GeoCodecsRoadEdge *)a3
{
  unint64_t var1;
  unint64_t var2;

  if (self->_data != a3->var0)
    return 0;
  var1 = a3->var1;
  var2 = a3->var2;
  if (__PAIR128__(var2, var1) == *(_OWORD *)self->_lineType._value.data)
    return 1;
  if (var2 != *(_QWORD *)&self->_lineType._value.type)
    return 0;
  return var1 == self->_vertexIndexA;
}

- (BOOL)matchesRoad:(id)a3
{
  unint64_t v4;
  unint64_t v5;

  if (self->_data != (const void *)*((_QWORD *)a3 + 3))
    return 0;
  v4 = *((_QWORD *)a3 + 5);
  v5 = *((_QWORD *)a3 + 6);
  if (__PAIR128__(v5, v4) == *(_OWORD *)self->_lineType._value.data)
    return 1;
  if (v5 != *(_QWORD *)&self->_lineType._value.type)
    return 0;
  return v4 == self->_vertexIndexA;
}

- (BOOL)hasVisibleSigns
{
  return self->_cachedShieldVisibility[0];
}

- (BOOL)hasVisibleShields
{
  return self->_cachedShieldVisibility[1];
}

- (BOOL)hasShield
{
  return *((_BYTE *)self->_data + 72) != 0;
}

- (NSString)shieldGroup
{
  id v3;
  void *v4;
  id v5;
  NSString *v6;
  NSString *shieldDisplayGroup;
  uint64_t v9;
  uint64_t v10;

  if (!self->_shieldDisplayGroup && -[VKLabelNavRoad hasShield](self, "hasShield"))
  {
    v9 = 0;
    v10 = 0;
    geo::codec::featureGetNativeShield((uint64_t)self->_data, 0, &v10, &v9, 0);
    if (v10)
    {
      v3 = objc_alloc(MEMORY[0x1E0CB3940]);
      v4 = (void *)objc_msgSend(v3, "initWithUTF8String:", v10);
    }
    else
    {
      v4 = 0;
    }
    v5 = objc_alloc(MEMORY[0x1E0CB3940]);
    v6 = (NSString *)objc_msgSend(v5, "initWithFormat:", CFSTR("%@_%llX"), v4, v9);
    shieldDisplayGroup = self->_shieldDisplayGroup;
    self->_shieldDisplayGroup = v6;

  }
  return self->_shieldDisplayGroup;
}

- (NSString)shieldDisplayGroup
{
  NSString *name;
  id v4;
  void *v5;
  id v6;
  NSString *v7;
  NSString *v8;
  uint64_t v10;
  uint64_t v11;

  name = self->_name;
  if (!name)
  {
    v10 = 0;
    v11 = 0;
    geo::codec::featureGetNativeShield((uint64_t)self->_data, 0, &v11, &v10, 0);
    if (v11)
    {
      v4 = objc_alloc(MEMORY[0x1E0CB3940]);
      v5 = (void *)objc_msgSend(v4, "initWithUTF8String:", v11);
    }
    else
    {
      v5 = 0;
    }
    v6 = objc_alloc(MEMORY[0x1E0CB3940]);
    v7 = (NSString *)objc_msgSend(v6, "initWithFormat:", CFSTR("%@_%llX_%@"), v5, v10, *(_QWORD *)&self->_length);
    v8 = self->_name;
    self->_name = v7;

    name = self->_name;
  }
  return name;
}

- (id)labelWithType:(BOOL)a3
{
  uint64_t v3;

  v3 = 248;
  if (a3)
    v3 = 256;
  return *(id *)((char *)&self->super.isa + v3);
}

- (float)_findRoadOffsetForDistanceToRay:(float)a3 rayStart:()Matrix<double rayVector:()3 roadGraph:(1>)a4
{
  float v6;
  float v7;
  double v8;
  double v9;
  id v12;
  GeoCodecsConnectivityJunction **p_junctionB;
  id WeakRetained;
  double v15;
  double v16;
  unsigned __int8 v17;
  VKLabelNavRoad *v18;
  void *v19;
  uint64_t v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  unint64_t v26;
  double *v27;
  double v28;
  double v29;
  unint64_t v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  uint64_t v36;
  id v37;
  double v38;
  double v39;
  uint64_t v42;
  double *v43;
  double *v44;
  uint64_t v45;
  uint64_t v46;

  v6 = a5._e[1];
  v7 = a5._e[0];
  v8 = a4._e[1];
  v9 = a4._e[0];
  v12 = a6;
  p_junctionB = &self->_junctionB;
  WeakRetained = objc_loadWeakRetained((id *)&self->_junctionB);
  objc_msgSend(WeakRetained, "worldUnitsPerMeter");
  v16 = v15;

  v43 = 0;
  v44 = 0;
  v45 = 0;
  {
    v42 = operator new();
    mdm::Allocator::instance(void)::alloc = geo::MallocZoneAllocator::MallocZoneAllocator(v42, "VectorKitLabels", 0x5ED09DD50000000FLL);
  }
  v46 = mdm::Allocator::instance(void)::alloc;
  v18 = self;
  if (v18)
  {
    v19 = v18;
    v20 = 0;
    v21 = v16 * a3;
    v22 = v7;
    v23 = v6;
    v24 = 0.0;
    v25 = 0.0;
    while (1)
    {
      v44 = v43;
      objc_msgSend(v19, "_worldRoadPoints:elevations:", &v43, 0);
      if ((unint64_t)((char *)v44 - (char *)v43) >= 0x11)
        break;
LABEL_11:
      if (v20 != 7)
      {
        objc_msgSend(v12, "nextRoadSegmentForRoad:", v19);
        v36 = objc_claimAutoreleasedReturnValue();
        ++v20;

        v19 = (void *)v36;
        if (v36)
          continue;
      }
      goto LABEL_16;
    }
    v26 = ((char *)v44 - (char *)v43) >> 4;
    if (v26 <= 2)
      v26 = 2;
    v29 = *v43;
    v28 = v43[1];
    v27 = v43 + 3;
    v30 = v26 - 1;
    v31 = v24;
    while (1)
    {
      v32 = *(v27 - 1);
      v33 = *v27;
      v34 = *v27 - v8;
      if ((v32 - v9) * v22 + v34 * v23 < 0.0)
        break;
      v35 = sqrt((v32 - v29) * (v32 - v29) + (v33 - v28) * (v33 - v28));
      v24 = fabs(-((v32 - v9) * v23 - v34 * v22));
      if (v24 >= v21)
      {
        v25 = v25 + fmin(fmax((v21 - v31) / (v24 - v31), 0.0), 1.0) * v35;
        break;
      }
      v27 += 2;
      v25 = v35 + v25;
      v28 = v33;
      v29 = v32;
      v31 = v24;
      if (!--v30)
        goto LABEL_11;
    }
LABEL_16:

  }
  else
  {
    v25 = 0.0;
  }
  v37 = objc_loadWeakRetained((id *)p_junctionB);
  objc_msgSend(v37, "worldUnitsPerMeter");
  v39 = v38;

  if (v43)
  {
    v44 = v43;
    (*(void (**)(uint64_t, double *, uint64_t))(*(_QWORD *)v46 + 40))(v46, v43, v45 - (_QWORD)v43);
  }

  return v25 / v39;
}

- (BOOL)_findLabelAnchorPoint:(void *)a3 isShieldLabel:(BOOL)a4 desiredOffsetDistance:(float)a5 maxOffsetDistance:(float)a6 minJunctionDistance:(float)a7 roadGraph:(id)a8
{
  _BOOL4 v10;
  id v13;
  VKLabelNavRoad *v14;
  double v15;
  float v16;
  float v17;
  _BOOL4 v18;
  float v19;
  unint64_t v20;
  float v21;
  void *v22;
  float v23;
  float v24;
  float v25;
  void *v27;
  int v28;
  void *v29;
  double v30;
  float v31;
  BOOL v32;
  unint64_t v33;
  float v34;
  int v36;
  double v37;
  BOOL v38;
  float v39;
  uint64_t v40;
  unint64_t *v41;
  unint64_t v42;
  BOOL v43;
  uint64_t v44;
  VKLabelNavRoad *v45;
  VKLabelNavRoad *v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  VKLabelNavRoad *v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  uint64_t v63;
  char v64;
  double v65;
  float v67;

  v10 = a4;
  v13 = a8;
  v14 = self;
  -[VKLabelNavRoad length](v14, "length");
  v16 = v15;
  v17 = a7 + a7;
  v18 = (float)(a7 + a7) > v16 || v16 <= a5;
  v67 = a7;
  v19 = 0.0;
  if (v10)
  {
    if (v18)
    {
      v20 = 0;
      v21 = 0.0;
      v22 = v14;
      v23 = 0.0;
      v24 = v16;
      v25 = v16;
      while (v23 <= a6 && v20 <= 7)
      {
        objc_msgSend(v13, "junctionForRoad:nearJunction:crossTileEdge:", v22, 0, 0);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "isMultiRoadIntersection");
        if ((v28 & (v16 > v25)) != 0)
        {
          v19 = v21;
          v25 = v16;
        }
        if (v28)
          v21 = v24;
        objc_msgSend(v13, "nextRoadSegmentForRoad:", v22);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v29)
          goto LABEL_46;
        objc_msgSend(v29, "length");
        v31 = v30 + v24;

        v16 = v31 - v21;
        ++v20;
        v32 = v31 <= a5 || v16 < v17;
        v22 = v29;
        v23 = v24;
        v24 = v31;
        if (!v32)
          goto LABEL_40;
      }
      goto LABEL_48;
    }
  }
  else if (v18)
  {
    v33 = 0;
    v21 = 0.0;
    v22 = v14;
    v34 = 0.0;
    v24 = v16;
    v25 = v16;
    while (v34 <= a6 && v33 <= 7)
    {
      objc_msgSend(v13, "junctionForRoad:nearJunction:crossTileEdge:", v22, 0, 0);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v27, "isMultiRoadIntersection");
      if ((v36 & (v16 > v25)) != 0)
      {
        v19 = v21;
        v25 = v16;
      }
      if (v36)
        v21 = v24;
      objc_msgSend(v13, "nextRoadSegmentForRoad:", v22);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v29 || BYTE1(v14->_direction3D._e[1]) && !objc_msgSend(v29, "isOnRoute"))
      {
LABEL_46:

        goto LABEL_47;
      }
      objc_msgSend(v29, "length");
      v31 = v37 + v24;

      v16 = v31 - v21;
      ++v33;
      v38 = v31 <= a5 || v16 < v17;
      v22 = v29;
      v34 = v24;
      v24 = v31;
      if (!v38)
        goto LABEL_40;
    }
    goto LABEL_48;
  }
  v25 = v15;
  v31 = v15;
  v21 = 0.0;
  v29 = v14;
LABEL_40:
  v39 = fminf(fmaxf(v21 + v67, a5), v31 - v67);
  if (v39 != 0.0)
  {
    v40 = 200;
    if (v10)
      v40 = 208;
    v41 = (unint64_t *)((char *)v14 + v40);
    if (v39 < (float)(a5 + (float)((float)(a6 - a5) * 0.5)))
    {
      v42 = *v41 | 1;
      goto LABEL_56;
    }
LABEL_55:
    v42 = *v41 & 0xFFFFFFFFFFFFFFFELL;
LABEL_56:
    *v41 = v42;
    v45 = v14;

    v46 = v45;
    -[VKLabelNavRoad length](v46, "length");
    v22 = v46;
    if (v47 >= v39)
      goto LABEL_76;
    -[VKLabelNavRoad length](v46, "length");
    v49 = v48;
    objc_msgSend(v13, "nextRoadSegmentForRoad:", v46);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v22)
    {
LABEL_74:
      -[VKLabelNavRoad length](v46, "length");
      v39 = v65;
      v52 = v46;

      goto LABEL_75;
    }
    objc_msgSend(v22, "length");
    v39 = v39 - v49;
    if (v47 >= v39)
      goto LABEL_76;
    objc_msgSend(v22, "length");
    v51 = v50;
    objc_msgSend(v13, "nextRoadSegmentForRoad:", v22);
    v52 = (VKLabelNavRoad *)objc_claimAutoreleasedReturnValue();

    if (v52)
    {
      -[VKLabelNavRoad length](v52, "length");
      v39 = v39 - v51;
      if (v47 >= v39)
        goto LABEL_75;
      -[VKLabelNavRoad length](v52, "length");
      v54 = v53;
      objc_msgSend(v13, "nextRoadSegmentForRoad:", v52);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v22)
        goto LABEL_74;
      objc_msgSend(v22, "length");
      v39 = v39 - v54;
      if (v47 >= v39)
        goto LABEL_76;
      objc_msgSend(v22, "length");
      v56 = v55;
      objc_msgSend(v13, "nextRoadSegmentForRoad:", v22);
      v52 = (VKLabelNavRoad *)objc_claimAutoreleasedReturnValue();

      if (v52)
      {
        -[VKLabelNavRoad length](v52, "length");
        v39 = v39 - v56;
        if (v47 >= v39)
          goto LABEL_75;
        -[VKLabelNavRoad length](v52, "length");
        v58 = v57;
        objc_msgSend(v13, "nextRoadSegmentForRoad:", v52);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v22)
          goto LABEL_74;
        objc_msgSend(v22, "length");
        v39 = v39 - v58;
        if (v47 >= v39)
          goto LABEL_76;
        objc_msgSend(v22, "length");
        v60 = v59;
        objc_msgSend(v13, "nextRoadSegmentForRoad:", v22);
        v52 = (VKLabelNavRoad *)objc_claimAutoreleasedReturnValue();

        if (v52)
        {
          -[VKLabelNavRoad length](v52, "length");
          v39 = v39 - v60;
          if (v47 < v39)
          {
            -[VKLabelNavRoad length](v52, "length");
            v62 = v61;
            objc_msgSend(v13, "nextRoadSegmentForRoad:", v52);
            v22 = (void *)objc_claimAutoreleasedReturnValue();

            if (v22)
            {
              objc_msgSend(v22, "length");
              v39 = v39 - v62;
              if (v47 < v39)
              {
                objc_msgSend(v22, "length");
                objc_msgSend(v13, "nextRoadSegmentForRoad:", v22);
                v63 = objc_claimAutoreleasedReturnValue();

                v22 = (void *)v63;
                goto LABEL_74;
              }
LABEL_76:
              *(float *)&v47 = v39;
              v64 = objc_msgSend(v22, "_worldPointForRoadOffset:worldPoint:", a3, v47);

              goto LABEL_77;
            }
            goto LABEL_74;
          }
LABEL_75:
          v22 = v52;
          goto LABEL_76;
        }
      }
    }
    v22 = 0;
    goto LABEL_74;
  }
  v24 = v31;
LABEL_47:
  v22 = v29;
LABEL_48:
  if (BYTE1(v14->_direction3D._e[1]))
    v43 = 0;
  else
    v43 = v24 < 30.0;
  if (!v43)
  {
    v39 = v19 + (float)(v25 * 0.5);
    v44 = 200;
    if (v10)
      v44 = 208;
    v41 = (unint64_t *)((char *)v14 + v44);
    v29 = v22;
    goto LABEL_55;
  }
  v64 = 0;
LABEL_77:

  return v64;
}

- (void)createLabelWithNavContext:(NavContext *)a3 isShieldLabel:(BOOL)a4 desiredOffsetDistance:(float)a5 maxOffsetDistance:(float)a6 minJunctionDistance:(float)a7 minRouteDistance:(float)a8 roadGraph:(id)a9 artworkCache:(void *)a10
{
  _BOOL8 v15;
  id v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  float v24;
  double v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id WeakRetained;
  void *v30;
  id v31;
  int v32;
  id v33;
  void *v34;
  id v35;
  double *v36;
  double v37;
  double v38;
  double v39;
  id v40;
  void *v41;
  int v42;
  double v43;
  int v44;
  double v45;
  double v46;
  int v47;
  id v48;
  void *v49;
  id v50;
  double *v51;
  double v52;
  double v53;
  double v54;
  id v55;
  void *v56;
  int v57;
  double v58;
  int v59;
  double v60;
  double v61;
  float v62;
  float v63;
  id v64;
  double v65;
  int v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  char v70;
  __int128 v71;
  double v72;

  v15 = a4;
  v18 = a9;
  if (!BYTE1(self->_direction3D._e[2]))
  {
    -[VKLabelNavRoad _updateWithNavContext:](self, "_updateWithNavContext:", a3);
    -[VKLabelNavRoad labelWithType:](self, "labelWithType:", v15);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v19;
    if (v19)
    {
      objc_msgSend(v19, "desiredOffsetDistance");
      if (vabds_f32(a5, *(float *)&v20) < 0.01)
        goto LABEL_31;
    }
    if (v15)
    {
      if (!self->_cachedShieldVisibility[1])
        goto LABEL_31;
    }
    else if (!-[VKLabelNavRoad roadHasName](self, "roadHasName"))
    {
LABEL_31:

      goto LABEL_32;
    }
    if (*((_BYTE *)self->_data + 153) != 6)
    {
      v24 = a5;
      if (!BYTE1(self->_direction3D._e[1]))
      {
        WeakRetained = objc_loadWeakRetained((id *)&self->_junctionB);
        v24 = a5;
        if (WeakRetained)
        {
          v30 = WeakRetained;
          v31 = objc_loadWeakRetained((id *)&self->_junctionB);
          v32 = objc_msgSend(v31, "isOnRoute");

          v24 = a5;
          if (v32)
          {
            v33 = objc_loadWeakRetained((id *)&self->_junctionB);
            objc_msgSend(v33, "outgoingRoad");
            v34 = (void *)objc_claimAutoreleasedReturnValue();

            v24 = a5;
            if (v34)
            {
              v35 = objc_loadWeakRetained((id *)&self->_junctionB);
              v36 = (double *)objc_msgSend(v35, "mercatorCoordinate");
              v37 = *v36;
              v38 = v36[1];
              v39 = v36[2];
              v40 = objc_loadWeakRetained((id *)&self->_junctionB);
              objc_msgSend(v40, "outgoingRoad");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v41, "direction2D");
              LODWORD(v43) = v42;
              LODWORD(v45) = v44;
              *(float *)&v46 = a8;
              -[VKLabelNavRoad _findRoadOffsetForDistanceToRay:rayStart:rayVector:roadGraph:](self, "_findRoadOffsetForDistanceToRay:rayStart:rayVector:roadGraph:", v18, v46, v37, v38, v39, v43, v45);
              LODWORD(v37) = v47;

              v24 = fmaxf(*(float *)&v37, a5);
            }
            v48 = objc_loadWeakRetained((id *)&self->_junctionB);
            objc_msgSend(v48, "incomingRoad");
            v49 = (void *)objc_claimAutoreleasedReturnValue();

            if (v49)
            {
              v50 = objc_loadWeakRetained((id *)&self->_junctionB);
              v51 = (double *)objc_msgSend(v50, "mercatorCoordinate");
              v52 = *v51;
              v53 = v51[1];
              v54 = v51[2];
              v55 = objc_loadWeakRetained((id *)&self->_junctionB);
              objc_msgSend(v55, "incomingRoad");
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v56, "direction2D");
              LODWORD(v58) = v57;
              LODWORD(v60) = v59;
              *(float *)&v61 = a8;
              -[VKLabelNavRoad _findRoadOffsetForDistanceToRay:rayStart:rayVector:roadGraph:](self, "_findRoadOffsetForDistanceToRay:rayStart:rayVector:roadGraph:", v18, v61, v52, v53, v54, v58, v60);
              v63 = v62;

              v24 = fmaxf(v24, v63);
            }
          }
        }
      }
      v71 = 0uLL;
      v72 = 0.0;
      *(float *)&v20 = v24;
      *(float *)&v21 = a6;
      *(float *)&v22 = a7;
      if (-[VKLabelNavRoad _findLabelAnchorPoint:isShieldLabel:desiredOffsetDistance:maxOffsetDistance:minJunctionDistance:roadGraph:](self, "_findLabelAnchorPoint:isShieldLabel:desiredOffsetDistance:maxOffsetDistance:minJunctionDistance:roadGraph:", &v71, v15, v18, v20, v21, v22))
      {
        if (v23)
        {
          *(float *)&v25 = a5;
          objc_msgSend(v23, "setDesiredOffsetDistance:", v25);
          v26 = objc_msgSend(v23, "label");
          v27 = *(_QWORD *)v26;
          v28 = *(_QWORD *)(*(_QWORD *)v26 + 160);
          if (v28)
          {
            (*(void (**)(uint64_t, double, double, double))(*(_QWORD *)v28 + 80))(v28, *(double *)&v71, *((double *)&v71 + 1), v72);
          }
          else
          {
            *(_OWORD *)(v27 + 112) = v71;
            *(double *)(v27 + 128) = v72;
          }
          v69 = *(_QWORD *)objc_msgSend(v23, "label");
          v70 = BYTE1(self->_direction3D._e[1]);
          *(_BYTE *)(v69 + 24) = v70 ^ 1;
          *(_BYTE *)(v69 + 27) = 2 * v70;
        }
        else
        {
          v64 = -[VKLabelNavRoad _newLabelWithNavContext:isShieldLabel:worldPoint:alignment:artworkCache:](self, "_newLabelWithNavContext:isShieldLabel:worldPoint:alignment:artworkCache:", a3, v15, -[VKLabelNavRoad roadSignAlignment](self, "roadSignAlignment"), a10, v71, v72);
          *(float *)&v65 = a5;
          objc_msgSend(v64, "setDesiredOffsetDistance:", v65);
          if (v64 && LOBYTE(self->_direction3D._e[1]))
          {
            if ((nextUniqueDisplayID + 1) > 1)
              v66 = nextUniqueDisplayID + 1;
            else
              v66 = 1;
            nextUniqueDisplayID = v66;
            objc_msgSend(v64, "setDisplayID:");
          }
          v67 = 248;
          if (v15)
            v67 = 256;
          v68 = *(Class *)((char *)&self->super.isa + v67);
          *(Class *)((char *)&self->super.isa + v67) = (Class)v64;

        }
      }
    }
    goto LABEL_31;
  }
LABEL_32:

}

- (void)recreateRoadSignWithAlignment:(unsigned __int8)a3 navContext:(NavContext *)a4 artworkCache:(void *)a5
{
  uint64_t v7;
  uint64_t v9;
  double *v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  NSString *v17;
  NSString *v18;
  int v19;
  NSString *shieldGroup;

  v7 = a3;
  v9 = -[NSString label](self->_shieldGroup, "label");
  v10 = *(double **)v9;
  v11 = *(_QWORD *)(*(_QWORD *)v9 + 160);
  if (v11)
  {
    v12 = (*(double (**)(uint64_t))(*(_QWORD *)v11 + 56))(v11);
    v14 = v13;
    v16 = v15;
  }
  else
  {
    v12 = v10[14];
    v14 = v10[15];
    v16 = v10[16];
  }
  -[VKLabelNavRoad clearRoadSign](self, "clearRoadSign");
  v17 = -[VKLabelNavRoad _newLabelWithNavContext:isShieldLabel:worldPoint:alignment:artworkCache:](self, "_newLabelWithNavContext:isShieldLabel:worldPoint:alignment:artworkCache:", a4, 0, v7, a5, v12, v14, v16);
  v18 = v17;
  if (v17 && LOBYTE(self->_direction3D._e[1]))
  {
    if ((nextUniqueDisplayID + 1) > 1)
      v19 = nextUniqueDisplayID + 1;
    else
      v19 = 1;
    nextUniqueDisplayID = v19;
    -[NSString setDisplayID:](v17, "setDisplayID:");
  }
  shieldGroup = self->_shieldGroup;
  self->_shieldGroup = v18;

}

- (void)recreateRoadShieldWithNavContext:(NavContext *)a3 artworkCache:(void *)a4
{
  double **v7;
  double *v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  VKLabelNavRoadLabel *v15;
  VKLabelNavRoadLabel *v16;
  int v17;
  VKLabelNavRoadLabel *roadSign;

  v7 = -[VKLabelNavRoadLabel label](self->_roadSign, "label");
  v8 = *v7;
  v9 = *((_QWORD *)*v7 + 20);
  if (v9)
  {
    v10 = (*(double (**)(uint64_t))(*(_QWORD *)v9 + 56))(v9);
    v12 = v11;
    v14 = v13;
  }
  else
  {
    v10 = v8[14];
    v12 = v8[15];
    v14 = v8[16];
  }
  -[VKLabelNavRoad clearRoadShield](self, "clearRoadShield");
  v15 = -[VKLabelNavRoad _newLabelWithNavContext:isShieldLabel:worldPoint:alignment:artworkCache:](self, "_newLabelWithNavContext:isShieldLabel:worldPoint:alignment:artworkCache:", a3, 1, 0, a4, v10, v12, v14);
  v16 = v15;
  if (v15 && LOBYTE(self->_direction3D._e[1]))
  {
    if ((nextUniqueDisplayID + 1) > 1)
      v17 = nextUniqueDisplayID + 1;
    else
      v17 = 1;
    nextUniqueDisplayID = v17;
    -[VKLabelNavRoadLabel setDisplayID:](v15, "setDisplayID:");
  }
  roadSign = self->_roadSign;
  self->_roadSign = v16;

}

- (void)appendSimplifiedWorldRoadPoints:(void *)a3 pointElevations:(void *)a4
{
  VKLabelNavJunction *begin;
  VKLabelNavJunction *navJunctionA;
  unsigned __int8 v9;
  uint64_t v10;
  uint64_t v11;
  size_t v12;
  _QWORD *v13;
  id WeakRetained;
  double v15;
  double v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  VKLabelNavJunction *v22;
  _BYTE *v23;
  unint64_t v24;
  unint64_t v25;
  _BYTE *end;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  VKLabelNavJunction *v31;
  VKLabelNavJunction *v32;
  VKLabelNavJunction *v33;
  char *v34;
  _BYTE *v35;
  char *v36;
  Allocator *allocator;
  unint64_t v38;
  uint64_t v39;
  _DWORD *v40;
  Allocator *v41;
  shared_ptr<md::LabelTile> *p_tile;
  uint64_t *v43;
  uint64_t v44;
  __shared_weak_count **v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  VKLabelNavJunction *v58;
  VKLabelNavJunction *v59;
  char *v60;
  _OWORD *v61;
  uint64_t v62;
  _OWORD *v63;
  _OWORD *v64;
  uint64_t v65;
  unint64_t v66;
  uint64_t v67;
  uint64_t i;
  __int128 v69;
  uint64_t v70;
  uint64_t v71;
  char *v72;
  char *v73;
  char *v74;
  char *v75;
  int64_t v76;
  char *v77;
  char *v78;
  uint64_t v79;
  unint64_t v80;
  uint64_t v81;
  uint64_t v82;
  GeoCodecsConnectivityJunction **p_geoJunction;
  _OWORD *v84;
  uint64_t v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  float *v90;
  Allocator *v91;
  uint64_t v92;
  uint64_t v93;
  unint64_t v94;
  int *v95;
  uint64_t v96;
  int *v97;
  uint64_t v98;
  uint64_t v99;
  unint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  Allocator *v105;
  float *v106;
  char *v107;
  _DWORD *v108;
  uint64_t v109;
  _DWORD *v110;
  _DWORD *v111;
  int *v112;
  uint64_t v113;
  unint64_t v114;
  int *v115;
  uint64_t v116;
  uint64_t v117;
  __int128 *v118;
  _OWORD *v119;
  uint64_t v120;
  __int128 v121;
  int v122;
  int *v123;
  uint64_t v124;
  unint64_t v125;
  uint64_t v126;
  uint64_t v127;
  _OWORD *v128;
  __int128 *v129;
  uint64_t v130;
  __int128 v131;
  int v132;
  uint64_t v133;
  unint64_t v134;
  const double *v135;
  double *v136;
  uint64_t v137;
  const double *v138;
  double *v139;
  char *v140;
  char *v141;
  char *v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  _DWORD *v146;
  void *v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  float64x2x2_t v154;
  float64x2x2_t v155;

  v153 = *MEMORY[0x1E0C80C00];
  navJunctionA = self->_navJunctionA;
  begin = (VKLabelNavJunction *)self->_simplifiedPoints.__begin_;
  if (navJunctionA != begin)
    goto LABEL_45;
  v149 = 0;
  v150 = 0;
  v151 = 0;
  {
    v143 = operator new();
    mdm::Allocator::instance(void)::alloc = geo::MallocZoneAllocator::MallocZoneAllocator(v143, "VectorKitLabels", 0x5ED09DD50000000FLL);
  }
  v152 = mdm::Allocator::instance(void)::alloc;
  v146 = 0;
  v147 = 0;
  v148 = 0;
  v10 = -[VKLabelNavRoad _worldRoadPoints:elevations:](self, "_worldRoadPoints:elevations:", &v149, &v146);
  v11 = v150 - v149;
  if (v150 != v149)
  {
    if ((unint64_t)v11 <= 0x4001)
    {
      MEMORY[0x1E0C80A78](v10);
      v13 = (uint64_t *)((char *)&v144 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
      bzero(v13, v12);
      goto LABEL_7;
    }
    v13 = malloc_type_malloc(v11 >> 1, 0x100004000313F17uLL);
    if (v13)
    {
LABEL_7:
      WeakRetained = objc_loadWeakRetained((id *)&self->_junctionB);
      objc_msgSend(WeakRetained, "worldUnitsPerMeter");
      v16 = v15;

      v17 = v149;
      v18 = (v150 - v149) >> 4;
      if ((unint64_t)(v150 - v149) > 0x2F)
      {
        v145 = 1;
        *v13 = 0;
        v20 = v18 - 1;
        geo::dpSimplifyViaIndexes<gm::Matrix<double,2,1>,unsigned long>(v17, 0, v18 - 1, (uint64_t)v13, &v145, v16 * 8.0);
        v21 = v145;
        v18 = ++v145;
        v13[v21] = v20;
        if (v21 == -1)
          goto LABEL_38;
      }
      else
      {
        if (v150 != v149)
        {
          v19 = 0;
          do
          {
            v13[v19] = v19;
            ++v19;
          }
          while (v18 != v19);
        }
        v145 = v18;
        if (!v18)
          goto LABEL_38;
      }
      v22 = self->_navJunctionA;
      v23 = self->_simplifiedPoints.__begin_;
      v24 = (v23 - (_BYTE *)v22) >> 4;
      v25 = v18 - v24;
      if (v18 <= v24)
      {
        if (v18 >= v24)
        {
LABEL_31:
          allocator = self->_simplifiedPoints.__end_cap_.__value__2._allocator;
          v38 = ((char *)self->_simplifiedPointElevations.__begin_ - (char *)allocator) >> 2;
          if (v18 <= v38)
          {
            if (v18 < v38)
              self->_simplifiedPointElevations.__begin_ = (float *)((char *)allocator + 4 * v18);
            if (!v18)
              goto LABEL_38;
          }
          else
          {
            std::vector<float,geo::StdAllocator<float,mdm::Allocator>>::__append((uint64_t)&self->_simplifiedPoints.__end_cap_.__value__2, v18 - v38);
          }
          v39 = v149;
          v40 = v146;
          v41 = self->_simplifiedPoints.__end_cap_.__value__2._allocator;
          p_tile = &self->_navJunctionA->_tile;
          v43 = v13;
          do
          {
            v44 = *v43++;
            v45 = (__shared_weak_count **)(v39 + 16 * v44);
            p_tile[-1].__cntrl_ = *v45;
            p_tile->__ptr_ = (LabelTile *)v45[1];
            ++p_tile;
            *(_DWORD *)v41 = v40[v44];
            v41 = (Allocator *)((char *)v41 + 4);
            --v18;
          }
          while (v18);
LABEL_38:
          if ((unint64_t)v11 >= 0x4002)
            free(v13);
          goto LABEL_40;
        }
        v36 = (char *)v22 + 16 * v18;
      }
      else
      {
        end = self->_simplifiedPoints.__end_;
        if (v25 > (end - v23) >> 4)
        {
          if (v18 >> 60)
            abort();
          v27 = end - (_BYTE *)v22;
          v28 = v27 >> 3;
          if (v27 >> 3 <= v18)
            v28 = v18;
          if ((unint64_t)v27 >= 0x7FFFFFFFFFFFFFF0)
            v29 = 0xFFFFFFFFFFFFFFFLL;
          else
            v29 = v28;
          v30 = (*(uint64_t (**)(void *, uint64_t, uint64_t))(*(_QWORD *)self->_simplifiedPoints.__end_cap_.__value_
                                                                    + 16))(self->_simplifiedPoints.__end_cap_.__value_, 16 * v29, 8);
          v31 = self->_navJunctionA;
          v32 = (VKLabelNavJunction *)self->_simplifiedPoints.__begin_;
          v33 = (VKLabelNavJunction *)(v30 + 16 * v24);
          v34 = (char *)v33 + 16 * v25;
          if (v32 != v31)
          {
            do
            {
              *(_OWORD *)&v33[-1]._sortValue = *(_OWORD *)&v32[-1]._sortValue;
              v33 = (VKLabelNavJunction *)((char *)v33 - 16);
              v32 = (VKLabelNavJunction *)((char *)v32 - 16);
            }
            while (v32 != v31);
            v31 = self->_navJunctionA;
          }
          self->_navJunctionA = v33;
          self->_simplifiedPoints.__begin_ = v34;
          v35 = self->_simplifiedPoints.__end_;
          self->_simplifiedPoints.__end_ = (void *)(v30 + 16 * v29);
          if (v31)
          {
            (*(void (**)(void *, VKLabelNavJunction *, int64_t))(*(_QWORD *)self->_simplifiedPoints.__end_cap_.__value_
                                                                                 + 40))(self->_simplifiedPoints.__end_cap_.__value_, v31, v35 - (_BYTE *)v31);
            v18 = v145;
          }
          goto LABEL_31;
        }
        v36 = &v23[16 * v25];
      }
      self->_simplifiedPoints.__begin_ = v36;
      goto LABEL_31;
    }
  }
LABEL_40:
  if (v146)
  {
    v147 = v146;
    operator delete(v146);
  }
  if (v149)
  {
    v150 = v149;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v152 + 40))(v152, v149, v151 - v149);
  }
  navJunctionA = self->_navJunctionA;
  begin = (VKLabelNavJunction *)self->_simplifiedPoints.__begin_;
LABEL_45:
  if ((char *)begin - (char *)navJunctionA < 1)
    goto LABEL_99;
  v46 = ((char *)begin - (char *)navJunctionA) >> 4;
  v47 = *(_QWORD *)a3;
  v48 = *((_QWORD *)a3 + 1);
  v49 = v48 - *(_QWORD *)a3;
  v50 = v49 >> 4;
  v51 = *(_QWORD *)a3 + (v49 & 0xFFFFFFFFFFFFFFF0);
  v52 = *((_QWORD *)a3 + 2);
  if (v46 > (uint64_t)(v52 - v48) >> 4)
  {
    if ((unint64_t)(v50 + v46) >> 60)
      abort();
    v53 = v52 - v47;
    v54 = v53 >> 3;
    if (v53 >> 3 <= (unint64_t)(v50 + v46))
      v54 = v50 + v46;
    if ((unint64_t)v53 >= 0x7FFFFFFFFFFFFFF0)
      v55 = 0xFFFFFFFFFFFFFFFLL;
    else
      v55 = v54;
    if (v55)
      v56 = (*(uint64_t (**)(_QWORD, uint64_t, uint64_t))(**((_QWORD **)a3 + 3) + 16))(*((_QWORD *)a3 + 3), 16 * v55, 8);
    else
      v56 = 0;
    v61 = (_OWORD *)(v56 + 16 * v50);
    v62 = 16 * v46;
    v63 = &v61[v46];
    v64 = v61;
    do
    {
      if (v64)
        *v64 = *(_OWORD *)&navJunctionA->super.isa;
      ++v64;
      navJunctionA = (VKLabelNavJunction *)((char *)navJunctionA + 16);
      v62 -= 16;
    }
    while (v62);
    v65 = *(_QWORD *)a3;
    if (*(_QWORD *)a3 == v51)
    {
      v67 = v56 + 16 * v50;
    }
    else
    {
      v66 = v51;
      do
      {
        v67 = (uint64_t)(v61 - 1);
        *(v61 - 1) = *(_OWORD *)(v66 - 16);
        v66 -= 16;
        --v61;
      }
      while (v66 != v65);
    }
    for (i = *((_QWORD *)a3 + 1); v51 != i; ++v63)
    {
      v69 = *(_OWORD *)v51;
      v51 += 16;
      *v63 = v69;
    }
    v70 = *(_QWORD *)a3;
    *(_QWORD *)a3 = v67;
    *((_QWORD *)a3 + 1) = v63;
    v71 = *((_QWORD *)a3 + 2);
    *((_QWORD *)a3 + 2) = v56 + 16 * v55;
    if (v70)
      (*(void (**)(_QWORD, uint64_t, uint64_t))(**((_QWORD **)a3 + 3) + 40))(*((_QWORD *)a3 + 3), v70, v71 - v70);
    goto LABEL_99;
  }
  v57 = (uint64_t)(v48 - v51) >> 4;
  if (v57 >= v46)
  {
    v58 = (VKLabelNavJunction *)((char *)navJunctionA + 16 * v46);
    v60 = (char *)*((_QWORD *)a3 + 1);
    goto LABEL_78;
  }
  v58 = (VKLabelNavJunction *)((char *)navJunctionA + 16 * v57);
  if (v58 == begin)
  {
    v60 = (char *)*((_QWORD *)a3 + 1);
  }
  else
  {
    v59 = v58;
    v60 = (char *)*((_QWORD *)a3 + 1);
    do
    {
      if (v60)
        *(_OWORD *)v60 = *(_OWORD *)&v59->super.isa;
      v59 = (VKLabelNavJunction *)((char *)v59 + 16);
      v60 += 16;
    }
    while (v59 != begin);
  }
  *((_QWORD *)a3 + 1) = v60;
  if ((uint64_t)(v48 - v51) >= 1)
  {
LABEL_78:
    v72 = (char *)(v51 + 16 * v46);
    v73 = &v60[-16 * v46];
    v74 = v60;
    if ((unint64_t)v73 < v48)
    {
      v75 = &v60[-16 * v46];
      v74 = v60;
      do
      {
        if (v74)
          *(_OWORD *)v74 = *(_OWORD *)v75;
        v75 += 16;
        v74 += 16;
      }
      while ((unint64_t)v75 < v48);
    }
    *((_QWORD *)a3 + 1) = v74;
    if (v60 != v72)
    {
      v76 = v60 - v72;
      if ((unint64_t)(v76 - 16) < 0xD0
        || &v60[-(v76 & 0xFFFFFFFFFFFFFFF0)] < v73
        && v47 + v76 + (v49 & 0xFFFFFFFFFFFFFFF0) - (v76 & 0xFFFFFFFFFFFFFFF0) < (unint64_t)v60)
      {
        v77 = v60;
        goto LABEL_88;
      }
      v134 = ((unint64_t)(v76 - 16) >> 4) + 1;
      v77 = &v60[-16 * (v134 & 0x1FFFFFFFFFFFFFFCLL)];
      v135 = (const double *)(v73 - 32);
      v136 = (double *)(v60 - 32);
      v137 = v134 & 0x1FFFFFFFFFFFFFFCLL;
      do
      {
        v154 = vld2q_f64(v135);
        v138 = v135 - 4;
        v155 = vld2q_f64(v138);
        vst2q_f64(v136, v154);
        v139 = v136 - 4;
        vst2q_f64(v139, v155);
        v136 -= 8;
        v135 -= 8;
        v137 -= 4;
      }
      while (v137);
      if (v134 != (v134 & 0x1FFFFFFFFFFFFFFCLL))
      {
        v73 -= 16 * (v134 & 0x1FFFFFFFFFFFFFFCLL);
LABEL_88:
        v78 = v77 - 8;
        do
        {
          v79 = *((_QWORD *)v73 - 2);
          v73 -= 16;
          *((_QWORD *)v78 - 1) = v79;
          *(_QWORD *)v78 = *((_QWORD *)v73 + 1);
          v78 -= 16;
        }
        while (v73 != (char *)v51);
      }
    }
    if (v58 == navJunctionA)
      goto LABEL_99;
    v80 = (char *)v58 - (char *)navJunctionA - 16;
    if (v80 >= 0xD0
      && (v51 >= (unint64_t)&navJunctionA->_tile.__cntrl_ + (v80 & 0xFFFFFFFFFFFFFFF0)
       || (v49 & 0xFFFFFFFFFFFFFFF0) + v47 + (v80 & 0xFFFFFFFFFFFFFFF0) + 16 <= (unint64_t)navJunctionA))
    {
      v81 = (v80 >> 4) + 1;
      v82 = 16 * (v81 & 0x1FFFFFFFFFFFFFFCLL);
      v51 += v82;
      p_geoJunction = &navJunctionA->_geoJunction;
      v84 = (_OWORD *)(v47 + 16 * v50 + 32);
      v85 = v81 & 0x1FFFFFFFFFFFFFFCLL;
      do
      {
        v87 = *((_OWORD *)p_geoJunction - 2);
        v86 = *((_OWORD *)p_geoJunction - 1);
        v89 = *(_OWORD *)p_geoJunction;
        v88 = *((_OWORD *)p_geoJunction + 1);
        p_geoJunction += 8;
        *(v84 - 2) = v87;
        *(v84 - 1) = v86;
        *v84 = v89;
        v84[1] = v88;
        v84 += 4;
        v85 -= 4;
      }
      while (v85);
      if (v81 == (v81 & 0x1FFFFFFFFFFFFFFCLL))
        goto LABEL_99;
      navJunctionA = (VKLabelNavJunction *)((char *)navJunctionA + v82);
    }
    do
    {
      *(_QWORD *)v51 = navJunctionA->super.isa;
      *(_QWORD *)(v51 + 8) = navJunctionA->_tile.__ptr_;
      navJunctionA = (VKLabelNavJunction *)((char *)navJunctionA + 16);
      v51 += 16;
    }
    while (navJunctionA != v58);
  }
LABEL_99:
  if (!a4)
    return;
  v91 = self->_simplifiedPoints.__end_cap_.__value__2._allocator;
  v90 = self->_simplifiedPointElevations.__begin_;
  v92 = (char *)v90 - (char *)v91;
  if ((char *)v90 - (char *)v91 < 1)
    return;
  v93 = v92 >> 2;
  v95 = *(int **)a4;
  v94 = *((_QWORD *)a4 + 1);
  v96 = v94 - *(_QWORD *)a4;
  v97 = (int *)(*(_QWORD *)a4 + (v96 & 0xFFFFFFFFFFFFFFFCLL));
  v98 = *((_QWORD *)a4 + 2);
  if (v92 >> 2 > (uint64_t)(v98 - v94) >> 2)
  {
    v99 = v96 >> 2;
    v100 = (v96 >> 2) + v93;
    if (v100 >> 62)
      abort();
    v101 = v98 - (_QWORD)v95;
    if (v101 >> 1 > v100)
      v100 = v101 >> 1;
    if ((unint64_t)v101 >= 0x7FFFFFFFFFFFFFFCLL)
      v102 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v102 = v100;
    if (v102)
      v103 = (*(uint64_t (**)(_QWORD, uint64_t, uint64_t))(**((_QWORD **)a4 + 3) + 16))(*((_QWORD *)a4 + 3), 4 * v102, 4);
    else
      v103 = 0;
    v108 = (_DWORD *)(v103 + 4 * v99);
    v109 = 4 * v93;
    v110 = &v108[v93];
    v111 = v108;
    do
    {
      if (v111)
        *v111 = *(_DWORD *)v91;
      ++v111;
      v91 = (Allocator *)((char *)v91 + 4);
      v109 -= 4;
    }
    while (v109);
    v112 = *(int **)a4;
    if (*(int **)a4 == v97)
      goto LABEL_130;
    v113 = (uint64_t)v95 + (v96 & 0xFFFFFFFFFFFFFFFCLL);
    v114 = v113 - (_QWORD)v112 - 4;
    if (v114 >= 0x3C)
    {
      v115 = v97;
      if (v113 - ((v96 & 0xFFFFFFFFFFFFFFFCLL) + v103) >= 0x20)
      {
        v116 = (v114 >> 2) + 1;
        v115 = &v97[-(v116 & 0x7FFFFFFFFFFFFFF8)];
        v117 = 4 * v99 - 16;
        v118 = (__int128 *)((char *)v95 + v117);
        v119 = (_OWORD *)(v103 + v117);
        v120 = v116 & 0x7FFFFFFFFFFFFFF8;
        do
        {
          v121 = *v118;
          *(v119 - 1) = *(v118 - 1);
          *v119 = v121;
          v118 -= 2;
          v119 -= 2;
          v120 -= 8;
        }
        while (v120);
        v108 -= v116 & 0x7FFFFFFFFFFFFFF8;
        if (v116 == (v116 & 0x7FFFFFFFFFFFFFF8))
          goto LABEL_130;
      }
    }
    else
    {
      v115 = v97;
    }
    do
    {
      v122 = *--v115;
      *--v108 = v122;
    }
    while (v115 != v112);
LABEL_130:
    v123 = (int *)*((_QWORD *)a4 + 1);
    if (v123 != v97)
    {
      v124 = (uint64_t)v95 + (v96 & 0xFFFFFFFFFFFFFFFCLL);
      v125 = (unint64_t)v123 - v124 - 4;
      if (v125 < 0x3C)
        goto LABEL_162;
      if ((v96 & 0xFFFFFFFFFFFFFFFCLL) + v103 + v92 - v124 < 0x20)
        goto LABEL_162;
      v126 = (v125 >> 2) + 1;
      v127 = 4 * (v126 & 0x7FFFFFFFFFFFFFF8);
      v97 = (int *)((char *)v97 + v127);
      v128 = (_OWORD *)(4 * v99 + 4 * v93 + v103 + 16);
      v129 = (__int128 *)&v95[v99 + 4];
      v130 = v126 & 0x7FFFFFFFFFFFFFF8;
      do
      {
        v131 = *v129;
        *(v128 - 1) = *(v129 - 1);
        *v128 = v131;
        v128 += 2;
        v129 += 2;
        v130 -= 8;
      }
      while (v130);
      v110 = (_DWORD *)((char *)v110 + v127);
      if (v126 != (v126 & 0x7FFFFFFFFFFFFFF8))
      {
LABEL_162:
        do
        {
          v132 = *v97++;
          *v110++ = v132;
        }
        while (v97 != v123);
      }
    }
    *(_QWORD *)a4 = v108;
    *((_QWORD *)a4 + 1) = v110;
    v133 = *((_QWORD *)a4 + 2);
    *((_QWORD *)a4 + 2) = v103 + 4 * v102;
    if (v112)
      (*(void (**)(_QWORD, int *, uint64_t))(**((_QWORD **)a4 + 3) + 40))(*((_QWORD *)a4 + 3), v112, v133 - (_QWORD)v112);
    return;
  }
  v104 = (uint64_t)(v94 - (_QWORD)v97) >> 2;
  if (v104 >= v93)
  {
    v105 = (Allocator *)((char *)v91 + 4 * v93);
    v107 = (char *)*((_QWORD *)a4 + 1);
LABEL_145:
    v140 = (char *)&v97[v93];
    v141 = &v107[-4 * v93];
    v142 = v107;
    if ((unint64_t)v141 < v94)
    {
      v142 = v107;
      do
      {
        if (v142)
          *(_DWORD *)v142 = *(_DWORD *)v141;
        v141 += 4;
        v142 += 4;
      }
      while ((unint64_t)v141 < v94);
    }
    *((_QWORD *)a4 + 1) = v142;
    if (v107 != v140)
      memmove(&v107[-4 * ((v107 - v140) >> 2)], v97, v107 - v140);
    if (v105 != v91)
      memmove(v97, v91, v105 - v91);
    return;
  }
  v105 = (Allocator *)((char *)v91 + 4 * v104);
  if (v105 == (Allocator *)v90)
  {
    v107 = (char *)*((_QWORD *)a4 + 1);
  }
  else
  {
    v106 = (float *)((char *)v91 + 4 * v104);
    v107 = (char *)*((_QWORD *)a4 + 1);
    do
    {
      if (v107)
        *(float *)v107 = *v106;
      ++v106;
      v107 += 4;
    }
    while (v106 != v90);
  }
  *((_QWORD *)a4 + 1) = v107;
  if ((uint64_t)(v94 - (_QWORD)v97) >= 1)
    goto LABEL_145;
}

- (void)_worldRoadPoints:(void *)a3 elevations:(void *)a4
{
  _QWORD *v7;
  _QWORD *v8;
  unint64_t vertexIndexB;
  unint64_t labelVertexIndexA;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  float32x2_t *v23;
  float64x2_t *v24;
  float64x2_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  float64x2_t *v33;
  uint64_t v34;
  uint64_t v35;
  float64x2_t *v36;
  uint64_t v37;
  char *v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  char *v46;
  unint64_t v47;
  uint64_t v48;
  unint64_t v49;
  char *v50;
  unint64_t v51;
  char *v52;
  void **v53;
  char *v54;
  uint64_t v55;
  char *v56;
  uint64_t v57;
  void **v58;
  uint64_t v59;
  char *v60;
  unint64_t v61;
  uint64_t v62;
  __int128 *v63;
  char *v64;
  uint64_t v65;
  __int128 v66;
  int v67;
  char *v68;
  uint64_t v69;
  char *v70;
  uint64_t v71;
  char *v72;
  int64_t v73;
  uint64_t v74;
  char *v75;
  char *v76;
  unint64_t v77;
  unint64_t v78;
  unint64_t v79;
  unint64_t v80;
  unint64_t v81;
  BOOL v82;
  uint64_t v83;
  uint64_t v84;
  _OWORD *v85;
  __int128 *v86;
  uint64_t v87;
  __int128 v88;
  int v89;
  const float *v90;
  unint64_t v91;
  float32x4_t v92;
  float32x4_t *v93;
  unint64_t v94;
  uint64_t v95;
  void *v96;
  float64x2_t v97;
  int v98;
  void *__src;
  uint64_t v100;

  __src = 0;
  v100 = 0;
  v7 = geo::codec::multiSectionFeaturePointsWithElevation((_QWORD *)self->_data, 0, &__src, &v100);
  if (!v100)
    return;
  v8 = v7;
  v96 = a4;
  vertexIndexB = self->_vertexIndexB;
  labelVertexIndexA = self->_labelVertexIndexA;
  v11 = vertexIndexB >= labelVertexIndexA;
  v12 = vertexIndexB - labelVertexIndexA;
  if (v11)
    v13 = -1;
  else
    v13 = 1;
  if (v12 >= 0)
    v14 = v12;
  else
    v14 = -v12;
  v15 = v14 + 1;
  if (v14 >= (uint64_t)(*((_QWORD *)a3 + 2) - *(_QWORD *)a3) >> 4)
  {
    if (v14 >= 0xFFFFFFFFFFFFFFFLL)
      goto LABEL_112;
    v16 = *((_QWORD *)a3 + 1) - *(_QWORD *)a3;
    v17 = (*(uint64_t (**)(_QWORD, unint64_t, uint64_t))(**((_QWORD **)a3 + 3) + 16))(*((_QWORD *)a3 + 3), 16 * v15, 8);
    v19 = *(_QWORD *)a3;
    v18 = *((_QWORD *)a3 + 1);
    v20 = v17 + (v16 & 0xFFFFFFFFFFFFFFF0);
    if (v18 != *(_QWORD *)a3)
    {
      do
      {
        *(_OWORD *)(v20 - 16) = *(_OWORD *)(v18 - 16);
        v20 -= 16;
        v18 -= 16;
      }
      while (v18 != v19);
      v18 = *(_QWORD *)a3;
    }
    *(_QWORD *)a3 = v20;
    *((_QWORD *)a3 + 1) = v17 + (v16 & 0xFFFFFFFFFFFFFFF0);
    v21 = *((_QWORD *)a3 + 2);
    *((_QWORD *)a3 + 2) = v17 + 16 * v15;
    if (v18)
      (*(void (**)(_QWORD, uint64_t, uint64_t))(**((_QWORD **)a3 + 3) + 40))(*((_QWORD *)a3 + 3), v18, v21 - v18);
  }
  v95 = v14 + 1;
  v22 = 0;
  v23 = (float32x2_t *)&v8[self->_vertexIndexB];
  v24 = (float64x2_t *)*((_QWORD *)a3 + 1);
  do
  {
    v25 = vmlaq_f64(*(float64x2_t *)((char *)self->_tile.__ptr_ + 312), vcvtq_f64_f32(*v23), vsubq_f64(*(float64x2_t *)((char *)self->_tile.__ptr_ + 328), *(float64x2_t *)((char *)self->_tile.__ptr_ + 312)));
    v26 = *((_QWORD *)a3 + 2);
    if ((unint64_t)v24 >= v26)
    {
      v27 = ((uint64_t)v24 - *(_QWORD *)a3) >> 4;
      if ((unint64_t)(v27 + 1) >> 60)
        goto LABEL_112;
      v28 = v26 - *(_QWORD *)a3;
      v29 = v28 >> 3;
      if (v28 >> 3 <= (unint64_t)(v27 + 1))
        v29 = v27 + 1;
      if ((unint64_t)v28 >= 0x7FFFFFFFFFFFFFF0)
        v30 = 0xFFFFFFFFFFFFFFFLL;
      else
        v30 = v29;
      if (v30)
      {
        v97 = v25;
        v31 = 16 * v30;
        v32 = (*(uint64_t (**)(_QWORD, uint64_t, uint64_t))(**((_QWORD **)a3 + 3) + 16))(*((_QWORD *)a3 + 3), 16 * v30, 8);
        v33 = (float64x2_t *)(v32 + 16 * v27);
        v30 = v32 + v31;
        if (v32)
          *v33 = v97;
      }
      else
      {
        v33 = (float64x2_t *)(16 * v27);
      }
      v35 = *(_QWORD *)a3;
      v34 = *((_QWORD *)a3 + 1);
      v36 = v33;
      if (v34 != *(_QWORD *)a3)
      {
        do
        {
          v36[-1] = *(float64x2_t *)(v34 - 16);
          --v36;
          v34 -= 16;
        }
        while (v34 != v35);
        v34 = *(_QWORD *)a3;
      }
      v24 = v33 + 1;
      *(_QWORD *)a3 = v36;
      *((_QWORD *)a3 + 1) = v33 + 1;
      v37 = *((_QWORD *)a3 + 2);
      *((_QWORD *)a3 + 2) = v30;
      if (v34)
        (*(void (**)(_QWORD, uint64_t, uint64_t))(**((_QWORD **)a3 + 3) + 40))(*((_QWORD *)a3 + 3), v34, v37 - v34);
    }
    else
    {
      if (v24)
        *v24 = v25;
      ++v24;
    }
    *((_QWORD *)a3 + 1) = v24;
    ++v22;
    v23 += v13;
  }
  while (v22 <= v14);
  if (!v96)
    return;
  v38 = (char *)*((_QWORD *)v96 + 1);
  if (__src)
  {
    std::vector<float>::__insert_with_size[abi:nn180100]<float const*,float const*>((unint64_t *)v96, *((void **)v96 + 1), (char *)__src, (char *)__src + 4 * v95, v95);
    return;
  }
  v98 = 0;
  v39 = *(_QWORD *)v96;
  v40 = (uint64_t)&v38[-*(_QWORD *)v96];
  v41 = v40 >> 2;
  v42 = (char *)(*(_QWORD *)v96 + (v40 & 0xFFFFFFFFFFFFFFFCLL));
  v43 = *((_QWORD *)v96 + 2);
  if (v14 >= (v43 - (uint64_t)v38) >> 2)
  {
    v47 = v41 + v95;
    if (!((unint64_t)(v41 + v95) >> 62))
    {
      v48 = v43 - v39;
      if (v48 >> 1 > v47)
        v47 = v48 >> 1;
      if ((unint64_t)v48 >= 0x7FFFFFFFFFFFFFFCLL)
        v49 = 0x3FFFFFFFFFFFFFFFLL;
      else
        v49 = v47;
      if (v49)
      {
        if (v49 >> 62)
          std::__throw_bad_array_new_length[abi:nn180100]();
        v50 = (char *)operator new(4 * v49);
      }
      else
      {
        v50 = 0;
      }
      v53 = (void **)&v50[4 * v41];
      v54 = (char *)v53 + 4 * v95;
      v55 = v14 & 0x3FFFFFFFFFFFFFFFLL;
      v56 = (char *)v53;
      if ((v14 & 0x3FFFFFFFFFFFFFFFLL) >= 0x13)
      {
        if (v53 >= &__src || (v56 = (char *)v53, &v50[4 * v95 + (v40 & 0xFFFFFFFFFFFFFFFCLL)] <= (char *)&v98))
        {
          v57 = (v55 + 1) & 0x7FFFFFFFFFFFFFF8;
          v58 = v53;
          v59 = v57;
          do
          {
            *(_OWORD *)v58 = 0uLL;
            *((_OWORD *)v58 + 1) = 0uLL;
            v58 += 4;
            v59 -= 8;
          }
          while (v59);
          if (v55 + 1 == v57)
          {
LABEL_63:
            if ((char *)v39 != v38)
            {
              if ((unint64_t)(v40 - 4) >= 0x3C)
              {
                v60 = v42;
                if ((v40 & 0xFFFFFFFFFFFFFFFCLL) + v39 - (unint64_t)&v50[v40 & 0xFFFFFFFFFFFFFFFCLL] >= 0x20)
                {
                  v61 = ((unint64_t)(v40 - 4) >> 2) + 1;
                  v60 = &v42[-4 * (v61 & 0x7FFFFFFFFFFFFFF8)];
                  v62 = 4 * (v40 >> 2) - 16;
                  v63 = (__int128 *)(v39 + v62);
                  v64 = &v50[v62];
                  v65 = v61 & 0x7FFFFFFFFFFFFFF8;
                  do
                  {
                    v66 = *v63;
                    *((_OWORD *)v64 - 1) = *(v63 - 1);
                    *(_OWORD *)v64 = v66;
                    v63 -= 2;
                    v64 -= 32;
                    v65 -= 8;
                  }
                  while (v65);
                  v53 = (void **)((char *)v53 - 4 * (v61 & 0x7FFFFFFFFFFFFFF8));
                  if (v61 == (v61 & 0x7FFFFFFFFFFFFFF8))
                    goto LABEL_71;
                }
              }
              else
              {
                v60 = v42;
              }
              do
              {
                v67 = *((_DWORD *)v60 - 1);
                v60 -= 4;
                *((_DWORD *)v53 - 1) = v67;
                v53 = (void **)((char *)v53 - 4);
              }
              while (v60 != (char *)v39);
            }
LABEL_71:
            v68 = &v50[4 * v49];
            if (v38 != v42)
              memmove(v54, v42, v38 - v42);
            *(_QWORD *)v96 = v53;
            *((_QWORD *)v96 + 1) = &v54[v38 - v42];
            *((_QWORD *)v96 + 2) = v68;
            if (v39)
              operator delete((void *)v39);
            return;
          }
          v56 = (char *)v53 + 4 * v57;
        }
      }
      do
      {
        *(_DWORD *)v56 = v98;
        v56 += 4;
      }
      while (v56 != v54);
      goto LABEL_63;
    }
LABEL_112:
    abort();
  }
  v44 = (v38 - v42) >> 2;
  v45 = 4 * v95;
  if (v44 <= v14)
  {
    v46 = &v38[4 * (v95 - v44)];
    v51 = v45 - (v38 - v42) - 4;
    if (v51 >= 0x4C)
    {
      if (v38 >= (char *)&__src || &v38[(v51 & 0xFFFFFFFFFFFFFFFCLL) + 4] <= (char *)&v98)
      {
        v69 = (v51 >> 2) + 1;
        v70 = v38;
        v71 = v69 & 0x7FFFFFFFFFFFFFF8;
        do
        {
          *(_OWORD *)v70 = 0uLL;
          *((_OWORD *)v70 + 1) = 0uLL;
          v70 += 32;
          v71 -= 8;
        }
        while (v71);
        if (v69 == (v69 & 0x7FFFFFFFFFFFFFF8))
        {
LABEL_83:
          *((_QWORD *)v96 + 1) = v46;
          if (v38 == v42)
            return;
          goto LABEL_84;
        }
        v52 = &v38[4 * (v69 & 0x7FFFFFFFFFFFFFF8)];
      }
      else
      {
        v52 = v38;
      }
    }
    else
    {
      v52 = v38;
    }
    do
    {
      *(_DWORD *)v52 = v98;
      v52 += 4;
    }
    while (v52 != v46);
    goto LABEL_83;
  }
  v46 = v38;
  v44 = v14 + 1;
LABEL_84:
  v72 = &v42[v45];
  v73 = v46 - &v42[v45];
  v74 = v73 >> 2;
  v75 = &v46[-v45];
  v76 = v46;
  if (v75 < v38)
  {
    v77 = (v40 & 0xFFFFFFFFFFFFFFFCLL) + v73;
    v78 = v77 + v39;
    v79 = v77 + v39 + 4;
    if ((unint64_t)v38 > v79)
      v79 = (unint64_t)v38;
    v80 = v79 + ~v39 - v77;
    v81 = (unint64_t)&v46[-v78];
    v82 = v80 >= 0x2C && v81 > 0x1F;
    v76 = v46;
    if (!v82)
      goto LABEL_116;
    v83 = (v80 >> 2) + 1;
    v84 = 4 * (v83 & 0x7FFFFFFFFFFFFFF8);
    v75 += v84;
    v85 = v46 + 16;
    v86 = (__int128 *)(4 * v74 + 4 * v41 + v39 + 16);
    v87 = v83 & 0x7FFFFFFFFFFFFFF8;
    do
    {
      v88 = *v86;
      *(v85 - 1) = *(v86 - 1);
      *v85 = v88;
      v85 += 2;
      v86 += 2;
      v87 -= 8;
    }
    while (v87);
    v76 = &v46[v84];
    if (v83 != (v83 & 0x7FFFFFFFFFFFFFF8))
    {
LABEL_116:
      do
      {
        v89 = *(_DWORD *)v75;
        v75 += 4;
        *(_DWORD *)v76 = v89;
        v76 += 4;
      }
      while (v75 < v38);
    }
  }
  *((_QWORD *)v96 + 1) = v76;
  if (v46 != v72)
    memmove(&v46[-4 * v74], v42, v73);
  v90 = (const float *)&v98;
  if (v42 <= (char *)&v98)
  {
    if (*((_QWORD *)v96 + 1) <= (unint64_t)&v98)
      v91 = 0;
    else
      v91 = v14 + 1;
    v90 = (const float *)(&v98 + v91);
  }
  if (v44 < 0xC || v42 < (char *)v90 + 4 && (unint64_t)v90 < v39 + (v40 & 0xFFFFFFFFFFFFFFFCLL) + 4 * v44)
    goto LABEL_110;
  v42 += 4 * (v44 & 0xFFFFFFFFFFFFFFF8);
  v92 = vld1q_dup_f32(v90);
  v93 = (float32x4_t *)(v39 + 4 * v41 + 16);
  v94 = v44 & 0xFFFFFFFFFFFFFFF8;
  do
  {
    v93[-1] = v92;
    *v93 = v92;
    v93 += 2;
    v94 -= 8;
  }
  while (v94);
  if (v44 != (v44 & 0xFFFFFFFFFFFFFFF8))
  {
    v44 &= 7u;
    do
    {
LABEL_110:
      *(float *)v42 = *v90;
      v42 += 4;
      --v44;
    }
    while (v44);
  }
}

- (BOOL)_worldPointForRoadOffset:(float)a3 worldPoint:(void *)a4
{
  _QWORD *v7;
  unint64_t v8;
  _QWORD *v9;
  id WeakRetained;
  double v11;
  double v12;
  LabelTile *ptr;
  double v14;
  double v15;
  unint64_t vertexIndexB;
  float v17;
  float32x2_t v18;
  unint64_t labelVertexIndexA;
  uint64_t v20;
  double v21;
  uint64_t v22;
  uint64_t v23;
  float32x2_t v24;
  float32x2_t v25;
  float v26;
  uint64_t v27;
  float v28;
  float32x2_t *v29;
  uint64_t v30;
  float32x2_t v31;
  float32x2_t v32;
  float v33;
  float v34;
  uint64_t v36;
  unint64_t v37;

  v36 = 0;
  v37 = 0;
  v7 = geo::codec::multiSectionFeaturePointsWithElevation((_QWORD *)self->_data, 0, &v36, &v37);
  v8 = v37;
  if (v37 >= 2)
  {
    v9 = v7;
    WeakRetained = objc_loadWeakRetained((id *)&self->_junctionB);
    objc_msgSend(WeakRetained, "worldUnitsPerMeter");
    v12 = v11;
    ptr = self->_tile.__ptr_;
    v14 = *((double *)ptr + 41);
    v15 = *((double *)ptr + 39);

    vertexIndexB = self->_vertexIndexB;
    if (v36)
      v17 = *(float *)(v36 + 4 * vertexIndexB);
    else
      v17 = 0.0;
    v18 = (float32x2_t)v9[vertexIndexB];
    labelVertexIndexA = self->_labelVertexIndexA;
    v20 = vertexIndexB - labelVertexIndexA;
    if (vertexIndexB != labelVertexIndexA)
    {
      v21 = v12 * a3 / (v14 - v15);
      v22 = 1;
      if (vertexIndexB >= labelVertexIndexA)
        v22 = -1;
      if (v20 < 0)
        v20 = labelVertexIndexA - vertexIndexB;
      if ((unint64_t)v20 <= 1)
        v23 = 1;
      else
        v23 = v20;
      v24 = (float32x2_t)v9[v22 + vertexIndexB];
      v25 = vsub_f32(v24, v18);
      v26 = sqrtf(vaddv_f32(vmul_f32(v25, v25)));
      v27 = 0;
      if (v21 >= v26)
      {
        v29 = (float32x2_t *)&v9[2 * v22 + vertexIndexB];
        v30 = v23 - 1;
        while (v30 != v27)
        {
          v31 = v24;
          v28 = v26;
          v24 = *v29;
          v32 = vsub_f32(*v29, v18);
          v26 = sqrtf(vaddv_f32(vmul_f32(v32, v32)));
          v29 += v22;
          ++v27;
          if (v21 < v26)
          {
            v25 = vsub_f32(v24, v31);
            v18 = v31;
            goto LABEL_19;
          }
        }
        v18 = (float32x2_t)v9[labelVertexIndexA];
        if (v36)
          v17 = *(float *)(v36 + 4 * labelVertexIndexA);
        else
          v17 = 0.0;
      }
      else
      {
        v28 = 0.0;
LABEL_19:
        v33 = v21;
        v34 = fminf(fmaxf((float)(v33 - v28) / (float)(v26 - v28), 0.0), 1.0);
        v18 = vmla_n_f32(v18, v25, v34);
        if (v36)
          v17 = *(float *)(v36 + 4 * (vertexIndexB + v27 * v22))
              + (float)((float)(*(float *)(v36 + 4 * (vertexIndexB + v27 * v22 + v22))
                              - *(float *)(v36 + 4 * (vertexIndexB + v27 * v22)))
                      * v34);
      }
    }
    *(float64x2_t *)a4 = vmlaq_f64(*(float64x2_t *)((char *)self->_tile.__ptr_ + 312), vcvtq_f64_f32(v18), vsubq_f64(*(float64x2_t *)((char *)self->_tile.__ptr_ + 328), *(float64x2_t *)((char *)self->_tile.__ptr_ + 312)));
    *((double *)a4 + 2) = v17;
  }
  return v8 > 1;
}

- (unsigned)roadSignAlignment
{
  double v2;

  v2 = *(float *)&self->_routeOffset.index;
  if (v2 < -0.2)
    return 6;
  if (v2 <= 0.2)
    return 3;
  return 7;
}

- (id)_newLabelWithNavContext:(NavContext *)a3 isShieldLabel:(BOOL)a4 worldPoint:(Mercator3<double>)a5 alignment:(unsigned __int8)a6 artworkCache:(void *)a7
{
  uint64_t v8;
  double v9;
  _BOOL4 v10;
  BOOL *p_isRoadLabelUnique;
  uint64_t v14;
  int v15;
  id WeakRetained;
  unsigned int v17;
  uint64_t v18;
  LabelManager *var1;
  std::__shared_weak_count *v20;
  unint64_t *v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t *p_shared_owners;
  unint64_t v25;
  uint64_t v26;
  std::__shared_weak_count *v27;
  unint64_t *v28;
  unint64_t v29;
  unint64_t v30;
  _DWORD *v31;
  unint64_t v32;
  int v33;
  int v34;
  int v35;
  int v36;
  VKLabelNavRoadLabel *v37;
  std::__shared_weak_count *v38;
  int *v39;
  int v40;
  unint64_t *v41;
  unint64_t v42;
  uint64_t *data;
  unsigned __int8 v44;
  int v45;
  void *v46;
  std::string::size_type v47;
  std::__shared_weak_count *v48;
  uint64_t *v49;
  unint64_t v50;
  unint64_t v51;
  NSString *v52;
  NSString *v53;
  unsigned __int8 v59;
  unsigned __int8 v60;
  LabelManager *v61;
  double v62;
  void *v63;
  uint64_t v64;
  md::LabelImageKey *v65;
  uint64_t *v66;
  unint64_t v67;
  std::__shared_weak_count *v68;
  std::__shared_weak_count *v69;
  unint64_t *v70;
  unint64_t v71;
  VKLabelNavRoadLabel *v72;
  std::__shared_weak_count *v73;
  unint64_t *v74;
  unint64_t v75;
  unint64_t *v76;
  unint64_t v77;
  uint64_t v78;
  float *v79;
  float v80;
  _BOOL4 v81;
  float v83;
  unsigned int v84;
  float v85;
  _BOOL4 v86;
  unsigned int v88;
  uint64_t v89;
  grl *v90;
  int *v91;
  int v92;
  unsigned __int8 v93;
  int v94;
  grl *v95;
  int v96;
  int v97;
  int v98;
  unsigned int v99;
  unsigned int *v100;
  unsigned int v101;
  uint64_t v102;
  unsigned int v103;
  unsigned int *v104;
  unsigned int v105;
  uint64_t v106;
  float *v107;
  float v108;
  BOOL v109;
  unsigned int v110;
  float *v111;
  uint64_t v112;
  std::__shared_weak_count *v113;
  uint64_t v114;
  unint64_t *v115;
  unint64_t v116;
  uint64_t v117;
  uint64_t *v118;
  unint64_t v119;
  double v120;
  int v121;
  id v122;
  std::__shared_weak_count *v123;
  unint64_t *v124;
  unint64_t v125;
  unint64_t *v126;
  unint64_t v127;
  uint64_t v128;
  int v129;
  const char *v130;
  unsigned __int8 v131;
  size_t v132;
  size_t v133;
  __int128 *p_dst;
  uint64_t v135;
  uint64_t v136;
  std::__shared_weak_count *v137;
  unint64_t *v138;
  unsigned __int8 v139;
  std::__shared_count v140;
  uint64_t v141;
  unsigned __int8 v142;
  RoadSignColoring *v143;
  size_t v144;
  uint64_t v145;
  unint64_t v146;
  unint64_t v147;
  unint64_t v148;
  unsigned __int8 v149;
  void (***v150)(md::NavShieldLabelPart *__hidden);
  uint64_t v151;
  void (**v152)(md::NavShieldLabelPart *__hidden);
  uint64_t v153;
  std::__shared_weak_count *v154;
  unint64_t *v155;
  unint64_t v156;
  std::__shared_weak_count *v157;
  std::__shared_weak_count *v158;
  unint64_t *v159;
  unint64_t v160;
  std::__shared_weak_count *v161;
  unint64_t *v162;
  unint64_t v163;
  std::__shared_weak_count *v164;
  unint64_t *v165;
  unint64_t v166;
  uint64_t v167;
  char v168;
  unint64_t *v169;
  unint64_t v170;
  std::__shared_weak_count *v171;
  unint64_t *v172;
  unint64_t v173;
  uint64_t v175;
  geo::read_write_lock *v176;
  const char *v177;
  malloc_zone_t *zone;
  int v179;
  uint64_t v180;
  geo::read_write_lock *v181;
  const char *v182;
  malloc_zone_t *v183;
  int v184;
  uint64_t v185;
  geo::read_write_lock *v186;
  const char *v187;
  malloc_zone_t *v188;
  uint64_t v189;
  geo::read_write_lock *v190;
  const char *v191;
  malloc_zone_t *v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  geo::read_write_lock *v196;
  const char *v197;
  malloc_zone_t *v198;
  id v199;
  unint64_t v200;
  void *v201;
  int v202;
  double v203;
  uint64_t v204;
  double v205;
  std::__shared_count v206;
  std::string::size_type v207;
  std::__shared_weak_count *v208;
  __int128 __dst;
  __int128 v210;
  __int128 v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  __int16 v223;
  RoadSignMetrics v224;
  RoadSignColoring v225;
  std::string::size_type v226;
  std::__shared_weak_count *v227;
  uint64_t v228;
  std::__shared_weak_count *v229;
  uint64_t v230;
  std::__shared_weak_count *v231;
  double v232;
  std::string::size_type v233;
  std::__shared_weak_count *v234;
  _BYTE v235[2];
  _BYTE v236[2];
  uint64_t v237;
  double v238;
  _BYTE v239[2];
  uint64_t v240;
  std::__shared_weak_count *v241;
  std::string::size_type v242;
  std::__shared_weak_count *v243;
  md::LabelImageKey *v244;
  std::__shared_weak_count *v245;

  v8 = a6;
  v9 = a5._e[2];
  v203 = a5._e[1];
  v205 = a5._e[0];
  v10 = a4;
  p_isRoadLabelUnique = &self->_isRoadLabelUnique;
  v14 = *(_QWORD *)(*((_QWORD *)a3->var1 + 21) + 32);
  (*(void (**)(_BYTE *__return_ptr, uint64_t, BOOL *))(*(_QWORD *)v14 + 88))(v239, v14, p_isRoadLabelUnique);
  v15 = BYTE1(self->_direction3D._e[1]);
  WeakRetained = objc_loadWeakRetained((id *)&self->_junctionB);
  v17 = 2 * (objc_msgSend(WeakRetained, "depthFromRoute") == 0);
  if (v15)
    v18 = 1;
  else
    v18 = v17;
  v236[0] = 0;
  if (self->_lineType._hasValue)
  {
    v236[1] = *(&self->_lineType._hasValue + 1);
    v236[0] = 1;
  }
  v235[0] = 0;
  if (v239[0])
  {
    v235[1] = v239[1];
    v235[0] = 1;
  }
  GetLabelNavStyleAttributes(&v237, 0, v18, v236, v235);
  v235[0] = 0;
  v236[0] = 0;

  var1 = a3->var1;
  v20 = *(std::__shared_weak_count **)&v238;
  *(_QWORD *)&v224._orientation = v237;
  v224._scale = v238;
  if (v238 != 0.0)
  {
    v21 = (unint64_t *)(*(_QWORD *)&v238 + 8);
    do
      v22 = __ldxr(v21);
    while (__stxr(v22 + 1, v21));
  }
  v23 = *((_QWORD *)var1 + 42);
  md::createFeatureAttributeSet((gss::Allocator *)&v225, (uint64_t *)&v224);
  md::LabelStyleCache::styleQueryForFeatureAttributes(&v233, (uint64_t *)(v23 + 184), (uint64_t *)&v225._hasFillColor, 0);
  if (*(_QWORD *)&v225._hasFillColor)
  {
    v225._fillColor._backing._e[0] = *(double *)&v225._hasFillColor;
    (*(void (**)(_QWORD, _QWORD, _QWORD))(**(_QWORD **)&v225._fillColor._backing._e[2] + 40))(*(_QWORD *)&v225._fillColor._backing._e[2], *(_QWORD *)&v225._hasFillColor, *(_QWORD *)&v225._fillColor._backing._e[1] - *(_QWORD *)&v225._hasFillColor);
  }
  if (!v20)
    goto LABEL_17;
  p_shared_owners = (unint64_t *)&v20->__shared_owners_;
  do
    v25 = __ldaxr(p_shared_owners);
  while (__stlxr(v25 - 1, p_shared_owners));
  if (!v25)
  {
    ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
    std::__shared_weak_count::__release_weak(v20);
    if (v233)
    {
LABEL_18:
      v26 = v237;
      v27 = *(std::__shared_weak_count **)&v238;
      if (v238 != 0.0)
      {
        v28 = (unint64_t *)(*(_QWORD *)&v238 + 8);
        do
          v29 = __ldxr(v28);
        while (__stxr(v29 + 1, v28));
      }
      if (v26)
      {
        v30 = *(unsigned __int8 *)(v26 + 33);
        if (*(_BYTE *)(v26 + 33))
        {
          v31 = *(_DWORD **)v26;
          if (*v31 == 4)
          {
            v32 = 0;
LABEL_25:
            v33 = 0;
            v34 = v31[2 * v32 + 1];
            v35 = v34 & 0xFF00;
            v36 = v34;
            if (!v27)
            {
LABEL_39:
              data = (uint64_t *)self->_data;
              v44 = atomic_load((unsigned __int8 *)a3->var1 + 3392);
              v45 = v44 & 1;
              if (v10)
              {
                v232 = 0.0;
                VKLabelCopyShield(data, v45, &v232);
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                if (!v46)
                {
                  v72 = 0;

                  goto LABEL_225;
                }
                v202 = *((unsigned __int8 *)a3->var1 + 3361);
                v47 = v233;
                v48 = v234;
                *(_QWORD *)&v225._hasFillColor = v233;
                *(_QWORD *)&v225._fillColor._backing._e[0] = v234;
                if (v234)
                {
                  v49 = &v234->__shared_owners_;
                  do
                    v50 = __ldxr((unint64_t *)v49);
                  while (__stxr(v50 + 1, (unint64_t *)v49));
                  *(_QWORD *)&v224._scale = v48;
                  do
                    v51 = __ldxr((unint64_t *)v49);
                  while (__stxr(v51 + 1, (unint64_t *)v49));
                }
                else
                {
                  v224._scale = 0.0;
                }
                memset(&v224._contentScale, 0, 17);
                *(_QWORD *)&v224._orientation = v47;
                v201 = v46;
                if (v47)
                  LODWORD(v47) = (*(uint64_t (**)(std::string::size_type, double *))(*(_QWORD *)v47 + 48))(v47, &v224._contentScale);
                LOBYTE(v224._arrowLength) = v47;
                if (v48)
                {
                  v76 = (unint64_t *)&v48->__shared_owners_;
                  do
                    v77 = __ldaxr(v76);
                  while (__stlxr(v77 - 1, v76));
                  if (!v77)
                  {
                    ((void (*)(std::__shared_weak_count *))v48->__on_zero_shared)(v48);
                    std::__shared_weak_count::__release_weak(v48);
                  }
                  LODWORD(v47) = LOBYTE(v224._arrowLength);
                }
                if (!(_DWORD)v47)
                {
                  v200 = 0;
                  v83 = 1.0;
                  goto LABEL_137;
                }
                v78 = *(_QWORD *)(*(_QWORD *)&v224._orientation + 24);
                v79 = *(float **)v78;
                if (*(_QWORD *)v78)
                {
                  v80 = *v79;
                  v81 = *v79 == 1.0;
                  if (*(_BYTE *)(v78 + 10))
                  {
                    if (v80 != 0.0 && v80 != 1.0)
                    {
LABEL_95:
                      if ((gss::RenderStyle<gss::PropertyID>::hasValueForKeyAtEnd(*(_QWORD *)(*(_QWORD *)&v224._orientation + 24), 0x13Cu, 0) & 1) != 0)goto LABEL_98;
                      v84 = 1;
LABEL_97:
                      if (!gss::RenderStyle<gss::PropertyID>::hasValueForKeyAtEnd(v78, 0x13Cu, v84))
                      {
LABEL_121:
                        v99 = *(unsigned __int8 *)(v78 + 12);
                        if (v99 == 2)
                        {
                          v225._hasFillColor = 1;
                          LOBYTE(__dst) = 1;
                          v100 = (unsigned int *)gss::RenderStyle<gss::PropertyID>::styleValueForKey<unsigned int>(v78, 0x16Cu, 0, &v225);
                          gss::RenderStyle<gss::PropertyID>::styleValueForKey<unsigned int>(v78, 0x16Cu, 1u, &__dst);
                          v101 = *v100;
                        }
                        else
                        {
                          v101 = *(_DWORD *)gss::RenderStyle<gss::PropertyID>::styleValueForKey<unsigned int>(v78, 0x16Cu, v99, 0);
                        }
                        v102 = *(_QWORD *)(*(_QWORD *)&v224._orientation + 24);
                        v103 = *(unsigned __int8 *)(v102 + 12);
                        if (v103 == 2)
                        {
                          v225._hasFillColor = 1;
                          LOBYTE(__dst) = 1;
                          v104 = (unsigned int *)gss::RenderStyle<gss::PropertyID>::styleValueForKey<unsigned int>(v102, 0x174u, 0, &v225);
                          gss::RenderStyle<gss::PropertyID>::styleValueForKey<unsigned int>(v102, 0x174u, 1u, &__dst);
                          v105 = *v104;
                        }
                        else
                        {
                          v105 = *(_DWORD *)gss::RenderStyle<gss::PropertyID>::styleValueForKey<unsigned int>(*(_QWORD *)(*(_QWORD *)&v224._orientation + 24), 0x174u, v103, 0);
                        }
                        v200 = __PAIR64__(v105, v101);
                        v106 = *(_QWORD *)(*(_QWORD *)&v224._orientation + 24);
                        v107 = *(float **)v106;
                        if (*(_QWORD *)v106
                          && (v108 = *v107, LODWORD(v107) = *v107 == 1.0, *(_BYTE *)(v106 + 10))
                          && (v108 != 0.0 ? (v109 = v108 == 1.0) : (v109 = 1), !v109)
                          || (v110 = *(unsigned __int8 *)(v106 + v107 + 11), v108 = 0.0, v110 == 2))
                        {
                          v225._hasFillColor = 1;
                          LOBYTE(__dst) = 1;
                          v111 = (float *)gss::RenderStyle<gss::PropertyID>::styleValueForKey<float>(v106, 0xDAu, 0, &v225);
                          v83 = *v111
                              + (float)((float)(*(float *)gss::RenderStyle<gss::PropertyID>::styleValueForKey<float>(v106, 0xDAu, 1u, &__dst)- *v111)* v108);
                        }
                        else
                        {
                          v83 = *(float *)gss::RenderStyle<gss::PropertyID>::styleValueForKey<float>(*(_QWORD *)(*(_QWORD *)&v224._orientation + 24), 0xDAu, v110, 0);
                        }
LABEL_137:
                        v112 = *((_QWORD *)a3->var1 + 42);
                        v114 = *(_QWORD *)(v112 + 184);
                        v113 = *(std::__shared_weak_count **)(v112 + 192);
                        v230 = v114;
                        v231 = v113;
                        if (v113)
                        {
                          v115 = (unint64_t *)&v113->__shared_owners_;
                          do
                            v116 = __ldxr(v115);
                          while (__stxr(v116 + 1, v115));
                        }
                        v117 = operator new();
                        v226 = v233;
                        v227 = v234;
                        if (v234)
                        {
                          v118 = &v234->__shared_owners_;
                          do
                            v119 = __ldxr((unint64_t *)v118);
                          while (__stxr(v119 + 1, (unint64_t *)v118));
                        }
                        v120 = v232;
                        if (v33)
                          v121 = 0xFFFF;
                        else
                          v121 = v35 | v36;
                        v122 = v46;
                        v123 = v227;
                        v242 = v226;
                        v243 = v227;
                        if (v227)
                        {
                          v124 = (unint64_t *)&v227->__shared_owners_;
                          do
                            v125 = __ldxr(v124);
                          while (__stxr(v125 + 1, v124));
                        }
                        md::NavLabel::NavLabel(v117, v122, &v242, v205, v203, v9);
                        if (v123)
                        {
                          v126 = (unint64_t *)&v123->__shared_owners_;
                          do
                            v127 = __ldaxr(v126);
                          while (__stlxr(v127 - 1, v126));
                          if (!v127)
                          {
                            ((void (*)(std::__shared_weak_count *))v123->__on_zero_shared)(v123);
                            std::__shared_weak_count::__release_weak(v123);
                          }
                        }
                        *(_QWORD *)v117 = &off_1E42AFD18;
                        v199 = objc_retainAutorelease(v122);
                        v128 = objc_msgSend(v199, "UTF8String");
                        v129 = v121;
                        if (v128)
                          v130 = (const char *)v128;
                        else
                          v130 = "";
                        if ((v131 & 1) == 0
                        {
                          v175 = operator new();
                          *(_QWORD *)(v175 + 16) = 0x5ED09DD50000000FLL;
                          *(_QWORD *)(v175 + 24) = "VectorKitLabels";
                          *(_OWORD *)(v175 + 32) = xmmword_19FFB2E80;
                          *(_QWORD *)v175 = &off_1E42B5668;
                          *(_QWORD *)(v175 + 8) = "VectorKitLabels";
                          *(_OWORD *)(v175 + 72) = 0u;
                          *(_OWORD *)(v175 + 88) = 0u;
                          *(_OWORD *)(v175 + 104) = 0u;
                          *(_OWORD *)(v175 + 120) = 0u;
                          *(_OWORD *)(v175 + 136) = 0u;
                          *(_OWORD *)(v175 + 152) = 0u;
                          *(_OWORD *)(v175 + 168) = 0u;
                          *(_OWORD *)(v175 + 184) = 0u;
                          *(_OWORD *)(v175 + 200) = 0u;
                          *(_OWORD *)(v175 + 216) = 0u;
                          *(_OWORD *)(v175 + 232) = 0u;
                          *(_QWORD *)(v175 + 248) = 0;
                          *(_OWORD *)(v175 + 56) = 0u;
                          v176 = (geo::read_write_lock *)pthread_rwlock_init((pthread_rwlock_t *)(v175 + 56), 0);
                          if ((_DWORD)v176)
                            geo::read_write_lock::logFailure(v176, (uint64_t)"initialization", v177);
                          zone = malloc_create_zone(0, 0);
                          *(_QWORD *)(v175 + 48) = zone;
                          malloc_set_zone_name(zone, "VectorKitLabels");
                          *(_QWORD *)(v175 + 256) = os_log_create("com.apple.VectorKit", "Memory");
                          mdm::Allocator::instance(void)::alloc = v175;
                        }
                        *((_QWORD *)&v210 + 1) = mdm::Allocator::instance(void)::alloc;
                        v132 = strlen(v130);
                        if (v132 >= 0x7FFFFFFFFFFFFFF8)
                          abort();
                        v133 = v132;
                        if (v132 >= 0x17)
                        {
                          v135 = (v132 & 0xFFFFFFFFFFFFFFF8) + 8;
                          if ((v132 | 7) != 0x17)
                            v135 = v132 | 7;
                          v136 = v135 + 1;
                          p_dst = (__int128 *)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)mdm::Allocator::instance(void)::alloc + 16))(mdm::Allocator::instance(void)::alloc, v135 + 1, 1);
                          *((_QWORD *)&__dst + 1) = v133;
                          *(_QWORD *)&v210 = v136 | 0x8000000000000000;
                          *(_QWORD *)&__dst = p_dst;
                        }
                        else
                        {
                          BYTE7(v210) = v132;
                          p_dst = &__dst;
                          if (!v132)
                            goto LABEL_166;
                        }
                        memmove(p_dst, v130, v133);
LABEL_166:
                        *((_BYTE *)p_dst + v133) = 0;
                        *(float *)(v117 + 272) = v83;
                        v137 = (std::__shared_weak_count *)operator new(0x148uLL);
                        v137->__shared_owners_ = 0;
                        v138 = (unint64_t *)&v137->__shared_owners_;
                        v137->__shared_weak_owners_ = 0;
                        v137->__vftable = (std::__shared_weak_count_vtbl *)&off_1E42DB010;
                        v137[1].std::__shared_count = 0u;
                        *(_OWORD *)&v137[1].__shared_weak_owners_ = 0u;
                        v137[2].__shared_owners_ = 0;
                        *(double *)&v140.__vftable = v205;
                        if ((v139 & 1) == 0)
                        {
                          *(double *)&v140.__vftable = v205;
                          if (v179)
                          {
                            v180 = operator new();
                            *(_QWORD *)(v180 + 16) = 0x5ED09DD50000000FLL;
                            *(_QWORD *)(v180 + 24) = "VectorKitLabels";
                            *(_OWORD *)(v180 + 32) = xmmword_19FFB2E80;
                            *(_QWORD *)v180 = &off_1E42B5668;
                            *(_QWORD *)(v180 + 8) = "VectorKitLabels";
                            *(_OWORD *)(v180 + 72) = 0u;
                            *(_OWORD *)(v180 + 88) = 0u;
                            *(_OWORD *)(v180 + 104) = 0u;
                            *(_OWORD *)(v180 + 120) = 0u;
                            *(_OWORD *)(v180 + 136) = 0u;
                            *(_OWORD *)(v180 + 152) = 0u;
                            *(_OWORD *)(v180 + 168) = 0u;
                            *(_OWORD *)(v180 + 184) = 0u;
                            *(_OWORD *)(v180 + 200) = 0u;
                            *(_OWORD *)(v180 + 216) = 0u;
                            *(_OWORD *)(v180 + 232) = 0u;
                            *(_QWORD *)(v180 + 248) = 0;
                            *(_OWORD *)(v180 + 56) = 0u;
                            v181 = (geo::read_write_lock *)pthread_rwlock_init((pthread_rwlock_t *)(v180 + 56), 0);
                            if ((_DWORD)v181)
                              geo::read_write_lock::logFailure(v181, (uint64_t)"initialization", v182);
                            v183 = malloc_create_zone(0, 0);
                            *(_QWORD *)(v180 + 48) = v183;
                            malloc_set_zone_name(v183, "VectorKitLabels");
                            *(_QWORD *)(v180 + 256) = os_log_create("com.apple.VectorKit", "Memory");
                            mdm::Allocator::instance(void)::alloc = v180;
                            *(double *)&v140.__vftable = v205;
                          }
                        }
                        *(double *)&v140.__shared_owners_ = v203;
                        v141 = mdm::Allocator::instance(void)::alloc;
                        v137[6].__vftable = 0;
                        v137[3].__vftable = 0;
                        v137[3].__shared_owners_ = 0;
                        v137[2].__shared_weak_owners_ = v141;
                        LOWORD(v137[3].__shared_weak_owners_) = 0;
                        v137[4].__vftable = (std::__shared_weak_count_vtbl *)&v137[5].__shared_owners_;
                        v137[4].__shared_owners_ = (uint64_t)&v137[5].__shared_owners_;
                        v137[4].__shared_weak_owners_ = (uint64_t)&v137[5].__shared_owners_;
                        v137[5].__vftable = (std::__shared_weak_count_vtbl *)2;
                        LOBYTE(v137[5].__shared_weak_owners_) = 0;
                        *(_DWORD *)((char *)&v137[5].__shared_weak_owners_ + 1) = 16843008;
                        BYTE5(v137[5].__shared_weak_owners_) = 0;
                        v137[6].__shared_owners_ = 0;
                        v137[6].__shared_weak_owners_ = 0;
                        if ((v141 & 1) == 0)
                        {
                          v206 = v140;
                          v140 = v206;
                          if (v184)
                          {
                            v185 = operator new();
                            *(_QWORD *)(v185 + 16) = 0x5ED09DD50000000FLL;
                            *(_QWORD *)(v185 + 24) = "VectorKitLabels";
                            *(_OWORD *)(v185 + 32) = xmmword_19FFB2E80;
                            *(_QWORD *)v185 = &off_1E42B5668;
                            *(_QWORD *)(v185 + 8) = "VectorKitLabels";
                            *(_OWORD *)(v185 + 72) = 0u;
                            *(_OWORD *)(v185 + 88) = 0u;
                            *(_OWORD *)(v185 + 104) = 0u;
                            *(_OWORD *)(v185 + 120) = 0u;
                            *(_OWORD *)(v185 + 136) = 0u;
                            *(_OWORD *)(v185 + 152) = 0u;
                            *(_OWORD *)(v185 + 168) = 0u;
                            *(_OWORD *)(v185 + 184) = 0u;
                            *(_OWORD *)(v185 + 200) = 0u;
                            *(_OWORD *)(v185 + 216) = 0u;
                            *(_OWORD *)(v185 + 232) = 0u;
                            *(_QWORD *)(v185 + 248) = 0;
                            v204 = v185;
                            *(_OWORD *)(v185 + 56) = 0u;
                            v186 = (geo::read_write_lock *)pthread_rwlock_init((pthread_rwlock_t *)(v185 + 56), 0);
                            if ((_DWORD)v186)
                              geo::read_write_lock::logFailure(v186, (uint64_t)"initialization", v187);
                            v188 = malloc_create_zone(0, 0);
                            *(_QWORD *)(v204 + 48) = v188;
                            malloc_set_zone_name(v188, "VectorKitLabels");
                            *(_QWORD *)(v204 + 256) = os_log_create("com.apple.VectorKit", "Memory");
                            mdm::Allocator::instance(void)::alloc = v204;
                            v140 = v206;
                          }
                        }
                        v137[7].__vftable = (std::__shared_weak_count_vtbl *)mdm::Allocator::instance(void)::alloc;
                        v137[7].__shared_owners_ = 0;
                        *(uint64_t *)((char *)&v137[7].__shared_owners_ + 5) = 0;
                        *(std::__shared_weak_count_vtbl **)((char *)&v137[8].__vftable + 4) = 0;
                        BYTE4(v137[8].__shared_owners_) = 0;
                        HIDWORD(v137[8].__shared_weak_owners_) = 1065353216;
                        WORD2(v137[9].__vftable) = 0;
                        LODWORD(v137[9].__shared_owners_) = 1065353216;
                        v137[13].__shared_owners_ = 0;
                        v137[10].std::__shared_count = 0u;
                        *(_OWORD *)&v137[10].__shared_weak_owners_ = 0u;
                        *(_OWORD *)&v137[11].__shared_owners_ = 0u;
                        v137[12].__vftable = 0;
                        LOBYTE(v137[5].__shared_weak_owners_) = 1;
                        LODWORD(v137[3].__shared_owners_) = *((_DWORD *)a3->var1 + 44);
                        LOBYTE(v137[8].__vftable) = v202;
                        *(std::__shared_weak_count_vtbl **)((char *)&v137[8].__vftable + 4) = (std::__shared_weak_count_vtbl *)v200;
                        LODWORD(v137[9].__vftable) = v129;
                        v137[1].std::__shared_count = v140;
                        memset(&v225, 0, 24);
                        if ((v142 & 1) == 0
                        {
                          v189 = operator new();
                          *(_QWORD *)(v189 + 16) = 0x5ED09DD50000000FLL;
                          *(_QWORD *)(v189 + 24) = "VectorKitLabels";
                          *(_OWORD *)(v189 + 32) = xmmword_19FFB2E80;
                          *(_QWORD *)v189 = &off_1E42B5668;
                          *(_QWORD *)(v189 + 8) = "VectorKitLabels";
                          *(_OWORD *)(v189 + 72) = 0u;
                          *(_OWORD *)(v189 + 88) = 0u;
                          *(_OWORD *)(v189 + 104) = 0u;
                          *(_OWORD *)(v189 + 120) = 0u;
                          *(_OWORD *)(v189 + 136) = 0u;
                          *(_OWORD *)(v189 + 152) = 0u;
                          *(_OWORD *)(v189 + 168) = 0u;
                          *(_OWORD *)(v189 + 184) = 0u;
                          *(_OWORD *)(v189 + 200) = 0u;
                          *(_OWORD *)(v189 + 216) = 0u;
                          *(_OWORD *)(v189 + 232) = 0u;
                          *(_QWORD *)(v189 + 248) = 0;
                          *(_OWORD *)(v189 + 56) = 0u;
                          v190 = (geo::read_write_lock *)pthread_rwlock_init((pthread_rwlock_t *)(v189 + 56), 0);
                          if ((_DWORD)v190)
                            geo::read_write_lock::logFailure(v190, (uint64_t)"initialization", v191);
                          v192 = malloc_create_zone(0, 0);
                          *(_QWORD *)(v189 + 48) = v192;
                          malloc_set_zone_name(v192, "VectorKitLabels");
                          *(_QWORD *)(v189 + 256) = os_log_create("com.apple.VectorKit", "Memory");
                          mdm::Allocator::instance(void)::alloc = v189;
                        }
                        *(_QWORD *)&v225._fillColor._backing._e[2] = mdm::Allocator::instance(void)::alloc;
                        v225._fillColor._backing._e[3] = 0.0;
                        *(double *)((char *)&v225._fillColor._backing._e[3] + 5) = 0.0;
                        if (SBYTE7(v210) < 0)
                        {
                          std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>::__assign_no_alias<true>(&v225, (void *)__dst, *((size_t *)&__dst + 1));
                        }
                        else
                        {
                          *(_OWORD *)&v225._hasFillColor = __dst;
                          *(_QWORD *)&v225._fillColor._backing._e[1] = v210;
                        }
                        v225._fillColor._backing._e[3] = v120;
                        BYTE4(v225._gradientFillColors.__elems_[0]._backing._e[0]) = 1;
                        if (SHIBYTE(v137[6].__shared_weak_owners_) < 0)
                        {
                          if (v225._fillColor._backing._e[1] >= 0.0)
                            v143 = &v225;
                          else
                            v143 = *(RoadSignColoring **)&v225._hasFillColor;
                          if (v225._fillColor._backing._e[1] >= 0.0)
                            v144 = HIBYTE(v225._fillColor._backing._e[1]);
                          else
                            v144 = *(_QWORD *)&v225._fillColor._backing._e[0];
                          std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>::__assign_no_alias<false>((void **)&v137[6].__vftable, v143, v144);
                        }
                        else if ((HIBYTE(v225._fillColor._backing._e[1]) & 0x80) != 0)
                        {
                          std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>::__assign_no_alias<true>(&v137[6], *(void **)&v225._hasFillColor, *(size_t *)&v225._fillColor._backing._e[0]);
                        }
                        else
                        {
                          v137[6].std::__shared_count = *(std::__shared_count *)&v225._hasFillColor;
                          v137[6].__shared_weak_owners_ = *(_QWORD *)&v225._fillColor._backing._e[1];
                        }
                        v137[7].__shared_owners_ = *(_QWORD *)&v225._fillColor._backing._e[3];
                        LODWORD(v137[7].__shared_weak_owners_) = LODWORD(v225._gradientFillColors.__elems_[0]._backing._e[0]);
                        BYTE4(v137[7].__shared_weak_owners_) = BYTE4(v225._gradientFillColors.__elems_[0]._backing._e[0]);
                        v145 = *((_QWORD *)a3->var1 + 33);
                        v244 = (md::LabelImageKey *)&v137[1];
                        v245 = v137;
                        do
                          v146 = __ldxr(v138);
                        while (__stxr(v146 + 1, v138));
                        md::LabelImageLoader::loadImage(&v240, v145, &v244);
                        do
                          v147 = __ldaxr(v138);
                        while (__stlxr(v147 - 1, v138));
                        if (v147)
                        {
                          if ((SHIBYTE(v225._fillColor._backing._e[1]) & 0x80000000) == 0)
                            goto LABEL_192;
                        }
                        else
                        {
                          ((void (*)(std::__shared_weak_count *))v137->__on_zero_shared)(v137);
                          std::__shared_weak_count::__release_weak(v137);
                          if ((SHIBYTE(v225._fillColor._backing._e[1]) & 0x80000000) == 0)
                            goto LABEL_192;
                        }
                        (*(void (**)(_QWORD, _QWORD, uint64_t))(**(_QWORD **)&v225._fillColor._backing._e[2]
                                                                        + 40))(*(_QWORD *)&v225._fillColor._backing._e[2], *(_QWORD *)&v225._hasFillColor, *(_QWORD *)&v225._fillColor._backing._e[1] & 0x7FFFFFFFFFFFFFFFLL);
                        do
LABEL_192:
                          v148 = __ldaxr(v138);
                        while (__stlxr(v148 - 1, v138));
                        if (v148)
                        {
                          if (!v240)
                            goto LABEL_201;
                        }
                        else
                        {
                          ((void (*)(std::__shared_weak_count *))v137->__on_zero_shared)(v137);
                          std::__shared_weak_count::__release_weak(v137);
                          if (!v240)
                            goto LABEL_201;
                        }
                        if ((v149 & 1) == 0
                        {
                          v195 = operator new();
                          *(_QWORD *)(v195 + 16) = 0x5ED09DD50000000FLL;
                          *(_QWORD *)(v195 + 24) = "VectorKitLabels";
                          *(_OWORD *)(v195 + 32) = xmmword_19FFB2E80;
                          *(_QWORD *)v195 = &off_1E42B5668;
                          *(_QWORD *)(v195 + 8) = "VectorKitLabels";
                          *(_OWORD *)(v195 + 72) = 0u;
                          *(_OWORD *)(v195 + 88) = 0u;
                          *(_OWORD *)(v195 + 104) = 0u;
                          *(_OWORD *)(v195 + 120) = 0u;
                          *(_OWORD *)(v195 + 136) = 0u;
                          *(_OWORD *)(v195 + 152) = 0u;
                          *(_OWORD *)(v195 + 168) = 0u;
                          *(_OWORD *)(v195 + 184) = 0u;
                          *(_OWORD *)(v195 + 200) = 0u;
                          *(_OWORD *)(v195 + 216) = 0u;
                          *(_OWORD *)(v195 + 232) = 0u;
                          *(_QWORD *)(v195 + 248) = 0;
                          *(_OWORD *)(v195 + 56) = 0u;
                          v196 = (geo::read_write_lock *)pthread_rwlock_init((pthread_rwlock_t *)(v195 + 56), 0);
                          if ((_DWORD)v196)
                            geo::read_write_lock::logFailure(v196, (uint64_t)"initialization", v197);
                          v198 = malloc_create_zone(0, 0);
                          *(_QWORD *)(v195 + 48) = v198;
                          malloc_set_zone_name(v198, "VectorKitLabels");
                          *(_QWORD *)(v195 + 256) = os_log_create("com.apple.VectorKit", "Memory");
                          mdm::Allocator::instance(void)::alloc = v195;
                        }
                        v150 = (void (***)(md::NavShieldLabelPart *__hidden))(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)mdm::Allocator::instance(void)::alloc + 16))(mdm::Allocator::instance(void)::alloc, 848, 8);
                        md::IconLabelPart::IconLabelPart((uint64_t)v150, &v240);
                        *(_BYTE *)(v151 + 766) = 9;
                        *(_BYTE *)(v151 + 768) = 0;
                        *(_OWORD *)(v151 + 816) = 0u;
                        *(_OWORD *)(v151 + 832) = 0u;
                        *(_OWORD *)(v151 + 776) = 0u;
                        *(_OWORD *)(v151 + 792) = 0u;
                        *(_BYTE *)(v151 + 808) = 0;
                        *(_BYTE *)(v151 + 557) = 3;
                        *(_BYTE *)(v151 + 656) = 3;
                        *(_BYTE *)(v151 + 664) = 0;
                        v152 = off_1E4295208;
                        *(_QWORD *)v151 = off_1E4295208;
                        v153 = *(_QWORD *)(v117 + 288);
                        *(_QWORD *)(v117 + 288) = v150;
                        if (v153)
                        {
                          (*(void (**)(uint64_t))(*(_QWORD *)v153 + 8))(v153);
                          v152 = *v150;
                        }
                        ((void (*)(void (***)(md::NavShieldLabelPart *__hidden), uint64_t))v152[3])(v150, v117 + 176);
LABEL_201:
                        v154 = v241;
                        if (v241)
                        {
                          v155 = (unint64_t *)&v241->__shared_owners_;
                          do
                            v156 = __ldaxr(v155);
                          while (__stlxr(v156 - 1, v155));
                          if (!v156)
                          {
                            ((void (*)(std::__shared_weak_count *))v154->__on_zero_shared)(v154);
                            std::__shared_weak_count::__release_weak(v154);
                          }
                        }
                        if (SBYTE7(v210) < 0)
                          (*(void (**)(_QWORD, _QWORD, uint64_t))(**((_QWORD **)&v210 + 1) + 40))(*((_QWORD *)&v210 + 1), __dst, v210 & 0x7FFFFFFFFFFFFFFFLL);

                        v228 = v117;
                        v157 = (std::__shared_weak_count *)operator new();
                        v157->__vftable = (std::__shared_weak_count_vtbl *)&off_1E42E7480;
                        v157->__shared_owners_ = 0;
                        v157->__shared_weak_owners_ = 0;
                        v157[1].__vftable = (std::__shared_weak_count_vtbl *)v117;
                        v229 = v157;
                        v158 = v227;
                        if (v227)
                        {
                          v159 = (unint64_t *)&v227->__shared_owners_;
                          do
                            v160 = __ldaxr(v159);
                          while (__stlxr(v160 - 1, v159));
                          if (!v160)
                          {
                            ((void (*)(std::__shared_weak_count *))v158->__on_zero_shared)(v158);
                            std::__shared_weak_count::__release_weak(v158);
                          }
                        }
                        v72 = -[VKLabelNavRoadLabel initWithNavFeature:label:navLabelType:]([VKLabelNavRoadLabel alloc], "initWithNavFeature:label:navLabelType:", self, &v228, 2);
                        v161 = v229;
                        if (v229)
                        {
                          v162 = (unint64_t *)&v229->__shared_owners_;
                          do
                            v163 = __ldaxr(v162);
                          while (__stlxr(v163 - 1, v162));
                          if (!v163)
                          {
                            ((void (*)(std::__shared_weak_count *))v161->__on_zero_shared)(v161);
                            std::__shared_weak_count::__release_weak(v161);
                          }
                        }
                        v164 = v231;
                        if (v231)
                        {
                          v165 = (unint64_t *)&v231->__shared_owners_;
                          do
                            v166 = __ldaxr(v165);
                          while (__stlxr(v166 - 1, v165));
                          if (!v166)
                          {
                            ((void (*)(std::__shared_weak_count *))v164->__on_zero_shared)(v164);
                            std::__shared_weak_count::__release_weak(v164);
                          }
                        }
                        gss::QueryableLocker<gss::PropertyID>::~QueryableLocker((uint64_t)&v224);

                        if (v72)
                          goto LABEL_224;
                        goto LABEL_225;
                      }
LABEL_98:
                      if (v79)
                      {
                        v85 = *v79;
                        v86 = *v79 == 1.0;
                        if (*(_BYTE *)(v78 + 10))
                        {
                          if (v85 != 0.0 && v85 != 1.0)
                            goto LABEL_108;
                        }
                      }
                      else
                      {
                        v86 = 0;
                      }
                      v88 = *(unsigned __int8 *)(v78 + v86 + 11);
                      v85 = 0.0;
                      if (v88 != 2)
                      {
                        v90 = (grl *)gss::RenderStyle<gss::PropertyID>::styleValueForKey<unsigned int>(v78, 0x13Cu, v88, 0);
                        v92 = *(_DWORD *)v90;
LABEL_113:
                        v93 = v92 - 1;
                        if (v93 > 8u)
                          v94 = 0;
                        else
                          v94 = dword_19FFB8A88[v93];
                        v95 = (grl *)grl::SizeGroupMin(v90);
                        v96 = (int)v95;
                        v97 = grl::SizeGroupMax(v95);
                        v98 = v94 + v202;
                        if (v94 + v202 >= v97)
                          v98 = v97;
                        if (v98 <= v96)
                          LOBYTE(v98) = v96;
                        LOBYTE(v202) = v98;
                        v78 = *(_QWORD *)(*(_QWORD *)&v224._orientation + 24);
                        goto LABEL_121;
                      }
LABEL_108:
                      v225._hasFillColor = 1;
                      LOBYTE(__dst) = 1;
                      v89 = gss::RenderStyle<gss::PropertyID>::styleValueForKey<unsigned int>(v78, 0x13Cu, 0, &v225);
                      v90 = (grl *)gss::RenderStyle<gss::PropertyID>::styleValueForKey<unsigned int>(v78, 0x13Cu, 1u, &__dst);
                      if (v85 >= 1.0)
                        v91 = (int *)v90;
                      else
                        v91 = (int *)v89;
                      v92 = *v91;
                      goto LABEL_113;
                    }
                  }
                }
                else
                {
                  v81 = 0;
                }
                v84 = *(unsigned __int8 *)(v78 + v81 + 11);
                if (v84 != 2)
                  goto LABEL_97;
                goto LABEL_95;
              }
              VKLabelCopyText(data, v45);
              v52 = (NSString *)objc_claimAutoreleasedReturnValue();
              v53 = v52;
              if (!v52 || !-[NSString length](v52, "length"))
              {
                v72 = 0;
                goto LABEL_91;
              }
              __asm { FMOV            V0.2D, #1.0 }
              *(_OWORD *)v225._fillColor._backing._e = _Q0;
              *(_OWORD *)&v225._fillColor._backing._e[2] = _Q0;
              *(_QWORD *)&v225._hasFillColor = 0x1010000000001;
              memset(&v225._shadowColor, 0, 24);
              v225._shadowColor._backing._e[3] = 0.200000003;
              memset(&v225._textColor, 0, 24);
              v225._gradientFillAngle = 0.0;
              v225._textColor._backing._e[3] = 1.0;
              v224._orientation = 0;
              *(_OWORD *)&v224._scale = _Q0;
              *(_OWORD *)&v224._arrowWeight = xmmword_19FFB4FB0;
              v224._arrowTipCornerRadius = 0.0;
              v224._arrowJoinCornerRadius = 0.0;
              v224._shadowOffset = (CGSize)*MEMORY[0x1E0C9D820];
              v224._strokeWeight = 0.0;
              v224._innerStrokeWeight = 0.0;
              v224._shadowRadius = 20.0;
              *(_OWORD *)&v224._signHeight = xmmword_19FFB4FC0;
              v224._horizontalMargin = 0.0;
              v224._verticalMargin = 0.0;
              v224._glyphSize = v224._shadowOffset;
              v224._cornerRadius = 6.5;
              v224._glyphVerticalOffset = 0.0;
              __asm { FMOV            V1.2D, #6.0 }
              __dst = _Q0;
              v210 = _Q1;
              v211 = xmmword_19FFB5930;
              v212 = 0x4031000000000000;
              v213 = 0;
              v214 = 0;
              v215 = 0;
              {
                v193 = operator new();
                mdm::Allocator::instance(void)::alloc = geo::MallocZoneAllocator::MallocZoneAllocator(v193, "VectorKitLabels", 0x5ED09DD50000000FLL);
              }
              v216 = mdm::Allocator::instance(void)::alloc;
              v217 = 0;
              v218 = 0;
              v219 = 0;
              {
                v194 = operator new();
                mdm::Allocator::instance(void)::alloc = geo::MallocZoneAllocator::MallocZoneAllocator(v194, "VectorKitLabels", 0x5ED09DD50000000FLL);
              }
              v221 = 0;
              v222 = 0;
              v220 = mdm::Allocator::instance(void)::alloc;
              v223 = 1;
              v224._orientation = v8;
              v61 = a3->var1;
              v62 = *((float *)v61 + 44);
              v224._scale = *(float *)(*((_QWORD *)v61 + 42) + 172);
              v224._contentScale = v62;
              *(double *)&__dst = v224._scale;
              *((double *)&__dst + 1) = v62;
              v244 = 0;
              v245 = 0;
              v242 = 0;
              v243 = 0;
              if (GetRoadSignMetadataForStyleQuery(v233, v234, &v242, (uint64_t)&v225, (uint64_t)&v224, (uint64_t)&__dst))
              {
                VKLabelNavArtworkCache::getRoadSignArtwork((VKLabelNavArtworkCache *)a7, v53, &v224, &v225, (const md::RoadSignTextMetrics *)&__dst);
                v63 = (void *)objc_claimAutoreleasedReturnValue();
                if (v63)
                {
                  v64 = operator new();
                  v65 = (md::LabelImageKey *)v64;
                  v207 = v233;
                  v208 = v234;
                  if (v234)
                  {
                    v66 = &v234->__shared_owners_;
                    do
                      v67 = __ldxr((unint64_t *)v66);
                    while (__stxr(v67 + 1, (unint64_t *)v66));
                  }
                  md::NavRoadSign::NavRoadSign(v64, v53, (uint64_t *)&v207, v63, v205, v203, v9);
                  v244 = v65;
                  v68 = (std::__shared_weak_count *)operator new();
                  v68->__vftable = (std::__shared_weak_count_vtbl *)&off_1E42E6B50;
                  v68->__shared_owners_ = 0;
                  v68->__shared_weak_owners_ = 0;
                  v68[1].__vftable = (std::__shared_weak_count_vtbl *)v65;
                  v245 = v68;
                  v69 = v208;
                  if (v208)
                  {
                    v70 = (unint64_t *)&v208->__shared_owners_;
                    do
                      v71 = __ldaxr(v70);
                    while (__stlxr(v71 - 1, v70));
                    if (!v71)
                    {
                      ((void (*)(std::__shared_weak_count *))v69->__on_zero_shared)(v69);
                      std::__shared_weak_count::__release_weak(v69);
                    }
                  }
                  v72 = -[VKLabelNavRoadLabel initWithNavFeature:label:navLabelType:]([VKLabelNavRoadLabel alloc], "initWithNavFeature:label:navLabelType:", self, &v244, 1);
                  -[VKLabelNavRoadLabel setAlignment:](v72, "setAlignment:", v8);
                  v73 = v245;
                  if (v245)
                  {
                    v74 = (unint64_t *)&v245->__shared_owners_;
                    do
                      v75 = __ldaxr(v74);
                    while (__stlxr(v75 - 1, v74));
                    if (!v75)
                    {
                      ((void (*)(std::__shared_weak_count *))v73->__on_zero_shared)(v73);
                      std::__shared_weak_count::__release_weak(v73);
                    }
                  }
                }
                else
                {
                  v72 = 0;
                }

                if ((SHIBYTE(v219) & 0x80000000) == 0)
                  goto LABEL_89;
              }
              else
              {
                v72 = 0;
                if ((SHIBYTE(v219) & 0x80000000) == 0)
                  goto LABEL_89;
              }
              (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v220 + 40))(v220, v217, v219 & 0x7FFFFFFFFFFFFFFFLL);
LABEL_89:
              if (SHIBYTE(v215) < 0)
                (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v216 + 40))(v216, v213, v215 & 0x7FFFFFFFFFFFFFFFLL);
LABEL_91:

              if (v72)
              {
LABEL_224:
                v167 = *(_QWORD *)-[VKLabelNavRoadLabel label](v72, "label");
                v168 = BYTE1(self->_direction3D._e[1]);
                *(_BYTE *)(v167 + 24) = v168 ^ 1;
                *(_BYTE *)(v167 + 27) = 2 * v168;
              }
LABEL_225:
              -[VKLabelNavRoad _updateWithNavContext:](self, "_updateWithNavContext:", a3);
              v37 = v72;

              v38 = v234;
              if (!v234)
                goto LABEL_230;
              goto LABEL_226;
            }
LABEL_35:
            v41 = (unint64_t *)&v27->__shared_owners_;
            do
              v42 = __ldaxr(v41);
            while (__stlxr(v42 - 1, v41));
            if (!v42)
            {
              ((void (*)(std::__shared_weak_count *))v27->__on_zero_shared)(v27);
              std::__shared_weak_count::__release_weak(v27);
            }
            goto LABEL_39;
          }
          v32 = 0;
          v39 = v31 + 2;
          while (v30 - 1 != v32)
          {
            v40 = *v39;
            v39 += 2;
            ++v32;
            if (v40 == 4)
            {
              if (v32 < v30)
                goto LABEL_25;
              break;
            }
          }
        }
      }
      v36 = 0;
      v35 = 0;
      v33 = 1;
      if (!v27)
        goto LABEL_39;
      goto LABEL_35;
    }
  }
  else
  {
LABEL_17:
    if (v233)
      goto LABEL_18;
  }
  v37 = 0;
  v38 = v234;
  if (!v234)
    goto LABEL_230;
LABEL_226:
  v169 = (unint64_t *)&v38->__shared_owners_;
  do
    v170 = __ldaxr(v169);
  while (__stlxr(v170 - 1, v169));
  if (!v170)
  {
    ((void (*)(std::__shared_weak_count *))v38->__on_zero_shared)(v38);
    std::__shared_weak_count::__release_weak(v38);
  }
LABEL_230:
  v171 = *(std::__shared_weak_count **)&v238;
  if (v238 != 0.0)
  {
    v172 = (unint64_t *)(*(_QWORD *)&v238 + 8);
    do
      v173 = __ldaxr(v172);
    while (__stlxr(v173 - 1, v172));
    if (!v173)
    {
      ((void (*)(std::__shared_weak_count *))v171->__on_zero_shared)(v171);
      std::__shared_weak_count::__release_weak(v171);
    }
  }
  return v37;
}

- (double)length
{
  double result;
  _QWORD *v4;
  int8x16_t v5;
  unint64_t vertexIndexB;
  unint64_t labelVertexIndexA;
  unint64_t v8;
  double v9;
  unint64_t v10;
  float32x2_t v11;
  unint64_t v12;
  int8x16_t v13;
  _OWORD *v14;
  float64x2_t v15;
  unint64_t v16;
  float64x2_t v17;
  float64x2_t v18;
  float64x2_t v19;
  const float *v20;
  int8x16_t v21;
  int32x4_t v22;
  float32x4_t v23;
  float32x4_t v24;
  float32x4_t v25;
  float32x4_t v26;
  float32x4_t v27;
  float32x4_t v28;
  float32x4_t v29;
  unint64_t v30;
  float32x2_t *v31;
  float32x2_t v32;
  float32x2_t v33;
  LabelTile *ptr;
  double v35;
  double v36;
  id WeakRetained;
  double v38;
  unint64_t v39;
  float32x4x2_t v40;

  result = *(double *)&self->_intraRoadPriorityForShieldLabel;
  if (result == 0.0)
  {
    v39 = 0;
    v4 = geo::codec::multiSectionFeaturePoints((_QWORD *)self->_data, 0, &v39);
    if (v39 > 1)
    {
      vertexIndexB = self->_vertexIndexB;
      labelVertexIndexA = self->_labelVertexIndexA;
      if (vertexIndexB <= labelVertexIndexA)
        v8 = self->_labelVertexIndexA;
      else
        v8 = self->_vertexIndexB;
      if (vertexIndexB >= labelVertexIndexA)
        vertexIndexB = self->_labelVertexIndexA;
      v9 = 0.0;
      v10 = v8 - vertexIndexB;
      if (v8 <= vertexIndexB)
        goto LABEL_16;
      v11 = (float32x2_t)v4[vertexIndexB];
      if (v10 > 7)
      {
        v12 = v10 & 0xFFFFFFFFFFFFFFF8;
        v5.i64[1] = v4[vertexIndexB];
        v13 = (int8x16_t)vdupq_lane_s32((int32x2_t)v11, 0);
        v14 = &v4[vertexIndexB + 5];
        v15 = 0uLL;
        v16 = v10 & 0xFFFFFFFFFFFFFFF8;
        v17 = 0uLL;
        v18 = 0uLL;
        v19 = 0uLL;
        do
        {
          v20 = (const float *)(v14 - 2);
          v40 = vld2q_f32(v20);
          v22 = *(int32x4_t *)v14;
          v21 = *((int8x16_t *)v14 + 1);
          v14 += 4;
          v23 = (float32x4_t)vuzp1q_s32(v22, (int32x4_t)v21);
          v24 = (float32x4_t)vuzp2q_s32(v22, (int32x4_t)v21);
          v25 = vsubq_f32(v40.val[0], (float32x4_t)vextq_s8(v13, (int8x16_t)v40.val[0], 0xCuLL));
          v26 = vsubq_f32(v23, (float32x4_t)vextq_s8((int8x16_t)v40.val[0], (int8x16_t)v23, 0xCuLL));
          v27 = vsubq_f32(v40.val[1], (float32x4_t)vextq_s8(v5, (int8x16_t)v40.val[1], 0xCuLL));
          v40.val[0] = vsubq_f32(v24, (float32x4_t)vextq_s8((int8x16_t)v40.val[1], (int8x16_t)v24, 0xCuLL));
          v28 = vsqrtq_f32(vmlaq_f32(vmulq_f32(v25, v25), v27, v27));
          v29 = vsqrtq_f32(vmlaq_f32(vmulq_f32(v26, v26), v40.val[0], v40.val[0]));
          v17 = vaddq_f64(v17, vcvt_hight_f64_f32(v28));
          v15 = vaddq_f64(v15, vcvtq_f64_f32(*(float32x2_t *)v28.f32));
          v19 = vaddq_f64(v19, vcvt_hight_f64_f32(v29));
          v18 = vaddq_f64(v18, vcvtq_f64_f32(*(float32x2_t *)v29.f32));
          v5 = (int8x16_t)v24;
          v13 = (int8x16_t)v23;
          v16 -= 8;
        }
        while (v16);
        v9 = vaddvq_f64(vaddq_f64(vaddq_f64(v18, v15), vaddq_f64(v19, v17)));
        if (v10 == v12)
          goto LABEL_16;
        vertexIndexB += v12;
        v11 = (float32x2_t)vextq_s8(v21, v21, 8uLL).u64[0];
      }
      v30 = v8 - vertexIndexB;
      v31 = (float32x2_t *)&v4[vertexIndexB + 1];
      do
      {
        v32 = *v31++;
        v33 = vsub_f32(v32, v11);
        v9 = v9 + sqrtf(vaddv_f32(vmul_f32(v33, v33)));
        v11 = v32;
        --v30;
      }
      while (v30);
LABEL_16:
      ptr = self->_tile.__ptr_;
      v35 = *((double *)ptr + 41);
      v36 = *((double *)ptr + 39);
      WeakRetained = objc_loadWeakRetained((id *)&self->_junctionB);
      objc_msgSend(WeakRetained, "worldUnitsPerMeter");
      *(double *)&self->_intraRoadPriorityForShieldLabel = (v35 - v36) * v9 / v38;

      return *(double *)&self->_intraRoadPriorityForShieldLabel;
    }
    return 0.0;
  }
  return result;
}

- (BOOL)isEtaFeature
{
  return 0;
}

- (BOOL)isTrafficCameraFeature
{
  return 0;
}

- (BOOL)roadHasName
{
  return *((_BYTE *)self->_data + 73) != 0;
}

- (BOOL)isValid
{
  id WeakRetained;
  BOOL v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_junctionB);
  v3 = WeakRetained != 0;

  return v3;
}

- (Matrix<float,)direction3D
{
  float v2;
  float v3;
  float v4;
  Matrix<float, 3, 1> result;

  v2 = self->_direction2D._e[0];
  v3 = self->_direction2D._e[1];
  v4 = self->_direction3D._e[0];
  result._e[2] = v4;
  result._e[1] = v3;
  result._e[0] = v2;
  return result;
}

- (Matrix<float,)direction2D
{
  float v2;
  float v3;
  Matrix<float, 2, 1> result;

  v2 = *(float *)&self->_simplifiedPointElevations.__end_cap_.__value__2._allocator;
  v3 = *((float *)&self->_simplifiedPointElevations.__end_cap_.__value__2._allocator + 1);
  result._e[1] = v3;
  result._e[0] = v2;
  return result;
}

- (NSString)name
{
  return *(NSString **)&self->_length;
}

- (BOOL)isOnRoute
{
  return BYTE1(self->_direction3D._e[1]);
}

- (void)setIsOnRoute:(BOOL)a3
{
  BYTE1(self->_direction3D._e[1]) = a3;
}

- (BOOL)isStartOfRoadName
{
  return BYTE2(self->_direction3D._e[1]);
}

- (void)setIsStartOfRoadName:(BOOL)a3
{
  BYTE2(self->_direction3D._e[1]) = a3;
}

- (BOOL)isInGuidance
{
  return HIBYTE(self->_direction3D._e[1]);
}

- (void)setIsInGuidance:(BOOL)a3
{
  HIBYTE(self->_direction3D._e[1]) = a3;
}

- (BOOL)isGuidanceStepStart
{
  return LOBYTE(self->_direction3D._e[2]);
}

- (void)setIsGuidanceStepStart:(BOOL)a3
{
  LOBYTE(self->_direction3D._e[2]) = a3;
}

- (float)routeCrossProduct
{
  return *(float *)&self->_routeOffset.index;
}

- (void)setRouteCrossProduct:(float)a3
{
  *(float *)&self->_routeOffset.index = a3;
}

- (PolylineCoordinate)routeOffset
{
  return *(PolylineCoordinate *)&self->_isRoadLabelUnique;
}

- (void)setRouteOffset:(PolylineCoordinate)a3
{
  *(PolylineCoordinate *)&self->_isRoadLabelUnique = a3;
}

- (GeoCodecsConnectivityJunction)junctionB
{
  return self->_junctionA;
}

- (int64_t)intraRoadPriorityForRoadLabel
{
  return *(_QWORD *)&self->_routeOffset.offset;
}

- (void)setIntraRoadPriorityForRoadLabel:(int64_t)a3
{
  *(_QWORD *)&self->_routeOffset.offset = a3;
}

- (int64_t)intraRoadPriorityForShieldLabel
{
  return self->_intraRoadPriorityForRoadLabel;
}

- (void)setIntraRoadPriorityForShieldLabel:(int64_t)a3
{
  self->_intraRoadPriorityForRoadLabel = a3;
}

- (BOOL)areLabelsDisabled
{
  return BYTE1(self->_direction3D._e[2]);
}

- (void)setAreLabelsDisabled:(BOOL)a3
{
  BYTE1(self->_direction3D._e[2]) = a3;
}

- (BOOL)isRoadLabelUnique
{
  return LOBYTE(self->_direction3D._e[1]);
}

- (void)setIsRoadLabelUnique:(BOOL)a3
{
  LOBYTE(self->_direction3D._e[1]) = a3;
}

- (VKLabelNavJunction)navJunctionA
{
  return (VKLabelNavJunction *)objc_loadWeakRetained((id *)&self->_junctionB);
}

- (BOOL)suppressRoadSignIfShieldPresent
{
  return self->_cachedShieldVisibility[2];
}

- (BOOL)suppressRoadSignIfDeduped
{
  return self->_cachedShieldVisibility[3];
}

- (void)setSuppressRoadSignIfDeduped:(BOOL)a3
{
  self->_cachedShieldVisibility[3] = a3;
}

- (BOOL)isPicked
{
  return self->_cachedShieldVisibility[4];
}

- (void)setIsPicked:(BOOL)a3
{
  self->_cachedShieldVisibility[4] = a3;
}

- (const)tile
{
  return &self->_tile;
}

- (unint64_t)labelVertexIndexA
{
  return self->_vertexIndexB;
}

- (void)setLabelVertexIndexA:(unint64_t)a3
{
  self->_vertexIndexB = a3;
}

- (unint64_t)labelVertexIndexB
{
  return self->_labelVertexIndexA;
}

- (void)setLabelVertexIndexB:(unint64_t)a3
{
  self->_labelVertexIndexA = a3;
}

- (void).cxx_destruct
{
  float *allocator;
  VKLabelNavJunction *navJunctionA;
  __shared_weak_count *cntrl;
  unint64_t *v6;
  unint64_t v7;

  objc_storeStrong((id *)&self->_roadSign, 0);
  objc_storeStrong((id *)&self->_shieldGroup, 0);
  objc_storeStrong((id *)&self->_shieldDisplayGroup, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_length, 0);
  allocator = (float *)self->_simplifiedPoints.__end_cap_.__value__2._allocator;
  if (allocator)
  {
    self->_simplifiedPointElevations.__begin_ = allocator;
    (*(void (**)(float *, float *, int64_t))(*(_QWORD *)self->_simplifiedPointElevations.__end_cap_.__value_
                                                             + 40))(self->_simplifiedPointElevations.__end_cap_.__value_, allocator, (char *)self->_simplifiedPointElevations.__end_ - (char *)allocator);
  }
  navJunctionA = self->_navJunctionA;
  if (navJunctionA)
  {
    self->_simplifiedPoints.__begin_ = navJunctionA;
    (*(void (**)(void *, VKLabelNavJunction *, int64_t))(*(_QWORD *)self->_simplifiedPoints.__end_cap_.__value_
                                                                         + 40))(self->_simplifiedPoints.__end_cap_.__value_, navJunctionA, (char *)self->_simplifiedPoints.__end_ - (char *)navJunctionA);
  }
  objc_destroyWeak((id *)&self->_junctionB);
  if (self->_lineType._hasValue)
    self->_lineType._hasValue = 0;
  cntrl = self->_tile.__cntrl_;
  if (cntrl)
  {
    v6 = (unint64_t *)((char *)cntrl + 8);
    do
      v7 = __ldaxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (!v7)
    {
      (*(void (**)(__shared_weak_count *))(*(_QWORD *)cntrl + 16))(cntrl);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
    }
  }
}

- (id).cxx_construct
{
  unsigned __int8 v2;
  unsigned __int8 v3;
  int v4;
  uint64_t v5;
  geo::read_write_lock *v6;
  const char *v7;
  malloc_zone_t *zone;
  int v9;
  uint64_t v10;
  geo::read_write_lock *v11;
  const char *v12;
  malloc_zone_t *v13;
  id v14;
  id v15;

  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_BYTE *)self + 32) = 0;
  *((_QWORD *)self + 13) = 0;
  *((_QWORD *)self + 14) = 0;
  *((_QWORD *)self + 12) = 0;
  if ((v2 & 1) == 0)
  {
    v14 = self;
    self = v14;
    if (v4)
    {
      v5 = operator new();
      *(_QWORD *)(v5 + 16) = 0x5ED09DD50000000FLL;
      *(_QWORD *)(v5 + 24) = "VectorKitLabels";
      *(_OWORD *)(v5 + 32) = xmmword_19FFB2E80;
      *(_QWORD *)v5 = &off_1E42B5668;
      *(_QWORD *)(v5 + 8) = "VectorKitLabels";
      *(_OWORD *)(v5 + 72) = 0u;
      *(_OWORD *)(v5 + 88) = 0u;
      *(_OWORD *)(v5 + 104) = 0u;
      *(_OWORD *)(v5 + 120) = 0u;
      *(_OWORD *)(v5 + 136) = 0u;
      *(_OWORD *)(v5 + 152) = 0u;
      *(_OWORD *)(v5 + 168) = 0u;
      *(_OWORD *)(v5 + 184) = 0u;
      *(_OWORD *)(v5 + 200) = 0u;
      *(_OWORD *)(v5 + 216) = 0u;
      *(_OWORD *)(v5 + 232) = 0u;
      *(_QWORD *)(v5 + 248) = 0;
      *(_OWORD *)(v5 + 56) = 0u;
      v6 = (geo::read_write_lock *)pthread_rwlock_init((pthread_rwlock_t *)(v5 + 56), 0);
      if ((_DWORD)v6)
        geo::read_write_lock::logFailure(v6, (uint64_t)"initialization", v7);
      zone = malloc_create_zone(0, 0);
      *(_QWORD *)(v5 + 48) = zone;
      malloc_set_zone_name(zone, "VectorKitLabels");
      *(_QWORD *)(v5 + 256) = os_log_create("com.apple.VectorKit", "Memory");
      mdm::Allocator::instance(void)::alloc = v5;
      self = v14;
    }
  }
  *((_QWORD *)self + 15) = mdm::Allocator::instance(void)::alloc;
  *((_QWORD *)self + 16) = 0;
  *((_QWORD *)self + 17) = 0;
  *((_QWORD *)self + 18) = 0;
  if ((v3 & 1) == 0)
  {
    v15 = self;
    self = v15;
    if (v9)
    {
      v10 = operator new();
      *(_QWORD *)(v10 + 16) = 0x5ED09DD50000000FLL;
      *(_QWORD *)(v10 + 24) = "VectorKitLabels";
      *(_OWORD *)(v10 + 32) = xmmword_19FFB2E80;
      *(_QWORD *)v10 = &off_1E42B5668;
      *(_QWORD *)(v10 + 8) = "VectorKitLabels";
      *(_OWORD *)(v10 + 72) = 0u;
      *(_OWORD *)(v10 + 88) = 0u;
      *(_OWORD *)(v10 + 104) = 0u;
      *(_OWORD *)(v10 + 120) = 0u;
      *(_OWORD *)(v10 + 136) = 0u;
      *(_OWORD *)(v10 + 152) = 0u;
      *(_OWORD *)(v10 + 168) = 0u;
      *(_OWORD *)(v10 + 184) = 0u;
      *(_OWORD *)(v10 + 200) = 0u;
      *(_OWORD *)(v10 + 216) = 0u;
      *(_OWORD *)(v10 + 232) = 0u;
      *(_QWORD *)(v10 + 248) = 0;
      *(_OWORD *)(v10 + 56) = 0u;
      v11 = (geo::read_write_lock *)pthread_rwlock_init((pthread_rwlock_t *)(v10 + 56), 0);
      if ((_DWORD)v11)
        geo::read_write_lock::logFailure(v11, (uint64_t)"initialization", v12);
      v13 = malloc_create_zone(0, 0);
      *(_QWORD *)(v10 + 48) = v13;
      malloc_set_zone_name(v13, "VectorKitLabels");
      *(_QWORD *)(v10 + 256) = os_log_create("com.apple.VectorKit", "Memory");
      mdm::Allocator::instance(void)::alloc = v10;
      self = v15;
    }
  }
  *((_QWORD *)self + 19) = mdm::Allocator::instance(void)::alloc;
  *(_QWORD *)((char *)self + 188) = 0xBF80000000000000;
  return self;
}

@end
