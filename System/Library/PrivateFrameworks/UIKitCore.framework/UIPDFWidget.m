@implementation UIPDFWidget

- (UIPDFWidget)initWithFrame:(CGRect)a3 withDocument:(id)a4
{
  UIPDFWidget *v5;
  uint64_t v6;
  $D26E5079769BE3FC2EB09C817DA51E9D *v7;
  void *v8;
  UILabel *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)UIPDFWidget;
  v5 = -[UIView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, 380.0, 120.0);
  if (v5)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "addObserver:selector:name:object:", v5, sel_didReceiveMemoryWarning_, CFSTR("UIApplicationDidReceiveMemoryWarningNotification"), 0);
    v6 = 0;
    v5->queueCount = 0;
    v5->queueIndex = 0;
    do
    {
      v7 = &v5->queueData[v6];
      v7->memWarning = 0;
      *(_QWORD *)&v7->byteCount = 0;
      ++v6;
    }
    while (v6 != 60);
    v5->renderJobsCount = 0;
    v5->totalPageCount = 0;
    v5->currentPageCount = 0;
    v5->activeDocument = (UIPDFDocument *)a4;
    v5->trackedPages = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v5->heartbeatTimer = (NSTimer *)objc_msgSend(MEMORY[0x1E0C99E88], "timerWithTimeInterval:target:selector:userInfo:repeats:", v5, sel_heartbeat, 0, 1, 0.25);
    v8 = (void *)objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
    objc_msgSend(v8, "addTimer:forMode:", v5->heartbeatTimer, *MEMORY[0x1E0C99860]);
    v9 = -[UILabel initWithFrame:]([UILabel alloc], "initWithFrame:", 10.0, 30.0, 380.0, 120.0);
    v5->infoLabel = v9;
    -[UILabel setFont:](v9, "setFont:", objc_msgSend(off_1E167A828, "boldSystemFontOfSize:", 11.0));
    -[UILabel setLineBreakMode:](v5->infoLabel, "setLineBreakMode:", 0);
    -[UILabel setNumberOfLines:](v5->infoLabel, "setNumberOfLines:", 0);
    -[UILabel setText:](v5->infoLabel, "setText:", CFSTR("Loading..."));
    -[UIView addSubview:](v5, "addSubview:", v5->infoLabel);
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[NSTimer invalidate](self->heartbeatTimer, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)UIPDFWidget;
  -[UIView dealloc](&v3, sel_dealloc);
}

- (void)heartbeat
{
  integer_t v3;
  $D26E5079769BE3FC2EB09C817DA51E9D *queueData;
  uint64_t queueIndex;
  int queueCount;
  mach_msg_type_number_t task_info_outCnt;
  integer_t task_info_out[4];
  __int128 v9;
  uint64_t v10;

  v10 = 0;
  *(_OWORD *)task_info_out = 0u;
  v9 = 0u;
  task_info_outCnt = 40;
  if (!task_info(*MEMORY[0x1E0C83DA0], 0x12u, task_info_out, &task_info_outCnt))
  {
    v3 = task_info_out[3];
    self->renderJobsCount = -[UIPDFPageImageCache getRenderQueueJobsCount](-[UIPDFDocument pageImageCache](self->activeDocument, "pageImageCache"), "getRenderQueueJobsCount");
    queueData = self->queueData;
    queueData[self->queueIndex].byteCount = v3;
    self->queueData[self->queueIndex].currentPageCount = self->currentPageCount;
    queueData[self->queueIndex].renderJobsCount = self->renderJobsCount;
    queueIndex = self->queueIndex;
    queueData[queueIndex].memWarning = 0;
    self->queueIndex = ((int)queueIndex + 1) % 60;
    queueCount = self->queueCount;
    if (queueCount >= 59)
      queueCount = 59;
    self->queueCount = queueCount + 1;
    -[UIView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)didReceiveMemoryWarning:(id)a3
{
  self->queueData[(self->queueIndex + 59) % 60].memWarning = 1;
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  _QWORD *ContextStack;
  CGContext *v9;
  int queueCount;
  double v11;
  $D26E5079769BE3FC2EB09C817DA51E9D *queueData;
  int v13;
  double v14;
  int v15;
  double v16;
  double byteCount;
  int i;
  int j;
  int v20;
  int v21;
  float v22;
  float v23;
  double v24;
  double v25;
  int v26;
  int v27;
  float v28;
  float v29;
  double v30;
  double v31;
  int v32;
  int v33;
  int renderJobsCount;
  float v35;
  float v36;
  double v37;
  double v38;
  int v39;
  int v40;
  uint64_t v41;
  $D26E5079769BE3FC2EB09C817DA51E9D *v42;
  int v43;
  int v44;
  float v45;
  float v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t k;
  int rect;
  double recta;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  uint64_t v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v63 = *MEMORY[0x1E0C80C00];
  ContextStack = GetContextStack(0);
  if (*(int *)ContextStack < 1)
    v9 = 0;
  else
    v9 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
  v64.origin.x = x;
  v64.origin.y = y;
  v64.size.width = width;
  v64.size.height = height;
  CGContextClearRect(v9, v64);
  queueCount = self->queueCount;
  v11 = 12.0;
  if (queueCount < 1)
  {
    v14 = 0.0;
    v16 = 0.0;
  }
  else
  {
    queueData = self->queueData;
    v13 = self->queueIndex + 59;
    v14 = 0.0;
    v15 = self->queueCount;
    v16 = 0.0;
    do
    {
      byteCount = (double)queueData[v13 % 60].byteCount;
      if (v14 <= byteCount)
        v14 = (double)queueData[v13 % 60].byteCount;
      v16 = v16 + byteCount;
      --v13;
      --v15;
    }
    while (v15);
    if (v14 > 0.0)
      v11 = 120.0 / (v14 * 1.5);
  }
  CGContextSaveGState(v9);
  v65.origin.x = x;
  v65.origin.y = y;
  v65.size.width = width;
  v65.size.height = height;
  CGContextAddRect(v9, v65);
  CGContextSetRGBFillColor(v9, 0.9, 0.9, 0.9, 1.0);
  CGContextFillPath(v9);
  CGContextSetLineWidth(v9, 1.0);
  CGContextSetRGBStrokeColor(v9, 0.8, 0.8, 0.8, 1.0);
  for (i = 380; i > 0x17; CGContextAddLineToPoint(v9, (double)i, 120.0))
  {
    i -= 24;
    CGContextMoveToPoint(v9, (double)i, 0.0);
  }
  for (j = 120; j > 0xB; CGContextAddLineToPoint(v9, 380.0, (double)j))
  {
    j -= 12;
    CGContextMoveToPoint(v9, 0.0, (double)j);
  }
  CGContextStrokePath(v9);
  v66.origin.x = x;
  v66.origin.y = y;
  v66.size.width = width;
  v66.size.height = height;
  CGContextAddRect(v9, v66);
  CGContextSetLineWidth(v9, 3.0);
  CGContextSetRGBStrokeColor(v9, 0.1, 0.1, 0.1, 1.0);
  CGContextStrokePath(v9);
  CGContextRestoreGState(v9);
  if (self->queueCount >= 1)
  {
    rect = queueCount;
    CGContextSaveGState(v9);
    CGContextSetLineWidth(v9, 1.5);
    CGContextSetRGBStrokeColor(v9, 1.0, 0.1, 0.1, 1.0);
    if (self->queueCount >= 1)
    {
      v20 = 0;
      v21 = 59;
      do
      {
        v22 = (double)(v20 + 1) * -6.2295082 + 380.0;
        v23 = 120.0 - v11 * (double)self->queueData[(v21 + self->queueIndex) % 60].byteCount;
        v24 = v22;
        v25 = v23;
        if (v20)
          CGContextAddLineToPoint(v9, v24, v25);
        else
          CGContextMoveToPoint(v9, v24, v25);
        --v21;
        ++v20;
      }
      while (v20 < self->queueCount);
    }
    CGContextStrokePath(v9);
    CGContextSetLineWidth(v9, 1.5);
    CGContextSetRGBStrokeColor(v9, 0.1, 0.8, 0.1, 1.0);
    if (self->queueCount >= 1)
    {
      v26 = 0;
      v27 = 59;
      do
      {
        v28 = (double)(v26 + 1) * -6.2295082 + 380.0;
        v29 = 120.0 - (double)(12 * self->queueData[(v27 + self->queueIndex) % 60].currentPageCount);
        v30 = v28;
        v31 = v29;
        if (v26)
          CGContextAddLineToPoint(v9, v30, v31);
        else
          CGContextMoveToPoint(v9, v30, v31);
        --v27;
        ++v26;
      }
      while (v26 < self->queueCount);
    }
    CGContextStrokePath(v9);
    CGContextSetLineWidth(v9, 1.5);
    CGContextSetRGBStrokeColor(v9, 0.1, 0.1, 0.8, 1.0);
    if (self->queueCount >= 1)
    {
      v32 = 0;
      v33 = 59;
      do
      {
        renderJobsCount = self->queueData[(v33 + self->queueIndex) % 60].renderJobsCount;
        v35 = (double)(v32 + 1) * -6.2295082 + 380.0;
        v36 = 120.0 - (double)(12 * renderJobsCount);
        v37 = v36;
        v38 = v35;
        if (renderJobsCount < 1)
          v37 = 118.0;
        if (v32)
          CGContextAddLineToPoint(v9, v38, v37);
        else
          CGContextMoveToPoint(v9, v38, v37);
        --v33;
        ++v32;
      }
      while (v32 < self->queueCount);
    }
    recta = v16 / (double)rect;
    CGContextStrokePath(v9);
    CGContextRestoreGState(v9);
    CGContextSaveGState(v9);
    CGContextSetLineWidth(v9, 2.0);
    CGContextSetRGBStrokeColor(v9, 1.0, 0.5, 0.1, 1.0);
    v39 = self->queueCount;
    if (v39 < 1)
    {
      v41 = 0;
    }
    else
    {
      v40 = 0;
      v41 = 0;
      v42 = self->queueData;
      v43 = 59;
      do
      {
        ++v40;
        v44 = (v43 + self->queueIndex) % 60;
        if (v42[v44].memWarning)
        {
          v46 = 120.0 - v11 * (double)v42[v44].byteCount;
          CGContextSaveGState(v9);
          CGContextSetRGBStrokeColor(v9, 1.0, 0.1, 0.1, 1.0);
          v45 = (double)v40 * -6.2295082 + 380.0;
          v67.origin.x = (float)(v45 + -4.0);
          v67.origin.y = (float)(v46 + -4.0);
          v67.size.width = 8.0;
          v67.size.height = 8.0;
          CGContextStrokeEllipseInRect(v9, v67);
          CGContextRestoreGState(v9);
          v41 = (v41 + 1);
          v39 = self->queueCount;
        }
        --v43;
      }
      while (v40 < v39);
    }
    CGContextRestoreGState(v9);
    v47 = objc_msgSend(MEMORY[0x1E0CB34E8], "stringFromByteCount:countStyle:", (int)v14, 0);
    v48 = objc_msgSend(MEMORY[0x1E0CB34E8], "stringFromByteCount:countStyle:", (int)recta, 0);
    v49 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("Peak: %@, Avg (Red): %@, Mem warnings (Circles): %d\nCurrent pages (Green): %d, Ever constructed: %d, Jobs (Blue): %d\nAllocated pages indices: "), v47, v48, v41, self->currentPageCount, self->totalPageCount, self->renderJobsCount);
    v50 = objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("self"), 1);
    v51 = (void *)-[NSMutableSet sortedArrayUsingDescriptors:](self->trackedPages, "sortedArrayUsingDescriptors:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v50));
    v58 = 0u;
    v59 = 0u;
    v60 = 0u;
    v61 = 0u;
    v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v58, v62, 16);
    if (v52)
    {
      v53 = v52;
      v54 = *(_QWORD *)v59;
      do
      {
        for (k = 0; k != v53; ++k)
        {
          if (*(_QWORD *)v59 != v54)
            objc_enumerationMutation(v51);
          objc_msgSend(v49, "appendFormat:", CFSTR("%d "), objc_msgSend(*(id *)(*((_QWORD *)&v58 + 1) + 8 * k), "intValue"));
        }
        v53 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v58, v62, 16);
      }
      while (v53);
    }
    -[UILabel setText:](self->infoLabel, "setText:", v49);
  }
}

- (void)addedPageView:(int)a3
{
  uint64_t v4;

  ++self->currentPageCount;
  ++self->totalPageCount;
  v4 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(_QWORD *)&a3);
  if ((-[NSMutableSet containsObject:](self->trackedPages, "containsObject:", v4) & 1) == 0)
    -[NSMutableSet addObject:](self->trackedPages, "addObject:", v4);
}

- (void)removedPageView:(int)a3
{
  uint64_t v4;

  --self->currentPageCount;
  v4 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(_QWORD *)&a3);
  if (-[NSMutableSet containsObject:](self->trackedPages, "containsObject:", v4))
    -[NSMutableSet removeObject:](self->trackedPages, "removeObject:", v4);
}

@end
