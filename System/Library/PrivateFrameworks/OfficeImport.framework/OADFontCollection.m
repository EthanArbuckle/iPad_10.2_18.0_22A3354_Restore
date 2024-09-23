@implementation OADFontCollection

- (OADFontCollection)init
{
  OADFontCollection *v2;
  uint64_t v3;
  NSMutableDictionary *scriptToFontMap;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)OADFontCollection;
  v2 = -[OADFontCollection init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    scriptToFontMap = v2->_scriptToFontMap;
    v2->_scriptToFontMap = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (id)fontForScript:(id)a3
{
  -[NSMutableDictionary objectForKeyedSubscript:](self->_scriptToFontMap, "objectForKeyedSubscript:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setFont:(id)a3 forScript:(id)a4
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_scriptToFontMap, "setObject:forKeyedSubscript:", a3, a4);
}

- (id)scripts
{
  return (id)-[NSMutableDictionary allKeys](self->_scriptToFontMap, "allKeys");
}

- (BOOL)isEqualToFontCollection:(id)a3
{
  objc_object **v4;
  char v5;
  objc_super v7;

  v4 = (objc_object **)a3;
  v7.receiver = self;
  v7.super_class = (Class)OADFontCollection;
  if (-[OADBaseFontCollection isEqualToBaseFontCollection:](&v7, sel_isEqualToBaseFontCollection_, v4))
  {
    if (-[NSMutableDictionary count](self->_scriptToFontMap, "count") || -[objc_object count](v4[4], "count"))
      v5 = TCObjectEqual((objc_object *)self->_scriptToFontMap, v4[4]);
    else
      v5 = 1;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)isEmpty
{
  _BOOL4 v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)OADFontCollection;
  v3 = -[OADBaseFontCollection isEmpty](&v5, sel_isEmpty);
  if (v3)
    LOBYTE(v3) = -[NSMutableDictionary count](self->_scriptToFontMap, "count") == 0;
  return v3;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OADFontCollection;
  -[OADFontCollection description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scriptToFontMap, 0);
}

@end
