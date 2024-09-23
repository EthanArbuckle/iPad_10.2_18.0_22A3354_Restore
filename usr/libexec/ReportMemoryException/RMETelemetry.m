@implementation RMETelemetry

+ (void)emitTelemetryForExecName:(id)a3 bundleID:(id)a4 exceptionType:(int64_t)a5 footprint:(unint64_t)a6 footprintPeak:(unint64_t)a7 jetsamLimit:(unint64_t)a8 memgraphAttempted:(BOOL)a9 memgraphSkippedReason:(int64_t)a10 memgraphSucceeded:(BOOL)a11 memgraphFailedReason:(int64_t)a12 diagFilePath:(id)a13 isMSLEnabled:(BOOL)a14 isGcoreCapture:(BOOL)a15
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  int64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  int64_t v33;
  int64_t v34;
  BOOL v35;
  BOOL v36;
  BOOL v37;
  BOOL v38;

  v19 = a3;
  v20 = a4;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_10000668C;
  v25[3] = &unk_100010540;
  v26 = a13;
  v27 = v19;
  v28 = v20;
  v29 = a5;
  v30 = a6;
  v31 = a7;
  v35 = a9;
  v32 = a8;
  v33 = a10;
  v36 = a11;
  v34 = a12;
  v37 = a14;
  v38 = a15;
  v21 = v20;
  v22 = v19;
  v23 = v26;
  AnalyticsSendEventLazy(CFSTR("com.apple.ReportMemoryException.memoryException.v2"), v25);

}

@end
