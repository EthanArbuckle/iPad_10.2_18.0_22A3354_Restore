@implementation QLToolsGetKnownUTIs

void ___QLToolsGetKnownUTIs_block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  QLFrameworkBundle();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "pathForResource:ofType:", CFSTR("KnownUTIs"), CFSTR("plist"));
  v3 = (id)objc_claimAutoreleasedReturnValue();

  v1 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithContentsOfFile:", v3);
  v2 = (void *)_QLToolsGetKnownUTIs__knownUTIs;
  _QLToolsGetKnownUTIs__knownUTIs = v1;

  if (!_QLToolsGetKnownUTIs__knownUTIs)
  {
    _QLToolsGetKnownUTIs__knownUTIs = MEMORY[0x1E0C9AA70];

  }
}

@end
