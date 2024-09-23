@implementation DMDAssetRemoveOperation

- (void)main
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100024DE0;
  v2[3] = &unk_1000BA528;
  v2[4] = self;
  -[DMDPayloadActionOperation performBackgroundContextBlock:](self, "performBackgroundContextBlock:", v2);
}

- (void)removeOperationDidFinish:(id)a3 asset:(id)a4
{
  id v4;
  _QWORD v5[4];
  DMDAssetRemoveOperation *v6;
  id v7;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10002523C;
  v5[3] = &unk_1000BA578;
  v6 = self;
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "error"));
  v4 = v7;
  -[DMDPayloadActionOperation performBackgroundContextBlock:](v6, "performBackgroundContextBlock:", v5);

}

@end
