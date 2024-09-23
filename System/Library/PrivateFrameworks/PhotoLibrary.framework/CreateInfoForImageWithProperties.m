@implementation CreateInfoForImageWithProperties

void ____CreateInfoForImageWithProperties_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  void *v13;

  if (*(_BYTE *)(a1 + 56) && !*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    if (*(_BYTE *)(a1 + 57))
    {
      v6 = objc_msgSend(a3, "URL");
      if (v6)
      {
        objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v6, *MEMORY[0x1E0CEB6A8]);
        v7 = objc_msgSend(a3, "sandboxExtensionToken");
        if (v7)
          objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v7, CFSTR("PUPhotoPickerOriginalImagePathSandboxExtensionToken"));
      }
    }
    else if (a2)
    {
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA638]), "initWithData:", a2);
      if (v13)
        objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v13, *MEMORY[0x1E0CEB6D0]);

    }
  }
  if (*(_BYTE *)(a1 + 58) && !*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    if (*(_BYTE *)(a1 + 57))
    {
      v8 = objc_msgSend(a3, "URL");
      if (!v8)
        return;
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v8, *MEMORY[0x1E0CEB6A8]);
      v9 = objc_msgSend(a3, "sandboxExtensionToken");
      if (!v9)
        return;
      v10 = v9;
      v11 = *(void **)(a1 + 32);
      v12 = CFSTR("PUPhotoPickerOriginalImagePathSandboxExtensionToken");
    }
    else
    {
      if (!a2)
        return;
      v11 = *(void **)(a1 + 32);
      v12 = (const __CFString *)*MEMORY[0x1E0CEC048];
      v10 = a2;
    }
    objc_msgSend(v11, "setObject:forKey:", v10, v12);
  }
}

@end
