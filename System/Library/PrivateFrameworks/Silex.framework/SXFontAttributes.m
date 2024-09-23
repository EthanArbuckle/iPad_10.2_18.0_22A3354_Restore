@implementation SXFontAttributes

- (SXFontAttributes)initWithFamilyName:(id)a3 weight:(int64_t)a4 width:(int64_t)a5 style:(int64_t)a6
{
  return -[SXFontAttributes initWithFamilyName:weight:width:style:grade:](self, "initWithFamilyName:weight:width:style:grade:", a3, a4, a5, a6, 0);
}

- (SXFontAttributes)initWithFamilyName:(id)a3 weight:(int64_t)a4 width:(int64_t)a5 style:(int64_t)a6 grade:(id)a7
{
  id v13;
  id v14;
  SXFontAttributes *v15;
  SXFontAttributes *v16;
  objc_super v18;

  v13 = a3;
  v14 = a7;
  v18.receiver = self;
  v18.super_class = (Class)SXFontAttributes;
  v15 = -[SXFontAttributes init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_familyName, a3);
    v16->_weight = a4;
    v16->_width = a5;
    v16->_style = a6;
    objc_storeStrong((id *)&v16->_grade, a7);
  }

  return v16;
}

- (unint64_t)hash
{
  int64_t v3;
  NSUInteger v4;

  v3 = self->_width ^ self->_weight ^ self->_style;
  v4 = -[NSString hash](self->_familyName, "hash");
  return v3 ^ v4 ^ -[NSNumber hash](self->_grade, "hash");
}

- (BOOL)isEqual:(id)a3
{
  SXFontAttributes *v4;
  SXFontAttributes *v5;
  BOOL v6;

  v4 = (SXFontAttributes *)a3;
  v5 = v4;
  if (self == v4)
    v6 = 1;
  else
    v6 = v4
      && self->_weight == v4->_weight
      && self->_width == v4->_width
      && self->_style == v4->_style
      && -[NSString isEqual:](self->_familyName, "isEqual:", v4->_familyName)
      && -[NSNumber isEqualToNumber:](self->_grade, "isEqualToNumber:", v5->_grade);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[SXFontAttributes initWithFamilyName:weight:width:style:grade:]([SXFontAttributes alloc], "initWithFamilyName:weight:width:style:grade:", self->_familyName, self->_weight, self->_width, self->_style, self->_grade);
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("<%@: %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXFontAttributes familyName](self, "familyName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; familyName: %@"), v4);

  -[SXFontAttributes stringForWeight:](self, "stringForWeight:", -[SXFontAttributes weight](self, "weight"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; weight: %@"), v5);

  -[SXFontAttributes stringForWidth:](self, "stringForWidth:", -[SXFontAttributes width](self, "width"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; width: %@"), v6);

  -[SXFontAttributes stringForStyle:](self, "stringForStyle:", -[SXFontAttributes style](self, "style"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; style: %@"), v7);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return (NSString *)v3;
}

- (id)stringForStyle:(int64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("normal");
  if (a3 == 1)
    v3 = CFSTR("italic");
  if (a3 == 2)
    v3 = CFSTR("oblique");
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
    return CFSTR("undefined");
  else
    return (id)v3;
}

- (id)stringForWeight:(int64_t)a3
{
  const __CFString *v3;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;

  v3 = CFSTR("thin");
  v4 = CFSTR("extra-bold");
  v5 = CFSTR("black");
  v6 = CFSTR("undefined");
  if (a3 != 0x7FFFFFFFFFFFFFFFLL)
    v6 = CFSTR("thin");
  if (a3 != 900)
    v5 = v6;
  if (a3 != 800)
    v4 = v5;
  v7 = CFSTR("bold");
  if (a3 != 700)
    v7 = CFSTR("thin");
  if (a3 == 600)
    v7 = CFSTR("semi-bold");
  if (a3 <= 799)
    v4 = v7;
  v8 = CFSTR("normal");
  v9 = CFSTR("medium");
  if (a3 != 500)
    v9 = CFSTR("thin");
  if (a3 != 400)
    v8 = v9;
  if (a3 == 300)
    v3 = CFSTR("light");
  if (a3 == 200)
    v3 = CFSTR("extra-light");
  if (a3 > 399)
    v3 = v8;
  if (a3 <= 599)
    return (id)v3;
  else
    return (id)v4;
}

- (id)stringForWidth:(int64_t)a3
{
  id result;

  result = CFSTR("ultra-condensed");
  switch(a3)
  {
    case 0:
      result = CFSTR("ultra-compressed");
      break;
    case 1:
      result = CFSTR("extra-compressed");
      break;
    case 2:
      return result;
    case 3:
      result = CFSTR("compressed");
      break;
    case 4:
      result = CFSTR("extra-condensed");
      break;
    case 5:
      result = CFSTR("condensed");
      break;
    case 6:
      result = CFSTR("semi-condensed");
      break;
    case 7:
      result = CFSTR("normal");
      break;
    case 8:
      result = CFSTR("semi-expanded");
      break;
    case 9:
      result = CFSTR("expanded");
      break;
    case 10:
      result = CFSTR("extra-expanded");
      break;
    case 11:
      result = CFSTR("ultra-expanded");
      break;
    default:
      if (a3 == 0x7FFFFFFFFFFFFFFFLL)
        result = CFSTR("undefined");
      break;
  }
  return result;
}

- (NSString)familyName
{
  return self->_familyName;
}

- (int64_t)weight
{
  return self->_weight;
}

- (int64_t)width
{
  return self->_width;
}

- (int64_t)style
{
  return self->_style;
}

- (NSNumber)grade
{
  return self->_grade;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_grade, 0);
  objc_storeStrong((id *)&self->_familyName, 0);
}

@end
