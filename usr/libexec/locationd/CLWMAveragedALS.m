@implementation CLWMAveragedALS

- (CLWMAveragedALS)initWithDelegate:(id)a3 universeCopy:(id)a4 settings:(SettingStructure *)a5
{
  CLWMAveragedALS *result;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CLWMAveragedALS;
  result = -[CLWMBase init](&v8, "init", a3, a4, a5);
  if (result)
  {
    result->_delegate = (CLWorkoutRecordingDelegate *)a3;
    result->_universe = (CLIntersiloUniverse *)a4;
    result->_sampleCount = 0;
  }
  return result;
}

- (void)setupListener
{
  -[CLWorkoutRecordingDelegate silo](self->_delegate, "silo");
  operator new();
}

- (void)teardownListeners
{
  uint64_t v3;
  Dispatcher *value;

  v3 = sub_1001FBB04(0);
  sub_1000A4A6C(v3, 31, (uint64_t)self->_averagedALSDispatcher.__ptr_.__value_);
  value = self->_averagedALSDispatcher.__ptr_.__value_;
  self->_averagedALSDispatcher.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(Dispatcher *))(*(_QWORD *)value + 8))(value);
}

- (void)onAveragedALSData:(const void *)a3
{
  WriterManager *ptr;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[433];
  uint64_t v12;
  char v13;

  ptr = self->_writer.__ptr_;
  if (ptr)
  {
    if (*((_BYTE *)ptr + 136))
    {
      ++self->_sampleCount;
      v5 = *(_QWORD *)a3;
      v6 = *((_DWORD *)a3 + 2);
      sub_1015EB864(v11);
      -[CLWMBase makeSafeCFAbsoluteTime:](self, "makeSafeCFAbsoluteTime:", CFAbsoluteTimeGetCurrent());
      v13 |= 1u;
      v11[77] = v7;
      sub_101603E94((uint64_t)v11);
      sub_101636BD0(v12);
      v8 = v12;
      v9 = *(_QWORD *)(v12 + 8);
      *(_BYTE *)(v9 + 20) |= 1u;
      *(_QWORD *)(v9 + 8) = v5;
      v10 = *(_QWORD *)(v8 + 8);
      *(_BYTE *)(v10 + 20) |= 2u;
      *(_DWORD *)(v10 + 16) = v6;
      sub_1015E38D8((uint64_t)self->_writer.__ptr_, (uint64_t)v11);
      sub_1015EE304((PB::Base *)v11);
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
  Dispatcher *value;

  sub_100261F44((uint64_t)&self->_writer);
  value = self->_averagedALSDispatcher.__ptr_.__value_;
  self->_averagedALSDispatcher.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(Dispatcher *))(*(_QWORD *)value + 8))(value);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 4) = 0;
  return self;
}

@end
