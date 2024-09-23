@implementation OAVStyle

- (OAVStyle)init
{
  OAVStyle *v2;
  uint64_t v3;
  NSMutableString *string;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)OAVStyle;
  v2 = -[OAVStyle init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    string = v2->_string;
    v2->_string = (NSMutableString *)v3;

  }
  return v2;
}

- (void)addPropertyWithName:(id)a3 value:(id)a4
{
  -[NSMutableString appendFormat:](self->_string, "appendFormat:", CFSTR("%@:%@;"), a3, a4);
}

- (id)styleAttributeValue
{
  return self->_string;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_string, 0);
}

@end
