@implementation MOContextMusicMetaData

- (MOContextMusicMetaData)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MOContextMusicMetaData;
  return -[MOContextMusicMetaData init](&v3, sel_init);
}

- (MOContextMusicMetaData)initWithMusicString:(id)a3
{
  id v5;
  MOContextMusicMetaData *v6;
  MOContextMusicMetaData *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MOContextMusicMetaData;
  v6 = -[MOContextMusicMetaData init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_musicString, a3);

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MOContextMusicMetaData *v4;
  void *v5;
  MOContextMusicMetaData *v6;

  v4 = [MOContextMusicMetaData alloc];
  -[MOContextMusicMetaData musicString](self, "musicString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MOContextMusicMetaData initWithMusicString:](v4, "initWithMusicString:", v5);

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_musicString, CFSTR("musicString"));
}

- (MOContextMusicMetaData)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  MOContextMusicMetaData *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("musicString"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[MOContextMusicMetaData initWithMusicString:](self, "initWithMusicString:", v5);
  return v6;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[MOContextMusicMetaData musicString](self, "musicString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mask");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("music string, %@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSString)musicString
{
  return self->_musicString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_musicString, 0);
}

@end
