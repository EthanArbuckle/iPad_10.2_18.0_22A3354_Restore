@implementation BKDirectTouchState

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateEvents, 0);
  objc_storeStrong((id *)&self->_hitTestRegions, 0);
  objc_storeStrong((id *)&self->_latentSystemGestureDestinations, 0);
  objc_storeStrong((id *)&self->_centroidPerUserIdentifier, 0);
  objc_storeStrong((id *)&self->_contactsByContextID, 0);
  objc_storeStrong((id *)&self->_destinationsByContextID, 0);
  objc_storeStrong((id *)&self->_contacts, 0);
  objc_storeStrong((id *)&self->_eventSystemInterface, 0);
  objc_storeStrong((id *)&self->_annotationController, 0);
  objc_storeStrong((id *)&self->_touchLifecycleObservers, 0);
  objc_storeStrong((id *)&self->_touchDeliveryObservationManager, 0);
  objc_storeStrong((id *)&self->_touchDeliveryPolicyServer, 0);
  objc_storeStrong((id *)&self->_dispatcher, 0);
  objc_storeStrong((id *)&self->_displayInfo, 0);
  objc_storeStrong((id *)&self->_suppressTouchesAssertion, 0);
  objc_storeStrong((id *)&self->_hitTester, 0);
  objc_storeStrong((id *)&self->_eventProcessor, 0);
  objc_storeStrong((id *)&self->_service, 0);
}

- (void)invalidate
{
  uint64_t v3;
  NSObject *v4;
  BKDirectTouchStateHitTester *hitTester;
  BKDirectTouchUpdateEvents *updateEvents;
  BSCompoundAssertion *suppressTouchesAssertion;
  int v8;
  BKDirectTouchState *v9;

  v3 = BKLogTouchEvents(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138543362;
    v9 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "invalidate: %{public}@", (uint8_t *)&v8, 0xCu);
  }

  sub_10000C61C(self, 0, 0);
  sub_100009EB4((uint64_t)self, 0, 0);
  -[BKDirectTouchStateHitTester invalidate](self->_hitTester, "invalidate");
  hitTester = self->_hitTester;
  self->_hitTester = 0;

  -[BKDirectTouchUpdateEvents invalidate](self->_updateEvents, "invalidate");
  updateEvents = self->_updateEvents;
  self->_updateEvents = 0;

  -[BSCompoundAssertion invalidate](self->_suppressTouchesAssertion, "invalidate");
  suppressTouchesAssertion = self->_suppressTouchesAssertion;
  self->_suppressTouchesAssertion = 0;

}

- (void)appendDescriptionToFormatter:(id)a3
{
  _QWORD v3[6];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100008BF0;
  v3[3] = &unk_1000ECD80;
  v3[4] = self;
  v3[5] = a3;
  objc_msgSend(a3, "appendProem:block:", self, v3);
}

- (NSString)description
{
  return (NSString *)+[BSDescriptionStream descriptionForRootObject:](BSDescriptionStream, "descriptionForRootObject:", self);
}

- (BKDirectTouchState)init
{
  uint64_t v4;
  uint64_t v5;
  void *v7;
  NSString *v8;
  id v9;
  uint64_t v10;
  objc_class *v11;
  NSString *v12;
  void *v13;
  objc_super v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  BKDirectTouchState *v20;
  __int16 v21;
  const __CFString *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  void *v26;

  v4 = objc_opt_class(self, a2);
  if (v4 != objc_opt_class(BKDirectTouchState, v5))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Subclasses not allowed")));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v8 = NSStringFromSelector(a2);
      v9 = (id)objc_claimAutoreleasedReturnValue(v8);
      v11 = (objc_class *)objc_opt_class(self, v10);
      v12 = NSStringFromClass(v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      *(_DWORD *)buf = 138544642;
      v16 = v9;
      v17 = 2114;
      v18 = v13;
      v19 = 2048;
      v20 = self;
      v21 = 2114;
      v22 = CFSTR("BKDirectTouchState.mm");
      v23 = 1024;
      v24 = 188;
      v25 = 2114;
      v26 = v7;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    _bs_set_crash_log_message(objc_msgSend(objc_retainAutorelease(v7), "UTF8String"));
    __break(0);
    JUMPOUT(0x1000827A4);
  }
  v14.receiver = self;
  v14.super_class = (Class)BKDirectTouchState;
  return -[BKDirectTouchState init](&v14, "init");
}

@end
