@implementation ODDColorTransform

- (ODDColorTransform)init
{
  ODDColorTransform *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *mStyleLabels;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ODDColorTransform;
  v2 = -[ODDColorTransform init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    mStyleLabels = v2->mStyleLabels;
    v2->mStyleLabels = v3;

  }
  return v2;
}

- (void)setLabel:(id)a3 forName:(id)a4
{
  -[NSMutableDictionary setObject:forKey:](self->mStyleLabels, "setObject:forKey:", a3, a4);
}

- (id)labelForName:(id)a3
{
  -[NSMutableDictionary objectForKey:](self->mStyleLabels, "objectForKey:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mStyleLabels, 0);
}

@end
