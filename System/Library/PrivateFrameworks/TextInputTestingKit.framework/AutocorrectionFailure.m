@implementation AutocorrectionFailure

- (AutocorrectionFailure)init
{
  AutocorrectionFailure *v2;
  uint64_t v3;
  NSCharacterSet *letters;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AutocorrectionFailure;
  v2 = -[AutocorrectionFailure init](&v6, sel_init);
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
  void *v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  BOOL v13;

  v4 = a3;
  objc_msgSend(v4, "corrected");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsJoinedByString:", &stru_24FD49B78);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lowercaseString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "intended");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "componentsJoinedByString:", &stru_24FD49B78);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "lowercaseString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "length"))
  {
    v11 = 0;
    while (objc_msgSend(v7, "length") > v11)
    {
      v12 = objc_msgSend(v10, "characterAtIndex:", v11);
      if ((_DWORD)v12 != objc_msgSend(v7, "characterAtIndex:", v11)
        && -[NSCharacterSet characterIsMember:](self->_letters, "characterIsMember:", v12))
      {
        v13 = 1;
        goto LABEL_8;
      }
      if (objc_msgSend(v10, "length") <= ++v11)
        break;
    }
  }
  v13 = 0;
LABEL_8:

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_letters, 0);
}

@end
