@implementation RidesharingPartySizeSelectionAlertController

+ (id)ridesharingPartySizeSelectionAlertControllerWithRequestRideStatus:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id *v8;
  id v9;
  _QWORD *v10;
  _QWORD v12[4];
  id v13;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "rideOption"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "partySizeSelectionPrompt"));
  v8 = (id *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "alertControllerWithTitle:message:preferredStyle:", 0, v7, 0));

  objc_storeStrong(v8 + 2, a3);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100885E44;
  v12[3] = &unk_1011D9E10;
  v13 = v5;
  v9 = v5;
  v10 = objc_retainBlock(v12);
  ((void (*)(_QWORD *, id *))v10[2])(v10, v8);

  return v8;
}

- (id)didFinishSelectingPartySize
{
  return self->_didFinishSelectingPartySize;
}

- (void)setDidFinishSelectingPartySize:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (RideBookingRequestRideStatus)requestRideStatus
{
  return self->_requestRideStatus;
}

- (void)setRequestRideStatus:(id)a3
{
  objc_storeStrong((id *)&self->_requestRideStatus, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestRideStatus, 0);
  objc_storeStrong(&self->_didFinishSelectingPartySize, 0);
}

@end
