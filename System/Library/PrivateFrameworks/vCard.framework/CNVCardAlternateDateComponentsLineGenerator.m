@implementation CNVCardAlternateDateComponentsLineGenerator

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
  void *v14;
  void *v15;
  objc_super v17;

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
  -[CNVCardDateComponentsFormatter altBDAYStringFromDateComponents:](v11, "altBDAYStringFromDateComponents:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17.receiver = self;
  v17.super_class = (Class)CNVCardAlternateDateComponentsLineGenerator;
  -[CNVCardLineGenerator makeLineWithName:value:](&v17, sel_makeLineWithName_value_, v7, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "calendar");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "calendarIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addParameterWithName:value:", CFSTR("CALSCALE"), v15);

  return v13;
}

@end
