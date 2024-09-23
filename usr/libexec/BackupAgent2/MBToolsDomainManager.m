@implementation MBToolsDomainManager

- (MBToolsDomainManager)initWithTools:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  MBToolsDomainManager *v9;
  MBToolsDomainManager *v10;
  objc_super v12;

  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MBPersona personalPersonaWithError:](MBPersona, "personalPersonaWithError:", a4));
  if (v8)
  {
    v12.receiver = self;
    v12.super_class = (Class)MBToolsDomainManager;
    v9 = -[MBToolsDomainManager initWithPersona:](&v12, "initWithPersona:", v8);
    v10 = v9;
    if (v9)
      objc_storeStrong((id *)&v9->_tools, a3);
  }
  else
  {

    v10 = 0;
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tools, 0);
}

@end
