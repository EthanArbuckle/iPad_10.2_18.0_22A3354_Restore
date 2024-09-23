@implementation _UIImageAssetLocalRegistration

+ (id)registrationWithImage:(id)a3 configuration:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  char v12;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setImage:", v5);
  if (dyld_program_sdk_at_least())
  {
    objc_msgSend(v5, "configuration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v6;
    v10 = v8;
    if (v10 == v9)
    {

    }
    else
    {
      v11 = v10;
      if (v9 && v10)
      {
        v12 = objc_msgSend(v9, "isEqual:", v10);

        if ((v12 & 1) != 0)
          goto LABEL_10;
      }
      else
      {

      }
      objc_msgSend(v7, "setConfiguration:", v9);
    }
  }
LABEL_10:

  return v7;
}

- (BOOL)matchesConfiguration:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  char v8;
  char v9;
  id v10;
  void *v11;
  id v12;

  v4 = a3;
  -[_UIImageAssetLocalRegistration configuration](self, "configuration");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  v7 = v6;
  if (v5 == v6)
  {
    v9 = 1;
    v10 = v6;
    v11 = v6;
LABEL_14:

    goto LABEL_15;
  }
  if (!v6 || !v5)
  {

    goto LABEL_8;
  }
  v8 = objc_msgSend(v5, "isEqual:", v6);

  if ((v8 & 1) == 0)
  {
LABEL_8:
    -[_UIImageAssetLocalRegistration image](self, "image");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "configuration");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v12 = v7;
    if (v10 == v12)
    {
      v9 = 1;
    }
    else
    {
      v9 = 0;
      if (v7 && v10)
        v9 = objc_msgSend(v10, "isEqual:", v12);
    }

    goto LABEL_14;
  }
  v9 = 1;
LABEL_15:

  return v9;
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (UIImageConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end
