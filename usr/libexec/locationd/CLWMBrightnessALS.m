@implementation CLWMBrightnessALS

- (CLWMBrightnessALS)initWithDelegate:(id)a3 universeCopy:(id)a4 settings:(SettingStructure *)a5
{
  CLWMBrightnessALS *result;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CLWMBrightnessALS;
  result = -[CLWMBase init](&v8, "init", a3, a4, a5);
  if (result)
  {
    result->_delegate = (CLWorkoutRecordingDelegate *)a3;
    result->_universe = (CLIntersiloUniverse *)a4;
    result->_brightnessSystemClient = 0;
    result->_sampleCount = 0;
  }
  return result;
}

- (void)setupListener
{
  BrightnessSystemClient *v3;
  _QWORD v4[5];

  v3 = (BrightnessSystemClient *)objc_alloc_init((Class)BrightnessSystemClient);
  self->_brightnessSystemClient = v3;
  if (v3)
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_1018D1BC0;
    v4[3] = &unk_1021D7980;
    v4[4] = self;
    -[BrightnessSystemClient registerNotificationBlock:forProperties:](v3, "registerNotificationBlock:forProperties:", v4, &off_102220BD0);
    -[BrightnessSystemClient setProperty:forKey:](self->_brightnessSystemClient, "setProperty:forKey:", (id)CFMakeCollectable(kCFBooleanTrue), CFSTR("ActivateALS"));
  }
}

- (void)teardownListeners
{
  BrightnessSystemClient *brightnessSystemClient;

  brightnessSystemClient = self->_brightnessSystemClient;
  if (brightnessSystemClient)
  {

    self->_brightnessSystemClient = 0;
  }
}

- (void)handleBrightnessClientNotification:(id)a3 withValue:(id)a4
{
  WriterManager *ptr;
  uint64_t v7;
  uint64_t v8;
  int v9;
  _QWORD v10[430];
  uint64_t v11;
  char v12;

  ptr = self->_writer.__ptr_;
  if (ptr && *((_BYTE *)ptr + 136))
  {
    if (self->_brightnessSystemClient)
    {
      ++self->_sampleCount;
      sub_1015EB864(v10);
      -[CLWMBase makeSafeCFAbsoluteTime:](self, "makeSafeCFAbsoluteTime:", CFAbsoluteTimeGetCurrent());
      v12 |= 1u;
      v10[77] = v7;
      sub_101603408((uint64_t)v10);
      sub_101636170(v11);
      v8 = *(_QWORD *)(v11 + 8);
      objc_msgSend(a4, "floatValue");
      *(_BYTE *)(v8 + 12) |= 1u;
      *(_DWORD *)(v8 + 8) = v9;
      sub_1015E38D8((uint64_t)self->_writer.__ptr_, (uint64_t)v10);
      sub_1015EE304((PB::Base *)v10);
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
  sub_100261F44((uint64_t)&self->_writer);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 4) = 0;
  return self;
}

@end
