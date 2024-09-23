@implementation DMDSendEventOperation

+ (id)whitelistedClassesForRequest
{
  uint64_t v2;

  v2 = objc_opt_class(DMFSendEventRequest, a2);
  return +[NSSet setWithObject:](NSSet, "setWithObject:", v2);
}

+ (id)requiredEntitlements
{
  return &off_1000C3048;
}

- (unint64_t)queueGroup
{
  return 1;
}

- (BOOL)runOnMainThread
{
  return 1;
}

- (void)runWithRequest:(id)a3
{
  id v4;
  void *v5;
  DMDEventStreamEvent *v6;
  void *v7;
  void *v8;
  DMDEventStreamEvent *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[5];
  void *v17;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMDTaskOperation configurationEngine](self, "configurationEngine"));

  if (v5)
  {
    v6 = [DMDEventStreamEvent alloc];
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "eventType"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "details"));
    v9 = -[DMDEventStreamEvent initWithEventType:details:](v6, "initWithEventType:details:", v7, v8);

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "inReplyTo"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEventStreamEvent eventStatusMessageWithPayloadIdentifier:](v9, "eventStatusMessageWithPayloadIdentifier:", v10));

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[DMDTaskOperation configurationEngine](self, "configurationEngine"));
    v17 = v11;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v17, 1));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "organizationIdentifier"));
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100062738;
    v16[3] = &unk_1000BAD98;
    v16[4] = self;
    objc_msgSend(v12, "sendEvents:organizationIdentifier:completionHandler:", v13, v14, v16);

  }
  else
  {
    v15 = DMFErrorWithCodeAndUserInfo(4, 0);
    v9 = (DMDEventStreamEvent *)objc_claimAutoreleasedReturnValue(v15);
    -[DMDSendEventOperation endOperationWithError:](self, "endOperationWithError:", v9);
  }

}

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString **v10;
  uint64_t *v11;
  void *v12;
  uint64_t v13;
  objc_super v15;
  uint64_t v16;
  const __CFString *v17;
  uint64_t v18;
  const __CFString *v19;
  uint64_t v20;
  const __CFString *v21;

  v6 = a3;
  v15.receiver = a1;
  v15.super_class = (Class)&OBJC_METACLASS___DMDSendEventOperation;
  if (!objc_msgSendSuper2(&v15, "validateRequest:error:", v6, a4))
    goto LABEL_13;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "organizationIdentifier"));

  if (!v7)
  {
    if (!a4)
      goto LABEL_14;
    v20 = DMFInvalidParameterErrorKey;
    v21 = CFSTR("request.organizationIdentifier");
    v10 = &v21;
    v11 = &v20;
    goto LABEL_12;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "inReplyTo"));

  if (!v8)
  {
    if (!a4)
      goto LABEL_14;
    v18 = DMFInvalidParameterErrorKey;
    v19 = CFSTR("request.inRepyTo");
    v10 = &v19;
    v11 = &v18;
    goto LABEL_12;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "eventType"));

  if (!v9)
  {
    if (!a4)
      goto LABEL_14;
    v16 = DMFInvalidParameterErrorKey;
    v17 = CFSTR("request.eventType");
    v10 = &v17;
    v11 = &v16;
LABEL_12:
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v10, v11, 1));
    v13 = DMFErrorWithCodeAndUserInfo(1, v12);
    *a4 = (id)objc_claimAutoreleasedReturnValue(v13);

LABEL_13:
    LOBYTE(a4) = 0;
    goto LABEL_14;
  }
  LOBYTE(a4) = 1;
LABEL_14:

  return (char)a4;
}

@end
