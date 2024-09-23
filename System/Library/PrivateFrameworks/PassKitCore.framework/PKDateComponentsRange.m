@implementation PKDateComponentsRange

- (PKDateComponentsRange)initWithStartDateComponents:(NSDateComponents *)startDateComponents endDateComponents:(NSDateComponents *)endDateComponents
{
  NSDateComponents *v6;
  NSDateComponents *v7;
  NSDateComponents *v8;
  PKDateComponentsRange *v9;
  PKDateComponentsRange *v10;
  uint64_t v11;
  NSDateComponents *v12;
  uint64_t v13;
  NSDateComponents *v14;
  objc_super v16;

  v6 = startDateComponents;
  v7 = endDateComponents;
  v8 = v7;
  v9 = 0;
  if (v6 && v7)
  {
    if (-[NSDateComponents isValidDate](v6, "isValidDate") && -[NSDateComponents isValidDate](v8, "isValidDate"))
    {
      v16.receiver = self;
      v16.super_class = (Class)PKDateComponentsRange;
      v10 = -[PKDateComponentsRange init](&v16, sel_init);
      if (v10)
      {
        v11 = -[NSDateComponents copy](v6, "copy");
        v12 = v10->_startDateComponents;
        v10->_startDateComponents = (NSDateComponents *)v11;

        v13 = -[NSDateComponents copy](v8, "copy");
        v14 = v10->_endDateComponents;
        v10->_endDateComponents = (NSDateComponents *)v13;

      }
      self = v10;
      v9 = self;
    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (id)dateInterval
{
  void *v3;
  uint64_t v4;
  void *v5;
  BOOL v6;
  void *v7;

  -[NSDateComponents date](self->_startDateComponents, "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDateComponents date](self->_endDateComponents, "date");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v3)
    v6 = v4 == 0;
  else
    v6 = 1;
  if (v6)
    v7 = 0;
  else
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v3, v4);

  return v7;
}

- (unint64_t)hash
{
  NSDateComponents *endDateComponents;
  void *v3;
  unint64_t v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  endDateComponents = self->_endDateComponents;
  v6[0] = self->_startDateComponents;
  v6[1] = endDateComponents;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = PKCombinedHash(17, v3);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  PKDateComponentsRange *v4;
  PKDateComponentsRange *v5;
  BOOL v6;

  v4 = (PKDateComponentsRange *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKDateComponentsRange isEqualToDateComponentsRange:](self, "isEqualToDateComponentsRange:", v5);

  return v6;
}

- (BOOL)isEqualToDateComponentsRange:(id)a3
{
  _QWORD *v4;
  NSDateComponents *startDateComponents;
  NSDateComponents *v6;
  BOOL v7;
  char v8;
  NSDateComponents *endDateComponents;
  NSDateComponents *v10;

  v4 = a3;
  startDateComponents = self->_startDateComponents;
  v6 = (NSDateComponents *)v4[1];
  if (startDateComponents)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (!v7)
  {
    if ((-[NSDateComponents isEqual:](startDateComponents, "isEqual:") & 1) != 0)
      goto LABEL_9;
LABEL_7:
    v8 = 0;
    goto LABEL_13;
  }
  if (startDateComponents != v6)
    goto LABEL_7;
LABEL_9:
  endDateComponents = self->_endDateComponents;
  v10 = (NSDateComponents *)v4[2];
  if (endDateComponents && v10)
    v8 = -[NSDateComponents isEqual:](endDateComponents, "isEqual:");
  else
    v8 = endDateComponents == v10;
LABEL_13:

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSDateComponents *startDateComponents;
  id v5;

  startDateComponents = self->_startDateComponents;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", startDateComponents, CFSTR("startDateComponents"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_endDateComponents, CFSTR("endDateComponents"));

}

- (PKDateComponentsRange)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  PKDateComponentsRange *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("startDateComponents"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("endDateComponents"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[PKDateComponentsRange initWithStartDateComponents:endDateComponents:](self, "initWithStartDateComponents:endDateComponents:", v5, v6);
  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDateComponents description](self->_startDateComponents, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("startDateComponents: '%@'; "), v4);

  -[NSDateComponents description](self->_endDateComponents, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("endDateComponents: '%@'; "), v5);

  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  v6 = (void *)objc_msgSend(v3, "copy");

  return v6;
}

- (NSDateComponents)startDateComponents
{
  return self->_startDateComponents;
}

- (NSDateComponents)endDateComponents
{
  return self->_endDateComponents;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDateComponents, 0);
  objc_storeStrong((id *)&self->_startDateComponents, 0);
}

@end
