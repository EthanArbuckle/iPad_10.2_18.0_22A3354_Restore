@implementation STUClassSessionSnapshotManager

- (STUClassSessionSnapshotManager)init
{
  STUClassSessionSnapshotManager *v2;
  NSSet *v3;
  NSSet *inRangeClassSessions;
  NSMutableDictionary *v5;
  NSMutableDictionary *snapshotsBySessionIdentifier;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)STUClassSessionSnapshotManager;
  v2 = -[STUClassSessionSnapshotManager init](&v8, "init");
  if (v2)
  {
    v3 = objc_opt_new(NSSet);
    inRangeClassSessions = v2->_inRangeClassSessions;
    v2->_inRangeClassSessions = v3;

    v5 = objc_opt_new(NSMutableDictionary);
    snapshotsBySessionIdentifier = v2->_snapshotsBySessionIdentifier;
    v2->_snapshotsBySessionIdentifier = v5;

  }
  return v2;
}

- (void)classSessionDidConnect:(id)a3
{
  unsigned int v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = -[STUClassSessionSnapshotManager isSessionEligibleForSnapshotting:](self, "isSessionEligibleForSnapshotting:", v7);
  v5 = v7;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[STUClassSessionSnapshotManager identifierForSession:](self, "identifierForSession:", v7));
    if (v6
      && -[STUClassSessionSnapshotManager removeSnapshotForSessionIdentifier:](self, "removeSnapshotForSessionIdentifier:", v6))
    {
      -[STUClassSessionSnapshotManager instructorsDidChange](self, "instructorsDidChange");
    }

    v5 = v7;
  }

}

- (void)classSessionDidDisconnect:(id)a3
{
  unsigned int v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = -[STUClassSessionSnapshotManager isSessionEligibleForSnapshotting:](self, "isSessionEligibleForSnapshotting:", v7);
  v5 = v7;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[STUClassSessionSnapshotManager identifierForSession:](self, "identifierForSession:", v7));
    if (v6 && -[STUClassSessionSnapshotManager isSessionIdentifierInRange:](self, "isSessionIdentifierInRange:", v6))
    {
      -[STUClassSessionSnapshotManager snapshotSession:withIdentifier:](self, "snapshotSession:withIdentifier:", v7, v6);
      -[STUClassSessionSnapshotManager instructorsDidChange](self, "instructorsDidChange");
    }

    v5 = v7;
  }

}

- (void)inRangeClassSessionsDidChange:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUClassSessionSnapshotManager inRangeClassSessions](self, "inRangeClassSessions"));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "crk_setBySubtractingSet:", v4));

  -[STUClassSessionSnapshotManager setInRangeClassSessions:](self, "setInRangeClassSessions:", v4);
  if (-[STUClassSessionSnapshotManager removeSnapshotsForSessionIdentifiers:](self, "removeSnapshotsForSessionIdentifiers:", v6))
  {
    -[STUClassSessionSnapshotManager instructorsDidChange](self, "instructorsDidChange");
  }

}

- (id)operationsToGenerateIdleInstructorsWithDaemon:(id)a3 includeImages:(BOOL)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  BOOL v13;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[STUClassSessionSnapshotManager snapshotsBySessionIdentifier](self, "snapshotsBySessionIdentifier"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10003966C;
  v11[3] = &unk_1000CA9A8;
  v12 = v6;
  v13 = a4;
  v8 = v6;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "crk_mapUsingBlock:", v11));

  return v9;
}

- (unint64_t)countOfIdleClassSessions
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[STUClassSessionSnapshotManager snapshotsBySessionIdentifier](self, "snapshotsBySessionIdentifier"));
  v3 = objc_msgSend(v2, "count");

  return (unint64_t)v3;
}

- (BOOL)isSessionEligibleForSnapshotting:(id)a3
{
  void *v3;
  unsigned __int8 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "stu_info"));
  v4 = objc_msgSend(v3, "isEligibleForSessionSnapshotting");

  return v4;
}

- (void)instructorsDidChange
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[STUClassSessionSnapshotManager delegate](self, "delegate"));
  objc_msgSend(v3, "snapshotManagerDidUpdateIdleInstructors:", self);

}

- (void)snapshotSession:(id)a3 withIdentifier:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "stu_info"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[STUClassSessionSnapshotManager snapshotsBySessionIdentifier](self, "snapshotsBySessionIdentifier"));
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, v6);

}

- (id)identifierForSession:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUClassSessionSnapshotManager delegate](self, "delegate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "snapshotManager:identifierForSession:", self, v4));

  if (!v6)
  {
    if (qword_1000FC328 != -1)
      dispatch_once(&qword_1000FC328, &stru_1000CA9C8);
    v7 = qword_1000FC320;
    if (os_log_type_enabled((os_log_t)qword_1000FC320, OS_LOG_TYPE_ERROR))
      sub_10007C1B8((uint64_t)v4, v7);
  }

  return v6;
}

- (BOOL)removeSnapshotsForSessionIdentifiers:(id)a3
{
  id v4;
  id v5;
  id v6;
  int v7;
  uint64_t v8;
  void *i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v4);
        v7 |= -[STUClassSessionSnapshotManager removeSnapshotForSessionIdentifier:](self, "removeSnapshotForSessionIdentifier:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i));
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7 & 1;
}

- (BOOL)removeSnapshotForSessionIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUClassSessionSnapshotManager snapshotsBySessionIdentifier](self, "snapshotsBySessionIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v4));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[STUClassSessionSnapshotManager snapshotsBySessionIdentifier](self, "snapshotsBySessionIdentifier"));
    objc_msgSend(v7, "setObject:forKeyedSubscript:", 0, v4);

  }
  return v6 != 0;
}

- (BOOL)isSessionIdentifierInRange:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUClassSessionSnapshotManager inRangeClassSessions](self, "inRangeClassSessions"));
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

- (STUClassSessionSnapshotManagerDelegate)delegate
{
  return (STUClassSessionSnapshotManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSSet)inRangeClassSessions
{
  return self->_inRangeClassSessions;
}

- (void)setInRangeClassSessions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSMutableDictionary)snapshotsBySessionIdentifier
{
  return self->_snapshotsBySessionIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshotsBySessionIdentifier, 0);
  objc_storeStrong((id *)&self->_inRangeClassSessions, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
