@implementation CMMotionActivity(RTStateTransition)

- (BOOL)isEqual:()RTStateTransition
{
  id v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  _BOOL8 v10;

  v4 = a3;
  v5 = objc_msgSend(a1, "unknown");
  v10 = 0;
  if (v5 == objc_msgSend(v4, "unknown"))
  {
    v6 = objc_msgSend(a1, "stationary");
    if (v6 == objc_msgSend(v4, "stationary"))
    {
      v7 = objc_msgSend(a1, "walking");
      if (v7 == objc_msgSend(v4, "walking"))
      {
        v8 = objc_msgSend(a1, "running");
        if (v8 == objc_msgSend(v4, "running"))
        {
          v9 = objc_msgSend(a1, "automotive");
          if (v9 == objc_msgSend(v4, "automotive"))
            v10 = 1;
        }
      }
    }
  }

  return v10;
}

@end
