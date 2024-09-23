@implementation BKBookSampleHelper

+ (id)defaultHelper
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100114590;
  block[3] = &unk_1008E7458;
  block[4] = a1;
  if (qword_1009F4FF8 != -1)
    dispatch_once(&qword_1009F4FF8, block);
  return (id)qword_1009F4FF0;
}

- (void)downloadSampleWithURL:(id)a3 contentData:(id)a4 tracker:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id v26;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[JSABridge sharedInstance](JSABridge, "sharedInstance"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "windowManager"));

  v15 = objc_alloc((Class)BLDownloadManifestRequest);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLRequest requestWithURL:](NSURLRequest, "requestWithURL:", v9));
  v17 = objc_msgSend(v15, "initWithURLRequest:", v16);

  kdebug_trace(725354664, 0, 0, 0, 0);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100114750;
  v22[3] = &unk_1008EB2A8;
  v23 = v9;
  v24 = v11;
  v25 = v10;
  v26 = v12;
  v18 = v10;
  v19 = v11;
  v20 = v12;
  v21 = v9;
  objc_msgSend(v17, "startWithUIManager:manifestResponseBlock:", v14, v22);
  kdebug_trace(725354668, 0, 0, 0, 0);

}

@end
