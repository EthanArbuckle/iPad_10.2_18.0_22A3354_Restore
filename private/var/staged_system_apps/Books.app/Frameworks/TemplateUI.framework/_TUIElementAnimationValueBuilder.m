@implementation _TUIElementAnimationValueBuilder

- (void)addAnimationValue:(id)a3 forAttributeName:(id)a4
{
  id v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *values;
  id v9;
  id v10;

  v10 = a3;
  v6 = a4;
  if (!self->_values)
  {
    v7 = objc_opt_new(NSMutableDictionary);
    values = self->_values;
    self->_values = v7;

  }
  v9 = objc_msgSend(v6, "copy");

  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_values, "setObject:forKeyedSubscript:", v10, v9);
}

- (id)finalizeAnimationValues
{
  return -[NSMutableDictionary copy](self->_values, "copy");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_values, 0);
}

@end
