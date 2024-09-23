@implementation PAEKeyerOMVertex

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PAEKeyerOMVertex)init
{
  PAEKeyerOMVertex *v2;
  double v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PAEKeyerOMVertex;
  v2 = -[PAEKeyerOMVertex init](&v6, sel_init);
  if (v2)
  {
    LODWORD(v3) = 0;
    v4 = (void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v3);
    v2->_lx = (NSNumber *)v4;
    v2->_mx = (NSNumber *)v4;
    v2->_rx = (NSNumber *)v4;
    v2->_bx = (NSNumber *)v4;
    v2->_ly = (NSNumber *)v4;
    v2->_my = (NSNumber *)v4;
    v2->_ry = (NSNumber *)v4;
    v2->_by = (NSNumber *)v4;
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PAEKeyerOMVertex;
  -[PAEKeyerOMVertex dealloc](&v3, sel_dealloc);
}

- (PAEKeyerOMVertex)initWithCoder:(id)a3
{
  PAEKeyerOMVertex *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PAEKeyerOMVertex;
  v4 = -[PAEKeyerOMVertex init](&v6, sel_init);
  if (v4)
  {
    -[PAEKeyerOMVertex setLx:](v4, "setLx:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lx")));
    -[PAEKeyerOMVertex setMx:](v4, "setMx:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mx")));
    -[PAEKeyerOMVertex setRx:](v4, "setRx:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rx")));
    -[PAEKeyerOMVertex setBx:](v4, "setBx:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bx")));
    -[PAEKeyerOMVertex setLy:](v4, "setLy:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ly")));
    -[PAEKeyerOMVertex setMy:](v4, "setMy:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("my")));
    -[PAEKeyerOMVertex setRy:](v4, "setRy:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ry")));
    -[PAEKeyerOMVertex setBy:](v4, "setBy:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("by")));
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_lx, CFSTR("lx"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_mx, CFSTR("mx"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_rx, CFSTR("rx"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_bx, CFSTR("bx"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_ly, CFSTR("ly"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_my, CFSTR("my"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_ry, CFSTR("ry"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_by, CFSTR("by"));
}

- (float)lx
{
  float result;

  -[NSNumber floatValue](self->_lx, "floatValue");
  return result;
}

- (float)mx
{
  float result;

  -[NSNumber floatValue](self->_mx, "floatValue");
  return result;
}

- (float)rx
{
  float result;

  -[NSNumber floatValue](self->_rx, "floatValue");
  return result;
}

- (float)bx
{
  float result;

  -[NSNumber floatValue](self->_bx, "floatValue");
  return result;
}

- (float)ly
{
  float result;

  -[NSNumber floatValue](self->_ly, "floatValue");
  return result;
}

- (float)my
{
  float result;

  -[NSNumber floatValue](self->_my, "floatValue");
  return result;
}

- (float)ry
{
  float result;

  -[NSNumber floatValue](self->_ry, "floatValue");
  return result;
}

- (float)by
{
  float result;

  -[NSNumber floatValue](self->_by, "floatValue");
  return result;
}

- (void)setLx:(id)a3
{
  id v5;

  v5 = a3;

  self->_lx = (NSNumber *)a3;
}

- (void)setMx:(id)a3
{
  id v5;

  v5 = a3;

  self->_mx = (NSNumber *)a3;
}

- (void)setRx:(id)a3
{
  id v5;

  v5 = a3;

  self->_rx = (NSNumber *)a3;
}

- (void)setBx:(id)a3
{
  id v5;

  v5 = a3;

  self->_bx = (NSNumber *)a3;
}

- (void)setLy:(id)a3
{
  id v5;

  v5 = a3;

  self->_ly = (NSNumber *)a3;
}

- (void)setMy:(id)a3
{
  id v5;

  v5 = a3;

  self->_my = (NSNumber *)a3;
}

- (void)setRy:(id)a3
{
  id v5;

  v5 = a3;

  self->_ry = (NSNumber *)a3;
}

- (void)setBy:(id)a3
{
  id v5;

  v5 = a3;

  self->_by = (NSNumber *)a3;
}

@end
