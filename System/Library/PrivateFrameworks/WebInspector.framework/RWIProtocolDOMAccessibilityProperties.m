@implementation RWIProtocolDOMAccessibilityProperties

- (RWIProtocolDOMAccessibilityProperties)initWithExists:(BOOL)a3 label:(id)a4 nodeId:(int)a5 role:(id)a6
{
  uint64_t v7;
  _BOOL8 v8;
  id v10;
  id v11;
  RWIProtocolDOMAccessibilityProperties *v12;
  RWIProtocolDOMAccessibilityProperties *v13;
  objc_super v15;

  v7 = *(_QWORD *)&a5;
  v8 = a3;
  v10 = a4;
  v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)RWIProtocolDOMAccessibilityProperties;
  v12 = -[RWIProtocolJSONObject init](&v15, sel_init);
  if (v12)
  {
    if (!v10)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required property '%@' cannot be nil"), CFSTR("label"));
    if (!v11)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required property '%@' cannot be nil"), CFSTR("role"));
    -[RWIProtocolDOMAccessibilityProperties setExists:](v12, "setExists:", v8);
    -[RWIProtocolDOMAccessibilityProperties setLabel:](v12, "setLabel:", v10);
    -[RWIProtocolDOMAccessibilityProperties setNodeId:](v12, "setNodeId:", v7);
    -[RWIProtocolDOMAccessibilityProperties setRole:](v12, "setRole:", v11);
    v13 = v12;
  }

  return v12;
}

- (void)setActiveDescendantNodeId:(int)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMAccessibilityProperties;
  -[RWIProtocolJSONObject setInteger:forKey:](&v3, sel_setInteger_forKey_, *(_QWORD *)&a3, CFSTR("activeDescendantNodeId"));
}

- (int)activeDescendantNodeId
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMAccessibilityProperties;
  return -[RWIProtocolJSONObject integerForKey:](&v3, sel_integerForKey_, CFSTR("activeDescendantNodeId"));
}

- (void)setBusy:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMAccessibilityProperties;
  -[RWIProtocolJSONObject setBool:forKey:](&v3, sel_setBool_forKey_, a3, CFSTR("busy"));
}

- (BOOL)busy
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMAccessibilityProperties;
  return -[RWIProtocolJSONObject BOOLForKey:](&v3, sel_BOOLForKey_, CFSTR("busy"));
}

- (void)setChecked:(int64_t)a3
{
  _DWORD *v4;
  __CFString *v5;
  objc_super v6;
  _DWORD *v7;

  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v4 = v7;
  if (v7)
    v5 = (__CFString *)(id)WTF::StringImpl::operator NSString *();
  else
    v5 = &stru_24DE03408;
  v6.receiver = self;
  v6.super_class = (Class)RWIProtocolDOMAccessibilityProperties;
  -[RWIProtocolJSONObject setString:forKey:](&v6, sel_setString_forKey_, v5, CFSTR("checked"));

  if (v4)
  {
    if (*v4 == 2)
      WTF::StringImpl::destroy();
    else
      *v4 -= 2;
  }
}

- (int64_t)checked
{
  id v2;
  unsigned __int8 *v3;
  unint64_t v4;
  uint64_t i;
  char *v6;
  _DWORD *v7;
  objc_super v9;
  uint64_t v10;

  v9.receiver = self;
  v9.super_class = (Class)RWIProtocolDOMAccessibilityProperties;
  v2 = -[RWIProtocolJSONObject stringForKey:](&v9, sel_stringForKey_, CFSTR("checked"));
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
  for (i = 0; i != 9; i += 3)
  {
    if (WTF::operator==(v3, v4, (unsigned __int8 *)(&Inspector::fromProtocolString<RWIProtocolDOMAccessibilityPropertiesChecked>(WTF::String const&)::mappings)[i], (uint64_t)(&Inspector::fromProtocolString<RWIProtocolDOMAccessibilityPropertiesChecked>(WTF::String const&)::mappings)[i + 1]))
    {
      goto LABEL_8;
    }
  }
  do
  {
    std::__throw_bad_optional_access[abi:sn180100]();
    __break(1u);
LABEL_8:
    ;
  }
  while (i == 9);
  v6 = (&Inspector::fromProtocolString<RWIProtocolDOMAccessibilityPropertiesChecked>(WTF::String const&)::mappings)[i + 2];
  v7 = (_DWORD *)v10;
  v10 = 0;
  if (v7)
  {
    if (*v7 == 2)
      WTF::StringImpl::destroy();
    else
      *v7 -= 2;
  }
  return (int64_t)v6;
}

- (void)setChildNodeIds:(id)a3
{
  _DWORD *v4;
  objc_super v5;
  _DWORD *v6;

  Inspector::toJSONIntegerArray((Inspector *)a3, (uint64_t *)&v6);
  v5.receiver = self;
  v5.super_class = (Class)RWIProtocolDOMAccessibilityProperties;
  -[RWIProtocolJSONObject setJSONArray:forKey:](&v5, sel_setJSONArray_forKey_, &v6, CFSTR("childNodeIds"));
  v4 = v6;
  v6 = 0;
  if (v4)
  {
    if (*v4 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*v4;
  }
}

- (NSArray)childNodeIds
{
  void *v2;
  WTF::JSONImpl::ArrayBase *v3;
  objc_super v5;
  WTF::JSONImpl::ArrayBase *v6;

  v5.receiver = self;
  v5.super_class = (Class)RWIProtocolDOMAccessibilityProperties;
  -[RWIProtocolJSONObject JSONArrayForKey:](&v5, sel_JSONArrayForKey_, CFSTR("childNodeIds"));
  Inspector::toObjCIntegerArray(&v6);
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

- (void)setControlledNodeIds:(id)a3
{
  _DWORD *v4;
  objc_super v5;
  _DWORD *v6;

  Inspector::toJSONIntegerArray((Inspector *)a3, (uint64_t *)&v6);
  v5.receiver = self;
  v5.super_class = (Class)RWIProtocolDOMAccessibilityProperties;
  -[RWIProtocolJSONObject setJSONArray:forKey:](&v5, sel_setJSONArray_forKey_, &v6, CFSTR("controlledNodeIds"));
  v4 = v6;
  v6 = 0;
  if (v4)
  {
    if (*v4 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*v4;
  }
}

- (NSArray)controlledNodeIds
{
  void *v2;
  WTF::JSONImpl::ArrayBase *v3;
  objc_super v5;
  WTF::JSONImpl::ArrayBase *v6;

  v5.receiver = self;
  v5.super_class = (Class)RWIProtocolDOMAccessibilityProperties;
  -[RWIProtocolJSONObject JSONArrayForKey:](&v5, sel_JSONArrayForKey_, CFSTR("controlledNodeIds"));
  Inspector::toObjCIntegerArray(&v6);
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

- (void)setCurrent:(int64_t)a3
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
  v6.super_class = (Class)RWIProtocolDOMAccessibilityProperties;
  -[RWIProtocolJSONObject setString:forKey:](&v6, sel_setString_forKey_, v4, CFSTR("current"));

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

- (int64_t)current
{
  id v2;
  unsigned __int8 *v3;
  unint64_t v4;
  uint64_t i;
  char *v6;
  _DWORD *v7;
  objc_super v9;
  uint64_t v10;

  v9.receiver = self;
  v9.super_class = (Class)RWIProtocolDOMAccessibilityProperties;
  v2 = -[RWIProtocolJSONObject stringForKey:](&v9, sel_stringForKey_, CFSTR("current"));
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
  for (i = 0; i != 21; i += 3)
  {
    if (WTF::operator==(v3, v4, (unsigned __int8 *)(&Inspector::fromProtocolString<RWIProtocolDOMAccessibilityPropertiesCurrent>(WTF::String const&)::mappings)[i], (uint64_t)(&Inspector::fromProtocolString<RWIProtocolDOMAccessibilityPropertiesCurrent>(WTF::String const&)::mappings)[i + 1]))
    {
      goto LABEL_8;
    }
  }
  do
  {
    std::__throw_bad_optional_access[abi:sn180100]();
    __break(1u);
LABEL_8:
    ;
  }
  while (i == 21);
  v6 = (&Inspector::fromProtocolString<RWIProtocolDOMAccessibilityPropertiesCurrent>(WTF::String const&)::mappings)[i + 2];
  v7 = (_DWORD *)v10;
  v10 = 0;
  if (v7)
  {
    if (*v7 == 2)
      WTF::StringImpl::destroy();
    else
      *v7 -= 2;
  }
  return (int64_t)v6;
}

- (void)setDisabled:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMAccessibilityProperties;
  -[RWIProtocolJSONObject setBool:forKey:](&v3, sel_setBool_forKey_, a3, CFSTR("disabled"));
}

- (BOOL)disabled
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMAccessibilityProperties;
  return -[RWIProtocolJSONObject BOOLForKey:](&v3, sel_BOOLForKey_, CFSTR("disabled"));
}

- (void)setHeadingLevel:(double)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMAccessibilityProperties;
  -[RWIProtocolJSONObject setDouble:forKey:](&v3, sel_setDouble_forKey_, CFSTR("headingLevel"), a3);
}

- (double)headingLevel
{
  double result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMAccessibilityProperties;
  -[RWIProtocolJSONObject doubleForKey:](&v3, sel_doubleForKey_, CFSTR("headingLevel"));
  return result;
}

- (void)setHierarchyLevel:(double)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMAccessibilityProperties;
  -[RWIProtocolJSONObject setDouble:forKey:](&v3, sel_setDouble_forKey_, CFSTR("hierarchyLevel"), a3);
}

- (double)hierarchyLevel
{
  double result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMAccessibilityProperties;
  -[RWIProtocolJSONObject doubleForKey:](&v3, sel_doubleForKey_, CFSTR("hierarchyLevel"));
  return result;
}

- (void)setIsPopUpButton:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMAccessibilityProperties;
  -[RWIProtocolJSONObject setBool:forKey:](&v3, sel_setBool_forKey_, a3, CFSTR("isPopUpButton"));
}

- (BOOL)isPopUpButton
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMAccessibilityProperties;
  return -[RWIProtocolJSONObject BOOLForKey:](&v3, sel_BOOLForKey_, CFSTR("isPopUpButton"));
}

- (void)setExists:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMAccessibilityProperties;
  -[RWIProtocolJSONObject setBool:forKey:](&v3, sel_setBool_forKey_, a3, CFSTR("exists"));
}

- (BOOL)exists
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMAccessibilityProperties;
  return -[RWIProtocolJSONObject BOOLForKey:](&v3, sel_BOOLForKey_, CFSTR("exists"));
}

- (void)setExpanded:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMAccessibilityProperties;
  -[RWIProtocolJSONObject setBool:forKey:](&v3, sel_setBool_forKey_, a3, CFSTR("expanded"));
}

- (BOOL)expanded
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMAccessibilityProperties;
  return -[RWIProtocolJSONObject BOOLForKey:](&v3, sel_BOOLForKey_, CFSTR("expanded"));
}

- (void)setFlowedNodeIds:(id)a3
{
  _DWORD *v4;
  objc_super v5;
  _DWORD *v6;

  Inspector::toJSONIntegerArray((Inspector *)a3, (uint64_t *)&v6);
  v5.receiver = self;
  v5.super_class = (Class)RWIProtocolDOMAccessibilityProperties;
  -[RWIProtocolJSONObject setJSONArray:forKey:](&v5, sel_setJSONArray_forKey_, &v6, CFSTR("flowedNodeIds"));
  v4 = v6;
  v6 = 0;
  if (v4)
  {
    if (*v4 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*v4;
  }
}

- (NSArray)flowedNodeIds
{
  void *v2;
  WTF::JSONImpl::ArrayBase *v3;
  objc_super v5;
  WTF::JSONImpl::ArrayBase *v6;

  v5.receiver = self;
  v5.super_class = (Class)RWIProtocolDOMAccessibilityProperties;
  -[RWIProtocolJSONObject JSONArrayForKey:](&v5, sel_JSONArrayForKey_, CFSTR("flowedNodeIds"));
  Inspector::toObjCIntegerArray(&v6);
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

- (void)setFocused:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMAccessibilityProperties;
  -[RWIProtocolJSONObject setBool:forKey:](&v3, sel_setBool_forKey_, a3, CFSTR("focused"));
}

- (BOOL)focused
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMAccessibilityProperties;
  return -[RWIProtocolJSONObject BOOLForKey:](&v3, sel_BOOLForKey_, CFSTR("focused"));
}

- (void)setIgnored:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMAccessibilityProperties;
  -[RWIProtocolJSONObject setBool:forKey:](&v3, sel_setBool_forKey_, a3, CFSTR("ignored"));
}

- (BOOL)ignored
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMAccessibilityProperties;
  return -[RWIProtocolJSONObject BOOLForKey:](&v3, sel_BOOLForKey_, CFSTR("ignored"));
}

- (void)setIgnoredByDefault:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMAccessibilityProperties;
  -[RWIProtocolJSONObject setBool:forKey:](&v3, sel_setBool_forKey_, a3, CFSTR("ignoredByDefault"));
}

- (BOOL)ignoredByDefault
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMAccessibilityProperties;
  return -[RWIProtocolJSONObject BOOLForKey:](&v3, sel_BOOLForKey_, CFSTR("ignoredByDefault"));
}

- (void)setInvalid:(int64_t)a3
{
  __asm { BR              X9 }
}

- (int64_t)invalid
{
  id v2;
  unsigned __int8 *v3;
  unint64_t v4;
  uint64_t i;
  char *v6;
  _DWORD *v7;
  objc_super v9;
  uint64_t v10;

  v9.receiver = self;
  v9.super_class = (Class)RWIProtocolDOMAccessibilityProperties;
  v2 = -[RWIProtocolJSONObject stringForKey:](&v9, sel_stringForKey_, CFSTR("invalid"));
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
  for (i = 0; i != 12; i += 3)
  {
    if (WTF::operator==(v3, v4, (unsigned __int8 *)(&Inspector::fromProtocolString<RWIProtocolDOMAccessibilityPropertiesInvalid>(WTF::String const&)::mappings)[i], (uint64_t)(&Inspector::fromProtocolString<RWIProtocolDOMAccessibilityPropertiesInvalid>(WTF::String const&)::mappings)[i + 1]))
    {
      goto LABEL_8;
    }
  }
  do
  {
    std::__throw_bad_optional_access[abi:sn180100]();
    __break(1u);
LABEL_8:
    ;
  }
  while (i == 12);
  v6 = (&Inspector::fromProtocolString<RWIProtocolDOMAccessibilityPropertiesInvalid>(WTF::String const&)::mappings)[i + 2];
  v7 = (_DWORD *)v10;
  v10 = 0;
  if (v7)
  {
    if (*v7 == 2)
      WTF::StringImpl::destroy();
    else
      *v7 -= 2;
  }
  return (int64_t)v6;
}

- (void)setHidden:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMAccessibilityProperties;
  -[RWIProtocolJSONObject setBool:forKey:](&v3, sel_setBool_forKey_, a3, CFSTR("hidden"));
}

- (BOOL)hidden
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMAccessibilityProperties;
  return -[RWIProtocolJSONObject BOOLForKey:](&v3, sel_BOOLForKey_, CFSTR("hidden"));
}

- (void)setLabel:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMAccessibilityProperties;
  -[RWIProtocolJSONObject setString:forKey:](&v3, sel_setString_forKey_, a3, CFSTR("label"));
}

- (NSString)label
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMAccessibilityProperties;
  -[RWIProtocolJSONObject stringForKey:](&v3, sel_stringForKey_, CFSTR("label"));
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setLiveRegionAtomic:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMAccessibilityProperties;
  -[RWIProtocolJSONObject setBool:forKey:](&v3, sel_setBool_forKey_, a3, CFSTR("liveRegionAtomic"));
}

- (BOOL)liveRegionAtomic
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMAccessibilityProperties;
  return -[RWIProtocolJSONObject BOOLForKey:](&v3, sel_BOOLForKey_, CFSTR("liveRegionAtomic"));
}

- (void)setLiveRegionRelevant:(id)a3
{
  _DWORD *v4;
  objc_super v5;
  _DWORD *v6;

  Inspector::toJSONStringArray((Inspector *)a3, (uint64_t *)&v6);
  v5.receiver = self;
  v5.super_class = (Class)RWIProtocolDOMAccessibilityProperties;
  -[RWIProtocolJSONObject setJSONArray:forKey:](&v5, sel_setJSONArray_forKey_, &v6, CFSTR("liveRegionRelevant"));
  v4 = v6;
  v6 = 0;
  if (v4)
  {
    if (*v4 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*v4;
  }
}

- (NSArray)liveRegionRelevant
{
  void *v2;
  WTF::JSONImpl::ArrayBase *v3;
  objc_super v5;
  WTF::JSONImpl::ArrayBase *v6;

  v5.receiver = self;
  v5.super_class = (Class)RWIProtocolDOMAccessibilityProperties;
  -[RWIProtocolJSONObject JSONArrayForKey:](&v5, sel_JSONArrayForKey_, CFSTR("liveRegionRelevant"));
  Inspector::toObjCStringArray(&v6);
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

- (void)setLiveRegionStatus:(int64_t)a3
{
  _DWORD *v4;
  __CFString *v5;
  objc_super v6;
  _DWORD *v7;

  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v4 = v7;
  if (v7)
    v5 = (__CFString *)(id)WTF::StringImpl::operator NSString *();
  else
    v5 = &stru_24DE03408;
  v6.receiver = self;
  v6.super_class = (Class)RWIProtocolDOMAccessibilityProperties;
  -[RWIProtocolJSONObject setString:forKey:](&v6, sel_setString_forKey_, v5, CFSTR("liveRegionStatus"));

  if (v4)
  {
    if (*v4 == 2)
      WTF::StringImpl::destroy();
    else
      *v4 -= 2;
  }
}

- (int64_t)liveRegionStatus
{
  id v2;
  unsigned __int8 *v3;
  unint64_t v4;
  uint64_t i;
  char *v6;
  _DWORD *v7;
  objc_super v9;
  uint64_t v10;

  v9.receiver = self;
  v9.super_class = (Class)RWIProtocolDOMAccessibilityProperties;
  v2 = -[RWIProtocolJSONObject stringForKey:](&v9, sel_stringForKey_, CFSTR("liveRegionStatus"));
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
  for (i = 0; i != 9; i += 3)
  {
    if (WTF::operator==(v3, v4, (unsigned __int8 *)(&Inspector::fromProtocolString<RWIProtocolDOMAccessibilityPropertiesLiveRegionStatus>(WTF::String const&)::mappings)[i], (uint64_t)(&Inspector::fromProtocolString<RWIProtocolDOMAccessibilityPropertiesLiveRegionStatus>(WTF::String const&)::mappings)[i + 1]))
    {
      goto LABEL_8;
    }
  }
  do
  {
    std::__throw_bad_optional_access[abi:sn180100]();
    __break(1u);
LABEL_8:
    ;
  }
  while (i == 9);
  v6 = (&Inspector::fromProtocolString<RWIProtocolDOMAccessibilityPropertiesLiveRegionStatus>(WTF::String const&)::mappings)[i + 2];
  v7 = (_DWORD *)v10;
  v10 = 0;
  if (v7)
  {
    if (*v7 == 2)
      WTF::StringImpl::destroy();
    else
      *v7 -= 2;
  }
  return (int64_t)v6;
}

- (void)setMouseEventNodeId:(int)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMAccessibilityProperties;
  -[RWIProtocolJSONObject setInteger:forKey:](&v3, sel_setInteger_forKey_, *(_QWORD *)&a3, CFSTR("mouseEventNodeId"));
}

- (int)mouseEventNodeId
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMAccessibilityProperties;
  return -[RWIProtocolJSONObject integerForKey:](&v3, sel_integerForKey_, CFSTR("mouseEventNodeId"));
}

- (void)setNodeId:(int)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMAccessibilityProperties;
  -[RWIProtocolJSONObject setInteger:forKey:](&v3, sel_setInteger_forKey_, *(_QWORD *)&a3, CFSTR("nodeId"));
}

- (int)nodeId
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMAccessibilityProperties;
  return -[RWIProtocolJSONObject integerForKey:](&v3, sel_integerForKey_, CFSTR("nodeId"));
}

- (void)setOwnedNodeIds:(id)a3
{
  _DWORD *v4;
  objc_super v5;
  _DWORD *v6;

  Inspector::toJSONIntegerArray((Inspector *)a3, (uint64_t *)&v6);
  v5.receiver = self;
  v5.super_class = (Class)RWIProtocolDOMAccessibilityProperties;
  -[RWIProtocolJSONObject setJSONArray:forKey:](&v5, sel_setJSONArray_forKey_, &v6, CFSTR("ownedNodeIds"));
  v4 = v6;
  v6 = 0;
  if (v4)
  {
    if (*v4 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*v4;
  }
}

- (NSArray)ownedNodeIds
{
  void *v2;
  WTF::JSONImpl::ArrayBase *v3;
  objc_super v5;
  WTF::JSONImpl::ArrayBase *v6;

  v5.receiver = self;
  v5.super_class = (Class)RWIProtocolDOMAccessibilityProperties;
  -[RWIProtocolJSONObject JSONArrayForKey:](&v5, sel_JSONArrayForKey_, CFSTR("ownedNodeIds"));
  Inspector::toObjCIntegerArray(&v6);
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

- (void)setParentNodeId:(int)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMAccessibilityProperties;
  -[RWIProtocolJSONObject setInteger:forKey:](&v3, sel_setInteger_forKey_, *(_QWORD *)&a3, CFSTR("parentNodeId"));
}

- (int)parentNodeId
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMAccessibilityProperties;
  return -[RWIProtocolJSONObject integerForKey:](&v3, sel_integerForKey_, CFSTR("parentNodeId"));
}

- (void)setPressed:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMAccessibilityProperties;
  -[RWIProtocolJSONObject setBool:forKey:](&v3, sel_setBool_forKey_, a3, CFSTR("pressed"));
}

- (BOOL)pressed
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMAccessibilityProperties;
  return -[RWIProtocolJSONObject BOOLForKey:](&v3, sel_BOOLForKey_, CFSTR("pressed"));
}

- (void)setReadonly:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMAccessibilityProperties;
  -[RWIProtocolJSONObject setBool:forKey:](&v3, sel_setBool_forKey_, a3, CFSTR("readonly"));
}

- (BOOL)readonly
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMAccessibilityProperties;
  return -[RWIProtocolJSONObject BOOLForKey:](&v3, sel_BOOLForKey_, CFSTR("readonly"));
}

- (void)setRequired:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMAccessibilityProperties;
  -[RWIProtocolJSONObject setBool:forKey:](&v3, sel_setBool_forKey_, a3, CFSTR("required"));
}

- (BOOL)required
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMAccessibilityProperties;
  return -[RWIProtocolJSONObject BOOLForKey:](&v3, sel_BOOLForKey_, CFSTR("required"));
}

- (void)setRole:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMAccessibilityProperties;
  -[RWIProtocolJSONObject setString:forKey:](&v3, sel_setString_forKey_, a3, CFSTR("role"));
}

- (NSString)role
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMAccessibilityProperties;
  -[RWIProtocolJSONObject stringForKey:](&v3, sel_stringForKey_, CFSTR("role"));
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setSelected:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMAccessibilityProperties;
  -[RWIProtocolJSONObject setBool:forKey:](&v3, sel_setBool_forKey_, a3, CFSTR("selected"));
}

- (BOOL)selected
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMAccessibilityProperties;
  return -[RWIProtocolJSONObject BOOLForKey:](&v3, sel_BOOLForKey_, CFSTR("selected"));
}

- (void)setSelectedChildNodeIds:(id)a3
{
  _DWORD *v4;
  objc_super v5;
  _DWORD *v6;

  Inspector::toJSONIntegerArray((Inspector *)a3, (uint64_t *)&v6);
  v5.receiver = self;
  v5.super_class = (Class)RWIProtocolDOMAccessibilityProperties;
  -[RWIProtocolJSONObject setJSONArray:forKey:](&v5, sel_setJSONArray_forKey_, &v6, CFSTR("selectedChildNodeIds"));
  v4 = v6;
  v6 = 0;
  if (v4)
  {
    if (*v4 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*v4;
  }
}

- (NSArray)selectedChildNodeIds
{
  void *v2;
  WTF::JSONImpl::ArrayBase *v3;
  objc_super v5;
  WTF::JSONImpl::ArrayBase *v6;

  v5.receiver = self;
  v5.super_class = (Class)RWIProtocolDOMAccessibilityProperties;
  -[RWIProtocolJSONObject JSONArrayForKey:](&v5, sel_JSONArrayForKey_, CFSTR("selectedChildNodeIds"));
  Inspector::toObjCIntegerArray(&v6);
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

- (void)setSwitchState:(int64_t)a3
{
  _DWORD *v4;
  __CFString *v5;
  objc_super v6;
  _DWORD *v7;

  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v4 = v7;
  if (v7)
    v5 = (__CFString *)(id)WTF::StringImpl::operator NSString *();
  else
    v5 = &stru_24DE03408;
  v6.receiver = self;
  v6.super_class = (Class)RWIProtocolDOMAccessibilityProperties;
  -[RWIProtocolJSONObject setString:forKey:](&v6, sel_setString_forKey_, v5, CFSTR("switchState"));

  if (v4)
  {
    if (*v4 == 2)
      WTF::StringImpl::destroy();
    else
      *v4 -= 2;
  }
}

- (int64_t)switchState
{
  id v2;
  unsigned __int8 *v3;
  unint64_t v4;
  uint64_t i;
  char *v6;
  _DWORD *v7;
  objc_super v9;
  uint64_t v10;

  v9.receiver = self;
  v9.super_class = (Class)RWIProtocolDOMAccessibilityProperties;
  v2 = -[RWIProtocolJSONObject stringForKey:](&v9, sel_stringForKey_, CFSTR("switchState"));
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
  for (i = 0; i != 6; i += 3)
  {
    if (WTF::operator==(v3, v4, (unsigned __int8 *)(&Inspector::fromProtocolString<RWIProtocolDOMAccessibilityPropertiesSwitchState>(WTF::String const&)::mappings)[i], (uint64_t)(&Inspector::fromProtocolString<RWIProtocolDOMAccessibilityPropertiesSwitchState>(WTF::String const&)::mappings)[i + 1]))
    {
      goto LABEL_8;
    }
  }
  do
  {
    std::__throw_bad_optional_access[abi:sn180100]();
    __break(1u);
LABEL_8:
    ;
  }
  while (i == 6);
  v6 = (&Inspector::fromProtocolString<RWIProtocolDOMAccessibilityPropertiesSwitchState>(WTF::String const&)::mappings)[i + 2];
  v7 = (_DWORD *)v10;
  v10 = 0;
  if (v7)
  {
    if (*v7 == 2)
      WTF::StringImpl::destroy();
    else
      *v7 -= 2;
  }
  return (int64_t)v6;
}

@end
