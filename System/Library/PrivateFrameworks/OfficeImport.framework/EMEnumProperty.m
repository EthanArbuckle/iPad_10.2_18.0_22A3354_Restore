@implementation EMEnumProperty

+ (id)mapUnderlineValue:(int)a3
{
  if ((a3 - 1) >= 4)
    return &stru_24F3BFFF8;
  else
    return CFSTR("text-decoration:underline;");
}

- (EMEnumProperty)initWithEnum:(int)a3
{
  EMEnumProperty *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)EMEnumProperty;
  result = -[EMEnumProperty init](&v5, sel_init);
  if (result)
    result->wdValue = a3;
  return result;
}

- (id)cssStringForName:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  if (!objc_msgSend(v4, "compare:", CFSTR("text-align")))
  {
    -[EMEnumProperty mapHorizontalAlignment](self, "mapHorizontalAlignment");
    v6 = objc_claimAutoreleasedReturnValue();
LABEL_8:
    v5 = (void *)v6;
    goto LABEL_9;
  }
  if (!objc_msgSend(v4, "compare:", CFSTR("vertical-align")))
  {
    -[EMEnumProperty mapVerticalAlignment](self, "mapVerticalAlignment");
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if (!objc_msgSend(v4, "compare:", CFSTR("underline")))
  {
    -[EMEnumProperty mapUnderline](self, "mapUnderline");
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  v5 = 0;
LABEL_9:

  return v5;
}

- (id)mapHorizontalAlignment
{
  uint64_t wdValue;

  wdValue = self->wdValue;
  if (wdValue > 6)
    return &stru_24F3BFFF8;
  else
    return off_24F3BF930[wdValue];
}

- (id)mapVerticalAlignment
{
  uint64_t wdValue;

  wdValue = self->wdValue;
  if (wdValue > 5)
    return &stru_24F3BFFF8;
  else
    return off_24F3BF968[wdValue];
}

- (int)value
{
  return self->wdValue;
}

+ (id)mapHorizontalAlignmentValue:(int)a3
{
  if (a3 > 6)
    return &stru_24F3BFFF8;
  else
    return off_24F3BF930[a3];
}

+ (id)mapVerticalAlignmentValue:(int)a3
{
  if (a3 > 5)
    return &stru_24F3BFFF8;
  else
    return off_24F3BF968[a3];
}

- (id)mapUnderline
{
  if ((self->wdValue - 1) >= 4)
    return &stru_24F3BFFF8;
  else
    return CFSTR("text-decoration:underline;");
}

- (BOOL)isEqual:(id)a3
{
  EMEnumProperty *v4;
  BOOL v5;

  v4 = (EMEnumProperty *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 && v4->wdValue == self->wdValue;
  }

  return v5;
}

- (unint64_t)hash
{
  return self->wdValue;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@: %p %d>"), objc_opt_class(), self, self->wdValue);
}

@end
