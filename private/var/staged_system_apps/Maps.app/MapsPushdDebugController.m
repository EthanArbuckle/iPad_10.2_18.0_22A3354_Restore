@implementation MapsPushdDebugController

+ (id)navigationDestinationTitle
{
  return CFSTR("MapsPushd");
}

+ (void)performAfterDelay:(double)a3 action:(id)a4
{
  id v5;
  void *v6;
  id v7;
  dispatch_time_t v8;
  id v9;
  _QWORD block[4];
  id v11;
  uint64_t *v12;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v5 = a4;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10077D9B4;
  v13[3] = &unk_1011AFF60;
  v13[4] = &v14;
  v7 = objc_msgSend(v6, "beginBackgroundTaskWithExpirationHandler:", v13);

  v15[3] = (uint64_t)v7;
  v8 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10077DA1C;
  block[3] = &unk_1011AE540;
  v11 = v5;
  v12 = &v14;
  v9 = v5;
  dispatch_after(v8, (dispatch_queue_t)&_dispatch_main_q, block);

  _Block_object_dispose(&v14, 8);
}

- (void)prepareContent
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Notifications (%.0fs delay)"), 0x4014000000000000));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10077DC0C;
  v15[3] = &unk_1011C62F0;
  v15[4] = 0x4014000000000000;
  v4 = -[MapsDebugValuesViewController addSectionWithTitle:content:](self, "addSectionWithTitle:content:", v3, v15);

  v5 = -[MapsDebugValuesViewController addSectionWithTitle:content:](self, "addSectionWithTitle:content:", CFSTR("Announcements"), &stru_1011C6310);
  v6 = -[MapsDebugValuesViewController addSectionWithTitle:content:](self, "addSectionWithTitle:content:", CFSTR("Airport Arrival Notification"), &stru_1011C6370);
  v7 = objc_alloc((Class)NSFileManager);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "containerURLForSecurityApplicationGroupIdentifier:", CFSTR("group.com.apple.Maps")));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "URLByAppendingPathComponent:", CFSTR("Library/Caches/Announcements.pbd")));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "path"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10077E000;
  v13[3] = &unk_1011B4BC0;
  v14 = v9;
  v11 = v9;
  v12 = -[MapsDebugValuesViewController addSectionWithTitle:content:](self, "addSectionWithTitle:content:", v10, v13);

}

@end
