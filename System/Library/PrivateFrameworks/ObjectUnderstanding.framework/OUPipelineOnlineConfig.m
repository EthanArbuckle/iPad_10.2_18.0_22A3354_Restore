@implementation OUPipelineOnlineConfig

- (OUPipelineOnlineConfig)init
{
  OUPipelineOnlineConfig *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OUPipelineOnlineConfig;
  result = -[OUPipelineOnlineConfig init](&v3, sel_init);
  if (result)
    *(_WORD *)&result->_enableRgbRefinement = 257;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((_BYTE *)result + 8) = self->_enableRgbRefinement;
  *((_BYTE *)result + 9) = self->_enable3DOROnline;
  return result;
}

- (BOOL)enableRgbRefinement
{
  return self->_enableRgbRefinement;
}

- (void)setEnableRgbRefinement:(BOOL)a3
{
  self->_enableRgbRefinement = a3;
}

- (BOOL)enable3DOROnline
{
  return self->_enable3DOROnline;
}

- (void)setEnable3DOROnline:(BOOL)a3
{
  self->_enable3DOROnline = a3;
}

@end
