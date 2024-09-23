@implementation WebAccessibilityObjectWrapperBase

- (WebAccessibilityObjectWrapperBase)initWithAccessibilityObject:(void *)a3
{
  WebAccessibilityObjectWrapperBase *v4;
  WebAccessibilityObjectWrapperBase *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WebAccessibilityObjectWrapperBase;
  v4 = -[WebAccessibilityObjectWrapperBase init](&v7, sel_init);
  v5 = v4;
  if (v4)
    -[WebAccessibilityObjectWrapperBase attachAXObject:](v4, "attachAXObject:", a3);
  return v5;
}

- (void)attachAXObject:(void *)a3
{
  uint64_t v4;
  unsigned int *v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int *m_ptr;
  unsigned int v11;
  unsigned int v12;

  v4 = *((_QWORD *)a3 + 4);
  if (v4)
    goto LABEL_16;
  v4 = WTF::fastCompactMalloc((WTF *)0x10);
  *(_DWORD *)v4 = 1;
  *(_QWORD *)(v4 + 8) = a3;
  v6 = (unsigned int *)*((_QWORD *)a3 + 4);
  *((_QWORD *)a3 + 4) = v4;
  if (!v6)
    goto LABEL_16;
  do
  {
    v7 = __ldaxr(v6);
    v8 = v7 - 1;
  }
  while (__stlxr(v8, v6));
  if (!v8)
  {
    atomic_store(1u, v6);
    WTF::fastFree((WTF *)v6, (void *)a2);
  }
  v4 = *((_QWORD *)a3 + 4);
  if (v4)
  {
LABEL_16:
    do
      v9 = __ldaxr((unsigned int *)v4);
    while (__stlxr(v9 + 1, (unsigned int *)v4));
  }
  m_ptr = (unsigned int *)self->m_axObject.m_impl.m_ptr;
  self->m_axObject.m_impl.m_ptr = (DefaultWeakPtrImpl *)v4;
  if (m_ptr)
  {
    do
    {
      v11 = __ldaxr(m_ptr);
      v12 = v11 - 1;
    }
    while (__stlxr(v12, m_ptr));
    if (!v12)
    {
      atomic_store(1u, m_ptr);
      WTF::fastFree((WTF *)m_ptr, (void *)a2);
    }
  }
  if (self->_identifier.m_identifier - 1 >= 0xFFFFFFFFFFFFFFFELL)
    self->_identifier.m_identifier = *(_QWORD *)(*((_QWORD *)self->m_axObject.m_impl.m_ptr + 1) + 16);
}

- (void)detach
{
  unsigned int *m_ptr;
  unsigned int v4;
  unsigned int v5;

  m_ptr = (unsigned int *)self->m_axObject.m_impl.m_ptr;
  self->m_axObject.m_impl.m_ptr = 0;
  self->_identifier.m_identifier = 0;
  if (m_ptr)
  {
    do
    {
      v4 = __ldaxr(m_ptr);
      v5 = v4 - 1;
    }
    while (__stlxr(v5, m_ptr));
    if (!v5)
    {
      atomic_store(1u, m_ptr);
      WTF::fastFree((WTF *)m_ptr, (void *)a2);
    }
  }
}

- (BOOL)_prepareAccessibilityCall
{
  CFTypeRef v3;
  void *v4;
  void *v5;

  if (self)
    CFRetain(self);
  v3 = (id)CFMakeCollectable(self);
  WebThreadLock();
  v4 = -[WebAccessibilityObjectWrapperBase axBackingObject](self, "axBackingObject");
  if (v4)
  {
    v5 = -[WebAccessibilityObjectWrapperBase axBackingObject](self, "axBackingObject");
    (*(void (**)(void *))(*(_QWORD *)v5 + 2528))(v5);
    LOBYTE(v4) = -[WebAccessibilityObjectWrapperBase axBackingObject](self, "axBackingObject") != 0;
  }
  return (char)v4;
}

- (id)attachmentView
{
  return 0;
}

- (void)axBackingObject
{
  DefaultWeakPtrImpl *m_ptr;

  if (WTF::isMainThread((WTF *)self) && (m_ptr = self->m_axObject.m_impl.m_ptr) != 0)
    return (void *)*((_QWORD *)m_ptr + 1);
  else
    return 0;
}

- (BOOL)isIsolatedObject
{
  return 0;
}

- (id)baseAccessibilitySpeechHint
{
  __CFString *v2;
  WTF::StringImpl *v3;
  void *v4;
  WTF::StringImpl *v5;
  WTF::StringImpl *v7;

  (*(void (**)(WTF::StringImpl **__return_ptr))(*(_QWORD *)-[WebAccessibilityObjectWrapperBase axBackingObject](self, "axBackingObject")+ 2552))(&v7);
  if (v7)
    v2 = (__CFString *)WTF::StringImpl::operator NSString *();
  else
    v2 = &stru_1E3487BC0;
  v4 = (void *)-[__CFString componentsSeparatedByString:](v2, "componentsSeparatedByString:", CFSTR(" "));
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

- (id)accessibilityCustomContent
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  int v6;
  PAL *v7;
  void *v8;
  const __CFString *v9;
  const __CFString *v10;
  WTF::StringImpl *v11;
  void *v12;
  WTF::StringImpl *v13;
  WTF::StringImpl *v14;
  CFTypeRef v15;
  WTF::StringImpl *v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;
  int v23;
  uint64_t v25;
  WTF::StringImpl *v26;
  WTF::StringImpl *v27;

  v2 = -[WebAccessibilityObjectWrapperBase baseUpdateBackingStore](self, "baseUpdateBackingStore");
  if (!v2)
    return 0;
  v3 = v2;
  v4 = v2[1];
  if (__ldaxr((unsigned __int8 *)v4))
  {
    __clrex();
  }
  else if (!__stxr(1u, (unsigned __int8 *)v4))
  {
    goto LABEL_6;
  }
  MEMORY[0x19AEA534C](v4);
LABEL_6:
  ++*(_QWORD *)(v4 + 8);
  v6 = __ldxr((unsigned __int8 *)v4);
  if (v6 == 1)
  {
    if (!__stlxr(0, (unsigned __int8 *)v4))
      goto LABEL_11;
  }
  else
  {
    __clrex();
  }
  WTF::Lock::unlockSlow((WTF::Lock *)v4);
LABEL_11:
  (*(void (**)(WTF::StringImpl **__return_ptr, _QWORD *))(*v3 + 968))(&v27, v3);
  if (v27 && *((_DWORD *)v27 + 1))
  {
    v7 = (PAL *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v8 = (void *)PAL::getAXCustomContentClass[0](v7);
    WebCore::localizedString(CFSTR("description"), (uint64_t)&v26);
    if (v26)
      v9 = (const __CFString *)WTF::StringImpl::operator NSString *();
    else
      v9 = &stru_1E3487BC0;
    if (v27)
      v10 = (const __CFString *)WTF::StringImpl::operator NSString *();
    else
      v10 = &stru_1E3487BC0;
    v12 = (void *)objc_msgSend(v8, "customContentWithLabel:value:", v9, v10);
    v13 = v26;
    v26 = 0;
    if (v13)
    {
      if (*(_DWORD *)v13 == 2)
        WTF::StringImpl::destroy(v13, v11);
      else
        *(_DWORD *)v13 -= 2;
    }
    objc_msgSend(v12, "setImportance:", 1, v26);
    -[PAL addObject:](v7, "addObject:", v12);
  }
  else
  {
    v7 = 0;
  }
  v15 = (id)CFMakeCollectable(v7);
  v16 = v27;
  v27 = 0;
  if (v16)
  {
    if (*(_DWORD *)v16 == 2)
      WTF::StringImpl::destroy(v16, v14);
    else
      *(_DWORD *)v16 -= 2;
  }
  v17 = v3[1];
  if (__ldaxr((unsigned __int8 *)v17))
  {
    __clrex();
  }
  else if (!__stxr(1u, (unsigned __int8 *)v17))
  {
    goto LABEL_29;
  }
  MEMORY[0x19AEA534C](v17);
LABEL_29:
  v19 = *(_QWORD *)(v17 + 8);
  v20 = v19 - 1;
  *(_QWORD *)(v17 + 8) = v19 - 1;
  if (v19 == 1)
  {
    v25 = *(_QWORD *)(v17 + 16);
    v21 = *(_QWORD *)(v17 + 24);
    *(_QWORD *)(v17 + 24) = 0;
    v22 = v25 != 0;
  }
  else
  {
    v21 = 0;
    v22 = 1;
  }
  v23 = __ldxr((unsigned __int8 *)v17);
  if (v23 == 1)
  {
    if (!__stlxr(0, (unsigned __int8 *)v17))
    {
      if (v20)
        return (id)v15;
      goto LABEL_37;
    }
  }
  else
  {
    __clrex();
  }
  WTF::Lock::unlockSlow((WTF::Lock *)v17);
  if (v20)
    return (id)v15;
LABEL_37:
  if (v21)
    (*(void (**)(uint64_t))(*(_QWORD *)v21 + 8))(v21);
  if (!v22)
    WTF::fastFree((WTF *)v17, v14);
  return (id)v15;
}

- (id)baseAccessibilityHelpText
{
  WTF::StringImpl *v2;
  WTF::StringImpl *v3;
  void *v4;
  WTF::StringImpl *v6;

  WebCore::AXCoreObject::helpTextAttributeValue((WebCore::AXCoreObject *)-[WebAccessibilityObjectWrapperBase axBackingObject](self, "axBackingObject"), &v6);
  v2 = v6;
  if (!v6)
    return &stru_1E3487BC0;
  v4 = (void *)WTF::StringImpl::operator NSString *();
  if (*(_DWORD *)v2 == 2)
    WTF::StringImpl::destroy(v2, v3);
  else
    *(_DWORD *)v2 -= 2;
  return v4;
}

- (CGPath)convertPathToScreenSpace:(const void *)a3
{
  CGMutablePathRef Mutable;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v9;
  _QWORD v10[2];

  Mutable = CGPathCreateMutable();
  v10[0] = self;
  v10[1] = Mutable;
  v6 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v6 = off_1E34858D0;
  v6[1] = v10;
  v9 = v6;
  WebCore::Path::applyElements((WebCore::Path *)a3, &v9);
  v7 = v9;
  v9 = 0;
  if (v7)
    (*(void (**)(_QWORD *))(*v7 + 8))(v7);
  if (Mutable)
    CFAutorelease(Mutable);
  return Mutable;
}

- (_NSRange)accessibilityVisibleCharacterRange
{
  _QWORD *v2;
  _QWORD *v3;
  NSUInteger v4;
  NSUInteger v5;
  CFTypeRef v6;
  NSUInteger v7;
  NSUInteger v8;
  CFTypeRef cf;
  _QWORD *v10;
  _QWORD v11[2];
  _NSRange result;

  cf = self;
  if (self)
    CFRetain(self);
  v2 = (_QWORD *)WTF::fastMalloc((WTF *)0x18);
  *v2 = off_1E34858F8;
  v2[1] = v11;
  v2[2] = &cf;
  v10 = v2;
  WTF::callOnMainThreadAndWait();
  v3 = v10;
  v10 = 0;
  if (v3)
    (*(void (**)(_QWORD *))(*v3 + 8))(v3);
  v4 = v11[0];
  v5 = v11[1];
  v6 = cf;
  cf = 0;
  if (v6)
    CFRelease(v6);
  v7 = v4;
  v8 = v5;
  result.length = v8;
  result.location = v7;
  return result;
}

- (id)_accessibilityWebDocumentView
{
  return 0;
}

- (CGRect)convertRectToSpace:(const FloatRect *)a3 space:(int)a4
{
  uint64_t v4;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  double v10;
  double v11;
  double v12;
  double v13;
  int v14;
  void *v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  uint64_t v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  BOOL v28;
  int v29;
  double v30;
  double v31;
  double v32;
  double v33;
  uint64_t v34;
  CGRect result;

  v4 = *(_QWORD *)&a4;
  v6 = -[WebAccessibilityObjectWrapperBase baseUpdateBackingStore](self, "baseUpdateBackingStore");
  if (!v6 || (v7 = v6, !(*(unsigned int (**)(_QWORD *))(*v6 + 48))(v6)))
  {
    v10 = *MEMORY[0x1E0C9D648];
    v11 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v12 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v13 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    goto LABEL_29;
  }
  v8 = v7[1];
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
  v14 = __ldxr((unsigned __int8 *)v8);
  if (v14 != 1)
  {
    __clrex();
    goto LABEL_12;
  }
  if (__stlxr(0, (unsigned __int8 *)v8))
LABEL_12:
    WTF::Lock::unlockSlow((WTF::Lock *)v8);
  v16 = (*(float (**)(_QWORD *, const FloatRect *, uint64_t))(*v7 + 1544))(v7, a3, v4);
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v23 = v7[1];
  if (__ldaxr((unsigned __int8 *)v23))
  {
    __clrex();
  }
  else if (!__stxr(1u, (unsigned __int8 *)v23))
  {
    goto LABEL_17;
  }
  MEMORY[0x19AEA534C](v23);
LABEL_17:
  v25 = *(_QWORD *)(v23 + 8);
  v26 = v25 - 1;
  *(_QWORD *)(v23 + 8) = v25 - 1;
  if (v25 == 1)
  {
    v34 = *(_QWORD *)(v23 + 16);
    v27 = *(_QWORD *)(v23 + 24);
    *(_QWORD *)(v23 + 24) = 0;
    v28 = v34 != 0;
  }
  else
  {
    v27 = 0;
    v28 = 1;
  }
  v29 = __ldxr((unsigned __int8 *)v23);
  if (v29 != 1)
  {
    __clrex();
    goto LABEL_23;
  }
  if (__stlxr(0, (unsigned __int8 *)v23))
LABEL_23:
    WTF::Lock::unlockSlow((WTF::Lock *)v23);
  v10 = v16;
  v11 = v18;
  v12 = v20;
  v13 = v22;
  if (!v26)
  {
    if (v27)
      (*(void (**)(uint64_t))(*(_QWORD *)v27 + 8))(v27);
    if (!v28)
      WTF::fastFree((WTF *)v23, v15);
  }
LABEL_29:
  v30 = v10;
  v31 = v11;
  v32 = v12;
  v33 = v13;
  result.size.height = v33;
  result.size.width = v32;
  result.origin.y = v31;
  result.origin.x = v30;
  return result;
}

- (void)baseUpdateBackingStore
{
  if (-[WebAccessibilityObjectWrapperBase _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
    return -[WebAccessibilityObjectWrapperBase axBackingObject](self, "axBackingObject");
  else
    return 0;
}

- (id)lineRectsAndText
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  CFTypeRef v7;
  int v8;
  void *v9;
  WebCore::Node *v10;
  void *v11;
  WebCore::Node *v12;
  const WebCore::VisiblePosition *v13;
  unsigned int v14;
  unsigned __int8 v15;
  const WebCore::VisiblePosition *v17;
  unsigned __int8 v18;
  WebCore::Node *v19;
  WebCore::Node *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  WebCore::Node *v24;
  uint64_t v25;
  id v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  uint64_t v32;
  const void *v33;
  _OWORD *v34;
  int v35;
  _OWORD *v36;
  _QWORD *v37;
  CFTypeRef *p_cf;
  int v39;
  WebCore::Node *v40;
  _OWORD *v41;
  CFTypeRef v42;
  CFTypeRef v43;
  WebCore::Node *v44;
  WebCore::Node *v45;
  uint64_t (*v46)();
  _BOOL4 v47;
  uint64_t v48;
  void *v49;
  WebCore::Node *v50;
  WebCore::Node *v51;
  void *v52;
  int v53;
  WebCore::Node *v54;
  WebCore::Node *v55;
  char v56;
  WebCore::Node *v57;
  WebCore::Node *v58;
  void *v59;
  uint64_t v60;
  CFTypeRef v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  WTF *v65;
  WTF *v66;
  WebAccessibilityObjectWrapperBase *v67;
  void *v68;
  float v69;
  float v70;
  uint64_t v71;
  char v72;
  WebCore::Node *v73;
  WTF *v74;
  uint64_t v75;
  const void **v76;
  const void *v77;
  WebCore::Node *v78;
  WebCore::Node *v79;
  uint64_t v80;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  BOOL v85;
  int v86;
  uint64_t v88;
  WebAccessibilityObjectWrapperBase *v89;
  WTF *v90;
  _QWORD *v91;
  unsigned int v92;
  uint64_t v93;
  WebCore::Node *v94;
  float v95;
  float v96;
  WebCore::Node *v97;
  char v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  CFTypeRef v103;
  WebCore::Node *v104;
  int v105;
  char v106;
  char v107;
  WebCore::Node *v108[2];
  char v109;
  WebCore::Node *v110;
  int v111;
  char v112;
  char v113;
  WTF *v114;
  uint64_t v115;
  WebCore::Node *v116;
  int v117;
  WebCore::Node *v118;
  int v119;
  char v120;
  __int128 v121;
  CFTypeRef cf;
  WebCore::Node *v123;
  int v124;
  char v125;
  char v126;
  uint64_t v127;
  unsigned __int8 *v128;
  uint64_t v129;
  _BYTE v130[128];
  _QWORD v131[2];
  uint64_t v132;
  char v133;
  uint64_t v134;

  v134 = *MEMORY[0x1E0C80C00];
  v3 = -[WebAccessibilityObjectWrapperBase baseUpdateBackingStore](self, "baseUpdateBackingStore");
  if (!v3)
    return 0;
  v4 = v3;
  if (!(*(unsigned int (**)(_QWORD *))(*v3 + 48))(v3))
    return 0;
  v5 = v4[1];
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
  if (v8 != 1)
  {
    __clrex();
    goto LABEL_12;
  }
  if (__stlxr(0, (unsigned __int8 *)v5))
LABEL_12:
    WTF::Lock::unlockSlow((WTF::Lock *)v5);
  (*(void (**)(WebCore::Node **__return_ptr, _QWORD *))(*v4 + 1960))(&v116, v4);
  if (!v120)
  {
    v7 = 0;
    goto LABEL_173;
  }
  v114 = 0;
  v115 = 0;
  v10 = v116;
  *((_DWORD *)v116 + 6) += 2;
  *(_QWORD *)&v121 = v10;
  DWORD2(v121) = v117;
  BYTE12(v121) &= 0xF0u;
  WebCore::VisiblePosition::canonicalPosition((WebCore::VisiblePosition *)&v121, (uint64_t)&v110);
  v113 = 1;
  if (*((_DWORD *)v10 + 6) == 2)
  {
    if ((*((_WORD *)v10 + 15) & 0x400) == 0)
      WebCore::Node::removedLastRef(v10, v11);
  }
  else
  {
    *((_DWORD *)v10 + 6) -= 2;
  }
  if (!v120)
    __break(1u);
  v12 = v118;
  *((_DWORD *)v118 + 6) += 2;
  *(_QWORD *)&v121 = v12;
  DWORD2(v121) = v119;
  BYTE12(v121) &= 0xF0u;
  WebCore::VisiblePosition::canonicalPosition((WebCore::VisiblePosition *)&v121, (uint64_t)v108);
  v109 = 1;
  if (*((_DWORD *)v12 + 6) == 2)
  {
    if ((*((_WORD *)v12 + 15) & 0x400) == 0)
      WebCore::Node::removedLastRef(v12, v9);
  }
  else
  {
    *((_DWORD *)v12 + 6) -= 2;
  }
  v91 = v4;
  if (!v110)
  {
    v14 = 0;
    goto LABEL_152;
  }
  v14 = 0;
  v89 = self;
  v90 = 0;
  do
  {
    v15 = WebCore::documentOrder(&v110, v108, v13);
    if (v15 == 129 || (char)v15 > 0)
      break;
    (*(void (**)(WebCore::Node **__return_ptr, _QWORD *, WebCore::Node **))(*v4 + 2088))(&v104, v4, &v110);
    v18 = WebCore::documentOrder(&v104, &v110, v17);
    if (v18 != 129 && (char)v18 < 1)
      goto LABEL_56;
    v19 = v110;
    if (v110)
      *((_DWORD *)v110 + 6) += 2;
    *(_QWORD *)&v121 = v19;
    DWORD2(v121) = v111;
    BYTE12(v121) = v112;
    LOBYTE(cf) = v113;
    v20 = v104;
    if (v104)
      *((_DWORD *)v104 + 6) += 2;
    v123 = v20;
    v124 = v105;
    v125 = v106;
    v126 = v107;
    v22 = (*(uint64_t (**)(_QWORD *, __int128 *))(*v4 + 3128))(v4, &v121);
    v23 = v21;
    v24 = v123;
    v123 = 0;
    if (v24)
    {
      if (*((_DWORD *)v24 + 6) == 2)
      {
        if ((*((_WORD *)v24 + 15) & 0x400) == 0)
          WebCore::Node::removedLastRef(v24, v21);
      }
      else
      {
        *((_DWORD *)v24 + 6) -= 2;
      }
    }
    v25 = v121;
    *(_QWORD *)&v121 = 0;
    if (v25)
    {
      if (*(_DWORD *)(v25 + 24) == 2)
      {
        if ((*(_WORD *)(v25 + 30) & 0x400) == 0)
          WebCore::Node::removedLastRef((WebCore::Node *)v25, v21);
      }
      else
      {
        *(_DWORD *)(v25 + 24) -= 2;
      }
    }
    WebCore::makeSimpleRange<WebCore::VisiblePosition,WebCore::VisiblePosition>((uint64_t *)&v110, (uint64_t)&v104, (uint64_t)v131);
    if (!v133)
    {
LABEL_56:
      v39 = 3;
      goto LABEL_57;
    }
    v93 = v22;
    WebCore::AccessibilityObject::contentForRange((uint64_t)v4, v131, &v103);
    v26 = objc_alloc_init(MEMORY[0x1E0CB3778]);
    v92 = v14;
    v101 = 0u;
    v102 = 0u;
    v99 = 0u;
    v100 = 0u;
    v27 = (void *)v103;
    v28 = objc_msgSend((id)v103, "countByEnumeratingWithState:objects:count:", &v99, v130, 16);
    if (v28)
    {
      v29 = *(_QWORD *)v100;
      do
      {
        for (i = 0; i != v28; ++i)
        {
          if (*(_QWORD *)v100 != v29)
            objc_enumerationMutation(v27);
          v31 = *(void **)(*((_QWORD *)&v99 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v26, "appendAttributedString:", v31);
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v32 = objc_msgSend(v31, "accessibilityLabel");
              if (v32)
              {
                v33 = (const void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v32);
                objc_msgSend(v26, "appendAttributedString:", v33);
                if (v33)
                  CFRelease(v33);
              }
            }
          }
        }
        v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v99, v130, 16);
      }
      while (v28);
    }
    *(_QWORD *)&v121 = v93;
    *((_QWORD *)&v121 + 1) = v23;
    cf = v26;
    if (v26)
      CFRetain(v26);
    if (v92 == (_DWORD)v115)
    {
      v34 = (_OWORD *)WTF::Vector<std::pair<WebCore::IntRect,WTF::RetainPtr<NSAttributedString>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::expandCapacity<(WTF::FailureAction)0>((uint64_t)&v114, v92 + 1, (unint64_t)&v121);
      v35 = HIDWORD(v115);
      v90 = v114;
      v36 = (_OWORD *)((char *)v114 + 24 * HIDWORD(v115));
      *v36 = *v34;
      v37 = v36 + 1;
      p_cf = (CFTypeRef *)(v34 + 1);
    }
    else
    {
      v41 = (_OWORD *)((char *)v90 + 24 * v92);
      *v41 = v121;
      v37 = v41 + 1;
      v35 = HIDWORD(v115);
      p_cf = &cf;
    }
    v42 = *p_cf;
    *p_cf = 0;
    *v37 = v42;
    v14 = v35 + 1;
    HIDWORD(v115) = v35 + 1;
    v43 = cf;
    cf = 0;
    if (v43)
      CFRelease(v43);
    v44 = v104;
    if (v104)
      *((_DWORD *)v104 + 6) += 2;
    v45 = v110;
    v110 = v44;
    if (v45)
    {
      if (*((_DWORD *)v45 + 6) == 2)
      {
        if ((*((_WORD *)v45 + 15) & 0x400) == 0)
          WebCore::Node::removedLastRef(v45, v9);
      }
      else
      {
        *((_DWORD *)v45 + 6) -= 2;
      }
    }
    v111 = v105;
    v112 = v106;
    v113 = v107;
    while (1)
    {
      v46 = WTF::RefPtr<WebCore::Node,WTF::RawPtrTraits<WebCore::Node>,WTF::DefaultRefDerefTraits<WebCore::Node>>::unspecifiedBoolTypeInstance;
      if (!v110)
        v46 = 0;
      if (!v46)
        break;
      WebCore::endOfLine((uint64_t *)&v121, (uint64_t)&v110, 1, 0);
      v47 = WebCore::operator==((uint64_t *)&v110, (uint64_t *)&v121);
      v48 = v121;
      *(_QWORD *)&v121 = 0;
      if (v48)
      {
        if (*(_DWORD *)(v48 + 24) == 2)
        {
          if ((*(_WORD *)(v48 + 30) & 0x400) == 0)
            WebCore::Node::removedLastRef((WebCore::Node *)v48, v9);
        }
        else
        {
          *(_DWORD *)(v48 + 24) -= 2;
        }
      }
      if (!v47)
        break;
      WebCore::VisiblePosition::next((unsigned __int8 *)&v110, 0, 0, (uint64_t)&v121);
      v50 = (WebCore::Node *)v121;
      *(_QWORD *)&v121 = 0;
      v51 = v104;
      v104 = v50;
      if (v51)
      {
        if (*((_DWORD *)v51 + 6) == 2)
        {
          if ((*((_WORD *)v51 + 15) & 0x400) == 0)
          {
            WebCore::Node::removedLastRef(v51, v49);
            v60 = v121;
            v105 = DWORD2(v121);
            v106 = BYTE12(v121);
            v107 = (char)cf;
            *(_QWORD *)&v121 = 0;
            if (v60)
            {
              if (*(_DWORD *)(v60 + 24) == 2)
              {
                if ((*(_WORD *)(v60 + 30) & 0x400) == 0)
                  WebCore::Node::removedLastRef((WebCore::Node *)v60, v59);
              }
              else
              {
                *(_DWORD *)(v60 + 24) -= 2;
              }
            }
            goto LABEL_83;
          }
        }
        else
        {
          *((_DWORD *)v51 + 6) -= 2;
        }
      }
      v105 = DWORD2(v121);
      v106 = BYTE12(v121);
      v107 = (char)cf;
LABEL_83:
      WebCore::makeSimpleRange<WebCore::VisiblePosition,WebCore::VisiblePosition>((uint64_t *)&v110, (uint64_t)&v104, (uint64_t)&v94);
      if (v98)
      {
        if ((WebCore::TextIterator::TextIterator((uint64_t)&v121, &v94, 0), v127)
          && (_DWORD)v129 == 1
          && ((v129 & 0xFF00000000) != 0 ? (v53 = *v128) : (v53 = *(unsigned __int16 *)v128), v53 == 10))
        {
          v54 = v104;
          if (v104)
            *((_DWORD *)v104 + 6) += 2;
          v55 = v110;
          v110 = v54;
          if (v55)
          {
            if (*((_DWORD *)v55 + 6) == 2)
            {
              if ((*((_WORD *)v55 + 15) & 0x400) == 0)
                WebCore::Node::removedLastRef(v55, v52);
            }
            else
            {
              *((_DWORD *)v55 + 6) -= 2;
            }
          }
          v111 = v105;
          v112 = v106;
          v113 = v107;
          v56 = 1;
        }
        else
        {
          v56 = 0;
        }
        WebCore::TextIterator::~TextIterator((WebCore::TextIterator *)&v121, v52);
        if (v98)
        {
          v57 = v97;
          v97 = 0;
          if (v57)
          {
            if (*((_DWORD *)v57 + 6) == 2)
            {
              if ((*((_WORD *)v57 + 15) & 0x400) == 0)
                WebCore::Node::removedLastRef(v57, v9);
            }
            else
            {
              *((_DWORD *)v57 + 6) -= 2;
            }
          }
          v58 = v94;
          v94 = 0;
          if (v58)
          {
            if (*((_DWORD *)v58 + 6) == 2)
            {
              if ((*((_WORD *)v58 + 15) & 0x400) == 0)
                WebCore::Node::removedLastRef(v58, v9);
            }
            else
            {
              *((_DWORD *)v58 + 6) -= 2;
            }
          }
        }
        if ((v56 & 1) != 0)
          continue;
      }
      break;
    }
    if (v26)
      CFRelease(v26);
    v61 = v103;
    v103 = 0;
    v4 = v91;
    if (v61)
      CFRelease(v61);
    if (v133)
    {
      v62 = v132;
      v132 = 0;
      if (v62)
      {
        if (*(_DWORD *)(v62 + 24) == 2)
        {
          if ((*(_WORD *)(v62 + 30) & 0x400) == 0)
            WebCore::Node::removedLastRef((WebCore::Node *)v62, v9);
        }
        else
        {
          *(_DWORD *)(v62 + 24) -= 2;
        }
      }
      v63 = v131[0];
      v131[0] = 0;
      if (v63)
      {
        if (*(_DWORD *)(v63 + 24) != 2)
        {
          v39 = 0;
          *(_DWORD *)(v63 + 24) -= 2;
          goto LABEL_57;
        }
        if ((*(_WORD *)(v63 + 30) & 0x400) == 0)
          WebCore::Node::removedLastRef((WebCore::Node *)v63, v9);
      }
    }
    v39 = 0;
LABEL_57:
    v40 = v104;
    v104 = 0;
    if (v40)
    {
      if (*((_DWORD *)v40 + 6) == 2)
      {
        if ((*((_WORD *)v40 + 15) & 0x400) == 0)
          WebCore::Node::removedLastRef(v40, v9);
      }
      else
      {
        *((_DWORD *)v40 + 6) -= 2;
      }
    }
  }
  while (!v39 && v110);
  if (!v14)
  {
LABEL_152:
    v7 = 0;
    v72 = 1;
    goto LABEL_153;
  }
  v64 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v14);
  v65 = v114;
  v66 = (WTF *)((char *)v114 + 24 * v14);
  v67 = v89;
  do
  {
    v131[0] = CFSTR("rect");
    v68 = (void *)MEMORY[0x1E0CB3B18];
    v69 = (float)*((int *)v65 + 1);
    *(float *)&v94 = (float)*(int *)v65;
    *((float *)&v94 + 1) = v69;
    v70 = (float)*((int *)v65 + 3);
    v95 = (float)*((int *)v65 + 2);
    v96 = v70;
    -[WebAccessibilityObjectWrapperBase convertRectToSpace:space:](v67, "convertRectToSpace:space:", &v94, 0, v89);
    *(_QWORD *)&v121 = objc_msgSend(v68, "valueWithRect:");
    v131[1] = CFSTR("text");
    *((_QWORD *)&v121 + 1) = *((_QWORD *)v65 + 2);
    v71 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v121, v131, 2);
    if (v71)
      objc_msgSend(v64, "addObject:", v71);
    v65 = (WTF *)((char *)v65 + 24);
  }
  while (v65 != v66);
  v7 = (id)CFMakeCollectable(v64);
  v72 = 0;
LABEL_153:
  if (v108[0])
  {
    if (*((_DWORD *)v108[0] + 6) == 2)
    {
      if ((*((_WORD *)v108[0] + 15) & 0x400) == 0)
        WebCore::Node::removedLastRef(v108[0], v9);
    }
    else
    {
      *((_DWORD *)v108[0] + 6) -= 2;
    }
  }
  v73 = v110;
  v110 = 0;
  if (v73)
  {
    if (*((_DWORD *)v73 + 6) == 2)
    {
      if ((*((_WORD *)v73 + 15) & 0x400) == 0)
        WebCore::Node::removedLastRef(v73, v9);
    }
    else
    {
      *((_DWORD *)v73 + 6) -= 2;
    }
  }
  v74 = v114;
  if ((v72 & 1) == 0)
  {
    v75 = 24 * v14;
    v76 = (const void **)((char *)v114 + 16);
    do
    {
      v77 = *v76;
      *v76 = 0;
      if (v77)
        CFRelease(v77);
      v76 += 3;
      v75 -= 24;
    }
    while (v75);
  }
  if (v74)
    WTF::fastFree(v74, v9);
  v4 = v91;
  if (v120)
  {
    v78 = v118;
    v118 = 0;
    if (v78)
    {
      if (*((_DWORD *)v78 + 6) == 2)
      {
        if ((*((_WORD *)v78 + 15) & 0x400) == 0)
          WebCore::Node::removedLastRef(v78, v9);
      }
      else
      {
        *((_DWORD *)v78 + 6) -= 2;
      }
    }
    v79 = v116;
    v116 = 0;
    if (v79)
    {
      if (*((_DWORD *)v79 + 6) == 2)
      {
        if ((*((_WORD *)v79 + 15) & 0x400) == 0)
          WebCore::Node::removedLastRef(v79, v9);
      }
      else
      {
        *((_DWORD *)v79 + 6) -= 2;
      }
    }
  }
LABEL_173:
  v80 = v4[1];
  if (__ldaxr((unsigned __int8 *)v80))
  {
    __clrex();
    goto LABEL_176;
  }
  if (__stxr(1u, (unsigned __int8 *)v80))
LABEL_176:
    MEMORY[0x19AEA534C](v80);
  v82 = *(_QWORD *)(v80 + 8);
  v83 = v82 - 1;
  *(_QWORD *)(v80 + 8) = v82 - 1;
  if (v82 == 1)
  {
    v88 = *(_QWORD *)(v80 + 16);
    v84 = *(_QWORD *)(v80 + 24);
    *(_QWORD *)(v80 + 24) = 0;
    v85 = v88 != 0;
  }
  else
  {
    v84 = 0;
    v85 = 1;
  }
  v86 = __ldxr((unsigned __int8 *)v80);
  if (v86 != 1)
  {
    __clrex();
LABEL_184:
    WTF::Lock::unlockSlow((WTF::Lock *)v80);
    if (!v83)
      goto LABEL_185;
    return (id)v7;
  }
  if (__stlxr(0, (unsigned __int8 *)v80))
    goto LABEL_184;
  if (!v83)
  {
LABEL_185:
    if (v84)
      (*(void (**)(uint64_t))(*(_QWORD *)v84 + 8))(v84);
    if (!v85)
      WTF::fastFree((WTF *)v80, v9);
  }
  return (id)v7;
}

- (id)ariaLandmarkRoleDescription
{
  WTF::StringImpl *v2;
  void *v3;
  WTF::StringImpl *v4;
  WTF::StringImpl *v6;

  WebCore::AXCoreObject::ariaLandmarkRoleDescription((WebCore::AXCoreObject *)-[WebAccessibilityObjectWrapperBase axBackingObject](self, "axBackingObject"), &v6);
  if (!v6)
    return &stru_1E3487BC0;
  v3 = (void *)WTF::StringImpl::operator NSString *();
  v4 = v6;
  v6 = 0;
  if (v4)
  {
    if (*(_DWORD *)v4 == 2)
      WTF::StringImpl::destroy(v4, v2);
    else
      *(_DWORD *)v4 -= 2;
  }
  return v3;
}

- (id)accessibilityPlatformMathSubscriptKey
{
  return 0;
}

- (id)accessibilityPlatformMathSuperscriptKey
{
  return 0;
}

- (id)accessibilityMathPostscriptPairs
{
  void *v3;
  void *v4;
  CFTypeRef v5;
  WTF *v6;
  WTF *v8;
  uint64_t v9;

  v8 = 0;
  v9 = 0;
  v3 = -[WebAccessibilityObjectWrapperBase axBackingObject](self, "axBackingObject");
  (*(void (**)(void *, WTF **))(*(_QWORD *)v3 + 2504))(v3, &v8);
  v5 = convertMathPairsToNSArray((uint64_t)&v8, (uint64_t)-[WebAccessibilityObjectWrapperBase accessibilityPlatformMathSubscriptKey](self, "accessibilityPlatformMathSubscriptKey"), (uint64_t)-[WebAccessibilityObjectWrapperBase accessibilityPlatformMathSuperscriptKey](self, "accessibilityPlatformMathSuperscriptKey"));
  v6 = v8;
  if (v8)
  {
    v8 = 0;
    LODWORD(v9) = 0;
    WTF::fastFree(v6, v4);
  }
  return (id)v5;
}

- (id)accessibilityMathPrescriptPairs
{
  void *v3;
  void *v4;
  CFTypeRef v5;
  WTF *v6;
  WTF *v8;
  uint64_t v9;

  v8 = 0;
  v9 = 0;
  v3 = -[WebAccessibilityObjectWrapperBase axBackingObject](self, "axBackingObject");
  (*(void (**)(void *, WTF **))(*(_QWORD *)v3 + 2496))(v3, &v8);
  v5 = convertMathPairsToNSArray((uint64_t)&v8, (uint64_t)-[WebAccessibilityObjectWrapperBase accessibilityPlatformMathSubscriptKey](self, "accessibilityPlatformMathSubscriptKey"), (uint64_t)-[WebAccessibilityObjectWrapperBase accessibilityPlatformMathSuperscriptKey](self, "accessibilityPlatformMathSuperscriptKey"));
  v6 = v8;
  if (v8)
  {
    v8 = 0;
    LODWORD(v9) = 0;
    WTF::fastFree(v6, v4);
  }
  return (id)v5;
}

- (id)baseAccessibilityResolvedEditingStyles
{
  void *v3;
  WTF::StringImpl *v4;
  const WTF::StringImpl *v5;
  WTF::StringImpl **v6;
  uint64_t v7;
  WTF::StringImpl **v8;
  WTF::StringImpl **v9;
  uint64_t v10;
  WTF::StringImpl **v11;
  WTF::StringImpl **v12;
  unsigned int v13;
  unsigned int v14;
  int v15;
  int i;
  unsigned int v17;
  WTF *v18;
  uint64_t v19;
  WTF::StringImpl **v20;
  uint64_t v21;
  const __CFString *v22;
  WTF::StringImpl **v23;
  uint64_t v24;
  WTF::StringImpl **v25;
  WTF::StringImpl *v26;
  uint64_t v27;
  id result;
  uint64_t v29;
  int v30;
  WTF::StringImpl **v31;
  char v32;
  char *v33;
  char v34;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  (*(void (**)(WTF::StringImpl ***__return_ptr))(*(_QWORD *)-[WebAccessibilityObjectWrapperBase axBackingObject](self, "axBackingObject")+ 512))(&v31);
  v6 = v31;
  if (v31)
  {
    v7 = *((unsigned int *)v31 - 1);
    v8 = &v31[3 * v7];
    if (*((_DWORD *)v31 - 3))
    {
      v9 = v31;
      if ((_DWORD)v7)
      {
        v10 = 24 * v7;
        v9 = v31;
        while ((unint64_t)*v9 + 1 <= 1)
        {
          v9 += 3;
          v10 -= 24;
          if (!v10)
          {
            v9 = v8;
            goto LABEL_8;
          }
        }
      }
      goto LABEL_8;
    }
    v9 = &v31[3 * v7];
  }
  else
  {
    v9 = 0;
    LODWORD(v7) = 0;
  }
  v8 = &v31[3 * v7];
  if (v31)
  {
LABEL_8:
    v11 = &v31[3 * *((unsigned int *)v31 - 1)];
    goto LABEL_13;
  }
  v11 = 0;
LABEL_13:
  if (v11 != v9)
  {
    while (1)
    {
      v12 = v31;
      if (v31)
      {
        v13 = *((_DWORD *)v31 - 2);
        v14 = *((_DWORD *)*v9 + 4);
        if (v14 < 0x100)
          v15 = WTF::StringImpl::hashSlowCase(*v9);
        else
          v15 = v14 >> 8;
        for (i = 0; ; v15 = i + v17)
        {
          v17 = v15 & v13;
          v18 = v12[3 * (v15 & v13)];
          if (v18 != (WTF *)-1)
          {
            if (!v18)
              goto LABEL_23;
            if ((WTF::equal(v18, *v9, v5) & 1) != 0)
              break;
          }
          ++i;
        }
        v20 = &v12[3 * v17];
        LOBYTE(v29) = 0;
        v30 = -1;
        v19 = *((unsigned int *)v20 + 4);
        if ((_DWORD)v19 == -1)
        {
          result = (id)std::__throw_bad_variant_access[abi:sn180100]();
          __break(1u);
          return result;
        }
        ((void (*)(char *, uint64_t *, WTF::StringImpl **))off_1E3485910[v19])(&v34, &v29, v20 + 1);
      }
      else
      {
LABEL_23:
        v19 = 0;
        v29 = 0;
      }
      v30 = v19;
      v33 = &v32;
      v21 = ((uint64_t (*)(char **, uint64_t *))off_1E3485928[v19])(&v33, &v29);
      if (*v9)
        v22 = (const __CFString *)WTF::StringImpl::operator NSString *();
      else
        v22 = &stru_1E3487BC0;
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, v22, v29);
      if (v30 != -1)
        ((void (*)(char **, uint64_t *))off_1E34858A8[v30])(&v33, &v29);
      v23 = v9 + 3;
      v9 = v8;
      if (v23 != v8)
      {
        v9 = v23;
        while ((unint64_t)*v9 + 1 <= 1)
        {
          v9 += 3;
          if (v9 == v8)
          {
            v9 = v8;
            break;
          }
        }
      }
      if (v9 == v11)
      {
        v6 = v31;
        break;
      }
    }
  }
  if (v6)
  {
    v24 = *((unsigned int *)v6 - 1);
    if ((_DWORD)v24)
    {
      v25 = v6 + 1;
      do
      {
        v26 = *(v25 - 1);
        if (v26 != (WTF::StringImpl *)-1)
        {
          v27 = *((unsigned int *)v25 + 2);
          if ((_DWORD)v27 != -1)
          {
            ((void (*)(uint64_t *, WTF::StringImpl **))off_1E34858A8[v27])(&v29, v25);
            v26 = *(v25 - 1);
          }
          *((_DWORD *)v25 + 2) = -1;
          *(v25 - 1) = 0;
          if (v26)
          {
            if (*(_DWORD *)v26 == 2)
              WTF::StringImpl::destroy(v26, v4);
            else
              *(_DWORD *)v26 -= 2;
          }
        }
        v25 += 3;
        --v24;
      }
      while (v24);
    }
    WTF::fastFree((WTF *)(v6 - 2), v4);
  }
  return v3;
}

+ (void)accessibilitySetShouldRepostNotifications:(BOOL)a3
{
  accessibilityShouldRepostNotifications = a3;
}

- (void)accessibilityPostedNotification:(id)a3
{
  if (accessibilityShouldRepostNotifications)
    -[WebAccessibilityObjectWrapperBase accessibilityPostedNotification:userInfo:](self, "accessibilityPostedNotification:userInfo:", a3, 0);
}

- (void)accessibilityPostedNotification:(id)a3 userInfo:(id)a4
{
  if (accessibilityShouldRepostNotifications)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("AXDRTNotification"), self, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", a3, CFSTR("notificationName"), dictionaryRemovingNonSupportedTypes(a4), CFSTR("userInfo"), 0));
}

- (id)innerHTML
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  int v6;
  WTF::StringImpl *v7;
  const __CFString *v8;
  WTF::StringImpl *v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  int v16;
  uint64_t v18;
  WTF::StringImpl *v19;

  v2 = -[WebAccessibilityObjectWrapperBase axBackingObject](self, "axBackingObject");
  if (!v2)
    return 0;
  v3 = v2;
  v4 = v2[1];
  if (__ldaxr((unsigned __int8 *)v4))
  {
    __clrex();
  }
  else if (!__stxr(1u, (unsigned __int8 *)v4))
  {
    goto LABEL_6;
  }
  MEMORY[0x19AEA534C](v4);
LABEL_6:
  ++*(_QWORD *)(v4 + 8);
  v6 = __ldxr((unsigned __int8 *)v4);
  if (v6 != 1)
  {
    __clrex();
    goto LABEL_10;
  }
  if (__stlxr(0, (unsigned __int8 *)v4))
LABEL_10:
    WTF::Lock::unlockSlow((WTF::Lock *)v4);
  (*(void (**)(WTF::StringImpl **__return_ptr, _QWORD *))(*v3 + 2624))(&v19, v3);
  if (v19)
  {
    v8 = (const __CFString *)WTF::StringImpl::operator NSString *();
    v9 = v19;
    v19 = 0;
    if (v9)
    {
      if (*(_DWORD *)v9 == 2)
        WTF::StringImpl::destroy(v9, v7);
      else
        *(_DWORD *)v9 -= 2;
    }
  }
  else
  {
    v8 = &stru_1E3487BC0;
  }
  v10 = v3[1];
  if (__ldaxr((unsigned __int8 *)v10))
  {
    __clrex();
  }
  else if (!__stxr(1u, (unsigned __int8 *)v10))
  {
    goto LABEL_19;
  }
  MEMORY[0x19AEA534C](v10);
LABEL_19:
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
        return (id)v8;
      goto LABEL_27;
    }
  }
  else
  {
    __clrex();
  }
  WTF::Lock::unlockSlow((WTF::Lock *)v10);
  if (v13)
    return (id)v8;
LABEL_27:
  if (v14)
    (*(void (**)(uint64_t))(*(_QWORD *)v14 + 8))(v14);
  if (!v15)
    WTF::fastFree((WTF *)v10, v7);
  return (id)v8;
}

- (id)outerHTML
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  int v6;
  WTF::StringImpl *v7;
  const __CFString *v8;
  WTF::StringImpl *v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  int v16;
  uint64_t v18;
  WTF::StringImpl *v19;

  v2 = -[WebAccessibilityObjectWrapperBase axBackingObject](self, "axBackingObject");
  if (!v2)
    return 0;
  v3 = v2;
  v4 = v2[1];
  if (__ldaxr((unsigned __int8 *)v4))
  {
    __clrex();
  }
  else if (!__stxr(1u, (unsigned __int8 *)v4))
  {
    goto LABEL_6;
  }
  MEMORY[0x19AEA534C](v4);
LABEL_6:
  ++*(_QWORD *)(v4 + 8);
  v6 = __ldxr((unsigned __int8 *)v4);
  if (v6 != 1)
  {
    __clrex();
    goto LABEL_10;
  }
  if (__stlxr(0, (unsigned __int8 *)v4))
LABEL_10:
    WTF::Lock::unlockSlow((WTF::Lock *)v4);
  (*(void (**)(WTF::StringImpl **__return_ptr, _QWORD *))(*v3 + 2632))(&v19, v3);
  if (v19)
  {
    v8 = (const __CFString *)WTF::StringImpl::operator NSString *();
    v9 = v19;
    v19 = 0;
    if (v9)
    {
      if (*(_DWORD *)v9 == 2)
        WTF::StringImpl::destroy(v9, v7);
      else
        *(_DWORD *)v9 -= 2;
    }
  }
  else
  {
    v8 = &stru_1E3487BC0;
  }
  v10 = v3[1];
  if (__ldaxr((unsigned __int8 *)v10))
  {
    __clrex();
  }
  else if (!__stxr(1u, (unsigned __int8 *)v10))
  {
    goto LABEL_19;
  }
  MEMORY[0x19AEA534C](v10);
LABEL_19:
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
        return (id)v8;
      goto LABEL_27;
    }
  }
  else
  {
    __clrex();
  }
  WTF::Lock::unlockSlow((WTF::Lock *)v10);
  if (v13)
    return (id)v8;
LABEL_27:
  if (v14)
    (*(void (**)(uint64_t))(*(_QWORD *)v14 + 8))(v14);
  if (!v15)
    WTF::fastFree((WTF *)v10, v7);
  return (id)v8;
}

- (ObjectIdentifierGeneric<WebCore::AXIDType,)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:()ObjectIdentifierGeneric<WebCore:()WTF:(unsigned long long>)a3 :ObjectIdentifierMainThreadAccessTraits<uint64_t> :AXIDType
{
  self->_identifier = a3;
}

- (void).cxx_destruct
{
  unsigned int *m_ptr;
  unsigned int v4;
  unsigned int v5;

  m_ptr = (unsigned int *)self->m_axObject.m_impl.m_ptr;
  self->m_axObject.m_impl.m_ptr = 0;
  if (m_ptr)
  {
    do
    {
      v4 = __ldaxr(m_ptr);
      v5 = v4 - 1;
    }
    while (__stlxr(v5, m_ptr));
    if (!v5)
    {
      atomic_store(1u, m_ptr);
      WTF::fastFree((WTF *)m_ptr, (void *)a2);
    }
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

- (void)convertPathToScreenSpace:(uint64_t)a1
{
  uint64_t v2;
  CGPath *v3;
  void *v4;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  uint64_t v26;
  uint64_t v27;

  v2 = *(_QWORD *)(a1 + 8);
  v4 = *(void **)v2;
  v3 = *(CGPath **)(v2 + 8);
  v26 = 0;
  v27 = 0;
  switch(*(_BYTE *)a2)
  {
    case 0:
      v26 = *(_QWORD *)(a2 + 4);
      objc_msgSend(v4, "convertRectToSpace:space:", &v26, 0);
      CGPathMoveToPoint(v3, 0, v6, v7);
      break;
    case 1:
      v26 = *(_QWORD *)(a2 + 4);
      objc_msgSend(v4, "convertRectToSpace:space:", &v26, 0);
      CGPathAddLineToPoint(v3, 0, v8, v9);
      break;
    case 2:
      v26 = *(_QWORD *)(a2 + 4);
      objc_msgSend(v4, "convertRectToSpace:space:", &v26, 0);
      v11 = v10;
      v13 = v12;
      v26 = *(_QWORD *)(a2 + 12);
      v27 = 0;
      objc_msgSend(v4, "convertRectToSpace:space:", &v26, 0);
      CGPathAddQuadCurveToPoint(v3, 0, v11, v13, v14, v15);
      break;
    case 3:
      v26 = *(_QWORD *)(a2 + 4);
      objc_msgSend(v4, "convertRectToSpace:space:", &v26, 0);
      v17 = v16;
      v19 = v18;
      v26 = *(_QWORD *)(a2 + 12);
      v27 = 0;
      objc_msgSend(v4, "convertRectToSpace:space:", &v26, 0);
      v21 = v20;
      v23 = v22;
      v26 = *(_QWORD *)(a2 + 20);
      v27 = 0;
      objc_msgSend(v4, "convertRectToSpace:space:", &v26, 0);
      CGPathAddCurveToPoint(v3, 0, v17, v19, v21, v23, v24, v25);
      break;
    case 4:
      CGPathCloseSubpath(v3);
      break;
    default:
      return;
  }
}

- (WebCore::Node)accessibilityVisibleCharacterRange
{
  WebCore::Node *result;
  WebCore::Node *v3;
  void *v4;
  WebCore::Node *v5;
  uint64_t v6;
  WebCore::Node *v7;
  uint64_t v8;
  void *v9;
  WebCore::Node *v10;
  WebCore::Node *v11;
  uint64_t *v12;
  WebCore::Node *v13[2];
  WebCore::Node *v14;
  char v15;
  WebCore::Node *v16[2];
  WebCore::Node *v17;
  char v18;

  result = (WebCore::Node *)objc_msgSend(**(id **)(a1 + 16), "baseUpdateBackingStore");
  if (result)
  {
    v3 = result;
    (*(void (**)(WebCore::Node **__return_ptr))(*(_QWORD *)result + 1960))(v16);
    result = (WebCore::Node *)makeNSRange((uint64_t *)v16);
    v5 = result;
    v6 = (uint64_t)v4;
    if (v18)
    {
      v7 = v17;
      v17 = 0;
      if (v7)
      {
        if (*((_DWORD *)v7 + 6) == 2)
        {
          if ((*((_WORD *)v7 + 15) & 0x400) == 0)
            WebCore::Node::removedLastRef(v7, v4);
        }
        else
        {
          *((_DWORD *)v7 + 6) -= 2;
        }
      }
      result = v16[0];
      v16[0] = 0;
      if (result)
      {
        if (*((_DWORD *)result + 6) == 2)
        {
          if ((*((_WORD *)result + 15) & 0x400) == 0)
            result = (WebCore::Node *)WebCore::Node::removedLastRef(result, v4);
        }
        else
        {
          *((_DWORD *)result + 6) -= 2;
        }
      }
    }
    v8 = 0x7FFFFFFFFFFFFFFFLL;
    if (v5 != (WebCore::Node *)0x7FFFFFFFFFFFFFFFLL)
    {
      (*(void (**)(WebCore::Node **__return_ptr, WebCore::Node *))(*(_QWORD *)v3 + 704))(v13, v3);
      result = (WebCore::Node *)makeNSRange((uint64_t *)v13);
      v10 = result;
      v6 = (uint64_t)v9;
      if (v15)
      {
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
        result = v13[0];
        v13[0] = 0;
        if (result)
        {
          if (*((_DWORD *)result + 6) == 2)
          {
            if ((*((_WORD *)result + 15) & 0x400) == 0)
              result = (WebCore::Node *)WebCore::Node::removedLastRef(result, v9);
          }
          else
          {
            *((_DWORD *)result + 6) -= 2;
          }
        }
      }
      v8 = v10 - v5;
      if (v10 == (WebCore::Node *)0x7FFFFFFFFFFFFFFFLL)
        v8 = 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  else
  {
    v6 = 0;
    v8 = 0x7FFFFFFFFFFFFFFFLL;
  }
  v12 = *(uint64_t **)(a1 + 8);
  *v12 = v8;
  v12[1] = v6;
  return result;
}

@end
