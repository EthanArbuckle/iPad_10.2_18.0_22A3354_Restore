@implementation PBCodable

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PBCodable data](self, "data");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("data"));

}

- (PBCodable)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  PBCodable *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("data"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[PBCodable initWithData:](self, "initWithData:", v5);
  return v6;
}

- (PBCodable)initWithData:(id)a3
{
  id v4;
  PBCodable *v5;
  PBDataReader *v6;
  BOOL v7;
  PBCodable *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PBCodable;
  v5 = -[PBCodable init](&v10, sel_init);
  if (!v5)
    goto LABEL_4;
  v6 = -[PBDataReader initWithData:]([PBDataReader alloc], "initWithData:", v4);
  if (!-[PBCodable readFrom:](v5, "readFrom:", v6))
  {

    goto LABEL_6;
  }
  v7 = -[PBDataReader hasError](v6, "hasError");

  if (v7)
  {
LABEL_6:
    v8 = 0;
    goto LABEL_7;
  }
LABEL_4:
  v8 = v5;
LABEL_7:

  return v8;
}

- (PBCodable)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PBCodable;
  return -[PBCodable init](&v3, sel_init);
}

- (NSData)data
{
  PBDataWriter *v3;
  void *v4;

  v3 = objc_alloc_init(PBDataWriter);
  -[PBCodable writeTo:](self, "writeTo:", v3);
  -[PBDataWriter immutableData](v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)formattedText
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v6;
  uint64_t v7;

  -[PBCodable dictionaryRepresentation](self, "dictionaryRepresentation");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37A0], "string", 0, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1A85B6664]();
  _textFormatDictionary(v2, 0, (uint64_t)&v6);
  objc_autoreleasePoolPop(v3);
  v4 = (void *)v7;

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  -[PBCodable doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (void)writeTo:(id)a3
{
  -[PBCodable doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (id)dictionaryRepresentation
{
  -[PBCodable doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

+ (id)options
{
  return 0;
}

@end
