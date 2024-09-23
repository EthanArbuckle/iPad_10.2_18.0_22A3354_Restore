@implementation SBSDisplayIdentifiersCache

void __49___SBSDisplayIdentifiersCache_displayIdentifiers__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  unsigned int v10;
  uint64_t v11;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  if (!v2)
  {
    v11 = 0;
    v10 = 0;
    v3 = SBSSpringBoardBackgroundServerPort();
    SBGetDisplayIdentifiers(v3, &v11, &v10);
    if (v10)
    {
      v4 = objc_alloc(MEMORY[0x1E0C99D50]);
      v5 = (void *)objc_msgSend(v4, "initWithBytesNoCopy:length:freeWhenDone:", v11, v10, 0);
      objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v5, 0, 0, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v6 = 0;
    }
    if (v11)
      MEMORY[0x193FF895C](*MEMORY[0x1E0C83DA0], v11, v10);
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v6);
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(v8 + 16);
    *(_QWORD *)(v8 + 16) = v7;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v2);
}

void __52___SBSDisplayIdentifiersCache_registerChangedBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 32);
  *(_QWORD *)(v3 + 32) = v2;

}

void __45___SBSDisplayIdentifiersCache_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance___sharedInstance;
  sharedInstance___sharedInstance = (uint64_t)v1;

}

void __35___SBSDisplayIdentifiersCache_init__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_queue_noteChanged");

}

uint64_t __49___SBSDisplayIdentifiersCache__queue_noteChanged__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

@end
