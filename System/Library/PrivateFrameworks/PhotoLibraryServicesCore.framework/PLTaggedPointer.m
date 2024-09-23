@implementation PLTaggedPointer

+ (id)newInstanceWithPayload:(unint64_t)a3
{
  unsigned int v5;
  unint64_t v6;
  unint64_t v7;
  id v8;

  v5 = objc_msgSend(a1, "tag");
  if (v5)
  {
    if (v5 > 6)
      v6 = (((8 * (a3 & 0xFFFFFFFFFFFFFLL)) | ((unint64_t)v5 << 55)) + 0x7C00000000000000) | 0x8000000000000007;
    else
      v6 = v5 | (8 * a3) | 0x8000000000000000;
    v7 = *MEMORY[0x1E0DE7C58] ^ v6;
    if ((~v7 & 0xC000000000000007) != 0)
      v6 = v7 & 0xFFFFFFFFFFFFFFF8 | *(unsigned __int8 *)(MEMORY[0x1E0DE7C48] + (v7 & 7));
    v8 = (id)v6;
    if (objc_msgSend(v8, "payload") == a3)
    {
      if (v6)
        return v8;
    }
    else
    {

    }
  }
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithPayload:", a3);
}

- (unint64_t)payload
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  if (((unint64_t)self & 0x8000000000000000) == 0 || !*MEMORY[0x1E0DE7C50])
    return self->_payload.unsignedPayload;
  v2 = *MEMORY[0x1E0DE7C58];
  if ((~(unint64_t)self & 0xC000000000000007) == 0)
    v2 = 0;
  v3 = v2 ^ (unint64_t)self;
  v4 = 0xFFFFFFFFFFFFFFFLL;
  if ((~(_BYTE)v3 & 7) == 0)
    v4 = 0xFFFFFFFFFFFFFLL;
  return v4 & (v3 >> 3);
}

uint64_t __22__PLTaggedPointer_tag__block_invoke(uint64_t a1)
{
  return *(unsigned __int16 *)(a1 + 32);
}

+ (unsigned)tag
{
  void *v3;
  int v4;
  void *v5;
  objc_class *Class;
  void *v7;
  void (*v8)(void);
  void *v10;
  _QWORD v11[4];
  __int16 v12;

  if (!*MEMORY[0x1E0DE7C50])
    goto LABEL_8;
  objc_opt_class();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v3);
  if ((PFObjc_implementsClassMethod() & 1) != 0)
  {
    LOWORD(v4) = objc_msgSend(a1, "tag");
    objc_sync_exit(v3);

    return v4;
  }
  v4 = (unsigned __int16)nextTag;
  if ((unsigned __int16)nextTag > 0xBu)
  {
    v4 = 0;
  }
  else
  {
    _objc_registerTaggedPointerClass();
    ++nextTag;
  }
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __22__PLTaggedPointer_tag__block_invoke;
  v11[3] = &__block_descriptor_34_e8_S16__0_8l;
  v12 = v4;
  v5 = (void *)MEMORY[0x19AEC3014](v11);
  Class = object_getClass(a1);
  v7 = (void *)MEMORY[0x19AEC3014](v5);
  v8 = imp_implementationWithBlock(v7);
  class_addMethod(Class, "tag", v8, 0);

  objc_sync_exit(v3);
  if (!v4)
  {
LABEL_8:
    NSStringFromClass((Class)a1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    _PFAssertContinueHandler();

    LOWORD(v4) = 0;
  }
  return v4;
}

- (PLTaggedPointer)initWithPayload:(unint64_t)a3
{
  PLTaggedPointer *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PLTaggedPointer;
  result = -[PLTaggedPointer init](&v5, sel_init);
  if (result)
    result->_payload.unsignedPayload = a3;
  return result;
}

- (PLTaggedPointer)initWithSignedPayload:(int64_t)a3
{
  PLTaggedPointer *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PLTaggedPointer;
  result = -[PLTaggedPointer init](&v5, sel_init);
  if (result)
    result->_payload.unsignedPayload = a3;
  return result;
}

- (int64_t)signedPayload
{
  uint64_t v2;
  unint64_t v3;
  char v4;
  int64_t v5;
  int64_t v6;

  if (((unint64_t)self & 0x8000000000000000) == 0 || !*MEMORY[0x1E0DE7C50])
    return self->_payload.signedPayload;
  v2 = *MEMORY[0x1E0DE7C58];
  if ((~(unint64_t)self & 0xC000000000000007) == 0)
    v2 = 0;
  v3 = v2 ^ (unint64_t)self;
  v4 = ~(_BYTE)v3;
  v5 = (uint64_t)(v3 << 9) >> 12;
  v6 = (uint64_t)(2 * v3) >> 4;
  if ((v4 & 7) != 0)
    return v6;
  else
    return v5;
}

- (BOOL)isTaggedPointer
{
  return (uint64_t)self < 0 && *MEMORY[0x1E0DE7C50] != 0;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  BOOL v6;
  unint64_t v7;

  v4 = a3;
  v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    v7 = -[PLTaggedPointer payload](self, "payload");
    v6 = v7 == objc_msgSend(v4, "payload");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (BOOL)taggedPointersEnabled
{
  return *MEMORY[0x1E0DE7C50] != 0;
}

+ (id)newInstanceWithSignedPayload:(int64_t)a3
{
  unsigned int v5;
  unint64_t v6;
  unint64_t v7;
  id v8;

  v5 = objc_msgSend(a1, "tag");
  if (v5)
  {
    if (v5 > 6)
      v6 = (((8 * (a3 & 0xFFFFFFFFFFFFFLL)) | ((unint64_t)v5 << 55)) + 0x7C00000000000000) | 0x8000000000000007;
    else
      v6 = v5 | (unint64_t)(8 * a3) | 0x8000000000000000;
    v7 = *MEMORY[0x1E0DE7C58] ^ v6;
    if ((~v7 & 0xC000000000000007) != 0)
      v6 = v7 & 0xFFFFFFFFFFFFFFF8 | *(unsigned __int8 *)(MEMORY[0x1E0DE7C48] + (v7 & 7));
    v8 = (id)v6;
    if (objc_msgSend(v8, "signedPayload") == a3)
    {
      if (v6)
        return v8;
    }
    else
    {

    }
  }
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithPayload:", a3);
}

@end
