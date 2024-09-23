@implementation MTLibraryConfiguration

- (void)setSupportsPlayback:(BOOL)a3
{
  self->_supportsPlayback = a3;
}

- (void)setSupportsLocalMedia:(BOOL)a3
{
  self->_supportsLocalMedia = a3;
}

- (id)initSupportsPlayback:(BOOL)a3 supportsLocalMedia:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  MTLibraryConfiguration *v6;
  MTLibraryConfiguration *v7;
  objc_super v9;

  v4 = a4;
  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MTLibraryConfiguration;
  v6 = -[MTLibraryConfiguration init](&v9, "init");
  v7 = v6;
  if (v6)
  {
    -[MTLibraryConfiguration setSupportsPlayback:](v6, "setSupportsPlayback:", v5);
    -[MTLibraryConfiguration setSupportsLocalMedia:](v7, "setSupportsLocalMedia:", v4);
  }
  return v7;
}

+ (id)defaultConfiguration
{
  return objc_msgSend(objc_alloc((Class)a1), "initSupportsPlayback:supportsLocalMedia:", 1, 1);
}

- (BOOL)supportsPlayback
{
  return self->_supportsPlayback;
}

- (BOOL)supportsLocalMedia
{
  return self->_supportsLocalMedia;
}

@end
