@implementation _SBDeviceApplicationSceneHandleSnapshottingAssertion

- (_SBDeviceApplicationSceneHandleSnapshottingAssertion)initWithIdentifier:(id)a3 forReason:(id)a4 contextId:(unsigned int)a5 renderId:(unint64_t)a6 invalidationBlock:(id)a7
{
  _SBDeviceApplicationSceneHandleSnapshottingAssertion *result;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_SBDeviceApplicationSceneHandleSnapshottingAssertion;
  result = -[BSSimpleAssertion initWithIdentifier:forReason:invalidationBlock:](&v10, sel_initWithIdentifier_forReason_invalidationBlock_, a3, a4, a7);
  if (result)
  {
    result->_renderId = a6;
    result->_contextId = a5;
  }
  return result;
}

- (unint64_t)renderId
{
  return self->_renderId;
}

- (unsigned)contextId
{
  return self->_contextId;
}

@end
