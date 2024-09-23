@implementation RWIProtocolDOMStyleable

- (RWIProtocolDOMStyleable)initWithNodeId:(int)a3
{
  uint64_t v3;
  RWIProtocolDOMStyleable *v4;
  RWIProtocolDOMStyleable *v5;
  RWIProtocolDOMStyleable *v6;
  objc_super v8;

  v3 = *(_QWORD *)&a3;
  v8.receiver = self;
  v8.super_class = (Class)RWIProtocolDOMStyleable;
  v4 = -[RWIProtocolJSONObject init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    -[RWIProtocolDOMStyleable setNodeId:](v4, "setNodeId:", v3);
    v6 = v5;
  }

  return v5;
}

- (void)setNodeId:(int)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMStyleable;
  -[RWIProtocolJSONObject setInteger:forKey:](&v3, sel_setInteger_forKey_, *(_QWORD *)&a3, CFSTR("nodeId"));
}

- (int)nodeId
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMStyleable;
  return -[RWIProtocolJSONObject integerForKey:](&v3, sel_integerForKey_, CFSTR("nodeId"));
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
  v6.super_class = (Class)RWIProtocolDOMStyleable;
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
  v9.super_class = (Class)RWIProtocolDOMStyleable;
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

@end
