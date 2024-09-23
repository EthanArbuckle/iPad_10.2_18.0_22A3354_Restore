@implementation PLSharedAssetsContainerIncrementalChangeHighlightContainerChange

- (PLSharedAssetsContainerIncrementalChangeHighlightContainerChange)initWithCoder:(id)a3
{
  id v4;
  PLSharedAssetsContainerIncrementalChangeHighlightContainerChange *v5;
  uint64_t v6;
  NSString *relationshipKey;
  uint64_t v8;
  NSURL *sourceHighlightURI;
  uint64_t v10;
  NSURL *destinationHighlightURI;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PLSharedAssetsContainerIncrementalChangeHighlightContainerChange;
  v5 = -[PLSharedAssetsContainerIncrementalChangeHighlightContainerChange init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("relationshipKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    relationshipKey = v5->_relationshipKey;
    v5->_relationshipKey = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sourceHighlightURI"));
    v8 = objc_claimAutoreleasedReturnValue();
    sourceHighlightURI = v5->_sourceHighlightURI;
    v5->_sourceHighlightURI = (NSURL *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("destinationHighlightURI"));
    v10 = objc_claimAutoreleasedReturnValue();
    destinationHighlightURI = v5->_destinationHighlightURI;
    v5->_destinationHighlightURI = (NSURL *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[PLSharedAssetsContainerIncrementalChangeHighlightContainerChange relationshipKey](self, "relationshipKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("relationshipKey"));

  -[PLSharedAssetsContainerIncrementalChangeHighlightContainerChange sourceHighlightURI](self, "sourceHighlightURI");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("sourceHighlightURI"));

  -[PLSharedAssetsContainerIncrementalChangeHighlightContainerChange destinationHighlightURI](self, "destinationHighlightURI");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("destinationHighlightURI"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = (void *)-[NSString copy](self->_relationshipKey, "copy");
  objc_msgSend(v4, "setRelationshipKey:", v5);

  v6 = (void *)-[NSURL copy](self->_sourceHighlightURI, "copy");
  objc_msgSend(v4, "setSourceHighlightURI:", v6);

  v7 = (void *)-[NSURL copy](self->_destinationHighlightURI, "copy");
  objc_msgSend(v4, "setDestinationHighlightURI:", v7);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  PLSharedAssetsContainerIncrementalChangeHighlightContainerChange *v4;
  PLSharedAssetsContainerIncrementalChangeHighlightContainerChange *v5;
  char IsEqual;

  v4 = (PLSharedAssetsContainerIncrementalChangeHighlightContainerChange *)a3;
  if (v4 == self)
  {
    IsEqual = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      if (PLObjectIsEqual() && PLObjectIsEqual())
        IsEqual = PLObjectIsEqual();
      else
        IsEqual = 0;

    }
    else
    {
      IsEqual = 0;
    }
  }

  return IsEqual;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;

  v3 = -[NSString hash](self->_relationshipKey, "hash");
  v4 = -[NSURL hash](self->_sourceHighlightURI, "hash") ^ v3;
  return v4 ^ -[NSURL hash](self->_destinationHighlightURI, "hash");
}

- (NSString)relationshipKey
{
  return self->_relationshipKey;
}

- (void)setRelationshipKey:(id)a3
{
  objc_storeStrong((id *)&self->_relationshipKey, a3);
}

- (NSURL)sourceHighlightURI
{
  return self->_sourceHighlightURI;
}

- (void)setSourceHighlightURI:(id)a3
{
  objc_storeStrong((id *)&self->_sourceHighlightURI, a3);
}

- (NSURL)destinationHighlightURI
{
  return self->_destinationHighlightURI;
}

- (void)setDestinationHighlightURI:(id)a3
{
  objc_storeStrong((id *)&self->_destinationHighlightURI, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationHighlightURI, 0);
  objc_storeStrong((id *)&self->_sourceHighlightURI, 0);
  objc_storeStrong((id *)&self->_relationshipKey, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
