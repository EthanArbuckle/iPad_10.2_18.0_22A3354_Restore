@implementation WiFiDriverTriggeredTTR

+ (id)sharedWiFiDriverTriggeredTTRManagerwithStringRef:(__CFString *)a3 withInterval:(double)a4
{
  _QWORD v5[6];

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100154084;
  v5[3] = &unk_10022EF88;
  v5[4] = a3;
  *(double *)&v5[5] = a4;
  if (qword_10026DBB0 != -1)
    dispatch_once(&qword_10026DBB0, v5);
  return (id)qword_10026DBA8;
}

- (WiFiDriverTriggeredTTR)initWithWiFiManagerwithStringRef:(__CFString *)a3 withInterval:(double)a4
{
  WiFiDriverTriggeredTTR *v6;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WiFiDriverTriggeredTTR;
  v6 = -[WiFiDriverTriggeredTTR init](&v9, "init");
  if (v6)
  {
    -[WiFiDriverTriggeredTTR set_lastTriggeredTTR:](v6, "set_lastTriggeredTTR:", +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    if (-[WiFiDriverTriggeredTTR _lastTriggeredTTR](v6, "_lastTriggeredTTR"))
    {
      -[WiFiDriverTriggeredTTR set_softError:](v6, "set_softError:", -[WiFiDriverTriggeredTTR WiFiDriverTriggeredTTRSoftErrorCreatewithStringRef:withInterval:](v6, "WiFiDriverTriggeredTTRSoftErrorCreatewithStringRef:withInterval:", a3, a4));
      if (-[WiFiDriverTriggeredTTR _softError](v6, "_softError"))
        return v6;
      v8 = objc_autoreleasePoolPush();
      if (qword_10026DD20)
        objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: Unable to create softError object\n", "-[WiFiDriverTriggeredTTR initWithWiFiManagerwithStringRef:withInterval:]");
    }
    else
    {
      v8 = objc_autoreleasePoolPush();
      if (qword_10026DD20)
        objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: null self._lastTriggeredTTR", "-[WiFiDriverTriggeredTTR initWithWiFiManagerwithStringRef:withInterval:]");
    }
    objc_autoreleasePoolPop(v8);
    return 0;
  }
  return v6;
}

- (id)WiFiDriverTriggeredTTRSoftErrorCreatewithStringRef:(__CFString *)a3 withInterval:(double)a4
{
  _QWORD v7[3];
  _QWORD v8[3];

  if (!MGGetBoolAnswer(CFSTR("InternalBuild")))
    return 0;
  if (a4 < 0.0)
    a4 = 86400.0;
  v7[0] = CFSTR("maxUIActions");
  v8[0] = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 5);
  v7[1] = CFSTR("intervalForMaxUIActions");
  v8[1] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a4);
  v7[2] = CFSTR("maxOccurrences");
  v8[2] = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 100);
  return objc_msgSend(objc_alloc((Class)WiFiSoftError), "initWithName:andParams:", a3, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v8, v7, 3));
}

- (BOOL)WiFiDriverTriggeredTTRHandler:(id)a3
{
  id v5;
  unsigned int v6;
  id v7;
  id v8;
  double v9;
  void *v10;

  v5 = objc_msgSend(a3, "objectForKey:", CFSTR("DRIVER_TTR_Reason"));
  if (!v5
    || (v6 = objc_msgSend(v5, "intValue"),
        v7 = objc_msgSend(a3, "objectForKey:", CFSTR("DRIVER_TTR_Reason_String")),
        v6 == -1))
  {
    v10 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: Unknown TTR request\n", "-[WiFiDriverTriggeredTTR WiFiDriverTriggeredTTRHandler:]");
    objc_autoreleasePoolPop(v10);
  }
  else
  {
    v8 = v7;
    if (!-[NSMutableDictionary objectForKey:](-[WiFiDriverTriggeredTTR _lastTriggeredTTR](self, "_lastTriggeredTTR"), "objectForKey:", v7))return -[WiFiDriverTriggeredTTR WiFiDriverTriggeredTTRForReason:](self, "WiFiDriverTriggeredTTRForReason:", v8);
    objc_msgSend(-[NSMutableDictionary objectForKey:](-[WiFiDriverTriggeredTTR _lastTriggeredTTR](self, "_lastTriggeredTTR"), "objectForKey:", v8), "timeIntervalSinceNow");
    if (v9 < -86400.0)
      return -[WiFiDriverTriggeredTTR WiFiDriverTriggeredTTRForReason:](self, "WiFiDriverTriggeredTTRForReason:", v8);
  }
  return 0;
}

- (BOOL)WiFiDriverTriggeredTTRForReason:(id)a3
{
  uint64_t *v3;
  id v6;
  void *v7;
  char v8;
  _QWORD v10[5];
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v3 = &v12;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  if (a3)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1001545D4;
    v11[3] = &unk_100232690;
    v11[4] = &v12;
    if ((-[WiFiSoftError askToLaunchTapToRadarWithMessage:completionHandler:](-[WiFiDriverTriggeredTTR _softError](self, "_softError"), "askToLaunchTapToRadarWithMessage:completionHandler:", a3, v11) & 1) != 0)
    {
      -[NSMutableDictionary setObject:forKey:](-[WiFiDriverTriggeredTTR _lastTriggeredTTR](self, "_lastTriggeredTTR"), "setObject:forKey:", +[NSDate date](NSDate, "date"), a3);
      v6 = objc_msgSend(a3, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), CFSTR("%20"));
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_100154684;
      v10[3] = &unk_100232690;
      v10[4] = &v12;
      -[WiFiSoftError tapToRadarWithURL:completionHandler:](-[WiFiDriverTriggeredTTR _softError](self, "_softError"), "tapToRadarWithURL:completionHandler:", +[NSURL URLWithString:](NSURL, "URLWithString:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@%@%@%@%@%@"), CFSTR("tap-to-radar://new?Title="), v6, CFSTR("&AutoDiagnostics=phone&Description="), v6, CFSTR("%20Attaching%20coredumps&ComponentID="), CFSTR("ComponentID=621547&ComponentName=WiFi%20Connectivity&ComponentVersion=iOS"), CFSTR("&Classification=Crash/Hang/Data%20Loss&ExtensionIdentifiers=com.apple.DiagnosticExtensions.WiFi"))), v10);
    }
    else
    {
      v7 = objc_autoreleasePoolPush();
      if (qword_10026DD20)
        objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s _WiFiDriverTriggeredTTRHandler User Dismissed TTR", "-[WiFiDriverTriggeredTTR WiFiDriverTriggeredTTRForReason:]");
      objc_autoreleasePoolPop(v7);
    }
    v3 = v13;
  }
  v8 = *((_BYTE *)v3 + 24);
  _Block_object_dispose(&v12, 8);
  return v8;
}

- (WiFiSoftError)_softError
{
  return (WiFiSoftError *)objc_getProperty(self, a2, 8, 1);
}

- (void)set_softError:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSMutableDictionary)_lastTriggeredTTR
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)set_lastTriggeredTTR:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

@end
