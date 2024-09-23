@implementation CMDPGrammar

- (CMDPGrammar)initWithCommandTreeDictionary:(id)a3 forLocaleIdentifier:(id)a4
{
  id v6;
  __CFString *v7;
  CMDPGrammar *v8;
  CMDPGrammar *v9;
  const __CFAllocator *v10;
  const __CFLocale *v11;
  CMDPNormalizer *v12;
  NSString *currentBuiltInLMString;
  NSString *currentCommandIdentifier;
  uint64_t v15;
  NSMutableArray *grammarDataArray;
  CMDPFst *v17;
  void *v18;
  void *v19;
  void *v20;
  void *value;
  objc_super v23;

  v6 = a3;
  v7 = (__CFString *)a4;
  v23.receiver = self;
  v23.super_class = (Class)CMDPGrammar;
  v8 = -[CMDPGrammar init](&v23, sel_init);
  v9 = v8;
  if (v8)
  {
    v10 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    if (v7)
      v11 = CFLocaleCreate(v10, v7);
    else
      v11 = CFLocaleCreate(v10, CFSTR("en_US"));
    v12 = (CMDPNormalizer *)operator new();
    CMDPNormalizer::CMDPNormalizer(v12, v11);
    std::unique_ptr<CMDPNormalizer>::reset[abi:ne180100](&v8->_normalizer.__ptr_.__value_, v12);
    CFRelease(v11);
    currentBuiltInLMString = v8->_currentBuiltInLMString;
    v8->_currentBuiltInLMString = 0;

    currentCommandIdentifier = v8->_currentCommandIdentifier;
    v8->_currentCommandIdentifier = 0;

    v15 = objc_opt_new();
    grammarDataArray = v8->_grammarDataArray;
    v8->_grammarDataArray = (NSMutableArray *)v15;

    v8->_addOptionalFst = 1;
    v8->_rebuildGrammar = 1;
    v17 = (CMDPFst *)operator new();
    CMDPFst::CMDPFst(v17, 1);
    CMDPFst::setStart(v17, 0);
    *(_QWORD *)&v9->_nextFstState = 0x100000001;
    v18 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithArc:", 0x100000000);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKey:", v19, v6);

    -[CMDPGrammar buildGrammarFst:forCommandTree:withFstArcDictionary:](v9, "buildGrammarFst:forCommandTree:withFstArcDictionary:", v17, v6, v18);
    CMDPFst::setFinal(v17, 1, 0.0);
    CMDPFst::setSymbols(v17);
    v20 = (void *)*((_QWORD *)v17 + 1);
    *((_QWORD *)v17 + 1) = 0;
    value = v9->_grammarFst.__ptr_.__value_;
    v9->_grammarFst.__ptr_.__value_ = v20;
    if (value)
      (*(void (**)(void *))(*(_QWORD *)value + 8))(value);

    CMDPFst::~CMDPFst(v17);
    MEMORY[0x22E2FB328]();
  }

  return v9;
}

- (void)grammarFst
{
  void *v3;
  void *value;
  void *v5;
  void *v7;

  if (self->_rebuildGrammar)
  {
    if (self->_labelFstPairVector.__begin_ != self->_labelFstPairVector.__end_)
    {
      cmdp_fst_util::replace((uint64_t)self->_grammarFst.__ptr_.__value_, (uint64_t *)&self->_labelFstPairVector, &v7);
      v3 = v7;
      v7 = 0;
      value = self->_grammarFst.__ptr_.__value_;
      self->_grammarFst.__ptr_.__value_ = v3;
      if (value)
      {
        (*(void (**)(void *))(*(_QWORD *)value + 8))(value);
        v5 = v7;
        v7 = 0;
        if (v5)
          (*(void (**)(void *))(*(_QWORD *)v5 + 8))(v5);
      }
    }
    self->_rebuildGrammar = 0;
  }
  return self->_grammarFst.__ptr_.__value_;
}

- (id)grammarData
{
  return self->_grammarDataArray;
}

- (void)buildGrammarFst:(void *)a3 forCommandTree:(id)a4 withFstArcDictionary:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_class *v18;
  void *v19;
  int v20;
  uint64_t v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  CMDPGrammarData *v26;
  int nextLabelIndex;
  std::string *v28;
  __int128 v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  unint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  __int128 v44;
  uint64_t v45;
  NSString *currentBuiltInLMString;
  NSString *currentCommandIdentifier;
  int v48;
  char v49;
  uint64_t v50;
  uint64_t v51;
  int v52;
  uint64_t v53;
  std::string __p;
  void *v56[2];
  std::string::size_type v57;

  v7 = a4;
  v8 = a5;
  objc_msgSend(v7, "objectForKey:", kSRCSCommandParseDictionaryKeyAttributes[0]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", kSRCSCommandParseAttributeOptional[0]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = objc_msgSend(v10, "BOOLValue");

  objc_msgSend(v8, "objectForKey:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = objc_msgSend(v11, "arcValue");

  objc_msgSend(v7, "objectForKey:", kSRCSCommandParseDictionaryKeyText[0]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v7, "objectForKey:", kSRCSCommandParseDictionaryKeyText[0]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CMDPGrammar addPhrase:toFst:withArc:](self, "addPhrase:toFst:withArc:", v13, a3, v53);

    goto LABEL_3;
  }
  objc_msgSend(v7, "objectForKey:", kSRCSCommandParseDictionaryKeyIsBuiltInIdentifier[0]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v14, "BOOLValue") & 1) != 0)
  {
    objc_msgSend(v7, "objectForKey:", kSRCSCommandParseDictionaryKeyIdentifier[0]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "isEqualToString:", CFSTR("BuiltInLM.Dictation")))
    {

LABEL_21:
      objc_msgSend(v7, "objectForKey:", kSRCSCommandParseDictionaryKeyIdentifier[0]);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = -[CMDPGrammarData initWithGrammarDataWord:lmIdentifer:commandIdentifier:]([CMDPGrammarData alloc], "initWithGrammarDataWord:lmIdentifer:commandIdentifier:", 0, v25, self->_currentCommandIdentifier);
      -[NSMutableArray addObject:](self->_grammarDataArray, "addObject:", v26);
      nextLabelIndex = self->_nextLabelIndex;
      self->_nextLabelIndex = nextLabelIndex + 1;
      std::to_string(&__p, nextLabelIndex);
      v28 = std::string::insert(&__p, 0, "$$ADLIB");
      v29 = *(_OWORD *)&v28->__r_.__value_.__l.__data_;
      v57 = v28->__r_.__value_.__r.__words[2];
      *(_OWORD *)v56 = v29;
      v28->__r_.__value_.__l.__size_ = 0;
      v28->__r_.__value_.__r.__words[2] = 0;
      v28->__r_.__value_.__r.__words[0] = 0;
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
      -[CMDPGrammar addAdlibFstWithLabel:outputIndex:](self, "addAdlibFstWithLabel:outputIndex:", v56, -[NSMutableArray count](self->_grammarDataArray, "count") - 1);
      CMDPFst::addArc((uint64_t)a3, v53, SHIDWORD(v53), (uint64_t)v56, (uint64_t)v56, 0.0);
      if (SHIBYTE(v57) < 0)
        operator delete(v56[0]);

      goto LABEL_3;
    }
    objc_msgSend(v7, "objectForKey:", kSRCSCommandParseDictionaryKeyIdentifier[0]);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "isEqualToString:", CFSTR("BuiltInLM.Dictation.2"));

    if (v24)
      goto LABEL_21;
  }
  else
  {

  }
  objc_msgSend(v7, "objectForKey:", kSRCSCommandParseDictionaryKeyChildren[0]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(v7, "objectForKey:", kSRCSCommandParseDictionaryKeyIdentifier[0]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_msgSend(v7, "objectForKey:", kSRCSCommandParseDictionaryKeyIdentifier[0]);
      v18 = (objc_class *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKey:", kSRCSCommandParseDictionaryKeyIsBuiltInIdentifier[0]);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "BOOLValue");

      v21 = 80;
      if (v20)
        v21 = 72;
      v22 = *(Class *)((char *)&self->super.isa + v21);
      *(Class *)((char *)&self->super.isa + v21) = v18;

      v49 = v20;
      LODWORD(v17) = v20 ^ 1;
    }
    else
    {
      v49 = 0;
    }
    objc_msgSend(v7, "objectForKey:", kSRCSCommandParseDictionaryKeyChildren[0]);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = (int)v17;
    v31 = objc_msgSend(v30, "count");
    v32 = v31;
    if (v31)
    {
      v33 = 0;
      v50 = v31 - 2;
      v51 = v31 - 1;
      do
      {
        objc_msgSend(v30, "objectAtIndex:", v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKey:", kSRCSCommandParseDictionaryKeyAttributes[0]);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "objectForKey:", kSRCSCommandParseAttributePath[0]);
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        if (v36)
        {
          if (v33)
          {
            if (v51 == v33)
            {
              objc_msgSend(v30, "objectAtIndex:", v50);
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "objectForKey:", v37);
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              v39 = objc_msgSend(v38, "arcValue");

              objc_msgSend(MEMORY[0x24BDD1968], "valueWithArc:", v53 & 0xFFFFFFFF00000000 | HIDWORD(v39));
            }
            else
            {
              objc_msgSend(v30, "objectAtIndex:", v33 - 1);
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "objectForKey:", v37);
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              v42 = objc_msgSend(v41, "arcValue");

              v43 = (self->_nextFstState + 1);
              self->_nextFstState = v43;
              *((_QWORD *)&v44 + 1) = v43;
              *(_QWORD *)&v44 = v42;
              objc_msgSend(MEMORY[0x24BDD1968], "valueWithArc:", (unint64_t)(v44 >> 32));
            }
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "setObject:forKey:", v40, v34);

          }
          else
          {
            if (v32 == 1)
            {
              objc_msgSend(MEMORY[0x24BDD1968], "valueWithArc:", v53);
            }
            else
            {
              v45 = (self->_nextFstState + 1);
              self->_nextFstState = v45;
              objc_msgSend(MEMORY[0x24BDD1968], "valueWithArc:", v53 | (unint64_t)(v45 << 32));
            }
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "setObject:forKey:", v37, v34);
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDD1968], "valueWithArc:", v53);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKey:", v37, v34);
        }

        -[CMDPGrammar buildGrammarFst:forCommandTree:withFstArcDictionary:](self, "buildGrammarFst:forCommandTree:withFstArcDictionary:", a3, v34, v8);
        ++v33;
      }
      while (v32 != v33);
    }
    if ((v49 & 1) != 0)
    {
      currentBuiltInLMString = self->_currentBuiltInLMString;
      self->_currentBuiltInLMString = 0;

    }
    if (v48)
    {
      currentCommandIdentifier = self->_currentCommandIdentifier;
      self->_currentCommandIdentifier = 0;

    }
  }
  else
  {
    NSLog(CFSTR("Error in buildGrammarForCommandTree, dictionary neither text, child or identifier = <%@>"), v7);
  }
LABEL_3:
  if (v52)
  {
    if (self->_addOptionalFst)
    {
      -[CMDPGrammar addOptionalFstWithLabel](self, "addOptionalFstWithLabel");
      self->_addOptionalFst = 0;
    }
    std::string::basic_string[abi:ne180100]<0>(v56, (char *)kCMDPReplaceOptionalLabel);
    std::string::basic_string[abi:ne180100]<0>(&__p, (char *)kCMDPReplaceOptionalLabel);
    CMDPFst::addArc((uint64_t)a3, v53, SHIDWORD(v53), (uint64_t)v56, (uint64_t)&__p, 0.0);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
    if (SHIBYTE(v57) < 0)
      operator delete(v56[0]);
  }

}

- (void)addPhrase:(id)a3 toFst:(void *)a4 withArc:(_FstArc)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int nextFstState;
  int var0;
  int v14;
  CFLocaleRef *value;
  id v16;
  CMDPGrammarData *v17;
  _FstArc v18;
  unint64_t v20;
  void *v21;
  void *__p[2];
  char v23;
  std::string v24;

  CMDPNormalizer::tokenizedString(self->_normalizer.__ptr_.__value_, (const __CFString *)a3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v21, "count");
  v8 = v7;
  v20 = HIDWORD(*(unint64_t *)&a5);
  if (v7)
  {
    v18 = a5;
    v9 = v7 - 1;
    if (v7 >= 1)
    {
      v10 = 0;
      while (1)
      {
        objc_msgSend(v21, "objectAtIndex:", v10, v18);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "length"))
          break;
LABEL_15:

        if (v8 == ++v10)
          goto LABEL_23;
      }
      if (v10)
      {
        nextFstState = self->_nextFstState;
        var0 = nextFstState;
        v14 = v20;
        if (v9 == v10)
          goto LABEL_11;
      }
      else
      {
        v14 = v20;
        nextFstState = v18.var0;
        if (v8 == 1)
        {
LABEL_11:
          value = (CFLocaleRef *)self->_normalizer.__ptr_.__value_;
          v16 = objc_retainAutorelease(v11);
          std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v16, "UTF8String"));
          CMDPNormalizer::normalize(value, (const char *)__p, &v24);
          if (v23 < 0)
            operator delete(__p[0]);
          v17 = -[CMDPGrammarData initWithGrammarDataWord:lmIdentifer:commandIdentifier:]([CMDPGrammarData alloc], "initWithGrammarDataWord:lmIdentifer:commandIdentifier:", v16, self->_currentBuiltInLMString, self->_currentCommandIdentifier);
          -[NSMutableArray addObject:](self->_grammarDataArray, "addObject:", v17);
          CMDPFst::addArc((uint64_t)a4, nextFstState, v14, (uint64_t)&v24, -[NSMutableArray count](self->_grammarDataArray, "count") - 1, 0.0);
          std::__tree<std::string>::__emplace_unique_key_args<std::string,std::string const&>((uint64_t **)&self->_symbol_set, (const void **)&v24.__r_.__value_.__l.__data_, (uint64_t)&v24);

          if (SHIBYTE(v24.__r_.__value_.__r.__words[2]) < 0)
            operator delete(v24.__r_.__value_.__l.__data_);
          goto LABEL_15;
        }
        nextFstState = self->_nextFstState;
        var0 = v18.var0;
      }
      v14 = nextFstState + 1;
      self->_nextFstState = nextFstState + 1;
      nextFstState = var0;
      goto LABEL_11;
    }
  }
  else
  {
    if (self->_addOptionalFst)
    {
      -[CMDPGrammar addOptionalFstWithLabel](self, "addOptionalFstWithLabel");
      self->_addOptionalFst = 0;
    }
    std::string::basic_string[abi:ne180100]<0>(&v24, (char *)kCMDPReplaceOptionalLabel);
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)kCMDPReplaceOptionalLabel);
    CMDPFst::addArc((uint64_t)a4, a5.var0, a5.var1, (uint64_t)&v24, (uint64_t)__p, 0.0);
    if (v23 < 0)
      operator delete(__p[0]);
    if (SHIBYTE(v24.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v24.__r_.__value_.__l.__data_);
  }
LABEL_23:

}

- (void)addAdlibFstWithLabel:(const void *)a3 outputIndex:(int)a4
{
  CMDPFst *v7;
  uint64_t *p_labelFstPairVector;
  void *v9;
  char *end;
  void *v11;
  void *v12;
  uint64_t v13;
  void *__p[2];
  char v15;
  CMDPFst *v16;

  v7 = (CMDPFst *)operator new();
  CMDPFst::CMDPFst(v7, 1);
  v16 = v7;
  CMDPFst::setStart(v7, 0);
  std::string::basic_string[abi:ne180100]<0>(__p, "<sigma>");
  CMDPFst::addArc((uint64_t)v7, 0, 1, (uint64_t)__p, a4, 110.0);
  if (v15 < 0)
    operator delete(__p[0]);
  std::string::basic_string[abi:ne180100]<0>(__p, "<sigma>");
  CMDPFst::addArc((uint64_t)v7, 1, 1, (uint64_t)__p, a4, 110.0);
  if (v15 < 0)
    operator delete(__p[0]);
  CMDPFst::setFinal(v7, 1, 0.0);
  CMDPFst::setSymbols(v7);
  std::__tree<std::string>::__emplace_unique_key_args<std::string,std::string const&>((uint64_t **)&self->_special_symbol_set, (const void **)a3, (uint64_t)a3);
  p_labelFstPairVector = (uint64_t *)&self->_labelFstPairVector;
  v9 = (void *)*((_QWORD *)v7 + 1);
  *((_QWORD *)v7 + 1) = 0;
  __p[0] = v9;
  end = (char *)self->_labelFstPairVector.__end_;
  if (end >= self->_labelFstPairVector.__end_cap_.__value_)
  {
    v11 = (void *)std::vector<std::pair<std::string,std::unique_ptr<fst::VectorFst<fst::ArcTpl<fst::TropicalWeightTpl<float>>,fst::VectorState<fst::ArcTpl<fst::TropicalWeightTpl<float>>,std::allocator<fst::ArcTpl<fst::TropicalWeightTpl<float>>>>>>>>::__emplace_back_slow_path<std::string const&,std::unique_ptr<fst::VectorFst<fst::ArcTpl<fst::TropicalWeightTpl<float>>,fst::VectorState<fst::ArcTpl<fst::TropicalWeightTpl<float>>,std::allocator<fst::ArcTpl<fst::TropicalWeightTpl<float>>>>>>>(p_labelFstPairVector, (__int128 *)a3, (uint64_t *)__p);
  }
  else
  {
    std::vector<std::pair<std::string,std::unique_ptr<fst::VectorFst<fst::ArcTpl<fst::TropicalWeightTpl<float>>,fst::VectorState<fst::ArcTpl<fst::TropicalWeightTpl<float>>,std::allocator<fst::ArcTpl<fst::TropicalWeightTpl<float>>>>>>>>::__construct_one_at_end[abi:ne180100]<std::string const&,std::unique_ptr<fst::VectorFst<fst::ArcTpl<fst::TropicalWeightTpl<float>>,fst::VectorState<fst::ArcTpl<fst::TropicalWeightTpl<float>>,std::allocator<fst::ArcTpl<fst::TropicalWeightTpl<float>>>>>>>((uint64_t)p_labelFstPairVector, (__int128 *)a3, (uint64_t *)__p);
    v11 = end + 32;
  }
  self->_labelFstPairVector.__end_ = v11;
  v12 = __p[0];
  __p[0] = 0;
  if (v12)
    (*(void (**)(void *))(*(_QWORD *)v12 + 8))(v12);
  CMDPFst::~CMDPFst(v7);
  MEMORY[0x22E2FB328](v13);
}

- (void)addOptionalFstWithLabel
{
  CMDPFst *v3;
  void *v4;
  _QWORD *end;
  void *v6;
  void *v7;
  void *__p[2];
  char v9;
  void *v10[2];
  char v11;
  CMDPFst *v12;

  v3 = (CMDPFst *)operator new();
  CMDPFst::CMDPFst(v3, 1);
  v12 = v3;
  CMDPFst::setStart(v3, 0);
  std::string::basic_string[abi:ne180100]<0>(v10, "<eps>");
  std::string::basic_string[abi:ne180100]<0>(__p, "<eps>");
  CMDPFst::addArc((uint64_t)v3, 0, 1, (uint64_t)v10, (uint64_t)__p, 0.0);
  if (v9 < 0)
    operator delete(__p[0]);
  if (v11 < 0)
    operator delete(v10[0]);
  CMDPFst::setFinal(v3, 1, 0.0);
  CMDPFst::setSymbols(v3);
  std::string::basic_string[abi:ne180100]<0>(v10, (char *)kCMDPReplaceOptionalLabel);
  std::__tree<std::string>::__emplace_unique_key_args<std::string,std::string>((uint64_t **)&self->_special_symbol_set, (const void **)v10, (uint64_t)v10);
  if (v11 < 0)
    operator delete(v10[0]);
  v4 = (void *)*((_QWORD *)v3 + 1);
  *((_QWORD *)v3 + 1) = 0;
  v10[0] = v4;
  end = self->_labelFstPairVector.__end_;
  if (end >= self->_labelFstPairVector.__end_cap_.__value_)
  {
    v6 = (void *)std::vector<std::pair<std::string,std::unique_ptr<fst::VectorFst<fst::ArcTpl<fst::TropicalWeightTpl<float>>,fst::VectorState<fst::ArcTpl<fst::TropicalWeightTpl<float>>,std::allocator<fst::ArcTpl<fst::TropicalWeightTpl<float>>>>>>>>::__emplace_back_slow_path<char const*&,std::unique_ptr<fst::VectorFst<fst::ArcTpl<fst::TropicalWeightTpl<float>>,fst::VectorState<fst::ArcTpl<fst::TropicalWeightTpl<float>>,std::allocator<fst::ArcTpl<fst::TropicalWeightTpl<float>>>>>>>((uint64_t *)&self->_labelFstPairVector, (char **)&kCMDPReplaceOptionalLabel, (uint64_t *)v10);
    v7 = v10[0];
    self->_labelFstPairVector.__end_ = v6;
    v10[0] = 0;
    if (v7)
      (*(void (**)(void *))(*(_QWORD *)v7 + 8))(v7);
  }
  else
  {
    std::string::basic_string[abi:ne180100]<0>((_QWORD *)self->_labelFstPairVector.__end_, (char *)kCMDPReplaceOptionalLabel);
    end[3] = v4;
    self->_labelFstPairVector.__end_ = end + 4;
  }
  CMDPFst::~CMDPFst(v3);
  MEMORY[0x22E2FB328]();
}

- (void).cxx_destruct
{
  void *value;
  vector<std::pair<std::string, std::unique_ptr<fst::VectorFst<fst::ArcTpl<fst::TropicalWeightTpl<float>>>>>, std::allocator<std::pair<std::string, std::unique_ptr<fst::VectorFst<fst::ArcTpl<fst::TropicalWeightTpl<float>>>>>>> *p_labelFstPairVector;

  std::__tree<std::string>::destroy((uint64_t)&self->_special_symbol_set, (char *)self->_special_symbol_set.__tree_.__pair1_.__value_.__left_);
  std::__tree<std::string>::destroy((uint64_t)&self->_symbol_set, (char *)self->_symbol_set.__tree_.__pair1_.__value_.__left_);
  objc_storeStrong((id *)&self->_grammarDataArray, 0);
  objc_storeStrong((id *)&self->_currentCommandIdentifier, 0);
  objc_storeStrong((id *)&self->_currentBuiltInLMString, 0);
  std::unique_ptr<CMDPNormalizer>::reset[abi:ne180100](&self->_normalizer.__ptr_.__value_, 0);
  p_labelFstPairVector = &self->_labelFstPairVector;
  std::vector<std::pair<std::string,std::unique_ptr<fst::VectorFst<fst::ArcTpl<fst::TropicalWeightTpl<float>>,fst::VectorState<fst::ArcTpl<fst::TropicalWeightTpl<float>>,std::allocator<fst::ArcTpl<fst::TropicalWeightTpl<float>>>>>>>>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_labelFstPairVector);
  value = self->_grammarFst.__ptr_.__value_;
  self->_grammarFst.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(void *))(*(_QWORD *)value + 8))(value);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 13) = 0;
  *((_QWORD *)self + 3) = 0;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 56) = 0u;
  *((_QWORD *)self + 12) = (char *)self + 104;
  *((_QWORD *)self + 17) = 0;
  *((_QWORD *)self + 16) = 0;
  *((_QWORD *)self + 14) = 0;
  *((_QWORD *)self + 15) = (char *)self + 128;
  return self;
}

@end
