@implementation BKMousePointerEventStatisticsLogger

- (BKMousePointerEventStatisticsLogger)init
{
  BKMousePointerEventStatisticsLogger *v2;
  uint64_t v3;
  BKIntegerEventStatistic *pointerEventCount;
  uint64_t v5;
  BKIntegerEventStatistic *scrollSequenceCount;
  uint64_t v7;
  BKIntegerEventStatistic *scaleSequenceCount;
  uint64_t v9;
  BKIntegerEventStatistic *translationSequenceCount;
  uint64_t v11;
  BKIntegerEventStatistic *rotationSequenceCount;
  uint64_t v13;
  BKIntegerEventStatistic *digitizerSequenceCount;
  uint64_t v15;
  BKHexadecimalIntegerEventStatistic *lastContextID;
  uint64_t v17;
  BKIntegerEventStatistic *lastPID;
  uint64_t v19;
  BKMRUEventStatistics *globalRoutes;
  uint64_t v21;
  BKHexadecimalIntegerEventStatistic *lastGlobalRouteContextID;
  uint64_t v23;
  BKIntegerEventStatistic *lastGlobalRoutePID;
  BKEventStatisticsLoggingController *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  BKEventStatisticsLoggingController *v29;
  BKEventStatisticsLoggingController *loggingController;
  BKEventStatisticsLoggingController *v31;
  BKIntegerEventStatistic *v32;
  BKIntegerEventStatistic *v33;
  BKIntegerEventStatistic *v34;
  BKIntegerEventStatistic *v35;
  BKIntegerEventStatistic *v36;
  BKHexadecimalIntegerEventStatistic *v37;
  BKIntegerEventStatistic *v38;
  BKMRUEventStatistics *v39;
  void *v40;
  objc_super v42;
  _QWORD v43[9];

  v42.receiver = self;
  v42.super_class = (Class)BKMousePointerEventStatisticsLogger;
  v2 = -[BKMousePointerEventStatisticsLogger init](&v42, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[BKEventStatistic statisticWithLabel:](BKIntegerEventStatistic, "statisticWithLabel:", CFSTR("move")));
    pointerEventCount = v2->_pointerEventCount;
    v2->_pointerEventCount = (BKIntegerEventStatistic *)v3;

    v5 = objc_claimAutoreleasedReturnValue(+[BKEventStatistic statisticWithLabel:](BKIntegerEventStatistic, "statisticWithLabel:", CFSTR("scroll")));
    scrollSequenceCount = v2->_scrollSequenceCount;
    v2->_scrollSequenceCount = (BKIntegerEventStatistic *)v5;

    v7 = objc_claimAutoreleasedReturnValue(+[BKEventStatistic statisticWithLabel:](BKIntegerEventStatistic, "statisticWithLabel:", CFSTR("scale")));
    scaleSequenceCount = v2->_scaleSequenceCount;
    v2->_scaleSequenceCount = (BKIntegerEventStatistic *)v7;

    v9 = objc_claimAutoreleasedReturnValue(+[BKEventStatistic statisticWithLabel:](BKIntegerEventStatistic, "statisticWithLabel:", CFSTR("translation")));
    translationSequenceCount = v2->_translationSequenceCount;
    v2->_translationSequenceCount = (BKIntegerEventStatistic *)v9;

    v11 = objc_claimAutoreleasedReturnValue(+[BKEventStatistic statisticWithLabel:](BKIntegerEventStatistic, "statisticWithLabel:", CFSTR("rotation")));
    rotationSequenceCount = v2->_rotationSequenceCount;
    v2->_rotationSequenceCount = (BKIntegerEventStatistic *)v11;

    v13 = objc_claimAutoreleasedReturnValue(+[BKEventStatistic statisticWithLabel:](BKIntegerEventStatistic, "statisticWithLabel:", CFSTR("touchUp")));
    digitizerSequenceCount = v2->_digitizerSequenceCount;
    v2->_digitizerSequenceCount = (BKIntegerEventStatistic *)v13;

    v15 = objc_claimAutoreleasedReturnValue(+[BKEventStatistic statisticWithLabel:](BKHexadecimalIntegerEventStatistic, "statisticWithLabel:", CFSTR("lastContextID")));
    lastContextID = v2->_lastContextID;
    v2->_lastContextID = (BKHexadecimalIntegerEventStatistic *)v15;

    v17 = objc_claimAutoreleasedReturnValue(+[BKEventStatistic statisticWithLabel:](BKIntegerEventStatistic, "statisticWithLabel:", CFSTR("lastPID")));
    lastPID = v2->_lastPID;
    v2->_lastPID = (BKIntegerEventStatistic *)v17;

    v19 = objc_claimAutoreleasedReturnValue(+[BKMRUEventStatistics statisticsWithLabel:capacity:](BKMRUEventStatistics, "statisticsWithLabel:capacity:", CFSTR("recentGlobalRoutes"), 100));
    globalRoutes = v2->_globalRoutes;
    v2->_globalRoutes = (BKMRUEventStatistics *)v19;

    v21 = objc_claimAutoreleasedReturnValue(+[BKEventStatistic statisticWithLabel:](BKHexadecimalIntegerEventStatistic, "statisticWithLabel:", CFSTR("contextID")));
    lastGlobalRouteContextID = v2->_lastGlobalRouteContextID;
    v2->_lastGlobalRouteContextID = (BKHexadecimalIntegerEventStatistic *)v21;

    v23 = objc_claimAutoreleasedReturnValue(+[BKEventStatistic statisticWithLabel:](BKIntegerEventStatistic, "statisticWithLabel:", CFSTR("pid")));
    lastGlobalRoutePID = v2->_lastGlobalRoutePID;
    v2->_lastGlobalRoutePID = (BKIntegerEventStatistic *)v23;

    v25 = [BKEventStatisticsLoggingController alloc];
    v27 = BKLogMousePointer(v25, v26);
    v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
    v29 = -[BKEventStatisticsLoggingController initWithLabel:logCategory:](v25, "initWithLabel:logCategory:", CFSTR("mouse"), v28);
    loggingController = v2->_loggingController;
    v2->_loggingController = v29;

    v31 = v2->_loggingController;
    v32 = v2->_scrollSequenceCount;
    v33 = v2->_scaleSequenceCount;
    v43[0] = v2->_pointerEventCount;
    v43[1] = v32;
    v34 = v2->_translationSequenceCount;
    v35 = v2->_rotationSequenceCount;
    v43[2] = v33;
    v43[3] = v34;
    v36 = v2->_digitizerSequenceCount;
    v37 = v2->_lastContextID;
    v43[4] = v35;
    v43[5] = v36;
    v38 = v2->_lastPID;
    v39 = v2->_globalRoutes;
    v43[6] = v37;
    v43[7] = v38;
    v43[8] = v39;
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v43, 9));
    -[BKEventStatisticsLoggingController setStatistics:](v31, "setStatistics:", v40);

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[BKEventStatisticsLoggingController invalidate](self->_loggingController, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)BKMousePointerEventStatisticsLogger;
  -[BKMousePointerEventStatisticsLogger dealloc](&v3, "dealloc");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastGlobalRoutePID, 0);
  objc_storeStrong((id *)&self->_lastGlobalRouteContextID, 0);
  objc_storeStrong((id *)&self->_globalRoutes, 0);
  objc_storeStrong((id *)&self->_lastPID, 0);
  objc_storeStrong((id *)&self->_lastContextID, 0);
  objc_storeStrong((id *)&self->_digitizerSequenceCount, 0);
  objc_storeStrong((id *)&self->_rotationSequenceCount, 0);
  objc_storeStrong((id *)&self->_translationSequenceCount, 0);
  objc_storeStrong((id *)&self->_scaleSequenceCount, 0);
  objc_storeStrong((id *)&self->_scrollSequenceCount, 0);
  objc_storeStrong((id *)&self->_pointerEventCount, 0);
  objc_storeStrong((id *)&self->_loggingController, 0);
}

@end
