@implementation GeodDebugViewController

+ (id)navigationDestinationTitle
{
  return CFSTR("Debug Table MUID Entries");
}

- (void)prepareContent
{
  id v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1002AC330;
  v4[3] = &unk_1011AEAC8;
  objc_copyWeak(&v5, &location);
  v3 = -[MapsDebugValuesViewController addSectionWithTitle:content:](self, "addSectionWithTitle:content:", CFSTR("MUIDs"), v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheEntries, 0);
}

@end
