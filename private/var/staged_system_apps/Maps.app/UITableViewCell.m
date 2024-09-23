@implementation UITableViewCell

- (void)_maps_setTableViewCellBackgroundConfiguration
{
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1002A91DC;
  v3[3] = &unk_1011AF768;
  objc_copyWeak(&v4, &location);
  -[UITableViewCell _setBackgroundViewConfigurationProvider:](self, "_setBackgroundViewConfigurationProvider:", v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

@end
