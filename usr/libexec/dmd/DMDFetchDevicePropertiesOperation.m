@implementation DMDFetchDevicePropertiesOperation

+ (id)whitelistedClassesForRequest
{
  uint64_t v2;

  v2 = objc_opt_class(DMFFetchDevicePropertiesRequest, a2);
  return +[NSSet setWithObject:](NSSet, "setWithObject:", v2);
}

+ (id)requiredEntitlements
{
  return &off_1000C2C70;
}

- (void)runWithRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  id v16;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[DMDDeviceController shared](DMDDeviceController, "shared"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "propertyKeys"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v6));
  v16 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "deviceWithKeys:", v7));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "propertyKeys"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "dictionaryWithValuesForKeys:", v8));
  v10 = objc_msgSend(v9, "mutableCopy");

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "allKeysForObject:", v11));

  objc_msgSend(v10, "removeObjectsForKeys:", v12);
  v13 = objc_alloc((Class)DMFFetchDevicePropertiesResultObject);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "errorsForKeys"));
  v15 = objc_msgSend(v13, "initWithValuesByPropertyKey:errorsByPropertyKey:", v10, v14);
  -[DMDFetchDevicePropertiesOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", v15);

}

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  objc_super v11;
  uint64_t v12;
  const __CFString *v13;

  v6 = a3;
  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_METACLASS___DMDFetchDevicePropertiesOperation;
  if (!objc_msgSendSuper2(&v11, "validateRequest:error:", v6, a4))
    goto LABEL_6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "propertyKeys"));

  if (!v7)
  {
    if (!a4)
      goto LABEL_7;
    v12 = DMFInvalidParameterErrorKey;
    v13 = CFSTR("request.propertyKeys");
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1));
    v9 = DMFErrorWithCodeAndUserInfo(1, v8);
    *a4 = (id)objc_claimAutoreleasedReturnValue(v9);

LABEL_6:
    LOBYTE(a4) = 0;
    goto LABEL_7;
  }
  LOBYTE(a4) = 1;
LABEL_7:

  return (char)a4;
}

@end
