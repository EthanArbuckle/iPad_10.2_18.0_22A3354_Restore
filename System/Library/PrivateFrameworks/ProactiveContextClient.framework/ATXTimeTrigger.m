@implementation ATXTimeTrigger

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)type
{
  return 3;
}

- (ATXTimeTrigger)initWithCoder:(id)a3
{
  id v4;
  ATXTimeTrigger *v5;
  uint64_t v6;
  NSDateComponents *timeComponents;
  ATXTimeTrigger *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ATXTimeTrigger;
  v5 = -[ATXTimeTrigger init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("timeComponents"));
    v6 = objc_claimAutoreleasedReturnValue();
    timeComponents = v5->_timeComponents;
    v5->_timeComponents = (NSDateComponents *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_timeComponents, CFSTR("timeComponents"));
}

- (NSDateComponents)timeComponents
{
  return self->_timeComponents;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeComponents, 0);
}

@end
