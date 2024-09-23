@implementation PFStaticArtworkVisualIdenticality

- (PFStaticArtworkVisualIdenticality)initWithArtworkIdentifier:(id)a3
{
  id v4;
  PFStaticArtworkVisualIdenticality *v5;
  uint64_t v6;
  NSString *artworkIdentifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PFStaticArtworkVisualIdenticality;
  v5 = -[PFStaticArtworkVisualIdenticality init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    artworkIdentifier = v5->_artworkIdentifier;
    v5->_artworkIdentifier = (NSString *)v6;

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  PFStaticArtworkVisualIdenticality *v4;
  BOOL v5;

  v4 = (PFStaticArtworkVisualIdenticality *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[NSString isEqualToString:](self->_artworkIdentifier, "isEqualToString:", v4->_artworkIdentifier);
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[PFStaticArtworkVisualIdenticality initWithArtworkIdentifier:](+[PFStaticArtworkVisualIdenticality allocWithZone:](PFStaticArtworkVisualIdenticality, "allocWithZone:", a3), "initWithArtworkIdentifier:", self->_artworkIdentifier);
}

- (id)stringRepresentation
{
  return self->_artworkIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworkIdentifier, 0);
}

@end
