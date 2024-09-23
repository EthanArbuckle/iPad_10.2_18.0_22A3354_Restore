@implementation SXVideoComponent

+ (id)typeString
{
  return CFSTR("video");
}

- (SXVideoComponent)initWithJSONObject:(id)a3 andVersion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  SXVideoComponent *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v8 = v6;
  objc_opt_class();
  v9 = v8;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "objectForKey:", CFSTR("prerollPlacementIdentifier"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = v8;
    if (!v10)
    {
      v9 = (void *)objc_msgSend(v8, "mutableCopy");
      objc_msgSend(MEMORY[0x24BDD1880], "UUID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "UUIDString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKey:", v12, CFSTR("prerollPlacementIdentifier"));

    }
  }
  v15.receiver = self;
  v15.super_class = (Class)SXVideoComponent;
  v13 = -[SXJSONObject initWithJSONObject:andVersion:](&v15, sel_initWithJSONObject_andVersion_, v9, v7);

  return v13;
}

- (double)aspectRatioWithValue:(id)a3 withType:(int)a4
{
  float v4;
  double v5;
  BOOL v6;
  double result;

  if (a4 != 2)
    return 1.77777779;
  objc_msgSend(a3, "floatValue");
  v5 = v4;
  v6 = v4 == 0.0;
  result = 1.77777779;
  if (!v6)
    return v5;
  return result;
}

- (BOOL)allowsPrerollAdsWithValue:(id)a3 withType:(int)a4
{
  if (a3 && a4 == 2)
    return objc_msgSend(a3, "BOOLValue");
  else
    return 1;
}

- (unint64_t)traits
{
  return 2;
}

@end
