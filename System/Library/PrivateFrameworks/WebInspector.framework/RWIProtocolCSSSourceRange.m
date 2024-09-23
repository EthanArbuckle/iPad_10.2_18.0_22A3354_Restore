@implementation RWIProtocolCSSSourceRange

- (RWIProtocolCSSSourceRange)initWithStartLine:(int)a3 startColumn:(int)a4 endLine:(int)a5 endColumn:(int)a6
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  RWIProtocolCSSSourceRange *v10;
  RWIProtocolCSSSourceRange *v11;
  RWIProtocolCSSSourceRange *v12;
  objc_super v14;

  v6 = *(_QWORD *)&a6;
  v7 = *(_QWORD *)&a5;
  v8 = *(_QWORD *)&a4;
  v9 = *(_QWORD *)&a3;
  v14.receiver = self;
  v14.super_class = (Class)RWIProtocolCSSSourceRange;
  v10 = -[RWIProtocolJSONObject init](&v14, sel_init);
  v11 = v10;
  if (v10)
  {
    -[RWIProtocolCSSSourceRange setStartLine:](v10, "setStartLine:", v9);
    -[RWIProtocolCSSSourceRange setStartColumn:](v11, "setStartColumn:", v8);
    -[RWIProtocolCSSSourceRange setEndLine:](v11, "setEndLine:", v7);
    -[RWIProtocolCSSSourceRange setEndColumn:](v11, "setEndColumn:", v6);
    v12 = v11;
  }

  return v11;
}

- (void)setStartLine:(int)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolCSSSourceRange;
  -[RWIProtocolJSONObject setInteger:forKey:](&v3, sel_setInteger_forKey_, *(_QWORD *)&a3, CFSTR("startLine"));
}

- (int)startLine
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolCSSSourceRange;
  return -[RWIProtocolJSONObject integerForKey:](&v3, sel_integerForKey_, CFSTR("startLine"));
}

- (void)setStartColumn:(int)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolCSSSourceRange;
  -[RWIProtocolJSONObject setInteger:forKey:](&v3, sel_setInteger_forKey_, *(_QWORD *)&a3, CFSTR("startColumn"));
}

- (int)startColumn
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolCSSSourceRange;
  return -[RWIProtocolJSONObject integerForKey:](&v3, sel_integerForKey_, CFSTR("startColumn"));
}

- (void)setEndLine:(int)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolCSSSourceRange;
  -[RWIProtocolJSONObject setInteger:forKey:](&v3, sel_setInteger_forKey_, *(_QWORD *)&a3, CFSTR("endLine"));
}

- (int)endLine
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolCSSSourceRange;
  return -[RWIProtocolJSONObject integerForKey:](&v3, sel_integerForKey_, CFSTR("endLine"));
}

- (void)setEndColumn:(int)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolCSSSourceRange;
  -[RWIProtocolJSONObject setInteger:forKey:](&v3, sel_setInteger_forKey_, *(_QWORD *)&a3, CFSTR("endColumn"));
}

- (int)endColumn
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolCSSSourceRange;
  return -[RWIProtocolJSONObject integerForKey:](&v3, sel_integerForKey_, CFSTR("endColumn"));
}

@end
