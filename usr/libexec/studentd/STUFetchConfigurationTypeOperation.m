@implementation STUFetchConfigurationTypeOperation

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  objc_super v11;

  v6 = a3;
  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_METACLASS___STUFetchConfigurationTypeOperation;
  if (!objc_msgSendSuper2(&v11, "validateRequest:error:", v6, a4))
    goto LABEL_6;
  v7 = objc_opt_class(CRKFetchConfigurationTypeRequest);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) == 0)
  {
    if (a4)
    {
      v9 = CRKErrorWithCodeAndUserInfo(2, &off_1000D3E20);
      v8 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue(v9);
      goto LABEL_7;
    }
LABEL_6:
    v8 = 0;
    goto LABEL_7;
  }
  v8 = 1;
LABEL_7:

  return v8;
}

- (void)runWithRequest:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context", a3));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "configurationManager"));

  v5 = (void *)objc_opt_new(CRKFetchConfigurationTypeResultObject);
  objc_msgSend(v5, "setConfigurationType:", objc_msgSend(v6, "configurationType"));
  objc_msgSend(v5, "setSignedInToStudentMAID:", objc_msgSend(v6, "isSignedInToStudentMAID"));
  -[STUFetchConfigurationTypeOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", v5);

}

@end
