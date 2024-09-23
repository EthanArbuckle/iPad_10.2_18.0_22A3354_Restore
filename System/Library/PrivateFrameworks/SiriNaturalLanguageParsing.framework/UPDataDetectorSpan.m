@implementation UPDataDetectorSpan

- (UPDataDetectorSpan)initWithRange:(_NSRange)a3 category:(id)a4 dataDetectorResult:(__DDResult *)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  UPDataDetectorSpan *v10;

  length = a3.length;
  location = a3.location;
  v9 = a4;
  v10 = -[UPSpan initWithRange:type:category:](self, "initWithRange:type:category:", location, length, 2, v9);
  CFRetain(a5);
  v10->_dataDetectorResult = a5;

  return v10;
}

- (UPDataDetectorSpan)initWithRange:(_NSRange)a3 category:(id)a4 dataDetectorResult:(__DDResult *)a5 usoGraph:(id)a6
{
  NSUInteger length;
  NSUInteger location;
  id v11;
  USOSerializedGraph *v12;
  UPDataDetectorSpan *v13;
  USOSerializedGraph *usoGraph;

  length = a3.length;
  location = a3.location;
  v11 = a4;
  v12 = (USOSerializedGraph *)a6;
  v13 = -[UPSpan initWithRange:type:category:](self, "initWithRange:type:category:", location, length, 2, v11);
  CFRetain(a5);
  v13->_dataDetectorResult = a5;
  usoGraph = v13->_usoGraph;
  v13->_usoGraph = v12;

  return v13;
}

- (void)dealloc
{
  objc_super v3;

  CFRelease(self->_dataDetectorResult);
  v3.receiver = self;
  v3.super_class = (Class)UPDataDetectorSpan;
  -[UPDataDetectorSpan dealloc](&v3, sel_dealloc);
}

- (id)getUsoGraphPrintedForm
{
  return (id)-[USOSerializedGraph printedForm](self->_usoGraph, "printedForm");
}

- (__DDResult)dataDetectorResult
{
  return self->_dataDetectorResult;
}

- (USOSerializedGraph)usoGraph
{
  return (USOSerializedGraph *)objc_getProperty(self, a2, 56, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_usoGraph, 0);
}

@end
