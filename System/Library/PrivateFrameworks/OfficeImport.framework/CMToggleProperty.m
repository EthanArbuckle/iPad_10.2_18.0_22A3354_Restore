@implementation CMToggleProperty

- (CMToggleProperty)initWithCMTogglePropertyValue:(int)a3
{
  CMToggleProperty *v4;
  CMToggleProperty *v5;
  CMToggleProperty *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CMToggleProperty;
  v4 = -[CMToggleProperty init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->wdValue = a3;
    v6 = v4;
  }

  return v5;
}

- (void)resolveWithBaseProperty:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (v4 && self->wdValue >= 2u)
  {
    v5 = v4;
    self->wdValue = objc_msgSend(v4, "value") ^ (self->wdValue == 129);
    v4 = v5;
  }

}

- (id)cssStringForName:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  if (!objc_msgSend(v4, "compare:", 0x24F3D62D8))
  {
    -[CMToggleProperty mapBold](self, "mapBold");
    v6 = objc_claimAutoreleasedReturnValue();
LABEL_8:
    v5 = (void *)v6;
    goto LABEL_9;
  }
  if (!objc_msgSend(v4, "compare:", 0x24F3D6318))
  {
    -[CMToggleProperty mapItalic](self, "mapItalic");
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if (!objc_msgSend(v4, "compare:", 0x24F3E7198))
  {
    -[CMToggleProperty mapStrikeTrough](self, "mapStrikeTrough");
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  v5 = 0;
LABEL_9:

  return v5;
}

- (id)mapBold
{
  if ((self->wdValue & 1) != 0)
    return CFSTR("font-weight:bold;");
  else
    return CFSTR("font-weight:normal;");
}

- (id)mapItalic
{
  if ((self->wdValue & 1) != 0)
    return CFSTR("font-style:italic;");
  else
    return &stru_24F3BFFF8;
}

- (int)value
{
  return self->wdValue;
}

- (id)mapStrikeTrough
{
  if ((self->wdValue & 1) != 0)
    return CFSTR("text-decoration:line-through;");
  else
    return &stru_24F3BFFF8;
}

- (int)compareValue:(id)a3
{
  id v4;
  int wdValue;
  int v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    wdValue = self->wdValue;
    if (wdValue == objc_msgSend(v4, "value"))
      v6 = 0;
    else
      v6 = -1;
  }
  else
  {
    v6 = -1;
  }

  return v6;
}

@end
