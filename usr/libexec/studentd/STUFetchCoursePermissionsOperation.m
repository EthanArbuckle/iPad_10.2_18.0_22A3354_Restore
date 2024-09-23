@implementation STUFetchCoursePermissionsOperation

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  objc_super v11;

  v6 = a3;
  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_METACLASS___STUFetchCoursePermissionsOperation;
  if (!objc_msgSendSuper2(&v11, "validateRequest:error:", v6, a4))
    goto LABEL_6;
  v7 = objc_opt_class(CRKFetchCoursePermissionsRequest);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) == 0)
  {
    if (a4)
    {
      v9 = CRKErrorWithCodeAndUserInfo(2, &off_1000D39C0);
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
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  const __CFString *v21;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "configurationManager"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "courseIdentifier"));
  if (!v7)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "groupEnrollmentRecords"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("hidden = NO")));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "filteredSetUsingPredicate:", v17));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "anyObject"));

    goto LABEL_7;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "courseIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "enrollmentRecordWithIdentifier:", v8));

  if (v9)
  {
LABEL_7:
    v11 = (void *)objc_opt_new(CRKFetchCoursePermissionsResultObject);
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[STUFetchCoursePermissionsOperation permissionsByFeatureForEnrollmentRecord:](self, "permissionsByFeatureForEnrollmentRecord:", v9));
    objc_msgSend(v11, "setPermissionsByFeature:", v19);

    -[STUFetchCoursePermissionsOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", v11);
    goto LABEL_8;
  }
  v20 = CFSTR("kCRKItemNameErrorKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "courseIdentifier"));
  v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringValue"));
  v11 = (void *)v10;
  v12 = CFSTR("<nil>");
  if (v10)
    v12 = (const __CFString *)v10;
  v21 = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1));
  v14 = CRKErrorWithCodeAndUserInfo(12, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  -[STUFetchCoursePermissionsOperation endOperationWithError:](self, "endOperationWithError:", v15);

LABEL_8:
}

- (id)permissionsByFeatureForEnrollmentRecord:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v4 = a3;
  v5 = objc_opt_new(NSMutableDictionary);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(+[CRKFeatures allClassroomCRKFeatures](CRKFeatures, "allClassroomCRKFeatures"));
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "configurationManager"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[STUFeatureFactory featureForCRKFeature:enrollmentRecord:configurationManager:](STUFeatureFactory, "featureForCRKFeature:enrollmentRecord:configurationManager:", v10, v4, v12));

        v14 = (void *)objc_claimAutoreleasedReturnValue(-[STUFetchCoursePermissionsOperation permissionResultObjectWithPermission:modifiable:](self, "permissionResultObjectWithPermission:modifiable:", objc_msgSend(v13, "permission"), objc_msgSend(v13, "isModifiable")));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v14, v10);

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }

  return v5;
}

- (id)permissionResultObjectWithPermission:(unint64_t)a3 modifiable:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;

  v4 = a4;
  v6 = (void *)objc_opt_new(CRKFeaturePermissionResultObject);
  objc_msgSend(v6, "setPermission:", a3);
  objc_msgSend(v6, "setModifiable:", v4);
  return v6;
}

@end
