@implementation OZJSBehavior

+ (id)behaviorWithBehavior:(void *)a3
{
  return -[OZJSBehavior initWithBehavior:]([OZJSBehavior alloc], "initWithBehavior:", a3);
}

- (OZJSBehavior)initWithBehavior:(void *)a3
{
  OZJSBehavior *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)OZJSBehavior;
  result = -[OZJSBehavior init](&v5, sel_init);
  if (result)
    result->_behavior = a3;
  return result;
}

- (void)setStartTime:(float)a3
{
  char *behavior;
  CMTime v5;
  CMTime v6;
  __int128 v7;
  uint64_t v8;
  _QWORD v9[3];
  __int128 v10;
  uint64_t v11;
  CMTime v12;

  memset(&v12, 0, sizeof(v12));
  PC_CMTimeMakeWithSecondsRoundToNearest(30, &v12, a3);
  (*(void (**)(_QWORD *__return_ptr))(*(_QWORD *)self->_behavior + 608))(v9);
  v7 = v10;
  v8 = v11;
  v6 = v12;
  OZChannelObjectRootBase::setTimeExtent((OZChannelObjectRootBase *)((char *)self->_behavior + 56), (const PCTimeRange *)&v6, 0);
  behavior = (char *)self->_behavior;
  v5 = v12;
  OZChannelObjectRootBase::setTimeOffset((__n128 *)(behavior + 56), &v5, 0);
}

- (void)behavior
{
  return self->_behavior;
}

- (void)setBehavior:(void *)a3
{
  self->_behavior = a3;
}

@end
