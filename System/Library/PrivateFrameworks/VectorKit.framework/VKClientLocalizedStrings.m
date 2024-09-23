@implementation VKClientLocalizedStrings

- (VKClientLocalizedStrings)initWithStrings:(id)a3 locale:(id)a4
{
  id v6;
  id v7;
  VKClientLocalizedStrings *v8;
  uint64_t v9;
  NSDictionary *stringDictionary;
  VKClientLocalizedStrings *v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)VKClientLocalizedStrings;
  v8 = -[VKClientLocalizedStrings init](&v13, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    stringDictionary = v8->_stringDictionary;
    v8->_stringDictionary = (NSDictionary *)v9;

    objc_storeStrong((id *)&v8->_locale, a4);
    v11 = v8;
  }

  return v8;
}

- (void)getTextForKey:(id)a3 text:(id *)a4 locale:(id *)a5
{
  id v8;

  v8 = a3;
  -[NSDictionary objectForKeyedSubscript:](self->_stringDictionary, "objectForKeyedSubscript:");
  *a4 = (id)objc_claimAutoreleasedReturnValue();
  if (a5)
    *a5 = objc_retainAutorelease(self->_locale);

}

- (void)getClusterAnnotationTextForClusterCount:(unint64_t)a3 text:(id *)a4 locale:(id *)a5
{
  int v7;
  id v9;
  id v10;

  if (a3 >= 2)
  {
    v7 = a3;
    v10 = 0;
    -[VKClientLocalizedStrings getTextForKey:text:locale:](self, "getTextForKey:text:locale:", &unk_1E4347930, &v10, 0);
    v9 = v10;
    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v9, CFSTR("%d"), 0, (v7 - 1));
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      if (a5)
        *a5 = objc_retainAutorelease(self->_locale);
    }

  }
}

- (void)getAnnotationTextForChargersNoneAvailable:(id *)a3 locale:(id *)a4
{
  id v7;
  id v8;

  v8 = 0;
  -[VKClientLocalizedStrings getTextForKey:text:locale:](self, "getTextForKey:text:locale:", &unk_1E4347948, &v8, 0);
  v7 = v8;
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v7, CFSTR("%d"), 0, 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    if (a4)
      *a4 = objc_retainAutorelease(self->_locale);
  }

}

- (void)getAnnotationTextForChargersAvailable:(unint64_t)a3 total:(unint64_t)a4 text:(id *)a5 locale:(id *)a6
{
  id v11;
  id v12;

  v12 = 0;
  -[VKClientLocalizedStrings getTextForKey:text:locale:](self, "getTextForKey:text:locale:", &unk_1E4347960, &v12, 0);
  v11 = v12;
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v11, CFSTR("%1$u%2$lu"), 0, a3, a4);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    if (a6)
      *a6 = objc_retainAutorelease(self->_locale);
  }

}

- (void)getAnnotationTextForChargersNoStatus:(unint64_t)a3 text:(id *)a4 locale:(id *)a5
{
  id v9;
  id v10;

  v10 = 0;
  -[VKClientLocalizedStrings getTextForKey:text:locale:](self, "getTextForKey:text:locale:", &unk_1E4347978, &v10, 0);
  v9 = v10;
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v9, CFSTR("%lu"), 0, a3);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    if (a5)
      *a5 = objc_retainAutorelease(self->_locale);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_stringDictionary, 0);
}

@end
