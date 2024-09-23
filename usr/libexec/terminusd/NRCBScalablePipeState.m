@implementation NRCBScalablePipeState

- (id)description
{
  int state;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  double v9;
  BOOL v10;
  uint64_t v11;
  __CFString *v12;
  id v13;
  unint64_t v14;
  id v15;
  id v16;

  state = self->_state;
  if (state == 1)
  {
    v4 = 16;
  }
  else
  {
    if (state != 2)
    {
      v12 = CFSTR("<unknown>");
      goto LABEL_15;
    }
    v4 = 24;
  }
  v5 = *(uint64_t *)((char *)&self->super.isa + v4);
  v6 = mach_continuous_time();
  v9 = 0.0;
  if (v5)
    v10 = v6 > v5;
  else
    v10 = 0;
  if (v10)
  {
    v11 = v6;
    if (qword_1001E48A8 != -1)
      dispatch_once(&qword_1001E48A8, &stru_1001B7C30);
    LODWORD(v7) = dword_1001E48B0;
    LODWORD(v8) = *(_DWORD *)algn_1001E48B4;
    v9 = (double)(v11 - v5) * (0.000000001 * (double)v7) / (double)v8;
  }
  v12 = (__CFString *)objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%.2fs"), *(_QWORD *)&v9);
LABEL_15:
  v13 = objc_alloc((Class)NSString);
  v14 = self->_state;
  if (v14 >= 3)
    v15 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("UnknownType(%lld)"), v14);
  else
    v15 = *(&off_1001B6500 + v14);
  v16 = objc_msgSend(v13, "initWithFormat:", CFSTR("NRBTPipe[%@ %@]"), v15, v12);

  return v16;
}

- (unsigned)state
{
  return self->_state;
}

- (void)setState:(unsigned __int8)a3
{
  self->_state = a3;
}

- (unint64_t)timeOfConnect
{
  return self->_timeOfConnect;
}

- (void)setTimeOfConnect:(unint64_t)a3
{
  self->_timeOfConnect = a3;
}

- (unint64_t)timeOfDisconnect
{
  return self->_timeOfDisconnect;
}

- (void)setTimeOfDisconnect:(unint64_t)a3
{
  self->_timeOfDisconnect = a3;
}

@end
