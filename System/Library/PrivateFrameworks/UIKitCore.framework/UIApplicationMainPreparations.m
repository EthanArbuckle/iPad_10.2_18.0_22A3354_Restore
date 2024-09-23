@implementation UIApplicationMainPreparations

id ___UIApplicationMainPreparations_block_invoke()
{
  id v0;
  id v1;
  id v2;
  tm v4;
  timeval v5;

  v0 = _UIKitPreferencesOnce();
  v1 = (id)objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
  v2 = (id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v5.tv_sec = 0;
  *(_QWORD *)&v5.tv_usec = 0;
  memset(&v4, 0, sizeof(v4));
  gettimeofday(&v5, 0);
  localtime_r(&v5.tv_sec, &v4);
  _UIApplicationStartLaunchBackgroundTask();
  return +[FBSSceneSpecification specification](_UISceneHostingSceneSpecification, "specification", *(_OWORD *)&v4.tm_sec, *(_OWORD *)&v4.tm_mon, *(_OWORD *)&v4.tm_isdst, v4.tm_zone);
}

@end
