@implementation STUASMClassSessionBrowser

- (void)dealloc
{
  objc_super v3;

  -[STUASMClassSessionBrowser cancelRosterObservation](self, "cancelRosterObservation");
  v3.receiver = self;
  v3.super_class = (Class)STUASMClassSessionBrowser;
  -[STUASMClassSessionBrowser dealloc](&v3, "dealloc");
}

- (STUASMClassSessionBrowser)initWithRosterProvider:(id)a3 IDSPrimitives:(id)a4 IDSAddressTranslator:(id)a5
{
  id v9;
  id v10;
  id v11;
  STUASMClassSessionBrowser *v12;
  STUASMClassSessionBrowser *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)STUASMClassSessionBrowser;
  v12 = -[STUASMClassSessionBrowser init](&v15, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_rosterProvider, a3);
    objc_storeStrong((id *)&v13->_IDSPrimitives, a4);
    objc_storeStrong((id *)&v13->_IDSAddressTranslator, a5);
    v13->_suspended = 1;
  }

  return v13;
}

- (void)beginBrowsingForConnections
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;

  v3 = objc_alloc((Class)CRKCatalystIDSPrimitives);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUASMClassSessionBrowser IDSPrimitives](self, "IDSPrimitives"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUASMClassSessionBrowser IDSAddressTranslator](self, "IDSAddressTranslator"));
  v15 = objc_msgSend(v3, "initWithPrimitives:addressTranslator:", v4, v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[CRKUnionAssertionProvider activeIDSClassSessionAssertionProviderWithPrefix:](CRKUnionAssertionProvider, "activeIDSClassSessionAssertionProviderWithPrefix:", CFSTR("com.apple.studentd")));
  v7 = objc_alloc((Class)CATIDSServiceConnectionTerminal);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[STUASMClassSessionBrowser rosterProvider](self, "rosterProvider"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "roster"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "user"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "appleID"));
  v12 = objc_msgSend(v7, "initWithIDSPrimitives:assertionProvider:sourceAppleID:", v15, v6, v11);
  -[STUASMClassSessionBrowser setConnectionTerminal:](self, "setConnectionTerminal:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[STUASMClassSessionBrowser connectionTerminal](self, "connectionTerminal"));
  objc_msgSend(v13, "setDelegate:", self);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[STUASMClassSessionBrowser connectionTerminal](self, "connectionTerminal"));
  objc_msgSend(v14, "resume");

}

- (void)endBrowsingForConnections
{
  -[STUASMClassSessionBrowser setConnectionTerminal:](self, "setConnectionTerminal:", 0);
}

- (void)beginObservingRoster
{
  void *v4;
  NSString *v5;
  void *v6;
  id v7;

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v5 = NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUASMClassSessionBrowser.m"), 76, CFSTR("%@ must be called from the main thread"), v6);

  }
  if (!-[STUASMClassSessionBrowser isObservingRoster](self, "isObservingRoster"))
  {
    -[STUASMClassSessionBrowser setObservingRoster:](self, "setObservingRoster:", 1);
    v7 = (id)objc_claimAutoreleasedReturnValue(-[STUASMClassSessionBrowser rosterProvider](self, "rosterProvider"));
    objc_msgSend(v7, "addObserver:forKeyPath:options:context:", self, CFSTR("roster"), 7, CFSTR("STUASMClassSessionBroswerObservationContext"));

  }
}

- (void)endObservingRoster
{
  void *v4;
  NSString *v5;
  void *v6;

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v5 = NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUASMClassSessionBrowser.m"), 90, CFSTR("%@ must be called from the main thread"), v6);

  }
  if (-[STUASMClassSessionBrowser isObservingRoster](self, "isObservingRoster"))
  {
    -[STUASMClassSessionBrowser setObservingRoster:](self, "setObservingRoster:", 0);
    -[STUASMClassSessionBrowser cancelRosterObservation](self, "cancelRosterObservation");
  }
}

- (void)cancelRosterObservation
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[STUASMClassSessionBrowser rosterProvider](self, "rosterProvider"));
  objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, CFSTR("roster"), CFSTR("STUASMClassSessionBroswerObservationContext"));

}

- (void)delegateOutLostCoursesWithOldRoster:(id)a3 newRoster:(id)a4
{
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[STUASMClassSessionBrowser lostCourseIdentifiersWithOldRoster:newRoster:](self, "lostCourseIdentifiersWithOldRoster:newRoster:", a3, a4));
  if (objc_msgSend(v6, "count"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUASMClassSessionBrowser delegate](self, "delegate"));
    objc_msgSend(v5, "classSessionBrowser:lostEnrollmentInCourses:", self, v6);

  }
}

- (id)lostCourseIdentifiersWithOldRoster:(id)a3 newRoster:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[STUASMRosterQueryUtilities courseIdentifiersInRoster:](STUASMRosterQueryUtilities, "courseIdentifiersInRoster:", a3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[STUASMRosterQueryUtilities courseIdentifiersInRoster:](STUASMRosterQueryUtilities, "courseIdentifiersInRoster:", v5));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "crk_setBySubtractingSet:", v7));
  return v8;
}

- (BOOL)isBrowsing
{
  return !-[STUASMClassSessionBrowser isSuspended](self, "isSuspended");
}

- (void)resume
{
  id v4;
  NSObject *v5;
  void *v6;
  NSString *v7;
  void *v8;
  uint8_t buf[16];

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v7 = NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUASMClassSessionBrowser.m"), 129, CFSTR("%@ must be called from the main thread"), v8);

  }
  if (-[STUASMClassSessionBrowser isSuspended](self, "isSuspended"))
  {
    v4 = sub_10001FA84();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Resuming browsing for ASM classes over IDS", buf, 2u);
    }

    -[STUASMClassSessionBrowser setSuspended:](self, "setSuspended:", 0);
    -[STUASMClassSessionBrowser beginObservingRoster](self, "beginObservingRoster");
  }
}

- (void)suspend
{
  id v4;
  NSObject *v5;
  void *v6;
  NSString *v7;
  void *v8;
  uint8_t buf[16];

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v7 = NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUASMClassSessionBrowser.m"), 141, CFSTR("%@ must be called from the main thread"), v8);

  }
  if (!-[STUASMClassSessionBrowser isSuspended](self, "isSuspended"))
  {
    v4 = sub_10001FA84();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Suspending browsing for ASM classes over IDS", buf, 2u);
    }

    -[STUASMClassSessionBrowser setSuspended:](self, "setSuspended:", 1);
    -[STUASMClassSessionBrowser endObservingRoster](self, "endObservingRoster");
  }
}

- (void)serviceConnectionTerminalDidResume:(id)a3
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = sub_10001FA84();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "ASMClassSessionBrowser IDS connection terminal resumed.", v5, 2u);
  }

}

- (void)serviceConnectionTerminal:(id)a3 establishedConnection:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  uint8_t v14[16];

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "metadata"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userInfo"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CRKASMClassSessionInvitation instanceWithDictionary:](CRKASMClassSessionInvitation, "instanceWithDictionary:", v7));

  if (v8)
  {
    v9 = sub_10001FA84();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "ASMClassSessionBrowser established IDS transport.", v14, 2u);
    }

    v11 = objc_msgSend(objc_alloc((Class)CATIDSServiceTransport), "initWithConnection:", v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[STUASMClassSessionBrowser delegate](self, "delegate"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "sessionIdentifier"));
    objc_msgSend(v12, "classSessionBrowser:foundSessionWithIdentifier:transport:", self, v13, v11);

  }
}

- (void)serviceConnectionTerminal:(id)a3 shouldEstablishConnection:(id)a4 responseHandler:(id)a5
{
  id v7;
  void (**v8)(id, uint64_t, _QWORD);
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  unsigned __int8 v19;
  id v20;
  NSObject *v21;
  NSObject *v22;
  id v23;
  NSObject *v24;
  uint64_t v25;
  id v26;
  NSObject *v27;
  uint64_t v28;
  id v29;
  NSObject *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  _QWORD v35[4];
  id v36;
  uint8_t buf[4];
  id v38;

  v7 = a4;
  v8 = (void (**)(id, uint64_t, _QWORD))a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "userInfo"));

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "userInfo"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[CRKASMClassSessionInvitation instanceWithDictionary:](CRKASMClassSessionInvitation, "instanceWithDictionary:", v10));

    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "sessionIdentifier"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "groupIdentifier"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[STUASMClassSessionBrowser rosterProvider](self, "rosterProvider"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "roster"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[STUASMRosterQueryUtilities courseWithIdentifier:inRoster:](STUASMRosterQueryUtilities, "courseWithIdentifier:inRoster:", v13, v15));

      if (v16)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "trustedUsers"));
        v35[0] = _NSConcreteStackBlock;
        v35[1] = 3221225472;
        v35[2] = sub_1000200B0;
        v35[3] = &unk_1000CA168;
        v18 = v11;
        v36 = v18;
        v19 = objc_msgSend(v17, "crk_containsObjectMatchingPredicate:", v35);

        v20 = sub_10001FA84();
        v21 = objc_claimAutoreleasedReturnValue(v20);
        v22 = v21;
        if ((v19 & 1) != 0)
        {
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543362;
            v38 = v18;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "ASMClassSessionBrowser granting permission to connect for invitation %{public}@", buf, 0xCu);
          }

          v8[2](v8, 1, 0);
        }
        else
        {
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            sub_10007B038();

          v33 = CRKErrorWithCodeAndUserInfo(203, 0);
          v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
          ((void (**)(id, uint64_t, void *))v8)[2](v8, 0, v34);

        }
        v32 = v36;
      }
      else
      {
        v29 = sub_10001FA84();
        v30 = objc_claimAutoreleasedReturnValue(v29);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          sub_10007B00C();

        v31 = CRKErrorWithCodeAndUserInfo(202, 0);
        v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
        ((void (**)(id, uint64_t, void *))v8)[2](v8, 0, v32);
      }

    }
    else
    {
      v26 = sub_10001FA84();
      v27 = objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        sub_10007AF90(v7);

      v28 = CATErrorWithCodeAndUserInfo(2, &off_1000D3038);
      v16 = (void *)objc_claimAutoreleasedReturnValue(v28);
      ((void (**)(id, uint64_t, void *))v8)[2](v8, 0, v16);
    }

  }
  else
  {
    v23 = sub_10001FA84();
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      sub_10007AF64();

    v25 = CATErrorWithCodeAndUserInfo(2, &off_1000D3010);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v25);
    ((void (**)(id, uint64_t, void *))v8)[2](v8, 0, v11);
  }

}

- (BOOL)serviceConnectionTerminal:(id)a3 shouldTrustAppleID:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  BOOL v8;
  id v9;
  NSObject *v10;
  int v12;
  id v13;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[STUASMClassSessionBrowser rosterProvider](self, "rosterProvider"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "roster"));
  v8 = +[STUASMRosterQueryUtilities trustedUserWithAppleID:existsInRoster:](STUASMRosterQueryUtilities, "trustedUserWithAppleID:existsInRoster:", v5, v7);

  if (!v8)
  {
    v9 = sub_10001FA84();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v12 = 138543362;
      v13 = v5;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "ASMClassSessionBrowser does not grant permisssion to communicate with %{public}@.", (uint8_t *)&v12, 0xCu);
    }

  }
  return v8;
}

- (void)serviceConnectionTerminal:(id)a3 receivedRejectionWithMetadata:(id)a4 error:(id)a5
{
  id v5;
  NSObject *v6;

  v5 = sub_10001FA84();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    sub_10007B064();

}

- (void)serviceConnectionTerminal:(id)a3 timedOutOnInvitationWithMetadata:(id)a4
{
  id v4;
  id v5;
  NSObject *v6;

  v4 = a4;
  v5 = sub_10001FA84();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    sub_10007B090(v4);

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  void *v11;
  void *v12;
  objc_super v13;

  v10 = a5;
  if (a6 == CFSTR("STUASMClassSessionBroswerObservationContext"))
  {
    if (objc_msgSend(a3, "isEqualToString:", CFSTR("roster")))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "crk_keyValueObservingOldObject"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "crk_keyValueObservingNewObject"));
      -[STUASMClassSessionBrowser delegateOutLostCoursesWithOldRoster:newRoster:](self, "delegateOutLostCoursesWithOldRoster:newRoster:", v11, v12);
      if (v12)
        -[STUASMClassSessionBrowser beginBrowsingForConnections](self, "beginBrowsingForConnections");
      else
        -[STUASMClassSessionBrowser endBrowsingForConnections](self, "endBrowsingForConnections");

    }
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)STUASMClassSessionBrowser;
    -[STUASMClassSessionBrowser observeValueForKeyPath:ofObject:change:context:](&v13, "observeValueForKeyPath:ofObject:change:context:", a3, a4, v10, a6);
  }

}

- (STUClassSessionBrowsingDelegate)delegate
{
  return (STUClassSessionBrowsingDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CRKASMRosterProviding)rosterProvider
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

- (BOOL)isSuspended
{
  return self->_suspended;
}

- (void)setSuspended:(BOOL)a3
{
  self->_suspended = a3;
}

- (BOOL)isObservingRoster
{
  return self->_observingRoster;
}

- (void)setObservingRoster:(BOOL)a3
{
  self->_observingRoster = a3;
}

- (CATIDSServiceConnectionTerminal)connectionTerminal
{
  return self->_connectionTerminal;
}

- (void)setConnectionTerminal:(id)a3
{
  objc_storeStrong((id *)&self->_connectionTerminal, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionTerminal, 0);
  objc_storeStrong((id *)&self->_IDSAddressTranslator, 0);
  objc_storeStrong((id *)&self->_IDSPrimitives, 0);
  objc_storeStrong((id *)&self->_rosterProvider, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
