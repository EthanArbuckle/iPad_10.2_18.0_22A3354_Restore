@implementation VKTrafficIncidentFeature

- (BOOL)hasSameIdentifier:(id)a3
{
  NSDate *endDate;

  endDate = self->_endDate;
  if (endDate && *((_QWORD *)a3 + 32))
    return -[NSDate isEqualToString:](endDate, "isEqualToString:");
  else
    return 0;
}

- (VKTrafficIncidentFeature)initWithIncidentData:(const void *)a3
{
  double v5;
  double v6;
  double v7;
  uint64_t v8;
  NSDate *isa;
  char *v10;
  void *v11;
  uint64_t v12;
  VKTrafficIncidentFeature *v13;
  long double v14;
  long double v15;
  float64x2_t v16;
  unsigned int v17;
  uint64_t v23;
  NSString *v24;
  float v25;
  float v26;
  uint64_t v27;
  uint64_t v28;
  unsigned __int8 v29;
  std::__shared_mutex_base *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  double type;
  uint64_t v36;
  VKTrafficIncidentFeature *v37;
  void *v38;
  void *v39;
  NSDate *endDate;
  _QWORD *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *significance;
  _QWORD *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  NSString *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  NSString *street;
  uint64_t v56;
  NSString *crossStreet;
  uint64_t v58;
  NSString *info;
  uint64_t v60;
  NSDate *startDate;
  std::__shared_mutex_base *v63;
  double v64;
  objc_super v65;
  int v66;
  int v67;

  if (zilch::GeoCoordinates::has_elevation((zilch::GeoCoordinates *)a3))
    v5 = (double)(int)zilch::GeoCoordinates::z((zilch::GeoCoordinates *)a3) * 0.01;
  else
    v5 = 1.79769313e308;
  v67 = zilch::GeoCoordinates::y((zilch::GeoCoordinates *)a3);
  zilch::Latitude::toDegrees((zilch::Latitude *)&v67);
  v7 = v6;
  v66 = zilch::GeoCoordinates::x((zilch::GeoCoordinates *)a3);
  zilch::Longitude::toDegrees((zilch::Longitude *)&v66);
  isa = (NSDate *)((char *)a3 + 16);
  if (*((char *)a3 + 39) >= 0)
    v10 = (char *)a3 + 16;
  else
    v10 = (char *)*((_QWORD *)a3 + 2);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v10, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *MEMORY[0x1E0D26A38];
  v65.receiver = self;
  v65.super_class = (Class)VKTrafficIncidentFeature;
  v13 = -[VKTrafficFeature initWithFeatureType:uniqueIdentifier:position:direction:routeOffset:routeOffsetInMeters:](&v65, sel_initWithFeatureType_uniqueIdentifier_position_direction_routeOffset_routeOffsetInMeters_, 0, v11, v12, v7, v64, v5, -1.0, 0.0);

  if (!v13)
    goto LABEL_23;
  v14 = tan(v7 * 0.00872664626 + 0.785398163);
  v15 = log(v14);
  v16.f64[0] = v64;
  v16.f64[1] = v15;
  v17 = 381774871;
  __asm { FMOV            V1.2D, #0.5 }
  *(float64x2_t *)&v13->super._worldPoint.x = vmlaq_f64(_Q1, (float64x2_t)xmmword_19FFB32D0, v16);
  v13->super._worldPoint.z = v5;
  v23 = *((unsigned int *)a3 + 16);
  if (v23 < 8)
    v24 = (NSString *)(v23 + 1);
  else
    v24 = 0;
  v13->_title = v24;
  LOBYTE(v17) = *((_BYTE *)a3 + 164);
  v25 = (float)v17;
  v13->super._minZoom = v25;
  LOBYTE(v25) = *((_BYTE *)a3 + 165);
  v26 = (float)LODWORD(v25);
  v13->super._maxZoom = v26;
  LOBYTE(v26) = *((_BYTE *)a3 + 166);
  *(float *)&v13->_lastUpdatedDate = (float)LODWORD(v26);
  v27 = (*((_DWORD *)a3 + 40) - 1);
  if (v27 >= 5)
    v28 = 1;
  else
    v28 = v27 + 2;
  v13->_type = v28;
  {
    v63 = (std::__shared_mutex_base *)operator new();
    std::__shared_mutex_base::__shared_mutex_base(v63);
    blockMutex(void)::lock = (uint64_t)v63;
  }
  v30 = (std::__shared_mutex_base *)blockMutex(void)::lock;
  std::__shared_mutex_base::lock_shared((std::__shared_mutex_base *)blockMutex(void)::lock);
  if (_titleBlock)
  {
    (*(void (**)(void))(_titleBlock + 16))();
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = *(void **)&v13->super._routeLegWhen._hasValue;
    *(_QWORD *)&v13->super._routeLegWhen._hasValue = v31;

  }
  if (_subtitleBlock)
  {
    (*(void (**)(void))(_subtitleBlock + 16))();
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "copy");
    type = v13->super._routeLegWhen._value.type;
    *(_QWORD *)&v13->super._routeLegWhen._value.type = v34;

  }
  std::__shared_mutex_base::unlock_shared(v30);
  if (!*(_QWORD *)&v13->super._routeLegWhen._hasValue)
  {
LABEL_23:
    v37 = 0;
    goto LABEL_66;
  }
  if (*((char *)a3 + 39) < 0)
  {
    v36 = *((_QWORD *)a3 + 3);
    if (!v36)
      goto LABEL_30;
    isa = (NSDate *)isa->super.isa;
    if (!isa)
      goto LABEL_29;
    goto LABEL_26;
  }
  v36 = *((unsigned __int8 *)a3 + 39);
  if (*((_BYTE *)a3 + 39))
  {
LABEL_26:
    isa = (NSDate *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", isa, v36, 4);
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDate stringByTrimmingCharactersInSet:](isa, "stringByTrimmingCharactersInSet:", v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v39, "length"))
    {

      isa = 0;
    }

LABEL_29:
    endDate = v13->_endDate;
    v13->_endDate = isa;

  }
LABEL_30:
  v41 = (char *)a3 + 72;
  if (*((char *)a3 + 95) < 0)
  {
    v42 = *((_QWORD *)a3 + 10);
    if (!v42)
      goto LABEL_39;
    v41 = (_QWORD *)*v41;
    if (!v41)
      goto LABEL_38;
    goto LABEL_35;
  }
  v42 = *((unsigned __int8 *)a3 + 95);
  if (*((_BYTE *)a3 + 95))
  {
LABEL_35:
    v41 = (_QWORD *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", v41, v42, 4);
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "stringByTrimmingCharactersInSet:", v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v44, "length"))
    {

      v41 = 0;
    }

LABEL_38:
    significance = (void *)v13->_significance;
    v13->_significance = (int64_t)v41;

  }
LABEL_39:
  v46 = (char *)a3 + 96;
  if (*((char *)a3 + 119) < 0)
  {
    v47 = *((_QWORD *)a3 + 13);
    if (!v47)
      goto LABEL_48;
    v46 = (_QWORD *)*v46;
    if (!v46)
      goto LABEL_47;
    goto LABEL_44;
  }
  v47 = *((unsigned __int8 *)a3 + 119);
  if (*((_BYTE *)a3 + 119))
  {
LABEL_44:
    v46 = (_QWORD *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", v46, v47, 4);
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "stringByTrimmingCharactersInSet:", v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v49, "length"))
    {

      v46 = 0;
    }

LABEL_47:
    v50 = *(void **)&v13->_isNotForDisplay;
    *(_QWORD *)&v13->_isNotForDisplay = v46;

  }
LABEL_48:
  v51 = (NSString *)((char *)a3 + 40);
  if ((*((char *)a3 + 63) & 0x80000000) == 0)
  {
    v52 = *((unsigned __int8 *)a3 + 63);
    if (!*((_BYTE *)a3 + 63))
      goto LABEL_57;
    goto LABEL_53;
  }
  v52 = *((_QWORD *)a3 + 6);
  if (v52)
  {
    v51 = (NSString *)v51->super.isa;
    if (!v51)
    {
LABEL_56:
      street = v13->_street;
      v13->_street = v51;

      goto LABEL_57;
    }
LABEL_53:
    v51 = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", v51, v52, 4);
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSString stringByTrimmingCharactersInSet:](v51, "stringByTrimmingCharactersInSet:", v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v54, "length"))
    {

      v51 = 0;
    }

    goto LABEL_56;
  }
LABEL_57:
  if (*((uint64_t *)a3 + 15) >= 1)
  {
    v56 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSince1970:", (double)*((uint64_t *)a3 + 15) * 0.001);
    crossStreet = v13->_crossStreet;
    v13->_crossStreet = (NSString *)v56;

  }
  if (*((uint64_t *)a3 + 16) >= 1)
  {
    v58 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSince1970:", (double)*((uint64_t *)a3 + 16) * 0.001);
    info = v13->_info;
    v13->_info = (NSString *)v58;

  }
  if (*((uint64_t *)a3 + 17) >= 1)
  {
    v60 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSince1970:", (double)*((uint64_t *)a3 + 17) * 0.001);
    startDate = v13->_startDate;
    v13->_startDate = (NSDate *)v60;

  }
  if (!LOBYTE(v13->_artwork))
    LOBYTE(v13->_artwork) = 1;
  BYTE1(v13->_artwork) = 2;
  v37 = v13;
LABEL_66:

  return v37;
}

- (VKTrafficIncidentFeature)initWithRouteIncident:(id)a3 routeOffsetInMeters:(unsigned int)a4 routeRelevance:(int64_t)a5 onRoute:(id)a6
{
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  NSDate *v24;
  NSDate *endDate;
  unsigned int v26;
  NSString *v27;
  char v28;
  uint64_t v29;
  int64_t v30;
  uint64_t v31;
  uint64_t v32;
  unsigned __int8 v33;
  std::__shared_mutex_base *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  double v38;
  double type;
  int64_t v40;
  void *significance;
  uint64_t v42;
  void *v43;
  NSString *v44;
  NSString *street;
  NSString *v46;
  NSString *crossStreet;
  NSString *v48;
  NSString *info;
  NSDate *v50;
  NSDate *startDate;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  NSString *v56;
  NSString *uniqueString;
  VKTrafficIncidentFeature *v58;
  std::__shared_mutex_base *v60;
  objc_super v61;
  uint64_t v62;

  v10 = a3;
  v11 = a6;
  v12 = v11;
  if (!v10)
    goto LABEL_42;
  v13 = *MEMORY[0x1E0D26A38];
  v62 = *MEMORY[0x1E0D26A38];
  if (v11)
  {
    v13 = objc_msgSend(v11, "coordinateAtOffset:", (double)a4);
    v62 = v13;
    objc_msgSend(v12, "pointAtRouteCoordinate:", v13);
    v15 = v14;
  }
  else
  {
    v15 = 1.79769313e308;
  }
  objc_msgSend(v10, "position");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "lat");
  v18 = v17;
  objc_msgSend(v10, "position");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "lng");
  v21 = v20;

  v22 = v12 ? VKTrafficFeatureDirection(&v62, v12) : -1.0;
  objc_msgSend(v10, "incidentId", VKTrafficFeatureDirection(&v62, v12));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v61.receiver = self;
  v61.super_class = (Class)VKTrafficIncidentFeature;
  self = -[VKTrafficFeature initWithFeatureType:uniqueIdentifier:position:direction:routeOffset:routeOffsetInMeters:](&v61, sel_initWithFeatureType_uniqueIdentifier_position_direction_routeOffset_routeOffsetInMeters_, 0, v23, v13, v18, v21, v15, v22, (double)a4);

  if (!self)
    goto LABEL_42;
  objc_msgSend(v10, "incidentId");
  v24 = (NSDate *)objc_claimAutoreleasedReturnValue();
  endDate = self->_endDate;
  self->_endDate = v24;

  v26 = objc_msgSend(v10, "type");
  if (v26 > 0xE)
    v27 = 0;
  else
    v27 = (NSString *)qword_1A001A8B0[v26];
  self->_title = v27;
  if (objc_msgSend(v10, "type") == 100)
  {
    v28 = 1;
  }
  else if (objc_msgSend(v10, "hasShouldDisplayOnMap"))
  {
    v28 = objc_msgSend(v10, "shouldDisplayOnMap") ^ 1;
  }
  else
  {
    v28 = 0;
  }
  LOBYTE(self->_routeRelevance) = v28;
  self->_subtitle = (NSString *)a5;
  self->super._maxZoom = 99.0;
  v29 = objc_msgSend(v10, "significance") - 1;
  if (v29 >= 5)
    v30 = 1;
  else
    v30 = v29 + 2;
  self->_type = v30;
  v31 = objc_msgSend(v10, "laneClosureType") - 1;
  if (v31 < 6)
    v32 = v31 + 1;
  else
    v32 = 0;
  {
    v60 = (std::__shared_mutex_base *)operator new();
    std::__shared_mutex_base::__shared_mutex_base(v60);
    blockMutex(void)::lock = (uint64_t)v60;
  }
  v34 = (std::__shared_mutex_base *)blockMutex(void)::lock;
  std::__shared_mutex_base::lock_shared((std::__shared_mutex_base *)blockMutex(void)::lock);
  if (_titleBlock)
  {
    (*(void (**)(uint64_t, NSString *, uint64_t, _QWORD))(_titleBlock + 16))(_titleBlock, self->_title, v32, objc_msgSend(v10, "laneClosureCount"));
    v35 = objc_claimAutoreleasedReturnValue();
    v36 = *(void **)&self->super._routeLegWhen._hasValue;
    *(_QWORD *)&self->super._routeLegWhen._hasValue = v35;

  }
  if (_subtitleBlock)
  {
    (*(void (**)(void))(_subtitleBlock + 16))();
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = COERCE_DOUBLE(objc_msgSend(v37, "copy"));
    type = self->super._routeLegWhen._value.type;
    self->super._routeLegWhen._value.type = v38;

  }
  std::__shared_mutex_base::unlock_shared(v34);
  if (*(_QWORD *)&self->super._routeLegWhen._hasValue)
  {
    objc_msgSend(v10, "street");
    v40 = objc_claimAutoreleasedReturnValue();
    significance = (void *)self->_significance;
    self->_significance = v40;

    objc_msgSend(v10, "crossStreet");
    v42 = objc_claimAutoreleasedReturnValue();
    v43 = *(void **)&self->_isNotForDisplay;
    *(_QWORD *)&self->_isNotForDisplay = v42;

    objc_msgSend(v10, "info");
    v44 = (NSString *)objc_claimAutoreleasedReturnValue();
    street = self->_street;
    self->_street = v44;

    if (objc_msgSend(v10, "startTime") >= 1)
    {
      v46 = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSince1970:", (double)objc_msgSend(v10, "startTime") * 0.001);
      crossStreet = self->_crossStreet;
      self->_crossStreet = v46;

    }
    if (objc_msgSend(v10, "endTime") >= 1)
    {
      v48 = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSince1970:", (double)objc_msgSend(v10, "endTime") * 0.001);
      info = self->_info;
      self->_info = v48;

    }
    if (objc_msgSend(v10, "updateTime") >= 1)
    {
      v50 = (NSDate *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSince1970:", (double)objc_msgSend(v10, "updateTime") * 0.001);
      startDate = self->_startDate;
      self->_startDate = v50;

    }
    objc_msgSend(v10, "restrictionInfo");
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    if (v52)
    {
      objc_msgSend(v10, "restrictionInfo");
      v53 = objc_claimAutoreleasedReturnValue();
      v54 = *(void **)&self->_elevationMinZoom;
      *(_QWORD *)&self->_elevationMinZoom = v53;

    }
    objc_msgSend(v10, "artwork");
    v55 = (void *)objc_claimAutoreleasedReturnValue();

    if (v55)
    {
      objc_msgSend(v10, "artwork");
      v56 = (NSString *)objc_claimAutoreleasedReturnValue();
      uniqueString = self->_uniqueString;
      self->_uniqueString = v56;

    }
    if (!LOBYTE(self->_artwork))
      LOBYTE(self->_artwork) = 1;
    BYTE1(self->_artwork) = 1;
    v58 = self;
  }
  else
  {
LABEL_42:
    v58 = 0;
  }

  return v58;
}

- (GEOFormattedString)effectiveTimeRange
{
  return (GEOFormattedString *)objc_msgSend(*(id *)&self->_elevationMinZoom, "effectiveTimeRange");
}

- (NSArray)restrictionDetails
{
  return (NSArray *)objc_msgSend(*(id *)&self->_elevationMinZoom, "restrictionDetails");
}

- (GEOFormattedString)formattedTitle
{
  return (GEOFormattedString *)objc_msgSend(*(id *)&self->_elevationMinZoom, "titleString");
}

- (GEOFormattedString)formattedSubtitle
{
  return (GEOFormattedString *)objc_msgSend(*(id *)&self->_elevationMinZoom, "subTitleString");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  id *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VKTrafficIncidentFeature;
  v4 = -[VKTrafficFeature copyWithZone:](&v7, sel_copyWithZone_, a3);
  v5 = v4;
  if (v4)
  {
    objc_storeStrong(v4 + 20, *(id *)&self->super._routeLegWhen._hasValue);
    objc_storeStrong(v5 + 21, *(id *)&self->super._routeLegWhen._value.type);
    v5[22] = self->_title;
    *((_BYTE *)v5 + 200) = self->_routeRelevance;
    v5[23] = self->_subtitle;
    *((_BYTE *)v5 + 201) = BYTE1(self->_routeRelevance);
    objc_storeStrong(v5 + 26, (id)self->_significance);
    objc_storeStrong(v5 + 27, *(id *)&self->_isNotForDisplay);
    objc_storeStrong(v5 + 28, self->_street);
    objc_storeStrong(v5 + 29, self->_crossStreet);
    objc_storeStrong(v5 + 30, self->_info);
    objc_storeStrong(v5 + 31, self->_startDate);
    v5[24] = (id)self->_type;
    *((_DWORD *)v5 + 66) = self->_lastUpdatedDate;
    objc_storeStrong(v5 + 32, self->_endDate);
    objc_storeStrong(v5 + 35, *(id *)&self->_elevationMinZoom);
    objc_storeStrong(v5 + 34, self->_uniqueString);
  }
  return v5;
}

- (void)populateDebugNode:(void *)a3
{
  id v5;
  const std::string::value_type *v6;
  id v7;
  const std::string::value_type *v8;
  id v9;
  const std::string::value_type *v10;
  uint64_t v11;
  std::string v12;
  int v13;
  _BYTE v14[32];
  std::string v15;
  int v16;
  _BYTE v17[32];
  std::string __p;
  int v19;
  char v20[32];
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)VKTrafficIncidentFeature;
  -[VKTrafficFeature populateDebugNode:](&v21, sel_populateDebugNode_);
  v20[23] = 19;
  strcpy(v20, "TrafficIncidentType");
  +[VKTrafficIncidentFeature stringForIncidentType:](VKTrafficIncidentFeature, "stringForIncidentType:", self->_title);
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v6 = (const std::string::value_type *)objc_msgSend(v5, "UTF8String");
  memset(&__p, 0, sizeof(__p));
  v19 = 4;
  if (v6)
  {
    std::string::__assign_external(&__p, v6);
  }
  else
  {
    *((_BYTE *)&__p.__r_.__value_.__s + 23) = 6;
    strcpy((char *)&__p, "<null>");
  }
  gdc::DebugTreeNode::addProperty((uint64_t)a3, (uint64_t)v20, (uint64_t)v17);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);

  v20[23] = 14;
  strcpy(v20, "RouteRelevance");
  +[VKTrafficIncidentFeature stringForRouteRelevance:](VKTrafficIncidentFeature, "stringForRouteRelevance:", self->_subtitle);
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v8 = (const std::string::value_type *)objc_msgSend(v7, "UTF8String");
  memset(&v15, 0, sizeof(v15));
  v16 = 4;
  if (v8)
  {
    std::string::__assign_external(&v15, v8);
  }
  else
  {
    *((_BYTE *)&v15.__r_.__value_.__s + 23) = 6;
    strcpy((char *)&v15, "<null>");
  }
  gdc::DebugTreeNode::addProperty((uint64_t)a3, (uint64_t)v20, (uint64_t)v14);
  if (SHIBYTE(v15.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v15.__r_.__value_.__l.__data_);

  v20[23] = 12;
  strcpy(v20, "Significance");
  +[VKTrafficIncidentFeature stringForIncidentSignificance:](VKTrafficIncidentFeature, "stringForIncidentSignificance:", self->_type);
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v10 = (const std::string::value_type *)objc_msgSend(v9, "UTF8String");
  memset(&v12, 0, sizeof(v12));
  v13 = 4;
  if (v10)
  {
    std::string::__assign_external(&v12, v10);
  }
  else
  {
    *((_BYTE *)&v12.__r_.__value_.__s + 23) = 6;
    strcpy((char *)&v12, "<null>");
  }
  gdc::DebugTreeNode::addProperty((uint64_t)a3, (uint64_t)v20, (uint64_t)&v11);
  if (SHIBYTE(v12.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v12.__r_.__value_.__l.__data_);

}

- (NSString)uniqueString
{
  return (NSString *)self->_endDate;
}

- (NSString)title
{
  return *(NSString **)&self->super._routeLegWhen._hasValue;
}

- (NSString)subtitle
{
  return *(NSString **)&self->super._routeLegWhen._value.type;
}

- (int64_t)type
{
  return (int64_t)self->_title;
}

- (BOOL)isNotForDisplay
{
  return self->_routeRelevance;
}

- (int64_t)routeRelevance
{
  return (int64_t)self->_subtitle;
}

- (void)setRouteRelevance:(int64_t)a3
{
  self->_subtitle = (NSString *)a3;
}

- (BOOL)isOnSelectedRoute
{
  return BYTE1(self->_routeRelevance);
}

- (void)setIsOnSelectedRoute:(BOOL)a3
{
  BYTE1(self->_routeRelevance) = a3;
}

- (float)elevationMinZoom
{
  return *(float *)&self->_lastUpdatedDate;
}

- (NSString)street
{
  return (NSString *)self->_significance;
}

- (NSString)crossStreet
{
  return *(NSString **)&self->_isNotForDisplay;
}

- (NSString)info
{
  return self->_street;
}

- (NSDate)startDate
{
  return (NSDate *)self->_crossStreet;
}

- (NSDate)endDate
{
  return (NSDate *)self->_info;
}

- (NSDate)lastUpdatedDate
{
  return self->_startDate;
}

- (int64_t)significance
{
  return self->_type;
}

- (GEOPBTransitArtwork)artwork
{
  return (GEOPBTransitArtwork *)self->_uniqueString;
}

- (optional<gss::IncidentDataSource>)dataSource
{
  _BYTE *v2;
  optional<gss::IncidentDataSource> result;

  *v2 = 0;
  if (LOBYTE(self->_artwork))
  {
    v2[1] = BYTE1(self->_artwork);
    *v2 = 1;
  }
  result._value = (ValueUnion)a2;
  result._hasValue = (char)self;
  return result;
}

- (void).cxx_destruct
{
  if (LOBYTE(self->_artwork))
    LOBYTE(self->_artwork) = 0;
  objc_storeStrong((id *)&self->_elevationMinZoom, 0);
  objc_storeStrong((id *)&self->_uniqueString, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_info, 0);
  objc_storeStrong((id *)&self->_crossStreet, 0);
  objc_storeStrong((id *)&self->_street, 0);
  objc_storeStrong((id *)&self->_isNotForDisplay, 0);
  objc_storeStrong((id *)&self->_significance, 0);
  objc_storeStrong((id *)&self->super._routeLegWhen._value, 0);
  objc_storeStrong((id *)&self->super._routeLegWhen, 0);
}

- (id).cxx_construct
{
  *((_BYTE *)self + 288) = 0;
  return self;
}

+ (int64_t)incidentTypeForGeoRouteIncident:(id)a3
{
  id v3;
  void *v4;
  unsigned int v5;
  int64_t v6;

  v3 = a3;
  v4 = v3;
  if (v3 && (v5 = objc_msgSend(v3, "type"), v5 < 0xF))
    v6 = qword_1A001A8B0[v5];
  else
    v6 = 0;

  return v6;
}

+ (id)stringForIncidentType:(int64_t)a3
{
  if ((unint64_t)a3 > 0xE)
    return 0;
  else
    return off_1E42F0B78[a3];
}

+ (id)stringForRouteRelevance:(int64_t)a3
{
  if ((unint64_t)a3 > 3)
    return 0;
  else
    return off_1E42F0BF0[a3];
}

+ (id)stringForIncidentSignificance:(int64_t)a3
{
  if ((unint64_t)a3 > 6)
    return 0;
  else
    return off_1E42F0C10[a3];
}

@end
