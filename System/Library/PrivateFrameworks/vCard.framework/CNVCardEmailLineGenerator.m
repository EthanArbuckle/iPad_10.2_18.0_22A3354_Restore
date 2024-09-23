@implementation CNVCardEmailLineGenerator

- (id)lineWithValue:(id)a3 label:(id)a4
{
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CNVCardEmailLineGenerator;
  -[CNVCardLineGenerator lineWithValue:label:](&v6, sel_lineWithValue_label_, a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "insertParameterWithName:value:atIndex:", CFSTR("type"), CFSTR("INTERNET"), 0);
  return v4;
}

- (id)standardLabelsForLabel:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  objc_super v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("MobileMe")))
  {
    v9[0] = CFSTR("MOBILEME");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)CNVCardEmailLineGenerator;
    -[CNVCardLineGenerator standardLabelsForLabel:](&v8, sel_standardLabelsForLabel_, v4);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;

  return v6;
}

@end
