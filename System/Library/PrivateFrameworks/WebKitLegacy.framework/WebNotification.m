@implementation WebNotification

- (WebNotification)initWithCoreNotification:(void *)a3
{
  WebNotification *v4;
  WebNotificationPrivate *v5;
  WebNotificationPrivate *v6;
  StringImpl *v7;
  StringImpl *v8;
  WTF::StringImpl *m_ptr;
  StringImpl *v10;
  WTF::StringImpl *v11;
  unint64_t v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int v16;
  StringImpl *v17;
  StringImpl *v18;
  StringImpl *v19;
  StringImpl *v20;
  StringImpl *v21;
  StringImpl *v22;
  StringImpl *v23;
  unsigned int v24;
  unsigned int v25;
  unsigned int v26;
  unsigned int v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  unint64_t v31;
  StringImpl *v33;
  StringImpl *v34;
  WTF::StringImpl *v35;
  StringImpl *v36;
  StringImpl *v37;
  WTF::StringImpl *v38;
  StringImpl *v39;
  StringImpl *v40;
  WTF::StringImpl *v41;
  StringImpl *v42;
  StringImpl *v43;
  WTF::StringImpl *v44;
  void *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  WTF *v49;
  unint64_t v50;
  objc_super v51;

  v51.receiver = self;
  v51.super_class = (Class)WebNotification;
  v4 = -[WebNotification init](&v51, sel_init);
  if (!v4)
    return v4;
  v5 = objc_alloc_init(WebNotificationPrivate);
  v6 = v5;
  v4->_private = v5;
  if (!*((_BYTE *)&v5[1]._internal.var0.m_processIdentifier + 32))
  {
    v12 = *(_QWORD *)a3;
    *(_QWORD *)a3 = 0;
    v5->_internal.var0.m_processIdentifier.m_identifier = v12;
    v13 = *((_DWORD *)&v5->_internal.var0.__val_.defaultActionURL + 2) & 0xFFFFFFFE | *((_DWORD *)a3 + 2) & 1;
    *((_DWORD *)&v5->_internal.var0.__val_.defaultActionURL + 2) = v13;
    v14 = v13 & 0xFFFFFFFD | (2 * ((*((_DWORD *)a3 + 2) >> 1) & 1));
    *((_DWORD *)&v5->_internal.var0.__val_.defaultActionURL + 2) = v14;
    v15 = v14 & 0xFFFFFFFB | (4 * ((*((_DWORD *)a3 + 2) >> 2) & 1));
    *((_DWORD *)&v5->_internal.var0.__val_.defaultActionURL + 2) = v15;
    v16 = v15 & 0xFFFFFFC7 | (8 * ((*((_DWORD *)a3 + 2) >> 3) & 7));
    *((_DWORD *)&v5->_internal.var0.__val_.defaultActionURL + 2) = v16;
    *((_DWORD *)&v5->_internal.var0.__val_.defaultActionURL + 2) = *((_DWORD *)a3 + 2) & 0xFFFFFFC0 | v16 & 0x3F;
    *(_OWORD *)((char *)&v5->_internal.var0.m_processIdentifier + 12) = *(_OWORD *)((char *)a3 + 12);
    *(ObjectIdentifierGeneric<WebCore::ProcessIdentifierType, WTF::ObjectIdentifierMainThreadAccessTraits<uint64_t>, unsigned long long> *)((char *)&v5->_internal.var0.m_processIdentifier + 28) = *(ObjectIdentifierGeneric<WebCore::ProcessIdentifierType, WTF::ObjectIdentifierMainThreadAccessTraits<uint64_t>, unsigned long long> *)((char *)a3 + 28);
    v5->_internal.var0.__val_.defaultActionURL.m_queryEnd = *((_DWORD *)a3 + 9);
    *((_DWORD *)a3 + 2) &= ~1u;
    v17 = (StringImpl *)*((_QWORD *)a3 + 5);
    *((_QWORD *)a3 + 5) = 0;
    v5->_internal.var0.__val_.title.m_impl.m_ptr = v17;
    v18 = (StringImpl *)*((_QWORD *)a3 + 6);
    *((_QWORD *)a3 + 6) = 0;
    v5->_internal.var0.__val_.body.m_impl.m_ptr = v18;
    v19 = (StringImpl *)*((_QWORD *)a3 + 7);
    *((_QWORD *)a3 + 7) = 0;
    v5->_internal.var0.__val_.iconURL.m_impl.m_ptr = v19;
    v20 = (StringImpl *)*((_QWORD *)a3 + 8);
    *((_QWORD *)a3 + 8) = 0;
    v5->_internal.var0.__val_.tag.m_impl.m_ptr = v20;
    v21 = (StringImpl *)*((_QWORD *)a3 + 9);
    *((_QWORD *)a3 + 9) = 0;
    v5->_internal.var0.__val_.language.m_impl.m_ptr = v21;
    v5->_internal.var0.__val_.direction = *((_BYTE *)a3 + 80);
    v22 = (StringImpl *)*((_QWORD *)a3 + 11);
    *((_QWORD *)a3 + 11) = 0;
    v5->_internal.var0.__val_.originString.m_impl.m_ptr = v22;
    v23 = (StringImpl *)*((_QWORD *)a3 + 12);
    *((_QWORD *)a3 + 12) = 0;
    v5->_internal.var0.__val_.serviceWorkerRegistrationURL.m_string.m_impl.m_ptr = v23;
    v24 = *((_DWORD *)&v5->_internal.var0.__val_.serviceWorkerRegistrationURL + 2) & 0xFFFFFFFE | *((_DWORD *)a3 + 26) & 1;
    *((_DWORD *)&v5->_internal.var0.__val_.serviceWorkerRegistrationURL + 2) = v24;
    v25 = v24 & 0xFFFFFFFD | (2 * ((*((_DWORD *)a3 + 26) >> 1) & 1));
    *((_DWORD *)&v5->_internal.var0.__val_.serviceWorkerRegistrationURL + 2) = v25;
    v26 = v25 & 0xFFFFFFFB | (4 * ((*((_DWORD *)a3 + 26) >> 2) & 1));
    *((_DWORD *)&v5->_internal.var0.__val_.serviceWorkerRegistrationURL + 2) = v26;
    v27 = v26 & 0xFFFFFFC7 | (8 * ((*((_DWORD *)a3 + 26) >> 3) & 7));
    *((_DWORD *)&v5->_internal.var0.__val_.serviceWorkerRegistrationURL + 2) = v27;
    *((_DWORD *)&v5->_internal.var0.__val_.serviceWorkerRegistrationURL + 2) = *((_DWORD *)a3 + 26) & 0xFFFFFFC0 | v27 & 0x3F;
    *(_OWORD *)((char *)&v5->_internal.var0.m_processIdentifier + 108) = *(_OWORD *)((char *)a3 + 108);
    *(ObjectIdentifierGeneric<WebCore::ProcessIdentifierType, WTF::ObjectIdentifierMainThreadAccessTraits<uint64_t>, unsigned long long> *)((char *)&v5->_internal.var0.m_processIdentifier + 124) = *(ObjectIdentifierGeneric<WebCore::ProcessIdentifierType, WTF::ObjectIdentifierMainThreadAccessTraits<uint64_t>, unsigned long long> *)((char *)a3 + 124);
    v5->_internal.var0.__val_.serviceWorkerRegistrationURL.m_queryEnd = *((_DWORD *)a3 + 33);
    *((_DWORD *)a3 + 26) &= ~1u;
    v28 = *((_OWORD *)a3 + 9);
    v29 = *((_OWORD *)a3 + 10);
    v30 = *((_OWORD *)a3 + 12);
    *(_OWORD *)&v5->_internal.data.m_capacity = *((_OWORD *)a3 + 11);
    *(_OWORD *)&v5[1].super.isa = v30;
    *((_OWORD *)&v5->_internal.var0.m_processIdentifier + 9) = v28;
    *(_OWORD *)&v5->_internal.creationTime.m_value = v29;
    v5[1]._internal.var0.m_processIdentifier.m_identifier = 0;
    *((_QWORD *)&v5[1]._internal.var0.m_processIdentifier + 1) = 0;
    v31 = *((_QWORD *)a3 + 26);
    *((_QWORD *)a3 + 26) = 0;
    v5[1]._internal.var0.m_processIdentifier.m_identifier = v31;
    LODWORD(v31) = *((_DWORD *)a3 + 54);
    *((_DWORD *)a3 + 54) = 0;
    *((_DWORD *)&v5[1]._internal.var0.__val_.defaultActionURL + 2) = v31;
    LODWORD(v31) = *((_DWORD *)a3 + 55);
    *((_DWORD *)a3 + 55) = 0;
    v5[1]._internal.var0.__val_.defaultActionURL.m_userStart = v31;
    *((_WORD *)&v5[1]._internal.var0.m_processIdentifier + 8) = *((_WORD *)a3 + 112);
    *((_BYTE *)&v5[1]._internal.var0.m_processIdentifier + 32) = 1;
    return v4;
  }
  WTF::URL::operator=((uint64_t)&v5->_internal, (uint64_t *)a3);
  v8 = (StringImpl *)*((_QWORD *)a3 + 5);
  *((_QWORD *)a3 + 5) = 0;
  m_ptr = (WTF::StringImpl *)v6->_internal.var0.__val_.title.m_impl.m_ptr;
  v6->_internal.var0.__val_.title.m_impl.m_ptr = v8;
  if (m_ptr)
  {
    if (*(_DWORD *)m_ptr == 2)
    {
      WTF::StringImpl::destroy(m_ptr, v7);
      v33 = (StringImpl *)*((_QWORD *)a3 + 6);
      *((_QWORD *)a3 + 6) = 0;
      v11 = (WTF::StringImpl *)v6->_internal.var0.__val_.body.m_impl.m_ptr;
      v6->_internal.var0.__val_.body.m_impl.m_ptr = v33;
      if (!v11)
        goto LABEL_13;
      goto LABEL_11;
    }
    *(_DWORD *)m_ptr -= 2;
  }
  v10 = (StringImpl *)*((_QWORD *)a3 + 6);
  *((_QWORD *)a3 + 6) = 0;
  v11 = (WTF::StringImpl *)v6->_internal.var0.__val_.body.m_impl.m_ptr;
  v6->_internal.var0.__val_.body.m_impl.m_ptr = v10;
  if (!v11)
  {
LABEL_13:
    v34 = (StringImpl *)*((_QWORD *)a3 + 7);
    *((_QWORD *)a3 + 7) = 0;
    v35 = (WTF::StringImpl *)v6->_internal.var0.__val_.iconURL.m_impl.m_ptr;
    v6->_internal.var0.__val_.iconURL.m_impl.m_ptr = v34;
    if (!v35)
      goto LABEL_18;
    goto LABEL_16;
  }
LABEL_11:
  if (*(_DWORD *)v11 != 2)
  {
    *(_DWORD *)v11 -= 2;
    goto LABEL_13;
  }
  WTF::StringImpl::destroy(v11, v7);
  v36 = (StringImpl *)*((_QWORD *)a3 + 7);
  *((_QWORD *)a3 + 7) = 0;
  v35 = (WTF::StringImpl *)v6->_internal.var0.__val_.iconURL.m_impl.m_ptr;
  v6->_internal.var0.__val_.iconURL.m_impl.m_ptr = v36;
  if (!v35)
    goto LABEL_18;
LABEL_16:
  if (*(_DWORD *)v35 == 2)
  {
    WTF::StringImpl::destroy(v35, v7);
    v39 = (StringImpl *)*((_QWORD *)a3 + 8);
    *((_QWORD *)a3 + 8) = 0;
    v38 = (WTF::StringImpl *)v6->_internal.var0.__val_.tag.m_impl.m_ptr;
    v6->_internal.var0.__val_.tag.m_impl.m_ptr = v39;
    if (!v38)
      goto LABEL_23;
    goto LABEL_21;
  }
  *(_DWORD *)v35 -= 2;
LABEL_18:
  v37 = (StringImpl *)*((_QWORD *)a3 + 8);
  *((_QWORD *)a3 + 8) = 0;
  v38 = (WTF::StringImpl *)v6->_internal.var0.__val_.tag.m_impl.m_ptr;
  v6->_internal.var0.__val_.tag.m_impl.m_ptr = v37;
  if (!v38)
  {
LABEL_23:
    v40 = (StringImpl *)*((_QWORD *)a3 + 9);
    *((_QWORD *)a3 + 9) = 0;
    v41 = (WTF::StringImpl *)v6->_internal.var0.__val_.language.m_impl.m_ptr;
    v6->_internal.var0.__val_.language.m_impl.m_ptr = v40;
    if (!v41)
      goto LABEL_29;
LABEL_26:
    if (*(_DWORD *)v41 == 2)
      WTF::StringImpl::destroy(v41, v7);
    else
      *(_DWORD *)v41 -= 2;
    goto LABEL_29;
  }
LABEL_21:
  if (*(_DWORD *)v38 != 2)
  {
    *(_DWORD *)v38 -= 2;
    goto LABEL_23;
  }
  WTF::StringImpl::destroy(v38, v7);
  v42 = (StringImpl *)*((_QWORD *)a3 + 9);
  *((_QWORD *)a3 + 9) = 0;
  v41 = (WTF::StringImpl *)v6->_internal.var0.__val_.language.m_impl.m_ptr;
  v6->_internal.var0.__val_.language.m_impl.m_ptr = v42;
  if (v41)
    goto LABEL_26;
LABEL_29:
  v6->_internal.var0.__val_.direction = *((_BYTE *)a3 + 80);
  v43 = (StringImpl *)*((_QWORD *)a3 + 11);
  *((_QWORD *)a3 + 11) = 0;
  v44 = (WTF::StringImpl *)v6->_internal.var0.__val_.originString.m_impl.m_ptr;
  v6->_internal.var0.__val_.originString.m_impl.m_ptr = v43;
  if (v44)
  {
    if (*(_DWORD *)v44 == 2)
      WTF::StringImpl::destroy(v44, v7);
    else
      *(_DWORD *)v44 -= 2;
  }
  WTF::URL::operator=((uint64_t)&v6->_internal.var0.__val_.serviceWorkerRegistrationURL, (uint64_t *)a3 + 12);
  v46 = *((_OWORD *)a3 + 12);
  v48 = *((_OWORD *)a3 + 9);
  v47 = *((_OWORD *)a3 + 10);
  *(_OWORD *)&v6->_internal.data.m_capacity = *((_OWORD *)a3 + 11);
  *(_OWORD *)&v6[1].super.isa = v46;
  *((_OWORD *)&v6->_internal.var0.m_processIdentifier + 9) = v48;
  *(_OWORD *)&v6->_internal.creationTime.m_value = v47;
  v49 = (WTF *)v6[1]._internal.var0.__val_.defaultActionURL.m_string.m_impl.m_ptr;
  if (v49)
  {
    v6[1]._internal.var0.m_processIdentifier.m_identifier = 0;
    *((_DWORD *)&v6[1]._internal.var0.__val_.defaultActionURL + 2) = 0;
    WTF::fastFree(v49, v45);
  }
  v50 = *((_QWORD *)a3 + 26);
  *((_QWORD *)a3 + 26) = 0;
  v6[1]._internal.var0.m_processIdentifier.m_identifier = v50;
  LODWORD(v50) = *((_DWORD *)a3 + 54);
  *((_DWORD *)a3 + 54) = 0;
  *((_DWORD *)&v6[1]._internal.var0.__val_.defaultActionURL + 2) = v50;
  LODWORD(v50) = *((_DWORD *)a3 + 55);
  *((_DWORD *)a3 + 55) = 0;
  v6[1]._internal.var0.__val_.defaultActionURL.m_userStart = v50;
  *((_WORD *)&v6[1]._internal.var0.m_processIdentifier + 8) = *((_WORD *)a3 + 112);
  return v4;
}

- (WebNotification)init
{
  return 0;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WebNotification;
  -[WebNotification dealloc](&v3, sel_dealloc);
}

- (id)title
{
  uint64_t v2;

  v2 = *((_QWORD *)self + 1);
  if (*(_BYTE *)(v2 + 256))
  {
    if (*(_QWORD *)(v2 + 56))
      return (id)WTF::StringImpl::operator NSString *();
    else
      return &stru_1E9D6EC48;
  }
  else
  {
    __break(1u);
  }
  return self;
}

- (id)body
{
  uint64_t v2;

  v2 = *((_QWORD *)self + 1);
  if (*(_BYTE *)(v2 + 256))
  {
    if (*(_QWORD *)(v2 + 64))
      return (id)WTF::StringImpl::operator NSString *();
    else
      return &stru_1E9D6EC48;
  }
  else
  {
    __break(1u);
  }
  return self;
}

- (id)tag
{
  uint64_t v2;

  v2 = *((_QWORD *)self + 1);
  if (*(_BYTE *)(v2 + 256))
  {
    if (*(_QWORD *)(v2 + 80))
      return (id)WTF::StringImpl::operator NSString *();
    else
      return &stru_1E9D6EC48;
  }
  else
  {
    __break(1u);
  }
  return self;
}

- (id)iconURL
{
  uint64_t v2;

  v2 = *((_QWORD *)self + 1);
  if (*(_BYTE *)(v2 + 256))
  {
    if (*(_QWORD *)(v2 + 72))
      return (id)WTF::StringImpl::operator NSString *();
    else
      return &stru_1E9D6EC48;
  }
  else
  {
    __break(1u);
  }
  return self;
}

- (id)lang
{
  uint64_t v2;

  v2 = *((_QWORD *)self + 1);
  if (*(_BYTE *)(v2 + 256))
  {
    if (*(_QWORD *)(v2 + 88))
      return (id)WTF::StringImpl::operator NSString *();
    else
      return &stru_1E9D6EC48;
  }
  else
  {
    __break(1u);
  }
  return self;
}

- (id)dir
{
  uint64_t v2;
  int v3;
  const __CFString *v4;

  v2 = *((_QWORD *)self + 1);
  if (*(_BYTE *)(v2 + 256))
  {
    v3 = *(unsigned __int8 *)(v2 + 96);
    v4 = CFSTR("auto");
    if (v3 == 1)
      v4 = CFSTR("ltr");
    if (v3 == 2)
      return CFSTR("rtl");
    else
      return (id)v4;
  }
  else
  {
    __break(1u);
  }
  return self;
}

- (id)origin
{
  id result;
  WebNotificationPrivate *v4;
  const void *v5;
  void *v6;

  result = [WebSecurityOrigin alloc];
  v4 = self->_private;
  if (*((_BYTE *)&v4[1]._internal.var0.m_processIdentifier + 32))
  {
    if (v4->_internal.var0.__val_.originString.m_impl.m_ptr)
    {
      v5 = (const void *)objc_msgSend(result, "_initWithString:", WTF::StringImpl::operator NSString *());
      v6 = (void *)CFMakeCollectable(v5);
    }
    else
    {
      v6 = (void *)CFMakeCollectable((CFTypeRef)objc_msgSend(result, "_initWithString:", &stru_1E9D6EC48));
    }
    return v6;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (id)notificationID
{
  uint64_t v2;
  StringImpl *v3;
  void *v4;
  WTF::StringImpl *v5;

  v2 = *((_QWORD *)self + 1);
  if (*(_BYTE *)(v2 + 256))
  {
    WTF::UUID::toString((WTF::UUID *)(v2 + 160));
    if (v5)
    {
      v4 = (void *)WTF::StringImpl::operator NSString *();
      if (*(_DWORD *)v5 == 2)
      {
        WTF::StringImpl::destroy(v5, v3);
        return v4;
      }
      else
      {
        *(_DWORD *)v5 -= 2;
        return v4;
      }
    }
    else
    {
      return &stru_1E9D6EC48;
    }
  }
  else
  {
    __break(1u);
  }
  return self;
}

- (void)dispatchShowEvent
{
  _QWORD *v2;
  _QWORD *v3;

  if (*((_BYTE *)&self->_private[1]._internal.var0.m_processIdentifier + 32))
  {
    v2 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
    *v2 = off_1E9D6E0B0;
    v3 = v2;
    WebCore::Notification::ensureOnNotificationThread();
    if (v3)
      (*(void (**)(_QWORD *))(*v3 + 8))(v3);
  }
  else
  {
    __break(1u);
  }
}

- (void)dispatchCloseEvent
{
  _QWORD *v2;
  _QWORD *v3;

  if (*((_BYTE *)&self->_private[1]._internal.var0.m_processIdentifier + 32))
  {
    v2 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
    *v2 = off_1E9D6E0D8;
    v3 = v2;
    WebCore::Notification::ensureOnNotificationThread();
    if (v3)
      (*(void (**)(_QWORD *))(*v3 + 8))(v3);
  }
  else
  {
    __break(1u);
  }
}

- (void)dispatchClickEvent
{
  _QWORD *v2;
  _QWORD *v3;

  if (*((_BYTE *)&self->_private[1]._internal.var0.m_processIdentifier + 32))
  {
    v2 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
    *v2 = off_1E9D6E100;
    v3 = v2;
    WebCore::Notification::ensureOnNotificationThread();
    if (v3)
      (*(void (**)(_QWORD *))(*v3 + 8))(v3);
  }
  else
  {
    __break(1u);
  }
}

- (void)dispatchErrorEvent
{
  _QWORD *v2;
  _QWORD *v3;

  if (*((_BYTE *)&self->_private[1]._internal.var0.m_processIdentifier + 32))
  {
    v2 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
    *v2 = off_1E9D6E128;
    v3 = v2;
    WebCore::Notification::ensureOnNotificationThread();
    if (v3)
      (*(void (**)(_QWORD *))(*v3 + 8))(v3);
  }
  else
  {
    __break(1u);
  }
}

- (void)finalize
{
  _QWORD *v2;
  _QWORD *v3;

  if (*((_BYTE *)&self->_private[1]._internal.var0.m_processIdentifier + 32))
  {
    v2 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
    *v2 = off_1E9D6E150;
    v3 = v2;
    WebCore::Notification::ensureOnNotificationThread();
    if (v3)
      (*(void (**)(_QWORD *))(*v3 + 8))(v3);
  }
  else
  {
    __break(1u);
  }
}

- (uint64_t)dispatchShowEvent
{
  uint64_t result;

  if (this)
    return WebCore::Notification::dispatchShowEvent(this);
  return result;
}

- (uint64_t)dispatchCloseEvent
{
  uint64_t result;

  if (this)
    return WebCore::Notification::dispatchCloseEvent(this);
  return result;
}

- (uint64_t)dispatchClickEvent
{
  uint64_t result;

  if (this)
    return WebCore::Notification::dispatchClickEvent(this);
  return result;
}

- (uint64_t)dispatchErrorEvent
{
  uint64_t result;

  if (this)
    return WebCore::Notification::dispatchErrorEvent(this);
  return result;
}

- (uint64_t)finalize
{
  uint64_t result;

  if (this)
    return WebCore::Notification::finalize(this);
  return result;
}

@end
