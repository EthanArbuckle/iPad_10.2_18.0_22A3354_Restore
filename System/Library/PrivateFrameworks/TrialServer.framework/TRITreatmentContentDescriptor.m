@implementation TRITreatmentContentDescriptor

- (TRITreatmentContentDescriptor)initWithTreatmentId:(id)a3 container:(id)a4
{
  id v8;
  id v9;
  TRITreatmentContentDescriptor *v10;
  TRITreatmentContentDescriptor *v11;
  void *v13;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIServerTupleTypes.m"), 2507, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("treatmentId != nil"));

  }
  v14.receiver = self;
  v14.super_class = (Class)TRITreatmentContentDescriptor;
  v10 = -[TRITreatmentContentDescriptor init](&v14, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_treatmentId, a3);
    objc_storeStrong((id *)&v11->_container, a4);
  }

  return v11;
}

+ (id)descriptorWithTreatmentId:(id)a3 container:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithTreatmentId:container:", v7, v6);

  return v8;
}

- (id)copyWithReplacementTreatmentId:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithTreatmentId:container:", v4, self->_container);

  return v5;
}

- (id)copyWithReplacementContainer:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithTreatmentId:container:", self->_treatmentId, v4);

  return v5;
}

- (BOOL)isEqualToDescriptor:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  NSString *treatmentId;
  void *v10;
  int v11;
  int v12;
  void *v13;
  int v14;
  TRIAppContainer *container;
  void *v16;
  char v17;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_8;
  v6 = self->_treatmentId != 0;
  objc_msgSend(v4, "treatmentId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 == 0;

  if (v6 == v8)
    goto LABEL_8;
  treatmentId = self->_treatmentId;
  if (treatmentId)
  {
    objc_msgSend(v5, "treatmentId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[NSString isEqual:](treatmentId, "isEqual:", v10);

    if (!v11)
      goto LABEL_8;
  }
  v12 = self->_container != 0;
  objc_msgSend(v5, "container");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13 == 0;

  if (v12 == v14)
  {
LABEL_8:
    v17 = 0;
  }
  else
  {
    container = self->_container;
    if (container)
    {
      objc_msgSend(v5, "container");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[TRIAppContainer isEqual:](container, "isEqual:", v16);

    }
    else
    {
      v17 = 1;
    }
  }

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  TRITreatmentContentDescriptor *v4;
  TRITreatmentContentDescriptor *v5;
  BOOL v6;

  v4 = (TRITreatmentContentDescriptor *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[TRITreatmentContentDescriptor isEqualToDescriptor:](self, "isEqualToDescriptor:", v5);

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_treatmentId, "hash");
  return -[TRIAppContainer hash](self->_container, "hash") - v3 + 32 * v3;
}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<TRITreatmentContentDescriptor | treatmentId:%@ container:%@>"), self->_treatmentId, self->_container);
}

- (NSString)treatmentId
{
  return self->_treatmentId;
}

- (TRIAppContainer)container
{
  return self->_container;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_treatmentId, 0);
}

@end
