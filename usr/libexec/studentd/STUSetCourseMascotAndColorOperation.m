@implementation STUSetCourseMascotAndColorOperation

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  objc_super v11;

  v6 = a3;
  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_METACLASS___STUSetCourseMascotAndColorOperation;
  if (!objc_msgSendSuper2(&v11, "validateRequest:error:", v6, a4))
    goto LABEL_6;
  v7 = objc_opt_class(CRKSetCourseMascotAndColorRequest);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) == 0)
  {
    if (a4)
    {
      v9 = CRKErrorWithCodeAndUserInfo(2, &off_1000D2EF8);
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
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  const __CFString *v23;
  const __CFString *v24;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "courseIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[STUSetCourseMascotAndColorOperation metadataTracker](self, "metadataTracker"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[STUSetCourseMascotAndColorOperation metadataTrackerKey](self, "metadataTrackerKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "valueForKey:courseIdentifier:", v7, v5));

  if (!objc_msgSend(v8, "BOOLValue"))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "configurationManager"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "courseIdentifier"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "enrollmentRecordWithIdentifier:", v13));
    v10 = objc_msgSend(v14, "copy");

    if (v10)
    {
      v15 = objc_msgSend(v10, "type");
      if (!v15)
      {
        -[STUSetCourseMascotAndColorOperation updateManagedEnrollmentRecord:request:](self, "updateManagedEnrollmentRecord:request:", v10, v4);
        goto LABEL_13;
      }
      if (v15 == (id)1)
      {
        -[STUSetCourseMascotAndColorOperation updateAdHocEnrollmentRecord:request:](self, "updateAdHocEnrollmentRecord:request:", v10, v4);
        goto LABEL_13;
      }
      v22 = CRKErrorWithCodeAndUserInfo(112, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue(v22);
      -[STUSetCourseMascotAndColorOperation endOperationWithError:](self, "endOperationWithError:", v17);
    }
    else
    {
      v23 = CFSTR("kCRKItemNameErrorKey");
      v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringValue"));
      v17 = (void *)v16;
      v18 = CFSTR("courseIdentifier.stringValue");
      if (v16)
        v18 = (const __CFString *)v16;
      v24 = v18;
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1));
      v20 = CRKErrorWithCodeAndUserInfo(12, v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
      -[STUSetCourseMascotAndColorOperation endOperationWithError:](self, "endOperationWithError:", v21);

    }
    goto LABEL_13;
  }
  v9 = CRKErrorWithCodeAndUserInfo(117, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue(v9);
  -[STUSetCourseMascotAndColorOperation endOperationWithError:](self, "endOperationWithError:", v10);
LABEL_13:

}

- (void)updateAdHocEnrollmentRecord:(id)a3 request:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  unsigned __int8 v13;
  void *v14;
  id v15;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "configurationManager"));

  v10 = objc_msgSend(v7, "mascotType");
  v11 = objc_msgSend(v7, "colorType");
  if (objc_msgSend(v6, "groupMascotType") == v10 && objc_msgSend(v6, "groupColorType") == v11)
  {
    v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "courseIdentifier"));
    -[STUSetCourseMascotAndColorOperation updateMetadataTrackerAndEndOperationWithCourseIdentifier:](self, "updateMetadataTrackerAndEndOperationWithCourseIdentifier:", v12);
  }
  else
  {
    objc_msgSend(v6, "setGroupMascotType:", objc_msgSend(v7, "mascotType"));
    objc_msgSend(v6, "setGroupColorType:", objc_msgSend(v7, "colorType"));
    v15 = 0;
    v13 = objc_msgSend(v9, "upsertEnrollmentRecord:error:", v6, &v15);
    v12 = v15;
    if ((v13 & 1) != 0)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "courseIdentifier"));
      -[STUSetCourseMascotAndColorOperation updateMetadataTrackerAndEndOperationWithCourseIdentifier:](self, "updateMetadataTrackerAndEndOperationWithCourseIdentifier:", v14);

    }
    else
    {
      -[STUSetCourseMascotAndColorOperation endOperationWithError:](self, "endOperationWithError:", v12);
    }
  }

}

- (void)updateManagedEnrollmentRecord:(id)a3 request:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  _QWORD v24[2];
  _QWORD v25[2];

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "configurationManager"));

  v8 = objc_msgSend(v5, "mascotType");
  v9 = objc_msgSend(v5, "colorType");
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "courseIdentifier"));

  v23 = v7;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "profileCourseConfigurationMetadataForCourseIdentifier:", v10));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("mascotType")));
  v13 = objc_msgSend(v12, "unsignedIntegerValue");

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("colorType")));
  v15 = objc_msgSend(v14, "unsignedIntegerValue");

  if (v13 == v8 && v15 == v9)
  {
    -[STUSetCourseMascotAndColorOperation updateMetadataTrackerAndEndOperationWithCourseIdentifier:](self, "updateMetadataTrackerAndEndOperationWithCourseIdentifier:", v10);
    v20 = v23;
  }
  else
  {
    v24[0] = CFSTR("mascotType");
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v8));
    v24[1] = CFSTR("colorType");
    v25[0] = v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v9));
    v25[1] = v18;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v25, v24, 2));

    v20 = v23;
    if ((objc_msgSend(v23, "setProfileCourseConfigurationMetadata:courseIdentifier:", v19, v10) & 1) != 0)
    {
      -[STUSetCourseMascotAndColorOperation updateMetadataTrackerAndEndOperationWithCourseIdentifier:](self, "updateMetadataTrackerAndEndOperationWithCourseIdentifier:", v10);
    }
    else
    {
      v21 = CRKErrorWithCodeAndUserInfo(118, 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
      -[STUSetCourseMascotAndColorOperation endOperationWithError:](self, "endOperationWithError:", v22);

    }
  }

}

- (void)updateMetadataTrackerAndEndOperationWithCourseIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUSetCourseMascotAndColorOperation metadataTracker](self, "metadataTracker"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[STUSetCourseMascotAndColorOperation metadataTrackerKey](self, "metadataTrackerKey"));
  objc_msgSend(v5, "setValue:forKey:courseIdentifier:", &__kCFBooleanTrue, v6, v4);

  -[STUSetCourseMascotAndColorOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", 0);
}

- (id)metadataTracker
{
  return +[STUCourseIdentifierMetadataTracker sharedTracker](STUCourseIdentifierMetadataTracker, "sharedTracker");
}

- (id)metadataTrackerKey
{
  return CFSTR("STUCourseIdentifierMetadataTrackerSetCourseMascotAndColorKey");
}

@end
