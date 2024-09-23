@implementation WLKStoreOfferPeriod

- (WLKStoreOfferPeriod)initWithString:(id)a3
{
  WLKStoreOfferPeriod *v3;
  void *v4;
  WLKStoreOfferPeriod *v5;
  void *v6;
  uint64_t v7;
  NSNumber *duration;
  void *v9;
  uint64_t v10;
  NSString *type;
  WLKStoreOfferPeriod *v12;
  objc_super v14;

  v3 = self;
  -[WLKStoreOfferPeriod _offerPeriodForString:](self, "_offerPeriodForString:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v14.receiver = v3;
    v14.super_class = (Class)WLKStoreOfferPeriod;
    v5 = -[WLKStoreOfferPeriod init](&v14, sel_init);
    if (v5)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("duration"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "copy");
      duration = v5->_duration;
      v5->_duration = (NSNumber *)v7;

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("type"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "copy");
      type = v5->_type;
      v5->_type = (NSString *)v10;

    }
    v3 = v5;
    v12 = v3;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)_offerPeriodForString:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v18;

  v3 = _offerPeriodForString__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&_offerPeriodForString__onceToken, &__block_literal_global_28);
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByTrimmingCharactersInSet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "uppercaseString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v7, "length") < 3)
  {
    v8 = 0;
  }
  else
  {
    v8 = 0;
    if (objc_msgSend(v7, "characterAtIndex:", 0) == 80)
    {
      objc_msgSend(v7, "substringFromIndex:", 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)objc_msgSend(v9, "length") < 2)
      {
        v8 = 0;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3900], "scannerWithString:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 0;
        v11 = objc_msgSend(v10, "scanUpToCharactersFromSet:intoString:", _offerPeriodForString____durationSet, &v18);
        v12 = v18;
        v13 = v12;
        v8 = 0;
        if (v11)
        {
          if ((objc_msgSend(v12, "isEqualToString:", v9) & 1) != 0)
          {
            v8 = 0;
          }
          else
          {
            objc_msgSend(v9, "substringWithRange:", objc_msgSend(v9, "length") - 1, 1);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 2);
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v13, "integerValue"));
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "wlk_setObjectUnlessNil:forKey:", v16, CFSTR("duration"));
            objc_msgSend(v15, "wlk_setObjectUnlessNil:forKey:", v14, CFSTR("type"));
            v8 = (void *)objc_msgSend(v15, "copy");

          }
        }

      }
    }
  }

  return v8;
}

void __45__WLKStoreOfferPeriod__offerPeriodForString___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("MDY"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_offerPeriodForString____durationSet;
  _offerPeriodForString____durationSet = v0;

}

- (NSString)type
{
  return self->_type;
}

- (NSNumber)duration
{
  return self->_duration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_duration, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

@end
