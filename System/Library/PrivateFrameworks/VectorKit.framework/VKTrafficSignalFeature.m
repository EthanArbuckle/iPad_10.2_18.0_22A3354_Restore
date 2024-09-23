@implementation VKTrafficSignalFeature

- (VKTrafficSignalFeature)initWithTrafficSignalType:(int64_t)a3 uniqueIdentifier:(id)a4 routeOffset:(PolylineCoordinate)a5 onRoute:(id)a6
{
  VKTrafficSignalFeature *v7;
  VKTrafficSignalFeature *v8;
  VKTrafficSignalFeature *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)VKTrafficSignalFeature;
  v7 = -[VKTrafficFeature initWithFeatureType:uniqueIdentifier:routeOffset:onRoute:](&v11, sel_initWithFeatureType_uniqueIdentifier_routeOffset_onRoute_, 2, a4, a5, a6);
  v8 = v7;
  if (v7)
  {
    *(_QWORD *)&v7->super._routeLegWhen._hasValue = a3;
    v9 = v7;
  }

  return v8;
}

- (VKTrafficSignalFeature)initWithTrafficSignal:(id)a3 onRoute:(id)a4
{
  id v6;
  id v7;
  VKTrafficSignalFeature *v8;
  VKTrafficSignalFeature *v9;
  VKTrafficSignalFeature *v10;
  int v11;
  uint64_t v12;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)VKTrafficSignalFeature;
  v8 = -[VKTrafficFeature initWithEnrouteNotice:onRoute:](&v14, sel_initWithEnrouteNotice_onRoute_, v6, v7);
  v9 = v8;
  v10 = 0;
  if (v6 && v8)
  {
    v11 = objc_msgSend(v6, "type");
    v12 = v11 == 2;
    if (v11 == 1)
      v12 = 2;
    *(_QWORD *)&v9->super._routeLegWhen._hasValue = v12;
    if (objc_msgSend(v6, "hasCountryCode"))
    {
      v9->super._routeLegWhen._value.data[4] = 1;
      LODWORD(v9->super._routeLegWhen._value.type) = objc_msgSend(v6, "countryCode");
    }
    v10 = v9;
  }

  return v10;
}

- (void)populateDebugNode:(void *)a3
{
  id v5;
  const std::string::value_type *v6;
  uint64_t type_low;
  _QWORD v8[7];
  int v9;
  _BYTE v10[32];
  std::string __p;
  int v12;
  char v13[32];
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)VKTrafficSignalFeature;
  -[VKTrafficFeature populateDebugNode:](&v14, sel_populateDebugNode_);
  v13[23] = 17;
  strcpy(v13, "TrafficSignalType");
  +[VKTrafficSignalFeature stringForTrafficSignalType:](VKTrafficSignalFeature, "stringForTrafficSignalType:", *(_QWORD *)&self->super._routeLegWhen._hasValue);
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v6 = (const std::string::value_type *)objc_msgSend(v5, "UTF8String");
  memset(&__p, 0, sizeof(__p));
  v12 = 4;
  if (v6)
  {
    std::string::__assign_external(&__p, v6);
  }
  else
  {
    *((_BYTE *)&__p.__r_.__value_.__s + 23) = 6;
    strcpy((char *)&__p, "<null>");
  }
  gdc::DebugTreeNode::addProperty((uint64_t)a3, (uint64_t)v13, (uint64_t)v10);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);

  if (self->super._routeLegWhen._value.data[4])
  {
    v13[23] = 11;
    strcpy(v13, "CountryCode");
    type_low = LODWORD(self->super._routeLegWhen._value.type);
    v9 = 1;
    memset(&v8[4], 0, 24);
    v8[1] = type_low;
    gdc::DebugTreeNode::addProperty((uint64_t)a3, (uint64_t)v13, (uint64_t)v8);
  }
}

- (int64_t)type
{
  return *(_QWORD *)&self->super._routeLegWhen._hasValue;
}

- (unsigned)countryCode
{
  return LODWORD(self->super._routeLegWhen._value.type);
}

- (BOOL)hasCountryCode
{
  return self->super._routeLegWhen._value.data[4];
}

+ (id)stringForTrafficSignalType:(int64_t)a3
{
  if ((unint64_t)a3 > 2)
    return 0;
  else
    return (id)*((_QWORD *)&off_1E42F9D80 + a3);
}

@end
