@implementation CNVCardSerializationStorage

+ (CNVCardSerializationStorage)storageWithString:(id)a3
{
  return (CNVCardSerializationStorage *)+[CNVCardStringStorage storageWithString:](CNVCardStringStorage, "storageWithString:", a3);
}

+ (CNVCardSerializationStorage)storageWithData:(id)a3
{
  return (CNVCardSerializationStorage *)+[CNVCardDataStorage storageWithData:](CNVCardDataStorage, "storageWithData:", a3);
}

@end
