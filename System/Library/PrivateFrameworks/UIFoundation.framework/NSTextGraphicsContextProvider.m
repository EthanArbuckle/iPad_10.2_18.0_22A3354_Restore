@implementation NSTextGraphicsContextProvider

+ (BOOL)textGraphicsContextProviderClassRespondsToColorQuery
{
  objc_msgSend(a1, "textGraphicsContextProviderClass");
  return _textGraphicsContextProviderClassRespondsToColorQuery;
}

+ (Class)textGraphicsContextProviderClass
{
  if (_textGraphicsContextProviderClassOnce != -1)
    dispatch_once(&_textGraphicsContextProviderClassOnce, &__block_literal_global_7);
  return (Class)_textGraphicsContextProviderClass;
}

+ (void)setCurrentTextGraphicsContext:(id)a3 duringBlock:(id)a4
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(a3, "becomeCurrentGraphicsContextDuringBlock:", a4);
  else
    (*((void (**)(id))a4 + 2))(a4);
}

uint64_t __65__NSTextGraphicsContextProvider_textGraphicsContextProviderClass__block_invoke()
{
  uint64_t result;

  _textGraphicsContextProviderClass = objc_opt_class();
  result = objc_opt_respondsToSelector();
  _textGraphicsContextProviderClassRespondsToColorQuery = result & 1;
  return result;
}

+ (void)setTextGraphicsContextProviderClass:(Class)a3
{
  uint64_t block;
  uint64_t v5;
  uint64_t (*v6)(uint64_t);
  void *v7;
  Class v8;

  if ((-[objc_class conformsToProtocol:](a3, "conformsToProtocol:", &unk_1EE07E7F0) & 1) == 0
    && (-[objc_class conformsToProtocol:](a3, "conformsToProtocol:", &unk_1EE07E9D0) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("A Class %@ not conforming to NSTextGraphicsContextProvider was specified to textGraphicsContextProviderClass."), a3);
  }
  block = MEMORY[0x1E0C809B0];
  v5 = 3221225472;
  v6 = __69__NSTextGraphicsContextProvider_setTextGraphicsContextProviderClass___block_invoke;
  v7 = &unk_1E2602FF0;
  v8 = a3;
  if (_textGraphicsContextProviderClassOnce != -1)
    dispatch_once(&_textGraphicsContextProviderClassOnce, &block);
  if ((Class)_textGraphicsContextProviderClass != a3)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Requested to reset textGraphicsContextProviderClass property with %@ after initialization."), a3, block, v5, v6, v7, v8);
}

uint64_t __69__NSTextGraphicsContextProvider_setTextGraphicsContextProviderClass___block_invoke(uint64_t result)
{
  _textGraphicsContextProviderClass = *(_QWORD *)(result + 32);
  return result;
}

+ (Class)__defaultColorClass
{
  return (Class)getUIColorClass[0]();
}

+ (Class)textGraphicsContextClass
{
  return +[NSTextGraphicsContextProvider textGraphicsContextProviderClass](NSTextGraphicsContextProvider, "textGraphicsContextProviderClass");
}

+ (void)setTextGraphicsContextClass:(Class)a3
{
  if ((-[objc_class conformsToProtocol:](a3, "conformsToProtocol:", &unk_1EE07E9D0) & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("A Class %@ not conforming to NSTextGraphicsContext was specified to textGraphicsContextClass."), a3);
  +[NSTextGraphicsContextProvider setTextGraphicsContextProviderClass:](NSTextGraphicsContextProvider, "setTextGraphicsContextProviderClass:", a3);
}

@end
