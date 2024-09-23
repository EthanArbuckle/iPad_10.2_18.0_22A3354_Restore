@implementation PPCalendar

- (PPCalendar)initWithEKCalendar:(id)a3 internPool:(id)a4
{
  PPCalendar *v5;

  objc_msgSend(a4, "internedCalendarWithEKCalendar:", a3);
  v5 = (PPCalendar *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (PPCalendar)initWithCalendarIdentifier:(id)a3 title:(id)a4 color:(CGColor *)a5
{
  id v8;
  id v9;
  PPCalendar *v10;
  uint64_t v11;
  NSString *calendarIdentifier;
  uint64_t v13;
  NSString *title;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PPCalendar;
  v10 = -[PPCalendar init](&v16, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    calendarIdentifier = v10->_calendarIdentifier;
    v10->_calendarIdentifier = (NSString *)v11;

    v13 = objc_msgSend(v9, "copy");
    title = v10->_title;
    v10->_title = (NSString *)v13;

    CGColorRetain(a5);
    v10->_color = a5;
  }

  return v10;
}

- (void)dealloc
{
  objc_super v3;

  CGColorRelease(self->_color);
  v3.receiver = self;
  v3.super_class = (Class)PPCalendar;
  -[PPCalendar dealloc](&v3, sel_dealloc);
}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<PPCalendar i:'%@' t:'%@'>"), self->_calendarIdentifier, self->_title);
}

- (PPCalendar)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  CGColor *v10;
  PPCalendar *v11;

  v4 = a3;
  v5 = objc_opt_class();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("cid"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("ttl"));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v6)
    v9 = v7 == 0;
  else
    v9 = 1;
  if (v9)
  {
    v11 = 0;
  }
  else
  {
    v10 = PPCreateCalendarColorWithDecoder(v4);
    self = -[PPCalendar initWithCalendarIdentifier:title:color:](self, "initWithCalendarIdentifier:title:color:", v6, v8, v10);
    CGColorRelease(v10);
    v11 = self;
  }

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *calendarIdentifier;
  id v5;

  calendarIdentifier = self->_calendarIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", calendarIdentifier, CFSTR("cid"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_title, CFSTR("ttl"));
  PPEncodeCalendarColor(v5, self->_color);

}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_calendarIdentifier, "hash");
  return -[NSString hash](self->_title, "hash") - v3 + 32 * v3;
}

- (BOOL)isEqual:(id)a3
{
  PPCalendar *v4;
  PPCalendar *v5;
  BOOL v6;

  v4 = (PPCalendar *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PPCalendar isEqualToCalendar:](self, "isEqualToCalendar:", v5);

  return v6;
}

- (BOOL)isEqualToCalendar:(id)a3
{
  id *v4;
  id *v5;
  NSString *calendarIdentifier;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  char v10;
  NSString *title;
  NSString *v12;
  NSString *v13;
  NSString *v14;
  char v15;
  BOOL v16;
  CGColor *color;
  CGColor *v18;

  v4 = (id *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_8;
  calendarIdentifier = self->_calendarIdentifier;
  v7 = (NSString *)v4[1];
  if (calendarIdentifier == v7)
  {

  }
  else
  {
    v8 = v7;
    v9 = calendarIdentifier;
    v10 = -[NSString isEqual:](v9, "isEqual:", v8);

    if ((v10 & 1) == 0)
      goto LABEL_8;
  }
  title = self->_title;
  v12 = (NSString *)v5[2];
  if (title == v12)
  {

  }
  else
  {
    v13 = v12;
    v14 = title;
    v15 = -[NSString isEqual:](v14, "isEqual:", v13);

    if ((v15 & 1) == 0)
    {
LABEL_8:
      v16 = 0;
      goto LABEL_13;
    }
  }
  color = self->_color;
  v18 = (CGColor *)v5[3];
  v16 = color == v18 || CGColorEqualToColor(color, v18);
LABEL_13:

  return v16;
}

- (NSString)calendarIdentifier
{
  return self->_calendarIdentifier;
}

- (NSString)title
{
  return self->_title;
}

- (CGColor)color
{
  return self->_color;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_calendarIdentifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
