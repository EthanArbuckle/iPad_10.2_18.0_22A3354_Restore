@implementation PLIsPhotoPicker

void __PLIsPhotoPicker_block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  char v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v0 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v0, "processName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v0) = objc_msgSend(v1, "isEqualToString:", CFSTR("PhotoPicker"));
  if ((v0 & 1) != 0
    || (objc_msgSend(MEMORY[0x1E0CB3898], "processInfo"),
        v2 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend((id)v2, "processName"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        (id)v2,
        LOBYTE(v2) = objc_msgSend(v3, "isEqualToString:", CFSTR("PhotosPicker")),
        v3,
        (v2 & 1) != 0))
  {
    v4 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "processName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = objc_msgSend(v6, "isEqualToString:", CFSTR("PhotosMessagesApp"));
  }
  PLIsPhotoPicker_isPhotoPicker = v4;
}

@end
