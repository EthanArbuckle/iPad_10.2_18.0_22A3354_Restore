@implementation TISKPopupVariantEvent

- (id)init:(id)a3 emojiSearchMode:(BOOL)a4 order:(int64_t)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TISKPopupVariantEvent;
  return -[TISKInputEvent init:type:emojiSearchMode:order:](&v6, sel_init_type_emojiSearchMode_order_, a3, 15, a4, a5);
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[TISKInputEvent input](self, "input");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("pu-%@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)privateDescription
{
  return CFSTR("pu");
}

@end
