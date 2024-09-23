@implementation PSPointerPortalSourceCollection

- (PSPointerPortalSourceCollection)initWithPointerPortalSource:(id)a3 overlayEffectPortalSource:(id)a4 samplingMatchMoveSource:(id)a5
{
  id v8;
  id v9;
  id v10;
  PSPointerPortalSourceCollection *v11;
  uint64_t v12;
  PSPortalSource *pointerPortalSource;
  uint64_t v14;
  PSPortalSource *overlayEffectPortalSource;
  uint64_t v16;
  PSMatchMoveSource *samplingMatchMoveSource;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)PSPointerPortalSourceCollection;
  v11 = -[PSPointerPortalSourceCollection init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    pointerPortalSource = v11->_pointerPortalSource;
    v11->_pointerPortalSource = (PSPortalSource *)v12;

    v14 = objc_msgSend(v9, "copy");
    overlayEffectPortalSource = v11->_overlayEffectPortalSource;
    v11->_overlayEffectPortalSource = (PSPortalSource *)v14;

    v16 = objc_msgSend(v10, "copy");
    samplingMatchMoveSource = v11->_samplingMatchMoveSource;
    v11->_samplingMatchMoveSource = (PSMatchMoveSource *)v16;

  }
  return v11;
}

- (unsigned)sourceContextID
{
  return -[PSPortalSource sourceContextID](self->_pointerPortalSource, "sourceContextID");
}

- (BOOL)isEqual:(id)a3
{
  PSPointerPortalSourceCollection *v4;
  char v5;

  v4 = (PSPointerPortalSourceCollection *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && BSEqualObjects() && BSEqualObjects())
      v5 = BSEqualObjects();
    else
      v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;

  v3 = -[PSPortalSource hash](self->_pointerPortalSource, "hash");
  v4 = -[PSPortalSource hash](self->_overlayEffectPortalSource, "hash") ^ v3;
  return v4 ^ -[PSMatchMoveSource hash](self->_samplingMatchMoveSource, "hash");
}

- (id)description
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%x"), -[PSPointerPortalSourceCollection sourceContextID](self, "sourceContextID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v4, CFSTR("sourceContextID"));

  v5 = (id)objc_msgSend(v3, "appendObject:withName:", self->_pointerPortalSource, CFSTR("pointerPortalSource"));
  v6 = (id)objc_msgSend(v3, "appendObject:withName:", self->_overlayEffectPortalSource, CFSTR("overlayEffectPortalSource"));
  v7 = (id)objc_msgSend(v3, "appendObject:withName:", self->_samplingMatchMoveSource, CFSTR("samplingMatchMoveSource"));
  v8 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", self->_shouldBeInvalidatedIfPointerLeavesDisplay, CFSTR("shouldInvalidateIfPointerLeavesDisplay"), 1);
  objc_msgSend(v3, "build");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (PSPointerPortalSourceCollection)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  PSPointerPortalSourceCollection *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pointerPortalSource"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("overlayEffectPortalSource"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("samplingMatchMoveSource"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v8 = v6 == 0;
  else
    v8 = 1;
  if (v8 || v7 == 0)
  {
    v10 = 0;
  }
  else
  {
    self = -[PSPointerPortalSourceCollection initWithPointerPortalSource:overlayEffectPortalSource:samplingMatchMoveSource:](self, "initWithPointerPortalSource:overlayEffectPortalSource:samplingMatchMoveSource:", v5, v6, v7);
    v10 = self;
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  PSPortalSource *overlayEffectPortalSource;
  id v5;

  overlayEffectPortalSource = self->_overlayEffectPortalSource;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", overlayEffectPortalSource, CFSTR("overlayEffectPortalSource"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_pointerPortalSource, CFSTR("pointerPortalSource"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_samplingMatchMoveSource, CFSTR("samplingMatchMoveSource"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PSPortalSource)overlayEffectPortalSource
{
  return self->_overlayEffectPortalSource;
}

- (PSPortalSource)pointerPortalSource
{
  return self->_pointerPortalSource;
}

- (PSMatchMoveSource)samplingMatchMoveSource
{
  return self->_samplingMatchMoveSource;
}

- (BOOL)shouldBeInvalidatedIfPointerLeavesDisplay
{
  return self->_shouldBeInvalidatedIfPointerLeavesDisplay;
}

- (void)setShouldBeInvalidatedIfPointerLeavesDisplay:(BOOL)a3
{
  self->_shouldBeInvalidatedIfPointerLeavesDisplay = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_samplingMatchMoveSource, 0);
  objc_storeStrong((id *)&self->_pointerPortalSource, 0);
  objc_storeStrong((id *)&self->_overlayEffectPortalSource, 0);
}

@end
