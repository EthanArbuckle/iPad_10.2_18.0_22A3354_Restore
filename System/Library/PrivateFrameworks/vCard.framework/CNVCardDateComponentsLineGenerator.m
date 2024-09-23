@implementation CNVCardDateComponentsLineGenerator

- (id)makeLineWithName:(id)a3 value:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  CNVCardDateComponentsFormatter *v11;
  void *v12;
  void *v13;
  objc_super v15;

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

  v11 = objc_alloc_init(CNVCardDateComponentsFormatter);
  -[CNVCardDateComponentsFormatter stringFromDateComponents:](v11, "stringFromDateComponents:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15.receiver = self;
  v15.super_class = (Class)CNVCardDateComponentsLineGenerator;
  -[CNVCardLineGenerator makeLineWithName:value:](&v15, sel_makeLineWithName_value_, v7, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)lineWithValue:(id)a3 label:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CNVCardDateComponentsLineGenerator;
  v5 = a3;
  -[CNVCardLineGenerator lineWithValue:label:](&v10, sel_lineWithValue_label_, v5, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "year");

  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), 1604);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addParameterWithName:value:", CFSTR("X-APPLE-OMIT-YEAR"), v8);

  }
  return v6;
}

@end
