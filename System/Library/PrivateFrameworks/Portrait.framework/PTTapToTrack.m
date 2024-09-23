@implementation PTTapToTrack

+ (BOOL)isSupported
{
  return MGGetBoolAnswer();
}

- (PTTapToTrack)initWithCommandQueue:(id)a3
{
  PTTapToTrack *v4;
  uint64_t v5;
  FTCinematicTapToTrack *tracker;
  PTTapToTrack *v7;
  objc_super v9;

  if (objc_msgSend((id)objc_opt_class(), "isSupported"))
  {
    v9.receiver = self;
    v9.super_class = (Class)PTTapToTrack;
    v4 = -[PTTapToTrack init](&v9, sel_init);
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0D23348], "tracker");
      v5 = objc_claimAutoreleasedReturnValue();
      tracker = v4->_tracker;
      v4->_tracker = (FTCinematicTapToTrack *)v5;

      -[PTTapToTrack resetTrack](v4, "resetTrack");
    }
    self = v4;
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)getRectForPoint:(CGPoint)a3 colorBuffer:(__CVBuffer *)a4
{
  FTCinematicTapToTrack *tracker;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  PTTapToTrackPrediction *v10;
  double v11;

  tracker = self->_tracker;
  if (tracker)
  {
    -[FTCinematicTapToTrack predictRectForPoint:inColorBuffer:](tracker, "predictRectForPoint:inColorBuffer:", a4, a3.x, a3.y);
    v6 = 0;
    v5 = 0;
    v8 = 0;
    v7 = 0;
  }
  else
  {
    v8 = 0;
    v7 = 0;
    v6 = 0;
    v5 = 0;
  }
  if (CGRectIsEmpty(*(CGRect *)&v5))
    return 0;
  v10 = [PTTapToTrackPrediction alloc];
  *(float *)&v11 = 0.0;
  return -[PTTapToTrackPrediction initWithRect:confidence:](v10, "initWithRect:confidence:", (unsigned __int128)0, (unsigned __int128)0, v11);
}

- (BOOL)addDetectionAndStartTrackingRect:(CGRect)a3 time:(id *)a4 colorBuffer:(__CVBuffer *)a5 disparityBuffer:(__CVBuffer *)a6
{
  double height;
  double width;
  double y;
  double x;
  int v13;
  __int128 v15;
  int64_t var3;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v13 = -[FTCinematicTapToTrack startTrackingRect:colorBuffer:](self->_tracker, "startTrackingRect:colorBuffer:", a5);
  if (v13)
  {
    v15 = *(_OWORD *)&a4->var0;
    var3 = a4->var3;
    -[PTTapToTrack addDetectionAtTime:rect:disparityBuffer:](self, "addDetectionAtTime:rect:disparityBuffer:", &v15, a6, x, y, width, height);
  }
  return v13;
}

- (id)addDetectionForNextFrameAt:(id *)a3 colorBuffer:(__CVBuffer *)a4 disparityBuffer:(__CVBuffer *)a5
{
  FTCinematicTapToTrack *tracker;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  PTTapToTrackPrediction *v14;
  double v15;
  __int128 v16;
  int64_t var3;
  __int128 v18;
  __int128 v19;
  double v20;

  v20 = 0.0;
  v18 = 0u;
  v19 = 0u;
  tracker = self->_tracker;
  if (tracker)
  {
    -[FTCinematicTapToTrack stepTrackingWithFrame:](tracker, "stepTrackingWithFrame:", a4);
    v10 = *((_QWORD *)&v18 + 1);
    v9 = v18;
    v12 = *((_QWORD *)&v19 + 1);
    v11 = v19;
  }
  else
  {
    v12 = 0;
    v11 = 0;
    v10 = 0;
    v9 = 0;
  }
  if (CGRectIsEmpty(*(CGRect *)&v9))
    return 0;
  v16 = *(_OWORD *)&a3->var0;
  var3 = a3->var3;
  -[PTTapToTrack addDetectionAtTime:rect:disparityBuffer:](self, "addDetectionAtTime:rect:disparityBuffer:", &v16, a5, v18, v19);
  v14 = [PTTapToTrackPrediction alloc];
  *(float *)&v15 = v20;
  return -[PTTapToTrackPrediction initWithRect:confidence:](v14, "initWithRect:confidence:", v18, v19, v15);
}

- (id)finalizeTrack
{
  PTCinematographyCustomTrack *v3;
  void *v4;
  PTCinematographyCustomTrack *v5;

  v3 = [PTCinematographyCustomTrack alloc];
  -[PTTapToTrack detections](self, "detections");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PTCinematographyCustomTrack initWithDetections:](v3, "initWithDetections:", v4);

  -[PTCinematographyCustomTrack applyDetectionSmoothing](v5, "applyDetectionSmoothing");
  -[PTTapToTrack resetTrack](self, "resetTrack");
  return v5;
}

- (void)resetTrack
{
  NSMutableArray *v3;
  NSMutableArray *detections;

  v3 = (NSMutableArray *)objc_opt_new();
  detections = self->_detections;
  self->_detections = v3;

}

- (void)addDetectionAtTime:(id *)a3 rect:(CGRect)a4 disparityBuffer:(__CVBuffer *)a5
{
  double height;
  double width;
  double y;
  double x;
  uint64_t v12;
  void *v13;
  int v14;
  int v15;
  float *v16;
  float v17;
  PTCinematographyDetection *v18;
  double v19;
  PTCinematographyDetection *v20;
  __int128 v21;
  int64_t var3;
  int v23;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v12 = -[NSMutableArray count](self->_detections, "count");
  -[NSMutableArray lastObject](self->_detections, "lastObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "focusDistance");
  v15 = v14;

  v23 = v15;
  if (v12)
    v16 = (float *)&v23;
  else
    v16 = 0;
  v17 = PTDisparityInNormalizedRectFromPixelBufferWithPrior(102, a5, v16, x, y, width, height);
  v18 = [PTCinematographyDetection alloc];
  v21 = *(_OWORD *)&a3->var0;
  var3 = a3->var3;
  *(float *)&v19 = v17;
  v20 = -[PTCinematographyDetection initWithTime:rect:focusDistance:](v18, "initWithTime:rect:focusDistance:", &v21, x, y, width, height, v19);
  -[PTCinematographyDetection setDetectionType:](v20, "setDetectionType:", 102);
  -[NSMutableArray addObject:](self->_detections, "addObject:", v20);

}

- (NSMutableArray)detections
{
  return self->_detections;
}

- (void)setDetections:(id)a3
{
  objc_storeStrong((id *)&self->_detections, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detections, 0);
  objc_storeStrong((id *)&self->_tracker, 0);
}

@end
