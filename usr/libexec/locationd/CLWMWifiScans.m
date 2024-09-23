@implementation CLWMWifiScans

- (CLWMWifiScans)initWithDelegate:(id)a3 universeCopy:(id)a4 settings:(SettingStructure *)a5
{
  CLWMWifiScans *v8;
  CLWMWifiScans *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CLWMWifiScans;
  v8 = -[CLWMBase init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    v8->_delegate = (CLWorkoutRecordingDelegate *)a3;
    v8->_universe = (CLIntersiloUniverse *)a4;
    v8->_disableWifiScans = a5->disableWifiScans;
    v8->_wifiLookupTable = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v9->_sampleCount = 0;
  }
  return v9;
}

- (void)setupListener
{
  sub_1001B7DEC();
}

- (void)teardownListeners
{
  Client *value;

  value = self->_wifiClient.__ptr_.__value_;
  self->_wifiClient.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(Client *))(*(_QWORD *)value + 8))(value);
}

- (void)dealloc
{
  objc_super v3;

  self->_wifiLookupTable = 0;
  v3.receiver = self;
  v3.super_class = (Class)CLWMWifiScans;
  -[CLWMBase dealloc](&v3, "dealloc");
}

- (void)removeAllObjects
{
  -[NSMutableArray removeAllObjects](self->_wifiLookupTable, "removeAllObjects");
}

- (void)onWifiScanNotification:(const int *)a3 data:(const void *)a4
{
  WriterManager *ptr;
  void *v5;
  _QWORD v6[5];

  ptr = self->_writer.__ptr_;
  if (ptr && *((_BYTE *)ptr + 136) && !self->_disableWifiScans)
  {
    ++self->_sampleCount;
    if (*a3 == 3)
    {
      v5 = (void *)*((_QWORD *)self->_wifiClient.__ptr_.__value_ + 2);
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_1018E91C8;
      v6[3] = &unk_1021D8440;
      v6[4] = self;
      objc_msgSend(v5, "fetchScanResultWithReply:", v6, a4);
    }
  }
}

- (void)setWriter:(shared_ptr<CMMsl::WriterManager>)a3
{
  sub_100349198(&self->_writer.__ptr_, (uint64_t *)a3.__ptr_);
}

- (int)getSampleCount
{
  return self->_sampleCount;
}

- (void).cxx_destruct
{
  Client *value;

  value = self->_wifiClient.__ptr_.__value_;
  self->_wifiClient.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(Client *, SEL))(*(_QWORD *)value + 8))(value, a2);
  sub_100261F44((uint64_t)&self->_writer);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 6) = 0;
  return self;
}

@end
