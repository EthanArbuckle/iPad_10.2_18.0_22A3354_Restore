@implementation CLDurianFirmwareAssetPacketizer

- (CLDurianFirmwareAssetPacketizer)initWithAssetType:(int)a3 assetData:(id)a4 maxPacketSize:(unint64_t)a5
{
  uint64_t v7;
  CLDurianFirmwareAssetPacketizer *v8;
  CLDurianFirmwareAssetPacketizer *v9;
  objc_super v11;
  int v12;

  v7 = *(_QWORD *)&a3;
  v12 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CLDurianFirmwareAssetPacketizer;
  v8 = -[CLDurianFirmwareAssetPacketizer init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    -[CLDurianFirmwareAssetPacketizer setAssetType:](v8, "setAssetType:", v7);
    -[CLDurianFirmwareAssetPacketizer setAssetData:](v9, "setAssetData:", a4);
    -[CLDurianFirmwareAssetPacketizer setAssetDataCRC:](v9, "setAssetDataCRC:", crc32(0, 0, 0));
    -[CLDurianFirmwareAssetPacketizer setAssetTargetHeader:](v9, "setAssetTargetHeader:", +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v12, 1));
    -[CLDurianFirmwareAssetPacketizer setMaxPayloadSize:](v9, "setMaxPayloadSize:", a5 - 6);
  }
  return v9;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLDurianFirmwareAssetPacketizer;
  -[CLDurianFirmwareAssetPacketizer dealloc](&v3, "dealloc");
}

- (id)getNextPacket
{
  unint64_t v4;
  unint64_t v5;
  char *v6;
  NSUInteger v7;
  unint64_t v8;
  NSData *v9;
  NSData *v10;
  NSData *v11;
  id v12;
  unint64_t v13;
  uint64_t v14;

  if (-[CLDurianFirmwareAssetPacketizer hasSentCRCPacket](self, "hasSentCRCPacket"))
    return 0;
  if (-[CLDurianFirmwareAssetPacketizer hasSentAssetData](self, "hasSentAssetData"))
  {
    -[CLDurianFirmwareAssetPacketizer setHasSentCRCPacket:](self, "setHasSentCRCPacket:", 1);
    return -[CLDurianFirmwareAssetPacketizer _buildCRCPacket](self, "_buildCRCPacket");
  }
  else
  {
    v4 = -[CLDurianFirmwareAssetPacketizer maxPayloadSize](self, "maxPayloadSize");
    v5 = -[CLDurianFirmwareAssetPacketizer payloadOffset](self, "payloadOffset");
    v6 = (char *)-[CLDurianFirmwareAssetPacketizer maxPayloadSize](self, "maxPayloadSize") + v5;
    if (v6 >= (char *)-[NSData length](-[CLDurianFirmwareAssetPacketizer assetData](self, "assetData"), "length"))
    {
      -[CLDurianFirmwareAssetPacketizer setHasSentAssetData:](self, "setHasSentAssetData:", 1);
      v7 = -[NSData length](-[CLDurianFirmwareAssetPacketizer assetData](self, "assetData"), "length");
      v4 = v7 - -[CLDurianFirmwareAssetPacketizer payloadOffset](self, "payloadOffset");
    }
    v8 = -[NSData length](-[CLDurianFirmwareAssetPacketizer assetData](self, "assetData"), "length");
    if (v8 <= -[CLDurianFirmwareAssetPacketizer maxPayloadSize](self, "maxPayloadSize"))
    {
      -[CLDurianFirmwareAssetPacketizer setHasSentAssetData:](self, "setHasSentAssetData:", 1);
      v4 = -[NSData length](-[CLDurianFirmwareAssetPacketizer assetData](self, "assetData"), "length");
    }
    v9 = -[NSData subdataWithRange:](-[CLDurianFirmwareAssetPacketizer assetData](self, "assetData"), "subdataWithRange:", -[CLDurianFirmwareAssetPacketizer payloadOffset](self, "payloadOffset"), v4);
    -[CLDurianFirmwareAssetPacketizer setAssetDataCRC:](self, "setAssetDataCRC:", crc32(-[CLDurianFirmwareAssetPacketizer assetDataCRC](self, "assetDataCRC"), (const Bytef *)-[NSData bytes](v9, "bytes"), v4));
    v14 = -[CLDurianFirmwareAssetPacketizer hasSentAssetData](self, "hasSentAssetData");
    v10 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v14, 1);
    v13 = -[CLDurianFirmwareAssetPacketizer payloadOffset](self, "payloadOffset");
    v11 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v13, 4);
    v12 = objc_alloc_init((Class)NSMutableData);
    objc_msgSend(v12, "appendData:", -[CLDurianFirmwareAssetPacketizer assetTargetHeader](self, "assetTargetHeader"));
    objc_msgSend(v12, "appendData:", v10);
    objc_msgSend(v12, "appendData:", v11);
    objc_msgSend(v12, "appendData:", v9);
    -[CLDurianFirmwareAssetPacketizer setPayloadOffset:](self, "setPayloadOffset:", (char *)-[CLDurianFirmwareAssetPacketizer payloadOffset](self, "payloadOffset") + v4);
    return v12;
  }
}

- (id)_buildCRCPacket
{
  NSData *v3;
  NSData *v4;
  NSData *v5;
  id v6;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;

  v10 = -[CLDurianFirmwareAssetPacketizer assetDataCRC](self, "assetDataCRC");
  v3 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v10, 4);
  v9 = 2;
  v4 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v9, 1);
  v8 = 0;
  v5 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v8, 4);
  v6 = objc_alloc_init((Class)NSMutableData);
  objc_msgSend(v6, "appendData:", -[CLDurianFirmwareAssetPacketizer assetTargetHeader](self, "assetTargetHeader"));
  objc_msgSend(v6, "appendData:", v4);
  objc_msgSend(v6, "appendData:", v5);
  objc_msgSend(v6, "appendData:", v3);
  return v6;
}

- (int)assetType
{
  return self->_assetType;
}

- (void)setAssetType:(int)a3
{
  self->_assetType = a3;
}

- (NSData)assetData
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (void)setAssetData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (unint64_t)assetDataCRC
{
  return self->_assetDataCRC;
}

- (void)setAssetDataCRC:(unint64_t)a3
{
  self->_assetDataCRC = a3;
}

- (NSData)assetTargetHeader
{
  return (NSData *)objc_getProperty(self, a2, 32, 1);
}

- (void)setAssetTargetHeader:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (BOOL)hasSentAssetData
{
  return self->_hasSentAssetData;
}

- (void)setHasSentAssetData:(BOOL)a3
{
  self->_hasSentAssetData = a3;
}

- (BOOL)hasSentCRCPacket
{
  return self->_hasSentCRCPacket;
}

- (void)setHasSentCRCPacket:(BOOL)a3
{
  self->_hasSentCRCPacket = a3;
}

- (unint64_t)maxPayloadSize
{
  return self->_maxPayloadSize;
}

- (void)setMaxPayloadSize:(unint64_t)a3
{
  self->_maxPayloadSize = a3;
}

- (unint64_t)payloadOffset
{
  return self->_payloadOffset;
}

- (void)setPayloadOffset:(unint64_t)a3
{
  self->_payloadOffset = a3;
}

@end
