@implementation CLATVAirplayDevice

- (CLATVAirplayDevice)initWithTimestamp:(uint64_t)a3 RSSI:(int)a4 uuid:(void *)a5 ipv4:(unsigned int)a6 channel:(int)a7
{
  CLATVAirplayDevice *v12;
  CLATVAirplayDevice *v13;
  objc_super v15;

  v15.receiver = a1;
  v15.super_class = (Class)CLATVAirplayDevice;
  v12 = -[CLATVAirplayDevice init](&v15, "init");
  v13 = v12;
  if (v12)
  {
    *(double *)&v12->_anon_18[4] = a2;
    v12->_RSSI = a4;
    v12->_uuid = (NSUUID *)a5;
    v13->_ipv4 = a6;
    v13->_channel = a7;
  }
  return v13;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLATVAirplayDevice;
  -[CLATVAirplayDevice dealloc](&v3, "dealloc");
}

- (double)timestamp
{
  return *(double *)(a1 + 24);
}

- (int)RSSI
{
  return self->_RSSI;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (unsigned)ipv4
{
  return self->_ipv4;
}

- (int)channel
{
  return self->_channel;
}

- (id).cxx_construct
{
  *((_QWORD *)self + 3) = 0;
  return self;
}

- (id)cppObject
{
  char *v4;
  size_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  unsigned int v12;
  id result;
  char v14;

  v4 = (char *)objc_msgSend(objc_msgSend(objc_msgSend(a1, "uuid"), "UUIDString"), "UTF8String");
  v5 = strlen(v4);
  v6 = sub_1002B7330((uint64_t)&v14, (unsigned __int8 *)v4, (unsigned __int8 *)&v4[v5]);
  v8 = v7;
  objc_msgSend(a1, "timestamp");
  v10 = v9;
  v11 = objc_msgSend(a1, "RSSI");
  v12 = objc_msgSend(a1, "ipv4");
  result = objc_msgSend(a1, "channel");
  *(_QWORD *)a2 = v10;
  *(_DWORD *)(a2 + 8) = v11;
  *(_QWORD *)(a2 + 12) = v6;
  *(_QWORD *)(a2 + 20) = v8;
  *(_DWORD *)(a2 + 28) = v12;
  *(_DWORD *)(a2 + 32) = (_DWORD)result;
  return result;
}

@end
