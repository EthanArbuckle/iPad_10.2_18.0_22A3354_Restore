@implementation BKAudiobookPreviewPresentingViewController

- (void)assetViewControllerRequestToBuy:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  id v15;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController sampleProfileFuture](self, "sampleProfileFuture"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000C922C;
  v12[3] = &unk_1008E9F48;
  v12[4] = self;
  objc_copyWeak(&v15, &location);
  v9 = v6;
  v13 = v9;
  v10 = v7;
  v14 = v10;
  objc_msgSend(v8, "get:", v12);

  v11 = -[BKBasePresentingViewController _fetchSampleProfileFuture](self, "_fetchSampleProfileFuture");
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

- (void)_recordMetricsForBuyButtonTap:(BOOL)a3 actionDetails:(id)a4 offerType:(id)a5
{
  _BOOL4 v6;
  id v8;
  NSMutableDictionary *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  id v13;

  v6 = a3;
  v13 = a4;
  v8 = a5;
  v9 = objc_opt_new(NSMutableDictionary);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", JSARecordEventTypeClick, JSARecordKeyEventType);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", CFSTR("AudiobookPreview"), JSARecordKeyActionContext);
  if (v6)
    v10 = CFSTR("buy");
  else
    v10 = CFSTR("buyInitiate");
  -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v10, JSARecordKeyActionType);
  if (v13)
    -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v13, JSARecordKeyActionDetails);
  if (v8)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "description"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v11, JSARecordKeyOfferType);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController assetPresenterAssetID](self, "assetPresenterAssetID"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v12, JSARecordKeyTargetId);

  -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", JSARecordTargetTypeButton, JSARecordKeyTargetType);
  +[JSAApplication recordNativeEvent:](JSAApplication, "recordNativeEvent:", v9);

}

@end
