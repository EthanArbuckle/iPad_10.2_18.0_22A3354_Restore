@implementation CLMicroLocationEncryption

+ (BOOL)encryptFile:(id)a3 destinationPath:(id)a4 keyLabel:(id)a5 keychainClass:(Class)a6
{
  return sub_1003B1F2C((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, sub_1003B25F0);
}

+ (BOOL)decryptFile:(id)a3 destinationPath:(id)a4 keyLabel:(id)a5 keychainClass:(Class)a6
{
  return sub_1003B1F2C((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, sub_1003B34F4);
}

+ (id)encryptData:(id)a3 keyLabel:(id)a4
{
  return sub_1003B2144((uint64_t)a1, (uint64_t)a2, a3, a4, (uint64_t (*)(uint64_t, unint64_t, uint64_t, uint64_t))sub_1003B4454);
}

+ (id)decryptData:(id)a3 keyLabel:(id)a4
{
  return sub_1003B2144((uint64_t)a1, (uint64_t)a2, a3, a4, sub_1003B4CAC);
}

- (_TtC19microlocation_logic25CLMicroLocationEncryption)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CLMicroLocationEncryption();
  return -[CLMicroLocationEncryption init](&v3, "init");
}

@end
