@implementation _RERoutineData

- (BOOL)isEqual:(id)a3
{
  _RERoutineData *v4;
  BOOL v5;

  v4 = (_RERoutineData *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[_RERoutineData isEqualToRoutineData:](self, "isEqualToRoutineData:", v4);
  }

  return v5;
}

- (BOOL)isEqualToRoutineData:(id)a3
{
  _RERoutineData *v4;
  _RERoutineData *v5;
  int64_t v6;
  void *v7;
  void *v8;
  char v9;

  v4 = (_RERoutineData *)a3;
  v5 = v4;
  if (self == v4)
  {
    v9 = 1;
  }
  else if (v4 && (v6 = -[_RERoutineData mode](self, "mode"), v6 == -[_RERoutineData mode](v5, "mode")))
  {
    -[_RERoutineData locationsOfInterest](self, "locationsOfInterest");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_RERoutineData locationsOfInterest](v5, "locationsOfInterest");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqualToArray:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (int64_t)mode
{
  return self->_mode;
}

- (void)setMode:(int64_t)a3
{
  self->_mode = a3;
}

- (NSArray)locationsOfInterest
{
  return self->_locationsOfInterest;
}

- (void)setLocationsOfInterest:(id)a3
{
  objc_storeStrong((id *)&self->_locationsOfInterest, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationsOfInterest, 0);
}

@end
