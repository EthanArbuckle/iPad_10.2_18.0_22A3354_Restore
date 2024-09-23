@implementation WiFiUserNotificationHistory

- (WiFiUserNotificationHistory)init
{
  WiFiUserNotificationHistory *v2;
  NSMutableDictionary *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WiFiUserNotificationHistory;
  v2 = -[WiFiUserNotificationHistory init](&v5, "init");
  v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  v2->_maxSystemCancellationAttempts = 2;
  v2->_notifications = v3;
  v2->_recommendationDistanceThreshold = 4000.0;
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WiFiUserNotificationHistory;
  -[WiFiUserNotificationHistory dealloc](&v3, "dealloc");
}

- (void)presentedNotificationForSSID:(id)a3 type:(int)a4 currentLocation:(id)a5
{
  id v8;
  NSDate *v9;
  void *v10;
  id v11;

  if (-[NSMutableDictionary objectForKey:](-[WiFiUserNotificationHistory notifications](self, "notifications", a3, *(_QWORD *)&a4), "objectForKey:", a3))
  {
    v8 = objc_msgSend(-[NSMutableDictionary objectForKey:](-[WiFiUserNotificationHistory notifications](self, "notifications"), "objectForKey:", a3), "mutableCopy");
  }
  else
  {
    v8 = objc_alloc_init((Class)NSMutableDictionary);
  }
  v11 = v8;
  if (a5)
    objc_msgSend(v8, "setObject:forKey:", a5, CFSTR("location"));
  v9 = +[NSDate date](NSDate, "date");
  if (v9)
    objc_msgSend(v11, "setObject:forKey:", v9, CFSTR("date"));
  -[NSMutableDictionary setObject:forKey:](-[WiFiUserNotificationHistory notifications](self, "notifications"), "setObject:forKey:", v11, a3);
  v10 = objc_autoreleasePoolPush();
  if (qword_10026DD20)
    objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: notification info %@", "-[WiFiUserNotificationHistory presentedNotificationForSSID:type:currentLocation:]", -[WiFiUserNotificationHistory notifications](self, "notifications"));
  objc_autoreleasePoolPop(v10);

}

- (void)handleNotificationResponseForSSID:(id)a3 type:(int)a4 response:(int)a5
{
  uint64_t v5;
  id v8;
  id v9;
  id v10;
  NSNumber *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  if (!a3)
  {
    v12 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 4, "%s: nil ssid", "-[WiFiUserNotificationHistory handleNotificationResponseForSSID:type:response:]");
    v13 = v12;
    goto LABEL_11;
  }
  v5 = *(_QWORD *)&a5;
  -[WiFiUserNotificationHistory setLastRecommendedSSID:](self, "setLastRecommendedSSID:", a3, *(_QWORD *)&a4);
  v8 = -[NSMutableDictionary objectForKey:](-[WiFiUserNotificationHistory notifications](self, "notifications"), "objectForKey:", a3);
  if (!v8)
  {
    v14 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 4, "%s: unable to find notification info for ssid %@", "-[WiFiUserNotificationHistory handleNotificationResponseForSSID:type:response:]", a3);
    v13 = v14;
LABEL_11:
    objc_autoreleasePoolPop(v13);
    return;
  }
  v9 = objc_msgSend(v8, "mutableCopy");
  objc_msgSend(v9, "setObject:forKey:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v5), CFSTR("response"));
  v10 = objc_msgSend(v9, "objectForKey:", CFSTR("attempt"));
  if (v10)
    v11 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)objc_msgSend(v10, "integerValue") + 1);
  else
    v11 = (NSNumber *)&off_100252D50;
  objc_msgSend(v9, "setObject:forKey:", v11, CFSTR("attempt"));
  -[NSMutableDictionary removeObjectForKey:](-[WiFiUserNotificationHistory notifications](self, "notifications"), "removeObjectForKey:", a3);
  -[NSMutableDictionary setObject:forKey:](-[WiFiUserNotificationHistory notifications](self, "notifications"), "setObject:forKey:", v9, a3);
  v15 = objc_autoreleasePoolPush();
  if (qword_10026DD20)
    objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: updating notification info %@", "-[WiFiUserNotificationHistory handleNotificationResponseForSSID:type:response:]", v9);
  objc_autoreleasePoolPop(v15);
  if (v9)
    CFRelease(v9);
}

- (int)canPresentRecommendationForSSID:(id)a3 currentLocation:(id)a4
{
  unsigned int v7;
  id v8;
  _BOOL4 v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  id v14;
  id v15;
  int v16;
  id v17;
  double v18;
  double v19;
  void *v20;
  uint64_t v22;

  if (!-[WiFiUserNotificationHistory lastRecommendedSSID](self, "lastRecommendedSSID")
    || !-[NSMutableDictionary count](-[WiFiUserNotificationHistory notifications](self, "notifications"), "count"))
  {
    return 0;
  }
  if (!a3)
  {
    v10 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 4, "%s: nil ssid", "-[WiFiUserNotificationHistory canPresentRecommendationForSSID:currentLocation:]", v22);
    goto LABEL_26;
  }
  v7 = -[NSString isEqualToString:](-[WiFiUserNotificationHistory lastRecommendedSSID](self, "lastRecommendedSSID"), "isEqualToString:", a3);
  v8 = -[NSMutableDictionary objectForKey:](-[WiFiUserNotificationHistory notifications](self, "notifications"), "objectForKey:", -[WiFiUserNotificationHistory lastRecommendedSSID](self, "lastRecommendedSSID"));
  if (objc_msgSend(v8, "objectForKey:", CFSTR("response")))
    v9 = objc_msgSend(objc_msgSend(v8, "objectForKey:", CFSTR("response")), "integerValue") == (id)5;
  else
    v9 = 0;
  objc_msgSend(objc_msgSend(v8, "objectForKey:", CFSTR("date")), "timeIntervalSinceNow");
  v12 = v11;
  v13 = objc_autoreleasePoolPush();
  if (qword_10026DD20)
    objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: ssid: %@ lastRecommendedSSID: %@ lastResponseWasSystemCancelled: %d lessThan24Hours: %d", "-[WiFiUserNotificationHistory canPresentRecommendationForSSID:currentLocation:]", a3, -[WiFiUserNotificationHistory lastRecommendedSSID](self, "lastRecommendedSSID", -86400.0), v9, v12 >= -86400.0);
  objc_autoreleasePoolPop(v13);
  v14 = objc_msgSend(v8, "objectForKey:", CFSTR("attempt"));
  if (!v14 || ((v7 ^ 1) & 1) != 0 || !v9)
  {
    v17 = objc_msgSend(v8, "objectForKey:", CFSTR("location"));
    if (v17)
    {
      if (a4)
      {
        objc_msgSend(a4, "distanceFromLocation:", v17);
        v19 = v18;
        if (v18 <= 4000.0 && v12 >= -86400.0)
        {
          v10 = objc_autoreleasePoolPush();
          v16 = 3;
          if (qword_10026DD20)
            objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: suppressing notification, is at less than %.2fm since last recommendation (diff=%.2fm)", "-[WiFiUserNotificationHistory canPresentRecommendationForSSID:currentLocation:]", 0x40AF400000000000, *(_QWORD *)&v19);
          goto LABEL_27;
        }
        goto LABEL_34;
      }
      v20 = objc_autoreleasePoolPush();
      if (qword_10026DD20)
        objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: no current location available", "-[WiFiUserNotificationHistory canPresentRecommendationForSSID:currentLocation:]");
    }
    else
    {
      v20 = objc_autoreleasePoolPush();
      if (qword_10026DD20)
        objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: no location available from last recommendation", "-[WiFiUserNotificationHistory canPresentRecommendationForSSID:currentLocation:]");
    }
    objc_autoreleasePoolPop(v20);
LABEL_34:
    if (v12 >= -86400.0)
    {
      v10 = objc_autoreleasePoolPush();
      if (qword_10026DD20)
        objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: supressing notification, has been less than a day since last notification and we have no location", "-[WiFiUserNotificationHistory canPresentRecommendationForSSID:currentLocation:]");
      v16 = 4;
      goto LABEL_27;
    }
    return 0;
  }
  v15 = objc_msgSend(v14, "unsignedIntegerValue");
  v10 = objc_autoreleasePoolPush();
  if ((unint64_t)v15 >= 2)
  {
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: hit max attempts for system cancelled for ssid %@", "-[WiFiUserNotificationHistory canPresentRecommendationForSSID:currentLocation:]", a3);
    v16 = 2;
    goto LABEL_27;
  }
  if (qword_10026DD20)
    objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: allowing a re-prompting due to last response was system cancelled (total attempts: %lu)", "-[WiFiUserNotificationHistory canPresentRecommendationForSSID:currentLocation:]", v15);
LABEL_26:
  v16 = 0;
LABEL_27:
  objc_autoreleasePoolPop(v10);
  return v16;
}

- (void)resetAttemptsForSSID:(id)a3
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v5 = objc_autoreleasePoolPush();
  if (qword_10026DD20)
    objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: resetting attempts for ssid %@", "-[WiFiUserNotificationHistory resetAttemptsForSSID:]", a3);
  objc_autoreleasePoolPop(v5);
  v6 = -[NSMutableDictionary objectForKey:](-[WiFiUserNotificationHistory notifications](self, "notifications"), "objectForKey:", a3);
  if (v6)
  {
    v10 = objc_msgSend(v6, "mutableCopy");
    objc_msgSend(v10, "removeObjectForKey:", CFSTR("attempt"));
    -[NSMutableDictionary setObject:forKey:](-[WiFiUserNotificationHistory notifications](self, "notifications"), "setObject:forKey:", v10, a3);
    v7 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: history for %@: %@", "-[WiFiUserNotificationHistory resetAttemptsForSSID:]", v10, a3);
    objc_autoreleasePoolPop(v7);

  }
  else
  {
    v8 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: no history found for ssid %@", "-[WiFiUserNotificationHistory resetAttemptsForSSID:]", a3);
    objc_autoreleasePoolPop(v8);
    v9 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: history %@", "-[WiFiUserNotificationHistory resetAttemptsForSSID:]", -[WiFiUserNotificationHistory notifications](self, "notifications"));
    objc_autoreleasePoolPop(v9);
  }
}

- (void)reset
{
  void *v3;

  v3 = objc_autoreleasePoolPush();
  if (qword_10026DD20)
    objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: reseting state for notifications: %@", "-[WiFiUserNotificationHistory reset]", -[WiFiUserNotificationHistory notifications](self, "notifications"));
  objc_autoreleasePoolPop(v3);
  -[NSMutableDictionary removeAllObjects](-[WiFiUserNotificationHistory notifications](self, "notifications"), "removeAllObjects");
}

- (double)recommendationDistanceThreshold
{
  return self->_recommendationDistanceThreshold;
}

- (void)setRecommendationDistanceThreshold:(double)a3
{
  self->_recommendationDistanceThreshold = a3;
}

- (int64_t)maxSystemCancellationAttempts
{
  return self->_maxSystemCancellationAttempts;
}

- (void)setMaxSystemCancellationAttempts:(int64_t)a3
{
  self->_maxSystemCancellationAttempts = a3;
}

- (NSMutableDictionary)notifications
{
  return self->_notifications;
}

- (void)setNotifications:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (NSString)lastRecommendedSSID
{
  return self->_lastRecommendedSSID;
}

- (void)setLastRecommendedSSID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

@end
