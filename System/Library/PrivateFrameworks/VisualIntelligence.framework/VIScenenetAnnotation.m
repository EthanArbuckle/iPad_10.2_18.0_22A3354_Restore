@implementation VIScenenetAnnotation

- (VIScenenetAnnotation)initWithAnnotations:(id)a3 revision:(unint64_t)a4
{
  id v6;
  VIScenenetAnnotation *v7;
  uint64_t v8;
  NSArray *annotations;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)VIScenenetAnnotation;
  v7 = -[VIScenenetAnnotation init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    annotations = v7->_annotations;
    v7->_annotations = (NSArray *)v8;

    v7->_revision = a4;
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  VIScenenetAnnotation *v4;
  VIScenenetAnnotation *v5;
  VIScenenetAnnotation *v6;
  unint64_t revision;
  NSArray *annotations;
  void *v9;
  char IsEqual;

  v4 = (VIScenenetAnnotation *)a3;
  if (v4 == self)
  {
    IsEqual = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    revision = self->_revision;
    if (revision == -[VIScenenetAnnotation revision](v6, "revision"))
    {
      annotations = self->_annotations;
      -[VIScenenetAnnotation annotations](v6, "annotations");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      IsEqual = VIObjectIsEqual((unint64_t)annotations, (uint64_t)v9);

    }
    else
    {
      IsEqual = 0;
    }

  }
  return IsEqual;
}

- (unint64_t)hash
{
  unint64_t v2;

  v2 = 2654435761u * self->_revision;
  return -[NSArray hash](self->_annotations, "hash") ^ v2;
}

- (NSArray)annotations
{
  return self->_annotations;
}

- (unint64_t)revision
{
  return self->_revision;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_annotations, 0);
}

@end
