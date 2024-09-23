@implementation SXTextComponentBlueprint

- (void)addExclusionPath:(id)a3 forIdentifier:(id)a4
{
  id v6;
  void *v7;
  NSDictionary *v8;
  NSDictionary *exclusionPaths;
  id v10;

  v10 = a3;
  v6 = a4;
  v7 = (void *)-[NSDictionary mutableCopy](self->_exclusionPaths, "mutableCopy");
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v7, "setObject:forKey:", v10, v6);
  v8 = (NSDictionary *)objc_msgSend(v7, "copy");
  exclusionPaths = self->_exclusionPaths;
  self->_exclusionPaths = v8;

}

- (void)invalidateSize
{
  NSDictionary *exclusionPaths;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SXTextComponentBlueprint;
  -[SXComponentBlueprint invalidateSize](&v4, sel_invalidateSize);
  exclusionPaths = self->_exclusionPaths;
  self->_exclusionPaths = 0;

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SXTextComponentBlueprint;
  v4 = -[SXComponentBlueprint copyWithZone:](&v8, sel_copyWithZone_, a3);
  -[SXTextComponentBlueprint exclusionPaths](self, "exclusionPaths");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v4[48];
  v4[48] = v5;

  return v4;
}

- (NSDictionary)exclusionPaths
{
  return self->_exclusionPaths;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exclusionPaths, 0);
}

@end
