@implementation PDURLSessionProxyCommon

+ (id)allowedClassesForUnarchiving
{
  if (qword_1000C70B0 != -1)
    dispatch_once(&qword_1000C70B0, &stru_1000B1840);
  return (id)qword_1000C70A8;
}

+ (void)getComponentsForFullIdentifier:(id)a3 bundleIdentifier:(id *)a4 sessionIdentifier:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v11;
  id v12;

  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "componentsSeparatedByString:", CFSTR("|")));
  v9 = v8;
  if (a4 && a5 && objc_msgSend(v8, "count") == (id)2)
  {
    *a4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndex:", 0));
    *a5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndex:", 1));
  }
  else
  {
    v10 = qword_1000C7120;
    if (os_log_type_enabled((os_log_t)qword_1000C7120, OS_LOG_TYPE_ERROR))
    {
      v11 = 138412290;
      v12 = v7;
      _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Could not break full NSURLSession identifier %@ into bundle ID and session ID components", (uint8_t *)&v11, 0xCu);
    }
  }

}

+ (Class)messageSubclassForMessageType:(unsigned __int16)a3 isReply:(BOOL)a4
{
  __objc2_class *v4;
  __objc2_class **v5;
  uint64_t v7;

  if ((int)a3 <= 2000)
  {
    switch(a3)
    {
      case 0x3E9u:
        v5 = off_1000B04E8;
        if (!a4)
          v5 = off_1000B04E0;
        return (Class)(id)objc_opt_class(*v5);
      case 0x3EAu:
        v4 = PDURLSessionProxyWillSendRequest;
        goto LABEL_50;
      case 0x3EBu:
        v5 = off_1000B0508;
        if (!a4)
          v5 = off_1000B0500;
        return (Class)(id)objc_opt_class(*v5);
      case 0x3ECu:
        v4 = PDURLSessionProxyDidSendBodyData;
        goto LABEL_50;
      case 0x3EDu:
        v4 = PDURLSessionProxyTaskCompleted;
        goto LABEL_50;
      case 0x3EEu:
        v5 = off_1000B04F8;
        if (!a4)
          v5 = off_1000B04F0;
        return (Class)(id)objc_opt_class(*v5);
      case 0x3EFu:
        v4 = PDURLSessionProxyTaskWillBeRetried;
        goto LABEL_50;
      case 0x3F0u:
        v4 = PDURLSessionProxySessionBecameInvalid;
        goto LABEL_50;
      case 0x3F1u:
        v4 = PDURLSessionProxyTaskWaiting;
        goto LABEL_50;
      case 0x3F2u:
        v5 = off_1000B0518;
        if (!a4)
          v5 = off_1000B0510;
        return (Class)(id)objc_opt_class(*v5);
      case 0x3F3u:
        v4 = PDURLSessionProxyOpenBodyStream;
        goto LABEL_50;
      case 0x3F4u:
        v5 = &off_1000B0538;
        if (!a4)
          v5 = off_1000B0530;
        return (Class)(id)objc_opt_class(*v5);
      default:
        switch(a3)
        {
          case 1u:
            v4 = PDURLSessionProxyCreateSession;
            goto LABEL_50;
          case 2u:
            v5 = off_1000B04D8;
            if (!a4)
              v5 = off_1000B04D0;
            return (Class)(id)objc_opt_class(*v5);
          case 3u:
            v4 = PDURLSessionProxyCancelTask;
            goto LABEL_50;
          case 4u:
            v4 = PDURLSessionProxySuspendTask;
            goto LABEL_50;
          case 5u:
            v4 = PDURLSessionProxyResumeTask;
            goto LABEL_50;
          case 6u:
            v4 = PDURLSessionProxySetTaskDescription;
            goto LABEL_50;
          case 7u:
            v4 = PDURLSessionProxySetTaskPriority;
            goto LABEL_50;
          case 8u:
            v4 = PDURLSessionProxyInvalidateSession;
            goto LABEL_50;
          default:
            goto LABEL_21;
        }
    }
  }
  if ((int)a3 > 3001)
  {
    switch(a3)
    {
      case 0xBBAu:
        v4 = PDURLSessionProxyConnectedToServer;
        goto LABEL_50;
      case 0xBBBu:
        v4 = PDURLSessionProxySocketDisconnected;
        goto LABEL_50;
      case 0x2710u:
        v4 = PDURLSessionProxyStartedUp;
LABEL_50:
        v7 = objc_opt_class(v4);
        return (Class)(id)objc_claimAutoreleasedReturnValue(v7);
    }
LABEL_21:
    v4 = (__objc2_class *)PBCodable;
    goto LABEL_50;
  }
  if (a3 == 2001)
  {
    v4 = PDURLSessionProxyUploadBodyData;
    goto LABEL_50;
  }
  if (a3 != 3001)
    goto LABEL_21;
  v5 = off_1000B0528;
  if (!a4)
    v5 = off_1000B0520;
  return (Class)(id)objc_opt_class(*v5);
}

@end
