@implementation NSDictionary(VideosUICore)

- (uint64_t)vui_BOOLForKey:()VideosUICore defaultValue:
{
  void *v5;
  void *v6;

  objc_msgSend(a1, "vui_numberForKey:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    a4 = objc_msgSend(v5, "BOOLValue");

  return a4;
}

- (id)vui_dictionaryForKey:()VideosUICore
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "_vui_lookupValueForKey:expectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)vui_URLForKey:()VideosUICore
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(a1, "_vui_lookupValueForKey:expectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(a1, "_vui_lookupValueForKey:expectedClass:", v4, objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6 && objc_msgSend(v6, "length"))
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "vui_URLWithString:", v7);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }

  }
  return v5;
}

- (id)vui_stringForKey:()VideosUICore
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "_vui_lookupValueForKey:expectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)vui_numberForKey:()VideosUICore
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "_vui_lookupValueForKey:expectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_vui_lookupValueForKey:()VideosUICore expectedClass:
{
  void *v1;

  objc_msgSend(a1, "objectForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v1 = 0;
  }
  return v1;
}

- (id)vui_arrayForKey:()VideosUICore
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "_vui_lookupValueForKey:expectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)vui_attrStringForKey:()VideosUICore
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "_vui_lookupValueForKey:expectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)vui_dateForKey:()VideosUICore
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "_vui_lookupValueForKey:expectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)vui_dataForKey:()VideosUICore
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "_vui_lookupValueForKey:expectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)vui_errorForKey:()VideosUICore
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "_vui_lookupValueForKey:expectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
