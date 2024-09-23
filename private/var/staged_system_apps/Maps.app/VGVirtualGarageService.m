@implementation VGVirtualGarageService

- (void)getEvChargingMetadata:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[VGVirtualGarageService sharedService](VGVirtualGarageService, "sharedService"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1008AE8E0;
  v6[3] = &unk_1011DA5A8;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "virtualGarageGetGarageWithReply:", v6);

}

@end
