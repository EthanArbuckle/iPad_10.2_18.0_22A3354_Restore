@implementation STUGenerateInstructorOperation

- (STUGenerateInstructorOperation)initWithSessionIdentifier:(id)a3 sessionInfo:(id)a4 isQuarantined:(BOOL)a5 daemon:(id)a6 includeImage:(BOOL)a7
{
  id v14;
  id v15;
  id v16;
  STUGenerateInstructorOperation *v17;
  STUGenerateInstructorOperation *v18;
  void *v20;
  void *v21;
  void *v22;
  objc_super v23;

  v14 = a3;
  v15 = a4;
  v16 = a6;
  if (v14)
  {
    if (v15)
      goto LABEL_3;
LABEL_8:
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUGenerateInstructorOperation.m"), 36, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sessionInfo"));

    if (v16)
      goto LABEL_4;
    goto LABEL_9;
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUGenerateInstructorOperation.m"), 35, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sessionIdentifier"));

  if (!v15)
    goto LABEL_8;
LABEL_3:
  if (v16)
    goto LABEL_4;
LABEL_9:
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUGenerateInstructorOperation.m"), 37, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("daemon"));

LABEL_4:
  v23.receiver = self;
  v23.super_class = (Class)STUGenerateInstructorOperation;
  v17 = -[STUGenerateInstructorOperation init](&v23, "init");
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_sessionIdentifier, a3);
    objc_storeStrong((id *)&v18->_sessionInfo, a4);
    v18->_quarantined = a5;
    objc_storeStrong((id *)&v18->_daemon, a6);
    v18->_includeImage = a7;
  }

  return v18;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)main
{
  -[STUGenerateInstructorOperation performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", "makeInstructor", 0, 0);
}

- (void)makeInstructor
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  const __CFString *v22;
  const __CFString *v23;

  if (-[STUGenerateInstructorOperation isQuarantined](self, "isQuarantined"))
  {
    v3 = CRKErrorWithCodeAndUserInfo(38, 0);
    v17 = (id)objc_claimAutoreleasedReturnValue(v3);
    -[STUGenerateInstructorOperation endOperationWithError:](self, "endOperationWithError:");

  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUGenerateInstructorOperation daemon](self, "daemon"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUGenerateInstructorOperation sessionIdentifier](self, "sessionIdentifier"));
    v21 = 0;
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "enrollmentRecordForSessionIdentifier:error:", v5, &v21));
    v7 = v21;

    if (v6)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[STUGenerateInstructorOperation sessionInfo](self, "sessionInfo"));
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "instructorIdentifier"));

      v10 = (void *)objc_claimAutoreleasedReturnValue(-[STUGenerateInstructorOperation daemon](self, "daemon"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[STUGenerateInstructorOperation sessionIdentifier](self, "sessionIdentifier"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "instructorUserWithIdentifier:forSessionWithIdentifier:", v9, v11));

      if (v12)
      {
        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472;
        v18[2] = sub_10006279C;
        v18[3] = &unk_1000CB978;
        v18[4] = self;
        v19 = v12;
        v20 = v6;
        -[STUGenerateInstructorOperation fetchImageForUser:completion:](self, "fetchImageForUser:completion:", v19, v18);

      }
      else
      {
        if (v9)
          v13 = v9;
        else
          v13 = CFSTR("<nil>");
        v22 = CFSTR("kCRKInvalidIdentifierErrorKey");
        v23 = v13;
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1));
        v15 = CRKErrorWithCodeAndUserInfo(104, v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

        -[STUGenerateInstructorOperation endOperationWithError:](self, "endOperationWithError:", v16);
      }

    }
    else
    {
      -[STUGenerateInstructorOperation endOperationWithError:](self, "endOperationWithError:", v7);
    }

  }
}

- (void)fetchImageForUser:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  if (-[STUGenerateInstructorOperation includeImage](self, "includeImage"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[STUGenerateInstructorOperation daemon](self, "daemon"));
    objc_msgSend(v7, "fetchImageDataForUser:completion:", v8, v6);

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v6 + 2))(v6, 0, 0);
  }

}

- (id)instructorWithSessionIdentifier:(id)a3 sessionInfo:(id)a4 user:(id)a5 enrollmentRecord:(id)a6 imageData:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  CRKInstructor *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  v17 = objc_opt_new(CRKInstructor);
  -[CRKInstructor setSessionIdentifier:](v17, "setSessionIdentifier:", v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "userIdentifier"));
  -[CRKInstructor setUserIdentifier:](v17, "setUserIdentifier:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "displayName"));
  -[CRKInstructor setDisplayName:](v17, "setDisplayName:", v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "groupName"));
  -[CRKInstructor setCourseName:](v17, "setCourseName:", v20);

  -[CRKInstructor setImageData:](v17, "setImageData:", v12);
  -[CRKInstructor setDisallowsClassroomAirDropOverLocalNetwork:](v17, "setDisallowsClassroomAirDropOverLocalNetwork:", objc_msgSend(v15, "disallowsClassroomAirDropOverLocalNetwork"));
  v21 = objc_msgSend(v15, "allowsStudentInitiatedDisconnection");

  -[CRKInstructor setAllowsStudentInitiatedDisconnection:](v17, "setAllowsStudentInitiatedDisconnection:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[STUGenerateInstructorOperation daemon](self, "daemon"));
  v23 = objc_msgSend(v22, "isInstructorWithSessionIdentifierObservingScreen:", v16);

  -[CRKInstructor setObservingStudentScreen:](v17, "setObservingStudentScreen:", v23);
  return v17;
}

- (DMFControlSessionIdentifier)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (STUSessionInfo)sessionInfo
{
  return self->_sessionInfo;
}

- (BOOL)isQuarantined
{
  return self->_quarantined;
}

- (STUDaemon)daemon
{
  return self->_daemon;
}

- (BOOL)includeImage
{
  return self->_includeImage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_daemon, 0);
  objc_storeStrong((id *)&self->_sessionInfo, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
}

@end
