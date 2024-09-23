@implementation SUIBSiriResponseMutation

- (SUIBSiriInAppResponse)inAppResponse
{
  return self->_inAppResponse;
}

- (void)setInAppResponse:(id)a3
{
  objc_storeStrong((id *)&self->_inAppResponse, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inAppResponse, 0);
}

@end
