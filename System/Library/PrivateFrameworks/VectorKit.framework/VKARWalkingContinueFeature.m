@implementation VKARWalkingContinueFeature

- (VKARWalkingContinueFeature)initWithRoute:(id)a3 range:(GEOPolylineCoordinateRange)a4 displayText:(id)a5
{
  return -[VKARWalkingContinueFeature initWithRoute:range:displayText:continuePriority:](self, "initWithRoute:range:displayText:continuePriority:", a3, *(_QWORD *)&a4.start, *(_QWORD *)&a4.end, a5, -1);
}

- (VKARWalkingContinueFeature)initWithRoute:(id)a3 range:(GEOPolylineCoordinateRange)a4 displayText:(id)a5 continuePriority:(unint64_t)a6
{
  PolylineCoordinate end;
  PolylineCoordinate start;
  id v11;
  id v12;
  VKARWalkingContinueFeature *v13;
  VKARWalkingContinueFeature *v14;
  GEOComposedRoute *v15;
  GEOComposedRoute *v16;
  GEOComposedRoute *v17;
  GEOComposedRoute *obj;
  NSString *v19;
  NSString *v20;
  NSString *v21;
  NSString *v22;
  VKARWalkingContinueFeature *v23;
  objc_super v25;

  end = a4.end;
  start = a4.start;
  v11 = a3;
  v12 = a5;
  v25.receiver = self;
  v25.super_class = (Class)VKARWalkingContinueFeature;
  v13 = -[VKARWalkingFeature initWithType:intraFeaturePriority:](&v25, sel_initWithType_intraFeaturePriority_, 2, a6);
  v14 = v13;
  if (v13)
  {
    v13->_range.start = start;
    v13->_range.end = end;
    v15 = (GEOComposedRoute *)v11;
    v16 = v15;
    if (v15)
      v17 = v15;
    obj = v14->_route._obj;
    v14->_route._obj = v16;

    v19 = (NSString *)v12;
    v20 = v19;
    if (v19)
      v21 = v19;
    v22 = v14->_displayText._obj;
    v14->_displayText._obj = v20;

    v23 = v14;
  }

  return v14;
}

- (GEOComposedRoute)route
{
  return self->_route._obj;
}

- (void)setRoute:(id)a3
{
  id v4;
  id v5;
  GEOComposedRoute *obj;
  id v7;

  v4 = a3;
  v7 = v4;
  if (v4)
  {
    v5 = v4;
    v4 = v7;
  }
  obj = self->_route._obj;
  self->_route._obj = (GEOComposedRoute *)v4;

}

- (NSString)displayText
{
  return self->_displayText._obj;
}

- (void)setDisplayText:(id)a3
{
  NSString *v4;
  NSString *v5;
  NSString *obj;
  NSString *v7;

  v4 = (NSString *)a3;
  v7 = v4;
  if (v4)
  {
    v5 = v4;
    v4 = v7;
  }
  obj = self->_displayText._obj;
  self->_displayText._obj = v4;

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  BOOL v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  uint64_t v13;
  float v14;
  int v15;
  NSString *v16;
  void *v17;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)VKARWalkingContinueFeature;
  if (-[VKARWalkingFeature isEqual:](&v18, sel_isEqual_, v4) && (v5 = objc_opt_class(), v5 == objc_opt_class()))
  {
    v8 = v4;
    -[GEOComposedRoute uniqueRouteID](self->_route._obj, "uniqueRouteID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "route");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "uniqueRouteID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v9, "isEqual:", v11);

    if ((v12 & 1) != 0
      && (v13 = objc_msgSend(v8, "range"), self->_range.start.index == (_DWORD)v13)
      && vabds_f32(self->_range.start.offset, *((float *)&v13 + 1)) < 0.00000011921
      && (objc_msgSend(v8, "range"), self->_range.end.index == v15)
      && vabds_f32(self->_range.end.offset, v14) < 0.00000011921)
    {
      v16 = self->_displayText._obj;
      objc_msgSend(v8, "displayText");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[NSString isEqualToString:](v16, "isEqualToString:", v17);

    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  NSString *v6;
  void *v7;
  void *v8;
  GEOComposedRoute *v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = self->_displayText._obj;
  GEOPolylineCoordinateAsFullString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  GEOPolylineCoordinateAsFullString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = self->_route._obj;
  -[GEOComposedRoute uniqueRouteID](v9, "uniqueRouteID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p text:'%@' range.start:%@ range.end:%@ route:%@ continuePriority:%llu>"), v5, self, v6, v7, v8, v10, -[VKARWalkingFeature intraFeaturePriority](self, "intraFeaturePriority"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (GEOPolylineCoordinateRange)range
{
  GEOPolylineCoordinateRange *p_range;
  PolylineCoordinate start;
  PolylineCoordinate end;
  GEOPolylineCoordinateRange result;

  p_range = &self->_range;
  start = self->_range.start;
  end = p_range->end;
  result.end = end;
  result.start = start;
  return result;
}

- (void).cxx_destruct
{
  self->_displayText._vptr$_retain_ptr = (void **)&off_1E42B5490;

  self->_route._vptr$_retain_ptr = (void **)&off_1E42B4C30;
}

- (id).cxx_construct
{
  *((_QWORD *)self + 3) = 0xBF80000000000000;
  *((_QWORD *)self + 4) = 0xBF80000000000000;
  *((_QWORD *)self + 5) = &off_1E42B4C30;
  *((_QWORD *)self + 6) = 0;
  *((_QWORD *)self + 8) = &off_1E42B5490;
  *((_QWORD *)self + 9) = 0;
  return self;
}

@end
