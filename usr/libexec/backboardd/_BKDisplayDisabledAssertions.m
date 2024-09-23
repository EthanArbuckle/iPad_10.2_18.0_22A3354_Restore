@implementation _BKDisplayDisabledAssertions

- (_BKDisplayDisabledAssertions)init
{
  _BKDisplayDisabledAssertions *v2;
  _BKDisplayDisabledAssertions *v3;
  uint64_t v4;
  NSMutableDictionary *lock_assertionsByVPID;
  uint64_t v6;
  BSCompoundAssertion *displayDisabledAssertion;
  _BKDisplayDisabledAssertions *v8;
  _QWORD v10[5];
  _QWORD v11[5];
  id v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)_BKDisplayDisabledAssertions;
  v2 = -[_BKDisplayDisabledAssertions init](&v13, "init");
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    lock_assertionsByVPID = v3->_lock_assertionsByVPID;
    v3->_lock_assertionsByVPID = (NSMutableDictionary *)v4;

    v11[0] = 0;
    v11[1] = v11;
    v11[2] = 0x3032000000;
    v11[3] = sub_1000348CC;
    v11[4] = sub_1000348DC;
    v12 = (id)objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000348E4;
    v10[3] = &unk_1000EA5E8;
    v10[4] = v11;
    v6 = objc_claimAutoreleasedReturnValue(+[BSCompoundAssertion assertionWithIdentifier:stateDidChangeHandler:](BSCompoundAssertion, "assertionWithIdentifier:stateDidChangeHandler:", CFSTR("com.apple.backboardd.display-disabled"), v10));
    displayDisabledAssertion = v3->_displayDisabledAssertion;
    v3->_displayDisabledAssertion = (BSCompoundAssertion *)v6;

    v8 = v3;
    _Block_object_dispose(v11, 8);

  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayDisabledAssertion, 0);
  objc_storeStrong((id *)&self->_lock_assertionsByVPID, 0);
}

@end
