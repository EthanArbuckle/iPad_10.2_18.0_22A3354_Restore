@implementation TISKSpecialKeyEvent

- (id)init:(id)a3 emojiSearchMode:(BOOL)a4 order:(int64_t)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TISKSpecialKeyEvent;
  return -[TISKInputEvent init:type:emojiSearchMode:order:](&v6, sel_init_type_emojiSearchMode_order_, a3, 6, a4, a5);
}

- (id)description
{
  void *v3;
  void *v4;
  __CFString *v5;
  void *v6;
  void *v7;

  -[TISKInputEvent input](self, "input");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("\n")) & 1) != 0)
  {
    v5 = CFSTR("NL");
  }
  else
  {
    -[TISKInputEvent input](self, "input");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "string");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("spl-%@"), v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)privateDescription
{
  return CFSTR("spl");
}

@end
