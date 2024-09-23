@implementation PXSharedAlbumsRecipientsForAlbumWithObjectID

void __PXSharedAlbumsRecipientsForAlbumWithObjectID_block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0D71628], "cloudSharedAlbumWithObjectID:managedObjectContext:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v2;
  if (v2)
  {
    _PXSharedAlbumRecipientsForAlbumIncludeCurrentUser(v2, *(unsigned __int8 *)(a1 + 56));
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99D20]);
  }
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

@end
