@implementation DreamworksTransRecord

+ (id)recordNumber:(unsigned __int8)a3 recordData:(id)a4 seqnum:(unsigned int)a5
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  unint64_t v9;
  void *v10;

  v5 = *(_QWORD *)&a5;
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "setSfi:", 3);
  objc_msgSend(v8, "setNumber:", v6);
  objc_msgSend(v8, "setData:", v7);
  objc_msgSend(v8, "setIsIn:", (objc_msgSend(v7, "u8:", 2) & 1) == 0);
  objc_msgSend(v8, "setStationCode:", objc_msgSend(v7, "u32BE:", 5));
  objc_msgSend(v8, "setVehicleType:", objc_msgSend(v7, "u16BE:", 9));
  v9 = objc_msgSend(v7, "u64BE:", 11);

  objc_msgSend(MEMORY[0x1E0C99D78], "dateWithYear:month:day:hour:minute:second:", (v9 >> 57) + 2000, (v9 >> 53) & 0xF, HIWORD(v9) & 0x1F, (v9 >> 43) & 0x1F, (v9 >> 37) & 0x3F, (v9 >> 31) & 0x3F);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDatetime:", v10);

  objc_msgSend(v8, "setSeqnum:", v5);
  return v8;
}

- (int)isIn
{
  return self->_isIn;
}

- (void)setIsIn:(int)a3
{
  self->_isIn = a3;
}

- (unsigned)vehicleType
{
  return self->_vehicleType;
}

- (void)setVehicleType:(unsigned __int16)a3
{
  self->_vehicleType = a3;
}

- (unsigned)stationCode
{
  return self->_stationCode;
}

- (void)setStationCode:(unsigned int)a3
{
  self->_stationCode = a3;
}

- (NSDateComponents)datetime
{
  return self->_datetime;
}

- (void)setDatetime:(id)a3
{
  objc_storeStrong((id *)&self->_datetime, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_datetime, 0);
}

@end
