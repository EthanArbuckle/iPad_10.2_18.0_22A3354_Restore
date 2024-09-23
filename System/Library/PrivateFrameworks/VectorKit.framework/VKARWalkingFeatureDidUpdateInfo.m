@implementation VKARWalkingFeatureDidUpdateInfo

- (VKARWalkingFeatureDidUpdateInfo)initWithFeature:(id)a3 featureLabelIdentifier:(unint64_t)a4 featureSet:(id)a5 labelPosition:(const void *)a6 updateTypes:(int64_t)a7 isVisible:(BOOL)a8 isDirectlyBehind:(BOOL)a9 screenHeading:()Unit<geo:(double>)a10 :DegreeUnitDescription
{
  id v16;
  id v17;
  VKARWalkingFeatureDidUpdateInfo *v18;
  VKARWalkingFeatureDidUpdateInfo *v19;
  VKARWalkingFeature *v20;
  VKARWalkingFeature *v21;
  VKARWalkingFeature *v22;
  VKARWalkingFeature *obj;
  VKARWalkingFeatureSet *v24;
  VKARWalkingFeatureSet *v25;
  VKARWalkingFeatureSet *v26;
  VKARWalkingFeatureSet *v27;
  double v28;
  VKARWalkingFeatureDidUpdateInfo *v29;
  objc_super v31;
  double *v32;

  v16 = a3;
  v17 = a5;
  v31.receiver = self;
  v31.super_class = (Class)VKARWalkingFeatureDidUpdateInfo;
  v18 = -[VKARWalkingFeatureDidUpdateInfo init](&v31, sel_init);
  v19 = v18;
  if (v18)
  {
    v18->_featureLabelIdentifier = a4;
    v20 = (VKARWalkingFeature *)v16;
    v21 = v20;
    if (v20)
      v22 = v20;
    obj = v19->_feature._obj;
    v19->_feature._obj = v21;

    v24 = (VKARWalkingFeatureSet *)v17;
    v25 = v24;
    if (v24)
      v26 = v24;
    v27 = v19->_featureSet._obj;
    v19->_featureSet._obj = v25;

    v28 = *((double *)a6 + 2);
    *(_OWORD *)&v19->_labelPosition.latitude = *(_OWORD *)a6;
    v19->_labelPosition.altitude = v28;
    v19->_updateTypes = a7;
    v19->_isVisible = a8;
    v19->_isDirectlyBehind = a9;
    v19->_screenHeading._value = *v32;
    v29 = v19;
  }

  return v19;
}

- (VKARWalkingFeature)feature
{
  return self->_feature._obj;
}

- (VKARWalkingFeatureSet)featureSet
{
  return self->_featureSet._obj;
}

- (double)screenHeading
{
  return self->_screenHeading._value;
}

- (id)stringForUpdateTypes
{
  id v3;
  void *v4;
  int64_t updateTypes;
  __CFString *v6;

  if (self->_updateTypes)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v4 = v3;
    updateTypes = self->_updateTypes;
    if ((updateTypes & 1) != 0)
    {
      objc_msgSend(v3, "addObject:", CFSTR("Heading"));
      updateTypes = self->_updateTypes;
    }
    if ((updateTypes & 2) != 0)
    {
      objc_msgSend(v4, "addObject:", CFSTR("Feature"));
      updateTypes = self->_updateTypes;
    }
    if ((updateTypes & 4) != 0)
    {
      objc_msgSend(v4, "addObject:", CFSTR("Label"));
      updateTypes = self->_updateTypes;
    }
    if ((updateTypes & 8) != 0)
      objc_msgSend(v4, "addObject:", CFSTR("Visibility"));
    objc_msgSend(v4, "componentsJoinedByString:", CFSTR("|"));
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = &stru_1E4315B30;
  }
  return v6;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  VKARWalkingFeature *v6;
  double latitude;
  double longitude;
  double altitude;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  const __CFString *v13;
  void *v14;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = self->_feature._obj;
  latitude = self->_labelPosition.latitude;
  longitude = self->_labelPosition.longitude;
  altitude = self->_labelPosition.altitude;
  -[VKARWalkingFeatureDidUpdateInfo stringForUpdateTypes](self, "stringForUpdateTypes");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  v12 = CFSTR("YES");
  if (self->_isVisible)
    v13 = CFSTR("YES");
  else
    v13 = CFSTR("NO");
  if (!self->_isDirectlyBehind)
    v12 = CFSTR("NO");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p feature:%@ position:(%f,%f,%f) updateTypes:%@ isVisible:%@ isDirectlyBehind:%@ screenHeading:%.2f>"), v5, self, v6, *(_QWORD *)&latitude, *(_QWORD *)&longitude, *(_QWORD *)&altitude, v10, v13, v12, *(_QWORD *)&self->_screenHeading._value);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (int64_t)updateTypes
{
  return self->_updateTypes;
}

- ($1AB5FA073B851C12C2339EC22442E995)labelPosition
{
  double latitude;
  double longitude;
  double altitude;
  $1AB5FA073B851C12C2339EC22442E995 result;

  latitude = self->_labelPosition.latitude;
  longitude = self->_labelPosition.longitude;
  altitude = self->_labelPosition.altitude;
  result.var2 = altitude;
  result.var1 = longitude;
  result.var0 = latitude;
  return result;
}

- (BOOL)isVisible
{
  return self->_isVisible;
}

- (BOOL)isDirectlyBehind
{
  return self->_isDirectlyBehind;
}

- (unint64_t)featureLabelIdentifier
{
  return self->_featureLabelIdentifier;
}

- (void).cxx_destruct
{
  self->_featureSet._vptr$_retain_ptr = (void **)&off_1E42B4F50;

  self->_feature._vptr$_retain_ptr = (void **)&off_1E42B4D90;
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = &off_1E42B4D90;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 4) = &off_1E42B4F50;
  *((_QWORD *)self + 5) = 0;
  return self;
}

@end
