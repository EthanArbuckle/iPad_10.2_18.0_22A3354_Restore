@implementation VUIDurationValueTransformer

+ (void)initialize
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = objc_opt_class();
  if (v3 == objc_opt_class())
  {
    v4 = (void *)MEMORY[0x1E0CB3B20];
    v5 = objc_alloc_init((Class)a1);
    objc_msgSend(v4, "setValueTransformer:forName:", v5, CFSTR("VUIDurationValueTransformer"));

  }
}

- (VUIDurationValueTransformer)init
{
  VUIDurationValueTransformer *v2;
  NSDateComponentsFormatter *v3;
  NSDateComponentsFormatter *hoursMinutesFormatter;
  NSDateComponentsFormatter *v5;
  NSDateComponentsFormatter *secondsFormatter;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VUIDurationValueTransformer;
  v2 = -[VUIDurationValueTransformer init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSDateComponentsFormatter *)objc_alloc_init(MEMORY[0x1E0CB3570]);
    hoursMinutesFormatter = v2->_hoursMinutesFormatter;
    v2->_hoursMinutesFormatter = v3;

    -[NSDateComponentsFormatter setUnitsStyle:](v2->_hoursMinutesFormatter, "setUnitsStyle:", 2);
    -[NSDateComponentsFormatter setAllowedUnits:](v2->_hoursMinutesFormatter, "setAllowedUnits:", 96);
    v5 = (NSDateComponentsFormatter *)objc_alloc_init(MEMORY[0x1E0CB3570]);
    secondsFormatter = v2->_secondsFormatter;
    v2->_secondsFormatter = v5;

    -[NSDateComponentsFormatter setUnitsStyle:](v2->_secondsFormatter, "setUnitsStyle:", 2);
    -[NSDateComponentsFormatter setAllowedUnits:](v2->_secondsFormatter, "setAllowedUnits:", 128);
  }
  return v2;
}

+ (Class)transformedValueClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)allowsReverseTransformation
{
  return 0;
}

- (id)transformedValue:(id)a3
{
  double v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a3, "doubleValue");
  v5 = v4;
  if (v4 >= 60.0)
    -[VUIDurationValueTransformer hoursMinutesFormatter](self, "hoursMinutesFormatter");
  else
    -[VUIDurationValueTransformer secondsFormatter](self, "secondsFormatter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringFromTimeInterval:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", CFSTR(", "), CFSTR(" "));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSDateComponentsFormatter)hoursMinutesFormatter
{
  return self->_hoursMinutesFormatter;
}

- (void)setHoursMinutesFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_hoursMinutesFormatter, a3);
}

- (NSDateComponentsFormatter)secondsFormatter
{
  return self->_secondsFormatter;
}

- (void)setSecondsFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_secondsFormatter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondsFormatter, 0);
  objc_storeStrong((id *)&self->_hoursMinutesFormatter, 0);
}

@end
