@implementation RCPTimelineView

- (void)setRecapMovie:(id)a3
{
  RCPMovie **p_recapMovie;
  id v6;
  uint64_t v7;

  p_recapMovie = &self->_recapMovie;
  objc_storeStrong((id *)&self->_recapMovie, a3);
  v6 = a3;
  -[RCPTimelineView setStartCropTimestamp:](self, "setStartCropTimestamp:", -[RCPMovie startTimestamp](*p_recapMovie, "startTimestamp"));
  v7 = -[RCPMovie endTimestamp](*p_recapMovie, "endTimestamp");

  -[RCPTimelineView setEndCropTimestamp:](self, "setEndCropTimestamp:", v7);
  -[RCPTimelineView setup](self, "setup");
  -[RCPTimelineView setNeedsDisplay:](self, "setNeedsDisplay:", 1);
}

- (BOOL)isFlipped
{
  return 1;
}

- (void)setup
{
  void *v3;
  void *v4;
  CALayer *v5;
  CALayer *cropStartHead;
  CALayer *v7;
  CALayer *cropEndHead;
  CALayer *v9;
  CALayer *playbackHead;
  CGColorSpace *DeviceRGB;
  void *v12;
  _OWORD v13[2];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[RCPTimelineView layer](self, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMasksToBounds:", 1);

  -[RCPTimelineView layer](self, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCornerRadius:", 10.0);

  -[RCPTimelineView cropHead:](self, "cropHead:", 0);
  v5 = (CALayer *)objc_claimAutoreleasedReturnValue();
  cropStartHead = self->_cropStartHead;
  self->_cropStartHead = v5;

  -[RCPTimelineView cropHead:](self, "cropHead:", 1);
  v7 = (CALayer *)objc_claimAutoreleasedReturnValue();
  cropEndHead = self->_cropEndHead;
  self->_cropEndHead = v7;

  objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
  v9 = (CALayer *)objc_claimAutoreleasedReturnValue();
  playbackHead = self->_playbackHead;
  self->_playbackHead = v9;

  -[RCPTimelineView bounds](self, "bounds");
  -[CALayer setFrame:](self->_playbackHead, "setFrame:", 0.0, 0.0, 2.0);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v13[0] = xmmword_1A5EA8B28;
  v13[1] = unk_1A5EA8B38;
  -[CALayer setBackgroundColor:](self->_playbackHead, "setBackgroundColor:", CGColorCreate(DeviceRGB, (const CGFloat *)v13));
  -[RCPTimelineView layer](self, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addSublayer:", self->_playbackHead);

  -[RCPTimelineView setTime:](self, "setTime:", -[RCPTimelineView startCropTimestamp](self, "startCropTimestamp"));
  -[RCPTimelineView startPlayback](self, "startPlayback");
}

- (void)startPlayback
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  double v10;
  NSTimer *v11;
  NSTimer *playbackTimer;
  _QWORD v13[7];
  _QWORD v14[3];
  unint64_t v15;

  -[RCPTimelineView recapMovie](self, "recapMovie");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "eventStream");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "environment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  v15 = 0;
  v15 = -[RCPTimelineView startCropTimestamp](self, "startCropTimestamp");
  v6 = -[RCPTimelineView endCropTimestamp](self, "endCropTimestamp");
  v7 = -[RCPTimelineView startCropTimestamp](self, "startCropTimestamp");
  v8 = -[RCPTimelineView endCropTimestamp](self, "endCropTimestamp");
  v9 = -[RCPTimelineView startCropTimestamp](self, "startCropTimestamp");
  objc_msgSend(v5, "timeScale");
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __32__RCPTimelineView_startPlayback__block_invoke;
  v13[3] = &unk_1E4FC2568;
  v13[5] = v14;
  v13[6] = (unint64_t)((double)(5 * (v6 - v7)) / (v10 * (double)(60 * (v8 - v9)) / 1000000000.0));
  v13[4] = self;
  objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:repeats:block:", 1, v13, 0.0166666667);
  v11 = (NSTimer *)objc_claimAutoreleasedReturnValue();
  playbackTimer = self->_playbackTimer;
  self->_playbackTimer = v11;

  _Block_object_dispose(v14, 8);
}

void __32__RCPTimelineView_startPlayback__block_invoke(uint64_t a1)
{
  unint64_t v2;
  uint64_t v3;
  void *v4;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "setTime:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
  v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (v2 > objc_msgSend(*(id *)(a1 + 32), "endCropTimestamp"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 456), "invalidate");
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 456);
    *(_QWORD *)(v3 + 456) = 0;

  }
}

- (id)cropHead:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  CGPath *Mutable;
  CGPath *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGColorSpace *DeviceRGB;
  double v13;
  id v14;
  CGColorSpace *v15;
  id v16;
  void *v17;
  _OWORD v19[2];
  CGFloat components[2];
  __int128 v21;
  uint64_t v22;

  v3 = a3;
  v22 = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(MEMORY[0x1E0CD2840]);
  Mutable = CGPathCreateMutable();
  v7 = Mutable;
  if (v3)
    v8 = -5.0;
  else
    v8 = 5.0;
  if (v3)
    v9 = 1.0;
  else
    v9 = -10001.0;
  CGPathMoveToPoint(Mutable, 0, v8, 4.0);
  CGPathAddLineToPoint(v7, 0, 0.0, 4.0);
  -[RCPTimelineView bounds](self, "bounds");
  CGPathAddLineToPoint(v7, 0, 0.0, v10 + -4.0);
  -[RCPTimelineView bounds](self, "bounds");
  CGPathAddLineToPoint(v7, 0, v8, v11 + -4.0);
  objc_msgSend(v5, "setPath:", v7);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  *(_OWORD *)components = xmmword_1A5EA8B48;
  v21 = unk_1A5EA8B58;
  objc_msgSend(v5, "setStrokeColor:", CGColorCreate(DeviceRGB, components));
  objc_msgSend(v5, "setLineWidth:", 2.0);
  objc_msgSend(v5, "setFillColor:", 0);
  LODWORD(v13) = 1.0;
  objc_msgSend(v5, "setShadowOpacity:", v13);
  objc_msgSend(v5, "setShadowRadius:", 1.0);
  objc_msgSend(v5, "setShadowOffset:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  v14 = objc_alloc_init(MEMORY[0x1E0CD27A8]);
  -[RCPTimelineView bounds](self, "bounds");
  objc_msgSend(v14, "setFrame:", v9, 0.0, 10000.0);
  v15 = CGColorSpaceCreateDeviceRGB();
  v19[0] = xmmword_1A5EA8B68;
  v19[1] = unk_1A5EA8B78;
  objc_msgSend(v14, "setBackgroundColor:", CGColorCreate(v15, (const CGFloat *)v19));
  v16 = objc_alloc_init(MEMORY[0x1E0CD27A8]);
  objc_msgSend(v16, "addSublayer:", v14);
  objc_msgSend(v16, "addSublayer:", v5);
  -[RCPTimelineView layer](self, "layer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addSublayer:", v16);

  return v16;
}

- (double)xForTimestamp:(unint64_t)a3
{
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  void *v10;
  uint64_t v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;

  -[RCPTimelineView bounds](self, "bounds");
  v6 = (double)a3;
  v7 = 8.0 / (v5 + -32.0);
  -[RCPTimelineView recapMovie](self, "recapMovie");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v6 - (double)(unint64_t)objc_msgSend(v8, "startTimestamp");
  -[RCPTimelineView recapMovie](self, "recapMovie");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "endTimestamp");
  -[RCPTimelineView recapMovie](self, "recapMovie");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v9 / (double)(unint64_t)(v11 - objc_msgSend(v12, "startTimestamp"));

  v14 = v7 + 1.0;
  if (v7 + 1.0 >= v13)
    v14 = v13;
  if (v14 <= -v7)
    v15 = -v7;
  else
    v15 = v14;
  -[RCPTimelineView bounds](self, "bounds");
  return (v16 + -48.0) * v15 + 24.0;
}

- (void)setTime:(unint64_t)a3
{
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  double v13;
  double v14;
  void *v15;

  v5 = -[RCPTimelineView startCropTimestamp](self, "startCropTimestamp");
  v6 = -[RCPTimelineView endCropTimestamp](self, "endCropTimestamp");
  if (v6 >= a3)
    v7 = a3;
  else
    v7 = v6;
  if (v5 <= v7)
    v8 = v7;
  else
    v8 = v5;
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  self->_time = v8;
  -[RCPTimelineView recapMovie](self, "recapMovie");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "eventStream");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "events");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (v12 >= 2)
  {
    -[RCPTimelineView xForTimestamp:](self, "xForTimestamp:", v8);
    v14 = v13 + -1.0;
    -[RCPTimelineView bounds](self, "bounds");
    -[CALayer setFrame:](self->_playbackHead, "setFrame:", v14, 0.0, 2.0);
    -[RCPTimelineView delegate](self, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "timelineView:didSetTime:", self, v8);

    -[RCPTimelineView updateCropUI](self, "updateCropUI");
  }
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

- (void)updateCropUI
{
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  -[RCPTimelineView xForTimestamp:](self, "xForTimestamp:", -[RCPTimelineView startCropTimestamp](self, "startCropTimestamp"));
  -[CALayer setPosition:](self->_cropStartHead, "setPosition:");
  -[RCPTimelineView xForTimestamp:](self, "xForTimestamp:", -[RCPTimelineView endCropTimestamp](self, "endCropTimestamp"));
  -[CALayer setPosition:](self->_cropEndHead, "setPosition:");
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RCPTimelineView;
  -[RCPTimelineView layoutSubviews](&v3, sel_layoutSubviews);
  -[RCPTimelineView setTime:](self, "setTime:", self->_time);
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v5;

  objc_msgSend(a3, "anyObject");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "locationInView:", self);
  -[RCPTimelineView dragBeganAtLocation:hitThreshold:](self, "dragBeganAtLocation:hitThreshold:");

}

- (void)dragBeganAtLocation:(CGPoint)a3 hitThreshold:(double)a4
{
  double y;
  double x;
  NSTimer *playbackTimer;
  double v9;
  int64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;

  y = a3.y;
  x = a3.x;
  -[NSTimer invalidate](self->_playbackTimer, "invalidate");
  playbackTimer = self->_playbackTimer;
  self->_playbackTimer = 0;

  -[CALayer position](self->_cropStartHead, "position");
  if (vabdd_f64(x + a4, v9) < a4)
    goto LABEL_2;
  -[CALayer position](self->_cropEndHead, "position");
  if (vabdd_f64(x - a4, v11) < a4)
  {
LABEL_4:
    v10 = 2;
    goto LABEL_5;
  }
  -[CALayer position](self->_playbackHead, "position");
  if (vabdd_f64(x, v12) < a4)
  {
LABEL_10:
    self->_draggingHandle = 0;
    goto LABEL_6;
  }
  -[CALayer position](self->_cropStartHead, "position");
  if (vabdd_f64(x, v13) >= a4)
  {
    -[CALayer position](self->_cropEndHead, "position");
    if (vabdd_f64(x, v14) < a4)
      goto LABEL_4;
    goto LABEL_10;
  }
LABEL_2:
  v10 = 1;
LABEL_5:
  self->_draggingHandle = v10;
LABEL_6:
  -[RCPTimelineView dragAtLocation:](self, "dragAtLocation:", x, y);
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v5;

  objc_msgSend(a3, "anyObject");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "locationInView:", self);
  -[RCPTimelineView dragAtLocation:](self, "dragAtLocation:");

}

- (void)dragAtLocation:(CGPoint)a3
{
  CGFloat v4;
  double v5;
  CGFloat v6;
  void *v7;
  double v8;
  void *v9;
  uint64_t v10;
  void *v11;
  double v12;
  int64_t draggingHandle;
  unint64_t v14;

  v4 = a3.x + -24.0;
  -[RCPTimelineView bounds](self, "bounds");
  v6 = v4 / (v5 + -48.0);
  -[RCPTimelineView recapMovie](self, "recapMovie");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (double)(unint64_t)objc_msgSend(v7, "startTimestamp");
  -[RCPTimelineView recapMovie](self, "recapMovie");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "endTimestamp");
  -[RCPTimelineView recapMovie](self, "recapMovie");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v8 + v6 * (double)(unint64_t)(v10 - objc_msgSend(v11, "startTimestamp"));

  draggingHandle = self->_draggingHandle;
  switch(draggingHandle)
  {
    case 2:
      v14 = (unint64_t)v12;
      -[RCPTimelineView setEndCropTimestamp:](self, "setEndCropTimestamp:", (unint64_t)v12);
LABEL_7:
      -[RCPTimelineView setTime:](self, "setTime:", v14);
      -[RCPTimelineView updateCropUI](self, "updateCropUI");
      return;
    case 1:
      v14 = (unint64_t)v12;
      -[RCPTimelineView setStartCropTimestamp:](self, "setStartCropTimestamp:", (unint64_t)v12);
      goto LABEL_7;
    case 0:
      -[RCPTimelineView setTime:](self, "setTime:", (unint64_t)v12);
      break;
  }
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGContext *CurrentContext;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  double v24;
  void *v25;
  uint64_t v26;
  void *v27;
  double v28;
  void *v29;
  unint64_t v30;
  void *v31;
  uint64_t IntegerValue;
  void *v33;
  char v34;
  void *v35;
  RCPEventTrack *v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t i;
  void *v46;
  CGFloat v47;
  double v48;
  CGFloat v49;
  double v50;
  double v51;
  double v52;
  id obj;
  uint64_t v54;
  CGContext *c;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  objc_super v67;
  _BYTE v68[128];
  _BYTE v69[128];
  uint64_t v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v70 = *MEMORY[0x1E0C80C00];
  v67.receiver = self;
  v67.super_class = (Class)RCPTimelineView;
  -[RCPTimelineView drawRect:](&v67, sel_drawRect_);
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSetRGBFillColor(CurrentContext, 0.2, 0.2, 0.2, 1.0);
  v71.origin.x = x;
  v71.origin.y = y;
  v71.size.width = width;
  v71.size.height = height;
  CGContextFillRect(CurrentContext, v71);
  -[RCPTimelineView recapMovie](self, "recapMovie");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "eventStream");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "events");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (v12 >= 2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[RCPTimelineView bounds](self, "bounds");
    v15 = v14;
    c = CurrentContext;
    CGContextSetRGBFillColor(CurrentContext, 1.0, 1.0, 1.0, 0.7);
    v65 = 0u;
    v66 = 0u;
    v63 = 0u;
    v64 = 0u;
    -[RCPTimelineView recapMovie](self, "recapMovie");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "eventStream");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "events");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    obj = v18;
    v56 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v63, v69, 16);
    if (v56)
    {
      v54 = *(_QWORD *)v64;
      v19 = v15 + -48.0;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v64 != v54)
            objc_enumerationMutation(obj);
          v57 = v20;
          v21 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * v20);
          v22 = objc_msgSend(v21, "timestamp");
          -[RCPTimelineView recapMovie](self, "recapMovie");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = (double)(unint64_t)(v22 - objc_msgSend(v23, "startTimestamp"));
          -[RCPTimelineView recapMovie](self, "recapMovie");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v25, "endTimestamp");
          -[RCPTimelineView recapMovie](self, "recapMovie");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = v24 / (double)(unint64_t)(v26 - objc_msgSend(v27, "startTimestamp")) * v19 + 24.0;

          v72.origin.x = v28 + -3.0;
          v72.origin.y = 3.0;
          v72.size.width = 6.0;
          v72.size.height = 6.0;
          CGContextFillEllipseInRect(c, v72);
          objc_msgSend(v21, "hidEvent");
          IOHIDEventGetChildren();
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v29, "count"))
          {
            v30 = 0;
            do
            {
              objc_msgSend(v29, "objectAtIndexedSubscript:", v30);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              IntegerValue = IOHIDEventGetIntegerValue();

              objc_msgSend(v29, "objectAtIndexedSubscript:", v30);
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              v34 = IOHIDEventGetIntegerValue();

              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", IntegerValue);
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "objectForKeyedSubscript:", v35);
              v36 = (RCPEventTrack *)objc_claimAutoreleasedReturnValue();

              -[RCPTimelineView xForTimestamp:](self, "xForTimestamp:", objc_msgSend(v21, "timestamp"));
              if ((v34 & 1) != 0)
              {
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", IntegerValue);
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v13, "removeObjectForKey:", v39);

              }
              else
              {
                v38 = v37;
                if (v36)
                {
                  -[RCPEventTrack setEndX:](v36, "setEndX:", v37);
                }
                else
                {
                  v36 = objc_alloc_init(RCPEventTrack);
                  -[RCPEventTrack setStartX:](v36, "setStartX:", v38);
                  -[RCPEventTrack setEndX:](v36, "setEndX:", v38 + 2.0);
                  -[RCPEventTrack setTrackY:](v36, "setTrackY:", objc_msgSend(v13, "count"));
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", IntegerValue);
                  v40 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v13, "setObject:forKeyedSubscript:", v36, v40);

                  objc_msgSend(v58, "addObject:", v36);
                }
              }

              ++v30;
            }
            while (v30 < objc_msgSend(v29, "count"));
          }

          v20 = v57 + 1;
        }
        while (v57 + 1 != v56);
        v56 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v69, 16);
      }
      while (v56);
    }

    CGContextSetRGBFillColor(c, 0.0, 0.59, 1.0, 1.0);
    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
    v41 = v58;
    v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v59, v68, 16);
    if (v42)
    {
      v43 = v42;
      v44 = *(_QWORD *)v60;
      do
      {
        for (i = 0; i != v43; ++i)
        {
          if (*(_QWORD *)v60 != v44)
            objc_enumerationMutation(v41);
          v46 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * i);
          v47 = (double)objc_msgSend(v46, "trackY") * 10.0 + 5.0 + 8.0;
          objc_msgSend(v46, "startX");
          v49 = v48;
          objc_msgSend(v46, "endX");
          v51 = v50;
          objc_msgSend(v46, "startX");
          v73.size.width = v51 - v52;
          v73.size.height = 8.0;
          v73.origin.x = v49;
          v73.origin.y = v47;
          CGContextFillRect(c, v73);
        }
        v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v59, v68, 16);
      }
      while (v43);
    }

  }
}

- (RCPTimelineViewDelegate)delegate
{
  return (RCPTimelineViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (RCPMovie)recapMovie
{
  return self->_recapMovie;
}

- (unint64_t)startCropTimestamp
{
  return self->_startCropTimestamp;
}

- (void)setStartCropTimestamp:(unint64_t)a3
{
  self->_startCropTimestamp = a3;
}

- (unint64_t)endCropTimestamp
{
  return self->_endCropTimestamp;
}

- (void)setEndCropTimestamp:(unint64_t)a3
{
  self->_endCropTimestamp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recapMovie, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_playbackTimer, 0);
  objc_storeStrong((id *)&self->_cropEndHead, 0);
  objc_storeStrong((id *)&self->_cropStartHead, 0);
  objc_storeStrong((id *)&self->_playbackHead, 0);
}

@end
