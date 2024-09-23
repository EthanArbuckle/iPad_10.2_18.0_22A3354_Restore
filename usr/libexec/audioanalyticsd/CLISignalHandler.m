@implementation CLISignalHandler

- (void)setEnabled:(BOOL)a3
{
  if (self->_enabled != a3)
  {
    if (a3)
    {
      objc_msgSend((id)qword_10003EC80, "addObject:", self);
      dispatch_resume((dispatch_object_t)self->_dispatch_source);
    }
    else
    {
      objc_msgSend((id)qword_10003EC80, "removeObject:", self);
      dispatch_suspend((dispatch_object_t)self->_dispatch_source);
    }
    self->_enabled = a3;
  }
}

- (void)setExecutionBlock:(id)a3
{
  id v4;
  void *v5;
  int signal;
  NSObject *dispatch_source;
  _QWORD v8[4];
  id v9;
  int v10;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    signal = self->_signal;
    dispatch_source = self->_dispatch_source;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100030444;
    v8[3] = &unk_10003A468;
    v9 = v4;
    v10 = signal;
    dispatch_source_set_event_handler(dispatch_source, v8);

  }
  else
  {
    dispatch_source_set_event_handler((dispatch_source_t)self->_dispatch_source, 0);
  }

}

- (CLISignalHandler)initWithSignal:(int)a3
{
  CLISignalHandler *v4;
  CLISignalHandler *v5;
  dispatch_source_t v6;
  OS_dispatch_source *dispatch_source;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CLISignalHandler;
  v4 = -[CLISignalHandler init](&v9, "init");
  v5 = v4;
  if (v4)
  {
    v4->_signal = a3;
    if (qword_10003EC88 != -1)
      dispatch_once(&qword_10003EC88, &stru_10003A4A8);
    v6 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, a3, 0, (dispatch_queue_t)&_dispatch_main_q);
    dispatch_source = v5->_dispatch_source;
    v5->_dispatch_source = (OS_dispatch_source *)v6;

  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[CLISignalHandler setExecutionBlock:](self, "setExecutionBlock:", 0);
  -[CLISignalHandler setEnabled:](self, "setEnabled:", 1);
  v3.receiver = self;
  v3.super_class = (Class)CLISignalHandler;
  -[CLISignalHandler dealloc](&v3, "dealloc");
}

- (int)signal
{
  return self->_signal;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatch_source, 0);
}

@end
