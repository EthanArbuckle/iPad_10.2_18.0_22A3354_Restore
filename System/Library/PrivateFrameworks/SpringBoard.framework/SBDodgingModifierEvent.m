@implementation SBDodgingModifierEvent

- (id)description
{
  void *v3;
  unint64_t v4;
  const __CFString *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBDodgingModifierEvent;
  -[SBChainableModifierEvent description](&v8, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SBDodgingModifierEvent type](self, "type");
  if (v4 - 1 > 4)
    v5 = CFSTR("Insertion");
  else
    v5 = off_1E8EA6F88[v4 - 1];
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" %@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)type
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

@end
