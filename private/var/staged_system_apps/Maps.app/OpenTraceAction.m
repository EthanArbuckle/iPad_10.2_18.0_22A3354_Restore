@implementation OpenTraceAction

- (OpenTraceAction)initWithFilePath:(id)a3
{
  id v5;
  OpenTraceAction *v6;
  OpenTraceAction *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)OpenTraceAction;
  v6 = -[OpenTraceAction init](&v9, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_filePath, a3);
    v7->_startNav = 0;
  }

  return v7;
}

- (OpenTraceAction)initWithFilePath:(id)a3 shouldStartNav:(BOOL)a4
{
  id v7;
  OpenTraceAction *v8;
  OpenTraceAction *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)OpenTraceAction;
  v8 = -[OpenTraceAction init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_filePath, a3);
    v9->_startNav = a4;
  }

  return v9;
}

- (NSString)filePath
{
  return self->_filePath;
}

- (void)setFilePath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)startNav
{
  return self->_startNav;
}

- (void)setStartNav:(BOOL)a3
{
  self->_startNav = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filePath, 0);
}

@end
