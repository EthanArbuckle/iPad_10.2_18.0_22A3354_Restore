@implementation SpaceBarFollowingPunctuationFailure

- (SpaceBarFollowingPunctuationFailure)init
{
  SpaceBarFollowingPunctuationFailure *v2;
  uint64_t v3;
  NSCharacterSet *letters;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SpaceBarFollowingPunctuationFailure;
  v2 = -[SpaceBarFollowingPunctuationFailure init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD14A8], "letterCharacterSet");
    v3 = objc_claimAutoreleasedReturnValue();
    letters = v2->_letters;
    v2->_letters = (NSCharacterSet *)v3;

  }
  return v2;
}

- (BOOL)doesMatchResult:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL4 v9;

  v4 = a3;
  objc_msgSend(v4, "corrected");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsJoinedByString:", &stru_24FD49B78);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "intended");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "componentsJoinedByString:", &stru_24FD49B78);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v6, "isEqualToString:", v8) & 1) != 0 || (objc_msgSend(v6, "hasSuffix:", CFSTR(" ")) & 1) != 0)
    LOBYTE(v9) = 0;
  else
    v9 = !-[NSCharacterSet characterIsMember:](self->_letters, "characterIsMember:", objc_msgSend(v8, "characterAtIndex:", objc_msgSend(v8, "length") - 2));

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_letters, 0);
}

@end
