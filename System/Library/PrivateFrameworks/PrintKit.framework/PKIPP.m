@implementation PKIPP

+ (id)responseFromRequest:(id)a3
{
  id v3;
  PK_ipp_response_t *v4;

  v3 = a3;
  v4 = -[PK_ipp_response_t initWithRequest:]([PK_ipp_response_t alloc], "initWithRequest:", v3);

  return v4;
}

+ (id)requestFromData:(id)a3
{
  id v3;
  PK_ipp_request_t *v4;

  v3 = a3;
  v4 = -[PK_ipp_t initWithData:]([PK_ipp_request_t alloc], "initWithData:", v3);

  return v4;
}

+ (id)responseFromData:(id)a3
{
  id v3;
  PK_ipp_response_t *v4;

  v3 = a3;
  v4 = -[PK_ipp_t initWithData:]([PK_ipp_response_t alloc], "initWithData:", v3);

  return v4;
}

+ (id)makeEmptyResponse
{
  return objc_alloc_init(PK_ipp_response_t);
}

@end
