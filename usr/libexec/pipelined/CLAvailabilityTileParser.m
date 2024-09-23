@implementation CLAvailabilityTileParser

- (void).cxx_destruct
{
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;

  objc_storeStrong((id *)&self->_path, 0);
  cntrl = self->_avlTile.__cntrl_;
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

- (CLAvailabilityTileParser)initWithTilePathIncrementalIO:(id)a3
{
  id v5;
  CLAvailabilityTileParser *v6;
  CLAvailabilityTileParser *v7;
  CLAvailabilityTileParser *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CLAvailabilityTileParser;
  v6 = -[CLAvailabilityTileParser init](&v10, "init");
  v7 = v6;
  if (v6
    && (objc_storeStrong((id *)&v6->_path, a3),
        !-[CLAvailabilityTileParser _openTileFileForIncrementalIO](v7, "_openTileFileForIncrementalIO")))
  {
    v8 = 0;
  }
  else
  {
    v8 = v7;
  }

  return v8;
}

- (BOOL)_openTileFileForIncrementalIO
{
  NSURL *path;
  id v4;
  const char *v5;
  size_t v6;
  std::string::size_type v7;
  std::string *p_dst;
  NSObject *v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  int *v14;
  __shared_weak_count *cntrl;
  unint64_t *v16;
  unint64_t v17;
  int *v18;
  uint64_t v19;
  std::__shared_weak_count *v20;
  unint64_t *v21;
  unint64_t v22;
  NSObject *v23;
  __int128 v25;
  char v26;
  uint64_t v27;
  void *__p[2];
  uint64_t v29;
  __int128 v30;
  uint64_t v31;
  int *v32;
  __int128 v33;
  char v34;
  std::string __dst;

  path = self->_path;
  if (!path)
  {
    if (qword_100417EE8 == -1)
    {
      v9 = qword_100417EF0;
      if (!os_log_type_enabled((os_log_t)qword_100417EF0, OS_LOG_TYPE_FAULT))
        return 0;
    }
    else
    {
      dispatch_once(&qword_100417EE8, &stru_1003EE9E0);
      v9 = qword_100417EF0;
      if (!os_log_type_enabled((os_log_t)qword_100417EF0, OS_LOG_TYPE_FAULT))
        return 0;
    }
    LOWORD(v25) = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_FAULT, "_openTileFileForIncrementalIO: Must specify a valid path to deserialize the availability tile!", (uint8_t *)&v25, 2u);
    return 0;
  }
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[NSURL path](path, "path")));
  v5 = (const char *)objc_msgSend(v4, "UTF8String");
  v6 = strlen(v5);
  if (v6 >= 0x7FFFFFFFFFFFFFF8)
    sub_1000CDE30();
  v7 = v6;
  if (v6 >= 0x17)
  {
    v11 = (v6 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v6 | 7) != 0x17)
      v11 = v6 | 7;
    v12 = v11 + 1;
    p_dst = (std::string *)operator new(v11 + 1);
    __dst.__r_.__value_.__l.__size_ = v7;
    __dst.__r_.__value_.__r.__words[2] = v12 | 0x8000000000000000;
    __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)p_dst;
    goto LABEL_13;
  }
  *((_BYTE *)&__dst.__r_.__value_.__s + 23) = v6;
  p_dst = &__dst;
  if (v6)
LABEL_13:
    memmove(p_dst, v5, v7);
  p_dst->__r_.__value_.__s.__data_[v7] = 0;

  sub_10006DB18((const char *)&__dst, 0, (int *)&v25);
  if (v25 > 1)
  {
    v34 = 1;
    sub_10009D2C0(&__dst, &v34, (uint64_t)&v25);
    v13 = (char *)operator new(0x80uLL);
    *((_QWORD *)v13 + 1) = 0;
    *((_QWORD *)v13 + 2) = 0;
    *(_QWORD *)v13 = off_1003EEA10;
    *(_OWORD *)(v13 + 24) = v25;
    v25 = 0uLL;
    v13[40] = v26;
    *((_QWORD *)v13 + 6) = v27;
    *(_OWORD *)(v13 + 56) = *(_OWORD *)__p;
    *((_QWORD *)v13 + 9) = v29;
    __p[1] = 0;
    v29 = 0;
    v27 = 0;
    __p[0] = 0;
    *((_OWORD *)v13 + 5) = v30;
    v14 = v32;
    v32 = 0;
    *((_QWORD *)v13 + 12) = v31;
    *((_QWORD *)v13 + 13) = v14;
    *((_OWORD *)v13 + 7) = v33;
    cntrl = self->_avlTile.__cntrl_;
    self->_avlTile.__ptr_ = (AvailabilityTile *)(v13 + 24);
    self->_avlTile.__cntrl_ = (__shared_weak_count *)v13;
    if (cntrl)
    {
      v16 = (unint64_t *)((char *)cntrl + 8);
      do
        v17 = __ldaxr(v16);
      while (__stlxr(v17 - 1, v16));
      if (!v17)
      {
        (*(void (**)(__shared_weak_count *))(*(_QWORD *)cntrl + 16))(cntrl);
        std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
      }
    }
    v18 = v32;
    v32 = 0;
    if (v18)
    {
      sub_10009E290(v18);
      operator delete();
    }
    if (SHIBYTE(v29) < 0)
      operator delete(__p[0]);
    v19 = v27;
    v27 = 0;
    if (v19)
      (*(void (**)(uint64_t))(*(_QWORD *)v19 + 8))(v19);
    v20 = (std::__shared_weak_count *)*((_QWORD *)&v25 + 1);
    if (*((_QWORD *)&v25 + 1))
    {
      v21 = (unint64_t *)(*((_QWORD *)&v25 + 1) + 8);
      do
        v22 = __ldaxr(v21);
      while (__stlxr(v22 - 1, v21));
      if (!v22)
      {
        ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
        std::__shared_weak_count::__release_weak(v20);
      }
    }
    v10 = v34 != 0;
    if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
      goto LABEL_37;
    return v10;
  }
  if (qword_100417EE8 == -1)
  {
    v23 = qword_100417EF0;
    if (!os_log_type_enabled((os_log_t)qword_100417EF0, OS_LOG_TYPE_ERROR))
      goto LABEL_36;
    goto LABEL_35;
  }
  dispatch_once(&qword_100417EE8, &stru_1003EE9E0);
  v23 = qword_100417EF0;
  if (os_log_type_enabled((os_log_t)qword_100417EF0, OS_LOG_TYPE_ERROR))
  {
LABEL_35:
    LOWORD(v25) = 0;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "_openTileFileForIncrementalIO: tile doesn't exist on-disk. attempting to deserialize will fail", (uint8_t *)&v25, 2u);
  }
LABEL_36:
  v10 = 0;
  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
LABEL_37:
    operator delete(__dst.__r_.__value_.__l.__data_);
  return v10;
}

- (BOOL)tileIsOpenForIncrementalIO
{
  return *((_BYTE *)self->_avlTile.__ptr_ + 16);
}

- (BOOL)getNextVenueBoundsIncrementally:(void *)a3
{
  return sub_10009BA18((uint64_t)self->_avlTile.__ptr_, (uint64_t)a3);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

- (int)numVenuesExpected
{
  if (-[CLAvailabilityTileParser tileIsOpenForIncrementalIO](self, "tileIsOpenForIncrementalIO"))
    return *((_DWORD *)self->_avlTile.__ptr_ + 14);
  else
    return -[CLAvailabilityTileParser venuesCount](self, "venuesCount");
}

- (int)numTotalExpectedExteriorsInVenues
{
  return sub_1000C2B74((uint64_t)self->_avlTile.__ptr_);
}

- (void)getAvlTile
{
  return self->_avlTile.__ptr_;
}

- (CLAvailabilityTileParser)init
{
  CLAvailabilityTileParser *v2;
  CLAvailabilityTileParser *v3;
  NSURL *path;
  std::__shared_weak_count *cntrl;
  unint64_t *p_shared_owners;
  unint64_t v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CLAvailabilityTileParser;
  v2 = -[CLAvailabilityTileParser init](&v9, "init");
  v3 = v2;
  if (!v2)
    return v3;
  path = v2->_path;
  v2->_path = 0;

  cntrl = (std::__shared_weak_count *)v3->_avlTile.__cntrl_;
  v3->_avlTile.__ptr_ = 0;
  v3->_avlTile.__cntrl_ = 0;
  if (!cntrl)
    return v3;
  p_shared_owners = (unint64_t *)&cntrl->__shared_owners_;
  do
    v7 = __ldaxr(p_shared_owners);
  while (__stlxr(v7 - 1, p_shared_owners));
  if (v7)
    return v3;
  ((void (*)(std::__shared_weak_count *))cntrl->__on_zero_shared)(cntrl);
  std::__shared_weak_count::__release_weak(cntrl);
  return v3;
}

- (CLAvailabilityTileParser)initWithEmptyTile
{
  CLAvailabilityTileParser *v2;
  CLAvailabilityTileParser *v3;
  NSURL *path;
  __shared_weak_count *v5;
  uint64_t v6;
  std::__shared_weak_count *cntrl;
  unint64_t *p_shared_owners;
  unint64_t v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CLAvailabilityTileParser;
  v2 = -[CLAvailabilityTileParser init](&v11, "init");
  v3 = v2;
  if (!v2)
    return v3;
  path = v2->_path;
  v2->_path = 0;

  v5 = (__shared_weak_count *)operator new(0x80uLL);
  *((_QWORD *)v5 + 1) = 0;
  *((_QWORD *)v5 + 2) = 0;
  *(_QWORD *)v5 = off_1003EEA10;
  v6 = sub_1001D1F7C((uint64_t)v5 + 24);
  cntrl = (std::__shared_weak_count *)v3->_avlTile.__cntrl_;
  v3->_avlTile.__ptr_ = (AvailabilityTile *)v6;
  v3->_avlTile.__cntrl_ = v5;
  if (!cntrl)
    return v3;
  p_shared_owners = (unint64_t *)&cntrl->__shared_owners_;
  do
    v9 = __ldaxr(p_shared_owners);
  while (__stlxr(v9 - 1, p_shared_owners));
  if (v9)
    return v3;
  ((void (*)(std::__shared_weak_count *))cntrl->__on_zero_shared)(cntrl);
  std::__shared_weak_count::__release_weak(cntrl);
  return v3;
}

- (unint64_t)venuesCount
{
  return (int)sub_1001D201C((uint64_t)self->_avlTile.__ptr_);
}

+ (void)_setParamOverrides:(void *)a3 fromDict:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  unsigned int v14;
  void *v15;
  void *v16;
  unsigned int v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  unsigned int v32;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  void *v40;
  int v41;
  void *v42;
  void *v43;
  int v44;
  void *v45;
  void *v46;
  int v47;
  void *v48;
  void *v49;
  unsigned int v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  unsigned __int8 v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  unsigned __int8 v62;
  void *v63;
  void *v64;
  int v65;
  void *v66;
  void *v67;
  unsigned __int8 v68;
  void *v69;
  void *v70;
  int v71;
  void *v72;
  void *v73;
  int v74;
  void *v75;
  void *v76;
  int v77;
  void *v78;
  void *v79;
  int v80;
  void *v81;
  NSObject *v82;
  void *v83;
  NSObject *v84;
  void *v85;
  NSObject *v86;
  void *v87;
  NSObject *v88;
  void *v89;
  NSObject *v90;
  void *v91;
  NSObject *v92;
  void *v93;
  NSObject *v94;
  void *v95;
  NSObject *v96;
  void *v97;
  NSObject *v98;
  void *v99;
  NSObject *v100;
  void *v101;
  NSObject *v102;
  void *v103;
  NSObject *v104;
  void *v105;
  NSObject *v106;
  void *v107;
  NSObject *v108;
  void *v109;
  NSObject *v110;
  void *v111;
  NSObject *v112;
  uint8_t v113[16];

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForKey:", CFSTR("notifyIntervalNanos")));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("notifyIntervalNanos")));
    v8 = objc_msgSend(v7, "unsignedIntValue");
    *((_DWORD *)a3 + 75) |= 1u;
    *((_QWORD *)a3 + 2) = v8;

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForKey:", CFSTR("numParticles")));

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("numParticles")));
    v11 = objc_msgSend(v10, "unsignedIntValue");
    *((_DWORD *)a3 + 75) |= 2u;
    *((_DWORD *)a3 + 6) = v11;

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForKey:", CFSTR("localizerType")));

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("localizerType")));
    v14 = objc_msgSend(v13, "unsignedIntValue");
    *((_DWORD *)a3 + 75) |= 4u;
    *((_DWORD *)a3 + 7) = v14;

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForKey:", CFSTR("modeEstimator")));

  if (v15)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("modeEstimator")));
    v17 = objc_msgSend(v16, "unsignedIntValue");
    *((_DWORD *)a3 + 75) |= 0x10u;
    *((_DWORD *)a3 + 9) = v17;

  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForKey:", CFSTR("confidenceFactor")));

  if (v18)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("confidenceFactor")));
    objc_msgSend(v19, "floatValue");
    *((_DWORD *)a3 + 75) |= 0x20u;
    *((_DWORD *)a3 + 10) = v20;

  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForKey:", CFSTR("motionPdrUnmodelledHeadingVariancePerSecond")));

  if (v21)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("motionPdrUnmodelledHeadingVariancePerSecond")));
    objc_msgSend(v22, "floatValue");
    *((_DWORD *)a3 + 75) |= 0x40u;
    *((_DWORD *)a3 + 11) = v23;

  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForKey:", CFSTR("time2dMotionVariancePerSecond")));

  if (v24)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("time2dMotionVariancePerSecond")));
    objc_msgSend(v25, "floatValue");
    *((_DWORD *)a3 + 75) |= 0x800u;
    *((_DWORD *)a3 + 24) = v26;

  }
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForKey:", CFSTR("secondsBetweenVenueTransitions")));

  if (v27)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("secondsBetweenVenueTransitions")));
    objc_msgSend(v28, "doubleValue");
    *((_DWORD *)a3 + 75) |= 0x8000u;
    *((_QWORD *)a3 + 14) = v29;

  }
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForKey:", CFSTR("coarseIndoorFloorSelection")));

  if (v30)
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("coarseIndoorFloorSelection")));
    v32 = objc_msgSend(v31, "unsignedIntValue");
    *((_DWORD *)a3 + 75) |= 1u;
    *((_QWORD *)a3 + 2) = v32;

  }
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForKey:", CFSTR("gpsStrobeDistance")));

  if (v33)
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("gpsStrobeDistance")));
    objc_msgSend(v34, "floatValue");
    *((_DWORD *)a3 + 75) |= 0x20000u;
    *((_DWORD *)a3 + 30) = v35;

  }
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForKey:", CFSTR("lifespanDeepIndoors")));

  if (v36)
  {
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("lifespanDeepIndoors")));
    objc_msgSend(v37, "floatValue");
    *((_DWORD *)a3 + 75) |= 0x40000u;
    *((_DWORD *)a3 + 31) = v38;

  }
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForKey:", CFSTR("lifespanNearVenueEdge")));

  if (v39)
  {
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("lifespanNearVenueEdge")));
    objc_msgSend(v40, "floatValue");
    *((_DWORD *)a3 + 75) |= 0x80000u;
    *((_DWORD *)a3 + 32) = v41;

  }
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForKey:", CFSTR("lifespanAuxiliary")));

  if (v42)
  {
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("lifespanAuxiliary")));
    objc_msgSend(v43, "floatValue");
    *((_DWORD *)a3 + 75) |= 0x100000u;
    *((_DWORD *)a3 + 33) = v44;

  }
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForKey:", CFSTR("wifiLikelihoodOnMapPriorFactor")));

  if (v45)
  {
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("wifiLikelihoodOnMapPriorFactor")));
    objc_msgSend(v46, "floatValue");
    *((_DWORD *)a3 + 75) |= 0x200000u;
    *((_DWORD *)a3 + 34) = v47;

  }
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForKey:", CFSTR("coarseIndoorRadioOddsTransform")));

  if (v48)
  {
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("coarseIndoorRadioOddsTransform")));
    v50 = objc_msgSend(v49, "unsignedIntValue");
    *((_DWORD *)a3 + 75) |= 0x800000u;
    *((_DWORD *)a3 + 35) = v50;

  }
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForKey:", CFSTR("feasibleLocationRequiredPrbIndoor")));

  if (v51)
  {
    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("feasibleLocationRequiredPrbIndoor")));
    objc_msgSend(v52, "doubleValue");
    *((_DWORD *)a3 + 75) |= 0x1000000u;
    *((_QWORD *)a3 + 19) = v53;

  }
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForKey:", CFSTR("assignFloorWeightsByLikelihood")));

  if (v54)
  {
    v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("assignFloorWeightsByLikelihood")));
    v56 = objc_msgSend(v55, "BOOLValue");
    *((_DWORD *)a3 + 75) |= 0x10000000u;
    *((_BYTE *)a3 + 192) = v56;

  }
  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForKey:", CFSTR("priorOnMapWeightFraction")));

  if (v57)
  {
    v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("priorOnMapWeightFraction")));
    objc_msgSend(v58, "doubleValue");
    *((_DWORD *)a3 + 75) |= 0x20000000u;
    *((_QWORD *)a3 + 23) = v59;

  }
  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForKey:", CFSTR("enableBaroAidedFloorTransition")));

  if (v60)
  {
    v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("enableBaroAidedFloorTransition")));
    v62 = objc_msgSend(v61, "BOOLValue");
    *((_DWORD *)a3 + 75) |= 0x40000000u;
    *((_BYTE *)a3 + 193) = v62;

  }
  v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForKey:", CFSTR("time2dMotionVariancePerSecondWifi2")));

  if (v63)
  {
    v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("time2dMotionVariancePerSecondWifi2")));
    objc_msgSend(v64, "floatValue");
    *((_DWORD *)a3 + 75) |= 0x80000000;
    *((_DWORD *)a3 + 49) = v65;

  }
  v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForKey:", CFSTR("bilinearObservations")));

  if (v66)
  {
    v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("bilinearObservations")));
    v68 = objc_msgSend(v67, "BOOLValue");
    *((_DWORD *)a3 + 76) |= 2u;
    *((_BYTE *)a3 + 194) = v68;

  }
  v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForKey:", CFSTR("walkableBlueDotSearchRadius")));

  if (v69)
  {
    v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("walkableBlueDotSearchRadius")));
    objc_msgSend(v70, "floatValue");
    *((_DWORD *)a3 + 76) |= 0x10u;
    *((_DWORD *)a3 + 56) = v71;

  }
  v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForKey:", CFSTR("motionPdrUnmodelledHeadingVariancePerSecondWifi2")));

  if (v72)
  {
    v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("motionPdrUnmodelledHeadingVariancePerSecondWifi2")));
    objc_msgSend(v73, "floatValue");
    *((_DWORD *)a3 + 76) |= 0x40u;
    *((_DWORD *)a3 + 57) = v74;

  }
  v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForKey:", CFSTR("particleFilterOffMapProbabilityFloor")));

  if (v75)
  {
    v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("particleFilterOffMapProbabilityFloor")));
    objc_msgSend(v76, "floatValue");
    *((_DWORD *)a3 + 76) |= 0x100u;
    *((_DWORD *)a3 + 62) = v77;

  }
  v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForKey:", CFSTR("coarseOutdoorProbabilityFloor")));

  if (v78)
  {
    v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("coarseOutdoorProbabilityFloor")));
    objc_msgSend(v79, "floatValue");
    *((_DWORD *)a3 + 76) |= 0x200u;
    *((_DWORD *)a3 + 63) = v80;

  }
  v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForKey:", CFSTR("pdr")));

  if (v81)
  {
    if (qword_100417EE8 == -1)
    {
      v82 = (id)qword_100417EF0;
      if (!os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
      {
LABEL_55:

        goto LABEL_56;
      }
    }
    else
    {
      dispatch_once(&qword_100417EE8, &stru_1003EE9E0);
      v82 = (id)qword_100417EF0;
      if (!os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
        goto LABEL_55;
    }
    *(_WORD *)v113 = 0;
    _os_log_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_DEFAULT, "@IndoorAvl, generateAvlTileFromJSON, #warning pdr is not currently supported", v113, 2u);
    goto LABEL_55;
  }
LABEL_56:
  v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForKey:", CFSTR("pedomCompassMotionWifi2")));

  if (!v83)
    goto LABEL_61;
  if (qword_100417EE8 != -1)
  {
    dispatch_once(&qword_100417EE8, &stru_1003EE9E0);
    v84 = (id)qword_100417EF0;
    if (!os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
      goto LABEL_60;
    goto LABEL_59;
  }
  v84 = (id)qword_100417EF0;
  if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
  {
LABEL_59:
    *(_WORD *)v113 = 0;
    _os_log_impl((void *)&_mh_execute_header, v84, OS_LOG_TYPE_DEFAULT, "@IndoorAvl, generateAvlTileFromJSON, #warning pedomCompassMotionWifi2 is not currently supported", v113, 2u);
  }
LABEL_60:

LABEL_61:
  v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForKey:", CFSTR("deadReckoning")));

  if (!v85)
    goto LABEL_66;
  if (qword_100417EE8 != -1)
  {
    dispatch_once(&qword_100417EE8, &stru_1003EE9E0);
    v86 = (id)qword_100417EF0;
    if (!os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT))
      goto LABEL_65;
    goto LABEL_64;
  }
  v86 = (id)qword_100417EF0;
  if (os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT))
  {
LABEL_64:
    *(_WORD *)v113 = 0;
    _os_log_impl((void *)&_mh_execute_header, v86, OS_LOG_TYPE_DEFAULT, "@IndoorAvl, generateAvlTileFromJSON, #warning deadReckoning is not currently supported", v113, 2u);
  }
LABEL_65:

LABEL_66:
  v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForKey:", CFSTR("coarseIndoor")));

  if (!v87)
    goto LABEL_71;
  if (qword_100417EE8 != -1)
  {
    dispatch_once(&qword_100417EE8, &stru_1003EE9E0);
    v88 = (id)qword_100417EF0;
    if (!os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
      goto LABEL_70;
    goto LABEL_69;
  }
  v88 = (id)qword_100417EF0;
  if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
  {
LABEL_69:
    *(_WORD *)v113 = 0;
    _os_log_impl((void *)&_mh_execute_header, v88, OS_LOG_TYPE_DEFAULT, "@IndoorAvl, generateAvlTileFromJSON, #warning coarseIndoor is not currently supported", v113, 2u);
  }
LABEL_70:

LABEL_71:
  v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForKey:", CFSTR("gpsFusionGlobalParams")));

  if (!v89)
    goto LABEL_76;
  if (qword_100417EE8 != -1)
  {
    dispatch_once(&qword_100417EE8, &stru_1003EE9E0);
    v90 = (id)qword_100417EF0;
    if (!os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
      goto LABEL_75;
    goto LABEL_74;
  }
  v90 = (id)qword_100417EF0;
  if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
  {
LABEL_74:
    *(_WORD *)v113 = 0;
    _os_log_impl((void *)&_mh_execute_header, v90, OS_LOG_TYPE_DEFAULT, "@IndoorAvl, generateAvlTileFromJSON, #warning gpsFusionGlobalParams is not currently supported", v113, 2u);
  }
LABEL_75:

LABEL_76:
  v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForKey:", CFSTR("wifi")));

  if (!v91)
    goto LABEL_81;
  if (qword_100417EE8 != -1)
  {
    dispatch_once(&qword_100417EE8, &stru_1003EE9E0);
    v92 = (id)qword_100417EF0;
    if (!os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
      goto LABEL_80;
    goto LABEL_79;
  }
  v92 = (id)qword_100417EF0;
  if (os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
  {
LABEL_79:
    *(_WORD *)v113 = 0;
    _os_log_impl((void *)&_mh_execute_header, v92, OS_LOG_TYPE_DEFAULT, "@IndoorAvl, generateAvlTileFromJSON, #warning wifi is not currently supported", v113, 2u);
  }
LABEL_80:

LABEL_81:
  v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForKey:", CFSTR("bodyFixed")));

  if (!v93)
    goto LABEL_86;
  if (qword_100417EE8 != -1)
  {
    dispatch_once(&qword_100417EE8, &stru_1003EE9E0);
    v94 = (id)qword_100417EF0;
    if (!os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT))
      goto LABEL_85;
    goto LABEL_84;
  }
  v94 = (id)qword_100417EF0;
  if (os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT))
  {
LABEL_84:
    *(_WORD *)v113 = 0;
    _os_log_impl((void *)&_mh_execute_header, v94, OS_LOG_TYPE_DEFAULT, "@IndoorAvl, generateAvlTileFromJSON, #warning bodyFixed is not currently supported", v113, 2u);
  }
LABEL_85:

LABEL_86:
  v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForKey:", CFSTR("motionTruth")));

  if (!v95)
    goto LABEL_91;
  if (qword_100417EE8 != -1)
  {
    dispatch_once(&qword_100417EE8, &stru_1003EE9E0);
    v96 = (id)qword_100417EF0;
    if (!os_log_type_enabled(v96, OS_LOG_TYPE_DEFAULT))
      goto LABEL_90;
    goto LABEL_89;
  }
  v96 = (id)qword_100417EF0;
  if (os_log_type_enabled(v96, OS_LOG_TYPE_DEFAULT))
  {
LABEL_89:
    *(_WORD *)v113 = 0;
    _os_log_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_DEFAULT, "@IndoorAvl, generateAvlTileFromJSON, #warning motionTruth is not currently supported", v113, 2u);
  }
LABEL_90:

LABEL_91:
  v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForKey:", CFSTR("multiphoneDbm")));

  if (!v97)
    goto LABEL_96;
  if (qword_100417EE8 != -1)
  {
    dispatch_once(&qword_100417EE8, &stru_1003EE9E0);
    v98 = (id)qword_100417EF0;
    if (!os_log_type_enabled(v98, OS_LOG_TYPE_DEFAULT))
      goto LABEL_95;
    goto LABEL_94;
  }
  v98 = (id)qword_100417EF0;
  if (os_log_type_enabled(v98, OS_LOG_TYPE_DEFAULT))
  {
LABEL_94:
    *(_WORD *)v113 = 0;
    _os_log_impl((void *)&_mh_execute_header, v98, OS_LOG_TYPE_DEFAULT, "@IndoorAvl, generateAvlTileFromJSON, #warning multiphoneDbm is not currently supported", v113, 2u);
  }
LABEL_95:

LABEL_96:
  v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForKey:", CFSTR("pedomCompassMotion")));

  if (!v99)
    goto LABEL_101;
  if (qword_100417EE8 != -1)
  {
    dispatch_once(&qword_100417EE8, &stru_1003EE9E0);
    v100 = (id)qword_100417EF0;
    if (!os_log_type_enabled(v100, OS_LOG_TYPE_DEFAULT))
      goto LABEL_100;
    goto LABEL_99;
  }
  v100 = (id)qword_100417EF0;
  if (os_log_type_enabled(v100, OS_LOG_TYPE_DEFAULT))
  {
LABEL_99:
    *(_WORD *)v113 = 0;
    _os_log_impl((void *)&_mh_execute_header, v100, OS_LOG_TYPE_DEFAULT, "@IndoorAvl, generateAvlTileFromJSON, #warning pedomCompassMotion is not currently supported", v113, 2u);
  }
LABEL_100:

LABEL_101:
  v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForKey:", CFSTR("injection")));

  if (!v101)
    goto LABEL_106;
  if (qword_100417EE8 != -1)
  {
    dispatch_once(&qword_100417EE8, &stru_1003EE9E0);
    v102 = (id)qword_100417EF0;
    if (!os_log_type_enabled(v102, OS_LOG_TYPE_DEFAULT))
      goto LABEL_105;
    goto LABEL_104;
  }
  v102 = (id)qword_100417EF0;
  if (os_log_type_enabled(v102, OS_LOG_TYPE_DEFAULT))
  {
LABEL_104:
    *(_WORD *)v113 = 0;
    _os_log_impl((void *)&_mh_execute_header, v102, OS_LOG_TYPE_DEFAULT, "@IndoorAvl, generateAvlTileFromJSON, #warning injection is not currently supported", v113, 2u);
  }
LABEL_105:

LABEL_106:
  v103 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForKey:", CFSTR("beacon")));

  if (!v103)
    goto LABEL_111;
  if (qword_100417EE8 != -1)
  {
    dispatch_once(&qword_100417EE8, &stru_1003EE9E0);
    v104 = (id)qword_100417EF0;
    if (!os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
      goto LABEL_110;
    goto LABEL_109;
  }
  v104 = (id)qword_100417EF0;
  if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
  {
LABEL_109:
    *(_WORD *)v113 = 0;
    _os_log_impl((void *)&_mh_execute_header, v104, OS_LOG_TYPE_DEFAULT, "@IndoorAvl, generateAvlTileFromJSON, #warning beacon is not currently supported", v113, 2u);
  }
LABEL_110:

LABEL_111:
  v105 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForKey:", CFSTR("wallBehavior")));

  if (!v105)
    goto LABEL_116;
  if (qword_100417EE8 != -1)
  {
    dispatch_once(&qword_100417EE8, &stru_1003EE9E0);
    v106 = (id)qword_100417EF0;
    if (!os_log_type_enabled(v106, OS_LOG_TYPE_DEFAULT))
      goto LABEL_115;
    goto LABEL_114;
  }
  v106 = (id)qword_100417EF0;
  if (os_log_type_enabled(v106, OS_LOG_TYPE_DEFAULT))
  {
LABEL_114:
    *(_WORD *)v113 = 0;
    _os_log_impl((void *)&_mh_execute_header, v106, OS_LOG_TYPE_DEFAULT, "@IndoorAvl, generateAvlTileFromJSON, #warning wallBehavior is not currently supported", v113, 2u);
  }
LABEL_115:

LABEL_116:
  v107 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForKey:", CFSTR("dynamicUniverseParameters")));

  if (!v107)
    goto LABEL_121;
  if (qword_100417EE8 != -1)
  {
    dispatch_once(&qword_100417EE8, &stru_1003EE9E0);
    v108 = (id)qword_100417EF0;
    if (!os_log_type_enabled(v108, OS_LOG_TYPE_DEFAULT))
      goto LABEL_120;
    goto LABEL_119;
  }
  v108 = (id)qword_100417EF0;
  if (os_log_type_enabled(v108, OS_LOG_TYPE_DEFAULT))
  {
LABEL_119:
    *(_WORD *)v113 = 0;
    _os_log_impl((void *)&_mh_execute_header, v108, OS_LOG_TYPE_DEFAULT, "@IndoorAvl, generateAvlTileFromJSON, #warning dynamicUniverseParameters is not currently supported", v113, 2u);
  }
LABEL_120:

LABEL_121:
  v109 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForKey:", CFSTR("dynamicUniverseParameters")));

  if (!v109)
    goto LABEL_126;
  if (qword_100417EE8 != -1)
  {
    dispatch_once(&qword_100417EE8, &stru_1003EE9E0);
    v110 = (id)qword_100417EF0;
    if (!os_log_type_enabled(v110, OS_LOG_TYPE_DEFAULT))
      goto LABEL_125;
    goto LABEL_124;
  }
  v110 = (id)qword_100417EF0;
  if (os_log_type_enabled(v110, OS_LOG_TYPE_DEFAULT))
  {
LABEL_124:
    *(_WORD *)v113 = 0;
    _os_log_impl((void *)&_mh_execute_header, v110, OS_LOG_TYPE_DEFAULT, "@IndoorAvl, generateAvlTileFromJSON, #warning dynamicUniverseParameters is not currently supported", v113, 2u);
  }
LABEL_125:

LABEL_126:
  v111 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForKey:", CFSTR("altitude")));

  if (v111)
  {
    if (qword_100417EE8 == -1)
    {
      v112 = (id)qword_100417EF0;
      if (!os_log_type_enabled(v112, OS_LOG_TYPE_DEFAULT))
      {
LABEL_130:

        goto LABEL_131;
      }
    }
    else
    {
      dispatch_once(&qword_100417EE8, &stru_1003EE9E0);
      v112 = (id)qword_100417EF0;
      if (!os_log_type_enabled(v112, OS_LOG_TYPE_DEFAULT))
        goto LABEL_130;
    }
    *(_WORD *)v113 = 0;
    _os_log_impl((void *)&_mh_execute_header, v112, OS_LOG_TYPE_DEFAULT, "@IndoorAvl, generateAvlTileFromJSON, #warning altitude is not currently supported", v113, 2u);
    goto LABEL_130;
  }
LABEL_131:

}

+ (BOOL)generateAvlTileFromJSON:(id)a3 atPath:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  BOOL v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  NSObject *v29;
  id v30;
  unint64_t j;
  void *v32;
  uint64_t v33;
  int v34;
  int v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  int v39;
  int v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  id v45;
  uint64_t v46;
  void *k;
  id v48;
  wireless_diagnostics::google::protobuf::internal::StringTypeHandlerBase *v49;
  const std::string::value_type *v50;
  int v51;
  uint64_t v52;
  uint64_t v53;
  std::string *v54;
  uint64_t v55;
  uint64_t v56;
  NSObject *v57;
  id v58;
  void *v59;
  unsigned int v60;
  void *v61;
  void *v62;
  uint64_t v63;
  id v64;
  id v65;
  uint64_t v66;
  void *m;
  uint64_t v68;
  unsigned int v69;
  int v70;
  int v71;
  void *v72;
  BOOL v73;
  uint64_t v74;
  void *v75;
  void *v76;
  BOOL v77;
  void *v78;
  void *v79;
  BOOL v80;
  uint64_t v81;
  void *v82;
  unsigned int v83;
  void *v84;
  BOOL v85;
  uint64_t v86;
  void *v87;
  unsigned int v88;
  void *v89;
  BOOL v90;
  uint64_t v91;
  void *v92;
  unsigned int v93;
  void *v94;
  BOOL v95;
  uint64_t v96;
  void *v97;
  unsigned int v98;
  void *v99;
  BOOL v100;
  void *v101;
  uint64_t v102;
  void *v103;
  BOOL v104;
  void *v105;
  unsigned int v106;
  void *v107;
  BOOL v108;
  void *v109;
  unsigned int v110;
  void *v111;
  BOOL v112;
  void *v113;
  unsigned int v114;
  void *v115;
  BOOL v116;
  void *v117;
  unsigned int v118;
  void *v119;
  BOOL v120;
  void *v121;
  unsigned int v122;
  void *v123;
  BOOL v124;
  void *v125;
  unsigned int v126;
  void *v127;
  BOOL v128;
  void *v129;
  unsigned int v130;
  void *v131;
  BOOL v132;
  void *v133;
  unsigned int v134;
  void *v135;
  BOOL v136;
  void *v137;
  unsigned int v138;
  void *v139;
  BOOL v140;
  void *v141;
  int v142;
  void *v143;
  BOOL v144;
  void *v145;
  int v146;
  id v147;
  const char *v148;
  size_t v149;
  size_t v150;
  __int128 *p_dst;
  NSObject *v152;
  NSObject *v153;
  id v154;
  id v155;
  BOOL result;
  uint64_t v157;
  uint64_t v158;
  NSObject *v159;
  __int128 *v160;
  id v161;
  NSObject *v162;
  id v163;
  NSObject *v164;
  id v165;
  NSObject *v166;
  int v167;
  id v168;
  NSObject *v169;
  id v170;
  NSObject *v171;
  id v172;
  NSObject *v173;
  id v174;
  uint64_t v175;
  void *v176;
  void *v177;
  void *i;
  id v179;
  NSObject *log;
  void *v181;
  id v182;
  void *v183;
  id obj;
  uint64_t v185;
  void *v186;
  int v187;
  void *__p[2];
  int64_t v189;
  __int128 __dst;
  int64_t v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  __int128 v197;
  __int128 v198;
  __int128 v199;
  __int128 v200;
  __int128 v201;
  __int128 v202;
  __int128 v203;
  __int128 v204;
  __int128 v205;
  __int128 v206;
  __int128 v207;
  uint64_t v208;
  void *v209[10];
  _BYTE v210[128];
  _BYTE v211[128];
  _BYTE v212[128];
  _BYTE v213[128];
  _BYTE buf[28];
  _BYTE v215[10];
  uint64_t v216;
  uint64_t v217;
  unsigned int v218;
  unsigned int v219;
  unsigned int v220;
  unsigned int v221;
  unsigned int v222;
  unsigned int v223;
  unsigned int v224;
  unsigned int v225;
  unsigned int v226;
  int v227;
  uint64_t v228;
  int v229;
  int v230;

  v5 = a3;
  v6 = a4;
  v182 = v5;
  v177 = v6;
  if (v5)
  {
    if (v6)
    {
      v208 = 0;
      v176 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dataUsingEncoding:", 4));
      v183 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization JSONObjectWithData:options:error:](NSJSONSerialization, "JSONObjectWithData:options:error:"));
      v179 = 0;
      if (v179)
      {
        if (qword_100417EE8 != -1)
          dispatch_once(&qword_100417EE8, &stru_1003EE9E0);
        log = (id)qword_100417EF0;
        if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
        {
          v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v179, "description")));
          v8 = objc_msgSend(v7, "UTF8String");
          v9 = objc_msgSend(objc_retainAutorelease(v182), "UTF8String");
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)&buf[4] = v8;
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = v9;
          _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "@IndoorAvl, generateAvlTileFromJSON, failed to generate, error=%s, str=\n%s\n", buf, 0x16u);

        }
        v10 = 0;
        goto LABEL_154;
      }
      v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v183, "objectForKey:", CFSTR("venues")));
      v12 = v11;
      if (v11)
      {
        if (-[NSObject count](v11, "count"))
        {
          sub_10009DCEC((uint64_t)buf);
          v173 = v12;
          if (qword_100417EE8 != -1)
            dispatch_once(&qword_100417EE8, &stru_1003EE9E0);
          v13 = (id)qword_100417EF0;
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            v14 = -[NSObject count](v173, "count");
            LODWORD(v209[0]) = 134217984;
            *(void **)((char *)v209 + 4) = v14;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "@IndoorAvl, generateAvlTileFromJSON, adding %lu venues", (uint8_t *)v209, 0xCu);
          }

          v206 = 0u;
          v207 = 0u;
          v204 = 0u;
          v205 = 0u;
          log = v173;
          v174 = -[NSObject countByEnumeratingWithState:objects:count:](log, "countByEnumeratingWithState:objects:count:", &v204, v213, 16);
          if (v174)
          {
            v175 = *(_QWORD *)v205;
            do
            {
              for (i = 0; i != v174; i = (char *)i + 1)
              {
                if (*(_QWORD *)v205 != v175)
                  objc_enumerationMutation(log);
                v181 = *(void **)(*((_QWORD *)&v204 + 1) + 8 * (_QWORD)i);
                v15 = *(_DWORD *)v215;
                v16 = *(int *)&buf[24];
                if (*(int *)&buf[24] >= *(int *)v215)
                {
                  if (*(_DWORD *)v215 == *(_DWORD *)&v215[4])
                  {
                    wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve((wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase *)&buf[16], *(_DWORD *)v215 + 1);
                    v15 = *(_DWORD *)v215;
                  }
                  *(_DWORD *)v215 = v15 + 1;
                  operator new();
                }
                ++*(_DWORD *)&buf[24];
                v17 = *(_QWORD *)(*(_QWORD *)&buf[16] + 8 * v16);
                v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v181, "objectForKey:", CFSTR("exteriors")));
                v202 = 0u;
                v203 = 0u;
                v200 = 0u;
                v201 = 0u;
                obj = v18;
                v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v200, v212, 16);
                v20 = v19;
                if (v19)
                {
                  v185 = *(_QWORD *)v201;
                  do
                  {
                    v21 = 0;
                    do
                    {
                      if (*(_QWORD *)v201 != v185)
                        objc_enumerationMutation(obj);
                      v22 = *(void **)(*((_QWORD *)&v200 + 1) + 8 * (_QWORD)v21);
                      v23 = *(_DWORD *)(v17 + 52);
                      v24 = *(int *)(v17 + 48);
                      if ((int)v24 >= v23)
                      {
                        if (v23 == *(_DWORD *)(v17 + 56))
                        {
                          wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve((wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase *)(v17 + 40), v23 + 1);
                          v23 = *(_DWORD *)(v17 + 52);
                        }
                        *(_DWORD *)(v17 + 52) = v23 + 1;
                        operator new();
                      }
                      v25 = *(_QWORD *)(v17 + 40);
                      *(_DWORD *)(v17 + 48) = v24 + 1;
                      v26 = *(_QWORD *)(v25 + 8 * v24);
                      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKey:", CFSTR("latitude")));
                      v186 = v22;
                      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKey:", CFSTR("longitude")));
                      if (qword_100417EE8 != -1)
                        dispatch_once(&qword_100417EE8, &stru_1003EE9E0);
                      v29 = (id)qword_100417EF0;
                      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
                      {
                        v30 = objc_msgSend(v27, "count");
                        LODWORD(v209[0]) = 134217984;
                        *(void **)((char *)v209 + 4) = v30;
                        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEBUG, "@IndoorAvl, generateAvlTileFromJSON, adding %lu exterior points", (uint8_t *)v209, 0xCu);
                      }

                      for (j = 0; j < (unint64_t)objc_msgSend(v27, "count"); ++j)
                      {
                        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectAtIndex:", j));
                        objc_msgSend(v32, "doubleValue");
                        v34 = *(_DWORD *)(v26 + 24);
                        if (v34 == *(_DWORD *)(v26 + 28))
                        {
                          if (2 * v34 <= v34 + 1)
                            v35 = v34 + 1;
                          else
                            v35 = 2 * v34;
                          if (v35 <= 4)
                            v35 = 4;
                          *(_DWORD *)(v26 + 28) = v35;
                          operator new[]();
                        }
                        v36 = *(_QWORD *)(v26 + 16);
                        *(_DWORD *)(v26 + 24) = v34 + 1;
                        *(_QWORD *)(v36 + 8 * v34) = v33;

                        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectAtIndex:", j));
                        objc_msgSend(v37, "doubleValue");
                        v39 = *(_DWORD *)(v26 + 48);
                        if (v39 == *(_DWORD *)(v26 + 52))
                        {
                          if (2 * v39 <= v39 + 1)
                            v40 = v39 + 1;
                          else
                            v40 = 2 * v39;
                          if (v40 <= 4)
                            v40 = 4;
                          *(_DWORD *)(v26 + 52) = v40;
                          operator new[]();
                        }
                        v41 = *(_QWORD *)(v26 + 40);
                        *(_DWORD *)(v26 + 48) = v39 + 1;
                        *(_QWORD *)(v41 + 8 * v39) = v38;

                      }
                      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v186, "valueForKey:", CFSTR("tolerance")));
                      objc_msgSend(v42, "doubleValue");
                      *(_DWORD *)(v26 + 76) |= 4u;
                      *(_QWORD *)(v26 + 64) = v43;

                      v21 = (char *)v21 + 1;
                    }
                    while (v21 != v20);
                    v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v200, v212, 16);
                  }
                  while (v20);
                }

                v198 = 0u;
                v199 = 0u;
                v197 = 0u;
                v196 = 0u;
                v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v181, "objectForKey:", CFSTR("ids")));
                v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v196, v211, 16);
                if (v45)
                {
                  v46 = *(_QWORD *)v197;
                  do
                  {
                    for (k = 0; k != v45; k = (char *)k + 1)
                    {
                      if (*(_QWORD *)v197 != v46)
                        objc_enumerationMutation(v44);
                      v48 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v196 + 1) + 8 * (_QWORD)k));
                      v49 = (wireless_diagnostics::google::protobuf::internal::StringTypeHandlerBase *)objc_msgSend(v48, "UTF8String");
                      v50 = (const std::string::value_type *)v49;
                      v51 = *(_DWORD *)(v17 + 28);
                      v52 = *(int *)(v17 + 24);
                      if ((int)v52 >= v51)
                      {
                        if (v51 == *(_DWORD *)(v17 + 32))
                        {
                          v49 = (wireless_diagnostics::google::protobuf::internal::StringTypeHandlerBase *)wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve((wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase *)(v17 + 16), v51 + 1);
                          v51 = *(_DWORD *)(v17 + 28);
                        }
                        *(_DWORD *)(v17 + 28) = v51 + 1;
                        v54 = (std::string *)wireless_diagnostics::google::protobuf::internal::StringTypeHandlerBase::New(v49);
                        v55 = *(_QWORD *)(v17 + 16);
                        v56 = *(int *)(v17 + 24);
                        *(_DWORD *)(v17 + 24) = v56 + 1;
                        *(_QWORD *)(v55 + 8 * v56) = v54;
                      }
                      else
                      {
                        v53 = *(_QWORD *)(v17 + 16);
                        *(_DWORD *)(v17 + 24) = v52 + 1;
                        v54 = *(std::string **)(v53 + 8 * v52);
                      }
                      std::string::assign(v54, v50);
                      if (qword_100417EE8 != -1)
                        dispatch_once(&qword_100417EE8, &stru_1003EE9E0);
                      v57 = (id)qword_100417EF0;
                      if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
                      {
                        v58 = objc_msgSend(objc_retainAutorelease(v48), "UTF8String");
                        LODWORD(v209[0]) = 136315138;
                        *(void **)((char *)v209 + 4) = v58;
                        _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEBUG, "@IndoorAvl, generateAvlTileFromJSON, added venue ID %s", (uint8_t *)v209, 0xCu);
                      }

                    }
                    v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v196, v211, 16);
                  }
                  while (v45);
                }

                v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v181, "valueForKey:", CFSTR("context")));
                v60 = objc_msgSend(v59, "intValue");

                if (v60 - 1 < 2)
                {
                  *(_DWORD *)(v17 + 104) |= 8u;
                  *(_DWORD *)(v17 + 96) = v60;
                }
                v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v181, "objectForKey:", CFSTR("tileDownloadConfiguration")));
                v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "objectForKey:", CFSTR("floorIdxsForWifiDownloadOnly")));
                *(_DWORD *)(v17 + 104) |= 4u;
                v63 = *(_QWORD *)(v17 + 64);
                if (!v63)
                  operator new();
                v194 = 0u;
                v195 = 0u;
                v192 = 0u;
                v193 = 0u;
                v64 = v62;
                v65 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v192, v210, 16);
                if (v65)
                {
                  v66 = *(_QWORD *)v193;
                  do
                  {
                    for (m = 0; m != v65; m = (char *)m + 1)
                    {
                      if (*(_QWORD *)v193 != v66)
                        objc_enumerationMutation(v64);
                      v69 = objc_msgSend(*(id *)(*((_QWORD *)&v192 + 1) + 8 * (_QWORD)m), "unsignedIntValue");
                      v70 = *(_DWORD *)(v63 + 24);
                      if (v70 == *(_DWORD *)(v63 + 28))
                      {
                        if (2 * v70 <= v70 + 1)
                          v71 = v70 + 1;
                        else
                          v71 = 2 * v70;
                        if (v71 <= 4)
                          v71 = 4;
                        *(_DWORD *)(v63 + 28) = v71;
                        operator new[]();
                      }
                      v68 = *(_QWORD *)(v63 + 16);
                      *(_DWORD *)(v63 + 24) = v70 + 1;
                      *(_DWORD *)(v68 + 4 * v70) = v69;
                    }
                    v65 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v192, v210, 16);
                  }
                  while (v65);
                }

              }
              v174 = -[NSObject countByEnumeratingWithState:objects:count:](log, "countByEnumeratingWithState:objects:count:", &v204, v213, 16);
            }
            while (v174);
          }

          v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v183, "valueForKey:", CFSTR("parameterOverrides")));
          v73 = v72 == 0;

          if (!v73)
          {
            v230 |= 2u;
            v74 = v216;
            if (!v216)
              operator new();
            v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v183, "objectForKeyedSubscript:", CFSTR("parameterOverrides")));
            +[CLAvailabilityTileParser _setParamOverrides:fromDict:](CLAvailabilityTileParser, "_setParamOverrides:fromDict:", v74, v75);

          }
          v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v183, "objectForKey:", CFSTR("motionActivityDebounceParameters")));
          v77 = v76 == 0;

          if (!v77)
          {
            v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v183, "objectForKey:", CFSTR("motionActivityDebounceParameters")));
            v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "valueForKey:", CFSTR("nonFitnessToCyclingSeconds")));
            v80 = v79 == 0;

            if (!v80)
            {
              v230 |= 0x4000u;
              v81 = v228;
              if (!v228)
                operator new();
              v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "valueForKey:", CFSTR("nonFitnessToCyclingSeconds")));
              v83 = objc_msgSend(v82, "unsignedIntValue");
              *(_DWORD *)(v81 + 36) |= 1u;
              *(_DWORD *)(v81 + 16) = v83;

            }
            v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "valueForKey:", CFSTR("nonFitnessToRunningSeconds")));
            v85 = v84 == 0;

            if (!v85)
            {
              v230 |= 0x4000u;
              v86 = v228;
              if (!v228)
                operator new();
              v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "valueForKey:", CFSTR("nonFitnessToRunningSeconds")));
              v88 = objc_msgSend(v87, "unsignedIntValue");
              *(_DWORD *)(v86 + 36) |= 2u;
              *(_DWORD *)(v86 + 20) = v88;

            }
            v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "valueForKey:", CFSTR("runningToNonFitnessSeconds")));
            v90 = v89 == 0;

            if (!v90)
            {
              v230 |= 0x4000u;
              v91 = v228;
              if (!v228)
                operator new();
              v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "valueForKey:", CFSTR("runningToNonFitnessSeconds")));
              v93 = objc_msgSend(v92, "unsignedIntValue");
              *(_DWORD *)(v91 + 36) |= 4u;
              *(_DWORD *)(v91 + 24) = v93;

            }
            v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "valueForKey:", CFSTR("cyclingToNonFitnessSeconds")));
            v95 = v94 == 0;

            if (!v95)
            {
              v230 |= 0x4000u;
              v96 = v228;
              if (!v228)
                operator new();
              v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "valueForKey:", CFSTR("cyclingToNonFitnessSeconds")));
              v98 = objc_msgSend(v97, "unsignedIntValue");
              *(_DWORD *)(v96 + 36) |= 8u;
              *(_DWORD *)(v96 + 28) = v98;

            }
          }
          v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v183, "valueForKey:", CFSTR("availabilityZScoreConfidenceInterval")));
          v100 = v99 == 0;

          if (!v100)
          {
            v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v183, "valueForKey:", CFSTR("availabilityZScoreConfidenceInterval")));
            objc_msgSend(v101, "doubleValue");
            v230 |= 4u;
            v217 = v102;

          }
          v103 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v183, "valueForKey:", CFSTR("indoorPrefetchRadiusKM")));
          v104 = v103 == 0;

          if (!v104)
          {
            v105 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v183, "valueForKey:", CFSTR("indoorPrefetchRadiusKM")));
            v106 = objc_msgSend(v105, "unsignedIntValue");
            v230 |= 8u;
            v218 = v106;

          }
          v107 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v183, "valueForKey:", CFSTR("regionalPrefetchRadiusKM")));
          v108 = v107 == 0;

          if (!v108)
          {
            v109 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v183, "valueForKey:", CFSTR("regionalPrefetchRadiusKM")));
            v110 = objc_msgSend(v109, "unsignedIntValue");
            v230 |= 0x10u;
            v219 = v110;

          }
          v111 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v183, "valueForKey:", CFSTR("indoorPrefetchMaxFloorCount")));
          v112 = v111 == 0;

          if (!v112)
          {
            v113 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v183, "valueForKey:", CFSTR("indoorPrefetchMaxFloorCount")));
            v114 = objc_msgSend(v113, "unsignedIntValue");
            v230 |= 0x20u;
            v220 = v114;

          }
          v115 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v183, "valueForKey:", CFSTR("regionalPrefetchMaxFloorCount")));
          v116 = v115 == 0;

          if (!v116)
          {
            v117 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v183, "valueForKey:", CFSTR("regionalPrefetchMaxFloorCount")));
            v118 = objc_msgSend(v117, "unsignedIntValue");
            v230 |= 0x40u;
            v221 = v118;

          }
          v119 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v183, "valueForKey:", CFSTR("indoorPrefetchMaxTotalBytes")));
          v120 = v119 == 0;

          if (!v120)
          {
            v121 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v183, "valueForKey:", CFSTR("indoorPrefetchMaxTotalBytes")));
            v122 = objc_msgSend(v121, "unsignedIntValue");
            v230 |= 0x80u;
            v222 = v122;

          }
          v123 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v183, "valueForKey:", CFSTR("regionalPrefetchMaxTotalBytes")));
          v124 = v123 == 0;

          if (!v124)
          {
            v125 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v183, "valueForKey:", CFSTR("regionalPrefetchMaxTotalBytes")));
            v126 = objc_msgSend(v125, "unsignedIntValue");
            v230 |= 0x100u;
            v223 = v126;

          }
          v127 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v183, "valueForKey:", CFSTR("indoorLocationOfInterestMergeRadiusKM")));
          v128 = v127 == 0;

          if (!v128)
          {
            v129 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v183, "valueForKey:", CFSTR("indoorLocationOfInterestMergeRadiusKM")));
            v130 = objc_msgSend(v129, "unsignedIntValue");
            v230 |= 0x200u;
            v224 = v130;

          }
          v131 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v183, "valueForKey:", CFSTR("regionalLocationOfInterestMergeRadiusKM")));
          v132 = v131 == 0;

          if (!v132)
          {
            v133 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v183, "valueForKey:", CFSTR("regionalLocationOfInterestMergeRadiusKM")));
            v134 = objc_msgSend(v133, "unsignedIntValue");
            v230 |= 0x400u;
            v225 = v134;

          }
          v135 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v183, "valueForKey:", CFSTR("preferPredictionWithinNActivityCycles")));
          v136 = v135 == 0;

          if (!v136)
          {
            v137 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v183, "valueForKey:", CFSTR("preferPredictionWithinNActivityCycles")));
            v138 = objc_msgSend(v137, "unsignedIntValue");
            v230 |= 0x800u;
            v226 = v138;

          }
          v139 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v183, "valueForKey:", CFSTR("indoorNumberOfDaysBeforeTileRedownload")));
          v140 = v139 == 0;

          if (!v140)
          {
            v141 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v183, "valueForKey:", CFSTR("indoorNumberOfDaysBeforeTileRedownload")));
            objc_msgSend(v141, "floatValue");
            v230 |= 0x1000u;
            v227 = v142;

          }
          v143 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v183, "valueForKey:", CFSTR("regionalNumberOfDaysBeforeTileRedownload")));
          v144 = v143 == 0;

          if (!v144)
          {
            v145 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v183, "valueForKey:", CFSTR("regionalNumberOfDaysBeforeTileRedownload")));
            objc_msgSend(v145, "floatValue");
            v230 |= 0x2000u;
            v229 = v146;

          }
          v147 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v177, "path")));
          v148 = (const char *)objc_msgSend(v147, "UTF8String");
          v149 = strlen(v148);
          if (v149 >= 0x7FFFFFFFFFFFFFF8)
            sub_1000CDE30();
          v150 = v149;
          if (v149 >= 0x17)
          {
            v157 = (v149 & 0xFFFFFFFFFFFFFFF8) + 8;
            if ((v149 | 7) != 0x17)
              v157 = v149 | 7;
            v158 = v157 + 1;
            p_dst = (__int128 *)operator new(v157 + 1);
            *((_QWORD *)&__dst + 1) = v150;
            v191 = v158 | 0x8000000000000000;
            *(_QWORD *)&__dst = p_dst;
          }
          else
          {
            HIBYTE(v191) = v149;
            p_dst = &__dst;
            if (!v149)
              goto LABEL_159;
          }
          memmove(p_dst, v148, v150);
LABEL_159:
          *((_BYTE *)p_dst + v150) = 0;

          if (SHIBYTE(v191) < 0)
          {
            sub_10006CED8(__p, (void *)__dst, *((unint64_t *)&__dst + 1));
          }
          else
          {
            *(_OWORD *)__p = __dst;
            v189 = v191;
          }
          HIBYTE(v209[2]) = 16;
          strcpy((char *)v209, ".protoToFile-tmp");
          sub_1000692F8((uint64_t)__p, (uint64_t)v209);
          if (SHIBYTE(v209[2]) < 0)
            operator delete(v209[0]);
          sub_1001D21A4((uint64_t)__p, 2, &v187);
          wireless_diagnostics::google::protobuf::io::FileOutputStream::FileOutputStream((wireless_diagnostics::google::protobuf::io::FileOutputStream *)v209, v187, -1);
          sub_1000E3BEC((uint64_t)buf);
          wireless_diagnostics::google::protobuf::io::FileOutputStream::~FileOutputStream((wireless_diagnostics::google::protobuf::io::FileOutputStream *)v209);
          sub_10009E290(&v187);
          sub_100009FDC((uint64_t)__p, (uint64_t)&__dst, 0);
          if (qword_100417EE8 != -1)
            dispatch_once(&qword_100417EE8, &stru_1003EE9E0);
          v159 = (id)qword_100417EF0;
          if (os_log_type_enabled(v159, OS_LOG_TYPE_DEBUG))
          {
            v160 = &__dst;
            if (v191 < 0)
              v160 = (__int128 *)__dst;
            LODWORD(v209[0]) = 136315138;
            *(void **)((char *)v209 + 4) = v160;
            _os_log_impl((void *)&_mh_execute_header, v159, OS_LOG_TYPE_DEBUG, "@IndoorAvl, generateAvlTileFromJSON, find tile at %s", (uint8_t *)v209, 0xCu);
          }

          if (SHIBYTE(v189) < 0)
            operator delete(__p[0]);
          if (SHIBYTE(v191) < 0)
            operator delete((void *)__dst);
          sub_10009DE40(buf);
          v10 = 1;
          goto LABEL_154;
        }
        if (qword_100417EE8 != -1)
          dispatch_once(&qword_100417EE8, &stru_1003EE9E0);
        v152 = v12;
        v153 = (id)qword_100417EF0;
        if (os_log_type_enabled(v153, OS_LOG_TYPE_ERROR))
        {
          v155 = objc_msgSend(objc_retainAutorelease(v182), "UTF8String");
          *(_DWORD *)buf = 136315138;
          *(_QWORD *)&buf[4] = v155;
          _os_log_impl((void *)&_mh_execute_header, v153, OS_LOG_TYPE_ERROR, "@IndoorAvl, generateAvlTileFromJSON, expected at least one venue, str=\n%s\n", buf, 0xCu);
        }
      }
      else
      {
        if (qword_100417EE8 != -1)
          dispatch_once(&qword_100417EE8, &stru_1003EE9E0);
        v152 = 0;
        v153 = (id)qword_100417EF0;
        if (os_log_type_enabled(v153, OS_LOG_TYPE_ERROR))
        {
          v154 = objc_msgSend(objc_retainAutorelease(v182), "UTF8String");
          *(_DWORD *)buf = 136315138;
          *(_QWORD *)&buf[4] = v154;
          _os_log_impl((void *)&_mh_execute_header, v153, OS_LOG_TYPE_ERROR, "@IndoorAvl, generateAvlTileFromJSON, no venues given in avl tile json??, str=\n%s\n", buf, 0xCu);
        }
      }

      v10 = 0;
      log = v152;
LABEL_154:

      return v10;
    }
    v168 = sub_1000E089C();
    v169 = objc_claimAutoreleasedReturnValue(v168);
    if (os_log_type_enabled(v169, OS_LOG_TYPE_FAULT))
    {
      *(_QWORD *)buf = 68289539;
      *(_WORD *)&buf[8] = 2082;
      *(_QWORD *)&buf[10] = "";
      *(_WORD *)&buf[18] = 2082;
      *(_QWORD *)&buf[20] = "assert";
      *(_WORD *)v215 = 2081;
      *(_QWORD *)&v215[2] = "path != nullptr";
      _os_log_impl((void *)&_mh_execute_header, v169, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"@IndoorAvl, generateAvlTileFromJSON, cannot generate at nil path\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    v170 = sub_1000E089C();
    v171 = objc_claimAutoreleasedReturnValue(v170);
    if (os_signpost_enabled(v171))
    {
      *(_QWORD *)buf = 68289539;
      *(_WORD *)&buf[8] = 2082;
      *(_QWORD *)&buf[10] = "";
      *(_WORD *)&buf[18] = 2082;
      *(_QWORD *)&buf[20] = "assert";
      *(_WORD *)v215 = 2081;
      *(_QWORD *)&v215[2] = "path != nullptr";
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v171, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "@IndoorAvl, generateAvlTileFromJSON, cannot generate at nil path", "{\"msg%{public}.0s\":\"@IndoorAvl, generateAvlTileFromJSON, cannot generate at nil path\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    v172 = sub_1000E089C();
    v166 = objc_claimAutoreleasedReturnValue(v172);
    if (os_log_type_enabled(v166, OS_LOG_TYPE_INFO))
    {
      *(_QWORD *)buf = 68289539;
      *(_WORD *)&buf[8] = 2082;
      *(_QWORD *)&buf[10] = "";
      *(_WORD *)&buf[18] = 2082;
      *(_QWORD *)&buf[20] = "assert";
      *(_WORD *)v215 = 2081;
      *(_QWORD *)&v215[2] = "path != nullptr";
      _os_log_impl((void *)&_mh_execute_header, v166, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"@IndoorAvl, generateAvlTileFromJSON, cannot generate at nil path\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    v167 = 254;
  }
  else
  {
    v161 = sub_1000E089C();
    v162 = objc_claimAutoreleasedReturnValue(v161);
    if (os_log_type_enabled(v162, OS_LOG_TYPE_FAULT))
    {
      *(_QWORD *)buf = 68289539;
      *(_WORD *)&buf[8] = 2082;
      *(_QWORD *)&buf[10] = "";
      *(_WORD *)&buf[18] = 2082;
      *(_QWORD *)&buf[20] = "assert";
      *(_WORD *)v215 = 2081;
      *(_QWORD *)&v215[2] = "jsonStr != nullptr";
      _os_log_impl((void *)&_mh_execute_header, v162, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"@IndoorAvl, generateAvlTileFromJSON, cannot generate from nil string\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    v163 = sub_1000E089C();
    v164 = objc_claimAutoreleasedReturnValue(v163);
    if (os_signpost_enabled(v164))
    {
      *(_QWORD *)buf = 68289539;
      *(_WORD *)&buf[8] = 2082;
      *(_QWORD *)&buf[10] = "";
      *(_WORD *)&buf[18] = 2082;
      *(_QWORD *)&buf[20] = "assert";
      *(_WORD *)v215 = 2081;
      *(_QWORD *)&v215[2] = "jsonStr != nullptr";
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v164, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "@IndoorAvl, generateAvlTileFromJSON, cannot generate from nil string", "{\"msg%{public}.0s\":\"@IndoorAvl, generateAvlTileFromJSON, cannot generate from nil string\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    v165 = sub_1000E089C();
    v166 = objc_claimAutoreleasedReturnValue(v165);
    if (os_log_type_enabled(v166, OS_LOG_TYPE_INFO))
    {
      *(_QWORD *)buf = 68289539;
      *(_WORD *)&buf[8] = 2082;
      *(_QWORD *)&buf[10] = "";
      *(_WORD *)&buf[18] = 2082;
      *(_QWORD *)&buf[20] = "assert";
      *(_WORD *)v215 = 2081;
      *(_QWORD *)&v215[2] = "jsonStr != nullptr";
      _os_log_impl((void *)&_mh_execute_header, v166, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"@IndoorAvl, generateAvlTileFromJSON, cannot generate from nil string\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    v167 = 253;
  }

  result = abort_report_np("%s:%d: assertion failure in %s", "/Library/Caches/com.apple.xbs/Sources/purpleslam/daemon/Framework/CLAvailabilityTileParser.mm", v167, "+[CLAvailabilityTileParser generateAvlTileFromJSON:atPath:]");
  __break(1u);
  return result;
}

- (NSURL)path
{
  return self->_path;
}

@end
