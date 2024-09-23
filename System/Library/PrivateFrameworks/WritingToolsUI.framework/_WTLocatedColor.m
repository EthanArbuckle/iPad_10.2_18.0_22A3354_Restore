@implementation _WTLocatedColor

+ (id)locatedColor:(id)a3 location:(double)a4
{
  id v5;
  void *v6;

  v5 = a3;
  objc_opt_class();
  v6 = (void *)objc_opt_new();
  objc_msgSend(v6, "setColor:", v5);

  objc_msgSend(v6, "setLocation:", a4);
  return v6;
}

- (_WTColor)color
{
  return (_WTColor *)objc_getProperty(self, a2, 8, 1);
}

- (void)setColor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (double)location
{
  return self->_location;
}

- (void)setLocation:(double)a3
{
  self->_location = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);
}

@end
