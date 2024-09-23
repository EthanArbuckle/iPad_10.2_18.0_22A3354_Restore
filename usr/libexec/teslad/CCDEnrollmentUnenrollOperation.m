@implementation CCDEnrollmentUnenrollOperation

- (id)errorForStatusCode:(int64_t)a3 responseData:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;

  v5 = a4;
  if (a3 == 401)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[CCDError cloudConfigErrorInResponse:](CCDError, "cloudConfigErrorInResponse:", v5));
    v8 = v7;
    if (v7)
      v9 = v7;
    else
      v9 = (id)objc_claimAutoreleasedReturnValue(+[CCDError internalErrorWithCode:](CCDError, "internalErrorWithCode:", 34000));
    v10 = v9;

  }
  else
  {
    if (a3 == 400)
      v6 = objc_claimAutoreleasedReturnValue(+[CCDError cloudConfigErrorInResponse:](CCDError, "cloudConfigErrorInResponse:", v5));
    else
      v6 = objc_claimAutoreleasedReturnValue(+[CCDError teslaServiceDownError](CCDError, "teslaServiceDownError"));
    v10 = (void *)v6;
  }

  return v10;
}

- (id)responseWithResponseData:(id)a3 contentType:(id)a4 outError:(id *)a5
{
  return 0;
}

@end
