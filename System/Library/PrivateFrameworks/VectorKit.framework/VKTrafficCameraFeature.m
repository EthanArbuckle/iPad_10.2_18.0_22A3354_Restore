@implementation VKTrafficCameraFeature

- (VKTrafficCameraFeature)initWithTrafficCameraType:(int64_t)a3 uniqueIdentifier:(id)a4 routeOffset:(PolylineCoordinate)a5 onRoute:(id)a6
{
  VKTrafficCameraFeature *v7;
  VKTrafficCameraFeature *v8;
  VKTrafficCameraFeature *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)VKTrafficCameraFeature;
  v7 = -[VKTrafficFeature initWithFeatureType:uniqueIdentifier:routeOffset:onRoute:](&v11, sel_initWithFeatureType_uniqueIdentifier_routeOffset_onRoute_, 1, a4, a5, a6);
  v8 = v7;
  if (v7)
  {
    *(_QWORD *)&v7->super._routeLegWhen._hasValue = a3;
    v9 = v7;
  }

  return v8;
}

- (VKTrafficCameraFeature)initWithTrafficCamera:(id)a3 onRoute:(id)a4
{
  id v6;
  id v7;
  VKTrafficCameraFeature *v8;
  VKTrafficCameraFeature *v9;
  VKTrafficCameraFeature *v10;
  id v11;
  double v12;
  uint64_t v13;
  double v14;
  uint64_t v15;
  void *type;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)VKTrafficCameraFeature;
  v8 = -[VKTrafficFeature initWithEnrouteNotice:onRoute:](&v18, sel_initWithEnrouteNotice_onRoute_, v6, v7);
  v9 = 0;
  v10 = v8;
  if (v6 && v8)
  {
    v11 = v6;
    switch(objc_msgSend(v11, "type"))
    {
      case 1u:
        if (objc_msgSend(v11, "hasSpeedThreshold"))
        {
          objc_msgSend(v11, "speedThreshold");
          if (v12 == 0.0)
            v13 = 5;
          else
            v13 = 1;
        }
        else
        {
          v13 = 1;
        }
        break;
      case 2u:
        v13 = 2;
        break;
      case 3u:
        v13 = 3;
        break;
      case 4u:
        v13 = 4;
        break;
      case 5u:
        v13 = 5;
        break;
      case 6u:
        v13 = 6;
        break;
      default:
        v13 = 0;
        break;
    }

    *(_QWORD *)&v10->super._routeLegWhen._hasValue = v13;
    if (objc_msgSend(v11, "hasSpeedThreshold"))
    {
      objc_msgSend(v11, "speedThreshold");
      LODWORD(v10->_speedLimitText) = v14;
    }
    if (objc_msgSend(v11, "hasSpeedLimitText"))
    {
      objc_msgSend(v11, "speedLimitText");
      v15 = objc_claimAutoreleasedReturnValue();
      type = (void *)v10->_type;
      v10->_type = v15;

    }
    if (objc_msgSend(v11, "hasCountryCode"))
    {
      LOBYTE(v10->_speedLimit) = 1;
      *(_DWORD *)&v10->_isAboveSpeedThreshold = objc_msgSend(v11, "countryCode");
    }
    v10->super._routeLegWhen._value.data[0] = 0;
    v9 = v10;
  }

  return v9;
}

- (void)setIsAboveSpeedThreshold:(BOOL)a3
{
  if (self->super._routeLegWhen._value.data[0] != a3)
  {
    self->super._routeLegWhen._value.data[0] = a3;
    -[VKTrafficFeature setShouldUpdateStyle:](self, "setShouldUpdateStyle:", 1);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  _DWORD *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VKTrafficCameraFeature;
  v4 = -[VKTrafficFeature copyWithZone:](&v7, sel_copyWithZone_, a3);
  v5 = v4;
  if (v4)
  {
    *((_QWORD *)v4 + 20) = *(_QWORD *)&self->super._routeLegWhen._hasValue;
    *((_DWORD *)v4 + 43) = HIDWORD(self->super._routeLegWhen._value.type);
    *((_BYTE *)v4 + 168) = self->super._routeLegWhen._value.data[0];
    objc_storeStrong((id *)v4 + 22, (id)self->_type);
    v5[46] = *(_DWORD *)&self->_isAboveSpeedThreshold;
  }
  return v5;
}

- (BOOL)isSpeedLimitCamera
{
  return *(_QWORD *)&self->super._routeLegWhen._hasValue == 1;
}

- (void)populateDebugNode:(void *)a3
{
  id v5;
  const std::string::value_type *v6;
  uint64_t type_high;
  uint64_t v8;
  const std::string::value_type *v9;
  uint64_t v10;
  _QWORD v11[7];
  int v12;
  _BYTE v13[32];
  std::string __p;
  int v15;
  _QWORD v16[7];
  int v17;
  _BYTE v18[8];
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  _BYTE v24[32];
  std::string v25;
  int v26;
  char v27[32];
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)VKTrafficCameraFeature;
  -[VKTrafficFeature populateDebugNode:](&v28, sel_populateDebugNode_);
  v27[23] = 17;
  strcpy(v27, "TrafficCameraType");
  +[VKTrafficCameraFeature stringForTrafficCameraType:](VKTrafficCameraFeature, "stringForTrafficCameraType:", *(_QWORD *)&self->super._routeLegWhen._hasValue);
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v6 = (const std::string::value_type *)objc_msgSend(v5, "UTF8String");
  memset(&v25, 0, sizeof(v25));
  v26 = 4;
  if (v6)
  {
    std::string::__assign_external(&v25, v6);
  }
  else
  {
    *((_BYTE *)&v25.__r_.__value_.__s + 23) = 6;
    strcpy((char *)&v25, "<null>");
  }
  gdc::DebugTreeNode::addProperty((uint64_t)a3, (uint64_t)v27, (uint64_t)v24);
  if (SHIBYTE(v25.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v25.__r_.__value_.__l.__data_);

  if (-[VKTrafficCameraFeature isSpeedLimitCamera](self, "isSpeedLimitCamera"))
  {
    v27[23] = 10;
    strcpy(v27, "SpeedLimit");
    type_high = HIDWORD(self->super._routeLegWhen._value.type);
    v21 = 0;
    v22 = 0;
    v23 = 1;
    v20 = 0;
    v19 = type_high;
    gdc::DebugTreeNode::addProperty((uint64_t)a3, (uint64_t)v27, (uint64_t)v18);
    v27[23] = 21;
    strcpy(v27, "IsAboveSpeedThreshold");
    v8 = self->super._routeLegWhen._value.data[0];
    v17 = 0;
    memset(&v16[4], 0, 24);
    v16[0] = v8;
    gdc::DebugTreeNode::addProperty((uint64_t)a3, (uint64_t)v27, (uint64_t)v16);
    v27[23] = 14;
    strcpy(v27, "SpeedLimitText");
    v9 = (const std::string::value_type *)objc_msgSend((id)self->_type, "UTF8String");
    memset(&__p, 0, sizeof(__p));
    v15 = 4;
    if (v9)
    {
      std::string::__assign_external(&__p, v9);
    }
    else
    {
      *((_BYTE *)&__p.__r_.__value_.__s + 23) = 6;
      strcpy((char *)&__p, "<null>");
    }
    gdc::DebugTreeNode::addProperty((uint64_t)a3, (uint64_t)v27, (uint64_t)v13);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
  }
  if (LOBYTE(self->_speedLimit))
  {
    v27[23] = 11;
    strcpy(v27, "CountryCode");
    v10 = *(unsigned int *)&self->_isAboveSpeedThreshold;
    v12 = 1;
    memset(&v11[4], 0, 24);
    v11[1] = v10;
    gdc::DebugTreeNode::addProperty((uint64_t)a3, (uint64_t)v27, (uint64_t)v11);
  }
}

- (int64_t)type
{
  return *(_QWORD *)&self->super._routeLegWhen._hasValue;
}

- (unsigned)speedThreshold
{
  return self->_speedLimitText;
}

- (BOOL)isAboveSpeedThreshold
{
  return self->super._routeLegWhen._value.data[0];
}

- (NSString)speedLimitText
{
  return (NSString *)self->_type;
}

- (unsigned)countryCode
{
  return *(_DWORD *)&self->_isAboveSpeedThreshold;
}

- (BOOL)hasCountryCode
{
  return self->_speedLimit;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
}

+ (id)stringForTrafficCameraType:(int64_t)a3
{
  if ((unint64_t)a3 > 6)
    return 0;
  else
    return off_1E42F29F8[a3];
}

@end
