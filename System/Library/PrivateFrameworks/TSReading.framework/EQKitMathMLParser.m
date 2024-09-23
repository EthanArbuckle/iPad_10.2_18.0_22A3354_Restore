@implementation EQKitMathMLParser

- (EQKitMathMLParser)init
{
  return -[EQKitMathMLParser initWithDocument:node:source:environment:](self, "initWithDocument:node:source:environment:", 0, 0, 0, 0);
}

- (EQKitMathMLParser)initWithDocument:(_xmlDoc *)a3 node:(_xmlNode *)a4 source:(id)a5 environment:(id)a6
{
  _xmlNode *RootElement;
  EQKitMathMLParser *v12;
  EQKitMathMLParser *v13;
  objc_super v15;

  RootElement = a4;
  if (!a3)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EQKitMathMLParser.mm"), 84, CFSTR("document should not be NULL"));
    if (RootElement)
      goto LABEL_4;
    goto LABEL_8;
  }
  if (!a4)
  {
    RootElement = xmlDocGetRootElement(a3);
    if (!RootElement)
LABEL_8:
      objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EQKitMathMLParser.mm"), 90, CFSTR("node should not be NULL"));
  }
LABEL_4:
  v15.receiver = self;
  v15.super_class = (Class)EQKitMathMLParser;
  v12 = -[EQKitMathMLParser init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->mRootNode = RootElement;
    v12->mNS = xmlSearchNsByHref(a3, RootElement, (const xmlChar *)"http://www.w3.org/1998/Math/MathML");
    v13->mEnvironment = (EQKitEnvironmentInstance *)a6;
    v13->mSource = (NSData *)a5;
  }
  return v13;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EQKitMathMLParser;
  -[EQKitMathMLParser dealloc](&v3, sel_dealloc);
}

- (void)attributeCollection
{
  return self->mAttributeCollection;
}

- (void)setAttributeCollection:(void *)a3
{
  self->mAttributeCollection = a3;
}

- (id)environment
{
  return self->mEnvironment;
}

- (void)reportError:(int64_t)a3 withNode:(_xmlNode *)a4
{
  id v7;
  const xmlChar *name;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;

  if (!self->mError)
  {
    v7 = objc_alloc(MEMORY[0x24BDD17C8]);
    name = (const xmlChar *)"";
    if (a4 && a4->name)
      name = a4->name;
    v9 = (void *)objc_msgSend(v7, "initWithUTF8String:", name);
    v10 = (void *)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    if ((unint64_t)a3 <= 6
      && (v11 = objc_msgSend(v10, "localizedStringForKey:value:table:", off_24D828C58[a3], &stru_24D82FEB0, 0)) != 0)
    {
      v12 = (void *)MEMORY[0x24BDBCE70];
      v13 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v11, v9);
      v14 = objc_msgSend(v12, "dictionaryWithObjectsAndKeys:", v13, *MEMORY[0x24BDD0FC8], 0);
    }
    else
    {
      v14 = 0;
    }

    self->mError = (NSError *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("EQKitErrorDomain"), a3, v14);
  }
}

- (id)parse
{
  id v3;
  EQKitEquation *v4;

  if (EQKitXMLIsNamedElement(self->mRootNode, self->mNS, "math"))
  {
    v3 = -[EQKitMathMLMath initFromXMLNode:parser:]([EQKitMathMLMath alloc], "initFromXMLNode:parser:", self->mRootNode, self);
    -[EQKitMathMLParser parseAttributesForNode:withXMLNode:](self, "parseAttributesForNode:withXMLNode:", v3, self->mRootNode);
    if (v3 && !self->mError)
      v4 = -[EQKitEquation initWithRoot:source:]([EQKitEquation alloc], "initWithRoot:source:", v3, self->mSource);
    else
      v4 = 0;

  }
  else
  {
    -[EQKitMathMLParser reportError:withNode:](self, "reportError:withNode:", 1, self->mRootNode);
    return 0;
  }
  return v4;
}

- (id)parseChildrenAsArrayFromXMLNode:(_xmlNode *)a3
{
  void *v5;
  _xmlNode *i;
  id v7;

  v5 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  if (a3)
  {
    for (i = a3->children; i; i = i->next)
    {
      if (EQKitXMLIsElement((_BOOL8)i))
      {
        v7 = -[EQKitMathMLParser parseNode:](self, "parseNode:", i);
        if (!v7)
          return 0;
        objc_msgSend(v5, "addObject:", v7);
      }
    }
  }
  return v5;
}

- (id)parseChildrenAsNodeFromXMLNode:(_xmlNode *)a3
{
  id result;
  id v4;
  EQKitMathMLMRow *v5;

  result = -[EQKitMathMLParser parseChildrenAsArrayFromXMLNode:](self, "parseChildrenAsArrayFromXMLNode:", a3);
  if (result)
  {
    v4 = result;
    if (objc_msgSend(result, "count") == 1)
      v5 = (EQKitMathMLMRow *)(id)objc_msgSend(v4, "objectAtIndex:", 0);
    else
      v5 = -[EQKitMathMLMRow initWithChildren:]([EQKitMathMLMRow alloc], "initWithChildren:", v4);
    return v5;
  }
  return result;
}

- (void)parseAttributesForNode:(id)a3 withXMLNode:(_xmlNode *)a4
{
  uint64_t v7;
  _xmlAttr *properties;
  uint64_t v9;
  int *v10;
  xmlNs *ns;
  BOOL v12;
  int v13;
  uint64_t v14;
  int *v15;
  int v16;
  BOOL v17;
  uint64_t *v18;
  uint64_t v19;
  int *v20;
  int v21;
  BOOL v22;
  uint64_t *v23;
  uint64_t v24;
  int *v25;
  int v26;
  BOOL v27;
  uint64_t *v28;
  uint64_t v29;
  int *v30;
  int v31;
  BOOL v32;
  uint64_t *v33;
  uint64_t v34;
  int *v35;
  int v36;
  BOOL v37;
  uint64_t *v38;
  uint64_t v39;
  int *v40;
  int v41;
  BOOL v42;
  uint64_t *v43;
  std::string::size_type v44;
  CGColorRef CGColorFromString;
  CGColor *v46;
  uint64_t **v47;
  _OWORD *v48;
  int v49;
  uint64_t **v50;
  _OWORD *v51;
  uint64_t **mAttributeCollection;
  std::string *p_str;
  uint64_t v54;
  uint64_t **v55;
  uint64_t **v56;
  _OWORD *v57;
  int v58;
  uint64_t **v59;
  _OWORD *v60;
  void *v61;
  uint64_t **v62;
  uint64_t **v63;
  uint64_t **v64;
  uint64_t **v65;
  uint64_t **v66;
  uint64_t **v67;
  uint64_t v68;
  uint64_t **v69;
  uint64_t **v70;
  uint64_t **v71;
  uint64_t **v72;
  uint64_t **v73;
  id v74;
  std::string *v75;
  void *v76;
  uint64_t v77;
  uint64_t **v78;
  std::string *v80;
  uint64_t **v81;
  uint64_t **v82;
  uint64_t **v83;
  float v84;
  uint64_t **v85;
  uint64_t **v86;
  void *v87;
  uint64_t **v88;
  _OWORD *v89;
  _BOOL4 v90;
  uint64_t **v91;
  _OWORD *v92;
  std::string::size_type size;
  int data;
  int v96;
  double v98;
  uint64_t **v99;
  _OWORD *v100;
  uint64_t v101;
  void *v102;
  void *v103;
  float v104;
  void *__p[2];
  uint64_t v106;
  _BYTE v107[48];
  void *v108;
  char v109;
  uint64_t v110;
  std::string v111;
  std::string __str;
  __int128 v113;
  _OWORD *v114[3];

  v7 = objc_msgSend(a3, "mathMLAttributes");
  properties = a4->properties;
  if (properties)
  {
    v9 = v7;
    v10 = (int *)(v7 + 8);
    v102 = *(void **)(MEMORY[0x24BEDB7F8] + 24);
    v103 = (void *)*MEMORY[0x24BEDB7F8];
    do
    {
      ns = properties->ns;
      if (ns)
        v12 = ns == a4->ns;
      else
        v12 = 1;
      if (!v12 || !self->mAttributeCollection)
        goto LABEL_98;
      std::string::basic_string[abi:nn180100]<0>(__p, (char *)properties->name);
      v13 = EQKitTypes::Attributes::attributeFromMathMLString((const void **)__p, 0);
      if (SHIBYTE(v106) < 0)
        operator delete(__p[0]);
      if (v13 != 1 || !v9)
        goto LABEL_35;
      v14 = *(_QWORD *)v10;
      if (!*(_QWORD *)v10)
        goto LABEL_98;
      v15 = v10;
      do
      {
        v16 = *(_DWORD *)(v14 + 28);
        v17 = v16 < 2;
        if (v16 >= 2)
          v18 = (uint64_t *)v14;
        else
          v18 = (uint64_t *)(v14 + 8);
        if (!v17)
          v15 = (int *)v14;
        v14 = *v18;
      }
      while (*v18);
      if (v15 != v10 && v15[7] < 3)
      {
        v13 = 2;
      }
      else
      {
        if (v13 != 10 || !v9)
          goto LABEL_48;
LABEL_35:
        v19 = *(_QWORD *)v10;
        if (!*(_QWORD *)v10)
          goto LABEL_98;
        v20 = v10;
        do
        {
          v21 = *(_DWORD *)(v19 + 28);
          v22 = v21 < 32;
          if (v21 >= 32)
            v23 = (uint64_t *)v19;
          else
            v23 = (uint64_t *)(v19 + 8);
          if (!v22)
            v20 = (int *)v19;
          v19 = *v23;
        }
        while (*v23);
        if (v20 != v10 && v20[7] < 33)
        {
          v13 = 32;
        }
        else
        {
          if (v13 != 26 || !v9)
            goto LABEL_61;
LABEL_48:
          v24 = *(_QWORD *)v10;
          if (!*(_QWORD *)v10)
            goto LABEL_98;
          v25 = v10;
          do
          {
            v26 = *(_DWORD *)(v24 + 28);
            v27 = v26 < 29;
            if (v26 >= 29)
              v28 = (uint64_t *)v24;
            else
              v28 = (uint64_t *)(v24 + 8);
            if (!v27)
              v25 = (int *)v24;
            v24 = *v28;
          }
          while (*v28);
          if (v25 != v10 && v25[7] < 30)
          {
            v13 = 29;
          }
          else
          {
            if (v13 != 27 || !v9)
              goto LABEL_64;
LABEL_61:
            v29 = *(_QWORD *)v10;
            if (!*(_QWORD *)v10)
              goto LABEL_98;
            v30 = v10;
            do
            {
              v31 = *(_DWORD *)(v29 + 28);
              v32 = v31 < 30;
              if (v31 >= 30)
                v33 = (uint64_t *)v29;
              else
                v33 = (uint64_t *)(v29 + 8);
              if (!v32)
                v30 = (int *)v29;
              v29 = *v33;
            }
            while (*v33);
            if (v30 != v10 && v30[7] < 31)
            {
              v13 = 30;
            }
            else
            {
LABEL_64:
              if (v13 == 28 && v9)
              {
                v34 = *(_QWORD *)v10;
                if (!*(_QWORD *)v10)
                  goto LABEL_98;
                v35 = v10;
                do
                {
                  v36 = *(_DWORD *)(v34 + 28);
                  v37 = v36 < 31;
                  if (v36 >= 31)
                    v38 = (uint64_t *)v34;
                  else
                    v38 = (uint64_t *)(v34 + 8);
                  if (!v37)
                    v35 = (int *)v34;
                  v34 = *v38;
                }
                while (*v38);
                if (v35 == v10)
                {
                  v13 = 28;
                  goto LABEL_78;
                }
                if (v35[7] <= 31)
                  v13 = 31;
                else
                  v13 = 28;
              }
              if (!v9)
                goto LABEL_88;
            }
          }
        }
      }
LABEL_78:
      v39 = *(_QWORD *)v10;
      if (*(_QWORD *)v10)
      {
        v40 = v10;
        do
        {
          v41 = *(_DWORD *)(v39 + 28);
          v42 = v41 < v13;
          if (v41 >= v13)
            v43 = (uint64_t *)v39;
          else
            v43 = (uint64_t *)(v39 + 8);
          if (!v42)
            v40 = (int *)v39;
          v39 = *v43;
        }
        while (*v43);
        if (v40 != v10 && v13 >= v40[7])
        {
          EQKitXMLAttributeValueAsString(a4, properties, &__str);
          switch(v13)
          {
            case 1:
            case 24:
            case 25:
              v49 = EQKitTypes::Align::alignFromMathMLString((const void **)&__str.__r_.__value_.__l.__data_, 0);
              if (!v49)
                goto LABEL_96;
              mAttributeCollection = (uint64_t **)self->mAttributeCollection;
              __p[0] = a3;
              LODWORD(__p[1]) = v13;
              *(_QWORD *)&v113 = __p;
              v51 = std::__tree<std::__value_type<std::pair<objc_object  {objcproto15EQKitLayoutNode}*,EQKitTypes::Attributes::Enum>,objc_object  {objcproto15EQKitLayoutNode}*::Align::Enum>,std::__map_value_compare<EQKitTypes::Attributes::Enum,objc_object  {objcproto15EQKitLayoutNode}*::Align::Enum,std::less<EQKitTypes::Attributes::Enum>,true>,std::allocator<objc_object  {objcproto15EQKitLayoutNode}*::Align::Enum>>::__emplace_unique_key_args<EQKitTypes::Attributes::Enum,std::piecewise_construct_t const&,std::tuple<EQKitTypes::Attributes::Enum const&>,std::piecewise_construct_t const&<>>(mAttributeCollection + 16, (unint64_t *)__p, (uint64_t)&std::piecewise_construct, (_OWORD **)&v113);
              goto LABEL_109;
            case 2:
              v58 = EQKitTypes::VAlign::vAlignFromMathMLString((const void **)&__str.__r_.__value_.__l.__data_, 0);
              if (!v58)
                goto LABEL_96;
              v59 = (uint64_t **)self->mAttributeCollection;
              __p[0] = a3;
              LODWORD(__p[1]) = 2;
              *(_QWORD *)&v113 = __p;
              v60 = std::__tree<std::__value_type<std::pair<objc_object  {objcproto15EQKitLayoutNode}*,EQKitTypes::Attributes::Enum>,objc_object  {objcproto15EQKitLayoutNode}*::Align::Enum>,std::__map_value_compare<EQKitTypes::Attributes::Enum,objc_object  {objcproto15EQKitLayoutNode}*::Align::Enum,std::less<EQKitTypes::Attributes::Enum>,true>,std::allocator<objc_object  {objcproto15EQKitLayoutNode}*::Align::Enum>>::__emplace_unique_key_args<EQKitTypes::Attributes::Enum,std::piecewise_construct_t const&,std::tuple<EQKitTypes::Attributes::Enum const&>,std::piecewise_construct_t const&<>>(v59 + 19, (unint64_t *)__p, (uint64_t)&std::piecewise_construct, (_OWORD **)&v113);
              goto LABEL_165;
            case 3:
              EQKitTypes::VAlign::vAlignVectorFromMathMLString(&__str, (char **)__p);
              v61 = __p[1];
              if (__p[1] == __p[0])
                goto LABEL_176;
              v62 = (uint64_t **)self->mAttributeCollection;
              *(_QWORD *)&v113 = a3;
              DWORD2(v113) = 3;
              EQKit::AttributeCollection::setValueForKey<std::vector<EQKitTypes::VAlign::Enum>>((uint64_t)v62, v62 + 31, (uint64_t)__p, &v113);
              goto LABEL_175;
            case 4:
              EQKitTypes::Align::alignVectorFromMathMLString(&__str, (char **)__p);
              v61 = __p[1];
              if (__p[1] == __p[0])
                goto LABEL_176;
              v63 = (uint64_t **)self->mAttributeCollection;
              *(_QWORD *)&v113 = a3;
              DWORD2(v113) = 4;
              EQKit::AttributeCollection::setValueForKey<std::vector<EQKitTypes::VAlign::Enum>>((uint64_t)v63, v63 + 34, (uint64_t)__p, &v113);
              goto LABEL_175;
            case 5:
            case 6:
            case 8:
            case 14:
            case 16:
            case 39:
            case 45:
              v49 = EQKitTypes::Boolean::BOOLeanFromMathMLString((const void **)&__str.__r_.__value_.__l.__data_, 0);
              if (!v49)
                goto LABEL_96;
              v50 = (uint64_t **)self->mAttributeCollection;
              __p[0] = a3;
              LODWORD(__p[1]) = v13;
              *(_QWORD *)&v113 = __p;
              v51 = std::__tree<std::__value_type<std::pair<objc_object  {objcproto15EQKitLayoutNode}*,EQKitTypes::Attributes::Enum>,objc_object  {objcproto15EQKitLayoutNode}*::Align::Enum>,std::__map_value_compare<EQKitTypes::Attributes::Enum,objc_object  {objcproto15EQKitLayoutNode}*::Align::Enum,std::less<EQKitTypes::Attributes::Enum>,true>,std::allocator<objc_object  {objcproto15EQKitLayoutNode}*::Align::Enum>>::__emplace_unique_key_args<EQKitTypes::Attributes::Enum,std::piecewise_construct_t const&,std::tuple<EQKitTypes::Attributes::Enum const&>,std::piecewise_construct_t const&<>>(v50 + 1, (unint64_t *)__p, (uint64_t)&std::piecewise_construct, (_OWORD **)&v113);
LABEL_109:
              *((_DWORD *)v51 + 12) = v49;
              goto LABEL_96;
            case 7:
              v58 = EQKitTypes::Display::displayFromMathMLString((const void **)&__str.__r_.__value_.__l.__data_, 0);
              if (!v58)
                goto LABEL_96;
              v64 = (uint64_t **)self->mAttributeCollection;
              __p[0] = a3;
              LODWORD(__p[1]) = 7;
              *(_QWORD *)&v113 = __p;
              v60 = std::__tree<std::__value_type<std::pair<objc_object  {objcproto15EQKitLayoutNode}*,EQKitTypes::Attributes::Enum>,objc_object  {objcproto15EQKitLayoutNode}*::Align::Enum>,std::__map_value_compare<EQKitTypes::Attributes::Enum,objc_object  {objcproto15EQKitLayoutNode}*::Align::Enum,std::less<EQKitTypes::Attributes::Enum>,true>,std::allocator<objc_object  {objcproto15EQKitLayoutNode}*::Align::Enum>>::__emplace_unique_key_args<EQKitTypes::Attributes::Enum,std::piecewise_construct_t const&,std::tuple<EQKitTypes::Attributes::Enum const&>,std::piecewise_construct_t const&<>>(v64 + 40, (unint64_t *)__p, (uint64_t)&std::piecewise_construct, (_OWORD **)&v113);
              goto LABEL_165;
            case 9:
              *(_QWORD *)&v113 = 0;
              BYTE8(v113) = 1;
              if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
                std::string::__init_copy_ctor_external(&v111, __str.__r_.__value_.__l.__data_, __str.__r_.__value_.__l.__size_);
              else
                v111 = __str;
              v90 = EQKit::ScriptLevel::fromString(&v111, (uint64_t)&v113);
              if (SHIBYTE(v111.__r_.__value_.__r.__words[2]) < 0)
                operator delete(v111.__r_.__value_.__l.__data_);
              if (v90)
              {
                v91 = (uint64_t **)self->mAttributeCollection;
                __p[0] = a3;
                LODWORD(__p[1]) = 9;
                v114[0] = __p;
                v92 = std::__tree<std::__value_type<std::pair<objc_object  {objcproto15EQKitLayoutNode}*,EQKitTypes::Attributes::Enum>,EQKit::ScriptLevel>,std::__map_value_compare<EQKitTypes::Attributes::Enum,EQKit::ScriptLevel,std::less<EQKitTypes::Attributes::Enum>,true>,std::allocator<EQKit::ScriptLevel>>::__emplace_unique_key_args<EQKitTypes::Attributes::Enum,std::piecewise_construct_t const&,std::tuple<EQKitTypes::Attributes::Enum const&>,std::piecewise_construct_t const&<>>(v91 + 37, (unint64_t *)__p, (uint64_t)&std::piecewise_construct, v114);
                *((_QWORD *)v92 + 6) = v113;
                *((_BYTE *)v92 + 56) = BYTE8(v113);
              }
              goto LABEL_96;
            case 10:
            case 11:
            case 26:
            case 27:
            case 28:
            case 40:
            case 41:
            case 43:
              EQKitLength::EQKitLength(&v113, &__str, 0);
              if ((_DWORD)v113)
              {
                v47 = (uint64_t **)self->mAttributeCollection;
                __p[0] = a3;
                LODWORD(__p[1]) = v13;
                v114[0] = __p;
                v48 = std::__tree<std::__value_type<std::pair<objc_object  {objcproto15EQKitLayoutNode}*,EQKitTypes::Attributes::Enum>,EQKitLength>,std::__map_value_compare<EQKitTypes::Attributes::Enum,EQKitLength,std::less<EQKitTypes::Attributes::Enum>,true>,std::allocator<EQKitLength>>::__emplace_unique_key_args<EQKitTypes::Attributes::Enum,std::piecewise_construct_t const&,std::tuple<EQKitTypes::Attributes::Enum const&>,std::piecewise_construct_t const&<>>(v47 + 4, (unint64_t *)__p, (uint64_t)&std::piecewise_construct, v114);
                v48[3] = v113;
                goto LABEL_96;
              }
              if (v13 != 41)
                goto LABEL_96;
              if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
              {
                if (__str.__r_.__value_.__l.__size_ != 8)
                  goto LABEL_96;
                p_str = (std::string *)__str.__r_.__value_.__r.__words[0];
              }
              else
              {
                if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) != 8)
                  goto LABEL_96;
                p_str = &__str;
              }
              if (p_str->__r_.__value_.__r.__words[0] == 0x7974696E69666E69)
              {
                v88 = (uint64_t **)self->mAttributeCollection;
                __p[0] = a3;
                LODWORD(__p[1]) = 41;
                v114[0] = __p;
                v89 = std::__tree<std::__value_type<std::pair<objc_object  {objcproto15EQKitLayoutNode}*,EQKitTypes::Attributes::Enum>,EQKitLength>,std::__map_value_compare<EQKitTypes::Attributes::Enum,EQKitLength,std::less<EQKitTypes::Attributes::Enum>,true>,std::allocator<EQKitLength>>::__emplace_unique_key_args<EQKitTypes::Attributes::Enum,std::piecewise_construct_t const&,std::tuple<EQKitTypes::Attributes::Enum const&>,std::piecewise_construct_t const&<>>(v88 + 4, (unint64_t *)__p, (uint64_t)&std::piecewise_construct, v114);
                *((_DWORD *)v89 + 12) = 1;
                *((_QWORD *)v89 + 7) = 0x7FEFFFFFFFFFFFFFLL;
              }
              goto LABEL_96;
            case 12:
            case 13:
            case 18:
            case 19:
              EQKit::AttributeCollection::setValueForKey((uint64_t)self->mAttributeCollection, &__str, v13, (unint64_t)a3);
              goto LABEL_96;
            case 15:
              v58 = EQKit::Config::Operator::formFromMathMLString((const void **)&__str.__r_.__value_.__l.__data_, 0);
              if (!v58)
                goto LABEL_96;
              v65 = (uint64_t **)self->mAttributeCollection;
              __p[0] = a3;
              LODWORD(__p[1]) = 15;
              *(_QWORD *)&v113 = __p;
              v60 = std::__tree<std::__value_type<std::pair<objc_object  {objcproto15EQKitLayoutNode}*,EQKitTypes::Attributes::Enum>,objc_object  {objcproto15EQKitLayoutNode}*::Align::Enum>,std::__map_value_compare<EQKitTypes::Attributes::Enum,objc_object  {objcproto15EQKitLayoutNode}*::Align::Enum,std::less<EQKitTypes::Attributes::Enum>,true>,std::allocator<objc_object  {objcproto15EQKitLayoutNode}*::Align::Enum>>::__emplace_unique_key_args<EQKitTypes::Attributes::Enum,std::piecewise_construct_t const&,std::tuple<EQKitTypes::Attributes::Enum const&>,std::piecewise_construct_t const&<>>(v65 + 43, (unint64_t *)__p, (uint64_t)&std::piecewise_construct, (_OWORD **)&v113);
              goto LABEL_165;
            case 17:
              v58 = EQKit::Script::variantFromMathMLString((const void **)&__str.__r_.__value_.__l.__data_, 0);
              if (!v58)
                goto LABEL_96;
              v66 = (uint64_t **)self->mAttributeCollection;
              __p[0] = a3;
              LODWORD(__p[1]) = 17;
              *(_QWORD *)&v113 = __p;
              v60 = std::__tree<std::__value_type<std::pair<objc_object  {objcproto15EQKitLayoutNode}*,EQKitTypes::Attributes::Enum>,objc_object  {objcproto15EQKitLayoutNode}*::Align::Enum>,std::__map_value_compare<EQKitTypes::Attributes::Enum,objc_object  {objcproto15EQKitLayoutNode}*::Align::Enum,std::less<EQKitTypes::Attributes::Enum>,true>,std::allocator<objc_object  {objcproto15EQKitLayoutNode}*::Align::Enum>>::__emplace_unique_key_args<EQKitTypes::Attributes::Enum,std::piecewise_construct_t const&,std::tuple<EQKitTypes::Attributes::Enum const&>,std::piecewise_construct_t const&<>>(v66 + 46, (unint64_t *)__p, (uint64_t)&std::piecewise_construct, (_OWORD **)&v113);
              goto LABEL_165;
            case 20:
              EQKitTypes::Strings::separatorsFromString((uint64_t *)&__str, (char **)__p);
              v67 = (uint64_t **)self->mAttributeCollection;
              *(_QWORD *)&v113 = a3;
              DWORD2(v113) = 20;
              EQKit::AttributeCollection::setValueForKey<std::vector<std::string>>((uint64_t)v67, v67 + 13, (uint64_t)__p, &v113);
              *(_QWORD *)&v113 = __p;
              std::vector<std::string>::__destroy_vector::operator()[abi:nn180100]((void ***)&v113);
              goto LABEL_96;
            case 21:
            case 22:
              LOBYTE(v104) = 0;
              v54 = EQKitTypes::Integer::integerFromMathMLString(&__str, (BOOL *)&v104);
              if (LOBYTE(v104))
              {
                v55 = (uint64_t **)self->mAttributeCollection;
                __p[0] = a3;
                LODWORD(__p[1]) = v13;
                *(_QWORD *)&v113 = __p;
                *((_QWORD *)std::__tree<std::__value_type<std::pair<objc_object  {objcproto15EQKitLayoutNode}*,EQKitTypes::Attributes::Enum>,double>,std::__map_value_compare<EQKitTypes::Attributes::Enum,std::pair<objc_object  {objcproto15EQKitLayoutNode}*,EQKitTypes::Attributes::Enum>,std::less<EQKitTypes::Attributes::Enum>,true>,std::allocator<std::pair<objc_object  {objcproto15EQKitLayoutNode}*,EQKitTypes::Attributes::Enum>>>::__emplace_unique_key_args<EQKitTypes::Attributes::Enum,std::piecewise_construct_t const&,std::tuple<EQKitTypes::Attributes::Enum const&>,std::piecewise_construct_t const&<>>(v55 + 49, (unint64_t *)__p, (uint64_t)&std::piecewise_construct, (_OWORD **)&v113)+ 6) = v54;
              }
              goto LABEL_96;
            case 23:
              LOBYTE(v104) = 0;
              v68 = EQKitTypes::UInteger::uIntegerFromMathMLString(&__str, (BOOL *)&v104);
              if (LOBYTE(v104))
              {
                v69 = (uint64_t **)self->mAttributeCollection;
                __p[0] = a3;
                LODWORD(__p[1]) = 23;
                *(_QWORD *)&v113 = __p;
                *((_QWORD *)std::__tree<std::__value_type<std::pair<objc_object  {objcproto15EQKitLayoutNode}*,EQKitTypes::Attributes::Enum>,double>,std::__map_value_compare<EQKitTypes::Attributes::Enum,std::pair<objc_object  {objcproto15EQKitLayoutNode}*,EQKitTypes::Attributes::Enum>,std::less<EQKitTypes::Attributes::Enum>,true>,std::allocator<std::pair<objc_object  {objcproto15EQKitLayoutNode}*,EQKitTypes::Attributes::Enum>>>::__emplace_unique_key_args<EQKitTypes::Attributes::Enum,std::piecewise_construct_t const&,std::tuple<EQKitTypes::Attributes::Enum const&>,std::piecewise_construct_t const&<>>(v69 + 52, (unint64_t *)__p, (uint64_t)&std::piecewise_construct, (_OWORD **)&v113)+ 6) = v68;
              }
              goto LABEL_96;
            case 29:
              EQKitPseudoUnitLength::EQKitPseudoUnitLength(__p, &__str, 1);
              if (!LODWORD(__p[0]))
                goto LABEL_96;
              v70 = (uint64_t **)self->mAttributeCollection;
              *(_QWORD *)&v113 = a3;
              DWORD2(v113) = 29;
              v114[0] = &v113;
              v57 = std::__tree<std::__value_type<std::pair<objc_object  {objcproto15EQKitLayoutNode}*,EQKitTypes::Attributes::Enum>,EQKitPseudoUnitLength>,std::__map_value_compare<EQKitTypes::Attributes::Enum,EQKitPseudoUnitLength,std::less<EQKitTypes::Attributes::Enum>,true>,std::allocator<EQKitPseudoUnitLength>>::__emplace_unique_key_args<EQKitTypes::Attributes::Enum,std::piecewise_construct_t const&,std::tuple<EQKitTypes::Attributes::Enum const&>,std::piecewise_construct_t const&<>>(v70 + 58, (unint64_t *)&v113, (uint64_t)&std::piecewise_construct, v114);
              goto LABEL_141;
            case 30:
              EQKitPseudoUnitLength::EQKitPseudoUnitLength(__p, &__str, 2);
              if (!LODWORD(__p[0]))
                goto LABEL_96;
              v71 = (uint64_t **)self->mAttributeCollection;
              *(_QWORD *)&v113 = a3;
              DWORD2(v113) = 30;
              v114[0] = &v113;
              v57 = std::__tree<std::__value_type<std::pair<objc_object  {objcproto15EQKitLayoutNode}*,EQKitTypes::Attributes::Enum>,EQKitPseudoUnitLength>,std::__map_value_compare<EQKitTypes::Attributes::Enum,EQKitPseudoUnitLength,std::less<EQKitTypes::Attributes::Enum>,true>,std::allocator<EQKitPseudoUnitLength>>::__emplace_unique_key_args<EQKitTypes::Attributes::Enum,std::piecewise_construct_t const&,std::tuple<EQKitTypes::Attributes::Enum const&>,std::piecewise_construct_t const&<>>(v71 + 58, (unint64_t *)&v113, (uint64_t)&std::piecewise_construct, v114);
              goto LABEL_141;
            case 31:
              EQKitPseudoUnitLength::EQKitPseudoUnitLength(__p, &__str, 3);
              if (!LODWORD(__p[0]))
                goto LABEL_96;
              v72 = (uint64_t **)self->mAttributeCollection;
              *(_QWORD *)&v113 = a3;
              DWORD2(v113) = 31;
              v114[0] = &v113;
              v57 = std::__tree<std::__value_type<std::pair<objc_object  {objcproto15EQKitLayoutNode}*,EQKitTypes::Attributes::Enum>,EQKitPseudoUnitLength>,std::__map_value_compare<EQKitTypes::Attributes::Enum,EQKitPseudoUnitLength,std::less<EQKitTypes::Attributes::Enum>,true>,std::allocator<EQKitPseudoUnitLength>>::__emplace_unique_key_args<EQKitTypes::Attributes::Enum,std::piecewise_construct_t const&,std::tuple<EQKitTypes::Attributes::Enum const&>,std::piecewise_construct_t const&<>>(v72 + 58, (unint64_t *)&v113, (uint64_t)&std::piecewise_construct, v114);
              goto LABEL_141;
            case 32:
            case 33:
              EQKitPseudoUnitLength::EQKitPseudoUnitLength(__p, &__str, 0);
              if (!LODWORD(__p[0]))
                goto LABEL_96;
              v56 = (uint64_t **)self->mAttributeCollection;
              *(_QWORD *)&v113 = a3;
              DWORD2(v113) = v13;
              v114[0] = &v113;
              v57 = std::__tree<std::__value_type<std::pair<objc_object  {objcproto15EQKitLayoutNode}*,EQKitTypes::Attributes::Enum>,EQKitPseudoUnitLength>,std::__map_value_compare<EQKitTypes::Attributes::Enum,EQKitPseudoUnitLength,std::less<EQKitTypes::Attributes::Enum>,true>,std::allocator<EQKitPseudoUnitLength>>::__emplace_unique_key_args<EQKitTypes::Attributes::Enum,std::piecewise_construct_t const&,std::tuple<EQKitTypes::Attributes::Enum const&>,std::piecewise_construct_t const&<>>(v56 + 58, (unint64_t *)&v113, (uint64_t)&std::piecewise_construct, v114);
LABEL_141:
              v57[3] = *(_OWORD *)__p;
              *((_QWORD *)v57 + 8) = v106;
              goto LABEL_96;
            case 34:
              EQKitTypes::Crossout::crossoutVectorFromMathMLString(&__str, (char **)__p);
              v61 = __p[1];
              if (__p[1] == __p[0])
                goto LABEL_176;
              v73 = (uint64_t **)self->mAttributeCollection;
              *(_QWORD *)&v113 = a3;
              DWORD2(v113) = 34;
              EQKit::AttributeCollection::setValueForKey<std::vector<EQKitTypes::VAlign::Enum>>((uint64_t)v73, v73 + 25, (uint64_t)__p, &v113);
              goto LABEL_175;
            case 35:
              v74 = objc_alloc(MEMORY[0x24BDD17C8]);
              if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                v75 = &__str;
              else
                v75 = (std::string *)__str.__r_.__value_.__r.__words[0];
              v76 = (void *)objc_msgSend(v74, "initWithUTF8String:", v75);
              if (objc_msgSend(v76, "length") == 1)
              {
                v77 = objc_msgSend(v76, "characterAtIndex:", 0);
                if ((objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet"), "characterIsMember:", v77) & 1) == 0)
                {
                  v78 = (uint64_t **)self->mAttributeCollection;
                  __p[0] = a3;
                  LODWORD(__p[1]) = 35;
                  *(_QWORD *)&v113 = __p;
                  *((_WORD *)std::__tree<std::__value_type<std::pair<objc_object  {objcproto15EQKitLayoutNode}*,EQKitTypes::Attributes::Enum>,unsigned short>,std::__map_value_compare<EQKitTypes::Attributes::Enum,std::pair<objc_object  {objcproto15EQKitLayoutNode}*,EQKitTypes::Attributes::Enum>,std::less<EQKitTypes::Attributes::Enum>,true>,std::allocator<std::pair<objc_object  {objcproto15EQKitLayoutNode}*,EQKitTypes::Attributes::Enum>>>::__emplace_unique_key_args<EQKitTypes::Attributes::Enum,std::piecewise_construct_t const&,std::tuple<EQKitTypes::Attributes::Enum const&>,std::piecewise_construct_t const&<>>(v78 + 61, (unint64_t *)__p, (uint64_t)&std::piecewise_construct, (_OWORD **)&v113)+ 24) = v77;
                }
              }

              goto LABEL_96;
            case 36:
              if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
              {
                size = __str.__r_.__value_.__l.__size_;
                if (__str.__r_.__value_.__l.__size_ == 4 && *(_DWORD *)__str.__r_.__value_.__l.__data_ == 1852401780)
                {
LABEL_205:
                  v101 = 0x500000005;
                  v98 = 0.5;
                  goto LABEL_209;
                }
                if (__str.__r_.__value_.__l.__size_ == 6)
                {
                  if (*(_DWORD *)__str.__r_.__value_.__l.__data_ == 1768187245
                    && *(_WORD *)(__str.__r_.__value_.__r.__words[0] + 4) == 28021)
                  {
                    goto LABEL_208;
                  }
                  size = __str.__r_.__value_.__l.__size_;
                }
                if (size != 5)
                {
LABEL_206:
                  EQKitLength::EQKitLength(__p, &__str, 5);
                  if (!LODWORD(__p[0]))
                    goto LABEL_96;
                  v101 = (uint64_t)__p[0];
                  v98 = *(double *)&__p[1];
                  goto LABEL_209;
                }
                v80 = (std::string *)__str.__r_.__value_.__r.__words[0];
              }
              else
              {
                if (HIBYTE(__str.__r_.__value_.__r.__words[2]) == 4)
                {
                  if (LODWORD(__str.__r_.__value_.__l.__data_) == 1852401780)
                    goto LABEL_205;
                  goto LABEL_206;
                }
                if (HIBYTE(__str.__r_.__value_.__r.__words[2]) != 5)
                {
                  if (HIBYTE(__str.__r_.__value_.__r.__words[2]) != 6)
                    goto LABEL_206;
                  if (LODWORD(__str.__r_.__value_.__l.__data_) != 1768187245
                    || WORD2(__str.__r_.__value_.__r.__words[0]) != 28021)
                  {
                    goto LABEL_206;
                  }
LABEL_208:
                  v101 = 0x500000005;
                  v98 = 1.0;
LABEL_209:
                  v99 = (uint64_t **)self->mAttributeCollection;
                  __p[0] = a3;
                  LODWORD(__p[1]) = 36;
                  *(_QWORD *)&v113 = __p;
                  v100 = std::__tree<std::__value_type<std::pair<objc_object  {objcproto15EQKitLayoutNode}*,EQKitTypes::Attributes::Enum>,EQKitLength>,std::__map_value_compare<EQKitTypes::Attributes::Enum,EQKitLength,std::less<EQKitTypes::Attributes::Enum>,true>,std::allocator<EQKitLength>>::__emplace_unique_key_args<EQKitTypes::Attributes::Enum,std::piecewise_construct_t const&,std::tuple<EQKitTypes::Attributes::Enum const&>,std::piecewise_construct_t const&<>>(v99 + 4, (unint64_t *)__p, (uint64_t)&std::piecewise_construct, (_OWORD **)&v113);
                  *((_QWORD *)v100 + 6) = v101;
                  *((double *)v100 + 7) = v98;
LABEL_96:
                  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
                    operator delete(__str.__r_.__value_.__l.__data_);
                  goto LABEL_98;
                }
                v80 = &__str;
              }
              data = (int)v80->__r_.__value_.__l.__data_;
              v96 = v80->__r_.__value_.__s.__data_[4];
              if (data == 1667852404 && v96 == 107)
              {
                v101 = 0x500000005;
                v98 = 2.0;
                goto LABEL_209;
              }
              goto LABEL_206;
            case 37:
              v58 = EQKitTypes::GroupAlign::groupAlignFromMathMLString((const void **)&__str.__r_.__value_.__l.__data_, 0);
              if (!v58)
                goto LABEL_96;
              v81 = (uint64_t **)self->mAttributeCollection;
              __p[0] = a3;
              LODWORD(__p[1]) = 37;
              *(_QWORD *)&v113 = __p;
              v60 = std::__tree<std::__value_type<std::pair<objc_object  {objcproto15EQKitLayoutNode}*,EQKitTypes::Attributes::Enum>,objc_object  {objcproto15EQKitLayoutNode}*::Align::Enum>,std::__map_value_compare<EQKitTypes::Attributes::Enum,objc_object  {objcproto15EQKitLayoutNode}*::Align::Enum,std::less<EQKitTypes::Attributes::Enum>,true>,std::allocator<objc_object  {objcproto15EQKitLayoutNode}*::Align::Enum>>::__emplace_unique_key_args<EQKitTypes::Attributes::Enum,std::piecewise_construct_t const&,std::tuple<EQKitTypes::Attributes::Enum const&>,std::piecewise_construct_t const&<>>(v81 + 22, (unint64_t *)__p, (uint64_t)&std::piecewise_construct, (_OWORD **)&v113);
              goto LABEL_165;
            case 38:
              v58 = EQKitTypes::Edge::edgeFromMathMLString((const void **)&__str.__r_.__value_.__l.__data_, 0);
              if (!v58)
                goto LABEL_96;
              v82 = (uint64_t **)self->mAttributeCollection;
              __p[0] = a3;
              LODWORD(__p[1]) = 38;
              *(_QWORD *)&v113 = __p;
              v60 = std::__tree<std::__value_type<std::pair<objc_object  {objcproto15EQKitLayoutNode}*,EQKitTypes::Attributes::Enum>,objc_object  {objcproto15EQKitLayoutNode}*::Align::Enum>,std::__map_value_compare<EQKitTypes::Attributes::Enum,objc_object  {objcproto15EQKitLayoutNode}*::Align::Enum,std::less<EQKitTypes::Attributes::Enum>,true>,std::allocator<objc_object  {objcproto15EQKitLayoutNode}*::Align::Enum>>::__emplace_unique_key_args<EQKitTypes::Attributes::Enum,std::piecewise_construct_t const&,std::tuple<EQKitTypes::Attributes::Enum const&>,std::piecewise_construct_t const&<>>(v82 + 64, (unint64_t *)__p, (uint64_t)&std::piecewise_construct, (_OWORD **)&v113);
LABEL_165:
              *((_DWORD *)v60 + 12) = v58;
              goto LABEL_96;
            case 42:
              std::istringstream::basic_istringstream[abi:nn180100](__p, &__str, 8);
              v104 = 0.0;
              MEMORY[0x219A152BC](__p, &v104);
              if ((*(_DWORD *)&v107[*((_QWORD *)__p[0] - 3)] & 7) == 2)
              {
                v83 = (uint64_t **)self->mAttributeCollection;
                v84 = v104;
                *(_QWORD *)&v113 = a3;
                DWORD2(v113) = 42;
                v114[0] = &v113;
                *((double *)std::__tree<std::__value_type<std::pair<objc_object  {objcproto15EQKitLayoutNode}*,EQKitTypes::Attributes::Enum>,double>,std::__map_value_compare<EQKitTypes::Attributes::Enum,std::pair<objc_object  {objcproto15EQKitLayoutNode}*,EQKitTypes::Attributes::Enum>,std::less<EQKitTypes::Attributes::Enum>,true>,std::allocator<std::pair<objc_object  {objcproto15EQKitLayoutNode}*,EQKitTypes::Attributes::Enum>>>::__emplace_unique_key_args<EQKitTypes::Attributes::Enum,std::piecewise_construct_t const&,std::tuple<EQKitTypes::Attributes::Enum const&>,std::piecewise_construct_t const&<>>(v83 + 55, (unint64_t *)&v113, (uint64_t)&std::piecewise_construct, v114)+ 6) = v84;
              }
              __p[0] = v103;
              *(void **)((char *)__p + *((_QWORD *)v103 - 3)) = v102;
              v106 = MEMORY[0x24BEDB848] + 16;
              if (v109 < 0)
                operator delete(v108);
              std::streambuf::~streambuf();
              std::istream::~istream();
              MEMORY[0x219A1537C](&v110);
              goto LABEL_96;
            case 44:
              goto LABEL_90;
            case 46:
              __p[0] = 0;
              __p[1] = 0;
              v106 = 0;
              if (EQKitLength::lengthVectorFromString(&__str, (uint64_t)__p))
              {
                v85 = (uint64_t **)self->mAttributeCollection;
                *(_QWORD *)&v113 = a3;
                DWORD2(v113) = 46;
                EQKit::AttributeCollection::setValueForKey<std::vector<EQKitLength>>((uint64_t)v85, v85 + 7, (uint64_t)__p, &v113);
              }
              goto LABEL_175;
            case 47:
              EQKitTypes::Notation::notationVectorFromMathMLString(&__str, (char **)__p);
              v61 = __p[1];
              if (__p[1] == __p[0])
                goto LABEL_176;
              v86 = (uint64_t **)self->mAttributeCollection;
              *(_QWORD *)&v113 = a3;
              DWORD2(v113) = 47;
              EQKit::AttributeCollection::setValueForKey<std::vector<EQKitTypes::VAlign::Enum>>((uint64_t)v86, v86 + 28, (uint64_t)__p, &v113);
LABEL_175:
              v61 = __p[0];
LABEL_176:
              if (v61)
              {
                __p[1] = v61;
                operator delete(v61);
              }
              goto LABEL_96;
            case 48:
              v87 = (void *)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
              objc_msgSend(v87, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[EQKitMathMLParser parseAttributesForNode:withXMLNode:]"), CFSTR("EQKitMathMLParser.mm"), 648, CFSTR("attribute parsing for %s (%d) is not implemented"), properties->name, 48);
              goto LABEL_96;
            default:
              goto LABEL_96;
          }
        }
      }
LABEL_88:
      if (v13 == 44)
      {
        EQKitXMLAttributeValueAsString(a4, properties, &__str);
LABEL_90:
        v44 = HIBYTE(__str.__r_.__value_.__r.__words[2]);
        if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
          v44 = __str.__r_.__value_.__l.__size_;
        if (v44)
        {
          CGColorFromString = EQKitMathMLParserCreateCGColorFromString((uint64_t)&__str);
          v46 = CGColorFromString;
          if (CGColorFromString)
          {
            __p[0] = (void *)CFRetain(CGColorFromString);
            EQKit::AttributeCollection::setValueForKey((uint64_t)self->mAttributeCollection, (CFTypeRef *)__p, 44, (unint64_t)a3);
            CGColorRelease(v46);
            if (__p[0])
              CFRelease(__p[0]);
          }
        }
        goto LABEL_96;
      }
LABEL_98:
      properties = properties->next;
    }
    while (properties);
  }
}

- (id)parseChildrenAsTokenContentFromXMLNode:(_xmlNode *)a3
{
  _xmlNode *v3;
  _xmlNode *children;
  id v6;
  id v7;
  std::string *v8;
  std::string::size_type v9;
  EQKitMathMLTokenContent *v10;
  void *v11;
  EQKitMathMLTokenContent *v12;
  std::string __p;
  char v15;
  char v16;
  std::string v17;
  id v18;

  v3 = a3;
  v18 = 0;
  memset(&v17, 0, sizeof(v17));
  v16 = 0;
  v15 = 1;
  if (!a3)
    goto LABEL_20;
  children = a3->children;
  if (!children)
  {
LABEL_18:
    LODWORD(v3) = 0;
    goto LABEL_20;
  }
  while (1)
  {
    if (!EQKitXMLIsElement((_BOOL8)children))
    {
      if (xmlNodeIsText(children))
      {
        v16 = 1;
        EQKitXMLTextContentAsString(children, 0, &__p);
        v8 = (__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
           ? &__p
           : (std::string *)__p.__r_.__value_.__r.__words[0];
        v9 = (__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
           ? HIBYTE(__p.__r_.__value_.__r.__words[2])
           : __p.__r_.__value_.__l.__size_;
        std::string::append(&v17, (const std::string::value_type *)v8, v9);
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
          operator delete(__p.__r_.__value_.__l.__data_);
      }
      goto LABEL_17;
    }
    _contentAppendStringIfNeeded((uint64_t)&v18, &v17, &v16, &v15, 0);
    -[EQKitMathMLParser pushState:](self, "pushState:", 1);
    v6 = -[EQKitMathMLParser parseNode:](self, "parseNode:", v3);
    -[EQKitMathMLParser popState](self, "popState");
    if (!v6)
      break;
    v7 = v18;
    if (!v18)
    {
      v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v18 = v7;
    }
    objc_msgSend(v7, "addObject:", v6);

LABEL_17:
    children = children->next;
    if (!children)
      goto LABEL_18;
  }
  LODWORD(v3) = 1;
LABEL_20:
  _contentAppendStringIfNeeded((uint64_t)&v18, &v17, &v16, &v15, 1);
  if ((_DWORD)v3)
  {
    v10 = 0;
    v11 = v18;
  }
  else
  {
    v12 = [EQKitMathMLTokenContent alloc];
    v11 = v18;
    v10 = -[EQKitMathMLTokenContent initWithChildren:](v12, "initWithChildren:", v18);
  }

  if (SHIBYTE(v17.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v17.__r_.__value_.__l.__data_);
  return v10;
}

- (id)parseNode:(_xmlNode *)a3
{
  char *name;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __objc2_class **v10;
  id v11;
  void *__p[2];
  char v13;

  if (!EQKitXMLIsNsElement((_BOOL8)a3, self->mNS))
    goto LABEL_10;
  name = (char *)a3->name;
  if (!name)
    goto LABEL_10;
  std::string::basic_string[abi:nn180100]<0>(__p, name);
  v6 = EQKitMathMLElement::fromString((const void **)__p);
  if (v13 < 0)
    operator delete(__p[0]);
  if (!-[EQKitMathMLParser isElement:allowedInState:](self, "isElement:allowedInState:", v6, -[EQKitMathMLParser state](self, "state")))
  {
    v7 = 3;
    goto LABEL_9;
  }
  if ((v6 - 40) < 0x88)
  {
    v7 = 6;
LABEL_9:
    -[EQKitMathMLParser reportError:withNode:](self, "reportError:withNode:", v7, a3);
    goto LABEL_10;
  }
  v10 = off_24D8262E0;
  switch((int)v6)
  {
    case 1:
      break;
    case 2:
      v10 = off_24D8262F8;
      break;
    case 3:
      v10 = off_24D826300;
      break;
    case 4:
      v10 = off_24D826328;
      break;
    case 5:
      v10 = off_24D8263E0;
      break;
    case 6:
      v10 = off_24D8262A8;
      break;
    case 7:
      v10 = off_24D8262D8;
      break;
    case 8:
      v10 = off_24D826318;
      break;
    case 9:
      v10 = off_24D826380;
      break;
    case 10:
      v10 = off_24D826390;
      break;
    case 11:
      v10 = off_24D826388;
      break;
    case 12:
      v10 = off_24D8262D0;
      break;
    case 13:
      v10 = off_24D826378;
      break;
    case 14:
      v10 = off_24D8263B8;
      break;
    case 15:
      v10 = off_24D826308;
      break;
    case 16:
      v10 = off_24D8263C0;
      break;
    case 17:
      v10 = off_24D826340;
      break;
    case 18:
      v10 = off_24D826358;
      break;
    case 19:
      v10 = off_24D826368;
      break;
    case 20:
      v10 = off_24D826360;
      break;
    case 21:
      v10 = off_24D826348;
      break;
    case 22:
      v10 = off_24D826350;
      break;
    case 23:
      v10 = off_24D8262F0;
      break;
    case 24:
      v10 = off_24D826398;
      break;
    case 25:
      v10 = off_24D8263B0;
      break;
    case 26:
      v10 = off_24D8262E8;
      break;
    case 27:
      v10 = off_24D8263A0;
      break;
    case 28:
      v10 = off_24D826320;
      break;
    case 29:
      v10 = off_24D826338;
      break;
    case 30:
      v10 = off_24D8263D0;
      break;
    case 32:
      v10 = off_24D826370;
      break;
    case 33:
      v10 = off_24D8263A8;
      break;
    case 34:
      v10 = off_24D8262B0;
      break;
    case 35:
      v10 = off_24D826330;
      break;
    case 36:
      v10 = off_24D8262C8;
      break;
    case 37:
      v10 = off_24D826310;
      break;
    case 38:
      v10 = off_24D8262B8;
      break;
    case 39:
      v10 = off_24D8262C0;
      break;
    default:
      v7 = 2;
      goto LABEL_9;
  }
  v11 = (id)objc_msgSend(objc_alloc(*v10), "initFromXMLNode:parser:", a3, self);
  if (v11)
  {
    v8 = v11;
    -[EQKitMathMLParser parseAttributesForNode:withXMLNode:](self, "parseAttributesForNode:withXMLNode:", v11, a3);
    return v8;
  }
LABEL_10:
  -[EQKitMathMLParser reportError:withNode:](self, "reportError:withNode:", 4, a3);
  return 0;
}

- (void)pushState:(int)a3
{
  int v3;

  v3 = a3;
  std::deque<EQKitMathMLParserState>::push_back(&self->mState.c.__map_.__first_, &v3);
}

- (void)popState
{
  unint64_t value;

  value = self->mState.c.__size_.__value_;
  if (value)
  {
    self->mState.c.__size_.__value_ = value - 1;
    std::deque<EQKitMathMLParserState>::__maybe_remove_back_spare[abi:nn180100](&self->mState.c.__map_.__first_, 1);
  }
}

- (int)state
{
  unint64_t value;

  value = self->mState.c.__size_.__value_;
  if (value)
    return (*(int **)((char *)self->mState.c.__map_.__begin_
                    + (((value + self->mState.c.__start_ - 1) >> 7) & 0x1FFFFFFFFFFFFF8)))[(value
                                                                                            + self->mState.c.__start_
                                                                                            - 1) & 0x3FF];
  else
    return 0;
}

- (BOOL)isElement:(int)a3 allowedInState:(int)a4
{
  BOOL v4;
  BOOL result;
  BOOL v6;

  switch(a4)
  {
    case 0:
      v4 = __CFADD__(a3 - 28, 3);
      return !v4;
    case 1:
      v6 = a3 == 31 || a3 == 39;
      goto LABEL_12;
    case 2:
      v4 = (a3 - 25) >= 2;
      return !v4;
    case 3:
      v6 = a3 == 27;
LABEL_12:
      result = v6;
      break;
    default:
      result = 1;
      break;
  }
  return result;
}

- (_xmlNs)ns
{
  return self->mNS;
}

- (NSError)error
{
  return self->mError;
}

- (void).cxx_destruct
{
  std::deque<EQKitMathMLParserState>::~deque[abi:nn180100](&self->mState.c.__map_.__first_);
}

- (id).cxx_construct
{
  *((_OWORD *)self + 4) = 0u;
  *((_OWORD *)self + 5) = 0u;
  *((_OWORD *)self + 3) = 0u;
  return self;
}

@end
