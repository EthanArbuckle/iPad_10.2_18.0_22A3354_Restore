@implementation RAPReportComposerEmailSection

- (RAPReportComposerEmailSection)initWithQuestion:(id)a3
{
  id v5;
  RAPReportComposerEmailSection *v6;
  RAPReportComposerEmailSection *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RAPReportComposerEmailSection;
  v6 = -[RAPTablePartSection init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_question, a3);

  return v7;
}

- (id)headerTitle
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Contact Information [Report a Problem]"), CFSTR("localized string not found"), 0));

  return v3;
}

- (int64_t)rowsCount
{
  return 1;
}

- (id)cellForRowAtIndex:(int64_t)a3
{
  RAPTextTableViewCell *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (RAPTextTableViewCell *)objc_claimAutoreleasedReturnValue(-[RAPTablePartSection dequeueCellWithNamespacedReuseIdentifier:](self, "dequeueCellWithNamespacedReuseIdentifier:", CFSTR("EmailCell")));
  if (!v4)
    v4 = -[RAPTextTableViewCell initWithStyle:reuseIdentifier:]([RAPTextTableViewCell alloc], "initWithStyle:reuseIdentifier:", 0, CFSTR("EmailCell"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Email Address [Report a Problem]"), CFSTR("localized string not found"), 0));
  -[RAPTextTableViewCell setPlaceholder:](v4, "setPlaceholder:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RAPCommentQuestion correctableEmail](self->_question, "correctableEmail"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "value"));
  -[RAPTextTableViewCell setValue:](v4, "setValue:", v8);

  -[RAPTextTableViewCell setDelegate:](v4, "setDelegate:", self);
  return v4;
}

- (void)valueForCorrectableItemKind:(int64_t)a3 changedTo:(id)a4
{
  RAPCommentQuestion *question;
  id v5;
  id v6;

  question = self->_question;
  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[RAPCommentQuestion correctableEmail](question, "correctableEmail"));
  objc_msgSend(v6, "setValue:", v5);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_question, 0);
}

@end
