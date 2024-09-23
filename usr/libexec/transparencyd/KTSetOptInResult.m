@implementation KTSetOptInResult

- (id)description
{
  const __CFString *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (-[KTSetOptInResult success](self, "success"))
    v3 = CFSTR("success");
  else
    v3 = CFSTR("fail");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[KTSetOptInResult uri](self, "uri"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTSetOptInResult optInStatus](self, "optInStatus"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[KTSetOptInResult optInDate](self, "optInDate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTSetOptInResult error](self, "error"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<KTSetOptInResult: %@ uri: %@ status: %@ date: %@ error: %@>"), v3, v4, v5, v6, v7));

  return v8;
}

- (BOOL)success
{
  return self->_success;
}

- (void)setSuccess:(BOOL)a3
{
  self->_success = a3;
}

- (NSString)uri
{
  return self->_uri;
}

- (void)setUri:(id)a3
{
  objc_storeStrong((id *)&self->_uri, a3);
}

- (NSNumber)optInStatus
{
  return self->_optInStatus;
}

- (void)setOptInStatus:(id)a3
{
  objc_storeStrong((id *)&self->_optInStatus, a3);
}

- (NSDate)optInDate
{
  return self->_optInDate;
}

- (void)setOptInDate:(id)a3
{
  objc_storeStrong((id *)&self->_optInDate, a3);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_optInDate, 0);
  objc_storeStrong((id *)&self->_optInStatus, 0);
  objc_storeStrong((id *)&self->_uri, 0);
}

@end
