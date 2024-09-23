@implementation TMLUIGestureRecognizerActionTarget

- (TMLUIGestureRecognizerActionTarget)initWithSignal:(id)a3 state:(int64_t)a4
{
  id v6;
  const char *v7;
  TMLUIGestureRecognizerActionTarget *v8;
  double v9;
  uint64_t v10;
  NSString *signalName;
  objc_super v13;

  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TMLUIGestureRecognizerActionTarget;
  v8 = -[TMLUIGestureRecognizerActionTarget init](&v13, sel_init);
  if (v8)
  {
    v10 = objc_msgSend_copy(v6, v7, v9);
    signalName = v8->_signalName;
    v8->_signalName = (NSString *)v10;

    v8->_state = a4;
  }

  return v8;
}

- (void)handleGesture:(id)a3
{
  const char *v4;
  double v5;
  const char *v6;
  double v7;
  id v8;

  v8 = a3;
  if (objc_msgSend_state(v8, v4, v5) == self->_state)
    objc_msgSend_emitTMLSignal_withArguments_(v8, v6, v7, self->_signalName, 0);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signalName, 0);
}

@end
