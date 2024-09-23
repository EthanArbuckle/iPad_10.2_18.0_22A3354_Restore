@implementation FMFUserNotificationCategories

+ (int)convertToCategory:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PUSH_INVITE_ACCEPT")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GEOFENCE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GEOFENCE_TRIGGER")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GEOFENCE_RECEIVE")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GEOFENCE_CONFIRMATION")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("OFFER_LOCATION")) & 1) != 0
         || (objc_msgSend(v3, "isEqualToString:", CFSTR("PUSH_OFFER_LOCATION")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("INVITE_RESPONSE")) & 1) != 0)
  {
    v4 = 7;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("NOTIFY_FOUND")))
  {
    v4 = 8;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (int)categoryType:(int)a3 messageDict:(id)a4
{
  void *v4;
  int v5;

  if (a3 != 8)
    return 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("deviceIdentifier")));
  if (v4)
    v5 = 1;
  else
    v5 = 2;

  return v5;
}

@end
