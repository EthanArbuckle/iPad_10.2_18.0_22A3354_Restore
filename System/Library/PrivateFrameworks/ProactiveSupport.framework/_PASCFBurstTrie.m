@implementation _PASCFBurstTrie

- (_PASCFBurstTrie)initWithPath:(id)a3
{
  id v5;
  _PASCFBurstTrie *v6;
  uint64_t v7;
  _PASCFBurstTrie *v8;
  void *v10;
  objc_super v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_PASCFBurstTrie.m"), 30, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("path"));

  }
  v11.receiver = self;
  v11.super_class = (Class)_PASCFBurstTrie;
  v6 = -[_PASCFBurstTrie init](&v11, sel_init);
  if (v6 && (v7 = CFBurstTrieCreateFromFile(), (v6->_trie = (_CFBurstTrie *)v7) == 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v5;
      _os_log_error_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Could not open trie: %@", buf, 0xCu);
    }
    v8 = 0;
  }
  else
  {
    v8 = v6;
  }

  return v8;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_trie)
    CFBurstTrieRelease();
  v3.receiver = self;
  v3.super_class = (Class)_PASCFBurstTrie;
  -[_PASCFBurstTrie dealloc](&v3, sel_dealloc);
}

- (unsigned)payloadForString:(id)a3
{
  __CFString *v3;
  unint64_t v4;
  char __s[385];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = (__CFString *)a3;
  v4 = -[__CFString length](v3, "length");
  if (CFStringGetCStringPtr(v3, 0x600u))
    goto LABEL_2;
  if (v4 <= 0xFF
    && -[__CFString getCString:maxLength:encoding:](v3, "getCString:maxLength:encoding:", __s, 385, 4))
  {
    strlen(__s);
LABEL_2:
    CFBurstTrieContainsUTF8String();
    goto LABEL_3;
  }
  if (v3)
    CFBurstTrieContains();
LABEL_3:

  return 0;
}

- (unsigned)payloadForString:(id)a3 range:(_NSRange)a4
{
  void *v5;

  objc_msgSend(a3, "substringWithRange:", a4.location, a4.length);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(self) = -[_PASCFBurstTrie payloadForString:](self, "payloadForString:", v5);

  return self;
}

- (unsigned)payloadForUTF8String:(const char *)a3 length:(unint64_t)a4
{
  if (!a3)
    return 0;
  if (CFBurstTrieContainsUTF8String())
    return 0;
  return 0;
}

- (void)runBlockWithTrie:(id)a3
{
  (*((void (**)(id, _CFBurstTrie *))a3 + 2))(a3, self->_trie);
}

@end
