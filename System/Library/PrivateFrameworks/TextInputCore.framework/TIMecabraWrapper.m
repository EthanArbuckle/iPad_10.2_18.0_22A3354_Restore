@implementation TIMecabraWrapper

- (TIMecabraWrapper)initWithInputMethodType:(int)a3 learningDictionaryDirectoryURL:(__CFURL *)a4 creationOptions:(unint64_t)a5
{
  TIMecabraWrapper *v6;
  void *v7;
  uint64_t *v8;
  TIMecabraWrapper *result;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)TIMecabraWrapper;
  v6 = -[TIMecabraWrapper init](&v14, sel_init);
  if (!v6)
    return v6;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  mecabraCreationQueue();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  TIDispatchSync();

  v8 = v11;
  if (v11[3])
  {
    v6->_inputMethodType = a3;
    v6->_mecabraRef = (__Mecabra *)v8[3];
    _Block_object_dispose(&v10, 8);
    return v6;
  }
  result = (TIMecabraWrapper *)_os_crash();
  __break(1u);
  return result;
}

- (TIMecabraWrapper)initWithInputMethodType:(int)a3 learningDictionaryDirectoryURL:(id)a4 creationOptionsDictionary:(id)a5
{
  id v8;
  id v9;
  TIMecabraWrapper *v10;
  void *v11;
  uint64_t *v12;
  TIMecabraWrapper *result;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  objc_super v20;

  v8 = a4;
  v9 = a5;
  v20.receiver = self;
  v20.super_class = (Class)TIMecabraWrapper;
  v10 = -[TIMecabraWrapper init](&v20, sel_init);
  if (!v10)
    goto LABEL_4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  mecabraCreationQueue();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v9;
  v15 = v8;
  TIDispatchSync();

  v12 = v17;
  if (v17[3])
  {
    v10->_inputMethodType = a3;
    v10->_mecabraRef = (__Mecabra *)v12[3];

    _Block_object_dispose(&v16, 8);
LABEL_4:

    return v10;
  }
  result = (TIMecabraWrapper *)_os_crash();
  __break(1u);
  return result;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)();
  void *v8;
  TIMecabraWrapper *v9;

  if (self->_mecabraRef)
  {
    mecabraCreationQueue();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = MEMORY[0x1E0C809B0];
    v6 = 3221225472;
    v7 = __27__TIMecabraWrapper_dealloc__block_invoke;
    v8 = &unk_1EA106A98;
    v9 = self;
    TIDispatchSync();

  }
  v4.receiver = self;
  v4.super_class = (Class)TIMecabraWrapper;
  -[TIMecabraWrapper dealloc](&v4, sel_dealloc);
}

- (int)inputMethodType
{
  return self->_inputMethodType;
}

- (__Mecabra)mecabraRef
{
  return self->_mecabraRef;
}

uint64_t __27__TIMecabraWrapper_dealloc__block_invoke()
{
  return MecabraRelease();
}

void __101__TIMecabraWrapper_initWithInputMethodType_learningDictionaryDirectoryURL_creationOptionsDictionary___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;

  v4 = (id)objc_msgSend(*(id *)(a1 + 32), "mutableCopy");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 56));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v2, *MEMORY[0x1E0DE7138]);

  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v3, *MEMORY[0x1E0DE7128]);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = MecabraCreate();

}

uint64_t __91__TIMecabraWrapper_initWithInputMethodType_learningDictionaryDirectoryURL_creationOptions___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = MecabraCreateWithOptions();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end
