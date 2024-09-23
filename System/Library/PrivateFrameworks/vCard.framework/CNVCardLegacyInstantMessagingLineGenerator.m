@implementation CNVCardLegacyInstantMessagingLineGenerator

- (id)makeLineWithName:(id)a3 value:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  objc_super v14;

  v6 = a4;
  v7 = a3;
  objc_opt_class();
  v8 = v6;
  if (v8)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;
    v10 = v9;
  }
  else
  {
    v10 = 0;
  }

  objc_msgSend(v10, "objectForKey:", CFSTR("username"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14.receiver = self;
  v14.super_class = (Class)CNVCardLegacyInstantMessagingLineGenerator;
  -[CNVCardLineGenerator makeLineWithName:value:](&v14, sel_makeLineWithName_value_, v7, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

@end
