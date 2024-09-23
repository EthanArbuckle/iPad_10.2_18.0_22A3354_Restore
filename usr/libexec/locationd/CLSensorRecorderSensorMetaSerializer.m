@implementation CLSensorRecorderSensorMetaSerializer

- (CLSensorRecorderSensorMetaSerializer)init
{
  CLSensorRecorderSensorMetaSerializer *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CLSensorRecorderSensorMetaSerializer;
  v2 = -[CLSensorRecorderSensorMetaSerializer init](&v4, "init");
  if (v2)
    v2->fBuffer = (NSMutableData *)objc_msgSend(objc_alloc((Class)NSMutableData), "initWithCapacity:", 20);
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLSensorRecorderSensorMetaSerializer;
  -[CLSensorRecorderSensorMetaSerializer dealloc](&v3, "dealloc");
}

+ (void)serializeMeta:(id)a3 toData:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unsigned int v9;

  v9 = bswap32(objc_msgSend(a3, "dataSize"));
  objc_msgSend(a4, "appendBytes:length:", &v9, 4);
  v8 = bswap64((unint64_t)objc_msgSend(a3, "timestamp"));
  objc_msgSend(a4, "appendBytes:length:", &v8, 8);
  objc_msgSend(a3, "startTime");
  v7 = v6;
  objc_msgSend(a4, "appendBytes:length:", &v7, 8);
}

+ (void)deserializeMeta:(id)a3 fromData:(id)a4
{
  objc_msgSend(a3, "setDataSize:", bswap32(*(_DWORD *)objc_msgSend(a4, "bytes")));
  objc_msgSend(a3, "setTimestamp:", bswap64(*(_QWORD *)((char *)objc_msgSend(a4, "bytes") + 4)));
  objc_msgSend(a3, "setStartTime:", *(double *)((char *)objc_msgSend(a4, "bytes") + 12));
}

- (void)writeMeta:(id)a3 toHandle:(id)a4
{
  +[CLSensorRecorderSensorMetaSerializer serializeMeta:toData:](CLSensorRecorderSensorMetaSerializer, "serializeMeta:toData:", a3, self->fBuffer);
  objc_msgSend(a4, "writeData:", self->fBuffer);
  -[NSMutableData setLength:](self->fBuffer, "setLength:", 0);
}

- (BOOL)readMeta:(id)a3 fromHandle:(id)a4
{
  NSUInteger v6;

  -[NSMutableData setData:](self->fBuffer, "setData:", objc_msgSend(a4, "readDataOfLength:", 20));
  v6 = -[NSMutableData length](self->fBuffer, "length");
  if (v6 == 20)
    +[CLSensorRecorderSensorMetaSerializer deserializeMeta:fromData:](CLSensorRecorderSensorMetaSerializer, "deserializeMeta:fromData:", a3, self->fBuffer);
  return v6 == 20;
}

@end
