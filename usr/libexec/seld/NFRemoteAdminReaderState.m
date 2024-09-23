@implementation NFRemoteAdminReaderState

- (NFRemoteAdminReaderState)initWithDictionary:(id)a3 sourceURL:(id)a4 originator:(id)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NFRemoteAdminReaderState;
  return -[NFRemoteAdminRedirectState initWithDictionary:sourceURL:originator:initialStep:](&v6, "initWithDictionary:sourceURL:originator:initialStep:", a3, a4, a5, 0);
}

- (id)stateUpdateOnSessionEndedCallback
{
  return objc_retainBlock(self->_stateUpdateOnSessionEndedCallback);
}

- (void)setStateUpdateOnSessionEndedCallback:(id)a3
{
  id v4;
  id stateUpdateOnSessionEndedCallback;

  v4 = objc_msgSend(a3, "copy");
  stateUpdateOnSessionEndedCallback = self->_stateUpdateOnSessionEndedCallback;
  self->_stateUpdateOnSessionEndedCallback = v4;

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NFRemoteAdminReaderState)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NFRemoteAdminReaderState;
  return -[NFRemoteAdminRedirectState initWithCoder:](&v4, "initWithCoder:", a3);
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NFRemoteAdminReaderState;
  -[NFRemoteAdminRedirectState encodeWithCoder:](&v3, "encodeWithCoder:", a3);
}

- (NSDictionary)parameters
{
  return self->_parameters;
}

- (void)setParameters:(id)a3
{
  objc_storeStrong((id *)&self->_parameters, a3);
}

- (NFRemoteAdminCardIngestionRequest)requestInfo
{
  return self->_requestInfo;
}

- (void)setRequestInfo:(id)a3
{
  objc_storeStrong((id *)&self->_requestInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestInfo, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong(&self->_stateUpdateOnSessionEndedCallback, 0);
}

@end
