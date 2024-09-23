@implementation STUFetchControlGroupIdentifiersOperation

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  objc_super v12;

  v6 = a3;
  v12.receiver = a1;
  v12.super_class = (Class)&OBJC_METACLASS___STUFetchControlGroupIdentifiersOperation;
  if (!objc_msgSendSuper2(&v12, "validateRequest:error:", v6, a4))
    goto LABEL_7;
  v7 = objc_opt_class(CRKFetchControlGroupIdentifiersRequest);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) == 0)
  {
    v8 = objc_opt_class(DMFFetchControlGroupIdentifiersRequest);
    if ((objc_opt_isKindOfClass(v6, v8) & 1) == 0)
    {
      if (a4)
      {
        v10 = CATErrorWithCodeAndUserInfo(2, &off_1000D2FE8);
        v9 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue(v10);
        goto LABEL_8;
      }
LABEL_7:
      v9 = 0;
      goto LABEL_8;
    }
  }
  v9 = 1;
LABEL_8:

  return v9;
}

- (void)runWithRequest:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context", a3));
  v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "configurationManager"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "enrolledControlGroupIdentifiers"));
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allObjects"));
  v7 = (void *)v6;
  v8 = &__NSArray0__struct;
  if (v6)
    v8 = (void *)v6;
  v9 = v8;

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[STUFetchControlGroupIdentifiersOperation makeResultObjectWithGroupIdentifiers:](self, "makeResultObjectWithGroupIdentifiers:", v9));
  -[STUFetchControlGroupIdentifiersOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", v10);

}

- (id)makeResultObjectWithGroupIdentifiers:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  char isKindOfClass;
  Class *v8;
  id v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUFetchControlGroupIdentifiersOperation request](self, "request"));
  v6 = objc_opt_class(DMFFetchControlGroupIdentifiersRequest);
  isKindOfClass = objc_opt_isKindOfClass(v5, v6);

  v8 = (Class *)DMFFetchControlGroupIdentifiersResultObject_ptr;
  if ((isKindOfClass & 1) == 0)
    v8 = (Class *)CRKFetchControlGroupIdentifiersResultObject_ptr;
  v9 = objc_msgSend(objc_alloc(*v8), "initWithGroupIdentifiers:", v4);

  return v9;
}

@end
