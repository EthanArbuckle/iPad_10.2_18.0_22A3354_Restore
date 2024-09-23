@implementation VKLabelNavRouteEta

- (Matrix<double,)worldPointForStaging
{
  void *v2;
  uint64_t v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  Matrix<double, 3, 1> result;

  -[VKLabelNavRouteEta label](self, "label");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "label");
  v4 = *(double *)(*(_QWORD *)v3 + 136);
  v5 = *(double *)(*(_QWORD *)v3 + 144);
  v6 = *(double *)(*(_QWORD *)v3 + 152);

  v7 = v4;
  v8 = v5;
  v9 = v6;
  result._e[2] = v9;
  result._e[1] = v8;
  result._e[0] = v7;
  return result;
}

- (void)setOrientation:(unsigned __int8)a3
{
  self->_orientation = a3;
}

- (unsigned)orientation
{
  return self->_orientation;
}

- (BOOL)hasLabel
{
  return self->_etaLabel != 0;
}

- (BOOL)hasAnchor
{
  _BOOL4 v3;

  v3 = -[VKLabelNavRouteEta hasLabel](self, "hasLabel");
  if (v3)
    LOBYTE(v3) = *(_QWORD *)(*(_QWORD *)-[VKLabelNavRoadLabel label](self->_etaLabel, "label") + 160) != 0;
  return v3;
}

- (BOOL)hasLabelWithAnchor
{
  _BOOL4 v3;

  v3 = -[VKLabelNavRouteEta hasLabel](self, "hasLabel");
  if (v3)
    LOBYTE(v3) = *(_QWORD *)(*(_QWORD *)-[VKLabelNavRoadLabel label](self->_etaLabel, "label") + 160) != 0;
  return v3;
}

- (VKLabelNavRouteEta)initWithRouteInfo:(id)a3 routeCoord:(PolylineCoordinate)a4
{
  id v7;
  VKLabelNavRouteEta *v8;
  VKLabelNavRouteEta *v9;
  VKLabelNavRouteEta *v10;
  objc_super v12;

  v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)VKLabelNavRouteEta;
  v8 = -[VKLabelNavRouteEta init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_routeInfo, a3);
    v9->_routeOffset = a4;
    v10 = v9;
  }

  return v9;
}

- (unsigned)etaComparisonToMain
{
  VKRouteInfo *v3;
  unsigned __int8 v4;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  v3 = self->_routeInfo;
  v4 = objc_msgSend((id)objc_opt_class(), "toStyleEtaComparison:", -[VKRouteInfo etaComparisionToMain](v3, "etaComparisionToMain"));

  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[VKLabelNavRouteEta clearLabel](self, "clearLabel");
  v3.receiver = self;
  v3.super_class = (Class)VKLabelNavRouteEta;
  -[VKLabelNavRouteEta dealloc](&v3, sel_dealloc);
}

- (void)clearLabel
{
  VKLabelNavRoadLabel *etaLabel;

  -[VKLabelNavRoadLabel setNavFeature:](self->_etaLabel, "setNavFeature:", 0);
  etaLabel = self->_etaLabel;
  self->_etaLabel = 0;

}

- (void)createLabelWithNavContext:(const NavContext *)a3 orientation:(unsigned __int8)a4 etaDescription:(id)a5 selected:(BOOL)a6 when:(optional<gss:(optional<gss:(void *)a9 :RouteLegWhen>)a8 :When>)a7 routeLegWhen:artworkCache:
{
  _BYTE *v9;
  _BYTE *v10;
  _BOOL8 v12;
  unsigned int v14;
  VKRouteEtaDescription *v17;
  VKRouteEtaDescription *displayEtaDescription;
  _BOOL4 hasValue;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  uint64_t v26;
  void *v27;
  unsigned int v28;
  unsigned __int8 v29;
  void *v30;
  uint64_t v31;
  optional<gss::When> v32;
  void *v33;
  long double v34;
  long double v35;
  float64x2_t v36;
  VKRoadSignArtwork *v42;
  unint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  std::__shared_weak_count *v47;
  uint64_t v48;
  unint64_t *p_shared_owners;
  unint64_t v50;
  id v51;
  VKRoadSignArtwork *v52;
  unint64_t v53;
  id v54;
  VKRoadSignArtwork *v55;
  id v56;
  const char *v57;
  unsigned __int8 v58;
  uint64_t v59;
  size_t v60;
  size_t v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t *v65;
  unint64_t v66;
  id *v67;
  uint64_t v68;
  double v69;
  double v70;
  unint64_t *v71;
  unint64_t v72;
  int v73;
  int v74;
  std::__shared_weak_count *v75;
  unsigned __int8 v76;
  void (***v77)(md::NavRouteEtaLabelPart *__hidden);
  uint64_t v78;
  void (**v79)(md::NavRouteEtaLabelPart *__hidden);
  uint64_t v80;
  std::__shared_weak_count *v81;
  unint64_t *v82;
  unint64_t v83;
  _QWORD *v84;
  unint64_t *v85;
  unint64_t v86;
  VKLabelNavRoadLabel *v87;
  VKLabelNavRoadLabel *etaLabel;
  std::__shared_weak_count *v89;
  unint64_t *v90;
  unint64_t v91;
  std::__shared_weak_count *v92;
  unint64_t *v93;
  unint64_t v94;
  std::__shared_weak_count *v95;
  unint64_t *v96;
  unint64_t v97;
  std::__shared_weak_count *v98;
  unint64_t *v99;
  unint64_t v100;
  uint64_t v101;
  geo::read_write_lock *v102;
  const char *v103;
  malloc_zone_t *zone;
  uint64_t v105;
  geo::read_write_lock *v106;
  const char *v107;
  malloc_zone_t *v108;
  unsigned int v109;
  void *v110;
  unsigned int v111;
  double v112;
  VKRouteEtaDescription *v113;
  id *location;
  id *locationa;
  std::__shared_weak_count *v116;
  float64x2_t v117;
  char v118[2];
  uint64_t v119;
  std::__shared_weak_count *v120;
  std::__shared_weak_count *v121;
  std::__shared_weak_count *v122;
  md::RoadSignLabelIcon *v123;
  std::__shared_weak_count *v124;

  v10 = v9;
  v12 = a6;
  v14 = a4;
  v17 = (VKRouteEtaDescription *)a5;
  if (self->_etaLabel)
    goto LABEL_75;
  displayEtaDescription = self->_displayEtaDescription;
  v113 = v17;
  location = (id *)&self->_displayEtaDescription;
  if (displayEtaDescription != v17 && !-[VKRouteEtaDescription isEqual:](displayEtaDescription, "isEqual:", v17))
    objc_storeStrong(location, a5);
  self->_selected = v12;
  self->_when = a7;
  hasValue = self->_routeLegWhen._hasValue;
  if (*v10)
  {
    *(&self->_routeLegWhen._hasValue + 1) = v10[1];
    if (!hasValue)
      self->_routeLegWhen._hasValue = 1;
  }
  else if (self->_routeLegWhen._hasValue)
  {
    self->_routeLegWhen._hasValue = 0;
  }
  self->_orientation = v14;
  -[VKRouteInfo route](self->_routeInfo, "route");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "pointWithAltitudeCorrectionAtRouteCoordinate:", *(_QWORD *)&self->_routeOffset);
  v112 = v21;
  v23 = v22;
  v25 = v24;

  -[VKLabelNavRouteEta routeInfo](self, "routeInfo");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  v109 = objc_msgSend(v110, "hasFocus");
  v26 = -[VKLabelNavRouteEta etaComparisonToMain](self, "etaComparisonToMain");
  -[VKRouteInfo route](self->_routeInfo, "route");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "transportType");
  if (v28 >= 7)
    v29 = 4;
  else
    v29 = 0x50403020100uLL >> (8 * v28);
  -[VKLabelNavRouteEta displayEtaDescription](self, "displayEtaDescription");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v111 = v14;
  v31 = +[VKLabelNavRouteEta toStyleNavLabelType:](VKLabelNavRouteEta, "toStyleNavLabelType:", objc_msgSend(v30, "routeEtaType"));
  v32 = (optional<gss::When>)-[VKLabelNavRouteEta when](self, "when");
  -[VKLabelNavRouteEta routeLegWhen](self, "routeLegWhen");
  objc_msgSend(*location, "styleAttributes");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  +[VKLabelNavRouteEta styleForNavContext:selected:focused:etaComparison:transportType:navLabelType:when:routeLegWhen:additionalAttributes:](VKLabelNavRouteEta, "styleForNavContext:selected:focused:etaComparison:transportType:navLabelType:when:routeLegWhen:additionalAttributes:", a3, v12, v109, v26, v29, v31, *(unsigned __int16 *)&v32, v118, v33);

  if (v118[0])
    v118[0] = 0;

  v34 = tan(v23 * 0.00872664626 + 0.785398163);
  v35 = log(v34);
  v36.f64[0] = v112;
  v36.f64[1] = v35;
  __asm { FMOV            V2.2D, #0.5 }
  v117 = vmlaq_f64(_Q2, (float64x2_t)xmmword_19FFB32D0, v36);
  v17 = v113;
  artworkAndKeyForEtaLabel(&v123, v113, (uint64_t)a3, (uint64_t)&v119, &v117, v111, *(uint64_t **)&a8._hasValue);
  v42 = (VKRoadSignArtwork *)v123;
  v43 = (unint64_t)v124;
  v123 = 0;
  if (v42)
  {
    self->_coordinate.latitude = v23;
    self->_coordinate.longitude = v112;
    self->_coordinate.altitude = v25;
    v44 = operator new();
    objc_msgSend(*location, "etaText");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = v45;
    v48 = v119;
    v47 = v120;
    v116 = v120;
    if (v120)
    {
      p_shared_owners = (unint64_t *)&v120->__shared_owners_;
      do
        v50 = __ldxr(p_shared_owners);
      while (__stxr(v50 + 1, p_shared_owners));
      v51 = v45;
      v52 = v42;
      do
        v53 = __ldxr(p_shared_owners);
      while (__stxr(v53 + 1, p_shared_owners));
    }
    else
    {
      v54 = v45;
      v55 = v42;
    }
    v56 = v46;
    *(_QWORD *)(v44 + 8) = 0;
    *(_QWORD *)(v44 + 16) = 0;
    *(_QWORD *)v44 = &off_1E42AF5A8;
    *(_BYTE *)(v44 + 24) = 0;
    *(_WORD *)(v44 + 25) = 1;
    *(_BYTE *)(v44 + 27) = 0;
    locationa = (id *)objc_retainAutorelease(v56);
    v57 = (const char *)objc_msgSend(locationa, "UTF8String");
    {
      v101 = operator new();
      *(_QWORD *)(v101 + 16) = 0x5ED09DD50000000FLL;
      *(_QWORD *)(v101 + 24) = "VectorKitLabels";
      *(_OWORD *)(v101 + 32) = xmmword_19FFB2E80;
      *(_QWORD *)v101 = &off_1E42B5668;
      *(_QWORD *)(v101 + 8) = "VectorKitLabels";
      *(_OWORD *)(v101 + 72) = 0u;
      *(_OWORD *)(v101 + 88) = 0u;
      *(_OWORD *)(v101 + 104) = 0u;
      *(_OWORD *)(v101 + 120) = 0u;
      *(_OWORD *)(v101 + 136) = 0u;
      *(_OWORD *)(v101 + 152) = 0u;
      *(_OWORD *)(v101 + 168) = 0u;
      *(_OWORD *)(v101 + 184) = 0u;
      *(_OWORD *)(v101 + 200) = 0u;
      *(_OWORD *)(v101 + 216) = 0u;
      *(_OWORD *)(v101 + 232) = 0u;
      *(_QWORD *)(v101 + 248) = 0;
      *(_OWORD *)(v101 + 56) = 0u;
      v102 = (geo::read_write_lock *)pthread_rwlock_init((pthread_rwlock_t *)(v101 + 56), 0);
      if ((_DWORD)v102)
        geo::read_write_lock::logFailure(v102, (uint64_t)"initialization", v103);
      zone = malloc_create_zone(0, 0);
      *(_QWORD *)(v101 + 48) = zone;
      malloc_set_zone_name(zone, "VectorKitLabels");
      *(_QWORD *)(v101 + 256) = os_log_create("com.apple.VectorKit", "Memory");
      mdm::Allocator::instance(void)::alloc = v101;
    }
    v59 = mdm::Allocator::instance(void)::alloc;
    *(_QWORD *)(v44 + 56) = mdm::Allocator::instance(void)::alloc;
    v60 = strlen(v57);
    if (v60 >= 0x7FFFFFFFFFFFFFF8)
      abort();
    v61 = v60;
    if (v60 >= 0x17)
    {
      v63 = (v60 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v60 | 7) != 0x17)
        v63 = v60 | 7;
      v64 = v63 + 1;
      v62 = (void *)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v59 + 16))(v59, v63 + 1, 1);
      *(_QWORD *)(v44 + 40) = v61;
      *(_QWORD *)(v44 + 48) = v64 | 0x8000000000000000;
      *(_QWORD *)(v44 + 32) = v62;
    }
    else
    {
      v62 = (void *)(v44 + 32);
      *(_BYTE *)(v44 + 55) = v60;
      if (!v60)
        goto LABEL_33;
    }
    memmove(v62, v57, v61);
LABEL_33:
    *((_BYTE *)v62 + v61) = 0;
    *(_QWORD *)(v44 + 64) = 0;
    *(_QWORD *)(v44 + 72) = 0;
    *(_QWORD *)(v44 + 80) = v48;
    *(_QWORD *)(v44 + 88) = v47;
    if (v47)
    {
      v65 = (unint64_t *)&v47->__shared_owners_;
      do
        v66 = __ldxr(v65);
      while (__stxr(v66 + 1, v65));
    }
    *(_BYTE *)(v44 + 104) = 0;
    *(_QWORD *)(v44 + 96) = 0;
    *(_OWORD *)(v44 + 112) = 0u;
    *(_OWORD *)(v44 + 128) = 0u;
    *(_OWORD *)(v44 + 144) = 0u;
    *(_QWORD *)(v44 + 160) = 0;
    *(_QWORD *)(v44 + 168) = 0;
    v17 = v113;
    v67 = locationa;
    v68 = v111;
    *(_QWORD *)(v44 + 176) = 0;
    *(_QWORD *)(v44 + 184) = 0;
    *(_DWORD *)(v44 + 192) = 0;
    *(_QWORD *)(v44 + 196) = 1065353216;
    *(_WORD *)(v44 + 204) = 256;
    *(_OWORD *)(v44 + 208) = 0uLL;
    *(_OWORD *)(v44 + 224) = 0uLL;
    *(_DWORD *)(v44 + 240) = 0;
    *(_QWORD *)(v44 + 244) = 1065353216;
    *(_DWORD *)(v44 + 251) = 0;
    *(_QWORD *)(v44 + 268) = 0x3F80000000000000;
    *(_QWORD *)(v44 + 256) = 0;
    *(_WORD *)(v44 + 264) = 0;
    *(_BYTE *)(v44 + 276) = 0;
    *(_BYTE *)(v44 + 280) = 0;
    *(_DWORD *)(v44 + 284) = 1056964608;
    *(_QWORD *)(v44 + 288) = 0;
    *(_BYTE *)(v44 + 297) = 1;
    *(_QWORD *)(v44 + 306) = 0;
    *(_QWORD *)(v44 + 298) = 0;
    *(_DWORD *)(v44 + 321) = 0;
    *(_QWORD *)(v44 + 314) = 0;
    *(_BYTE *)(v44 + 325) = 1;
    *(_QWORD *)(v44 + 342) = 0;
    *(_QWORD *)(v44 + 326) = 0;
    *(_QWORD *)(v44 + 334) = 0;
    *(_WORD *)(v44 + 350) = 0;
    *(_BYTE *)(v44 + 296) = 0;

    if (v47)
    {
      v71 = (unint64_t *)&v47->__shared_owners_;
      do
        v72 = __ldaxr(v71);
      while (__stlxr(v72 - 1, v71));
      if (!v72)
      {
        ((void (*)(std::__shared_weak_count *))v47->__on_zero_shared)(v47);
        std::__shared_weak_count::__release_weak(v47);
      }
    }
    *(_QWORD *)v44 = &off_1E428C440;
    LODWORD(v69) = 0;
    LODWORD(v70) = 0;
    -[VKRoadSignArtwork offsetPixelForPixel:](v42, "offsetPixelForPixel:", v69, v70);
    *(_DWORD *)(v44 + 256) = v73;
    *(_DWORD *)(v44 + 260) = v74;
    v75 = (std::__shared_weak_count *)operator new(0xC8uLL);
    v75->__shared_owners_ = 0;
    v75->__shared_weak_owners_ = 0;
    v75->__vftable = (std::__shared_weak_count_vtbl *)&off_1E42DB9B0;
    v123 = md::RoadSignLabelIcon::RoadSignLabelIcon((md::RoadSignLabelIcon *)&v75[1], v42);
    v124 = v75;
    {
      v105 = operator new();
      *(_QWORD *)(v105 + 16) = 0x5ED09DD50000000FLL;
      *(_QWORD *)(v105 + 24) = "VectorKitLabels";
      *(_OWORD *)(v105 + 32) = xmmword_19FFB2E80;
      *(_QWORD *)v105 = &off_1E42B5668;
      *(_QWORD *)(v105 + 8) = "VectorKitLabels";
      *(_OWORD *)(v105 + 72) = 0u;
      *(_OWORD *)(v105 + 88) = 0u;
      *(_OWORD *)(v105 + 104) = 0u;
      *(_OWORD *)(v105 + 120) = 0u;
      *(_OWORD *)(v105 + 136) = 0u;
      *(_OWORD *)(v105 + 152) = 0u;
      *(_OWORD *)(v105 + 168) = 0u;
      *(_OWORD *)(v105 + 184) = 0u;
      *(_OWORD *)(v105 + 200) = 0u;
      *(_OWORD *)(v105 + 216) = 0u;
      *(_OWORD *)(v105 + 232) = 0u;
      *(_QWORD *)(v105 + 248) = 0;
      *(_OWORD *)(v105 + 56) = 0u;
      v106 = (geo::read_write_lock *)pthread_rwlock_init((pthread_rwlock_t *)(v105 + 56), 0);
      if ((_DWORD)v106)
        geo::read_write_lock::logFailure(v106, (uint64_t)"initialization", v107);
      v108 = malloc_create_zone(0, 0);
      *(_QWORD *)(v105 + 48) = v108;
      malloc_set_zone_name(v108, "VectorKitLabels");
      *(_QWORD *)(v105 + 256) = os_log_create("com.apple.VectorKit", "Memory");
      mdm::Allocator::instance(void)::alloc = v105;
      v17 = v113;
      v67 = locationa;
      v68 = v111;
    }
    v77 = (void (***)(md::NavRouteEtaLabelPart *__hidden))(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)mdm::Allocator::instance(void)::alloc + 16))(mdm::Allocator::instance(void)::alloc, 848, 8);
    md::IconLabelPart::IconLabelPart((uint64_t)v77, &v123);
    *(_BYTE *)(v78 + 766) = 9;
    *(_BYTE *)(v78 + 768) = 0;
    *(_OWORD *)(v78 + 816) = 0u;
    *(_OWORD *)(v78 + 832) = 0u;
    *(_OWORD *)(v78 + 776) = 0u;
    *(_OWORD *)(v78 + 792) = 0u;
    *(_BYTE *)(v78 + 808) = 0;
    *(_BYTE *)(v78 + 557) = 3;
    *(_BYTE *)(v78 + 656) = 3;
    *(_BYTE *)(v78 + 664) = 0;
    v79 = off_1E4299BA8;
    *(_QWORD *)v78 = off_1E4299BA8;
    v80 = *(_QWORD *)(v44 + 288);
    *(_QWORD *)(v44 + 288) = v77;
    if (v80)
    {
      (*(void (**)(uint64_t))(*(_QWORD *)v80 + 8))(v80);
      v79 = *v77;
    }
    ((void (*)(void (***)(md::NavRouteEtaLabelPart *__hidden), uint64_t))v79[3])(v77, v44 + 176);
    v81 = v124;
    if (v124)
    {
      v82 = (unint64_t *)&v124->__shared_owners_;
      do
        v83 = __ldaxr(v82);
      while (__stlxr(v83 - 1, v82));
      if (!v83)
      {
        ((void (*)(std::__shared_weak_count *))v81->__on_zero_shared)(v81);
        std::__shared_weak_count::__release_weak(v81);
      }
    }

    *(_QWORD *)&v117.f64[0] = v44;
    v84 = (_QWORD *)operator new();
    *v84 = &off_1E42E6B88;
    v84[1] = 0;
    v84[2] = 0;
    v84[3] = v44;
    *(_QWORD *)&v117.f64[1] = v84;
    if (v116)
    {
      v85 = (unint64_t *)&v116->__shared_owners_;
      do
        v86 = __ldaxr(v85);
      while (__stlxr(v86 - 1, v85));
      if (!v86)
      {
        ((void (*)(std::__shared_weak_count *))v116->__on_zero_shared)(v116);
        std::__shared_weak_count::__release_weak(v116);
      }
    }

    *(_DWORD *)(*(_QWORD *)&v117.f64[0] + 284) = 1048576000;
    v87 = -[VKLabelNavRoadLabel initWithNavFeature:label:navLabelType:]([VKLabelNavRoadLabel alloc], "initWithNavFeature:label:navLabelType:", self, &v117, 5);
    etaLabel = self->_etaLabel;
    self->_etaLabel = v87;

    -[VKLabelNavRoadLabel setAlignment:](self->_etaLabel, "setAlignment:", v68);
    self->_etaLabelArtworkKey = v43;
    v89 = *(std::__shared_weak_count **)&v117.f64[1];
    if (*(_QWORD *)&v117.f64[1])
    {
      v90 = (unint64_t *)(*(_QWORD *)&v117.f64[1] + 8);
      do
        v91 = __ldaxr(v90);
      while (__stlxr(v91 - 1, v90));
      if (!v91)
      {
        ((void (*)(std::__shared_weak_count *))v89->__on_zero_shared)(v89);
        std::__shared_weak_count::__release_weak(v89);
      }
    }
  }
  v92 = v122;
  if (v122)
  {
    v93 = (unint64_t *)&v122->__shared_owners_;
    do
      v94 = __ldaxr(v93);
    while (__stlxr(v94 - 1, v93));
    if (!v94)
    {
      ((void (*)(std::__shared_weak_count *))v92->__on_zero_shared)(v92);
      std::__shared_weak_count::__release_weak(v92);
    }
  }
  v95 = v121;
  if (v121)
  {
    v96 = (unint64_t *)&v121->__shared_owners_;
    do
      v97 = __ldaxr(v96);
    while (__stlxr(v97 - 1, v96));
    if (!v97)
    {
      ((void (*)(std::__shared_weak_count *))v95->__on_zero_shared)(v95);
      std::__shared_weak_count::__release_weak(v95);
    }
  }
  v98 = v120;
  if (v120)
  {
    v99 = (unint64_t *)&v120->__shared_owners_;
    do
      v100 = __ldaxr(v99);
    while (__stlxr(v100 - 1, v99));
    if (!v100)
    {
      ((void (*)(std::__shared_weak_count *))v98->__on_zero_shared)(v98);
      std::__shared_weak_count::__release_weak(v98);
    }
  }

LABEL_75:
}

- (void)updateAnchorWithContext:(const NavContext *)a3
{
  md::NavLabel *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  double altitude;
  uint64_t v12;
  unint64_t v13;
  std::__shared_weak_count *v14;
  unint64_t *p_shared_owners;
  unint64_t v16;
  unint64_t v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  unint64_t *v21;
  unint64_t v22;
  int v23;
  double v24;
  double v25;
  long double v26;
  long double v27;
  long double v28;
  long double v29;
  long double v30;
  long double v31;
  long double v32;
  double v33;
  long double v34;
  std::__shared_weak_count *v35;
  unint64_t *v36;
  unint64_t v37;
  __int128 v38;
  double v39;
  unint64_t v40;
  std::__shared_weak_count *v41;

  if (!*(_QWORD *)(*(_QWORD *)-[VKLabelNavRoadLabel label](self->_etaLabel, "label") + 160))
  {
    v9 = **((_QWORD **)a3->var4 + 18);
    v10 = *(unsigned __int8 *)(*((_QWORD *)a3->var1 + 29) + 30);
    altitude = 0.0;
    if (!*(_BYTE *)(*((_QWORD *)a3->var1 + 29) + 30))
    {
      altitude = self->_coordinate.altitude;
      if (!*((_BYTE *)a3->var3 + 24))
        altitude = 0.0;
    }
    v38 = *(_OWORD *)&self->_coordinate.latitude;
    v39 = altitude;
    md::AnchorManager::newAnchorAtCoordinate(&v40, v9, (uint64_t)&v38, v10 != 0);
    v12 = *(_QWORD *)-[VKLabelNavRoadLabel label](self->_etaLabel, "label");
    v13 = v40;
    v14 = v41;
    if (v41)
    {
      p_shared_owners = (unint64_t *)&v41->__shared_owners_;
      do
        v16 = __ldxr(p_shared_owners);
      while (__stxr(v16 + 1, p_shared_owners));
      do
        v17 = __ldxr(p_shared_owners);
      while (__stxr(v17 + 1, p_shared_owners));
    }
    v18 = *(std::__shared_weak_count **)(v12 + 168);
    *(_QWORD *)(v12 + 160) = v13;
    *(_QWORD *)(v12 + 168) = v14;
    if (v18)
    {
      v19 = (unint64_t *)&v18->__shared_owners_;
      do
        v20 = __ldaxr(v19);
      while (__stlxr(v20 - 1, v19));
      if (!v20)
      {
        ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
        std::__shared_weak_count::__release_weak(v18);
      }
    }
    if (v14)
    {
      v21 = (unint64_t *)&v14->__shared_owners_;
      do
        v22 = __ldaxr(v21);
      while (__stlxr(v22 - 1, v21));
      if (!v22)
      {
        ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
        std::__shared_weak_count::__release_weak(v14);
      }
    }
    v23 = (*(uint64_t (**)(unint64_t))(*(_QWORD *)v40 + 16))(v40);
    v24 = 1.0;
    if (v23)
    {
      (*(void (**)(unint64_t, double))(*(_QWORD *)v40 + 56))(v40, 1.0);
      v26 = exp(v25 * 6.28318531 + -3.14159265);
      v27 = atan(v26) * 114.591559 + -90.0;
      v28 = cos(v27 * 0.034906585) * -559.82 + 111132.92;
      v29 = v28 + cos(v27 * 0.0698131701) * 1.175;
      v30 = v29 + cos(v27 * 0.104719755) * -0.0023;
      v31 = v27 * 0.00872664626;
      v32 = tan(v27 * 0.00872664626 + 0.78103484);
      v33 = log(v32);
      v34 = tan(v31 + 0.789761487);
      v24 = fabs((log(v34) - v33) * 0.159154943) / v30;
    }
    self->_worldUnitsPerMeterAtPoint = v24;
    v35 = v41;
    if (v41)
    {
      v36 = (unint64_t *)&v41->__shared_owners_;
      do
        v37 = __ldaxr(v36);
      while (__stlxr(v37 - 1, v36));
      if (!v37)
      {
        ((void (*)(std::__shared_weak_count *))v35->__on_zero_shared)(v35);
        std::__shared_weak_count::__release_weak(v35);
      }
    }
  }
  v5 = *(md::NavLabel **)-[VKLabelNavRoadLabel label](self->_etaLabel, "label");
  md::NavLabel::worldPointForDisplay(v5, (const md::NavContext *)a3);
  *((_QWORD *)v5 + 17) = v6;
  *((_QWORD *)v5 + 18) = v7;
  *((_QWORD *)v5 + 19) = v8;
}

- (_retain_ptr<VKLabelNavRoadLabel)updateRoadSignWithNavContext:(const NavContext *)a3 artworkCache:(void *)a4
{
  _QWORD *v4;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  unsigned int v9;
  unsigned __int8 v10;
  void *v11;
  uint64_t v12;
  optional<gss::When> v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  unint64_t etaLabelArtworkKey;
  void *v22;
  uint64_t v23;
  _BOOL8 v24;
  void *v25;
  std::__shared_weak_count *v26;
  unint64_t *p_shared_owners;
  unint64_t v28;
  std::__shared_weak_count *v29;
  unint64_t *v30;
  unint64_t v31;
  std::__shared_weak_count *v32;
  unint64_t *v33;
  unint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  _BOOL8 v38;
  optional<gss::When> v39;
  id v40;
  _BYTE *v41;
  void *v42;
  uint64_t v43;
  char v44;
  _BOOL4 v45;
  void *v46;
  _QWORD *v47;
  _BYTE v50[2];
  __int128 v51;
  void *v52;
  uint64_t v53;
  _BYTE v54[2];
  _BYTE v55[8];
  std::__shared_weak_count *v56;
  std::__shared_weak_count *v57;
  std::__shared_weak_count *v58;
  _retain_ptr<VKLabelNavRoadLabel *, geo::_retain_objc_arc, geo::_release_objc_arc, geo::_hash_objc, geo::_equal_objc> result;

  v47 = v4;
  if (-[VKLabelNavRouteEta isRepositioning](self, "isRepositioning"))
    goto LABEL_22;
  v44 = -[VKLabelNavRouteEta orientation](self, "orientation");
  v45 = -[VKLabelNavRouteEta selected](self, "selected");
  -[VKLabelNavRouteEta routeInfo](self, "routeInfo");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v46, "hasFocus");
  v7 = -[VKLabelNavRouteEta etaComparisonToMain](self, "etaComparisonToMain");
  -[VKRouteInfo route](self->_routeInfo, "route");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "transportType");
  if (v9 >= 7)
    v10 = 4;
  else
    v10 = 0x50403020100uLL >> (8 * v9);
  -[VKLabelNavRouteEta displayEtaDescription](self, "displayEtaDescription");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = +[VKLabelNavRouteEta toStyleNavLabelType:](VKLabelNavRouteEta, "toStyleNavLabelType:", objc_msgSend(v11, "routeEtaType"));
  v13 = (optional<gss::When>)-[VKLabelNavRouteEta when](self, "when");
  -[VKLabelNavRouteEta routeLegWhen](self, "routeLegWhen");
  -[VKLabelNavRouteEta displayEtaDescription](self, "displayEtaDescription");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "styleAttributes");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[VKLabelNavRouteEta styleForNavContext:selected:focused:etaComparison:transportType:navLabelType:when:routeLegWhen:additionalAttributes:](VKLabelNavRouteEta, "styleForNavContext:selected:focused:etaComparison:transportType:navLabelType:when:routeLegWhen:additionalAttributes:", a3, v45, v6, v7, v10, v12, *(unsigned __int16 *)&v13, v54, v15);

  if (v54[0])
    v54[0] = 0;

  -[VKLabelNavRouteEta worldPointForStaging](self, "worldPointForStaging");
  v17 = v16;
  v19 = v18;
  -[VKLabelNavRouteEta displayEtaDescription](self, "displayEtaDescription");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)&v51 = v17;
  *((_QWORD *)&v51 + 1) = v19;
  -[VKLabelNavRouteEta selected](self, "selected");
  artworkAndKeyForEtaLabel(&v52, v20, (uint64_t)a3, (uint64_t)v55, &v51, v44, (uint64_t *)a4);

  etaLabelArtworkKey = self->_etaLabelArtworkKey;
  v22 = v52;
  v23 = v53;
  self->_didStyleChange = v53 != etaLabelArtworkKey;

  v26 = v58;
  if (v58)
  {
    p_shared_owners = (unint64_t *)&v58->__shared_owners_;
    do
      v28 = __ldaxr(p_shared_owners);
    while (__stlxr(v28 - 1, p_shared_owners));
    if (!v28)
    {
      ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
      std::__shared_weak_count::__release_weak(v26);
    }
  }
  v29 = v57;
  if (v57)
  {
    v30 = (unint64_t *)&v57->__shared_owners_;
    do
      v31 = __ldaxr(v30);
    while (__stlxr(v31 - 1, v30));
    if (!v31)
    {
      ((void (*)(std::__shared_weak_count *))v29->__on_zero_shared)(v29);
      std::__shared_weak_count::__release_weak(v29);
    }
  }
  v32 = v56;
  if (v56)
  {
    v33 = (unint64_t *)&v56->__shared_owners_;
    do
      v34 = __ldaxr(v33);
    while (__stlxr(v34 - 1, v33));
    if (!v34)
    {
      ((void (*)(std::__shared_weak_count *))v32->__on_zero_shared)(v32);
      std::__shared_weak_count::__release_weak(v32);
      if (v23 != etaLabelArtworkKey)
        goto LABEL_22;
LABEL_33:
      *v47 = &off_1E42B4E10;
      v47[1] = 0;
      goto LABEL_34;
    }
  }
  if (v23 == etaLabelArtworkKey)
    goto LABEL_33;
LABEL_22:
  -[VKLabelNavRouteEta label](self, "label");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  *v47 = &off_1E42B4E10;
  v47[1] = v35;
  -[VKLabelNavRouteEta clearLabel](self, "clearLabel");
  v36 = -[VKLabelNavRouteEta orientation](self, "orientation");
  -[VKLabelNavRouteEta displayEtaDescription](self, "displayEtaDescription");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = -[VKLabelNavRouteEta selected](self, "selected");
  v39 = (optional<gss::When>)-[VKLabelNavRouteEta when](self, "when");
  -[VKLabelNavRouteEta routeLegWhen](self, "routeLegWhen");
  -[VKLabelNavRouteEta createLabelWithNavContext:orientation:etaDescription:selected:when:routeLegWhen:artworkCache:](self, "createLabelWithNavContext:orientation:etaDescription:selected:when:routeLegWhen:artworkCache:", a3, v36, v37, v38, *(unsigned __int16 *)&v39, v50, a4);
  if (v50[0])
    v50[0] = 0;

  v24 = -[VKLabelNavRouteEta isRepositioning](self, "isRepositioning");
  if (v24)
  {
    if (v35)
    {
      v40 = v35;
      v41 = *(_BYTE **)objc_msgSend(v40, "label");
      v41[297] = 0;
      if (v41[296])
        v41[298] = 0;

    }
    self->_isRepositioning = 0;
  }
  else
  {
    v24 = -[VKLabelNavRouteEta hasLabel](self, "hasLabel");
    if (v24)
    {
      -[VKLabelNavRouteEta label](self, "label");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = *(_QWORD *)objc_msgSend(v42, "label");
      *(_DWORD *)(v43 + 276) = 1065353216;
      *(_BYTE *)(v43 + 280) = 1;

    }
  }
LABEL_34:
  result.var1 = v25;
  result.var0 = (void **)v24;
  return result;
}

- (BOOL)isRamp
{
  return 0;
}

- (NSString)name
{
  return 0;
}

- (NSString)shieldDisplayGroup
{
  return 0;
}

- (BOOL)isStartOfRoadName
{
  return 0;
}

- (BOOL)isInGuidance
{
  return 0;
}

- (BOOL)isGuidanceStepStart
{
  return 0;
}

- (int64_t)intraRoadPriorityForRoadLabel
{
  return 0;
}

- (int64_t)intraRoadPriorityForShieldLabel
{
  return 0;
}

- (BOOL)isEtaFeature
{
  return 1;
}

- (BOOL)isTrafficCameraFeature
{
  return 0;
}

- (BOOL)isValid
{
  return 1;
}

- (void)repositionAtRouteCoord:(PolylineCoordinate)a3
{
  self->_isRepositioning = 1;
  self->_routeOffset = a3;
}

- (BOOL)isOnRoute
{
  return self->_isOnRoute;
}

- (BOOL)isAwayFromRoute
{
  return self->_isAwayFromRoute;
}

- (PolylineCoordinate)routeOffset
{
  return self->_routeOffset;
}

- (VKLabelNavRoadLabel)label
{
  return self->_etaLabel;
}

- (BOOL)selected
{
  return self->_selected;
}

- (void)setSelected:(BOOL)a3
{
  self->_selected = a3;
}

- (VKRouteInfo)routeInfo
{
  return self->_routeInfo;
}

- (void)setRouteInfo:(id)a3
{
  objc_storeStrong((id *)&self->_routeInfo, a3);
}

- (VKRouteEtaDescription)displayEtaDescription
{
  return self->_displayEtaDescription;
}

- (BOOL)isPicked
{
  return self->_isPicked;
}

- (void)setIsPicked:(BOOL)a3
{
  self->_isPicked = a3;
}

- (BOOL)isRepositioning
{
  return self->_isRepositioning;
}

- (void)setIsRepositioning:(BOOL)a3
{
  self->_isRepositioning = a3;
}

- (optional<gss::When>)when
{
  return self->_when;
}

- (void)setWhen:(optional<gss::When>)a3
{
  self->_when = a3;
}

- (double)worldUnitsPerMeterAtPoint
{
  return self->_worldUnitsPerMeterAtPoint;
}

- (optional<gss::RouteLegWhen>)routeLegWhen
{
  _BYTE *v2;
  optional<gss::RouteLegWhen> result;

  *v2 = 0;
  if (self->_routeLegWhen._hasValue)
  {
    v2[1] = *(&self->_routeLegWhen._hasValue + 1);
    *v2 = 1;
  }
  result._value = (ValueUnion)a2;
  result._hasValue = (char)self;
  return result;
}

- (void)setRouteLegWhen:(optional<gss::RouteLegWhen>)a3
{
  _BOOL4 hasValue;

  hasValue = self->_routeLegWhen._hasValue;
  if (**(_BYTE **)&a3._hasValue)
  {
    *(&self->_routeLegWhen._hasValue + 1) = *(_BYTE *)(*(_QWORD *)&a3._hasValue + 1);
    if (!hasValue)
      self->_routeLegWhen._hasValue = 1;
  }
  else if (self->_routeLegWhen._hasValue)
  {
    self->_routeLegWhen._hasValue = 0;
  }
}

- (BOOL)didStyleChange
{
  return self->_didStyleChange;
}

- (void)setDidStyleChange:(BOOL)a3
{
  self->_didStyleChange = a3;
}

- (void).cxx_destruct
{
  if (self->_routeLegWhen._hasValue)
    self->_routeLegWhen._hasValue = 0;
  objc_storeStrong((id *)&self->_displayEtaDescription, 0);
  objc_storeStrong((id *)&self->_routeInfo, 0);
  objc_storeStrong((id *)&self->_etaLabel, 0);
}

- (id).cxx_construct
{
  *(_QWORD *)((char *)self + 28) = 0xBF80000000000000;
  *(_WORD *)((char *)self + 59) = 0;
  *((_BYTE *)self + 104) = 0;
  return self;
}

+ (id)artworkForEtaDescription:(id)a3 navContext:(const NavContext *)a4 roadSignStyleGroup:(const void *)a5 mercatorPoint:(const void *)a6 orientation:(unsigned __int8)a7 isSelected:(BOOL)a8 artworkCache:(void *)a9
{
  id v10[2];

  artworkAndKeyForEtaLabel(v10, a3, (uint64_t)a4, (uint64_t)a5, a6, a7, (uint64_t *)a9);
  return v10[0];
}

+ (vector<GeoCodecsFeatureStylePair,)baseAttributesForEtaLabel:(mdm:(id)a2 :(SEL)a3 Allocator>> *__return_ptr)retstr focused:(BOOL)a4 etaComparison:(BOOL)a5 transportType:(unsigned __int8)a6 navLabelType:(unsigned __int8)a7 when:(unsigned __int8)a8 routeLegWhen:(optional<gss:(optional<gss:(id)a11 :RouteLegWhen>)a10 :When>)a9 additionalAttributes:
{
  uint64_t v12;
  uint64_t v13;
  _BOOL4 v14;
  _BOOL4 v15;
  unsigned __int8 v17;
  uint64_t v18;
  GeoCodecsFeatureStylePair *var1;
  GeoCodecsFeatureStylePair *var0;
  GeoCodecsFeatureStylePair *v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  GeoCodecsFeatureStylePair *v27;
  GeoCodecsFeatureStylePair *v28;
  GeoCodecsFeatureStylePair *v29;
  GeoCodecsFeatureStylePair *v30;
  unint64_t v31;
  uint64_t v32;
  GeoCodecsFeatureStylePair *v33;
  GeoCodecsFeatureStylePair *v34;
  GeoCodecsFeatureStylePair *v35;
  uint64_t v36;
  __int128 v37;
  GeoCodecsFeatureStylePair v38;
  GeoCodecsFeatureStylePair *v39;
  GeoCodecsFeatureStylePair *v40;
  GeoCodecsFeatureStylePair *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  GeoCodecsFeatureStylePair *v47;
  GeoCodecsFeatureStylePair *v48;
  GeoCodecsFeatureStylePair *v49;
  GeoCodecsFeatureStylePair *v50;
  unint64_t v51;
  uint64_t v52;
  GeoCodecsFeatureStylePair *v53;
  GeoCodecsFeatureStylePair *v54;
  GeoCodecsFeatureStylePair *v55;
  uint64_t v56;
  __int128 v57;
  GeoCodecsFeatureStylePair v58;
  GeoCodecsFeatureStylePair *v59;
  GeoCodecsFeatureStylePair *v60;
  uint64_t v61;
  GeoCodecsFeatureStylePair *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  GeoCodecsFeatureStylePair *v68;
  GeoCodecsFeatureStylePair *v69;
  uint64_t v70;
  GeoCodecsFeatureStylePair *v71;
  GeoCodecsFeatureStylePair *v72;
  unint64_t v73;
  uint64_t v74;
  GeoCodecsFeatureStylePair *v75;
  GeoCodecsFeatureStylePair *v76;
  GeoCodecsFeatureStylePair *v77;
  uint64_t v78;
  __int128 v79;
  GeoCodecsFeatureStylePair v80;
  GeoCodecsFeatureStylePair *v81;
  GeoCodecsFeatureStylePair *v82;
  uint64_t v83;
  GeoCodecsFeatureStylePair *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  GeoCodecsFeatureStylePair *v90;
  GeoCodecsFeatureStylePair *v91;
  uint64_t v92;
  GeoCodecsFeatureStylePair *v93;
  GeoCodecsFeatureStylePair *v94;
  unint64_t v95;
  uint64_t v96;
  GeoCodecsFeatureStylePair *v97;
  GeoCodecsFeatureStylePair *v98;
  GeoCodecsFeatureStylePair *v99;
  uint64_t v100;
  __int128 v101;
  GeoCodecsFeatureStylePair v102;
  GeoCodecsFeatureStylePair *v103;
  GeoCodecsFeatureStylePair *v104;
  GeoCodecsFeatureStylePair *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  GeoCodecsFeatureStylePair *v111;
  GeoCodecsFeatureStylePair *v112;
  GeoCodecsFeatureStylePair *v113;
  GeoCodecsFeatureStylePair *v114;
  unint64_t v115;
  uint64_t v116;
  GeoCodecsFeatureStylePair *v117;
  GeoCodecsFeatureStylePair *v118;
  GeoCodecsFeatureStylePair *v119;
  uint64_t v120;
  __int128 v121;
  GeoCodecsFeatureStylePair v122;
  GeoCodecsFeatureStylePair *v123;
  GeoCodecsFeatureStylePair *v124;
  GeoCodecsFeatureStylePair *v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  GeoCodecsFeatureStylePair *v131;
  GeoCodecsFeatureStylePair *v132;
  GeoCodecsFeatureStylePair *v133;
  GeoCodecsFeatureStylePair *v134;
  unint64_t v135;
  uint64_t v136;
  GeoCodecsFeatureStylePair *v137;
  GeoCodecsFeatureStylePair *v138;
  GeoCodecsFeatureStylePair *v139;
  uint64_t v140;
  __int128 v141;
  GeoCodecsFeatureStylePair v142;
  GeoCodecsFeatureStylePair *v143;
  GeoCodecsFeatureStylePair *v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  GeoCodecsFeatureStylePair *v150;
  GeoCodecsFeatureStylePair *v151;
  GeoCodecsFeatureStylePair *v152;
  GeoCodecsFeatureStylePair *v153;
  unint64_t v154;
  uint64_t v155;
  GeoCodecsFeatureStylePair *v156;
  GeoCodecsFeatureStylePair *v157;
  GeoCodecsFeatureStylePair *v158;
  uint64_t v159;
  __int128 v160;
  GeoCodecsFeatureStylePair v161;
  GeoCodecsFeatureStylePair *v162;
  uint64_t v163;
  GeoCodecsFeatureStylePair *v164;
  GeoCodecsFeatureStylePair *v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  GeoCodecsFeatureStylePair *v171;
  GeoCodecsFeatureStylePair *v172;
  GeoCodecsFeatureStylePair *v173;
  GeoCodecsFeatureStylePair *v174;
  unint64_t v175;
  uint64_t v176;
  GeoCodecsFeatureStylePair *v177;
  GeoCodecsFeatureStylePair *v178;
  GeoCodecsFeatureStylePair *v179;
  uint64_t v180;
  __int128 v181;
  GeoCodecsFeatureStylePair v182;
  GeoCodecsFeatureStylePair *v183;
  unint64_t i;
  GeoCodecsFeatureStylePair *v185;
  uint64_t v186;
  uint64_t v187;
  GeoCodecsFeatureStylePair *v188;
  GeoCodecsFeatureStylePair *v189;
  uint64_t v190;
  unint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  GeoCodecsFeatureStylePair *v196;
  GeoCodecsFeatureStylePair *v197;
  GeoCodecsFeatureStylePair *v198;
  int64_t v199;
  unint64_t v200;
  GeoCodecsFeatureStylePair *v201;
  uint64_t v202;
  _OWORD *v203;
  GeoCodecsFeatureStylePair *v204;
  uint64_t v205;
  __int128 v206;
  GeoCodecsFeatureStylePair v207;
  GeoCodecsFeatureStylePair *v208;
  vector<GeoCodecsFeatureStylePair, geo::StdAllocator<GeoCodecsFeatureStylePair, mdm::Allocator>> *result;
  uint64_t v210;
  uint64_t v211;
  id v212;

  v12 = a8;
  v211 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v212 = *(id *)&a10._value.type;
  retstr->var1 = 0;
  retstr->var2.var0 = 0;
  retstr->var0 = 0;
  {
    v210 = operator new();
    mdm::Allocator::instance(void)::alloc = geo::MallocZoneAllocator::MallocZoneAllocator(v210, "VectorKitLabels", 0x5ED09DD50000000FLL);
  }
  v18 = mdm::Allocator::instance(void)::alloc;
  retstr->var2.var1.var0 = (Allocator *)mdm::Allocator::instance(void)::alloc;
  var1 = retstr->var1;
  var0 = retstr->var2.var0;
  if (var1 < var0)
  {
    if (var1)
      *var1 = (GeoCodecsFeatureStylePair)0x1000000005;
    v21 = var1 + 1;
    goto LABEL_29;
  }
  v22 = var1 - retstr->var0;
  v23 = v22 + 1;
  if ((unint64_t)(v22 + 1) >> 61)
    abort();
  v24 = (char *)var0 - (char *)retstr->var0;
  if (v24 >> 2 > v23)
    v23 = v24 >> 2;
  if ((unint64_t)v24 >= 0x7FFFFFFFFFFFFFF8)
    v25 = 0x1FFFFFFFFFFFFFFFLL;
  else
    v25 = v23;
  if (v25)
  {
    v26 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v18 + 16))(v18, 8 * v25, 4);
    v27 = (GeoCodecsFeatureStylePair *)(v26 + 8 * v22);
    v28 = (GeoCodecsFeatureStylePair *)(v26 + 8 * v25);
    if (v26)
      *v27 = (GeoCodecsFeatureStylePair)0x1000000005;
  }
  else
  {
    v28 = 0;
    v27 = (GeoCodecsFeatureStylePair *)(8 * v22);
  }
  v21 = v27 + 1;
  v30 = retstr->var0;
  v29 = retstr->var1;
  if (v29 != retstr->var0)
  {
    v31 = (char *)v29 - (char *)retstr->var0 - 8;
    if (v31 < 0x38)
    {
      v33 = retstr->var1;
    }
    else if ((unint64_t)((char *)v29 - (char *)v27) < 0x20)
    {
      v33 = retstr->var1;
    }
    else
    {
      v32 = (v31 >> 3) + 1;
      v33 = &v29[-(v32 & 0x3FFFFFFFFFFFFFFCLL)];
      v34 = v27 - 2;
      v35 = v29 - 2;
      v36 = v32 & 0x3FFFFFFFFFFFFFFCLL;
      do
      {
        v37 = *(_OWORD *)&v35->var0;
        *(_OWORD *)&v34[-2].var0 = *(_OWORD *)&v35[-2].var0;
        *(_OWORD *)&v34->var0 = v37;
        v34 -= 4;
        v35 -= 4;
        v36 -= 4;
      }
      while (v36);
      v27 -= v32 & 0x3FFFFFFFFFFFFFFCLL;
      if (v32 == (v32 & 0x3FFFFFFFFFFFFFFCLL))
        goto LABEL_26;
    }
    do
    {
      v38 = v33[-1];
      --v33;
      v27[-1] = v38;
      --v27;
    }
    while (v33 != v30);
LABEL_26:
    v29 = retstr->var0;
  }
  retstr->var0 = v27;
  retstr->var1 = v21;
  v39 = retstr->var2.var0;
  retstr->var2.var0 = v28;
  if (v29)
    (*(void (**)(Allocator *, GeoCodecsFeatureStylePair *, int64_t))(*(_QWORD *)retstr->var2.var1.var0
                                                                                     + 40))(retstr->var2.var1.var0, v29, (char *)v39 - (char *)v29);
LABEL_29:
  retstr->var1 = v21;
  v40 = retstr->var2.var0;
  if (v21 < v40)
  {
    *v21 = (GeoCodecsFeatureStylePair)(((v12 << 32) | 0x10002) + 51);
    v41 = v21 + 1;
    goto LABEL_54;
  }
  v42 = v21 - retstr->var0;
  if ((unint64_t)(v42 + 1) >> 61)
    abort();
  v43 = (char *)v40 - (char *)retstr->var0;
  v44 = v43 >> 2;
  if (v43 >> 2 <= (unint64_t)(v42 + 1))
    v44 = v42 + 1;
  if ((unint64_t)v43 >= 0x7FFFFFFFFFFFFFF8)
    v45 = 0x1FFFFFFFFFFFFFFFLL;
  else
    v45 = v44;
  if (v45)
  {
    v46 = (*(uint64_t (**)(Allocator *, uint64_t, uint64_t))(*(_QWORD *)retstr->var2.var1.var0 + 16))(retstr->var2.var1.var0, 8 * v45, 4);
    v47 = (GeoCodecsFeatureStylePair *)(v46 + 8 * v42);
    v48 = (GeoCodecsFeatureStylePair *)(v46 + 8 * v45);
    if (v46)
      *v47 = (GeoCodecsFeatureStylePair)(((v12 << 32) | 0x10002) + 51);
  }
  else
  {
    v48 = 0;
    v47 = (GeoCodecsFeatureStylePair *)(8 * v42);
  }
  v41 = v47 + 1;
  v50 = retstr->var0;
  v49 = retstr->var1;
  if (v49 != retstr->var0)
  {
    v51 = (char *)v49 - (char *)retstr->var0 - 8;
    if (v51 < 0x38)
    {
      v53 = retstr->var1;
    }
    else if ((unint64_t)((char *)v49 - (char *)v47) < 0x20)
    {
      v53 = retstr->var1;
    }
    else
    {
      v52 = (v51 >> 3) + 1;
      v53 = &v49[-(v52 & 0x3FFFFFFFFFFFFFFCLL)];
      v54 = v47 - 2;
      v55 = v49 - 2;
      v56 = v52 & 0x3FFFFFFFFFFFFFFCLL;
      do
      {
        v57 = *(_OWORD *)&v55->var0;
        *(_OWORD *)&v54[-2].var0 = *(_OWORD *)&v55[-2].var0;
        *(_OWORD *)&v54->var0 = v57;
        v54 -= 4;
        v55 -= 4;
        v56 -= 4;
      }
      while (v56);
      v47 -= v52 & 0x3FFFFFFFFFFFFFFCLL;
      if (v52 == (v52 & 0x3FFFFFFFFFFFFFFCLL))
        goto LABEL_51;
    }
    do
    {
      v58 = v53[-1];
      --v53;
      v47[-1] = v58;
      --v47;
    }
    while (v53 != v50);
LABEL_51:
    v49 = retstr->var0;
  }
  retstr->var0 = v47;
  retstr->var1 = v41;
  v59 = retstr->var2.var0;
  retstr->var2.var0 = v48;
  if (v49)
    (*(void (**)(Allocator *, GeoCodecsFeatureStylePair *, int64_t))(*(_QWORD *)retstr->var2.var1.var0
                                                                                     + 40))(retstr->var2.var1.var0, v49, (char *)v59 - (char *)v49);
LABEL_54:
  retstr->var1 = v41;
  v60 = retstr->var2.var0;
  if (v41 < v60)
  {
    if (v15)
      v61 = 0x100010002;
    else
      v61 = 65538;
    *v41 = (GeoCodecsFeatureStylePair)v61;
    v62 = v41 + 1;
    goto LABEL_85;
  }
  v63 = v41 - retstr->var0;
  if ((unint64_t)(v63 + 1) >> 61)
    abort();
  v64 = (char *)v60 - (char *)retstr->var0;
  v65 = v64 >> 2;
  if (v64 >> 2 <= (unint64_t)(v63 + 1))
    v65 = v63 + 1;
  if ((unint64_t)v64 >= 0x7FFFFFFFFFFFFFF8)
    v66 = 0x1FFFFFFFFFFFFFFFLL;
  else
    v66 = v65;
  if (v66)
  {
    v67 = (*(uint64_t (**)(Allocator *, uint64_t, uint64_t))(*(_QWORD *)retstr->var2.var1.var0 + 16))(retstr->var2.var1.var0, 8 * v66, 4);
    v68 = (GeoCodecsFeatureStylePair *)(v67 + 8 * v63);
    v69 = (GeoCodecsFeatureStylePair *)(v67 + 8 * v66);
    if (v67)
    {
      if (v15)
        v70 = 0x100010002;
      else
        v70 = 65538;
      *v68 = (GeoCodecsFeatureStylePair)v70;
    }
  }
  else
  {
    v69 = 0;
    v68 = (GeoCodecsFeatureStylePair *)(8 * v63);
  }
  v62 = v68 + 1;
  v72 = retstr->var0;
  v71 = retstr->var1;
  if (v71 != retstr->var0)
  {
    v73 = (char *)v71 - (char *)retstr->var0 - 8;
    if (v73 < 0x38)
    {
      v75 = retstr->var1;
    }
    else if ((unint64_t)((char *)v71 - (char *)v68) < 0x20)
    {
      v75 = retstr->var1;
    }
    else
    {
      v74 = (v73 >> 3) + 1;
      v75 = &v71[-(v74 & 0x3FFFFFFFFFFFFFFCLL)];
      v76 = v68 - 2;
      v77 = v71 - 2;
      v78 = v74 & 0x3FFFFFFFFFFFFFFCLL;
      do
      {
        v79 = *(_OWORD *)&v77->var0;
        *(_OWORD *)&v76[-2].var0 = *(_OWORD *)&v77[-2].var0;
        *(_OWORD *)&v76->var0 = v79;
        v76 -= 4;
        v77 -= 4;
        v78 -= 4;
      }
      while (v78);
      v68 -= v74 & 0x3FFFFFFFFFFFFFFCLL;
      if (v74 == (v74 & 0x3FFFFFFFFFFFFFFCLL))
        goto LABEL_82;
    }
    do
    {
      v80 = v75[-1];
      --v75;
      v68[-1] = v80;
      --v68;
    }
    while (v75 != v72);
LABEL_82:
    v71 = retstr->var0;
  }
  retstr->var0 = v68;
  retstr->var1 = v62;
  v81 = retstr->var2.var0;
  retstr->var2.var0 = v69;
  if (v71)
    (*(void (**)(Allocator *, GeoCodecsFeatureStylePair *, int64_t))(*(_QWORD *)retstr->var2.var1.var0
                                                                                     + 40))(retstr->var2.var1.var0, v71, (char *)v81 - (char *)v71);
LABEL_85:
  retstr->var1 = v62;
  v82 = retstr->var2.var0;
  if (v62 < v82)
  {
    if (v14)
      v83 = 0x100010002;
    else
      v83 = 65538;
    *v62 = (GeoCodecsFeatureStylePair)(v83 + 75);
    v84 = v62 + 1;
    goto LABEL_116;
  }
  v85 = v62 - retstr->var0;
  if ((unint64_t)(v85 + 1) >> 61)
    abort();
  v86 = (char *)v82 - (char *)retstr->var0;
  v87 = v86 >> 2;
  if (v86 >> 2 <= (unint64_t)(v85 + 1))
    v87 = v85 + 1;
  if ((unint64_t)v86 >= 0x7FFFFFFFFFFFFFF8)
    v88 = 0x1FFFFFFFFFFFFFFFLL;
  else
    v88 = v87;
  if (v88)
  {
    v89 = (*(uint64_t (**)(Allocator *, uint64_t, uint64_t))(*(_QWORD *)retstr->var2.var1.var0 + 16))(retstr->var2.var1.var0, 8 * v88, 4);
    v90 = (GeoCodecsFeatureStylePair *)(v89 + 8 * v85);
    v91 = (GeoCodecsFeatureStylePair *)(v89 + 8 * v88);
    if (v89)
    {
      if (v14)
        v92 = 0x100010002;
      else
        v92 = 65538;
      *v90 = (GeoCodecsFeatureStylePair)(v92 + 75);
    }
  }
  else
  {
    v91 = 0;
    v90 = (GeoCodecsFeatureStylePair *)(8 * v85);
  }
  v84 = v90 + 1;
  v94 = retstr->var0;
  v93 = retstr->var1;
  if (v93 != retstr->var0)
  {
    v95 = (char *)v93 - (char *)retstr->var0 - 8;
    if (v95 < 0x38)
    {
      v97 = retstr->var1;
    }
    else if ((unint64_t)((char *)v93 - (char *)v90) < 0x20)
    {
      v97 = retstr->var1;
    }
    else
    {
      v96 = (v95 >> 3) + 1;
      v97 = &v93[-(v96 & 0x3FFFFFFFFFFFFFFCLL)];
      v98 = v90 - 2;
      v99 = v93 - 2;
      v100 = v96 & 0x3FFFFFFFFFFFFFFCLL;
      do
      {
        v101 = *(_OWORD *)&v99->var0;
        *(_OWORD *)&v98[-2].var0 = *(_OWORD *)&v99[-2].var0;
        *(_OWORD *)&v98->var0 = v101;
        v98 -= 4;
        v99 -= 4;
        v100 -= 4;
      }
      while (v100);
      v90 -= v96 & 0x3FFFFFFFFFFFFFFCLL;
      if (v96 == (v96 & 0x3FFFFFFFFFFFFFFCLL))
        goto LABEL_113;
    }
    do
    {
      v102 = v97[-1];
      --v97;
      v90[-1] = v102;
      --v90;
    }
    while (v97 != v94);
LABEL_113:
    v93 = retstr->var0;
  }
  retstr->var0 = v90;
  retstr->var1 = v84;
  v103 = retstr->var2.var0;
  retstr->var2.var0 = v91;
  if (v93)
    (*(void (**)(Allocator *, GeoCodecsFeatureStylePair *, int64_t))(*(_QWORD *)retstr->var2.var1.var0
                                                                                     + 40))(retstr->var2.var1.var0, v93, (char *)v103 - (char *)v93);
LABEL_116:
  retstr->var1 = v84;
  v104 = retstr->var2.var0;
  if (v84 < v104)
  {
    *v84 = (GeoCodecsFeatureStylePair)(((v13 << 32) | 0x10002) + 69);
    v105 = v84 + 1;
    goto LABEL_141;
  }
  v106 = v84 - retstr->var0;
  if ((unint64_t)(v106 + 1) >> 61)
    abort();
  v107 = (char *)v104 - (char *)retstr->var0;
  v108 = v107 >> 2;
  if (v107 >> 2 <= (unint64_t)(v106 + 1))
    v108 = v106 + 1;
  if ((unint64_t)v107 >= 0x7FFFFFFFFFFFFFF8)
    v109 = 0x1FFFFFFFFFFFFFFFLL;
  else
    v109 = v108;
  if (v109)
  {
    v110 = (*(uint64_t (**)(Allocator *, uint64_t, uint64_t))(*(_QWORD *)retstr->var2.var1.var0 + 16))(retstr->var2.var1.var0, 8 * v109, 4);
    v111 = (GeoCodecsFeatureStylePair *)(v110 + 8 * v106);
    v112 = (GeoCodecsFeatureStylePair *)(v110 + 8 * v109);
    if (v110)
      *v111 = (GeoCodecsFeatureStylePair)(((v13 << 32) | 0x10002) + 69);
  }
  else
  {
    v112 = 0;
    v111 = (GeoCodecsFeatureStylePair *)(8 * v106);
  }
  v105 = v111 + 1;
  v114 = retstr->var0;
  v113 = retstr->var1;
  if (v113 != retstr->var0)
  {
    v115 = (char *)v113 - (char *)retstr->var0 - 8;
    if (v115 < 0x38)
    {
      v117 = retstr->var1;
    }
    else if ((unint64_t)((char *)v113 - (char *)v111) < 0x20)
    {
      v117 = retstr->var1;
    }
    else
    {
      v116 = (v115 >> 3) + 1;
      v117 = &v113[-(v116 & 0x3FFFFFFFFFFFFFFCLL)];
      v118 = v111 - 2;
      v119 = v113 - 2;
      v120 = v116 & 0x3FFFFFFFFFFFFFFCLL;
      do
      {
        v121 = *(_OWORD *)&v119->var0;
        *(_OWORD *)&v118[-2].var0 = *(_OWORD *)&v119[-2].var0;
        *(_OWORD *)&v118->var0 = v121;
        v118 -= 4;
        v119 -= 4;
        v120 -= 4;
      }
      while (v120);
      v111 -= v116 & 0x3FFFFFFFFFFFFFFCLL;
      if (v116 == (v116 & 0x3FFFFFFFFFFFFFFCLL))
        goto LABEL_138;
    }
    do
    {
      v122 = v117[-1];
      --v117;
      v111[-1] = v122;
      --v111;
    }
    while (v117 != v114);
LABEL_138:
    v113 = retstr->var0;
  }
  retstr->var0 = v111;
  retstr->var1 = v105;
  v123 = retstr->var2.var0;
  retstr->var2.var0 = v112;
  if (v113)
    (*(void (**)(Allocator *, GeoCodecsFeatureStylePair *, int64_t))(*(_QWORD *)retstr->var2.var1.var0
                                                                                     + 40))(retstr->var2.var1.var0, v113, (char *)v123 - (char *)v113);
LABEL_141:
  retstr->var1 = v105;
  v124 = retstr->var2.var0;
  if (v105 < v124)
  {
    *v105 = (GeoCodecsFeatureStylePair)(((v211 << 32) | 0x10002) + 14);
    v125 = v105 + 1;
    goto LABEL_166;
  }
  v126 = v105 - retstr->var0;
  if ((unint64_t)(v126 + 1) >> 61)
    abort();
  v127 = (char *)v124 - (char *)retstr->var0;
  v128 = v127 >> 2;
  if (v127 >> 2 <= (unint64_t)(v126 + 1))
    v128 = v126 + 1;
  if ((unint64_t)v127 >= 0x7FFFFFFFFFFFFFF8)
    v129 = 0x1FFFFFFFFFFFFFFFLL;
  else
    v129 = v128;
  if (v129)
  {
    v130 = (*(uint64_t (**)(Allocator *, uint64_t, uint64_t))(*(_QWORD *)retstr->var2.var1.var0 + 16))(retstr->var2.var1.var0, 8 * v129, 4);
    v131 = (GeoCodecsFeatureStylePair *)(v130 + 8 * v126);
    v132 = (GeoCodecsFeatureStylePair *)(v130 + 8 * v129);
    if (v130)
      *v131 = (GeoCodecsFeatureStylePair)(((v211 << 32) | 0x10002) + 14);
  }
  else
  {
    v132 = 0;
    v131 = (GeoCodecsFeatureStylePair *)(8 * v126);
  }
  v125 = v131 + 1;
  v134 = retstr->var0;
  v133 = retstr->var1;
  if (v133 != retstr->var0)
  {
    v135 = (char *)v133 - (char *)retstr->var0 - 8;
    if (v135 < 0x38)
    {
      v137 = retstr->var1;
    }
    else if ((unint64_t)((char *)v133 - (char *)v131) < 0x20)
    {
      v137 = retstr->var1;
    }
    else
    {
      v136 = (v135 >> 3) + 1;
      v137 = &v133[-(v136 & 0x3FFFFFFFFFFFFFFCLL)];
      v138 = v131 - 2;
      v139 = v133 - 2;
      v140 = v136 & 0x3FFFFFFFFFFFFFFCLL;
      do
      {
        v141 = *(_OWORD *)&v139->var0;
        *(_OWORD *)&v138[-2].var0 = *(_OWORD *)&v139[-2].var0;
        *(_OWORD *)&v138->var0 = v141;
        v138 -= 4;
        v139 -= 4;
        v140 -= 4;
      }
      while (v140);
      v131 -= v136 & 0x3FFFFFFFFFFFFFFCLL;
      if (v136 == (v136 & 0x3FFFFFFFFFFFFFFCLL))
        goto LABEL_163;
    }
    do
    {
      v142 = v137[-1];
      --v137;
      v131[-1] = v142;
      --v131;
    }
    while (v137 != v134);
LABEL_163:
    v133 = retstr->var0;
  }
  retstr->var0 = v131;
  retstr->var1 = v125;
  v143 = retstr->var2.var0;
  retstr->var2.var0 = v132;
  if (v133)
    (*(void (**)(Allocator *, GeoCodecsFeatureStylePair *, int64_t))(*(_QWORD *)retstr->var2.var1.var0
                                                                                     + 40))(retstr->var2.var1.var0, v133, (char *)v143 - (char *)v133);
LABEL_166:
  retstr->var1 = v125;
  if ((*(_WORD *)&a9 & 0xFF00) == 0)
    goto LABEL_193;
  v144 = retstr->var2.var0;
  if (v125 >= v144)
  {
    v145 = v125 - retstr->var0;
    if ((unint64_t)(v145 + 1) >> 61)
      abort();
    v146 = (char *)v144 - (char *)retstr->var0;
    v147 = v146 >> 2;
    if (v146 >> 2 <= (unint64_t)(v145 + 1))
      v147 = v145 + 1;
    if ((unint64_t)v146 >= 0x7FFFFFFFFFFFFFF8)
      v148 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v148 = v147;
    if (v148)
    {
      v149 = (*(uint64_t (**)(Allocator *, uint64_t, uint64_t))(*(_QWORD *)retstr->var2.var1.var0 + 16))(retstr->var2.var1.var0, 8 * v148, 4);
      v150 = (GeoCodecsFeatureStylePair *)(v149 + 8 * v145);
      v151 = (GeoCodecsFeatureStylePair *)(v149 + 8 * v148);
      if (v149)
        *v150 = (GeoCodecsFeatureStylePair)((((unint64_t)a9.var0.__val_ << 32) | 0x10002) + 7);
    }
    else
    {
      v151 = 0;
      v150 = (GeoCodecsFeatureStylePair *)(8 * v145);
    }
    v125 = v150 + 1;
    v153 = retstr->var0;
    v152 = retstr->var1;
    if (v152 == retstr->var0)
      goto LABEL_190;
    v154 = (char *)v152 - (char *)retstr->var0 - 8;
    if (v154 < 0x38)
    {
      v156 = retstr->var1;
    }
    else if ((unint64_t)((char *)v152 - (char *)v150) < 0x20)
    {
      v156 = retstr->var1;
    }
    else
    {
      v155 = (v154 >> 3) + 1;
      v156 = &v152[-(v155 & 0x3FFFFFFFFFFFFFFCLL)];
      v157 = v150 - 2;
      v158 = v152 - 2;
      v159 = v155 & 0x3FFFFFFFFFFFFFFCLL;
      do
      {
        v160 = *(_OWORD *)&v158->var0;
        *(_OWORD *)&v157[-2].var0 = *(_OWORD *)&v158[-2].var0;
        *(_OWORD *)&v157->var0 = v160;
        v157 -= 4;
        v158 -= 4;
        v159 -= 4;
      }
      while (v159);
      v150 -= v155 & 0x3FFFFFFFFFFFFFFCLL;
      if (v155 == (v155 & 0x3FFFFFFFFFFFFFFCLL))
        goto LABEL_189;
    }
    do
    {
      v161 = v156[-1];
      --v156;
      v150[-1] = v161;
      --v150;
    }
    while (v156 != v153);
LABEL_189:
    v152 = retstr->var0;
LABEL_190:
    retstr->var0 = v150;
    retstr->var1 = v125;
    v162 = retstr->var2.var0;
    retstr->var2.var0 = v151;
    if (v152)
      (*(void (**)(Allocator *, GeoCodecsFeatureStylePair *, int64_t))(*(_QWORD *)retstr->var2.var1.var0
                                                                                       + 40))(retstr->var2.var1.var0, v152, (char *)v162 - (char *)v152);
    goto LABEL_192;
  }
  *v125++ = (GeoCodecsFeatureStylePair)((((unint64_t)a9.var0.__val_ << 32) | 0x10002) + 7);
LABEL_192:
  retstr->var1 = v125;
LABEL_193:
  if (!**(_BYTE **)&a10._hasValue)
    goto LABEL_220;
  v163 = *(unsigned __int8 *)(*(_QWORD *)&a10._hasValue + 1);
  v164 = retstr->var2.var0;
  if (v125 >= v164)
  {
    v166 = v125 - retstr->var0;
    if ((unint64_t)(v166 + 1) >> 61)
      abort();
    v167 = (char *)v164 - (char *)retstr->var0;
    v168 = v167 >> 2;
    if (v167 >> 2 <= (unint64_t)(v166 + 1))
      v168 = v166 + 1;
    if ((unint64_t)v167 >= 0x7FFFFFFFFFFFFFF8)
      v169 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v169 = v168;
    if (v169)
    {
      v170 = (*(uint64_t (**)(Allocator *, uint64_t, uint64_t))(*(_QWORD *)retstr->var2.var1.var0 + 16))(retstr->var2.var1.var0, 8 * v169, 4);
      v171 = (GeoCodecsFeatureStylePair *)(v170 + 8 * v166);
      v172 = (GeoCodecsFeatureStylePair *)(v170 + 8 * v169);
      if (v170)
        *v171 = (GeoCodecsFeatureStylePair)(((v163 << 32) | 0x10002) + 82);
    }
    else
    {
      v172 = 0;
      v171 = (GeoCodecsFeatureStylePair *)(8 * v166);
    }
    v165 = v171 + 1;
    v174 = retstr->var0;
    v173 = retstr->var1;
    if (v173 == retstr->var0)
      goto LABEL_217;
    v175 = (char *)v173 - (char *)retstr->var0 - 8;
    if (v175 < 0x38)
    {
      v177 = retstr->var1;
    }
    else if ((unint64_t)((char *)v173 - (char *)v171) < 0x20)
    {
      v177 = retstr->var1;
    }
    else
    {
      v176 = (v175 >> 3) + 1;
      v177 = &v173[-(v176 & 0x3FFFFFFFFFFFFFFCLL)];
      v178 = v171 - 2;
      v179 = v173 - 2;
      v180 = v176 & 0x3FFFFFFFFFFFFFFCLL;
      do
      {
        v181 = *(_OWORD *)&v179->var0;
        *(_OWORD *)&v178[-2].var0 = *(_OWORD *)&v179[-2].var0;
        *(_OWORD *)&v178->var0 = v181;
        v178 -= 4;
        v179 -= 4;
        v180 -= 4;
      }
      while (v180);
      v171 -= v176 & 0x3FFFFFFFFFFFFFFCLL;
      if (v176 == (v176 & 0x3FFFFFFFFFFFFFFCLL))
        goto LABEL_216;
    }
    do
    {
      v182 = v177[-1];
      --v177;
      v171[-1] = v182;
      --v171;
    }
    while (v177 != v174);
LABEL_216:
    v173 = retstr->var0;
LABEL_217:
    retstr->var0 = v171;
    retstr->var1 = v165;
    v183 = retstr->var2.var0;
    retstr->var2.var0 = v172;
    if (v173)
      (*(void (**)(Allocator *, GeoCodecsFeatureStylePair *, int64_t))(*(_QWORD *)retstr->var2.var1.var0
                                                                                       + 40))(retstr->var2.var1.var0, v173, (char *)v183 - (char *)v173);
    goto LABEL_219;
  }
  *v125 = (GeoCodecsFeatureStylePair)(((v163 << 32) | 0x10002) + 82);
  v165 = v125 + 1;
LABEL_219:
  retstr->var1 = v165;
LABEL_220:
  if (v212)
  {
    for (i = 0; i < objc_msgSend(v212, "countAttrs", v211); ++i)
    {
      v186 = objc_msgSend(v212, "v");
      v187 = v186;
      v188 = retstr->var1;
      v189 = retstr->var2.var0;
      if (v188 < v189)
      {
        if (v188)
          *v188 = *(GeoCodecsFeatureStylePair *)(v186 + 8 * i);
        v185 = v188 + 1;
        goto LABEL_223;
      }
      v190 = v188 - retstr->var0;
      v191 = v190 + 1;
      if ((unint64_t)(v190 + 1) >> 61)
        abort();
      v192 = (char *)v189 - (char *)retstr->var0;
      if (v192 >> 2 > v191)
        v191 = v192 >> 2;
      if ((unint64_t)v192 >= 0x7FFFFFFFFFFFFFF8)
        v193 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v193 = v191;
      if (v193)
      {
        v194 = (*(uint64_t (**)(Allocator *, uint64_t, uint64_t))(*(_QWORD *)retstr->var2.var1.var0 + 16))(retstr->var2.var1.var0, 8 * v193, 4);
        v195 = v194 + 8 * v190;
        v196 = (GeoCodecsFeatureStylePair *)(v194 + 8 * v193);
        if (v194)
          *(_QWORD *)v195 = *(_QWORD *)(v187 + 8 * i);
      }
      else
      {
        v196 = 0;
        v195 = 8 * v190;
      }
      v198 = retstr->var0;
      v197 = retstr->var1;
      v199 = (char *)v197 - (char *)retstr->var0;
      if (v197 == retstr->var0)
      {
        v201 = (GeoCodecsFeatureStylePair *)v195;
        goto LABEL_249;
      }
      v200 = v199 - 8;
      if ((unint64_t)(v199 - 8) < 0x38)
      {
        v201 = (GeoCodecsFeatureStylePair *)v195;
      }
      else
      {
        v201 = (GeoCodecsFeatureStylePair *)v195;
        if ((unint64_t)v197 - v195 >= 0x20)
        {
          v202 = (v200 >> 3) + 1;
          v203 = (_OWORD *)(v195 - 16);
          v204 = v197 - 2;
          v205 = v202 & 0x3FFFFFFFFFFFFFFCLL;
          do
          {
            v206 = *(_OWORD *)&v204->var0;
            *(v203 - 1) = *(_OWORD *)&v204[-2].var0;
            *v203 = v206;
            v203 -= 2;
            v204 -= 4;
            v205 -= 4;
          }
          while (v205);
          v201 = (GeoCodecsFeatureStylePair *)(v195 - 8 * (v202 & 0x3FFFFFFFFFFFFFFCLL));
          v197 -= v202 & 0x3FFFFFFFFFFFFFFCLL;
          if (v202 == (v202 & 0x3FFFFFFFFFFFFFFCLL))
            goto LABEL_248;
        }
      }
      do
      {
        v207 = v197[-1];
        --v197;
        v201[-1] = v207;
        --v201;
      }
      while (v197 != v198);
LABEL_248:
      v197 = retstr->var0;
LABEL_249:
      v185 = (GeoCodecsFeatureStylePair *)(v195 + 8);
      retstr->var0 = v201;
      retstr->var1 = (GeoCodecsFeatureStylePair *)(v195 + 8);
      v208 = retstr->var2.var0;
      retstr->var2.var0 = v196;
      if (v197)
        (*(void (**)(Allocator *, GeoCodecsFeatureStylePair *, int64_t))(*(_QWORD *)retstr->var2.var1.var0
                                                                                         + 40))(retstr->var2.var1.var0, v197, (char *)v208 - (char *)v197);
LABEL_223:
      retstr->var1 = v185;
    }
  }

  return result;
}

+ (RoadSignStyleGroup)styleForNavContext:(SEL)a3 selected:(const NavContext *)a4 focused:(BOOL)a5 etaComparison:(BOOL)a6 transportType:(unsigned __int8)a7 navLabelType:(unsigned __int8)a8 when:(unsigned __int8)a9 routeLegWhen:(optional<gss:(optional<gss:(id)a12 :RouteLegWhen>)a11 :When>)a10 additionalAttributes:
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _BOOL8 v15;
  _BOOL8 v16;
  id v19;
  id v20;
  __shared_weak_count *v21;
  void *v22;
  char *v23;
  char *v24;
  __shared_weak_count *v25;
  void *v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  char *v34;
  char *v35;
  unint64_t v36;
  uint64_t v37;
  char *v38;
  char *v39;
  char *v40;
  uint64_t v41;
  __int128 v42;
  uint64_t v43;
  unint64_t v44;
  char *v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  char *v53;
  char *v54;
  unint64_t v55;
  uint64_t v56;
  char *v57;
  char *v58;
  char *v59;
  uint64_t v60;
  __int128 v61;
  uint64_t v62;
  unint64_t v63;
  void *v64;
  __shared_weak_count *v65;
  unint64_t *v66;
  unint64_t v67;
  unint64_t *v68;
  unint64_t v69;
  unint64_t *v70;
  unint64_t v71;
  unint64_t *v72;
  unint64_t v73;
  std::__shared_weak_count *v74;
  unint64_t *p_shared_owners;
  unint64_t v76;
  std::__shared_weak_count *v77;
  unint64_t *v78;
  unint64_t v79;
  RoadSignStyleGroup *result;
  void *v81;
  __shared_weak_count *v82;
  _BYTE v83[2];
  char *v84;
  char *v85;
  unint64_t v86;
  uint64_t v87;
  void *v88;
  __shared_weak_count *v89;
  void *v90;
  std::__shared_weak_count *v91;
  void *v92;
  std::__shared_weak_count *v93;

  v12 = a9;
  v13 = a8;
  v14 = a7;
  v15 = a6;
  v16 = a5;
  v19 = *(id *)&a11._value.type;
  v92 = 0;
  v93 = 0;
  v90 = 0;
  v91 = 0;
  v88 = 0;
  v89 = 0;
  v20 = objc_alloc_init(MEMORY[0x1E0D270A8]);
  v83[0] = 0;
  if (**(_BYTE **)&a11._hasValue)
  {
    v83[1] = *(_BYTE *)(*(_QWORD *)&a11._hasValue + 1);
    v83[0] = 1;
  }
  +[VKLabelNavRouteEta baseAttributesForEtaLabel:focused:etaComparison:transportType:navLabelType:when:routeLegWhen:additionalAttributes:](VKLabelNavRouteEta, "baseAttributesForEtaLabel:focused:etaComparison:transportType:navLabelType:when:routeLegWhen:additionalAttributes:", v16, v15, v14, v13, v12, *(unsigned __int16 *)&a10, v83, v19);
  if (v83[0])
    v83[0] = 0;
  objc_msgSend(v20, "replaceAttributes:count:");
  md::NavContext::styleQueryForFeatureAttributes((md::NavContext *)&v81, (GEOFeatureStyleAttributes *)a4, v20);
  v22 = v81;
  v21 = v82;
  v90 = v81;
  v91 = (std::__shared_weak_count *)v82;
  v23 = v85;
  if (!v19)
  {
    v25 = 0;
    v26 = 0;
    goto LABEL_35;
  }
  if ((unint64_t)v85 >= v86)
  {
    v27 = (v85 - v84) >> 3;
    v28 = v27 + 1;
    if ((unint64_t)(v27 + 1) >> 61)
      abort();
    v29 = v86 - (_QWORD)v84;
    if ((uint64_t)(v86 - (_QWORD)v84) >> 2 > v28)
      v28 = v29 >> 2;
    if ((unint64_t)v29 >= 0x7FFFFFFFFFFFFFF8)
      v30 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v30 = v28;
    if (v30)
    {
      v31 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v87 + 16))(v87, 8 * v30, 4);
      v32 = (char *)(v31 + 8 * v27);
      v33 = v31 + 8 * v30;
      if (v31)
        *(_QWORD *)v32 = 0x10001004CLL;
    }
    else
    {
      v33 = 0;
      v32 = (char *)(8 * v27);
    }
    v24 = v32 + 8;
    v35 = v84;
    v34 = v85;
    if (v85 == v84)
      goto LABEL_32;
    v36 = v85 - v84 - 8;
    if (v36 < 0x38)
    {
      v38 = v85;
    }
    else if ((unint64_t)(v85 - v32) < 0x20)
    {
      v38 = v85;
    }
    else
    {
      v37 = (v36 >> 3) + 1;
      v38 = &v85[-8 * (v37 & 0x3FFFFFFFFFFFFFFCLL)];
      v39 = v32 - 16;
      v40 = v85 - 16;
      v41 = v37 & 0x3FFFFFFFFFFFFFFCLL;
      do
      {
        v42 = *(_OWORD *)v40;
        *((_OWORD *)v39 - 1) = *((_OWORD *)v40 - 1);
        *(_OWORD *)v39 = v42;
        v39 -= 32;
        v40 -= 32;
        v41 -= 4;
      }
      while (v41);
      v32 -= 8 * (v37 & 0x3FFFFFFFFFFFFFFCLL);
      if (v37 == (v37 & 0x3FFFFFFFFFFFFFFCLL))
        goto LABEL_31;
    }
    do
    {
      v43 = *((_QWORD *)v38 - 1);
      v38 -= 8;
      *((_QWORD *)v32 - 1) = v43;
      v32 -= 8;
    }
    while (v38 != v35);
LABEL_31:
    v34 = v84;
LABEL_32:
    v84 = v32;
    v85 = v24;
    v44 = v86;
    v86 = v33;
    if (v34)
      (*(void (**)(uint64_t, char *, unint64_t))(*(_QWORD *)v87 + 40))(v87, v34, v44 - (_QWORD)v34);
    goto LABEL_34;
  }
  if (v85)
    *(_QWORD *)v85 = 0x10001004CLL;
  v24 = v23 + 8;
LABEL_34:
  v85 = v24;
  objc_msgSend(v20, "replaceAttributes:count:");
  md::NavContext::styleQueryForFeatureAttributes((md::NavContext *)&v81, (GEOFeatureStyleAttributes *)a4, v20);
  v26 = v81;
  v25 = v82;
  v92 = v81;
  v93 = (std::__shared_weak_count *)v82;
  v23 = v85 - 8;
  v85 -= 8;
LABEL_35:
  if ((unint64_t)v23 < v86)
  {
    if (v23)
      *(_QWORD *)v23 = 0x30001004CLL;
    v45 = v23 + 8;
    goto LABEL_62;
  }
  v46 = (v23 - v84) >> 3;
  v47 = v46 + 1;
  if ((unint64_t)(v46 + 1) >> 61)
    abort();
  v48 = v86 - (_QWORD)v84;
  if ((uint64_t)(v86 - (_QWORD)v84) >> 2 > v47)
    v47 = v48 >> 2;
  if ((unint64_t)v48 >= 0x7FFFFFFFFFFFFFF8)
    v49 = 0x1FFFFFFFFFFFFFFFLL;
  else
    v49 = v47;
  if (v49)
  {
    v50 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v87 + 16))(v87, 8 * v49, 4);
    v51 = (char *)(v50 + 8 * v46);
    v52 = v50 + 8 * v49;
    if (v50)
      *(_QWORD *)v51 = 0x30001004CLL;
  }
  else
  {
    v52 = 0;
    v51 = (char *)(8 * v46);
  }
  v45 = v51 + 8;
  v54 = v84;
  v53 = v85;
  if (v85 != v84)
  {
    v55 = v85 - v84 - 8;
    if (v55 < 0x38)
    {
      v57 = v85;
    }
    else if ((unint64_t)(v85 - v51) < 0x20)
    {
      v57 = v85;
    }
    else
    {
      v56 = (v55 >> 3) + 1;
      v57 = &v85[-8 * (v56 & 0x3FFFFFFFFFFFFFFCLL)];
      v58 = v51 - 16;
      v59 = v85 - 16;
      v60 = v56 & 0x3FFFFFFFFFFFFFFCLL;
      do
      {
        v61 = *(_OWORD *)v59;
        *((_OWORD *)v58 - 1) = *((_OWORD *)v59 - 1);
        *(_OWORD *)v58 = v61;
        v58 -= 32;
        v59 -= 32;
        v60 -= 4;
      }
      while (v60);
      v51 -= 8 * (v56 & 0x3FFFFFFFFFFFFFFCLL);
      if (v56 == (v56 & 0x3FFFFFFFFFFFFFFCLL))
        goto LABEL_59;
    }
    do
    {
      v62 = *((_QWORD *)v57 - 1);
      v57 -= 8;
      *((_QWORD *)v51 - 1) = v62;
      v51 -= 8;
    }
    while (v57 != v54);
LABEL_59:
    v53 = v84;
  }
  v84 = v51;
  v85 = v45;
  v63 = v86;
  v86 = v52;
  if (v53)
    (*(void (**)(uint64_t, char *, unint64_t))(*(_QWORD *)v87 + 40))(v87, v53, v63 - (_QWORD)v53);
LABEL_62:
  v85 = v45;
  objc_msgSend(v20, "replaceAttributes:count:");
  md::NavContext::styleQueryForFeatureAttributes((md::NavContext *)&v81, (GEOFeatureStyleAttributes *)a4, v20);
  v64 = v81;
  v65 = v82;
  v88 = v81;
  v89 = v82;
  retstr->var0.var0 = v22;
  retstr->var0.var1 = v21;
  if (v21)
  {
    v66 = (unint64_t *)((char *)v21 + 8);
    do
      v67 = __ldxr(v66);
    while (__stxr(v67 + 1, v66));
  }
  retstr->var1.var0 = v26;
  retstr->var1.var1 = v25;
  if (v25)
  {
    v68 = (unint64_t *)((char *)v25 + 8);
    do
      v69 = __ldxr(v68);
    while (__stxr(v69 + 1, v68));
  }
  retstr->var2.var0 = v64;
  retstr->var2.var1 = v65;
  if (v65)
  {
    v70 = (unint64_t *)((char *)v65 + 8);
    do
      v71 = __ldxr(v70);
    while (__stxr(v71 + 1, v70));
  }
  if (v84)
  {
    v85 = v84;
    (*(void (**)(uint64_t, char *, unint64_t))(*(_QWORD *)v87 + 40))(v87, v84, v86 - (_QWORD)v84);
  }

  if (v65)
  {
    v72 = (unint64_t *)((char *)v65 + 8);
    do
      v73 = __ldaxr(v72);
    while (__stlxr(v73 - 1, v72));
    if (!v73)
    {
      (*(void (**)(__shared_weak_count *))(*(_QWORD *)v65 + 16))(v65);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v65);
    }
  }
  v74 = v91;
  if (v91)
  {
    p_shared_owners = (unint64_t *)&v91->__shared_owners_;
    do
      v76 = __ldaxr(p_shared_owners);
    while (__stlxr(v76 - 1, p_shared_owners));
    if (!v76)
    {
      ((void (*)(std::__shared_weak_count *))v74->__on_zero_shared)(v74);
      std::__shared_weak_count::__release_weak(v74);
    }
  }
  v77 = v93;
  if (v93)
  {
    v78 = (unint64_t *)&v93->__shared_owners_;
    do
      v79 = __ldaxr(v78);
    while (__stlxr(v79 - 1, v78));
    if (!v79)
    {
      ((void (*)(std::__shared_weak_count *))v77->__on_zero_shared)(v77);
      std::__shared_weak_count::__release_weak(v77);
    }
  }

  return result;
}

+ (unsigned)toStyleEtaComparison:(unsigned __int8)a3
{
  if (a3 >= 4u)
    return 0;
  else
    return a3;
}

+ (unsigned)toStyleNavLabelType:(int64_t)a3
{
  unsigned __int8 v3;

  v3 = a3 + 4;
  if ((unint64_t)a3 >= 5)
    return 4;
  return v3;
}

@end
