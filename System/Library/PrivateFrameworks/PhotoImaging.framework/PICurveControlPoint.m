@implementation PICurveControlPoint

- (PICurveControlPoint)initWithX:(double)a3 y:(double)a4 editable:(BOOL)a5
{
  PICurveControlPoint *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PICurveControlPoint;
  result = -[PICurveControlPoint init](&v9, sel_init);
  result->_x = a3;
  result->_y = a4;
  result->_editable = a5;
  return result;
}

- (PICurveControlPoint)initWithDictionary:(id)a3
{
  id v3;
  PICurveControlPoint *v4;
  void *v5;
  double v6;
  void *v7;
  double v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PICurveControlPoint;
  v3 = a3;
  v4 = -[PICurveControlPoint init](&v11, sel_init);
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("x"), v11.receiver, v11.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");
  v4->_x = v6;

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("y"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValue");
  v4->_y = v8;

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("editable"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v4->_editable = objc_msgSend(v9, "BOOLValue");
  return v4;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("x");
  v3 = (void *)MEMORY[0x1E0CB37E8];
  -[PICurveControlPoint x](self, "x");
  objc_msgSend(v3, "numberWithDouble:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v4;
  v10[1] = CFSTR("y");
  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[PICurveControlPoint y](self, "y");
  objc_msgSend(v5, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v6;
  v10[2] = CFSTR("editable");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PICurveControlPoint isEditable](self, "isEditable"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _BOOL4 v9;
  uint64_t v10;

  v3 = (void *)MEMORY[0x1E0CB37E8];
  -[PICurveControlPoint x](self, "x");
  objc_msgSend(v3, "numberWithDouble:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 0x130F50B94BD2BDLL * objc_msgSend(v4, "hash");

  v6 = (void *)MEMORY[0x1E0CB37E8];
  -[PICurveControlPoint y](self, "y");
  objc_msgSend(v6, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0x19E7B7D8491DEDLL * objc_msgSend(v7, "hash");

  v9 = -[PICurveControlPoint isEditable](self, "isEditable");
  v10 = 0x1DB601AC6044F9;
  if (!v9)
    v10 = 0;
  return v8 ^ v5 ^ v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  int v12;
  _BOOL4 v14;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[PICurveControlPoint x](self, "x");
    v7 = v6;
    objc_msgSend(v5, "x");
    if (v7 == v8 && (-[PICurveControlPoint y](self, "y"), v10 = v9, objc_msgSend(v5, "y"), v10 == v11))
    {
      v14 = -[PICurveControlPoint isEditable](self, "isEditable");
      v12 = v14 ^ objc_msgSend(v5, "isEditable") ^ 1;
    }
    else
    {
      LOBYTE(v12) = 0;
    }

  }
  else
  {
    LOBYTE(v12) = 0;
  }

  return v12;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  const char *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  if (self->_editable)
    v5 = "editable";
  else
    v5 = "not editable";
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p> [(%.3f, %.3f), %s]"), v4, self, *(_QWORD *)&self->_x, *(_QWORD *)&self->_y, v5);
}

- (double)x
{
  return self->_x;
}

- (double)y
{
  return self->_y;
}

- (BOOL)isEditable
{
  return self->_editable;
}

@end
