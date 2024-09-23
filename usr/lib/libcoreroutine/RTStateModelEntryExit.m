@implementation RTStateModelEntryExit

- (RTStateModelEntryExit)init
{
  RTStateModelEntryExit *v2;
  RTStateModelEntryExit *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RTStateModelEntryExit;
  v2 = -[RTStateModelEntryExit init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[RTStateModelEntryExit setEntry_s:](v2, "setEntry_s:", -1.0);
    -[RTStateModelEntryExit setExit_s:](v3, "setExit_s:", -1.0);
  }
  return v3;
}

- (RTStateModelEntryExit)initWithEntry:(double)a3 exit:(double)a4
{
  RTStateModelEntryExit *v6;
  RTStateModelEntryExit *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)RTStateModelEntryExit;
  v6 = -[RTStateModelEntryExit init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    -[RTStateModelEntryExit setEntry_s:](v6, "setEntry_s:", a3);
    -[RTStateModelEntryExit setExit_s:](v7, "setExit_s:", a4);
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  -[RTStateModelEntryExit entry_s](self, "entry_s");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("entry_s"));
  -[RTStateModelEntryExit exit_s](self, "exit_s");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("exit_s"));

}

- (RTStateModelEntryExit)initWithCoder:(id)a3
{
  id v4;
  RTStateModelEntryExit *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)RTStateModelEntryExit;
  v5 = -[RTStateModelEntryExit init](&v7, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("entry_s"));
    -[RTStateModelEntryExit setEntry_s:](v5, "setEntry_s:");
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("exit_s"));
    -[RTStateModelEntryExit setExit_s:](v5, "setExit_s:");
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  RTStateModelEntryExit *v4;
  RTStateModelEntryExit *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  BOOL v12;

  v4 = (RTStateModelEntryExit *)a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if (v4 == self)
    {
      v12 = 1;
    }
    else
    {
      v5 = v4;
      -[RTStateModelEntryExit entry_s](self, "entry_s");
      v7 = v6;
      -[RTStateModelEntryExit entry_s](v5, "entry_s");
      if (v7 == v8)
      {
        -[RTStateModelEntryExit exit_s](self, "exit_s");
        v10 = v9;
        -[RTStateModelEntryExit exit_s](v5, "exit_s");
        v12 = v10 == v11;
      }
      else
      {
        v12 = 0;
      }

    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)description
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[RTStateModelEntryExit entry_s](self, "entry_s");
  v5 = v4;
  if (v4 == -1.0)
  {
    v7 = 0;
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C99D68];
    -[RTStateModelEntryExit entry_s](self, "entry_s");
    objc_msgSend(v6, "stringFromTimestamp:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[RTStateModelEntryExit exit_s](self, "exit_s");
  if (v8 == -1.0)
  {
    objc_msgSend(v3, "stringWithFormat:", CFSTR("entry, %@, exit, %@"), v7, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = (void *)MEMORY[0x1E0C99D68];
    -[RTStateModelEntryExit exit_s](self, "exit_s");
    objc_msgSend(v9, "stringFromTimestamp:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("entry, %@, exit, %@"), v7, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (v5 != -1.0)

  return v11;
}

- (double)entry_s
{
  return self->_entry_s;
}

- (void)setEntry_s:(double)a3
{
  self->_entry_s = a3;
}

- (double)exit_s
{
  return self->_exit_s;
}

- (void)setExit_s:(double)a3
{
  self->_exit_s = a3;
}

@end
