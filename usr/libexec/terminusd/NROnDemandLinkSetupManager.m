@implementation NROnDemandLinkSetupManager

- (void)didUpdatePHSState:(BOOL)a3 llphsActive:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  dispatch_time_t v7;
  OS_dispatch_queue *queue;
  NSObject *v9;
  id *p_location;
  id v11;
  void *v12;
  void *v13;
  id v14;
  _BOOL4 v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  dispatch_time_t v19;
  NSObject *v20;
  OS_dispatch_source *phsSource;
  NSObject *v22;
  id v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  RPCompanionLinkClient *browser;
  NSObject *v28;
  _QWORD block[4];
  id v30;
  _QWORD v31[4];
  NSObject *v32;
  id v33;
  id from[4];
  NSObject *v35;
  id v36;
  id location;
  uint64_t v38;
  void *v39;
  void *v40;
  NSObject *v41;
  NROnDemandLinkSetupManager *v42;
  id v43;
  id v44;

  v4 = a4;
  v5 = a3;
  if (qword_1001E4518 != -1)
    dispatch_once(&qword_1001E4518, &stru_1001B6140);
  if (_NRLogIsLevelEnabled(qword_1001E4510, 0))
  {
    if (qword_1001E4518 != -1)
      dispatch_once(&qword_1001E4518, &stru_1001B6140);
    _NRLogWithArgs(qword_1001E4510, 0, "%s%.30s:%-4d received PHS state update phs:%d/llphs:%d", ", "-[NROnDemandLinkSetupManager didUpdatePHSState:llphsActive:]", 431, v5, v4);
  }
  if (!self
    || !self->_subscribedForPHSStateUpdates
    || ((self->_isPHSActive ^ v5) & 1) == 0 && self->_isLLPHSActive == v4)
  {
    return;
  }
  self->_isPHSActive = v5;
  self->_isLLPHSActive = v4;
  if (!v5 && !v4)
  {
    objc_initWeak(&location, self);
    v7 = dispatch_time(0, 5000000000);
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100010DE0;
    block[3] = &unk_1001B7F28;
    v9 = queue;
    objc_copyWeak(&v30, &location);
    dispatch_after(v7, v9, block);

    objc_destroyWeak(&v30);
    p_location = &location;
LABEL_14:
    objc_destroyWeak(p_location);
    return;
  }
  *(_WORD *)&self->_isPHSProvider = 0;
  objc_opt_self(NRLinkDirector);
  if (qword_1001E4710 != -1)
    dispatch_once(&qword_1001E4710, &stru_1001B6E60);
  v11 = (id)qword_1001E4708;
  v12 = v11;
  if (v11)
    v13 = (void *)*((_QWORD *)v11 + 6);
  else
    v13 = 0;
  v14 = v13;
  v15 = sub_100146970((uint64_t)v14);

  v16 = 13;
  if (!v15)
    v16 = 14;
  *((_BYTE *)&self->super.isa + v16) = 1;
  v17 = sub_10014CFBC();
  dispatch_async(v17, &stru_1001B69D0);

  if (self->_phsSource)
  {
    if (self->_isPHSClient)
      goto LABEL_24;
LABEL_27:
    if (self->_isPHSProvider)
      sub_1000110C4((uint64_t)self);
    return;
  }
  v18 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_queue);
  v19 = dispatch_time(0, 60000000000);
  dispatch_source_set_timer(v18, v19, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  objc_initWeak(from, self);
  location = _NSConcreteStackBlock;
  v38 = 3221225472;
  v39 = sub_100013464;
  v40 = &unk_1001B87F0;
  objc_copyWeak((id *)&v42, from);
  v20 = v18;
  v41 = v20;
  dispatch_source_set_event_handler(v20, &location);
  dispatch_activate(v20);
  phsSource = self->_phsSource;
  self->_phsSource = (OS_dispatch_source *)v20;
  v22 = v20;

  objc_destroyWeak((id *)&v42);
  objc_destroyWeak(from);
  if (!self->_isPHSClient)
    goto LABEL_27;
LABEL_24:
  if (self->_browserActivated)
  {
    sub_100010FA4((uint64_t)self);
    return;
  }
  if (!self->_browser)
  {
    v23 = objc_alloc_init((Class)RPCompanionLinkClient);
    objc_msgSend(v23, "setDispatchQueue:", self->_queue);
    objc_msgSend(v23, "setControlFlags:", 6);
    objc_initWeak(&v44, self);
    location = _NSConcreteStackBlock;
    v38 = 3221225472;
    v39 = sub_100013164;
    v40 = &unk_1001B5FE0;
    objc_copyWeak(&v43, &v44);
    v24 = v23;
    v41 = v24;
    v42 = self;
    -[NSObject setDeviceFoundHandler:](v24, "setDeviceFoundHandler:", &location);
    from[0] = _NSConcreteStackBlock;
    from[1] = (id)3221225472;
    from[2] = sub_100013260;
    from[3] = &unk_1001B6008;
    objc_copyWeak(&v36, &v44);
    v25 = v24;
    v35 = v25;
    -[NSObject setDeviceLostHandler:](v25, "setDeviceLostHandler:", from);
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_100013350;
    v31[3] = &unk_1001B7A40;
    objc_copyWeak(&v33, &v44);
    v26 = v25;
    v32 = v26;
    -[NSObject activateWithCompletion:](v26, "activateWithCompletion:", v31);
    browser = self->_browser;
    self->_browser = (RPCompanionLinkClient *)v26;
    v28 = v26;

    objc_destroyWeak(&v33);
    objc_destroyWeak(&v36);

    objc_destroyWeak(&v43);
    p_location = &v44;
    goto LABEL_14;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_validPeersForInternetRelay, 0);
  objc_storeStrong((id *)&self->_deviceIdentifierToRegistrationPSK, 0);
  objc_storeStrong((id *)&self->_pendingRequests, 0);
  objc_storeStrong((id *)&self->_messengers, 0);
  objc_storeStrong((id *)&self->_browser, 0);
  objc_storeStrong((id *)&self->_receiver, 0);
  objc_storeStrong((id *)&self->_phsSource, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
