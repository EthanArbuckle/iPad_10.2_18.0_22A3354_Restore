@implementation ICMusicUserStateCookies

- (ICMusicUserStateCookies)initWithBlock:(id)a3
{
  void (**v4)(id, ICMusicUserStateCookies *);
  ICMusicUserStateCookies *v5;
  objc_super v7;

  v4 = (void (**)(id, ICMusicUserStateCookies *))a3;
  v7.receiver = self;
  v7.super_class = (Class)ICMusicUserStateCookies;
  v5 = -[ICMusicUserStateCookies init](&v7, sel_init);
  if (v5)
  {
    v4[2](v4, v5);
    v5->_frozen = 1;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *xpab;
  id v5;

  xpab = self->_xpab;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", xpab, CFSTR("xpab"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_itfe, CFSTR("itfe"));

}

- (ICMusicUserStateCookies)initWithCoder:(id)a3
{
  id v4;
  ICMusicUserStateCookies *v5;
  uint64_t v6;
  NSString *xpab;
  uint64_t v8;
  NSString *itfe;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ICMusicUserStateCookies;
  v5 = -[ICMusicUserStateCookies init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("xpab"));
    v6 = objc_claimAutoreleasedReturnValue();
    xpab = v5->_xpab;
    v5->_xpab = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("itfe"));
    v8 = objc_claimAutoreleasedReturnValue();
    itfe = v5->_itfe;
    v5->_itfe = (NSString *)v8;

  }
  return v5;
}

- (void)setItfe:(id)a3
{
  id v5;
  NSString *v6;
  NSString *itfe;
  void *v8;
  id v9;

  v5 = a3;
  v9 = v5;
  if (self->_frozen)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ICMusicUserStateCookies.m"), 62, CFSTR("Attempt to mutate after being initialized."));

    v5 = v9;
  }
  v6 = (NSString *)objc_msgSend(v5, "copy");
  itfe = self->_itfe;
  self->_itfe = v6;

}

- (void)setXpab:(id)a3
{
  id v5;
  NSString *v6;
  NSString *xpab;
  void *v8;
  id v9;

  v5 = a3;
  v9 = v5;
  if (self->_frozen)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ICMusicUserStateCookies.m"), 67, CFSTR("Attempt to mutate after being initialized."));

    v5 = v9;
  }
  v6 = (NSString *)objc_msgSend(v5, "copy");
  xpab = self->_xpab;
  self->_xpab = v6;

}

- (NSString)xpab
{
  return self->_xpab;
}

- (NSString)itfe
{
  return self->_itfe;
}

- (BOOL)isFrozen
{
  return self->_frozen;
}

- (void)setFrozen:(BOOL)a3
{
  self->_frozen = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itfe, 0);
  objc_storeStrong((id *)&self->_xpab, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
