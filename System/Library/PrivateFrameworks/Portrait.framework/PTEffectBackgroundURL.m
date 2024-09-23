@implementation PTEffectBackgroundURL

- (PTEffectBackgroundURL)initWithFullsize:(id)a3 thumbnail:(id)a4 inputBufferChecksum:(id)a5
{
  id v9;
  id v10;
  id v11;
  PTEffectBackgroundURL *v12;
  PTEffectBackgroundURL *v13;
  PTEffectBackgroundURL *v14;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)PTEffectBackgroundURL;
  v12 = -[PTEffectBackgroundURL init](&v16, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_fullsizeURL, a3);
    objc_storeStrong((id *)&v13->_thumbnailURL, a4);
    objc_storeStrong((id *)&v13->_inputBufferChecksum, a5);
    v14 = v13;
  }

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  PTEffectBackgroundURL *v4;
  PTEffectBackgroundURL *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;

  v4 = (PTEffectBackgroundURL *)a3;
  if (v4 == self)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[PTEffectBackgroundURL fullsizeURL](v5, "fullsizeURL");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PTEffectBackgroundURL fullsizeURL](self, "fullsizeURL");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isEqual:", v7))
      {
        -[PTEffectBackgroundURL thumbnailURL](v5, "thumbnailURL");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[PTEffectBackgroundURL thumbnailURL](self, "thumbnailURL");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "isEqual:", v9))
        {
          -[PTEffectBackgroundURL inputBufferChecksum](v5, "inputBufferChecksum");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[PTEffectBackgroundURL inputBufferChecksum](self, "inputBufferChecksum");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v10, "isEqual:", v11);

        }
        else
        {
          v12 = 0;
        }

      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;

  v3 = -[NSURL hash](self->_fullsizeURL, "hash");
  v4 = -[NSURL hash](self->_thumbnailURL, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_inputBufferChecksum, "hash");
}

- (id)URLs
{
  NSURL *thumbnailURL;
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  thumbnailURL = self->_thumbnailURL;
  v4[0] = self->_fullsizeURL;
  v4[1] = thumbnailURL;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSURL)fullsizeURL
{
  return (NSURL *)objc_getProperty(self, a2, 8, 1);
}

- (NSURL)thumbnailURL
{
  return (NSURL *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)inputBufferChecksum
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputBufferChecksum, 0);
  objc_storeStrong((id *)&self->_thumbnailURL, 0);
  objc_storeStrong((id *)&self->_fullsizeURL, 0);
}

@end
