@implementation RTPredicateInspector

- (void)visitPredicate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v7;
    objc_msgSend(v4, "leftExpression");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTPredicateInspector _inspectExpression:](self, "_inspectExpression:", v5);

    objc_msgSend(v4, "rightExpression");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[RTPredicateInspector _inspectExpression:](self, "_inspectExpression:", v6);
  }

}

- (void)_inspectExpression:(id)a3
{
  NSSet *substitutionVariables;
  void *v5;
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "expressionType") == 2)
  {
    substitutionVariables = self->_substitutionVariables;
    objc_msgSend(v6, "variable");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(substitutionVariables) = -[NSSet containsObject:](substitutionVariables, "containsObject:", v5);

    if ((_DWORD)substitutionVariables)
      self->_predicateContainsSubstitutionVariables = 1;
  }

}

- (BOOL)predicate:(id)a3 referencesSubstitutionVariablesFromSet:(id)a4
{
  id v6;
  NSSet *v7;
  NSSet *substitutionVariables;

  self->_predicateContainsSubstitutionVariables = 0;
  v6 = a3;
  v7 = (NSSet *)objc_msgSend(a4, "copy");
  substitutionVariables = self->_substitutionVariables;
  self->_substitutionVariables = v7;

  objc_msgSend(v6, "acceptVisitor:flags:", self, 3);
  return self->_predicateContainsSubstitutionVariables;
}

- (BOOL)predicateContainsSubstitutionVariables
{
  return self->_predicateContainsSubstitutionVariables;
}

- (void)setPredicateContainsSubstitutionVariables:(BOOL)a3
{
  self->_predicateContainsSubstitutionVariables = a3;
}

- (NSSet)substitutionVariables
{
  return self->_substitutionVariables;
}

- (void)setSubstitutionVariables:(id)a3
{
  objc_storeStrong((id *)&self->_substitutionVariables, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_substitutionVariables, 0);
}

@end
