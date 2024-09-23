@implementation WebItemProviderPromisedFileRegistrar

- (WebItemProviderPromisedFileRegistrar)initWithType:(id)a3 callback:(id)a4
{
  id v6;
  const void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)WebItemProviderPromisedFileRegistrar;
  v6 = -[WebItemProviderPromisedFileRegistrar init](&v10, sel_init);
  if (v6)
  {
    if (a3)
      CFRetain(a3);
    v7 = (const void *)*((_QWORD *)v6 + 1);
    *((_QWORD *)v6 + 1) = a3;
    if (v7)
      CFRelease(v7);
    v8 = _Block_copy(a4);
    _Block_release(*((const void **)v6 + 2));
    *((_QWORD *)v6 + 2) = v8;
    _Block_release(0);
  }
  return (WebItemProviderPromisedFileRegistrar *)v6;
}

- (void)registerItemProvider:(id)a3
{
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  void *aBlock;

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3321888768;
  v6[2] = __61__WebItemProviderPromisedFileRegistrar_registerItemProvider___block_invoke;
  v6[3] = &__block_descriptor_40_e8_32c74_ZTSKZ61__WebItemProviderPromisedFileRegistrar_registerItemProvider__E3__1_e45___NSProgress_16__0___v____NSURL_B__NSError__8l;
  v4 = *((_QWORD *)self + 1);
  v5 = _Block_copy(*((const void **)self + 2));
  aBlock = _Block_copy(v5);
  objc_msgSend(a3, "registerFileRepresentationForTypeIdentifier:fileOptions:visibility:loadHandler:", v4, 0, 0, v6);
  _Block_release(v5);
  _Block_release(aBlock);
}

uint64_t __61__WebItemProviderPromisedFileRegistrar_registerItemProvider___block_invoke(uint64_t a1, void *aBlock)
{
  void *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t);
  void *v8;
  void *aBlocka;

  v5 = MEMORY[0x1E0C809B0];
  v6 = 3321888768;
  v7 = ___ZZ61__WebItemProviderPromisedFileRegistrar_registerItemProvider__ENK3__1clEU13block_pointerFvP5NSURLbP7NSErrorE_block_invoke;
  v8 = &__block_descriptor_40_e8_32c127_ZTSKZZ61__WebItemProviderPromisedFileRegistrar_registerItemProvider__ENK3__1clEU13block_pointerFvP5NSURLbP7NSErrorEEUlS1_S3_E__e27_v24__0__NSURL_8__NSError_16l;
  v3 = _Block_copy(aBlock);
  aBlocka = _Block_copy(v3);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  _Block_release(v3);
  _Block_release(aBlocka);
  return 0;
}

- (NSString)typeIdentifier
{
  return (NSString *)*((_QWORD *)self + 1);
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(file promise: %@)"), *((_QWORD *)self + 1));
}

- (void).cxx_destruct
{
  const void *v3;

  _Block_release(*((const void **)self + 2));
  v3 = (const void *)*((_QWORD *)self + 1);
  *((_QWORD *)self + 1) = 0;
  if (v3)
    CFRelease(v3);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

@end
