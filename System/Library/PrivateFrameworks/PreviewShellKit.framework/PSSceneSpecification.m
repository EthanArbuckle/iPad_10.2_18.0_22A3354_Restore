@implementation PSSceneSpecification

- (PSSceneSpecification)initWithSpecification:(id)a3
{
  id v5;
  PSSceneSpecification *v6;
  PSSceneSpecification *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PSSceneSpecification;
  v6 = -[PSSceneSpecification init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_specification, a3);

  return v7;
}

+ (PSSceneSpecification)previewSceneSpecification
{
  id v3;
  void *v4;

  v3 = objc_alloc_init(MEMORY[0x24BE785D0]);
  v4 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithSpecification:", v3);

  return (PSSceneSpecification *)v4;
}

+ (PSSceneSpecification)mainSceneSpecification
{
  id v3;
  void *v4;

  v3 = objc_alloc_init(MEMORY[0x24BE785C8]);
  v4 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithSpecification:", v3);

  return (PSSceneSpecification *)v4;
}

- (UVAgentSceneSpecification)specification
{
  return self->_specification;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specification, 0);
}

@end
