@implementation WFDeferredLocalizedString

- (WFDeferredLocalizedString)initWithCharactersNoCopy:(unsigned __int16 *)a3 length:(unint64_t)a4 freeWhenDone:(BOOL)a5
{
  _BOOL8 v5;
  WFDeferredLocalizedString *v8;
  void *v9;
  WFDeferredLocalizedString *v10;
  objc_super v12;

  v5 = a5;
  v12.receiver = self;
  v12.super_class = (Class)WFDeferredLocalizedString;
  v8 = -[WFDeferredLocalizedString init](&v12, sel_init);
  if (v8)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCharactersNoCopy:length:freeWhenDone:", a3, a4, v5);
    -[WFDeferredLocalizedString setBackingStore:](v8, "setBackingStore:", v9);

    v10 = v8;
  }

  return v8;
}

- (unint64_t)length
{
  void *v2;
  unint64_t v3;

  -[WFDeferredLocalizedString backingStore](self, "backingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length");

  return v3;
}

- (unsigned)characterAtIndex:(unint64_t)a3
{
  void *v4;

  -[WFDeferredLocalizedString backingStore](self, "backingStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOWORD(a3) = objc_msgSend(v4, "characterAtIndex:", a3);

  return a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  WFDeferredLocalizedString *v4;
  void *v5;

  v4 = -[WFDeferredLocalizedString initWithString:]([WFDeferredLocalizedString alloc], "initWithString:", self);
  -[WFDeferredLocalizedString localizedValue](self, "localizedValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFDeferredLocalizedString setLocalizedValue:](v4, "setLocalizedValue:", v5);

  return v4;
}

- (NSString)localizedValue
{
  return self->_localizedValue;
}

- (void)setLocalizedValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)backingStore
{
  return self->_backingStore;
}

- (void)setBackingStore:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backingStore, 0);
  objc_storeStrong((id *)&self->_localizedValue, 0);
}

@end
