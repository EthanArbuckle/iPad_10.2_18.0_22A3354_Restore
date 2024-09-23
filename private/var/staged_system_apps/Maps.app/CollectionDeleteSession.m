@implementation CollectionDeleteSession

- (void)applyToCollection:(id)a3 completion:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionEditSession collection](self, "collection"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionEditSession selectedObjectSet](self, "selectedObjectSet"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10098F7B4;
  v9[3] = &unk_1011B7758;
  v9[4] = self;
  v10 = v5;
  v8 = v5;
  objc_msgSend(v6, "removeObjects:completion:", v7, v9);

}

@end
