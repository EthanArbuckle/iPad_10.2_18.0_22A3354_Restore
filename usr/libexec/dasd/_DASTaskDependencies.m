@implementation _DASTaskDependencies

- (_DASTaskDependencies)initWithProducedResultIdentifiers:(id)a3 dependencyIdentifiers:(id)a4
{
  id v7;
  id v8;
  _DASTaskDependencies *v9;
  _DASTaskDependencies *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_DASTaskDependencies;
  v9 = -[_DASTaskDependencies init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_producedResultIdentifiers, a3);
    objc_storeStrong((id *)&v10->_dependencyIdentifiers, a4);
  }

  return v10;
}

- (NSSet)producedResultIdentifiers
{
  return self->_producedResultIdentifiers;
}

- (void)setProducedResultIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_producedResultIdentifiers, a3);
}

- (NSSet)dependencyIdentifiers
{
  return self->_dependencyIdentifiers;
}

- (void)setDependencyIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_dependencyIdentifiers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dependencyIdentifiers, 0);
  objc_storeStrong((id *)&self->_producedResultIdentifiers, 0);
}

@end
