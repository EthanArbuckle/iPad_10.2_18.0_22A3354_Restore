@implementation PGGraphChange

- (unint64_t)type
{
  return 0;
}

- (unint64_t)changeCount
{
  return 1;
}

- (id)description
{
  void *v3;
  void *v4;
  unint64_t v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  objc_super v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v10.receiver = self;
  v10.super_class = (Class)PGGraphChange;
  -[PGGraphChange description](&v10, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PGGraphChange type](self, "type");
  if (v5 > 0xC)
    v6 = 0;
  else
    v6 = off_1E842F768[v5];
  v7 = v6;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ [type:%@]"), v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
