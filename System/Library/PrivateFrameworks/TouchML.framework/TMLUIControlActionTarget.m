@implementation TMLUIControlActionTarget

- (TMLUIControlActionTarget)initWithSignal:(id)a3 controlEvent:(unint64_t)a4
{
  id v6;
  const char *v7;
  TMLUIControlActionTarget *v8;
  double v9;
  uint64_t v10;
  NSString *signalName;
  objc_super v13;

  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TMLUIControlActionTarget;
  v8 = -[TMLUIControlActionTarget init](&v13, sel_init);
  if (v8)
  {
    v10 = objc_msgSend_copy(v6, v7, v9);
    signalName = v8->_signalName;
    v8->_signalName = (NSString *)v10;

    v8->_controlEvent = a4;
  }

  return v8;
}

- (void)controlAction:(id)a3 forEvent:(id)a4
{
  NSString *signalName;
  unint64_t controlEvent;
  const char *v7;
  double v8;
  void *v9;
  const char *v10;
  double v11;
  void *v12;
  const char *v13;
  double v14;
  void *v15;
  id v16;

  signalName = self->_signalName;
  controlEvent = self->_controlEvent;
  v16 = a3;
  if (controlEvent >= 0x1000)
  {
    objc_msgSend_emitTMLSignal_withArguments_(v16, v7, v8, signalName, 0);
    v15 = v16;
  }
  else
  {
    objc_msgSend_allTouches(a4, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_allObjects(v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_emitTMLSignal_withArguments_(v16, v13, v14, signalName, v12);

    v15 = v9;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signalName, 0);
}

@end
