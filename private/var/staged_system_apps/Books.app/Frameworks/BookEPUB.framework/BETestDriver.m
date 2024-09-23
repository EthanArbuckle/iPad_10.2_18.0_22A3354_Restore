@implementation BETestDriver

+ (id)shared
{
  if (qword_3C19D8 != -1)
    dispatch_once(&qword_3C19D8, &stru_3776B0);
  return (id)qword_3C19D0;
}

- (void)postEvent:(id)a3 sender:(id)a4
{
  id v6;
  void *v7;
  unsigned int v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BETestDriver testStateProvider](self, "testStateProvider"));
  v8 = objc_msgSend(v7, "testIsRunning");

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v9, "postNotificationName:object:", v10, v6);

  }
}

- (BETestDriverTestStateProvider)testStateProvider
{
  return (BETestDriverTestStateProvider *)objc_loadWeakRetained((id *)&self->_testStateProvider);
}

- (void)setTestStateProvider:(id)a3
{
  objc_storeWeak((id *)&self->_testStateProvider, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_testStateProvider);
}

@end
