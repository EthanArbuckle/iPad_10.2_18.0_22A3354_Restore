@implementation GetTraitCollectionTSD

uint64_t __GetTraitCollectionTSD_block_invoke()
{
  return pthread_key_create((pthread_key_t *)&qword_1ECD7E7A0, (void (__cdecl *)(void *))FreeTraitCollectionTSD);
}

@end
