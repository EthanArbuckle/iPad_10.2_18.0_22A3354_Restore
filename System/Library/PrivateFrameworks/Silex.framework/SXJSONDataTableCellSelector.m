@implementation SXJSONDataTableCellSelector

- (unint64_t)weightForSelectorKey:(id)a3
{
  id v4;
  unint64_t v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("evenRows")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("oddRows")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("evenColumns")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("oddColumns")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SXJSONDataTableCellSelector;
    v5 = -[SXJSONDataTableSelector weightForSelectorKey:](&v7, sel_weightForSelectorKey_, v4);
  }

  return v5;
}

@end
