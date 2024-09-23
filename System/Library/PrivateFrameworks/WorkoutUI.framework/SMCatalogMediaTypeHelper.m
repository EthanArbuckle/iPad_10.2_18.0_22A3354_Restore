@implementation SMCatalogMediaTypeHelper

+ (id)mediaTypeBridgeRawValueFrom:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  id result;

  v3 = sub_24A77B9B0();
  v5 = v4;
  swift_bridgeObjectRetain();
  v6 = (char *)sub_24A69FC30 + 4 * byte_24A782A65[MEMORY[0x24BD1633C](v3, v5)];
  __asm { BR              X10 }
  return result;
}

- (SMCatalogMediaTypeHelper)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CatalogMediaTypeHelper();
  return -[SMCatalogMediaTypeHelper init](&v3, sel_init);
}

@end
