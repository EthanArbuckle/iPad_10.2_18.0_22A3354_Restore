@implementation SFUITTRReport

+ (id)peopleSuggestionReport
{
  SFUITTRReport *v2;
  void *v3;
  SFUITTRReport *v4;

  v2 = [SFUITTRReport alloc];
  +[SFUITTRReportComponent peopleSuggesterComponent](SFUITTRReportComponent, "peopleSuggesterComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SFUITTRReport initWithTitle:desc:component:](v2, "initWithTitle:desc:component:", CFSTR("TTR Share Sheet People Suggestions:"), CFSTR("What did you like about the suggestions?\n\n\n\nWhat did you not like about the suggestions?\n\n\n\nWhat didn't make sense in the suggestions?\n\n\n\nWhat were you sharing?\n\n\n\n"), v3);

  return v4;
}

- (SFUITTRReport)initWithTitle:(id)a3 desc:(id)a4 component:(id)a5
{
  id v8;
  id v9;
  id v10;
  SFUITTRReport *v11;
  uint64_t v12;
  NSString *title;
  uint64_t v14;
  NSString *desc;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)SFUITTRReport;
  v11 = -[SFUITTRReport init](&v17, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    title = v11->_title;
    v11->_title = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    desc = v11->_desc;
    v11->_desc = (NSString *)v14;

    objc_storeStrong((id *)&v11->_component, a5);
  }

  return v11;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)desc
{
  return self->_desc;
}

- (void)setDesc:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (SFUITTRReportComponent)component
{
  return self->_component;
}

- (void)setComponent:(id)a3
{
  objc_storeStrong((id *)&self->_component, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_component, 0);
  objc_storeStrong((id *)&self->_desc, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
