@implementation CLWMWatchOrientation

- (CLWMWatchOrientation)initWithDelegate:(id)a3 universeCopy:(id)a4 settings:(SettingStructure *)a5
{
  CLWMWatchOrientation *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CLWMWatchOrientation;
  result = -[CLWMBase init](&v9, "init");
  if (result)
  {
    *((_QWORD *)result + 5) = a3;
    *((_QWORD *)result + 6) = a4;
    *((_BYTE *)result + 96) = a5->disableWatchOrientation;
    *((_BYTE *)result + 97) = a5->disableWatchOnWristStatus;
    *((_QWORD *)result + 7) = 0x200000002;
    *((_QWORD *)result + 8) = 0;
    *((_DWORD *)result + 18) = 0;
    *((_QWORD *)result + 10) = 0;
    *(_DWORD *)((char *)result + 87) = 0;
    *((_DWORD *)result + 25) = 0;
  }
  return result;
}

- (void)stop
{
  -[CLWMWatchOrientation writeWatchOrientation](self, "writeWatchOrientation");
  -[CLWMWatchOrientation writeWatchOnWristStatus](self, "writeWatchOnWristStatus");
}

- (void)setupListener
{
  NSObject *v2;
  NSObject *v3;
  NSObject *v4;
  uint8_t buf[8];
  __int16 v6;
  const char *v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  const char *v11;

  if (!*((_QWORD *)self + 2))
    sub_100877814();
  if (qword_10229FE30 != -1)
    dispatch_once(&qword_10229FE30, &stru_1021D79A0);
  v2 = qword_10229FE38;
  if (os_log_type_enabled((os_log_t)qword_10229FE38, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 68289539;
    *(_DWORD *)&buf[4] = 0;
    v6 = 2082;
    v7 = "";
    v8 = 2082;
    v9 = "assert";
    v10 = 2081;
    v11 = "!_watchOrientationObserverClient";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Duplicate creation of watch orientation listener.\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    if (qword_10229FE30 != -1)
      dispatch_once(&qword_10229FE30, &stru_1021D79A0);
  }
  v3 = qword_10229FE38;
  if (os_signpost_enabled((os_log_t)qword_10229FE38))
  {
    *(_DWORD *)buf = 68289539;
    *(_DWORD *)&buf[4] = 0;
    v6 = 2082;
    v7 = "";
    v8 = 2082;
    v9 = "assert";
    v10 = 2081;
    v11 = "!_watchOrientationObserverClient";
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Duplicate creation of watch orientation listener.", "{\"msg%{public}.0s\":\"Duplicate creation of watch orientation listener.\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    if (qword_10229FE30 != -1)
      dispatch_once(&qword_10229FE30, &stru_1021D79A0);
  }
  v4 = qword_10229FE38;
  if (os_log_type_enabled((os_log_t)qword_10229FE38, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 68289539;
    *(_DWORD *)&buf[4] = 0;
    v6 = 2082;
    v7 = "";
    v8 = 2082;
    v9 = "assert";
    v10 = 2081;
    v11 = "!_watchOrientationObserverClient";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Duplicate creation of watch orientation listener.\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
  }
  abort_report_np("%s:%d: assertion failure in %s", "/Library/Caches/com.apple.xbs/Sources/CoreLocation/Daemon/Motion/Utilities/WorkoutRecordingModules/CLWMWatchOrientation.mm", 85, "-[CLWMWatchOrientation setupListener]");
}

- (void)teardownListeners
{
  uint64_t v3;

  v3 = *((_QWORD *)self + 2);
  *((_QWORD *)self + 2) = 0;
  if (v3)
    (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);
}

- (void)onWatchOrientationNotification:(const int *)a3 data:(const NotificationData *)a4
{
  __int128 v4;

  ++*((_DWORD *)self + 25);
  if (*a3 == 1)
  {
    v4 = *((_OWORD *)a4 + 1);
    *((_OWORD *)self + 4) = *(_OWORD *)a4;
    *((_OWORD *)self + 5) = v4;
    -[CLWMWatchOrientation writeWatchOnWristStatus](self, "writeWatchOnWristStatus");
  }
  else if (!*a3)
  {
    *((_QWORD *)self + 7) = *(_QWORD *)a4;
    -[CLWMWatchOrientation writeWatchOrientation](self, "writeWatchOrientation");
  }
}

- (void)writeWatchOrientation
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  _QWORD v9[446];
  uint64_t v10;
  char v11;

  v2 = *((_QWORD *)self + 3);
  if (v2 && *(_BYTE *)(v2 + 136) && !*((_BYTE *)self + 96))
  {
    sub_1015EB864(v9);
    -[CLWMBase makeSafeCFAbsoluteTime:](self, "makeSafeCFAbsoluteTime:", CFAbsoluteTimeGetCurrent());
    v11 |= 1u;
    v9[77] = v4;
    sub_101602E2C((uint64_t)v9);
    sub_101639C90(v10);
    v5 = v10;
    v6 = *(_QWORD *)(v10 + 8);
    v7 = *((_DWORD *)self + 15);
    *(_BYTE *)(v6 + 16) |= 1u;
    *(_DWORD *)(v6 + 8) = v7;
    v8 = *(_QWORD *)(v5 + 8);
    LODWORD(v6) = *((_DWORD *)self + 14);
    *(_BYTE *)(v8 + 16) |= 2u;
    *(_DWORD *)(v8 + 12) = v6;
    sub_1015E38D8(*((_QWORD *)self + 3), (uint64_t)v9);
    sub_1015EE304((PB::Base *)v9);
  }
}

- (void)writeWatchOnWristStatus
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  _QWORD v17[445];
  uint64_t v18;
  char v19;

  v2 = *((_QWORD *)self + 3);
  if (v2 && *(_BYTE *)(v2 + 136) && !*((_BYTE *)self + 97))
  {
    sub_1015EB864(v17);
    -[CLWMBase makeSafeCFAbsoluteTime:](self, "makeSafeCFAbsoluteTime:", CFAbsoluteTimeGetCurrent());
    v19 |= 1u;
    v17[77] = v4;
    sub_10160391C((uint64_t)v17);
    sub_10163987C(v18);
    v5 = v18;
    v6 = *(_QWORD *)(v18 + 8);
    v7 = *((_DWORD *)self + 16);
    *(_BYTE *)(v6 + 40) |= 4u;
    *(_DWORD *)(v6 + 24) = v7;
    v8 = *(_QWORD *)(v5 + 8);
    v9 = *((_DWORD *)self + 17);
    *(_BYTE *)(v8 + 40) |= 0x10u;
    *(_DWORD *)(v8 + 32) = v9;
    v10 = *(_QWORD *)(v5 + 8);
    v11 = *((_DWORD *)self + 18);
    *(_BYTE *)(v10 + 40) |= 8u;
    *(_DWORD *)(v10 + 28) = v11;
    v12 = *(_QWORD *)(v5 + 8);
    LOBYTE(v11) = *((_BYTE *)self + 88);
    *(_BYTE *)(v12 + 40) |= 0x40u;
    *(_BYTE *)(v12 + 37) = v11;
    v13 = *(_QWORD *)(v5 + 8);
    LOBYTE(v11) = *((_BYTE *)self + 89);
    *(_BYTE *)(v13 + 40) |= 0x20u;
    *(_BYTE *)(v13 + 36) = v11;
    v14 = *(_QWORD *)(v5 + 8);
    LOBYTE(v11) = *((_BYTE *)self + 90);
    *(_BYTE *)(v14 + 40) |= 0x80u;
    *(_BYTE *)(v14 + 38) = v11;
    v15 = *(_QWORD *)(v5 + 8);
    -[CLWMBase makeSafeCFAbsoluteTime:](self, "makeSafeCFAbsoluteTime:", (double)*((unint64_t *)self + 10));
    *(_BYTE *)(v15 + 40) |= 2u;
    *(_QWORD *)(v15 + 16) = (unint64_t)v16;
    sub_1015E38D8(*((_QWORD *)self + 3), (uint64_t)v17);
    sub_1015EE304((PB::Base *)v17);
  }
}

- (void)setWriter:(shared_ptr<CMMsl::WriterManager>)a3
{
  sub_100349198((_QWORD *)self + 3, (uint64_t *)a3.__ptr_);
}

- (int)getSampleCount
{
  return *((_DWORD *)self + 25);
}

- (void).cxx_destruct
{
  uint64_t v3;

  sub_100261F44((uint64_t)self + 24);
  v3 = *((_QWORD *)self + 2);
  *((_QWORD *)self + 2) = 0;
  if (v3)
    (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 4) = 0;
  return self;
}

@end
