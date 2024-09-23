@implementation WFAQIScaleGradientStop

- (WFAQIScaleGradientStop)initWithLocation:(float)a3 color:(id)a4
{
  id v6;
  WFAQIScaleGradientStop *v7;
  WFAQIScaleGradientStop *v8;
  uint64_t v9;
  NSString *color;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)WFAQIScaleGradientStop;
  v7 = -[WFAQIScaleGradientStop init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_location = a3;
    v9 = objc_msgSend(v6, "copy");
    color = v8->_color;
    v8->_color = (NSString *)v9;

  }
  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  WFAQIScaleGradientStop *v4;
  int v5;
  int v6;
  void *v7;
  double v8;
  WFAQIScaleGradientStop *v9;

  v4 = [WFAQIScaleGradientStop alloc];
  -[WFAQIScaleGradientStop location](self, "location");
  v6 = v5;
  -[WFAQIScaleGradientStop color](self, "color");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = v6;
  v9 = -[WFAQIScaleGradientStop initWithLocation:color:](v4, "initWithLocation:color:", v7, v8);

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WFAQIScaleGradientStop location](self, "location");
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("WFAQIScaleGradientLocationKey"));
  -[WFAQIScaleGradientStop color](self, "color");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("WFAQIScaleGradientColorKey"));

}

- (WFAQIScaleGradientStop)initWithCoder:(id)a3
{
  id v4;
  int v5;
  int v6;
  void *v7;
  double v8;
  WFAQIScaleGradientStop *v9;

  v4 = a3;
  objc_msgSend(v4, "decodeFloatForKey:", CFSTR("WFAQIScaleGradientLocationKey"));
  v6 = v5;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WFAQIScaleGradientColorKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v8) = v6;
  v9 = -[WFAQIScaleGradientStop initWithLocation:color:](self, "initWithLocation:color:", v7, v8);

  return v9;
}

- (id)description
{
  void *v3;
  float v4;
  double v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[WFAQIScaleGradientStop location](self, "location");
  v5 = v4;
  -[WFAQIScaleGradientStop color](self, "color");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<WFAQIScaleGradient location: %f, color: %@"), *(_QWORD *)&v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (float)location
{
  return self->_location;
}

- (NSString)color
{
  return self->_color;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);
}

@end
