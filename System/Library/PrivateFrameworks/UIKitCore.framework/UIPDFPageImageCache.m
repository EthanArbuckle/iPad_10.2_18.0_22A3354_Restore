@implementation UIPDFPageImageCache

- (UIPDFPageImageCache)initWithDocument:(id)a3
{
  return -[UIPDFPageImageCache initWithDocument:cacheCount:lookAhead:withLookAheadResolution:](self, "initWithDocument:cacheCount:lookAhead:withLookAheadResolution:", a3, 10, 2, 0.5);
}

- (UIPDFPageImageCache)initWithDocument:(id)a3 cacheCount:(unint64_t)a4 lookAhead:(unint64_t)a5 withLookAheadResolution:(double)a6
{
  UIPDFPageImageCache *v10;
  UIPDFPageImageCache *v11;
  id *v12;
  id *v13;
  NSOperationQueue *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)UIPDFPageImageCache;
  v10 = -[UIPDFPageImageCache init](&v16, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_document = (UIPDFDocument *)a3;
    v10->_lookAhead = a5;
    v10->_lookAheadResolution = a6;
    v10->_jobCount = a4;
    if (a4)
      v12 = (id *)malloc_type_calloc(a4, 8uLL, 0x80040B8603338uLL);
    else
      v12 = 0;
    v11->_jobsPrioritized = v12;
    v13 = (id *)objc_msgSend(a3, "numberOfPages");
    v11->_pageCount = (unint64_t)v13;
    if (v13)
      v13 = (id *)malloc_type_calloc((size_t)v13, 8uLL, 0x80040B8603338uLL);
    v11->_jobsByPage = v13;
    v14 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    v11->_renderQueue = v14;
    -[NSOperationQueue setMaxConcurrentOperationCount:](v14, "setMaxConcurrentOperationCount:", 1);
    v11->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "addObserver:selector:name:object:", v11, sel_didReceiveMemoryWarning_, CFSTR("UIApplicationDidReceiveMemoryWarningNotification"), 0);
  }
  return v11;
}

- (void)clearCache
{
  unint64_t jobCount;
  NSOperationQueue *renderQueue;
  unint64_t v5;
  unint64_t i;
  id *jobsPrioritized;
  id v8;
  id *jobsByPage;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;

  jobCount = self->_jobCount;
  renderQueue = self->_renderQueue;
  if (jobCount)
  {
    -[NSOperationQueue cancelAllOperations](renderQueue, "cancelAllOperations");
    v5 = self->_jobCount;
    if (v5)
    {
      for (i = 0; i < v5; ++i)
      {
        jobsPrioritized = self->_jobsPrioritized;
        v8 = jobsPrioritized[i];
        if (v8)
        {
          jobsByPage = self->_jobsByPage;
          jobsByPage[objc_msgSend(jobsPrioritized[i], "pageIndex")] = 0;
          objc_msgSend(v8, "cancel");

          self->_jobsPrioritized[i] = 0;
          v5 = self->_jobCount;
        }
      }
    }
  }
  else
  {
    v10 = -[NSOperationQueue operations](renderQueue, "operations");
    v11 = -[NSArray count](v10, "count");
    if (v11)
    {
      v12 = v11;
      for (j = 0; j != v12; ++j)
        objc_msgSend((id)objc_msgSend(-[NSArray objectAtIndex:](v10, "objectAtIndex:", j), "job"), "cancel");
    }
  }
}

- (void)dealloc
{
  objc_super v3;

  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:", self);
  -[UIPDFPageImageCache clearCache](self, "clearCache");

  free(self->_jobsPrioritized);
  free(self->_jobsByPage);
  v3.receiver = self;
  v3.super_class = (Class)UIPDFPageImageCache;
  -[UIPDFPageImageCache dealloc](&v3, sel_dealloc);
}

- (void)addRenderJob:(id)a3
{
  id *jobsPrioritized;
  unint64_t nextJobIndex;
  id v7;
  id *jobsByPage;
  id *v9;
  id v10;
  unint64_t v11;
  unint64_t v12;

  if (self->_jobCount)
  {
    jobsPrioritized = self->_jobsPrioritized;
    nextJobIndex = self->_nextJobIndex;
    v7 = jobsPrioritized[nextJobIndex];
    if (v7)
    {
      jobsByPage = self->_jobsByPage;
      jobsByPage[objc_msgSend(jobsPrioritized[nextJobIndex], "pageIndex")] = 0;
      objc_msgSend(v7, "cancel");

      jobsPrioritized = self->_jobsPrioritized;
      nextJobIndex = self->_nextJobIndex;
    }
    jobsPrioritized[nextJobIndex] = a3;
    v9 = self->_jobsByPage;
    v9[objc_msgSend(a3, "pageIndex")] = a3;
    v10 = a3;
    v11 = self->_nextJobIndex;
    if (v11 + 1 < self->_jobCount)
      v12 = v11 + 1;
    else
      v12 = 0;
    self->_nextJobIndex = v12;
  }
  else
  {
    objc_msgSend(a3, "setReleaseWhenDone:", 1);
  }
  -[NSOperationQueue addOperation:](self->_renderQueue, "addOperation:", objc_msgSend(a3, "operation"));
  objc_msgSend(a3, "releaseOperation");
}

- (void)cacheImageOfPage:(unint64_t)a3 maxSize:(CGSize)a4
{
  double height;
  double width;
  double lookAheadResolution;
  unint64_t v9;
  id v10;
  UIPDFPageRenderJob *v11;

  if (a3)
  {
    height = a4.height;
    width = a4.width;
    if (-[UIPDFPageImageCache pageCount](self, "pageCount") >= a3)
    {
      lookAheadResolution = self->_lookAheadResolution;
      os_unfair_lock_lock(&self->_lock);
      v9 = a3 - 1;
      if (!self->_jobsByPage[v9])
      {
        v10 = -[UIPDFDocument copyPageAtIndex:](-[UIPDFPageImageCache document](self, "document"), "copyPageAtIndex:", v9);
        v11 = -[UIPDFPageRenderJob initWithPage:maxSize:queuePriority:]([UIPDFPageRenderJob alloc], "initWithPage:maxSize:queuePriority:", v10, 0, width * lookAheadResolution, height * lookAheadResolution);

        -[UIPDFPageImageCache addRenderJob:](self, "addRenderJob:", v11);
      }
      os_unfair_lock_unlock(&self->_lock);
    }
  }
}

- (void)deliverImageOfPage:(unint64_t)a3 maxSize:(CGSize)a4 quality:(BOOL *)a5 receiver:(id)a6 selector:(SEL)a7 info:(id)a8
{
  double height;
  double width;
  unint64_t v16;
  id v17;
  id v18;
  BOOL v19;
  _BOOL4 v20;
  double v21;
  double v22;
  UIPDFPageRenderJob *v23;
  id v24;
  uint64_t v25;
  int v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t nextJobIndex;
  id *jobsPrioritized;
  unint64_t v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  char v41;
  unint64_t v42;
  id v43;
  double v44;
  double v45;
  double v46;
  double v47;
  unint64_t v48;
  unint64_t jobCount;
  id v50;

  if (a3)
  {
    height = a4.height;
    width = a4.width;
    if (-[UIPDFPageImageCache pageCount](self, "pageCount") >= a3)
    {
      v50 = -[UIPDFDocument copyPageAtIndex:](-[UIPDFPageImageCache document](self, "document"), "copyPageAtIndex:", a3 - 1);
      os_unfair_lock_lock(&self->_lock);
      v16 = -[UIPDFPageImageCache lookAhead](self, "lookAhead");
      jobCount = self->_jobCount;
      v17 = self->_jobsByPage[a3 - 1];
      v18 = v17;
      os_unfair_lock_unlock(&self->_lock);
      if (v17)
      {
        v48 = v16;
        if (v16)
        {
          v19 = objc_msgSend(v17, "priority") == 4;
          v20 = objc_msgSend(v17, "image") != 0;
        }
        else
        {
          objc_msgSend(v17, "size");
          v20 = 0;
          v19 = v22 == height && v21 == width;
        }
        if (!*a5 || v19 || v20)
        {
          *a5 = v19;
          objc_msgSend(v17, "sendImageTo:callback:userData:", a6, a7, a8);

          if (!jobCount || !v48)
            goto LABEL_48;
          goto LABEL_31;
        }

        v16 = v48;
      }
      os_unfair_lock_lock(&self->_lock);
      *a5 = 1;
      v23 = -[UIPDFPageRenderJob initWithPage:maxSize:queuePriority:]([UIPDFPageRenderJob alloc], "initWithPage:maxSize:queuePriority:", v50, 4, width, height);
      -[UIPDFPageRenderJob setTarget:callback:userData:](v23, "setTarget:callback:userData:", a6, a7, a8);
      if (!jobCount || !v16)
      {
        -[UIPDFPageImageCache addRenderJob:](self, "addRenderJob:", v23);

        os_unfair_lock_unlock(&self->_lock);
        goto LABEL_48;
      }
      v24 = self->_jobsPrioritized[self->_nextJobIndex];
      if (v24)
      {
        v25 = -1;
        do
        {
          v26 = a3 - 1 - objc_msgSend(v24, "pageIndex");
          if (v26 >= 0)
            v27 = v26;
          else
            v27 = -v26;
          if (-[UIPDFPageImageCache lookAhead](self, "lookAhead") < v27)
            break;
          v28 = self->_jobCount;
          if (++v25 >= v28)
            break;
          jobsPrioritized = self->_jobsPrioritized;
          nextJobIndex = self->_nextJobIndex;
          v31 = nextJobIndex + 1 < v28 ? nextJobIndex + 1 : 0;
          self->_nextJobIndex = v31;
          v24 = jobsPrioritized[v31];
        }
        while (v24);
      }
      -[UIPDFPageImageCache addRenderJob:](self, "addRenderJob:", v23);

      os_unfair_lock_unlock(&self->_lock);
LABEL_31:
      objc_msgSend(v50, "cropBoxAccountForRotation");
      v34 = height * v32;
      v35 = height / v33;
      if (v33 <= 0.0)
        v35 = 1.0;
      if (v32 <= 0.0)
        v36 = 1.0;
      else
        v36 = width / v32;
      if (v34 >= width * v33)
        v37 = v36;
      else
        v37 = v35;
      v38 = -[UIPDFPageImageCache lookAhead](self, "lookAhead");
      if (v38)
      {
        v39 = v38;
        v40 = 1;
        v41 = 1;
        do
        {
          if ((v41 & 1) != 0)
          {
            v42 = v40 + a3;
            if (v40 + a3 <= -[UIPDFPageImageCache pageCount](self, "pageCount"))
              goto LABEL_45;
          }
          else
          {
            v42 = a3 - v40;
            if (a3 > v40)
            {
LABEL_45:
              if (v42)
              {
                v43 = -[UIPDFDocument copyPageAtIndex:](-[UIPDFPageImageCache document](self, "document"), "copyPageAtIndex:", v42 - 1);
                objc_msgSend(v43, "cropBoxAccountForRotation");
                v45 = v44;
                v47 = v46;

                -[UIPDFPageImageCache cacheImageOfPage:maxSize:](self, "cacheImageOfPage:maxSize:", v42, v37 * v45, v37 * v47);
              }
            }
          }
          v41 ^= 1u;
          v40 += v41 & 1;
        }
        while (v40 <= v39);
      }
LABEL_48:

    }
  }
}

- (id)getImageIfAvailableForPage:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;
  id v6;
  id v7;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v6 = self->_jobsByPage[a3 - 1];
  if (v6)
    v7 = (id)objc_msgSend(v6, "image");
  else
    v7 = 0;
  os_unfair_lock_unlock(p_lock);
  return v7;
}

- (void)cancelPendingRenderOperations
{
  os_unfair_lock_s *p_lock;
  unint64_t jobCount;
  unint64_t i;
  id v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSOperationQueue cancelAllOperations](self->_renderQueue, "cancelAllOperations");
  jobCount = self->_jobCount;
  if (jobCount)
  {
    for (i = 0; i < jobCount; ++i)
    {
      v6 = self->_jobsPrioritized[i];
      if (v6)
      {
        objc_msgSend(v6, "cancelOperation");
        jobCount = self->_jobCount;
      }
    }
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)cancelPendingRenderOperationsForTarget:(id)a3
{
  os_unfair_lock_s *p_lock;
  unint64_t jobCount;
  unint64_t i;
  id v8;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  jobCount = self->_jobCount;
  if (jobCount)
  {
    for (i = 0; i < jobCount; ++i)
    {
      v8 = self->_jobsPrioritized[i];
      if (v8)
      {
        objc_msgSend(v8, "cancelOperationForTarget:", a3);
        jobCount = self->_jobCount;
      }
    }
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)didReceiveMemoryWarning:(id)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[UIPDFPageImageCache clearCache](self, "clearCache");
  os_unfair_lock_unlock(p_lock);
}

- (int)getRenderQueueJobsCount
{
  return -[NSOperationQueue operationCount](self->_renderQueue, "operationCount");
}

- (UIPDFDocument)document
{
  return self->_document;
}

- (unint64_t)pageCount
{
  return self->_pageCount;
}

- (unint64_t)lookAhead
{
  return self->_lookAhead;
}

- (double)lookAheadResolution
{
  return self->_lookAheadResolution;
}

@end
