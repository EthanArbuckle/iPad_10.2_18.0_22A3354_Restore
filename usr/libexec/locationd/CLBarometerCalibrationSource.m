@implementation CLBarometerCalibrationSource

- (CLBarometerCalibrationSource)initWithUniverse:(id)a3 delegate:(id)a4
{
  CLBarometerCalibrationSource *v7;
  CLBarometerCalibrationSource *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CLBarometerCalibrationSource;
  v7 = -[CLBarometerCalibrationSource init](&v10, "init");
  v8 = v7;
  if (v7)
  {
    v7->_universe = (CLIntersiloUniverse *)a3;
    v7->_delegate = (CLBarometerCalibrationSourceClient *)a4;
    if ((objc_opt_respondsToSelector(a4, "didUpdateSource:withData:") & 1) == 0)
      -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, v8, CFSTR("CLBarometerCalibrationSource.mm"), 22, CFSTR("Expected delegate to conform to CLBarometerCalibrationSourceClient"));
  }
  return v8;
}

- (void)dealloc
{
  objc_super v2;

  self->_universe = 0;
  self->_delegate = 0;
  v2.receiver = self;
  v2.super_class = (Class)CLBarometerCalibrationSource;
  -[CLBarometerCalibrationSource dealloc](&v2, "dealloc");
}

@end
