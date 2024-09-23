@implementation ParticipantsForSharedLibrary

void ___ParticipantsForSharedLibrary_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  char v4;
  char v5;
  id v6;

  v3 = a2;
  v6 = v3;
  if (!*(_BYTE *)(a1 + 48)
    || (v4 = _PXSharedLibraryParticipantsAreEqual(*(void **)(a1 + 32), v3), v3 = v6, (v4 & 1) == 0))
  {
    if (!*(_BYTE *)(a1 + 49) || (v5 = objc_msgSend(v3, "isCurrentUser"), v3 = v6, (v5 & 1) == 0))
    {
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);
      v3 = v6;
    }
  }

}

@end
