@implementation UCAppClipCodeEnDecUtility

+ (int64_t)compressionVersionFromPayloadVersion:(int64_t)a3
{
  return (unint64_t)(a3 - 1) < 3;
}

+ (id)prepareURL:(id)a3 withCodingVersion:(int64_t)a4 forCompressionVersion:(int64_t)a5
{
  id v7;
  void *v8;
  id v9;
  void *v10;

  v7 = a3;
  v8 = v7;
  if (a4 == 2 && a5 == 1)
    v9 = (id)objc_msgSend(v7, "padPayloadToV1Length");
  else
    v9 = v7;
  v10 = v9;

  return v10;
}

+ (id)prepareData:(id)a3 withCompressionVersion:(int64_t)a4 forCodingVersion:(int64_t)a5
{
  id v7;
  void *v8;
  id v9;
  void *v10;

  v7 = a3;
  v8 = v7;
  if (a4 == 1 && a5 == 2)
  {
    v9 = (id)objc_msgSend(v7, "transformV1ToV2Encoding");
  }
  else if (a4 == 1 && a5 == 3)
  {
    v9 = (id)objc_msgSend(v7, "transformV1ToV3Encoding");
  }
  else
  {
    v9 = v7;
  }
  v10 = v9;

  return v10;
}

+ (id)perepareData:(id)a3 withCodingVersion:(int64_t)a4 forCompressionVersion:(int64_t)a5
{
  id v7;
  void *v8;
  id v9;
  void *v10;

  v7 = a3;
  v8 = v7;
  if (a4 == 2 && a5 == 1)
  {
    v9 = (id)objc_msgSend(v7, "transformV2ToV1Encoding");
  }
  else if (a4 == 3 && a5 == 1)
  {
    v9 = (id)objc_msgSend(v7, "transformV3ToV1Encoding");
  }
  else
  {
    v9 = v7;
  }
  v10 = v9;

  return v10;
}

+ (id)prepareURL:(id)a3 withCompressionVersion:(int64_t)a4 forCodingVersion:(int64_t)a5
{
  id v7;
  void *v8;
  id v9;
  void *v10;

  v7 = a3;
  v8 = v7;
  if (a4 == 1 && a5 == 2)
    v9 = (id)objc_msgSend(v7, "truncatePayloadToV2Length");
  else
    v9 = v7;
  v10 = v9;

  return v10;
}

@end
