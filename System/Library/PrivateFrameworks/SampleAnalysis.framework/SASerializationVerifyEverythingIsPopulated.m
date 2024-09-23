@implementation SASerializationVerifyEverythingIsPopulated

uint64_t __SASerializationVerifyEverythingIsPopulated_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_79);
}

void __SASerializationVerifyEverythingIsPopulated_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  _BYTE *v4;
  id v5;
  id v6;

  v6 = a2;
  v4 = a3;
  if (!v4 || (v4[8] & 1) == 0)
  {
    +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Decoding failure"), CFSTR("Never populated an object"), 0);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v5);
  }

}

@end
