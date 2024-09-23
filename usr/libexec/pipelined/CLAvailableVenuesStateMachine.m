@implementation CLAvailableVenuesStateMachine

- (BOOL)shouldRecompute:(id)a3
{
  id v4;
  GeographicCoordinate *lastFix;
  double v6;
  double v7;
  NSObject *v8;
  BOOL v9;
  int v11;
  double v12;

  v4 = a3;
  lastFix = self->_lastFix;
  if (!lastFix)
  {
    v9 = 1;
    goto LABEL_7;
  }
  +[CLAvailableVenuesStateMachine distBetweenLatLon:latlon1:](CLAvailableVenuesStateMachine, "distBetweenLatLon:latlon1:", lastFix, v4);
  v7 = v6;
  if (qword_100417EE8 != -1)
  {
    dispatch_once(&qword_100417EE8, &stru_1003EE9C0);
    v8 = qword_100417EF0;
    if (!os_log_type_enabled((os_log_t)qword_100417EF0, OS_LOG_TYPE_DEBUG))
      goto LABEL_5;
    goto LABEL_4;
  }
  v8 = qword_100417EF0;
  if (os_log_type_enabled((os_log_t)qword_100417EF0, OS_LOG_TYPE_DEBUG))
  {
LABEL_4:
    v11 = 134217984;
    v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "@IndoorAvl, load, CLAvailableVenuesStateMachine, shouldRecompute, moveDist, %lf", (uint8_t *)&v11, 0xCu);
  }
LABEL_5:
  v9 = v7 >= self->_maxLoadRadius * 0.5;
LABEL_7:

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_availabilityTileParams, 0);
  objc_storeStrong((id *)&self->_disabledVenues, 0);
  objc_storeStrong((id *)&self->_lastFix, 0);
}

- (id)getNearbyLocationGroupsForTile:(id)a3 withUpdatedPos:(id)a4
{
  return (id)objc_claimAutoreleasedReturnValue(-[CLAvailableVenuesStateMachine getNearbyLocationGroupsForTile:withUpdatedPos:nearLocationsOfInterest:](self, "getNearbyLocationGroupsForTile:withUpdatedPos:nearLocationsOfInterest:", a3, a4, 0));
}

- (id)computeAvailableVenues:(id)a3 nearCoordinates:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id result;
  char v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v12 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CLAvailableVenuesStateMachine computeAvailableVenues:nearCoordinates:withError:](self, "computeAvailableVenues:nearCoordinates:withError:", v6, v7, &v12));
  if (!v12)
    goto LABEL_7;
  sub_1000E019C();
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CLAvailableVenuesStateMachine computeAvailableVenues:nearCoordinates:withError:](self, "computeAvailableVenues:nearCoordinates:withError:", v6, v7, &v12));

  if (!v12)
  {
    v8 = v9;
    goto LABEL_7;
  }
  sub_1000E019C();
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CLAvailableVenuesStateMachine computeAvailableVenues:nearCoordinates:withError:](self, "computeAvailableVenues:nearCoordinates:withError:", v6, v7, &v12));

  if (!v12)
  {
LABEL_7:

    return v8;
  }
  sub_1000E019C();
  v10 = objc_claimAutoreleasedReturnValue(-[CLAvailableVenuesStateMachine computeAvailableVenues:nearCoordinates:withError:](self, "computeAvailableVenues:nearCoordinates:withError:", v6, v7, &v12));

  if (!v12)
  {
    v8 = (void *)v10;
    goto LABEL_7;
  }
  sub_100341A74();

  result = (id)abort_report_np("%s:%d: assertion failure in %s", "/Library/Caches/com.apple.xbs/Sources/purpleslam/daemon/Framework/CLAvailableVenuesStateMachine.mm", 143, "-[CLAvailableVenuesStateMachine computeAvailableVenues:nearCoordinates:]");
  __break(1u);
  return result;
}

- (CLAvailableVenuesStateMachine)init
{
  CLAvailableVenuesStateMachine *v2;
  CLAvailableVenuesStateMachine *v3;
  GeographicCoordinate *lastFix;
  NSSet *disabledVenues;
  CLIndoorAvailabilityTileParams *availabilityTileParams;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CLAvailableVenuesStateMachine;
  v2 = -[CLAvailableVenuesStateMachine init](&v8, "init");
  v3 = v2;
  if (v2)
  {
    lastFix = v2->_lastFix;
    v2->_lastFix = 0;

    disabledVenues = v3->_disabledVenues;
    v3->_maxLoadRadius = 100000.0;
    v3->_disabledVenues = 0;

    availabilityTileParams = v3->_availabilityTileParams;
    v3->_availabilityTileParams = 0;

  }
  return v3;
}

- (id)getNearbyLocationGroupsForTile:(id)a3 withUpdatedPos:(id)a4 nearLocationsOfInterest:(id)a5
{
  id v8;
  id v9;
  id v10;
  CLIndoorAvailabilityTileParams *v11;
  CLIndoorAvailabilityTileParams *availabilityTileParams;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSObject *v19;
  int v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[CLIndoorAvailabilityTileParams initWithAvailabilityTile:]([CLIndoorAvailabilityTileParams alloc], "initWithAvailabilityTile:", objc_msgSend(v8, "getAvlTile"));
  availabilityTileParams = self->_availabilityTileParams;
  self->_availabilityTileParams = v11;

  if (!self->_lastFix)
  {
    if (qword_100417EE8 == -1)
    {
      v19 = qword_100417EF0;
      if (!os_log_type_enabled((os_log_t)qword_100417EF0, OS_LOG_TYPE_DEBUG))
        goto LABEL_11;
    }
    else
    {
      dispatch_once(&qword_100417EE8, &stru_1003EE9C0);
      v19 = qword_100417EF0;
      if (!os_log_type_enabled((os_log_t)qword_100417EF0, OS_LOG_TYPE_DEBUG))
        goto LABEL_11;
    }
    LOWORD(v21) = 0;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "No previous location stored in state, we should definitely recompute", (uint8_t *)&v21, 2u);
    goto LABEL_11;
  }
  if (qword_100417EE8 != -1)
    dispatch_once(&qword_100417EE8, &stru_1003EE9C0);
  v13 = (id)qword_100417EF0;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    -[GeographicCoordinate latitude](self->_lastFix, "latitude");
    v15 = v14;
    -[GeographicCoordinate longitude](self->_lastFix, "longitude");
    v21 = 134283777;
    v22 = v15;
    v23 = 2049;
    v24 = v16;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "Previous load occurred at %{private}.7lf, %{private}.7lf", (uint8_t *)&v21, 0x16u);
  }

LABEL_11:
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CLAvailableVenuesStateMachine recomputeIfNecessary:withGlobalAvailabilityTile:andAdditionalLOIs:](self, "recomputeIfNecessary:withGlobalAvailabilityTile:andAdditionalLOIs:", v9, v8, v10));

  return v17;
}

- (id)recomputeIfNecessary:(id)a3 withGlobalAvailabilityTile:(id)a4 andAdditionalLOIs:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  const char *v14;
  NSObject *v15;
  id v16;
  void *v17;
  void *v18;
  _BOOL4 v20;
  NSObject *v22;
  uint64_t v24;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v11;
  if (v9)
  {
    if (v11)
    {
      if (qword_100417EE8 != -1)
      {
        dispatch_once(&qword_100417EE8, &stru_1003EE9C0);
        v13 = qword_100417EF0;
        if (!os_log_type_enabled((os_log_t)qword_100417EF0, OS_LOG_TYPE_DEBUG))
          goto LABEL_15;
        goto LABEL_5;
      }
      v13 = qword_100417EF0;
      if (os_log_type_enabled((os_log_t)qword_100417EF0, OS_LOG_TYPE_DEBUG))
      {
LABEL_5:
        LOWORD(v24) = 0;
        v14 = "Have to recompute because we have locations of interest";
LABEL_14:
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, v14, (uint8_t *)&v24, 2u);
      }
LABEL_15:
      objc_storeStrong((id *)&self->_lastFix, a3);
      goto LABEL_16;
    }
    if (-[CLAvailableVenuesStateMachine shouldRecompute:](self, "shouldRecompute:", v9))
    {
      if (qword_100417EE8 == -1)
      {
        v13 = qword_100417EF0;
        if (!os_log_type_enabled((os_log_t)qword_100417EF0, OS_LOG_TYPE_DEBUG))
          goto LABEL_15;
      }
      else
      {
        dispatch_once(&qword_100417EE8, &stru_1003EE9C0);
        v13 = qword_100417EF0;
        if (!os_log_type_enabled((os_log_t)qword_100417EF0, OS_LOG_TYPE_DEBUG))
          goto LABEL_15;
      }
      LOWORD(v24) = 0;
      v14 = "Have to recompute nearby location groups because we moved far enough away";
      goto LABEL_14;
    }
    if (qword_100417EE8 == -1)
    {
      v22 = qword_100417EF0;
      if (!os_log_type_enabled((os_log_t)qword_100417EF0, OS_LOG_TYPE_DEBUG))
      {
LABEL_24:
        v18 = 0;
        goto LABEL_19;
      }
    }
    else
    {
      dispatch_once(&qword_100417EE8, &stru_1003EE9C0);
      v22 = qword_100417EF0;
      if (!os_log_type_enabled((os_log_t)qword_100417EF0, OS_LOG_TYPE_DEBUG))
        goto LABEL_24;
    }
    v20 = self->_lastFix == 0;
    LODWORD(v24) = 67109120;
    HIDWORD(v24) = v20;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "No need to recompute nearby location groups, (_lastFix==nil) = %d", (uint8_t *)&v24, 8u);
    goto LABEL_24;
  }
  if (qword_100417EE8 != -1)
  {
    dispatch_once(&qword_100417EE8, &stru_1003EE9C0);
    v15 = qword_100417EF0;
    if (!os_log_type_enabled((os_log_t)qword_100417EF0, OS_LOG_TYPE_DEBUG))
      goto LABEL_16;
    goto LABEL_8;
  }
  v15 = qword_100417EF0;
  if (os_log_type_enabled((os_log_t)qword_100417EF0, OS_LOG_TYPE_DEBUG))
  {
LABEL_8:
    LOWORD(v24) = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "Have to recompute nearby location groups because newCoordinate was not nil?", (uint8_t *)&v24, 2u);
  }
LABEL_16:
  v16 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithArray:", v12);
  v17 = v16;
  if (v9)
    objc_msgSend(v16, "addObject:", v9);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CLAvailableVenuesStateMachine computeAvailableVenues:nearCoordinates:](self, "computeAvailableVenues:nearCoordinates:", v10, v17, v24));

LABEL_19:
  return v18;
}

- (id)computeAvailableVenues:(id)a3 nearCoordinates:(id)a4 withError:(BOOL *)a5
{
  id v7;
  uint64_t v8;
  ECEFCoordinate *v9;
  signed int v10;
  signed int v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  _QWORD *v21;
  _QWORD **v22;
  _QWORD *v23;
  int v24;
  _QWORD *v25;
  _QWORD *v26;
  BOOL v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  _BYTE *v31;
  int v32;
  uint64_t v33;
  int v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD *v39;
  NSObject *v40;
  void **v41;
  uint64_t v42;
  id v43;
  uint64_t *v44;
  void *v45;
  NSObject *v46;
  id v47;
  id v48;
  _QWORD *v49;
  _QWORD **v50;
  _QWORD *v51;
  _QWORD **v52;
  uint64_t v53;
  char *v54;
  uint64_t *v55;
  uint64_t **v56;
  uint64_t **v57;
  unint64_t v58;
  uint64_t *v59;
  id v60;
  unint64_t v61;
  id v62;
  uint64_t v63;
  ECEFCoordinate *v64;
  NSObject *v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  id v69;
  id v70;
  uint64_t v71;
  uint64_t v72;
  id v73;
  double v74;
  double v75;
  BOOL v76;
  NSObject *v77;
  void **v78;
  int v79;
  int v80;
  double maxLoadRadius;
  CLLocationGroup *v82;
  double ***v83;
  id v84;
  id v85;
  void *v86;
  void *v87;
  _QWORD *v88;
  void *v89;
  void *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  unint64_t v95;
  _QWORD *v96;
  _QWORD *v97;
  _QWORD *v98;
  uint64_t v99;
  unint64_t v100;
  uint64_t v101;
  unint64_t v102;
  char *v103;
  char *v104;
  uint64_t v105;
  id v106;
  uint64_t v107;
  void **v108;
  NSObject *v109;
  os_log_type_t v110;
  const char *v111;
  NSObject *v112;
  id v113;
  NSObject *v114;
  void **v115;
  uint64_t v116;
  void **v117;
  NSObject *v118;
  NSObject *v119;
  NSObject *v120;
  id v122;
  void *v123;
  NSObject *v124;
  NSObject *v125;
  NSObject *v126;
  id v127;
  NSObject *v128;
  int v129;
  id v130;
  NSObject *v131;
  int v132;
  id v133;
  NSObject *v134;
  int v135;
  int64_t v136;
  uint64_t v137;
  uint64_t v138;
  void *v139;
  uint64_t v140;
  id v141;
  BOOL *v142;
  uint64_t *v143;
  ECEFCoordinate *v144;
  BOOL v145;
  uint64_t *v146;
  int v147;
  GeographicCoordinate *v148;
  void *v149;
  void *context;
  uint64_t v151;
  id v152;
  int v153;
  id v154;
  GeographicCoordinate *v155;
  id obj;
  uint64_t v158;
  CLLocationGroup *v159;
  id v160;
  ENUCoordinate *v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  _QWORD *v170;
  _QWORD *v171;
  uint64_t v172;
  uint64_t **v173;
  uint64_t *v174;
  uint64_t v175;
  void *__p[2];
  char v177;
  _BYTE v178[128];
  uint8_t v179[128];
  _BYTE v180[88];
  uint8_t buf[4];
  uint64_t v182;
  __int16 v183;
  _BYTE v184[10];
  int v185;
  uint64_t *v186;
  int v187;
  uint64_t v188;
  char v189;

  v152 = a3;
  v141 = a4;
  v142 = a5;
  *a5 = 0;
  v7 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 120);
  v8 = 120;
  do
  {
    v9 = objc_alloc_init(ECEFCoordinate);
    objc_msgSend(v7, "addObject:", v9);

    --v8;
  }
  while (v8);
  v154 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 120);
  v160 = v7;
  v155 = objc_alloc_init(GeographicCoordinate);
  v161 = objc_alloc_init(ENUCoordinate);
  v144 = objc_alloc_init(ECEFCoordinate);
  v148 = objc_alloc_init(GeographicCoordinate);
  v10 = objc_msgSend(v152, "numVenuesExpected");
  v149 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", v10));
  v11 = objc_msgSend(v152, "numTotalExpectedExteriorsInVenues");
  v147 = v10;
  if (qword_100417EE8 != -1)
    dispatch_once(&qword_100417EE8, &stru_1003EE9C0);
  v12 = (id)qword_100417EF0;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v182 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "@IndoorAvl, load, Reserving %zu entries for AvailabilityTile entries in result", buf, 0xCu);
  }

  v139 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", v11));
  if (qword_100417EE8 != -1)
    dispatch_once(&qword_100417EE8, &stru_1003EE9C0);
  v13 = (id)qword_100417EF0;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v182) = v147;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "@IndoorAvl, load, iterating over %d venues in the availability tile", buf, 8u);
  }

  if (v147 >= 1)
  {
    v140 = 0;
    v138 = 0;
    v153 = 0;
    while (1)
    {
      context = objc_autoreleasePoolPush();
      sub_10009DA68((uint64_t)buf);
      if (objc_msgSend(v152, "tileIsOpenForIncrementalIO"))
      {
        if ((objc_msgSend(v152, "getNextVenueBoundsIncrementally:", buf) & 1) == 0)
        {
          if (qword_100417EE8 == -1)
          {
            v14 = qword_100417EF0;
            if (!os_log_type_enabled((os_log_t)qword_100417EF0, OS_LOG_TYPE_ERROR))
            {
LABEL_19:
              v15 = 1;
              *v142 = 1;
              goto LABEL_214;
            }
          }
          else
          {
            dispatch_once(&qword_100417EE8, &stru_1003EE9C0);
            v14 = qword_100417EF0;
            if (!os_log_type_enabled((os_log_t)qword_100417EF0, OS_LOG_TYPE_ERROR))
              goto LABEL_19;
          }
          *(_WORD *)v180 = 0;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "@IndoorAvl, load, failed to incrementally read venue bounds from tile", v180, 2u);
          goto LABEL_19;
        }
      }
      else
      {
        sub_1001D2028((uint64_t)objc_msgSend(v152, "getAvlTile"), v153, (uint64_t)v180);
        sub_10031E038((uint64_t)buf, (uint64_t)v180);
        sub_10009DC84(v180);
      }
      sub_10009AF3C(&v184[2], ", ", (uint64_t)__p);
      if (!v187)
      {
        if (qword_100417EE8 == -1)
        {
          v40 = qword_100417EF0;
          if (!os_log_type_enabled((os_log_t)qword_100417EF0, OS_LOG_TYPE_ERROR))
            goto LABEL_227;
        }
        else
        {
          dispatch_once(&qword_100417EE8, &stru_1003EE9C0);
          v40 = qword_100417EF0;
          if (!os_log_type_enabled((os_log_t)qword_100417EF0, OS_LOG_TYPE_ERROR))
          {
LABEL_227:
            v15 = 11;
            if ((v177 & 0x80000000) == 0)
              goto LABEL_214;
LABEL_213:
            operator delete(__p[0]);
            goto LABEL_214;
          }
        }
        v41 = __p;
        if (v177 < 0)
          v41 = (void **)__p[0];
        *(_DWORD *)v180 = 136446210;
        *(_QWORD *)&v180[4] = v41;
        _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "@IndoorAvl, load, venue [%{public}s] is missing exterior", v180, 0xCu);
        v15 = 11;
        if (v177 < 0)
          goto LABEL_213;
        goto LABEL_214;
      }
      v174 = 0;
      v175 = 0;
      v173 = &v174;
      v171 = 0;
      v172 = 0;
      v170 = &v171;
      if ((v189 & 4) != 0)
      {
        v16 = v188;
        if (!v188)
          v16 = *(_QWORD *)(qword_10042EAC8 + 64);
        sub_10009BE80(v180, v16);
        v17 = *(unsigned int *)&v180[24];
        if (*(int *)&v180[24] >= 1)
        {
          v18 = 0;
          v19 = v172;
          do
          {
            v20 = *(_DWORD *)(*(_QWORD *)&v180[16] + 4 * v18);
            v21 = v171;
            v22 = &v171;
LABEL_33:
            v23 = v22;
            if (v21)
            {
              do
              {
                v22 = (_QWORD **)v21;
                v24 = *((_DWORD *)v21 + 7);
                if (v20 < v24)
                {
                  v21 = *v22;
                  goto LABEL_33;
                }
                if (v24 >= v20)
                  goto LABEL_30;
                v21 = v22[1];
              }
              while (v21);
              v23 = v22 + 1;
            }
            v25 = operator new(0x20uLL);
            *((_DWORD *)v25 + 7) = v20;
            *v25 = 0;
            v25[1] = 0;
            v25[2] = v22;
            *v23 = v25;
            if (*v170)
            {
              v170 = (_QWORD *)*v170;
              v25 = (_QWORD *)*v23;
            }
            v26 = v171;
            v27 = v25 == v171;
            *((_BYTE *)v25 + 24) = v25 == v171;
            if (!v27)
            {
              do
              {
                v28 = v25[2];
                if (*(_BYTE *)(v28 + 24))
                  break;
                v29 = *(_QWORD **)(v28 + 16);
                v30 = *v29;
                if (*v29 == v28)
                {
                  v33 = v29[1];
                  if (!v33 || (v34 = *(unsigned __int8 *)(v33 + 24), v31 = (_BYTE *)(v33 + 24), v34))
                  {
                    if (*(_QWORD **)v28 == v25)
                    {
                      *(_BYTE *)(v28 + 24) = 1;
                      *((_BYTE *)v29 + 24) = 0;
                      v37 = *(_QWORD *)(v28 + 8);
                      *v29 = v37;
                      if (v37)
                        goto LABEL_55;
                    }
                    else
                    {
                      v35 = *(uint64_t **)(v28 + 8);
                      v36 = *v35;
                      *(_QWORD *)(v28 + 8) = *v35;
                      if (v36)
                      {
                        *(_QWORD *)(v36 + 16) = v28;
                        v29 = *(_QWORD **)(v28 + 16);
                      }
                      v35[2] = (uint64_t)v29;
                      *(_QWORD *)(*(_QWORD *)(v28 + 16) + 8 * (**(_QWORD **)(v28 + 16) != v28)) = v35;
                      *v35 = v28;
                      *(_QWORD *)(v28 + 16) = v35;
                      v29 = (_QWORD *)v35[2];
                      v28 = *v29;
                      *((_BYTE *)v35 + 24) = 1;
                      *((_BYTE *)v29 + 24) = 0;
                      v37 = *(_QWORD *)(v28 + 8);
                      *v29 = v37;
                      if (v37)
LABEL_55:
                        *(_QWORD *)(v37 + 16) = v29;
                    }
                    *(_QWORD *)(v28 + 16) = v29[2];
                    *(_QWORD *)(v29[2] + 8 * (*(_QWORD *)v29[2] != (_QWORD)v29)) = v28;
                    *(_QWORD *)(v28 + 8) = v29;
LABEL_28:
                    v29[2] = v28;
                    break;
                  }
                }
                else if (!v30 || (v32 = *(unsigned __int8 *)(v30 + 24), v31 = (_BYTE *)(v30 + 24), v32))
                {
                  if (*(_QWORD **)v28 == v25)
                  {
                    v38 = v25[1];
                    *(_QWORD *)v28 = v38;
                    if (v38)
                    {
                      *(_QWORD *)(v38 + 16) = v28;
                      v29 = *(_QWORD **)(v28 + 16);
                    }
                    v25[2] = v29;
                    *(_QWORD *)(*(_QWORD *)(v28 + 16) + 8 * (**(_QWORD **)(v28 + 16) != v28)) = v25;
                    v25[1] = v28;
                    *(_QWORD *)(v28 + 16) = v25;
                    v29 = (_QWORD *)v25[2];
                  }
                  else
                  {
                    v25 = (_QWORD *)v25[2];
                  }
                  *((_BYTE *)v25 + 24) = 1;
                  *((_BYTE *)v29 + 24) = 0;
                  v28 = v29[1];
                  v39 = *(_QWORD **)v28;
                  v29[1] = *(_QWORD *)v28;
                  if (v39)
                    v39[2] = v29;
                  *(_QWORD *)(v28 + 16) = v29[2];
                  *(_QWORD *)(v29[2] + 8 * (*(_QWORD *)v29[2] != (_QWORD)v29)) = v28;
                  *(_QWORD *)v28 = v29;
                  goto LABEL_28;
                }
                *(_BYTE *)(v28 + 24) = 1;
                v25 = v29;
                *((_BYTE *)v29 + 24) = v29 == v26;
                *v31 = 1;
              }
              while (v29 != v26);
            }
            v172 = ++v19;
LABEL_30:
            ++v18;
          }
          while (v18 != v17);
        }
        sub_10009B9C8(v180);
      }
      objc_msgSend(v149, "removeAllObjects");
      if (v185 < 1)
        goto LABEL_205;
      v42 = 0;
      v43 = 0;
      do
      {
        v44 = *(uint64_t **)(*(_QWORD *)&v184[2] + 8 * v42);
        if (*((char *)v44 + 23) < 0)
          v44 = (uint64_t *)*v44;
        v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v44));
        if (objc_msgSend(v45, "hasPrefix:", CFSTR("G")))
        {
          if (v43)
          {

            if (qword_100417EE8 == -1)
            {
              v107 = qword_100417EF0;
              if (!os_log_type_enabled((os_log_t)qword_100417EF0, OS_LOG_TYPE_ERROR))
                goto LABEL_211;
            }
            else
            {
              dispatch_once(&qword_100417EE8, &stru_1003EE9C0);
              v107 = qword_100417EF0;
              if (!os_log_type_enabled((os_log_t)qword_100417EF0, OS_LOG_TYPE_ERROR))
                goto LABEL_211;
            }
            v108 = __p;
            if (v177 < 0)
              v108 = (void **)__p[0];
            *(_DWORD *)v180 = 136446210;
            *(_QWORD *)&v180[4] = v108;
            v109 = v107;
            v110 = OS_LOG_TYPE_ERROR;
            v111 = "Multiple groups associated with venue [%{public}s].  Ignoring from availability tile";
            goto LABEL_222;
          }
          if (-[CLAvailableVenuesStateMachine isVenueDisabled:locationId:](self, "isVenueDisabled:locationId:", v45, 0))
          {
            if (qword_100417EE8 != -1)
              dispatch_once(&qword_100417EE8, &stru_1003EE9C0);
            v112 = (id)qword_100417EF0;
            if (os_log_type_enabled(v112, OS_LOG_TYPE_DEBUG))
            {
              v113 = objc_msgSend(objc_retainAutorelease(v45), "UTF8String");
              *(_DWORD *)v180 = 136315138;
              *(_QWORD *)&v180[4] = v113;
              _os_log_impl((void *)&_mh_execute_header, v112, OS_LOG_TYPE_DEBUG, "%s in availability tile is disabled by settings", v180, 0xCu);
            }

LABEL_205:
            if (qword_100417EE8 == -1)
            {
              v114 = qword_100417EF0;
              if (os_log_type_enabled((os_log_t)qword_100417EF0, OS_LOG_TYPE_DEFAULT))
                goto LABEL_207;
            }
            else
            {
              dispatch_once(&qword_100417EE8, &stru_1003EE9C0);
              v114 = qword_100417EF0;
              if (os_log_type_enabled((os_log_t)qword_100417EF0, OS_LOG_TYPE_DEFAULT))
              {
LABEL_207:
                v115 = __p;
                if (v177 < 0)
                  v115 = (void **)__p[0];
                *(_DWORD *)v180 = 136315138;
                *(_QWORD *)&v180[4] = v115;
                _os_log_impl((void *)&_mh_execute_header, v114, OS_LOG_TYPE_DEFAULT, "#Warning Cannot find location group in venue [%s]", v180, 0xCu);
              }
            }
            v43 = 0;
            goto LABEL_211;
          }
          v43 = v45;
        }
        else
        {
          if (!objc_msgSend(v45, "hasPrefix:", CFSTR("L")))
          {
            if (qword_100417EE8 != -1)
              dispatch_once(&qword_100417EE8, &stru_1003EE9C0);
            v46 = (id)qword_100417EF0;
            if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
            {
              v48 = objc_msgSend(objc_retainAutorelease(v45), "UTF8String");
              *(_DWORD *)v180 = 136315138;
              *(_QWORD *)&v180[4] = v48;
              _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "#Warning Encountered invalid venue id %s in availability tile. Skipping", v180, 0xCu);
            }
            goto LABEL_92;
          }
          if (-[CLAvailableVenuesStateMachine isVenueDisabled:locationId:](self, "isVenueDisabled:locationId:", 0, v45))
          {
            if (qword_100417EE8 != -1)
              dispatch_once(&qword_100417EE8, &stru_1003EE9C0);
            v46 = (id)qword_100417EF0;
            if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
            {
              v47 = objc_msgSend(objc_retainAutorelease(v45), "UTF8String");
              *(_DWORD *)v180 = 136315138;
              *(_QWORD *)&v180[4] = v47;
              _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEBUG, "%s in availability tile is disabled by settings", v180, 0xCu);
            }
LABEL_92:

            goto LABEL_93;
          }
          objc_msgSend(v149, "addObject:", v45);
          if (v42 >= v185)
          {
            sub_100341CE8();
            abort_report_np("%s:%d: assertion failure in %s", "/Library/Caches/com.apple.xbs/Sources/purpleslam/daemon/Framework/CLAvailableVenuesStateMachine.mm", 154, "operator()");
            goto LABEL_275;
          }
          if ((v189 & 4) != 0)
          {
            v49 = v171;
            if (!v171)
              goto LABEL_93;
            v50 = &v171;
            do
            {
              v51 = v49;
              v52 = v50;
              v53 = *((int *)v49 + 7);
              if (v42 <= v53)
                v50 = (_QWORD **)v49;
              else
                ++v49;
              v49 = (_QWORD *)*v49;
            }
            while (v49);
            if (v50 == &v171)
              goto LABEL_93;
            if (v42 > v53)
              v51 = v52;
            if (v42 < *((int *)v51 + 7))
              goto LABEL_93;
          }
          else if (!+[CLLocationContextUtil isRegional:](CLLocationContextUtil, "isRegional:", +[CLAvailableVenuesStateMachine getLocationContextFromVenueBounds:](CLAvailableVenuesStateMachine, "getLocationContextFromVenueBounds:", buf)))
          {
            goto LABEL_93;
          }
          v54 = (char *)objc_msgSend(v149, "count") - 1;
          v55 = v174;
          v56 = &v174;
LABEL_111:
          v57 = v56;
          if (v55)
          {
            do
            {
              v56 = (uint64_t **)v55;
              v58 = v55[4];
              if ((unint64_t)v54 < v58)
              {
                v55 = *v56;
                goto LABEL_111;
              }
              if (v58 >= (unint64_t)v54)
                goto LABEL_93;
              v55 = v56[1];
            }
            while (v55);
            v57 = v56 + 1;
          }
          v59 = (uint64_t *)operator new(0x28uLL);
          v59[4] = (uint64_t)v54;
          *v59 = 0;
          v59[1] = 0;
          v59[2] = (uint64_t)v56;
          *v57 = v59;
          if (*v173)
          {
            v173 = (uint64_t **)*v173;
            v59 = *v57;
          }
          sub_1000E05F4(v174, v59);
          ++v175;
        }
LABEL_93:

        ++v42;
      }
      while (v42 < v185);
      if (!v43)
        goto LABEL_205;
      if (!objc_msgSend(v149, "count") || !v149)
      {
        if (qword_100417EE8 == -1)
        {
          v116 = qword_100417EF0;
          if (os_log_type_enabled((os_log_t)qword_100417EF0, OS_LOG_TYPE_DEFAULT))
            goto LABEL_219;
LABEL_211:
          v15 = 11;
          goto LABEL_212;
        }
        dispatch_once(&qword_100417EE8, &stru_1003EE9C0);
        v116 = qword_100417EF0;
        if (!os_log_type_enabled((os_log_t)qword_100417EF0, OS_LOG_TYPE_DEFAULT))
          goto LABEL_211;
LABEL_219:
        v117 = __p;
        if (v177 < 0)
          v117 = (void **)__p[0];
        *(_DWORD *)v180 = 136315138;
        *(_QWORD *)&v180[4] = v117;
        v109 = v116;
        v110 = OS_LOG_TYPE_DEFAULT;
        v111 = "#Warning No venues associated with availability tile [%s]";
LABEL_222:
        _os_log_impl((void *)&_mh_execute_header, v109, v110, v111, v180, 0xCu);
        goto LABEL_211;
      }
      v60 = objc_msgSend(v149, "count");
      v137 = objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "substringFromIndex:", 1));

      v136 = +[CLAvailableVenuesStateMachine getLocationContextFromVenueBounds:](CLAvailableVenuesStateMachine, "getLocationContextFromVenueBounds:", buf);
      v140 += (uint64_t)v60;
      if (v187)
      {
        v145 = 0;
        v146 = v186;
        v143 = &v186[v187];
        while (1)
        {
          if (v145)
          {
            v145 = 1;
            goto LABEL_125;
          }
          v61 = *(unsigned int *)(*v146 + 24);
          v151 = *v146;
          if ((_DWORD)v61 == *(_DWORD *)(*v146 + 48))
            break;
          if (qword_100417EE8 == -1)
          {
            v77 = qword_100417EF0;
            if (os_log_type_enabled((os_log_t)qword_100417EF0, OS_LOG_TYPE_ERROR))
              goto LABEL_153;
          }
          else
          {
            dispatch_once(&qword_100417EE8, &stru_1003EE9C0);
            v77 = qword_100417EF0;
            if (os_log_type_enabled((os_log_t)qword_100417EF0, OS_LOG_TYPE_ERROR))
            {
LABEL_153:
              v78 = __p;
              if (v177 < 0)
                v78 = (void **)__p[0];
              v79 = *(_DWORD *)(v151 + 24);
              v80 = *(_DWORD *)(v151 + 48);
              *(_DWORD *)v180 = 136446722;
              *(_QWORD *)&v180[4] = v78;
              *(_WORD *)&v180[12] = 1026;
              *(_DWORD *)&v180[14] = v79;
              *(_WORD *)&v180[18] = 1026;
              *(_DWORD *)&v180[20] = v80;
              _os_log_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_ERROR, "@IndoorAvl, load, exterior polygon of venue [%{public}s] is corrupt.  %{public}d latitudes, %{public}d longitudes", v180, 0x18u);
              v145 = 0;
              goto LABEL_125;
            }
          }
          v145 = 0;
LABEL_125:
          if (++v146 == v143)
            goto LABEL_223;
        }
        if ((v61 & 0x80000000) != 0)
        {
          v127 = sub_1000E0150();
          v128 = objc_claimAutoreleasedReturnValue(v127);
          if (os_log_type_enabled(v128, OS_LOG_TYPE_FAULT))
          {
            v129 = *(_DWORD *)(v151 + 48);
            *(_DWORD *)v180 = 68289795;
            *(_DWORD *)&v180[4] = 0;
            *(_WORD *)&v180[8] = 2082;
            *(_QWORD *)&v180[10] = "";
            *(_WORD *)&v180[18] = 1026;
            *(_DWORD *)&v180[20] = v129;
            *(_WORD *)&v180[24] = 2082;
            *(_QWORD *)&v180[26] = "assert";
            *(_WORD *)&v180[34] = 2081;
            *(_QWORD *)&v180[36] = "exterior.longitude_size() >= 0";
            _os_log_impl((void *)&_mh_execute_header, v128, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"@IndoorAvl, load, exterior longitude_size() returned a negative value?!\", \"longitude_size\":%{public}d, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v180, 0x2Cu);
          }

          v130 = sub_1000E0150();
          v131 = objc_claimAutoreleasedReturnValue(v130);
          if (os_signpost_enabled(v131))
          {
            v132 = *(_DWORD *)(v151 + 48);
            *(_DWORD *)v180 = 68289795;
            *(_DWORD *)&v180[4] = 0;
            *(_WORD *)&v180[8] = 2082;
            *(_QWORD *)&v180[10] = "";
            *(_WORD *)&v180[18] = 1026;
            *(_DWORD *)&v180[20] = v132;
            *(_WORD *)&v180[24] = 2082;
            *(_QWORD *)&v180[26] = "assert";
            *(_WORD *)&v180[34] = 2081;
            *(_QWORD *)&v180[36] = "exterior.longitude_size() >= 0";
            _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v131, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "@IndoorAvl, load, exterior longitude_size() returned a negative value?!", "{\"msg%{public}.0s\":\"@IndoorAvl, load, exterior longitude_size() returned a negative value?!\", \"longitude_size\":%{public}d, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v180, 0x2Cu);
          }

          v133 = sub_1000E0150();
          v134 = objc_claimAutoreleasedReturnValue(v133);
          if (os_log_type_enabled(v134, OS_LOG_TYPE_INFO))
          {
            v135 = *(_DWORD *)(v151 + 48);
            *(_DWORD *)v180 = 68289795;
            *(_DWORD *)&v180[4] = 0;
            *(_WORD *)&v180[8] = 2082;
            *(_QWORD *)&v180[10] = "";
            *(_WORD *)&v180[18] = 1026;
            *(_DWORD *)&v180[20] = v135;
            *(_WORD *)&v180[24] = 2082;
            *(_QWORD *)&v180[26] = "assert";
            *(_WORD *)&v180[34] = 2081;
            *(_QWORD *)&v180[36] = "exterior.longitude_size() >= 0";
            _os_log_impl((void *)&_mh_execute_header, v134, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"@IndoorAvl, load, exterior longitude_size() returned a negative value?!\", \"longitude_size\":%{public}d, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v180, 0x2Cu);
          }

          abort_report_np("%s:%d: assertion failure in %s", "/Library/Caches/com.apple.xbs/Sources/purpleslam/daemon/Framework/CLAvailableVenuesStateMachine.mm", 337, "-[CLAvailableVenuesStateMachine computeAvailableVenues:nearCoordinates:withError:]");
LABEL_275:
          while (2)
          {
            __break(1u);
            dispatch_once(&qword_100417EE8, &stru_1003EE9C0);
            v124 = (id)qword_100417EF0;
            if (os_log_type_enabled(v124, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)v180 = 68289539;
              *(_DWORD *)&v180[4] = 0;
              *(_WORD *)&v180[8] = 2082;
              *(_QWORD *)&v180[10] = "";
              *(_WORD *)&v180[18] = 2082;
              *(_QWORD *)&v180[20] = "assert";
              *(_WORD *)&v180[28] = 2081;
              *(_QWORD *)&v180[30] = "!std::isnan(vertexENU.x())";
              _os_log_impl((void *)&_mh_execute_header, v124, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"vertexENU.x() must not be NaN\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v180, 0x26u);
            }

            if (qword_100417EE8 == -1)
            {
              v125 = (id)qword_100417EF0;
              if (os_signpost_enabled(v125))
                goto LABEL_258;
            }
            else
            {
              dispatch_once(&qword_100417EE8, &stru_1003EE9C0);
              v125 = (id)qword_100417EF0;
              if (os_signpost_enabled(v125))
              {
LABEL_258:
                *(_DWORD *)v180 = 68289539;
                *(_DWORD *)&v180[4] = 0;
                *(_WORD *)&v180[8] = 2082;
                *(_QWORD *)&v180[10] = "";
                *(_WORD *)&v180[18] = 2082;
                *(_QWORD *)&v180[20] = "assert";
                *(_WORD *)&v180[28] = 2081;
                *(_QWORD *)&v180[30] = "!std::isnan(vertexENU.x())";
                _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v125, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "vertexENU.x() must not be NaN", "{\"msg%{public}.0s\":\"vertexENU.x() must not be NaN\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v180, 0x26u);
              }
            }

            if (qword_100417EE8 != -1)
              dispatch_once(&qword_100417EE8, &stru_1003EE9C0);
            v126 = (id)qword_100417EF0;
            if (os_log_type_enabled(v126, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)v180 = 68289539;
              *(_DWORD *)&v180[4] = 0;
              *(_WORD *)&v180[8] = 2082;
              *(_QWORD *)&v180[10] = "";
              *(_WORD *)&v180[18] = 2082;
              *(_QWORD *)&v180[20] = "assert";
              *(_WORD *)&v180[28] = 2081;
              *(_QWORD *)&v180[30] = "!std::isnan(vertexENU.x())";
              _os_log_impl((void *)&_mh_execute_header, v126, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"vertexENU.x() must not be NaN\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v180, 0x26u);
            }

            abort_report_np("%s:%d: assertion failure in %s", "/Library/Caches/com.apple.xbs/Sources/purpleslam/daemon/Framework/CLAvailableVenuesStateMachine.mm", 366, "-[CLAvailableVenuesStateMachine computeAvailableVenues:nearCoordinates:withError:]");
            continue;
          }
        }
        if ((unint64_t)objc_msgSend(v7, "count") < v61)
        {
          v62 = objc_msgSend(v7, "count");
          if ((id)v61 != v62)
          {
            if (v61 - (unint64_t)v62 <= 1)
              v63 = 1;
            else
              v63 = v61 - (_QWORD)v62;
            do
            {
              v64 = objc_alloc_init(ECEFCoordinate);
              objc_msgSend(v7, "addObject:", v64);

              --v63;
            }
            while (v63);
          }
          if (qword_100417EE8 == -1)
          {
            v65 = qword_100417EF0;
            if (os_log_type_enabled((os_log_t)qword_100417EF0, OS_LOG_TYPE_FAULT))
              goto LABEL_137;
          }
          else
          {
            dispatch_once(&qword_100417EE8, &stru_1003EE9C0);
            v65 = qword_100417EF0;
            if (os_log_type_enabled((os_log_t)qword_100417EF0, OS_LOG_TYPE_FAULT))
            {
LABEL_137:
              *(_DWORD *)v180 = 67109120;
              *(_DWORD *)&v180[4] = v61;
              _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_FAULT, "@IndoorAvl, load, Needed to allocate additional ECEFCoordinates for the pool: total required %d", v180, 8u);
            }
          }
        }
        if ((int)v61 >= 1)
        {
          v66 = 0;
          v67 = 8 * v61;
          do
          {
            -[GeographicCoordinate setFromLatitude:longitude:andAltitude:](v155, "setFromLatitude:longitude:andAltitude:", *(double *)(*(_QWORD *)(v151 + 16) + v66), *(double *)(*(_QWORD *)(v151 + 40) + v66), 0.0);
            v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastObject"));
            objc_msgSend(v7, "removeLastObject");
            objc_msgSend(v68, "setFromLatLon:", v155);
            objc_msgSend(v154, "addObject:", v68);

            v66 += 8;
          }
          while (v67 != v66);
        }
        +[CLLocationGroup storeAverage:ofVertices:](CLLocationGroup, "storeAverage:ofVertices:", v144, v154);
        -[GeographicCoordinate setFromECEFCoordinate:](v148, "setFromECEFCoordinate:", v144);
        if (objc_msgSend(v141, "count"))
        {
          v168 = 0u;
          v169 = 0u;
          v166 = 0u;
          v167 = 0u;
          v69 = v141;
          v70 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v166, v179, 16);
          if (v70)
          {
            v71 = *(_QWORD *)v167;
LABEL_144:
            v72 = 0;
            while (1)
            {
              if (*(_QWORD *)v167 != v71)
                objc_enumerationMutation(v69);
              v73 = *(id *)(*((_QWORD *)&v166 + 1) + 8 * v72);
              +[CLAvailableVenuesStateMachine distBetweenLatLon:latlon1:](CLAvailableVenuesStateMachine, "distBetweenLatLon:latlon1:", v148, v73);
              v75 = v74;
              v76 = v74 >= self->_maxLoadRadius;

              if (!v76)
                break;
              if (v70 == (id)++v72)
              {
                v70 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v166, v179, 16);
                if (v70)
                  goto LABEL_144;
                break;
              }
            }
          }
          else
          {
            v75 = 1.79769313e308;
          }

        }
        else
        {
          v75 = 0.0;
        }
        maxLoadRadius = self->_maxLoadRadius;
        v145 = v75 > maxLoadRadius;
        if (v75 > maxLoadRadius)
        {
          v140 -= (uint64_t)objc_msgSend(v149, "count");
        }
        else
        {
          v82 = -[CLLocationGroup initWithGroupId:locationIds:center:wifiOnlyDownloadLocIdxs:locationContext:andTolerance:]([CLLocationGroup alloc], "initWithGroupId:locationIds:center:wifiOnlyDownloadLocIdxs:locationContext:andTolerance:", v137, v149, v144, &v173, v136, *(double *)(v151 + 64));
          v159 = v82;
          v83 = -[CLLocationGroup getVertices](v82, "getVertices");
          v164 = 0u;
          v165 = 0u;
          v162 = 0u;
          v163 = 0u;
          obj = v154;
          v84 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v162, v178, 16);
          v85 = v84;
          if (v84)
          {
            v158 = *(_QWORD *)v163;
            do
            {
              v86 = 0;
              do
              {
                if (*(_QWORD *)v163 != v158)
                  objc_enumerationMutation(obj);
                v87 = *(void **)(*((_QWORD *)&v162 + 1) + 8 * (_QWORD)v86);
                v88 = *v83;
                v89 = (void *)objc_claimAutoreleasedReturnValue(-[CLLocationGroup centerLatLon](v82, "centerLatLon"));
                v90 = (void *)objc_claimAutoreleasedReturnValue(-[CLLocationGroup centerECEF](v82, "centerECEF"));
                objc_msgSend(v87, "toBoostEnuWithLatLonOrigin:andEcefOrigin:usingENU:", v89, v90, v161);
                v93 = v91;
                v94 = v92;
                v96 = (_QWORD *)v88[1];
                v95 = v88[2];
                if ((unint64_t)v96 < v95)
                {
                  *v96 = v91;
                  v96[1] = v92;
                  v97 = v96 + 2;
                  v7 = v160;
                  goto LABEL_182;
                }
                v98 = (_QWORD *)*v88;
                v99 = ((uint64_t)v96 - *v88) >> 4;
                v100 = v99 + 1;
                if ((unint64_t)(v99 + 1) >> 60)
                  sub_1000D02C0();
                v101 = v95 - (_QWORD)v98;
                if (v101 >> 3 > v100)
                  v100 = v101 >> 3;
                if ((unint64_t)v101 >= 0x7FFFFFFFFFFFFFF0)
                  v102 = 0xFFFFFFFFFFFFFFFLL;
                else
                  v102 = v100;
                if (v102)
                {
                  if (v102 >> 60)
                    sub_1000CDEB8();
                  v103 = (char *)operator new(16 * v102);
                  v104 = &v103[16 * v99];
                  *(_QWORD *)v104 = v93;
                  *((_QWORD *)v104 + 1) = v94;
                  v105 = (uint64_t)v104;
                  if (v96 == v98)
                  {
LABEL_185:
                    v7 = v160;
                    v97 = v104 + 16;
                    *v88 = v105;
                    v88[1] = v104 + 16;
                    v88[2] = &v103[16 * v102];
                    if (v96)
                      goto LABEL_181;
                    goto LABEL_182;
                  }
                }
                else
                {
                  v103 = 0;
                  v104 = (char *)(16 * v99);
                  *(_QWORD *)v104 = v91;
                  *((_QWORD *)v104 + 1) = v92;
                  v105 = 16 * v99;
                  if (v96 == v98)
                    goto LABEL_185;
                }
                v7 = v160;
                do
                {
                  *(_OWORD *)(v105 - 16) = *((_OWORD *)v96 - 1);
                  v105 -= 16;
                  v96 -= 2;
                }
                while (v96 != v98);
                v96 = (_QWORD *)*v88;
                v97 = v104 + 16;
                *v88 = v105;
                v88[1] = v104 + 16;
                v88[2] = &v103[16 * v102];
                if (v96)
LABEL_181:
                  operator delete(v96);
LABEL_182:
                v88[1] = v97;

                v82 = v159;
                v86 = (char *)v86 + 1;
              }
              while (v86 != v85);
              v106 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v162, v178, 16, *((*v83)[1] - 1));
              v85 = v106;
            }
            while (v106);
          }

          if (*(_DWORD *)(v151 + 48) != ((char *)(*v83)[1] - (char *)**v83) >> 4)
          {
            sub_100341B90();

            abort_report_np("%s:%d: assertion failure in %s", "/Library/Caches/com.apple.xbs/Sources/purpleslam/daemon/Framework/CLAvailableVenuesStateMachine.mm", 372, "-[CLAvailableVenuesStateMachine computeAvailableVenues:nearCoordinates:withError:]");
            goto LABEL_275;
          }
          sub_10009C2FC(*v83);
          objc_msgSend(v139, "addObject:", v159);

          ++v138;
        }
        objc_msgSend(v7, "addObjectsFromArray:", v154);
        objc_msgSend(v154, "removeAllObjects");
        goto LABEL_125;
      }
LABEL_223:
      v15 = 0;
      v43 = (id)v137;
LABEL_212:
      sub_10004AAA0((uint64_t)&v170, v171);
      sub_10004AAA0((uint64_t)&v173, v174);

      if (v177 < 0)
        goto LABEL_213;
LABEL_214:
      sub_10009DC84(buf);
      objc_autoreleasePoolPop(context);
      if (v15 != 11 && v15)
      {
        v122 = 0;
        v123 = v139;
        goto LABEL_253;
      }
      if (++v153 == v147)
        goto LABEL_236;
    }
  }
  v138 = 0;
  v140 = 0;
LABEL_236:
  if (objc_msgSend(v152, "tileIsOpenForIncrementalIO"))
  {
    sub_10009DA68((uint64_t)buf);
    if (qword_100417EE8 != -1)
      dispatch_once(&qword_100417EE8, &stru_1003EE9C0);
    v118 = (id)qword_100417EF0;
    if (os_log_type_enabled(v118, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v180 = 0;
      _os_log_impl((void *)&_mh_execute_header, v118, OS_LOG_TYPE_INFO, "@IndoorAvl, load, make sure we have no more venue bounds to read", v180, 2u);
    }

    if (objc_msgSend(v152, "getNextVenueBoundsIncrementally:", buf))
    {
      if (qword_100417EE8 != -1)
        dispatch_once(&qword_100417EE8, &stru_1003EE9C0);
      v119 = (id)qword_100417EF0;
      if (os_log_type_enabled(v119, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v180 = 0;
        _os_log_impl((void *)&_mh_execute_header, v119, OS_LOG_TYPE_ERROR, "@IndoorAvl, load, had venues left over after iterating over all venues in tile. why?", v180, 2u);
      }

    }
    sub_10009DC84(buf);
  }
  if (qword_100417EE8 != -1)
    dispatch_once(&qword_100417EE8, &stru_1003EE9C0);
  v120 = (id)qword_100417EF0;
  if (os_log_type_enabled(v120, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218240;
    v182 = v140;
    v183 = 2048;
    *(_QWORD *)v184 = v138;
    _os_log_impl((void *)&_mh_execute_header, v120, OS_LOG_TYPE_DEBUG, "Found %zu floors across %zu venues", buf, 0x16u);
  }

  v123 = v139;
  v122 = v139;
LABEL_253:

  return v122;
}

- (BOOL)isVenueDisabled:(id)a3 locationId:(id)a4
{
  id v6;
  id v7;
  NSSet *disabledVenues;
  void *v9;
  BOOL v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  disabledVenues = self->_disabledVenues;
  if (disabledVenues)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSSet member:](disabledVenues, "member:", v6));
    if (v9)
    {
      v10 = 1;
    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSSet member:](self->_disabledVenues, "member:", v7));
      v10 = v11 != 0;

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (double)distBetweenLatLon:(id)a3 latlon1:(id)a4
{
  id v5;
  id v6;
  void *v7;
  double v8;
  long double v9;
  double v10;
  double v11;
  double v12;
  long double v13;
  double v14;
  long double v15;
  long double v16;
  long double v17;
  long double v18;
  double v19;
  long double v20;
  long double v21;
  double v22;
  double v23;
  id v25;
  NSObject *v26;
  id v27;
  NSObject *v28;
  id v29;
  NSObject *v30;
  int v31;
  id v32;
  NSObject *v33;
  id v34;
  NSObject *v35;
  id v36;
  uint8_t buf[4];
  int v38;
  __int16 v39;
  const char *v40;
  __int16 v41;
  const char *v42;
  __int16 v43;
  const char *v44;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (!v5)
  {
    v25 = sub_1000E0150();
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      v38 = 0;
      v39 = 2082;
      v40 = "";
      v41 = 2082;
      v42 = "assert";
      v43 = 2081;
      v44 = "latlon0 != nullptr";
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"distBetweenLatLon: first coordinate must be valid!\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    v27 = sub_1000E0150();
    v28 = objc_claimAutoreleasedReturnValue(v27);
    if (os_signpost_enabled(v28))
    {
      *(_DWORD *)buf = 68289539;
      v38 = 0;
      v39 = 2082;
      v40 = "";
      v41 = 2082;
      v42 = "assert";
      v43 = 2081;
      v44 = "latlon0 != nullptr";
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v28, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "distBetweenLatLon: first coordinate must be valid!", "{\"msg%{public}.0s\":\"distBetweenLatLon: first coordinate must be valid!\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    v29 = sub_1000E0150();
    v30 = objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      v38 = 0;
      v39 = 2082;
      v40 = "";
      v41 = 2082;
      v42 = "assert";
      v43 = 2081;
      v44 = "latlon0 != nullptr";
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"distBetweenLatLon: first coordinate must be valid!\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    v31 = 104;
LABEL_18:

    abort_report_np("%s:%d: assertion failure in %s", "/Library/Caches/com.apple.xbs/Sources/purpleslam/daemon/Framework/CLAvailableVenuesStateMachine.mm", v31, "+[CLAvailableVenuesStateMachine distBetweenLatLon:latlon1:]");
    __break(1u);
  }
  if (!v6)
  {
    v32 = sub_1000E0150();
    v33 = objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      v38 = 0;
      v39 = 2082;
      v40 = "";
      v41 = 2082;
      v42 = "assert";
      v43 = 2081;
      v44 = "latlon1 != nullptr";
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"distBetweenLatLon: second coordinate must be valid!\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    v34 = sub_1000E0150();
    v35 = objc_claimAutoreleasedReturnValue(v34);
    if (os_signpost_enabled(v35))
    {
      *(_DWORD *)buf = 68289539;
      v38 = 0;
      v39 = 2082;
      v40 = "";
      v41 = 2082;
      v42 = "assert";
      v43 = 2081;
      v44 = "latlon1 != nullptr";
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v35, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "distBetweenLatLon: second coordinate must be valid!", "{\"msg%{public}.0s\":\"distBetweenLatLon: second coordinate must be valid!\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    v36 = sub_1000E0150();
    v30 = objc_claimAutoreleasedReturnValue(v36);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      v38 = 0;
      v39 = 2082;
      v40 = "";
      v41 = 2082;
      v42 = "assert";
      v43 = 2081;
      v44 = "latlon1 != nullptr";
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"distBetweenLatLon: second coordinate must be valid!\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    v31 = 105;
    goto LABEL_18;
  }
  objc_msgSend(v5, "latitude");
  +[CLAvailableVenuesStateMachine deg2rad:](CLAvailableVenuesStateMachine, "deg2rad:");
  v9 = v8;
  objc_msgSend(v5, "longitude");
  +[CLAvailableVenuesStateMachine deg2rad:](CLAvailableVenuesStateMachine, "deg2rad:");
  v11 = v10;
  objc_msgSend(v7, "latitude");
  +[CLAvailableVenuesStateMachine deg2rad:](CLAvailableVenuesStateMachine, "deg2rad:");
  v13 = v12;
  objc_msgSend(v7, "longitude");
  +[CLAvailableVenuesStateMachine deg2rad:](CLAvailableVenuesStateMachine, "deg2rad:");
  v15 = sin((v11 - v14) * 0.5);
  v16 = v15 * v15;
  v17 = sin((v9 - v13) * 0.5);
  v18 = v17 * v17;
  v19 = cos(v9);
  v20 = cos(v13);
  v21 = asin(sqrt(v18 + v19 * v20 * v16));
  +[CLAvailableVenuesStateMachine metersFromGreatCircleDistance:](CLAvailableVenuesStateMachine, "metersFromGreatCircleDistance:", (double)(v21 + v21));
  v23 = v22;

  return v23;
}

+ (double)deg2rad:(double)a3
{
  return a3 * 3.14159265 / 180.0;
}

+ (double)metersFromGreatCircleDistance:(double)a3
{
  return a3 * 180.0 / 3.14159265 * 60.0 * 1852.0;
}

+ (int64_t)getLocationContextFromVenueBounds:(const void *)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  unsigned int v8;

  if ((*((_BYTE *)a3 + 104) & 8) != 0)
    return *((_DWORD *)a3 + 24) != 1;
  v3 = *((int *)a3 + 6);
  if (!(_DWORD)v3)
    return 0;
  v4 = *((_QWORD *)a3 + 2);
  v5 = 8 * v3;
  while (1)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:"));
    if ((objc_msgSend(v6, "hasPrefix:", CFSTR("G")) & 1) == 0)
      break;

    v4 += 8;
    v5 -= 8;
    if (!v5)
      return 0;
  }
  v8 = objc_msgSend(v6, "hasPrefix:", CFSTR("LR"));

  return v8;
}

- (void)setDisabledVenues:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void)clearLastFix
{
  GeographicCoordinate *lastFix;

  lastFix = self->_lastFix;
  self->_lastFix = 0;

}

- (id)openTileParserAtPath:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  CLAvailabilityTileParser *v9;
  NSObject *p_super;
  NSObject *v11;
  id v12;
  id v13;
  NSObject *v14;
  int v16;
  id v17;

  v3 = a3;
  if (qword_100417EE8 != -1)
    dispatch_once(&qword_100417EE8, &stru_1003EE9C0);
  v4 = (id)qword_100417EF0;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "absoluteString")));
    v16 = 136315138;
    v17 = objc_msgSend(v5, "UTF8String");
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Request to get nearby location groups from availability tile at %s", (uint8_t *)&v16, 0xCu);

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "path"));
  v8 = objc_msgSend(v6, "fileExistsAtPath:", v7);

  if ((v8 & 1) == 0)
  {
    if (qword_100417EE8 == -1)
    {
      p_super = (id)qword_100417EF0;
      if (!os_log_type_enabled(p_super, OS_LOG_TYPE_INFO))
      {
LABEL_11:
        v11 = 0;
        goto LABEL_16;
      }
    }
    else
    {
      dispatch_once(&qword_100417EE8, &stru_1003EE9C0);
      p_super = (id)qword_100417EF0;
      if (!os_log_type_enabled(p_super, OS_LOG_TYPE_INFO))
        goto LABEL_11;
    }
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "path")));
    v13 = objc_msgSend(v12, "UTF8String");
    v16 = 136315138;
    v17 = v13;
    _os_log_impl((void *)&_mh_execute_header, p_super, OS_LOG_TYPE_INFO, "#warning, cannot find file %s on-disk", (uint8_t *)&v16, 0xCu);

    goto LABEL_11;
  }
  v9 = -[CLAvailabilityTileParser initWithTilePathIncrementalIO:]([CLAvailabilityTileParser alloc], "initWithTilePathIncrementalIO:", v3);
  p_super = &v9->super;
  if (!v9)
  {
    if (qword_100417EE8 == -1)
    {
      v14 = qword_100417EF0;
      if (!os_log_type_enabled((os_log_t)qword_100417EF0, OS_LOG_TYPE_DEFAULT))
      {
LABEL_15:
        v11 = 0;
        goto LABEL_16;
      }
    }
    else
    {
      dispatch_once(&qword_100417EE8, &stru_1003EE9C0);
      v14 = qword_100417EF0;
      if (!os_log_type_enabled((os_log_t)qword_100417EF0, OS_LOG_TYPE_DEFAULT))
        goto LABEL_15;
    }
    LOWORD(v16) = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "#Warning Couldn't load availability tile - ignoring request for nearby locations", (uint8_t *)&v16, 2u);
    goto LABEL_15;
  }
  p_super = v9;
  v11 = p_super;
LABEL_16:

  return v11;
}

- (id)getNearbyLocationGroups:(id)a3 withUpdatedPos:(id)a4
{
  return (id)objc_claimAutoreleasedReturnValue(-[CLAvailableVenuesStateMachine getNearbyLocationGroups:withUpdatedPos:nearLocationsOfInterest:](self, "getNearbyLocationGroups:withUpdatedPos:nearLocationsOfInterest:", a3, a4, 0));
}

- (id)getNearbyLocationGroups:(id)a3 withUpdatedPos:(id)a4 nearLocationsOfInterest:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;

  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CLAvailableVenuesStateMachine openTileParserAtPath:](self, "openTileParserAtPath:", a3));
  if (v10)
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CLAvailableVenuesStateMachine getNearbyLocationGroupsForTile:withUpdatedPos:nearLocationsOfInterest:](self, "getNearbyLocationGroupsForTile:withUpdatedPos:nearLocationsOfInterest:", v10, v8, v9));
  else
    v11 = 0;

  return v11;
}

- (GeographicCoordinate)lastFix
{
  return (GeographicCoordinate *)objc_getProperty(self, a2, 8, 1);
}

- (double)maxLoadRadius
{
  return self->_maxLoadRadius;
}

- (void)setMaxLoadRadius:(double)a3
{
  self->_maxLoadRadius = a3;
}

- (NSSet)disabledVenues
{
  return (NSSet *)objc_getProperty(self, a2, 24, 1);
}

- (CLIndoorAvailabilityTileParams)availabilityTileParams
{
  return (CLIndoorAvailabilityTileParams *)objc_getProperty(self, a2, 32, 1);
}

@end
