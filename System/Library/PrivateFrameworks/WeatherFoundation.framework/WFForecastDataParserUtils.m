@implementation WFForecastDataParserUtils

+ (id)ascendingTimeComparator
{
  return &__block_literal_global_4;
}

BOOL __52__WFForecastDataParserUtils_ascendingTimeComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL8 v8;

  v4 = a3;
  objc_msgSend(a2, "valueForComponent:", CFSTR("WFWeatherForecastDateComponent"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForComponent:", CFSTR("WFWeatherForecastDateComponent"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "laterDate:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 == v5;

  return v8;
}

+ (id)stringFromKeyPath:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;

  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    v4 = (void *)MEMORY[0x24BDD16A8];
    objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("[ %@"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if ((unint64_t)objc_msgSend(v3, "count") >= 2)
    {
      v7 = 1;
      do
      {
        objc_msgSend(v3, "objectAtIndexedSubscript:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "appendFormat:", CFSTR(" → %@"), v8);

        ++v7;
      }
      while (v7 < objc_msgSend(v3, "count"));
    }
    objc_msgSend(v6, "appendString:", CFSTR(" ]"));
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end
