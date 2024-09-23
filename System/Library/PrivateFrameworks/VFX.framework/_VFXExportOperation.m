@implementation _VFXExportOperation

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_VFXExportOperation;
  -[_VFXExportOperation dealloc](&v3, sel_dealloc);
}

- (void)cancel
{
  uint64_t v2;

  objc_msgSend_setCanceled_(self, a2, 1, v2);
}

- (VFXNode)pointOfView
{
  return self->_pointOfView;
}

- (void)setPointOfView:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 288);
}

- (unint64_t)antialiasingMode
{
  return self->_antialiasingMode;
}

- (void)setAntialiasingMode:(unint64_t)a3
{
  self->_antialiasingMode = a3;
}

- (VFXRenderer)renderer
{
  return self->_renderer;
}

- (void)setRenderer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 360);
}

- (void)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(void *)a3
{
  self->_userInfo = a3;
}

- (SEL)didEndSelector
{
  return self->_didEndSelector;
}

- (void)setDidEndSelector:(SEL)a3
{
  self->_didEndSelector = a3;
}

- (VFXWorld)world
{
  return self->_world;
}

- (void)setWorld:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 264);
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (double)endTime
{
  return self->_endTime;
}

- (void)setEndTime:(double)a3
{
  self->_endTime = a3;
}

- (id)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = a3;
}

- (BOOL)canceled
{
  return self->_canceled;
}

- (void)setCanceled:(BOOL)a3
{
  self->_canceled = a3;
}

- (float)progress
{
  return self->_progress;
}

- (void)setProgress:(float)a3
{
  self->_progress = a3;
}

- (NSDictionary)attributes
{
  return self->_attributes;
}

- (void)setAttributes:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 344);
}

- (NSURL)outputURL
{
  return self->_outputURL;
}

- (void)setOutputURL:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 352);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 328);
}

- (BOOL)succeded
{
  return self->_succeded;
}

- (void)setSucceded:(BOOL)a3
{
  self->_succeded = a3;
}

@end
