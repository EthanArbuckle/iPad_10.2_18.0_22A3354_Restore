@implementation _UIDatePickerCalendarDateComponent

+ (unint64_t)representedCalendarUnits
{
  return 2;
}

+ (id)inlineDescriptionForComponents:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = objc_msgSend(a1, "representedCalendarUnits");
  v6 = (void *)objc_opt_new();
  for (i = 1; i != 64; ++i)
  {
    if (((1 << i) & v5) != 0)
    {
      v8 = objc_msgSend(v4, "valueForComponent:");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v9);

    }
  }
  objc_msgSend(v6, "componentsJoinedByString:", CFSTR("-"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (_UIDatePickerCalendarDateComponent)initWithDate:(id)a3 calendar:(id)a4
{
  id v7;
  id v8;
  id v9;
  _UIDatePickerCalendarDateComponent *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSDateComponents *components;
  void *v18;
  void *v19;
  objc_super v20;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDatePickerCalendarDateComponent.m"), 105, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("date"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDatePickerCalendarDateComponent.m"), 106, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("calendar"));

LABEL_3:
  v20.receiver = self;
  v20.super_class = (Class)_UIDatePickerCalendarDateComponent;
  v10 = -[_UIDatePickerCalendarDateComponent init](&v20, sel_init);
  if (v10)
  {
    v11 = (void *)objc_msgSend(v9, "copy");

    v12 = objc_msgSend((id)objc_opt_class(), "representedCalendarUnits");
    v9 = v11;
    objc_msgSend(v9, "components:fromDate:", v12, v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dateFromComponents:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "components:fromDate:", v12 | 0x100000, v14);
    v15 = objc_claimAutoreleasedReturnValue();
    components = v10->_components;
    v10->_components = (NSDateComponents *)v15;

  }
  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;

  objc_opt_class();
  v4 = (_QWORD *)objc_opt_new();
  v5 = -[NSDateComponents copy](self->_components, "copy");
  v6 = (void *)v4[1];
  v4[1] = v5;

  v7 = -[NSDate copy](self->_date, "copy");
  v8 = (void *)v4[2];
  v4[2] = v7;

  return v4;
}

- (unint64_t)hash
{
  return -[NSDateComponents hash](self->_components, "hash");
}

- (BOOL)isEqual:(id)a3
{
  _UIDatePickerCalendarDateComponent *v4;
  _UIDatePickerCalendarDateComponent *v5;
  char v6;

  v4 = (_UIDatePickerCalendarDateComponent *)a3;
  v5 = v4;
  if (self == v4)
  {
    v6 = 1;
  }
  else if (v4
         && -[_UIDatePickerCalendarDateComponent isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class()))
  {
    v6 = -[NSDateComponents isEqual:](self->_components, "isEqual:", v5->_components);
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
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDatePickerCalendarDateComponent calendar](self, "calendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "inlineDescriptionForComponents:", self->_components);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; calendar: %@; components: %@>"), v5, self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSDateComponents)components
{
  return (NSDateComponents *)(id)-[NSDateComponents copy](self->_components, "copy");
}

- (NSDate)date
{
  NSDate *date;
  NSDate *v4;
  NSDate *v5;
  void *v7;
  void *v8;

  date = self->_date;
  if (!date)
  {
    -[NSDateComponents date](self->_components, "date");
    v4 = (NSDate *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[_UIDatePickerCalendarDateComponent date]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("_UIDatePickerCalendarDateComponent.m"), 164, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("date"));

    }
    v5 = self->_date;
    self->_date = v4;

    date = self->_date;
  }
  return date;
}

- (NSCalendar)calendar
{
  void *v4;
  void *v5;
  void *v7;

  -[NSDateComponents calendar](self->_components, "calendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDatePickerCalendarDateComponent.m"), 173, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("calendar"));

  }
  v5 = (void *)objc_msgSend(v4, "copy");

  return (NSCalendar *)v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_components, 0);
}

@end
