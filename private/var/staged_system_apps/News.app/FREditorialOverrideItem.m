@implementation FREditorialOverrideItem

- (FREditorialOverrideItem)initWithIdentifier:(id)a3 title:(id)a4 subtitle:(id)a5 subtitleColorString:(id)a6 actionUrlString:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  FREditorialOverrideItem *v17;
  NSString *v18;
  NSString *identifier;
  NSString *v20;
  NSString *title;
  NSString *v22;
  NSString *subtitle;
  NSString *v24;
  NSString *subtitleColorString;
  NSString *v26;
  NSString *actionUrlString;
  objc_super v29;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (!v12 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_10008461C();
  v29.receiver = self;
  v29.super_class = (Class)FREditorialOverrideItem;
  v17 = -[FREditorialOverrideItem init](&v29, "init");
  if (v17)
  {
    v18 = (NSString *)objc_msgSend(v12, "copy");
    identifier = v17->_identifier;
    v17->_identifier = v18;

    v20 = (NSString *)objc_msgSend(v13, "copy");
    title = v17->_title;
    v17->_title = v20;

    v22 = (NSString *)objc_msgSend(v14, "copy");
    subtitle = v17->_subtitle;
    v17->_subtitle = v22;

    v24 = (NSString *)objc_msgSend(v15, "copy");
    subtitleColorString = v17->_subtitleColorString;
    v17->_subtitleColorString = v24;

    v26 = (NSString *)objc_msgSend(v16, "copy");
    actionUrlString = v17->_actionUrlString;
    v17->_actionUrlString = v26;

  }
  return v17;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)actionUrlString
{
  return self->_actionUrlString;
}

- (NSString)subtitleColorString
{
  return self->_subtitleColorString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleColorString, 0);
  objc_storeStrong((id *)&self->_actionUrlString, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
