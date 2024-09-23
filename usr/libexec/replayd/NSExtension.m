@implementation NSExtension

+ (void)extensionsWithMatchingPointName:(id)a3 baseIdentifier:(id)a4 activationRule:(id)a5 unwantedActivationRule:(id)a6 completion:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  id v31;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  v15 = a3;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v30 = NSExtensionPointName;
  v31 = v15;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1));
  v18 = objc_msgSend(v17, "mutableCopy");

  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100019D3C;
  v24[3] = &unk_1000815D0;
  v25 = v11;
  v26 = v12;
  v27 = v13;
  v28 = v16;
  v29 = v14;
  v19 = v14;
  v20 = v16;
  v21 = v13;
  v22 = v12;
  v23 = v11;
  +[NSExtension extensionsWithMatchingAttributes:completion:](NSExtension, "extensionsWithMatchingAttributes:completion:", v18, v24);

}

+ (void)extensionsWithMatchingPointName:(id)a3 baseIdentifier:(id)a4 completion:(id)a5
{
  +[NSExtension extensionsWithMatchingPointName:baseIdentifier:activationRule:unwantedActivationRule:completion:](NSExtension, "extensionsWithMatchingPointName:baseIdentifier:activationRule:unwantedActivationRule:completion:", a3, a4, 0, 0, a5);
}

+ (void)extensionsWithMatchingPointName:(id)a3 baseIdentifier:(id)a4 unwantedActivationRule:(id)a5 completion:(id)a6
{
  +[NSExtension extensionsWithMatchingPointName:baseIdentifier:activationRule:unwantedActivationRule:completion:](NSExtension, "extensionsWithMatchingPointName:baseIdentifier:activationRule:unwantedActivationRule:completion:", a3, a4, 0, a5, a6);
}

+ (void)extensionsWithMatchingPointName:(id)a3 activationRule:(id)a4 completion:(id)a5
{
  +[NSExtension extensionsWithMatchingPointName:baseIdentifier:activationRule:unwantedActivationRule:completion:](NSExtension, "extensionsWithMatchingPointName:baseIdentifier:activationRule:unwantedActivationRule:completion:", a3, 0, a4, 0, a5);
}

+ (void)extensionsWithMatchingPointName:(id)a3 unwantedActivationRule:(id)a4 completion:(id)a5
{
  +[NSExtension extensionsWithMatchingPointName:baseIdentifier:activationRule:unwantedActivationRule:completion:](NSExtension, "extensionsWithMatchingPointName:baseIdentifier:activationRule:unwantedActivationRule:completion:", a3, 0, 0, a4, a5);
}

+ (void)extensionsWithMatchingPointName:(id)a3 completion:(id)a4
{
  +[NSExtension extensionsWithMatchingPointName:baseIdentifier:activationRule:unwantedActivationRule:completion:](NSExtension, "extensionsWithMatchingPointName:baseIdentifier:activationRule:unwantedActivationRule:completion:", a3, 0, 0, 0, a4);
}

- (int64_t)processMode
{
  void *v2;
  void *v3;
  void *v4;
  int64_t v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSExtension infoDictionary](self, "infoDictionary"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("NSExtension")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("RPBroadcastProcessMode")));

  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("RPBroadcastProcessModeSampleBuffer"));
  return v5;
}

@end
