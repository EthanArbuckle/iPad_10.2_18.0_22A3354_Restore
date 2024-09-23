@implementation IMConfigurationPredicateValuePair

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IMConfigurationPredicateValuePair predicate](self, "predicate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "description"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IMConfigurationPredicateValuePair value](self, "value"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "description"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("{%@ -> %@}"), v4, v6));

  return v7;
}

- (IMConfigurationPredicate)predicate
{
  return self->_predicate;
}

- (void)setPredicate:(id)a3
{
  objc_storeStrong((id *)&self->_predicate, a3);
}

- (id)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_storeStrong(&self->_value, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
}

@end
