@implementation STUFetchActiveStudentCourseIdentifiersOperation

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  objc_super v11;

  v6 = a3;
  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_METACLASS___STUFetchActiveStudentCourseIdentifiersOperation;
  if (!objc_msgSendSuper2(&v11, "validateRequest:error:", v6, a4))
    goto LABEL_6;
  v7 = objc_opt_class(CRKFetchActiveStudentCourseIdentifiersRequest);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) == 0)
  {
    if (a4)
    {
      v9 = CRKErrorWithCodeAndUserInfo(2, &off_1000D3088);
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
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = (id)objc_opt_new(CRKFetchActiveStudentCourseIdentifiersResultObject);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "daemon"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "activeCourseIdentifiers"));
  objc_msgSend(v11, "setActiveCourseIdentifiers:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "daemon"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "activeInstructorUsers"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "valueForKey:", CFSTR("userIdentifier")));
  objc_msgSend(v11, "setActiveInstructorIdentifiers:", v10);

  -[STUFetchActiveStudentCourseIdentifiersOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", v11);
}

@end
