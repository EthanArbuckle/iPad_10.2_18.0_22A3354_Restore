@implementation IMConfigurationAdder

- (IMConfigurationAdder)initWithConfiguration:(id)a3 predicate:(id)a4
{
  id v6;
  id v7;
  IMConfigurationAdder *v8;
  IMConfigurationAdder *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)IMConfigurationAdder;
  v8 = -[IMConfigurationAdder init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_configuration, v6);
    objc_storeStrong((id *)&v9->_predicate, a4);
  }

  return v9;
}

- (void)addObject:(id)a3 forKey:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  if (self->_addProhibited)
    +[NSException raise:format:](NSException, "raise:format:", CFSTR("IMConfigurationWrongAdderCalledError"), CFSTR("For a given adder block, only the adder passed into that block can be used"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[IMConfigurationAdder configuration](self, "configuration"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IMConfigurationAdder predicate](self, "predicate"));
  objc_msgSend(v7, "addValue:predicate:forKey:", v9, v8, v6);

}

- (void)addFloat:(double)a3 forKey:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a3));
  -[IMConfigurationAdder addObject:forKey:](self, "addObject:forKey:", v7, v6);

}

- (void)addBool:(BOOL)a3 forKey:(id)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a3;
  v6 = a4;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v4));
  -[IMConfigurationAdder addObject:forKey:](self, "addObject:forKey:", v7, v6);

}

- (void)addInteger:(int64_t)a3 forKey:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
  -[IMConfigurationAdder addObject:forKey:](self, "addObject:forKey:", v7, v6);

}

- (void)addPoint:(CGPoint)a3 forKey:(id)a4
{
  double y;
  double x;
  id v7;
  id v8;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v8 = (id)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", x, y));
  -[IMConfigurationAdder addObject:forKey:](self, "addObject:forKey:", v8, v7);

}

- (void)addSize:(CGSize)a3 forKey:(id)a4
{
  double height;
  double width;
  id v7;
  id v8;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  v8 = (id)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:", width, height));
  -[IMConfigurationAdder addObject:forKey:](self, "addObject:forKey:", v8, v7);

}

- (void)addRect:(CGRect)a3 forKey:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  id v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v10 = (id)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", x, y, width, height));
  -[IMConfigurationAdder addObject:forKey:](self, "addObject:forKey:", v10, v9);

}

- (void)addEdgeInsets:(UIEdgeInsets)a3 forKey:(id)a4
{
  double right;
  double bottom;
  double left;
  double top;
  id v9;
  id v10;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  v9 = a4;
  v10 = (id)objc_claimAutoreleasedReturnValue(+[NSValue valueWithUIEdgeInsets:](NSValue, "valueWithUIEdgeInsets:", top, left, bottom, right));
  -[IMConfigurationAdder addObject:forKey:](self, "addObject:forKey:", v10, v9);

}

- (void)addWithPredicate:(id)a3 adder:(id)a4
{
  id v6;
  void (**v7)(id, id);
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[2];

  v6 = a3;
  v7 = (void (**)(id, id))a4;
  if (self->_addProhibited)
    +[NSException raise:format:](NSException, "raise:format:", CFSTR("IMConfigurationWrongAdderCalledError"), CFSTR("For a given adder block, only the adder passed into that block can be used"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IMConfigurationAdder predicate](self, "predicate"));
  v14[0] = v8;
  v14[1] = v6;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v14, 2));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[IMCompoundConfigurationPredicate andPredicateWithSubpredicates:](IMCompoundConfigurationPredicate, "andPredicateWithSubpredicates:", v9));

  v11 = objc_alloc((Class)objc_opt_class(self));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[IMConfigurationAdder configuration](self, "configuration"));
  v13 = objc_msgSend(v11, "initWithConfiguration:predicate:", v12, v10);

  -[IMConfigurationAdder setAddProhibited:](self, "setAddProhibited:", 1);
  objc_msgSend(v13, "setAddProhibited:", 0);
  v7[2](v7, v13);
  objc_msgSend(v13, "setAddProhibited:", 1);
  -[IMConfigurationAdder setAddProhibited:](self, "setAddProhibited:", 0);

}

- (IMConfiguration)configuration
{
  return (IMConfiguration *)objc_loadWeakRetained((id *)&self->_configuration);
}

- (void)setConfiguration:(id)a3
{
  objc_storeWeak((id *)&self->_configuration, a3);
}

- (IMConfigurationPredicate)predicate
{
  return self->_predicate;
}

- (void)setPredicate:(id)a3
{
  objc_storeStrong((id *)&self->_predicate, a3);
}

- (BOOL)addProhibited
{
  return self->_addProhibited;
}

- (void)setAddProhibited:(BOOL)a3
{
  self->_addProhibited = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_destroyWeak((id *)&self->_configuration);
}

@end
