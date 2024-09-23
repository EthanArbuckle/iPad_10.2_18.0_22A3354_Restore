@implementation WMEnumProperty

- (WMEnumProperty)initWithEnum:(unint64_t)a3
{
  WMEnumProperty *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WMEnumProperty;
  result = -[WMEnumProperty init](&v5, sel_init);
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
  if (!objc_msgSend(v4, "compare:", 0x24F3E70D8))
  {
    -[WMEnumProperty mapJustification](self, "mapJustification");
    v6 = objc_claimAutoreleasedReturnValue();
LABEL_10:
    v5 = (void *)v6;
    goto LABEL_11;
  }
  if (!objc_msgSend(v4, "compare:", 0x24F3E6698))
  {
    -[WMEnumProperty mapVerticalAlign](self, "mapVerticalAlign");
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  if (!objc_msgSend(v4, "compare:", CFSTR("underline")))
  {
    -[WMEnumProperty mapUnderline](self, "mapUnderline");
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  if (!objc_msgSend(v4, "compare:", 0x24F3E71F8))
  {
    -[WMEnumProperty mapCellTextVAlign](self, "mapCellTextVAlign");
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  v5 = 0;
LABEL_11:

  return v5;
}

- (id)mapJustification
{
  unint64_t wdValue;

  wdValue = self->wdValue;
  if (wdValue > 3)
    return 0;
  else
    return off_24F3BF408[wdValue];
}

- (id)mapUnderline
{
  unint64_t wdValue;

  wdValue = self->wdValue;
  if (wdValue == 5 || wdValue == 0)
    return &stru_24F3BFFF8;
  else
    return CFSTR("text-decoration:underline;");
}

- (id)mapCellTextVAlign
{
  unint64_t wdValue;

  wdValue = self->wdValue;
  if (wdValue > 2)
    return &stru_24F3BFFF8;
  else
    return off_24F3BF428[wdValue];
}

- (unint64_t)value
{
  return self->wdValue;
}

- (id)mapVerticalAlign
{
  unint64_t wdValue;
  const __CFString *v3;

  wdValue = self->wdValue;
  v3 = &stru_24F3BFFF8;
  if (wdValue == 1)
    v3 = CFSTR("vertical-align:super;");
  if (wdValue == 2)
    return CFSTR("vertical-align:sub;");
  else
    return (id)v3;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@: %p (value = %tu)>"), objc_opt_class(), self, self->wdValue);
}

@end
