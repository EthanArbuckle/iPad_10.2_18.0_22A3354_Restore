@implementation APMetricPurposeRegistry

+ (id)metricRouteForPurpose:(int64_t)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
  v4 = objc_opt_class(APMetricPurposeRegistry);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  objc_sync_enter(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_100269B08, "objectForKey:", v3));
  objc_sync_exit(v5);

  return v6;
}

+ (void)setMetricPurpose:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a3;
  v3 = objc_msgSend(v7, "purpose");
  if (qword_100269B10 != -1)
    dispatch_once(&qword_100269B10, &stru_100215D30);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v3));
  v5 = objc_opt_class(APMetricPurposeRegistry);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  objc_sync_enter(v6);
  objc_msgSend((id)qword_100269B08, "setObject:forKey:", v7, v4);
  objc_sync_exit(v6);

}

@end
