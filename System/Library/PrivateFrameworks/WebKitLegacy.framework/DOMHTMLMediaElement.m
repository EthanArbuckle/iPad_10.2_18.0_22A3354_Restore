@implementation DOMHTMLMediaElement

- (DOMMediaError)error
{
  DOMObjectInternal *v3;
  DOMMediaError *v4;
  void *v5;
  _BYTE v7[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  v3 = (DOMObjectInternal *)WebCore::HTMLMediaElement::error(self->super.super.super.super._internal);
  v4 = (DOMMediaError *)kit(v3);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v5);
  return v4;
}

- (NSString)src
{
  StringImpl *v2;
  const __CFString *v3;
  WTF::StringImpl *v5;
  _BYTE v6[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  WebCore::Element::getURLAttribute();
  if (v5)
  {
    v3 = (const __CFString *)WTF::StringImpl::operator NSString *();
    if (*(_DWORD *)v5 == 2)
      WTF::StringImpl::destroy(v5, v2);
    else
      *(_DWORD *)v5 -= 2;
  }
  else
  {
    v3 = &stru_1E9D6EC48;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v2);
  return &v3->isa;
}

- (void)setSrc:(id)a3
{
  const __CFString *v4;
  StringImpl *v5;
  void *v6;
  WTF::StringImpl *v7;
  _BYTE v8[80];
  WTF::StringImpl *v9;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WTF::AtomStringImpl::add((WTF::AtomStringImpl *)a3, v4);
  v7 = v9;
  WebCore::Element::setAttributeWithoutSynchronization();
  if (!v7)
    goto LABEL_4;
  if (*(_DWORD *)v7 != 2)
  {
    *(_DWORD *)v7 -= 2;
LABEL_4:
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v5);
    return;
  }
  WTF::StringImpl::destroy(v7, v5);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v6);
}

- (NSString)currentSrc
{
  void *v3;
  const __CFString *v4;
  _BYTE v6[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  if (*((_QWORD *)self->super.super.super.super._internal + 114))
    v4 = (const __CFString *)WTF::StringImpl::operator NSString *();
  else
    v4 = &stru_1E9D6EC48;
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v3);
  return &v4->isa;
}

- (NSString)crossOrigin
{
  StringImpl *v3;
  const __CFString *v4;
  WTF::StringImpl *v6;
  _BYTE v7[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  WebCore::HTMLMediaElement::crossOrigin(self->super.super.super.super._internal);
  if (v6)
  {
    v4 = (const __CFString *)WTF::StringImpl::operator NSString *();
    if (*(_DWORD *)v6 == 2)
      WTF::StringImpl::destroy(v6, v3);
    else
      *(_DWORD *)v6 -= 2;
  }
  else
  {
    v4 = &stru_1E9D6EC48;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v3);
  return &v4->isa;
}

- (void)setCrossOrigin:(id)a3
{
  const __CFString *v4;
  StringImpl *v5;
  void *v6;
  WTF::StringImpl *v7;
  _BYTE v8[80];
  WTF::StringImpl *v9;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WTF::AtomStringImpl::add((WTF::AtomStringImpl *)a3, v4);
  v7 = v9;
  WebCore::HTMLMediaElement::setCrossOrigin();
  if (!v7)
    goto LABEL_4;
  if (*(_DWORD *)v7 != 2)
  {
    *(_DWORD *)v7 -= 2;
LABEL_4:
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v5);
    return;
  }
  WTF::StringImpl::destroy(v7, v5);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v6);
}

- (unsigned)networkState
{
  void *v3;
  _BYTE v5[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LOWORD(self) = WebCore::HTMLMediaElement::networkState(self->super.super.super.super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (unsigned __int16)self;
}

- (NSString)preload
{
  StringImpl *v3;
  const __CFString *v4;
  WTF::StringImpl *v6;
  _BYTE v7[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  WebCore::HTMLMediaElement::preload(self->super.super.super.super._internal);
  if (v6)
  {
    v4 = (const __CFString *)WTF::StringImpl::operator NSString *();
    if (*(_DWORD *)v6 == 2)
      WTF::StringImpl::destroy(v6, v3);
    else
      *(_DWORD *)v6 -= 2;
  }
  else
  {
    v4 = &stru_1E9D6EC48;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v3);
  return &v4->isa;
}

- (void)setPreload:(id)a3
{
  const __CFString *v4;
  StringImpl *v5;
  void *v6;
  WTF::StringImpl *v7;
  _BYTE v8[80];
  WTF::StringImpl *v9;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WTF::AtomStringImpl::add((WTF::AtomStringImpl *)a3, v4);
  v7 = v9;
  WebCore::HTMLMediaElement::setPreload();
  if (!v7)
    goto LABEL_4;
  if (*(_DWORD *)v7 != 2)
  {
    *(_DWORD *)v7 -= 2;
LABEL_4:
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v5);
    return;
  }
  WTF::StringImpl::destroy(v7, v5);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v6);
}

- (DOMTimeRanges)buffered
{
  void *v3;
  DOMObjectInternal *v4;
  WTF *v5;
  WTF *v6;
  WTF *v8;
  _BYTE v9[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9);
  (*(void (**)(WTF **__return_ptr))(*(_QWORD *)self->super.super.super.super._internal + 1344))(&v8);
  v4 = kit(v8);
  v5 = v8;
  v8 = 0;
  if (v5)
  {
    if (*(_DWORD *)v5 == 1)
    {
      v6 = (WTF *)*((_QWORD *)v5 + 1);
      if (v6)
      {
        *((_QWORD *)v5 + 1) = 0;
        *((_DWORD *)v5 + 4) = 0;
        WTF::fastFree(v6, v3);
      }
      WTF::fastFree(v5, v3);
    }
    else
    {
      --*(_DWORD *)v5;
    }
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9, v3);
  return (DOMTimeRanges *)v4;
}

- (unsigned)readyState
{
  void *v3;
  _BYTE v5[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LOWORD(self) = (*(uint64_t (**)(DOMObjectInternal *))(*(_QWORD *)self->super.super.super.super._internal
                                                                + 1352))(self->super.super.super.super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (unsigned __int16)self;
}

- (BOOL)seeking
{
  void *v3;
  _BYTE v5[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LOBYTE(self) = WebCore::HTMLMediaElement::seeking(self->super.super.super.super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (char)self;
}

- (double)currentTime
{
  double v3;
  void *v4;
  _BYTE v6[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  v3 = (*(double (**)(DOMObjectInternal *))(*(_QWORD *)self->super.super.super.super._internal + 1360))(self->super.super.super.super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v4);
  return v3;
}

- (void)setCurrentTime:(double)a3
{
  void *v5;
  char v6;
  uint64_t v7;
  char v8;
  _BYTE v9[88];
  uint64_t v10;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9);
  WebCore::HTMLMediaElement::setCurrentTimeForBindings(self->super.super.super.super._internal, a3);
  if (v8)
  {
    v9[80] = v6;
    v10 = v7;
    raiseDOMErrorException();
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9, v5);
}

- (double)duration
{
  double v3;
  void *v4;
  _BYTE v6[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  v3 = (*(double (**)(DOMObjectInternal *))(*(_QWORD *)self->super.super.super.super._internal + 1376))(self->super.super.super.super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v4);
  return v3;
}

- (BOOL)paused
{
  void *v3;
  _BYTE v5[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LOBYTE(self) = (*(uint64_t (**)(DOMObjectInternal *))(*(_QWORD *)self->super.super.super.super._internal
                                                                + 1384))(self->super.super.super.super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (char)self;
}

- (double)defaultPlaybackRate
{
  double v3;
  void *v4;
  _BYTE v6[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  v3 = (*(double (**)(DOMObjectInternal *))(*(_QWORD *)self->super.super.super.super._internal + 1392))(self->super.super.super.super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v4);
  return v3;
}

- (void)setDefaultPlaybackRate:(double)a3
{
  void *v5;
  _BYTE v6[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  (*(void (**)(DOMObjectInternal *, double))(*(_QWORD *)self->super.super.super.super._internal + 1400))(self->super.super.super.super._internal, a3);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v5);
}

- (double)playbackRate
{
  double v3;
  void *v4;
  _BYTE v6[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  v3 = (*(double (**)(DOMObjectInternal *))(*(_QWORD *)self->super.super.super.super._internal + 1408))(self->super.super.super.super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v4);
  return v3;
}

- (void)setPlaybackRate:(double)a3
{
  void *v5;
  _BYTE v6[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  (*(void (**)(DOMObjectInternal *, double))(*(_QWORD *)self->super.super.super.super._internal + 1416))(self->super.super.super.super._internal, a3);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v5);
}

- (DOMTimeRanges)played
{
  void *v3;
  DOMObjectInternal *v4;
  WTF *v5;
  WTF *v6;
  WTF *v8;
  _BYTE v9[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9);
  (*(void (**)(WTF **__return_ptr))(*(_QWORD *)self->super.super.super.super._internal + 1424))(&v8);
  v4 = kit(v8);
  v5 = v8;
  v8 = 0;
  if (v5)
  {
    if (*(_DWORD *)v5 == 1)
    {
      v6 = (WTF *)*((_QWORD *)v5 + 1);
      if (v6)
      {
        *((_QWORD *)v5 + 1) = 0;
        *((_DWORD *)v5 + 4) = 0;
        WTF::fastFree(v6, v3);
      }
      WTF::fastFree(v5, v3);
    }
    else
    {
      --*(_DWORD *)v5;
    }
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9, v3);
  return (DOMTimeRanges *)v4;
}

- (DOMTimeRanges)seekable
{
  void *v3;
  DOMObjectInternal *v4;
  WTF *v5;
  WTF *v6;
  WTF *v8;
  _BYTE v9[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9);
  (*(void (**)(WTF **__return_ptr))(*(_QWORD *)self->super.super.super.super._internal + 1432))(&v8);
  v4 = kit(v8);
  v5 = v8;
  v8 = 0;
  if (v5)
  {
    if (*(_DWORD *)v5 == 1)
    {
      v6 = (WTF *)*((_QWORD *)v5 + 1);
      if (v6)
      {
        *((_QWORD *)v5 + 1) = 0;
        *((_DWORD *)v5 + 4) = 0;
        WTF::fastFree(v6, v3);
      }
      WTF::fastFree(v5, v3);
    }
    else
    {
      --*(_DWORD *)v5;
    }
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9, v3);
  return (DOMTimeRanges *)v4;
}

- (BOOL)ended
{
  void *v3;
  _BYTE v5[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LOBYTE(self) = WebCore::HTMLMediaElement::ended(self->super.super.super.super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (char)self;
}

- (BOOL)autoplay
{
  void *v3;
  uint64_t v4;
  unsigned int v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  _BYTE v12[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v12);
  v4 = *((_QWORD *)self->super.super.super.super._internal + 13);
  if (!v4)
    goto LABEL_12;
  v5 = *(_DWORD *)(v4 + 4);
  if ((v5 & 1) != 0)
  {
    v6 = *(uint64_t **)(v4 + 40);
    LODWORD(v7) = *(_DWORD *)(v4 + 52);
    if (!(_DWORD)v7)
    {
LABEL_12:
      v10 = 0;
      goto LABEL_13;
    }
  }
  else
  {
    v6 = (uint64_t *)(v4 + 32);
    LODWORD(v7) = v5 >> 5;
    if (!(_DWORD)v7)
      goto LABEL_12;
  }
  v8 = *MEMORY[0x1E0DD5DA0];
  v7 = v7;
  while (1)
  {
    v9 = *v6;
    if (*v6 == v8 || *(_QWORD *)(v9 + 24) == *(_QWORD *)(v8 + 24) && *(_QWORD *)(v9 + 32) == *(_QWORD *)(v8 + 32))
      break;
    v6 += 2;
    if (!--v7)
      goto LABEL_12;
  }
  v10 = 1;
LABEL_13:
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v12, v3);
  return v10;
}

- (void)setAutoplay:(BOOL)a3
{
  void *v3;
  _BYTE v4[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v4);
  WebCore::Element::setBooleanAttribute();
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v4, v3);
}

- (BOOL)loop
{
  void *v3;
  uint64_t v4;
  unsigned int v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  _BYTE v12[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v12);
  v4 = *((_QWORD *)self->super.super.super.super._internal + 13);
  if (!v4)
    goto LABEL_12;
  v5 = *(_DWORD *)(v4 + 4);
  if ((v5 & 1) != 0)
  {
    v6 = *(uint64_t **)(v4 + 40);
    LODWORD(v7) = *(_DWORD *)(v4 + 52);
    if (!(_DWORD)v7)
    {
LABEL_12:
      v10 = 0;
      goto LABEL_13;
    }
  }
  else
  {
    v6 = (uint64_t *)(v4 + 32);
    LODWORD(v7) = v5 >> 5;
    if (!(_DWORD)v7)
      goto LABEL_12;
  }
  v8 = *MEMORY[0x1E0DD60D8];
  v7 = v7;
  while (1)
  {
    v9 = *v6;
    if (*v6 == v8 || *(_QWORD *)(v9 + 24) == *(_QWORD *)(v8 + 24) && *(_QWORD *)(v9 + 32) == *(_QWORD *)(v8 + 32))
      break;
    v6 += 2;
    if (!--v7)
      goto LABEL_12;
  }
  v10 = 1;
LABEL_13:
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v12, v3);
  return v10;
}

- (void)setLoop:(BOOL)a3
{
  void *v3;
  _BYTE v4[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v4);
  WebCore::Element::setBooleanAttribute();
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v4, v3);
}

- (BOOL)controls
{
  void *v3;
  _BYTE v5[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LOBYTE(self) = WebCore::HTMLMediaElement::controls(self->super.super.super.super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (char)self;
}

- (void)setControls:(BOOL)a3
{
  void *v4;
  _BYTE v5[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  WebCore::HTMLMediaElement::setControls(self->super.super.super.super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v4);
}

- (double)volume
{
  double v3;
  void *v4;
  _BYTE v6[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  v3 = (*(double (**)(DOMObjectInternal *))(*(_QWORD *)self->super.super.super.super._internal + 1456))(self->super.super.super.super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v4);
  return v3;
}

- (void)setVolume:(double)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  _BYTE v10[88];
  uint64_t v11;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10);
  (*(void (**)(uint64_t *__return_ptr, double))(*(_QWORD *)self->super.super.super.super._internal + 1464))(&v7, a3);
  if (v9)
  {
    v10[80] = v7;
    v6 = v8;
    v8 = 0;
    v11 = v6;
    raiseDOMErrorException();
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10, v5);
}

- (BOOL)muted
{
  void *v3;
  _BYTE v5[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LOBYTE(self) = (*(uint64_t (**)(DOMObjectInternal *))(*(_QWORD *)self->super.super.super.super._internal
                                                                + 1472))(self->super.super.super.super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (char)self;
}

- (void)setMuted:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  _BYTE v6[80];

  v3 = a3;
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  (*(void (**)(DOMObjectInternal *, _BOOL8))(*(_QWORD *)self->super.super.super.super._internal + 1480))(self->super.super.super.super._internal, v3);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v5);
}

- (BOOL)defaultMuted
{
  void *v3;
  uint64_t v4;
  unsigned int v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  _BYTE v12[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v12);
  v4 = *((_QWORD *)self->super.super.super.super._internal + 13);
  if (!v4)
    goto LABEL_12;
  v5 = *(_DWORD *)(v4 + 4);
  if ((v5 & 1) != 0)
  {
    v6 = *(uint64_t **)(v4 + 40);
    LODWORD(v7) = *(_DWORD *)(v4 + 52);
    if (!(_DWORD)v7)
    {
LABEL_12:
      v10 = 0;
      goto LABEL_13;
    }
  }
  else
  {
    v6 = (uint64_t *)(v4 + 32);
    LODWORD(v7) = v5 >> 5;
    if (!(_DWORD)v7)
      goto LABEL_12;
  }
  v8 = *MEMORY[0x1E0DD61E8];
  v7 = v7;
  while (1)
  {
    v9 = *v6;
    if (*v6 == v8 || *(_QWORD *)(v9 + 24) == *(_QWORD *)(v8 + 24) && *(_QWORD *)(v9 + 32) == *(_QWORD *)(v8 + 32))
      break;
    v6 += 2;
    if (!--v7)
      goto LABEL_12;
  }
  v10 = 1;
LABEL_13:
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v12, v3);
  return v10;
}

- (void)setDefaultMuted:(BOOL)a3
{
  void *v3;
  _BYTE v4[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v4);
  WebCore::Element::setBooleanAttribute();
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v4, v3);
}

- (BOOL)webkitPreservesPitch
{
  void *v3;
  _BYTE v5[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LOBYTE(self) = WebCore::HTMLMediaElement::preservesPitch(self->super.super.super.super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (char)self;
}

- (void)setWebkitPreservesPitch:(BOOL)a3
{
  void *v4;
  _BYTE v5[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  WebCore::HTMLMediaElement::setPreservesPitch(self->super.super.super.super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v4);
}

- (BOOL)webkitHasClosedCaptions
{
  void *v3;
  _BYTE v5[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LOBYTE(self) = (*(uint64_t (**)(DOMObjectInternal *))(*(_QWORD *)self->super.super.super.super._internal
                                                                + 1816))(self->super.super.super.super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (char)self;
}

- (BOOL)webkitClosedCaptionsVisible
{
  void *v3;
  _BYTE v5[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LOBYTE(self) = (*(uint64_t (**)(DOMObjectInternal *))(*(_QWORD *)self->super.super.super.super._internal
                                                                + 1824))(self->super.super.super.super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (char)self;
}

- (void)setWebkitClosedCaptionsVisible:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  _BYTE v6[80];

  v3 = a3;
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  (*(void (**)(DOMObjectInternal *, _BOOL8))(*(_QWORD *)self->super.super.super.super._internal + 1832))(self->super.super.super.super._internal, v3);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v5);
}

- (NSString)mediaGroup
{
  void *v2;
  const __CFString *v3;
  _BYTE v5[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  if (*(_QWORD *)WebCore::Element::getAttribute())
    v3 = (const __CFString *)WTF::StringImpl::operator NSString *();
  else
    v3 = &stru_1E9D6EC48;
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v2);
  return &v3->isa;
}

- (void)setMediaGroup:(id)a3
{
  const __CFString *v4;
  StringImpl *v5;
  void *v6;
  WTF::StringImpl *v7;
  _BYTE v8[80];
  WTF::StringImpl *v9;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WTF::AtomStringImpl::add((WTF::AtomStringImpl *)a3, v4);
  v7 = v9;
  WebCore::Element::setAttributeWithoutSynchronization();
  if (!v7)
    goto LABEL_4;
  if (*(_DWORD *)v7 != 2)
  {
    *(_DWORD *)v7 -= 2;
LABEL_4:
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v5);
    return;
  }
  WTF::StringImpl::destroy(v7, v5);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v6);
}

- (void)load
{
  void *v3;
  _BYTE v4[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v4);
  WebCore::HTMLMediaElement::load(self->super.super.super.super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v4, v3);
}

- (id)canPlayType:(id)a3
{
  DOMObjectInternal *internal;
  StringImpl *v6;
  const __CFString *v7;
  WTF::StringImpl *v8;
  WTF::StringImpl *v9;
  WTF::StringImpl *v11;
  WTF::StringImpl *v12;
  _BYTE v13[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v13);
  internal = self->super.super.super.super._internal;
  MEMORY[0x1D82A3998](&v11, a3);
  WebCore::HTMLMediaElement::canPlayType(internal, (const WTF::String *)&v11);
  if (!v12)
  {
    v12 = 0;
    v7 = &stru_1E9D6EC48;
LABEL_7:
    v9 = v11;
    v11 = 0;
    if (!v9)
      goto LABEL_11;
    goto LABEL_8;
  }
  v7 = (const __CFString *)WTF::StringImpl::operator NSString *();
  v8 = v12;
  v12 = 0;
  if (!v8)
    goto LABEL_7;
  if (*(_DWORD *)v8 == 2)
  {
    WTF::StringImpl::destroy(v8, v6);
    v9 = v11;
    v11 = 0;
    if (!v9)
      goto LABEL_11;
  }
  else
  {
    *(_DWORD *)v8 -= 2;
    v9 = v11;
    v11 = 0;
    if (!v9)
      goto LABEL_11;
  }
LABEL_8:
  if (*(_DWORD *)v9 == 2)
    WTF::StringImpl::destroy(v9, v6);
  else
    *(_DWORD *)v9 -= 2;
LABEL_11:
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v13, v6);
  return (id)v7;
}

- (double)getStartDate
{
  double v3;
  double v4;
  void *v5;
  _BYTE v7[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  WebCore::HTMLMediaElement::getStartDate(self->super.super.super.super._internal);
  v4 = v3 + -978307200.0;
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v5);
  return v4;
}

- (void)play
{
  void *v3;
  _BYTE v4[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v4);
  (*(void (**)(DOMObjectInternal *))(*(_QWORD *)self->super.super.super.super._internal + 1440))(self->super.super.super.super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v4, v3);
}

- (void)pause
{
  void *v3;
  _BYTE v4[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v4);
  (*(void (**)(DOMObjectInternal *))(*(_QWORD *)self->super.super.super.super._internal + 1448))(self->super.super.super.super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v4, v3);
}

- (void)fastSeek:(double)a3
{
  void *v5;
  _BYTE v6[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  WebCore::HTMLMediaElement::fastSeek(self->super.super.super.super._internal, a3);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v5);
}

@end
