@implementation PRMutablePosterMetadata

- (id)copyWithZone:(_NSZone *)a3
{
  PRPosterMetadata *v4;
  void *v5;
  PRPosterMetadata *v6;

  v4 = +[PRPosterMetadata allocWithZone:](PRPosterMetadata, "allocWithZone:", a3);
  -[PRPosterMetadata displayNameLocalizationKey](self, "displayNameLocalizationKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PRPosterMetadata initWithDisplayNameLocalizationKey:](v4, "initWithDisplayNameLocalizationKey:", v5);

  return v6;
}

@end
