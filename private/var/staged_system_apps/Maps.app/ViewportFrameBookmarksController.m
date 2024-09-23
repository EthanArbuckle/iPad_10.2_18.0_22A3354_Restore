@implementation ViewportFrameBookmarksController

+ (id)navigationDestinationTitle
{
  return CFSTR("Viewport Frames");
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
  v6 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("ViewportBookmarks.json")));
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
  v18[2] = sub_1002809E8;
  v18[3] = &unk_1011AEAC8;
  objc_copyWeak(&v19, &location);
  v14 = -[MapsDebugValuesViewController addSectionWithTitle:content:](self, "addSectionWithTitle:content:", CFSTR("Bookmarks"), v18);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100280E48;
  v16[3] = &unk_1011AEAC8;
  objc_copyWeak(&v17, &location);
  v15 = -[MapsDebugValuesViewController addSectionWithTitle:content:](self, "addSectionWithTitle:content:", &stru_1011EB268, v16);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

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
