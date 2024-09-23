@implementation PXStoryStyleConfigurationList

- (PXStoryStyleConfigurationList)init
{
  return -[PXStoryStyleConfigurationList initWithAutoEditStyleConfigurations:initialStyleConfiguration:](self, "initWithAutoEditStyleConfigurations:initialStyleConfiguration:", MEMORY[0x1E0C9AA60], 0);
}

- (PXStoryStyleConfigurationList)initWithAutoEditStyleConfigurations:(id)a3 initialStyleConfiguration:(id)a4
{
  id v6;
  id v7;
  PXStoryStyleConfigurationList *v8;
  uint64_t v9;
  NSArray *autoEditStyleConfigurations;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PXStoryStyleConfigurationList;
  v8 = -[PXStoryStyleConfigurationList init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    autoEditStyleConfigurations = v8->_autoEditStyleConfigurations;
    v8->_autoEditStyleConfigurations = (NSArray *)v9;

    objc_storeStrong((id *)&v8->_initialStyleConfiguration, a4);
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  PXStoryStyleConfigurationList *v4;
  PXStoryStyleConfigurationList *v5;
  id v6;
  id v7;
  int v8;
  char v9;
  void *v10;
  void *v11;

  v4 = (PXStoryStyleConfigurationList *)a3;
  if (v4 == self)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[PXStoryStyleConfigurationList autoEditStyleConfigurations](self, "autoEditStyleConfigurations");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      -[PXStoryStyleConfigurationList autoEditStyleConfigurations](v5, "autoEditStyleConfigurations");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      if (v6 == v7)
      {

      }
      else
      {
        v8 = objc_msgSend(v6, "isEqual:", v7);

        if (!v8)
        {
          v9 = 0;
LABEL_13:

          goto LABEL_14;
        }
      }
      -[PXStoryStyleConfigurationList initialStyleConfiguration](self, "initialStyleConfiguration");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXStoryStyleConfigurationList initialStyleConfiguration](v5, "initialStyleConfiguration");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10 == v11)
        v9 = 1;
      else
        v9 = objc_msgSend(v10, "isEqual:", v11);

      goto LABEL_13;
    }
    v9 = 0;
  }
LABEL_14:

  return v9;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[PXStoryStyleConfigurationList autoEditStyleConfigurations](self, "autoEditStyleConfigurations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  -[PXStoryStyleConfigurationList initialStyleConfiguration](self, "initialStyleConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (NSArray)autoEditStyleConfigurations
{
  return self->_autoEditStyleConfigurations;
}

- (PXStoryStyleConfiguration)initialStyleConfiguration
{
  return self->_initialStyleConfiguration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialStyleConfiguration, 0);
  objc_storeStrong((id *)&self->_autoEditStyleConfigurations, 0);
}

@end
