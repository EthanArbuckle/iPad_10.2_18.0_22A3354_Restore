@implementation MKLocationManager

+ (id)unretainedUGCInstance
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained(&qword_1014D2080);
  if (!WeakRetained)
  {
    WeakRetained = objc_msgSend(objc_alloc((Class)MKLocationManager), "initWithCLLocationManager:", 0);
    objc_msgSend(WeakRetained, "setDesiredAccuracy:", 6380000.0);
    objc_storeWeak(&qword_1014D2080, WeakRetained);
  }
  return WeakRetained;
}

@end
