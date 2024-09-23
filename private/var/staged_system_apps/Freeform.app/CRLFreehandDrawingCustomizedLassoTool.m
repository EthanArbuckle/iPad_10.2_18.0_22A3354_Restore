@implementation CRLFreehandDrawingCustomizedLassoTool

- (CRLFreehandDrawingCustomizedLassoTool)initWithCustomIdentifier:(id)a3 configuration:(id)a4 color:(id)a5 weight:(double)a6
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CRLFreehandDrawingCustomizedLassoTool;
  return -[CRLFreehandDrawingCustomizedLassoTool initWithCustomIdentifier:configuration:color:weight:](&v7, "initWithCustomIdentifier:configuration:color:weight:", a3, a4, a5, a6);
}

- (BOOL)_isLassoTool
{
  return 1;
}

@end
