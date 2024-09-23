@implementation VKUserReportedTrafficIncident

- (VKUserReportedTrafficIncident)initWithIncidentType:(int64_t)a3 uniqueIdentifier:(id)a4 position:(id)a5 onRoute:(id)a6
{
  VKUserReportedTrafficIncident *v7;
  VKUserReportedTrafficIncident *v8;
  VKUserReportedTrafficIncident *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)VKUserReportedTrafficIncident;
  v7 = -[VKTrafficFeature initWithFeatureType:uniqueIdentifier:position:onRoute:](&v11, sel_initWithFeatureType_uniqueIdentifier_position_onRoute_, 4, a4, a6, a5.var0, a5.var1, a5.var2);
  v8 = v7;
  if (v7)
  {
    *(_QWORD *)&v7->super._routeLegWhen._hasValue = a3;
    v9 = v7;
  }

  return v8;
}

- (int64_t)type
{
  return *(_QWORD *)&self->super._routeLegWhen._hasValue;
}

@end
