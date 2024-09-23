@implementation STUASMEnrollmentRecordProvider

- (void)dealloc
{
  objc_super v3;

  -[STUASMEnrollmentRecordProvider stopObservingRoster](self, "stopObservingRoster");
  v3.receiver = self;
  v3.super_class = (Class)STUASMEnrollmentRecordProvider;
  -[STUASMEnrollmentRecordProvider dealloc](&v3, "dealloc");
}

- (STUASMEnrollmentRecordProvider)initWithRosterProvider:(id)a3
{
  id v5;
  STUASMEnrollmentRecordProvider *v6;
  STUASMEnrollmentRecordProvider *v7;
  NSSet *v8;
  NSSet *enrollmentRecords;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)STUASMEnrollmentRecordProvider;
  v6 = -[STUASMEnrollmentRecordProvider init](&v11, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_rosterProvider, a3);
    v8 = objc_opt_new(NSSet);
    enrollmentRecords = v7->_enrollmentRecords;
    v7->_enrollmentRecords = v8;

    -[STUASMEnrollmentRecordProvider startObservingRoster](v7, "startObservingRoster");
  }

  return v7;
}

- (void)startObservingRoster
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[STUASMEnrollmentRecordProvider rosterProvider](self, "rosterProvider"));
  objc_msgSend(v3, "addObserver:forKeyPath:options:context:", self, CFSTR("roster"), 4, CFSTR("ObservationContext"));

}

- (void)stopObservingRoster
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[STUASMEnrollmentRecordProvider rosterProvider](self, "rosterProvider"));
  objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, CFSTR("roster"), CFSTR("ObservationContext"));

}

- (void)rosterDidChange
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  id v10;
  NSObject *v11;
  uint8_t v12[16];
  uint8_t buf[16];

  v3 = sub_100034BF4();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "ASM roster did change", buf, 2u);
  }

  v5 = objc_claimAutoreleasedReturnValue(-[STUASMEnrollmentRecordProvider makeEnrollmentRecords](self, "makeEnrollmentRecords"));
  v6 = objc_claimAutoreleasedReturnValue(-[STUASMEnrollmentRecordProvider enrollmentRecords](self, "enrollmentRecords"));
  if (v6 | v5)
  {
    v7 = (void *)v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[STUASMEnrollmentRecordProvider enrollmentRecords](self, "enrollmentRecords"));
    v9 = objc_msgSend(v8, "isEqual:", v5);

    if ((v9 & 1) == 0)
    {
      v10 = sub_100034BF4();
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "ASM enrollment records did change", v12, 2u);
      }

      -[STUASMEnrollmentRecordProvider setEnrollmentRecords:](self, "setEnrollmentRecords:", v5);
    }
  }

}

- (id)makeEnrollmentRecords
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSMutableSet *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSSet *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[STUASMEnrollmentRecordProvider rosterProvider](self, "rosterProvider"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "roster"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "user"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[STUASMEnrollmentRecordProvider makeUserWithASMUser:role:](self, "makeUserWithASMUser:role:", v5, 1));

    v7 = objc_opt_new(NSMutableSet);
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "courses", 0));
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v17;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v8);
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[STUASMEnrollmentRecordProvider makeEnrollmentRecordWithCourse:groupUser:](self, "makeEnrollmentRecordWithCourse:groupUser:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v12), v6));
          -[NSMutableSet addObject:](v7, "addObject:", v13);

          v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v10);
    }

    v14 = (NSSet *)-[NSMutableSet copy](v7, "copy");
  }
  else
  {
    v14 = objc_opt_new(NSSet);
  }

  return v14;
}

- (id)makeEnrollmentRecordWithCourse:(id)a3 groupUser:(id)a4
{
  id v6;
  id v7;
  STUControlGroupEnrollmentRecord *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  STUControlGroupEnrollmentRecord *v15;
  uint64_t v17;
  uint64_t v18;

  v6 = a4;
  v7 = a3;
  v8 = [STUControlGroupEnrollmentRecord alloc];
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "name"));
  v11 = objc_msgSend(v7, "mascot");
  v12 = objc_msgSend(v7, "color");
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "trustedUsers"));

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[STUASMEnrollmentRecordProvider makeInstructorsByIdentifierWithTrustedUsers:](self, "makeInstructorsByIdentifierWithTrustedUsers:", v13));
  LOBYTE(v18) = 0;
  LOBYTE(v17) = 0;
  v15 = -[STUControlGroupEnrollmentRecord initWithGroupIdentifier:groupName:groupDescription:groupMascotType:groupColorType:rollingCourseIdentitySet:instructorsByIdentifier:trustedAnchorCertificatePersistentIDs:groupUser:requestingUnenroll:automaticRemovalDate:type:hidden:](v8, "initWithGroupIdentifier:groupName:groupDescription:groupMascotType:groupColorType:rollingCourseIdentitySet:instructorsByIdentifier:trustedAnchorCertificatePersistentIDs:groupUser:requestingUnenroll:automaticRemovalDate:type:hidden:", v9, v10, 0, v11, v12, 0, v14, &__NSArray0__struct, v6, v17, 0, 2, v18);

  return v15;
}

- (id)makeInstructorsByIdentifierWithTrustedUsers:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v4 = a3;
  v5 = objc_opt_new(NSMutableDictionary);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[STUASMEnrollmentRecordProvider makeUserWithASMUser:role:](self, "makeUserWithASMUser:role:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v10), 2, (_QWORD)v15));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "userIdentifier"));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v11, v12);

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  v13 = -[NSMutableDictionary copy](v5, "copy");
  return v13;
}

- (id)makeUserWithASMUser:(id)a3 role:(int64_t)a4
{
  id v5;
  CRKUser *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v5 = a3;
  v6 = objc_opt_new(CRKUser);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
  -[CRKUser setUserIdentifier:](v6, "setUserIdentifier:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "nameComponents"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "fullName"));
  -[CRKUser setDisplayName:](v6, "setDisplayName:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "nameComponents"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "givenName"));
  -[CRKUser setGivenName:](v6, "setGivenName:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "nameComponents"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "familyName"));
  -[CRKUser setFamilyName:](v6, "setFamilyName:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "nameComponents"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "phoneticGivenName"));
  -[CRKUser setPhoneticGivenName:](v6, "setPhoneticGivenName:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "nameComponents"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "phoneticFamilyName"));
  -[CRKUser setPhoneticFamilyName:](v6, "setPhoneticFamilyName:", v17);

  -[CRKUser setUseMeCardIfAvailable:](v6, "setUseMeCardIfAvailable:", 0);
  -[CRKUser setRole:](v6, "setRole:", a4);
  return v6;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  objc_super v13;

  if (a6 == CFSTR("ObservationContext"))
  {
    v11 = a4;
    v12 = (id)objc_claimAutoreleasedReturnValue(-[STUASMEnrollmentRecordProvider rosterProvider](self, "rosterProvider"));

    if (v12 == v11)
      -[STUASMEnrollmentRecordProvider rosterDidChange](self, "rosterDidChange");
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)STUASMEnrollmentRecordProvider;
    v10 = a4;
    -[STUASMEnrollmentRecordProvider observeValueForKeyPath:ofObject:change:context:](&v13, "observeValueForKeyPath:ofObject:change:context:", a3, v10, a5, a6);

  }
}

- (NSSet)enrollmentRecords
{
  return self->_enrollmentRecords;
}

- (void)setEnrollmentRecords:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (CRKASMRosterProviding)rosterProvider
{
  return self->_rosterProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rosterProvider, 0);
  objc_storeStrong((id *)&self->_enrollmentRecords, 0);
}

@end
