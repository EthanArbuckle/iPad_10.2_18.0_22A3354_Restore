@implementation WebAccessibilityObjectWrapper

- (WebAccessibilityObjectWrapper)initWithAccessibilityObject:(void *)a3
{
  WebAccessibilityObjectWrapper *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WebAccessibilityObjectWrapper;
  result = -[WebAccessibilityObjectWrapperBase initWithAccessibilityObject:](&v4, sel_initWithAccessibilityObject_, a3);
  if (result)
  {
    result->m_accessibilityTraitsFromAncestor = -1;
    result->m_isAccessibilityElement = -1;
  }
  return result;
}

- (void)axBackingObject
{
  DefaultWeakPtrImpl *m_ptr;

  m_ptr = self->super.m_axObject.m_impl.m_ptr;
  if (m_ptr)
    return (void *)*((_QWORD *)m_ptr + 1);
  else
    return 0;
}

- (void)detach
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WebAccessibilityObjectWrapper;
  -[WebAccessibilityObjectWrapperBase detach](&v3, sel_detach);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[WebAccessibilityObjectWrapper _accessibilityUnregister](self, "_accessibilityUnregister");
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)WebAccessibilityObjectWrapper;
  -[WebAccessibilityObjectWrapper dealloc](&v2, sel_dealloc);
}

- (unint64_t)_axLinkTrait
{
  return 1;
}

- (unint64_t)_axVisitedTrait
{
  return 2;
}

- (unint64_t)_axHeaderTrait
{
  return 4;
}

- (unint64_t)_axWebContentTrait
{
  return 8;
}

- (unint64_t)_axSecureTextFieldTrait
{
  return 16;
}

- (unint64_t)_axTextEntryTrait
{
  return 32;
}

- (unint64_t)_axHasTextCursorTrait
{
  return 64;
}

- (unint64_t)_axTextOperationsAvailableTrait
{
  return 128;
}

- (unint64_t)_axImageTrait
{
  return 256;
}

- (unint64_t)_axTabBarTrait
{
  return 512;
}

- (unint64_t)_axButtonTrait
{
  return 1024;
}

- (unint64_t)_axToggleTrait
{
  return 2048;
}

- (unint64_t)_axPopupButtonTrait
{
  return 4096;
}

- (unint64_t)_axStaticTextTrait
{
  return 0x2000;
}

- (unint64_t)_axAdjustableTrait
{
  return 0x4000;
}

- (unint64_t)_axMenuItemTrait
{
  return 0x8000;
}

- (unint64_t)_axSelectedTrait
{
  return 0x10000;
}

- (unint64_t)_axNotEnabledTrait
{
  return 0x20000;
}

- (unint64_t)_axRadioButtonTrait
{
  return 0x40000;
}

- (unint64_t)_axSearchFieldTrait
{
  return 0x80000;
}

- (unint64_t)_axTextAreaTrait
{
  return 0x100000;
}

- (unint64_t)_axUpdatesFrequentlyTrait
{
  return 0x200000;
}

- (id)accessibilityDOMIdentifier
{
  WTF::StringImpl *v3;
  void *v4;
  WTF::StringImpl *v5;
  WTF::StringImpl *v7;

  if (!-[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
    return 0;
  (*(void (**)(WTF::StringImpl **__return_ptr))(*(_QWORD *)-[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject")+ 1072))(&v7);
  if (!v7)
    return &stru_1E3487BC0;
  v4 = (void *)WTF::StringImpl::operator NSString *();
  v5 = v7;
  v7 = 0;
  if (v5)
  {
    if (*(_DWORD *)v5 == 2)
      WTF::StringImpl::destroy(v5, v3);
    else
      *(_DWORD *)v5 -= 2;
  }
  return v4;
}

- (BOOL)accessibilityCanFuzzyHitTest
{
  int v3;
  void *v4;
  int v5;
  BOOL v6;
  BOOL v7;
  void *v8;

  v3 = -[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall");
  if (v3)
  {
    v4 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
    v5 = (*(uint64_t (**)(void *))(*(_QWORD *)v4 + 1456))(v4);
    v6 = (v5 - 75) > 0x39 || ((1 << (v5 - 75)) & 0x20840410E00220FLL) == 0;
    if (v6
      && ((v5 - 10) <= 0x3A
        ? (v7 = ((1 << (v5 - 10)) & 0x680028800000251) == 0)
        : (v7 = 1),
          v7))
    {
      LOBYTE(v3) = 0;
    }
    else
    {
      v8 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
      LOBYTE(v3) = (*(uint64_t (**)(void *))(*(_QWORD *)v8 + 856))(v8) ^ 1;
    }
  }
  return v3;
}

- (id)accessibilityPostProcessHitTest:(CGPoint)a3
{
  return 0;
}

- (id)accessibilityHitTest:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  _QWORD *v10;
  void *v11;
  WTF *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  char v16;
  WTF *v17;
  int v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id result;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _DWORD v31[2];

  y = a3.y;
  x = a3.x;
  if (!-[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
    return 0;
  v6 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
  v7 = (*(uint64_t (**)(void *))(*(_QWORD *)v6 + 1488))(v6);
  v8 = v7;
  if (v7)
  {
    if (*(_QWORD *)(v7 + 88))
    {
      v9 = 0;
      goto LABEL_10;
    }
    v10 = (_QWORD *)WTF::fastMalloc((WTF *)8);
    *v10 = 0;
    v12 = *(WTF **)(v8 + 88);
    *(_QWORD *)(v8 + 88) = v10;
    if (v12)
    {
      if (*(_QWORD *)v12)
        WTF::fastFree((WTF *)(*(_QWORD *)v12 - 16), v11);
      WTF::fastFree(v12, v11);
    }
  }
  v9 = 1;
LABEL_10:
  v13 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
  v31[0] = (int)x;
  v31[1] = (int)y;
  v15 = (*(uint64_t (**)(void *, _DWORD *))(*(_QWORD *)v13 + 1208))(v13, v31);
  v16 = v9 ^ 1;
  if (!v8)
    v16 = 1;
  if ((v16 & 1) == 0)
  {
    v17 = *(WTF **)(v8 + 88);
    *(_QWORD *)(v8 + 88) = 0;
    if (v17)
    {
      if (*(_QWORD *)v17)
        WTF::fastFree((WTF *)(*(_QWORD *)v17 - 16), v14);
      WTF::fastFree(v17, v14);
    }
  }
  if (v15)
  {
    v18 = objc_msgSend(*(id *)(v15 + 24), "accessibilityCanFuzzyHitTest");
    v19 = *(void **)(v15 + 24);
    if (v18)
    {
      if (v19)
      {
        while ((objc_msgSend(v19, "isAccessibilityElement") & 1) == 0)
        {
          v20 = objc_msgSend(v19, "axBackingObject");
          if (!v20)
            break;
          v21 = v20;
          if (objc_msgSend(v19, "isAttachment"))
          {
            if (!objc_msgSend((id)objc_msgSend(v19, "attachmentView"), "accessibilityIsIgnored"))
              break;
          }
          v22 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v21 + 1240))(v21);
          result = v19;
          if (v22)
          {
            result = 0;
            v19 = *(void **)(v22 + 24);
            if (v19)
              continue;
          }
          return result;
        }
        return v19;
      }
    }
    else
    {
      v24 = objc_msgSend(*(id *)(v15 + 24), "accessibilityPostProcessHitTest:", x, y);
      if (v24)
      {
        v19 = (void *)v24;
        while ((objc_msgSend(v19, "isAccessibilityElement") & 1) == 0)
        {
          v25 = objc_msgSend(v19, "axBackingObject");
          if (!v25)
            break;
          v26 = v25;
          if (objc_msgSend(v19, "isAttachment"))
          {
            if (!objc_msgSend((id)objc_msgSend(v19, "attachmentView"), "accessibilityIsIgnored"))
              break;
          }
          v27 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v26 + 1240))(v26);
          result = v19;
          if (v27)
          {
            result = 0;
            v19 = *(void **)(v27 + 24);
            if (v19)
              continue;
          }
          return result;
        }
        return v19;
      }
      v19 = *(void **)(v15 + 24);
      if (v19)
      {
        while ((objc_msgSend(v19, "isAccessibilityElement") & 1) == 0)
        {
          v28 = objc_msgSend(v19, "axBackingObject");
          if (!v28)
            break;
          v29 = v28;
          if (objc_msgSend(v19, "isAttachment"))
          {
            if (!objc_msgSend((id)objc_msgSend(v19, "attachmentView"), "accessibilityIsIgnored"))
              break;
          }
          v30 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v29 + 1240))(v29);
          result = v19;
          if (v30)
          {
            result = 0;
            v19 = *(void **)(v30 + 24);
            if (v19)
              continue;
          }
          return result;
        }
        return v19;
      }
    }
  }
  return 0;
}

- (void)enableAttributeCaching
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  void *v6;
  WTF *v7;

  v2 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
  v3 = (*(uint64_t (**)(void *))(*(_QWORD *)v2 + 1488))(v2);
  if (v3)
  {
    v4 = v3;
    if (!*(_QWORD *)(v3 + 88))
    {
      v5 = (_QWORD *)WTF::fastMalloc((WTF *)8);
      *v5 = 0;
      v7 = *(WTF **)(v4 + 88);
      *(_QWORD *)(v4 + 88) = v5;
      if (v7)
      {
        if (*(_QWORD *)v7)
          WTF::fastFree((WTF *)(*(_QWORD *)v7 - 16), v6);
        WTF::fastFree(v7, v6);
      }
    }
  }
}

- (void)disableAttributeCaching
{
  void *v2;
  uint64_t v3;
  void *v4;
  WTF *v5;

  v2 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
  v3 = (*(uint64_t (**)(void *))(*(_QWORD *)v2 + 1488))(v2);
  if (v3)
  {
    v5 = *(WTF **)(v3 + 88);
    *(_QWORD *)(v3 + 88) = 0;
    if (v5)
    {
      if (*(_QWORD *)v5)
        WTF::fastFree((WTF *)(*(_QWORD *)v5 - 16), v4);
      WTF::fastFree(v5, v4);
    }
  }
}

- (id)accessibilityElements
{
  id v3;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  CFTypeRef *v15;
  uint64_t v16;
  CFTypeRef v17;
  uint64_t v18;
  CFTypeRef v19;
  WTF *v20;
  int v21;
  unsigned int v22;

  if (!-[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
    return 0;
  if (-[WebAccessibilityObjectWrapper isAttachment](self, "isAttachment"))
  {
    v3 = -[WebAccessibilityObjectWrapper attachmentView](self, "attachmentView");
    if (v3)
      return (id)objc_msgSend(v3, "accessibilityElements");
  }
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
  v7 = (*(uint64_t (**)(void *, uint64_t))(*(_QWORD *)v6 + 1896))(v6, 1);
  v8 = *(unsigned int *)(v7 + 12);
  if ((_DWORD)v8)
  {
    v9 = *(_QWORD **)v7;
    v10 = 8 * v8;
    do
    {
      v11 = *(void **)(*v9 + 24);
      if ((*(unsigned int (**)(_QWORD))(*(_QWORD *)*v9 + 128))(*v9))
      {
        v12 = objc_msgSend(v11, "attachmentView");
        if (v12)
          objc_msgSend(v5, "addObject:", v12);
      }
      else
      {
        objc_msgSend(v5, "addObject:", v11);
      }
      ++v9;
      v10 -= 8;
    }
    while (v10);
  }
  v13 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
  if ((*(unsigned int (**)(void *))(*(_QWORD *)v13 + 1456))(v13) == 82)
  {
    (*(void (**)(WTF **__return_ptr))(*(_QWORD *)-[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject")+ 2640))(&v20);
    v15 = (CFTypeRef *)v20;
    if (v22)
    {
      v16 = 8 * v22;
      do
      {
        v17 = *v15;
        if (*v15)
          CFRetain(*v15);
        objc_msgSend(v5, "addObject:", v17);
        if (v17)
          CFRelease(v17);
        ++v15;
        v16 -= 8;
      }
      while (v16);
      v15 = (CFTypeRef *)v20;
      if (v22)
      {
        v18 = 8 * v22;
        do
        {
          v19 = *v15;
          *v15 = 0;
          if (v19)
            CFRelease(v19);
          ++v15;
          v18 -= 8;
        }
        while (v18);
        v15 = (CFTypeRef *)v20;
      }
    }
    if (v15)
    {
      v20 = 0;
      v21 = 0;
      WTF::fastFree((WTF *)v15, v14);
    }
  }
  return (id)(id)CFMakeCollectable(v5);
}

- (int64_t)accessibilityElementCount
{
  id v3;
  void *v5;

  if (!-[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
    return 0;
  if (-[WebAccessibilityObjectWrapper isAttachment](self, "isAttachment"))
  {
    v3 = -[WebAccessibilityObjectWrapper attachmentView](self, "attachmentView");
    if (v3)
      return objc_msgSend(v3, "accessibilityElementCount");
  }
  v5 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
  return *(unsigned int *)((*(uint64_t (**)(void *, uint64_t))(*(_QWORD *)v5 + 1896))(v5, 1) + 12);
}

- (id)accessibilityElementAtIndex:(int64_t)a3
{
  id v5;
  id result;
  void *v7;
  uint64_t v8;
  _QWORD *v9;
  void *v10;

  if (!-[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
    return 0;
  if (-[WebAccessibilityObjectWrapper isAttachment](self, "isAttachment"))
  {
    v5 = -[WebAccessibilityObjectWrapper attachmentView](self, "attachmentView");
    if (v5)
      return (id)objc_msgSend(v5, "accessibilityElementAtIndex:", a3);
  }
  v7 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
  v8 = (*(uint64_t (**)(void *, uint64_t))(*(_QWORD *)v7 + 1896))(v7, 1);
  if (*(unsigned int *)(v8 + 12) <= (unint64_t)a3)
    return 0;
  v9 = *(_QWORD **)(*(_QWORD *)v8 + 8 * a3);
  v10 = (void *)v9[3];
  if (!(*(unsigned int (**)(_QWORD *))(*v9 + 128))(v9))
    return v10;
  result = (id)objc_msgSend(v10, "attachmentView");
  if (!result)
    return v10;
  return result;
}

- (int64_t)indexOfAccessibilityElement:(id)a3
{
  id v5;
  int64_t result;
  void *v7;
  uint64_t v8;
  int64_t v9;
  unint64_t v10;
  _QWORD *v11;
  id v12;

  if (!-[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
    return 0x7FFFFFFFFFFFFFFFLL;
  if (-[WebAccessibilityObjectWrapper isAttachment](self, "isAttachment"))
  {
    v5 = -[WebAccessibilityObjectWrapper attachmentView](self, "attachmentView");
    if (v5)
      return objc_msgSend(v5, "indexOfAccessibilityElement:", a3);
  }
  v7 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
  result = (*(uint64_t (**)(void *, uint64_t))(*(_QWORD *)v7 + 1896))(v7, 1);
  v8 = *(unsigned int *)(result + 12);
  if ((_DWORD)v8)
  {
    v9 = result;
    v10 = 0;
    while (v10 < *(unsigned int *)(v9 + 12))
    {
      v11 = *(_QWORD **)(*(_QWORD *)v9 + 8 * v10);
      v12 = (id)v11[3];
      if (v12 == a3)
        return v10;
      result = (*(uint64_t (**)(_QWORD *))(*v11 + 128))(v11);
      if ((_DWORD)result)
      {
        result = objc_msgSend(v12, "attachmentView");
        if ((id)result == a3)
          return v10;
      }
      if (v8 == ++v10)
        return 0x7FFFFFFFFFFFFFFFLL;
    }
    __break(0xC471u);
  }
  else
  {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  return result;
}

- (CGPath)_accessibilityPath
{
  void *v3;
  int v4;
  CGPath *v5;
  char v7;
  uint64_t v8;
  _QWORD v9[7];
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (!-[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
    return 0;
  v3 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
  if (!(*(unsigned int (**)(void *))(*(_QWORD *)v3 + 1592))(v3))
    return 0;
  (*(void (**)(uint64_t *__return_ptr))(*(_QWORD *)-[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject")+ 1584))(&v8);
  v4 = v10;
  if (v10 == 2)
  {
    if (v9[0] && ((*(uint64_t (**)(_QWORD))(*(_QWORD *)v9[0] + 200))(v9[0]) & 1) != 0)
    {
      v5 = 0;
      goto LABEL_12;
    }
  }
  else if (!v10)
  {
    v5 = 0;
LABEL_13:
    ((void (*)(char *, _QWORD *))off_1E324B1F0[v4])(&v7, v9);
    return v5;
  }
  v5 = -[WebAccessibilityObjectWrapperBase convertPathToScreenSpace:](self, "convertPathToScreenSpace:", &v8);
LABEL_12:
  v4 = v10;
  if (v10 != -1)
    goto LABEL_13;
  return v5;
}

- (id)_accessibilityWebRoleAsString
{
  void *v3;
  const __CFString *v4;
  WTF::StringImpl *v5;
  WTF::StringImpl *v7;

  if (!-[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
    return 0;
  v3 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
  switch((*(unsigned int (**)(void *))(*(_QWORD *)v3 + 1456))(v3))
  {
    case 0u:
    case 1u:
    case 2u:
    case 3u:
    case 4u:
    case 5u:
    case 6u:
    case 7u:
    case 8u:
    case 9u:
    case 0xAu:
    case 0xBu:
    case 0xCu:
    case 0xDu:
    case 0xEu:
    case 0xFu:
    case 0x10u:
    case 0x11u:
    case 0x12u:
    case 0x13u:
    case 0x14u:
    case 0x15u:
    case 0x16u:
    case 0x17u:
    case 0x18u:
    case 0x19u:
    case 0x1Au:
    case 0x1Bu:
    case 0x1Cu:
    case 0x1Du:
    case 0x1Eu:
    case 0x1Fu:
    case 0x20u:
    case 0x21u:
    case 0x22u:
    case 0x23u:
    case 0x24u:
    case 0x25u:
    case 0x26u:
    case 0x27u:
    case 0x28u:
    case 0x29u:
    case 0x2Au:
    case 0x2Bu:
    case 0x2Cu:
    case 0x2Du:
    case 0x2Eu:
    case 0x2Fu:
    case 0x30u:
    case 0x31u:
    case 0x32u:
    case 0x33u:
    case 0x34u:
    case 0x35u:
    case 0x36u:
    case 0x37u:
    case 0x38u:
    case 0x39u:
    case 0x3Au:
    case 0x3Bu:
    case 0x3Cu:
    case 0x3Du:
    case 0x3Eu:
    case 0x3Fu:
    case 0x40u:
    case 0x41u:
    case 0x42u:
    case 0x43u:
    case 0x44u:
    case 0x45u:
    case 0x46u:
    case 0x47u:
    case 0x48u:
    case 0x49u:
    case 0x4Au:
    case 0x4Bu:
    case 0x4Cu:
    case 0x4Du:
    case 0x4Eu:
    case 0x4Fu:
    case 0x50u:
    case 0x51u:
    case 0x52u:
    case 0x53u:
    case 0x54u:
    case 0x55u:
    case 0x56u:
    case 0x57u:
    case 0x58u:
    case 0x59u:
    case 0x5Au:
    case 0x5Bu:
    case 0x5Cu:
    case 0x5Du:
    case 0x5Eu:
    case 0x5Fu:
    case 0x60u:
    case 0x61u:
    case 0x62u:
    case 0x63u:
    case 0x64u:
    case 0x65u:
    case 0x66u:
    case 0x67u:
    case 0x68u:
    case 0x69u:
    case 0x6Au:
    case 0x6Bu:
    case 0x6Cu:
    case 0x6Du:
    case 0x6Eu:
    case 0x6Fu:
    case 0x70u:
    case 0x71u:
    case 0x72u:
    case 0x73u:
    case 0x74u:
    case 0x75u:
    case 0x76u:
    case 0x77u:
    case 0x78u:
    case 0x79u:
    case 0x7Au:
    case 0x7Bu:
    case 0x7Cu:
    case 0x7Du:
    case 0x7Eu:
    case 0x7Fu:
    case 0x80u:
    case 0x81u:
    case 0x82u:
    case 0x83u:
    case 0x84u:
    case 0x85u:
    case 0x86u:
    case 0x87u:
    case 0x88u:
    case 0x89u:
    case 0x8Au:
    case 0x8Bu:
      WTF::StringImpl::createWithoutCopyingNonEmpty();
      if (v7)
      {
        v4 = (const __CFString *)WTF::StringImpl::operator NSString *();
        if (*(_DWORD *)v7 == 2)
          WTF::StringImpl::destroy(v7, v5);
        else
          *(_DWORD *)v7 -= 2;
      }
      else
      {
        v4 = &stru_1E3487BC0;
      }
      break;
    default:
      abort();
  }
  return (id)v4;
}

- (BOOL)accessibilityHasPopup
{
  int v3;

  v3 = -[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall");
  if (v3)
    LOBYTE(v3) = WebCore::AXCoreObject::hasPopup((WebCore::AXCoreObject *)-[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject"));
  return v3;
}

- (id)accessibilityPopupValue
{
  WTF::StringImpl *v3;
  void *v4;
  WTF::StringImpl *v5;
  WTF::StringImpl *v7;

  if (!-[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
    return 0;
  (*(void (**)(WTF::StringImpl **__return_ptr))(*(_QWORD *)-[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject")+ 1008))(&v7);
  if (!v7)
    return &stru_1E3487BC0;
  v4 = (void *)WTF::StringImpl::operator NSString *();
  v5 = v7;
  v7 = 0;
  if (v5)
  {
    if (*(_DWORD *)v5 == 2)
      WTF::StringImpl::destroy(v5, v3);
    else
      *(_DWORD *)v5 -= 2;
  }
  return v4;
}

- (BOOL)accessibilityHasDocumentRoleAncestor
{
  int v3;
  void *v4;

  v3 = -[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall");
  if (v3)
  {
    v4 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
    LOBYTE(v3) = (*(uint64_t (**)(void *))(*(_QWORD *)v4 + 1264))(v4);
  }
  return v3;
}

- (BOOL)accessibilityHasWebApplicationAncestor
{
  int v3;
  void *v4;

  v3 = -[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall");
  if (v3)
  {
    v4 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
    LOBYTE(v3) = (*(uint64_t (**)(void *))(*(_QWORD *)v4 + 1272))(v4);
  }
  return v3;
}

- (BOOL)accessibilityIsInDescriptionListDefinition
{
  int v3;
  void *v4;

  v3 = -[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall");
  if (v3)
  {
    v4 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
    LOBYTE(v3) = (*(uint64_t (**)(void *))(*(_QWORD *)v4 + 1280))(v4);
  }
  return v3;
}

- (BOOL)accessibilityIsInDescriptionListTerm
{
  int v3;
  void *v4;

  v3 = -[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall");
  if (v3)
  {
    v4 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
    LOBYTE(v3) = (*(uint64_t (**)(void *))(*(_QWORD *)v4 + 1288))(v4);
  }
  return v3;
}

- (BOOL)_accessibilityIsInTableCell
{
  int v3;
  void *v4;

  v3 = -[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall");
  if (v3)
  {
    v4 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
    LOBYTE(v3) = (*(uint64_t (**)(void *))(*(_QWORD *)v4 + 1296))(v4);
  }
  return v3;
}

- (BOOL)accessibilityIsAttributeSettable:(id)a3
{
  void *v5;

  if (!-[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall")
    || !objc_msgSend(a3, "isEqualToString:", CFSTR("AXValue")))
  {
    return 0;
  }
  v5 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
  return (*(uint64_t (**)(void *))(*(_QWORD *)v5 + 808))(v5);
}

- (BOOL)accessibilityIsRequired
{
  int v3;
  void *v4;

  v3 = -[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall");
  if (v3)
  {
    v4 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
    LOBYTE(v3) = (*(uint64_t (**)(void *))(*(_QWORD *)v4 + 616))(v4);
  }
  return v3;
}

- (id)accessibilityLanguage
{
  WTF::StringImpl *v3;
  void *v4;
  WTF::StringImpl *v5;
  WTF::StringImpl *v7;

  if (!-[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
    return 0;
  (*(void (**)(WTF::StringImpl **__return_ptr))(*(_QWORD *)-[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject")+ 1736))(&v7);
  if (!v7)
    return &stru_1E3487BC0;
  v4 = (void *)WTF::StringImpl::operator NSString *();
  v5 = v7;
  v7 = 0;
  if (v5)
  {
    if (*(_DWORD *)v5 == 2)
      WTF::StringImpl::destroy(v5, v3);
    else
      *(_DWORD *)v5 -= 2;
  }
  return v4;
}

- (BOOL)accessibilityIsDialog
{
  _BOOL4 v3;
  void *v4;

  v3 = -[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall");
  if (v3)
  {
    v4 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
    LOBYTE(v3) = ((*(uint64_t (**)(void *))(*(_QWORD *)v4 + 1456))(v4) & 0xFE) == 2;
  }
  return v3;
}

- (id)_accessibilityTreeAncestor
{
  void *v3;
  void *v4;
  _QWORD *v5;
  uint64_t v6;
  int v7;
  unsigned int v8;
  uint64_t v9;
  int v10;
  int v11;
  void *v12;
  id result;
  char v14;
  uint64_t v15;
  _BYTE v16[24];

  if (!-[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
    return 0;
  v3 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
  v14 = -127;
  v15 = 0;
  WTF::HashTable<WebCore::AccessibilityRole,WebCore::AccessibilityRole,WTF::IdentityExtractor,WTF::IntHash<WebCore::AccessibilityRole>,WTF::StrongEnumHashTraits<WebCore::AccessibilityRole>,WTF::StrongEnumHashTraits<WebCore::AccessibilityRole>>::add(v16, &v15, &v14);
  v5 = (_QWORD *)(*(uint64_t (**)(void *))(*(_QWORD *)v3 + 1232))(v3);
  v6 = v15;
  if (v5)
  {
    if (v15)
    {
      while (1)
      {
        v7 = (*(uint64_t (**)(_QWORD *))(*v5 + 1456))(v5);
        v8 = *(_DWORD *)(v6 - 8);
        LODWORD(v9) = 9 * ((~(v7 << 15) + v7) ^ ((~(v7 << 15) + v7) >> 10));
        LODWORD(v9) = v8 & (((v9 ^ (v9 >> 6)) + ~((v9 ^ (v9 >> 6)) << 11)) ^ (((v9 ^ (v9 >> 6)) + ~((v9 ^ (v9 >> 6)) << 11)) >> 16));
        v10 = *(unsigned __int8 *)(v6 + v9);
        if (v10 == v7)
          break;
        v11 = 1;
        while ((_BYTE)v10 != 0xFF)
        {
          v9 = ((_DWORD)v9 + v11) & v8;
          v10 = *(unsigned __int8 *)(v6 + v9);
          ++v11;
          if (v10 == v7)
            goto LABEL_15;
        }
        v5 = (_QWORD *)(*(uint64_t (**)(_QWORD *))(*v5 + 1232))(v5);
        v12 = 0;
        if (!v5)
          goto LABEL_16;
      }
LABEL_15:
      v12 = (void *)v5[3];
      goto LABEL_16;
    }
    do
    {
      (*(void (**)(_QWORD *))(*v5 + 1456))(v5);
      v5 = (_QWORD *)(*(uint64_t (**)(_QWORD *))(*v5 + 1232))(v5);
    }
    while (v5);
  }
  v12 = 0;
  result = 0;
  if (v6)
  {
LABEL_16:
    WTF::fastFree((WTF *)(v6 - 16), v4);
    return v12;
  }
  return result;
}

- (id)_accessibilityDescriptionListAncestor
{
  void *v3;
  void *v4;
  _QWORD *v5;
  uint64_t v6;
  int v7;
  unsigned int v8;
  uint64_t v9;
  int v10;
  int v11;
  void *v12;
  id result;
  char v14;
  uint64_t v15;
  _BYTE v16[24];

  if (!-[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
    return 0;
  v3 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
  v14 = 23;
  v15 = 0;
  WTF::HashTable<WebCore::AccessibilityRole,WebCore::AccessibilityRole,WTF::IdentityExtractor,WTF::IntHash<WebCore::AccessibilityRole>,WTF::StrongEnumHashTraits<WebCore::AccessibilityRole>,WTF::StrongEnumHashTraits<WebCore::AccessibilityRole>>::add(v16, &v15, &v14);
  v5 = (_QWORD *)(*(uint64_t (**)(void *))(*(_QWORD *)v3 + 1232))(v3);
  v6 = v15;
  if (v5)
  {
    if (v15)
    {
      while (1)
      {
        v7 = (*(uint64_t (**)(_QWORD *))(*v5 + 1456))(v5);
        v8 = *(_DWORD *)(v6 - 8);
        LODWORD(v9) = 9 * ((~(v7 << 15) + v7) ^ ((~(v7 << 15) + v7) >> 10));
        LODWORD(v9) = v8 & (((v9 ^ (v9 >> 6)) + ~((v9 ^ (v9 >> 6)) << 11)) ^ (((v9 ^ (v9 >> 6)) + ~((v9 ^ (v9 >> 6)) << 11)) >> 16));
        v10 = *(unsigned __int8 *)(v6 + v9);
        if (v10 == v7)
          break;
        v11 = 1;
        while ((_BYTE)v10 != 0xFF)
        {
          v9 = ((_DWORD)v9 + v11) & v8;
          v10 = *(unsigned __int8 *)(v6 + v9);
          ++v11;
          if (v10 == v7)
            goto LABEL_15;
        }
        v5 = (_QWORD *)(*(uint64_t (**)(_QWORD *))(*v5 + 1232))(v5);
        v12 = 0;
        if (!v5)
          goto LABEL_16;
      }
LABEL_15:
      v12 = (void *)v5[3];
      goto LABEL_16;
    }
    do
    {
      (*(void (**)(_QWORD *))(*v5 + 1456))(v5);
      v5 = (_QWORD *)(*(uint64_t (**)(_QWORD *))(*v5 + 1232))(v5);
    }
    while (v5);
  }
  v12 = 0;
  result = 0;
  if (v6)
  {
LABEL_16:
    WTF::fastFree((WTF *)(v6 - 16), v4);
    return v12;
  }
  return result;
}

- (id)_accessibilityListAncestor
{
  void *v3;
  void *v4;
  _QWORD *v5;
  uint64_t v6;
  int v7;
  unsigned int v8;
  uint64_t v9;
  int v10;
  int v11;
  void *v12;
  id result;
  __int16 v14;
  uint64_t v15;
  _BYTE v16[24];

  if (!-[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
    return 0;
  v3 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
  v14 = 17218;
  v15 = 0;
  WTF::HashTable<WebCore::AccessibilityRole,WebCore::AccessibilityRole,WTF::IdentityExtractor,WTF::IntHash<WebCore::AccessibilityRole>,WTF::StrongEnumHashTraits<WebCore::AccessibilityRole>,WTF::StrongEnumHashTraits<WebCore::AccessibilityRole>>::add(v16, &v15, &v14);
  WTF::HashTable<WebCore::AccessibilityRole,WebCore::AccessibilityRole,WTF::IdentityExtractor,WTF::IntHash<WebCore::AccessibilityRole>,WTF::StrongEnumHashTraits<WebCore::AccessibilityRole>,WTF::StrongEnumHashTraits<WebCore::AccessibilityRole>>::add(v16, &v15, (_BYTE *)&v14 + 1);
  v5 = (_QWORD *)(*(uint64_t (**)(void *))(*(_QWORD *)v3 + 1232))(v3);
  v6 = v15;
  if (v5)
  {
    if (v15)
    {
      while (1)
      {
        v7 = (*(uint64_t (**)(_QWORD *))(*v5 + 1456))(v5);
        v8 = *(_DWORD *)(v6 - 8);
        LODWORD(v9) = 9 * ((~(v7 << 15) + v7) ^ ((~(v7 << 15) + v7) >> 10));
        LODWORD(v9) = v8 & (((v9 ^ (v9 >> 6)) + ~((v9 ^ (v9 >> 6)) << 11)) ^ (((v9 ^ (v9 >> 6)) + ~((v9 ^ (v9 >> 6)) << 11)) >> 16));
        v10 = *(unsigned __int8 *)(v6 + v9);
        if (v10 == v7)
          break;
        v11 = 1;
        while ((_BYTE)v10 != 0xFF)
        {
          v9 = ((_DWORD)v9 + v11) & v8;
          v10 = *(unsigned __int8 *)(v6 + v9);
          ++v11;
          if (v10 == v7)
            goto LABEL_15;
        }
        v5 = (_QWORD *)(*(uint64_t (**)(_QWORD *))(*v5 + 1232))(v5);
        v12 = 0;
        if (!v5)
          goto LABEL_16;
      }
LABEL_15:
      v12 = (void *)v5[3];
      goto LABEL_16;
    }
    do
    {
      (*(void (**)(_QWORD *))(*v5 + 1456))(v5);
      v5 = (_QWORD *)(*(uint64_t (**)(_QWORD *))(*v5 + 1232))(v5);
    }
    while (v5);
  }
  v12 = 0;
  result = 0;
  if (v6)
  {
LABEL_16:
    WTF::fastFree((WTF *)(v6 - 16), v4);
    return v12;
  }
  return result;
}

- (id)_accessibilityArticleAncestor
{
  void *v3;
  void *v4;
  _QWORD *v5;
  uint64_t v6;
  int v7;
  unsigned int v8;
  uint64_t v9;
  int v10;
  int v11;
  void *v12;
  id result;
  char v14;
  uint64_t v15;
  _BYTE v16[24];

  if (!-[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
    return 0;
  v3 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
  v14 = 29;
  v15 = 0;
  WTF::HashTable<WebCore::AccessibilityRole,WebCore::AccessibilityRole,WTF::IdentityExtractor,WTF::IntHash<WebCore::AccessibilityRole>,WTF::StrongEnumHashTraits<WebCore::AccessibilityRole>,WTF::StrongEnumHashTraits<WebCore::AccessibilityRole>>::add(v16, &v15, &v14);
  v5 = (_QWORD *)(*(uint64_t (**)(void *))(*(_QWORD *)v3 + 1232))(v3);
  v6 = v15;
  if (v5)
  {
    if (v15)
    {
      while (1)
      {
        v7 = (*(uint64_t (**)(_QWORD *))(*v5 + 1456))(v5);
        v8 = *(_DWORD *)(v6 - 8);
        LODWORD(v9) = 9 * ((~(v7 << 15) + v7) ^ ((~(v7 << 15) + v7) >> 10));
        LODWORD(v9) = v8 & (((v9 ^ (v9 >> 6)) + ~((v9 ^ (v9 >> 6)) << 11)) ^ (((v9 ^ (v9 >> 6)) + ~((v9 ^ (v9 >> 6)) << 11)) >> 16));
        v10 = *(unsigned __int8 *)(v6 + v9);
        if (v10 == v7)
          break;
        v11 = 1;
        while ((_BYTE)v10 != 0xFF)
        {
          v9 = ((_DWORD)v9 + v11) & v8;
          v10 = *(unsigned __int8 *)(v6 + v9);
          ++v11;
          if (v10 == v7)
            goto LABEL_15;
        }
        v5 = (_QWORD *)(*(uint64_t (**)(_QWORD *))(*v5 + 1232))(v5);
        v12 = 0;
        if (!v5)
          goto LABEL_16;
      }
LABEL_15:
      v12 = (void *)v5[3];
      goto LABEL_16;
    }
    do
    {
      (*(void (**)(_QWORD *))(*v5 + 1456))(v5);
      v5 = (_QWORD *)(*(uint64_t (**)(_QWORD *))(*v5 + 1232))(v5);
    }
    while (v5);
  }
  v12 = 0;
  result = 0;
  if (v6)
  {
LABEL_16:
    WTF::fastFree((WTF *)(v6 - 16), v4);
    return v12;
  }
  return result;
}

- (id)_accessibilityLandmarkAncestor
{
  void *v3;
  void *v4;
  _QWORD *v5;
  uint64_t v6;
  int v7;
  unsigned int v8;
  uint64_t v9;
  int v10;
  int v11;
  void *v12;
  id result;
  uint64_t v14;
  _BYTE v15[24];
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  if (!-[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
    return 0;
  v3 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
  v16[0] = 0x3E3D3C3B3A393837;
  v14 = 0;
  WTF::HashTable<WebCore::AccessibilityRole,WebCore::AccessibilityRole,WTF::IdentityExtractor,WTF::IntHash<WebCore::AccessibilityRole>,WTF::StrongEnumHashTraits<WebCore::AccessibilityRole>,WTF::StrongEnumHashTraits<WebCore::AccessibilityRole>>::add(v15, &v14, v16);
  WTF::HashTable<WebCore::AccessibilityRole,WebCore::AccessibilityRole,WTF::IdentityExtractor,WTF::IntHash<WebCore::AccessibilityRole>,WTF::StrongEnumHashTraits<WebCore::AccessibilityRole>,WTF::StrongEnumHashTraits<WebCore::AccessibilityRole>>::add(v15, &v14, (_BYTE *)v16 + 1);
  WTF::HashTable<WebCore::AccessibilityRole,WebCore::AccessibilityRole,WTF::IdentityExtractor,WTF::IntHash<WebCore::AccessibilityRole>,WTF::StrongEnumHashTraits<WebCore::AccessibilityRole>,WTF::StrongEnumHashTraits<WebCore::AccessibilityRole>>::add(v15, &v14, (_BYTE *)v16 + 2);
  WTF::HashTable<WebCore::AccessibilityRole,WebCore::AccessibilityRole,WTF::IdentityExtractor,WTF::IntHash<WebCore::AccessibilityRole>,WTF::StrongEnumHashTraits<WebCore::AccessibilityRole>,WTF::StrongEnumHashTraits<WebCore::AccessibilityRole>>::add(v15, &v14, (_BYTE *)v16 + 3);
  WTF::HashTable<WebCore::AccessibilityRole,WebCore::AccessibilityRole,WTF::IdentityExtractor,WTF::IntHash<WebCore::AccessibilityRole>,WTF::StrongEnumHashTraits<WebCore::AccessibilityRole>,WTF::StrongEnumHashTraits<WebCore::AccessibilityRole>>::add(v15, &v14, (_BYTE *)v16 + 4);
  WTF::HashTable<WebCore::AccessibilityRole,WebCore::AccessibilityRole,WTF::IdentityExtractor,WTF::IntHash<WebCore::AccessibilityRole>,WTF::StrongEnumHashTraits<WebCore::AccessibilityRole>,WTF::StrongEnumHashTraits<WebCore::AccessibilityRole>>::add(v15, &v14, (_BYTE *)v16 + 5);
  WTF::HashTable<WebCore::AccessibilityRole,WebCore::AccessibilityRole,WTF::IdentityExtractor,WTF::IntHash<WebCore::AccessibilityRole>,WTF::StrongEnumHashTraits<WebCore::AccessibilityRole>,WTF::StrongEnumHashTraits<WebCore::AccessibilityRole>>::add(v15, &v14, (_BYTE *)v16 + 6);
  WTF::HashTable<WebCore::AccessibilityRole,WebCore::AccessibilityRole,WTF::IdentityExtractor,WTF::IntHash<WebCore::AccessibilityRole>,WTF::StrongEnumHashTraits<WebCore::AccessibilityRole>,WTF::StrongEnumHashTraits<WebCore::AccessibilityRole>>::add(v15, &v14, (_BYTE *)v16 + 7);
  v5 = (_QWORD *)(*(uint64_t (**)(void *))(*(_QWORD *)v3 + 1232))(v3);
  v6 = v14;
  if (v5)
  {
    if (v14)
    {
      while (1)
      {
        v7 = (*(uint64_t (**)(_QWORD *))(*v5 + 1456))(v5);
        v8 = *(_DWORD *)(v6 - 8);
        LODWORD(v9) = 9 * ((~(v7 << 15) + v7) ^ ((~(v7 << 15) + v7) >> 10));
        LODWORD(v9) = v8 & (((v9 ^ (v9 >> 6)) + ~((v9 ^ (v9 >> 6)) << 11)) ^ (((v9 ^ (v9 >> 6)) + ~((v9 ^ (v9 >> 6)) << 11)) >> 16));
        v10 = *(unsigned __int8 *)(v6 + v9);
        if (v10 == v7)
          break;
        v11 = 1;
        while ((_BYTE)v10 != 0xFF)
        {
          v9 = ((_DWORD)v9 + v11) & v8;
          v10 = *(unsigned __int8 *)(v6 + v9);
          ++v11;
          if (v10 == v7)
            goto LABEL_15;
        }
        v5 = (_QWORD *)(*(uint64_t (**)(_QWORD *))(*v5 + 1232))(v5);
        v12 = 0;
        if (!v5)
          goto LABEL_16;
      }
LABEL_15:
      v12 = (void *)v5[3];
      goto LABEL_16;
    }
    do
    {
      (*(void (**)(_QWORD *))(*v5 + 1456))(v5);
      v5 = (_QWORD *)(*(uint64_t (**)(_QWORD *))(*v5 + 1232))(v5);
    }
    while (v5);
  }
  v12 = 0;
  result = 0;
  if (v6)
  {
LABEL_16:
    WTF::fastFree((WTF *)(v6 - 16), v4);
    return v12;
  }
  return result;
}

- (id)_accessibilityTableAncestor
{
  void *v3;
  void *v4;
  _QWORD *v5;
  uint64_t v6;
  int v7;
  unsigned int v8;
  uint64_t v9;
  int v10;
  int v11;
  void *v12;
  id result;
  __int16 v14;
  char v15;
  uint64_t v16;
  _BYTE v17[24];

  if (!-[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
    return 0;
  v3 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
  v14 = -32134;
  v15 = 42;
  v16 = 0;
  WTF::HashTable<WebCore::AccessibilityRole,WebCore::AccessibilityRole,WTF::IdentityExtractor,WTF::IntHash<WebCore::AccessibilityRole>,WTF::StrongEnumHashTraits<WebCore::AccessibilityRole>,WTF::StrongEnumHashTraits<WebCore::AccessibilityRole>>::add(v17, &v16, &v14);
  WTF::HashTable<WebCore::AccessibilityRole,WebCore::AccessibilityRole,WTF::IdentityExtractor,WTF::IntHash<WebCore::AccessibilityRole>,WTF::StrongEnumHashTraits<WebCore::AccessibilityRole>,WTF::StrongEnumHashTraits<WebCore::AccessibilityRole>>::add(v17, &v16, (_BYTE *)&v14 + 1);
  WTF::HashTable<WebCore::AccessibilityRole,WebCore::AccessibilityRole,WTF::IdentityExtractor,WTF::IntHash<WebCore::AccessibilityRole>,WTF::StrongEnumHashTraits<WebCore::AccessibilityRole>,WTF::StrongEnumHashTraits<WebCore::AccessibilityRole>>::add(v17, &v16, &v15);
  v5 = (_QWORD *)(*(uint64_t (**)(void *))(*(_QWORD *)v3 + 1232))(v3);
  v6 = v16;
  if (v5)
  {
    if (v16)
    {
      while (1)
      {
        v7 = (*(uint64_t (**)(_QWORD *))(*v5 + 1456))(v5);
        v8 = *(_DWORD *)(v6 - 8);
        LODWORD(v9) = 9 * ((~(v7 << 15) + v7) ^ ((~(v7 << 15) + v7) >> 10));
        LODWORD(v9) = v8 & (((v9 ^ (v9 >> 6)) + ~((v9 ^ (v9 >> 6)) << 11)) ^ (((v9 ^ (v9 >> 6)) + ~((v9 ^ (v9 >> 6)) << 11)) >> 16));
        v10 = *(unsigned __int8 *)(v6 + v9);
        if (v10 == v7)
          break;
        v11 = 1;
        while ((_BYTE)v10 != 0xFF)
        {
          v9 = ((_DWORD)v9 + v11) & v8;
          v10 = *(unsigned __int8 *)(v6 + v9);
          ++v11;
          if (v10 == v7)
            goto LABEL_15;
        }
        v5 = (_QWORD *)(*(uint64_t (**)(_QWORD *))(*v5 + 1232))(v5);
        v12 = 0;
        if (!v5)
          goto LABEL_16;
      }
LABEL_15:
      v12 = (void *)v5[3];
      goto LABEL_16;
    }
    do
    {
      (*(void (**)(_QWORD *))(*v5 + 1456))(v5);
      v5 = (_QWORD *)(*(uint64_t (**)(_QWORD *))(*v5 + 1232))(v5);
    }
    while (v5);
  }
  v12 = 0;
  result = 0;
  if (v6)
  {
LABEL_16:
    WTF::fastFree((WTF *)(v6 - 16), v4);
    return v12;
  }
  return result;
}

- (id)_accessibilityFieldsetAncestor
{
  void *v3;
  id result;
  id *v5;

  if (!-[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
    return 0;
  v3 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
  result = (id)(*(uint64_t (**)(void *))(*(_QWORD *)v3 + 1232))(v3);
  if (result)
  {
    v5 = (id *)result;
    while (((*((uint64_t (**)(id *))*v5 + 56))(v5) & 1) == 0)
    {
      result = (id)(*((uint64_t (**)(id *))*v5 + 154))(v5);
      v5 = (id *)result;
      if (!result)
        return result;
    }
    return v5[3];
  }
  return result;
}

- (id)_accessibilityFrameAncestor
{
  void *v3;
  void *v4;
  _QWORD *v5;
  uint64_t v6;
  int v7;
  unsigned int v8;
  uint64_t v9;
  int v10;
  int v11;
  void *v12;
  id result;
  char v14;
  uint64_t v15;
  _BYTE v16[24];

  if (!-[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
    return 0;
  v3 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
  v14 = -118;
  v15 = 0;
  WTF::HashTable<WebCore::AccessibilityRole,WebCore::AccessibilityRole,WTF::IdentityExtractor,WTF::IntHash<WebCore::AccessibilityRole>,WTF::StrongEnumHashTraits<WebCore::AccessibilityRole>,WTF::StrongEnumHashTraits<WebCore::AccessibilityRole>>::add(v16, &v15, &v14);
  v5 = (_QWORD *)(*(uint64_t (**)(void *))(*(_QWORD *)v3 + 1232))(v3);
  v6 = v15;
  if (v5)
  {
    if (v15)
    {
      while (1)
      {
        v7 = (*(uint64_t (**)(_QWORD *))(*v5 + 1456))(v5);
        v8 = *(_DWORD *)(v6 - 8);
        LODWORD(v9) = 9 * ((~(v7 << 15) + v7) ^ ((~(v7 << 15) + v7) >> 10));
        LODWORD(v9) = v8 & (((v9 ^ (v9 >> 6)) + ~((v9 ^ (v9 >> 6)) << 11)) ^ (((v9 ^ (v9 >> 6)) + ~((v9 ^ (v9 >> 6)) << 11)) >> 16));
        v10 = *(unsigned __int8 *)(v6 + v9);
        if (v10 == v7)
          break;
        v11 = 1;
        while ((_BYTE)v10 != 0xFF)
        {
          v9 = ((_DWORD)v9 + v11) & v8;
          v10 = *(unsigned __int8 *)(v6 + v9);
          ++v11;
          if (v10 == v7)
            goto LABEL_15;
        }
        v5 = (_QWORD *)(*(uint64_t (**)(_QWORD *))(*v5 + 1232))(v5);
        v12 = 0;
        if (!v5)
          goto LABEL_16;
      }
LABEL_15:
      v12 = (void *)v5[3];
      goto LABEL_16;
    }
    do
    {
      (*(void (**)(_QWORD *))(*v5 + 1456))(v5);
      v5 = (_QWORD *)(*(uint64_t (**)(_QWORD *))(*v5 + 1232))(v5);
    }
    while (v5);
  }
  v12 = 0;
  result = 0;
  if (v6)
  {
LABEL_16:
    WTF::fastFree((WTF *)(v6 - 16), v4);
    return v12;
  }
  return result;
}

- (unint64_t)_accessibilityTraitsFromAncestors
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  int v7;
  unint64_t v8;

  v3 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
  v4 = (*(uint64_t (**)(void *))(*(_QWORD *)v3 + 1232))(v3);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    while (1)
    {
      v7 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v5 + 1456))(v5);
      if (v7 <= 64)
      {
        if (v7 == 13 || v7 == 43)
        {
          if ((*(unsigned int (**)(uint64_t))(*(_QWORD *)v5 + 544))(v5))
          {
            v8 = -[WebAccessibilityObjectWrapper _axSelectedTrait](self, "_axSelectedTrait");
            goto LABEL_17;
          }
        }
        else if (v7 == 45)
        {
          v8 = -[WebAccessibilityObjectWrapper _axHeaderTrait](self, "_axHeaderTrait");
          goto LABEL_17;
        }
      }
      else
      {
        if (v7 > 137)
        {
          if (v7 != 139)
          {
            if (v7 == 138)
              return v6;
            goto LABEL_18;
          }
LABEL_15:
          v6 |= -[WebAccessibilityObjectWrapper _axLinkTrait](self, "_axLinkTrait");
          if ((*(unsigned int (**)(uint64_t))(*(_QWORD *)v5 + 608))(v5) == 2)
          {
            v8 = -[WebAccessibilityObjectWrapper _axVisitedTrait](self, "_axVisitedTrait");
            goto LABEL_17;
          }
          goto LABEL_18;
        }
        if (v7 == 65)
          goto LABEL_15;
        if (v7 == 111)
        {
          v8 = -[WebAccessibilityObjectWrapper _axButtonTrait](self, "_axButtonTrait");
LABEL_17:
          v6 |= v8;
        }
      }
LABEL_18:
      v5 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v5 + 1232))(v5);
      if (!v5)
        return v6;
    }
  }
  return 0;
}

- (BOOL)accessibilityIsWebInteractiveVideo
{
  WebCore::AccessibilityMediaObject *v3;
  void *v4;
  WebCore::AccessibilityMediaObject *v5;

  LODWORD(v3) = -[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall");
  if ((_DWORD)v3)
  {
    v4 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
    if ((*(unsigned int (**)(void *))(*(_QWORD *)v4 + 1456))(v4) == 136)
    {
      v3 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
      if (v3)
      {
        v5 = v3;
        LODWORD(v3) = (*(uint64_t (**)(WebCore::AccessibilityMediaObject *))(*(_QWORD *)v3 + 2848))(v3);
        if ((_DWORD)v3)
          LOBYTE(v3) = WebCore::AccessibilityMediaObject::isAutoplayEnabled(v5) ^ 1;
      }
    }
    else
    {
      LOBYTE(v3) = 0;
    }
  }
  return (char)v3;
}

- (id)interactiveVideoDescription
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  WTF::StringImpl *v7;
  WTF::StringImpl *v8;
  void *v9;
  WTF::StringImpl *v10;
  _WORD *v11;
  float v12;
  WTF::StringImpl *v14;

  v2 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
  if (!v2 || (v3 = v2, !(*(unsigned int (**)(_QWORD *))(*v2 + 2848))(v2)))
  {
    v7 = (WTF::StringImpl *)*MEMORY[0x1E0CBF6F0];
    if (*MEMORY[0x1E0CBF6F0])
      *(_DWORD *)v7 += 2;
    v14 = v7;
    if (!v7)
      return &stru_1E3487BC0;
    goto LABEL_11;
  }
  v4 = v3[31];
  if (!v4 || (v5 = *(_QWORD *)(v4 + 8)) == 0)
  {
    v6 = v3[30];
    if (v6)
      goto LABEL_15;
    return &stru_1E3487BC0;
  }
  if (*(_BYTE *)(v5 + 46) == 49)
  {
    v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v5 + 24) + 8) + 40);
    goto LABEL_15;
  }
  if ((*(_BYTE *)(v5 + 45) & 1) != 0)
    return &stru_1E3487BC0;
  v6 = *(_QWORD *)(v5 + 24);
LABEL_15:
  v11 = *(_WORD **)(v6 + 8);
  if (!v11)
    return &stru_1E3487BC0;
  if ((v11[14] & 8) == 0)
    return &stru_1E3487BC0;
  if (!(*(unsigned int (**)(_WORD *))(*(_QWORD *)v11 + 824))(v11))
    return &stru_1E3487BC0;
  v12 = (*(double (**)(_WORD *))(*(_QWORD *)v11 + 1376))(v11);
  WebCore::localizedMediaTimeDescription(v12, (uint64_t)&v14);
  if (!v14)
    return &stru_1E3487BC0;
LABEL_11:
  v9 = (void *)WTF::StringImpl::operator NSString *();
  v10 = v14;
  v14 = 0;
  if (v10)
  {
    if (*(_DWORD *)v10 == 2)
      WTF::StringImpl::destroy(v10, v8);
    else
      *(_DWORD *)v10 -= 2;
  }
  return v9;
}

- (BOOL)accessibilityIsMediaPlaying
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  LODWORD(v3) = -[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall");
  if (!(_DWORD)v3)
    return (char)v3;
  v3 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
  if (!v3)
    return (char)v3;
  v4 = v3;
  LODWORD(v3) = (*(uint64_t (**)(_QWORD *))(*v3 + 2848))(v3);
  if (!(_DWORD)v3)
    return (char)v3;
  v5 = v4[31];
  if (v5 && (v6 = *(_QWORD *)(v5 + 8)) != 0)
  {
    if (*(_BYTE *)(v6 + 46) != 49)
    {
      if ((*(_BYTE *)(v6 + 45) & 1) == 0)
      {
        v7 = *(_QWORD *)(v6 + 24);
        goto LABEL_10;
      }
LABEL_12:
      LOBYTE(v3) = 0;
      return (char)v3;
    }
    v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v6 + 24) + 8) + 40);
  }
  else
  {
    v7 = v4[30];
    if (!v7)
      goto LABEL_12;
  }
LABEL_10:
  v8 = *(_QWORD *)(v7 + 8);
  if (!v8 || (*(_WORD *)(v8 + 28) & 8) == 0)
    goto LABEL_12;
  LODWORD(v3) = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v8 + 824))(v8);
  if ((_DWORD)v3)
    return ((unint64_t)*(unsigned int *)(v8 + 1265) >> 1) & 1;
  return (char)v3;
}

- (BOOL)accessibilityIsMediaMuted
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _WORD *v8;

  if (!-[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
    return 0;
  v3 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
  if (!v3)
    return 0;
  v4 = v3;
  if (!(*(unsigned int (**)(_QWORD *))(*v3 + 2848))(v3))
    return 0;
  v5 = v4[31];
  if (v5 && (v6 = *(_QWORD *)(v5 + 8)) != 0)
  {
    if (*(_BYTE *)(v6 + 46) == 49)
    {
      v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v6 + 24) + 8) + 40);
    }
    else
    {
      if ((*(_BYTE *)(v6 + 45) & 1) != 0)
        return 0;
      v7 = *(_QWORD *)(v6 + 24);
    }
  }
  else
  {
    v7 = v4[30];
    if (!v7)
      return 0;
  }
  v8 = *(_WORD **)(v7 + 8);
  if (v8 && (v8[14] & 8) != 0 && (*(unsigned int (**)(_WORD *))(*(_QWORD *)v8 + 824))(v8))
    return (*(uint64_t (**)(_WORD *))(*(_QWORD *)v8 + 1472))(v8);
  return 0;
}

- (void)accessibilityToggleMuteForMedia
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _WORD *v8;
  uint64_t v9;

  if (-[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
  {
    v3 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
    if (v3)
    {
      v4 = v3;
      if ((*(unsigned int (**)(_QWORD *))(*v3 + 2848))(v3))
      {
        v5 = v4[31];
        if (v5 && (v6 = *(_QWORD *)(v5 + 8)) != 0)
        {
          if (*(_BYTE *)(v6 + 46) == 49)
          {
            v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v6 + 24) + 8) + 40);
          }
          else
          {
            if ((*(_BYTE *)(v6 + 45) & 1) != 0)
              return;
            v7 = *(_QWORD *)(v6 + 24);
          }
        }
        else
        {
          v7 = v4[30];
          if (!v7)
            return;
        }
        v8 = *(_WORD **)(v7 + 8);
        if (v8 && (v8[14] & 8) != 0)
        {
          if ((*(unsigned int (**)(_WORD *))(*(_QWORD *)v8 + 824))(v8))
          {
            v9 = (*(unsigned int (**)(_WORD *))(*(_QWORD *)v8 + 1472))(v8) ^ 1;
            (*(void (**)(_WORD *, uint64_t))(*(_QWORD *)v8 + 1480))(v8, v9);
          }
        }
      }
    }
  }
}

- (void)accessibilityVideoEnterFullscreen
{
  unsigned int *v3;
  unsigned int *v4;

  if (-[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
  {
    v3 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
    if (v3)
    {
      v4 = v3;
      if ((*(unsigned int (**)(unsigned int *))(*(_QWORD *)v3 + 2848))(v3))
        WebCore::AccessibilityMediaObject::enterFullscreen(v4);
    }
  }
}

- (unint64_t)_accessibilityTextEntryTraits
{
  unint64_t v3;
  void *v4;
  unint64_t v5;
  int v6;
  unint64_t v7;

  v3 = -[WebAccessibilityObjectWrapper _axTextEntryTrait](self, "_axTextEntryTrait");
  v4 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
  if ((*(unsigned int (**)(void *))(*(_QWORD *)v4 + 552))(v4))
  {
    v5 = -[WebAccessibilityObjectWrapper _axHasTextCursorTrait](self, "_axHasTextCursorTrait");
    v3 |= v5 | -[WebAccessibilityObjectWrapper _axTextOperationsAvailableTrait](self, "_axTextOperationsAvailableTrait");
  }
  if ((*(unsigned int (**)(void *))(*(_QWORD *)v4 + 112))(v4))
    v3 |= -[WebAccessibilityObjectWrapper _axSecureTextFieldTrait](self, "_axSecureTextFieldTrait");
  v6 = (*(uint64_t (**)(void *))(*(_QWORD *)v4 + 1456))(v4);
  if (v6 == 125)
  {
    v7 = -[WebAccessibilityObjectWrapper _axTextAreaTrait](self, "_axTextAreaTrait");
    goto LABEL_9;
  }
  if (v6 == 101)
  {
    v7 = -[WebAccessibilityObjectWrapper _axSearchFieldTrait](self, "_axSearchFieldTrait");
LABEL_9:
    v3 |= v7;
  }
  return v3;
}

- (unint64_t)accessibilityTraits
{
  void *v3;
  int v4;
  unint64_t v5;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t m_accessibilityTraitsFromAncestor;

  if (!-[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
    return 0;
  v3 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
  v4 = (*(uint64_t (**)(void *))(*(_QWORD *)v3 + 1456))(v3);
  v5 = -[WebAccessibilityObjectWrapper _axWebContentTrait](self, "_axWebContentTrait");
  if (v4 > 100)
  {
    if (v4 <= 124)
    {
      switch(v4)
      {
        case 'e':
          goto LABEL_34;
        case 'f':
        case 'h':
          v7 = -[WebAccessibilityObjectWrapper _axAdjustableTrait](self, "_axAdjustableTrait");
          goto LABEL_35;
        case 'g':
        case 'i':
        case 'j':
        case 'l':
        case 'm':
        case 'n':
        case 'p':
          goto LABEL_43;
        case 'k':
          v7 = -[WebAccessibilityObjectWrapper _axStaticTextTrait](self, "_axStaticTextTrait");
          goto LABEL_35;
        case 'o':
          v7 = -[WebAccessibilityObjectWrapper _axButtonTrait](self, "_axButtonTrait");
          goto LABEL_35;
        case 'q':
          goto LABEL_18;
        default:
          if (v4 != 119)
            goto LABEL_43;
          v7 = -[WebAccessibilityObjectWrapper _axTabBarTrait](self, "_axTabBarTrait");
          break;
      }
      goto LABEL_35;
    }
    if ((v4 - 125) < 2)
      goto LABEL_34;
    if (v4 == 132)
      goto LABEL_18;
    if (v4 != 139)
      goto LABEL_43;
LABEL_24:
    v5 |= -[WebAccessibilityObjectWrapper _axLinkTrait](self, "_axLinkTrait");
    v9 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
    if ((*(unsigned int (**)(void *))(*(_QWORD *)v9 + 608))(v9) != 2)
      goto LABEL_43;
    v7 = -[WebAccessibilityObjectWrapper _axVisitedTrait](self, "_axVisitedTrait");
    goto LABEL_35;
  }
  if (v4 > 48)
  {
    switch(v4)
    {
      case 'K':
      case 'L':
        v7 = -[WebAccessibilityObjectWrapper _axMenuItemTrait](self, "_axMenuItemTrait");
        goto LABEL_35;
      case 'M':
      case 'N':
        v8 = -[WebAccessibilityObjectWrapper _axMenuItemTrait](self, "_axMenuItemTrait");
        goto LABEL_42;
      case 'O':
      case 'P':
      case 'Q':
      case 'R':
      case 'S':
      case 'U':
      case 'V':
      case 'W':
        goto LABEL_43;
      case 'T':
        v7 = -[WebAccessibilityObjectWrapper _axPopupButtonTrait](self, "_axPopupButtonTrait");
        goto LABEL_35;
      case 'X':
        v8 = -[WebAccessibilityObjectWrapper _axRadioButtonTrait](self, "_axRadioButtonTrait");
        goto LABEL_42;
      default:
        if (v4 == 49)
        {
          v7 = -[WebAccessibilityObjectWrapper _axImageTrait](self, "_axImageTrait");
          goto LABEL_35;
        }
        if (v4 != 65)
          goto LABEL_43;
        break;
    }
    goto LABEL_24;
  }
  if (v4 > 18)
  {
    if (v4 != 19)
    {
      if (v4 != 45)
        goto LABEL_43;
      v7 = -[WebAccessibilityObjectWrapper _axHeaderTrait](self, "_axHeaderTrait");
LABEL_35:
      v5 |= v7;
      goto LABEL_43;
    }
    v11 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
    v12 = (*(uint64_t (**)(void *))(*(_QWORD *)v11 + 840))(v11);
    if (!v12 || (*(_WORD *)(v12 + 28) & 0x10) == 0)
      goto LABEL_43;
    v13 = *(_QWORD *)(*(_QWORD *)(v12 + 96) + 24);
    if ((v13 != *(_QWORD *)(WebCore::HTMLNames::inputTag + 24)
       || (*(_DWORD *)(*(_QWORD *)(v12 + 240) + 12) & 0x2A8C20) == 0)
      && v13 != *(_QWORD *)(WebCore::HTMLNames::textareaTag + 24))
    {
      goto LABEL_43;
    }
LABEL_34:
    v7 = -[WebAccessibilityObjectWrapper _accessibilityTextEntryTraits](self, "_accessibilityTextEntryTraits");
    goto LABEL_35;
  }
  if (v4 != 10)
  {
    if (v4 != 14)
      goto LABEL_43;
LABEL_18:
    v8 = -[WebAccessibilityObjectWrapper _axButtonTrait](self, "_axButtonTrait");
LABEL_42:
    v5 |= v8 | -[WebAccessibilityObjectWrapper _axToggleTrait](self, "_axToggleTrait");
    goto LABEL_43;
  }
  v5 |= -[WebAccessibilityObjectWrapper _axButtonTrait](self, "_axButtonTrait");
  v10 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
  if ((*(unsigned int (**)(void *))(*(_QWORD *)v10 + 600))(v10))
  {
    v7 = -[WebAccessibilityObjectWrapper _axToggleTrait](self, "_axToggleTrait");
    goto LABEL_35;
  }
LABEL_43:
  v14 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
  if ((*(unsigned int (**)(void *))(*(_QWORD *)v14 + 2736))(v14))
    v5 |= -[WebAccessibilityObjectWrapper _axUpdatesFrequentlyTrait](self, "_axUpdatesFrequentlyTrait");
  v15 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
  if ((*(unsigned int (**)(void *))(*(_QWORD *)v15 + 544))(v15))
    v5 |= -[WebAccessibilityObjectWrapper _axSelectedTrait](self, "_axSelectedTrait");
  v16 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
  if (((*(uint64_t (**)(void *))(*(_QWORD *)v16 + 536))(v16) & 1) == 0)
    v5 |= -[WebAccessibilityObjectWrapper _axNotEnabledTrait](self, "_axNotEnabledTrait");
  v17 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
  if ((*(unsigned int (**)(void *))(*(_QWORD *)v17 + 656))(v17))
    v5 |= -[WebAccessibilityObjectWrapper _axToggleTrait](self, "_axToggleTrait");
  m_accessibilityTraitsFromAncestor = self->m_accessibilityTraitsFromAncestor;
  if (m_accessibilityTraitsFromAncestor == -1)
  {
    m_accessibilityTraitsFromAncestor = -[WebAccessibilityObjectWrapper _accessibilityTraitsFromAncestors](self, "_accessibilityTraitsFromAncestors");
    self->m_accessibilityTraitsFromAncestor = m_accessibilityTraitsFromAncestor;
  }
  return m_accessibilityTraitsFromAncestor | v5;
}

- (BOOL)isSVGGroupElement
{
  void *v3;
  uint64_t v4;

  v3 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
  v4 = (*(uint64_t (**)(void *))(*(_QWORD *)v3 + 840))(v3);
  return v4
      && (*(_WORD *)(v4 + 28) & 0x20) != 0
      && *(_QWORD *)(*(_QWORD *)(v4 + 96) + 24) == *(_QWORD *)(WebCore::SVGNames::gTag + 24)
      && objc_msgSend(-[WebAccessibilityObjectWrapper accessibilityLabel](self, "accessibilityLabel"), "length");
}

- (BOOL)determineIsAccessibilityElement
{
  _QWORD *v3;
  WebCore::AXCoreObject *v4;
  uint64_t v5;
  int v7;
  WTF::StringImpl *v8;
  int v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  int v16;
  WTF::StringImpl *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  int v22;
  unsigned int v23;
  id v24;
  id j;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  WTF::StringImpl *v29;
  objc_super v30;

  v3 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
  if (!v3)
  {
    LOBYTE(v9) = 0;
    return v9;
  }
  v4 = (WebCore::AXCoreObject *)v3;
  v5 = v3[1];
  if (__ldaxr((unsigned __int8 *)v5))
  {
    __clrex();
  }
  else if (!__stxr(1u, (unsigned __int8 *)v5))
  {
    goto LABEL_6;
  }
  MEMORY[0x19AEA534C](v5);
LABEL_6:
  ++*(_QWORD *)(v5 + 8);
  v7 = __ldxr((unsigned __int8 *)v5);
  if (v7 != 1)
  {
    __clrex();
    goto LABEL_10;
  }
  if (__stlxr(0, (unsigned __int8 *)v5))
LABEL_10:
    WTF::Lock::unlockSlow((WTF::Lock *)v5);
  v30.receiver = self;
  v30.super_class = (Class)WebAccessibilityObjectWrapper;
  if (-[WebAccessibilityObjectWrapper isAccessibilityElement](&v30, sel_isAccessibilityElement))
  {
    LOBYTE(v9) = 1;
    goto LABEL_17;
  }
  (*(void (**)(WebCore::AXCoreObject *))(*(_QWORD *)v4 + 2528))(v4);
  LOBYTE(v9) = 1;
  switch((*(unsigned int (**)(WebCore::AXCoreObject *))(*(_QWORD *)v4 + 1456))(v4))
  {
    case 0u:
    case 1u:
    case 2u:
    case 3u:
    case 4u:
    case 5u:
    case 6u:
    case 7u:
    case 8u:
    case 9u:
    case 0xBu:
    case 0xCu:
    case 0xDu:
    case 0xFu:
    case 0x11u:
    case 0x12u:
    case 0x15u:
    case 0x16u:
    case 0x17u:
    case 0x18u:
    case 0x19u:
    case 0x1Au:
    case 0x1Bu:
    case 0x1Cu:
    case 0x1Du:
    case 0x1Fu:
    case 0x20u:
    case 0x21u:
    case 0x22u:
    case 0x23u:
    case 0x24u:
    case 0x25u:
    case 0x26u:
    case 0x27u:
    case 0x28u:
    case 0x29u:
    case 0x2Au:
    case 0x2Bu:
    case 0x30u:
    case 0x35u:
    case 0x36u:
    case 0x37u:
    case 0x38u:
    case 0x39u:
    case 0x3Au:
    case 0x3Bu:
    case 0x3Cu:
    case 0x3Du:
    case 0x3Eu:
    case 0x3Fu:
    case 0x42u:
    case 0x43u:
    case 0x45u:
    case 0x47u:
    case 0x48u:
    case 0x49u:
    case 0x4Au:
    case 0x4Fu:
    case 0x50u:
    case 0x52u:
    case 0x53u:
    case 0x55u:
    case 0x59u:
    case 0x5Bu:
    case 0x5Cu:
    case 0x5Du:
    case 0x5Eu:
    case 0x5Fu:
    case 0x60u:
    case 0x61u:
    case 0x62u:
    case 0x63u:
    case 0x64u:
    case 0x69u:
    case 0x6Au:
    case 0x6Cu:
    case 0x6Du:
    case 0x6Eu:
    case 0x6Fu:
    case 0x70u:
    case 0x72u:
    case 0x73u:
    case 0x74u:
    case 0x75u:
    case 0x76u:
    case 0x77u:
    case 0x78u:
    case 0x7Au:
    case 0x7Bu:
    case 0x7Cu:
    case 0x7Fu:
    case 0x80u:
    case 0x81u:
    case 0x82u:
    case 0x83u:
    case 0x85u:
    case 0x87u:
    case 0x89u:
    case 0x8Au:
      goto LABEL_14;
    case 0xAu:
    case 0xEu:
    case 0x10u:
    case 0x13u:
    case 0x14u:
    case 0x1Eu:
    case 0x2Eu:
    case 0x31u:
    case 0x32u:
    case 0x33u:
    case 0x34u:
    case 0x44u:
    case 0x46u:
    case 0x4Bu:
    case 0x4Cu:
    case 0x4Du:
    case 0x4Eu:
    case 0x51u:
    case 0x54u:
    case 0x57u:
    case 0x58u:
    case 0x65u:
    case 0x66u:
    case 0x67u:
    case 0x68u:
    case 0x71u:
    case 0x79u:
    case 0x7Du:
    case 0x7Eu:
    case 0x84u:
      goto LABEL_17;
    case 0x2Cu:
      if (-[WebAccessibilityObjectWrapper isSVGGroupElement](self, "isSVGGroupElement"))
        goto LABEL_17;
LABEL_14:
      if (!(*(unsigned int (**)(WebCore::AXCoreObject *))(*(_QWORD *)v4 + 520))(v4))
        goto LABEL_16;
      if (-[WebAccessibilityObjectWrapper accessibilityElementCount](self, "accessibilityElementCount"))
        goto LABEL_16;
      WebCore::AXCoreObject::descriptionAttributeValue(v4, &v29);
      v18 = v29;
      if (!v29)
        goto LABEL_16;
      v19 = *((_QWORD *)v29 + 1);
      v20 = *((unsigned int *)v29 + 1);
      if ((*((_BYTE *)v29 + 16) & 4) == 0)
      {
        if ((_DWORD)v20)
        {
          for (i = 0; i != v20; ++i)
          {
            v23 = *(unsigned __int16 *)(v19 + 2 * i);
            if (v23 > 0xFF)
            {
              if (MEMORY[0x19AEA858C]() != 9)
                goto LABEL_67;
            }
            else if (v23 - 9 >= 5 && v23 != 32)
            {
              goto LABEL_67;
            }
          }
          i = -1;
LABEL_67:
          v18 = v29;
          goto LABEL_68;
        }
LABEL_53:
        LOBYTE(v9) = 0;
        v29 = 0;
        goto LABEL_69;
      }
      if (!(_DWORD)v20)
        goto LABEL_53;
      i = 0;
      while (1)
      {
        v22 = *(unsigned __int8 *)(v19 + i);
        if ((v22 - 9) >= 5 && v22 != 32)
          break;
        if (v20 == ++i)
        {
          i = -1;
          break;
        }
      }
LABEL_68:
      LOBYTE(v9) = i != -1;
      v29 = 0;
      if (!v18)
        goto LABEL_17;
LABEL_69:
      if (*(_DWORD *)v18 == 2)
        WTF::StringImpl::destroy(v18, v8);
      else
        *(_DWORD *)v18 -= 2;
LABEL_17:
      v10 = *((_QWORD *)v4 + 1);
      if (__ldaxr((unsigned __int8 *)v10))
      {
        __clrex();
      }
      else if (!__stxr(1u, (unsigned __int8 *)v10))
      {
        goto LABEL_21;
      }
      MEMORY[0x19AEA534C](v10);
LABEL_21:
      v12 = *(_QWORD *)(v10 + 8);
      v13 = v12 - 1;
      *(_QWORD *)(v10 + 8) = v12 - 1;
      if (v12 == 1)
      {
        v28 = *(_QWORD *)(v10 + 16);
        v14 = *(_QWORD *)(v10 + 24);
        *(_QWORD *)(v10 + 24) = 0;
        v15 = v28 != 0;
      }
      else
      {
        v14 = 0;
        v15 = 1;
      }
      v16 = __ldxr((unsigned __int8 *)v10);
      if (v16 == 1)
      {
        if (!__stlxr(0, (unsigned __int8 *)v10))
        {
          if (v13)
            return v9;
          goto LABEL_29;
        }
      }
      else
      {
        __clrex();
      }
      WTF::Lock::unlockSlow((WTF::Lock *)v10);
      if (v13)
        return v9;
LABEL_29:
      if (v14)
        (*(void (**)(uint64_t))(*(_QWORD *)v14 + 8))(v14);
      if (!v15)
        WTF::fastFree((WTF *)v10, v8);
      return v9;
    case 0x2Du:
      goto LABEL_64;
    case 0x41u:
    case 0x8Bu:
      if (!-[WebAccessibilityObjectWrapper containsUnnaturallySegmentedChildren](self, "containsUnnaturallySegmentedChildren"))LABEL_64:LOBYTE(v9) = -[WebAccessibilityObjectWrapper accessibilityElementCount](self, "accessibilityElementCount") == 0;
      goto LABEL_17;
    case 0x6Bu:
      v24 = -[WebAccessibilityObjectWrapper accessibilityLabel](self, "accessibilityLabel");
      if (!objc_msgSend((id)objc_msgSend(v24, "stringByTrimmingCharactersInSet:", objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet")), "length"))goto LABEL_16;
      for (j = -[WebAccessibilityObjectWrapper accessibilityContainer](self, "accessibilityContainer");
            j;
            j = *(id *)(v27 + 24))
      {
        if ((objc_msgSend(j, "isAccessibilityElement") & 1) != 0)
          break;
        v26 = objc_msgSend(j, "axBackingObject");
        if (!v26
          || objc_msgSend(j, "isAttachment")
          && !objc_msgSend((id)objc_msgSend(j, "attachmentView"), "accessibilityIsIgnored"))
        {
          break;
        }
        v27 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v26 + 1240))(v26);
        if (!v27)
          break;
      }
      v9 = objc_msgSend(j, "containsUnnaturallySegmentedChildren") ^ 1;
      goto LABEL_17;
    case 0x88u:
      LOBYTE(v9) = -[WebAccessibilityObjectWrapper accessibilityIsWebInteractiveVideo](self, "accessibilityIsWebInteractiveVideo");
      goto LABEL_17;
    default:
LABEL_16:
      LOBYTE(v9) = 0;
      goto LABEL_17;
  }
}

- (BOOL)isAccessibilityElement
{
  int m_isAccessibilityElement;

  m_isAccessibilityElement = -[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall");
  if (m_isAccessibilityElement)
  {
    m_isAccessibilityElement = self->m_isAccessibilityElement;
    if (m_isAccessibilityElement == -1)
    {
      m_isAccessibilityElement = -[WebAccessibilityObjectWrapper determineIsAccessibilityElement](self, "determineIsAccessibilityElement");
      self->m_isAccessibilityElement = m_isAccessibilityElement;
    }
    LOBYTE(m_isAccessibilityElement) = m_isAccessibilityElement != 0;
  }
  return m_isAccessibilityElement;
}

- (BOOL)stringValueShouldBeUsedInLabel
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  int v7;
  int v8;
  void *v9;
  BOOL v10;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  BOOL v19;
  int v20;
  int v22;
  uint64_t v23;

  v3 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
  if (!v3)
    return 0;
  v4 = v3;
  v5 = v3[1];
  if (__ldaxr((unsigned __int8 *)v5))
  {
    __clrex();
  }
  else if (!__stxr(1u, (unsigned __int8 *)v5))
  {
    goto LABEL_6;
  }
  MEMORY[0x19AEA534C](v5);
LABEL_6:
  ++*(_QWORD *)(v5 + 8);
  v7 = __ldxr((unsigned __int8 *)v5);
  if (v7 != 1)
  {
    __clrex();
    goto LABEL_10;
  }
  if (__stlxr(0, (unsigned __int8 *)v5))
LABEL_10:
    WTF::Lock::unlockSlow((WTF::Lock *)v5);
  v8 = (*(uint64_t (**)(_QWORD *))(*v4 + 1456))(v4);
  v10 = 1;
  if (((v8 - 101) > 0x19 || ((1 << (v8 - 101)) & 0x3000001) == 0) && v8 != 19)
  {
    v22 = (*(uint64_t (**)(_QWORD *))(*v4 + 1456))(v4);
    if (v22 != 84
      && (*(unsigned int (**)(_QWORD *))(*v4 + 1456))(v4) != 20
      && ((*(uint64_t (**)(_QWORD *))(*v4 + 168))(v4) & 1) == 0)
    {
      v10 = -[WebAccessibilityObjectWrapper accessibilityIsWebInteractiveVideo](self, "accessibilityIsWebInteractiveVideo");
    }
  }
  v13 = v4[1];
  if (__ldaxr((unsigned __int8 *)v13))
  {
    __clrex();
  }
  else if (!__stxr(1u, (unsigned __int8 *)v13))
  {
    goto LABEL_23;
  }
  MEMORY[0x19AEA534C](v13);
LABEL_23:
  v15 = *(_QWORD *)(v13 + 8);
  v16 = v15 - 1;
  *(_QWORD *)(v13 + 8) = v15 - 1;
  if (v15 == 1)
  {
    v23 = *(_QWORD *)(v13 + 16);
    v17 = *(_QWORD *)(v13 + 24);
    *(_QWORD *)(v13 + 24) = 0;
    v18 = v23 != 0;
  }
  else
  {
    v17 = 0;
    v18 = 1;
  }
  v19 = !v10;
  v20 = __ldxr((unsigned __int8 *)v13);
  if (v20 == 1)
  {
    if (!__stlxr(0, (unsigned __int8 *)v13))
    {
      if (v16)
        return v19;
      goto LABEL_31;
    }
  }
  else
  {
    __clrex();
  }
  WTF::Lock::unlockSlow((WTF::Lock *)v13);
  if (v16)
    return v19;
LABEL_31:
  if (v17)
    (*(void (**)(uint64_t))(*(_QWORD *)v17 + 8))(v17);
  if (!v18)
    WTF::fastFree((WTF *)v13, v9);
  return v19;
}

- (BOOL)_accessibilityHasTouchEventListener
{
  int v3;
  void *v4;

  v3 = -[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall");
  if (v3)
  {
    v4 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
    LOBYTE(v3) = (*(uint64_t (**)(void *))(*(_QWORD *)v4 + 2520))(v4);
  }
  return v3;
}

- (BOOL)_accessibilityIsStrongPasswordField
{
  int v3;
  void *v4;
  void *v5;

  v3 = -[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall");
  if (v3)
  {
    v4 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
    v3 = (*(uint64_t (**)(void *))(*(_QWORD *)v4 + 112))(v4);
    if (v3)
    {
      v5 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
      LOBYTE(v3) = (*(unsigned int (**)(void *))(*(_QWORD *)v5 + 2208))(v5) == 3;
    }
  }
  return v3;
}

- (double)_accessibilityMinValue
{
  _BOOL4 v3;
  double result;
  void *v5;

  v3 = -[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall");
  result = 0.0;
  if (v3)
  {
    v5 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject", 0.0);
    return (*(float (**)(void *))(*(_QWORD *)v5 + 912))(v5);
  }
  return result;
}

- (double)_accessibilityMaxValue
{
  _BOOL4 v3;
  double result;
  void *v5;

  v3 = -[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall");
  result = 0.0;
  if (v3)
  {
    v5 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject", 0.0);
    return (*(float (**)(void *))(*(_QWORD *)v5 + 904))(v5);
  }
  return result;
}

- (id)accessibilityRoleDescription
{
  void *v3;
  void *v4;
  WTF::StringImpl *v5;
  WTF::StringImpl *v6;
  WTF::StringImpl *v8;

  if (!-[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
    return 0;
  v3 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
  if ((*(unsigned int (**)(void *))(*(_QWORD *)v3 + 1456))(v3) != 16)
  {
    (*(void (**)(WTF::StringImpl **__return_ptr))(*(_QWORD *)-[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject")+ 1472))(&v8);
    if (v8)
      goto LABEL_7;
    return &stru_1E3487BC0;
  }
  WebCore::AXColorWellText((uint64_t)&v8);
  if (!v8)
    return &stru_1E3487BC0;
LABEL_7:
  v4 = (void *)WTF::StringImpl::operator NSString *();
  v6 = v8;
  v8 = 0;
  if (v6)
  {
    if (*(_DWORD *)v6 == 2)
      WTF::StringImpl::destroy(v6, v5);
    else
      *(_DWORD *)v6 -= 2;
  }
  return v4;
}

- (id)accessibilityBrailleLabel
{
  WTF::StringImpl *v3;
  void *v4;
  WTF::StringImpl *v5;
  WTF::StringImpl *v7;

  if (!-[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
    return 0;
  (*(void (**)(WTF::StringImpl **__return_ptr))(*(_QWORD *)-[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject")+ 936))(&v7);
  if (!v7)
    return &stru_1E3487BC0;
  v4 = (void *)WTF::StringImpl::operator NSString *();
  v5 = v7;
  v7 = 0;
  if (v5)
  {
    if (*(_DWORD *)v5 == 2)
      WTF::StringImpl::destroy(v5, v3);
    else
      *(_DWORD *)v5 -= 2;
  }
  return v4;
}

- (id)accessibilityBrailleRoleDescription
{
  WTF::StringImpl *v3;
  void *v4;
  WTF::StringImpl *v5;
  WTF::StringImpl *v7;

  if (!-[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
    return 0;
  (*(void (**)(WTF::StringImpl **__return_ptr))(*(_QWORD *)-[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject")+ 944))(&v7);
  if (!v7)
    return &stru_1E3487BC0;
  v4 = (void *)WTF::StringImpl::operator NSString *();
  v5 = v7;
  v7 = 0;
  if (v5)
  {
    if (*(_DWORD *)v5 == 2)
      WTF::StringImpl::destroy(v5, v3);
    else
      *(_DWORD *)v5 -= 2;
  }
  return v4;
}

- (id)accessibilityLabel
{
  const __CFString *v3;
  WebCore::AXCoreObject *v4;
  unint64_t v5;
  uint64_t v6;
  WebCore::AXCoreObject *v7;
  __CFString *v8;
  id v9;
  const WTF::StringImpl *v10;
  WTF::StringImpl *v11;
  int v12;
  WTF::StringImpl *v13;
  WTF::StringImpl *v14;
  WTF::StringImpl *v15;
  WTF::StringImpl *v16;
  WTF::StringImpl *v17;
  __CFString *v18;
  __CFString *v19;
  WTF::StringImpl *v20;
  WTF::StringImpl *v21;
  __CFString *v22;
  const WTF::StringImpl *v23;
  __CFString *v24;
  WTF::StringImpl *v25;
  __CFString *v26;
  WTF::StringImpl *v27;
  void *v28;
  WTF::StringImpl *v29;
  WTF::StringImpl *v30;
  WTF::StringImpl *v31;
  WTF::StringImpl *v33;
  WTF::StringImpl *v34;
  WTF::StringImpl *v35;
  objc_super v36;

  if (!-[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
    return 0;
  v36.receiver = self;
  v36.super_class = (Class)WebAccessibilityObjectWrapper;
  v3 = -[WebAccessibilityObjectWrapper accessibilityLabel](&v36, sel_accessibilityLabel);
  if (!v3)
  {
    v4 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
    if ((*(unsigned int (**)(WebCore::AXCoreObject *))(*(_QWORD *)v4 + 1456))(v4) == 107)
    {
      v5 = -[WebAccessibilityObjectWrapper accessibilityTraits](self, "accessibilityTraits");
      if ((-[WebAccessibilityObjectWrapper _axHeaderTrait](self, "_axHeaderTrait") & v5) != 0)
      {
        v6 = (*(uint64_t (**)(WebCore::AXCoreObject *))(*(_QWORD *)v4 + 1232))(v4);
        if (v6)
        {
          v7 = (WebCore::AXCoreObject *)v6;
          while ((*(unsigned int (**)(WebCore::AXCoreObject *))(*(_QWORD *)v7 + 1456))(v7) != 45)
          {
            v7 = (WebCore::AXCoreObject *)(*(uint64_t (**)(WebCore::AXCoreObject *))(*(_QWORD *)v7 + 1232))(v7);
            if (!v7)
              goto LABEL_9;
          }
          WebCore::AXCoreObject::descriptionAttributeValue(v7, &v35);
          if (v35 && *((_DWORD *)v35 + 1))
          {
            v3 = (const __CFString *)WTF::StringImpl::operator NSString *();
            goto LABEL_68;
          }
          (*(void (**)(WTF::StringImpl **__return_ptr, WebCore::AXCoreObject *))(*(_QWORD *)v4 + 1384))(&v34, v4);
          if (!v34)
          {
            v3 = &stru_1E3487BC0;
LABEL_68:
            v31 = v35;
            v35 = 0;
            if (v31)
            {
              if (*(_DWORD *)v31 == 2)
                WTF::StringImpl::destroy(v31, v29);
              else
                *(_DWORD *)v31 -= 2;
            }
            return (id)v3;
          }
          v3 = (const __CFString *)WTF::StringImpl::operator NSString *();
LABEL_65:
          v30 = v34;
          v34 = 0;
          if (v30)
          {
            if (*(_DWORD *)v30 == 2)
              WTF::StringImpl::destroy(v30, v29);
            else
              *(_DWORD *)v30 -= 2;
          }
          goto LABEL_68;
        }
      }
    }
LABEL_9:
    (*(void (**)(WTF::StringImpl **__return_ptr, WebCore::AXCoreObject *))(*(_QWORD *)v4 + 2568))(&v35, v4);
    WebCore::AXCoreObject::descriptionAttributeValue(v4, &v34);
    v8 = -[WebAccessibilityObjectWrapperBase ariaLandmarkRoleDescription](self, "ariaLandmarkRoleDescription");
    v9 = -[WebAccessibilityObjectWrapper interactiveVideoDescription](self, "interactiveVideoDescription");
    if ((*(unsigned int (**)(WebCore::AXCoreObject *))(*(_QWORD *)v4 + 1456))(v4) != 20)
      goto LABEL_17;
    MEMORY[0x19AEA5508](&v33, -[WebAccessibilityObjectWrapper accessibilityValue](self, "accessibilityValue"));
    v12 = WTF::equal(v35, v33, v10);
    v13 = v33;
    v33 = 0;
    if (v13)
    {
      if (*(_DWORD *)v13 == 2)
      {
        WTF::StringImpl::destroy(v13, v11);
        if (v12)
        {
LABEL_14:
          v14 = (WTF::StringImpl *)MEMORY[0x1E0CBEF70];
          *MEMORY[0x1E0CBEF70] += 2;
          v15 = v35;
          v35 = v14;
          if (v15)
          {
            if (*(_DWORD *)v15 == 2)
              WTF::StringImpl::destroy(v15, v11);
            else
              *(_DWORD *)v15 -= 2;
          }
        }
LABEL_17:
        if ((*(unsigned int (**)(WebCore::AXCoreObject *))(*(_QWORD *)v4 + 1456))(v4) == 35)
        {
          WebCore::AXFooterRoleDescriptionText((uint64_t)&v33);
          if (v33)
          {
            v8 = (__CFString *)WTF::StringImpl::operator NSString *();
            v17 = v33;
            v33 = 0;
            if (v17)
            {
              if (*(_DWORD *)v17 == 2)
                WTF::StringImpl::destroy(v17, v16);
              else
                *(_DWORD *)v17 -= 2;
            }
          }
          else
          {
            v8 = &stru_1E3487BC0;
          }
        }
        v18 = (__CFString *)objc_msgSend(MEMORY[0x1E0CB37A0], "string");
        if ((*(unsigned int (**)(WebCore::AXCoreObject *))(*(_QWORD *)v4 + 1456))(v4) == 46)
        {
          WebCore::AXHorizontalRuleDescriptionText((uint64_t)&v33);
          if (v33)
            v19 = (__CFString *)WTF::StringImpl::operator NSString *();
          else
            v19 = &stru_1E3487BC0;
          if (-[__CFString length](v19, "length"))
          {
            if (-[__CFString length](v18, "length"))
              -[__CFString appendString:](v18, "appendString:", CFSTR(", "));
            -[__CFString appendString:](v18, "appendString:", v19);
          }
          v21 = v33;
          v33 = 0;
          if (v21)
          {
            if (*(_DWORD *)v21 == 2)
              WTF::StringImpl::destroy(v21, v20);
            else
              *(_DWORD *)v21 -= 2;
          }
        }
        if (v35)
          v22 = (__CFString *)WTF::StringImpl::operator NSString *();
        else
          v22 = &stru_1E3487BC0;
        if (-[__CFString length](v22, "length"))
        {
          if (-[__CFString length](v18, "length"))
            -[__CFString appendString:](v18, "appendString:", CFSTR(", "));
          -[__CFString appendString:](v18, "appendString:", v22);
        }
        if ((WTF::equal(v34, v35, v23) & 1) == 0)
        {
          v24 = v34 ? (__CFString *)WTF::StringImpl::operator NSString *() : &stru_1E3487BC0;
          if (-[__CFString length](v24, "length"))
          {
            if (-[__CFString length](v18, "length"))
              -[__CFString appendString:](v18, "appendString:", CFSTR(", "));
            -[__CFString appendString:](v18, "appendString:", v24);
          }
        }
        if (-[WebAccessibilityObjectWrapper stringValueShouldBeUsedInLabel](self, "stringValueShouldBeUsedInLabel"))
        {
          (*(void (**)(WTF::StringImpl **__return_ptr, WebCore::AXCoreObject *))(*(_QWORD *)v4 + 1384))(&v33, v4);
          if (v33)
          {
            v26 = (__CFString *)WTF::StringImpl::operator NSString *();
            v27 = v33;
            v33 = 0;
            if (v27)
            {
              if (*(_DWORD *)v27 == 2)
                WTF::StringImpl::destroy(v27, v25);
              else
                *(_DWORD *)v27 -= 2;
            }
          }
          else
          {
            v26 = &stru_1E3487BC0;
          }
          v28 = (void *)-[__CFString stringByTrimmingCharactersInSet:](v26, "stringByTrimmingCharactersInSet:", objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet"));
          if (objc_msgSend(v28, "length"))
          {
            if (-[__CFString length](v18, "length"))
              -[__CFString appendString:](v18, "appendString:", CFSTR(", "));
            -[__CFString appendString:](v18, "appendString:", v28);
          }
        }
        if (-[__CFString length](v8, "length"))
        {
          if (-[__CFString length](v18, "length"))
            -[__CFString appendString:](v18, "appendString:", CFSTR(", "));
          -[__CFString appendString:](v18, "appendString:", v8);
        }
        if (objc_msgSend(v9, "length"))
        {
          if (-[__CFString length](v18, "length"))
            -[__CFString appendString:](v18, "appendString:", CFSTR(", "));
          -[__CFString appendString:](v18, "appendString:", v9);
        }
        if (-[__CFString length](v18, "length"))
          v3 = v18;
        else
          v3 = 0;
        goto LABEL_65;
      }
      *(_DWORD *)v13 -= 2;
    }
    if (v12)
      goto LABEL_14;
    goto LABEL_17;
  }
  return (id)v3;
}

- (void)tableCellParent
{
  void *v2;

  v2 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
  do
  {
    if (((*(uint64_t (**)(void *))(*(_QWORD *)v2 + 304))(v2) & 1) != 0)
      break;
    v2 = (void *)(*(uint64_t (**)(void *))(*(_QWORD *)v2 + 1232))(v2);
  }
  while (v2);
  return v2;
}

- (void)tableParent
{
  void *v2;
  void *result;

  v2 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
  while (!(*(unsigned int (**)(void *))(*(_QWORD *)v2 + 176))(v2)
       || ((*(uint64_t (**)(void *))(*(_QWORD *)v2 + 184))(v2) & 1) == 0)
  {
    result = (void *)(*(uint64_t (**)(void *))(*(_QWORD *)v2 + 1232))(v2);
    v2 = result;
    if (!result)
      return result;
  }
  if ((*(unsigned int (**)(void *))(*(_QWORD *)v2 + 64))(v2))
    return v2;
  else
    return 0;
}

- (id)accessibilityTitleElement
{
  void *v3;
  id result;

  if (!-[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
    return 0;
  v3 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
  result = (id)(*(uint64_t (**)(void *))(*(_QWORD *)v3 + 1320))(v3);
  if (result)
    return (id)*((_QWORD *)result + 3);
  return result;
}

- (id)accessibilityHeaderElements
{
  unsigned int *v3;
  unsigned int *v4;
  void *v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  int v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  BOOL v20;
  int v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  void *v26;
  uint64_t v28;
  uint64_t v29;
  unsigned int v30;
  _QWORD *v31;
  unsigned int v32;

  if (!-[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
    return 0;
  v3 = -[WebAccessibilityObjectWrapper tableCellParent](self, "tableCellParent");
  if (!v3)
    return 0;
  v4 = v3;
  v5 = -[WebAccessibilityObjectWrapper tableParent](self, "tableParent");
  if (v5)
  {
    v6 = (*(uint64_t (**)(unsigned int *))(*(_QWORD *)v4 + 3328))(v4);
    if (v6)
      (*(void (**)(uint64_t))(*(_QWORD *)v6 + 1904))(v6);
    v7 = v4[64];
    v8 = (*(uint64_t (**)(unsigned int *))(*(_QWORD *)v4 + 3328))(v4);
    if (v8)
      (*(void (**)(uint64_t))(*(_QWORD *)v8 + 1904))(v8);
    WebCore::AccessibilityTableCell::colSpan((WebCore::AccessibilityTableCell *)v4);
    v9 = v4[65];
    (*(void (**)(_QWORD **__return_ptr, void *))(*(_QWORD *)v5 + 256))(&v31, v5);
    (*(void (**)(uint64_t *__return_ptr, void *))(*(_QWORD *)v5 + 248))(&v29, v5);
    v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    if (v9 >= v30)
      goto LABEL_38;
    v11 = *(_QWORD *)(v29 + 8 * v9);
    if (!v11)
    {
LABEL_20:
      if (*(_QWORD *)(v11 + 24))
        objc_msgSend(v5, "addObject:");
      v15 = *(_QWORD *)(v11 + 8);
      if (__ldaxr((unsigned __int8 *)v15))
      {
        __clrex();
      }
      else if (!__stxr(1u, (unsigned __int8 *)v15))
      {
        goto LABEL_26;
      }
      MEMORY[0x19AEA534C](v15);
LABEL_26:
      v17 = *(_QWORD *)(v15 + 8);
      v18 = v17 - 1;
      *(_QWORD *)(v15 + 8) = v17 - 1;
      if (v17 == 1)
      {
        v28 = *(_QWORD *)(v15 + 16);
        v19 = *(_QWORD *)(v15 + 24);
        *(_QWORD *)(v15 + 24) = 0;
        v20 = v28 != 0;
      }
      else
      {
        v19 = 0;
        v20 = 1;
      }
      v21 = __ldxr((unsigned __int8 *)v15);
      if (v21 == 1)
      {
        if (!__stlxr(0, (unsigned __int8 *)v15))
        {
LABEL_33:
          if (!v18)
          {
            if (v19)
              (*(void (**)(uint64_t))(*(_QWORD *)v19 + 8))(v19);
            if (!v20)
              WTF::fastFree((WTF *)v15, v10);
          }
LABEL_38:
          if (v32)
          {
            v22 = v31;
            v23 = 8 * v32;
            while (((*(uint64_t (**)(_QWORD))(*(_QWORD *)*v22 + 304))(*v22) & 1) != 0)
            {
              v24 = (*(uint64_t (**)(_QWORD))(*(_QWORD *)*v22 + 344))(*v22);
              if (v7 >= v24 && HIDWORD(v24) + (int)v24 > v7)
              {
                if (*(_QWORD *)(*v22 + 24))
                  objc_msgSend(v5, "addObject:");
                break;
              }
              ++v22;
              v23 -= 8;
              if (!v23)
                break;
            }
          }
          WTF::Vector<WTF::RefPtr<WebCore::AXCoreObject,WTF::RawPtrTraits<WebCore::AXCoreObject>,WTF::DefaultRefDerefTraits<WebCore::AXCoreObject>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v29, v10);
          WTF::Vector<WTF::RefPtr<WebCore::AXCoreObject,WTF::RawPtrTraits<WebCore::AXCoreObject>,WTF::DefaultRefDerefTraits<WebCore::AXCoreObject>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v31, v26);
          return v5;
        }
      }
      else
      {
        __clrex();
      }
      WTF::Lock::unlockSlow((WTF::Lock *)v15);
      goto LABEL_33;
    }
    v12 = *(_QWORD *)(v11 + 8);
    if (__ldaxr((unsigned __int8 *)v12))
    {
      __clrex();
    }
    else if (!__stxr(1u, (unsigned __int8 *)v12))
    {
      goto LABEL_15;
    }
    MEMORY[0x19AEA534C](v12);
LABEL_15:
    ++*(_QWORD *)(v12 + 8);
    v14 = __ldxr((unsigned __int8 *)v12);
    if (v14 == 1)
    {
      if (!__stlxr(0, (unsigned __int8 *)v12))
        goto LABEL_20;
    }
    else
    {
      __clrex();
    }
    WTF::Lock::unlockSlow((WTF::Lock *)v12);
    goto LABEL_20;
  }
  return v5;
}

- (id)accessibilityElementForRow:(int64_t)a3 andColumn:(int64_t)a4
{
  id result;

  if (!-[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
    return 0;
  result = -[WebAccessibilityObjectWrapper tableParent](self, "tableParent");
  if (result)
  {
    result = (id)(*(uint64_t (**)(id, int64_t, int64_t))(*(_QWORD *)result + 240))(result, a4, a3);
    if (result)
      return (id)*((_QWORD *)result + 3);
  }
  return result;
}

- (unint64_t)accessibilityRowCount
{
  unint64_t result;
  unint64_t v4;

  if (!-[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
    return 0;
  result = -[WebAccessibilityObjectWrapper tableParent](self, "tableParent");
  if (result)
  {
    v4 = result;
    (*(void (**)(unint64_t))(*(_QWORD *)result + 1904))(result);
    return *(unsigned int *)(v4 + 268);
  }
  return result;
}

- (unint64_t)accessibilityColumnCount
{
  unint64_t result;
  unint64_t v4;

  if (!-[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
    return 0;
  result = -[WebAccessibilityObjectWrapper tableParent](self, "tableParent");
  if (result)
  {
    v4 = result;
    (*(void (**)(unint64_t))(*(_QWORD *)result + 1904))(result);
    return *(unsigned int *)(v4 + 284);
  }
  return result;
}

- (unint64_t)accessibilityARIARowCount
{
  unint64_t result;
  unint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  unint64_t v7;
  int v8;
  uint64_t v9;

  if (!-[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
    return 0;
  result = -[WebAccessibilityObjectWrapper tableParent](self, "tableParent");
  if (result)
  {
    v4 = result;
    v5 = *WebCore::AccessibilityObject::getAttribute((WebCore::AccessibilityObject *)result, (WebCore::QualifiedName::QualifiedNameImpl **)&WebCore::HTMLNames::aria_rowcountAttr);
    if (v5)
    {
      v6 = *(uint64_t **)(v5 + 8);
      v7 = *(unsigned int *)(v5 + 4) | ((unint64_t)((*(_DWORD *)(v5 + 16) >> 2) & 1) << 32);
    }
    else
    {
      v6 = 0;
      v7 = 0x100000000;
    }
    WebCore::parseHTMLInteger(v6, v7, &v9);
    if (HIDWORD(v9))
      v8 = 0;
    else
      v8 = v9;
    if (v8 != -1 && v8 < *(_DWORD *)(v4 + 268))
      v8 = 0;
    return v8 & ~(v8 >> 31);
  }
  return result;
}

- (unint64_t)accessibilityARIAColumnCount
{
  unint64_t result;
  unint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  unint64_t v7;
  int v8;
  uint64_t v9;

  if (!-[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
    return 0;
  result = -[WebAccessibilityObjectWrapper tableParent](self, "tableParent");
  if (result)
  {
    v4 = result;
    v5 = *WebCore::AccessibilityObject::getAttribute((WebCore::AccessibilityObject *)result, (WebCore::QualifiedName::QualifiedNameImpl **)&WebCore::HTMLNames::aria_colcountAttr);
    if (v5)
    {
      v6 = *(uint64_t **)(v5 + 8);
      v7 = *(unsigned int *)(v5 + 4) | ((unint64_t)((*(_DWORD *)(v5 + 16) >> 2) & 1) << 32);
    }
    else
    {
      v6 = 0;
      v7 = 0x100000000;
    }
    WebCore::parseHTMLInteger(v6, v7, &v9);
    if (HIDWORD(v9))
      v8 = 0;
    else
      v8 = v9;
    if (v8 != -1 && v8 < *(_DWORD *)(v4 + 284))
      v8 = 0;
    return v8 & ~(v8 >> 31);
  }
  return result;
}

- (unint64_t)accessibilityARIARowIndex
{
  void *v3;
  unint64_t v4;
  int v5;

  if (!-[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
    return 0x7FFFFFFFFFFFFFFFLL;
  v3 = -[WebAccessibilityObjectWrapper tableCellParent](self, "tableCellParent");
  v4 = 0x7FFFFFFFFFFFFFFFLL;
  if (v3)
  {
    v5 = (*(uint64_t (**)(void *))(*(_QWORD *)v3 + 368))(v3);
    if (v5 > 0)
      return v5;
  }
  return v4;
}

- (unint64_t)accessibilityARIAColumnIndex
{
  void *v3;
  unint64_t v4;
  int v5;

  if (!-[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
    return 0x7FFFFFFFFFFFFFFFLL;
  v3 = -[WebAccessibilityObjectWrapper tableCellParent](self, "tableCellParent");
  v4 = 0x7FFFFFFFFFFFFFFFLL;
  if (v3)
  {
    v5 = (*(uint64_t (**)(void *))(*(_QWORD *)v3 + 360))(v3);
    if (v5 > 0)
      return v5;
  }
  return v4;
}

- (_NSRange)accessibilityRowRange
{
  void *v3;
  void *v4;
  NSUInteger v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSUInteger v10;
  NSUInteger v11;
  uint64_t v12;
  unsigned int v13;
  _NSRange result;

  if (!-[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
  {
    v5 = 0;
    goto LABEL_6;
  }
  v3 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
  if ((*(unsigned int (**)(void *))(*(_QWORD *)v3 + 1456))(v3) != 88)
  {
    v7 = -[WebAccessibilityObjectWrapper tableCellParent](self, "tableCellParent");
    v5 = (NSUInteger)v7;
    if (v7)
    {
      v8 = (*(uint64_t (**)(void *))(*(_QWORD *)v7 + 3328))(v7);
      if (v8)
        (*(void (**)(uint64_t))(*(_QWORD *)v8 + 1904))(v8);
      v6 = *(unsigned int *)(v5 + 256);
      v5 = *(unsigned int *)(v5 + 268);
      goto LABEL_17;
    }
LABEL_6:
    v6 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_17;
  }
  WebCore::AXCoreObject::linkedObjects((WebCore::AXCoreObject *)-[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject"), (uint64_t)&v12);
  if (v13 >= 2)
  {
    v9 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
    v5 = v13;
    if (v13)
    {
      v6 = 0;
      while (*(void **)(v12 + 8 * v6) != v9)
      {
        if (v13 == ++v6)
          goto LABEL_15;
      }
    }
    else
    {
LABEL_15:
      v6 = -1;
    }
  }
  else
  {
    v5 = 0;
    v6 = 0x7FFFFFFFFFFFFFFFLL;
  }
  WTF::Vector<WTF::RefPtr<WebCore::AXCoreObject,WTF::RawPtrTraits<WebCore::AXCoreObject>,WTF::DefaultRefDerefTraits<WebCore::AXCoreObject>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v12, v4);
LABEL_17:
  v10 = v6;
  v11 = v5;
  result.length = v11;
  result.location = v10;
  return result;
}

- (_NSRange)accessibilityColumnRange
{
  unsigned int *v3;
  unsigned int *v4;
  uint64_t v5;
  unsigned int v6;
  NSUInteger v7;
  NSUInteger v8;
  _NSRange result;

  if (-[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall")
    && (v3 = -[WebAccessibilityObjectWrapper tableCellParent](self, "tableCellParent")) != 0)
  {
    v4 = v3;
    v5 = (*(uint64_t (**)(unsigned int *))(*(_QWORD *)v3 + 3328))(v3);
    if (v5)
      (*(void (**)(uint64_t))(*(_QWORD *)v5 + 1904))(v5);
    v6 = WebCore::AccessibilityTableCell::colSpan((WebCore::AccessibilityTableCell *)v4);
    v7 = v4[65];
    v8 = v6;
  }
  else
  {
    v8 = 0;
    v7 = 0x7FFFFFFFFFFFFFFFLL;
  }
  result.length = v8;
  result.location = v7;
  return result;
}

- (unint64_t)accessibilityBlockquoteLevel
{
  void *v3;

  if (!-[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
    return 0;
  v3 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
  return (*(unsigned int (**)(void *))(*(_QWORD *)v3 + 864))(v3);
}

- (id)accessibilityDatetimeValue
{
  void *v3;
  WTF::StringImpl *v4;
  WTF::StringImpl *v5;
  WTF::StringImpl *v7;

  if (!-[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
    return 0;
  v3 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
  while (((*(uint64_t (**)(void *))(*(_QWORD *)v3 + 784))(v3) & 1) == 0)
  {
    v3 = (void *)(*(uint64_t (**)(void *))(*(_QWORD *)v3 + 1232))(v3);
    if (!v3)
      return v3;
  }
  (*(void (**)(WTF::StringImpl **__return_ptr, void *))(*(_QWORD *)v3 + 792))(&v7, v3);
  if (!v7)
    return &stru_1E3487BC0;
  v3 = (void *)WTF::StringImpl::operator NSString *();
  v5 = v7;
  v7 = 0;
  if (v5)
  {
    if (*(_DWORD *)v5 == 2)
      WTF::StringImpl::destroy(v5, v4);
    else
      *(_DWORD *)v5 -= 2;
  }
  return v3;
}

- (id)accessibilityPlaceholderValue
{
  WTF::StringImpl *v3;
  void *v4;
  WTF::StringImpl *v5;
  WTF::StringImpl *v7;

  if (!-[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
    return 0;
  (*(void (**)(WTF::StringImpl **__return_ptr))(*(_QWORD *)-[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject")+ 1424))(&v7);
  if (!v7)
    return &stru_1E3487BC0;
  v4 = (void *)WTF::StringImpl::operator NSString *();
  v5 = v7;
  v7 = 0;
  if (v5)
  {
    if (*(_DWORD *)v5 == 2)
      WTF::StringImpl::destroy(v5, v3);
    else
      *(_DWORD *)v5 -= 2;
  }
  return v4;
}

- (id)accessibilityColorStringValue
{
  void *v3;
  void *v4;
  uint64_t v5;

  if (!-[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
    return 0;
  v3 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
  if ((*(unsigned int (**)(void *))(*(_QWORD *)v3 + 1456))(v3) != 16)
    return 0;
  v4 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
  v5 = (*(uint64_t (**)(void *))(*(_QWORD *)v4 + 1448))(v4);
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("rgb %7.5f %7.5f %7.5f 1"), (float)((float)v5 / 255.0), (float)((float)BYTE1(v5) / 255.0), (float)((float)BYTE2(v5) / 255.0));
}

- (id)accessibilityValue
{
  __CFString *i;
  _QWORD *v4;
  uint64_t v5;
  int v8;
  int v9;
  uint64_t v10;
  int v11;
  WTF::StringImpl *v12;
  const __CFString *v13;
  int v14;
  unint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  WTF::StringImpl *v21;
  uint64_t v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  BOOL v27;
  int v28;
  WTF::String *Attribute;
  uint64_t v30;
  WTF::StringImpl *v31;
  objc_super v32;

  if (!-[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
    return 0;
  v32.receiver = self;
  v32.super_class = (Class)WebAccessibilityObjectWrapper;
  i = -[WebAccessibilityObjectWrapper accessibilityValue](&v32, sel_accessibilityValue);
  if (!i)
  {
    v4 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
    v5 = v4[1];
    if (__ldaxr((unsigned __int8 *)v5))
    {
      __clrex();
    }
    else if (!__stxr(1u, (unsigned __int8 *)v5))
    {
      goto LABEL_9;
    }
    MEMORY[0x19AEA534C](v5);
LABEL_9:
    ++*(_QWORD *)(v5 + 8);
    v8 = __ldxr((unsigned __int8 *)v5);
    if (v8 == 1)
    {
      if (!__stlxr(0, (unsigned __int8 *)v5))
      {
LABEL_14:
        v9 = (*(uint64_t (**)(_QWORD *))(*v4 + 656))(v4);
        v10 = *v4;
        if (v9)
        {
          v11 = (*(uint64_t (**)(_QWORD *))(v10 + 880))(v4);
          v13 = CFSTR("0");
          if (v11 == 1)
            v13 = CFSTR("1");
          if (v11 == 2)
            i = CFSTR("2");
          else
            i = (__CFString *)v13;
        }
        else
        {
          v14 = (*(uint64_t (**)(_QWORD *))(v10 + 1456))(v4);
          if ((v14 == 10 || v14 == 132 || v14 == 84)
            && ((*(uint64_t (**)(_QWORD *))(*v4 + 600))(v4) & 1) != 0)
          {
            i = CFSTR("1");
          }
          else
          {
            v15 = -[WebAccessibilityObjectWrapper accessibilityTraits](self, "accessibilityTraits");
            if ((-[WebAccessibilityObjectWrapper _axHeaderTrait](self, "_axHeaderTrait") & v15) != 0)
            {
              v16 = (uint64_t)v4;
              while ((*(unsigned int (**)(uint64_t))(*(_QWORD *)v16 + 1456))(v16) != 45)
              {
                v16 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v16 + 1232))(v16);
                if (!v16)
                  goto LABEL_29;
              }
              v18 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), (*(uint64_t (**)(uint64_t))(*(_QWORD *)v16 + 872))(v16));
LABEL_36:
              i = (__CFString *)v18;
            }
            else
            {
LABEL_29:
              if ((*(unsigned int (**)(_QWORD *))(*v4 + 112))(v4)
                && !-[WebAccessibilityObjectWrapper _accessibilityIsStrongPasswordField](self, "_accessibilityIsStrongPasswordField"))
              {
                v20 = WebCore::AccessibilityObject::accessibilitySecureFieldLength((WebCore::AccessibilityObject *)v4);
                for (i = (__CFString *)objc_msgSend(MEMORY[0x1E0CB37A0], "string"); v20; --v20)
                  -[__CFString appendString:](i, "appendString:", CFSTR("•"));
              }
              else if (-[WebAccessibilityObjectWrapper stringValueShouldBeUsedInLabel](self, "stringValueShouldBeUsedInLabel"))
              {
                v17 = (*(uint64_t (**)(_QWORD *))(*v4 + 1456))(v4);
                switch(v17)
                {
                  case 'd':
                  case 'f':
                  case 'h':
                    goto LABEL_44;
                  case 'e':
                  case 'g':
                  case 'i':
                    goto LABEL_65;
                  case 'j':
                    if (!(*(unsigned int (**)(_QWORD *))(*v4 + 800))(v4))
                      goto LABEL_65;
                    goto LABEL_44;
                  default:
                    if (v17 == 81 || v17 == 87)
                    {
LABEL_44:
                      (*(void (**)(WTF::StringImpl **__return_ptr, _QWORD *))(*v4 + 888))(&v31, v4);
                      if (!v31 || !*((_DWORD *)v31 + 1))
                      {
                        v19 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.2f"), (*(float (**)(_QWORD *))(*v4 + 896))(v4));
                        goto LABEL_46;
                      }
                      goto LABEL_38;
                    }
LABEL_65:
                    if ((*(unsigned int (**)(_QWORD *))(*v4 + 2736))(v4))
                    {
                      Attribute = (WTF::String *)WebCore::AccessibilityObject::getAttribute((WebCore::AccessibilityObject *)v4, (WebCore::QualifiedName::QualifiedNameImpl **)&WebCore::HTMLNames::progressAttr);
                      LOBYTE(v31) = 0;
                      WTF::String::toFloat(Attribute, (BOOL *)&v31);
                      if ((_BYTE)v31)
                      {
                        v18 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.2f"), (*(float (**)(_QWORD *))(*v4 + 896))(v4));
                        goto LABEL_36;
                      }
                    }
                    i = 0;
                    break;
                }
              }
              else
              {
                (*(void (**)(WTF::StringImpl **__return_ptr, _QWORD *))(*v4 + 1384))(&v31, v4);
                if (v31)
                {
LABEL_38:
                  v19 = WTF::StringImpl::operator NSString *();
LABEL_46:
                  i = (__CFString *)v19;
                  v21 = v31;
                  v31 = 0;
                  if (v21)
                  {
                    if (*(_DWORD *)v21 == 2)
                      WTF::StringImpl::destroy(v21, v12);
                    else
                      *(_DWORD *)v21 -= 2;
                  }
                }
                else
                {
                  i = &stru_1E3487BC0;
                }
              }
            }
          }
        }
        v22 = v4[1];
        if (__ldaxr((unsigned __int8 *)v22))
        {
          __clrex();
        }
        else if (!__stxr(1u, (unsigned __int8 *)v22))
        {
          goto LABEL_53;
        }
        MEMORY[0x19AEA534C](v22);
LABEL_53:
        v24 = *(_QWORD *)(v22 + 8);
        v25 = v24 - 1;
        *(_QWORD *)(v22 + 8) = v24 - 1;
        if (v24 == 1)
        {
          v30 = *(_QWORD *)(v22 + 16);
          v26 = *(_QWORD *)(v22 + 24);
          *(_QWORD *)(v22 + 24) = 0;
          v27 = v30 != 0;
        }
        else
        {
          v26 = 0;
          v27 = 1;
        }
        v28 = __ldxr((unsigned __int8 *)v22);
        if (v28 == 1)
        {
          if (!__stlxr(0, (unsigned __int8 *)v22))
          {
            if (v25)
              return i;
            goto LABEL_61;
          }
        }
        else
        {
          __clrex();
        }
        WTF::Lock::unlockSlow((WTF::Lock *)v22);
        if (v25)
          return i;
LABEL_61:
        if (v26)
          (*(void (**)(uint64_t))(*(_QWORD *)v26 + 8))(v26);
        if (!v27)
          WTF::fastFree((WTF *)v22, v12);
        return i;
      }
    }
    else
    {
      __clrex();
    }
    WTF::Lock::unlockSlow((WTF::Lock *)v5);
    goto LABEL_14;
  }
  return i;
}

- (id)browserAccessibilityValueInRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  id v6;
  void *v7;
  NSRange v8;
  NSRange v10;
  NSRange v11;

  length = a3.length;
  location = a3.location;
  if (-[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall")
    && (v6 = -[WebAccessibilityObjectWrapper accessibilityValue](self, "accessibilityValue")) != 0
    && (v7 = v6,
        v11.length = objc_msgSend(v6, "length"),
        v10.location = location,
        v10.length = length,
        v11.location = 0,
        v8 = NSIntersectionRange(v10, v11),
        v8.length))
  {
    return (id)objc_msgSend(v7, "substringWithRange:", v8.location, v8.length);
  }
  else
  {
    return 0;
  }
}

- (id)browserAccessibilityAttributedValueInRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v6;
  uint64_t v7;
  NSUInteger v8;
  id v9;

  length = a3.length;
  location = a3.location;
  if (!-[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
    return 0;
  v6 = -[WebAccessibilityObjectWrapper elementTextRange](self, "elementTextRange");
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
    v7 = 0;
  else
    v7 = v6;
  v8 = v7 + location;
  v9 = -[WebAccessibilityObjectWrapper attributedStringForRange:](self, "attributedStringForRange:", v8, length);
  if (!objc_msgSend(v9, "length"))
    return (id)(id)CFMakeCollectable((CFTypeRef)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", -[WebAccessibilityObjectWrapper browserAccessibilityValueInRange:](self, "browserAccessibilityValueInRange:", v8, length)));
  return v9;
}

- (BOOL)accessibilityIsIndeterminate
{
  int v3;
  void *v4;

  v3 = -[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall");
  if (v3)
  {
    v4 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
    LOBYTE(v3) = (*(uint64_t (**)(void *))(*(_QWORD *)v4 + 560))(v4);
  }
  return v3;
}

- (BOOL)accessibilityIsAttachmentElement
{
  void *v3;

  if (-[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall")
    && (v3 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject")) != 0)
  {
    return (*(uint64_t (**)(void *))(*(_QWORD *)v3 + 2736))(v3);
  }
  else
  {
    return 0;
  }
}

- (BOOL)accessibilityIsComboBox
{
  _BOOL4 v3;
  void *v4;

  v3 = -[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall");
  if (v3)
  {
    v4 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
    LOBYTE(v3) = (*(unsigned int (**)(void *))(*(_QWORD *)v4 + 1456))(v4) == 19;
  }
  return v3;
}

- (id)accessibilityHint
{
  void *v3;
  id v4;
  void *v5;
  WebCore::Node *v6;
  WebCore::Node *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  __CFString *v11;
  WTF::StringImpl *v12;
  WTF::StringImpl *v13;
  WTF::StringImpl *v15;

  if (!-[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
    return 0;
  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v4 = -[WebAccessibilityObjectWrapperBase baseAccessibilityHelpText](self, "baseAccessibilityHelpText");
  if (objc_msgSend(v4, "length"))
  {
    if (objc_msgSend(v3, "length"))
      objc_msgSend(v3, "appendString:", CFSTR(", "));
    objc_msgSend(v3, "appendString:", v4);
  }
  if (-[WebAccessibilityObjectWrapper accessibilityIsShowingValidationMessage](self, "accessibilityIsShowingValidationMessage"))
  {
    v5 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
    v6 = (WebCore::Node *)(*(uint64_t (**)(void *))(*(_QWORD *)v5 + 832))(v5);
    if (!v6)
      goto LABEL_16;
    v7 = v6;
    *((_DWORD *)v6 + 6) += 2;
    v8 = (*(uint64_t (**)(WebCore::Node *))(*(_QWORD *)v6 + 464))(v6);
    v10 = v8;
    if (v8)
      (*(void (**)(WTF::StringImpl **__return_ptr, uint64_t))(*(_QWORD *)v8 + 216))(&v15, v8);
    if (*((_DWORD *)v7 + 6) == 2)
    {
      if ((*((_WORD *)v7 + 15) & 0x400) == 0)
        WebCore::Node::removedLastRef(v7, v9);
    }
    else
    {
      *((_DWORD *)v7 + 6) -= 2;
    }
    if (v10)
    {
      if (v15)
      {
        v11 = (__CFString *)WTF::StringImpl::operator NSString *();
LABEL_18:
        if (-[__CFString length](v11, "length"))
        {
          if (objc_msgSend(v3, "length"))
            objc_msgSend(v3, "appendString:", CFSTR(", "));
          objc_msgSend(v3, "appendString:", v11);
        }
        v13 = v15;
        v15 = 0;
        if (v13)
        {
          if (*(_DWORD *)v13 == 2)
            WTF::StringImpl::destroy(v13, v12);
          else
            *(_DWORD *)v13 -= 2;
        }
        return v3;
      }
    }
    else
    {
LABEL_16:
      v15 = 0;
    }
    v11 = &stru_1E3487BC0;
    goto LABEL_18;
  }
  return v3;
}

- (id)accessibilityURL
{
  WTF::StringImpl *v3;
  void *v4;
  WTF::StringImpl *v5;
  WTF::StringImpl *v7;

  if (!-[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
    return 0;
  (*(void (**)(WTF::StringImpl **__return_ptr))(*(_QWORD *)-[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject")+ 1616))(&v7);
  if (!v7)
    return 0;
  v4 = (void *)WTF::URL::operator NSURL *();
  v5 = v7;
  v7 = 0;
  if (v5)
  {
    if (*(_DWORD *)v5 == 2)
      WTF::StringImpl::destroy(v5, v3);
    else
      *(_DWORD *)v5 -= 2;
  }
  return v4;
}

- (CGPoint)_accessibilityConvertPointToViewSpace:(CGPoint)a3
{
  double y;
  double x;
  float v6;
  float v7;
  double v8;
  double v9;
  double v10;
  double v11;
  _DWORD v12[2];
  uint64_t v13;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  if (-[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
  {
    v6 = x;
    v7 = y;
    *(float *)v12 = v6;
    *(float *)&v12[1] = v7;
    v13 = 0;
    -[WebAccessibilityObjectWrapperBase convertRectToSpace:space:](self, "convertRectToSpace:space:", v12, 0);
    x = v8;
    y = v9;
  }
  v10 = x;
  v11 = y;
  result.y = v11;
  result.x = v10;
  return result;
}

- (BOOL)_accessibilityScrollToVisible
{
  _BOOL4 v3;
  void *v4;

  v3 = -[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall");
  if (v3)
  {
    v4 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
    (*(void (**)(void *))(*(_QWORD *)v4 + 2272))(v4);
  }
  return v3;
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  int v5;
  int64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  CFTypeRef v10;
  _QWORD v12[2];
  CFTypeRef cf;
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v5 = -[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall");
  if (v5)
  {
    if ((unint64_t)(a3 - 1) > 3)
    {
      LOBYTE(v5) = 0;
    }
    else
    {
      v6 = a3 - 1;
      v5 = WebCore::AccessibilityObject::scrollByPage((uint64_t)-[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject"), dword_1968BD190[v6]);
      if (v5)
      {
        v12[0] = "AXPageScrolled";
        v12[1] = 15;
        WTF::ASCIILiteral::createNSString((WTF::ASCIILiteral *)v12);
        -[WebAccessibilityObjectWrapper accessibilityOverrideProcessNotification:](self, "accessibilityOverrideProcessNotification:", cf);
        -[WebAccessibilityObjectWrapper _accessibilityScrollPosition](self, "_accessibilityScrollPosition");
        v9 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("AXScroll [position: %.2f %.2f]"), v7, v8);
        v14 = CFSTR("status");
        v15[0] = v9;
        -[WebAccessibilityObjectWrapperBase accessibilityPostedNotification:userInfo:](self, "accessibilityPostedNotification:userInfo:", cf, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1));
        v10 = cf;
        cf = 0;
        if (v10)
          CFRelease(v10);
        LOBYTE(v5) = 1;
      }
    }
  }
  return v5;
}

- (void)handleNotificationRelayToChrome:(id)a3 notificationData:(id)a4
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  WTF::StringImpl *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  WTF::StringImpl *v15;
  id v16;
  WTF::StringImpl *v17;

  if (-[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
  {
    v7 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
    v8 = (*(uint64_t (**)(void *))(*(_QWORD *)v7 + 1488))(v7);
    if (v8)
    {
      v9 = v8;
      MEMORY[0x19AEA5508](&v17, a3);
      v16 = a4;
      if (a4)
        CFRetain(a4);
      v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v9 + 24) + 8) + 528);
      if (v11)
      {
        v12 = *(_QWORD *)(v11 + 8);
        if (v12)
        {
          v13 = *(_QWORD *)(v12 + 24);
          if (v13)
          {
            v14 = *(_QWORD *)(v13 + 8);
            if (v14)
            {
              (*(void (**)(_QWORD, WTF::StringImpl **, id *))(**(_QWORD **)(v14 + 48) + 120))(*(_QWORD *)(v14 + 48), &v17, &v16);
              a4 = v16;
            }
          }
        }
      }
      v16 = 0;
      if (a4)
        CFRelease(a4);
      v15 = v17;
      v17 = 0;
      if (v15)
      {
        if (*(_DWORD *)v15 == 2)
          WTF::StringImpl::destroy(v15, v10);
        else
          *(_DWORD *)v15 -= 2;
      }
    }
  }
}

- (CGRect)_accessibilityRelativeFrame
{
  void *v3;
  uint64_t v4;
  int v5;
  int v6;
  unsigned int v7;
  int v8;
  unsigned int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  double v16;
  double v17;
  double v18;
  double v19;
  float v20[4];
  CGRect result;

  v3 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
  v4 = (*(uint64_t (**)(void *))(*(_QWORD *)v3 + 1512))(v3);
  v7 = v4 - (v6 & 0xFFFFFFC0);
  v9 = HIDWORD(v4) - (v8 & 0xFFFFFFC0);
  v11 = v7 + v10;
  if (__OFADD__(v7, v10))
    v11 = (v7 >> 31) + 0x7FFFFFFF;
  v12 = v9 + v5;
  v13 = (v9 >> 31) + 0x7FFFFFFF;
  if (__OFADD__(v9, v5))
    v12 = (v9 >> 31) + 0x7FFFFFFF;
  v14 = v9 + 32;
  v15 = v7 + 32;
  v20[0] = (float)((int)v4 / 64 + (v15 >> 6));
  v20[1] = (float)(SHIDWORD(v4) / 64 + (v14 >> 6));
  v20[2] = (float)(v11 / 64 - (v15 >> 6) + ((int)(v11 - (v13 & 0xFFFFFFC0) + 32) >> 6));
  v20[3] = (float)(v12 / 64 - (v14 >> 6) + ((int)(v12 - (v11 & 0xFFFFFFC0) + 32) >> 6));
  -[WebAccessibilityObjectWrapperBase convertRectToSpace:space:](self, "convertRectToSpace:space:", v20, 1);
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (CGRect)accessibilityElementRect
{
  void *v3;
  uint64_t v4;
  double v5;
  int v6;
  double v7;
  double v8;
  int v9;
  double v10;
  CGRect result;

  if (-[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
  {
    v3 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
    v4 = (*(uint64_t (**)(void *))(*(_QWORD *)v3 + 1512))(v3);
    v5 = (double)(int)v4 * 0.015625;
    v7 = (double)SHIDWORD(v4) * 0.015625;
    v8 = (double)v6 * 0.015625;
    v10 = (double)v9 * 0.015625;
  }
  else
  {
    v5 = *MEMORY[0x1E0C9D648];
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v10 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  result.size.height = v10;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v5;
  return result;
}

- (CGRect)accessibilityVisibleContentRect
{
  void *v3;
  int v4;
  int v5;
  int v6;
  double v7;
  double v8;
  double v9;
  double v10;
  _DWORD v11[4];
  CGRect result;

  if (-[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
  {
    v3 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
    v11[0] = (*(float (**)(void *))(*(_QWORD *)v3 + 1560))(v3);
    v11[1] = v4;
    v11[2] = v5;
    v11[3] = v6;
    -[WebAccessibilityObjectWrapperBase convertRectToSpace:space:](self, "convertRectToSpace:space:", v11, 0);
  }
  else
  {
    v7 = *MEMORY[0x1E0C9D648];
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v9 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v10 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  result.size.height = v10;
  result.size.width = v9;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

- (CGPoint)accessibilityActivationPoint
{
  _DWORD *v3;
  double v4;
  double v5;
  CGPoint result;

  if (-[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
  {
    v3 = WebCore::AccessibilityObject::clickPoint((WebCore::AccessibilityObject *)-[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject"));
    -[WebAccessibilityObjectWrapper _accessibilityConvertPointToViewSpace:](self, "_accessibilityConvertPointToViewSpace:", (double)(int)v3, (double)SHIDWORD(v3));
  }
  else
  {
    v4 = *MEMORY[0x1E0C9D538];
    v5 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  }
  result.y = v5;
  result.x = v4;
  return result;
}

- (CGRect)accessibilityFrame
{
  void *v3;
  uint64_t v4;
  int v5;
  int v6;
  unsigned int v7;
  int v8;
  unsigned int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  double v16;
  double v17;
  double v18;
  double v19;
  float v20[4];
  CGRect result;

  if (-[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
  {
    v3 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
    v4 = (*(uint64_t (**)(void *))(*(_QWORD *)v3 + 1512))(v3);
    v7 = v4 - (v6 & 0xFFFFFFC0);
    v9 = HIDWORD(v4) - (v8 & 0xFFFFFFC0);
    v11 = v7 + v10;
    if (__OFADD__(v7, v10))
      v11 = (v7 >> 31) + 0x7FFFFFFF;
    v12 = v9 + v5;
    v13 = (v9 >> 31) + 0x7FFFFFFF;
    if (__OFADD__(v9, v5))
      v12 = (v9 >> 31) + 0x7FFFFFFF;
    v14 = v9 + 32;
    v15 = v7 + 32;
    v20[0] = (float)((int)v4 / 64 + (v15 >> 6));
    v20[1] = (float)(SHIDWORD(v4) / 64 + (v14 >> 6));
    v20[2] = (float)(v11 / 64 - (v15 >> 6) + ((int)(v11 - (v13 & 0xFFFFFFC0) + 32) >> 6));
    v20[3] = (float)(v12 / 64 - (v14 >> 6) + ((int)(v12 - (v11 & 0xFFFFFFC0) + 32) >> 6));
    -[WebAccessibilityObjectWrapperBase convertRectToSpace:space:](self, "convertRectToSpace:space:", v20, 0);
  }
  else
  {
    v16 = *MEMORY[0x1E0C9D648];
    v17 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v18 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v19 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (BOOL)containsUnnaturallySegmentedChildren
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  BOOL v8;
  uint64_t v10;
  unint64_t v11;
  int v12;
  int v13;

  if (!-[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject"))
    return 0;
  v3 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
  v4 = (*(uint64_t (**)(void *))(*(_QWORD *)v3 + 1456))(v3);
  if (v4 != 139 && v4 != 65)
    return 0;
  v5 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
  v6 = (*(uint64_t (**)(void *, uint64_t))(*(_QWORD *)v5 + 1896))(v5, 1);
  v7 = *(unsigned int *)(v6 + 12);
  if (!(_DWORD)v7)
    return 1;
  if ((_DWORD)v7 != 1)
  {
    v10 = v6;
    v11 = 0;
    v8 = 0;
    do
    {
      if (v11 >= *(unsigned int *)(v10 + 12))
      {
LABEL_18:
        __break(0xC471u);
        JUMPOUT(0x194937D74);
      }
      v12 = (*(uint64_t (**)(_QWORD))(**(_QWORD **)(*(_QWORD *)v10 + 8 * v11) + 1456))(*(_QWORD *)(*(_QWORD *)v10 + 8 * v11));
      if (v12 != 49 && v12 != 107)
      {
        if (v11 >= *(unsigned int *)(v10 + 12))
          goto LABEL_18;
        v13 = (*(uint64_t (**)(_QWORD))(**(_QWORD **)(*(_QWORD *)v10 + 8 * v11) + 1456))(*(_QWORD *)(*(_QWORD *)v10 + 8 * v11));
        if (v13 != 127 && v13 != 44)
          break;
      }
      v8 = ++v11 >= v7;
    }
    while (v7 != v11);
  }
  else
  {
    return 0;
  }
  return v8;
}

- (id)accessibilityContainer
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  id v7;
  _QWORD *v8;
  void *v9;
  WTF *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  char v25;
  WTF *v26;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  if (!-[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
    return 0;
  v3 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
  v4 = (*(uint64_t (**)(void *))(*(_QWORD *)v3 + 1488))(v3);
  v5 = v4;
  if (v4)
  {
    if (*(_QWORD *)(v4 + 88))
    {
      v6 = 0;
      goto LABEL_11;
    }
    v8 = (_QWORD *)WTF::fastMalloc((WTF *)8);
    *v8 = 0;
    v10 = *(WTF **)(v5 + 88);
    *(_QWORD *)(v5 + 88) = v8;
    if (v10)
    {
      if (*(_QWORD *)v10)
        WTF::fastFree((WTF *)(*(_QWORD *)v10 - 16), v9);
      WTF::fastFree(v10, v9);
    }
  }
  v6 = 1;
LABEL_11:
  v11 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
  v12 = (*(uint64_t (**)(void *))(*(_QWORD *)v11 + 1240))(v11);
  if (!v12)
  {
    v15 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
    if (((*(uint64_t (**)(void *))(*(_QWORD *)v15 + 1920))(v15) & 1) != 0)
    {
      v7 = 0;
      goto LABEL_29;
    }
    v16 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
    v17 = (*(uint64_t (**)(void *))(*(_QWORD *)v16 + 1720))(v16);
    v18 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
    v19 = (*(uint64_t (**)(void *))(*(_QWORD *)v18 + 1712))(v18);
    if (v19 && v17)
    {
      if (*(_BYTE *)(v19 + 3362) || *(_BYTE *)(v19 + 3405))
      {
        v28 = *(_QWORD *)(v19 + 528);
        if (!v28)
          goto LABEL_28;
        v29 = *(_QWORD *)(v28 + 8);
        if (!v29)
          goto LABEL_28;
        v30 = *(_QWORD *)(v29 + 120);
        if (!v30)
          goto LABEL_28;
        v31 = *(_QWORD *)(v30 + 8);
        for (i = v19; v31; v31 = *(_QWORD *)(v34 + 8))
        {
          i = *(_QWORD *)(*(_QWORD *)(v31 + 40) + 8);
          v32 = *(_QWORD *)(i + 528);
          if (!v32)
            break;
          v33 = *(_QWORD *)(v32 + 8);
          if (!v33)
            break;
          v34 = *(_QWORD *)(v33 + 120);
          if (!v34)
            break;
        }
      }
      else
      {
        v20 = *(_QWORD *)(v19 + 528);
        if (!v20)
          goto LABEL_28;
        v21 = *(_QWORD *)(v20 + 8);
        if (!v21)
          goto LABEL_28;
        v22 = *(_QWORD *)(*(_QWORD *)(v21 + 128) + 8);
        if (!v22 || *(_BYTE *)(v22 + 144) != 0)
          goto LABEL_28;
        i = *(_QWORD *)(v22 + 296);
        if (!i)
          goto LABEL_28;
      }
      if (v19 != i)
      {
        v14 = (id *)(v17 + 40);
        goto LABEL_13;
      }
    }
LABEL_28:
    v7 = -[WebAccessibilityObjectWrapper _accessibilityWebDocumentView](self, "_accessibilityWebDocumentView");
    goto LABEL_29;
  }
  v14 = (id *)(v12 + 24);
LABEL_13:
  v7 = *v14;
LABEL_29:
  v25 = v6 ^ 1;
  if (!v5)
    v25 = 1;
  if ((v25 & 1) == 0)
  {
    v26 = *(WTF **)(v5 + 88);
    *(_QWORD *)(v5 + 88) = 0;
    if (v26)
    {
      if (*(_QWORD *)v26)
        WTF::fastFree((WTF *)(*(_QWORD *)v26 - 16), v13);
      WTF::fastFree(v26, v13);
    }
  }
  return v7;
}

- (id)accessibilityFocusedUIElement
{
  void *v3;
  const WebCore::Page *v4;
  WebCore::AXObjectCache *v5;
  id result;

  if (!-[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
    return 0;
  v3 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
  v4 = (const WebCore::Page *)(*(uint64_t (**)(void *))(*(_QWORD *)v3 + 1704))(v3);
  v5 = (WebCore::AXObjectCache *)(*(uint64_t (**)(void *))(*(_QWORD *)v3 + 1488))(v3);
  if (!v4 || v5 == 0)
    return 0;
  result = (id)WebCore::AXObjectCache::focusedObjectForPage(v5, v4);
  if (result)
    return (id)*((_QWORD *)result + 3);
  return result;
}

- (id)_accessibilityWebDocumentView
{
  void *v3;
  uint64_t v4;
  void *i;

  if (!-[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
    return 0;
  if (!-[WebAccessibilityObjectWrapper _accessibilityWebDocumentView]::webViewClass)
  {
    -[WebAccessibilityObjectWrapper _accessibilityWebDocumentView]::webViewClass = (uint64_t)NSClassFromString(CFSTR("WebView"));
    if (!-[WebAccessibilityObjectWrapper _accessibilityWebDocumentView]::webViewClass)
      return 0;
  }
  v3 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
  v4 = (*(uint64_t (**)(void *))(*(_QWORD *)v3 + 1720))(v3);
  if (!v4)
    return 0;
  for (i = (void *)objc_msgSend(*(id *)(v4 + 40), "documentView"); i; i = (void *)objc_msgSend(i, "superview"))
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      break;
  }
  return (id)objc_msgSend(i, "accessibilityContainer");
}

- (id)_accessibilityNextElementsWithCount:(unsigned int)a3
{
  uint64_t v3;

  v3 = *(_QWORD *)&a3;
  if (-[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
    return (id)objc_msgSend(-[WebAccessibilityObjectWrapper _accessibilityWebDocumentView](self, "_accessibilityWebDocumentView"), "_accessibilityNextElementsWithCount:", v3);
  else
    return 0;
}

- (id)_accessibilityPreviousElementsWithCount:(unsigned int)a3
{
  uint64_t v3;

  v3 = *(_QWORD *)&a3;
  if (-[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
    return (id)objc_msgSend(-[WebAccessibilityObjectWrapper _accessibilityWebDocumentView](self, "_accessibilityWebDocumentView"), "_accessibilityPreviousElementsWithCount:", v3);
  else
    return 0;
}

- (id)_accessibilityResolvedEditingStyles
{
  if (-[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
    return -[WebAccessibilityObjectWrapperBase baseAccessibilityResolvedEditingStyles](self, "baseAccessibilityResolvedEditingStyles");
  else
    return 0;
}

- (BOOL)accessibilityCanSetValue
{
  int v3;
  void *v4;

  v3 = -[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall");
  if (v3)
  {
    v4 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
    LOBYTE(v3) = (*(uint64_t (**)(void *))(*(_QWORD *)v4 + 808))(v4);
  }
  return v3;
}

- (id)_accessibilityPhotoDescription
{
  WTF::StringImpl *v3;
  void *v4;
  WTF::StringImpl *v5;
  WTF::StringImpl *v7;

  if (!-[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
    return 0;
  (*(void (**)(WTF::StringImpl **__return_ptr))(*(_QWORD *)-[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject")+ 952))(&v7);
  if (!v7)
    return &stru_1E3487BC0;
  v4 = (void *)WTF::StringImpl::operator NSString *();
  v5 = v7;
  v7 = 0;
  if (v5)
  {
    if (*(_DWORD *)v5 == 2)
      WTF::StringImpl::destroy(v5, v3);
    else
      *(_DWORD *)v5 -= 2;
  }
  return v4;
}

- (id)accessibilityImageOverlayElements
{
  _QWORD **v3;
  uint64_t v4;
  _QWORD *v5;
  CFTypeRef NSArray;
  void *v7;
  void *v8;
  _QWORD **v10;
  unsigned int v11;
  char v12;
  _QWORD *v13;
  _QWORD v14[2];

  if (!-[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
    return 0;
  (*(void (**)(_QWORD ***__return_ptr))(*(_QWORD *)-[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject")+ 960))(&v10);
  if (!v12)
    return 0;
  v3 = v10;
  v14[0] = 0;
  v14[1] = 0;
  if (v11)
  {
    v4 = 8 * v11;
    do
    {
      v5 = *v3;
      if (*v3)
      {
        v13 = v14;
        WebCore::Accessibility::enumerateDescendants<WebCore::AXCoreObject,accessibleElementsForObjects(WTF::Vector<WTF::RefPtr<WebCore::AXCoreObject,WTF::RawPtrTraits<WebCore::AXCoreObject>,WTF::DefaultRefDerefTraits<WebCore::AXCoreObject>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc> const&)::$_0>(v5, (uint64_t *)&v13);
      }
      ++v3;
      v4 -= 8;
    }
    while (v4);
  }
  NSArray = makeNSArray((uint64_t)v14);
  WTF::Vector<WTF::RefPtr<WebCore::AXCoreObject,WTF::RawPtrTraits<WebCore::AXCoreObject>,WTF::DefaultRefDerefTraits<WebCore::AXCoreObject>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v14, v7);
  if (v12)
    WTF::Vector<WTF::RefPtr<WebCore::AXCoreObject,WTF::RawPtrTraits<WebCore::AXCoreObject>,WTF::DefaultRefDerefTraits<WebCore::AXCoreObject>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v10, v8);
  return (id)NSArray;
}

- (id)accessibilityLinkRelationshipType
{
  WTF::StringImpl *v3;
  void *v4;
  WTF::StringImpl *v5;
  WTF::StringImpl *v7;

  if (!-[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
    return 0;
  (*(void (**)(WTF::StringImpl **__return_ptr))(*(_QWORD *)-[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject")+ 1080))(&v7);
  if (!v7)
    return &stru_1E3487BC0;
  v4 = (void *)WTF::StringImpl::operator NSString *();
  v5 = v7;
  v7 = 0;
  if (v5)
  {
    if (*(_DWORD *)v5 == 2)
      WTF::StringImpl::destroy(v5, v3);
    else
      *(_DWORD *)v5 -= 2;
  }
  return v4;
}

- (BOOL)accessibilityRequired
{
  int v3;
  void *v4;

  v3 = -[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall");
  if (v3)
  {
    v4 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
    LOBYTE(v3) = (*(uint64_t (**)(void *))(*(_QWORD *)v4 + 616))(v4);
  }
  return v3;
}

- (id)accessibilityFlowToElements
{
  void *v3;
  id v4;
  void *v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  CFTypeRef v10;
  void *v11;
  _QWORD *v13;
  unsigned int v14;

  if (!-[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
    return 0;
  v3 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
  (*(void (**)(_QWORD **__return_ptr, void *, uint64_t))(*(_QWORD *)v3 + 984))(&v13, v3, 12);
  v4 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v5 = (void *)objc_msgSend(v4, "initWithCapacity:", v14);
  if (v14)
  {
    v6 = v13;
    v7 = 8 * v14;
    do
    {
      v8 = *(void **)(*v6 + 24);
      if ((*(unsigned int (**)(_QWORD))(*(_QWORD *)*v6 + 128))(*v6)
        && (v9 = objc_msgSend(v8, "attachmentView")) != 0
        || (v9 = (uint64_t)v8) != 0)
      {
        objc_msgSend(v5, "addObject:", v9);
      }
      ++v6;
      v7 -= 8;
    }
    while (v7);
  }
  v10 = (id)CFMakeCollectable(v5);
  WTF::Vector<WTF::RefPtr<WebCore::AXCoreObject,WTF::RawPtrTraits<WebCore::AXCoreObject>,WTF::DefaultRefDerefTraits<WebCore::AXCoreObject>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v13, v11);
  return (id)v10;
}

- (id)accessibilityDetailsElements
{
  void *v3;
  _QWORD **v4;
  uint64_t v5;
  _QWORD *v6;
  CFTypeRef NSArray;
  void *v8;
  void *v9;
  _QWORD **v11;
  unsigned int v12;
  _QWORD *v13;
  _QWORD v14[2];

  if (!-[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
    return 0;
  v3 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
  (*(void (**)(_QWORD ***__return_ptr, void *, uint64_t))(*(_QWORD *)v3 + 984))(&v11, v3, 7);
  v4 = v11;
  v14[0] = 0;
  v14[1] = 0;
  if (v12)
  {
    v5 = 8 * v12;
    do
    {
      v6 = *v4;
      if (*v4)
      {
        v13 = v14;
        WebCore::Accessibility::enumerateDescendants<WebCore::AXCoreObject,accessibleElementsForObjects(WTF::Vector<WTF::RefPtr<WebCore::AXCoreObject,WTF::RawPtrTraits<WebCore::AXCoreObject>,WTF::DefaultRefDerefTraits<WebCore::AXCoreObject>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc> const&)::$_0>(v6, (uint64_t *)&v13);
      }
      ++v4;
      v5 -= 8;
    }
    while (v5);
  }
  NSArray = makeNSArray((uint64_t)v14);
  WTF::Vector<WTF::RefPtr<WebCore::AXCoreObject,WTF::RawPtrTraits<WebCore::AXCoreObject>,WTF::DefaultRefDerefTraits<WebCore::AXCoreObject>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v14, v8);
  WTF::Vector<WTF::RefPtr<WebCore::AXCoreObject,WTF::RawPtrTraits<WebCore::AXCoreObject>,WTF::DefaultRefDerefTraits<WebCore::AXCoreObject>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v11, v9);
  return (id)NSArray;
}

- (id)accessibilityErrorMessageElements
{
  WTF::StringImpl *v3;
  char v4;
  WTF::StringImpl *v5;
  CFTypeRef NSArray;
  void *v7;
  _QWORD **v8;
  uint64_t v9;
  _QWORD *v10;
  void *v11;
  void *v12;
  _QWORD **v14;
  unsigned int v15;
  WTF::StringImpl **v16;
  WTF::StringImpl *v17[2];

  if (!-[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
    return 0;
  (*(void (**)(WTF::StringImpl **__return_ptr))(*(_QWORD *)-[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject")+ 1032))(v17);
  v4 = MEMORY[0x19AEA53F4](v17[0], "false", 5);
  v5 = v17[0];
  v17[0] = 0;
  if (v5)
  {
    if (*(_DWORD *)v5 == 2)
    {
      WTF::StringImpl::destroy(v5, v3);
      if ((v4 & 1) != 0)
        return 0;
      goto LABEL_8;
    }
    *(_DWORD *)v5 -= 2;
  }
  if ((v4 & 1) != 0)
    return 0;
LABEL_8:
  v7 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
  (*(void (**)(_QWORD ***__return_ptr, void *, uint64_t))(*(_QWORD *)v7 + 984))(&v14, v7, 9);
  v8 = v14;
  v17[0] = 0;
  v17[1] = 0;
  if (v15)
  {
    v9 = 8 * v15;
    do
    {
      v10 = *v8;
      if (*v8)
      {
        v16 = v17;
        WebCore::Accessibility::enumerateDescendants<WebCore::AXCoreObject,accessibleElementsForObjects(WTF::Vector<WTF::RefPtr<WebCore::AXCoreObject,WTF::RawPtrTraits<WebCore::AXCoreObject>,WTF::DefaultRefDerefTraits<WebCore::AXCoreObject>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc> const&)::$_0>(v10, (uint64_t *)&v16);
      }
      ++v8;
      v9 -= 8;
    }
    while (v9);
  }
  NSArray = makeNSArray((uint64_t)v17);
  WTF::Vector<WTF::RefPtr<WebCore::AXCoreObject,WTF::RawPtrTraits<WebCore::AXCoreObject>,WTF::DefaultRefDerefTraits<WebCore::AXCoreObject>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v17, v11);
  WTF::Vector<WTF::RefPtr<WebCore::AXCoreObject,WTF::RawPtrTraits<WebCore::AXCoreObject>,WTF::DefaultRefDerefTraits<WebCore::AXCoreObject>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v14, v12);
  return (id)NSArray;
}

- (id)accessibilityLinkedElement
{
  WebCore::AXCoreObject *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v10;
  _QWORD *v11;
  int v12;

  if (!-[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
    return 0;
  v3 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
  if ((*(unsigned int (**)(WebCore::AXCoreObject *))(*(_QWORD *)v3 + 1456))(v3) == 107)
  {
    v4 = (*(uint64_t (**)(WebCore::AXCoreObject *))(*(_QWORD *)v3 + 1240))(v3);
    if ((*(unsigned int (**)(uint64_t))(*(_QWORD *)v4 + 104))(v4))
      v3 = (WebCore::AXCoreObject *)(*(uint64_t (**)(WebCore::AXCoreObject *))(*(_QWORD *)v3 + 1240))(v3);
  }
  WebCore::AXCoreObject::linkedObjects(v3, (uint64_t)&v11);
  if (v12 && *v11)
  {
    v6 = (*(uint64_t (**)(_QWORD))(*(_QWORD *)*v11 + 840))(*v11);
    v7 = WTF::fastMalloc((WTF *)0x10);
    *(_QWORD *)v7 = off_1E324B218;
    v10 = v7;
    v8 = (_QWORD *)WebCore::firstAccessibleObjectFromNode(v6, &v10);
    (*(void (**)(uint64_t))(*(_QWORD *)v7 + 8))(v7);
    if (v8)
      v8 = (_QWORD *)v8[3];
  }
  else
  {
    v8 = 0;
  }
  WTF::Vector<WTF::RefPtr<WebCore::AXCoreObject,WTF::RawPtrTraits<WebCore::AXCoreObject>,WTF::DefaultRefDerefTraits<WebCore::AXCoreObject>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v11, v5);
  return v8;
}

- (BOOL)isAttachment
{
  void *v3;
  void *v4;

  v3 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
  if (v3)
  {
    v4 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
    LOBYTE(v3) = (*(uint64_t (**)(void *))(*(_QWORD *)v4 + 128))(v4);
  }
  return (char)v3;
}

- (id)accessibilityTextualContext
{
  void *v3;

  if (!-[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
    return 0;
  v3 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
  if ((*(unsigned int (**)(void *))(*(_QWORD *)v3 + 1456))(v3) == 15)
    return CFSTR("UIAccessibilityTextualContextSourceCode");
  else
    return 0;
}

- (BOOL)accessibilityPerformEscape
{
  int v3;
  void *v4;

  v3 = -[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall");
  if (v3)
  {
    v4 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
    LOBYTE(v3) = (*(uint64_t (**)(void *))(*(_QWORD *)v4 + 1856))(v4);
  }
  return v3;
}

- (BOOL)_accessibilityActivate
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  char v7;
  int v8;
  void *v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  int v16;
  uint64_t v18;

  if (!-[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
    return 0;
  v3 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
  v4 = v3;
  if (v3)
  {
    v5 = v3[1];
    if (__ldaxr((unsigned __int8 *)v5))
    {
      __clrex();
    }
    else if (!__stxr(1u, (unsigned __int8 *)v5))
    {
      goto LABEL_8;
    }
    MEMORY[0x19AEA534C](v5);
LABEL_8:
    ++*(_QWORD *)(v5 + 8);
    v8 = __ldxr((unsigned __int8 *)v5);
    if (v8 == 1)
    {
      if (!__stlxr(0, (unsigned __int8 *)v5))
        goto LABEL_13;
    }
    else
    {
      __clrex();
    }
    WTF::Lock::unlockSlow((WTF::Lock *)v5);
  }
LABEL_13:
  if (((*(uint64_t (**)(_QWORD *))(*v4 + 1848))(v4) & 1) != 0)
  {
    v7 = 1;
  }
  else if ((*(unsigned int (**)(_QWORD *))(*v4 + 1456))(v4) == 107)
  {
    v7 = (*(uint64_t (**)(_QWORD *))(*v4 + 3048))(v4);
  }
  else
  {
    v7 = 0;
  }
  v10 = v4[1];
  if (__ldaxr((unsigned __int8 *)v10))
  {
    __clrex();
  }
  else if (!__stxr(1u, (unsigned __int8 *)v10))
  {
    goto LABEL_22;
  }
  MEMORY[0x19AEA534C](v10);
LABEL_22:
  v12 = *(_QWORD *)(v10 + 8);
  v13 = v12 - 1;
  *(_QWORD *)(v10 + 8) = v12 - 1;
  if (v12 == 1)
  {
    v18 = *(_QWORD *)(v10 + 16);
    v14 = *(_QWORD *)(v10 + 24);
    *(_QWORD *)(v10 + 24) = 0;
    v15 = v18 != 0;
  }
  else
  {
    v14 = 0;
    v15 = 1;
  }
  v16 = __ldxr((unsigned __int8 *)v10);
  if (v16 == 1)
  {
    if (!__stlxr(0, (unsigned __int8 *)v10))
    {
      if (v13)
        return v7;
      goto LABEL_30;
    }
  }
  else
  {
    __clrex();
  }
  WTF::Lock::unlockSlow((WTF::Lock *)v10);
  if (v13)
    return v7;
LABEL_30:
  if (v14)
    (*(void (**)(uint64_t))(*(_QWORD *)v14 + 8))(v14);
  if (!v15)
    WTF::fastFree((WTF *)v10, v9);
  return v7;
}

- (id)attachmentView
{
  void *v3;
  id result;

  if (!-[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
    return 0;
  v3 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
  result = (id)(*(uint64_t (**)(void *))(*(_QWORD *)v3 + 1688))(v3);
  if (result)
    return (id)*((_QWORD *)result + 5);
  return result;
}

- (id)_accessibilityParentForSubview:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  WebCore::RenderObject *v8;
  uint64_t v9;
  unsigned __int8 v10;
  WebCore::AXObjectCache *v11;
  id result;
  WebCore::RenderObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  BOOL v20;
  WebCore::AXObjectCache *v21;
  WebCore::AXObjectCache *v22;
  uint64_t i;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  WebCore::AXObjectCache *v27;
  uint64_t v28;

  if (!objc_msgSend(a3, "conformsToProtocol:", &unk_1EE3509A0))
    return 0;
  if (!a3)
    return 0;
  objc_msgSend(a3, "_web_frame");
  if (!v28)
    return 0;
  v4 = *(_QWORD *)(*(_QWORD *)(v28 + 296) + 528);
  if (!v4)
    return 0;
  v5 = *(_QWORD *)(v4 + 8);
  if (!v5)
    return 0;
  v6 = *(_QWORD *)(v5 + 120);
  if (!v6)
    return 0;
  v7 = *(_QWORD *)(v6 + 8);
  if (!v7)
    return 0;
  v8 = (WebCore::RenderObject *)(*(_QWORD *)(v7 + 64) & 0xFFFFFFFFFFFFLL);
  if (!v8)
    return 0;
  v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)((*(_QWORD *)(v7 + 64) & 0xFFFFFFFFFFFFLL) + 0x18) + 8) + 40)
                 + 8);
  v10 = atomic_load(WebCore::AXObjectCache::gAccessibilityEnabled);
  if ((v10 & 1) != 0)
  {
    v13 = v8;
    v14 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*((_QWORD *)v8 + 3) + 8) + 40) + 8);
    if (*(_BYTE *)(v9 + 3362) || *(_BYTE *)(v14 + 3405))
    {
      for (i = *(_QWORD *)(v14 + 528); i; i = *(_QWORD *)(v14 + 528))
      {
        v24 = *(_QWORD *)(i + 8);
        if (!v24)
          break;
        v25 = *(_QWORD *)(v24 + 120);
        if (!v25)
          break;
        v26 = *(_QWORD *)(v25 + 8);
        if (!v26)
          break;
        v14 = *(_QWORD *)(*(_QWORD *)(v26 + 40) + 8);
      }
    }
    else
    {
      v15 = *(_QWORD *)(v14 + 528);
      if (v15)
      {
        v16 = *(_QWORD *)(v15 + 8);
        if (v16)
        {
          v17 = *(_QWORD *)(*(_QWORD *)(v16 + 128) + 8);
          if (v17 && *(_BYTE *)(v17 + 144) == 0)
          {
            v19 = *(_QWORD *)(v17 + 296);
            if (v19)
              v14 = v19;
          }
        }
      }
    }
    *(_DWORD *)(v14 + 24) += 2;
    v28 = v14;
    if (*(_QWORD *)(v14 + 1944))
      v20 = *(_BYTE *)(v14 + 3405) == 0;
    else
      v20 = 0;
    if (v20)
    {
      v21 = *(WebCore::AXObjectCache **)(v14 + 1488);
      if (!v21)
      {
        v22 = (WebCore::AXObjectCache *)WTF::fastMalloc((WTF *)0x318);
        v27 = WebCore::AXObjectCache::AXObjectCache(v22, (WebCore::Document *)v14);
        std::unique_ptr<WebCore::AXObjectCache>::operator=[abi:sn180100]((WebCore::AXObjectCache **)(v14 + 1488), &v27);
        std::unique_ptr<WebCore::AXObjectCache>::~unique_ptr[abi:sn180100](&v27);
        WebCore::Document::hasEverCreatedAnAXObjectCache = 1;
        v21 = *(WebCore::AXObjectCache **)(v14 + 1488);
      }
    }
    else
    {
      v21 = 0;
    }
    WTF::Ref<WebCore::Document,WTF::RawPtrTraits<WebCore::Document>,WTF::DefaultRefDerefTraits<WebCore::Document>>::~Ref(&v28);
    v8 = v13;
    v11 = v21;
  }
  else
  {
    v11 = 0;
  }
  result = (id)WebCore::AXObjectCache::getOrCreate(v11, v8);
  if (result)
    return *(id *)((*(uint64_t (**)(id))(*(_QWORD *)result + 1240))(result) + 24);
  return result;
}

- (CGPoint)_accessibilityScrollPosition
{
  void *v3;
  uint64_t v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  double v10;
  CGPoint result;

  if (-[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
  {
    v3 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
    v4 = (*(uint64_t (**)(void *))(*(_QWORD *)v3 + 1232))(v3);
    v5 = 0.0;
    if (v4)
    {
      v6 = v4;
      while (1)
      {
        v7 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v6 + 3256))(v6);
        if (v7)
          break;
        v6 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v6 + 1232))(v6);
        if (!v6)
          goto LABEL_6;
      }
      v9 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v7 + 416))(v7);
      v5 = (double)(int)v9;
      v8 = (double)SHIDWORD(v9);
    }
    else
    {
LABEL_6:
      v8 = 0.0;
    }
  }
  else
  {
    v5 = *MEMORY[0x1E0C9D538];
    v8 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  }
  v10 = v5;
  result.y = v8;
  result.x = v10;
  return result;
}

- (CGSize)_accessibilityScrollSize
{
  void *v3;
  uint64_t v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  double v10;
  CGSize result;

  if (-[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
  {
    v3 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
    v4 = (*(uint64_t (**)(void *))(*(_QWORD *)v3 + 1232))(v3);
    v5 = 0.0;
    if (v4)
    {
      v6 = v4;
      while (1)
      {
        v7 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v6 + 3256))(v6);
        if (v7)
          break;
        v6 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v6 + 1232))(v6);
        if (!v6)
          goto LABEL_6;
      }
      v9 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v7 + 496))(v7);
      v5 = (double)(int)v9;
      v8 = (double)SHIDWORD(v9);
    }
    else
    {
LABEL_6:
      v8 = 0.0;
    }
  }
  else
  {
    v5 = *MEMORY[0x1E0C9D820];
    v8 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  v10 = v5;
  result.height = v8;
  result.width = v10;
  return result;
}

- (CGRect)_accessibilityScrollVisibleRect
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGRect result;

  if (-[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
  {
    v3 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
    v4 = (*(uint64_t (**)(void *))(*(_QWORD *)v3 + 1232))(v3);
    if (v4)
    {
      v5 = v4;
      while (1)
      {
        v6 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v5 + 3256))(v5);
        if (v6)
          break;
        v4 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v5 + 1232))(v5);
        v5 = v4;
        if (!v4)
          goto LABEL_6;
      }
      v4 = (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)v6 + 832))(v6, 0, 1);
    }
    else
    {
LABEL_6:
      v7 = 0;
    }
    v8 = (double)(int)v4;
    v9 = (double)SHIDWORD(v4);
    v10 = (double)(int)v7;
    v11 = (double)SHIDWORD(v7);
  }
  else
  {
    v8 = *MEMORY[0x1E0C9D648];
    v9 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v10 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v11 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  result.size.height = v11;
  result.size.width = v10;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

- (void)detailParentForSummaryObject:(void *)a3
{
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  void *result;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;

  while (1)
  {
    v4 = (*(uint64_t (**)(void *, SEL))(*(_QWORD *)a3 + 840))(a3, a2);
    if (!v4 || (*(_WORD *)(v4 + 28) & 8) == 0)
      goto LABEL_7;
    v6 = *(_DWORD *)(v4 + 24);
    *(_DWORD *)(v4 + 24) = v6 + 2;
    v7 = *(_QWORD *)(v4 + 96);
    if (v7 == WebCore::HTMLNames::summaryTag)
      break;
    if (*(_QWORD *)(v7 + 24) != *(_QWORD *)(WebCore::HTMLNames::summaryTag + 24))
    {
      if (v6)
      {
        *(_DWORD *)(v4 + 24) = v6;
      }
      else if ((*(_WORD *)(v4 + 30) & 0x400) == 0)
      {
        WebCore::Node::removedLastRef((WebCore::Node *)v4, v5);
      }
      goto LABEL_7;
    }
    v10 = *(_QWORD *)(v7 + 32);
    v11 = *(_QWORD *)(WebCore::HTMLNames::summaryTag + 32);
    v9 = v10 == v11;
    if (v6)
    {
      *(_DWORD *)(v4 + 24) = v6;
      if (v10 == v11)
        return (void *)(*(uint64_t (**)(void *))(*(_QWORD *)a3 + 1232))(a3);
      goto LABEL_7;
    }
LABEL_11:
    if ((*(_WORD *)(v4 + 30) & 0x400) == 0)
      WebCore::Node::removedLastRef((WebCore::Node *)v4, v5);
    if (v9)
      return (void *)(*(uint64_t (**)(void *))(*(_QWORD *)a3 + 1232))(a3);
LABEL_7:
    result = (void *)(*(uint64_t (**)(void *))(*(_QWORD *)a3 + 1232))(a3);
    a3 = result;
    if (!result)
      return result;
  }
  if (!v6)
  {
    v9 = 1;
    goto LABEL_11;
  }
  *(_DWORD *)(v4 + 24) = v6;
  return (void *)(*(uint64_t (**)(void *))(*(_QWORD *)a3 + 1232))(a3);
}

- (void)detailParentForObject:(void *)a3
{
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;

  while (1)
  {
    v4 = (*(uint64_t (**)(void *, SEL))(*(_QWORD *)a3 + 840))(a3, a2);
    if (!v4 || (*(_WORD *)(v4 + 28) & 8) == 0)
      goto LABEL_7;
    v6 = *(_DWORD *)(v4 + 24);
    *(_DWORD *)(v4 + 24) = v6 + 2;
    v7 = *(_QWORD *)(v4 + 96);
    if (v7 == WebCore::HTMLNames::detailsTag)
      break;
    if (*(_QWORD *)(v7 + 24) != *(_QWORD *)(WebCore::HTMLNames::detailsTag + 24))
    {
      if (v6)
      {
        *(_DWORD *)(v4 + 24) = v6;
      }
      else if ((*(_WORD *)(v4 + 30) & 0x400) == 0)
      {
        WebCore::Node::removedLastRef((WebCore::Node *)v4, v5);
      }
      goto LABEL_7;
    }
    v9 = *(_QWORD *)(v7 + 32);
    v10 = *(_QWORD *)(WebCore::HTMLNames::detailsTag + 32);
    v8 = v9 == v10;
    if (v6)
    {
      *(_DWORD *)(v4 + 24) = v6;
      if (v9 == v10)
        return a3;
      goto LABEL_7;
    }
LABEL_11:
    if ((*(_WORD *)(v4 + 30) & 0x400) == 0)
      WebCore::Node::removedLastRef((WebCore::Node *)v4, v5);
    if (v8)
      return a3;
LABEL_7:
    a3 = (void *)(*(uint64_t (**)(void *))(*(_QWORD *)a3 + 1232))(a3);
    if (!a3)
      return a3;
  }
  if (!v6)
  {
    v8 = 1;
    goto LABEL_11;
  }
  *(_DWORD *)(v4 + 24) = v6;
  return a3;
}

- (void)treeItemParentForObject:(void *)a3
{
  do
  {
    if ((*(unsigned int (**)(void *, SEL))(*(_QWORD *)a3 + 1456))(a3, a2) == 131)
      break;
    a3 = (void *)(*(uint64_t (**)(void *))(*(_QWORD *)a3 + 1232))(a3);
  }
  while (a3);
  return a3;
}

- (id)accessibilityFindMatchingObjects:(id)a3
{
  _QWORD *v4;
  WebCore::AXCoreObject *v5;
  uint64_t v6;
  int v8;
  CFTypeRef NSArray;
  void *v10;
  WTF::StringImpl *v11;
  WTF::StringImpl *v12;
  WTF *v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  BOOL v19;
  int v20;
  uint64_t v22;
  _QWORD v23[2];
  _BYTE v24[40];
  WTF *v25;
  int v26;
  WTF::StringImpl *v27;

  v4 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
  if (!v4)
    return 0;
  v5 = (WebCore::AXCoreObject *)v4;
  v6 = v4[1];
  if (__ldaxr((unsigned __int8 *)v6))
  {
    __clrex();
  }
  else if (!__stxr(1u, (unsigned __int8 *)v6))
  {
    goto LABEL_6;
  }
  MEMORY[0x19AEA534C](v6);
LABEL_6:
  ++*(_QWORD *)(v6 + 8);
  v8 = __ldxr((unsigned __int8 *)v6);
  if (v8 != 1)
  {
    __clrex();
    goto LABEL_10;
  }
  if (__stlxr(0, (unsigned __int8 *)v6))
LABEL_10:
    WTF::Lock::unlockSlow((WTF::Lock *)v6);
  accessibilitySearchCriteriaForSearchPredicate(v5, (NSDictionary *)a3, (uint64_t)v24);
  (*(void (**)(_QWORD *__return_ptr, WebCore::AXCoreObject *, _BYTE *))(*(_QWORD *)v5 + 1248))(v23, v5, v24);
  NSArray = makeNSArray((uint64_t)v23);
  WTF::Vector<WTF::RefPtr<WebCore::AXCoreObject,WTF::RawPtrTraits<WebCore::AXCoreObject>,WTF::DefaultRefDerefTraits<WebCore::AXCoreObject>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v23, v10);
  v12 = v27;
  v27 = 0;
  if (v12)
  {
    if (*(_DWORD *)v12 == 2)
      WTF::StringImpl::destroy(v12, v11);
    else
      *(_DWORD *)v12 -= 2;
  }
  v13 = v25;
  if (v25)
  {
    v25 = 0;
    v26 = 0;
    WTF::fastFree(v13, v11);
  }
  v14 = *((_QWORD *)v5 + 1);
  if (__ldaxr((unsigned __int8 *)v14))
  {
    __clrex();
  }
  else if (!__stxr(1u, (unsigned __int8 *)v14))
  {
    goto LABEL_20;
  }
  MEMORY[0x19AEA534C](v14);
LABEL_20:
  v16 = *(_QWORD *)(v14 + 8);
  v17 = v16 - 1;
  *(_QWORD *)(v14 + 8) = v16 - 1;
  if (v16 == 1)
  {
    v22 = *(_QWORD *)(v14 + 16);
    v18 = *(_QWORD *)(v14 + 24);
    *(_QWORD *)(v14 + 24) = 0;
    v19 = v22 != 0;
  }
  else
  {
    v18 = 0;
    v19 = 1;
  }
  v20 = __ldxr((unsigned __int8 *)v14);
  if (v20 == 1)
  {
    if (!__stlxr(0, (unsigned __int8 *)v14))
    {
      if (v17)
        return (id)NSArray;
      goto LABEL_28;
    }
  }
  else
  {
    __clrex();
  }
  WTF::Lock::unlockSlow((WTF::Lock *)v14);
  if (v17)
    return (id)NSArray;
LABEL_28:
  if (v18)
    (*(void (**)(uint64_t))(*(_QWORD *)v18 + 8))(v18);
  if (!v19)
    WTF::fastFree((WTF *)v14, v11);
  return (id)NSArray;
}

- (void)accessibilityModifySelection:(unsigned __int8)a3 increase:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v5;
  void *v7;
  uint64_t v8;
  int v9;
  int v10;
  const WebCore::VisiblePosition *v11;
  unsigned __int8 v12;
  void *v13;
  _BOOL4 v14;
  int v15;
  int v16;
  const WebCore::VisiblePosition *v17;
  WebCore::Node *v18;
  WebCore::Node *v19;
  uint64_t v20;
  void *v21;
  WebCore::Node *v22;
  WebCore::Node *v23;
  WebCore::Node *v24;
  void *v25;
  WebCore::Node *v26;
  WebCore::Node *v27;
  void *v28;
  WebCore::Node *v29;
  WebCore::Node *v30;
  int v31;
  char v32;
  char v33;
  WebCore::Node *v34;
  int v35;
  char v36;
  char v37;
  WebCore::Node *v38[3];
  WebCore::Node *v39;
  _BYTE v40[64];
  uint64_t v41;
  uint64_t v42;
  unsigned __int8 v43;
  unsigned __int8 v44;
  WebCore::Node *v45;
  int v46;
  char v47;
  char v48;

  v4 = a4;
  v5 = a3;
  if (-[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
  {
    v7 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
    v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)((*(uint64_t (**)(void *))(*(_QWORD *)v7 + 1712))(v7)
                                                       + 528)
                                           + 8)
                               + 296)
                   + 3064);
    WebCore::AccessibilityObject::selection((WebCore::AccessibilityObject *)-[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject"), (uint64_t)v40);
    (*(void (**)(WebCore::Node **__return_ptr))(*(_QWORD *)-[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject")+ 1968))(v38);
    if (!*(_BYTE *)(v8 + 153))
    {
      v9 = v44;
      v10 = v43;
      WebCore::VisiblePosition::canonicalPosition((WebCore::VisiblePosition *)&v41, (uint64_t)&v34);
      v37 = 1;
      if (v9 != 2 && !v10)
      {
        v24 = v34;
        if (v34)
        {
          *((_DWORD *)v34 + 6) += 2;
          v45 = v24;
          v46 = v35;
          v47 = v36;
          v48 = 0;
          if (!WebCore::inSameLine((WebCore *)&v34, (const WebCore::VisiblePosition *)&v45, v11))
            v37 = 0;
          v26 = v45;
          v45 = 0;
          if (v26)
          {
            if (*((_DWORD *)v26 + 6) == 2)
            {
              if ((*((_WORD *)v26 + 15) & 0x400) == 0)
                WebCore::Node::removedLastRef(v26, v25);
            }
            else
            {
              *((_DWORD *)v26 + 6) -= 2;
            }
          }
        }
      }
      v12 = WebCore::documentOrder(&v34, v38, v11);
      v14 = 1;
      if (v12 == 129 || ((char)v12 & 0x80000000) == 0)
      {
        v15 = v44;
        v16 = v43;
        WebCore::VisiblePosition::canonicalPosition((WebCore::VisiblePosition *)&v42, (uint64_t)&v30);
        v33 = 1;
        if (v15 == 2 || !v16)
        {
          v27 = v30;
          if (v30)
          {
            *((_DWORD *)v30 + 6) += 2;
            v45 = v27;
            v46 = v31;
            v47 = v32;
            v48 = 0;
            if (!WebCore::inSameLine((WebCore *)&v30, (const WebCore::VisiblePosition *)&v45, v17))
              v33 = 0;
            v29 = v45;
            v45 = 0;
            if (v29)
            {
              if (*((_DWORD *)v29 + 6) == 2)
              {
                if ((*((_WORD *)v29 + 15) & 0x400) == 0)
                  WebCore::Node::removedLastRef(v29, v28);
              }
              else
              {
                *((_DWORD *)v29 + 6) -= 2;
              }
            }
          }
        }
        v14 = (char)WebCore::documentOrder(&v30, &v39, v17) > 0;
        v18 = v30;
        v30 = 0;
        if (v18)
        {
          if (*((_DWORD *)v18 + 6) == 2)
          {
            if ((*((_WORD *)v18 + 15) & 0x400) == 0)
              WebCore::Node::removedLastRef(v18, v13);
          }
          else
          {
            *((_DWORD *)v18 + 6) -= 2;
          }
        }
      }
      v19 = v34;
      v34 = 0;
      if (v19)
      {
        if (*((_DWORD *)v19 + 6) == 2)
        {
          if ((*((_WORD *)v19 + 15) & 0x400) == 0)
            WebCore::Node::removedLastRef(v19, v13);
        }
        else
        {
          *((_DWORD *)v19 + 6) -= 2;
        }
      }
      if (v14)
        WebCore::FrameSelection::moveTo(v8, (uint64_t *)v38, 1, 0);
    }
    if (v4)
      v20 = 2;
    else
      v20 = 3;
    WebCore::FrameSelection::modify(v8, 1, v20, v5, 1);
    v22 = v39;
    v39 = 0;
    if (v22)
    {
      if (*((_DWORD *)v22 + 6) == 2)
      {
        if ((*((_WORD *)v22 + 15) & 0x400) == 0)
          WebCore::Node::removedLastRef(v22, v21);
      }
      else
      {
        *((_DWORD *)v22 + 6) -= 2;
      }
    }
    v23 = v38[0];
    v38[0] = 0;
    if (v23)
    {
      if (*((_DWORD *)v23 + 6) == 2)
      {
        if ((*((_WORD *)v23 + 15) & 0x400) == 0)
          WebCore::Node::removedLastRef(v23, v21);
      }
      else
      {
        *((_DWORD *)v23 + 6) -= 2;
      }
    }
    WebCore::VisibleSelection::~VisibleSelection((WebCore::VisibleSelection *)v40);
  }
}

- (void)accessibilityIncreaseSelection:(unsigned __int8)a3
{
  -[WebAccessibilityObjectWrapper accessibilityModifySelection:increase:](self, "accessibilityModifySelection:increase:", a3, 1);
}

- (void)_accessibilitySetFocus:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  if (-[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
  {
    v5 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
    if (v5)
      (*(void (**)(void *, _BOOL8))(*(_QWORD *)v5 + 1760))(v5, v3);
  }
}

- (BOOL)_accessibilityIsFocusedForTesting
{
  void *v2;

  v2 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
  if (v2)
    LOBYTE(v2) = (*(uint64_t (**)(void *))(*(_QWORD *)v2 + 552))(v2);
  return (char)v2;
}

- (void)accessibilityDecreaseSelection:(unsigned __int8)a3
{
  -[WebAccessibilityObjectWrapper accessibilityModifySelection:increase:](self, "accessibilityModifySelection:increase:", a3, 0);
}

- (void)accessibilityMoveSelectionToMarker:(id)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  WebCore::Node *v8;
  WebCore::Node *v9;

  if (-[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
  {
    if (a3)
    {
      objc_msgSend(a3, "visiblePosition");
      if (v9)
      {
        v5 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
        v6 = (*(uint64_t (**)(void *))(*(_QWORD *)v5 + 1712))(v5);
        WebCore::FrameSelection::moveTo(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v6 + 528) + 8) + 296) + 3064), (uint64_t *)&v9, 1, 0);
        v8 = v9;
        v9 = 0;
        if (v8)
        {
          if (*((_DWORD *)v8 + 6) == 2)
          {
            if ((*((_WORD *)v8 + 15) & 0x400) == 0)
              WebCore::Node::removedLastRef(v8, v7);
          }
          else
          {
            *((_DWORD *)v8 + 6) -= 2;
          }
        }
      }
    }
  }
}

- (void)accessibilityIncrement
{
  void *v3;

  if (-[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
  {
    v3 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
    (*(void (**)(void *))(*(_QWORD *)v3 + 1880))(v3);
  }
}

- (void)accessibilityDecrement
{
  void *v3;

  if (-[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
  {
    v3 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
    (*(void (**)(void *))(*(_QWORD *)v3 + 1888))(v3);
  }
}

- (void)_accessibilitySetValue:(id)a3
{
  void *v5;
  WTF::StringImpl *v6;
  WTF::StringImpl *v7;
  WTF::StringImpl *v8;

  if (-[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
  {
    v5 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
    MEMORY[0x19AEA5508](&v8, a3);
    (*(void (**)(void *, WTF::StringImpl **))(*(_QWORD *)v5 + 1784))(v5, &v8);
    v7 = v8;
    v8 = 0;
    if (v7)
    {
      if (*(_DWORD *)v7 == 2)
        WTF::StringImpl::destroy(v7, v6);
      else
        *(_DWORD *)v7 -= 2;
    }
  }
}

- (id)stringForTextMarkers:(id)a3
{
  __CFString *v4;
  uint64_t v5;
  WTF::StringImpl *v6;
  WTF::StringImpl *v7;
  WebCore::Node *v8;
  WebCore::Node *v9;
  WTF::StringImpl *v11;
  WebCore::Node *v12;
  WebCore::Node *v13;
  char v14;

  v4 = (__CFString *)self;
  if (!-[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
    return 0;
  if (!v4)
    return v4;
  -[__CFString rangeForTextMarkers:](v4, "rangeForTextMarkers:", a3);
  if (!v14)
    return 0;
  v5 = -[__CFString axBackingObject](v4, "axBackingObject");
  (*(void (**)(WTF::StringImpl **__return_ptr, uint64_t, WebCore::Node **))(*(_QWORD *)v5 + 2048))(&v11, v5, &v12);
  if (v11)
  {
    v4 = (__CFString *)WTF::StringImpl::operator NSString *();
    v7 = v11;
    v11 = 0;
    if (v7)
    {
      if (*(_DWORD *)v7 == 2)
        WTF::StringImpl::destroy(v7, v6);
      else
        *(_DWORD *)v7 -= 2;
    }
  }
  else
  {
    v4 = &stru_1E3487BC0;
  }
  if (v14)
  {
    v8 = v13;
    v13 = 0;
    if (v8)
    {
      if (*((_DWORD *)v8 + 6) == 2)
      {
        if ((*((_WORD *)v8 + 15) & 0x400) == 0)
          WebCore::Node::removedLastRef(v8, v6);
      }
      else
      {
        *((_DWORD *)v8 + 6) -= 2;
      }
    }
    v9 = v12;
    v12 = 0;
    if (v9)
    {
      if (*((_DWORD *)v9 + 6) == 2)
      {
        if ((*((_WORD *)v9 + 15) & 0x400) == 0)
          WebCore::Node::removedLastRef(v9, v6);
      }
      else
      {
        *((_DWORD *)v9 + 6) -= 2;
      }
    }
  }
  return v4;
}

- (id)arrayOfTextForTextMarkers:(id)a3 attributed:(BOOL)a4
{
  void *v6;
  void *v7;
  CFTypeRef v8;
  void *v9;
  WebCore::Node *v10;
  WebCore::Node *v11;
  id result;
  void *v13;
  WebCore::Node *v14;
  WebCore::Node *v15;
  WebCore::Node *v16[3];
  CFTypeRef cf[3];
  WebCore::Node *v18[2];
  WebCore::Node *v19;
  char v20;

  if (!-[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall", a3, a4)
    || objc_msgSend(a3, "count") != 2)
  {
    return 0;
  }
  v6 = (void *)objc_msgSend(a3, "objectAtIndex:", 0);
  v7 = (void *)objc_msgSend(a3, "objectAtIndex:", 1);
  objc_opt_class();
  v8 = 0;
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return (id)v8;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  if (v6)
  {
    objc_msgSend(v6, "visiblePosition");
    if (v7)
    {
LABEL_7:
      objc_msgSend(v7, "visiblePosition");
      goto LABEL_10;
    }
  }
  else
  {
    memset(cf, 0, sizeof(cf));
    if (v7)
      goto LABEL_7;
  }
  memset(v16, 0, sizeof(v16));
LABEL_10:
  WebCore::makeSimpleRange<WebCore::VisiblePosition,WebCore::VisiblePosition>((uint64_t *)cf, (uint64_t)v16, (uint64_t)v18);
  v10 = v16[0];
  v16[0] = 0;
  if (v10)
  {
    if (*((_DWORD *)v10 + 6) == 2)
    {
      if ((*((_WORD *)v10 + 15) & 0x400) == 0)
        WebCore::Node::removedLastRef(v10, v9);
    }
    else
    {
      *((_DWORD *)v10 + 6) -= 2;
    }
  }
  v11 = (WebCore::Node *)cf[0];
  cf[0] = 0;
  if (v11)
  {
    if (*((_DWORD *)v11 + 6) == 2)
    {
      if ((*((_WORD *)v11 + 15) & 0x400) == 0)
        WebCore::Node::removedLastRef(v11, v9);
    }
    else
    {
      *((_DWORD *)v11 + 6) -= 2;
    }
  }
  if (!v20)
    return 0;
  result = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
  if (v20)
  {
    WebCore::AccessibilityObject::contentForRange((uint64_t)result, v18, cf);
    v8 = (id)CFMakeCollectable(cf[0]);
    if (v20)
    {
      v14 = v19;
      v19 = 0;
      if (v14)
      {
        if (*((_DWORD *)v14 + 6) == 2)
        {
          if ((*((_WORD *)v14 + 15) & 0x400) == 0)
            WebCore::Node::removedLastRef(v14, v13);
        }
        else
        {
          *((_DWORD *)v14 + 6) -= 2;
        }
      }
      v15 = v18[0];
      v18[0] = 0;
      if (v15)
      {
        if (*((_DWORD *)v15 + 6) == 2)
        {
          if ((*((_WORD *)v15 + 15) & 0x400) == 0)
            WebCore::Node::removedLastRef(v15, v13);
        }
        else
        {
          *((_DWORD *)v15 + 6) -= 2;
        }
      }
    }
    return (id)v8;
  }
  __break(1u);
  return result;
}

- (int64_t)positionForTextMarker:(id)a3
{
  _BOOL4 v5;
  int64_t NSRange;
  void *v7;
  void *v8;
  WebCore::Node *v9;
  WebCore::Node *v10;
  WebCore::Node *v11;
  WebCore::Node *v12;
  WebCore::Node *v13;
  WebCore::Node *v14;
  Node *var0;
  WebCore::Node *v17;
  int v18;
  WebCore::Node *v19;
  int v20;
  char v21;
  WebCore::Node *v22;
  int v23;
  WebCore::Node *v24;
  int v25;
  char v26;
  CharacterOffset v27;

  v5 = -[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall");
  NSRange = 0x7FFFFFFFFFFFFFFFLL;
  if (a3)
  {
    if (v5)
    {
      v7 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
      if ((*(uint64_t (**)(void *))(*(_QWORD *)v7 + 1488))(v7))
      {
        objc_msgSend(a3, "characterOffset");
        WebCore::AXObjectCache::rangeForUnorderedCharacterOffsets(&v27, &v27, (uint64_t)&v22);
        if (v26)
        {
          v9 = v22;
          *((_DWORD *)v22 + 6) += 2;
          v17 = v9;
          v18 = v23;
          v10 = v24;
          *((_DWORD *)v24 + 6) += 2;
          v19 = v10;
          v20 = v25;
          v21 = 1;
          NSRange = makeNSRange((uint64_t *)&v17);
          if (v21)
          {
            v11 = v19;
            v19 = 0;
            if (v11)
            {
              if (*((_DWORD *)v11 + 6) == 2)
              {
                if ((*((_WORD *)v11 + 15) & 0x400) == 0)
                  WebCore::Node::removedLastRef(v11, v8);
              }
              else
              {
                *((_DWORD *)v11 + 6) -= 2;
              }
            }
            v12 = v17;
            v17 = 0;
            if (v12)
            {
              if (*((_DWORD *)v12 + 6) == 2)
              {
                if ((*((_WORD *)v12 + 15) & 0x400) == 0)
                  WebCore::Node::removedLastRef(v12, v8);
              }
              else
              {
                *((_DWORD *)v12 + 6) -= 2;
              }
            }
          }
          if (v26)
          {
            v13 = v24;
            v24 = 0;
            if (v13)
            {
              if (*((_DWORD *)v13 + 6) == 2)
              {
                if ((*((_WORD *)v13 + 15) & 0x400) == 0)
                  WebCore::Node::removedLastRef(v13, v8);
              }
              else
              {
                *((_DWORD *)v13 + 6) -= 2;
              }
            }
            v14 = v22;
            v22 = 0;
            if (v14)
            {
              if (*((_DWORD *)v14 + 6) == 2)
              {
                if ((*((_WORD *)v14 + 15) & 0x400) == 0)
                  WebCore::Node::removedLastRef(v14, v8);
              }
              else
              {
                *((_DWORD *)v14 + 6) -= 2;
              }
            }
          }
        }
        else
        {
          NSRange = 0x7FFFFFFFFFFFFFFFLL;
        }
        var0 = v27.var0.var0;
        v27.var0.var0 = 0;
        if (var0)
        {
          if (*((_DWORD *)var0 + 6) == 2)
          {
            if ((*((_WORD *)var0 + 15) & 0x400) == 0)
              WebCore::Node::removedLastRef((WebCore::Node *)var0, v8);
          }
          else
          {
            *((_DWORD *)var0 + 6) -= 2;
          }
        }
      }
    }
  }
  return NSRange;
}

- (id)textMarkerRange
{
  void *v3;
  id v4;
  WebCore::Node *v5;
  WebCore::Node *v6;
  WebCore::Node *v8[2];
  WebCore::Node *v9;
  char v10;

  if (!-[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
    return 0;
  (*(void (**)(WebCore::Node **__return_ptr))(*(_QWORD *)-[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject")+ 1960))(v8);
  v4 = -[WebAccessibilityObjectWrapper textMarkersForRange:](self, "textMarkersForRange:", v8);
  if (v10)
  {
    v5 = v9;
    v9 = 0;
    if (v5)
    {
      if (*((_DWORD *)v5 + 6) == 2)
      {
        if ((*((_WORD *)v5 + 15) & 0x400) == 0)
          WebCore::Node::removedLastRef(v5, v3);
      }
      else
      {
        *((_DWORD *)v5 + 6) -= 2;
      }
    }
    v6 = v8[0];
    v8[0] = 0;
    if (v6)
    {
      if (*((_DWORD *)v6 + 6) == 2)
      {
        if ((*((_WORD *)v6 + 15) & 0x400) == 0)
          WebCore::Node::removedLastRef(v6, v3);
      }
      else
      {
        *((_DWORD *)v6 + 6) -= 2;
      }
    }
  }
  return v4;
}

- (_NSRange)elementTextRange
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  int64_t v6;
  NSUInteger v7;
  NSUInteger v8;
  _NSRange result;

  if (-[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall")
    && (v3 = -[WebAccessibilityObjectWrapper textMarkerRange](self, "textMarkerRange"), objc_msgSend(v3, "count") == 2))
  {
    v4 = objc_msgSend(v3, "objectAtIndex:", 0);
    v5 = objc_msgSend(v3, "objectAtIndex:", 1);
    v6 = -[WebAccessibilityObjectWrapper positionForTextMarker:](self, "positionForTextMarker:", v4);
    v7 = -[WebAccessibilityObjectWrapper positionForTextMarker:](self, "positionForTextMarker:", v5) - v6;
  }
  else
  {
    v7 = 0;
    v6 = 0x7FFFFFFFFFFFFFFFLL;
  }
  v8 = v6;
  result.length = v7;
  result.location = v8;
  return result;
}

- (id)accessibilityObjectForTextMarker:(id)a3
{
  _BOOL4 v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = -[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall");
  v5 = 0;
  if (a3 && v4)
  {
    v6 = objc_msgSend(a3, "accessibilityObject");
    if (v6)
    {
      do
      {
        v5 = *(void **)(v6 + 24);
        if (!v5)
          break;
        if ((objc_msgSend(*(id *)(v6 + 24), "isAccessibilityElement") & 1) != 0)
          break;
        v7 = objc_msgSend(v5, "axBackingObject");
        if (!v7)
          break;
        v8 = v7;
        if (objc_msgSend(v5, "isAttachment"))
        {
          if (!objc_msgSend((id)objc_msgSend(v5, "attachmentView"), "accessibilityIsIgnored"))
            break;
        }
        v6 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v8 + 1240))(v8);
      }
      while (v6);
    }
    else
    {
      return 0;
    }
  }
  return v5;
}

- (id)textMarkerRangeForSelection
{
  void *v3;
  void *v4;
  WebAccessibilityTextMarker *v5;
  WebAccessibilityTextMarker *v6;
  void *v7;
  WebCore::Node *v8;
  WebCore::Node *v9;
  WebCore::Node *v10;
  WebCore::Node *v11;
  WebCore::Node *v13[3];
  WebCore::Node *v14[3];
  WebCore::Node *v15[2];
  WebCore::Node *v16;
  char v17;
  _BYTE v18[104];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  if (-[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
  {
    WebCore::AccessibilityObject::selection((WebCore::AccessibilityObject *)-[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject"), (uint64_t)v18);
    if (v18[97])
    {
      v3 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
      v4 = (void *)(*(uint64_t (**)(void *))(*(_QWORD *)v3 + 1488))(v3);
      if (!v4)
      {
LABEL_24:
        WebCore::VisibleSelection::~VisibleSelection((WebCore::VisibleSelection *)v18);
        return v4;
      }
      WebCore::VisibleSelection::toNormalizedRange((WebCore::VisibleSelection *)v18, v15);
      if (v17)
      {
        WebCore::AXObjectCache::startOrEndCharacterOffsetForRange((WebCore::AXObjectCache *)v4, (const WebCore::SimpleRange *)v15, 1, 0, (uint64_t)v14);
        if (!v17)
          __break(1u);
        WebCore::AXObjectCache::startOrEndCharacterOffsetForRange((WebCore::AXObjectCache *)v4, (const WebCore::SimpleRange *)v15, 0, 0, (uint64_t)v13);
        v5 = +[WebAccessibilityTextMarker textMarkerWithCharacterOffset:cache:](WebAccessibilityTextMarker, "textMarkerWithCharacterOffset:cache:", v14, v4);
        v6 = +[WebAccessibilityTextMarker textMarkerWithCharacterOffset:cache:](WebAccessibilityTextMarker, "textMarkerWithCharacterOffset:cache:", v13, v4);
        v4 = 0;
        if (v5 && v6)
        {
          v19[0] = v5;
          v19[1] = v6;
          v4 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
        }
        v8 = v13[0];
        v13[0] = 0;
        if (v8)
        {
          if (*((_DWORD *)v8 + 6) == 2)
          {
            if ((*((_WORD *)v8 + 15) & 0x400) == 0)
              WebCore::Node::removedLastRef(v8, v7);
          }
          else
          {
            *((_DWORD *)v8 + 6) -= 2;
          }
        }
        v9 = v14[0];
        v14[0] = 0;
        if (v9)
        {
          if (*((_DWORD *)v9 + 6) == 2)
          {
            if ((*((_WORD *)v9 + 15) & 0x400) == 0)
              WebCore::Node::removedLastRef(v9, v7);
          }
          else
          {
            *((_DWORD *)v9 + 6) -= 2;
          }
        }
        if (v17)
        {
          v10 = v16;
          v16 = 0;
          if (v10)
          {
            if (*((_DWORD *)v10 + 6) == 2)
            {
              if ((*((_WORD *)v10 + 15) & 0x400) == 0)
                WebCore::Node::removedLastRef(v10, v7);
            }
            else
            {
              *((_DWORD *)v10 + 6) -= 2;
            }
          }
          v11 = v15[0];
          v15[0] = 0;
          if (v11)
          {
            if (*((_DWORD *)v11 + 6) == 2)
            {
              if ((*((_WORD *)v11 + 15) & 0x400) == 0)
                WebCore::Node::removedLastRef(v11, v7);
            }
            else
            {
              *((_DWORD *)v11 + 6) -= 2;
            }
          }
        }
        goto LABEL_24;
      }
    }
    v4 = 0;
    goto LABEL_24;
  }
  return 0;
}

- (id)textMarkerForPosition:(int64_t)a3
{
  void *v5;
  unsigned int *v6;
  void *v7;
  id result;
  void *v9;
  WebAccessibilityTextMarker *v10;
  WebCore::Node *v11;
  WebCore::Node *v12;
  WebCore::Node *v13;
  WebCore::Node *v14[3];
  WebCore::Node *v15[2];
  WebCore::Node *v16;
  char v17;
  _NSRange v18;

  if (!-[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
    return 0;
  v5 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
  v6 = (unsigned int *)(*(uint64_t (**)(void *))(*(_QWORD *)v5 + 1712))(v5);
  v18.location = a3;
  v18.length = 0;
  makeDOMRange(v6, v18, (uint64_t)v15);
  if (!v17)
    return 0;
  v7 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
  result = (id)(*(uint64_t (**)(void *))(*(_QWORD *)v7 + 1488))(v7);
  v10 = (WebAccessibilityTextMarker *)result;
  if (!result)
  {
LABEL_8:
    if (v17)
    {
      v12 = v16;
      v16 = 0;
      if (v12)
      {
        if (*((_DWORD *)v12 + 6) == 2)
        {
          if ((*((_WORD *)v12 + 15) & 0x400) == 0)
            WebCore::Node::removedLastRef(v12, v9);
        }
        else
        {
          *((_DWORD *)v12 + 6) -= 2;
        }
      }
      v13 = v15[0];
      v15[0] = 0;
      if (v13)
      {
        if (*((_DWORD *)v13 + 6) == 2)
        {
          if ((*((_WORD *)v13 + 15) & 0x400) == 0)
            WebCore::Node::removedLastRef(v13, v9);
        }
        else
        {
          *((_DWORD *)v13 + 6) -= 2;
        }
      }
    }
    return v10;
  }
  if (v17)
  {
    WebCore::AXObjectCache::startOrEndCharacterOffsetForRange((WebCore::AXObjectCache *)result, (const WebCore::SimpleRange *)v15, 1, 0, (uint64_t)v14);
    v10 = +[WebAccessibilityTextMarker textMarkerWithCharacterOffset:cache:](WebAccessibilityTextMarker, "textMarkerWithCharacterOffset:cache:", v14, v10);
    v11 = v14[0];
    v14[0] = 0;
    if (v11)
    {
      if (*((_DWORD *)v11 + 6) == 2)
      {
        if ((*((_WORD *)v11 + 15) & 0x400) == 0)
          WebCore::Node::removedLastRef(v11, v9);
      }
      else
      {
        *((_DWORD *)v11 + 6) -= 2;
      }
    }
    goto LABEL_8;
  }
  __break(1u);
  return result;
}

- (id)stringForRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  void *v6;
  unsigned int *v7;
  void *v8;
  WTF::StringImpl *v9;
  const __CFString *v10;
  WTF::StringImpl *v11;
  WebCore::Node *v12;
  WebCore::Node *v13;
  WTF::StringImpl *v15;
  WebCore::Node *v16[2];
  WebCore::Node *v17;
  char v18;
  _NSRange v19;

  length = a3.length;
  location = a3.location;
  if (!-[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
    return 0;
  v6 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
  v7 = (unsigned int *)(*(uint64_t (**)(void *))(*(_QWORD *)v6 + 1712))(v6);
  v19.location = location;
  v19.length = length;
  makeDOMRange(v7, v19, (uint64_t)v16);
  if (!v18)
    return 0;
  v8 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
  if (v18)
  {
    (*(void (**)(WTF::StringImpl **__return_ptr, void *, WebCore::Node **))(*(_QWORD *)v8 + 2048))(&v15, v8, v16);
    if (v15)
    {
      v10 = (const __CFString *)WTF::StringImpl::operator NSString *();
      v11 = v15;
      v15 = 0;
      if (v11)
      {
        if (*(_DWORD *)v11 == 2)
          WTF::StringImpl::destroy(v11, v9);
        else
          *(_DWORD *)v11 -= 2;
      }
      goto LABEL_8;
    }
  }
  else
  {
    __break(1u);
  }
  v10 = &stru_1E3487BC0;
LABEL_8:
  if (v18)
  {
    v12 = v17;
    v17 = 0;
    if (v12)
    {
      if (*((_DWORD *)v12 + 6) == 2)
      {
        if ((*((_WORD *)v12 + 15) & 0x400) == 0)
          WebCore::Node::removedLastRef(v12, v9);
      }
      else
      {
        *((_DWORD *)v12 + 6) -= 2;
      }
    }
    v13 = v16[0];
    v16[0] = 0;
    if (v13)
    {
      if (*((_DWORD *)v13 + 6) == 2)
      {
        if ((*((_WORD *)v13 + 15) & 0x400) == 0)
          WebCore::Node::removedLastRef(v13, v9);
      }
      else
      {
        *((_DWORD *)v13 + 6) -= 2;
      }
    }
  }
  return (id)v10;
}

- (id)attributedStringForRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  CFTypeRef v10;
  int v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  __int128 *v17;
  __int128 *v18;
  _QWORD *v19;
  _QWORD *v20;
  __int128 v21;
  __int128 v22;
  const void *v23;
  const void *v24;
  uint64_t v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  BOOL v30;
  int v31;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  const void *v46;
  char v47;
  _QWORD *v48;

  length = a3.length;
  location = a3.location;
  if (!-[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
    return 0;
  v6 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
  if (!v6)
    return 0;
  v7 = v6;
  v8 = v6[1];
  if (__ldaxr((unsigned __int8 *)v8))
  {
    __clrex();
  }
  else if (!__stxr(1u, (unsigned __int8 *)v8))
  {
    goto LABEL_8;
  }
  MEMORY[0x19AEA534C](v8);
LABEL_8:
  ++*(_QWORD *)(v8 + 8);
  v11 = __ldxr((unsigned __int8 *)v8);
  if (v11 != 1)
  {
    __clrex();
    goto LABEL_12;
  }
  if (__stlxr(0, (unsigned __int8 *)v8))
LABEL_12:
    WTF::Lock::unlockSlow((WTF::Lock *)v8);
  v12 = -[WebAccessibilityObjectWrapper textMarkerForPosition:](self, "textMarkerForPosition:", location);
  v13 = -[WebAccessibilityObjectWrapper textMarkerForPosition:](self, "textMarkerForPosition:", location + length);
  v14 = v13;
  if (v12 && v13)
    goto LABEL_21;
  v15 = -[WebAccessibilityObjectWrapper textMarkerRange](self, "textMarkerRange");
  if (objc_msgSend(v15, "count") != 2)
  {
    v10 = 0;
    goto LABEL_36;
  }
  if (!v12)
    v12 = (id)objc_msgSend(v15, "objectAtIndex:", 0);
  if (!v14)
    v14 = (void *)objc_msgSend(v15, "objectAtIndex:", 1);
  if (v12)
  {
LABEL_21:
    objc_msgSend(v12, "textMarkerData");
  }
  else
  {
    v38 = 0u;
    v39 = 0u;
  }
  v40 = v38;
  v41 = v39;
  if (v14)
  {
    objc_msgSend(v14, "textMarkerData");
  }
  else
  {
    v34 = 0u;
    v35 = 0u;
  }
  v36 = v34;
  v37 = v35;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  if ((_QWORD)v40 == (_QWORD)v34)
  {
    if (DWORD2(v41) < DWORD2(v37) || DWORD2(v41) <= DWORD2(v37))
    {
LABEL_28:
      v17 = &v36;
      v18 = &v40;
      goto LABEL_33;
    }
  }
  else
  {
    v47 = -127;
    v19 = (_QWORD *)WTF::fastMalloc((WTF *)0x20);
    *v19 = off_1E3370C78;
    v19[1] = &v40;
    v19[2] = &v36;
    v19[3] = &v47;
    v48 = v19;
    WTF::callOnMainThreadAndWait();
    v20 = v48;
    v48 = 0;
    if (v20)
      (*(void (**)(_QWORD *))(*v20 + 8))(v20);
    if (v47 <= 0)
      goto LABEL_28;
  }
  v17 = &v40;
  v18 = &v36;
LABEL_33:
  v21 = v18[1];
  v42 = *v18;
  v43 = v21;
  v22 = v17[1];
  v44 = *v17;
  v45 = v22;
  (*(void (**)(const void **__return_ptr, _QWORD *, __int128 *, _QWORD))(*v7 + 1416))(&v46, v7, &v42, 0);
  v23 = v46;
  v46 = 0;
  v10 = (id)CFMakeCollectable(v23);
  v24 = v46;
  v46 = 0;
  if (v24)
    CFRelease(v24);
LABEL_36:
  v25 = v7[1];
  if (__ldaxr((unsigned __int8 *)v25))
  {
    __clrex();
  }
  else if (!__stxr(1u, (unsigned __int8 *)v25))
  {
    goto LABEL_40;
  }
  MEMORY[0x19AEA534C](v25);
LABEL_40:
  v27 = *(_QWORD *)(v25 + 8);
  v28 = v27 - 1;
  *(_QWORD *)(v25 + 8) = v27 - 1;
  if (v27 == 1)
  {
    v33 = *(_QWORD *)(v25 + 16);
    v29 = *(_QWORD *)(v25 + 24);
    *(_QWORD *)(v25 + 24) = 0;
    v30 = v33 != 0;
  }
  else
  {
    v29 = 0;
    v30 = 1;
  }
  v31 = __ldxr((unsigned __int8 *)v25);
  if (v31 == 1)
  {
    if (!__stlxr(0, (unsigned __int8 *)v25))
    {
      if (v28)
        return (id)v10;
      goto LABEL_48;
    }
  }
  else
  {
    __clrex();
  }
  WTF::Lock::unlockSlow((WTF::Lock *)v25);
  if (v28)
    return (id)v10;
LABEL_48:
  if (v29)
    (*(void (**)(uint64_t))(*(_QWORD *)v29 + 8))(v29);
  if (!v30)
    WTF::fastFree((WTF *)v25, v16);
  return (id)v10;
}

- (id)attributedStringForElement
{
  id v3;
  void *v4;
  void *v5;
  CFTypeRef v6;
  void *v8;
  __int128 *v9;
  __int128 *v10;
  _QWORD *v11;
  _QWORD *v12;
  __int128 v13;
  __int128 v14;
  const void *v15;
  const void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  const void *v29;
  char v30;
  _QWORD *v31;

  if (!-[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
    return 0;
  v3 = -[WebAccessibilityObjectWrapper textMarkerRange](self, "textMarkerRange");
  if (objc_msgSend(v3, "count") != 2)
    return 0;
  v4 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
  v5 = (void *)objc_msgSend(v3, "firstObject");
  if (v5)
  {
    objc_msgSend(v5, "textMarkerData");
  }
  else
  {
    v21 = 0u;
    v22 = 0u;
  }
  v23 = v21;
  v24 = v22;
  v8 = (void *)objc_msgSend(v3, "lastObject");
  if (v8)
  {
    objc_msgSend(v8, "textMarkerData");
  }
  else
  {
    v17 = 0u;
    v18 = 0u;
  }
  v19 = v17;
  v20 = v18;
  v25 = 0u;
  v26 = 0u;
  if ((_QWORD)v23 == (_QWORD)v17)
  {
    if (DWORD2(v24) < DWORD2(v20) || DWORD2(v24) <= DWORD2(v20))
    {
LABEL_14:
      v9 = &v19;
      v10 = &v23;
      goto LABEL_19;
    }
  }
  else
  {
    v30 = -127;
    v11 = (_QWORD *)WTF::fastMalloc((WTF *)0x20);
    *v11 = off_1E3370C78;
    v11[1] = &v23;
    v11[2] = &v19;
    v11[3] = &v30;
    v31 = v11;
    WTF::callOnMainThreadAndWait();
    v12 = v31;
    v31 = 0;
    if (v12)
      (*(void (**)(_QWORD *))(*v12 + 8))(v12);
    if (v30 <= 0)
      goto LABEL_14;
  }
  v9 = &v23;
  v10 = &v19;
LABEL_19:
  v13 = v10[1];
  v25 = *v10;
  v26 = v13;
  v14 = v9[1];
  v27 = *v9;
  v28 = v14;
  (*(void (**)(const void **__return_ptr, void *, __int128 *, _QWORD))(*(_QWORD *)v4 + 1416))(&v29, v4, &v25, 0);
  v15 = v29;
  v29 = 0;
  v6 = (id)CFMakeCollectable(v15);
  v16 = v29;
  v29 = 0;
  if (v16)
    CFRelease(v16);
  return (id)v6;
}

- (_NSRange)browserAccessibilitySelectedTextRange
{
  void *v3;
  int v4;
  uint64_t v5;
  void *v8;
  uint64_t v9;
  NSUInteger v10;
  NSUInteger v11;
  _NSRange result;

  if (-[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
  {
    v3 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
    v4 = (*(uint64_t (**)(void *))(*(_QWORD *)v3 + 1456))(v3);
    v5 = 0x7FFFFFFFFFFFFFFFLL;
    if ((v4 - 101) <= 0x19 && ((1 << (v4 - 101)) & 0x3000001) != 0 || v4 == 19)
    {
      v8 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
      v9 = (*(uint64_t (**)(void *))(*(_QWORD *)v8 + 1600))(v8);
      if (v9 | v11)
        v5 = v9;
      else
        v11 = 0;
    }
    else
    {
      v11 = 0;
    }
  }
  else
  {
    v11 = 0;
    v5 = 0x7FFFFFFFFFFFFFFFLL;
  }
  v10 = v5;
  result.length = v11;
  result.location = v10;
  return result;
}

- (void)browserAccessibilitySetSelectedTextRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  void *v6;
  _QWORD v7[2];

  length = a3.length;
  location = a3.location;
  if (-[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
  {
    v6 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
    v7[0] = location;
    v7[1] = length;
    (*(void (**)(void *, _QWORD *))(*(_QWORD *)v6 + 1776))(v6, v7);
  }
}

- (BOOL)accessibilityReplaceRange:(_NSRange)a3 withText:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  void *v8;
  WTF::StringImpl *v9;
  char v10;
  WTF::StringImpl *v11;
  _QWORD v13[2];
  WTF::StringImpl *v14;

  length = a3.length;
  location = a3.location;
  if (!-[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
    return 0;
  v8 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
  MEMORY[0x19AEA5508](&v14, a4);
  v13[0] = location;
  v13[1] = length;
  v10 = (*(uint64_t (**)(void *, WTF::StringImpl **, _QWORD *))(*(_QWORD *)v8 + 1800))(v8, &v14, v13);
  v11 = v14;
  v14 = 0;
  if (v11)
  {
    if (*(_DWORD *)v11 == 2)
      WTF::StringImpl::destroy(v11, v9);
    else
      *(_DWORD *)v11 -= 2;
  }
  return v10;
}

- (BOOL)accessibilityInsertText:(id)a3
{
  void *v5;
  WTF::StringImpl *v6;
  char v7;
  WTF::StringImpl *v8;
  WTF::StringImpl *v10;

  if (!-[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
    return 0;
  v5 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
  MEMORY[0x19AEA5508](&v10, a3);
  v7 = (*(uint64_t (**)(void *, WTF::StringImpl **))(*(_QWORD *)v5 + 1808))(v5, &v10);
  v8 = v10;
  v10 = 0;
  if (v8)
  {
    if (*(_DWORD *)v8 == 2)
      WTF::StringImpl::destroy(v8, v6);
    else
      *(_DWORD *)v8 -= 2;
  }
  return v7;
}

- (void)browserAccessibilityInsertTextAtCursor:(id)a3
{
  void *v5;
  WTF::StringImpl *v6;
  WTF::StringImpl *v7;
  WTF::StringImpl *v8;

  if (-[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
  {
    v5 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
    MEMORY[0x19AEA5508](&v8, a3);
    (*(void (**)(void *, WTF::StringImpl **))(*(_QWORD *)v5 + 1808))(v5, &v8);
    v7 = v8;
    v8 = 0;
    if (v7)
    {
      if (*(_DWORD *)v7 == 2)
        WTF::StringImpl::destroy(v7, v6);
      else
        *(_DWORD *)v7 -= 2;
    }
  }
}

- (void)browserAccessibilityDeleteTextAtCursor:(int64_t)a3
{
  _BOOL4 v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  int64_t v11;

  v5 = -[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall");
  if (a3 >= 1 && v5)
  {
    v6 = -[WebAccessibilityObjectWrapper browserAccessibilitySelectedTextRange](self, "browserAccessibilitySelectedTextRange");
    v8 = v7;
    v9 = -[WebAccessibilityObjectWrapper accessibilityTraits](self, "accessibilityTraits");
    v10 = -[WebAccessibilityObjectWrapper _axSecureTextFieldTrait](self, "_axSecureTextFieldTrait") & v9;
    if (v10)
    {
      v6 = objc_msgSend(-[WebAccessibilityObjectWrapper accessibilityValue](self, "accessibilityValue"), "length");
    }
    else if (v8)
    {
      -[WebAccessibilityObjectWrapper accessibilityReplaceRange:withText:](self, "accessibilityReplaceRange:withText:", v6, v8, &stru_1E3487BC0);
      return;
    }
    if (v6 >= a3)
      v11 = a3;
    else
      v11 = v6;
    -[WebAccessibilityObjectWrapper accessibilityReplaceRange:withText:](self, "accessibilityReplaceRange:withText:", v6 - v11, v11, &stru_1E3487BC0);
    if (v10)
      -[WebAccessibilityObjectWrapper browserAccessibilitySetSelectedTextRange:](self, "browserAccessibilitySetSelectedTextRange:", objc_msgSend(-[WebAccessibilityObjectWrapper accessibilityValue](self, "accessibilityValue"), "length"), 0);
  }
}

- (id)selectionRangeString
{
  return -[WebAccessibilityObjectWrapper stringForTextMarkers:](self, "stringForTextMarkers:", -[WebAccessibilityObjectWrapper textMarkerRangeForSelection](self, "textMarkerRangeForSelection"));
}

- (id)selectedTextMarker
{
  int v3;
  int v4;
  const WebCore::VisiblePosition *v5;
  void *v7;
  WebCore::Node *v8;
  const WebCore::Node *v9;
  void *v10;
  WebCore::Node *v11;
  WebCore::Node *v12;
  void *v13;
  void *v14;
  WebAccessibilityTextMarker *v15;
  WebCore::Node *v16;
  void *v18;
  WebCore::Node *v19;
  WebCore::Node *v20;
  void *v21;
  WebCore::Node *v22;
  WebCore::Node *v23;
  int v24;
  char v25;
  char v26;
  _BYTE v27[64];
  _BYTE v28[40];
  WebCore::Node *v29;
  int v30;
  char v31;
  char v32;

  if (!-[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
    return 0;
  WebCore::AccessibilityObject::selection((WebCore::AccessibilityObject *)-[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject"), (uint64_t)v27);
  v3 = v28[33];
  v4 = v28[32];
  WebCore::VisiblePosition::canonicalPosition((WebCore::VisiblePosition *)v28, (uint64_t)&v23);
  v26 = 1;
  if (v3 == 2 || v4 != 0)
  {
LABEL_6:
    if (v23)
      goto LABEL_11;
    goto LABEL_7;
  }
  v20 = v23;
  if (v23)
  {
    *((_DWORD *)v23 + 6) += 2;
    v29 = v20;
    v30 = v24;
    v31 = v25;
    v32 = 0;
    if (!WebCore::inSameLine((WebCore *)&v23, (const WebCore::VisiblePosition *)&v29, v5))
      v26 = 0;
    v22 = v29;
    v29 = 0;
    if (v22)
    {
      if (*((_DWORD *)v22 + 6) == 2)
      {
        if ((*((_WORD *)v22 + 15) & 0x400) == 0)
          WebCore::Node::removedLastRef(v22, v21);
      }
      else
      {
        *((_DWORD *)v22 + 6) -= 2;
      }
    }
    goto LABEL_6;
  }
LABEL_7:
  v7 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
  v8 = (WebCore::Node *)(*(uint64_t (**)(void *))(*(_QWORD *)v7 + 1712))(v7);
  WebCore::startOfDocument(v8, v9, (uint64_t)&v29);
  v11 = v29;
  v29 = 0;
  v12 = v23;
  v23 = v11;
  if (v12)
  {
    if (*((_DWORD *)v12 + 6) == 2)
    {
      if ((*((_WORD *)v12 + 15) & 0x400) == 0)
      {
        WebCore::Node::removedLastRef(v12, v10);
        v19 = v29;
        v24 = v30;
        v25 = v31;
        v26 = v32;
        v29 = 0;
        if (v19)
        {
          if (*((_DWORD *)v19 + 6) == 2)
          {
            if ((*((_WORD *)v19 + 15) & 0x400) == 0)
              WebCore::Node::removedLastRef(v19, v18);
          }
          else
          {
            *((_DWORD *)v19 + 6) -= 2;
          }
        }
        goto LABEL_11;
      }
    }
    else
    {
      *((_DWORD *)v12 + 6) -= 2;
    }
  }
  v24 = v30;
  v25 = v31;
  v26 = v32;
LABEL_11:
  v13 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
  v15 = +[WebAccessibilityTextMarker textMarkerWithVisiblePosition:cache:](WebAccessibilityTextMarker, "textMarkerWithVisiblePosition:cache:", &v23, (*(uint64_t (**)(void *))(*(_QWORD *)v13 + 1488))(v13));
  v16 = v23;
  v23 = 0;
  if (v16)
  {
    if (*((_DWORD *)v16 + 6) == 2)
    {
      if ((*((_WORD *)v16 + 15) & 0x400) == 0)
        WebCore::Node::removedLastRef(v16, v14);
    }
    else
    {
      *((_DWORD *)v16 + 6) -= 2;
    }
  }
  WebCore::VisibleSelection::~VisibleSelection((WebCore::VisibleSelection *)v27);
  return v15;
}

- (id)lineEndMarkerForMarker:(id)a3
{
  _BOOL4 v5;
  WebAccessibilityTextMarker *v6;
  void *v7;
  void *v8;
  void *v9;
  WebCore::Node *v10;
  WebCore::Node *v11;
  WebCore::Node *v13[3];
  WebCore::Node *v14;

  v5 = -[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall");
  v6 = 0;
  if (a3 && v5)
  {
    objc_msgSend(a3, "visiblePosition");
    v7 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
    (*(void (**)(WebCore::Node **__return_ptr, void *, WebCore::Node **))(*(_QWORD *)v7 + 2088))(v13, v7, &v14);
    v8 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
    v6 = +[WebAccessibilityTextMarker textMarkerWithVisiblePosition:cache:](WebAccessibilityTextMarker, "textMarkerWithVisiblePosition:cache:", v13, (*(uint64_t (**)(void *))(*(_QWORD *)v8 + 1488))(v8));
    v10 = v13[0];
    v13[0] = 0;
    if (v10)
    {
      if (*((_DWORD *)v10 + 6) == 2)
      {
        if ((*((_WORD *)v10 + 15) & 0x400) == 0)
          WebCore::Node::removedLastRef(v10, v9);
      }
      else
      {
        *((_DWORD *)v10 + 6) -= 2;
      }
    }
    v11 = v14;
    v14 = 0;
    if (v11)
    {
      if (*((_DWORD *)v11 + 6) == 2)
      {
        if ((*((_WORD *)v11 + 15) & 0x400) == 0)
          WebCore::Node::removedLastRef(v11, v9);
      }
      else
      {
        *((_DWORD *)v11 + 6) -= 2;
      }
    }
  }
  return v6;
}

- (id)lineMarkersForMarker:(id)a3
{
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  WebCore::Node *v9;
  void *v10;
  WebAccessibilityTextMarker *v11;
  void *v12;
  WebAccessibilityTextMarker *v13;
  void *v14;
  WebCore::Node *v15;
  WebCore::Node *v16;
  WebCore::Node *v18;
  WebCore::Node *v19[3];
  WebCore::Node *v20;
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v5 = -[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall");
  v6 = 0;
  if (a3 && v5)
  {
    v7 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
    objc_msgSend(a3, "visiblePosition");
    (*(void (**)(WebCore::Node **__return_ptr, void *, WebCore::Node **))(*(_QWORD *)v7 + 2024))(v19, v7, &v18);
    v9 = v18;
    v18 = 0;
    if (v9)
    {
      if (*((_DWORD *)v9 + 6) == 2)
      {
        if ((*((_WORD *)v9 + 15) & 0x400) == 0)
          WebCore::Node::removedLastRef(v9, v8);
      }
      else
      {
        *((_DWORD *)v9 + 6) -= 2;
      }
    }
    v10 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject", v18);
    v11 = +[WebAccessibilityTextMarker textMarkerWithVisiblePosition:cache:](WebAccessibilityTextMarker, "textMarkerWithVisiblePosition:cache:", v19, (*(uint64_t (**)(void *))(*(_QWORD *)v10 + 1488))(v10));
    v12 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
    v13 = +[WebAccessibilityTextMarker textMarkerWithVisiblePosition:cache:](WebAccessibilityTextMarker, "textMarkerWithVisiblePosition:cache:", &v20, (*(uint64_t (**)(void *))(*(_QWORD *)v12 + 1488))(v12));
    v6 = 0;
    if (v11 && v13)
    {
      v21[0] = v11;
      v21[1] = v13;
      v6 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
    }
    v15 = v20;
    v20 = 0;
    if (v15)
    {
      if (*((_DWORD *)v15 + 6) == 2)
      {
        if ((*((_WORD *)v15 + 15) & 0x400) == 0)
          WebCore::Node::removedLastRef(v15, v14);
      }
      else
      {
        *((_DWORD *)v15 + 6) -= 2;
      }
    }
    v16 = v19[0];
    v19[0] = 0;
    if (v16)
    {
      if (*((_DWORD *)v16 + 6) == 2)
      {
        if ((*((_WORD *)v16 + 15) & 0x400) == 0)
          WebCore::Node::removedLastRef(v16, v14);
      }
      else
      {
        *((_DWORD *)v16 + 6) -= 2;
      }
    }
  }
  return v6;
}

- (id)lineStartMarkerForMarker:(id)a3
{
  _BOOL4 v5;
  WebAccessibilityTextMarker *v6;
  void *v7;
  void *v8;
  void *v9;
  WebCore::Node *v10;
  WebCore::Node *v11;
  WebCore::Node *v13[3];
  WebCore::Node *v14;

  v5 = -[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall");
  v6 = 0;
  if (a3 && v5)
  {
    objc_msgSend(a3, "visiblePosition");
    v7 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
    (*(void (**)(WebCore::Node **__return_ptr, void *, WebCore::Node **))(*(_QWORD *)v7 + 2096))(v13, v7, &v14);
    v8 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
    v6 = +[WebAccessibilityTextMarker textMarkerWithVisiblePosition:cache:](WebAccessibilityTextMarker, "textMarkerWithVisiblePosition:cache:", v13, (*(uint64_t (**)(void *))(*(_QWORD *)v8 + 1488))(v8));
    v10 = v13[0];
    v13[0] = 0;
    if (v10)
    {
      if (*((_DWORD *)v10 + 6) == 2)
      {
        if ((*((_WORD *)v10 + 15) & 0x400) == 0)
          WebCore::Node::removedLastRef(v10, v9);
      }
      else
      {
        *((_DWORD *)v10 + 6) -= 2;
      }
    }
    v11 = v14;
    v14 = 0;
    if (v11)
    {
      if (*((_DWORD *)v11 + 6) == 2)
      {
        if ((*((_WORD *)v11 + 15) & 0x400) == 0)
          WebCore::Node::removedLastRef(v11, v9);
      }
      else
      {
        *((_DWORD *)v11 + 6) -= 2;
      }
    }
  }
  return v6;
}

- (id)misspellingTextMarkerRange:(id)a3 forward:(BOOL)a4
{
  _BOOL4 v4;
  WebAccessibilityObjectWrapper *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  WebCore::Node *v10;
  WebCore::Node *v11;
  WebCore::Node *v12;
  WebCore::Node *v13;
  WebCore::Node *v15[2];
  WebCore::Node *v16;
  char v17;
  WebCore::Node *v18;
  WebCore::Node *v19;
  char v20;

  v4 = a4;
  v6 = self;
  if (!-[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
    return 0;
  if (!v6)
    return v6;
  -[WebAccessibilityObjectWrapper rangeForTextMarkers:](v6, "rangeForTextMarkers:", a3);
  if (!v20)
    return 0;
  v7 = -[WebAccessibilityObjectWrapper axBackingObject](v6, "axBackingObject");
  if (v4)
    v8 = 1;
  else
    v8 = 2;
  (*(void (**)(WebCore::Node **__return_ptr, uint64_t, WebCore::Node **, uint64_t))(*(_QWORD *)v7 + 696))(v15, v7, &v18, v8);
  v6 = -[WebAccessibilityObjectWrapper textMarkersForRange:](v6, "textMarkersForRange:", v15);
  if (v17)
  {
    v10 = v16;
    v16 = 0;
    if (v10)
    {
      if (*((_DWORD *)v10 + 6) == 2)
      {
        if ((*((_WORD *)v10 + 15) & 0x400) == 0)
          WebCore::Node::removedLastRef(v10, v9);
      }
      else
      {
        *((_DWORD *)v10 + 6) -= 2;
      }
    }
    v11 = v15[0];
    v15[0] = 0;
    if (v11)
    {
      if (*((_DWORD *)v11 + 6) == 2)
      {
        if ((*((_WORD *)v11 + 15) & 0x400) == 0)
          WebCore::Node::removedLastRef(v11, v9);
      }
      else
      {
        *((_DWORD *)v11 + 6) -= 2;
      }
    }
  }
  if (v20)
  {
    v12 = v19;
    v19 = 0;
    if (v12)
    {
      if (*((_DWORD *)v12 + 6) == 2)
      {
        if ((*((_WORD *)v12 + 15) & 0x400) == 0)
          WebCore::Node::removedLastRef(v12, v9);
      }
      else
      {
        *((_DWORD *)v12 + 6) -= 2;
      }
    }
    v13 = v18;
    v18 = 0;
    if (v13)
    {
      if (*((_DWORD *)v13 + 6) == 2)
      {
        if ((*((_WORD *)v13 + 15) & 0x400) == 0)
          WebCore::Node::removedLastRef(v13, v9);
      }
      else
      {
        *((_DWORD *)v13 + 6) -= 2;
      }
    }
  }
  return v6;
}

- (id)nextMarkerForMarker:(id)a3
{
  _BOOL4 v5;
  id v6;
  void *v7;
  WebCore::Node *v8;
  WebCore::Node *v10;

  v5 = -[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall");
  v6 = 0;
  if (a3)
  {
    if (v5)
    {
      objc_msgSend(a3, "characterOffset");
      v6 = -[WebAccessibilityObjectWrapper nextMarkerForCharacterOffset:](self, "nextMarkerForCharacterOffset:", &v10);
      v8 = v10;
      v10 = 0;
      if (v8)
      {
        if (*((_DWORD *)v8 + 6) == 2)
        {
          if ((*((_WORD *)v8 + 15) & 0x400) == 0)
            WebCore::Node::removedLastRef(v8, v7);
        }
        else
        {
          *((_DWORD *)v8 + 6) -= 2;
        }
      }
    }
  }
  return v6;
}

- (id)previousMarkerForMarker:(id)a3
{
  _BOOL4 v5;
  id v6;
  void *v7;
  WebCore::Node *v8;
  WebCore::Node *v10;

  v5 = -[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall");
  v6 = 0;
  if (a3)
  {
    if (v5)
    {
      objc_msgSend(a3, "characterOffset");
      v6 = -[WebAccessibilityObjectWrapper previousMarkerForCharacterOffset:](self, "previousMarkerForCharacterOffset:", &v10);
      v8 = v10;
      v10 = 0;
      if (v8)
      {
        if (*((_DWORD *)v8 + 6) == 2)
        {
          if ((*((_WORD *)v8 + 15) & 0x400) == 0)
            WebCore::Node::removedLastRef(v8, v7);
        }
        else
        {
          *((_DWORD *)v8 + 6) -= 2;
        }
      }
    }
  }
  return v6;
}

- (CGRect)frameForRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  void *v6;
  unsigned int *v7;
  WebCore::AccessibilityObject *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  unint64_t v13;
  int v14;
  int v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  WebCore::Node *v25;
  WebCore::Node *v26;
  float v27[4];
  WebCore::Node *v28[2];
  WebCore::Node *v29;
  char v30;
  _NSRange v31;
  CGRect result;

  length = a3.length;
  location = a3.location;
  if (-[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall")
    && (v6 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject"),
        v7 = (unsigned int *)(*(uint64_t (**)(void *))(*(_QWORD *)v6 + 1712))(v6),
        v31.location = location,
        v31.length = length,
        makeDOMRange(v7, v31, (uint64_t)v28),
        v30))
  {
    v8 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
    if (!v30)
    {
      __break(1u);
      goto LABEL_18;
    }
    v13 = WebCore::AccessibilityObject::boundsForRange(v8, (const WebCore::SimpleRange *)v28);
    v27[0] = (float)(int)v13;
    v27[1] = (float)SHIDWORD(v13);
    v27[2] = (float)v14;
    v27[3] = (float)v15;
    -[WebAccessibilityObjectWrapperBase convertRectToSpace:space:](self, "convertRectToSpace:space:", v27, 0);
    v18 = v17;
    v20 = v19;
    v22 = v21;
    v24 = v23;
    if (v30)
    {
      v25 = v29;
      v29 = 0;
      if (v25)
      {
        if (*((_DWORD *)v25 + 6) == 2)
        {
          if ((*((_WORD *)v25 + 15) & 0x400) == 0)
            WebCore::Node::removedLastRef(v25, v16);
        }
        else
        {
          *((_DWORD *)v25 + 6) -= 2;
        }
      }
      v26 = v28[0];
      v28[0] = 0;
      if (v26)
      {
        if (*((_DWORD *)v26 + 6) == 2)
        {
          if ((*((_WORD *)v26 + 15) & 0x400) == 0)
            WebCore::Node::removedLastRef(v26, v16);
        }
        else
        {
          *((_DWORD *)v26 + 6) -= 2;
        }
      }
    }
  }
  else
  {
    v18 = *MEMORY[0x1E0C9D648];
    v20 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v22 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v24 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  v9 = v18;
  v10 = v20;
  v11 = v22;
  v12 = v24;
LABEL_18:
  result.size.height = v12;
  result.size.width = v11;
  result.origin.y = v10;
  result.origin.x = v9;
  return result;
}

- (CGRect)frameForTextMarkers:(id)a3
{
  void *v5;
  unint64_t v6;
  int v7;
  int v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  WebCore::Node *v18;
  WebCore::Node *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  float v24[4];
  WebCore::Node *v25;
  WebCore::Node *v26;
  char v27;
  CGRect result;

  if (-[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall")
    && (v5 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject"),
        (*(uint64_t (**)(void *))(*(_QWORD *)v5 + 1488))(v5))
    && self
    && (-[WebAccessibilityObjectWrapper rangeForTextMarkers:](self, "rangeForTextMarkers:", a3), v27))
  {
    v6 = WebCore::AccessibilityObject::boundsForRange((WebCore::AccessibilityObject *)-[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject"), (const WebCore::SimpleRange *)&v25);
    v24[0] = (float)(int)v6;
    v24[1] = (float)SHIDWORD(v6);
    v24[2] = (float)v7;
    v24[3] = (float)v8;
    -[WebAccessibilityObjectWrapperBase convertRectToSpace:space:](self, "convertRectToSpace:space:", v24, 0);
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;
    if (v27)
    {
      v18 = v26;
      v26 = 0;
      if (v18)
      {
        if (*((_DWORD *)v18 + 6) == 2)
        {
          if ((*((_WORD *)v18 + 15) & 0x400) == 0)
            WebCore::Node::removedLastRef(v18, v9);
        }
        else
        {
          *((_DWORD *)v18 + 6) -= 2;
        }
      }
      v19 = v25;
      v25 = 0;
      if (v19)
      {
        if (*((_DWORD *)v19 + 6) == 2)
        {
          if ((*((_WORD *)v19 + 15) & 0x400) == 0)
            WebCore::Node::removedLastRef(v19, v9);
        }
        else
        {
          *((_DWORD *)v19 + 6) -= 2;
        }
      }
    }
  }
  else
  {
    v11 = *MEMORY[0x1E0C9D648];
    v13 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v15 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v17 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  v20 = v11;
  v21 = v13;
  v22 = v15;
  v23 = v17;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (optional<WebCore::SimpleRange>)rangeFromMarkers:(SEL)a3 withText:(id)a4
{
  optional<WebCore::SimpleRange> *v7;
  uint64_t v8;
  WebCore::Node *v9;
  WTF::StringImpl *v10;
  WebCore::Node *v11[2];
  WebCore::Node *v12[2];
  uint64_t v13;

  if (!self)
  {
    v13 = 0;
    *(_OWORD *)v11 = 0u;
    *(_OWORD *)v12 = 0u;
LABEL_8:
    retstr->var0.var0 = 0;
    retstr->var1 = 0;
    goto LABEL_9;
  }
  v7 = self;
  self = (optional<WebCore::SimpleRange> *)unk_1EE358AE8(self, "rangeForTextMarkers:", a4);
  if (!(_BYTE)v13)
    goto LABEL_8;
  v8 = unk_1EE358AF0(v7, "axBackingObject");
  self = (optional<WebCore::SimpleRange> *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v8 + 1488))(v8);
  if (!self)
    goto LABEL_8;
  MEMORY[0x19AEA5508](&v10, a5);
  WebCore::AXObjectCache::rangeMatchesTextNearRange((const WebCore::SimpleRange *)v11, (const WTF::String *)&v10, (uint64_t)retstr);
  self = (optional<WebCore::SimpleRange> *)v10;
  v10 = 0;
  if (self)
  {
    if (*(_DWORD *)&self->var0.var0 == 2)
      self = (optional<WebCore::SimpleRange> *)WTF::StringImpl::destroy((WTF::StringImpl *)self, (WTF::StringImpl *)a3);
    else
      *(_DWORD *)&self->var0.var0 -= 2;
  }
LABEL_9:
  if ((_BYTE)v13)
  {
    v9 = v12[0];
    v12[0] = 0;
    if (v9)
    {
      if (*((_DWORD *)v9 + 6) == 2)
      {
        if ((*((_WORD *)v9 + 15) & 0x400) == 0)
          WebCore::Node::removedLastRef(v9, (void *)a3);
      }
      else
      {
        *((_DWORD *)v9 + 6) -= 2;
      }
    }
    self = (optional<WebCore::SimpleRange> *)v11[0];
    v11[0] = 0;
    if (self)
    {
      if (self->var0.var1.var1.var1 == 2)
      {
        if ((*((_WORD *)&self->var0.var1.var1.var1 + 3) & 0x400) == 0)
          return (optional<WebCore::SimpleRange> *)WebCore::Node::removedLastRef((WebCore::Node *)self, (void *)a3);
      }
      else
      {
        self->var0.var1.var1.var1 -= 2;
      }
    }
  }
  return self;
}

- (id)textMarkerRangeFromMarkers:(id)a3 withText:(id)a4
{
  void *v5;
  id v6;
  WebCore::Node *v7;
  WebCore::Node *v8;
  WebCore::Node *v10[2];
  WebCore::Node *v11[2];
  uint64_t v12;

  if (self)
  {
    -[WebAccessibilityObjectWrapper rangeFromMarkers:withText:](self, "rangeFromMarkers:withText:", a3, a4);
  }
  else
  {
    v12 = 0;
    *(_OWORD *)v10 = 0u;
    *(_OWORD *)v11 = 0u;
  }
  v6 = -[WebAccessibilityObjectWrapper textMarkersForRange:](self, "textMarkersForRange:", v10);
  if ((_BYTE)v12)
  {
    v7 = v11[0];
    v11[0] = 0;
    if (v7)
    {
      if (*((_DWORD *)v7 + 6) == 2)
      {
        if ((*((_WORD *)v7 + 15) & 0x400) == 0)
          WebCore::Node::removedLastRef(v7, v5);
      }
      else
      {
        *((_DWORD *)v7 + 6) -= 2;
      }
    }
    v8 = v10[0];
    v10[0] = 0;
    if (v8)
    {
      if (*((_DWORD *)v8 + 6) == 2)
      {
        if ((*((_WORD *)v8 + 15) & 0x400) == 0)
          WebCore::Node::removedLastRef(v8, v5);
      }
      else
      {
        *((_DWORD *)v8 + 6) -= 2;
      }
    }
  }
  return v6;
}

- (id)lineRectsForTextMarkerRange:(id)a3
{
  WebAccessibilityObjectWrapper *v4;
  void *v5;
  int v7;
  WTF *v8;
  WTF *v9;
  WTF *v10;
  WTF *v11;
  WTF *v13;
  WTF *v14;
  WTF *v15;
  __int128 v16;
  uint64_t v17;
  uint64_t v18;
  WTF *v19;
  __int128 v20;
  _OWORD *v21;
  id v22;
  void *v23;
  int *v24;
  int *v25;
  void *v26;
  float v27;
  float v28;
  uint64_t v29;
  WTF *v30;
  WebCore::Node *v31;
  WebCore::Node *v32;
  WTF *v33;
  int v34;
  unsigned int v35;
  WebCore::Node *v36;
  int v37;
  WebCore::Node *v38;
  int v39;
  char v40;
  float v41[4];

  v4 = self;
  if (!-[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
    return 0;
  if (!v4)
    return v4;
  -[WebAccessibilityObjectWrapper rangeForTextMarkers:](v4, "rangeForTextMarkers:", a3);
  if (!v40)
    return 0;
  if (v36 == v38 && v37 == v39)
  {
    v4 = 0;
LABEL_44:
    v31 = v38;
    v38 = 0;
    if (v31)
    {
      if (*((_DWORD *)v31 + 6) == 2)
      {
        if ((*((_WORD *)v31 + 15) & 0x400) == 0)
          WebCore::Node::removedLastRef(v31, v5);
      }
      else
      {
        *((_DWORD *)v31 + 6) -= 2;
      }
    }
    v32 = v36;
    v36 = 0;
    if (v32)
    {
      if (*((_DWORD *)v32 + 6) == 2)
      {
        if ((*((_WORD *)v32 + 15) & 0x400) == 0)
          WebCore::Node::removedLastRef(v32, v5);
      }
      else
      {
        *((_DWORD *)v32 + 6) -= 2;
      }
    }
    return v4;
  }
  WebCore::RenderObject::absoluteTextRects((uint64_t)&v36, 0, (uint64_t)&v33);
  if (v35)
  {
    v7 = 0;
    v8 = v33;
    v9 = (WTF *)((char *)v33 + 16 * v35);
    v10 = v9;
    v11 = v9;
    do
    {
      if (*((int *)v8 + 2) < 2 || *((_DWORD *)v8 + 3) <= 1)
      {
        v13 = v8;
        if (v11 != (WTF *)((char *)v33 + 16 * v35))
        {
          if (v10 == v8)
          {
            v13 = v11;
          }
          else
          {
            if (v10 <= v11)
            {
              v18 = 0;
              v17 = (v8 - v10) >> 4;
              do
              {
                *(_OWORD *)((char *)v11 + ((v8 - v10) & 0xFFFFFFFFFFFFFFF0) + v18 - 16) = *(_OWORD *)((char *)v8 + v18 - 16);
                v18 -= 16;
              }
              while ((WTF *)((char *)v8 + v18) != v10);
            }
            else
            {
              v14 = v11;
              v15 = v10;
              do
              {
                v16 = *(_OWORD *)v15;
                v15 = (WTF *)((char *)v15 + 16);
                *(_OWORD *)v14 = v16;
                v14 = (WTF *)((char *)v14 + 16);
              }
              while (v15 != v8);
              v17 = (v8 - v10) >> 4;
            }
            v13 = (WTF *)((char *)v11 + 16 * v17);
          }
        }
        v10 = (WTF *)((char *)v8 + 16);
        ++v7;
        v11 = v13;
      }
      v8 = (WTF *)((char *)v8 + 16);
    }
    while (v8 < v9);
    v19 = (WTF *)((char *)v33 + 16 * v35);
    if (v10 != v19)
    {
      if (v10 <= v11)
      {
        v21 = (_OWORD *)((char *)v11 + ((v19 - v10) & 0xFFFFFFFFFFFFFFF0) - 16);
        do
        {
          *v21-- = *((_OWORD *)v19 - 1);
          v19 = (WTF *)((char *)v19 - 16);
        }
        while (v19 != v10);
      }
      else
      {
        do
        {
          v20 = *(_OWORD *)v10;
          v10 = (WTF *)((char *)v10 + 16);
          *(_OWORD *)v11 = v20;
          v11 = (WTF *)((char *)v11 + 16);
        }
        while (v10 != v19);
      }
    }
    v35 -= v7;
    v22 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v23 = (void *)objc_msgSend(v22, "initWithCapacity:", v35);
    if (v35)
    {
      v24 = (int *)v33;
      v25 = (int *)((char *)v33 + 16 * v35);
      do
      {
        v26 = (void *)MEMORY[0x1E0CB3B18];
        v27 = (float)v24[1];
        v41[0] = (float)*v24;
        v41[1] = v27;
        v28 = (float)v24[3];
        v41[2] = (float)v24[2];
        v41[3] = v28;
        -[WebAccessibilityObjectWrapperBase convertRectToSpace:space:](v4, "convertRectToSpace:space:", v41, 0);
        v29 = objc_msgSend(v26, "valueWithRect:");
        if (v29)
          objc_msgSend(v23, "addObject:", v29);
        v24 += 4;
      }
      while (v24 != v25);
    }
    v4 = (id)CFMakeCollectable(v23);
  }
  else
  {
    v4 = 0;
  }
  v30 = v33;
  if (v33)
  {
    v33 = 0;
    v34 = 0;
    WTF::fastFree(v30, v5);
  }
  if (v40)
    goto LABEL_44;
  return v4;
}

- (id)textRectsFromMarkers:(id)a3 withText:(id)a4
{
  WebAccessibilityObjectWrapper *v6;
  void *v7;
  WTF *v9;
  float v10;
  void *v11;
  uint64_t v12;
  WTF *v13;
  void *v14;
  unint64_t v15;
  uint64_t v16;
  int v17;
  float v18;
  float v19;
  const WebCore::FloatRect *v20;
  int v21;
  uint64_t v22;
  WebCore::Node *v23;
  WebCore::Node *v24;
  WebCore::Node *v25;
  int v26;
  WebCore::Node *v27;
  int v28;
  char v29;
  WTF *v30;
  float v31;
  float v32;

  v6 = self;
  if (!-[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
    return 0;
  if (!v6)
    return v6;
  -[WebAccessibilityObjectWrapper rangeFromMarkers:withText:](v6, "rangeFromMarkers:withText:", a3, a4);
  if (!v29)
    return 0;
  if (v25 == v27 && v26 == v28)
  {
    v6 = 0;
    goto LABEL_20;
  }
  WebCore::RenderObject::collectSelectionGeometriesInternal(&v25, (uint64_t)&v30);
  v9 = v30;
  v10 = v32;
  if (v32 != 0.0)
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", LODWORD(v32));
    v12 = 84 * LODWORD(v10);
    v13 = v9;
    do
    {
      v14 = (void *)MEMORY[0x1E0CB3B18];
      if (*((_BYTE *)v13 + 80))
      {
        v15 = *((_QWORD *)v13 + 8);
        v16 = *((_QWORD *)v13 + 9);
      }
      else
      {
        LODWORD(v30) = WebCore::FloatQuad::boundingBox(v13);
        HIDWORD(v30) = v17;
        v31 = v18;
        v32 = v19;
        v15 = WebCore::enclosingIntRect((WebCore *)&v30, v20);
        v21 = *((unsigned __int8 *)v13 + 80);
        *((_QWORD *)v13 + 8) = v15;
        *((_QWORD *)v13 + 9) = v16;
        if (!v21)
          *((_BYTE *)v13 + 80) = 1;
      }
      *(float *)&v30 = (float)(int)v15;
      *((float *)&v30 + 1) = (float)SHIDWORD(v15);
      v31 = (float)(int)v16;
      v32 = (float)SHIDWORD(v16);
      -[WebAccessibilityObjectWrapperBase convertRectToSpace:space:](v6, "convertRectToSpace:space:", &v30, 0);
      v22 = objc_msgSend(v14, "valueWithRect:");
      if (v22)
        objc_msgSend(v11, "addObject:", v22);
      v13 = (WTF *)((char *)v13 + 84);
      v12 -= 84;
    }
    while (v12);
    v6 = (id)CFMakeCollectable(v11);
    if (!v9)
      goto LABEL_20;
    goto LABEL_19;
  }
  v6 = 0;
  if (v30)
LABEL_19:
    WTF::fastFree(v9, v7);
LABEL_20:
  if (v29)
  {
    v23 = v27;
    v27 = 0;
    if (v23)
    {
      if (*((_DWORD *)v23 + 6) == 2)
      {
        if ((*((_WORD *)v23 + 15) & 0x400) == 0)
          WebCore::Node::removedLastRef(v23, v7);
      }
      else
      {
        *((_DWORD *)v23 + 6) -= 2;
      }
    }
    v24 = v25;
    v25 = 0;
    if (v24)
    {
      if (*((_DWORD *)v24 + 6) == 2)
      {
        if ((*((_WORD *)v24 + 15) & 0x400) == 0)
          WebCore::Node::removedLastRef(v24, v7);
      }
      else
      {
        *((_DWORD *)v24 + 6) -= 2;
      }
    }
  }
  return v6;
}

- (id)textMarkerForPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  unsigned int *v7;
  unsigned int *v8;
  void *v9;
  WebAccessibilityTextMarker *v10;
  WebCore::Node *v11;
  uint64_t v13;
  WebCore::Node *v14[3];

  y = a3.y;
  x = a3.x;
  if (!-[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
    return 0;
  v6 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
  v7 = (unsigned int *)(*(uint64_t (**)(void *))(*(_QWORD *)v6 + 1488))(v6);
  if (!v7)
    return 0;
  v8 = v7;
  LODWORD(v13) = (int)x;
  HIDWORD(v13) = (int)y;
  WebCore::AXObjectCache::characterOffsetForPoint(v7, (const WebCore::IntPoint *)&v13, (WebCore::AXCoreObject *)-[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject", v13), (uint64_t)v14);
  v10 = +[WebAccessibilityTextMarker textMarkerWithCharacterOffset:cache:](WebAccessibilityTextMarker, "textMarkerWithCharacterOffset:cache:", v14, v8);
  v11 = v14[0];
  v14[0] = 0;
  if (v11)
  {
    if (*((_DWORD *)v11 + 6) == 2)
    {
      if ((*((_WORD *)v11 + 15) & 0x400) == 0)
        WebCore::Node::removedLastRef(v11, v9);
    }
    else
    {
      *((_DWORD *)v11 + 6) -= 2;
    }
  }
  return v10;
}

- (id)nextMarkerForCharacterOffset:(void *)a3
{
  void *v4;
  id result;
  id v6;
  _DWORD v7[8];

  v4 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
  result = (id)(*(uint64_t (**)(void *))(*(_QWORD *)v4 + 1488))(v4);
  if (result)
  {
    v6 = result;
    WebCore::AXObjectCache::textMarkerDataForNextCharacterOffset((unsigned int *)result, (const CharacterOffset *)a3, (uint64_t)v7);
    if (v7[1])
      return (id)(id)CFMakeCollectable(-[WebAccessibilityTextMarker initWithTextMarker:cache:]([WebAccessibilityTextMarker alloc], "initWithTextMarker:cache:", v7, v6));
    else
      return 0;
  }
  return result;
}

- (id)previousMarkerForCharacterOffset:(void *)a3
{
  void *v4;
  id result;
  id v6;
  _DWORD v7[8];

  v4 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
  result = (id)(*(uint64_t (**)(void *))(*(_QWORD *)v4 + 1488))(v4);
  if (result)
  {
    v6 = result;
    WebCore::AXObjectCache::textMarkerDataForPreviousCharacterOffset((WebCore::AXObjectCache *)result, (const CharacterOffset *)a3, (uint64_t)v7);
    if (v7[1])
      return (id)(id)CFMakeCollectable(-[WebAccessibilityTextMarker initWithTextMarker:cache:]([WebAccessibilityTextMarker alloc], "initWithTextMarker:cache:", v7, v6));
    else
      return 0;
  }
  return result;
}

- (optional<WebCore::SimpleRange>)rangeForTextMarkers:(SEL)a3
{
  optional<WebCore::SimpleRange> *result;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  Node *var0;
  CharacterOffset v13;
  CharacterOffset v14;

  result = (optional<WebCore::SimpleRange> *)objc_msgSend(a4, "count");
  if (result != (optional<WebCore::SimpleRange> *)2)
    goto LABEL_8;
  v8 = (void *)objc_msgSend(a4, "objectAtIndex:", 0);
  v9 = (void *)objc_msgSend(a4, "objectAtIndex:", 1);
  objc_opt_class();
  result = (optional<WebCore::SimpleRange> *)objc_opt_isKindOfClass();
  if ((result & 1) == 0
    || (objc_opt_class(),
        result = (optional<WebCore::SimpleRange> *)objc_opt_isKindOfClass(),
        (result & 1) == 0)
    || (v10 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject"),
        (result = (optional<WebCore::SimpleRange> *)(*(uint64_t (**)(void *))(*(_QWORD *)v10 + 1488))(v10)) == 0))
  {
LABEL_8:
    retstr->var0.var0 = 0;
    retstr->var1 = 0;
    return result;
  }
  if (!v8)
  {
    memset(&v14, 0, sizeof(v14));
    if (v9)
      goto LABEL_7;
LABEL_11:
    memset(&v13, 0, sizeof(v13));
    goto LABEL_12;
  }
  objc_msgSend(v8, "characterOffset");
  if (!v9)
    goto LABEL_11;
LABEL_7:
  objc_msgSend(v9, "characterOffset");
LABEL_12:
  WebCore::AXObjectCache::rangeForUnorderedCharacterOffsets(&v14, &v13, (uint64_t)retstr);
  var0 = v13.var0.var0;
  v13.var0.var0 = 0;
  if (var0)
  {
    if (*((_DWORD *)var0 + 6) == 2)
    {
      if ((*((_WORD *)var0 + 15) & 0x400) == 0)
        WebCore::Node::removedLastRef((WebCore::Node *)var0, v11);
    }
    else
    {
      *((_DWORD *)var0 + 6) -= 2;
    }
  }
  result = (optional<WebCore::SimpleRange> *)v14.var0.var0;
  v14.var0.var0 = 0;
  if (result)
  {
    if (result->var0.var1.var1.var1 == 2)
    {
      if ((*((_WORD *)&result->var0.var1.var1.var1 + 3) & 0x400) == 0)
        return (optional<WebCore::SimpleRange> *)WebCore::Node::removedLastRef((WebCore::Node *)result, v11);
    }
    else
    {
      result->var0.var1.var1.var1 -= 2;
    }
  }
  return result;
}

- (int64_t)lengthForTextMarkers:(id)a3
{
  WTF::StringImpl *v5;
  unsigned int v6;
  int v7;
  uint64_t v8;
  WebCore::Node *v9;
  void *v11;
  WebCore::Node *v12;
  WebCore::Node *v13;
  WebCore::Node *v14;
  WebCore::Node *v15;
  char v16;
  int32x2_t v17[12];
  uint64_t v18;
  int v19;

  if (!-[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
    return 0;
  if (self && (-[WebAccessibilityObjectWrapper rangeForTextMarkers:](self, "rangeForTextMarkers:", a3), v16))
  {
    WebCore::TextIterator::TextIterator((uint64_t)v17, &v14, 0);
    if (v18)
    {
      v6 = 0;
      do
      {
        v7 = v19;
        if (!v19)
        {
          v8 = WebCore::TextIterator::node(v17);
          v7 = WebCore::AccessibilityObject::replacedNodeNeedsCharacter(v8, v9);
        }
        v6 += v7;
        WebCore::TextIterator::advance((WebCore::TextIterator *)v17, v5);
      }
      while (v18);
    }
    else
    {
      v6 = 0;
    }
    WebCore::TextIterator::~TextIterator((WebCore::TextIterator *)v17, v5);
    if (v16)
    {
      v12 = v15;
      v15 = 0;
      if (v12)
      {
        if (*((_DWORD *)v12 + 6) == 2)
        {
          if ((*((_WORD *)v12 + 15) & 0x400) == 0)
            WebCore::Node::removedLastRef(v12, v11);
        }
        else
        {
          *((_DWORD *)v12 + 6) -= 2;
        }
      }
      v13 = v14;
      v14 = 0;
      if (v13)
      {
        if (*((_DWORD *)v13 + 6) == 2)
        {
          if ((*((_WORD *)v13 + 15) & 0x400) == 0)
            WebCore::Node::removedLastRef(v13, v11);
        }
        else
        {
          *((_DWORD *)v13 + 6) -= 2;
        }
      }
    }
  }
  else
  {
    return 0;
  }
  return v6;
}

- (id)startOrEndTextMarkerForTextMarkers:(id)a3 isStart:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  void *v8;
  id v9;
  WebCore::Node *v10;
  WebCore::Node *v11;
  WebCore::Node *v13;
  WebCore::Node *v14;
  char v15;

  v4 = a4;
  if (!-[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
    return 0;
  if (!self)
    return 0;
  -[WebAccessibilityObjectWrapper rangeForTextMarkers:](self, "rangeForTextMarkers:", a3);
  if (!v15)
    return 0;
  v7 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
  v9 = +[WebAccessibilityTextMarker startOrEndTextMarkerForRange:isStart:cache:](WebAccessibilityTextMarker, "startOrEndTextMarkerForRange:isStart:cache:", &v13, v4, (*(uint64_t (**)(void *))(*(_QWORD *)v7 + 1488))(v7));
  if (v15)
  {
    v10 = v14;
    v14 = 0;
    if (v10)
    {
      if (*((_DWORD *)v10 + 6) == 2)
      {
        if ((*((_WORD *)v10 + 15) & 0x400) == 0)
          WebCore::Node::removedLastRef(v10, v8);
      }
      else
      {
        *((_DWORD *)v10 + 6) -= 2;
      }
    }
    v11 = v13;
    v13 = 0;
    if (v11)
    {
      if (*((_DWORD *)v11 + 6) == 2)
      {
        if ((*((_WORD *)v11 + 15) & 0x400) == 0)
          WebCore::Node::removedLastRef(v11, v8);
      }
      else
      {
        *((_DWORD *)v11 + 6) -= 2;
      }
    }
  }
  return v9;
}

- (id)textMarkerRangeForMarkers:(id)a3
{
  id v5;
  void *v6;
  WebCore::Node *v7;
  WebCore::Node *v8;
  WebCore::Node *v10[2];
  WebCore::Node *v11[2];
  uint64_t v12;

  if (!-[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
    return 0;
  if (self)
  {
    -[WebAccessibilityObjectWrapper rangeForTextMarkers:](self, "rangeForTextMarkers:", a3);
  }
  else
  {
    v12 = 0;
    *(_OWORD *)v10 = 0u;
    *(_OWORD *)v11 = 0u;
  }
  v5 = -[WebAccessibilityObjectWrapper textMarkersForRange:](self, "textMarkersForRange:", v10);
  if ((_BYTE)v12)
  {
    v7 = v11[0];
    v11[0] = 0;
    if (v7)
    {
      if (*((_DWORD *)v7 + 6) == 2)
      {
        if ((*((_WORD *)v7 + 15) & 0x400) == 0)
          WebCore::Node::removedLastRef(v7, v6);
      }
      else
      {
        *((_DWORD *)v7 + 6) -= 2;
      }
    }
    v8 = v10[0];
    v10[0] = 0;
    if (v8)
    {
      if (*((_DWORD *)v8 + 6) == 2)
      {
        if ((*((_WORD *)v8 + 15) & 0x400) == 0)
          WebCore::Node::removedLastRef(v8, v6);
      }
      else
      {
        *((_DWORD *)v8 + 6) -= 2;
      }
    }
  }
  return v5;
}

- (id)textMarkersForRange:(const void *)a3
{
  void *v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  if (!*((_BYTE *)a3 + 32))
    return 0;
  v5 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
  v6 = +[WebAccessibilityTextMarker startOrEndTextMarkerForRange:isStart:cache:](WebAccessibilityTextMarker, "startOrEndTextMarkerForRange:isStart:cache:", a3, 1, (*(uint64_t (**)(void *))(*(_QWORD *)v5 + 1488))(v5));
  v7 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
  v8 = +[WebAccessibilityTextMarker startOrEndTextMarkerForRange:isStart:cache:](WebAccessibilityTextMarker, "startOrEndTextMarkerForRange:isStart:cache:", a3, 0, (*(uint64_t (**)(void *))(*(_QWORD *)v7 + 1488))(v7));
  if (!v6 || v8 == 0)
    return 0;
  v11[0] = v6;
  v11[1] = v8;
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
}

- (id)accessibilityExpandedTextValue
{
  WTF::StringImpl *v3;
  void *v4;
  WTF::StringImpl *v5;
  WTF::StringImpl *v7;

  if (!-[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
    return 0;
  (*(void (**)(WTF::StringImpl **__return_ptr))(*(_QWORD *)-[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject")+ 1432))(&v7);
  if (!v7)
    return &stru_1E3487BC0;
  v4 = (void *)WTF::StringImpl::operator NSString *();
  v5 = v7;
  v7 = 0;
  if (v5)
  {
    if (*(_DWORD *)v5 == 2)
      WTF::StringImpl::destroy(v5, v3);
    else
      *(_DWORD *)v5 -= 2;
  }
  return v4;
}

- (id)accessibilityIdentifier
{
  WTF::StringImpl *v3;
  void *v4;
  WTF::StringImpl *v5;
  WTF::StringImpl *v7;

  if (!-[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
    return 0;
  (*(void (**)(WTF::StringImpl **__return_ptr))(*(_QWORD *)-[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject")+ 1072))(&v7);
  if (!v7)
    return &stru_1E3487BC0;
  v4 = (void *)WTF::StringImpl::operator NSString *();
  v5 = v7;
  v7 = 0;
  if (v5)
  {
    if (*(_DWORD *)v5 == 2)
      WTF::StringImpl::destroy(v5, v3);
    else
      *(_DWORD *)v5 -= 2;
  }
  return v4;
}

- (BOOL)accessibilityIsInsertion
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  BOOL v7;

  if (!-[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
    return 0;
  v3 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
  v4 = (*(uint64_t (**)(void *))(*(_QWORD *)v3 + 1232))(v3);
  if (!v4)
    return 0;
  v5 = v4;
  do
  {
    v6 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v5 + 1456))(v5);
    v7 = v6 == 53;
    if (v6 == 53)
      break;
    v5 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v5 + 1232))(v5);
  }
  while (v5);
  return v7;
}

- (BOOL)accessibilityIsDeletion
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  BOOL v7;

  if (!-[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
    return 0;
  v3 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
  v4 = (*(uint64_t (**)(void *))(*(_QWORD *)v3 + 1232))(v3);
  if (!v4)
    return 0;
  v5 = v4;
  do
  {
    v6 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v5 + 1456))(v5);
    v7 = v6 == 22;
    if (v6 == 22)
      break;
    v5 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v5 + 1232))(v5);
  }
  while (v5);
  return v7;
}

- (BOOL)accessibilityIsFirstItemInSuggestion
{
  _DWORD *v3;
  void *v4;
  _DWORD *v5;

  LODWORD(v3) = -[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall");
  if ((_DWORD)v3)
  {
    v4 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
    v3 = (_DWORD *)(*(uint64_t (**)(void *))(*(_QWORD *)v4 + 1240))(v4);
    if (v3)
    {
      while (1)
      {
        v5 = v3;
        if (!*(_DWORD *)((*(uint64_t (**)(_DWORD *, uint64_t))(*(_QWORD *)v3 + 1896))(v3, 1) + 12))
        {
LABEL_9:
          LOBYTE(v3) = 0;
          return (char)v3;
        }
        v3 = (_DWORD *)(*(uint64_t (**)(_DWORD *, uint64_t))(*(_QWORD *)v5 + 1896))(v5, 1);
        if (!v3[3])
          break;
        if (**(void ***)v3 != v4)
          goto LABEL_9;
        if ((*(unsigned int (**)(_DWORD *))(*(_QWORD *)v5 + 1456))(v5) == 110)
        {
          LOBYTE(v3) = 1;
          return (char)v3;
        }
        v3 = (_DWORD *)(*(uint64_t (**)(_DWORD *))(*(_QWORD *)v5 + 1240))(v5);
        v4 = v5;
        if (!v3)
          return (char)v3;
      }
      __break(0xC471u);
    }
  }
  return (char)v3;
}

- (BOOL)accessibilityIsLastItemInSuggestion
{
  unsigned int *v3;
  unsigned int *v4;
  unsigned int *v5;
  uint64_t v6;
  unint64_t v7;

  LODWORD(v3) = -[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall");
  if ((_DWORD)v3)
  {
    v4 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
    v3 = (unsigned int *)(*(uint64_t (**)(unsigned int *))(*(_QWORD *)v4 + 1240))(v4);
    if (v3)
    {
      while (1)
      {
        v5 = v3;
        if (!*(_DWORD *)((*(uint64_t (**)(unsigned int *, uint64_t))(*(_QWORD *)v3 + 1896))(v3, 1) + 12))
        {
LABEL_9:
          LOBYTE(v3) = 0;
          return (char)v3;
        }
        v6 = (*(uint64_t (**)(unsigned int *, uint64_t))(*(_QWORD *)v5 + 1896))(v5, 1);
        v3 = (unsigned int *)(*(uint64_t (**)(unsigned int *, uint64_t))(*(_QWORD *)v5 + 1896))(v5, 1);
        v7 = v3[3] - 1;
        if (v7 >= *(unsigned int *)(v6 + 12))
          break;
        if (*(unsigned int **)(*(_QWORD *)v6 + 8 * v7) != v4)
          goto LABEL_9;
        if ((*(unsigned int (**)(unsigned int *))(*(_QWORD *)v5 + 1456))(v5) == 110)
        {
          LOBYTE(v3) = 1;
          return (char)v3;
        }
        v3 = (unsigned int *)(*(uint64_t (**)(unsigned int *))(*(_QWORD *)v5 + 1240))(v5);
        v4 = v5;
        if (!v3)
          return (char)v3;
      }
      __break(0xC471u);
    }
  }
  return (char)v3;
}

- (BOOL)accessibilityIsMarkAnnotation
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  _QWORD *v6;
  uint64_t v7;
  int v8;
  unsigned int v9;
  uint64_t v10;
  int v11;
  int v12;
  BOOL v13;
  char v15;
  uint64_t v16;
  _BYTE v17[24];

  v3 = -[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall");
  if (v3)
  {
    v4 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
    v15 = 71;
    v16 = 0;
    WTF::HashTable<WebCore::AccessibilityRole,WebCore::AccessibilityRole,WTF::IdentityExtractor,WTF::IntHash<WebCore::AccessibilityRole>,WTF::StrongEnumHashTraits<WebCore::AccessibilityRole>,WTF::StrongEnumHashTraits<WebCore::AccessibilityRole>>::add(v17, &v16, &v15);
    v6 = (_QWORD *)(*(uint64_t (**)(void *))(*(_QWORD *)v4 + 1232))(v4);
    v7 = v16;
    if (v6)
    {
      if (v16)
      {
        while (1)
        {
          v8 = (*(uint64_t (**)(_QWORD *))(*v6 + 1456))(v6);
          v9 = *(_DWORD *)(v7 - 8);
          LODWORD(v10) = 9 * ((~(v8 << 15) + v8) ^ ((~(v8 << 15) + v8) >> 10));
          LODWORD(v10) = v9 & (((v10 ^ (v10 >> 6))
                              + ~((v10 ^ (v10 >> 6)) << 11)) ^ (((v10 ^ (v10 >> 6))
                                                                                           + ~((v10 ^ (v10 >> 6)) << 11)) >> 16));
          v11 = *(unsigned __int8 *)(v7 + v10);
          if (v11 == v8)
            break;
          v12 = 1;
          while ((_BYTE)v11 != 0xFF)
          {
            v10 = ((_DWORD)v10 + v12) & v9;
            v11 = *(unsigned __int8 *)(v7 + v10);
            ++v12;
            if (v11 == v8)
              goto LABEL_14;
          }
          v6 = (_QWORD *)(*(uint64_t (**)(_QWORD *))(*v6 + 1232))(v6);
          v13 = 0;
          if (!v6)
            goto LABEL_15;
        }
LABEL_14:
        v13 = v6[3] != 0;
LABEL_15:
        WTF::fastFree((WTF *)(v7 - 16), v5);
        LOBYTE(v3) = v13;
        return v3;
      }
      do
      {
        (*(void (**)(_QWORD *))(*v6 + 1456))(v6);
        v6 = (_QWORD *)(*(uint64_t (**)(_QWORD *))(*v6 + 1232))(v6);
      }
      while (v6);
    }
    v13 = 0;
    LOBYTE(v3) = 0;
    if (!v7)
      return v3;
    goto LABEL_15;
  }
  return v3;
}

- (BOOL)_accessibilityIsSwitch
{
  _BOOL4 v3;
  void *v4;

  v3 = -[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall");
  if (v3)
  {
    v4 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
    LOBYTE(v3) = (*(unsigned int (**)(void *))(*(_QWORD *)v4 + 1456))(v4) == 113;
  }
  return v3;
}

- (id)accessibilitySpeechHint
{
  if (-[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
    return -[WebAccessibilityObjectWrapperBase baseAccessibilitySpeechHint](self, "baseAccessibilitySpeechHint");
  else
    return 0;
}

- (BOOL)accessibilityARIAIsBusy
{
  int v3;
  void *v4;

  v3 = -[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall");
  if (v3)
  {
    v4 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
    LOBYTE(v3) = (*(uint64_t (**)(void *))(*(_QWORD *)v4 + 2256))(v4);
  }
  return v3;
}

- (id)accessibilityARIALiveRegionStatus
{
  WTF::StringImpl *v3;
  void *v4;
  WTF::StringImpl *v5;
  WTF::StringImpl *v7;

  if (!-[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
    return 0;
  (*(void (**)(WTF::StringImpl **__return_ptr))(*(_QWORD *)-[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject")+ 2232))(&v7);
  if (!v7)
    return &stru_1E3487BC0;
  v4 = (void *)WTF::StringImpl::operator NSString *();
  v5 = v7;
  v7 = 0;
  if (v5)
  {
    if (*(_DWORD *)v5 == 2)
      WTF::StringImpl::destroy(v5, v3);
    else
      *(_DWORD *)v5 -= 2;
  }
  return v4;
}

- (id)accessibilityARIARelevantStatus
{
  WTF::StringImpl *v3;
  void *v4;
  WTF::StringImpl *v5;
  WTF::StringImpl *v7;

  if (!-[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
    return 0;
  (*(void (**)(WTF::StringImpl **__return_ptr))(*(_QWORD *)-[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject")+ 2240))(&v7);
  if (!v7)
    return &stru_1E3487BC0;
  v4 = (void *)WTF::StringImpl::operator NSString *();
  v5 = v7;
  v7 = 0;
  if (v5)
  {
    if (*(_DWORD *)v5 == 2)
      WTF::StringImpl::destroy(v5, v3);
    else
      *(_DWORD *)v5 -= 2;
  }
  return v4;
}

- (BOOL)accessibilityARIALiveRegionIsAtomic
{
  int v3;
  void *v4;

  v3 = -[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall");
  if (v3)
  {
    v4 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
    LOBYTE(v3) = (*(uint64_t (**)(void *))(*(_QWORD *)v4 + 2248))(v4);
  }
  return v3;
}

- (BOOL)accessibilitySupportsARIAPressed
{
  _BOOL4 v3;

  v3 = -[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall");
  if (v3)
    LOBYTE(v3) = WebCore::AccessibilityObject::supportsPressed((WebCore::AccessibilityObject *)-[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject"));
  return v3;
}

- (BOOL)accessibilityIsPressed
{
  int v3;
  void *v4;

  v3 = -[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall");
  if (v3)
  {
    v4 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
    LOBYTE(v3) = (*(uint64_t (**)(void *))(*(_QWORD *)v4 + 600))(v4);
  }
  return v3;
}

- (BOOL)accessibilitySupportsARIAExpanded
{
  int v3;
  void *v4;

  v3 = -[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall");
  if (v3)
  {
    v4 = -[WebAccessibilityObjectWrapper detailParentForSummaryObject:](self, "detailParentForSummaryObject:", -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject"));
    if (!v4)
    {
      v4 = -[WebAccessibilityObjectWrapper treeItemParentForObject:](self, "treeItemParentForObject:", -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject"));
      if (!v4)
        v4 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
    }
    LOBYTE(v3) = (*(uint64_t (**)(void *))(*(_QWORD *)v4 + 1040))(v4);
  }
  return v3;
}

- (BOOL)accessibilityIsExpanded
{
  int v3;
  void *v4;

  v3 = -[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall");
  if (v3)
  {
    v4 = -[WebAccessibilityObjectWrapper detailParentForSummaryObject:](self, "detailParentForSummaryObject:", -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject"));
    if (!v4)
    {
      v4 = -[WebAccessibilityObjectWrapper treeItemParentForObject:](self, "treeItemParentForObject:", -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject"));
      if (!v4)
        v4 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
    }
    LOBYTE(v3) = (*(uint64_t (**)(void *))(*(_QWORD *)v4 + 632))(v4);
  }
  return v3;
}

- (BOOL)accessibilityIsShowingValidationMessage
{
  char isVisible;
  void *v4;
  WebCore::Node *v5;
  WebCore::Node *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  WebCore::ValidationMessage *v10;

  if (!-[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
    goto LABEL_9;
  v4 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
  v5 = (WebCore::Node *)(*(uint64_t (**)(void *))(*(_QWORD *)v4 + 832))(v4);
  if (!v5)
    goto LABEL_9;
  v6 = v5;
  *((_DWORD *)v5 + 6) += 2;
  v7 = (*(uint64_t (**)(WebCore::Node *))(*(_QWORD *)v5 + 464))(v5);
  v9 = v7;
  if (v7)
  {
    v10 = *(WebCore::ValidationMessage **)(v7 + 40);
    if (v10)
      isVisible = WebCore::ValidationMessage::isVisible(v10);
    else
      isVisible = 0;
  }
  if (*((_DWORD *)v6 + 6) == 2)
  {
    if ((*((_WORD *)v6 + 15) & 0x400) == 0)
      WebCore::Node::removedLastRef(v6, v8);
  }
  else
  {
    *((_DWORD *)v6 + 6) -= 2;
  }
  if (!v9)
LABEL_9:
    isVisible = 0;
  return isVisible & 1;
}

- (id)accessibilityInvalidStatus
{
  WTF::StringImpl *v3;
  void *v4;
  WTF::StringImpl *v5;
  WTF::StringImpl *v7;

  if (!-[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
    return 0;
  (*(void (**)(WTF::StringImpl **__return_ptr))(*(_QWORD *)-[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject")+ 1032))(&v7);
  if (!v7)
    return &stru_1E3487BC0;
  v4 = (void *)WTF::StringImpl::operator NSString *();
  v5 = v7;
  v7 = 0;
  if (v5)
  {
    if (*(_DWORD *)v5 == 2)
      WTF::StringImpl::destroy(v5, v3);
    else
      *(_DWORD *)v5 -= 2;
  }
  return v4;
}

- (id)accessibilityCurrentState
{
  void *v3;
  void *v4;
  WTF::StringImpl *v5;
  WTF::StringImpl *v7;

  if (!-[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
    return 0;
  v3 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
  (*(void (**)(void *))(*(_QWORD *)v3 + 1096))(v3);
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  if (!v7)
    return &stru_1E3487BC0;
  v4 = (void *)WTF::StringImpl::operator NSString *();
  if (*(_DWORD *)v7 == 2)
    WTF::StringImpl::destroy(v7, v5);
  else
    *(_DWORD *)v7 -= 2;
  return v4;
}

- (id)accessibilitySortDirection
{
  void *v3;
  int v4;
  const __CFString *v5;

  if (!-[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
    return 0;
  v3 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
  v4 = (*(uint64_t (**)(void *))(*(_QWORD *)v3 + 1056))(v3);
  v5 = CFSTR("AXUnknownSortDirection");
  if (v4 == 2)
    v5 = CFSTR("AXDescendingSortDirection");
  if (v4 == 1)
    return CFSTR("AXAscendingSortDirection");
  else
    return (id)v5;
}

- (id)accessibilityMathRootIndexObject
{
  void *v3;
  id result;
  void *v5;

  if (!-[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
    return 0;
  v3 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
  result = (id)(*(uint64_t (**)(void *))(*(_QWORD *)v3 + 2408))(v3);
  if (result)
  {
    v5 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
    return *(id *)((*(uint64_t (**)(void *))(*(_QWORD *)v5 + 2408))(v5) + 24);
  }
  return result;
}

- (id)accessibilityMathRadicand
{
  void *v3;
  CFTypeRef NSArray;
  _QWORD v6[2];
  char v7;

  if (!-[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
    return 0;
  (*(void (**)(_QWORD *__return_ptr))(*(_QWORD *)-[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject")+ 2400))(v6);
  if (!v7)
    return 0;
  NSArray = makeNSArray((uint64_t)v6);
  if (v7)
    WTF::Vector<WTF::RefPtr<WebCore::AXCoreObject,WTF::RawPtrTraits<WebCore::AXCoreObject>,WTF::DefaultRefDerefTraits<WebCore::AXCoreObject>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v6, v3);
  return (id)NSArray;
}

- (id)accessibilityMathNumeratorObject
{
  void *v3;
  id result;
  void *v5;

  if (!-[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
    return 0;
  v3 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
  result = (id)(*(uint64_t (**)(void *))(*(_QWORD *)v3 + 2432))(v3);
  if (result)
  {
    v5 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
    return *(id *)((*(uint64_t (**)(void *))(*(_QWORD *)v5 + 2432))(v5) + 24);
  }
  return result;
}

- (id)accessibilityMathDenominatorObject
{
  void *v3;
  id result;
  void *v5;

  if (!-[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
    return 0;
  v3 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
  result = (id)(*(uint64_t (**)(void *))(*(_QWORD *)v3 + 2440))(v3);
  if (result)
  {
    v5 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
    return *(id *)((*(uint64_t (**)(void *))(*(_QWORD *)v5 + 2440))(v5) + 24);
  }
  return result;
}

- (id)accessibilityMathBaseObject
{
  void *v3;
  id result;
  void *v5;

  if (!-[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
    return 0;
  v3 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
  result = (id)(*(uint64_t (**)(void *))(*(_QWORD *)v3 + 2448))(v3);
  if (result)
  {
    v5 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
    return *(id *)((*(uint64_t (**)(void *))(*(_QWORD *)v5 + 2448))(v5) + 24);
  }
  return result;
}

- (id)accessibilityMathSubscriptObject
{
  void *v3;
  id result;
  void *v5;

  if (!-[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
    return 0;
  v3 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
  result = (id)(*(uint64_t (**)(void *))(*(_QWORD *)v3 + 2456))(v3);
  if (result)
  {
    v5 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
    return *(id *)((*(uint64_t (**)(void *))(*(_QWORD *)v5 + 2456))(v5) + 24);
  }
  return result;
}

- (id)accessibilityMathSuperscriptObject
{
  void *v3;
  id result;
  void *v5;

  if (!-[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
    return 0;
  v3 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
  result = (id)(*(uint64_t (**)(void *))(*(_QWORD *)v3 + 2464))(v3);
  if (result)
  {
    v5 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
    return *(id *)((*(uint64_t (**)(void *))(*(_QWORD *)v5 + 2464))(v5) + 24);
  }
  return result;
}

- (id)accessibilityMathUnderObject
{
  void *v3;
  id result;
  void *v5;

  if (!-[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
    return 0;
  v3 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
  result = (id)(*(uint64_t (**)(void *))(*(_QWORD *)v3 + 2416))(v3);
  if (result)
  {
    v5 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
    return *(id *)((*(uint64_t (**)(void *))(*(_QWORD *)v5 + 2416))(v5) + 24);
  }
  return result;
}

- (id)accessibilityMathOverObject
{
  void *v3;
  id result;
  void *v5;

  if (!-[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
    return 0;
  v3 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
  result = (id)(*(uint64_t (**)(void *))(*(_QWORD *)v3 + 2424))(v3);
  if (result)
  {
    v5 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
    return *(id *)((*(uint64_t (**)(void *))(*(_QWORD *)v5 + 2424))(v5) + 24);
  }
  return result;
}

- (id)accessibilityPlatformMathSubscriptKey
{
  return CFSTR("AXMSubscriptObject");
}

- (id)accessibilityPlatformMathSuperscriptKey
{
  return CFSTR("AXMSuperscriptObject");
}

- (id)accessibilityMathPostscripts
{
  if (-[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
    return -[WebAccessibilityObjectWrapperBase accessibilityMathPostscriptPairs](self, "accessibilityMathPostscriptPairs");
  else
    return 0;
}

- (id)accessibilityMathPrescripts
{
  if (-[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
    return -[WebAccessibilityObjectWrapperBase accessibilityMathPrescriptPairs](self, "accessibilityMathPrescriptPairs");
  else
    return 0;
}

- (id)accessibilityMathFencedOpenString
{
  WTF::StringImpl *v3;
  void *v4;
  WTF::StringImpl *v5;
  WTF::StringImpl *v7;

  if (!-[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
    return 0;
  (*(void (**)(WTF::StringImpl **__return_ptr))(*(_QWORD *)-[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject")+ 2472))(&v7);
  if (!v7)
    return &stru_1E3487BC0;
  v4 = (void *)WTF::StringImpl::operator NSString *();
  v5 = v7;
  v7 = 0;
  if (v5)
  {
    if (*(_DWORD *)v5 == 2)
      WTF::StringImpl::destroy(v5, v3);
    else
      *(_DWORD *)v5 -= 2;
  }
  return v4;
}

- (id)accessibilityMathFencedCloseString
{
  WTF::StringImpl *v3;
  void *v4;
  WTF::StringImpl *v5;
  WTF::StringImpl *v7;

  if (!-[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
    return 0;
  (*(void (**)(WTF::StringImpl **__return_ptr))(*(_QWORD *)-[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject")+ 2480))(&v7);
  if (!v7)
    return &stru_1E3487BC0;
  v4 = (void *)WTF::StringImpl::operator NSString *();
  v5 = v7;
  v7 = 0;
  if (v5)
  {
    if (*(_DWORD *)v5 == 2)
      WTF::StringImpl::destroy(v5, v3);
    else
      *(_DWORD *)v5 -= 2;
  }
  return v4;
}

- (BOOL)accessibilityIsMathTopObject
{
  _BOOL4 v3;
  void *v4;

  v3 = -[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall");
  if (v3)
  {
    v4 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
    LOBYTE(v3) = (*(unsigned int (**)(void *))(*(_QWORD *)v4 + 1456))(v4) == 30;
  }
  return v3;
}

- (int64_t)accessibilityMathLineThickness
{
  void *v3;

  if (!-[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
    return 0;
  v3 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
  return (*(int (**)(void *))(*(_QWORD *)v3 + 2488))(v3);
}

- (id)accessibilityMathType
{
  void *v3;
  void *v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  if (!-[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
    return 0;
  v3 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
  if ((*(unsigned int (**)(void *))(*(_QWORD *)v3 + 1456))(v3) != 72)
    return 0;
  v4 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
  if (((*(uint64_t (**)(void *))(*(_QWORD *)v4 + 2304))(v4) & 1) != 0)
    return CFSTR("AXMathFraction");
  v6 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
  if (((*(uint64_t (**)(void *))(*(_QWORD *)v6 + 2312))(v6) & 1) != 0)
    return CFSTR("AXMathFenced");
  v7 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
  if (((*(uint64_t (**)(void *))(*(_QWORD *)v7 + 2320))(v7) & 1) != 0)
    return CFSTR("AXMathSubscriptSuperscript");
  v8 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
  if (((*(uint64_t (**)(void *))(*(_QWORD *)v8 + 2328))(v8) & 1) != 0)
    return CFSTR("AXMathRow");
  v9 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
  if (((*(uint64_t (**)(void *))(*(_QWORD *)v9 + 2336))(v9) & 1) != 0)
    return CFSTR("AXMathUnderOver");
  v10 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
  if (((*(uint64_t (**)(void *))(*(_QWORD *)v10 + 2352))(v10) & 1) != 0)
    return CFSTR("AXMathSquareRoot");
  v11 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
  if (((*(uint64_t (**)(void *))(*(_QWORD *)v11 + 2344))(v11) & 1) != 0)
    return CFSTR("AXMathRoot");
  v12 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
  if (((*(uint64_t (**)(void *))(*(_QWORD *)v12 + 3160))(v12) & 1) != 0)
    return CFSTR("AXMathText");
  v13 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
  if (((*(uint64_t (**)(void *))(*(_QWORD *)v13 + 3168))(v13) & 1) != 0)
    return CFSTR("AXMathNumber");
  v14 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
  if (((*(uint64_t (**)(void *))(*(_QWORD *)v14 + 3200))(v14) & 1) != 0)
    return CFSTR("AXMathIdentifier");
  v15 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
  if (((*(uint64_t (**)(void *))(*(_QWORD *)v15 + 2360))(v15) & 1) != 0)
    return CFSTR("AXMathTable");
  v16 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
  if (((*(uint64_t (**)(void *))(*(_QWORD *)v16 + 2368))(v16) & 1) != 0)
    return CFSTR("AXMathTableRow");
  v17 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
  if (((*(uint64_t (**)(void *))(*(_QWORD *)v17 + 2376))(v17) & 1) != 0)
    return CFSTR("AXMathTableCell");
  v18 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
  if (((*(uint64_t (**)(void *))(*(_QWORD *)v18 + 3184))(v18) & 1) != 0)
    return CFSTR("AXMathFenceOperator");
  v19 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
  if (((*(uint64_t (**)(void *))(*(_QWORD *)v19 + 3192))(v19) & 1) != 0)
    return CFSTR("AXMathSeparatorOperator");
  v20 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
  if (((*(uint64_t (**)(void *))(*(_QWORD *)v20 + 3176))(v20) & 1) != 0)
    return CFSTR("AXMathOperator");
  v21 = -[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject");
  if (((*(uint64_t (**)(void *))(*(_QWORD *)v21 + 2384))(v21) & 1) != 0)
    return CFSTR("AXMathMultiscript");
  else
    return 0;
}

- (CGPoint)accessibilityClickPoint
{
  _DWORD *v2;
  double v3;
  double v4;
  CGPoint result;

  v2 = WebCore::AccessibilityObject::clickPoint((WebCore::AccessibilityObject *)-[WebAccessibilityObjectWrapper axBackingObject](self, "axBackingObject"));
  v3 = (double)(int)v2;
  v4 = (double)SHIDWORD(v2);
  result.y = v4;
  result.x = v3;
  return result;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %@"), objc_opt_class(), -[WebAccessibilityObjectWrapper accessibilityLabel](self, "accessibilityLabel"));
}

- (uint64_t)accessibilityLinkedElement
{
  return objc_msgSend(*(id *)(a2 + 24), "isAccessibilityElement");
}

@end
