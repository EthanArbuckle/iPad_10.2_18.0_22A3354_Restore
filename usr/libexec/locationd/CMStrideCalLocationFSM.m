@implementation CMStrideCalLocationFSM

- (int)locationState
{
  return self->fLocationState;
}

- (void)feedPedometerData:(const NotificationData *)a3
{
  _BYTE v4[320];

  if (self->fLocationState >= 2)
  {
    memcpy(v4, a3, sizeof(v4));
    -[CalTrackFinder updatePedometerBuffer:](self->fTrackFinder, "updatePedometerBuffer:", v4);
  }
}

- (void)dealloc
{
  objc_super v3;

  -[CalTrackFinder stop](self->fTrackFinder, "stop");

  v3.receiver = self;
  v3.super_class = (Class)CMStrideCalLocationFSM;
  -[CMStrideCalLocationFSM dealloc](&v3, "dealloc");
}

- (void)requestTransitionToLocationState:(int)a3
{
  NSObject *v5;
  int fLocationState;
  int v7;
  CalTrackFinder *fTrackFinder;
  CalTrackFinder *v9;
  uint64_t v10;
  int v11;
  const char *v12;
  uint8_t *v13;
  _QWORD v14[5];
  _DWORD v15[2];
  __int16 v16;
  int v17;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  int v21;

  if (qword_10229FCD0 != -1)
    dispatch_once(&qword_10229FCD0, &stru_10217DC40);
  v5 = qword_10229FCD8;
  if (os_log_type_enabled((os_log_t)qword_10229FCD8, OS_LOG_TYPE_DEBUG))
  {
    fLocationState = self->fLocationState;
    *(_DWORD *)buf = 67109376;
    v19 = fLocationState;
    v20 = 1024;
    v21 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "fLocationState %d state %d", buf, 0xEu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FCD0 != -1)
      dispatch_once(&qword_10229FCD0, &stru_10217DC40);
    v11 = self->fLocationState;
    v15[0] = 67109376;
    v15[1] = v11;
    v16 = 1024;
    v17 = a3;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FCD8, 2, "fLocationState %d state %d", v15, 14);
    v13 = (uint8_t *)v12;
    sub_100512490("Generic", 1, 0, 2, "-[CMStrideCalLocationFSM requestTransitionToLocationState:]", "%s\n", v12);
    if (v13 != buf)
      free(v13);
  }
  v7 = self->fLocationState;
  if (v7 != a3 && (a3 == 1 || v7))
  {
    fTrackFinder = self->fTrackFinder;
    if (a3 < 2)
    {
      -[CalTrackFinder stop](fTrackFinder, "stop");

      self->fTrackFinder = 0;
    }
    else if (!fTrackFinder)
    {
      v9 = objc_alloc_init(CalTrackFinder);
      self->fTrackFinder = v9;
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_100CC0944;
      v14[3] = &unk_10217DC20;
      v14[4] = self;
      -[CalTrackFinder setCalTrackHandler:](v9, "setCalTrackHandler:", v14);
    }
    v10 = self->fLocationState;
    self->fLocationState = a3;
    if ((objc_opt_respondsToSelector(-[CMStrideCalLocationFSM delegate](self, "delegate"), "fsm:didTransitionFromState:toState:") & 1) != 0)-[CMStrideCalLocationFSMDelegate fsm:didTransitionFromState:toState:](-[CMStrideCalLocationFSM delegate](self, "delegate"), "fsm:didTransitionFromState:toState:", self, v10, self->fLocationState);
  }
}

- (int)originDeviceToGpsSource:(int)a3 locationType:(int)a4
{
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;

  sub_100197040();
  v6 = sub_100195F08();
  v7 = 4 * (a4 == 3);
  if (a4 == 1)
    v7 = 2;
  if (a4 == 3)
    v8 = 3;
  else
    v8 = 0;
  if (a4 == 1)
    v8 = 1;
  if (a3 != 1)
    v8 = 0;
  if (a3 != 2)
    v7 = v8;
  if (a4 == 3)
    v9 = 3;
  else
    v9 = 0;
  if (a4 == 1)
  {
    v9 = 1;
    v10 = 2;
  }
  else
  {
    v10 = 4 * (a4 == 3);
  }
  if (a3 != 1)
    v10 = 0;
  if (a3 == 2)
    v10 = v9;
  if (v6)
    return v10;
  else
    return v7;
}

- (void)feedLocationData:(const void *)a3
{
  int v5;
  double v6;
  id v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _OWORD v12[8];
  _OWORD v13[2];

  if (self->fLocationState >= 2 && (*((_DWORD *)a3 + 24) | 2) == 3)
  {
    v5 = -[CMStrideCalLocationFSM originDeviceToGpsSource:locationType:](self, "originDeviceToGpsSource:locationType:", *((unsigned int *)a3 + 128));
    if (self->fSource != v5)
    {
      self->fSource = v5;
      if ((objc_opt_respondsToSelector(-[CMStrideCalLocationFSM delegate](self, "delegate"), "fsm:didUpdateSource:") & 1) != 0)
        -[CMStrideCalLocationFSMDelegate fsm:didUpdateSource:](-[CMStrideCalLocationFSM delegate](self, "delegate"), "fsm:didUpdateSource:", self, self->fSource);
    }
    v6 = *(double *)((char *)a3 + 76);
    v7 = objc_alloc((Class)CLLocation);
    v8 = *((_OWORD *)a3 + 7);
    v12[6] = *((_OWORD *)a3 + 6);
    v12[7] = v8;
    v13[0] = *((_OWORD *)a3 + 8);
    *(_OWORD *)((char *)v13 + 12) = *(_OWORD *)((char *)a3 + 140);
    v9 = *((_OWORD *)a3 + 3);
    v12[2] = *((_OWORD *)a3 + 2);
    v12[3] = v9;
    v10 = *((_OWORD *)a3 + 5);
    v12[4] = *((_OWORD *)a3 + 4);
    v12[5] = v10;
    v11 = *((_OWORD *)a3 + 1);
    v12[0] = *(_OWORD *)a3;
    v12[1] = v11;
    -[CalTrackFinder updateGpsLocationBuffer:gpsSource:](self->fTrackFinder, "updateGpsLocationBuffer:gpsSource:", objc_msgSend(v7, "initWithClientLocation:", v12), self->fSource);
    if ((objc_opt_respondsToSelector(-[CMStrideCalLocationFSM delegate](self, "delegate"), "fsm:didUpdateLocationAtTime:") & 1) != 0)-[CMStrideCalLocationFSMDelegate fsm:didUpdateLocationAtTime:](-[CMStrideCalLocationFSM delegate](self, "delegate"), "fsm:didUpdateLocationAtTime:", self, v6);
  }
}

- (void)feedGpsOdometerData:(const NotificationData *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  _OWORD v9[12];

  if (self->fLocationState >= 2)
  {
    v3 = *((_OWORD *)a3 + 9);
    v9[8] = *((_OWORD *)a3 + 8);
    v9[9] = v3;
    v4 = *((_OWORD *)a3 + 11);
    v9[10] = *((_OWORD *)a3 + 10);
    v9[11] = v4;
    v5 = *((_OWORD *)a3 + 5);
    v9[4] = *((_OWORD *)a3 + 4);
    v9[5] = v5;
    v6 = *((_OWORD *)a3 + 7);
    v9[6] = *((_OWORD *)a3 + 6);
    v9[7] = v6;
    v7 = *((_OWORD *)a3 + 1);
    v9[0] = *(_OWORD *)a3;
    v9[1] = v7;
    v8 = *((_OWORD *)a3 + 3);
    v9[2] = *((_OWORD *)a3 + 2);
    v9[3] = v8;
    -[CalTrackFinder updateGpsOdometerBuffer:](self->fTrackFinder, "updateGpsOdometerBuffer:", v9);
  }
}

- (CMStrideCalLocationFSMDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (CMStrideCalLocationFSMDelegate *)a3;
}

@end
