@implementation OZARPlaneInfo

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OZARPlaneInfo;
  -[OZARPlaneInfo dealloc](&v3, sel_dealloc);
}

- (OZARPlaneInfo)initWithARPlaneAnchor:(id)a3
{
  OZARPlaneInfo *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = -[OZARPlaneInfo init](self, "init");
  if (v4)
  {
    -[OZARPlaneInfo setAlignment:](v4, "setAlignment:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a3, "alignment")));
    -[OZARPlaneInfo setClassification:](v4, "setClassification:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a3, "classification")));
    v5 = (void *)MEMORY[0x1E0CB3B18];
    objc_msgSend(a3, "extent");
    -[OZARPlaneInfo setExtent:](v4, "setExtent:", objc_msgSend(v5, "PCValueWithSIMDFloat3:"));
    v6 = (void *)MEMORY[0x1E0CB3B18];
    objc_msgSend(a3, "center");
    -[OZARPlaneInfo setCenter:](v4, "setCenter:", objc_msgSend(v6, "PCValueWithSIMDFloat3:"));
    v7 = (void *)MEMORY[0x1E0CB3B18];
    objc_msgSend(a3, "transform");
    -[OZARPlaneInfo setTransform:](v4, "setTransform:", objc_msgSend(v7, "PCValueWithSIMDFloat4x4:"));
    -[OZARPlaneInfo setIdentifier:](v4, "setIdentifier:", objc_msgSend(a3, "identifier"));
  }
  return v4;
}

+ (id)planeListWithARFrame:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  OZARPlaneInfo *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = (void *)objc_msgSend(a3, "anchors", 0);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v11 = -[OZARPlaneInfo initWithARPlaneAnchor:]([OZARPlaneInfo alloc], "initWithARPlaneAnchor:", v10);
          objc_msgSend(v4, "addObject:", v11);

        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }
  return v4;
}

+ (id)planeListWithAnchors:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  OZARPlaneInfo *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(a3);
        v9 = -[OZARPlaneInfo initWithARPlaneAnchor:]([OZARPlaneInfo alloc], "initWithARPlaneAnchor:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8));
        objc_msgSend(v4, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }
  return v4;
}

- (uint64_t)simdTransform
{
  return objc_msgSend((id)objc_msgSend(a1, "transform"), "PCSIMDFloat4x4Value");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (OZARPlaneInfo)initWithCoder:(id)a3
{
  OZARPlaneInfo *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)OZARPlaneInfo;
  v4 = -[OZARPlaneInfo init](&v6, sel_init);
  if (v4)
  {
    -[OZARPlaneInfo setAlignment:](v4, "setAlignment:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("alignment")));
    -[OZARPlaneInfo setClassification:](v4, "setClassification:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("classification")));
    -[OZARPlaneInfo setExtent:](v4, "setExtent:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("extent")));
    -[OZARPlaneInfo setCenter:](v4, "setCenter:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("center")));
    -[OZARPlaneInfo setTransform:](v4, "setTransform:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("transform")));
    -[OZARPlaneInfo setIdentifier:](v4, "setIdentifier:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier")));
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", -[OZARPlaneInfo alignment](self, "alignment"), CFSTR("alignment"));
  objc_msgSend(a3, "encodeObject:forKey:", -[OZARPlaneInfo classification](self, "classification"), CFSTR("classification"));
  objc_msgSend(a3, "encodeObject:forKey:", -[OZARPlaneInfo extent](self, "extent"), CFSTR("extent"));
  objc_msgSend(a3, "encodeObject:forKey:", -[OZARPlaneInfo center](self, "center"), CFSTR("center"));
  objc_msgSend(a3, "encodeObject:forKey:", -[OZARPlaneInfo transform](self, "transform"), CFSTR("transform"));
  objc_msgSend(a3, "encodeObject:forKey:", -[OZARPlaneInfo identifier](self, "identifier"), CFSTR("identifier"));
}

- (NSNumber)alignment
{
  return self->_alignment;
}

- (void)setAlignment:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (NSNumber)classification
{
  return self->_classification;
}

- (void)setClassification:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (NSValue)extent
{
  return self->_extent;
}

- (void)setExtent:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (NSValue)center
{
  return self->_center;
}

- (void)setCenter:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (NSValue)transform
{
  return self->_transform;
}

- (void)setTransform:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

@end
