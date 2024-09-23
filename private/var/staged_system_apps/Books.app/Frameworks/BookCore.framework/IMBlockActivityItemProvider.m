@implementation IMBlockActivityItemProvider

- (IMBlockActivityItemProvider)initWithUTI:(id)a3 resolutionBlock:(id)a4
{
  id v6;
  id v7;
  IMBlockActivityItemProvider *v8;
  id v9;
  id resolutionBlock;
  NSString *v11;
  NSString *UTI;

  v6 = a3;
  v7 = a4;
  v8 = -[IMBlockActivityItemProvider init](self, "init");
  if (v8)
  {
    v9 = objc_msgSend(v7, "copy");
    resolutionBlock = v8->_resolutionBlock;
    v8->_resolutionBlock = v9;

    v11 = (NSString *)objc_msgSend(v6, "copy");
    UTI = v8->_UTI;
    v8->_UTI = v11;

  }
  return v8;
}

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  void *v4;
  unsigned __int8 v5;
  __CFString *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  unsigned int v10;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[IMBlockActivityItemProvider UTI](self, "UTI", a3));
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("public.plain-text"));

  if ((v5 & 1) != 0)
  {
    v6 = CFSTR("kBKBlockActivityItemProviderTextPlaceholder");
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[IMBlockActivityItemProvider UTI](self, "UTI"));
    v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("public.image"));

    if (v8)
    {
      v6 = (__CFString *)objc_alloc_init((Class)UIImage);
    }
    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[IMBlockActivityItemProvider UTI](self, "UTI"));
      v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("public.url"));

      if (v10)
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", CFSTR("kBKBlockActivityItemProviderURLPlaceholder")));
      else
        v6 = 0;
    }
  }
  return v6;
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  unsigned int v8;
  uint64_t (**v9)(_QWORD, _QWORD);
  uint64_t v10;
  void *v11;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IMBlockActivityItemProvider resolutionBlock](self, "resolutionBlock"));

  if (v6
    && (v7 = (void *)objc_claimAutoreleasedReturnValue(-[IMBlockActivityItemProvider supportedActivityTypes](self, "supportedActivityTypes")),
        v8 = objc_msgSend(v7, "containsObject:", v5),
        v7,
        v8))
  {
    v9 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[IMBlockActivityItemProvider resolutionBlock](self, "resolutionBlock"));
    v10 = ((uint64_t (**)(_QWORD, id))v9)[2](v9, v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (NSString)UTI
{
  return self->_UTI;
}

- (void)setUTI:(id)a3
{
  objc_storeStrong((id *)&self->_UTI, a3);
}

- (id)resolutionBlock
{
  return self->_resolutionBlock;
}

- (void)setResolutionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)supportedActivityTypes
{
  return self->_supportedActivityTypes;
}

- (void)setSupportedActivityTypes:(id)a3
{
  objc_storeStrong((id *)&self->_supportedActivityTypes, a3);
}

- (NSString)activityType
{
  return self->_activityType;
}

- (void)setActivityType:(id)a3
{
  objc_storeStrong((id *)&self->_activityType, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityType, 0);
  objc_storeStrong((id *)&self->_supportedActivityTypes, 0);
  objc_storeStrong(&self->_resolutionBlock, 0);
  objc_storeStrong((id *)&self->_UTI, 0);
}

@end
