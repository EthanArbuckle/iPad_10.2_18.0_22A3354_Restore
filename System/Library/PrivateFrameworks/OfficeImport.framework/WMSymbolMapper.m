@implementation WMSymbolMapper

+ (BOOL)isSymbolFontName:(id)a3
{
  id v3;
  id v4;
  BOOL v5;
  _QWORD v7[4];
  id v8;

  v3 = a3;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __35__WMSymbolMapper_isSymbolFontName___block_invoke;
  v7[3] = &unk_24F3BF448;
  v8 = v3;
  v4 = v3;
  v5 = objc_msgSend(&unk_24F46A300, "indexOfObjectPassingTest:", v7) != 0x7FFFFFFFFFFFFFFFLL;

  return v5;
}

uint64_t __35__WMSymbolMapper_isSymbolFontName___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "isEqualToString:", *(_QWORD *)(a1 + 32));
  *a4 = result;
  return result;
}

+ (unsigned)mapCharacter:(unsigned __int16)a3 withFontName:(id)a4
{
  uint64_t v4;
  id v5;
  unsigned __int16 v6;
  unsigned __int16 v7;

  v4 = a3;
  v5 = a4;
  if (!objc_msgSend(v5, "compare:", CFSTR("Wingdings")))
  {
    v7 = +[WMSymbolMapper mapWindingsCharacter:](WMSymbolMapper, "mapWindingsCharacter:", v4);
LABEL_6:
    v6 = v7;
    goto LABEL_7;
  }
  if (!objc_msgSend(v5, "compare:", CFSTR("Zapf Dingbats")))
  {
    v7 = +[WMSymbolMapper mapZapfDingbatsCharacter:](WMSymbolMapper, "mapZapfDingbatsCharacter:", v4);
    goto LABEL_6;
  }
  v6 = 0;
LABEL_7:

  return v6;
}

+ (unsigned)mapWindingsCharacter:(unsigned __int16)a3
{
  __int16 v3;
  __int16 v4;
  unsigned __int16 v5;

  if (a3 == 216)
    v3 = 10146;
  else
    v3 = 0;
  if ((a3 - 162) >= 0x14)
    v4 = v3;
  else
    v4 = 9679;
  if ((a3 - 108) >= 0x14)
    v5 = v4;
  else
    v5 = 9679;
  if (a3 == 232)
    return 8594;
  else
    return v5;
}

- (WMSymbolMapper)initWithWDSymbol:(id)a3 parent:(id)a4
{
  id v6;
  id v7;
  WMSymbolMapper *v8;
  void *v9;
  uint64_t v10;
  NSString *mFontName;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)WMSymbolMapper;
  v8 = -[CMMapper initWithParent:](&v13, sel_initWithParent_, v7);
  if (v8)
  {
    v8->mCharacter = objc_msgSend(v6, "character") & 0xFFF;
    objc_msgSend(v6, "font");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "name");
    v10 = objc_claimAutoreleasedReturnValue();
    mFontName = v8->mFontName;
    v8->mFontName = (NSString *)v10;

  }
  return v8;
}

- (void)mapAt:(id)a3 withState:(id)a4
{
  void *v5;
  int v6;
  void *v7;
  void *v8;
  WMStyle *v9;
  id v10;

  v10 = a3;
  +[OIXMLElement elementWithType:](OIXMLElement, "elementWithType:", 16);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addChild:", v5);
  v6 = +[WMSymbolMapper mapCharacter:withFontName:](WMSymbolMapper, "mapCharacter:withFontName:", self->mCharacter, self->mFontName);
  if (v6)
    self->mCharacter = v6;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCharacters:length:", &self->mCharacter, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[OIXMLTextNode textNodeWithStringValue:](OIXMLTextNode, "textNodeWithStringValue:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addChild:", v8);
  v9 = objc_alloc_init(WMStyle);
  -[CMStyle appendPropertyForName:stringWithColons:](v9, "appendPropertyForName:stringWithColons:", 0x24F3D6278, CFSTR(":Symbol;"));
  -[CMMapper addStyleUsingGlobalCacheTo:style:](self, "addStyleUsingGlobalCacheTo:style:", v5, v9);

}

+ (unsigned)mapZapfDingbatsCharacter:(unsigned __int16)a3
{
  if (a3 == 52)
    return 10004;
  else
    return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mFontName, 0);
}

@end
