@implementation BKTouchDeliveryStatisticsLoggingObserver

- (void)touch:(unsigned int)a3 didHitTestToDestination:(id)a4 hostingChainIndex:(int64_t)a5
{
  id v7;
  BKEventStatisticsLoggingController *loggingController;
  id v9;
  _QWORD v10[5];
  id v11;
  unsigned int v12;

  v7 = a4;
  loggingController = self->_loggingController;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100003A40;
  v10[3] = &unk_1000ECDF8;
  v12 = a3;
  v10[4] = self;
  v11 = v7;
  v9 = v7;
  -[BKEventStatisticsLoggingController updateStatistics:](loggingController, "updateStatistics:", v10);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logTransaction, 0);
  objc_storeStrong((id *)&self->_destinations, 0);
  objc_storeStrong((id *)&self->_touchProcessingTimeAverage, 0);
  objc_storeStrong((id *)&self->_pathsStillWithinRange, 0);
  objc_storeStrong((id *)&self->_pathsStillTouching, 0);
  objc_storeStrong((id *)&self->_pathsSeen, 0);
  objc_storeStrong((id *)&self->_fromEdgeCount, 0);
  objc_storeStrong((id *)&self->_transferredTouchCount, 0);
  objc_storeStrong((id *)&self->_detachedTouchCount, 0);
  objc_storeStrong((id *)&self->_stylusTouchCount, 0);
  objc_storeStrong((id *)&self->_tapToWakeCount, 0);
  objc_storeStrong((id *)&self->_softCancelCount, 0);
  objc_storeStrong((id *)&self->_hardCancelCount, 0);
  objc_storeStrong((id *)&self->_rangeOutCount, 0);
  objc_storeStrong((id *)&self->_rangeInCount, 0);
  objc_storeStrong((id *)&self->_touchDownCount, 0);
  objc_storeStrong((id *)&self->_touchUpCount, 0);
  objc_storeStrong((id *)&self->_loggingController, 0);
}

- (BKTouchDeliveryStatisticsLoggingObserver)initWithLabel:(id)a3
{
  id v4;
  BKTouchDeliveryStatisticsLoggingObserver *v5;
  uint64_t v6;
  BKIntegerEventStatistic *touchDownCount;
  uint64_t v8;
  BKIntegerEventStatistic *touchUpCount;
  uint64_t v10;
  BKIntegerEventStatistic *rangeInCount;
  uint64_t v12;
  BKIntegerEventStatistic *rangeOutCount;
  uint64_t v14;
  BKIntegerEventStatistic *hardCancelCount;
  uint64_t v16;
  BKIntegerEventStatistic *softCancelCount;
  uint64_t v18;
  BKIntegerEventStatistic *tapToWakeCount;
  uint64_t v20;
  BKIntegerEventStatistic *stylusTouchCount;
  uint64_t v22;
  BKIntegerEventStatistic *detachedTouchCount;
  uint64_t v24;
  BKIntegerEventStatistic *transferredTouchCount;
  uint64_t v26;
  BKIntegerEventStatistic *fromEdgeCount;
  uint64_t v28;
  BKHexadecimalIntegerEventStatistic *pathsSeen;
  uint64_t v30;
  BKHexadecimalIntegerEventStatistic *pathsStillTouching;
  uint64_t v32;
  BKHexadecimalIntegerEventStatistic *pathsStillWithinRange;
  uint64_t v34;
  BKAverageTimeIntervalEventStatistic *touchProcessingTimeAverage;
  BKTouchDestinationStatistic *v36;
  BKTouchDestinationStatistic *destinations;
  void *v38;
  BKEventStatisticsLoggingController *v39;
  uint64_t v40;
  void *v41;
  BKEventStatisticsLoggingController *v42;
  BKEventStatisticsLoggingController *loggingController;
  BKIntegerEventStatistic *v44;
  BKEventStatisticsLoggingController *v45;
  BKIntegerEventStatistic *v46;
  BKIntegerEventStatistic *v47;
  BKIntegerEventStatistic *v48;
  BKIntegerEventStatistic *v49;
  BKIntegerEventStatistic *v50;
  BKIntegerEventStatistic *v51;
  BKIntegerEventStatistic *v52;
  BKHexadecimalIntegerEventStatistic *v53;
  BKHexadecimalIntegerEventStatistic *v54;
  BKTouchDestinationStatistic *v55;
  BKAverageTimeIntervalEventStatistic *v56;
  void *v57;
  objc_super v59;
  _QWORD v60[15];

  v4 = a3;
  v59.receiver = self;
  v59.super_class = (Class)BKTouchDeliveryStatisticsLoggingObserver;
  v5 = -[BKTouchDeliveryStatisticsLoggingObserver init](&v59, "init");
  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(+[BKEventStatistic statisticWithLabel:](BKIntegerEventStatistic, "statisticWithLabel:", CFSTR("down")));
    touchDownCount = v5->_touchDownCount;
    v5->_touchDownCount = (BKIntegerEventStatistic *)v6;

    v8 = objc_claimAutoreleasedReturnValue(+[BKEventStatistic statisticWithLabel:](BKIntegerEventStatistic, "statisticWithLabel:", CFSTR("up")));
    touchUpCount = v5->_touchUpCount;
    v5->_touchUpCount = (BKIntegerEventStatistic *)v8;

    v10 = objc_claimAutoreleasedReturnValue(+[BKEventStatistic statisticWithLabel:](BKIntegerEventStatistic, "statisticWithLabel:", CFSTR("rangeIn")));
    rangeInCount = v5->_rangeInCount;
    v5->_rangeInCount = (BKIntegerEventStatistic *)v10;

    v12 = objc_claimAutoreleasedReturnValue(+[BKEventStatistic statisticWithLabel:](BKIntegerEventStatistic, "statisticWithLabel:", CFSTR("rangeOut")));
    rangeOutCount = v5->_rangeOutCount;
    v5->_rangeOutCount = (BKIntegerEventStatistic *)v12;

    v14 = objc_claimAutoreleasedReturnValue(+[BKEventStatistic statisticWithLabel:](BKIntegerEventStatistic, "statisticWithLabel:", CFSTR("HID cancel")));
    hardCancelCount = v5->_hardCancelCount;
    v5->_hardCancelCount = (BKIntegerEventStatistic *)v14;

    v16 = objc_claimAutoreleasedReturnValue(+[BKEventStatistic statisticWithLabel:](BKIntegerEventStatistic, "statisticWithLabel:", CFSTR("soft cancel")));
    softCancelCount = v5->_softCancelCount;
    v5->_softCancelCount = (BKIntegerEventStatistic *)v16;

    v18 = objc_claimAutoreleasedReturnValue(+[BKEventStatistic statisticWithLabel:](BKIntegerEventStatistic, "statisticWithLabel:", CFSTR("tapToWake")));
    tapToWakeCount = v5->_tapToWakeCount;
    v5->_tapToWakeCount = (BKIntegerEventStatistic *)v18;

    v20 = objc_claimAutoreleasedReturnValue(+[BKEventStatistic statisticWithLabel:](BKIntegerEventStatistic, "statisticWithLabel:", CFSTR("pencil")));
    stylusTouchCount = v5->_stylusTouchCount;
    v5->_stylusTouchCount = (BKIntegerEventStatistic *)v20;

    v22 = objc_claimAutoreleasedReturnValue(+[BKEventStatistic statisticWithLabel:](BKIntegerEventStatistic, "statisticWithLabel:", CFSTR("detached")));
    detachedTouchCount = v5->_detachedTouchCount;
    v5->_detachedTouchCount = (BKIntegerEventStatistic *)v22;

    v24 = objc_claimAutoreleasedReturnValue(+[BKEventStatistic statisticWithLabel:](BKIntegerEventStatistic, "statisticWithLabel:", CFSTR("transferred")));
    transferredTouchCount = v5->_transferredTouchCount;
    v5->_transferredTouchCount = (BKIntegerEventStatistic *)v24;

    v26 = objc_claimAutoreleasedReturnValue(+[BKEventStatistic statisticWithLabel:](BKIntegerEventStatistic, "statisticWithLabel:", CFSTR("fromEdge")));
    fromEdgeCount = v5->_fromEdgeCount;
    v5->_fromEdgeCount = (BKIntegerEventStatistic *)v26;

    v28 = objc_claimAutoreleasedReturnValue(+[BKHexadecimalIntegerEventStatistic statisticWithLabel:hexFormatModifier:](BKHexadecimalIntegerEventStatistic, "statisticWithLabel:hexFormatModifier:", CFSTR("pathsSeen"), 1));
    pathsSeen = v5->_pathsSeen;
    v5->_pathsSeen = (BKHexadecimalIntegerEventStatistic *)v28;

    v30 = objc_claimAutoreleasedReturnValue(+[BKHexadecimalIntegerEventStatistic statisticWithLabel:hexFormatModifier:](BKHexadecimalIntegerEventStatistic, "statisticWithLabel:hexFormatModifier:", CFSTR("pathsStillTouching"), 1));
    pathsStillTouching = v5->_pathsStillTouching;
    v5->_pathsStillTouching = (BKHexadecimalIntegerEventStatistic *)v30;

    -[BKEventStatistic setAutomaticResetDisabled:](v5->_pathsStillTouching, "setAutomaticResetDisabled:", 1);
    v32 = objc_claimAutoreleasedReturnValue(+[BKHexadecimalIntegerEventStatistic statisticWithLabel:hexFormatModifier:](BKHexadecimalIntegerEventStatistic, "statisticWithLabel:hexFormatModifier:", CFSTR("pathsStillWithinRange"), 1));
    pathsStillWithinRange = v5->_pathsStillWithinRange;
    v5->_pathsStillWithinRange = (BKHexadecimalIntegerEventStatistic *)v32;

    -[BKEventStatistic setAutomaticResetDisabled:](v5->_pathsStillWithinRange, "setAutomaticResetDisabled:", 1);
    v34 = objc_claimAutoreleasedReturnValue(+[BKAverageTimeIntervalEventStatistic statisticWithLabel:scale:](BKAverageTimeIntervalEventStatistic, "statisticWithLabel:scale:", CFSTR("averageProcessingTime"), 1000000));
    touchProcessingTimeAverage = v5->_touchProcessingTimeAverage;
    v5->_touchProcessingTimeAverage = (BKAverageTimeIntervalEventStatistic *)v34;

    v36 = objc_alloc_init(BKTouchDestinationStatistic);
    destinations = v5->_destinations;
    v5->_destinations = v36;

    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("touchstats "), "stringByAppendingString:", v4));
    v39 = [BKEventStatisticsLoggingController alloc];
    v40 = BKLogTouchEvents(v39);
    v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
    v42 = -[BKEventStatisticsLoggingController initWithLabel:logCategory:](v39, "initWithLabel:logCategory:", v38, v41);
    loggingController = v5->_loggingController;
    v5->_loggingController = v42;

    v45 = v5->_loggingController;
    v44 = v5->_touchUpCount;
    v46 = v5->_rangeInCount;
    v60[0] = v5->_touchDownCount;
    v60[1] = v44;
    v47 = v5->_rangeOutCount;
    v48 = v5->_hardCancelCount;
    v60[2] = v46;
    v60[3] = v47;
    v49 = v5->_softCancelCount;
    v50 = v5->_stylusTouchCount;
    v51 = v5->_detachedTouchCount;
    v60[4] = v5->_tapToWakeCount;
    v60[5] = v50;
    v60[6] = v48;
    v60[7] = v49;
    v52 = v5->_transferredTouchCount;
    v60[8] = v5->_fromEdgeCount;
    v60[9] = v51;
    v53 = v5->_pathsSeen;
    v54 = v5->_pathsStillTouching;
    v60[10] = v52;
    v60[11] = v53;
    v56 = v5->_touchProcessingTimeAverage;
    v55 = v5->_destinations;
    v60[12] = v54;
    v60[13] = v55;
    v60[14] = v56;
    v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v60, 15));
    -[BKEventStatisticsLoggingController setStatistics:](v45, "setStatistics:", v57);

  }
  return v5;
}

- (void)touchWillStartProcessingTouchCollection
{
  BKEventStatisticsLoggingController *loggingController;
  _QWORD v3[6];

  loggingController = self->_loggingController;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10000B7F4;
  v3[3] = &unk_1000ECB60;
  v3[4] = self;
  v3[5] = a2;
  -[BKEventStatisticsLoggingController updateStatistics:](loggingController, "updateStatistics:", v3);
}

- (void)touchDidFinishProcessingTouchCollection
{
  BKEventStatisticsLoggingController *loggingController;
  _QWORD v3[5];

  loggingController = self->_loggingController;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10000B9B0;
  v3[3] = &unk_1000ECDA8;
  v3[4] = self;
  -[BKEventStatisticsLoggingController updateStatistics:](loggingController, "updateStatistics:", v3);
}

- (void)touch:(unsigned int)a3 pathIndex:(int64_t)a4 upAtPoint:(CGPoint)a5 detached:(BOOL)a6
{
  BKEventStatisticsLoggingController *loggingController;
  _QWORD v7[6];

  loggingController = self->_loggingController;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100018B34;
  v7[3] = &unk_1000ECB60;
  v7[4] = self;
  v7[5] = a4;
  -[BKEventStatisticsLoggingController updateStatistics:](loggingController, "updateStatistics:", v7, a4, a6);
}

- (void)touch:(unsigned int)a3 pathIndex:(int64_t)a4 rangeOutAtPoint:(CGPoint)a5
{
  BKEventStatisticsLoggingController *loggingController;
  _QWORD v6[6];

  loggingController = self->_loggingController;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100018B70;
  v6[3] = &unk_1000ECB60;
  v6[4] = self;
  v6[5] = a4;
  -[BKEventStatisticsLoggingController updateStatistics:](loggingController, "updateStatistics:", v6);
}

- (void)touch:(unsigned int)a3 pathIndex:(int64_t)a4 rangeInAtPoint:(CGPoint)a5 eventMask:(unsigned int)a6 z:(double)a7 maxZ:(double)a8 transducerType:(unsigned int)a9
{
  BKEventStatisticsLoggingController *loggingController;
  _QWORD v10[6];

  loggingController = self->_loggingController;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000B514;
  v10[3] = &unk_1000ECB60;
  v10[4] = self;
  v10[5] = a4;
  -[BKEventStatisticsLoggingController updateStatistics:](loggingController, "updateStatistics:", v10, a4, *(_QWORD *)&a6, *(_QWORD *)&a9);
}

- (void)touch:(unsigned int)a3 pathIndex:(int64_t)a4 downAtPoint:(CGPoint)a5 eventMask:(unsigned int)a6 transducerType:(unsigned int)a7
{
  BKEventStatisticsLoggingController *loggingController;
  _QWORD v8[6];
  unsigned int v9;
  unsigned int v10;

  loggingController = self->_loggingController;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000BA6C;
  v8[3] = &unk_1000ECB88;
  v8[4] = self;
  v8[5] = a4;
  v9 = a7;
  v10 = a6;
  -[BKEventStatisticsLoggingController updateStatistics:](loggingController, "updateStatistics:", v8);
}

- (void)dealloc
{
  objc_super v3;

  -[BKEventStatisticsLoggingController invalidate](self->_loggingController, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)BKTouchDeliveryStatisticsLoggingObserver;
  -[BKTouchDeliveryStatisticsLoggingObserver dealloc](&v3, "dealloc");
}

- (void)touchDidDetach:(unsigned int)a3 destinations:(id)a4
{
  BKEventStatisticsLoggingController *loggingController;
  _QWORD v5[5];

  loggingController = self->_loggingController;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10008CFFC;
  v5[3] = &unk_1000ECDA8;
  v5[4] = self;
  -[BKEventStatisticsLoggingController updateStatistics:](loggingController, "updateStatistics:", v5, a4);
}

- (void)touchDidTransfer:(unsigned int)a3 destination:(id)a4
{
  BKEventStatisticsLoggingController *loggingController;
  _QWORD v5[5];

  loggingController = self->_loggingController;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10008CFF0;
  v5[3] = &unk_1000ECDA8;
  v5[4] = self;
  -[BKEventStatisticsLoggingController updateStatistics:](loggingController, "updateStatistics:", v5, a4);
}

- (void)touchDidHIDCancel:(unsigned int)a3
{
  BKEventStatisticsLoggingController *loggingController;
  _QWORD v4[5];

  loggingController = self->_loggingController;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10008CFE4;
  v4[3] = &unk_1000ECDA8;
  v4[4] = self;
  -[BKEventStatisticsLoggingController updateStatistics:](loggingController, "updateStatistics:", v4);
}

- (void)touchDidSoftCancel:(unsigned int)a3
{
  BKEventStatisticsLoggingController *loggingController;
  _QWORD v4[5];

  loggingController = self->_loggingController;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10008CFD8;
  v4[3] = &unk_1000ECDA8;
  v4[4] = self;
  -[BKEventStatisticsLoggingController updateStatistics:](loggingController, "updateStatistics:", v4);
}

@end
