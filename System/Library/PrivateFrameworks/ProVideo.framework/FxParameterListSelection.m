@implementation FxParameterListSelection

- (FxParameterListSelection)init
{
  FxParameterListSelection *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FxParameterListSelection;
  v2 = -[FxPinParameter init](&v4, sel_init);
  if (v2)
  {
    v2->_listSelectionPriv = (FxParameterListSelectionPriv *)malloc_type_calloc(1uLL, 0x10uLL, 0x10800407411B482uLL);
    -[FxPin setValueClass:](v2, "setValueClass:", objc_opt_class());
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v9;

  FxDebugAssert(self->_listSelectionPriv != 0, CFSTR("_listSelectionPriv == NULL"), v2, v3, v4, v5, v6, v7, (char)v9.receiver);
  free(self->_listSelectionPriv);
  v9.receiver = self;
  v9.super_class = (Class)FxParameterListSelection;
  -[FxPinParameter dealloc](&v9, sel_dealloc);
}

- (int)preferredListVariant
{
  return self->_listSelectionPriv->var0;
}

- (void)setPreferredListVariant:(int)a3
{
  self->_listSelectionPriv->var0 = a3;
}

- (id)listItems
{
  return self->_listSelectionPriv->var1;
}

- (void)setListItems:(id)a3
{
  id var1;

  var1 = self->_listSelectionPriv->var1;
  if (var1)

  self->_listSelectionPriv->var1 = a3;
}

- (id)displayNameForValue:(id)a3
{
  id var1;

  var1 = self->_listSelectionPriv->var1;
  if (var1)
    return (id)objc_msgSend(var1, "objectAtIndex:", (int)objc_msgSend(a3, "intValue"));
  else
    return 0;
}

@end
