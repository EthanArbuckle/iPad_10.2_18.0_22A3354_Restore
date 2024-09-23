@implementation STURefreshASMCoursesOperation

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  objc_super v11;

  v6 = a3;
  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_METACLASS___STURefreshASMCoursesOperation;
  if (!objc_msgSendSuper2(&v11, "validateRequest:error:", v6, a4))
    goto LABEL_6;
  v7 = objc_opt_class(CRKRefreshASMCoursesRequest);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) == 0)
  {
    if (a4)
    {
      v9 = CATErrorWithCodeAndUserInfo(2, &off_1000D38F8);
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
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "configurationManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "ASMCourseLibrary"));
  objc_msgSend(v6, "refreshCourses");

  -[STURefreshASMCoursesOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", 0);
}

@end
