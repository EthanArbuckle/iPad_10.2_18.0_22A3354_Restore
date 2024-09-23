@implementation PLLocalVideoKeyFrameVideoChoosingOptions

- (PLLocalVideoKeyFrameVideoChoosingOptions)initWithStreamingAllowed:(BOOL)a3
{
  PLLocalVideoKeyFrameVideoChoosingOptions *result;

  result = -[PLLocalVideoKeyFrameVideoChoosingOptions init](self, "init");
  if (result)
    result->_streamingAllowed = a3;
  return result;
}

- (BOOL)isMediumHighQualityAllowed
{
  return 0;
}

- (BOOL)isNetworkAccessAllowed
{
  return self->_streamingAllowed;
}

- (BOOL)isStreamingAllowed
{
  return self->_streamingAllowed;
}

- (BOOL)restrictToPlayableOnCurrentDevice
{
  return 1;
}

- (BOOL)restrictToStreamable
{
  return 0;
}

- (int64_t)videoDeliveryMode
{
  return 1;
}

- (int64_t)videoVersion
{
  return 0;
}

- (BOOL)hasValidTimeRange
{
  return 0;
}

- (BOOL)isExplicitUserAction
{
  return 0;
}

@end
