@implementation CLBarometerCalibrationContextManager

- (CLBarometerCalibrationContextManager)initWithUniverse:(id)a3 delegate:(id)a4 withBuffer:(void *)a5 withSourceAggregator:(id)a6
{
  CLBarometerCalibrationContextManager *v11;
  CLBarometerCalibrationContextManager *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CLBarometerCalibrationContextManager;
  v11 = -[CLBarometerCalibrationContextManager init](&v14, "init");
  v12 = v11;
  if (v11)
  {
    v11->_universe = (CLIntersiloUniverse *)a3;
    v11->_delegate = (CLBarometerCalibrationContextClient *)a4;
    v11->fDataBuffers = a5;
    v11->_sourceAggregator = (CLBarometerCalibrationSourceAggregator *)a6;
    if ((objc_opt_respondsToSelector(a4, "startTrack:") & 1) == 0)
      -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, v12, CFSTR("CLBarometerCalibrationContextManager.mm"), 137, CFSTR("Expected delegate to conform to CLBarometerCalibrationContextClient"));
    if ((objc_opt_respondsToSelector(v12->_delegate, "stopTrack:") & 1) == 0)
      -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, v12, CFSTR("CLBarometerCalibrationContextManager.mm"), 138, CFSTR("Expected delegate to conform to CLBarometerCalibrationContextClient"));
  }
  return v12;
}

- (void)dealloc
{
  objc_super v2;

  self->_sourceAggregator = 0;
  self->_universe = 0;
  self->_delegate = 0;
  v2.receiver = self;
  v2.super_class = (Class)CLBarometerCalibrationContextManager;
  -[CLBarometerCalibrationContextManager dealloc](&v2, "dealloc");
}

- (CLBarometerCalibrationTrack)fTrack
{
  return self->_fTrack;
}

- (void)setFTrack:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

@end
