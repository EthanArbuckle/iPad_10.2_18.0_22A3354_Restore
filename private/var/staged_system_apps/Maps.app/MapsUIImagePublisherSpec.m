@implementation MapsUIImagePublisherSpec

- (MapsUIImagePublisherSpec)initWithIconIdentifier:(unsigned int)a3
{
  MapsUIImagePublisherSpec *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MapsUIImagePublisherSpec;
  result = -[MapsUIImagePublisherSpec init](&v5, "init");
  if (result)
    *(_DWORD *)(&result->super._isRTL + 3) = a3;
  return result;
}

- (unint64_t)hash
{
  return -[MapsUIImagePublisherSpec iconIdentifier](self, "iconIdentifier");
}

- (BOOL)isEqual:(id)a3
{
  MapsUIImagePublisherSpec *v4;
  uint64_t v5;
  MapsUIImagePublisherSpec *v6;
  unsigned int v7;
  unsigned int v8;
  BOOL v9;

  v4 = (MapsUIImagePublisherSpec *)a3;
  if (v4 == self)
  {
    v9 = 1;
  }
  else
  {
    v5 = objc_opt_class(MapsUIImagePublisherSpec);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    {
      v6 = v4;
      v7 = -[MapsUIImagePublisherSpec iconIdentifier](self, "iconIdentifier");
      v8 = -[MapsUIImagePublisherSpec iconIdentifier](v6, "iconIdentifier");

      v9 = v7 == v8;
    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MapsUIImagePublisherSpec *v4;

  v4 = objc_alloc_init(MapsUIImagePublisherSpec);
  -[MapsUIImagePublisherSpec setIconIdentifier:](v4, "setIconIdentifier:", -[MapsUIImagePublisherSpec iconIdentifier](self, "iconIdentifier"));
  return v4;
}

- (id)imageForScale:(double)a3 isCarPlay:(BOOL)a4
{
  return +[MKIconManager imageForIconID:contentScale:sizeGroup:nightMode:](MKIconManager, "imageForIconID:contentScale:sizeGroup:nightMode:", -[MapsUIImagePublisherSpec iconIdentifier](self, "iconIdentifier", a4), 1, 0, a3);
}

- (unsigned)iconIdentifier
{
  return *(_DWORD *)(&self->super._isRTL + 3);
}

- (void)setIconIdentifier:(unsigned int)a3
{
  *(_DWORD *)(&self->super._isRTL + 3) = a3;
}

@end
