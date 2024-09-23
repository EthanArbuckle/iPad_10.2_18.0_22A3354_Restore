@implementation RAADPDVisit

- (RAADPDVisit)init
{
  RTRoutineManager *v3;
  RTRoutineManager *routineManager;
  NSArray *proximityEvents;
  NSArray *peopleCounts;

  if (self)
  {
    v3 = (RTRoutineManager *)objc_claimAutoreleasedReturnValue(+[RTRoutineManager defaultManager](RTRoutineManager, "defaultManager"));
    routineManager = self->_routineManager;
    self->_routineManager = v3;

    proximityEvents = self->_proximityEvents;
    self->_proximityEvents = (NSArray *)&__NSArray0__struct;

    peopleCounts = self->_peopleCounts;
    self->_peopleCounts = (NSArray *)&__NSArray0__struct;

  }
  return self;
}

- (void)queryProximityEvents:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[6];
  _QWORD v9[5];
  id v10;

  v4 = a3;
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x3032000000;
  v9[3] = sub_10000280C;
  v9[4] = sub_10000281C;
  v10 = &__NSArray0__struct;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAADPDVisit routineManager](self, "routineManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "entryDate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "exitDate"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100002824;
  v8[3] = &unk_100004160;
  v8[4] = self;
  v8[5] = v9;
  objc_msgSend(v5, "fetchProximityHistoryFromStartDate:endDate:completionHandler:", v6, v7, v8);

  _Block_object_dispose(v9, 8);
}

- (void)queryPeopleCount
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  uint8_t v9[16];
  _QWORD v10[6];
  _QWORD v11[5];
  id v12;

  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x3032000000;
  v11[3] = sub_10000280C;
  v11[4] = sub_10000281C;
  v12 = &__NSArray0__struct;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RAADPDVisit proximityEvents](self, "proximityEvents"));
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAADPDVisit routineManager](self, "routineManager"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RAADPDVisit proximityEvents](self, "proximityEvents"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100002A8C;
    v10[3] = &unk_100004160;
    v10[4] = self;
    v10[5] = v11;
    objc_msgSend(v5, "fetchPeopleCountEventsHistory:completionHandler:", v6, v10);

  }
  else
  {
    v7 = sub_100002614(&qword_1000082C0);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "There were no proximity events, so no query for people count events was executed", v9, 2u);
    }

  }
  _Block_object_dispose(v11, 8);

}

- (void)queryPeopleDensity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[6];
  _QWORD v9[5];
  id v10;

  v4 = a3;
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x3032000000;
  v9[3] = sub_10000280C;
  v9[4] = sub_10000281C;
  v10 = &__NSArray0__struct;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAADPDVisit routineManager](self, "routineManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "entryDate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "exitDate"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100002CAC;
  v8[3] = &unk_100004160;
  v8[4] = self;
  v8[5] = v9;
  objc_msgSend(v5, "fetchPeopleDensityHistoryFromStartDate:endDate:completionHandler:", v6, v7, v8);

  _Block_object_dispose(v9, 8);
}

- (NSArray)proximityEvents
{
  return self->_proximityEvents;
}

- (void)setProximityEvents:(id)a3
{
  objc_storeStrong((id *)&self->_proximityEvents, a3);
}

- (NSArray)peopleCounts
{
  return self->_peopleCounts;
}

- (void)setPeopleCounts:(id)a3
{
  objc_storeStrong((id *)&self->_peopleCounts, a3);
}

- (NSArray)peopleDensities
{
  return self->_peopleDensities;
}

- (void)setPeopleDensities:(id)a3
{
  objc_storeStrong((id *)&self->_peopleDensities, a3);
}

- (RTRoutineManager)routineManager
{
  return self->_routineManager;
}

- (void)setRoutineManager:(id)a3
{
  objc_storeStrong((id *)&self->_routineManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routineManager, 0);
  objc_storeStrong((id *)&self->_peopleDensities, 0);
  objc_storeStrong((id *)&self->_peopleCounts, 0);
  objc_storeStrong((id *)&self->_proximityEvents, 0);
}

@end
