@implementation SBSPortalSource

- (SBSPortalSource)initWithSourceContextID:(unsigned int)a3 sourceLayerRenderID:(unint64_t)a4
{
  SBSPortalSource *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBSPortalSource;
  result = -[SBSPortalSource init](&v7, sel_init);
  if (result)
  {
    result->_sourceContextID = a3;
    result->_sourceLayerRenderID = a4;
  }
  return result;
}

- (unint64_t)hash
{
  return self->_sourceLayerRenderID ^ self->_sourceContextID;
}

- (BOOL)isEqual:(id)a3
{
  SBSPortalSource *v4;
  BOOL v5;

  v4 = (SBSPortalSource *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && v4->_sourceContextID == self->_sourceContextID
      && v4->_sourceLayerRenderID == self->_sourceLayerRenderID;
  }

  return v5;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; <0x%x -> 0x%llx>"),
    v5,
    self,
    self->_sourceContextID,
    self->_sourceLayerRenderID);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (SBSPortalSource)initWithCoder:(id)a3
{
  id v4;
  SBSPortalSource *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SBSPortalSource;
  v5 = -[SBSPortalSource init](&v7, sel_init);
  if (v5)
  {
    v5->_sourceContextID = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("sourceContextID"));
    v5->_sourceLayerRenderID = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("sourceLayerRenderID"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t sourceContextID;
  id v5;

  sourceContextID = self->_sourceContextID;
  v5 = a3;
  objc_msgSend(v5, "encodeInt32:forKey:", sourceContextID, CFSTR("sourceContextID"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_sourceLayerRenderID, CFSTR("sourceLayerRenderID"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)sourceLayerRenderID
{
  return self->_sourceLayerRenderID;
}

- (unsigned)sourceContextID
{
  return self->_sourceContextID;
}

@end
