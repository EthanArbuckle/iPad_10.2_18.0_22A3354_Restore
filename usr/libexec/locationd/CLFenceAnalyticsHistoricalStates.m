@implementation CLFenceAnalyticsHistoricalStates

- (CLFenceAnalyticsHistoricalStates)init
{
  CLFenceAnalyticsHistoricalStates *v2;
  CLFenceAnalyticsHistoricalStates *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CLFenceAnalyticsHistoricalStates;
  v2 = -[CLFenceAnalyticsHistoricalStates init](&v5, "init");
  v3 = v2;
  if (v2)
    -[CLFenceAnalyticsHistoricalStates resetHistoricalStates](v2, "resetHistoricalStates");
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLFenceAnalyticsHistoricalStates;
  -[CLFenceAnalyticsHistoricalStates dealloc](&v3, "dealloc");
}

- (void)updateCurrentState:(int)a3 previousState:(int)a4 location:(CLDaemonLocation *)a5 locationReceivedTime:(double)a6
{
  uint64_t v9;
  NSObject *v11;
  const char *v12;
  const char *v13;
  NSObject *v14;
  const char *v15;
  const char *v16;
  int lifespan_low;
  uint64_t v18;
  $AB5116BA7E623E054F959CECB034F4E7 rawCoordinate;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  const char *v23;
  const char *v24;
  const char *v25;
  int v26;
  uint64_t v27;
  const char *v28;
  uint8_t *v29;
  const char *v30;
  const char *v31;
  uint8_t *v32;
  const char *v33;
  _OWORD v34[8];
  _OWORD v35[2];
  _OWORD v36[8];
  _DWORD v37[41];
  _BYTE v38[28];
  _OWORD v39[8];
  _DWORD v40[41];
  _BYTE v41[28];
  int v42;
  const char *v43;
  __int16 v44;
  const char *v45;
  __int16 v46;
  int v47;
  __int16 v48;
  uint64_t v49;
  uint8_t buf[4];
  const char *v51;
  __int16 v52;
  const char *v53;
  __int16 v54;
  int v55;
  __int16 v56;
  uint64_t v57;

  v9 = *(_QWORD *)&a3;
  if (-[CLFenceAnalyticsHistoricalStates currentState](self, "currentState") != a4)
  {
    if (qword_1022A0060 != -1)
      dispatch_once(&qword_1022A0060, &stru_10215E650);
    v11 = qword_1022A0068;
    if (os_log_type_enabled((os_log_t)qword_1022A0068, OS_LOG_TYPE_DEFAULT))
    {
      if ((v9 + 1) > 4)
        v12 = "---";
      else
        v12 = off_10215E670[(int)v9 + 1];
      if ((a4 + 1) > 4)
        v13 = "---";
      else
        v13 = off_10215E670[a4 + 1];
      *(_DWORD *)buf = 136315394;
      v51 = v12;
      v52 = 2080;
      v53 = v13;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#FenceMetrics Previous fence states don't match, reseting historical states, currentState %s, previousState %s", buf, 0x16u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0060 != -1)
        dispatch_once(&qword_1022A0060, &stru_10215E650);
      if ((v9 + 1) > 4)
        v24 = "---";
      else
        v24 = off_10215E670[(int)v9 + 1];
      if ((a4 + 1) > 4)
        v30 = "---";
      else
        v30 = off_10215E670[a4 + 1];
      v42 = 136315394;
      v43 = v24;
      v44 = 2080;
      v45 = v30;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0068, 0, "#FenceMetrics Previous fence states don't match, reseting historical states, currentState %s, previousState %s", (const char *)&v42, 22);
      v32 = (uint8_t *)v31;
      sub_100512490("Generic", 1, 0, 2, "-[CLFenceAnalyticsHistoricalStates updateCurrentState:previousState:location:locationReceivedTime:]", "%s\n", v31);
      if (v32 != buf)
        free(v32);
    }
    -[CLFenceAnalyticsHistoricalStates resetHistoricalStates](self, "resetHistoricalStates");
  }
  if (qword_1022A0060 != -1)
    dispatch_once(&qword_1022A0060, &stru_10215E650);
  v14 = qword_1022A0068;
  if (os_log_type_enabled((os_log_t)qword_1022A0068, OS_LOG_TYPE_DEFAULT))
  {
    if ((v9 + 1) > 4)
      v15 = "---";
    else
      v15 = off_10215E670[(int)v9 + 1];
    if ((a4 + 1) > 4)
      v16 = "---";
    else
      v16 = off_10215E670[a4 + 1];
    lifespan_low = LODWORD(a5->lifespan);
    v18 = *(_QWORD *)((char *)&a5->coordinate.longitude + 4);
    *(_DWORD *)buf = 136315906;
    v51 = v15;
    v52 = 2080;
    v53 = v16;
    v54 = 1024;
    v55 = lifespan_low;
    v56 = 2048;
    v57 = v18;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "#FenceMetrics updating to currentState %s, previousState %s, provider %d, accuracy %f", buf, 0x26u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0060 != -1)
      dispatch_once(&qword_1022A0060, &stru_10215E650);
    if ((v9 + 1) > 4)
      v23 = "---";
    else
      v23 = off_10215E670[(int)v9 + 1];
    if ((a4 + 1) > 4)
      v25 = "---";
    else
      v25 = off_10215E670[a4 + 1];
    v26 = LODWORD(a5->lifespan);
    v27 = *(_QWORD *)((char *)&a5->coordinate.longitude + 4);
    v42 = 136315906;
    v43 = v23;
    v44 = 2080;
    v45 = v25;
    v46 = 1024;
    v47 = v26;
    v48 = 2048;
    v49 = v27;
    LODWORD(v33) = 38;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0068, 0, "#FenceMetrics updating to currentState %s, previousState %s, provider %d, accuracy %f", (const char *)&v42, v33, LODWORD(v34[0]), *((double *)v34 + 1));
    v29 = (uint8_t *)v28;
    sub_100512490("Generic", 1, 0, 2, "-[CLFenceAnalyticsHistoricalStates updateCurrentState:previousState:location:locationReceivedTime:]", "%s\n", v28);
    if (v29 != buf)
      free(v29);
  }
  -[CLFenceAnalyticsHistoricalStates setNMinusThreeState:](self, "setNMinusThreeState:", self->_nMinusTwoState);
  -[CLFenceAnalyticsHistoricalStates setNMinusTwoState:](self, "setNMinusTwoState:", self->_nMinusOneState);
  -[CLFenceAnalyticsHistoricalStates setTimeOfNMinusTwoStateChange:](self, "setTimeOfNMinusTwoStateChange:", -[CLFenceAnalyticsHistoricalStates timeOfNMinusOneStateChange](self, "timeOfNMinusOneStateChange"));
  -[CLFenceAnalyticsHistoricalStates nMinusOneStateChangeLocation](self, "nMinusOneStateChangeLocation");
  v39[6] = *(_OWORD *)&v40[33];
  v39[7] = *(_OWORD *)&v40[37];
  *(_OWORD *)v40 = *(_OWORD *)v41;
  *(_OWORD *)&v40[3] = *(_OWORD *)&v41[12];
  v39[2] = *(_OWORD *)&v40[17];
  v39[3] = *(_OWORD *)&v40[21];
  v39[4] = *(_OWORD *)&v40[25];
  v39[5] = *(_OWORD *)&v40[29];
  v39[0] = *(_OWORD *)&v40[9];
  v39[1] = *(_OWORD *)&v40[13];
  -[CLFenceAnalyticsHistoricalStates setNMinusTwoStateChangeLocation:](self, "setNMinusTwoStateChangeLocation:", v39);
  -[CLFenceAnalyticsHistoricalStates setNMinusOneState:](self, "setNMinusOneState:", -[CLFenceAnalyticsHistoricalStates currentState](self, "currentState"));
  -[CLFenceAnalyticsHistoricalStates setTimeOfNMinusOneStateChange:](self, "setTimeOfNMinusOneStateChange:", -[CLFenceAnalyticsHistoricalStates timeOfCurrentStateChange](self, "timeOfCurrentStateChange"));
  -[CLFenceAnalyticsHistoricalStates currentLocation](self, "currentLocation");
  v36[6] = *(_OWORD *)&v37[33];
  v36[7] = *(_OWORD *)&v37[37];
  *(_OWORD *)v37 = *(_OWORD *)v38;
  *(_OWORD *)&v37[3] = *(_OWORD *)&v38[12];
  v36[2] = *(_OWORD *)&v37[17];
  v36[3] = *(_OWORD *)&v37[21];
  v36[4] = *(_OWORD *)&v37[25];
  v36[5] = *(_OWORD *)&v37[29];
  v36[0] = *(_OWORD *)&v37[9];
  v36[1] = *(_OWORD *)&v37[13];
  -[CLFenceAnalyticsHistoricalStates setNMinusOneStateChangeLocation:](self, "setNMinusOneStateChangeLocation:", v36);
  -[CLFenceAnalyticsHistoricalStates setCurrentState:](self, "setCurrentState:", v9);
  -[CLFenceAnalyticsHistoricalStates setTimeOfCurrentStateChange:](self, "setTimeOfCurrentStateChange:", +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", a6));
  rawCoordinate = a5->rawCoordinate;
  v34[6] = *(_OWORD *)&a5->lifespan;
  v34[7] = rawCoordinate;
  v35[0] = *(_OWORD *)&a5->rawCourse;
  *(_OWORD *)((char *)v35 + 12) = *(_OWORD *)&a5->integrity;
  v20 = *(_OWORD *)&a5->speed;
  v34[2] = *(_OWORD *)&a5->altitude;
  v34[3] = v20;
  v21 = *(_OWORD *)&a5->timestamp;
  v34[4] = *(_OWORD *)&a5->course;
  v34[5] = v21;
  v22 = *(_OWORD *)&a5->coordinate.longitude;
  v34[0] = *(_OWORD *)&a5->suitability;
  v34[1] = v22;
  -[CLFenceAnalyticsHistoricalStates setCurrentLocation:](self, "setCurrentLocation:", v34);
}

- (void)updateTimeToInitialStateChange:(double)a3
{
  self->_timeToInitialStateChange = a3;
}

- (void)resetHistoricalStates
{
  __int128 v3;

  *(_QWORD *)&v3 = 0x300000003;
  *((_QWORD *)&v3 + 1) = 0x300000003;
  *(_OWORD *)&self->_currentState = v3;
  -[CLFenceAnalyticsHistoricalStates setTimeOfCurrentStateChange:](self, "setTimeOfCurrentStateChange:", 0);
  -[CLFenceAnalyticsHistoricalStates setTimeOfNMinusOneStateChange:](self, "setTimeOfNMinusOneStateChange:", 0);
  -[CLFenceAnalyticsHistoricalStates setTimeOfNMinusTwoStateChange:](self, "setTimeOfNMinusTwoStateChange:", 0);
  *(_OWORD *)&self->_currentLocation.coordinate.longitude = xmmword_101C17488;
  *(_OWORD *)&self->_currentLocation.suitability = xmmword_101C17478;
  *(_OWORD *)&self->_currentLocation.speed = xmmword_101C174A8;
  *(_OWORD *)&self->_currentLocation.altitude = xmmword_101C17498;
  *(_OWORD *)&self->_currentLocation.timestamp = xmmword_101C174C8;
  *(_OWORD *)&self->_currentLocation.course = xmmword_101C174B8;
  *(_OWORD *)&self->_currentLocation.lifespan = xmmword_101C174D8;
  self->_currentLocation.rawCoordinate = ($AB5116BA7E623E054F959CECB034F4E7)xmmword_101C174E8;
  *(_OWORD *)&self->_currentLocation.rawCourse = xmmword_101C174F8;
  *(_OWORD *)&self->_currentLocation.integrity = *(__int128 *)((char *)&xmmword_101C174F8 + 12);
  *(_OWORD *)(&self->_nMinusOneStateChangeLocation.confidence + 1) = xmmword_101C174E8;
  *(_OWORD *)(&self->_nMinusOneStateChangeLocation.type + 1) = xmmword_101C174F8;
  *($AB5116BA7E623E054F959CECB034F4E7 *)((char *)&self->_nMinusOneStateChangeLocation.coordinate + 4) = ($AB5116BA7E623E054F959CECB034F4E7)xmmword_101C17498;
  *(_OWORD *)((char *)&self->_nMinusOneStateChangeLocation.horizontalAccuracy + 4) = xmmword_101C174A8;
  *(_OWORD *)((char *)&self->_nMinusOneStateChangeLocation.verticalAccuracy + 4) = xmmword_101C174B8;
  *(_OWORD *)((char *)&self->_nMinusOneStateChangeLocation.speedAccuracy + 4) = xmmword_101C174C8;
  *(_OWORD *)((char *)&self->_nMinusOneStateChangeLocation.courseAccuracy + 4) = xmmword_101C174D8;
  *(_OWORD *)(&self->_currentLocation.signalEnvironmentType + 1) = xmmword_101C17478;
  *(_OWORD *)(&self->_currentLocation.fromSimulationController + 4) = xmmword_101C17488;
  *(_OWORD *)&self->_nMinusTwoStateChangeLocation.courseAccuracy = xmmword_101C174E8;
  *(_OWORD *)&self->_nMinusTwoStateChangeLocation.confidence = xmmword_101C174F8;
  *(_OWORD *)((char *)&self->_nMinusTwoStateChangeLocation.lifespan + 4) = *(__int128 *)((char *)&xmmword_101C174F8 + 12);
  self->_nMinusTwoStateChangeLocation.coordinate = ($AB5116BA7E623E054F959CECB034F4E7)xmmword_101C174A8;
  *(_OWORD *)&self->_nMinusTwoStateChangeLocation.horizontalAccuracy = xmmword_101C174B8;
  *(_OWORD *)&self->_nMinusTwoStateChangeLocation.verticalAccuracy = xmmword_101C174C8;
  *(_OWORD *)&self->_nMinusTwoStateChangeLocation.speedAccuracy = xmmword_101C174D8;
  *(_OWORD *)&self->_nMinusOneStateChangeLocation.rawCoordinate.longitude = *(__int128 *)((char *)&xmmword_101C174F8 + 12);
  *(_OWORD *)&self->_nMinusOneStateChangeLocation.floor = xmmword_101C17478;
  *(_OWORD *)&self->_nMinusOneStateChangeLocation.signalEnvironmentType = xmmword_101C17488;
  *(_OWORD *)&self->_nMinusOneStateChangeLocation.fromSimulationController = xmmword_101C17498;
  self->_timeToInitialStateChange = -1.0;
}

- (int)currentState
{
  return self->_currentState;
}

- (void)setCurrentState:(int)a3
{
  self->_currentState = a3;
}

- (NSDate)timeOfCurrentStateChange
{
  return self->_timeOfCurrentStateChange;
}

- (void)setTimeOfCurrentStateChange:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (CLDaemonLocation)currentLocation
{
  $AB5116BA7E623E054F959CECB034F4E7 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;

  v3 = *($AB5116BA7E623E054F959CECB034F4E7 *)&self->fromSimulationController;
  *(_OWORD *)&retstr->lifespan = *(_OWORD *)&self->signalEnvironmentType;
  retstr->rawCoordinate = v3;
  *($AB5116BA7E623E054F959CECB034F4E7 *)&retstr->rawCourse = self[1].coordinate;
  *(_OWORD *)&retstr->integrity = *(_OWORD *)((char *)&self[1].coordinate.longitude + 4);
  v4 = *(_OWORD *)&self->type;
  *(_OWORD *)&retstr->altitude = *(_OWORD *)&self->confidence;
  *(_OWORD *)&retstr->speed = v4;
  v5 = *(_OWORD *)&self->floor;
  *(_OWORD *)&retstr->course = *(_OWORD *)&self->rawCoordinate.longitude;
  *(_OWORD *)&retstr->timestamp = v5;
  v6 = *(_OWORD *)&self->courseAccuracy;
  *(_OWORD *)&retstr->suitability = *(_OWORD *)&self->speedAccuracy;
  *(_OWORD *)&retstr->coordinate.longitude = v6;
  return self;
}

- (void)setCurrentLocation:(CLDaemonLocation *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  $AB5116BA7E623E054F959CECB034F4E7 rawCoordinate;
  __int128 v9;

  v3 = *(_OWORD *)&a3->suitability;
  *(_OWORD *)&self->_currentLocation.coordinate.longitude = *(_OWORD *)&a3->coordinate.longitude;
  *(_OWORD *)&self->_currentLocation.suitability = v3;
  v4 = *(_OWORD *)&a3->altitude;
  v5 = *(_OWORD *)&a3->speed;
  v6 = *(_OWORD *)&a3->course;
  *(_OWORD *)&self->_currentLocation.timestamp = *(_OWORD *)&a3->timestamp;
  *(_OWORD *)&self->_currentLocation.course = v6;
  *(_OWORD *)&self->_currentLocation.speed = v5;
  *(_OWORD *)&self->_currentLocation.altitude = v4;
  v7 = *(_OWORD *)&a3->lifespan;
  rawCoordinate = a3->rawCoordinate;
  v9 = *(_OWORD *)&a3->rawCourse;
  *(_OWORD *)&self->_currentLocation.integrity = *(_OWORD *)&a3->integrity;
  *(_OWORD *)&self->_currentLocation.rawCourse = v9;
  self->_currentLocation.rawCoordinate = rawCoordinate;
  *(_OWORD *)&self->_currentLocation.lifespan = v7;
}

- (int)nMinusOneState
{
  return self->_nMinusOneState;
}

- (void)setNMinusOneState:(int)a3
{
  self->_nMinusOneState = a3;
}

- (NSDate)timeOfNMinusOneStateChange
{
  return self->_timeOfNMinusOneStateChange;
}

- (void)setTimeOfNMinusOneStateChange:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (CLDaemonLocation)nMinusOneStateChangeLocation
{
  __int128 v3;
  __int128 v4;
  $AB5116BA7E623E054F959CECB034F4E7 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;

  *(_OWORD *)&retstr->integrity = *(_OWORD *)&self[2].suitability;
  v3 = *(_OWORD *)((char *)&self[1].course + 4);
  v4 = *(_OWORD *)((char *)&self[1].speed + 4);
  *(_OWORD *)&retstr->suitability = *(_OWORD *)((char *)&self[1].altitude + 4);
  *(_OWORD *)&retstr->coordinate.longitude = v4;
  v5 = *($AB5116BA7E623E054F959CECB034F4E7 *)&self[1].rawReferenceFrame;
  v6 = *(_OWORD *)((char *)&self[1].ellipsoidalAltitude + 4);
  v7 = *(__int128 *)((char *)&self[1].rawCoordinate + 4);
  *(_OWORD *)&retstr->lifespan = *(_OWORD *)((char *)&self[1].rawCourse + 4);
  retstr->rawCoordinate = v5;
  *(_OWORD *)&retstr->rawCourse = v6;
  v8 = *(_OWORD *)((char *)&self[1].timestamp + 4);
  v9 = *(_OWORD *)((char *)&self[1].lifespan + 4);
  *(_OWORD *)&retstr->altitude = v3;
  *(_OWORD *)&retstr->speed = v8;
  *(_OWORD *)&retstr->course = v9;
  *(_OWORD *)&retstr->timestamp = v7;
  return self;
}

- (void)setNMinusOneStateChangeLocation:(CLDaemonLocation *)a3
{
  __int128 v3;
  $AB5116BA7E623E054F959CECB034F4E7 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  $AB5116BA7E623E054F959CECB034F4E7 rawCoordinate;
  __int128 v9;

  v3 = *(_OWORD *)&a3->suitability;
  *(_OWORD *)(&self->_currentLocation.fromSimulationController + 4) = *(_OWORD *)&a3->coordinate.longitude;
  *(_OWORD *)(&self->_currentLocation.signalEnvironmentType + 1) = v3;
  v4 = *($AB5116BA7E623E054F959CECB034F4E7 *)&a3->altitude;
  v5 = *(_OWORD *)&a3->speed;
  v6 = *(_OWORD *)&a3->timestamp;
  *(_OWORD *)((char *)&self->_nMinusOneStateChangeLocation.verticalAccuracy + 4) = *(_OWORD *)&a3->course;
  *(_OWORD *)((char *)&self->_nMinusOneStateChangeLocation.speedAccuracy + 4) = v6;
  *(_OWORD *)((char *)&self->_nMinusOneStateChangeLocation.horizontalAccuracy + 4) = v5;
  *($AB5116BA7E623E054F959CECB034F4E7 *)((char *)&self->_nMinusOneStateChangeLocation.coordinate + 4) = v4;
  v7 = *(_OWORD *)&a3->lifespan;
  rawCoordinate = a3->rawCoordinate;
  v9 = *(_OWORD *)&a3->rawCourse;
  *(_OWORD *)&self->_nMinusOneStateChangeLocation.rawCoordinate.longitude = *(_OWORD *)&a3->integrity;
  *($AB5116BA7E623E054F959CECB034F4E7 *)(&self->_nMinusOneStateChangeLocation.confidence + 1) = rawCoordinate;
  *(_OWORD *)(&self->_nMinusOneStateChangeLocation.type + 1) = v9;
  *(_OWORD *)((char *)&self->_nMinusOneStateChangeLocation.courseAccuracy + 4) = v7;
}

- (int)nMinusTwoState
{
  return self->_nMinusTwoState;
}

- (void)setNMinusTwoState:(int)a3
{
  self->_nMinusTwoState = a3;
}

- (NSDate)timeOfNMinusTwoStateChange
{
  return self->_timeOfNMinusTwoStateChange;
}

- (void)setTimeOfNMinusTwoStateChange:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (CLDaemonLocation)nMinusTwoStateChangeLocation
{
  $AB5116BA7E623E054F959CECB034F4E7 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;

  v3 = *($AB5116BA7E623E054F959CECB034F4E7 *)&self[2].rawCourse;
  *($AB5116BA7E623E054F959CECB034F4E7 *)&retstr->lifespan = self[2].rawCoordinate;
  retstr->rawCoordinate = v3;
  *(_OWORD *)&retstr->rawCourse = *(_OWORD *)&self[2].referenceFrame;
  v4 = *(_OWORD *)&self[2].course;
  *(_OWORD *)&retstr->altitude = *(_OWORD *)&self[2].speed;
  *(_OWORD *)&retstr->speed = v4;
  v5 = *(_OWORD *)&self[2].lifespan;
  *(_OWORD *)&retstr->course = *(_OWORD *)&self[2].timestamp;
  *(_OWORD *)&retstr->timestamp = v5;
  v6 = *(_OWORD *)&self[2].altitude;
  *(_OWORD *)&retstr->suitability = *(_OWORD *)&self[2].coordinate.longitude;
  *(_OWORD *)&retstr->coordinate.longitude = v6;
  *(_OWORD *)&retstr->integrity = *(_OWORD *)(&self[2].signalEnvironmentType + 1);
  return self;
}

- (void)setNMinusTwoStateChangeLocation:(CLDaemonLocation *)a3
{
  __int128 v3;
  __int128 v4;
  $AB5116BA7E623E054F959CECB034F4E7 v5;
  __int128 v6;
  __int128 v7;
  $AB5116BA7E623E054F959CECB034F4E7 rawCoordinate;
  __int128 v9;

  v3 = *(_OWORD *)&a3->coordinate.longitude;
  *(_OWORD *)&self->_nMinusOneStateChangeLocation.floor = *(_OWORD *)&a3->suitability;
  *(_OWORD *)&self->_nMinusOneStateChangeLocation.signalEnvironmentType = v3;
  v4 = *(_OWORD *)&a3->altitude;
  v5 = *($AB5116BA7E623E054F959CECB034F4E7 *)&a3->speed;
  v6 = *(_OWORD *)&a3->timestamp;
  *(_OWORD *)&self->_nMinusTwoStateChangeLocation.horizontalAccuracy = *(_OWORD *)&a3->course;
  *(_OWORD *)&self->_nMinusTwoStateChangeLocation.verticalAccuracy = v6;
  *(_OWORD *)&self->_nMinusOneStateChangeLocation.fromSimulationController = v4;
  self->_nMinusTwoStateChangeLocation.coordinate = v5;
  v7 = *(_OWORD *)&a3->lifespan;
  rawCoordinate = a3->rawCoordinate;
  v9 = *(_OWORD *)&a3->rawCourse;
  *(_OWORD *)((char *)&self->_nMinusTwoStateChangeLocation.lifespan + 4) = *(_OWORD *)&a3->integrity;
  *($AB5116BA7E623E054F959CECB034F4E7 *)&self->_nMinusTwoStateChangeLocation.courseAccuracy = rawCoordinate;
  *(_OWORD *)&self->_nMinusTwoStateChangeLocation.confidence = v9;
  *(_OWORD *)&self->_nMinusTwoStateChangeLocation.speedAccuracy = v7;
}

- (int)nMinusThreeState
{
  return self->_nMinusThreeState;
}

- (void)setNMinusThreeState:(int)a3
{
  self->_nMinusThreeState = a3;
}

- (double)timeToInitialStateChange
{
  return self->_timeToInitialStateChange;
}

- (void)setTimeToInitialStateChange:(double)a3
{
  self->_timeToInitialStateChange = a3;
}

- (id).cxx_construct
{
  *((_DWORD *)self + 14) = 0xFFFF;
  *(_QWORD *)((char *)self + 68) = 0;
  *(_QWORD *)((char *)self + 60) = 0;
  *(_OWORD *)((char *)self + 76) = xmmword_101BAFC90;
  __asm { FMOV            V1.2D, #-1.0 }
  *(_OWORD *)((char *)self + 92) = _Q1;
  *(_OWORD *)((char *)self + 108) = _Q1;
  *(_OWORD *)((char *)self + 124) = _Q1;
  *((_DWORD *)self + 35) = 0;
  *((_QWORD *)self + 19) = 0;
  *((_QWORD *)self + 20) = 0;
  *((_QWORD *)self + 18) = 0xBFF0000000000000;
  *((_DWORD *)self + 42) = 0;
  *(_QWORD *)((char *)self + 172) = 0xBFF0000000000000;
  *((_DWORD *)self + 45) = 0x7FFFFFFF;
  *((_QWORD *)self + 24) = 0;
  *((_QWORD *)self + 25) = 0;
  *((_QWORD *)self + 23) = 0;
  *((_BYTE *)self + 208) = 0;
  *((_DWORD *)self + 53) = 0xFFFF;
  *((_QWORD *)self + 27) = 0;
  *((_QWORD *)self + 28) = 0;
  *(_OWORD *)((char *)self + 232) = xmmword_101BAFC90;
  *(_OWORD *)((char *)self + 248) = _Q1;
  *((_QWORD *)self + 33) = 0xBFF0000000000000;
  *((_OWORD *)self + 17) = _Q1;
  *((_QWORD *)self + 36) = 0xBFF0000000000000;
  *((_DWORD *)self + 74) = 0;
  *(_QWORD *)((char *)self + 300) = 0xBFF0000000000000;
  *((_DWORD *)self + 81) = 0;
  *(_QWORD *)((char *)self + 308) = 0;
  *(_QWORD *)((char *)self + 316) = 0;
  *((_QWORD *)self + 41) = 0xBFF0000000000000;
  *((_DWORD *)self + 84) = 0x7FFFFFFF;
  *(_QWORD *)((char *)self + 356) = 0;
  *(_QWORD *)((char *)self + 340) = 0;
  *(_QWORD *)((char *)self + 348) = 0;
  *((_BYTE *)self + 364) = 0;
  *((_DWORD *)self + 92) = 0xFFFF;
  *(_QWORD *)((char *)self + 380) = 0;
  *(_QWORD *)((char *)self + 372) = 0;
  *(_OWORD *)((char *)self + 388) = xmmword_101BAFC90;
  *(_OWORD *)((char *)self + 404) = _Q1;
  *(_OWORD *)((char *)self + 420) = _Q1;
  *(_OWORD *)((char *)self + 436) = _Q1;
  *((_DWORD *)self + 113) = 0;
  *((_DWORD *)self + 120) = 0;
  *((_QWORD *)self + 57) = 0xBFF0000000000000;
  *((_QWORD *)self + 58) = 0;
  *((_QWORD *)self + 59) = 0;
  *(_QWORD *)((char *)self + 484) = 0xBFF0000000000000;
  *((_DWORD *)self + 123) = 0x7FFFFFFF;
  *((_QWORD *)self + 62) = 0;
  *((_QWORD *)self + 63) = 0;
  *((_QWORD *)self + 64) = 0;
  *((_BYTE *)self + 520) = 0;
  return self;
}

@end
