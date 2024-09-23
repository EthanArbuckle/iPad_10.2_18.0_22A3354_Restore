@implementation SignpostReporterConfigObserverDelegate

- (SignpostReporterConfigObserverDelegate)initWithCallbackBlock:(id)a3
{
  id v4;
  SignpostReporterConfigObserverDelegate *v5;
  SignpostReporterConfigObserverDelegate *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SignpostReporterConfigObserverDelegate;
  v5 = -[SignpostReporterConfigObserverDelegate init](&v8, "init");
  v6 = v5;
  if (v5)
    -[SignpostReporterConfigObserverDelegate setCallbackBlock:](v5, "setCallbackBlock:", v4);

  return v6;
}

- (void)observer:(id)a3 didChangeConfiguration:(id)a4 type:(id)a5
{
  id v7;
  id v8;
  void (**v9)(id, id, id);

  v7 = a5;
  v8 = a4;
  v9 = (void (**)(id, id, id))objc_claimAutoreleasedReturnValue(-[SignpostReporterConfigObserverDelegate callbackBlock](self, "callbackBlock"));
  v9[2](v9, v8, v7);

}

- (id)callbackBlock
{
  return self->_callbackBlock;
}

- (void)setCallbackBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_callbackBlock, 0);
}

@end
