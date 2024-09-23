@implementation CLWMHeadsetDeviceMotion

- (CLWMHeadsetDeviceMotion)initWithDelegate:(id)a3 universeCopy:(id)a4 settings:(SettingStructure *)a5
{
  CLWMHeadsetDeviceMotion *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CLWMHeadsetDeviceMotion;
  result = -[CLWMBase init](&v9, "init");
  if (result)
  {
    result->_delegate = (CLWorkoutRecordingDelegate *)a3;
    result->_universe = (CLIntersiloUniverse *)a4;
    result->_headsetDMupdateInterval = a5[1].kPrivacyPressureMaxOffset;
    result->_lowLatencyMode = LOBYTE(a5[1].magIntervalSeconds);
    result->_dmBufferSize = HIDWORD(a5[1].magIntervalSeconds);
  }
  return result;
}

- (void)setupListener
{
  BOOL lowLatencyMode;

  if (self->_headsetDMupdateInterval > 0.0 && sub_10141A388())
  {
    if (self->_dmBufferSize)
    {
      lowLatencyMode = self->_lowLatencyMode;
      *(_BYTE *)(sub_10141A388() + 28) = lowLatencyMode;
      -[CLWorkoutRecordingDelegate silo](self->_delegate, "silo");
      operator new();
    }
  }
}

- (void)teardownListeners
{
  uint64_t v3;
  Dispatcher *value;
  NSObject *v5;
  uint64_t v6;
  Dispatcher *v7;
  NSObject *v8;
  const char *v9;
  uint8_t *v10;
  const char *v11;
  uint8_t *v12;
  uint64_t v13;
  _WORD v14[8];
  uint8_t buf[1640];

  if (self->_accessoryDeviceMotionDispatcher.__ptr_.__value_)
  {
    v3 = sub_10141A388();
    sub_1000A4A6C(v3, 0, (uint64_t)self->_accessoryDeviceMotionDispatcher.__ptr_.__value_);
    value = self->_accessoryDeviceMotionDispatcher.__ptr_.__value_;
    self->_accessoryDeviceMotionDispatcher.__ptr_.__value_ = 0;
    if (value)
      (*(void (**)(Dispatcher *))(*(_QWORD *)value + 8))(value);
    if (qword_10229FE30 != -1)
      dispatch_once(&qword_10229FE30, &stru_1021D6E88);
    v5 = qword_10229FE38;
    if (os_log_type_enabled((os_log_t)qword_10229FE38, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Tearing down accessory DM", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE30 != -1)
        dispatch_once(&qword_10229FE30, &stru_1021D6E88);
      v14[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE38, 2, "Tearing down accessory DM", v14, 2);
      v10 = (uint8_t *)v9;
      sub_100512490("Generic", 1, 0, 2, "-[CLWMHeadsetDeviceMotion teardownListeners]", "%s\n", v9);
      if (v10 != buf)
        free(v10);
    }
  }
  if (self->_accessoryDeviceMotionConfigDispatcher.__ptr_.__value_)
  {
    v6 = sub_10141A388();
    sub_1000A4A6C(v6, 1, (uint64_t)self->_accessoryDeviceMotionConfigDispatcher.__ptr_.__value_);
    v7 = self->_accessoryDeviceMotionConfigDispatcher.__ptr_.__value_;
    self->_accessoryDeviceMotionConfigDispatcher.__ptr_.__value_ = 0;
    if (v7)
      (*(void (**)(Dispatcher *))(*(_QWORD *)v7 + 8))(v7);
    if (qword_10229FE30 != -1)
      dispatch_once(&qword_10229FE30, &stru_1021D6E88);
    v8 = qword_10229FE38;
    if (os_log_type_enabled((os_log_t)qword_10229FE38, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Tearing down accessory DM config", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE30 != -1)
        dispatch_once(&qword_10229FE30, &stru_1021D6E88);
      v14[0] = 0;
      LODWORD(v13) = 2;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE38, 2, "Tearing down accessory DM config", v14, v13);
      v12 = (uint8_t *)v11;
      sub_100512490("Generic", 1, 0, 2, "-[CLWMHeadsetDeviceMotion teardownListeners]", "%s\n", v11);
      if (v12 != buf)
        free(v12);
    }
  }
}

- (void)onAccessoryDeviceMotionData:(const void *)a3 buffersize:(unsigned int)a4
{
  WriterManager *ptr;
  uint64_t v7;
  uint64_t v8;
  CFAbsoluteTime Current;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  float v30;
  uint64_t v31;
  float v32;
  uint64_t v33;
  uint64_t v34;
  int v35;
  _QWORD v36[46];
  uint64_t v37;
  CFAbsoluteTime v38;
  char v39;
  __int128 __src;
  uint64_t v41;

  ptr = self->_writer.__ptr_;
  if (ptr && a4 && *((_BYTE *)ptr + 136))
  {
    v7 = 0;
    v8 = 144 * a4;
    do
    {
      sub_1015EB864(v36);
      sub_1016032DC((uint64_t)v36);
      Current = CFAbsoluteTimeGetCurrent();
      v39 |= 1u;
      v38 = Current;
      sub_1015B89BC(v37);
      v10 = *(_QWORD *)(v37 + 72);
      v11 = *(_QWORD *)((char *)a3 + v7 + 64);
      *(_BYTE *)(v10 + 152) |= 2u;
      *(_QWORD *)(v10 + 136) = v11;
      __src = *(_OWORD *)((char *)a3 + v7);
      sub_1002A3054((char *)(*(_QWORD *)(v37 + 72) + 56), (char *)&__src, (uint64_t)&v41, 4uLL);
      *(_QWORD *)&__src = *(_QWORD *)((char *)a3 + v7 + 16);
      DWORD2(__src) = *(_DWORD *)((char *)a3 + v7 + 24);
      sub_1002A3054((char *)(*(_QWORD *)(v37 + 72) + 80), (char *)&__src, (uint64_t)&__src + 12, 3uLL);
      *(_QWORD *)&__src = *(_QWORD *)((char *)a3 + v7 + 28);
      DWORD2(__src) = *(_DWORD *)((char *)a3 + v7 + 36);
      sub_1002A3054((char *)(*(_QWORD *)(v37 + 72) + 32), (char *)&__src, (uint64_t)&__src + 12, 3uLL);
      *(_QWORD *)&__src = *(_QWORD *)((char *)a3 + v7 + 40);
      DWORD2(__src) = *(_DWORD *)((char *)a3 + v7 + 48);
      sub_1002A3054((char *)(*(_QWORD *)(v37 + 72) + 104), (char *)&__src, (uint64_t)&__src + 12, 3uLL);
      v12 = *(_QWORD *)(v37 + 72);
      v13 = (char *)a3 + v7;
      v14 = *(unsigned __int16 *)((char *)a3 + v7 + 52);
      *(_BYTE *)(v12 + 152) |= 4u;
      *(_DWORD *)(v12 + 144) = v14;
      v15 = *(_QWORD *)(v37 + 72);
      v16 = *(_QWORD *)((char *)a3 + v7 + 56);
      *(_BYTE *)(v15 + 152) |= 1u;
      *(_QWORD *)(v15 + 128) = v16;
      *(_QWORD *)&__src = *(_QWORD *)((char *)a3 + v7 + 80);
      DWORD2(__src) = *(_DWORD *)((char *)a3 + v7 + 88);
      sub_1002A3054((char *)(v37 + 8), (char *)&__src, (uint64_t)&__src + 12, 3uLL);
      v17 = v37;
      v18 = *(_DWORD *)((char *)a3 + v7 + 92);
      *(_WORD *)(v37 + 116) |= 0x40u;
      *(_DWORD *)(v17 + 96) = v18;
      v19 = v37;
      v20 = *(_DWORD *)((char *)a3 + v7 + 96);
      *(_WORD *)(v37 + 116) |= 0x20u;
      *(_DWORD *)(v19 + 92) = v20;
      v21 = v37;
      v22 = *(_DWORD *)((char *)a3 + v7 + 100);
      *(_WORD *)(v37 + 116) |= 0x100u;
      *(_DWORD *)(v21 + 104) = v22;
      v23 = v37;
      if (*(_DWORD *)((char *)a3 + v7 + 104) == 2)
        v24 = 1;
      else
        v24 = 2;
      *(_WORD *)(v37 + 116) |= 0x10u;
      *(_DWORD *)(v23 + 88) = v24;
      v25 = v37;
      v26 = *((_DWORD *)v13 + 27);
      *(_WORD *)(v37 + 116) |= 0x200u;
      *(_DWORD *)(v25 + 108) = v26;
      v27 = v37;
      v28 = *((_QWORD *)v13 + 14);
      *(_WORD *)(v37 + 116) |= 1u;
      *(_QWORD *)(v27 + 56) = v28;
      v29 = v37;
      v30 = *((double *)v13 + 9);
      *(_WORD *)(v37 + 116) |= 8u;
      *(float *)(v29 + 84) = v30;
      v31 = v37;
      v32 = *((double *)v13 + 15);
      *(_WORD *)(v37 + 116) |= 0x80u;
      *(float *)(v31 + 100) = v32;
      v33 = v37;
      LOBYTE(v28) = v13[143];
      *(_WORD *)(v37 + 116) |= 0x400u;
      *(_BYTE *)(v33 + 112) = v28;
      if (v13[140])
      {
        *(_QWORD *)&__src = *(_QWORD *)((char *)a3 + v7 + 128);
        DWORD2(__src) = *(_DWORD *)((char *)a3 + v7 + 136);
        sub_1002A3054((char *)(v37 + 32), (char *)&__src, (uint64_t)&__src + 12, 3uLL);
      }
      if (*((_BYTE *)a3 + v7 + 142))
      {
        v34 = v37;
        v35 = *((unsigned __int8 *)a3 + v7 + 141);
        *(_WORD *)(v37 + 116) |= 4u;
        *(_DWORD *)(v34 + 80) = v35;
      }
      sub_1015E38D8((uint64_t)self->_writer.__ptr_, (uint64_t)v36);
      sub_1015EE304((PB::Base *)v36);
      v7 += 144;
    }
    while (v8 != v7);
  }
}

- (void)onAccessoryDeviceMotionConfig:(const void *)a3 buffersize:(unsigned int)a4
{
  WriterManager *ptr;
  uint64_t v6;
  _OWORD *v7;
  CFAbsoluteTime Current;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  _QWORD v16[17];
  uint64_t v17;
  CFAbsoluteTime v18;
  char v19;
  __int128 __src;
  uint64_t v21;

  ptr = self->_writer.__ptr_;
  if (ptr && a4 && *((_BYTE *)ptr + 136))
  {
    v6 = a4;
    v7 = (char *)a3 + 80;
    do
    {
      sub_1015EB864(v16);
      sub_101605B18((uint64_t)v16);
      Current = CFAbsoluteTimeGetCurrent();
      v19 |= 1u;
      v18 = Current;
      sub_1015AA064(v17);
      v9 = *(_QWORD *)(v17 + 32);
      v10 = *((_DWORD *)v7 - 20);
      *(_BYTE *)(v9 + 32) |= 2u;
      *(_DWORD *)(v9 + 28) = v10;
      v11 = *(_QWORD *)(v17 + 32);
      sub_100AB8834(v11);
      std::string::operator=(*(std::string **)(v11 + 8), (const std::string *)v7 - 3);
      v12 = *(_QWORD *)(v17 + 32);
      sub_100BF2E38(v12);
      std::string::operator=(*(std::string **)(v12 + 16), (const std::string *)v7 - 2);
      v13 = *(_QWORD *)(v17 + 32);
      v14 = *((_DWORD *)v7 - 6);
      *(_BYTE *)(v13 + 32) |= 1u;
      *(_DWORD *)(v13 + 24) = v14;
      v15 = v17;
      LOBYTE(v14) = *((_BYTE *)v7 - 4);
      *(_BYTE *)(v17 + 44) |= 1u;
      *(_BYTE *)(v15 + 40) = v14;
      __src = *v7;
      sub_1002A3054((char *)(v17 + 8), (char *)&__src, (uint64_t)&v21, 4uLL);
      sub_1015E38D8((uint64_t)self->_writer.__ptr_, (uint64_t)v16);
      sub_1015EE304((PB::Base *)v16);
      v7 += 6;
      --v6;
    }
    while (v6);
  }
}

- (void)setWriter:(shared_ptr<CMMsl::WriterManager>)a3
{
  sub_100349198(&self->_writer.__ptr_, (uint64_t *)a3.__ptr_);
}

- (void).cxx_destruct
{
  Dispatcher *value;
  Dispatcher *v4;

  sub_100261F44((uint64_t)&self->_writer);
  value = self->_accessoryDeviceMotionConfigDispatcher.__ptr_.__value_;
  self->_accessoryDeviceMotionConfigDispatcher.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(Dispatcher *))(*(_QWORD *)value + 8))(value);
  v4 = self->_accessoryDeviceMotionDispatcher.__ptr_.__value_;
  self->_accessoryDeviceMotionDispatcher.__ptr_.__value_ = 0;
  if (v4)
    (*(void (**)(Dispatcher *))(*(_QWORD *)v4 + 8))(v4);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 4) = 0;
  *((_QWORD *)self + 5) = 0;
  return self;
}

@end
