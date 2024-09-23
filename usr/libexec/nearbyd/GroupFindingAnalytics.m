@implementation GroupFindingAnalytics

- (GroupFindingAnalytics)init
{
  -[GroupFindingAnalytics resetAnalytics](self, "resetAnalytics");
  return self;
}

- (void)updateTo1Finder1Findee
{
  self->_1Finder1Findee = 1;
}

- (void)updateWithFindeeRequestAt0Finder2Findee:(id)a3
{
  -[NSMutableSet addObject:](self->_findeeRequestAt0Finder2Findee, "addObject:", a3);
}

- (void)updateWithFindeeRequestAt1Finder1Findee:(id)a3
{
  -[NSMutableSet addObject:](self->_findeeRequestAt1Finder1Findee, "addObject:", a3);
}

- (void)updateWithFinderRequestAt0Finder2Findee:(id)a3
{
  -[NSMutableSet addObject:](self->_finderRequestAt0Finder2Findee, "addObject:", a3);
}

- (void)updateWithFindeeRequestAt1Finder2Findee:(id)a3
{
  -[NSMutableSet addObject:](self->_findeeRequestAt1Finder2Findee, "addObject:", a3);
}

- (void)updateTo0Finder2Findee
{
  self->_0Finder2Findee = 1;
}

- (void)updateToReciprocalFinding
{
  self->_reciprocalFinding = 1;
}

- (void)updateTo1Finder2Findee
{
  self->_1Finder2Findee = 1;
}

- (void)resetAnalytics
{
  NSMutableSet *v3;
  NSMutableSet *findeeRequestAt0Finder2Findee;
  NSMutableSet *v5;
  NSMutableSet *findeeRequestAt1Finder1Findee;
  NSMutableSet *v7;
  NSMutableSet *finderRequestAt0Finder2Findee;
  NSMutableSet *v9;
  NSMutableSet *findeeRequestAt1Finder2Findee;

  *(_DWORD *)&self->_1Finder1Findee = 0;
  v3 = objc_opt_new(NSMutableSet);
  findeeRequestAt0Finder2Findee = self->_findeeRequestAt0Finder2Findee;
  self->_findeeRequestAt0Finder2Findee = v3;

  v5 = objc_opt_new(NSMutableSet);
  findeeRequestAt1Finder1Findee = self->_findeeRequestAt1Finder1Findee;
  self->_findeeRequestAt1Finder1Findee = v5;

  v7 = objc_opt_new(NSMutableSet);
  finderRequestAt0Finder2Findee = self->_finderRequestAt0Finder2Findee;
  self->_finderRequestAt0Finder2Findee = v7;

  v9 = objc_opt_new(NSMutableSet);
  findeeRequestAt1Finder2Findee = self->_findeeRequestAt1Finder2Findee;
  self->_findeeRequestAt1Finder2Findee = v9;

}

- (void)submitAnalytics
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  void *v19;

  v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_0Finder2Findee));
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("0Finder2Findee"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_1Finder1Findee));
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("1Finder1Findee"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_1Finder2Findee));
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("1Finder2Findee"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_reciprocalFinding));
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("ReciprocalFinding"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", -[NSMutableSet count](self->_findeeRequestAt0Finder2Findee, "count")));
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("NumberOfUniqueFindeeRequestsAt0Finder2Findee"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", -[NSMutableSet count](self->_finderRequestAt0Finder2Findee, "count")));
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("NumberOfUniqueFinderRequestsAt0Finder2Findee"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", -[NSMutableSet count](self->_findeeRequestAt1Finder1Findee, "count")));
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("NumberOfUniqueFindeeRequestsAt1Finder1Findee"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", -[NSMutableSet count](self->_findeeRequestAt1Finder2Findee, "count")));
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("NumberOfUniqueFinderRequestsAt1Finder2Findee"));

  v12 = objc_msgSend(v3, "mutableCopy");
  v13 = (id)qword_10085F520;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("com.apple.nearbyinteraction.groupfinding"), "description"));
    *(_DWORD *)buf = 138412290;
    v19 = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "#ni-ca,send group finding  analytics event:\n%@\n", buf, 0xCu);

  }
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10003A0D0;
  v16[3] = &unk_1007FA568;
  v15 = v12;
  v17 = v15;
  AnalyticsSendEventLazy(CFSTR("com.apple.nearbyinteraction.groupfinding"), v16);
  -[GroupFindingAnalytics resetAnalytics](self, "resetAnalytics");

}

- (id)descriptions
{
  NSMutableArray *v3;
  const char *v4;
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;
  void *v9;
  const char *v10;
  void *v11;
  const char *v12;
  void *v13;
  const char *v14;
  void *v15;
  const char *v16;
  void *v17;
  const char *v18;
  void *v19;

  v3 = objc_opt_new(NSMutableArray);
  if (self->_1Finder1Findee)
    v4 = "YES";
  else
    v4 = "NO";
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(1,1): %s"), v4));
  -[NSMutableArray addObject:](v3, "addObject:", v5);

  if (self->_0Finder2Findee)
    v6 = "YES";
  else
    v6 = "NO";
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(0,2): %s"), v6));
  -[NSMutableArray addObject:](v3, "addObject:", v7);

  if (self->_reciprocalFinding)
    v8 = "YES";
  else
    v8 = "NO";
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(1<->1): %s"), v8));
  -[NSMutableArray addObject:](v3, "addObject:", v9);

  if (self->_1Finder2Findee)
    v10 = "YES";
  else
    v10 = "NO";
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(1,2): %s"), v10));
  -[NSMutableArray addObject:](v3, "addObject:", v11);

  if (-[NSMutableSet count](self->_findeeRequestAt0Finder2Findee, "count"))
    v12 = "YES";
  else
    v12 = "NO";
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(0,2) + Findee: %s"), v12));
  -[NSMutableArray addObject:](v3, "addObject:", v13);

  if (-[NSMutableSet count](self->_finderRequestAt0Finder2Findee, "count"))
    v14 = "YES";
  else
    v14 = "NO";
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(0,2) + Finder: %s"), v14));
  -[NSMutableArray addObject:](v3, "addObject:", v15);

  if (-[NSMutableSet count](self->_findeeRequestAt1Finder1Findee, "count"))
    v16 = "YES";
  else
    v16 = "NO";
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(1,1) + Findee: %s"), v16));
  -[NSMutableArray addObject:](v3, "addObject:", v17);

  if (-[NSMutableSet count](self->_findeeRequestAt1Finder2Findee, "count"))
    v18 = "YES";
  else
    v18 = "NO";
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(1,2) + Findee: %s"), v18));
  -[NSMutableArray addObject:](v3, "addObject:", v19);

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_findeeRequestAt1Finder2Findee, 0);
  objc_storeStrong((id *)&self->_findeeRequestAt1Finder1Findee, 0);
  objc_storeStrong((id *)&self->_finderRequestAt0Finder2Findee, 0);
  objc_storeStrong((id *)&self->_findeeRequestAt0Finder2Findee, 0);
}

@end
