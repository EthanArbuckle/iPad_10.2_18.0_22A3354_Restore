@implementation PRRelativePosition

- (PRRelativePosition)initWithTimestamp:(double)a3 range:(id)a4 azimuth:(id)a5 elevation:(id)a6
{
  id v11;
  id v12;
  id v13;
  PRRelativePosition *v14;
  PRRelativePosition *v15;
  objc_super v17;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)PRRelativePosition;
  v14 = -[PRRelativePosition init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_timestamp = a3;
    objc_storeStrong((id *)&v14->_range, a4);
    objc_storeStrong((id *)&v15->_azimuth, a5);
    objc_storeStrong((id *)&v15->_elevation, a6);
  }

  return v15;
}

+ (id)relativePositionWithTimestamp:(double)a3 range:(id)a4 azimuth:(id)a5 elevation:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithTimestamp:range:azimuth:elevation:", v12, v11, v10, a3);

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PRRelativePosition)initWithCoder:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  PRRelativePosition *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("Timestamp"));
  v6 = v5;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Range"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Azimuth"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Elevation"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[PRRelativePosition initWithTimestamp:range:azimuth:elevation:](self, "initWithTimestamp:range:azimuth:elevation:", v7, v8, v9, v6);
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  double timestamp;
  id v5;

  timestamp = self->_timestamp;
  v5 = a3;
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("Timestamp"), timestamp);
  objc_msgSend(v5, "encodeObject:forKey:", self->_range, CFSTR("Range"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_azimuth, CFSTR("Azimuth"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_elevation, CFSTR("Elevation"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_cycleIndex, CFSTR("CycleIndex"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[PRRelativePosition initWithTimestamp:range:azimuth:elevation:]([PRRelativePosition alloc], "initWithTimestamp:range:azimuth:elevation:", self->_range, self->_azimuth, self->_elevation, self->_timestamp);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("range: (%@), azimuth: (%@), elevation: (%@)"), self->_range, self->_azimuth, self->_elevation);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[PRRelativePosition timestamp](self, "timestamp");
    v7 = v6;
    objc_msgSend(v5, "timestamp");
    if (v7 == v8)
    {
      -[PRRelativePosition range](self, "range");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "range");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "isEqual:", v10))
      {
        -[PRRelativePosition azimuth](self, "azimuth");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "azimuth");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "isEqual:", v12))
        {
          -[PRRelativePosition elevation](self, "elevation");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "elevation");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v13, "isEqual:", v14);

        }
        else
        {
          v15 = 0;
        }

      }
      else
      {
        v15 = 0;
      }

    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (int64_t)cycleIndex
{
  return self->_cycleIndex;
}

- (PRRangeMeasurement)range
{
  return self->_range;
}

- (PRAngleMeasurement)azimuth
{
  return self->_azimuth;
}

- (PRAngleMeasurement)elevation
{
  return self->_elevation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_elevation, 0);
  objc_storeStrong((id *)&self->_azimuth, 0);
  objc_storeStrong((id *)&self->_range, 0);
}

@end
