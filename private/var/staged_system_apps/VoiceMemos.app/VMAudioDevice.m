@implementation VMAudioDevice

+ (id)defaultInputAndReturnError:(id *)a3
{
  OSStatus PropertyData;
  VMAudioDevice *v4;
  unsigned int v5;
  AudioObjectPropertyAddress inAddress;
  UInt32 ioDataSize;
  unsigned int outData;

  outData = 0;
  ioDataSize = 4;
  *(_QWORD *)&inAddress.mSelector = 0x676C6F6264496E20;
  inAddress.mElement = 0;
  PropertyData = AudioObjectGetPropertyData(1u, &inAddress, 0, 0, &ioDataSize, &outData);
  v4 = 0;
  if (!PropertyData)
  {
    v5 = outData;
    if (outData)
    {
      v4 = objc_opt_new(VMAudioDevice);
      v4->_deviceID = v5;
      v4->_direction = 0;
    }
  }
  return v4;
}

+ (id)defaultOutputAndReturnError:(id *)a3
{
  OSStatus PropertyData;
  VMAudioDevice *v4;
  unsigned int v5;
  AudioObjectPropertyAddress inAddress;
  UInt32 ioDataSize;
  unsigned int outData;

  outData = 0;
  ioDataSize = 4;
  *(_QWORD *)&inAddress.mSelector = 0x676C6F62644F7574;
  inAddress.mElement = 0;
  PropertyData = AudioObjectGetPropertyData(1u, &inAddress, 0, 0, &ioDataSize, &outData);
  v4 = 0;
  if (!PropertyData)
  {
    v5 = outData;
    if (outData)
    {
      v4 = objc_opt_new(VMAudioDevice);
      v4->_deviceID = v5;
      v4->_direction = 0;
    }
  }
  return v4;
}

+ (id)defaultSystemOutputAndReturnError:(id *)a3
{
  OSStatus PropertyData;
  VMAudioDevice *v4;
  unsigned int v5;
  AudioObjectPropertyAddress inAddress;
  UInt32 ioDataSize;
  unsigned int outData;

  outData = 0;
  ioDataSize = 4;
  *(_QWORD *)&inAddress.mSelector = 0x676C6F62734F7574;
  inAddress.mElement = 0;
  PropertyData = AudioObjectGetPropertyData(1u, &inAddress, 0, 0, &ioDataSize, &outData);
  v4 = 0;
  if (!PropertyData)
  {
    v5 = outData;
    if (outData)
    {
      v4 = objc_opt_new(VMAudioDevice);
      v4->_deviceID = v5;
      v4->_direction = 0;
    }
  }
  return v4;
}

- (double)sampleRate
{
  AudioObjectID deviceID;
  int direction;
  int v4;
  AudioObjectPropertyScope v5;
  OSStatus PropertyData;
  double result;
  AudioObjectPropertyAddress inAddress;
  UInt32 ioDataSize;
  double outData;

  deviceID = self->_deviceID;
  direction = self->_direction;
  if (direction == 1)
    v4 = 1869968496;
  else
    v4 = 0;
  outData = 0.0;
  if (direction)
    v5 = v4;
  else
    v5 = 1768845428;
  ioDataSize = 8;
  inAddress.mSelector = 1853059700;
  inAddress.mScope = v5;
  inAddress.mElement = 0;
  PropertyData = AudioObjectGetPropertyData(deviceID, &inAddress, 0, 0, &ioDataSize, &outData);
  result = outData;
  if (PropertyData)
    return 0.0;
  return result;
}

- (BOOL)setSampleRate:(double)a3 error:(id *)a4
{
  AudioObjectID deviceID;
  OSStatus v6;
  OSStatus v7;
  AudioObjectPropertyAddress inAddress;
  double inData;

  deviceID = self->_deviceID;
  inData = a3;
  *(_QWORD *)&inAddress.mSelector = 0x676C6F626E737274;
  inAddress.mElement = 0;
  v6 = AudioObjectSetPropertyData(deviceID, &inAddress, 0, 0, 8u, &inData);
  v7 = v6;
  if (a4 && v6)
    *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSOSStatusErrorDomain, v6, 0));
  return v7 == 0;
}

- (NSArray)sampleRates
{
  int v2;
  AudioObjectPropertyScope v3;
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  double *v8;
  double *v9;
  _UNKNOWN **v10;
  id v11;
  _QWORD v13[4];
  id v14;

  if (self->_direction == 1)
    v2 = 1869968496;
  else
    v2 = 0;
  if (self->_direction)
    v3 = v2;
  else
    v3 = 1768845428;
  v4 = sub_1000607F8(self->_deviceID, 0x6E737223u, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = v5;
  if (v5)
  {
    v7 = (unint64_t)objc_msgSend(v5, "length");
    v8 = (double *)objc_msgSend(objc_retainAutorelease(v6), "bytes");
    v7 >>= 4;
    v9 = &v8[2 * v7];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100060928;
    v13[3] = &unk_1001AC5B8;
    v10 = (_UNKNOWN **)(id)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", v7));
    v14 = v10;
    v11 = sub_1000608B4(v8, v9, v13);

  }
  else
  {
    v10 = &off_1001B74D8;
  }

  return (NSArray *)v10;
}

- (AVAudioChannelLayout)channelLayout
{
  int v2;
  AudioObjectPropertyScope v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  if (self->_direction == 1)
    v2 = 1869968496;
  else
    v2 = 0;
  if (self->_direction)
    v3 = v2;
  else
    v3 = 1768845428;
  v4 = sub_1000607F8(self->_deviceID, 0x73726E64u, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = v5;
  if (v5)
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[AVAudioChannelLayout layoutWithLayout:](AVAudioChannelLayout, "layoutWithLayout:", objc_msgSend(objc_retainAutorelease(v5), "bytes")));
  else
    v7 = 0;

  return (AVAudioChannelLayout *)v7;
}

- (NSArray)stereoChannels
{
  AudioObjectID deviceID;
  int direction;
  int v4;
  AudioObjectPropertyScope v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  AudioObjectPropertyAddress v11;
  UInt32 ioDataSize;
  uint64_t outData;
  _QWORD v14[2];

  deviceID = self->_deviceID;
  direction = self->_direction;
  if (direction == 1)
    v4 = 1869968496;
  else
    v4 = 0;
  outData = 0;
  if (direction)
    v5 = v4;
  else
    v5 = 1768845428;
  v11.mElement = 0;
  ioDataSize = 8;
  v11.mSelector = 1684236338;
  v11.mScope = v5;
  AudioObjectGetPropertyData(deviceID, &v11, 0, 0, &ioDataSize, &outData);
  v6 = HIDWORD(outData);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", (outData - 1)));
  v14[0] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", (v6 - 1)));
  v14[1] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v14, 2));

  return (NSArray *)v9;
}

- (BOOL)isMono
{
  AudioObjectID deviceID;
  int direction;
  int v4;
  AudioObjectPropertyScope v5;
  AudioObjectPropertyAddress inAddress;
  UInt32 ioDataSize;
  uint64_t outData;

  deviceID = self->_deviceID;
  direction = self->_direction;
  if (direction == 1)
    v4 = 1869968496;
  else
    v4 = 0;
  outData = 0;
  if (direction)
    v5 = v4;
  else
    v5 = 1768845428;
  ioDataSize = 8;
  inAddress.mSelector = 1684236338;
  inAddress.mScope = v5;
  inAddress.mElement = 0;
  AudioObjectGetPropertyData(deviceID, &inAddress, 0, 0, &ioDataSize, &outData);
  return outData == 0x100000001;
}

@end
