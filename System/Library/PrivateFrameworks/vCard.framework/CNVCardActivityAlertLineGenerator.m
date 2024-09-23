@implementation CNVCardActivityAlertLineGenerator

- (id)lineWithValue:(id)a3 label:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  objc_opt_class();
  objc_msgSend(v6, "allValues");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;
    v11 = v10;
  }
  else
  {
    v11 = 0;
  }

  if (objc_msgSend(v11, "count"))
  {
    objc_msgSend(v6, "allKeys");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNVCardActivityAlertLineGenerator typeParameterForToneType:](self, "typeParameterForToneType:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[CNVCardActivityAlertLineGenerator serializeType:elements:](self, "serializeType:elements:", v14, v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18.receiver = self;
    v18.super_class = (Class)CNVCardActivityAlertLineGenerator;
    -[CNVCardLineGenerator lineWithValue:label:](&v18, sel_lineWithValue_label_, v15, v7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)serializeType:(id)a3 elements:(id)a4
{
  return +[CNVCardActivityAlertSerialization stringWithType:info:](CNVCardActivityAlertSerialization, "stringWithType:info:", a3, a4);
}

- (id)typeParameterForToneType:(id)a3
{
  id v3;
  __CFString *v4;

  v3 = a3;
  if ((objc_msgSend(v3, "_cn_caseInsensitiveIsEqual:", CFSTR("com.apple.activityalert.call")) & 1) != 0)
  {
    v4 = CFSTR("call");
  }
  else if ((objc_msgSend(v3, "_cn_caseInsensitiveIsEqual:", CFSTR("com.apple.activityalert.text")) & 1) != 0)
  {
    v4 = CFSTR("text");
  }
  else
  {
    v4 = (__CFString *)v3;
  }

  return v4;
}

@end
