@implementation TIContinuousPathSample

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  CGPoint *p_point;
  id v6;
  id v7;

  v4 = (void *)MEMORY[0x24BDD1968];
  p_point = &self->_point;
  v6 = a3;
  objc_msgSend(v4, "value:withObjCType:", p_point, "{CGPoint=dd}");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v7, CFSTR("point"));
  objc_msgSend(v6, "encodeDouble:forKey:", CFSTR("timeStamp"), self->_timeStamp);
  objc_msgSend(v6, "encodeDouble:forKey:", CFSTR("force"), self->_force);
  objc_msgSend(v6, "encodeDouble:forKey:", CFSTR("radius"), self->_radius);
  objc_msgSend(v6, "encodeInteger:forKey:", self->_stage, CFSTR("stage"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_pathIndex, CFSTR("path_index"));

}

- (TIContinuousPathSample)initWithCoder:(id)a3
{
  id v4;
  TIContinuousPathSample *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TIContinuousPathSample;
  v5 = -[TIContinuousPathSample init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("point"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "getValue:size:", &v5->_point, 16);
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("timeStamp"));
    v5->_timeStamp = v7;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("force"));
    v5->_force = v8;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("radius"));
    v5->_radius = v9;
    v5->_stage = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("stage"));
    v5->_pathIndex = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("path_index"));

  }
  return v5;
}

- (TIContinuousPathSample)initWithPoint:(CGPoint)a3 timeStamp:(double)a4 force:(double)a5 radius:(double)a6
{
  return -[TIContinuousPathSample initWithPoint:timeStamp:force:radius:stage:pathIndex:](self, "initWithPoint:timeStamp:force:radius:stage:pathIndex:", 7, -1, a3.x, a3.y, a4, a5, a6);
}

- (TIContinuousPathSample)initWithPoint:(CGPoint)a3 timeStamp:(double)a4 force:(double)a5 radius:(double)a6 stage:(int)a7 pathIndex:(int64_t)a8
{
  CGFloat y;
  CGFloat x;
  TIContinuousPathSample *result;
  objc_super v16;

  y = a3.y;
  x = a3.x;
  v16.receiver = self;
  v16.super_class = (Class)TIContinuousPathSample;
  result = -[TIContinuousPathSample init](&v16, sel_init);
  if (result)
  {
    result->_point.x = x;
    result->_point.y = y;
    result->_timeStamp = a4;
    result->_force = a5;
    result->_radius = a6;
    result->_stage = a7;
    result->_pathIndex = a8;
  }
  return result;
}

- (TIContinuousPathSample)initWithJsonDictionary:(id)a3
{
  id v4;
  TIContinuousPathSample *v5;
  void *v6;
  float v7;
  float v8;
  void *v9;
  float v10;
  float v11;
  void *v12;
  float v13;
  void *v14;
  float v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  float v24;
  objc_super v26;

  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)TIContinuousPathSample;
  v5 = -[TIContinuousPathSample init](&v26, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("x"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "floatValue");
    v8 = v7;

    objc_msgSend(v4, "objectForKey:", CFSTR("y"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "floatValue");
    v11 = v10;

    v5->_point.x = v8;
    v5->_point.y = v11;
    objc_msgSend(v4, "objectForKey:", CFSTR("t"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "floatValue");
    v5->_timeStamp = v13;

    objc_msgSend(v4, "objectForKey:", CFSTR("force"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "floatValue");
    v5->_force = v15;

    objc_msgSend(v4, "objectForKey:", CFSTR("stage"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16)
      v18 = objc_msgSend(v16, "intValue");
    else
      v18 = 7;
    v5->_stage = v18;
    objc_msgSend(v4, "objectForKey:", CFSTR("path_index"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v19)
      v21 = (int)objc_msgSend(v19, "intValue");
    else
      v21 = -1;
    v5->_pathIndex = v21;
    objc_msgSend(v4, "objectForKey:", CFSTR("radius"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v22)
    {
      objc_msgSend(v22, "floatValue");
      v5->_radius = v24;
    }

  }
  return v5;
}

- (id)toJsonDictionary
{
  void *v3;
  CGFloat x;
  void *v5;
  CGFloat y;
  void *v7;
  double timeStamp;
  void *v9;
  double force;
  void *v11;
  double radius;
  void *v13;
  void *v14;
  void *v15;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  x = self->_point.x;
  *(float *)&x = x;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", x);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("x"));

  y = self->_point.y;
  *(float *)&y = y;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", y);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("y"));

  timeStamp = self->_timeStamp;
  *(float *)&timeStamp = timeStamp;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", timeStamp);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("t"));

  force = self->_force;
  *(float *)&force = force;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", force);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("force"));

  radius = self->_radius;
  *(float *)&radius = radius;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", radius);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("radius"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_stage);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("stage"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", LODWORD(self->_pathIndex));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("path_index"));

  return v3;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithFormat:", CFSTR("<%@: %p"), objc_opt_class(), self);
  -[TIContinuousPathSample point](self, "point");
  v5 = v4;
  -[TIContinuousPathSample point](self, "point");
  objc_msgSend(v3, "appendFormat:", CFSTR("; point = (%.1f,%.1f)"), v5, v6);
  -[TIContinuousPathSample timeStamp](self, "timeStamp");
  objc_msgSend(v3, "appendFormat:", CFSTR("; timeStamp = %f"), v7);
  -[TIContinuousPathSample radius](self, "radius");
  objc_msgSend(v3, "appendFormat:", CFSTR("; radius = %f"), v8);
  -[TIContinuousPathSample force](self, "force");
  objc_msgSend(v3, "appendFormat:", CFSTR("; force = %f"), v9);
  objc_msgSend(v3, "appendFormat:", CFSTR("; stage = %u"), -[TIContinuousPathSample stage](self, "stage"));
  objc_msgSend(v3, "appendFormat:", CFSTR("; pathIndex = %ld"), -[TIContinuousPathSample pathIndex](self, "pathIndex"));
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (CGPoint)point
{
  double x;
  double y;
  CGPoint result;

  x = self->_point.x;
  y = self->_point.y;
  result.y = y;
  result.x = x;
  return result;
}

- (double)timeStamp
{
  return self->_timeStamp;
}

- (double)force
{
  return self->_force;
}

- (double)radius
{
  return self->_radius;
}

- (int)stage
{
  return self->_stage;
}

- (int64_t)pathIndex
{
  return self->_pathIndex;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
