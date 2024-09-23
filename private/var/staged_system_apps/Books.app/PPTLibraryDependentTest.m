@implementation PPTLibraryDependentTest

- (PPTLibraryDependentTest)initWithName:(id)a3 options:(id)a4 testDefinition:(id)a5 isMainTest:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  PPTLibraryDependentTest *v11;
  void *v12;
  unsigned int v13;
  uint64_t v14;
  objc_super v16;

  v6 = a6;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)PPTLibraryDependentTest;
  v11 = -[PPTBasicTest initWithName:options:testDefinition:isMainTest:](&v16, "initWithName:options:testDefinition:isMainTest:", a3, a4, v10, v6);
  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("library-type")));
    v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("list"));
    v14 = 1;
    if (v13)
      v14 = 2;
    v11->_mode = v14;

  }
  return v11;
}

- (int)handlerTimeout
{
  return 3;
}

- (BOOL)hasHandler
{
  void *v3;
  dispatch_time_t v4;
  _QWORD block[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PPTBasicTest bookshelf](self, "bookshelf"));
  objc_msgSend(v3, "changeViewModeTo:", self->_mode);
  v4 = dispatch_time(0, 2000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007682C;
  block[3] = &unk_1008E72C0;
  block[4] = self;
  dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, block);

  return 0;
}

- (unint64_t)mode
{
  return self->_mode;
}

- (void)setMode:(unint64_t)a3
{
  self->_mode = a3;
}

@end
