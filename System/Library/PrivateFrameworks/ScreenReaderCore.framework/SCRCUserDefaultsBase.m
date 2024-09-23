@implementation SCRCUserDefaultsBase

- (void)addObserver:(id)a3 forKey:(id)a4
{
  -[SCRCUserDefaultsBase addObserver:forKeyPath:options:context:](self, "addObserver:forKeyPath:options:context:", a3, a4, 1, 0);
}

- (id)valueForUndefinedKey:(id)a3
{
  return 0;
}

- (id)stringForKey:(id)a3
{
  void *v3;
  void *v4;
  CFTypeID v5;
  id v6;
  void *v7;

  -[SCRCUserDefaultsBase valueForKey:](self, "valueForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && (v5 = CFGetTypeID(v3), v5 != CFStringGetTypeID()))
  {
    if (v5 != CFNumberGetTypeID())
    {
      v7 = 0;
      goto LABEL_5;
    }
    objc_msgSend(v4, "stringValue");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = v4;
  }
  v7 = v6;
LABEL_5:

  return v7;
}

- (id)stringForKeyPath:(id)a3
{
  void *v3;
  void *v4;
  CFTypeID v5;
  id v6;
  void *v7;

  -[SCRCUserDefaultsBase valueForKeyPath:](self, "valueForKeyPath:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && (v5 = CFGetTypeID(v3), v5 != CFStringGetTypeID()))
  {
    if (v5 != CFNumberGetTypeID())
    {
      v7 = 0;
      goto LABEL_5;
    }
    objc_msgSend(v4, "stringValue");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = v4;
  }
  v7 = v6;
LABEL_5:

  return v7;
}

- (void)setInt:(int)a3 forKey:(id)a4
{
  uint64_t v4;
  void *v6;
  id v7;
  id v8;

  v4 = *(_QWORD *)&a3;
  v6 = (void *)MEMORY[0x24BDD16E0];
  v7 = a4;
  objc_msgSend(v6, "numberWithInt:", v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[SCRCUserDefaultsBase setValue:forKey:](self, "setValue:forKey:", v8, v7);

}

- (int)intForKey:(id)a3
{
  void *v3;
  void *v4;
  CFTypeID v5;
  int v6;

  -[SCRCUserDefaultsBase valueForKey:](self, "valueForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && ((v5 = CFGetTypeID(v3), v5 == CFStringGetTypeID()) || v5 == CFNumberGetTypeID()))
    v6 = objc_msgSend(v4, "intValue");
  else
    v6 = 0;

  return v6;
}

- (void)setInt:(int)a3 forKeyPath:(id)a4
{
  uint64_t v4;
  void *v6;
  id v7;
  id v8;

  v4 = *(_QWORD *)&a3;
  v6 = (void *)MEMORY[0x24BDD16E0];
  v7 = a4;
  objc_msgSend(v6, "numberWithInt:", v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[SCRCUserDefaultsBase setValue:forKeyPath:](self, "setValue:forKeyPath:", v8, v7);

}

- (int)intForKeyPath:(id)a3
{
  void *v3;
  void *v4;
  CFTypeID v5;
  int v6;

  -[SCRCUserDefaultsBase valueForKeyPath:](self, "valueForKeyPath:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && ((v5 = CFGetTypeID(v3), v5 == CFStringGetTypeID()) || v5 == CFNumberGetTypeID()))
    v6 = objc_msgSend(v4, "intValue");
  else
    v6 = 0;

  return v6;
}

- (void)setFloat:(float)a3 forKey:(id)a4
{
  void *v6;
  id v7;
  double v8;
  id v9;

  v6 = (void *)MEMORY[0x24BDD16E0];
  v7 = a4;
  *(float *)&v8 = a3;
  objc_msgSend(v6, "numberWithFloat:", v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[SCRCUserDefaultsBase setValue:forKey:](self, "setValue:forKey:", v9, v7);

}

- (float)floatForKey:(id)a3
{
  void *v3;
  void *v4;
  float v5;
  CFTypeID v6;
  float v7;

  -[SCRCUserDefaultsBase valueForKey:](self, "valueForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v5 = 0.0;
  if (v3)
  {
    v6 = CFGetTypeID(v3);
    if (v6 == CFStringGetTypeID() || v6 == CFNumberGetTypeID())
    {
      objc_msgSend(v4, "floatValue");
      v5 = v7;
    }
  }

  return v5;
}

- (void)setFloat:(float)a3 forKeyPath:(id)a4
{
  void *v6;
  id v7;
  double v8;
  id v9;

  v6 = (void *)MEMORY[0x24BDD16E0];
  v7 = a4;
  *(float *)&v8 = a3;
  objc_msgSend(v6, "numberWithFloat:", v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[SCRCUserDefaultsBase setValue:forKeyPath:](self, "setValue:forKeyPath:", v9, v7);

}

- (float)floatForKeyPath:(id)a3
{
  void *v3;
  void *v4;
  float v5;
  CFTypeID v6;
  float v7;

  -[SCRCUserDefaultsBase valueForKeyPath:](self, "valueForKeyPath:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v5 = 0.0;
  if (v3)
  {
    v6 = CFGetTypeID(v3);
    if (v6 == CFStringGetTypeID() || v6 == CFNumberGetTypeID())
    {
      objc_msgSend(v4, "floatValue");
      v5 = v7;
    }
  }

  return v5;
}

- (void)setBool:(BOOL)a3 forKey:(id)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;
  id v8;

  v4 = a3;
  v6 = (void *)MEMORY[0x24BDD16E0];
  v7 = a4;
  objc_msgSend(v6, "numberWithBool:", v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[SCRCUserDefaultsBase setValue:forKey:](self, "setValue:forKey:", v8, v7);

}

- (BOOL)BOOLForKey:(id)a3
{
  const __CFBoolean *v3;
  const __CFBoolean *v4;
  CFTypeID v5;
  char v6;

  -[SCRCUserDefaultsBase valueForKey:](self, "valueForKey:", a3);
  v3 = (const __CFBoolean *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    goto LABEL_7;
  v5 = CFGetTypeID(v3);
  if (v5 != CFStringGetTypeID() && v5 != CFNumberGetTypeID())
  {
    if (v5 == CFBooleanGetTypeID())
    {
      v6 = CFBooleanGetValue(v4) != 0;
      goto LABEL_8;
    }
LABEL_7:
    v6 = 0;
    goto LABEL_8;
  }
  v6 = -[__CFBoolean BOOLValue](v4, "BOOLValue");
LABEL_8:

  return v6;
}

- (id)dictForKey:(id)a3
{
  void *v3;
  void *v4;
  CFTypeID v5;
  id v6;

  -[SCRCUserDefaultsBase valueForKey:](self, "valueForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && (v5 = CFGetTypeID(v3), v5 == CFDictionaryGetTypeID()))
    v6 = v4;
  else
    v6 = 0;

  return v6;
}

- (void)setBool:(BOOL)a3 forKeyPath:(id)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;
  id v8;

  v4 = a3;
  v6 = (void *)MEMORY[0x24BDD16E0];
  v7 = a4;
  objc_msgSend(v6, "numberWithBool:", v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[SCRCUserDefaultsBase setValue:forKeyPath:](self, "setValue:forKeyPath:", v8, v7);

}

- (BOOL)BOOLForKeyPath:(id)a3
{
  const __CFBoolean *v3;
  const __CFBoolean *v4;
  CFTypeID v5;
  char v6;

  -[SCRCUserDefaultsBase valueForKeyPath:](self, "valueForKeyPath:", a3);
  v3 = (const __CFBoolean *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    goto LABEL_7;
  v5 = CFGetTypeID(v3);
  if (v5 != CFStringGetTypeID() && v5 != CFNumberGetTypeID())
  {
    if (v5 == CFBooleanGetTypeID())
    {
      v6 = CFBooleanGetValue(v4) != 0;
      goto LABEL_8;
    }
LABEL_7:
    v6 = 0;
    goto LABEL_8;
  }
  v6 = -[__CFBoolean BOOLValue](v4, "BOOLValue");
LABEL_8:

  return v6;
}

@end
