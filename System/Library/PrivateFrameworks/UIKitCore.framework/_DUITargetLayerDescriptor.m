@implementation _DUITargetLayerDescriptor

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_DUITargetLayerDescriptor)initWithCoder:(id)a3
{
  id v4;
  _DUITargetLayerDescriptor *v5;
  uint64_t v6;
  NSString *systemShellHostingSpaceIdentifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_DUITargetLayerDescriptor;
  v5 = -[_DUITargetLayerDescriptor init](&v9, sel_init);
  if (v5)
  {
    v5->_contextID = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("contextID"));
    v5->_renderID = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("renderID"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("systemShellHostingSpaceIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    systemShellHostingSpaceIdentifier = v5->_systemShellHostingSpaceIdentifier;
    v5->_systemShellHostingSpaceIdentifier = (NSString *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t renderID;
  id v5;

  renderID = self->_renderID;
  v5 = a3;
  objc_msgSend(v5, "encodeInt64:forKey:", renderID, CFSTR("renderID"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_contextID, CFSTR("contextID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_systemShellHostingSpaceIdentifier, CFSTR("systemShellHostingSpaceIdentifier"));

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  NSString *systemShellHostingSpaceIdentifier;
  void *v8;
  NSString *v9;
  NSString *v10;
  NSString *v11;
  char v12;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = v5;
    if (self->_contextID == *((_DWORD *)v5 + 2) && self->_renderID == *((_QWORD *)v5 + 2))
    {
      systemShellHostingSpaceIdentifier = self->_systemShellHostingSpaceIdentifier;
      v8 = (void *)*((_QWORD *)v5 + 3);
      v9 = systemShellHostingSpaceIdentifier;
      v10 = v8;
      v11 = v10;
      if (v9 == v10)
      {
        v12 = 1;
      }
      else
      {
        v12 = 0;
        if (v9 && v10)
          v12 = -[NSString isEqual:](v9, "isEqual:", v10);
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

  return v12;
}

- (unint64_t)hash
{
  unint64_t v2;

  v2 = self->_renderID ^ self->_contextID;
  return v2 ^ -[NSString hash](self->_systemShellHostingSpaceIdentifier, "hash");
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setContextID:", -[_DUITargetLayerDescriptor contextID](self, "contextID"));
  objc_msgSend(v4, "setRenderID:", -[_DUITargetLayerDescriptor renderID](self, "renderID"));
  -[_DUITargetLayerDescriptor systemShellHostingSpaceIdentifier](self, "systemShellHostingSpaceIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setSystemShellHostingSpaceIdentifier:", v6);

  return v4;
}

- (unsigned)contextID
{
  return self->_contextID;
}

- (void)setContextID:(unsigned int)a3
{
  self->_contextID = a3;
}

- (unint64_t)renderID
{
  return self->_renderID;
}

- (void)setRenderID:(unint64_t)a3
{
  self->_renderID = a3;
}

- (NSString)systemShellHostingSpaceIdentifier
{
  return self->_systemShellHostingSpaceIdentifier;
}

- (void)setSystemShellHostingSpaceIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_systemShellHostingSpaceIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemShellHostingSpaceIdentifier, 0);
}

@end
