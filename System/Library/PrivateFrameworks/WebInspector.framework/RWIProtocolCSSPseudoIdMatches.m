@implementation RWIProtocolCSSPseudoIdMatches

- (RWIProtocolCSSPseudoIdMatches)initWithPseudoId:(int64_t)a3 matches:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  objc_class *v13;
  void *v14;
  RWIProtocolCSSPseudoIdMatches *v15;
  id v17;
  RWIProtocolCSSPseudoIdMatches *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  objc_super v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v17 = a4;
  v23.receiver = self;
  v23.super_class = (Class)RWIProtocolCSSPseudoIdMatches;
  v18 = -[RWIProtocolJSONObject init](&v23, sel_init);
  if (v18)
  {
    if (!v17)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required property '%@' cannot be nil"), CFSTR("matches"));
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v6 = v17;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v20;
      v9 = *MEMORY[0x24BDBCAB8];
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v20 != v8)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v12 = (void *)MEMORY[0x24BDBCE88];
            v13 = (objc_class *)objc_opt_class();
            NSStringFromClass(v13);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "raise:format:", v9, CFSTR("array should contain objects of type '%@', found bad value: %@"), v14, v11);

          }
        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      }
      while (v7);
    }

    -[RWIProtocolCSSPseudoIdMatches setPseudoId:](v18, "setPseudoId:", a3);
    -[RWIProtocolCSSPseudoIdMatches setMatches:](v18, "setMatches:", v6);
    v15 = v18;
  }

  return v18;
}

- (void)setPseudoId:(int64_t)a3
{
  __CFString *v4;
  _DWORD *v5;
  objc_super v6;
  _DWORD *v7;

  Inspector::toProtocolString(a3);
  if (v7)
    v4 = (__CFString *)(id)WTF::StringImpl::operator NSString *();
  else
    v4 = &stru_24DE03408;
  v6.receiver = self;
  v6.super_class = (Class)RWIProtocolCSSPseudoIdMatches;
  -[RWIProtocolJSONObject setString:forKey:](&v6, sel_setString_forKey_, v4, CFSTR("pseudoId"));

  v5 = v7;
  v7 = 0;
  if (v5)
  {
    if (*v5 == 2)
      WTF::StringImpl::destroy();
    else
      *v5 -= 2;
  }
}

- (int64_t)pseudoId
{
  id v2;
  unsigned __int8 *v3;
  unint64_t v4;
  int64_t result;
  int64_t v6;
  int64_t v7;
  _DWORD *v8;
  objc_super v9;
  uint64_t v10;
  unsigned __int8 *v11;
  uint64_t v12;
  char v13;
  char v14;

  v9.receiver = self;
  v9.super_class = (Class)RWIProtocolCSSPseudoIdMatches;
  v2 = -[RWIProtocolJSONObject stringForKey:](&v9, sel_stringForKey_, CFSTR("pseudoId"));
  MEMORY[0x2207574E0](&v10, v2);
  if (v10)
  {
    v3 = *(unsigned __int8 **)(v10 + 8);
    v4 = *(unsigned int *)(v10 + 4) | ((unint64_t)((*(_DWORD *)(v10 + 16) >> 2) & 1) << 32);
  }
  else
  {
    v3 = 0;
    v4 = 0x100000000;
  }
  v11 = v3;
  LODWORD(v12) = v4;
  BYTE4(v12) = BYTE4(v4);
  v13 = 1;
  v14 = 0;
  result = std::__lower_bound[abi:sn180100]<std::_ClassicAlgPolicy,std::pair<WTF::ComparableASCIISubsetLiteral<(WTF::ASCIISubset)0>,RWIProtocolCSSPseudoId> const*,std::pair<WTF::ComparableASCIISubsetLiteral<(WTF::ASCIISubset)0>,RWIProtocolCSSPseudoId> const*,WTF::ComparableStringView,std::__identity,RWIProtocolCSSPseudoId const* WTF::SortedArrayMap<std::pair<WTF::ComparableASCIISubsetLiteral<(WTF::ASCIISubset)0>,RWIProtocolCSSPseudoId>[22]>::tryGet<WTF::String>(WTF::String const&)::{lambda(WTF::String&,std::pair<WTF::ComparableASCIISubsetLiteral<(WTF::ASCIISubset)0>,RWIProtocolCSSPseudoId> const* &)#1}>((uint64_t)&Inspector::fromProtocolString<RWIProtocolCSSPseudoId>(WTF::String const&)::mappings, (uint64_t)&Inspector::fromProtocolString<RWIProtocolCSSStyleSheetOrigin>(WTF::String const&)::mappings);
  v6 = result;
  if ((char **)result == &Inspector::fromProtocolString<RWIProtocolCSSStyleSheetOrigin>(WTF::String const&)::mappings)
    goto LABEL_12;
  if (!v13)
  {
LABEL_13:
    __break(1u);
    return result;
  }
  if (!WTF::operator==(v11, v12, *(unsigned __int8 **)result, *(_QWORD *)(result + 8)))
  {
LABEL_12:
    result = std::__throw_bad_optional_access[abi:sn180100]();
    goto LABEL_13;
  }
  v7 = *(_QWORD *)(v6 + 16);
  v8 = (_DWORD *)v10;
  v10 = 0;
  if (v8)
  {
    if (*v8 == 2)
      WTF::StringImpl::destroy();
    else
      *v8 -= 2;
  }
  return v7;
}

- (void)setMatches:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  objc_class *v10;
  void *v11;
  _DWORD *v12;
  objc_super v14;
  _DWORD *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v17;
    v6 = *MEMORY[0x24BDBCAB8];
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v17 != v5)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v9 = (void *)MEMORY[0x24BDBCE88];
          v10 = (objc_class *)objc_opt_class();
          NSStringFromClass(v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "raise:format:", v6, CFSTR("array should contain objects of type '%@', found bad value: %@"), v11, v8);

        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v4);
  }

  Inspector::toJSONObjectArray((Inspector *)v3, (uint64_t *)&v15);
  v14.receiver = self;
  v14.super_class = (Class)RWIProtocolCSSPseudoIdMatches;
  -[RWIProtocolJSONObject setJSONArray:forKey:](&v14, sel_setJSONArray_forKey_, &v15, CFSTR("matches"));
  v12 = v15;
  v15 = 0;
  if (v12)
  {
    if (*v12 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*v12;
  }

}

- (NSArray)matches
{
  void *v2;
  WTF::JSONImpl::ArrayBase *v3;
  objc_super v5;
  WTF::JSONImpl::ArrayBase *v6;

  v5.receiver = self;
  v5.super_class = (Class)RWIProtocolCSSPseudoIdMatches;
  -[RWIProtocolJSONObject JSONArrayForKey:](&v5, sel_JSONArrayForKey_, CFSTR("matches"));
  Inspector::toObjCArray<RWIProtocolCSSRuleMatch>(&v6);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v6;
  v6 = 0;
  if (v3)
  {
    if (*(_DWORD *)v3 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*(_DWORD *)v3;
  }
  return (NSArray *)v2;
}

- (_DWORD)pseudoId
{
  if (*result == 2)
    return (_DWORD *)WTF::StringImpl::destroy();
  *result -= 2;
  return result;
}

@end
