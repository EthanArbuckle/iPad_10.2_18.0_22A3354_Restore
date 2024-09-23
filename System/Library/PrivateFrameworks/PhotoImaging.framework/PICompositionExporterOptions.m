@implementation PICompositionExporterOptions

- (PICompositionExporterOptions)init
{
  PICompositionExporterOptions *v2;
  uint64_t v3;
  NUPriority *priority;
  uint64_t v5;
  NUColorSpace *colorSpace;
  uint64_t v7;
  NUScalePolicy *scalePolicy;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PICompositionExporterOptions;
  v2 = -[PICompositionExporterOptions init](&v10, sel_init);
  v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0D52230]), "initWithLevel:", 3);
  priority = v2->_priority;
  v2->_priority = (NUPriority *)v3;

  objc_msgSend(MEMORY[0x1E0D52068], "displayP3ColorSpace");
  v5 = objc_claimAutoreleasedReturnValue();
  colorSpace = v2->_colorSpace;
  v2->_colorSpace = (NUColorSpace *)v5;

  objc_msgSend(MEMORY[0x1E0D520E0], "oneToOneScalePolicy");
  v7 = objc_claimAutoreleasedReturnValue();
  scalePolicy = v2->_scalePolicy;
  v2->_scalePolicy = (NUScalePolicy *)v7;

  return v2;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p - priority: %@, color space: %@, scale policy: %@>"), objc_opt_class(), self, self->_priority, self->_colorSpace, self->_scalePolicy);
}

- (NUPriority)priority
{
  return (NUPriority *)objc_getProperty(self, a2, 8, 1);
}

- (void)setPriority:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NUColorSpace)colorSpace
{
  return (NUColorSpace *)objc_getProperty(self, a2, 16, 1);
}

- (void)setColorSpace:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSString)pairingIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPairingIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (NUScalePolicy)scalePolicy
{
  return (NUScalePolicy *)objc_getProperty(self, a2, 32, 1);
}

- (void)setScalePolicy:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scalePolicy, 0);
  objc_storeStrong((id *)&self->_pairingIdentifier, 0);
  objc_storeStrong((id *)&self->_colorSpace, 0);
  objc_storeStrong((id *)&self->_priority, 0);
}

@end
