@implementation SQListFormatter

- (SQListFormatter)initWithLocale:(id)a3
{
  return -[SQListFormatter initWithLocale:style:](self, "initWithLocale:style:", a3, 0);
}

- (SQListFormatter)initWithLocale:(id)a3 style:(id)a4
{
  SQListFormatter *v4;
  SQListFormatter *v5;
  SQListFormatter *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SQListFormatter;
  v4 = -[SQListFormatter initWithLocale:](&v8, "initWithLocale:", a3, a4);
  v5 = v4;
  if (v4)
    v6 = v4;

  return v5;
}

@end
