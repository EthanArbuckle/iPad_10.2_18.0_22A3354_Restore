@implementation _TUIElementStructStructBuilder

- (_TUIElementStructStructBuilder)initWithName:(id)a3 closure:(id)a4 basedOn:(id)a5 context:(id)a6
{
  _TUIElementStructStructBuilder *result;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_TUIElementStructStructBuilder;
  result = -[TUIStructBuilder initWithClosure:basedOn:context:](&v8, "initWithClosure:basedOn:context:", a4.var0, a5, a6);
  if (result)
    result->_name.index = a3.var0;
  return result;
}

- ($7E080378D8F67055EE0984892F39872B)name
{
  return ($7E080378D8F67055EE0984892F39872B)self->_name.index;
}

@end
