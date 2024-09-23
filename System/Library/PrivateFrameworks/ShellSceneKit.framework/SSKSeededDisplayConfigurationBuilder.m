@implementation SSKSeededDisplayConfigurationBuilder

- (SSKSeededDisplayConfigurationBuilder)initWithSeed:(unint64_t)a3 builder:(id)a4
{
  id v8;
  SSKSeededDisplayConfigurationBuilder *v9;
  SSKSeededDisplayConfigurationBuilder *v10;
  void *v12;
  objc_super v13;

  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SSKSeededDisplayConfigurationBuilder.m"), 18, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("builder"));

  }
  v13.receiver = self;
  v13.super_class = (Class)SSKSeededDisplayConfigurationBuilder;
  v9 = -[SSKSeededDisplayConfigurationBuilder init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_seed = a3;
    objc_storeStrong((id *)&v9->_builder, a4);
  }

  return v10;
}

- (id)buildConfigurationWithError:(id *)a3
{
  return (id)-[SSKDisplayConfigurationBuilding buildConfigurationWithError:](self->_builder, "buildConfigurationWithError:", a3);
}

- (void)setCloningSupported:(BOOL)a3
{
  -[SSKDisplayConfigurationBuilding setCloningSupported:](self->_builder, "setCloningSupported:", a3);
}

- (void)setCurrentMode:(id)a3 preferredMode:(id)a4 otherModes:(id)a5
{
  -[SSKDisplayConfigurationBuilding setCurrentMode:preferredMode:otherModes:](self->_builder, "setCurrentMode:preferredMode:otherModes:", a3, a4, a5);
}

- (void)setExpectsSecureRendering
{
  -[SSKDisplayConfigurationBuilding setExpectsSecureRendering](self->_builder, "setExpectsSecureRendering");
}

- (void)setOverscanned:(BOOL)a3 compensation:(int64_t)a4 safeRatio:(CGSize)a5
{
  -[SSKDisplayConfigurationBuilding setOverscanned:compensation:safeRatio:](self->_builder, "setOverscanned:compensation:safeRatio:", a3, a4, a5.width, a5.height);
}

- (void)setPixelSize:(CGSize)a3 nativeBounds:(CGRect)a4 bounds:(CGRect)a5
{
  -[SSKDisplayConfigurationBuilding setPixelSize:nativeBounds:bounds:](self->_builder, "setPixelSize:nativeBounds:bounds:", a3.width, a3.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

- (void)setUIKitMainLike
{
  -[SSKDisplayConfigurationBuilding setUIKitMainLike](self->_builder, "setUIKitMainLike");
}

- (void)setUniqueIdentifier:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_%lu"), a3, self->_seed);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SSKDisplayConfigurationBuilding setUniqueIdentifier:](self->_builder, "setUniqueIdentifier:", v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_builder, 0);
}

@end
