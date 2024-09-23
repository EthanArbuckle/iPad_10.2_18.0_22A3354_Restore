@implementation MTATone

- (MTATone)initWithIdentifier:(id)a3
{
  id v5;
  MTATone *v6;
  MTATone *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MTATone;
  v6 = -[MTATone init](&v9, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_identifier, a3);
    v7->_defaultTone = 0;
  }

  return v7;
}

- (NSString)name
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if (-[MTATone isDefaultTone](self, "isDefaultTone"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("DEFAULT_TONE_FORMAT"), &stru_10009A4D0, 0));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTATone toneName](self, "toneName"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v4, v5));

  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTATone toneName](self, "toneName"));
  }
  return (NSString *)v6;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)toneName
{
  return self->_toneName;
}

- (void)setToneName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)isDefaultTone
{
  return self->_defaultTone;
}

- (void)setDefaultTone:(BOOL)a3
{
  self->_defaultTone = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toneName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
