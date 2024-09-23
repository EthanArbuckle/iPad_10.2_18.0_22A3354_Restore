@implementation STUASMCourseLibrary

- (void)dealloc
{
  objc_super v3;

  -[CRKClassKitCurrentUserProvider removeObserver:forKeyPath:context:](self->_currentUserProvider, "removeObserver:forKeyPath:context:", self, CFSTR("currentUser"), CFSTR("ObservationContext"));
  v3.receiver = self;
  v3.super_class = (Class)STUASMCourseLibrary;
  -[STUASMCourseLibrary dealloc](&v3, "dealloc");
}

- (STUASMCourseLibrary)initWithRosterProvider:(id)a3 studentClassKitFacade:(id)a4 certificateConduit:(id)a5 IDSPrimitives:(id)a6 IDSAddressTranslator:(id)a7 IDSCacheClearer:(id)a8 device:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  STUASMCourseLibrary *v21;
  STUASMCourseLibrary *v22;
  STUASMCertificateRefresher *v23;
  STUASMCertificateRefresher *certificateRefresher;
  STUASMEnrollmentRecordProvider *v25;
  STUASMEnrollmentRecordProvider *enrollmentRecordProvider;
  STUConcreteCertificateExchangeBroadcastHandlerDelegate *v27;
  STUConcreteCertificateExchangeBroadcastHandlerDelegate *exchangeHandlerDelegate;
  CRKClassKitCurrentUserProvider *v29;
  CRKClassKitCurrentUserProvider *currentUserProvider;
  id v32;
  id v33;
  objc_super v34;

  v33 = a3;
  v16 = a4;
  v17 = a5;
  v32 = a6;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  v34.receiver = self;
  v34.super_class = (Class)STUASMCourseLibrary;
  v21 = -[STUASMCourseLibrary init](&v34, "init");
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_rosterProvider, a3);
    objc_storeStrong((id *)&v22->_IDSPrimitives, a6);
    objc_storeStrong((id *)&v22->_IDSAddressTranslator, a7);
    v23 = -[STUASMCertificateRefresher initWithRosterProvider:certificateConduit:IDSCacheClearer:]([STUASMCertificateRefresher alloc], "initWithRosterProvider:certificateConduit:IDSCacheClearer:", v22->_rosterProvider, v17, v19, v32, v33);
    certificateRefresher = v22->_certificateRefresher;
    v22->_certificateRefresher = v23;

    v25 = -[STUASMEnrollmentRecordProvider initWithRosterProvider:]([STUASMEnrollmentRecordProvider alloc], "initWithRosterProvider:", v22->_rosterProvider);
    enrollmentRecordProvider = v22->_enrollmentRecordProvider;
    v22->_enrollmentRecordProvider = v25;

    v27 = -[STUConcreteCertificateExchangeBroadcastHandlerDelegate initWithRosterProvider:device:]([STUConcreteCertificateExchangeBroadcastHandlerDelegate alloc], "initWithRosterProvider:device:", v22->_rosterProvider, v20);
    exchangeHandlerDelegate = v22->_exchangeHandlerDelegate;
    v22->_exchangeHandlerDelegate = v27;

    v29 = (CRKClassKitCurrentUserProvider *)objc_msgSend(objc_alloc((Class)CRKClassKitCurrentUserProvider), "initWithClassKitFacade:", v16);
    currentUserProvider = v22->_currentUserProvider;
    v22->_currentUserProvider = v29;

    -[CRKClassKitCurrentUserProvider addObserver:forKeyPath:options:context:](v22->_currentUserProvider, "addObserver:forKeyPath:options:context:", v22, CFSTR("currentUser"), 4, CFSTR("ObservationContext"));
  }

  return v22;
}

- (void)refreshCourses
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[STUASMCourseLibrary rosterProvider](self, "rosterProvider"));
  objc_msgSend(v2, "refresh");

}

- (void)refreshCertificatesForCourseWithIdentifier:(id)a3 instructorIdentifier:(id)a4 targetIPAddress:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = (id)objc_claimAutoreleasedReturnValue(-[STUASMCourseLibrary certificateRefresher](self, "certificateRefresher"));
  objc_msgSend(v14, "refreshCertificatesForCourseWithIdentifier:instructorIdentifier:targetIPAddress:completion:", v13, v12, v11, v10);

}

- (void)cancelRefreshCertificatesForCourseWithIdentifier:(id)a3 targetIPAddress:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[STUASMCourseLibrary certificateRefresher](self, "certificateRefresher"));
  objc_msgSend(v8, "cancelRefreshCertificatesForCourseWithIdentifier:targetIPAddress:", v7, v6);

}

- (BOOL)containsCourseWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUASMCourseLibrary rosterProvider](self, "rosterProvider"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "roster"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[STUASMRosterQueryUtilities courseWithIdentifier:inRoster:](STUASMRosterQueryUtilities, "courseWithIdentifier:inRoster:", v4, v6));

  return v7 != 0;
}

- (id)makeClassSessionBrowser
{
  STUASMClassSessionBrowser *v3;
  void *v4;
  void *v5;
  void *v6;
  STUASMClassSessionBrowser *v7;

  v3 = [STUASMClassSessionBrowser alloc];
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUASMCourseLibrary rosterProvider](self, "rosterProvider"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUASMCourseLibrary IDSPrimitives](self, "IDSPrimitives"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[STUASMCourseLibrary IDSAddressTranslator](self, "IDSAddressTranslator"));
  v7 = -[STUASMClassSessionBrowser initWithRosterProvider:IDSPrimitives:IDSAddressTranslator:](v3, "initWithRosterProvider:IDSPrimitives:IDSAddressTranslator:", v4, v5, v6);

  return v7;
}

- (NSSet)enrollmentRecords
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[STUASMCourseLibrary enrollmentRecordProvider](self, "enrollmentRecordProvider"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "enrollmentRecords"));

  return (NSSet *)v3;
}

- (void)connectToDataSource
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[STUASMCourseLibrary rosterProvider](self, "rosterProvider"));
  objc_msgSend(v2, "resume");

}

- (void)disconnectFromDataSource
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[STUASMCourseLibrary rosterProvider](self, "rosterProvider"));
  objc_msgSend(v2, "suspend");

}

+ (id)keyPathsForValuesAffectingEnrollmentRecords
{
  return +[NSSet setWithObject:](NSSet, "setWithObject:", CFSTR("enrollmentRecordProvider.enrollmentRecords"));
}

- (id)clientIdentityForCourseIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUASMCourseLibrary rosterProvider](self, "rosterProvider"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "roster"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[STUASMRosterQueryUtilities userIdentityForCourseWithIdentifier:inRoster:](STUASMRosterQueryUtilities, "userIdentityForCourseWithIdentifier:inRoster:", v4, v6));

  return v7;
}

- (id)trustedAnchorCertificatesForCourseIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUASMCourseLibrary rosterProvider](self, "rosterProvider"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "roster"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[STUASMRosterQueryUtilities trustedUserCertificatesForCourseWithIdentifier:inRoster:](STUASMRosterQueryUtilities, "trustedUserCertificatesForCourseWithIdentifier:inRoster:", v4, v6));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allObjects"));
  return v8;
}

- (id)certificateExchangeHandler:(id)a3 needsCertificatesForRequester:(id)a4 sourceRole:(int64_t)a5 destinationRole:(int64_t)a6 controlGroupIdentifier:(id)a7 destinationDeviceIdentifier:(id)a8 requesterCertificate:(id)a9 error:(id *)a10
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;

  v17 = a9;
  v18 = a8;
  v19 = a7;
  v20 = a4;
  v21 = a3;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[STUASMCourseLibrary exchangeHandlerDelegate](self, "exchangeHandlerDelegate"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "certificateExchangeHandler:needsCertificatesForRequester:sourceRole:destinationRole:controlGroupIdentifier:destinationDeviceIdentifier:requesterCertificate:error:", v21, v20, a5, a6, v19, v18, v17, a10));

  return v23;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v6;
  uint64_t v7;
  objc_super v8;
  uint64_t v9;
  uint64_t v10;

  if (a6 == CFSTR("ObservationContext"))
  {
    -[STUASMCourseLibrary currentUserDidChange](self, "currentUserDidChange", a3, a4, a5);
  }
  else
  {
    v9 = v6;
    v10 = v7;
    v8.receiver = self;
    v8.super_class = (Class)STUASMCourseLibrary;
    -[STUASMCourseLibrary observeValueForKeyPath:ofObject:change:context:](&v8, "observeValueForKeyPath:ofObject:change:context:", a3, a4, a5);
  }
}

- (void)currentUserDidChange
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[STUASMCourseLibrary currentUserProvider](self, "currentUserProvider"));
  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentUser"));

  LODWORD(v3) = -[STUASMCourseLibrary isSignedInToStudentMAID](self, "isSignedInToStudentMAID");
  if ((_DWORD)v3 != objc_msgSend(v4, "isStudent"))
    -[STUASMCourseLibrary setSignedInToStudentMAID:](self, "setSignedInToStudentMAID:", objc_msgSend(v4, "isStudent"));

}

- (BOOL)isSignedInToStudentMAID
{
  return self->_signedInToStudentMAID;
}

- (void)setSignedInToStudentMAID:(BOOL)a3
{
  self->_signedInToStudentMAID = a3;
}

- (CRKASMSuspendableRosterProvider)rosterProvider
{
  return self->_rosterProvider;
}

- (CRKIDSPrimitives)IDSPrimitives
{
  return self->_IDSPrimitives;
}

- (CRKIDSAddressTranslator)IDSAddressTranslator
{
  return self->_IDSAddressTranslator;
}

- (STUASMEnrollmentRecordProvider)enrollmentRecordProvider
{
  return self->_enrollmentRecordProvider;
}

- (STUConcreteCertificateExchangeBroadcastHandlerDelegate)exchangeHandlerDelegate
{
  return self->_exchangeHandlerDelegate;
}

- (STUASMCertificateRefresher)certificateRefresher
{
  return self->_certificateRefresher;
}

- (CRKClassKitCurrentUserProvider)currentUserProvider
{
  return self->_currentUserProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentUserProvider, 0);
  objc_storeStrong((id *)&self->_certificateRefresher, 0);
  objc_storeStrong((id *)&self->_exchangeHandlerDelegate, 0);
  objc_storeStrong((id *)&self->_enrollmentRecordProvider, 0);
  objc_storeStrong((id *)&self->_IDSAddressTranslator, 0);
  objc_storeStrong((id *)&self->_IDSPrimitives, 0);
  objc_storeStrong((id *)&self->_rosterProvider, 0);
}

@end
