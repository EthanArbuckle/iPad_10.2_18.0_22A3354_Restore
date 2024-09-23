@implementation VKARWalkingElevationRequestFailureInfo

- (VKARWalkingElevationRequestFailureInfo)initWithReason:(int64_t)a3
{
  VKARWalkingElevationRequestFailureInfo *v4;
  VKARWalkingElevationRequestFailureInfo *v5;
  VKARWalkingElevationRequestFailureInfo *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VKARWalkingElevationRequestFailureInfo;
  v4 = -[VKARWalkingElevationRequestFailureInfo init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_reason = a3;
    v6 = v4;
  }

  return v5;
}

- (int64_t)reason
{
  return self->_reason;
}

@end
