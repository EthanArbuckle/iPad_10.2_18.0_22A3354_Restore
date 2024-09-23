@implementation SXTextComponentScrollPosition

- (SXTextComponentScrollPosition)initWithComponentIdentifier:(id)a3 canvasWidth:(double)a4 relativePageOffset:(double)a5 characterIndex:(int64_t)a6 relativeTextOffset:(double)a7
{
  SXTextComponentScrollPosition *result;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SXTextComponentScrollPosition;
  result = -[SXComponentScrollPosition initWithComponentIdentifier:canvasWidth:relativePageOffset:](&v10, sel_initWithComponentIdentifier_canvasWidth_relativePageOffset_, a3, a4, a5);
  if (result)
  {
    result->_characterIndex = a6;
    result->_relativeTextOffset = a7;
  }
  return result;
}

- (SXTextComponentScrollPosition)initWithCoder:(id)a3
{
  id v4;
  SXTextComponentScrollPosition *v5;
  double v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SXTextComponentScrollPosition;
  v5 = -[SXComponentScrollPosition initWithCoder:](&v8, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_characterIndex = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("characterIndex"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("relativeTextOffset"));
    v5->_relativeTextOffset = v6;
  }

  return v5;
}

+ (BOOL)jsonDictionaryRepresentationIsValid:(id)a3 exactly:(BOOL)a4
{
  id v5;
  BOOL v6;
  void *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___SXTextComponentScrollPosition;
  v6 = 0;
  if (objc_msgSendSuper2(&v9, sel_jsonDictionaryRepresentationIsValid_exactly_, v5, 0))
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("characterIndex"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v7 != 0;

  }
  return v6;
}

- (SXTextComponentScrollPosition)initWithDictionaryRepresentation:(id)a3 exactly:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  SXTextComponentScrollPosition *v7;
  void *v8;
  void *v9;
  double v10;
  SXTextComponentScrollPosition *v11;
  objc_super v13;

  v4 = a4;
  v6 = a3;
  if (objc_msgSend((id)objc_opt_class(), "jsonDictionaryRepresentationIsValid:exactly:", v6, v4))
  {
    v13.receiver = self;
    v13.super_class = (Class)SXTextComponentScrollPosition;
    v7 = -[SXComponentScrollPosition initWithDictionaryRepresentation:exactly:](&v13, sel_initWithDictionaryRepresentation_exactly_, v6, 0);
    if (v7)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("characterIndex"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v7->_characterIndex = objc_msgSend(v8, "integerValue");

      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("relativeTextOffset"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "doubleValue");
      v7->_relativeTextOffset = v10;

    }
    self = v7;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SXTextComponentScrollPosition;
  -[SXComponentScrollPosition dictionaryRepresentation](&v11, sel_dictionaryRepresentation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_msgSend(v3, "mutableCopy");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[SXTextComponentScrollPosition characterIndex](self, "characterIndex"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("characterIndex"));

    v7 = (void *)MEMORY[0x24BDD16E0];
    -[SXTextComponentScrollPosition relativeTextOffset](self, "relativeTextOffset");
    objc_msgSend(v7, "numberWithDouble:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("relativeTextOffset"));

    v9 = (void *)objc_msgSend(v5, "copy");
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SXTextComponentScrollPosition;
  v4 = a3;
  -[SXComponentScrollPosition encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", -[SXTextComponentScrollPosition characterIndex](self, "characterIndex", v5.receiver, v5.super_class), CFSTR("characterIndex"));
  -[SXTextComponentScrollPosition relativeTextOffset](self, "relativeTextOffset");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("relativeTextOffset"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)characterIndex
{
  return self->_characterIndex;
}

- (double)relativeTextOffset
{
  return self->_relativeTextOffset;
}

@end
