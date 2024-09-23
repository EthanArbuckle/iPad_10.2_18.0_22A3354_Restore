@implementation PedestrianARCustomFeatureAnnotation

- (PedestrianARCustomFeatureAnnotation)initWithCustomFeature:(id)a3 labelMarker:(id)a4 isActive:(BOOL)a5
{
  id v9;
  id v10;
  PedestrianARCustomFeatureAnnotation *v11;
  PedestrianARCustomFeatureAnnotation *v12;
  id v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  char *v18;
  id v19;
  NSObject *v20;
  id v21;
  NSObject *v22;
  char *v23;
  objc_super v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  const char *v32;

  v9 = a3;
  v10 = a4;
  if (!v9)
  {
    v14 = sub_1004318FC();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v26 = "-[PedestrianARCustomFeatureAnnotation initWithCustomFeature:labelMarker:isActive:]";
      v27 = 2080;
      v28 = "PedestrianARDebugMapAnnotationsTask.m";
      v29 = 1024;
      v30 = 86;
      v31 = 2080;
      v32 = "customFeature != nil";
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v16 = sub_1004318FC();
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v18 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v26 = v18;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  if (!v10)
  {
    v19 = sub_1004318FC();
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v26 = "-[PedestrianARCustomFeatureAnnotation initWithCustomFeature:labelMarker:isActive:]";
      v27 = 2080;
      v28 = "PedestrianARDebugMapAnnotationsTask.m";
      v29 = 1024;
      v30 = 87;
      v31 = 2080;
      v32 = "labelMarker != nil";
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v21 = sub_1004318FC();
      v22 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v23 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v26 = v23;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  v24.receiver = self;
  v24.super_class = (Class)PedestrianARCustomFeatureAnnotation;
  v11 = -[PedestrianARCustomFeatureAnnotation init](&v24, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_feature, a3);
    objc_storeStrong((id *)&v12->_labelMarker, a4);
    v12->_isActive = a5;
    v12->_isOccluded = -[VKLabelMarker isOccluded](v12->_labelMarker, "isOccluded");
  }

  return v12;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinate
{
  double v2;
  double v3;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  -[VKLabelMarker coordinate](self->_labelMarker, "coordinate");
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (NSString)debugDescription
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  v3 = objc_alloc((Class)NSString);
  v4 = objc_opt_class(self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARCustomFeatureAnnotation feature](self, "feature"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARCustomFeatureAnnotation labelMarker](self, "labelMarker"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARCustomFeatureAnnotation labelMarker](self, "labelMarker"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "arWalkingFeature"));
  v9 = -[PedestrianARCustomFeatureAnnotation isActive](self, "isActive");
  v10 = -[PedestrianARCustomFeatureAnnotation isOccluded](self, "isOccluded");
  -[PedestrianARCustomFeatureAnnotation coordinate](self, "coordinate");
  v12 = v11;
  -[PedestrianARCustomFeatureAnnotation coordinate](self, "coordinate");
  v14 = objc_msgSend(v3, "initWithFormat:", CFSTR("<\n%@: %p \n customFeature: %@ \n labelMarker: %@ \n arWalkingFeature: %@ \n isActive: %d \n isOccluded: %d \n coordinate: {%+.6f,%+.6f}\n>"), v4, self, v5, v6, v8, v9, v10, v12, v13);

  return (NSString *)v14;
}

- (void)setCoordinate:(id)a3
{
  self->_coordinate = ($AB5116BA7E623E054F959CECB034F4E7)a3;
}

- (VKCustomFeature)feature
{
  return self->_feature;
}

- (VKLabelMarker)labelMarker
{
  return self->_labelMarker;
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (BOOL)isOccluded
{
  return self->_isOccluded;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelMarker, 0);
  objc_storeStrong((id *)&self->_feature, 0);
}

@end
