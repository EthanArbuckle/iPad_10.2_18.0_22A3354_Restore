@implementation TIKeyboardSecureTouchSlot

- (void)dealloc
{
  unsigned int slotID;
  BSInvalidatable *invalidatable;
  objc_super v5;
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  unsigned int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    slotID = self->_slotID;
    *(_DWORD *)buf = 136315394;
    v7 = "-[TIKeyboardSecureTouchSlot dealloc]";
    v8 = 1024;
    v9 = slotID;
    _os_log_impl(&dword_1DA6F2000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s  Invalidating slotID %X", buf, 0x12u);
  }
  -[BSInvalidatable invalidate](self->_invalidatable, "invalidate");
  self->_slotID = 0;
  invalidatable = self->_invalidatable;
  self->_invalidatable = 0;

  v5.receiver = self;
  v5.super_class = (Class)TIKeyboardSecureTouchSlot;
  -[TIKeyboardSecureTouchSlot dealloc](&v5, sel_dealloc);
}

- (unsigned)slotID
{
  return self->_slotID;
}

- (void)setSlotID:(unsigned int)a3
{
  self->_slotID = a3;
}

- (unint64_t)authenticationMessageContext
{
  return self->_authenticationMessageContext;
}

- (void)setAuthenticationMessageContext:(unint64_t)a3
{
  self->_authenticationMessageContext = a3;
}

- (BSInvalidatable)invalidatable
{
  return self->_invalidatable;
}

- (void)setInvalidatable:(id)a3
{
  objc_storeStrong((id *)&self->_invalidatable, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invalidatable, 0);
}

@end
