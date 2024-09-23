@implementation _LTTokenizer

- (id)tokenize:(id)a3 forLocale:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t Tokenizer;
  morphun::Chunk *v15;
  uint64_t v16;
  morphun::Token *v17;
  uint64_t Value;
  int v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *__p;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[17];
  void *__dst[2];
  char v29;
  void *v30;
  _BYTE *v31;
  void *v32;
  char v33;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "localeIdentifier");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  std::string::basic_string[abi:ne180100]<0>(&v32, (char *)objc_msgSend(v7, "UTF8String"));

  std::vector<unsigned short>::vector(&v30, objc_msgSend(v5, "length"));
  objc_msgSend(v5, "getCharacters:range:");
  std::basic_string<char16_t>::basic_string[abi:ne180100](__dst, v30, (v31 - (_BYTE *)v30) >> 1);
  objc_msgSend(v6, "languageCode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("de"));

  if (v9)
  {
    objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "componentsSeparatedByCharactersInSet:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("SELF != ''"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "filteredArrayUsingPredicate:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    __p = 0;
    v25 = 0;
    v26 = 0;
    morphun::util::ULocale::ULocale();
    Tokenizer = morphun::TokenizerFactory::createTokenizer();
    morphun::util::ULocale::~ULocale((morphun::util::ULocale *)v27);
    v15 = (morphun::Chunk *)(*(uint64_t (**)(uint64_t, void **))(*(_QWORD *)Tokenizer + 24))(Tokenizer, __dst);
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    morphun::TokenIterator::TokenIterator();
    v27[0] = morphun::Chunk::end(v15);
    v27[1] = v16;
    while ((morphun::TokenIterator::operator!=() & 1) != 0)
    {
      v17 = (morphun::Token *)morphun::TokenIterator::operator*();
      if ((morphun::Token::isHead(v17) & 1) == 0
        && (morphun::Token::isTail(v17) & 1) == 0
        && (morphun::Token::isWhitespace(v17) & 1) == 0)
      {
        Value = morphun::Token::getValue(v17);
        v19 = *(char *)(Value + 23);
        if (v19 >= 0)
          v20 = Value;
        else
          v20 = *(_QWORD *)Value;
        if (v19 >= 0)
          v21 = *(unsigned __int8 *)(Value + 23);
        else
          v21 = *(_QWORD *)(Value + 8);
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCharacters:length:", v20, v21, __p, v25, v26);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addObject:", v22);

      }
      morphun::TokenIterator::operator++();
    }
    if (v15)
      (*(void (**)(morphun::Chunk *))(*(_QWORD *)v15 + 16))(v15);
    (*(void (**)(uint64_t))(*(_QWORD *)Tokenizer + 16))(Tokenizer);
  }
  if (v29 < 0)
    operator delete(__dst[0]);
  if (v30)
  {
    v31 = v30;
    operator delete(v30);
  }
  if (v33 < 0)
    operator delete(v32);

  return v13;
}

- (id)_tokenizeString:(id)a3 inLocale:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v16[4];
  id v17;
  id v18;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDFD70]), "initWithUnit:", 0);
  objc_msgSend(v6, "languageCode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLanguage:", v8);

  objc_msgSend(v7, "setString:", v5);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v5, "length");
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __41___LTTokenizer__tokenizeString_inLocale___block_invoke;
  v16[3] = &unk_251A13C68;
  v11 = v5;
  v17 = v11;
  v12 = v9;
  v18 = v12;
  objc_msgSend(v7, "enumerateTokensInRange:usingBlock:", 0, v10, v16);
  v13 = v18;
  v14 = v12;

  return v14;
}

+ (unint64_t)_wordCount:(id)a3 inLocale:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDFD70]), "initWithUnit:", 0);
  objc_msgSend(v6, "languageCode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLanguage:", v8);

  objc_msgSend(v7, "setString:", v5);
  objc_msgSend(v7, "tokensForRange:", 0, objc_msgSend(v5, "length"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  return v10;
}

@end
