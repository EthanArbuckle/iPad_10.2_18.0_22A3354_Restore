@implementation PreheatOptions

void ___PreheatOptions_block_invoke()
{
  id v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v0 = objc_alloc(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 4);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = *MEMORY[0x1E0C9DA90];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0C9DA98];
  v5 = *MEMORY[0x1E0C9DAA8];
  v6 = *MEMORY[0x1E0C9DAB0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x1E0C9DAC0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v0, "initWithObjectsAndKeys:", v1, v2, v3, v4, v5, v6, v7, v8, v9, *MEMORY[0x1E0CBD240], 0);

  if (qword_1ECF22218 != -1)
    dispatch_once(&qword_1ECF22218, &__block_literal_global_203_0);
  v10 = v13;
  if (qword_1ECF22210)
  {
    objc_msgSend(v13, "addEntriesFromDictionary:");
    v10 = v13;
  }
  v11 = objc_msgSend(v10, "copy");
  v12 = (void *)_MergedGlobals_196;
  _MergedGlobals_196 = v11;

}

@end
