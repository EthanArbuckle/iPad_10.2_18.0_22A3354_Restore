@implementation _NSAttributedStringWithResolvedIntents

- (_NSAttributedStringWithResolvedIntents)initWithUnresolvedString:(id)a3 resolver:(Class)a4
{
  _NSAttributedStringWithResolvedIntents *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_NSAttributedStringWithResolvedIntents;
  v6 = -[_NSAttributedStringWithResolvedIntents init](&v8, sel_init);
  if (v6)
  {
    v6->_string = (NSAttributedString *)objc_msgSend(a3, "copy");
    v6->_resolver = a4;
  }
  return v6;
}

- (id)string
{
  return -[NSAttributedString string](self->_string, "string");
}

- (id)attributesAtIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4
{
  return (id)-[objc_class attributesByResolvingIntentsInAttributes:](self->_resolver, "attributesByResolvingIntentsInAttributes:", -[NSAttributedString attributesAtIndex:effectiveRange:](self->_string, "attributesAtIndex:effectiveRange:", a3, a4));
}

@end
