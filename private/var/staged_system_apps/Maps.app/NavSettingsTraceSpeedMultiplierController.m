@implementation NavSettingsTraceSpeedMultiplierController

+ (id)navigationDestinationTitle
{
  return CFSTR("Default Speed Multiplier");
}

- (void)prepareContent
{
  id v2;
  _QWORD v3[4];
  _UNKNOWN **v4;

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100C56C9C;
  v3[3] = &unk_1011B4BC0;
  v4 = &off_101274418;
  v2 = -[MapsDebugValuesViewController addSectionWithTitle:content:](self, "addSectionWithTitle:content:", 0, v3);

}

@end
