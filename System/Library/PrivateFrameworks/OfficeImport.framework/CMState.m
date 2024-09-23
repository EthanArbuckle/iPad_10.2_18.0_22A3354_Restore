@implementation CMState

- (CMState)init
{
  CMState *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *components;
  NSMutableDictionary *htmlResource;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CMState;
  v2 = -[CMState init](&v7, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    components = v2->components;
    v2->components = v3;

    htmlResource = v2->htmlResource;
    v2->htmlResource = 0;

    v2->mSourceFormat = 0;
  }
  return v2;
}

- (void)setColorMap:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void)setColorScheme:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (OADColorMap)colorMap
{
  return (OADColorMap *)objc_getProperty(self, a2, 40, 1);
}

- (OADColorScheme)colorScheme
{
  return (OADColorScheme *)objc_getProperty(self, a2, 48, 1);
}

- (id)resources
{
  return objc_getProperty(self, a2, 56, 1);
}

- (void)setIsOnPhone:(BOOL)a3
{
  self->mIsOnPhone = a3;
}

- (void)setIsThumbnail:(BOOL)a3
{
  self->mIsThumbnail = a3;
}

- (void)pushTextLevel
{
  ++self->_textLevel;
}

- (void)popTextLevel
{
  --self->_textLevel;
}

- (unint64_t)sourceFormat
{
  return self->mSourceFormat;
}

- (void)setResources:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (BOOL)isThumbnail
{
  return self->mIsThumbnail;
}

- (BOOL)isOffice12
{
  return (self->mSourceFormat < 7) & (0x54u >> self->mSourceFormat);
}

- (void)copyFromCMStateWithoutComponents:(id)a3
{
  void *v4;
  NSString *v5;
  NSString *mResourceUrlPrefix;
  OADColorScheme *v7;
  OADColorScheme *mColorScheme;
  OADColorMap *v9;
  OADColorMap *mColorMap;
  id v11;

  v11 = a3;
  objc_msgSend(v11, "getHtmlResource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CMState setHtmlResource:](self, "setHtmlResource:", v4);

  objc_msgSend(v11, "resourceUrlPrefix");
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  mResourceUrlPrefix = self->mResourceUrlPrefix;
  self->mResourceUrlPrefix = v5;

  self->mSourceFormat = objc_msgSend(v11, "sourceFormat");
  objc_msgSend(v11, "colorScheme");
  v7 = (OADColorScheme *)objc_claimAutoreleasedReturnValue();
  mColorScheme = self->mColorScheme;
  self->mColorScheme = v7;

  objc_msgSend(v11, "colorMap");
  v9 = (OADColorMap *)objc_claimAutoreleasedReturnValue();
  mColorMap = self->mColorMap;
  self->mColorMap = v9;

}

- (id)getHtmlResource
{
  return self->htmlResource;
}

- (void)setHtmlResource:(id)a3
{
  objc_storeStrong((id *)&self->htmlResource, a3);
}

- (id)resourceUrlPrefix
{
  return self->mResourceUrlPrefix;
}

- (id)componentByName:(id)a3
{
  -[NSMutableDictionary objectForKey:](self->components, "objectForKey:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setComponentWithName:(id)a3 value:(id)a4
{
  -[NSMutableDictionary setObject:forKey:](self->components, "setObject:forKey:", a4, a3);
}

- (void)setResourceUrlPrefix:(id)a3
{
  objc_storeStrong((id *)&self->mResourceUrlPrefix, a3);
}

- (BOOL)isOnPhone
{
  return self->mIsOnPhone;
}

- (int64_t)textLevel
{
  return self->_textLevel;
}

- (void)setSourceFormat:(unint64_t)a3
{
  self->mSourceFormat = a3;
}

- (OCDDocument)document
{
  return (OCDDocument *)objc_getProperty(self, a2, 8, 1);
}

- (void)setDocument:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->mResources, 0);
  objc_storeStrong((id *)&self->mColorScheme, 0);
  objc_storeStrong((id *)&self->mColorMap, 0);
  objc_storeStrong((id *)&self->mResourceUrlPrefix, 0);
  objc_storeStrong((id *)&self->htmlResource, 0);
  objc_storeStrong((id *)&self->components, 0);
  objc_storeStrong((id *)&self->_document, 0);
}

@end
