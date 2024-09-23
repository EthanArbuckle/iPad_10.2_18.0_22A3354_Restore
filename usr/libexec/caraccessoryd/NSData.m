@implementation NSData

+ (id)CAF_encodeCarDataFrom:(id)a3 error:(id *)a4
{
  void *v5;
  int v7;

  if (a3)
  {
    v7 = 0;
    v5 = (void *)OPACKEncoderCreateData(a3, 0, &v7);
    if (v7)
      *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSOSStatusErrorDomain));
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)CAF_decodeCarData:(id *)a3
{
  void *v4;
  int v6;

  v6 = 0;
  v4 = (void *)OPACKDecodeData(self, 0, &v6);
  if (v6)
    *a3 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSOSStatusErrorDomain));
  return v4;
}

@end
