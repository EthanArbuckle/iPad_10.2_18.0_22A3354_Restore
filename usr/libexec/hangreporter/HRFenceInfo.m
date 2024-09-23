@implementation HRFenceInfo

- (HRFenceInfo)initWithFenceName:(unint64_t)a3 traceStart:(unint64_t)a4 traceEnd:(unint64_t)a5
{
  HRFenceInfo *v8;
  HRFenceInfo *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)HRFenceInfo;
  v8 = -[HRFenceInfo init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    -[HRFenceInfo setFenceName:](v8, "setFenceName:", a3);
    -[HRFenceInfo setFenceStartTime:](v9, "setFenceStartTime:", a4);
    -[HRFenceInfo setFenceResolutionTime:](v9, "setFenceResolutionTime:", a5);
    -[HRFenceInfo setFenceEndTime:](v9, "setFenceEndTime:", a5);
    -[HRFenceInfo setResolution:](v9, "setResolution:", 0);
  }
  return v9;
}

- (unint64_t)fenceName
{
  return self->_fenceName;
}

- (void)setFenceName:(unint64_t)a3
{
  self->_fenceName = a3;
}

- (unint64_t)fenceStartTime
{
  return self->_fenceStartTime;
}

- (void)setFenceStartTime:(unint64_t)a3
{
  self->_fenceStartTime = a3;
}

- (unint64_t)fenceResolutionTime
{
  return self->_fenceResolutionTime;
}

- (void)setFenceResolutionTime:(unint64_t)a3
{
  self->_fenceResolutionTime = a3;
}

- (unint64_t)fenceEndTime
{
  return self->_fenceEndTime;
}

- (void)setFenceEndTime:(unint64_t)a3
{
  self->_fenceEndTime = a3;
}

- (int)resolution
{
  return self->_resolution;
}

- (void)setResolution:(int)a3
{
  self->_resolution = a3;
}

@end
