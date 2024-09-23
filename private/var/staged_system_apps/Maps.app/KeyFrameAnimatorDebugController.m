@implementation KeyFrameAnimatorDebugController

+ (id)navigationDestinationTitle
{
  return CFSTR("Key Frame Animator");
}

- (void)prepareContent
{
  NSArray *v3;
  void *v4;
  void *v5;
  NSString *v6;
  NSString *filePath;
  void *v8;
  NSMutableArray *v9;
  id v10;
  NSMutableArray *items;
  NSMutableArray *v12;
  NSMutableArray *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  id location;
  id v21;

  v3 = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, 1uLL, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndex:", 0));
  v6 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("KeyFrameList.json")));
  filePath = self->_filePath;
  self->_filePath = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](NSData, "dataWithContentsOfFile:", self->_filePath));
  if (v8)
  {
    v21 = 0;
    v9 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization JSONObjectWithData:options:error:](NSJSONSerialization, "JSONObjectWithData:options:error:", v8, 1, &v21));
    v10 = v21;
    items = self->_items;
    self->_items = v9;

  }
  if (!self->_items)
  {
    v12 = objc_opt_new(NSMutableArray);
    v13 = self->_items;
    self->_items = v12;

  }
  objc_initWeak(&location, self);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1009D95EC;
  v18[3] = &unk_1011AEAC8;
  objc_copyWeak(&v19, &location);
  v14 = -[MapsDebugValuesViewController addSectionWithTitle:content:](self, "addSectionWithTitle:content:", CFSTR("Bookmarks"), v18);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1009D9878;
  v16[3] = &unk_1011AEAC8;
  objc_copyWeak(&v17, &location);
  v15 = -[MapsDebugValuesViewController addSectionWithTitle:content:](self, "addSectionWithTitle:content:", &stru_1011EB268, v16);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

}

- (void)_animationToIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  _QWORD v31[4];
  id v32[2];
  _QWORD v33[4];
  id v34;
  id v35;
  id location;

  if ((unint64_t)-[NSMutableArray count](self->_items, "count") > a3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_items, "objectAtIndex:", a3));
    v6 = v5;
    if (v5)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("latitude")));
      objc_msgSend(v7, "doubleValue");
      v9 = v8;

      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("longitude")));
      objc_msgSend(v10, "doubleValue");
      v12 = v11;

      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("heading")));
      objc_msgSend(v13, "doubleValue");
      v15 = v14;

      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("pitch")));
      objc_msgSend(v16, "doubleValue");
      v18 = v17;

      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("zoom")));
      objc_msgSend(v19, "doubleValue");
      v21 = v20;

      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("animationDuration")));
      objc_msgSend(v22, "doubleValue");
      v24 = v23;

      v25 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugValuesViewController delegate](self, "delegate"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "allVisibleMapViewsForDebugController:", self));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "firstObject"));

      v28 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapCamera cameraLookingAtCenterCoordinate:fromDistance:pitch:heading:](MKMapCamera, "cameraLookingAtCenterCoordinate:fromDistance:pitch:heading:", v9, v12, v21, v18, v15));
      objc_initWeak(&location, self);
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472;
      v33[2] = sub_1009DA39C;
      v33[3] = &unk_1011AC8B0;
      v29 = v27;
      v34 = v29;
      v30 = v28;
      v35 = v30;
      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472;
      v31[2] = sub_1009DA3A8;
      v31[3] = &unk_1011B1C70;
      objc_copyWeak(v32, &location);
      v32[1] = (id)a3;
      +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v33, v31, v24);
      objc_destroyWeak(v32);

      objc_destroyWeak(&location);
    }

  }
}

- (void)saveFileAndReload
{
  id v3;
  NSMutableArray *items;
  id v5;
  void *v6;
  id v7;

  v3 = objc_msgSend(objc_alloc((Class)NSOutputStream), "initToFileAtPath:append:", self->_filePath, 0);
  objc_msgSend(v3, "open");
  items = self->_items;
  v7 = 0;
  +[NSJSONSerialization writeJSONObject:toStream:options:error:](NSJSONSerialization, "writeJSONObject:toStream:options:error:", items, v3, 0, &v7);
  v5 = v7;
  objc_msgSend(v3, "close");
  if (!v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", self->_filePath));
    objc_msgSend(v6, "setResourceValue:forKey:error:", &__kCFBooleanTrue, NSURLIsExcludedFromBackupKey, 0);
    -[MapsDebugValuesViewController rebuildSections](self, "rebuildSections");

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filePath, 0);
  objc_storeStrong((id *)&self->_items, 0);
}

@end
