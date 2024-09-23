@implementation FCVanityURLRedirectService

- (id)backgroundFetchWithAppConfiguration:(id)a3 completionHandler:(id)a4
{
  id v5;
  _QWORD v7[4];
  id v8;

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10003BA3C;
  v7[3] = &unk_1000DAF28;
  v8 = a4;
  v5 = v8;
  -[FCVanityURLRedirectService updateUnderlyingMappingWithQualityOfService:completion:](self, "updateUnderlyingMappingWithQualityOfService:completion:", 9, v7);

  return 0;
}

@end
