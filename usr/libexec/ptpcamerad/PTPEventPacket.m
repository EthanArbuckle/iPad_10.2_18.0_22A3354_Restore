@implementation PTPEventPacket

- (PTPEventPacket)initWithDictionary:(id)a3
{
  id v4;
  PTPEventPacket *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PTPEventPacket;
  v5 = -[PTPEventPacket init](&v13, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("eventCode")));
    v5->_eventCode = (unsigned __int16)objc_msgSend(v6, "unsignedShortValue");

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("transactionID")));
    v5->_transactionID = objc_msgSend(v7, "unsignedIntValue");

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numParameters")));
    v5->_numParameters = objc_msgSend(v8, "unsignedIntValue");

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("parameter0")));
    v5->_parameters[0] = objc_msgSend(v9, "unsignedIntValue");

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("parameter1")));
    v5->_parameters[1] = objc_msgSend(v10, "unsignedIntValue");

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("parameter2")));
    v5->_parameters[2] = objc_msgSend(v11, "unsignedIntValue");

  }
  return v5;
}

- (PTPEventPacket)initWithEventCode:(unsigned __int16)a3 transactionID:(unsigned int)a4
{
  PTPEventPacket *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PTPEventPacket;
  result = -[PTPEventPacket init](&v7, "init");
  if (result)
  {
    result->_eventCode = a3;
    result->_transactionID = a4;
    result->_numParameters = 0;
  }
  return result;
}

- (PTPEventPacket)initWithEventCode:(unsigned __int16)a3 transactionID:(unsigned int)a4 parameter1:(unsigned int)a5
{
  PTPEventPacket *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PTPEventPacket;
  result = -[PTPEventPacket init](&v9, "init");
  if (result)
  {
    result->_eventCode = a3;
    result->_transactionID = a4;
    result->_parameters[0] = a5;
    result->_numParameters = 1;
  }
  return result;
}

- (PTPEventPacket)initWithEventCode:(unsigned __int16)a3 transactionID:(unsigned int)a4 parameter1:(unsigned int)a5 parameter2:(unsigned int)a6
{
  PTPEventPacket *result;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PTPEventPacket;
  result = -[PTPEventPacket init](&v11, "init");
  if (result)
  {
    result->_eventCode = a3;
    result->_transactionID = a4;
    result->_parameters[0] = a5;
    result->_parameters[1] = a6;
    result->_numParameters = 2;
  }
  return result;
}

- (PTPEventPacket)initWithEventCode:(unsigned __int16)a3 transactionID:(unsigned int)a4 parameter1:(unsigned int)a5 parameter2:(unsigned int)a6 parameter3:(unsigned int)a7
{
  PTPEventPacket *result;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PTPEventPacket;
  result = -[PTPEventPacket init](&v13, "init");
  if (result)
  {
    result->_eventCode = a3;
    result->_transactionID = a4;
    result->_parameters[0] = a5;
    result->_parameters[1] = a6;
    result->_parameters[2] = a7;
    result->_numParameters = 3;
  }
  return result;
}

- (PTPEventPacket)initWithTCPBuffer:(void *)a3
{
  int v3;
  PTPEventPacket *v5;
  PTPEventPacket *v7;
  uint64_t v8;
  char *v10;
  objc_super v11;

  v3 = *(_DWORD *)a3;
  if ((*(_DWORD *)a3 - 27) >= 0xFFFFFFF3 && *((_DWORD *)a3 + 1) == 8)
  {
    v11.receiver = self;
    v11.super_class = (Class)PTPEventPacket;
    v7 = -[PTPEventPacket init](&v11, "init");
    if (v7)
    {
      v10 = (char *)a3 + 8;
      v7->_eventCode = sub_100027350(&v10);
      v7->_transactionID = sub_1000273CC(&v10);
      v7->_numParameters = (v3 - 14) >> 2;
      if ((v3 - 14) >= 4)
      {
        v8 = 0;
        do
          v7->_parameters[v8++] = sub_1000273CC(&v10);
        while (v8 < v7->_numParameters);
      }
    }
    self = v7;
    v5 = self;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (PTPEventPacket)initWithUSBBuffer:(void *)a3
{
  int v3;
  PTPEventPacket *v5;
  PTPEventPacket *v7;
  uint64_t v8;
  char *v10;
  objc_super v11;

  v3 = *(_DWORD *)a3;
  if ((*(_DWORD *)a3 - 25) >= 0xFFFFFFF3 && *((_WORD *)a3 + 2) == 4)
  {
    v11.receiver = self;
    v11.super_class = (Class)PTPEventPacket;
    v7 = -[PTPEventPacket init](&v11, "init");
    if (v7)
    {
      v10 = (char *)a3 + 6;
      v7->_eventCode = sub_100027350(&v10);
      v7->_transactionID = sub_1000273CC(&v10);
      v7->_numParameters = (v3 - 12) >> 2;
      if ((v3 - 12) >= 4)
      {
        v8 = 0;
        do
          v7->_parameters[v8++] = sub_1000273CC(&v10);
        while (v8 < v7->_numParameters);
      }
    }
    self = v7;
    v5 = self;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)contentForTCP
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  _WORD *v7;

  v3 = (4 * self->_numParameters + 14);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[PTPWrappedBytes wrappedBytesWithCapacity:](PTPWrappedBytes, "wrappedBytesWithCapacity:", v3));
  v7 = objc_msgSend(v4, "mutableBytes");
  sub_1000273B4((_DWORD **)&v7, v3);
  sub_1000273B4((_DWORD **)&v7, 8);
  sub_100027338(&v7, self->_eventCode);
  sub_1000273B4((_DWORD **)&v7, self->_transactionID);
  if (self->_numParameters >= 1)
  {
    v5 = 0;
    do
      sub_1000273B4((_DWORD **)&v7, self->_parameters[v5++]);
    while (v5 < self->_numParameters);
  }
  objc_msgSend(v4, "setLength:", v3);
  return v4;
}

- (id)contentForUSB
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  _WORD *v7;

  v3 = (4 * self->_numParameters + 12);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[PTPWrappedBytes wrappedBytesWithCapacity:](PTPWrappedBytes, "wrappedBytesWithCapacity:", v3));
  v7 = objc_msgSend(v4, "mutableBytes");
  sub_1000273B4((_DWORD **)&v7, v3);
  sub_100027338(&v7, 4);
  sub_100027338(&v7, self->_eventCode);
  sub_1000273B4((_DWORD **)&v7, self->_transactionID);
  if (self->_numParameters >= 1)
  {
    v5 = 0;
    do
      sub_1000273B4((_DWORD **)&v7, self->_parameters[v5++]);
    while (v5 < self->_numParameters);
  }
  objc_msgSend(v4, "setLength:", v3);
  return v4;
}

- (id)contentForUSBUsingBuffer:(void *)a3 capacity:(unsigned int)a4
{
  uint64_t v4;
  void *v7;
  uint64_t v8;
  _WORD *v9;

  v4 = (4 * self->_numParameters + 12);
  if (v4 > a4)
    return 0;
  v9 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[PTPWrappedBytes wrappedBytesWithBytes:capacity:](PTPWrappedBytes, "wrappedBytesWithBytes:capacity:", a3, a4));
  sub_1000273B4((_DWORD **)&v9, v4);
  sub_100027338(&v9, 4);
  sub_100027338(&v9, self->_eventCode);
  sub_1000273B4((_DWORD **)&v9, self->_transactionID);
  if (self->_numParameters >= 1)
  {
    v8 = 0;
    do
      sub_1000273B4((_DWORD **)&v9, self->_parameters[v8++]);
    while (v8 < self->_numParameters);
  }
  objc_msgSend(v7, "setLength:", v4);
  return v7;
}

- (id)description
{
  __CFString *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = sub_1000284BC(self->_eventCode);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithFormat:](NSMutableString, "stringWithFormat:", CFSTR("<PTPEventPacket %p>{\n  _eventCode:     %@\n  _transactionID: %lu\n"), self, v4, self->_transactionID));

  if (self->_numParameters >= 1)
  {
    v6 = 0;
    do
    {
      objc_msgSend(v5, "appendFormat:", CFSTR("  _parameters[%d]: 0x%08lX\n"), v6, self->_parameters[v6]);
      ++v6;
    }
    while (v6 < self->_numParameters);
  }
  objc_msgSend(v5, "appendString:", CFSTR("}"));
  return v5;
}

- (unsigned)eventCode
{
  return self->_eventCode;
}

- (void)setEventCode:(unsigned __int16)a3
{
  self->_eventCode = a3;
}

- (unsigned)transactionID
{
  return self->_transactionID;
}

- (void)setTransactionID:(unsigned int)a3
{
  self->_transactionID = a3;
}

- (unsigned)parameter1
{
  return self->_parameters[0];
}

- (void)setParameter1:(unsigned int)a3
{
  self->_parameters[0] = a3;
}

- (unsigned)parameter2
{
  return self->_parameters[1];
}

- (void)setParameter2:(unsigned int)a3
{
  self->_parameters[1] = a3;
}

- (unsigned)parameter3
{
  return self->_parameters[2];
}

- (void)setParameter3:(unsigned int)a3
{
  self->_parameters[2] = a3;
}

- (id)eventPacketDictionary
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", self->_eventCode));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("eventCode"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_transactionID));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("transactionID"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_numParameters));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("numParameters"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_parameters[0]));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("parameter0"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_parameters[1]));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("parameter1"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_parameters[2]));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("parameter2"));

  return v3;
}

@end
