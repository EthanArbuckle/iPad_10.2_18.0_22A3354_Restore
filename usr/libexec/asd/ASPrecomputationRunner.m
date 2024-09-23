@implementation ASPrecomputationRunner

- (void)runPrecomputationWithProfile:(id)a3 profileInfo:(id)a4 bindings:(id)a5 externalDataArray:(id)a6 nonce:(id)a7 completion:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  _QWORD v21[4];
  id v22;

  v13 = a8;
  v14 = a7;
  v15 = a6;
  v16 = a5;
  v17 = a4;
  v18 = a3;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[pNjRsniwrVEhiG7R sharedInstance](pNjRsniwrVEhiG7R, "sharedInstance"));
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100012CD8;
  v21[3] = &unk_1004CEA30;
  v22 = v13;
  v20 = v13;
  objc_msgSend(v19, "zGi22DPZsVGfawap:xz5EHXEN4FjlhJbi:uhVTXyAfCFn7u0Ue:EQUjQp7JcQbqcPcD:A5wDLa5TFdFZlz3A:TJKMyOe6zn5PdGIr:eCqgGM0WcnHOslnr:eCszfxdv3kUXvhgV:uWp4aZpP2vLhc04Q:QZYtNpvp0hKd248p:oCwPYmtRv8s31KUH:completion:", v18, v17, v16, v15, 0, v14, 0, 24, 0, 0, 0, v21);

}

@end
