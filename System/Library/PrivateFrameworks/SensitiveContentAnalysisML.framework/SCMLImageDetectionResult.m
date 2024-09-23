@implementation SCMLImageDetectionResult

- (SCMLImageDetectionResult)initWithDetections:(id)a3
{
  id v5;
  SCMLImageDetectionResult *v6;
  SCMLImageDetectionResult *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SCMLImageDetectionResult;
  v6 = -[SCMLImageDetectionResult init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_detections, a3);

  return v7;
}

- (NSArray)detections
{
  return self->_detections;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detections, 0);
}

@end
